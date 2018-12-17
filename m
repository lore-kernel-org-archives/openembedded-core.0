Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 916557BE5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 05:54:52 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b7so5794711pfi.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2018 21:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k9Bg8rT1HwR1IKn7NI0M65sUGpVeOzh9RWuE3s6calg=;
	b=n03eFMKPDtGj0/K8hp4FgLPVKC/PiEUnvc7F3L2lzM+5tezjF11xNeM5cL1oIEeSMd
	YrjivIXK6D6sBoFxEtPDcDXgkT4O7GXdVaA7SWAYvKOgy4dtKszY7zuX4GGiuya74XeB
	T1E6cu1eJeDKQTSld1bvtXtCCMwHSJ7xNwiBFy+9IrJQqNgn3O+osbY1+KcikAjISyYZ
	EUPqa51bOAXVu4g+1n8lP44OQaD3WQrfVoazSoyNXG3gSS4cc6W51IG1tYj31wyyrVtc
	Ev3bBv+7h9unaDp5SXrHawlxUjQA4Og665eja6nFtb91FFaM2f8sAuSCWYchWEibQZZG
	oAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=k9Bg8rT1HwR1IKn7NI0M65sUGpVeOzh9RWuE3s6calg=;
	b=KE5pHjUFbYZBEOEboXQ/bz61Lky6U1WNsaMalJ9IZL9SXgpgIogCfAWaz7bCjrqtBU
	0Ys327ChXU7fH0FSfP95U6DHBROigD3LJAcXNHpuLyfBPmS/MwvxBI/MVCbUBC5yRGZW
	4nKZumOiOrO9IKpghbCvoaQb+4Y1+3Jto/ypfbF58DNh1QSg6ymysrYXeU/mY7JhR1PA
	ylTouGTqoB3pmHcPWRmxzS9rBDHunjanhoxUNlluxGIEp4QsDW2aXIOb/EDOohCjye5n
	5RtrfO9pkMaAOvG+ZAt7rSUOoLc6RtDVkiC9lDGK4DpBOaSgPp3/t+/Dfu/DN7BO65at
	Dz0A==
X-Gm-Message-State: AA+aEWb2RdxhEjmG6FVBp4LsXGpffqdY6dWrqj+oZVAusVzK8XFuXAKj
	8BaBn3ThIIQu+RABC+RHm/HzPHoybk4=
X-Google-Smtp-Source: AFSGD/V1RQTbPgqZ8XoU0bsrTOHnZ9Wy6STMpjKSBOfBWlGis1f/hzSXtew65qbMzel7b395b8qwYA==
X-Received: by 2002:a65:534b:: with SMTP id w11mr11185907pgr.125.1545026093108;
	Sun, 16 Dec 2018 21:54:53 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::6872])
	by smtp.gmail.com with ESMTPSA id
	u126sm21263551pgb.2.2018.12.16.21.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Dec 2018 21:54:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Dec 2018 21:54:42 -0800
Message-Id: <20181217055442.13735-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181217055442.13735-1-raj.khem@gmail.com>
References: <20181217055442.13735-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] systemd: Fix memory use after free errors
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
X-List-Received-Date: Mon, 17 Dec 2018 05:54:52 -0000
Content-Transfer-Encoding: 8bit

Found with gcc trunk

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-t-pass-null-directive-argument-to-s.patch | 31 +++++++++++++
 ...se-after-free-case-in-load_from_path.patch | 43 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb      |  2 +
 3 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-core-Fix-use-after-free-case-in-load_from_path.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch b/meta/recipes-core/systemd/systemd/0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch
new file mode 100644
index 0000000000..0538c7bbc8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch
@@ -0,0 +1,31 @@
+From bfc4183ea995f1c211385d066cdb1fe9ce89f621 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Dec 2018 20:53:38 -0800
+Subject: [PATCH 1/2] sysctl: Don't pass null directive argument to '%s'
+
+value pointer here is always NULL but  subsequent use of that pointer
+with a %s format will always be NULL, printing p instead would be a
+valid string
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/11179]
+ src/sysctl/sysctl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c
+index 1cfe51018..c67d79032 100644
+--- a/src/sysctl/sysctl.c
++++ b/src/sysctl/sysctl.c
+@@ -115,7 +115,7 @@ static int parse_file(OrderedHashmap *sysctl_options, const char *path, bool ign
+ 
+                 value = strchr(p, '=');
+                 if (!value) {
+-                        log_error("Line is not an assignment at '%s:%u': %s", path, c, value);
++                        log_error("Line is not an assignment at '%s:%u': %s", path, c, p);
+ 
+                         if (r == 0)
+                                 r = -EINVAL;
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-core-Fix-use-after-free-case-in-load_from_path.patch b/meta/recipes-core/systemd/systemd/0002-core-Fix-use-after-free-case-in-load_from_path.patch
new file mode 100644
index 0000000000..4da96e2920
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-core-Fix-use-after-free-case-in-load_from_path.patch
@@ -0,0 +1,43 @@
+From cb67aebd63d9f0077cbf3e769f0b223c5bba20ac Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Dec 2018 20:58:35 -0800
+Subject: [PATCH 2/2] core: Fix use after free case in load_from_path()
+
+ensure that mfree() on filename is called after the logging function
+which uses the string pointed by filename
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/11179]
+ src/core/load-fragment.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/core/load-fragment.c b/src/core/load-fragment.c
+index fc5644f48..da585786e 100644
+--- a/src/core/load-fragment.c
++++ b/src/core/load-fragment.c
+@@ -4531,7 +4531,6 @@ static int load_from_path(Unit *u, const char *path) {
+                                 r = open_follow(&filename, &f, symlink_names, &id);
+                         if (r >= 0)
+                                 break;
+-                        filename = mfree(filename);
+ 
+                         /* ENOENT means that the file is missing or is a dangling symlink.
+                          * ENOTDIR means that one of paths we expect to be is a directory
+@@ -4540,9 +4539,12 @@ static int load_from_path(Unit *u, const char *path) {
+                          */
+                         if (r == -EACCES)
+                                 log_debug_errno(r, "Cannot access \"%s\": %m", filename);
+-                        else if (!IN_SET(r, -ENOENT, -ENOTDIR))
++                        else if (!IN_SET(r, -ENOENT, -ENOTDIR)) {
++                                filename = mfree(filename);
+                                 return r;
++                        }
+ 
++                        filename = mfree(filename);
+                         /* Empty the symlink names for the next run */
+                         set_clear_free(symlink_names);
+                 }
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index a40c89973a..03acce25b7 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -35,6 +35,8 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
            file://0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch \
            file://0001-timesync-changes-type-of-drift_freq-to-int64_t.patch \
+           file://0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch \
+           file://0002-core-Fix-use-after-free-case-in-load_from_path.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.20.1


