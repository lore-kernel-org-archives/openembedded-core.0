Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AC5C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 21:16:47 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.6575.1752787004232307710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 14:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=USu/JWlu;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747fba9f962so1590348b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752787003; x=1753391803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=302Zp/Nky92TSvoYwUBW9eyQXikrAlaA588TuITYF+8=;
        b=USu/JWluQeCvD/nioFGJrftGDvlnmJ5dlk6dseMGS4wiLzuiG2i2j8C+QCCrjVqeRy
         W1xVfr3S7X7SriEootbgnL7uK9LViP8RcoUjDeZiRD/g2yfCKrC/n60kR7LOiSCeq/gy
         PHkd+8v0wL2juNBDegdkDICDD6Ics9LjZfo3eNXaBxKzFh+w4SigKZSWARu/qwyy9X6A
         QdaaYKO2cVH6H+Uh189meMMBrrF/6IGobFcU8JR7SHaU7NC2SKiLRDNG8i4sZBis/uhz
         NZdUd5GnhWxwk0EWZV54k4cf+OirxOdH/EezHXfchJhs264R0kfO4BabYD4jVYu1URgT
         rC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752787003; x=1753391803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=302Zp/Nky92TSvoYwUBW9eyQXikrAlaA588TuITYF+8=;
        b=GYMQIKLJ0goHk8KXcXPxuFtAgIBk38tQihq5Oq003eUmXvMDFY74OBbk7N2IPJpvZG
         KVLTs+RPVyS0lV1eWUDLE2cWDfU3QbTgHNrpDDdkJySRmTJwQUpD3M6IeDhzdV0K1Zrg
         V8pfZqchfxp1r6aFdM4w+vXXsx38vvwf0/FfkDWVIQQSQrCs7MPrfvIIVXfhzKjs2aJR
         xmCDwv0ay+ZsZLBJ79uoX3BbRE0vUlHlBXBwyp57g4xbnAZapL1RI/U29TvYLhfx8Ius
         H/QiCZ3THw5+GWxXDG44x2YY7Lc0TOjcrUd2+WmSzYFyKXNFMaUQ8Ec84BYAkOgrToSK
         KZYA==
X-Gm-Message-State: AOJu0YwuiLzlOBM/uMQKLcEt5fzvjXvU44mB+kqF78ehx/7TF0VCIu9y
	9hkVPiTqa64wsm+GmPmwD16Khcv4e7yt+sgnbamTZ9FIpn5tZ7O8C5KjqF6sOxBW
X-Gm-Gg: ASbGncv8QSUcaLy9lcU3DFfV5LBQeXdVZ4Dwk7OFEtBeIQVWvrhKmYttpg+WP6CkBc2
	/nNcs8VjZeOnZw03KAM7PCEj3yOrQSa92XCk8+fpV82RsT3X2xqjlRcHyFrd+RJJRFu2NnBdeJr
	ml//PkJ2sy06+ZrDX329ymRIjggg8lNwv+c+3G860xvfmUSfyy0mlpnKdLIGB/sT6jZ4chIuqwP
	eWmWiVhPQ7Ntr3L3L7+NVacVgYF20rGBCkLmbWTul0gxONg01Q25Gfa9GnzXUUMNBEffyKfMgEN
	YzGlxMzQc+r2Mkvo1pK0sm6bTvaY5Iwjmg0zzxmqbbs8qaehsgkTMT6DT5mBT2mxWOtUn6Tv8ZR
	3KbVJ+BNTZoATzzhBvfs6ZB1p8Jbf1QmMTYGLhg==
X-Google-Smtp-Source: AGHT+IEj9054jdhMfdl8DNWzOUsDaO01BP1asJDdiNsY6AKlBn4wNO4YBX2gmTlKtoXbDRweNajDww==
X-Received: by 2002:a05:6a21:998b:b0:238:351a:f960 with SMTP id adf61e73a8af0-2390c84dd57mr7790240637.23.1752787002989;
        Thu, 17 Jul 2025 14:16:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ffb69b8sm97678a12.71.2025.07.17.14.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 14:16:42 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 1/2] systemd: drop build dependency on util-linux
Date: Thu, 17 Jul 2025 18:16:20 -0300
Message-Id: <20250717211621.7122-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250717211621.7122-1-hiagofranco@gmail.com>
References: <20250717211621.7122-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 21:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220564

From: Hiago De Franco <hiago.franco@toradex.com>

The libmount dependency was made optional on systemd upstream [1]. By
backporting this upstream change, we can drop util-linux as a build
dependency for systemd, making it only as a runtime dependency.

This is important to fix a circular dependency between util-linux and
systemd when util-linux is built with the systemd PACKAGECONFIG enabled.
Without this change, each recipe depends on the other, triggering the
circular dependency error.

