Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.344.1590534641845077910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 16:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YHpN49my;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id v63so10871318pfb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 16:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jwKn0YhRgxgI+q0Tl/wZ1NAfW/CgycW9dOPsnCYGqR0=;
        b=YHpN49myvzU5PWgx1fhA/TBFFC+ocuQ9759Etyw62ZWsTUd4BFJnrsb6AB3t2G0I97
         3wsXgk1OhUMziJww3r4zlVtJLg/OBFpOHNsLgj1Iom0L+efI89vbFmy3Aw5vDvp12Rm1
         RLOoE7r5VnO5Mj0bgVthxmWeHR2fcaIWjyu5buAqIbHImUsOk+DuuPwXewzujv9aqU64
         HS1KyOgTYDWt4OK0Ix5Gy00KoOkuHsedu3c2Mmn9r4VLIMeKIO1fWaKAGAHgFK//eD7q
         cq7PKWWppW6OIDO8ODEannaid9D9Dwaj4YsLnuGJF5yHEySAkB/pc7xps4tflOZ68tsP
         zUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jwKn0YhRgxgI+q0Tl/wZ1NAfW/CgycW9dOPsnCYGqR0=;
        b=eK6Q5DY+6Gffb5Qjyim9PJqyMMIjw5C/VM+HIJVnZSRqaDdKztEtN9mNvmxrEvIFPq
         M8W+6vnNJPI3FmJ4RmJ5MlHyo1ucZHI9kDznoAU73nXj0DE8F6hdU7jKJf7r6siORMi5
         CRQHLXXss071udGF7ZT8jRxb8mvemHZWa8SfGcxHK9ReyQAmOS/ZE+Xeign+0Nd1QXpr
         rlJEQzceA9ENr+thGhhpHfFzErW6xAa7aFwE5B8hwMdQjDpj3bY/H3RKEV8EKVMsVBhS
         OA6BjtvCmiWZ0WX3siyrQGlq1F/PPbJgOpykz/bz7Flo2+OgCsIHNmaP9bsDnZsj6Xsm
         RE9g==
X-Gm-Message-State: AOAM531vIBp3A5UjQivEb0Bxfpxa9Iy4wKCE8SIWjvT9Z6p1Ip9nRWZ6
	hBUB+sfnaHl8AenVWp2biWv86H9mWps=
X-Google-Smtp-Source: ABdhPJwI9lNIvtXY4ZzmAFSVUu37Tr35rQo5yznVJupIKBxFXLogXH0GtDw2YVU2GbT2CSocpKzM/A==
X-Received: by 2002:a63:7453:: with SMTP id e19mr1123534pgn.139.1590534640757;
        Tue, 26 May 2020 16:10:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3faa])
        by smtp.gmail.com with ESMTPSA id x191sm516426pfd.37.2020.05.26.16.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 16:10:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH V2] armv8/tunes: Set TUNE_PKGARCH_64 based on ARMPKGARCH
Date: Tue, 26 May 2020 16:10:37 -0700
Message-Id: <20200526231037.2626327-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The setting is to modify TUNE_PKGARCH which is filled with
TUNE_PKGARCH_64 or TUNE_PKGARCH_32 in arm-arch64.inc
This lets higher up tune files for arm64 SOCs override them if needed,
this can help building multiple armv8 machines with different tunes in
same workspace.

No need to set TUNE_PKGARCH in tune files as it is synthesized from ARMPKGARCH

Add ARMPKGARCH for aarch64 tunes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Differentiate triplet for crypto feature

 meta/conf/machine/include/arm/arch-arm64.inc           | 4 +++-
 meta/conf/machine/include/tune-cortexa53.inc           | 5 +----
 meta/conf/machine/include/tune-cortexa55.inc           | 1 -
 meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 1 -
 meta/conf/machine/include/tune-cortexa57.inc           | 4 +---
 meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 4 +---
 meta/conf/machine/include/tune-cortexa72.inc           | 1 -
 meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 4 +---
 8 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 53f4566815..6d5b22fff0 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -12,6 +12,8 @@ ARMPKGARCH_tune-aarch64 ?= "aarch64"
 ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"
 TUNE_FEATURES_tune-aarch64 = "aarch64"
 TUNE_FEATURES_tune-aarch64_be = "${TUNE_FEATURES_tune-aarch64} bigendian"
