Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CC3A77F38C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 20:37:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so53354791wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 13:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cIXrF9ReRQHppjAHZes2R0u30ua4h2c842AzdX9/dCM=;
	b=hLTKSqQAeBcagXc8B7aYJn19ino1MINf5/OJUVubmdbSxZ0d52BUOYgmWw/UWXMyLv
	jzw2Rtd6ExALNRbWmqL/kaKlzdZ8FzhhhQpV/vQd9chF8zv2EIvYSDL4ozDiIfvKiJX2
	jQm/Eqp+6plDPS0GS0gfXs3q0aXfRGLAIgGZfSVjNRnNFAnShaypKcLduJP7m2uDQ5De
	VVwKQg2+6quU/KEnUHYCG4DkIVdHe2YkNdJqfVM3AWZBQdvqoT2y6mdM729ee7m0HycQ
	rXQuGpilPPpbYivfRuXexwhn+tQBAg0wNLlj7v/vL/DbZeXfmMKAUU7TbmbXm6JGNOrW
	5V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cIXrF9ReRQHppjAHZes2R0u30ua4h2c842AzdX9/dCM=;
	b=WEgQRKOT+2aiYphaETsKtR+K83oIhSylOxR+gKYJDcsJi15Yjgp1VQcL4ybvvi2W6h
	WbN8Wolhe8XV2/5GZeoP0XbYeUGeIMUgL6GKMwVcGvlt9LQ67/AIdaA5EMdj3YTmWmNF
	3HRnZtzsyxzjJOM878JAEIKOlTxShaTW402yDrXoKIDAO6ERjbKUVmM0LJdRCZMq82ln
	Mgv4aXdS6QFrhbqfdG1hma9n+dBYp5uZ7st2jqgpPrXY+rG1/GO5wUZv5W3FgchYdtqb
	Dj5yJjl80bJsYQflxYtoKmhCtkJTyDllAXWWLj0uXP7uvtB3aqYD9BFR4cC5bagmj+fu
	jm4g==
X-Gm-Message-State: APjAAAVvjXs3IT7UmgohCI1T9OY9bq9v/7RhpLAf8Ap4HveMX9Cov5GU
	Z8IAyzsMtBbXTKRLeytNIZk+D96CmrM=
X-Google-Smtp-Source: APXvYqzhCnJnST7yz5uoKPrlmQzYEO46OOolPSuyeQwunPTt7rhtzL/E8VwTEpiNttYuSxGH4ufa/Q==
X-Received: by 2002:a5d:51c8:: with SMTP id n8mr9764980wrv.46.1564778244449;
	Fri, 02 Aug 2019 13:37:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm59083910wrx.39.2019.08.02.13.37.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 13:37:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 21:37:12 +0100
Message-Id: <20190802203719.20437-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802203719.20437-1-ross.burton@intel.com>
References: <20190802203719.20437-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] xserver-xorg: clean up xorgproto dependencies
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
X-List-Received-Date: Fri, 02 Aug 2019 20:37:25 -0000
Content-Transfer-Encoding: 8bit

xorgproto is mentioned in the PACKAGECONFIG build dependencies because in the
past it was many separate *proto recipes.  Now they're all in one recipe, which
is in DEPENDS, so we don't need to depend on it several times.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 615ad6d9bda..fc05c6a76ea 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -27,9 +27,8 @@ inherit autotools pkgconfig
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-PROTO_DEPS = "xorgproto"
 LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess"
-DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
+DEPENDS = "xorgproto ${LIB_DEPS} font-util"
 
 # Split out some modules and extensions from the main package
 # These aren't needed for basic operations and only take up space:
@@ -128,18 +127,18 @@ PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
 "
 
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
-PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,xorgproto virtual/mesa"
-PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,xorgproto"
+PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,virtual/mesa"
+PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2"
 # DRI3 requires xshmfence to also be enabled
-PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,xorgproto"
-PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,xorgproto virtual/libgl virtual/libx11"
+PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,virtual/libgl virtual/libx11"
 PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy virtual/libgbm,libegl"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
 PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd"
-PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,xorgproto"
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama"
 PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,wayland wayland-native wayland-protocols libepoxy"
 
 # Xorg requires a SHA1 implementation, pick one
-- 
2.20.1


