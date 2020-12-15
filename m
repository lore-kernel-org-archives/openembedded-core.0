Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.932.1608060223629813502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4138A38C1678
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:45 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-initial: upgrading to 2.10.0 FAILED
Message-ID: <MADEUP.1650FA4151F6D7BA.26179@lists.openembedded.org>
X-Groupsio-MsgNum: 145700
Content-Type: multipart/mixed; boundary="===============0680993568779990022=="

--===============0680993568779990022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-initial* to *2.10.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f libva-initial /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1474 entries from dependency cache.
Parsing recipes...done.
Parsing of 808 .bb files complete (807 cached, 1 parsed). 1414 targets, 31 skipped, 0 masked, 0 errors.
INFO: No patches or local source files needed updating
INFO: Cleaning sysroot for recipe libva-initial...
ERROR: Command 'bitbake -c clean libva-initial' failed, output:
Loading cache...done.
Loaded 1475 entries from dependency cache.
Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.9.0.bb:1: Could not include required file libva.inc

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

If you wish, you may specify -n/--no-clean to skip running this command when resetting



Next steps:
    - apply the patch: git am 0001-libva-initial-upgrade-2.9.0-2.10.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0680993568779990022==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libva-initial-upgrade-2.9.0-2.10.0.patch"

From 9818be2b9a25a087f3c3ef2c89a9e725ded9f572 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 12:53:00 +0000
Subject: [PATCH] libva-initial: upgrade 2.9.0 -> 2.10.0

---
 .../libva/libva-initial_2.9.0.bb              |  5 ----
 meta/recipes-graphics/libva/libva.inc         | 29 -------------------
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/libva-initial_2.9.0.bb
 delete mode 100644 meta/recipes-graphics/libva/libva.inc

diff --git a/meta/recipes-graphics/libva/libva-initial_2.9.0.bb b/meta/recipes-graphics/libva/libva-initial_2.9.0.bb
deleted file mode 100644
index 5c6abeafe6..0000000000
--- a/meta/recipes-graphics/libva/libva-initial_2.9.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require libva.inc
-
-do_install_append () {
-	rm -f ${D}${libdir}/*.so*
-}
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
deleted file mode 100644
index 7b6f11674d..0000000000
--- a/meta/recipes-graphics/libva/libva.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Video Acceleration (VA) API for Linux"
-DESCRIPTION = "Video Acceleration API (VA API) is a library (libVA) \
-and API specification which enables and provides access to graphics \
-hardware (GPU) acceleration for video processing on Linux and UNIX \
-based operating systems. Accelerated processing includes video \
-decoding, video encoding, subpicture blending and rendering. The \
-specification was originally designed by Intel for its GMA (Graphics \
-Media Accelerator) series of GPU hardware, the API is however not \
-limited to GPUs or Intel specific hardware, as other hardware and \
-manufacturers can also freely use this API for hardware accelerated \
-video decoding."
-
-HOMEPAGE = "https://01.org/linuxmedia/vaapi"
-BUGTRACKER = "https://github.com/intel/libva/issues"
-
-SECTION = "x11"
-LICENSE = "MIT"
-
-SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "e344c1392dde92696c9ffd9cb3c7277d0a3b912236eb4e0fdedf7f375434584b"
-
-S = "${WORKDIR}/libva-${PV}"
-
-UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
-
-DEPENDS = "libdrm"
-
-inherit meson pkgconfig
-- 
2.17.1


--===============0680993568779990022==--
