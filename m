Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61D2C369A3
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.43389.1744019305988040880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gAncL33f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dxoN023157
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/mBzi19BN+c5jcYziOzqphZqKrEVDSAu/GiQcEW7A8=; b=gAncL33fZxqu+ck2
	yUL5hEJL386XNUHDY2tgyXjmrWT5j0nqgbUi9Xzm0bjNmobsuXC7jjGGBwdbPtGZ
	DucjY0oMWg5hkHLnmh+uuGGd3eUp1myGzbbH49/0d4txMGWXGzxYsy9uKSrEDwjA
	qF6FdNVkQGIxqmcYeC4ez6ArfNIpJTnnJxPIROoM4O5BjnabDR95tu3zIxSp6PuB
	QeK/Ei0m+0EwnBBs8bodXX+wmpklhanM3FXUhPpPhLY/ni4W+96vnssgdXXvUxIw
	ai02pko4JYmdHXNq+533SNHbN4aKHnNBpig5TjKgDk+xe9uXns/gY36HLYVq2kL+
	PCoKpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrbtbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so747510485a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019304; x=1744624104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/mBzi19BN+c5jcYziOzqphZqKrEVDSAu/GiQcEW7A8=;
        b=rsk/WKyTfaJCE3qm52mLMIkjieZR3/7stnq/orBYwF8WyY/jGbRCwDlBcHu3Hu5F+y
         CjzHl42tLI5Pr/LEfrTLJTeNkkolFFJGoj+WTDeMMac5gBcqGp9zpdaVQxLSSSU3vKaX
         kizGgxuQYL+KLlw6tnxAc6cnelOhtx2pb4BLzRfYkqnI2Kf+psjjvTnfl2hcoAkg0c+5
         G0smi6VeqJa5lYnEblGFG+pGb3cTTfriNfpOABugj4L4K999HqoD6fpq+EETEczCDTE9
         UmCzZJ71OwEtaG17DlWNtXmvYv0fgdivG0ESk0RhbdRzq44D40iJLxkuxcHTrlb+omP4
         F32Q==
X-Gm-Message-State: AOJu0Ywn5IfetkdmkysLBwnUyYWhbDMiJOsXcYZe5Cjk+yJK5NLFZFMr
	/7uWTCWPJ+ceWwiWooLmw1sbOHW+KT6/Bk+AKpyGS8vhLGdhiZC8MQGs8gYDR8u81LNcot6xgLN
	HjYJcW6gjKm4h1yu7vXYsSD3WUD5dRV5V5Nmi/5rL8mEj66Fn5rbgAFJ0nhG1ZCS/4OfURpPU8N
	4PSl+tmk1f2kA=
X-Gm-Gg: ASbGncvrLarmK8l/2UfoFxh2XSNahb9QiV4srp6DzgP3wDNadOKKfDC2wPu1FA9x4aK
	ewyAtHFIfi0hvRUiMLNwaRoZJlRMIcakqCbm1qMW/pxK6xccLLwCegBs7EZmt2EWTfUFS5IBzIT
	znnflbs7J1rvLfdxFTGY3M19rNzMP5C/VDdhnp3AqlPvoSHs3jGs62i8TSbptssPbnvxz6cDv1d
	5y6URGlYadSaCSELgcA/fcbJDlvZ5372FMhtVksNSDwxeMBid9Tty9r04ssExKg4pDfmEaFCfz/
	iZM5WkPkublWqXl5PX2xYYeya+8M2spPrRHFEkC1Sgi0zt1fT4MMLgn9UvYKkItjEhDYwp8o+yP
	CeP7zHTNEiaD7uGZl/KQyBpcTXnUV
X-Received: by 2002:a05:620a:24d6:b0:7c5:4454:6b05 with SMTP id af79cd13be357-7c774dfae16mr1437973685a.57.1744019303993;
        Mon, 07 Apr 2025 02:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSTFQ31YBtQ1L6ZgqhR2Sh+ZMSUhNNx+xDotyS7npxx1ZB89rK0ZbiahdYilS9OGiujxysoA==
X-Received: by 2002:a05:620a:24d6:b0:7c5:4454:6b05 with SMTP id af79cd13be357-7c774dfae16mr1437971985a.57.1744019303617;
        Mon, 07 Apr 2025 02:48:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:13 +0300
