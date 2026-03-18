Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11603103E16D
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 12:24:55 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12735.1773836694680406105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 05:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YduuD+6E;
 spf=pass (domain: mvista.com, ip: 74.125.82.54, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12732165d1eso9061049c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773836694; x=1774441494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6EqsfPEGtFIVC845fOqSEmwZy6NYJgT2DPSfHxmFME=;
        b=YduuD+6EgXSjccuv/VA61EwDfDDPddyyuLxX+GqIG1zGTDP9hmZAeEgx4KXocZv+1w
         nzd5lhQaV+niCa0B4f9Z/kwav3IGQV/+rGOzNmgptik2Uat5a67k9zYsB7wSkkk9ITaE
         zcdlHvMj52xWXqvh8UhjFDxE3w5mmOWBGW8zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773836694; x=1774441494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6EqsfPEGtFIVC845fOqSEmwZy6NYJgT2DPSfHxmFME=;
        b=VH2uug3Gn+g/lhwgxPzM5gzQpry4POOE0dtNgwI+PyJ/yJ+l5fFa/mFfJppUqJyQZK
         TyLh5eF3FhXmRhT473/SwKJwo91RL7lukiWaIwmFrn3egfZgq8hapAEfNtaRGDz3tac6
         5ff93mt6xmWSRm83JeHHuWr3hi+FNK/R7KO9WmXXWk65tIEBqgxYQaja4WsbbzHkntlE
         C4XfE6S1Htusteql1zIKPzbwtnKsZz10attJBlTcnoCn6ugBtLiq3ml0lqgKc2VMJ6YH
         CEUw3B0rpE4Jsvp6GBgspqK/CqZNjDqTCXrc5GLPfsxSrBNQMSrt8jWe8RWSMKT8JPrz
         bPqQ==
X-Gm-Message-State: AOJu0YzwD2q5UKdi+sAjT2dG244iMKJAUJ9QaWV6o+gg44wcnH8r76QO
	lOkmvohMXVDzWcCOFel4ZrP2NDl19cd3nzR2ZAdLUi73oOpqRhGD94rWfnSdDJPFmzSElS76iqT
	8Mox9
X-Gm-Gg: ATEYQzxYRynO1UB5ACWyiowvUmnBsmd3cEwIt0FbRMuIlt1dbI8Y3DpKoGgI0jTgfc2
	Z7eze+jVyEdrAnhxFr8HiacHrLIMXBLfMVJ9ZgVHcoUnkzx6ivEk9JZ0W/V59vOw0502CZyM1vM
	o5/90t/1+ys+iglcP1SWHfPCqWvCoQ8e8Y4XH1VowV74OwRaM2ywDkZnmURqfm/fTD3ekGkOQD9
	i5L6QMS1r2O3kispHTZpWWUc963HwUTN5feeTTKx+x/zhcjkjEJfMrj1OjUlfdVcVXB16BhZGvK
	jkWnbivQn4kCUUUn6Av7B1vYub8NAytaY1kWNjj8RPYlP2ex9npLJDQghKxNDfUNCGDVn7ehZuj
	qzSSbtB1u2hes3cYOvCFXyQ+ysCWn+lB1GhM2wdFGz1eUlb3H/wa+Lo4HcOqiqIqcKDKDHgLUp2
	YaqR966XmnAWpRhusFJJq5CMZDX/NDpWfRNLtfN1mtEV4dRg==
X-Received: by 2002:a05:7300:214f:b0:2be:e4b:60c3 with SMTP id 5a478bee46e88-2c0e50ddb73mr1496649eec.19.1773836693490;
        Wed, 18 Mar 2026 05:24:53 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5368ae6sm3746707eec.6.2026.03.18.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:24:53 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] busybox: fix for CVE-2026-26157, CVE-2026-26158
Date: Wed, 18 Mar 2026 17:54:12 +0530
Message-ID: <20260318122412.202963-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 12:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233382

Although the patch was not merged yet, Debian already took it ([1] & [2]).
Since busybox CVE handling is slow, follow Debian decision.

[1] https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
[2] https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch

