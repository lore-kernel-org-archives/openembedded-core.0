Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1D39F60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 15:44:34 +0000 (UTC)
Received: by wmec201 with SMTP id c201so20965570wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 07:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=kzR3mFS78uKz6YuLX9/Cmp4J9U65/lJSJJhNO0Kq20Y=;
	b=TukOgCp51/I+dDtoJqeBSBSSmsCVuTvtC/6yOD9VTEsUOc8e7t23E8ef6kwUu3xAiS
	FFLAfR9lAd8M2sncneyyApEy5cskSu/LgJ7wJKb2PuOhKQSl9392jts+TsxTy1GuvjeX
	CjjPtGEmRynYk6rV92euE0yJQXdtmp7mWdoAnTzMT38Nyb0v8aRX7T0AjY7dhYtmBeSb
	xBOxTz55i8hgMFONoOz3c3FJOesp7QmXkge7OrMZ0SeVXBnHhqyUoUImR8zLQVGCUNjm
	ktPrEqJKNVtHgNwlYs6nop5d1cmRxBw+nSfmFdhiUJEnPiPkvtPpOE8/43hcH6hkXtxG
	7L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kzR3mFS78uKz6YuLX9/Cmp4J9U65/lJSJJhNO0Kq20Y=;
	b=U1pVWt1uQpOcgkVmVlZTEv3RJsRb1pScZd5pp4BZdYs9LPGuFa4G5Y6e3jPKw7MBTg
	Wl7yGpJcm30ZOgjy5GKOopPo0u2nwd2MTNZT9PPEj1xkmfFgwaReqgTM8sN9KckWk0sU
	K6PnJgrKTIIvgRPsOdz9JTPwLTFMzThTyiebQmbNz/qK5gtSmsDs0/qpW2NObxRykc7W
	qegcs4GJ0lipOiOp60lY1uMD81dOY3qYBsXryhZ2XjTdJvjzNBlIqOytfY+SzIgIHH9R
	JP3bDEMtyWl5s4PRUffvaTI6mzISjb/OIGmXcQtgqAQGk3SqmfUKBsSuCujm8F7RNKQc
	6pag==
X-Gm-Message-State: ALoCoQnZq8APOXaOAjoCVEDGyVY/vgEygTebp/5uu36Y9t8/nfOll5Qn/HwlsdlGuZt9d8mJP6YM
X-Received: by 10.28.22.67 with SMTP id 64mr10669507wmw.61.1446824674503;
	Fri, 06 Nov 2015 07:44:34 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u126sm3630673wmd.3.2015.11.06.07.44.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 07:44:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 15:36:22 +0000
Message-Id: <1446824182-8839-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libaio: don't disable linking to the system libraries
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
X-List-Received-Date: Fri, 06 Nov 2015 15:44:36 -0000

For some reason that I don't understand (a decade-old attempt at optimisation?)
libaio disables linkage to the system libraries.  Enabling fortify means linking
to the system libraries, so remove the existing addition of -lc for x86 (the
problem also happens on at least PPC) and just link to the system libraries on
all platforms.

Also remove the sed of src/Makefile as the build not respecting LDFLAGS has been
fixed upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libaio/libaio/system-linkage.patch             | 37 ++++++++++++++++++++++
 meta/recipes-extended/libaio/libaio_0.3.110.bb     |  9 ++----
 2 files changed, 39 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-extended/libaio/libaio/system-linkage.patch

diff --git a/meta/recipes-extended/libaio/libaio/system-linkage.patch b/meta/recipes-extended/libaio/libaio/system-linkage.patch
new file mode 100644
index 0000000..0b1f475
--- /dev/null
+++ b/meta/recipes-extended/libaio/libaio/system-linkage.patch
@@ -0,0 +1,37 @@
+From 94bba6880b1f10c6b3bf33a17ac40935d65a81ae Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 6 Nov 2015 15:19:46 +0000
+Subject: [PATCH] Don't remove the system libraries and startup files from
+ libaio, as in some build configurations these are required.  For example,
+ including conf/include/security_flags.inc on PPC results in:
+
+io_queue_init.os: In function `io_queue_init':
+tmp/work/ppce300c3-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_queue_init.c:33:
+undefined reference to `__stack_chk_fail_local'
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index eadb336..56ab701 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -3,10 +3,10 @@ includedir=$(prefix)/include
+ libdir=$(prefix)/lib
+ 
+ CFLAGS ?= -g -fomit-frame-pointer -O2
+-CFLAGS += -nostdlib -nostartfiles -Wall -I. -fPIC
++CFLAGS += -Wall -I. -fPIC
+ SO_CFLAGS=-shared $(CFLAGS)
+ L_CFLAGS=$(CFLAGS)
+-LINK_FLAGS=
++LINK_FLAGS=$(LDFLAGS)
+ LINK_FLAGS+=$(LDFLAGS)
+ 
+ soname=libaio.so.1
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/libaio/libaio_0.3.110.bb b/meta/recipes-extended/libaio/libaio_0.3.110.bb
index cbe29ce..2adfa0a 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.110.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.110.bb
@@ -11,18 +11,13 @@ SRC_URI = "${DEBIAN_MIRROR}/main/liba/libaio/libaio_${PV}.orig.tar.gz \
            file://destdir.patch \
            file://libaio_fix_for_x32.patch \
            file://libaio_fix_for_mips_syscalls.patch \
-"
+           file://system-linkage.patch \
+           "
 
 SRC_URI[md5sum] = "2a35602e43778383e2f4907a4ca39ab8"
 SRC_URI[sha256sum] = "e019028e631725729376250e32b473012f7cb68e1f7275bfc1bbcdd0f8745f7e"
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
-# Need libc for stack-protector's __stack_chk_fail_local() bounce function
-LDFLAGS_append_x86 = " -lc"
-
-do_configure () {
-    sed -i 's#LINK_FLAGS=.*#LINK_FLAGS=$(LDFLAGS)#' src/Makefile
-}
 
 do_install () {
     oe_runmake install DESTDIR=${D}
-- 
2.1.4