Subject: [PATCH v6 08/13] llvm: support building libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-8-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6305;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AydZ/Mu4jxW+KFGGPRugE4TFjjxfMXOu/xoP29QLlK8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859X2+tteS7YBSV0Uu1t42zCcL9alEhF9Zxe5
 6Y0YVso6fqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfVwAKCRCLPIo+Aiko
 1ToqB/4mYq7Oqk8YzaOXC7EkqClYqyKplGStMU18RsoRMCI3rUHrMeyJ2KvD1g9PfKn6bBMyT1x
 NMJFzriFeePvCtoPIi2KhxKhthsN0kRdBAZLbANiPvqAARov1B/WwPcXmCDfLTnyA3F+T8k2Bjl
 k8ml3N/tqnKJ0pCmKRTfco8pGlH1M2vQcAX+adKafPKc/8zwJR8X0C11DUpbxblPP82faAlA4ha
 nn8kWsijPFf99psFGhOu4/ybr7kdZAIsFEqg24bx/1uuYsKlEkwKUXAOS21KfX8HVDkJaBGcYF/
 MAVRSBdKzTV6nY7vMAHX85ffziOwoTeGkcxcJjDyumuoeDEF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HDdmcU2DOi_sbN5I1ovCwk_vBwd2dmhe
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f39f69 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Twlkf-z8AAAA:8 a=EUspDBNiAAAA:8 a=-uxSO3zEkdLPsdym20oA:9 a=QEXdDO2ut3YA:10 a=a97rIl97qucA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-GUID: HDdmcU2DOi_sbN5I1ovCwk_vBwd2dmhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=615 bulkscore=25 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=25 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214437

Current Mesa requires libclc in order to build Intel Gallium (iris) or
Vulkan drivers. In order to unblock Mesa updates, build libclc as a part
of the LLVM build process.

The libclc requires Clang for building, so enable Clang too via
LLVM_PROJECTS. Remove clang from the DESTDIR, so that it is only used
during the build process. Proper handling of Clang as a toolchain is a
separate and much more complicated topic. Clang is enabled for all kinds
of builds as it is a requirement for libclc to build.

Cleaning of ${datadir} has been moved to happen at the end of do_install
to be performed after do clang removal and made not to fail if
${datadir} is not empty, as libclc install files into that location.

NVPTX and SPIRV targets are enabled since they are required for the
libclc to link.

LLVM_NATIVE_TOOL_DIR is used to pass a path to the native tools built
via llvm-native instead of building them during the target and/or
nativesdk build.

The llvm-clc package is set to RPROVIDE libclc (and the recipe also
PROVIDEs libclc) in order to be compatible with the meta-clang packages
(and to be future-compatible with the split package after proper Clang
support is introduced to OE-Core).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.1.bb | 39 +++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 69f19aee59388f92c254c1f049622845713f4e94..d33284c90180de60d5087b466304a94bd8ae6039 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -59,19 +59,21 @@ def get_llvm_arch(bb, d, arch_var):
 def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
-PACKAGECONFIG ??= "libllvm"
+PACKAGECONFIG ??= "libllvm libclc"
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
 PACKAGECONFIG[libllvm] = ""
+PACKAGECONFIG[libclc] = ""
 
 #
 # Default to build all OE-Core supported target arches (user overridable).
 #
-LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
+LLVM_TARGETS ?= "AMDGPU;NVPTX;SPIRV;${@get_llvm_host_arch(bb, d)}"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
 
+LLVM_PROJECTS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'clang;libclc', '', d)}"
 
 BUILD_CPPFLAGS += "-include ${UNPACKDIR}/isoc23.h"
 
@@ -88,6 +90,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DCMAKE_BUILD_TYPE=Release \
+                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
                  "
 
 EXTRA_OECMAKE:append:class-target = "\
@@ -95,6 +98,7 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                  "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -102,6 +106,7 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DLLVM_HOST_TRIPLE=${SDK_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                  "
 
 # patch out build host paths for reproducibility
@@ -130,17 +135,39 @@ do_install() {
 
         # Remove opt-viewer: https://llvm.org/docs/Remarks.html
         rm -rf ${D}${datadir}/opt-viewer
-        rmdir ${D}${datadir}
 
         # reproducibility
         sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
     fi
+
+    # Remove clang bits from target packages, we are not providing it for the system
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
+       [ "${CLASSOVERRIDE}" != "class-native" ] ; then
+        rm -f  ${D}${bindir}/clang*
+        rm -fr ${D}${libdir}/clang
+        rm -fr ${D}${datadir}/clang
+
+        rm -f  ${D}${bindir}/scan*
+        rm -fr ${D}${libdir}/libscanbuild
+        rm -fr ${D}${datadir}/scan-build
+        rm -fr ${D}${datadir}/scan-view
+
+        rm -fr ${D}${libdir}/libear
+    fi
+
+    # Try to clean up datadir if it is empty, but don't fail if there are
+    # libclc files there
+    rmdir ${D}${datadir} || true
 }
 
 do_install:append:class-native() {
 	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
 	ln -sf llvm-config${PV} ${D}${bindir}/llvm-config
+
+        if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} ; then
+            install -D -m 0755 ${B}/bin/prepare_builtins ${D}${bindir}/prepare_builtins
+        fi
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
@@ -152,9 +179,11 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc"
+PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
+RPROVIDES:${PN}-clc = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
 
 FILES:${PN}-bugpointpasses = "\
     ${libdir}/BugpointPasses.so \
@@ -187,6 +216,8 @@ FILES:${PN}-staticdev += "\
     ${libdir}/*.a \
 "
 
+FILES:${PN}-clc += "${datadir}/clc"
+
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"

-- 
2.39.5


