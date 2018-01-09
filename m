Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C383B7017B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 15:48:21 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z48so8847147wrz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 07:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3kI+Vxf4TCG1vgoeKx+JMSKbNRNnTx/vYZfUrt9pcqc=;
	b=SakK1Ovw51TtulMFV9A+rXqN2eZiZi6dfWfnLbSbfgEjSowFdYIqGRkpepMuLnauD4
	XvarBY7XbyuFXuhGRD0D/1bC2q65u3aL19rqZuwMYBBaMUm+7gIAlq43fvuYAczA1N9v
	TUzaE0T9yHs9pQhSM7eN7RdujibehvEbpg5qO2lPmAT8kB0NeMzueFiN8sjIdUUY4Icz
	Cq+gIm85EaZQ8NjfItRzKlPykzLsh03h5teE3is5OMmLlBjvDLwdoQmKN21VEda+twJo
	E91fT7MshFDojlxx3Ft61Hd6oHKzQDHjIJ17xyVJBYlk+TNpo6AooYUX7D1vc0Szp3Kw
	5i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3kI+Vxf4TCG1vgoeKx+JMSKbNRNnTx/vYZfUrt9pcqc=;
	b=uZZICGoTRduFpM4bBE27vCht3uVEtJdF74mRs4WXBabiCM30QqeQQkIwMYqqJwVShP
	AkRFeNKQs6VJkuaVWBmj+vKE287AHGJJ1tgxJh8OzEwTXJs1sLws5ef6Dgd+MnC2Mto+
	LdWtjWLW+KG0ICFUvqCbIHCmCRWui3Xf+p5kp8ex3cozskeOMJVyAHUobdIV1aUYDHbo
	G999tiCw1vMXhsxjHF5uLsha/FQnATMpWuTtTA30hR3pgzVdK1EwXWwYU2rPlOb9+9ll
	ImubcFqnl2JnDeM2kuDPfMgBVXYa50FA4b9pENg/Z9rkKash63b2sMStW2sAqE8u51LY
	ZrbQ==
X-Gm-Message-State: AKGB3mLBiNhMPMap3MKzObG7JufkNksRvFPn3NJHEdbRRwp10RhEqriF
	vixo/uA0lCszIcjTQfMEEYIOlgkm
X-Google-Smtp-Source: ACJfBouVK99rPV216efP8f5COLuplyL/owMmcXbFuwC+x1oY5+A05z7oR7HFBaddDffqj83CT/2FLQ==
X-Received: by 10.223.181.2 with SMTP id a2mr14620959wrd.90.1515512901990;
	Tue, 09 Jan 2018 07:48:21 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	g60sm18970898wrd.92.2018.01.09.07.48.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jan 2018 07:48:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jan 2018 15:48:18 +0000
Message-Id: <20180109154818.27025-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib-2.0: rationalise build dependencies
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
X-List-Received-Date: Tue, 09 Jan 2018 15:48:22 -0000

nativesdk-glib-2.0 doesn't build-depend on nativesdk-gettext, but all variations
need to depend on gettext-native as they need msgfmt (so gettext-minimal-native
isn't an option).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index cfeb48a5368..8aada5cea7a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "GLib is a general-purpose utility library, which provides many us
 HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
-# docs/reference/COPYING is with a 'public domai'-like license!
+# docs/reference/COPYING is with a 'public domain'-like license!
 LICENSE = "LGPLv2.1+ & BSD & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
@@ -19,10 +19,12 @@ CVE_PRODUCT = "glib"
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "virtual/libiconv libffi zlib glib-2.0-native"
-DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' dbus', '', d)}"
-DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
-DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib glib-2.0-native"
+DEPENDS = "glib-2.0-native \
+           gettext-native \
+           virtual/libiconv \
+           libffi \
+           zlib \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus', '', d)}"
 
 PACKAGES += "${PN}-codegen ${PN}-utils"
 
-- 
2.11.0


