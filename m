Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6kmp-0002Bm-4D
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 18:06:35 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 08:54:19 -0700
Received: by wibhn17 with SMTP id hn17so746358wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 08:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Wg9ufC1unXzlZZXQKKqyvenXvuuTDk7X3MqQ7ZITnqU=;
	b=ey6I+Ca08ma0BC3RI9ILJ9WCRakUa8on5nUYWYT3x/jQmku8r+vBGYbNwng5B0YW/H
	mBWvReFIr5nrQMeRqBUYoF/5p82f1qCXiFOOa16kO+wF1A7fuzBI0QAje15bgSpCV2xs
	cq4nmUd50ufk9qCmq5j4B3vn4eAJ1rn4/Huk4qVC8tHtsIXjkb1fGqOukcdnFuv07cVu
	dYbTuHwYkPE9dr5SZIzZ8x35XmeQIWaQMUv0qgPJuryt3ZjcxcD7P+DDmg98isiRGafe
	cIw0f2DzOvAlZcjgInozDT7aOKdiMMBwsAZPeW+a7fcD+8sv54+CgWnI2D+xEPxyGbH1
	aoLQ==
Received: by 10.180.99.196 with SMTP id es4mr41207519wib.18.1346255657114;
	Wed, 29 Aug 2012 08:54:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id do5sm4617880wib.10.2012.08.29.08.54.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 08:54:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 16:53:32 +0100
Message-Id: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkutZYN3EkkEBzgervVURdpKWdzgFB7OoQPpcKxuJn2sHCHCZTt+ZJLvBX5sx2rXw/uX7/v
Subject: [PATCH 1/2] xserver-xorg: ship the exa module in a separate package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 16:06:35 -0000

EXA is used by some Xorg video drivers, it doesn't need to be shipped unless
it's being used.  Note that it's dynamically loaded so the automatic library
dependencies won't catch this, but as far as I'm aware nothing on oe-core or
meta-oe is using EXA.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc |    3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index 017ac91..b588c11 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -8,5 +8,5 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r4"
+PR = "r5"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 98f3d14..738ccb3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -29,6 +29,7 @@ DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 # Split out some modules and extensions from the main package
 # These aren't needed for basic operations and only take up space:
 #  32.0k   libdri.so
+#  91.0k   libexa.so
 #  336.0k  libglx.so
 #  1360k   libint10.so
 #  180.0k  libwfb.so
@@ -58,6 +59,7 @@ PACKAGES =+ "${PN}-security-policy \
              ${PN}-module-libwfb  \
              ${PN}-module-libmfb \
              ${PN}-module-libcfb \
+             ${PN}-module-exa \
              ${PN}-module-xaa \
              ${PN}-module-libxf1bpp \
              ${PN}-module-libxf4bpp"
@@ -91,6 +93,7 @@ FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
 FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
 FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
 FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
+FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
 FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
 FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
 FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
-- 
1.7.10



