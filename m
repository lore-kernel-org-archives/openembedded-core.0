Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FDFC5321D
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:30 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.9386.1724319329965569350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HC+6ujWV;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bef295a45bso599430a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319328; x=1724924128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpOvKCj6XHSMfNq9p034a12/TkVtC3jSIDx5YgACMks=;
        b=HC+6ujWVPYbJQ6Y9uCVtIAPJELDgVP1NFU6Xvo6alQSKXtpHhveS6Q6NoU91FQrQnI
         HvVRcLhLjnsrojt03wGnMgdt3byy6rZBaPzC9RzCtJuLr+iKos8xmc453oBsPKSTaNhd
         /paDTcYeUDYM7565kMy3HkmQO5GuEd9HXOAm3N2hAe1xtNUHWYNB2nz//Y7t167OaxjV
         S3rYWE3jiTkgbYm0A5HtCITp+E1L9+ZO9cWyujBrkIbihz4zjiUtq1giCTxrG44D60Rs
         YOaBObCE9yTXEZljVFTkSTSuncwngTxvSls90j5am/ttsR9O1IEonZh1GrEsneov78tT
         vpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319328; x=1724924128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpOvKCj6XHSMfNq9p034a12/TkVtC3jSIDx5YgACMks=;
        b=Y5meUNhdTdekOQKWHd/rYXlCAd6pcdAEaG9cd+C3yjJ2588G/9puc83yCvXUvX2KWR
         Qrf7RwSudW34sfxYHKWTw/XGCTLgigm1q/I9Tm9Dq3ldTLZeMj6dYG0y64sgTxjG0vKL
         teTH23oQhwt4Q2E84oPcFPCsJx+GNb83hjLO0BbihLwDe3H8jmhDcLE1dUT7w7TM8vzY
         JCPjoM+d3AW9RVo07M2DYtqzgVVNr4N8ntN+OMkYpsWijwIf6aEhLCWQTE0x0P0g8r/k
         APju/YBpqu9hjEdoVQvMK3I6TG66teFgORfaPnrfRy8Hjtyd/2EC3uCDV4wMOsYTEbUj
         Qmhg==
X-Gm-Message-State: AOJu0Yze4opk4hTS350LpMUl8nMRwZ50awbj87Rp3StUUo387QSL7zWb
	5dcDevmRQWkfYmPWqwWCkVCjLzlNSw1FadC/VduDMbB5CCvN3MknhU7C0w==
X-Google-Smtp-Source: AGHT+IGMpe86iUYPu+fVrQnsmiDWMtsp3V8Kg/yeFpAiu+y/iKwh2S381/k/GVaknRWZLZ1EpvL/mA==
X-Received: by 2002:a05:6402:2111:b0:5be:d913:863b with SMTP id 4fb4d7f45d1cf-5c0791d117emr1396204a12.4.1724319327805;
        Thu, 22 Aug 2024 02:35:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/32] boost: upgrade 1.85.0 -> 1.86.0
