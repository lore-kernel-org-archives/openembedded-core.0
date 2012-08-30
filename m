Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T78Pt-0004g4-7o
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 19:20:29 +0200
Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 10:08:12 -0700
Received: by wibhm2 with SMTP id hm2so451623wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Wg9ufC1unXzlZZXQKKqyvenXvuuTDk7X3MqQ7ZITnqU=;
	b=kJ02vGtaK6f8yjbQXqHl6no633qpqYAvBGtLwXYLT7rESP4N/4LANIdw/uuKqBTUCG
	CWSvHmmiHTa7XcnaW6mFjoEREhRTH1Ou3LHISSkorzvPm6sK28zZWdazgXI35NFpvev5
	HpRiH0ihy3oqh/F651rBezAqyqoQxuEZEIxVkb55JKjRllT+baULfWspF6dpL/a2sbL5
	t08ri4eDI3L9KZP9rVRgZjEz3dPooJPc//oE51E2GRsMjqNluyEU9NKcdNNqRZityHnr
	2kwdl4vttpAQpAlIBjVTJ3TAXs5M/tA8hxqI25wKMOZFx0rUh5xuJAKalg06NreO/m3n
	F57w==
Received: by 10.180.20.11 with SMTP id j11mr1875081wie.12.1346346490684;
	Thu, 30 Aug 2012 10:08:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hv8sm1707554wib.0.2012.08.30.10.08.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 10:08:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 18:07:21 +0100
Message-Id: <5dec52d45badd8e8168874adabbf972ccfd4ec2b.1346346320.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmQ+0sgEn9KnuR0B6YRDuGmTm0upy26rEVsI9KAJBjsx84Crw3UJEcgv6yusnaNfM8VohDs
Subject: [PATCH 2/6] xserver-xorg: ship the exa module in a separate package
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
X-List-Received-Date: Thu, 30 Aug 2012 17:20:29 -0000

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