Details:
1. https://nvd.nist.gov/vuln/detail/CVE-2026-26157
2. https://nvd.nist.gov/vuln/detail/CVE-2026-26158

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2026-26157-CVE-2026-26158-01.patch    | 197 ++++++++++++++++++
 .../CVE-2026-26157-CVE-2026-26158-02.patch    |  35 ++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 3 files changed, 234 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
new file mode 100644
index 0000000000..8649f4dfa5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
@@ -0,0 +1,197 @@
+From 0c20d6b353b058ab910dd3a0211e2b906802b105 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 29 Jan 2026 11:48:02 +0100
+Subject: tar: strip unsafe hardlink components - GNU tar does the same
+
+Defends against files like these (python reproducer):
+
+import tarfile
+ti = tarfile.TarInfo("leak_hosts")
+ti.type = tarfile.LNKTYPE
+ti.linkname = "/etc/hosts"  # or "../etc/hosts" or ".."
+ti.size = 0
+with tarfile.open("/tmp/hardlink.tar", "w") as t:
+	t.addfile(ti)
+
+function                                             old     new   delta
+skip_unsafe_prefix                                     -     127    +127
+get_header_tar                                      1752    1754      +2
+.rodata                                           106861  106856      -5
+unzip_main                                          2715    2706      -9
+strip_unsafe_prefix                                  102      18     -84
+------------------------------------------------------------------------------
+(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157, CVE-2026-26158 
+Upstream-Status: Backport [https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ archival/libarchive/data_extract_all.c      |  7 +++--
+ archival/libarchive/get_header_tar.c        | 11 ++++++--
+ archival/libarchive/unsafe_prefix.c         | 30 +++++++++++++++++----
+ archival/libarchive/unsafe_symlink_target.c |  1 +
+ archival/tar.c                              |  2 +-
+ archival/unzip.c                            |  2 +-
+ include/bb_archive.h                        |  3 ++-
+ 7 files changed, 42 insertions(+), 14 deletions(-)
+
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 8a69711..b84b960 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 	}
+ #endif
+ #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
+-	/* Strip leading "/" and up to last "/../" path component */
+-	dst_name = (char *)strip_unsafe_prefix(dst_name);
++	/* Skip leading "/" and past last ".." path component */
++	dst_name = (char *)skip_unsafe_prefix(dst_name);
+ #endif
+ // ^^^ This may be a problem if some applets do need to extract absolute names.
+ // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
+@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 
+ 		/* To avoid a directory traversal attack via symlinks,
+ 		 * do not restore symlinks with ".." components
+-		 * or symlinks starting with "/", unless a magic
+-		 * envvar is set.
++		 * or symlinks starting with "/"
+ 		 *
+ 		 * For example, consider a .tar created via:
+ 		 *  $ tar cvf bug.tar anything.txt
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index cc6f3f0..1c40ece 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ #endif
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+-	overlapping_strcpy(file_header->name, strip_unsafe_prefix(file_header->name));
+-//TODO: do the same for file_header->link_target?
++	strip_unsafe_prefix(file_header->name);
++	if (file_header->link_target) {
++		/* GNU tar 1.34 examples:
++		 * tar: Removing leading '/' from hard link targets
++		 * tar: Removing leading '../' from hard link targets
++		 * tar: Removing leading 'etc/../' from hard link targets
++		 */
++		strip_unsafe_prefix(file_header->link_target);
++	}
+ 
+ 	/* Strip trailing '/' in directories */
+ 	/* Must be done after mode is set as '/' is used to check if it's a directory */
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 6670811..89a371a 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -5,11 +5,11 @@
+ #include "libbb.h"
+ #include "bb_archive.h"
+ 
+-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
+ {
+ 	const char *cp = str;
+ 	while (1) {
+-		char *cp2;
++		const char *cp2;
+ 		if (*cp == '/') {
+ 			cp++;
+ 			continue;
+@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp += 3;
+ 			continue;
+ 		}
+-		cp2 = strstr(cp, "/../");
++		cp2 = cp;
++ find_dotdot:
++		cp2 = strstr(cp2, "/..");
+ 		if (!cp2)
+-			break;
+-		cp = cp2 + 4;
++			break; /* No (more) malicious components */
++
++		/* We found "/..something" */
++		cp2 += 3;
++		if (*cp2 != '/') {
++			if (*cp2 == '\0') {
++				/* Trailing "/..": malicious, return "" */
++				/* (causes harmless errors trying to create or hardlink a file named "") */
++				return cp2;
++			}
++			/* "/..name" is not malicious, look for next "/.." */
++			goto find_dotdot;
++		}
++		/* Found "/../": malicious, advance past it */
++		cp = cp2 + 1;
+ 	}
+ 	if (cp != str) {
+ 		static smallint warned = 0;
+@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 	}
+ 	return cp;
+ }
++
++void FAST_FUNC strip_unsafe_prefix(char *str)
++{
++	overlapping_strcpy(str, skip_unsafe_prefix(str));
++}
+diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarchive/unsafe_symlink_target.c
+index f8dc803..d764c89 100644
+--- a/archival/libarchive/unsafe_symlink_target.c
++++ b/archival/libarchive/unsafe_symlink_target.c
+@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
+ 				*list->data ? "hard" : "sym",
+ 				list->data + 1, target
+ 			);
++			/* Note: GNU tar 1.34 errors out only _after_ all links are (attempted to be) created */
+ 		}
+ 		list = list->link;
+ 	}
+diff --git a/archival/tar.c b/archival/tar.c
+index 9de3759..cf8c2d1 100644
+--- a/archival/tar.c
++++ b/archival/tar.c
+@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recursive_state *state,
+ 	DBG("writeFileToTarball('%s')", fileName);
+ 
+ 	/* Strip leading '/' and such (must be before memorizing hardlink's name) */
+-	header_name = strip_unsafe_prefix(fileName);
++	header_name = skip_unsafe_prefix(fileName);
+ 
+ 	if (header_name[0] == '\0')
+ 		return TRUE;
+diff --git a/archival/unzip.c b/archival/unzip.c
+index 691a2d8..5844215 100644
+--- a/archival/unzip.c
++++ b/archival/unzip.c
+@@ -853,7 +853,7 @@ int unzip_main(int argc, char **argv)
+ 		unzip_skip(zip.fmt.extra_len);
+ 
+ 		/* Guard against "/abspath", "/../" and similar attacks */
+-		overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
++		strip_unsafe_prefix(dst_fn);
+ 
+ 		/* Filter zip entries */
+ 		if (find_list_entry(zreject, dst_fn)
+diff --git a/include/bb_archive.h b/include/bb_archive.h
+index e0ef8fc..1dc77f3 100644
+--- a/include/bb_archive.h
++++ b/include/bb_archive.h
+@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_handle) FAST_FUNC;
+ void seek_by_jump(int fd, off_t amount) FAST_FUNC;
+ void seek_by_read(int fd, off_t amount) FAST_FUNC;
+ 
+-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
++void strip_unsafe_prefix(char *str) FAST_FUNC;
+ void create_or_remember_link(llist_t **link_placeholders,
+ 		const char *target,
+ 		const char *linkname,
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
new file mode 100644
index 0000000000..1380a6f72e
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
@@ -0,0 +1,35 @@
+From 038e0e4d791ea4e8a8da5e06904756142fc6b8dc Mon Sep 17 00:00:00 2001
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Mon, 16 Feb 2026 11:50:04 +0200
+Subject: tar: only strip unsafe components from hardlinks, not symlinks
+
+commit 3fb6b31c7 introduced a check for unsafe components in
+tar archive hardlinks, but it was being applied to symlinks too
+which broke "Symlinks and hardlinks coexist" tar test.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157, CVE-2026-26158 
+Upstream-Status: Backport [https://github.com/mirror/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ archival/libarchive/get_header_tar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index 1c40ece..606d806 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+ 	strip_unsafe_prefix(file_header->name);
+-	if (file_header->link_target) {
++	if (file_header->link_target && !S_ISLNK(file_header->mode)) {
+ 		/* GNU tar 1.34 examples:
+ 		 * tar: Removing leading '/' from hard link targets
+ 		 * tar: Removing leading '../' from hard link targets
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index d870e2ee10..228bfdadd3 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -62,6 +62,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
            file://CVE-2025-60876.patch \
+           file://CVE-2026-26157-CVE-2026-26158-01.patch \
+           file://CVE-2026-26157-CVE-2026-26158-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.50.1


