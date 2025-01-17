Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA99C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 22:07:43 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.6886.1737151100371757638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 13:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=K9QvAuve;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLwJJ9256166
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 15:58:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737151099;
	bh=EJbkjSwuB9pCg6NW36OYttVcMdT8rkfXhJ45JWCdecI=;
	h=From:To:CC:Subject:Date;
	b=K9QvAuvepRtLVRAdLPsLAdudQt5/JQV4+4+QquvArOQRivK8Ge5kaX6f2DzAEzHhF
	 Yr5xWql3iU+XItO5Sn410zjnxI6ucPn9n0i9f+X88B/lLXRcaT55XcTRiYdSnSNYAq
	 7AW07QRC7CG8aV0q+9e4WkIKFuPmAmt3QMKuEPuU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLwJcT002877
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 15:58:19 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 15:58:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 15:58:19 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HLwJZo064059;
	Fri, 17 Jan 2025 15:58:19 -0600
From: a-christidis@ti.com
To: <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [master][PATCH] opencl-cts: add recipe
Date: Fri, 17 Jan 2025 15:58:18 -0600
Message-ID: <20250117215818.445740-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 22:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209998

From: Antonios Christidis <a-christidis@ti.com>

This recipe provides the opecl-cts suite.  This is a pre-release version
v2024-08-08, which I have tested to work with opencl-headers version v2024.05.08
. The pre-release version was picked due to incompatibility issues with other
versions of headers. Commits past the pre release will run into issues with 
CL_UNORM_INT_2_101010_EXT  

The recipe also includes a patch, to allow it to compile and build properly.
Further information below.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../files/0001-Ignore-Compiler-Warnings.patch | 36 +++++++++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 24 +++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb

diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
new file mode 100644
index 000000000..38016789b
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -0,0 +1,36 @@
+From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Fri, 17 Jan 2025 15:05:39 -0600
+Subject: [PATCH] Ignore Compiler Warnings
+
+
+Upstream repo is using Ubuntu 20.04 to build. Their compiler is old enough to
+to not catch these warnings. While our distro compiler is capable of catching 
+them, resulting in compilation failures. Thus change the build system to ignore
+the warnings. Resulting in no errors (-Werror flag enabled).  
+
+Upstream-Status: Inappropriate [oe specific - compilation errors due to cross-compiling]
+
+Singed-Off-By: Antonios Christidis <a-christidis@ti.com>
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
index 000000000..aa0e090db
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
@@ -0,0 +1,24 @@
+SUMMARY = "OpenCL CTS"
+DESCRIPTION = "OpenCL CTS test suite"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pkgconfig cmake
+
+DEPENDS += "opencl-headers opencl-icd-loader"
+RDEPENDS:${PN} += "python3-core"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main \
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
+}
-- 
2.34.1


