Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23F0105F7A9
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 13:19:12 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15592.1773407951821721654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 06:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AgKZJwXM;
 spf=pass (domain: mvista.com, ip: 74.125.82.43, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271257ae53so3303289c88.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773407951; x=1774012751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWwxEQDgnS2aB4EBlajxets/0LHJPeIra3qw7SIjgHg=;
        b=AgKZJwXMJuQW/cBgPtq2Swk0RlCTrsK1TEgtSBwR8JqPWKCGOAIEzJ54klazFClPb6
         Dn5SBsUZ69HZA/TeW3+X3EuviF+c/JPkJdGuuIbB09YiD0blSjY0gZP2SDVPY33Ukf2W
         2uc6rTA0aWVDu/Uu0GTA+fPYeIK6aixP939Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407951; x=1774012751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWwxEQDgnS2aB4EBlajxets/0LHJPeIra3qw7SIjgHg=;
        b=qd5DFO4wMHbUnhAof1oU75sdDB3NEyWy7MkqL86QjHwwW8UEFmZUsO9K548KqXNHtX
         hzw3ZuqB2HjivnM0Bl1dMbhT5MVknDfm7HQhgW5pGM9sAly2TE0Ih9h6QUkR+9xnL/xF
         1T+2exoiVccTr01FGC0xjsUre4B3LoS1coa29ZStxS8+/Su4lRNC5jzwnNekvTqBGFgU
         UdlxsKAZxTopFV82evzMxqfFh38EU/FYmB9Xk3NxCv4TUaq7WL49NG2TZSTTRlJAXOkH
         EUE+txIRNRpQrxpNI1JTLC9RlrMkIGV9Uj+FSLj70pRkg2m/Q9BGM9bXFND47o2dNiBT
         G1Lg==
X-Gm-Message-State: AOJu0YwpjRBInruReAJqm4MX7tEFovmq4APa6Uj1gcM5Q8LkGHm/Tn3K
	GQi1KVyP0/vCh1CdZdHvrXaMGIxkJRs3S+SXoyl+RZ/MnvcfjngzWdbiS3KRw6CRu0zyiNIObuB
	8tDK6
X-Gm-Gg: ATEYQzwylznxMB9GAy8x0JVdnMRFvuxF9fbdQOIfjNOJskCC7L1oxjQ3Y9Yx48J+/7O
	a8wcymB9R1p968vParw8Ii38CTFkANBXOtNI/kuxGn58XEfncqAR0HSGBEHPHDWSvR5abmj/egk
	B0DpyerVdH2I3LBx22ieCBBnnwjnJs3bo29kyF4ysNNnwktd9UQCsyMMrZWp+fMsMH19DH8MyRh
	FrNvn6vOj30x9RJ73iKKe3KtiCeX6a06muZK7WVv+bA6YfTBrAablgn9WA82K29gmysFtNbo+7d
	bIa8ZndOxc5z+VcSqdhMQT/mKN6e2eJagysVWwjwZAepK0vQoR9JYIQgcMotUfxofZDxgjyCFAH
	t1c0ULmlReE+gYMTdk0tns6YH43TydKmx4HB50dPK/+71dT4wnJLvI01ULfWbyEXpsP/L32K6Ph
	clNrVUsYr1UarxXVfddIGxJQCr0n467D/S3MAD
X-Received: by 2002:a05:7022:128b:b0:119:e55a:9bf6 with SMTP id a92af1059eb24-128f3d44f43mr1483140c88.18.1773407950767;
        Fri, 13 Mar 2026 06:19:10 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bead5a07d6sm1811991eec.27.2026.03.13.06.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:19:10 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] busybox: fix for CVE-2026-26157, CVE-2026-26158
Date: Fri, 13 Mar 2026 18:48:45 +0530
Message-ID: <20260313131845.56221-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 13:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233044

Although the patch was not merged yet, Debian already took it ([1] & [2]).
Since busybox CVE handling is slow, follow Debian decision.

[1] https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
[2] https://sources.debian.org/src/busybox/1:1.37.0-10.1/debian/patches/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2026-26157-CVE-2026-26158-01.patch    |  35 ++++
 .../CVE-2026-26157-CVE-2026-26158-02.patch    | 197 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   2 +
 3 files changed, 234 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
new file mode 100644
index 0000000000..306ccad511
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
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
+index dc0f7e0..a8c2ad8 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -453,7 +453,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
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
diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
new file mode 100644
index 0000000000..69e6e98c75
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
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
+ .../archival/libarchive/data_extract_all.c    |  7 ++---
+ .../archival/libarchive/get_header_tar.c      | 11 +++++--
+ .../archival/libarchive/unsafe_prefix.c       | 30 +++++++++++++++----
+ .../libarchive/unsafe_symlink_target.c        |  1 +
+ archival/tar.c                 |  2 +-
+ archival/unzip.c               |  2 +-
+ include/bb_archive.h           |  3 +-
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
+index d26868b..dc0f7e0 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -452,8 +452,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
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
+index fc92ac6..7b29d77 100644
+--- a/archival/unzip.c
++++ b/archival/unzip.c
+@@ -842,7 +842,7 @@ int unzip_main(int argc, char **argv)
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
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 0b5ac220f5..bb07502ccc 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -62,6 +62,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
            file://CVE-2025-60876.patch \
+           file://CVE-2026-26157-CVE-2026-26158-01.patch \
+           file://CVE-2026-26157-CVE-2026-26158-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.50.1


