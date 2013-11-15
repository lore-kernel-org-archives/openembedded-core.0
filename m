Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EB7316DABA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 23:49:33 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x12so4111018wgg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DbR9iStBQN9MSnXpyvlQCrmPqnd3X4IySZNL1hMuhXA=;
	b=SilRss9Kxw3OI+cpSRtTommnmCxSAveD5hxfP4Be3HVhbrzrEoACpj2Qw2XA3/kchi
	eg1lbInCRgNpPlXBcSR2zii6TXA24kQWzFVwzM3oZvhiSaewZFWDYoGQg+BdRjRFDBbA
	Eih1yYojTuaGJatWyQSWUg9600VZqEYWAn/PVw/tUuAai5YvV/qklF7pMNThcpYV3pFv
	eJLuEZnhgc5xR6pgB8iCV36nvcgGrLDaIzFMogTPIHIpBkjIZCUBrQHOGx+SQ5NP1u+m
	uW9S0p0EJ5eSFAfkd/tG0TSw8bmE87LwsOX0Bm7Az9P+1j0rZM1bm3EEmRiAYmsAdJID
	FEXg==
X-Gm-Message-State: ALoCoQkCgwYkmHwb+n1KlYOysntv9S6tcAUdmHtkq1+xtaDpNABWiVo6YsTFKoPnGsD5L5fqvjI4
X-Received: by 10.194.2.108 with SMTP id 12mr1902186wjt.64.1384559375475;
	Fri, 15 Nov 2013 15:49:35 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id gm2sm20642wib.4.2013.11.15.15.49.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 15:49:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 23:49:24 +0000
Message-Id: <1384559364-27687-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384559364-27687-1-git-send-email-ross.burton@intel.com>
References: <1384559364-27687-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] mtdev: upgrade to 1.1.4
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
X-List-Received-Date: Fri, 15 Nov 2013 23:49:34 -0000

Refresh fixsepbuild.patch to apply cleanly, and clean up the description.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/mtdev/fixsepbuild.patch                |   30 ++++++++++----------
 meta/recipes-graphics/wayland/mtdev_1.1.2.bb       |   20 -------------
 meta/recipes-graphics/wayland/mtdev_1.1.4.bb       |   19 +++++++++++++
 3 files changed, 34 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/mtdev_1.1.2.bb
 create mode 100644 meta/recipes-graphics/wayland/mtdev_1.1.4.bb

diff --git a/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch b/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch
index 00a5c27..9895650 100644
--- a/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch
+++ b/meta/recipes-graphics/wayland/mtdev/fixsepbuild.patch
@@ -1,24 +1,24 @@
-Fix separate build directory builds to avoid the error:
+Some tests do #include  relative to the top-level, so add top_srcdir to the
+include path as otherwise out-of-tree builds can't find the files.
 
-| make[2]: Entering directory `/media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/build/test'
-| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/media/build1/poky/build/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I/media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/mtdev-1.1.2/test -I.. -I/media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/mtdev-1.1.2/include/    -O2 -pipe -g -feliminate-unused-debug-types -c /media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/mtdev-1.1.2/test/mtdev-matching.c
-| /media/build1/poky/build/tmp/work/i586-poky-linux/mtdev/1.1.2-r0/mtdev-1.1.2/test/mtdev-matching.c:29:23: fatal error: src/match.h: No such file or directory
-| compilation terminated.
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ test/Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Upstream-Status: Pending
-
-RP 2013/03/21
-
-Index: mtdev/test/Makefile.am
-===================================================================
---- mtdev/test.orig/Makefile.am	2010-12-22 18:10:41.000000000 +0000
-+++ mtdev/test/Makefile.am	2013-03-21 11:47:21.557160981 +0000
+diff --git a/test/Makefile.am b/test/Makefile.am
+index 2b504bd..6688b41 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
 @@ -1,7 +1,7 @@
  noinst_PROGRAMS = mtdev-mapgen mtdev-matching mtdev-kernel
  bin_PROGRAMS = mtdev-test
  
--INCLUDES=-I$(top_srcdir)/include/
-+INCLUDES=-I$(top_srcdir)/include/ -I$(top_srcdir)
+-AM_CPPFLAGS=-I$(top_srcdir)/include/
++AM_CPPFLAGS=-I$(top_srcdir) -I$(top_srcdir)/include/
  
  mtdev_mapgen_SOURCES = mtdev-mapgen.c
  
+-- 
+1.7.10.4
diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.2.bb b/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
deleted file mode 100644
index 87edb45..0000000
--- a/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-inherit autotools pkgconfig
-
-SUMMARY = "Multitouch Protocol Translation Library"
-
-DESCRIPTION = " The mtdev is a stand-alone library which transforms all \
-variants of kernel MT events to the slotted type B protocol. The events put \
-into mtdev may be from any MT device, specifically type A without contact \
-tracking, type A with contact tracking, or type B with contact tracking"
-
-HOMEPAGE = "http://bitmath.org/code/mtdev/"
-SECTION = "libs"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
-
-SRC_URI = "http://bitmath.org/code/mtdev/mtdev-1.1.2.tar.bz2 \
-           file://fixsepbuild.patch"
-SRC_URI[md5sum] = "d9c7700918fc392e29da7477ae20c5c2"
-SRC_URI[sha256sum] = "698dd11ca08b3a73ad33d8a5076f6d9e018d97afad3eba36f540b8ea7b775a30"
-
diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.4.bb b/meta/recipes-graphics/wayland/mtdev_1.1.4.bb
new file mode 100644
index 0000000..6b38f58
--- /dev/null
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.4.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Multitouch Protocol Translation Library"
+
+DESCRIPTION = "mtdev is a library which transforms all variants of kernel \
+multitouch events to the slotted type B protocol. The events put into mtdev may \
+be from any MT device, specifically type A without contact tracking, type A with \
+contact tracking, or type B with contact tracking"
+
+HOMEPAGE = "http://bitmath.org/code/mtdev/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
+
+SRC_URI = "http://bitmath.org/code/${BPN}/${BP}.tar.bz2 \
+           file://fixsepbuild.patch"
+SRC_URI[md5sum] = "73a915d6075b31db4f08ab8c6d314695"
+SRC_URI[sha256sum] = "6b59b055ff22f2b91d4284187c2515826c338b81f6f33bd90f6bedc7c1fb9a38"
+
+inherit autotools pkgconfig
-- 
1.7.10.4


