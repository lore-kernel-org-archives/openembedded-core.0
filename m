Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F04C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 22:18:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.1791.1743113919069574602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 15:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Ah0vZr7V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RKGouD004726
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hQ+Y0mNkFBLLyO08AmGCu7ItnLsvKdlJEjrlJs6S+U=; b=Ah0vZr7VU0PQY+Sv
	+Z42u/yLqo/PKzpCJvZtPca2RphLB7ZgTTlhaL55vV6OkEye/0yBhMFmee4lgHMe
	1bmFbIUkYOFj76eujpUUKiUhUaYRxDmOetxQqOZ4GAa1sqRl8KVhQqRC5nh/6ZCi
	+wG/klBg2nNXWznOKtcoV0iLLz0s/bLxvac/057hfadt9qefCAIi1e3qgHpo5TZL
	vPj5v0ro1TjkeyEeeamyMD3ZvEAt+pC9hlG+tuAbHfCmSgjFXHFM4d3YaEIiXESh
	gsN+8FuiD28k+Plon+6+/YG67BGvSGZrv+IvX8zxwCOdKRWZXZxQNgWVxxhynJK8
	UJ27YA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf6rd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47689968650so16547081cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 15:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743113917; x=1743718717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hQ+Y0mNkFBLLyO08AmGCu7ItnLsvKdlJEjrlJs6S+U=;
        b=HsGloDLQELmw4H7lsezeYYXPuf17Wjs1lwa9UOYUhT0FVN15edkUO13BXrEzn2x0KA
         2IeYFkjdVunwQ3PSqiZ7l3e5LysxGrOAD6hxLNQlrpazlEtb6+fC9k54MAbb6roOxvra
         ekdhqor+UjnnC4Vxg6hLSthjEP23sdmIwGDEdxk2VtCP2OJnzbwI9O6r/oHkByE6mAFm
         U2AfNTr3XEMCTShZ4sD1p0re6G3p+9+PR84gtLXn/aM6/7Sv+ENzziSYBN2ElIaakZrJ
         9V4w73NgTJyuoXJbgwqZmqdZGGwuSl0eF2LoVmPH6iOQ6+ufTW6nQGPUDnA89M10jyrG
         cR3g==
X-Gm-Message-State: AOJu0YxkuZNB7NXtKREeZquSe0TN8SflAy+7MDL2yeKHjwIHC2C8LyRL
	kTG3ANACRFZmeNNh6lMzwoUwKMYSO9OBMCbqYsv+xeraYaX+mr0bIQT37M/o+6NTLx6o/tXD4iB
	EHbaSRqnebwR7Dm2w0yaa8szSEQ+j/VB1o0MFz2Rl1I1lzzg4k/Y0VxDNdhpw2fV2CbMO7mfS9t
	/RG+2y3xKy1xs=
X-Gm-Gg: ASbGncsbWvHrX5ycvD01CJDSJ146K2NoyfPMGYcm4w1zSsnyMbX2Y1rQdTtGpwN+5pl
	MzNPpIqmT7fPoY+AopxCzYUovEjwS7ygP/kJ6xAjVN1CHQ6s6GzrQu4yAS4+NDNaJvjVV4ok1ma
	iul2v17EWOkcRARkoXWbZGo2Lqdut3GI35CrFInE1O25bst1h1tX1PWQeNOPC5Mb3YBpsDqZ2Lu
	uKFbgtj0GDStV8HSyxcUjwOE8zxis8p4+n2Ak08/yjt3ruQPwJWAOvMAq6LZl4brK08rv22uaPK
	++fm3U8VqWxzLs53k4exTApFhvonIXRQaYHJR0n/FOdbpCrRR87KjvcPSRw12HoWYSwksyAk22e
	w9/9wzYziQtl7wpkggNSFSyhKtClp
X-Received: by 2002:a05:622a:259b:b0:476:c666:d003 with SMTP id d75a77b69052e-4776e21cc16mr87664721cf.43.1743113916689;
        Thu, 27 Mar 2025 15:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+4RzPQxgJDrcikagbyIL0/O/v11OIDmANaOo+A25iNNOwZ6fb3R+AuER0kui9/N5RVBwvUQ==
X-Received: by 2002:a05:622a:259b:b0:476:c666:d003 with SMTP id d75a77b69052e-4776e21cc16mr87664241cf.43.1743113916150;
        Thu, 27 Mar 2025 15:18:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59808sm1019081fa.107.2025.03.27.15.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:18:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
        =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 7/7] mesa: add support for RustiCL under PACKAGECONFIG "opencl"
Date: Fri, 28 Mar 2025 00:18:07 +0200
Message-Id: <20250327221807.2551544-8-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-ORIG-GUID: pDsI_Jb93RV7VpxWRz1yDzu8Zfmj5CIT
X-Proofpoint-GUID: pDsI_Jb93RV7VpxWRz1yDzu8Zfmj5CIT
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e5cebe cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ZpVaWaFtAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NIk5LsUNV1RiDaC6tVwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270150
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52RKGouD004726
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213799

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
 ...cross-compilation-arguments-to-LLVM-.patch | 64 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 20 ++++--
 2 files changed, 79 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-provide=
-cross-compilation-arguments-to-LLVM-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-=
compilation-arguments-to-LLVM-.patch b/meta/recipes-graphics/mesa/files/0=
001-rusticl-provide-cross-compilation-arguments-to-LLVM-.patch
new file mode 100644
index 000000000000..c9213fbe4eec
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-rusticl-provide-cross-compila=
tion-arguments-to-LLVM-.patch
@@ -0,0 +1,64 @@
+From b9cf34f39ca7e7546508ce2ab1f053edef5fc201 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 26 Mar 2025 17:47:09 +0200
+Subject: [PATCH] rusticl: provide cross-compilation arguments to LLVM bi=
ndgen
+ invocation
+
+Correctly generating LLVM bindings requires several croos-compilation
+arguments. Provide them to rust.bindgen().
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
index e52a6394bb1a..153de1d8701d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.=
xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
            file://0001-meson-use-target-path-for-Clang-libdir.patch \
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
 PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm r600"
@@ -140,9 +144,15 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3D=
enabled, -Dgles1=3Ddisabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
+BINDGEN_TARGET =3D "${TARGET_ARCH}-${TARGET_OS}${LIBCEXTENSION}${@['-gnu=
', ''][d.getVar('LIBCEXTENSION') !=3D '']}"
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
@@ -242,7 +252,7 @@ RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
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
@@ -348,7 +358,7 @@ FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
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
@@ -362,7 +372,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
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


