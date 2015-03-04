Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id A87EF60144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 16:22:01 +0000 (UTC)
Received: by qcrw7 with SMTP id w7so38030950qcr.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 08:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zIpt421p0ujmMG1WS/g3GcdwLSj874V/ZKCeIYWjhbg=;
	b=tVqMmyLvPDn2pdyeCf5xqQPwDw435vEEhvXZ/gSLrgqDzZxSXvjt15qnroibx4RNNF
	0sx2szuZMq7fEsKfrpLmJpEFQZ9YOU6F+V1Srfp/IyfRRKfnVQvGza8S2ZDOk+KIBKTE
	CVDyt2+nSZk5Pjrp+7Y7/54S38glywXTub7Fue7TGRdDuBKJA98owdXY0Daf54psvHwo
	Bta3OSNfHRWX52PL23Z98+RiAMvkHel14e/HmfU4acyhQoqUmXOU1BcbJKLY711wMVGz
	bicFXj6ZIpsvlsF/r0rKntdfrDRpTfGkwPwiTvjupKlv3IZ5TFlhMCshujl+W325WzIE
	Gaug==
X-Received: by 10.140.84.165 with SMTP id l34mr6543139qgd.80.1425486122516;
	Wed, 04 Mar 2015 08:22:02 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id s19sm2473721qac.5.2015.03.04.08.22.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 08:22:02 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2015 10:22:00 -0600
Message-Id: <1425486120-23241-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425484813-20136-1-git-send-email-danismostlikely@gmail.com>
References: <1425484813-20136-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH v2] systemd: fix systemd-tmpfiles ACL issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2015 16:22:04 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

On systems where /var/log is not a volatile systemd-tmpfiles creates
duplicate ACL entries. This causes systemd-tmpfiles service to fail.
Also quietly ignore ACL settings on filesystems that don't support ACLs.

Backport the fixes from systemd master to fix these issues.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 ...iles-avoid-creating-duplicate-acl-entries.patch | 134 +++++++++++++++++++++
 ...ietly-ignore-ACLs-on-unsupported-filesyst.patch |  86 +++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |   2 +
 3 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch
