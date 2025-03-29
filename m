Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A1AC36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 20:07:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.18136.1743278868233917269
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 13:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=lTeUyKYe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TJYM33025685
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1CB4JmobkT6cTmvwIq+nCiQkFb38IeE55rDWfE7EuI=; b=lTeUyKYentJ0u7nQ
	ZOlfSn/Ssopg71rrqLe9NXODBmRb2G6SWz7B5UI/qUBl+7FaDz8JkzC4uSpIJTZH
	RdVCzD57a8+OPaHJxRCKvMkUxnyKV+iOovuSexsGeChe5LZ5fKAkt6WhYzklsloN
	HFEnrMzySWglu7beqkhp1akFD4GfCyWdZWdLtLcZO4lefFqtxS+CXq68Mbege048
	666oO60XQh0fitka3/WWEixV70fDCfwNwUnmuMvIFZS7FqxDdbXRITfOoompcsSI
	3sYSrcPS5G3NkXqq0cwauHu+wa5BauTc6U18QkHzoOnfTO1ofwnCgJgrSbMQWeb2
	8PtgSw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v89bpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ba3b91b1so151294085a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743278866; x=1743883666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1CB4JmobkT6cTmvwIq+nCiQkFb38IeE55rDWfE7EuI=;
        b=LZhdcp7in1WD8uIoFJ1B+AudlsVu1qtTsR0XHDAjVdBFRLXjx0TPx0mWGNi0V0LZgk
         vwacEpuBk09EinlcTGTlnhSw3Is9HXf4jSAaStEY+FUaPSg75UbaiJQhTwzBytKBTGwA
         81iUh8HYbV8iHr0aGmXVqyb8Yv2pK3vtxR5+O3Oh1YNNKpD9wpqAHm3iysEzsBD1DaWu
         ogA6Uwcco0yjRBMyy5LbOjbDn1iOGeuw0dn9fvz+fPVvt7B7bwyo/ulXmQzxMqTW3BeO
         pKeYEVSC5kyoLYAPzdFmOKARt3bd3t9CJcC6Ox9PI/vTvmr5dSxhTmhkiC3Va4jFPFsg
         9ytA==
X-Gm-Message-State: AOJu0YwzmccT4yMcCEMLhgAkUVl5u+OgPoVqq6n4czBP3/3ogy0hQOfx
	h9tn609pWVIXEwLNWGLI+cA0qS/0M+1tsEBc42uhrCq4Gb1yrUzcnktbk/99+ZrmJNo2qBQFLAA
	BGX4SZ9D0/ymOqtg4h/EB/xqRYBKbler7pv5J5EDdIMgG5F5I0gmh8P3IJ6RWP0EpzTprt0ThEh
	5DSPc=
X-Gm-Gg: ASbGncs0uZFsaA804ahCcrafTpgLwIcYt5HyfV23VJYf5QxRQ4PsURevU+dhGcG92DD
	5iwEVO6MSPUuj/h+JoV2ig+ZoEUgcAPj5mjqb2QS2PngTFljQSGPRrF4YUA+NR0o87lwWb2zrrM
	w2bABUYIWBZtvFhfsS6YnKus1KKlHx4/dPq77n7GzP114+AOCMqK+PYbqjX0xHSV7GkdPyN/Snu
	X3ob4aV+cJ1IAmap/iLsqs8toIyy73CC2BkZJ98KFLV/lQkz4+PYiDVpC0c/1ZpyjZlYfGa88pa
	8FMFDOqSXlMi8RQQ0jRIVXJ7dUP5Lr35enFfMvnvrL2em9z1ehyRrFS9py78tX27BIGlo/F3/wt
	yke/nf7qOq+b314QAObZpw+HMbr5R
X-Received: by 2002:a05:620a:170e:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7c5f9bf8928mr1137207385a.21.1743278866462;
        Sat, 29 Mar 2025 13:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9kY1NCHGUcCVNDVMTvrqFDdcvZ61i3ZvFQRU/6L38LjViNBoVlWoeaof/jM7vCzoo3scZ7A==