+TUNE_PKGARCH_64_tune-aarch64 = "aarch64"
+TUNE_PKGARCH_64_tune-aarch64_be = "aarch64_be"
 BASE_LIB_tune-aarch64 = "lib64"
 BASE_LIB_tune-aarch64_be = "lib64"
 
@@ -20,7 +22,7 @@ PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
 
 ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '_be', '', d)}"
 TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
-TUNE_PKGARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
+TUNE_PKGARCH_64 = "${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}"
 ABIEXTENSION_64 = ""
 TARGET_FPU_64 = ""
 
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
index b7327d00c4..c0bb28a19e 100644
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -8,14 +8,11 @@ require conf/machine/include/arm/arch-armv8a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa53 cortexa53-crypto"
 ARMPKGARCH_tune-cortexa53             = "cortexa53"
-ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53"
+ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53-crypto"
 TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
 TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
 
-TUNE_PKGARCH_tune-cortexa53 = "cortexa53"
-TUNE_PKGARCH_tune-cortexa53-crypto = "cortexa53-crypto"
-
 BASE_LIB_tune-cortexa53               = "lib64"
 BASE_LIB_tune-cortexa53-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
index 274944819e..89032b59ec 100644
--- a/meta/conf/machine/include/tune-cortexa55.inc
+++ b/meta/conf/machine/include/tune-cortexa55.inc
@@ -9,6 +9,5 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa55"
 ARMPKGARCH_tune-cortexa55             = "cortexa55"
 TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc crypto"
-TUNE_PKGARCH_tune-cortexa55           = "cortexa55"
 PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55"
 BASE_LIB_tune-cortexa55               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
index b95d63e86b..ba4b073852 100644
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -11,6 +11,5 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa57-cortexa53"
 ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
 TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 cortexa57-cortexa53"
-TUNE_PKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57-cortexa53"
 BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
index e8ddeb5786..0811d503cc 100644
--- a/meta/conf/machine/include/tune-cortexa57.inc
+++ b/meta/conf/machine/include/tune-cortexa57.inc
@@ -8,12 +8,10 @@ require conf/machine/include/arm/arch-armv8a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa57 cortexa57-crypto"
 ARMPKGARCH_tune-cortexa57             = "cortexa57"
-ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57"
+ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57-crypto"
 TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
 TUNE_FEATURES_tune-cortexa57-crypto   = "aarch64 cortexa57 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
 PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
-TUNE_PKGARCH_tune-cortexa57 = "cortexa57"
-TUNE_PKGARCH_tune-cortexa57-crypto = "cortexa57-crypto"
 BASE_LIB_tune-cortexa57               = "lib64"
 BASE_LIB_tune-cortexa57-crypto        = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index fd1ffeb177..e857f875ff 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -10,13 +10,11 @@ require conf/machine/include/arm/arch-armv8a.inc
 # cortexa72.cortexa53 implies crc support
 AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
 ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
-ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
+ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53-crypto"
 TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-cortexa53"
 TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "aarch64 crc crypto cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
-TUNE_PKGARCH_tune-cortexa72-cortexa53                = "cortexa72-cortexa53"
-TUNE_PKGARCH_tune-cortexa72-cortexa53-crypto         = "cortexa72-cortexa53-crypto"
 BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
 BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
 
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 23640d5c1f..00f7745a22 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -10,5 +10,4 @@ AVAILTUNES += "cortexa72"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
 TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-TUNE_PKGARCH_tune-cortexa72           = "cortexa72"
 BASE_LIB_tune-cortexa72               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
index ab87c88747..ba2b9b1951 100644
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -10,13 +10,11 @@ require conf/machine/include/arm/arch-armv8a.inc
 # cortexa73.cortexa53 implies crc support
 AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
 ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
-ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53"
+ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53-crypto"
 TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-cortexa53"
 TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "aarch64 crc crypto cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
-TUNE_PKGARCH_tune-cortexa73-cortexa53                = "cortexa73-cortexa53"
-TUNE_PKGARCH_tune-cortexa73-cortexa53-crypto         = "cortexa73-cortexa53-crypto"
 BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
 BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
 
-- 
2.26.2

