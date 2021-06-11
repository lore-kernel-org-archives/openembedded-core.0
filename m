Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.3693.1623381568223078423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15B3JQ80030817
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 20:19:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 10 Jun 2021 20:19:26 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 10 Jun 2021 20:19:25 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V3][PATCH] libjpeg-turbo: fix do_compile error on arm
Date: Fri, 11 Jun 2021 11:17:09 +0800
Message-ID: <20210611031709.36356-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
31 | #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
index 7f91cc02ac..afa0ab1be6 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
@@ -40,6 +40,9 @@ EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx3
 # Work around missing non-floating point ABI support in MIPS
 EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "-DWITH_SIMD=False", "", d)}"
 
+EXTRA_OECMAKE_append_class-target_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "", "-DWITH_SIMD=False", d)}"
+EXTRA_OECMAKE_append_class-target_armeb = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "", "-DWITH_SIMD=False", d)}"
+
 # Provide a workaround if Altivec unit is not present in PPC
 EXTRA_OECMAKE_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
 EXTRA_OECMAKE_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
-- 
2.17.1