X-Received: by 2002:a05:620a:170e:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7c5f9bf8928mr1137204485a.21.1743278866061;
        Sat, 29 Mar 2025 13:07:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb365sm685848e87.29.2025.03.29.13.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:07:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 29 Mar 2025 22:07:20 +0200
Subject: [PATCH v3 9/9] mesa: add support for RustiCL under PACKAGECONFIG
 "opencl"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20250329-mesa-25-v3-9-f4d0328eb867@oss.qualcomm.com>
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7608;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=138WZeZ4omX2qzoYRhMr5MGdsHoIG+BWIMgNxdTXfo0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6FL1zxfTZLGsngB88KzJAgiKV9yZ/8Q4LV5K7
 3i4KtBdZWeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+hS9QAKCRCLPIo+Aiko
 1XsNCACpHO2ypnwNnX1/GBfl+xal1HQtedUGZTFyTzJPDVUBxc83SSdw+i7vtSHNb9/d1Q+C9Wh
 dOyS0lryhoQOFSzWPAGPE1I6Bjx57CLY2rv6zgsGUZwURVDntH6K4gG58VZ4fbRxXLPkWo6+JcN
 ec1kQ6nQIYO0WJpeJ+PmdiSGwd6JZkss1XvXDG+wLQO/P9KmOBPQ2FDttBZp5DqM7bdIYpaQv+a
 /Hsg++mFaH+HZxWBIycoEf7m9y30tyQtA/BJgDPEUzjKMC+/O+5tPCw801NBzaR+Cn7F0j7atQX
 eX0c/5m052n4EyUPG5I+vkeBc/EywPxPoCJlFB1ytjQ6mW16
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ltQxKLdyd6yyrjcbPLlgpBnu2JOKroEF
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67e85313 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ZpVaWaFtAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NIk5LsUNV1RiDaC6tVwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-GUID: ltQxKLdyd6yyrjcbPLlgpBnu2JOKroEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503290146
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52TJYM33025685
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213903

From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>

Mesa now has two OpenCL implementations: Clover (older one) and RustiCL
(newer one). Extend the "opencl" package config to include both
implementations into the libopencl-mesa (-dev) packages. As the Clover
implementation is in maintenance mode and is expected to be removed at
Mesa 25.2, it doesn't make sense to split the packages or to provide
two config options.

Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
[DB: merged "rusticl" and "clover" back to "opencl", reworked rust inheri=
tance]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...vide-cross-compilation-arguments-to-LLVM-.patch | 66 ++++++++++++++++=
++++++
 meta/recipes-graphics/mesa/mesa.inc                | 20 +++++--
 2 files changed, 81 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-=
