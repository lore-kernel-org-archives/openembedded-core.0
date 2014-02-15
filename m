Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 994F26E3EB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 02:54:18 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kx10so13072628pab.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 18:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JgVo8VihpuAh9oaYqo762ZcvR9oN0+2AfvW3kU/O6CU=;
	b=aGPwD1bHm9zTlUHCbbHzIPHfJy5WelAVLugz+n6mSMjjWOCZTgiQL/0v/UaNMnxcKi
	jYvL0LlE5vz3rcKq9C1zl5Qtu395yEU9WtQ3eaBXkW7PCrnVDQwfrrqi3CJa14VRGG5u
	sJ7HyrNMXroeeG9BXY+xE1be5B41HS7vbTJppAwHsr6nMjSCdcE8oi6V3OhxBe+kPLE5
	UosSfOthy8VWLDFuiz7kR9ejMWcXt78YQsQQMrYzT5ks8vxuYSKF4Qv3mV3yB8Twx8Ti
	M/62dNR6KuDKz3BiZ384wqAJHjzsrO+LegMdrIGA87le8q71ohVaRLvSw/Y+arF7TjOI
	9AlQ==
X-Received: by 10.68.112.164 with SMTP id ir4mr12759543pbb.153.1392432859588; 
	Fri, 14 Feb 2014 18:54:19 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	qq5sm22134522pbb.24.2014.02.14.18.54.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Feb 2014 18:54:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 18:54:37 -0800
Message-Id: <1392432877-15003-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] usbutils: Patch to detect iconv support
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
X-List-Received-Date: Sat, 15 Feb 2014 02:54:19 -0000

Fixes build failures on uclibc

| lsusb-usbmisc.o: In function `usb_string_to_native':
|
/home/kraj/work/angstrom-repo/build/tmp-angstrom_next-uclibc/work/armv7at2hf-vfp-neon-angstrom-linux-uclibceabi/usbutils/007-r0/usbutils-007/usbmisc.c:190:
undefined reference to `libiconv_open'
|
/home/kraj/work/angstrom-repo/build/tmp-angstrom_next-uclibc/work/armv7at2hf-vfp-neon-angstrom-linux-uclibceabi/usbutils/007-r0/usbutils-007/usbmisc.c:199:
undefined reference to `libiconv'
|
/home/kraj/work/angstrom-repo/build/tmp-angstrom_next-uclibc/work/armv7at2hf-vfp-neon-angstrom-linux-uclibceabi/usbutils/007-r0/usbutils-007/usbmisc.c:202:
undefined reference to `libiconv_close'
| collect2: error: ld returned 1 exit status
| make[2]: *** [lsusb] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/usbutils/usbutils/iconv.patch |   40 ++++++++++++++++++++++++
 meta/recipes-bsp/usbutils/usbutils_007.bb      |    8 +++--
 2 files changed, 45 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-bsp/usbutils/usbutils/iconv.patch

diff --git a/meta/recipes-bsp/usbutils/usbutils/iconv.patch b/meta/recipes-bsp/usbutils/usbutils/iconv.patch
new file mode 100644
index 0000000..c557334
--- /dev/null
+++ b/meta/recipes-bsp/usbutils/usbutils/iconv.patch
@@ -0,0 +1,40 @@
+This patch adds support for detecting iconv support using autotools
+uclibc does not have iconv implementation inside libc like glibc, therefore
+the existing checks were not sufficient, it worked for glibc but not for
+uclibc. The new patch portably detects the iconv support and adds the
+libiconv to linker cmdline
+
+This patch should be submitted upstream too
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: usbutils-007/configure.ac
+===================================================================
+--- usbutils-007.orig/configure.ac
++++ usbutils-007/configure.ac
+@@ -10,7 +10,9 @@ AC_USE_SYSTEM_EXTENSIONS
+ AC_SYS_LARGEFILE
+ 
+ AC_CHECK_HEADERS([byteswap.h])
+-AC_CHECK_FUNCS([nl_langinfo iconv])
++
++AM_GNU_GETTEXT
++AM_ICONV
+ 
+ AC_ARG_ENABLE(zlib,
+ 	AS_HELP_STRING(--disable-zlib,disable support for zlib))
+Index: usbutils-007/Makefile.am
+===================================================================
+--- usbutils-007.orig/Makefile.am
++++ usbutils-007/Makefile.am
+@@ -27,7 +27,7 @@ lsusb_CPPFLAGS = \
+ 	-DDATADIR=\"$(datadir)\"
+ 
+ lsusb_LDADD = \
+-	$(LIBUSB_LIBS)
++	$(LIBUSB_LIBS) $(LIBICONV)
+ 
+ if HAVE_ZLIB
+ lsusb_CPPFLAGS += -DHAVE_LIBZ
diff --git a/meta/recipes-bsp/usbutils/usbutils_007.bb b/meta/recipes-bsp/usbutils/usbutils_007.bb
index 45f829f..3cb19c9 100644
--- a/meta/recipes-bsp/usbutils/usbutils_007.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_007.bb
@@ -6,16 +6,18 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "libusb zlib"
+DEPENDS = "libusb zlib virtual/libiconv"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://usb-devices-avoid-dependency-on-bash.patch \
-           file://Fix-NULL-pointer-crash.patch"
+           file://Fix-NULL-pointer-crash.patch \
+           file://iconv.patch \
+          "
 
 SRC_URI[md5sum] = "be6c42294be5c940f208190d3479d50c"
 SRC_URI[sha256sum] = "e65c234cadf7c81b6b1567c440e3b9b31b44f51c27df3e45741b88848d8b37d3"
 
-inherit autotools
+inherit autotools gettext
 
 do_install_append() {
 	# We only need the compressed copy, remove the uncompressed version
-- 
1.7.10.4


