Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 162876013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 19:41:27 +0000 (UTC)
Received: by iedm5 with SMTP id m5so36903444ied.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 12:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xXNAoesS0QMguDjUu1hPZzx1zrrmFOUFqpqLszJxk/8=;
	b=ZEIa4+YmRF6SXpUZFscclQgRntOTs7WWoEY7bYIfzCwXtfuIUjPnlGq3Ju0UyHomlu
	VzTorSRvIvNd8j5bcFpk53nxxm+ik0CGe2jXp7wqofMXwgmL4ZyALCRJugNWsFNTg62d
	iCFQVjnSWJsH+YerSZG+SgABGKE8piTGcDTs/UrmolVK+GToSlzLsSvEAACqPEFZebEi
	WqkeAE7hDVAtDSlmYHBkqUgTAbc/h01f3Ak/c7kmtAE3FMrGd0sexONx32C49LX32wJ1
	k/MQXkpVeVr5Tb6QclZeqzpGFotovhryGeBojRLG5IVMd7h27lnS10YQCrn3w/XX1/A3
	24pg==
X-Received: by 10.43.66.131 with SMTP id xq3mr6721042icb.9.1426880488937;
	Fri, 20 Mar 2015 12:41:28 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	o196sm3767722ioe.26.2015.03.20.12.41.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Mar 2015 12:41:28 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2015 12:41:20 -0700
Message-Id: <1426880480-21423-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] directfb: define DEPENDS and EXTRA_OECONF via directfb.inc only
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
X-List-Received-Date: Fri, 20 Mar 2015 19:41:29 -0000

Remove duplicate EXTRA_OECONF definition from directfb_1.7.6.bb.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc      | 11 ++++++-----
 meta/recipes-graphics/directfb/directfb_1.7.6.bb | 13 -------------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 669c0ff..13495b1 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
 
 HOMEPAGE = "http://directfb.org"
-DEPENDS = "jpeg libpng freetype zlib tslib"
+DEPENDS = "jpeg libpng freetype zlib tslib sysfsutils"
 
 SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.tar.gz \
            file://configurefix.patch \
@@ -31,12 +31,13 @@ PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 
 EXTRA_OECONF = "\
   --with-gfxdrivers=none \
-  --enable-libmpeg3=no \
   --enable-freetype=yes \
-  --enable-sdl=no \
-  --enable-vnc=no \
-  --disable-x11 \
+  --enable-zlib \
+  --disable-imlib2 \
   --disable-mesa \
+  --disable-sdl \
+  --disable-vnc \
+  --disable-x11 \
 "
 
 #Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS as default
diff --git a/meta/recipes-graphics/directfb/directfb_1.7.6.bb b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
index d25d987..1b49112 100644
--- a/meta/recipes-graphics/directfb/directfb_1.7.6.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
@@ -2,19 +2,6 @@ require directfb.inc
 
 RV = "1.7-6"
 
-DEPENDS += "sysfsutils"
-
-EXTRA_OECONF = "\
-  --enable-freetype=yes \
-  --enable-zlib \
-  --with-gfxdrivers=none \
-  --disable-sdl \
-  --disable-vnc \
-  --disable-x11 \
-  --disable-imlib2 \
-  --disable-mesa \
-"
-
 LEAD_SONAME = "libdirectfb-1.7.so.0"
 
 SRC_URI[md5sum] = "8a7bb06b3f58599b230b4cf314004512"
-- 
1.9.1