compilation-arguments-to-LLVM-.patch b/meta/recipes-graphics/mesa/files/0=
001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch
new file mode 100644
index 0000000000000000000000000000000000000000..652f99bc80653cfaf34ab069e=
d9d370ae3c4948a
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-compila=
tion-arguments-to-LLVM-.patch
@@ -0,0 +1,66 @@
+From b9cf34f39ca7e7546508ce2ab1f053edef5fc201 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 26 Mar 2025 17:47:09 +0200
+Subject: [PATCH] rusticl: provide cross-compilation arguments to LLVM bi=
ndgen
+ invocation
+
+Correctly generating LLVM bindings requires several croos-compilation
+arguments. Provide them to rust.bindgen(). Karol Herbst on IRC suggested
+that a proper fix should be to fix meson's rust.bindgen() to support
+cross-compilation. Carry this patch until meson is fixed.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ meson_options.txt                         | 14 ++++++++++++++
+ src/gallium/frontends/rusticl/meson.build |  8 ++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 0147cafcb146..f73e83fded18 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -796,3 +796,17 @@ option(
+   value : false,
+   description : 'Install the drivers internal shader compilers (if need=
ed for cross builds).'
+ )
++
++option(
++  'bindgen-includedir',
++  type : 'string',
++  value : '',
++  description : 'system-wide include directory for cross-generating LLV=
M bindings'
++  )
++
++option(
++  'bindgen-target',
++  type : 'string',
++  value : '',
++  description : 'Clang target for cross-generating LLVM bindings'
++  )
+diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/fro=
ntends/rusticl/meson.build
+index a5d1dcf3abb9..480c220b7f5f 100644
+--- a/src/gallium/frontends/rusticl/meson.build
++++ b/src/gallium/frontends/rusticl/meson.build
+@@ -180,13 +180,21 @@ rusticl_opencl_gen =3D static_library(
+   ],
+ )
+=20
++bindgen_c_args =3D []
++bindgen_target =3D get_option('bindgen-target')
++if bindgen_target !=3D ''
++  bindgen_c_args +=3D [ '-target', bindgen_target ]
++endif
++
+ rusticl_llvm_bindings_rs =3D rust.bindgen(
+   input : 'rusticl_llvm_bindings.hpp',
+   output : 'rusticl_llvm_bindings.rs',
+   c_args : [
+     rusticl_bindgen_c_args,
+     pre_args,
++    bindgen_c_args,
+   ],
++  include_directories : get_option('bindgen-includedir'),
+   dependencies : [
+     dep_clang,
+     dep_llvm,
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 52079f536ef785084e4a1e61969d162d067ee12d..b7db5f8d00a10d59c15fdfaea=
318875d2b4ddc4d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE =3D "2"
 SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
+           file://0001-rusticl-provide-cross-compilation-arguments-to-LL=
VM-.patch \
 "
=20
 SRC_URI[sha256sum] =3D "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6=
d4c45638627fdc97"
@@ -45,7 +46,7 @@ PROVIDES =3D " \
     virtual/mesa \
     "
=20
-inherit meson pkgconfig python3native gettext features_check
+inherit meson pkgconfig python3native gettext features_check rust
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -84,6 +85,9 @@ PACKAGECONFIG =3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
=20
+# skip all Rust dependencies if we are not building OpenCL"
+INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
encl', '', '1', d)}"
+
 PACKAGECONFIG:append:x86 =3D " libclc gallium-llvm"
 PACKAGECONFIG:append:x86-64 =3D " libclc gallium-llvm"
 PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm r600"
@@ -139,9 +143,15 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3D=
enabled, -Dgles1=3Ddisabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
+BINDGEN_TARGET =3D "${TARGET_ARCH}-${TARGET_OS}${@['-gnu', ''][d.getVar(=
'LIBCEXTENSION') !=3D '']}"
+
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCON=
FIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd,-Dgallium-opencl=3Ddis=
abled,"
+PACKAGECONFIG[opencl] =3D " \
+    -Dgallium-opencl=3Dicd -Dgallium-rusticl=3Dtrue -Dbindgen-includedir=
=3D${STAGING_INCDIR} -Dbindgen-target=3D${BINDGEN_TARGET},\
+    -Dgallium-opencl=3Ddisabled -Dgallium-rusticl=3Dfalse, \
+    bindgen-cli-native \
+"
=20
 PACKAGECONFIG[broadcom] =3D ""
 PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
@@ -241,7 +251,7 @@ RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
 RDEPENDS:libgles2-mesa +=3D "libgles3-mesa"
 ALLOW_EMPTY:libgles3-mesa =3D "1"
=20
-RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
=20
 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -347,7 +357,7 @@ FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
 FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium=
-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-mesa =3D "${libdir}/lib*OpenCL.so.* ${libdir}/gallium-pi=
pe/*.so ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi =3D "${libdir}/libglapi.so.*"
 FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
 FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
@@ -361,7 +371,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES $=
{libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
-FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
+FILES:libopencl-mesa-dev =3D "${libdir}/lib*OpenCL.so"
 FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h=
 ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatra=
cker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_co=
mposite.h ${includedir}/xa_context.h \

--=20
2.39.5