new file mode 100644
index 0000000..6652e28
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch
@@ -0,0 +1,134 @@
+Upstream-Status: Backport
+Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
+
+From 33d36e28b0a23fb7ac33435a1329d65bff1ba4ec Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 23 Feb 2015 23:19:54 -0500
+Subject: [PATCH] tmpfiles: avoid creating duplicate acl entries
+
+https://bugs.freedesktop.org/show_bug.cgi?id=89202
+https://bugs.debian.org/778656
+
+Status quo ante can be restored with:
+  getfacl -p /var/log/journal/`cat /etc/machine-id`|grep -v '^#'|sort -u|sudo setfacl --set-file=- /var/log/journal/`cat /etc/machine-id`
+
+(cherry picked from commit 1c73f3bc29111a00738569c9d40a989b161a0624)
+---
+ src/shared/acl-util.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++--
+ src/shared/acl-util.h |  4 +++
+ 2 files changed, 81 insertions(+), 2 deletions(-)
+
+diff --git a/src/shared/acl-util.c b/src/shared/acl-util.c
+index a4ff1ab..cbe09d7 100644
+--- a/src/shared/acl-util.c
++++ b/src/shared/acl-util.c
+@@ -282,6 +282,77 @@ int parse_acl(char *text, acl_t *acl_access, acl_t *acl_default, bool want_mask)
+         return 0;
+ }
+ 
++static int acl_entry_equal(acl_entry_t a, acl_entry_t b) {
++        acl_tag_t tag_a, tag_b;
++
++        if (acl_get_tag_type(a, &tag_a) < 0)
++                return -errno;
++
++        if (acl_get_tag_type(b, &tag_b) < 0)
++                return -errno;
++
++        if (tag_a != tag_b)
++                return false;
++
++        switch (tag_a) {
++        case ACL_USER_OBJ:
++        case ACL_GROUP_OBJ:
++        case ACL_MASK:
++        case ACL_OTHER:
++                /* can have only one of those */
++                return true;
++        case ACL_USER: {
++                _cleanup_(acl_free_uid_tpp) uid_t *uid_a, *uid_b;
++
++                uid_a = acl_get_qualifier(a);
++                if (!uid_a)
++                        return -errno;
++
++                uid_b = acl_get_qualifier(b);
++                if (!uid_b)
++                        return -errno;
++
++                return *uid_a == *uid_b;
++        }
++        case ACL_GROUP: {
++                _cleanup_(acl_free_gid_tpp) gid_t *gid_a, *gid_b;
++
++                gid_a = acl_get_qualifier(a);
++                if (!gid_a)
++                        return -errno;
++
++                gid_b = acl_get_qualifier(b);
++                if (!gid_b)
++                        return -errno;
++
++                return *gid_a == *gid_b;
++        }
++        default:
++                assert_not_reached("Unknown acl tag type");
++        }
++}
++
++static int find_acl_entry(acl_t acl, acl_entry_t entry, acl_entry_t *out) {
++        acl_entry_t i;
++        int r;
++
++        for (r = acl_get_entry(acl, ACL_FIRST_ENTRY, &i);
++             r > 0;
++             r = acl_get_entry(acl, ACL_NEXT_ENTRY, &i)) {
++
++                r = acl_entry_equal(i, entry);
++                if (r < 0)
++                        return r;
++                if (r > 0) {
++                        *out = i;
++                        return 1;
++                }
++        }
++        if (r < 0)
++                return -errno;
++        return 0;
++}
++
+ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl) {
+         _cleanup_(acl_freep) acl_t old;
+         acl_entry_t i;
+@@ -297,8 +368,12 @@ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl) {
+ 
+                 acl_entry_t j;
+ 
+-                if (acl_create_entry(&old, &j) < 0)
+-                        return -errno;
++                r = find_acl_entry(old, i, &j);
++                if (r < 0)
++                        return r;
++                if (r == 0)
++                        if (acl_create_entry(&old, &j) < 0)
++                                return -errno;
+ 
+                 if (acl_copy_entry(j, i) < 0)
+                         return -errno;
+diff --git a/src/shared/acl-util.h b/src/shared/acl-util.h
+index 90e88ff..fdb9006 100644
+--- a/src/shared/acl-util.h
++++ b/src/shared/acl-util.h
+@@ -41,5 +41,9 @@ int acls_for_file(const char *path, acl_type_t type, acl_t new, acl_t *acl);
+ DEFINE_TRIVIAL_CLEANUP_FUNC(acl_t, acl_free);
+ #define acl_free_charp acl_free
+ DEFINE_TRIVIAL_CLEANUP_FUNC(char*, acl_free_charp);
++#define acl_free_uid_tp acl_free
++DEFINE_TRIVIAL_CLEANUP_FUNC(uid_t*, acl_free_uid_tp);
++#define acl_free_gid_tp acl_free
++DEFINE_TRIVIAL_CLEANUP_FUNC(gid_t*, acl_free_gid_tp);
+ 
+ #endif
+-- 
+2.3.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch b/meta/recipes-core/systemd/systemd/0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
new file mode 100644
index 0000000..c195437
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
@@ -0,0 +1,86 @@
+Upstream-Status: Backport
+Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
+
+From 31d05181e3a34c5c0ff6314d8eca1c3b4bb29423 Mon Sep 17 00:00:00 2001
+From: Hans-Peter Deifel <hpd@hpdeifel.de>
+Date: Tue, 3 Mar 2015 00:35:08 +0100
+Subject: [PATCH 2/2] tmpfiles: quietly ignore ACLs on unsupported filesystems
+
+A warning is printed if ACLs cannot be retrieved for any reason other
+than -ENOSYS. For -ENOSYS, debug log is printed.
+
+(cherry picked from commit d873e8778c92014c02a9122852758b436fa95c0e)
+---
+ src/tmpfiles/tmpfiles.c | 36 ++++++++++++++++++++----------------
+ 1 file changed, 20 insertions(+), 16 deletions(-)
+
+diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
+index 88ba7e4..187997e 100644
+--- a/src/tmpfiles/tmpfiles.c
++++ b/src/tmpfiles/tmpfiles.c
+@@ -704,6 +704,9 @@ static int path_set_acl(const char *path, acl_type_t type, acl_t acl, bool modif
+         int r;
+         _cleanup_(acl_free_charpp) char *t = NULL;
+ 
++        /* Returns 0 for success, positive error if already warned,
++         * negative error otherwise. */
++
+         if (modify) {
+                 r = acls_for_file(path, type, acl, &dup);
+                 if (r < 0)
+@@ -731,35 +734,36 @@ static int path_set_acl(const char *path, acl_type_t type, acl_t acl, bool modif
+ 
+         r = acl_set_file(path, type, dup);
+         if (r < 0)
+-                return log_error_errno(-errno,
+-                                       "Setting %s ACL \"%s\" on %s failed: %m",
+-                                       type == ACL_TYPE_ACCESS ? "access" : "default",
+-                                       strna(t), path);
++                return -log_error_errno(errno,
++                                        "Setting %s ACL \"%s\" on %s failed: %m",
++                                        type == ACL_TYPE_ACCESS ? "access" : "default",
++                                        strna(t), path);
++
+         return 0;
+ }
+ #endif
+ 
+ static int path_set_acls(Item *item, const char *path) {
++        int r = 0;
+ #ifdef HAVE_ACL
+-        int r;
+-
+         assert(item);
+         assert(path);
+ 
+-        if (item->acl_access) {
++        if (item->acl_access)
+                 r = path_set_acl(path, ACL_TYPE_ACCESS, item->acl_access, item->force);
+-                if (r < 0)
+-                        return r;
+-        }
+ 
+-        if (item->acl_default) {
++        if (r == 0 && item->acl_default)
+                 r = path_set_acl(path, ACL_TYPE_DEFAULT, item->acl_default, item->force);
+-                if (r < 0)
+-                        return r;
+-        }
+-#endif
+ 
+-        return 0;
++        if (r > 0)
++                return -r; /* already warned */
++        else if (r == -ENOTSUP) {
++                log_debug_errno(r, "ACLs not supported by file system at %s", path);
++                return 0;
++        } else if (r < 0)
++                log_error_errno(r, "ACL operation on \"%s\" failed: %m", path);
++#endif
++        return r;
+ }
+ 
+ static int write_one_file(Item *i, const char *path) {
+-- 
+2.3.1
+
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 24486f1..9c90c03 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -40,6 +40,8 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
            file://0010-Make-root-s-home-directory-configurable.patch \
            file://0011-systemd-user-avoid-using-system-auth.patch \
+           file://0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch \
+           file://0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch \
            file://tmpfiles-pam.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
2.3.1