[1] https://github.com/systemd/systemd/commit/d1ee3889cf8e8a9edc82e41d306155fb4c531c8f

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v1->v2:
- commit description fixed, there was a link mentioned that was not
  being referenced on v1.
---
 .../0001-meson-Add-libmount-feature.patch     | 58 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_257.6.bb    |  7 ++-
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch b/meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch
new file mode 100644
index 000000000000..b593e5cc7d4f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch
@@ -0,0 +1,58 @@
+From 821c809e1e1e449f5a2fe591d6aae1343b141b6c Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Thu, 5 Jun 2025 11:05:08 +0200
+Subject: [PATCH 1/2] meson: Add libmount feature
+
+Let's reduce the dependencies required to build just libsystemd by
+making libmount optional. The meson disabler feature makes this quite
+trivial.
+
+Upstream-Status: Backport [d1ee3889cf8e8a9edc82e41d306155fb4c531c8f]
+Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 2 ++
+ tools/oss-fuzz.sh | 2 +-
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 957e00ecad..594fadbb37 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1179,7 +1179,9 @@ else
+ endif
+ 
+ libmount = dependency('mount',
+-                      version : fuzzer_build ? '>= 0' : '>= 2.30')
++                      version : fuzzer_build ? '>= 0' : '>= 2.30',
++                      disabler : true,
++                      required : get_option('libmount'))
+ 
+ libfdisk = dependency('fdisk',
+                       version : '>= 2.32',
+diff --git a/meson_options.txt b/meson_options.txt
+index f30b3f5238..f292732d62 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -471,6 +471,8 @@ option('dbus', type : 'feature', deprecated : { 'true' : 'enabled', 'false' : 'd
+        description : 'libdbus support (for tests only)')
+ option('libarchive', type : 'feature',
+        description : 'libarchive support')
++option('libmount', type : 'feature',
++       description : 'libmount support')
+ 
+ option('bootloader', type : 'feature', deprecated : { 'true' : 'enabled', 'false' : 'disabled' },
+        description : 'sd-boot/stub and userspace tools')
+diff --git a/tools/oss-fuzz.sh b/tools/oss-fuzz.sh
+index df3d39eba6..b7a70207df 100755
+--- a/tools/oss-fuzz.sh
++++ b/tools/oss-fuzz.sh
+@@ -32,7 +32,7 @@ meson_args=("-Db_lundef=false")
+ if [ -z "$FUZZING_ENGINE" ]; then
+     meson_args+=("-Dllvm-fuzz=true")
+ else
+-    meson_args+=("-Doss-fuzz=true" "--auto-features=disabled")
++    meson_args+=("-Doss-fuzz=true" "--auto-features=disabled" "-Dlibmount=enabled")
+ 
+     apt-get update
+     apt-get install -y gperf m4 gettext python3-pip \
diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-core/systemd/systemd_257.6.bb
index 9092d02c5109..d73c0cfe0d8b 100644
--- a/meta/recipes-core/systemd/systemd_257.6.bb
+++ b/meta/recipes-core/systemd/systemd_257.6.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
+DEPENDS = "gperf-native libcap python3-jinja2-native"
 
 SECTION = "base/shell"
 
@@ -29,6 +29,7 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Do-not-create-var-log-README.patch \
+           file://0001-meson-Add-libmount-feature.patch \
            "
 
 # patches needed by musl
@@ -81,6 +82,7 @@ PACKAGECONFIG ??= " \
     idn \
     ima \
     kmod \
+    libmount \
     localed \
     logind \
     machined \
@@ -172,6 +174,7 @@ PACKAGECONFIG[kmod] = "-Dkmod=enabled,-Dkmod=disabled,kmod,libkmod"
 PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false,,ldconfig"
 PACKAGECONFIG[libidn] = "-Dlibidn=enabled,-Dlibidn=disabled,libidn,,libidn"
 PACKAGECONFIG[libidn2] = "-Dlibidn2=enabled,-Dlibidn2=disabled,libidn2,,libidn2"
+PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux,util-linux-mount util-linux-umount"
 # Link udev shared with systemd helper library.
 # If enabled the udev package depends on the systemd package (which has the needed shared library).
 PACKAGECONFIG[link-udev-shared] = "-Dlink-udev-shared=true,-Dlink-udev-shared=false"
@@ -742,7 +745,7 @@ FILES:${PN} = " ${base_bindir}/* \
 
 FILES:${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS:${PN} += "kmod ${VIRTUAL-RUNTIME_dbus} util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck util-linux-swaponoff util-linux-mkswap"
+RDEPENDS:${PN} += "kmod ${VIRTUAL-RUNTIME_dbus} udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck util-linux-swaponoff util-linux-mkswap"
 RDEPENDS:${PN} += "systemd-serialgetty"
 RDEPENDS:${PN} += "volatile-binds"
 
-- 
2.39.5


