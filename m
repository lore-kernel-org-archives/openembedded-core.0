Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1A4D58CD9
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 05:31:01 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11062.1774243851995872620
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 22:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ULPry6KD;
 spf=pass (domain: mvista.com, ip: 74.125.82.178, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c0e38f3f60so1852696eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 22:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774243851; x=1774848651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jO6HXUESHRTVavN/u1gEJJVR8o8SlbXWDC58D7QmmM=;
        b=ULPry6KDQMgDFbO1//stJFTurQOBoWkztXdnrYorIBrXTh0dxOWQUwrIOJ2nZ9RFTB
         E119aJwalZ3DSO3D/S44vLw2l+nLMzvv9msLdhxBcUEmDWawUypYGjLmgpmAlQHO2btw
         8U5Du63cKDFlhS/A6hjEo2J13u8l41ezFqTFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774243851; x=1774848651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jO6HXUESHRTVavN/u1gEJJVR8o8SlbXWDC58D7QmmM=;
        b=nDjJo6Jvviu7j6+a+BOBPj9cMtSJwtfaSmOUAysky2ZyQrCa4IXba/dMFBtiIQ9FoD
         aL9Q1CFPFQCA8pWw5ABs8Qm2GRzzFh0Fl/gAQhabY3mIvO/wgUg5HUSqruxpOyklrZ4W
         On1bFzx1+uVxjJ8dL4P3u1qpQ5doIMY7DLS9/HTlVlGLL9recz1fhR2BMSxjXHrSp0yv
         h5cpTCVc5LALMGQGoefgbbxgG209KJU1GUXvWoEZlbyDftXH6VnsjDw0efucW2Y6mANO
         4vN9yhUWw+xQUix5c0eBJHsKrxKfflcZYMbEml7Tf2ETPHOuxgNHUYEIhYfIESkFFo/R
         DowA==
X-Gm-Message-State: AOJu0YwS5tglfS5pZ3WuTOfv1e6MLrvF4GTKUfkXwLr6T59UXTSRyJHl
	YgrZkMOKsBh318RwVRD9jHfuquNQzPN/Ui6zjjjaI0haZmbxk/wzKvxx5KMjguVfUpjVG64YHmL
	+NNNW
X-Gm-Gg: ATEYQzyoKnf3kAu39azi3qF7l70ZUH1hCNcE0X0bRwTd0JH2ONCbtxtP0R8PsYPcFZB
	69MLQbl7AQYmcjeNz/D+YrIlKdp3khKPjrGx+7svq4Y80Q3JF1x7639SbJlgJISCYBYDPYdQfI1
	7IeCBoZlVthu1KCdHmD8mqYuvLQcd+3kPTJIQJgvi45N6d/oR9rUNpB3r92lWofXgnJQgXfZUUn
	plmNVfCqIOhxpaYwuMAEtKjrQnbCvOixk3e3Ij1XIq/BiyXy9Bqbj68h8CW1M3bd5v992JwxL2R
	803dS4YV1hmr/QZTq8k9OhBg+vIrjVsKWbNEalResKDJWGHg4tt9ZPaeN0eEpKnJRPCEqu4Z1wW
	s0idrF9/L9eEj3Vl/ev24T0RfaUBZL1b7JLOgmxN+8bgSZUaYTy54OPwJayUAPi+kHz33UsfxlA
	v38sNiBDUwGY5+D2C4X0IJcFKbEwPa4BwFhzSK
X-Received: by 2002:a05:7301:18ab:b0:2c1:1a55:e4b7 with SMTP id 5a478bee46e88-2c11a55e640mr1796124eec.21.1774243851044;
        Sun, 22 Mar 2026 22:30:51 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1313bf5fdsm3081465eec.14.2026.03.22.22.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 22:30:50 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2] busybox: fix for CVE-2026-26157, CVE-2026-26158
Date: Mon, 23 Mar 2026 11:00:40 +0530
Message-ID: <20260323053041.7848-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 05:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233696

Pick up patch from NVD report.

More details :
[1]: https://nvd.nist.gov/vuln/detail/CVE-2026-26157
[2]: https://nvd.nist.gov/vuln/detail/CVE-2026-26158

Note:
We use patch from busybox mirror that looks trustworthy https://gogs.librecmc.org/OWEALS/busybox.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2026-26157-CVE-2026-26158-01.patch    | 198 ++++++++++++++++++
 .../CVE-2026-26157-CVE-2026-26158-02.patch    |  37 ++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 3 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
new file mode 100644
index 0000000000..cdc2394794
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
@@ -0,0 +1,198 @@
+From 3fb6b31c716669e12f75a2accd31bb7685b1a1cb Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 29 Jan 2026 11:48:02 +0100
+Subject: [PATCH] tar: strip unsafe hardlink components - GNU tar does the same
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
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3fb6b31c716669e12f75a2accd31bb7685b1a1cb]
+(Alternative mirrored URL: https://gogs.librecmc.org/OWEALS/busybox/commit/3fb6b31c716669e12f75a2accd31bb7685b1a1cb)
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
index 0000000000..00a276fa4f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
@@ -0,0 +1,37 @@
+From 599f5dd8fac390c18b79cba4c14c334957605dae Mon Sep 17 00:00:00 2001
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Mon, 16 Feb 2026 11:50:04 +0200
+Subject: [PATCH] tar: only strip unsafe components from hardlinks, not
+ symlinks
+
+commit 3fb6b31c7 introduced a check for unsafe components in
+tar archive hardlinks, but it was being applied to symlinks too
+which broke "Symlinks and hardlinks coexist" tar test.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157, CVE-2026-26158
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=599f5dd8fac390c18b79cba4c14c334957605dae]
+(Alternative mirrored URL: https://gogs.librecmc.org/OWEALS/busybox/commit/599f5dd8fac390c18b79cba4c14c334957605dae)
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


