Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E986C74A5B
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 17:47:34 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.15410.1679852847143040634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 10:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NMhlTA9D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso5959133wmb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679852845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3LhUfTpw27NZDVQWdrjUYIMu2n0CaaxkCdW1k0Cr1M=;
        b=NMhlTA9DsyCEBmriEFMhHwnxFHxPdiYDnoNncoy6UIyQRPwIirEsMaaMV5ExbO1lv5
         fTXluFHIMB9wYhpzy1e4HwKWPJwzPzzjZE5yDBj5rQwvdY79wrXyoEr4QQQK6YBasqLR
         adUJXglWMOaMcd+94Zl9BDR3cThyT78yB/rzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679852845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3LhUfTpw27NZDVQWdrjUYIMu2n0CaaxkCdW1k0Cr1M=;
        b=t5Ki99b2KIAwU34DeSn9QGCdUJpKuSdoCjyuKUhk/oEijlawfwqHbdfvW0IAHjEBk7
         M6qDiGdfnCJmZIN/es7qCxFp6XzyDzlHUNHnB4xVQGhBS0CSf7k+AUOFeobkZw7llbJS
         ABfp2goucz4StEMKJ7fivTgaRJzRaXlHEWlAWvdvnRT2P1F/IcPeHWqiQNWyUukkVw19
         yp7wFyFZ6nD3M2WIh+xIQ+8CUglsQBRXQz9DOumzOCMYMZjQwciBUajf0UlUBlVYq4Eq
         GfHmDm4xa1Xwu3ALlYjwlDM1qhTF3KA8rOibvI9LOMVcVp6d5HUe0vwXRN4kTEUvCyZt
         Ejsg==
X-Gm-Message-State: AO0yUKWt3p7xPybchp9kAIAXJ8ippHCCMnNrrMZeYjGdyhV17wIx7Xfc
	bw2oeYr7JcOkf+hpGe2600D9rNIuCn34S24oEek=
X-Google-Smtp-Source: AK7set8J+HdR9/ZPPpk8HkHOSVdMXHsEf4r17+bNcDdP1Hxc9zsSt7pRcanJ+tGMMNgtM7snLBtGsg==
X-Received: by 2002:a7b:c7da:0:b0:3ef:1745:518e with SMTP id z26-20020a7bc7da000000b003ef1745518emr7969473wmk.26.1679852845100;
        Sun, 26 Mar 2023 10:47:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7e91:cdb:75c4:1387])
        by smtp.gmail.com with ESMTPSA id t9-20020a1c7709000000b003ed1ff06faasm11054391wmi.19.2023.03.26.10.47.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 10:47:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] abi_version/sstate: Handle pkgconfig output changes and bump output versions
Date: Sun, 26 Mar 2023 18:47:23 +0100
Message-Id: <20230326174723.2287560-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 17:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179133

A recent package.py change has highlighted some corruption issues with -dev
pkgconfig package dependencies. Bump the output versions to trigger a rebuild
and ensure everything is consistent.

Take the opportunity to also drop all HASHEQUIV_HASH_VERSION entries since the
main version is changing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/package.bbclass                            | 2 +-
 meta/classes-global/sstate.bbclass                             | 2 +-
 meta/conf/abi_version.conf                                     | 2 +-
 meta/recipes-core/glibc/glibc-common.inc                       | 2 --
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb          | 2 --
 meta/recipes-devtools/perl/liberror-perl_0.17029.bb            | 2 --
 meta/recipes-extended/mc/mc_4.8.29.bb                          | 3 ---
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb     | 3 ---
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb          | 2 --
 .../recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb | 3 ---
 10 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 21461ff314b..9c3bd06a921 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -468,7 +468,7 @@ python do_package () {
     # cache.  This is useful if an item this class depends on changes in a
     # way that the output of this class changes.  rpmdeps is a good example
     # as any change to rpmdeps requires this to be rerun.
-    # PACKAGE_BBCLASS_VERSION = "4"
+    # PACKAGE_BBCLASS_VERSION = "5"
 
     # Init cachedpath
     global cpath
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 5b63582b5ae..95373fd60a5 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-SSTATE_VERSION = "10"
+SSTATE_VERSION = "11"
 
 SSTATE_ZSTD_CLEVEL ??= "8"
 
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index c716bd7feba..b6643ea60b3 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "15"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "14"
+HASHEQUIV_HASH_VERSION  = "15"
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index d526a8ca207..b93b55fe77d 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -23,6 +23,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
 PV = "2.37"
-# remove at next version upgrade or when output changes
 PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 297dbfb578b..d93152cedd8 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -100,9 +100,7 @@ SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
 S = "${WORKDIR}/git"
 SRCREV = "868a2afab9da34f32c007d773b77253c93104636"
 
-# remove at next version upgrade or when output changes
 PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
 
 inherit systemd update-rc.d python3native update-alternatives
 
diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
index 67e5811f3c2..9585dfc2c61 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
@@ -9,9 +9,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
 
-# remove at next version upgrade or when output changes
 PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
 
 DEPENDS += "perl"
 
diff --git a/meta/recipes-extended/mc/mc_4.8.29.bb b/meta/recipes-extended/mc/mc_4.8.29.bb
index 7aac352ab5e..e7f4aacc2e0 100644
--- a/meta/recipes-extended/mc/mc_4.8.29.bb
+++ b/meta/recipes-extended/mc/mc_4.8.29.bb
@@ -14,9 +14,6 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            "
 SRC_URI[sha256sum] = "ba6b2d8752806ac23fe045c1b081eb66dcefa6159205c79f86c005dcaf9941c1"
 
-# remove at next version upgrade or when output changes
-HASHEQUIV_HASH_VERSION .= ".2"
-
 inherit autotools gettext pkgconfig
 
 #
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 1f1ad83e0bc..d3d1cfde60c 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -12,9 +12,6 @@ PR = "r8"
 
 inherit allarch fontcache
 
-# remove at next version upgrade or when output changes
-HASHEQUIV_HASH_VERSION .= ".1"
-
 FONT_PACKAGES = "${PN}"
 
 SRC_URI = "${GNOME_MIRROR}/ttf-bitstream-vera/1.10/ttf-bitstream-vera-${PV}.tar.bz2"
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 88f534ccf7d..babde4b0998 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -14,8 +14,6 @@ SOURCE_DATE_EPOCH = "1613559011"
 
 PE = "1"
 PR = "r4"
-# remove at next version upgrade or when output changes
-HASHEQUIV_HASH_VERSION .= ".1"
 
 inherit allarch features_check
 
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
index 3fb8c6b1479..6cef8c068c8 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
@@ -13,9 +13,6 @@ SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;p
 SRCREV = "4544e11320138ac02797af81766f4476a71bb09f"
 S = "${WORKDIR}/git"
 
-# remove at next version upgrade or when output changes
-HASHEQUIV_HASH_VERSION .= ".2"
-
 do_configure[noexec] = "1"
 
 LDFLAGS += "-Wl,-O0"
-- 
2.38.1


