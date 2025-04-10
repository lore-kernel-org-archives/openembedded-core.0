Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64810C369A1
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:55:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.25497.1744253728177778898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Gx+G1Lro;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HnpRN029898
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KQIIe767gx02h7gn+eKAyNhGwqbUK7oPiNw70ce/ek=; b=Gx+G1LromXGG2Fnh
	rvnAE1qWG7dzIhM/FRdtKuQM/1xlAGmO0NC6AUjTe9mI+UFB+M6qYboQMUVXK2Qu
	UCMEB76UAqX++1I1gdetAh8pL95eRJj1w4+qzia/rwftXLR3/tgie3KSQu+0b3E7
	97di/m5gOJ3B+kIBUcDDlW593J/EOacfxtZykRE74Oi8YK80Vtjh1oSzJIoDmn67
	tyMMhMN6x6C8KfnbVICSzryeDIAR9cGvQcUVMTpmKWgqTaNghbPY9Rd/m2LXQG/V
	Y5gHDV7YnQS9jC03cRfc41auTMrqkixUTuj4p43eAfVMetXQkiCZc6XI7f7YWaUA
	U9KDPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmdbfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so68200785a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253726; x=1744858526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KQIIe767gx02h7gn+eKAyNhGwqbUK7oPiNw70ce/ek=;
        b=PjqA4j8IQkcznyOVx1Q9v3Use81LIbLlRwrSUfW4XAGon5NhOSoSxSeffsuRYzxpll
         m1Spo6YvPZqCb3kjFLzYTxNXNuSBjjbL1WVhtQBqB1nIUfMyvIQ4bsDkCo6o3Kol9ikm
         pCQQqgTLOR3A2Wc/lHx5ClOE/rY1XcOtbYzeK5tuCoG4JeJeax6y0wdOOvIGlXJM6gFE
         n5iE5ZPC8mGaHltjLiaMsdhQ9gYDP2XKDCYUM0eJOEpLPwJZD0lu612B3M3xFmQP7WHp
         /v7I7raGd2XKyIR/gtsGFhyPfyjB8W+10zJqZju/dl2JDNOs0r04wJkKazzRUibM/axo
         ZeiA==
X-Gm-Message-State: AOJu0Yxtdof5INGThpvsMaVx2sjTK+ofjab4ylIWoGYXhRDHFM2WOFnv
	cV6KNP1DdSI+yIzalLM/uB8DeoRwudv9R8FGL06HWU5uj2Sa3J6Xl7rQHHnvKN4qNztCZA1zG+U
	/wpm02kELeZn1Wo6wv3rHepgzZNRmOGNRostotkT+WTfdxOJ7coYpKAHXe+M3+79z+tPBJc1nlr
	4eKTy9Axr+1Yw=
X-Gm-Gg: ASbGncszFX3Q2rOd52rR+UaN/qivZ1nkrMGZe84+xH4GA0DsB2rzNikKLVtB4w81f5Z
	YtyXvc3QIsJmuAPVrJX1LT5NX1qd9rz70za7Smuo5j+aNA9Zf0UlNa4YSX9bcHfA1YyhWnjdUQd
	RznoAk03mKLYmWas2i7wIZVysluk/ZICiJaaeh6nh68fBGuFhdugx2uy1my0DXUQN7o3Yjv93mP
	BlvRioULvOtE0enzTt8FNpHZ/TKTVxRyM0QF38jL5Fisled9OU75m1kHsnK4F5SxZoF2YKO6Q7Y
	twxWs7j/R6/RATid1O6vbtjnxqv3KvT90lld9q/DkJKP4qQB8gd3b31uYNRghxb1LGVwdwujLDo
	83Ey69IAqYliBcRXp9SNsUTzD
X-Received: by 2002:a05:620a:1923:b0:7c5:cdb5:271b with SMTP id af79cd13be357-7c7a815ec32mr96473985a.15.1744253725612;
        Wed, 09 Apr 2025 19:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs0+1etDLvhM2zsbW+nINWVisODGmsX8lFft4zxefvvdntXWUO+F+i2xRRLY8jj7/qaF3RtQ==
X-Received: by 2002:a05:620a:1923:b0:7c5:cdb5:271b with SMTP id af79cd13be357-7c7a815ec32mr96472885a.15.1744253725211;
        Wed, 09 Apr 2025 19:55:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:55:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:51 +0300
