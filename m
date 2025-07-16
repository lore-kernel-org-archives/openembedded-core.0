Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19983C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 23:30:00 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.36379.1752708598748211256
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 16:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RWKEwx6s;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: hiagofranco@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-615a4b504b2so93678eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 16:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752708598; x=1753313398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsr3Jk24RW6kxbOXRj/MTOROLSAaLsM5lK8Om9QOPyc=;
        b=RWKEwx6s7bp3WlZldZdc48ToVx3FBz1lwpNd3MFhp8mXFGk3liEADgFX8l88G6OhLF
         Y1ZQ3nNCWy6LA/2PG1WPMn9WbZPWT6D4xGAoaTwGK5wPrM/KazmDU6dAc5cVLDWYbJpl
         sdDF1wpO9UqG1TyURDimB4BuguuKlPRjLVCFNHazJ55OUimQR0i5LSnHTYa7Wpk/3OSl
         VHOX5Glr5nYoTSI0qP3493Sa5Dd1Xhnf36YSTtfzR++Yrf1mnGQ0eCZMap9+rHXptwbG
         +4qaSJZOa/3JrbuwVEwp8IKm4xHIEX7MeZNcPRFMDpBzrDI5IGR5nn6ypFZpGGeNbBDQ
         JZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752708598; x=1753313398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsr3Jk24RW6kxbOXRj/MTOROLSAaLsM5lK8Om9QOPyc=;
        b=ALMYXMvBxqLCmIpnkKBc/LiFH1Q9U7ToG2kiq1wSTptEgK6bXnY+RSqwKIaog+6qea
         0vyhyi6fKeXU0mA+8U+1bcX9WRLD6H8jWt7kP02RngE7fd3WJEGVvvY71FLt3uwS6K0H
         D1xBeXiSMpk1Ol/vGC+LCsLhg21fYrZXYDNun+SOiICSsUG68qgpuzkajJi/wVbDdBux
         JkmMyeMjq6ATjsEcpBHnmRsqBCcpXjLLmDHT4PcUfycnKFqlx8jufnIraL8ITWkqeUn+
         DWq1CihEPI9+v7MhMqu+QLSyQyxRxWyc29E58hFu/nT7tePjgVmWsuJOeciYir8phdRz
         LAGA==
X-Gm-Message-State: AOJu0YzCjS1ONedPd5yEa1QZJMeqQ2PVj7LY5uC+xz1cp2M2+f+5Jl6U
	tF0KO3I0kDxfZ7LCQL9B0chKlgfMX9PfhT+4iNw/ekKhGp5sehdhgdnLdXJfTA5h
X-Gm-Gg: ASbGnctF/QgU2Pl16gWqKolXyzErN82lTVLkfoj8WjjnNqK8YsR2ZTuDD+OdaNl8pJQ
	MbD6/3pu+2S8ZTAKur41omIwRbLbwQiOGxFKvgFOvu3T06HiNiWYsjsWpoDh+3zcgACEIrIRVc1
	7fDe/E+YE+Ho9hnYrg4fOO3y1dmqqThv5h6I2TV+iqtDllq1lISwCwX8KWDYenxwc7pOgSMXbqz
	Jpe/OfPvn0/1JudAY6WTGM1BodjOmvkz5/Qw6Yd1hMtAXKyGz56CXbAl1ODv9uxdHVSLG3XcUBU
	/r0m+1lp1NcB0/AQnCF9sGJkorGrYnf/d6WviIv10W0rU1sIwKAQnzn8zOZsdkxDgLKlp1SCkOe
	av0RLzXpp8dH4YzWxmudEtvi6l7LkNVecRsfybw==
X-Google-Smtp-Source: AGHT+IEcQQdtGEtcmYVxQIv4or1d5zfFdg2Ws9aSl8DpP3Dgjh5v7VyXHGT4Be6ATcQJ0iqZyPEXEQ==
X-Received: by 2002:a05:6808:2f12:b0:41c:5633:753b with SMTP id 5614622812f47-41d004fe1bfmr3961336b6e.0.1752708597484;
        Wed, 16 Jul 2025 16:29:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41bf05447fesm1441268b6e.36.2025.07.16.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 16:29:57 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH 1/2] systemd: drop build dependency on util-linux
Date: Wed, 16 Jul 2025 20:29:30 -0300
Message-Id: <20250716232931.127811-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716232931.127811-1-hiagofranco@gmail.com>
References: <20250716232931.127811-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 23:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220476

From: Hiago De Franco <hiago.franco@toradex.com>

The libmount dependency was made optional on systemd upstream [2]. By
backporting this upstream change, we can drop util-linux as a build
dependency for systemd, making it only as a runtime dependency.

This is important to fix a circular dependency between util-linux and
systemd when util-linux is built with the systemd PACKAGECONFIG enabled.
Without this change, each recipe depends on the other, triggering the
circular dependency error.

[1] https://github.com/systemd/systemd/blob/main/README#L216
[2] https://github.com/systemd/systemd/commit/d1ee3889cf8e8a9edc82e41d306155fb4c531c8f

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 .../0001-meson-Add-libmount-feature.patch     | 58 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_257.6.bb    |  7 ++-
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch b/meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch
new file mode 100644
index 000000000000..b04acd6fef08
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-Add-libmount-feature.patch
@@ -0,0 +1,58 @@
+From 821c809e1e1e449f5a2fe591d6aae1343b141b6c Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Thu, 5 Jun 2025 11:05:08 +0200
+Subject: [PATCH] meson: Add libmount feature
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