Date: Thu, 22 Aug 2024 11:34:53 +0200
Message-Id: <20240822093521.36790-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203619

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../boost/{boost-1.85.0.inc => boost-1.86.0.inc}     |  2 +-
 ...native_1.85.0.bb => boost-build-native_1.86.0.bb} |  4 ++--
 ...-up-arch-instruction-set-flags-we-do-that-o.patch |  6 +++---
 .../0001-dont-setup-compiler-flags-m32-m64.patch     | 12 +++++++-----
 .../boost/boost/boost-math-disable-pch-for-gcc.patch |  2 +-
 .../boost/{boost_1.85.0.bb => boost_1.86.0.bb}       |  0
 6 files changed, 14 insertions(+), 12 deletions(-)
 rename meta/recipes-support/boost/{boost-1.85.0.inc => boost-1.86.0.inc} (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.85.0.bb => boost-build-native_1.86.0.bb} (82%)
 rename meta/recipes-support/boost/{boost_1.85.0.bb => boost_1.86.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.85.0.inc b/meta/recipes-support/boost/boost-1.86.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.85.0.inc
rename to meta/recipes-support/boost/boost-1.86.0.inc
index c2380bba6ec..2378b27575b 100644
--- a/meta/recipes-support/boost/boost-1.85.0.inc
+++ b/meta/recipes-support/boost/boost-1.86.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "7009fe1faa1697476bdc7027703a2badb84e849b7b0baad5086b087b971f8617"
+SRC_URI[sha256sum] = "1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost-build-native_1.85.0.bb b/meta/recipes-support/boost/boost-build-native_1.86.0.bb
similarity index 82%
rename from meta/recipes-support/boost/boost-build-native_1.85.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.86.0.bb
index b333c7c81a3..764f4107805 100644
--- a/meta/recipes-support/boost/boost-build-native_1.85.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.86.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "b0311a0d4f3bb0f93d06d3c6faca510c7f5a2012"
+SRCREV = "4a52d8c06635435b64e31a56eaf7ca5dc912a71d"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
@@ -21,7 +21,7 @@ do_compile() {
 }
 
 do_install() {
-    HOME=/var/run ./b2 install --prefix=${prefix} staging-prefix=${D}${prefix}
+    HOME=/var/run ./b2 install --prefix=${D}${prefix}
 }
 
 # The build is either release mode (pre-stripped) or debug (-O0).
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index fffc675b08b..78f652f619c 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From 0130a1c0d8ba3c0d59258cb79e8b4a04fe6d8eec Mon Sep 17 00:00:00 2001
+From f88354966fe3af33fd6d9ec889a8e3926b886a8a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 153 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index e5f8f53a4..0186545e8 100644
+index b7825d4e6..ed7e39baf 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1111,156 +1111,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1144,156 +1144,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
index 1b01a04c6d9..8f130348b0a 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -1,4 +1,4 @@
-From 9c3d6fa3544ca7bd6d8c4f4edbb62282cbc35861 Mon Sep 17 00:00:00 2001
+From 7130850d74863d1e9a0ae3e85462f1466bdf6d88 Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 14 Nov 2019 10:13:53 +0800
 Subject: [PATCH] dont setup compiler flags -m32/-m64
@@ -9,14 +9,14 @@ Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
- tools/build/src/tools/gcc.jam | 14 --------------
- 1 file changed, 14 deletions(-)
+ tools/build/src/tools/gcc.jam | 16 ----------------
+ 1 file changed, 16 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 0186545e8..ba33c4086 100644
+index ed7e39baf..90513f84a 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -360,20 +360,6 @@ local rule compile-link-flags ( * )
+@@ -377,22 +377,6 @@ local rule compile-link-flags ( * )
      compile-link-flags <link>shared/<target-os>$(non-windows) : -fPIC ;
  }
  
@@ -29,6 +29,8 @@ index 0186545e8..ba33c4086 100644
 -    compile-link-flags <target-os>hpux/<address-model>64 : -mlp64 ;
 -
 -    local generic-os = [ set.difference $(all-os) : aix hpux ] ;
+-    compile-link-flags <target-os>$(generic-os)/<architecture>s390x/<address-model>32 : -m31 ;
+-    compile-link-flags <target-os>$(generic-os)/<architecture>s390x/<address-model>64 : -m64 ;
 -    local arch = power sparc x86 ;
 -    compile-link-flags <target-os>$(generic-os)/<architecture>$(arch)/<address-model>32 : -m32 ;
 -    compile-link-flags <target-os>$(generic-os)/<architecture>$(arch)/<address-model>64 : -m64 ;
diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
index 9cb671e0134..dde21fa0763 100644
--- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -1,4 +1,4 @@
-From a61dd2b1336c06d232df58212ece88067e8a80bb Mon Sep 17 00:00:00 2001
+From c6009cdc1fe76db0092443593396e4d5f0eaa86b Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Fri, 23 Sep 2016 01:04:50 -0700
 Subject: [PATCH] boost-math: disable pch for gcc
diff --git a/meta/recipes-support/boost/boost_1.85.0.bb b/meta/recipes-support/boost/boost_1.86.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.85.0.bb
rename to meta/recipes-support/boost/boost_1.86.0.bb
-- 
2.39.2