Subject: [PATCH v7 12/12] mesa: add support for RustiCL under PACKAGECONFIG
 "opencl"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20250410-mesa-25-v7-12-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7772;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fZAgKJI7SWq8PzgWSpG663vL/fDTTwBSP4YJ4EAiFUU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLyJM7IRKHpvybLH6JfnQut1CT/GiPitaUik
 oUcy6djBAmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8gAKCRCLPIo+Aiko
 1T2CB/sHAfe34OLIHiJ6Wl6gOk3+EqsyJPqorW2mAY2nMyIYCV/9Y8aCNTouzSnEkHA03OGdy0L
 pG/LEkqrGWQAtD4wLoJxq9FVZeqAwMNnZ/dsrZEL8oa/WMWqfG8pE/A/obLPZl76Pg2EWHrwq6n
 DQ3FyGPDBltx6rk7YLX5YVkF1uUDT40aV0VFzgWzonezXjhcwTUiK2eb3Rma6t0m3tzeDfekfwC
 xx5fnH7c8pBz3h31H80dUp8SH6KRfjjbfjmTkm544zB1NG8xLMot5fMVvx17yD2Fpux9Q+hwc8d
 ygG1krPMS3bJY9eglQ0ZqJKMOUAC/xeoNK0Ua1ZkibVZrc7G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0s73IMFJvLyn3xTkQ_HXGCGzYLw6wiwR
X-Proofpoint-ORIG-GUID: 0s73IMFJvLyn3xTkQ_HXGCGzYLw6wiwR
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f7331f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=ZpVaWaFtAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NIk5LsUNV1RiDaC6tVwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 539HnpRN029898
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214614

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
 ...vide-cross-compilation-arguments-to-LLVM-.patch | 67 ++++++++++++++++=
++++++
 meta/recipes-graphics/mesa/mesa.inc                | 21 +++++--
 2 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-=
compilation-arguments-to-LLVM-.patch b/meta/recipes-graphics/mesa/files/0=
001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch
new file mode 100644
index 0000000000000000000000000000000000000000..d527b3408734dfa0aa756053c=
1b0f3ea3a59563b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-compila=
tion-arguments-to-LLVM-.patch
@@ -0,0 +1,67 @@
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
+Link: https://github.com/mesonbuild/meson/issues/13591
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
+@@ -115,6 +115,11 @@ rusticl_bindgen_c_args =3D [
+   '-fno-builtin-malloc',
+ ]
+=20
++bindgen_target =3D get_option('bindgen-target')
++if bindgen_target !=3D ''
++  rusticl_bindgen_c_args +=3D [ '-target', bindgen_target ]
++endif
++
+ cl_c_args =3D [
+   '-DCL_USE_DEPRECATED_OPENCL_1_0_APIS',
+   '-DCL_USE_DEPRECATED_OPENCL_1_1_APIS',
+@@ -187,6 +192,9 @@ rusticl_llvm_bindings_rs =3D rust.bindgen(
+     rusticl_bindgen_c_args,
+     pre_args,
+   ],
++  include_directories : [
++    get_option('bindgen-includedir'),
++  ],
+   dependencies : [
+     dep_clang,
+     dep_llvm,
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 9edce6b2281c2e33e6fe20819f0f4998cceba60b..aca34983e97ca684d662987d3=
a1d0b61ba44029a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.=
xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-meson-disable-SIMD-blake-optimisations-on-x32-hos=
t.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
+           file://0001-rusticl-provide-cross-compilation-arguments-to-LL=
VM-.patch \
 "
=20
 SRC_URI[sha256sum] =3D "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6=
d4c45638627fdc97"
@@ -46,7 +47,7 @@ PROVIDES =3D " \
     virtual/mesa \
     "
=20
-inherit meson pkgconfig python3native gettext features_check
+inherit meson pkgconfig python3native gettext features_check rust
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -85,6 +86,9 @@ PACKAGECONFIG =3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
=20
+# skip all Rust dependencies if we are not building OpenCL"
+INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
encl', '', '1', d)}"
+
 PACKAGECONFIG:append:x86 =3D " libclc gallium-llvm"
 PACKAGECONFIG:append:x86-64 =3D " libclc gallium-llvm"
 PACKAGECONFIG:append:i686 =3D " libclc gallium-llvm"
@@ -144,9 +148,16 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3D=
enabled, -Dgles1=3Ddisabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
+BINDGEN_TARGET =3D "${TARGET_ARCH}-${TARGET_OS}${@['-gnu', ''][d.getVar(=
'LIBCEXTENSION') !=3D '']}"
+BINDGEN_TARGET:class-native =3D ""
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
@@ -249,7 +260,7 @@ RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
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
@@ -355,7 +366,7 @@ FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
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
@@ -369,7 +380,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
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


