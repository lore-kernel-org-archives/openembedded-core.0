Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689BFC369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:55:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.25483.1744253710546013160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Iv9kox6M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HJQmt006884
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhbgRMHi43F6BAVFsoITE282IxTPF38L3skl19W1NB8=; b=Iv9kox6MzRgORFXo
	4UwUCaWNSPYQ4Vc2ed4/C7tq99tUihbkxwiG9v+1gs9oOQJR65GsDN1OSfp2a2Y6
	orkc8O+sfy2LErKFnEiRUyMMfUaNwusFFeaJQfOxYWJxendxJbF1TP5q652SK6XT
	0SBf+AI3v/1XGjcWTD1vrPjOTjWce4jxcTwitbqPQsMaWKRTtO+7z5Gb9g6nlY5j
	3WxCphfIh9zlAvLvbYOsF28Msl+3xtjCvFMwiLvmczkGFp3jdLhVnqWfBSr7Vnfb
	FKGgGPtxmjvELHKz6xlsBz8EE0jemsmYdJ9vJve1A/f7kVZr7Art/JNp6jHrn4/L
	5sKzxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3nc8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so87762385a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253708; x=1744858508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhbgRMHi43F6BAVFsoITE282IxTPF38L3skl19W1NB8=;
        b=sMXCgaT+jEqfQAa4iw0Xiya75A2zlLuHN2PU+D/GAeDtY7iSTNN1xTiKZTOGt/RZB7
         O6k0KjRJAGKvQ1MEKuocS2RT5aQ8of3sBuPWHHYWdTZGlj0cv9vPrfts+CrOagtaWaas
         ZJUd9WgPNQDD4D+KFC3y+HjyhvP3fpn82lkfvpY6MlqopMbj09TV7lgmpoVqsgfvZ00n
         /VVmklwXnoNJ9VK20Lu4pxlCO+XWyTVtOfARfv4kLsGJ3awm+SK+iyeOe2c5wE+sOwdf
         S0oqkwATI+NW7lk3+YH/yUGsUYrkOAdhUr3oM+HaSLBZZnvmDMzgjKMF/kB5AjA380l3
         hASQ==
X-Gm-Message-State: AOJu0YwVlUKYHRGuhPt0qdd70+zu24hs2EumOvGEYtxJMgoWocqz1Vys
	Hv4kUPCCpVk7zUW2rnhIPsdBh8mCxNAOJwQ/uB+BQ0I8DvtX4MiNrfDQ5pNQSqPzjJWNTEtloFB
	2PY9Ubc90DmAwdiA6wxvi7OzEgqxoCJCY35dDgIN3A0vy2PES1gz9m4H3BoUW7YhPJGtreBtpL6
	wOr8cl5KISqp8=
X-Gm-Gg: ASbGncs3ybvGh/oksrG19vrUpIfRkC0hN0fwkJbDu4SPo8qk2VUoNOxa6kDrI1ZJmCx
	+QYE/vmDPXl32XU1f3Cqf/nJV79fx74/Fgeno9Egrk/ikK8HtJUv0+30oMCt84SX6DYMrhHmq9B
	BUBeFQQmVHO2gKLE6Qxb8fcmOqF6HIgHVVPCkm0MhIYx8C3vx8qNqQFCBjN3uAbnx7L5k/VgbZu
	JzPosvmVEaQRq/W/KQtHJ3iLlmYQ0ZGK89vrKhsgWCz91G0/i1vZJzxqIr/bn966v5sRJ3+yBkk
	QI8U7FLSDJETYOWM+o+Gy8LNB02L7KjXUl3mZNnaiGuC1y2iShJz++cdsTbZ8ETx+xTAAxHDjU7
	ErnKjB9v1CvtXBIlWvZJkhKRO
X-Received: by 2002:a05:620a:28d1:b0:7c5:5596:8457 with SMTP id af79cd13be357-7c7a76d04abmr164329685a.57.1744253707988;
        Wed, 09 Apr 2025 19:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqIBidXsE3bnRGa90a9HWuSLcR02fwUY93HojEYwuTr8z4SGkj0C/2WhOKJDqNWPLVEH4rxA==
X-Received: by 2002:a05:620a:28d1:b0:7c5:5596:8457 with SMTP id af79cd13be357-7c7a76d04abmr164327885a.57.1744253707613;
        Wed, 09 Apr 2025 19:55:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:55:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:46 +0300
Subject: [PATCH v7 07/12] llvm: support building libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mesa-25-v7-7-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6399;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=u092dSUlsgJaerFAE0RhIpVWb+dlqE4lK+d4UpDu+14=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLxDIm0Dpbmv0by34OeJUZ3YEHFZf9Gokvrf
 xCE6LsNv6KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8QAKCRCLPIo+Aiko
 1QSiB/93UjPpvivy9cZNANG4qRcs2bpU2YImetEu0u5SJMqjmG3NdtX+OF+pTYjAvHAWsCuKZ2r
 YgaXmtGqIpHiBz4Tt7Brarf82usssJUBvJOYO1Z11jL6OzBQu2WpPN7oO91bbxnB5LxF9MAhDR1
 0nqZAX9lrslqCTbocDxvp72/Ff2YwFmSNhN9duMhq+73VsKZYbJg8FcMzS1LLC6De7dfzFzGFXd
 xNV2RfwzHXl2b7kFIonG6cl/l3ieWXhF3rFUFeryFSk15vpstljF2D/tgSWw8lswmVG74Y37nGC
 JIGOuxz9J/CzgN6vwhiXN/hxgOwzcRgdedYv10+f1beZNj3A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NlbK_56zdC0TXyg02W9TqeENujmROIoT
X-Proofpoint-ORIG-GUID: NlbK_56zdC0TXyg02W9TqeENujmROIoT
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f7330d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Twlkf-z8AAAA:8 a=EUspDBNiAAAA:8 a=-uxSO3zEkdLPsdym20oA:9 a=QEXdDO2ut3YA:10 a=a97rIl97qucA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=42 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=664 lowpriorityscore=42
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214609

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
 meta/recipes-devtools/llvm/llvm_20.1.1.bb | 40 +++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index b95473c88b64961cb6ae2f4ace14aac4600cf98e..736eeb944f033c909a77fc552c83ab253f84398a 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -58,19 +58,22 @@ def get_llvm_arch(bb, d, arch_var):
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
+
 EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
                   -DLLVM_ENABLE_PIC=ON \
@@ -84,6 +87,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DCMAKE_BUILD_TYPE=Release \
+                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
                  "
 
 EXTRA_OECMAKE:append:class-target = "\
@@ -91,6 +95,7 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                  "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -98,6 +103,7 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DLLVM_HOST_TRIPLE=${SDK_SYS} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
                   -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                  "
 
 # patch out build host paths for reproducibility
@@ -126,17 +132,39 @@ do_install() {
 
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
@@ -148,9 +176,11 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc"
+PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
+RPROVIDES:${PN}-clc = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
 
 FILES:${PN}-bugpointpasses = "\
     ${libdir}/BugpointPasses.so \
@@ -183,6 +213,8 @@ FILES:${PN}-staticdev += "\
     ${libdir}/*.a \
 "
 
+FILES:${PN}-clc += "${datadir}/clc"
+
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"

-- 
2.39.5


