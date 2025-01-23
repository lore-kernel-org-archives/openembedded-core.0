Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5729C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:16:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.12591.1737645391272832929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 07:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a9V+AS2N;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NFGU811195366
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 23 Jan 2025 09:16:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737645390;
	bh=I0lt03RfFRIcyzuvdQohUAJKLsxbvJ+8eqX+H1RSJd0=;
	h=From:To:CC:Subject:Date;
	b=a9V+AS2NbTwItUX6wduFxuDtS3WPVjlAs01s87Hm9n3N3MQTbvWs8Bovg2sbduxtB
	 /x4flc1IIsIvFokKCSUNyPut9qkarqsw+elnBPIn3u1cSvk821ndTRNGTev/w/qUqO
	 EQYD90Y896oRNpvDI/wABc3gw4LPiEEPjqjfJfjc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NFGUmU067783;
	Thu, 23 Jan 2025 09:16:30 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 09:16:29 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 09:16:30 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NFGTJ3068662;
	Thu, 23 Jan 2025 09:16:29 -0600
From: <a-christidis@ti.com>
To: <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, <rs@ti.com>
Subject: [master][PATCH v2] opencl-cts: add recipe
Date: Thu, 23 Jan 2025 09:16:29 -0600
Message-ID: <20250123151629.1082925-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210193

From: Antonios Christidis <a-christidis@ti.com>

This recipe provides the opecl-cts suite.  This is a pre-release version
v2024-08-08, which I have tested to work with opencl-headers version v2024.05.08
. The pre-release version was picked due to incompatibility issues with other
versions of headers.

The recipe also includes a patch, to allow it to compile and build properly.
Further information below.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../files/0001-Ignore-Compiler-Warnings.patch | 37 +++++++++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 26 +++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb

diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
new file mode 100644
index 000000000..2515c7f16
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -0,0 +1,37 @@
+From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Fri, 17 Jan 2025 15:05:39 -0600
+Subject: [PATCH] Ignore Compiler Warnings
+
+
+Within the cmake build system, the compiler -Werror flag is enabeled.  This
+turns all warnings into errors and doens't allow the system to compile
+correctly.  Change the system to ignore the 3 warning rules that show up when
+compiling.
+
+Upstream-Status: Inappropriate [oe specific - compilation errors due to cross-compiling]
+
+Singed-off-by: Antonios Christidis <a-christidis@ti.com>
+
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5cfef6b3..71b6ddb4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?Clang"
+     add_cxx_flag_if_supported(-Wno-error=cpp) # Allow #warning directive
+     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
+     add_cxx_flag_if_supported(-Wno-error=asm-operand-widths) # Issue #784
+-
++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
+     # -msse -mfpmath=sse to force gcc to use sse for float math,
+     # avoiding excess precision problems that cause tests like int2float
+     # to falsely fail. -ffloat-store also works, but WG suggested
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
new file mode 100644
index 000000000..f6f4e9466
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
@@ -0,0 +1,26 @@
+SUMMARY = "OpenCL CTS"
+DESCRIPTION = "OpenCL CTS test suite"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pkgconfig cmake
+
+DEPENDS += "opencl-headers opencl-icd-loader"
+RDEPENDS:${PN} += "python3-core python3-io"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
+	   file://0001-Ignore-Compiler-Warnings.patch"
+
+SRCREV = "a406b340913f622da089b00f284a597656c10239"
+
+EXTRA_OECMAKE:append = " -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
+
+do_install() {
+        install -d ${D}${bindir}/opencl_test_conformance
+        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
+        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/opencl_test_conformance/run_conformance.py
+	 find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
+        find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
+}
-- 
2.34.1


