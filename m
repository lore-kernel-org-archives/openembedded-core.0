Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDC2CCF2C7
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 14:29:53 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4465.1792235899496532373
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=sBFX7bmf;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=DcwL6Mtb;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792235896; x=1792840696;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=f42XsynyicFpAqn7a2kVnKiU9g3p8dXwNYbe6OLGEZ8=;
	b=sBFX7bmfo9sEivTH1Ze1f6tJ+s6PBxU0joqeu3oquhob9UaTsgHrME43cT0+yjJCycIoSjKdaG8Q5
	 xFFYpMd8PvlSgrbYPZTz3/To+Rs73Ro3FDfK+4hYKJAihw4Cpa6HBn9hiJveL34/s5uY+3xRNUoED5
	 ku2CE8BmWcNu3mhzHtBFP0ks9+o+JHM8xZnpfjYpr7HwU0daZA8+7PU3kyREBo8bHH3Vp51FnJOuVM
	 A2bpZeEznl1yUuT1/pYG+U2kXf/MQoudXXzSqDyHAIRkt2Kbivj/PNjhVdFqH/0VaGPOCYl6Z5kMbG
	 vzuvQiwA2vQj4qxBfqunERsq033MOZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792235896; x=1792840696;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=f42XsynyicFpAqn7a2kVnKiU9g3p8dXwNYbe6OLGEZ8=;
	b=DcwL6Mtb41E3oupm1UVWPxXCvc/kIkpVew15G8R9ror2nKOGd+Tb55kex7hhxZ1FkJCx9ZM0xmdwm
	 XkgZb1wCA==
X-HalOne-ID: 72615390-ca1c-11f1-941a-adacc84a9bfa
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-30f6-7fe6-dc05-8731.310.pool.telefonica.de [2a02:3102:8c10:1ae0:30f6:7fe6:dc05:8731])
	by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 72615390-ca1c-11f1-941a-adacc84a9bfa;
	Sat, 17 Oct 2026 11:18:16 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-core@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [wrynose][PATCH] minicom: fix baud rate setting with glibc 2.42 and newer
Date: Sat, 17 Oct 2026 13:18:13 +0200
Message-ID: <20261017111813.53186-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 14:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248088

Backport the upstream baud rate fix to minicom 2.10 in wrynose.

glibc 2.42 added support for arbitrary termios baud rates on Linux and
changed the Bxxx speed constants from bitmasks to integer baud rates.
The macros combine these values directly with c_cflag, resulting in
incorrect baud rates and garbled UART output. Use the libc functions
instead.

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 ...ove-cfset-i-o-speed-macros-for-glibc.patch | 41 +++++++++++++++++++
 meta/recipes-extended/minicom/minicom_2.10.bb |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/minicom/files/0001-src-sysdep.h-remove-cfset-i-o-speed-macros-for-glibc.patch

diff --git a/meta/recipes-extended/minicom/files/0001-src-sysdep.h-remove-cfset-i-o-speed-macros-for-glibc.patch b/meta/recipes-extended/minicom/files/0001-src-sysdep.h-remove-cfset-i-o-speed-macros-for-glibc.patch
new file mode 100644
index 0000000000..3b1136768a
--- /dev/null
+++ b/meta/recipes-extended/minicom/files/0001-src-sysdep.h-remove-cfset-i-o-speed-macros-for-glibc.patch
@@ -0,0 +1,41 @@
+From 964ae563cb5a78545ae1a4a3b6784c69ec73bc48 Mon Sep 17 00:00:00 2001
+From: Stefan Becker <chemobejk@gmail.com>
+Date: Mon, 17 Nov 2025 11:57:32 +0200
+Subject: [PATCH] src/sysdep.h: remove cfset{i,o}speed macros for glibc
+
+glibc 2.42 added support for arbitrary termios speeds on Linux, i.e.
+speed_t and Bxxx defines changed from bitmasks to unsigned integers:
+Therefore speed_t can no longer be used together with c_flag's internal
+bitmask CBAUD.
+
+When minicom is compiled on such a system the baudrate setting is broken
+and the user experiences garbled UART output.
+
+Remove the macros for glibc, i.e. call cfset{i,o}speed() instead.
+
+Fixes #17
+
+Upstream-Status: Backport [https://salsa.debian.org/minicom-team/minicom/-/commit/964ae563cb5a78545ae1a4a3b6784c69ec73bc48]
+
+Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
+---
+ src/sysdep.h | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/src/sysdep.h b/src/sysdep.h
+index b11945c..9ba8836 100644
+--- a/src/sysdep.h
++++ b/src/sysdep.h
+@@ -141,12 +141,3 @@
+ #  define cfsetospeed(tty, spd)
+ #endif
+ #endif
+-
+-/* Redefine cfset{i,o}speed for Linux > 1.1.68 && libc < 4.5.21 */
+-#if defined (__GLIBC__) && defined(CBAUDEX)
+-#  undef cfsetispeed
+-#  undef cfsetospeed
+-#  define cfsetispeed(xtty, xspd) \
+-		((xtty)->c_cflag = ((xtty)->c_cflag & ~CBAUD) | (xspd))
+-#  define cfsetospeed(tty, spd)
+-#endif
diff --git a/meta/recipes-extended/minicom/minicom_2.10.bb b/meta/recipes-extended/minicom/minicom_2.10.bb
index 20ce5662c2..c78d70f21a 100644
--- a/meta/recipes-extended/minicom/minicom_2.10.bb
+++ b/meta/recipes-extended/minicom/minicom_2.10.bb
@@ -7,7 +7,9 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
+SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
+           file://0001-src-sysdep.h-remove-cfset-i-o-speed-macros-for-glibc.patch \
+           "
 
 SRC_URI[sha256sum] = "90e7ce2856b3eaaa3f452354d17981c49d32c426a255b6f0d3063a227c101538"
 
-- 
2.53.0


