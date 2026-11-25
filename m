Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2111.1795642500576032025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 13:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iRyj3rc/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261125213458be32186d8c000207c5-ntsvhp@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261125213458be32186d8c000207c5
        for <openembedded-core@lists.openembedded.org>;
        Wed, 25 Nov 2026 22:34:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yf/oWx1g9RZVciWc4WoOwiYmkf3lMkv9lPqYaZXVt18=;
 b=iRyj3rc/aVRWn5AT1Pilruf8551kc4uk1M8ROg3IxooBPBvGEukZKx/yYbc2AYfMiAw8pg
 UpmOcKD+Wynk9FdKhRdkAaw4bn1ZYzMKEmaiUK7Bt9xwDnyJ7ZNxOmRQJ38OzTq5YXHpayEC
 Ovfu2TVKQOJfThp/UrvyF7vV6LSem5rHUEKDunszxNK6s9s6HXujeqgb1RHDvDTyIz5ovIVI
 TeZcmy56Ie57B3lpd3rtNYNkjOfiXYDbLMPZNIGOqpM7Irh/wn22hcsscO3/U9va/661XMV6
 bWmCtecJBeglimaTnELaNyfe+RocEVec8VL5vPFtGqWEMh3+rZmPMrFw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] busybox: patch CVE-2026-136411
Date: Wed, 25 Nov 2026 22:33:51 +0100
Message-ID: <20261125213351.3584523-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 21:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251252
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned as "patch" in NVD CVE links.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/busybox/CVE-2026-136411.patch     | 84 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.38.0.bb   |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-136411.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-136411.patch b/meta/recipes-core/busybox/busybox/CVE-2026-136411.patch
new file mode 100644
index 00000000000..048bb867c4f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-136411.patch
@@ -0,0 +1,84 @@
+From b67f7b7d14ac98ca84491718d364b955d21a9cd5 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 6 Nov 2026 20:33:51 +0100
+Subject: [PATCH] tftpd: make DIR argiment work for non-root too, strip leading
+ /
+
+function                                             old     new   delta
+tftpd_main                                           573     589     +16
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-136411
+Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror/commit/b67f7b7d14ac98ca84491718d364b955d21a9cd5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ networking/tftp.c | 29 +++++++++++++++++++++++------
+ 1 file changed, 23 insertions(+), 6 deletions(-)
+
+diff --git a/networking/tftp.c b/networking/tftp.c
+index 9771a8225..c617cb0eb 100644
+--- a/networking/tftp.c
++++ b/networking/tftp.c
+@@ -362,8 +362,8 @@ static int tftp_protocol(
+ 	 * tftp -> "\0\4\0\1"
+ 	 * ...
+ 	 * Download with option of blksize 16384:
+-	 * tftp -> "\0\1FILENAME\0octet\0blksize\00016384\0"
+-	 *         "\0\6blksize\00016384\0" <- tftpd
++	 * tftp -> "\0\1FILENAME\0octet\0blksize\0""16384\0"
++	 *         "\0\6blksize\0""16384\0" <- tftpd
+ 	 * tftp -> "\0\4\0\0"
+ 	 *         "\0\3\0\1FILEDATA..." <- tftpd
+ 	 * tftp -> "\0\4\0\1"
+@@ -375,8 +375,8 @@ static int tftp_protocol(
+ 	 *         "\0\4\0\1" <- tftpd
+ 	 * ...
+ 	 * Upload with option of blksize 16384:
+-	 * tftp -> "\0\2FILENAME\0octet\0blksize\00016384\0"
+-	 *         "\0\6blksize\00016384\0" <- tftpd
++	 * tftp -> "\0\2FILENAME\0octet\0blksize\0""16384\0"
++	 *         "\0\6blksize\0""16384\0" <- tftpd
+ 	 * tftp -> "\0\3\0\1FILEDATA..."
+ 	 *         "\0\4\0\1" <- tftpd
+ 	 * ...
+@@ -916,7 +916,15 @@ int tftpd_main(int argc UNUSED_PARAM, char **argv)
+ 		G.pw = xgetpwnam(user_opt);
+ 	}
+ 	if (argv[0]) {
+-		xchroot(argv[0]);
++		const char *DIR = argv[0];
++		if (chroot(DIR) == 0)
++			DIR = "/";
++		/*
++		 * If chroot failed, assume that we aren't root,
++		 * and at least chdir to the specified DIR.
++		 * If chroot worked, move current dir to new "/":
++		 */
++		xchdir(DIR);
+ 	}
+ 
+ 	result = recv_from_to(STDIN_FILENO,
+@@ -944,12 +952,21 @@ int tftpd_main(int argc UNUSED_PARAM, char **argv)
+ 	G.block_buf_tail[0] = '\0';
+ 
+ 	local_file = G.block_buf + 2;
++
++	/* If someone really wants to expose their entire filesystem, "tftpd /" is the way to do it.
++	 * Most people don't want that.
++	 * Prevent escape via absolute paths or /../:
++	 */
++	while (local_file[0] == '/')
++		local_file++;
+ 	if (local_file[0] == '.' || strstr(local_file, "/.")) {
++//TODO: disallow only ".."?
+ 		error_msg = "dot in file name";
+ 		goto err;
+ 	}
++
+ 	mode = local_file + strlen(local_file) + 1;
+-	/* RFC 1350 says mode string is case independent */
++	/* RFC 1350 says mode string is case insensitive */
+ 	if (mode >= G.block_buf + result || strcasecmp(mode, "octet") != 0) {
+ 		error_msg = "mode is not 'octet'";
+ 		goto err;
diff --git a/meta/recipes-core/busybox/busybox_1.38.0.bb b/meta/recipes-core/busybox/busybox_1.38.0.bb
index a75c6394e9b..7a230542880 100644
--- a/meta/recipes-core/busybox/busybox_1.38.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.38.0.bb
@@ -60,6 +60,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-60876.patch \
            file://CVE-2024-58251.patch \
            file://CVE-2026-38754.patch \
+           file://CVE-2026-136411.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
