Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E8AC36014
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 22:18:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.1727.1743113914166864212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 15:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=SwY2QTJS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REuKFP013904
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RZ6l6v/XG5D6Tm32tDUpLdOjmBe3gc/q/XqoEbVIc4=; b=SwY2QTJSKexmfJaS
	cW/ItpuE9lwyK73fw7iLZ/eoIZMzizYrZo1OaouRn2tyrH08KxJM0OEITNt/F+Jf
	Bh66Vx40l8nLlrzATxUWmfI/lmeIuu0xCuWk5eVfdJGKQAo17rlBa3Cr0Qe5S2WH
	BpCfvG6omuBr0YyqPXV5WKvVCOFTyBZ5jDHGoPK00uOf4OJCYHCLVNDWS0KMdM6i
	KcO5nebZ0S4SgpWIJEZbgwM46ydK8y/DWRJ6a7q7teBeJ4YMddpfowEod9MGiCbi
	cREGeaygvV8n08lJORE/30Gsi/jZhx9Qj8LGFHACg1rJgueiVE/7ud2AjMieWklt
	Vor5Pw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcndgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ece036a581so27129886d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 15:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743113911; x=1743718711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RZ6l6v/XG5D6Tm32tDUpLdOjmBe3gc/q/XqoEbVIc4=;
        b=VznWF76fYQujB9OhyyOr50pcgOnywk2wCcT7bP7tux5M6xLJIdpRjCG7Q1MSpsDAAJ
         7wmLDJlGo7h5o3ArK8J3+L+IFyif+m9cAGj1cOO7BBbsntI/IjBlLLJItmxJgamzWAnr
         8nu10ss27eB1NqbwNEIfo2RSq9Ugoat+97kyNVKxqiV6jE/yPuWC/fQjlQDkDJUbGe6r
         VCj+Ruo1bEavM9AsQFOvVs4IEgeWQ9IY5g3ncUkAL2asD+9IggSZj98YD3v8uuPZErbP
         POUPdd1eU8DeVsK40iynYoLVU23nj41Aew2EfATSbh0oVEu0H4x/aZKjKXv+CtNtF3SB
         byow==
X-Gm-Message-State: AOJu0YykDNrvG4T93yrEdRSPe7yLgmz7mFrOrGOmaQB74BwZmMeDjTt/
	j/vK+mVHSk/8R39Jj3v1eW1fVIeuFYmisIxKBSPzy9lnc3mX9icSG6QWYD1Un7x+Vg6nyzFcyIY
	hk+Y/7p7U1F43poAriL/1R0JHdMSGALtFRaXlMGE2OKGqn1IxpVjC5yt2a5VUgtTv212RPP2SmV
	ikIonAoIaiU94=
X-Gm-Gg: ASbGncv6q/M+HdMyLJlJkD6E5BbZbiL7Ki5rJpHEeSrNaN9HT2gsRd+SllhQbRjThnz
	3utWJLQQPTrB1Ju+WVs0KdRMPXevALa8bi8ZbOupCG460lWcnMegJVYEjyZ2JLRfaT830etRq5Q
	w+f+Q9zvbeIH/JdLJaYk2ZigzK4Yai7vLyeLlvPvp6S1uWDWl8VsH6QBVUCL7e9TR6J8RIK9mO1
	1nq8vU727rtEVjOm/h4Lka+VuQ7Upune4ZxBifqg7r2VXA7tuqYTnH2lTGMRk8TRw8PWcuoNN74
	JkcLkDCHY/lY+2AM9D96o8fAdpw61KFKdXkUyqv3Tz8xArbIpmzp25HCc78KdVKXs+AGqLRwu4K
	FvfRlZ3NB8oCQ6bhziEd+ILNhr4S+
X-Received: by 2002:a05:6214:262d:b0:6d4:1425:6d2d with SMTP id 6a1803df08f44-6ed2399d5b1mr76056636d6.43.1743113910807;
        Thu, 27 Mar 2025 15:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg9ZUl9yIc9qzdwNg4LkbgPz0PwbyAicg4+byhWtQJ3Y7Lxgr9g29npz3KM8J+EBBrksTdtg==
X-Received: by 2002:a05:6214:262d:b0:6d4:1425:6d2d with SMTP id 6a1803df08f44-6ed2399d5b1mr76056036d6.43.1743113910004;
        Thu, 27 Mar 2025 15:18:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59808sm1019081fa.107.2025.03.27.15.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:18:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 5/7] mesa: upgrade 24.0.7 -> 25.0.2
Date: Fri, 28 Mar 2025 00:18:05 +0200
Message-Id: <20250327221807.2551544-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e5ceb8 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ZpVaWaFtAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RtjxG5zYtpdtG3FjNXAA:9
 a=XZ9zjgA0ByK4FuMM:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=geQEn1fu34MA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=5tn4MO8azEBWFjlAA-rn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: UIUx5uydISMgsGH87deZ8dapoi2rcrA5
X-Proofpoint-ORIG-GUID: UIUx5uydISMgsGH87deZ8dapoi2rcrA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270150
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52REuKFP013904
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213797

Upgrade the Mesa package, dropping applied and refreshing outstanding
patches. The dri3 config option is now gone, dependencies are merged
into X11 deps. The swrast gallium driver has been split into softpipe
and llvmpipe drivers. Reworked OpenCL support to use mesa_clc compiler.

Changelog:
     https://docs.mesa3d.org/relnotes/25.0.2.html

License-Update: license text cleared and clarified.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...-meson-do-not-pull-in-clc-for-clover.patch | 53 ------------
 ...lude-missing-llvm-IR-header-Module.h.patch | 41 ---------
 .../0001-drisw-fix-build-without-dri3.patch   | 58 -------------
 ...on-t-encode-build-path-into-binaries.patch | 46 ++++++++--
 ...son-use-target-path-for-Clang-libdir.patch | 57 +++++++++++++
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 ----------
 meta/recipes-graphics/mesa/mesa.inc           | 84 ++++++++++---------
 7 files changed, 139 insertions(+), 242 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do=
-not-pull-in-clc-for-clover.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-mis=
sing-llvm-IR-header-Module.h.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build=
-without-dri3.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-use-targe=
t-path-for-Clang-libdir.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-tr=
y-zink-if-not-enabled-in-mesa.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pu=
ll-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert=
-meson-do-not-pull-in-clc-for-clover.patch
deleted file mode 100644
index 1711e22585a7..000000000000
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-c=
lc-for-clover.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Fri, 8 Mar 2024 15:53:11 +0100
-Subject: [PATCH] Revert "meson: do not pull in clc for clover"
-
-This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
-Upstream-Status: Inappropriate [https://gitlab.freedesktop.org/mesa/mesa=
/-/merge_requests/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9affd9124b4=
5bc60c2bd]
-
-Once the merge request above was added, it will only be possible to prov=
ide opencl spir-v with gallium-rusticl=3Dtrue. This is not yet supported =
in the mesa recipe.
-For now reverting this commit allows to still use clover with opencl-spi=
rv, which would otherwise be broken starting from mesa 24.0.2.
-
-After it was merged, this patch needs to be removed and rusticl support =
will be required
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- meson.build              | 3 ++-
- src/compiler/meson.build | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 2db6185..741b5d1 100644
---- a/meson.build
-+++ b/meson.build
-@@ -813,6 +813,7 @@ if _opencl !=3D 'disabled'
-     error('The Clover OpenCL state tracker requires rtti')
-   endif
-=20
-+  with_clc =3D true
-   with_gallium_opencl =3D true
-   with_opencl_icd =3D _opencl =3D=3D 'icd'
- else
-@@ -837,7 +838,7 @@ if with_gallium_rusticl
- endif
-=20
- dep_clc =3D null_dep
--if with_gallium_opencl or with_clc
-+if with_clc
-   dep_clc =3D dependency('libclc')
- endif
-=20
-diff --git a/src/compiler/meson.build b/src/compiler/meson.build
-index 8d73544..1dae56d 100644
---- a/src/compiler/meson.build
-+++ b/src/compiler/meson.build
-@@ -79,7 +79,7 @@ subdir('nir')
-=20
- subdir('spirv')
-=20
--if with_clc
-+if with_opencl_spirv
-   subdir('clc')
- endif
- if with_gallium
diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-ll=
vm-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-I=
nclude-missing-llvm-IR-header-Module.h.patch
deleted file mode 100644
index 82ad88a079c1..000000000000
--- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-h=
eader-Module.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 1 Jul 2024 23:09:29 -0700
-Subject: [PATCH] amd: Include missing llvm IR header Module.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-With LLVM-19, Module.h header is not being pulled, which results in
-compile errors e.g.
-
-src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for =
call to =E2=80=98unwrap(LLVMOpaqueModule*&)=E2=80=99
-  102 |    unwrap(module)->setTargetTriple(TM->getTargetTriple().getTrip=
le());
-      |    ~~~~~~^~~~~~~~
-In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:2=
3,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibr=
aryInfo.h:14,
-                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
-
-Its getting the definition from llvm/IR/Type.h instead of Module.h and c=
aused
-confusion to compiler
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/29993]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/amd/llvm/ac_llvm_helper.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_help=
er.cpp
-index 5d065279ad1..af4a50f8409 100644
---- a/src/amd/llvm/ac_llvm_helper.cpp
-+++ b/src/amd/llvm/ac_llvm_helper.cpp
-@@ -8,6 +8,7 @@
- #include <llvm/Analysis/TargetLibraryInfo.h>
- #include <llvm/IR/IRBuilder.h>
- #include <llvm/IR/LegacyPassManager.h>
-+#include <llvm/IR/Module.h>
- #include <llvm/IR/Verifier.h>
- #include <llvm/Target/TargetMachine.h>
- #include <llvm/MC/MCSubtargetInfo.h>
diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-withou=
t-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-with=
out-dri3.patch
deleted file mode 100644
index ab1615209063..000000000000
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.=
patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
-
-commit 1887368df41 ("glx/sw: check for modifier support in the kopper pa=
th")
-added dri3_priv.h header and dri3_check_multibuffer() function in drisw =
that
-can be build without dri3.
-
-  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in =
function `driswCreateScreenDriver':
-  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference=
 to `dri3_check_multibuffer'
-  collect2: error: ld returned 1 exit status
-
-Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
-dri3_check_multibuffer().
-
-Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper pa=
th")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/drisw_glx.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
---- a/src/glx/drisw_glx.c
-+++ b/src/glx/drisw_glx.c
-@@ -32,7 +32,9 @@
- #include <dlfcn.h>
- #include "dri_common.h"
- #include "drisw_priv.h"
-+#ifdef HAVE_DRI3
- #include "dri3_priv.h"
-+#endif
- #include <X11/extensions/shmproto.h>
- #include <assert.h>
- #include <vulkan/vulkan_core.h>
-@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_displ=
ay *priv,
-        goto handle_error;
-    }
-=20
-+#ifdef HAVE_DRI3
-    if (pdpyp->zink) {
-       bool err;
-       psc->has_multibuffer =3D dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_dis=
play *priv,
-          goto handle_error;
-       }
-    }
-+#endif
-=20
-    glx_config_destroy_list(psc->base.configs);
-    psc->base.configs =3D configs;
---=20
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode=
-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-f=
reedreno-don-t-encode-build-path-into-binaries.patch
index 5975ab4472ec..953a724dc092 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
@@ -22,18 +22,29 @@ diff --git a/src/freedreno/afuc/meson.build b/src/fre=
edreno/afuc/meson.build
 index bb7cebf5a748..351cc31ef2de 100644
 --- a/src/freedreno/afuc/meson.build
 +++ b/src/freedreno/afuc/meson.build
-@@ -56,6 +56,7 @@ if with_tests
+@@ -56,10 +56,12 @@ if with_tests
    asm_fw =3D custom_target('afuc_test.fw',
      output: 'afuc_test.fw',
-     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm=
'), '@OUTPUT@'],
+     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPU=
T@'],
++    env: {'RNN_PATH': rnn_src_path},
+   )
+   asm_fw_a7xx =3D custom_target('afuc_test_a7xx.fw',
+     output: 'afuc_test_a7xx.fw',
+     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@=
OUTPUT@'],
 +    env: {'RNN_PATH': rnn_src_path},
    )
    test('afuc-asm',
      diff,
-@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
+@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
      disasm_fw =3D custom_target('afuc_test.asm',
        output: 'afuc_test.asm',
-       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.=
fw'), '-g', '630'],
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.=
fw')],
++      env: {'RNN_PATH': rnn_src_path},
+       capture: true
+     )
+     disasm_fw_a7xx =3D custom_target('afuc_test_a7xx.asm',
+       output: 'afuc_test_a7xx.asm',
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_=
a7xx.fw')],
 +      env: {'RNN_PATH': rnn_src_path},
        capture: true
      )
@@ -71,8 +82,29 @@ index 98e49b8fcf0e..145e72597eb9 100644
 -rnn_path =3D rnn_src_path + ':' + get_option('prefix') + '/' + rnn_inst=
all_path
 +rnn_path =3D get_option('prefix') + '/' + rnn_install_path
 =20
- dep_lua =3D dependency('lua54', 'lua53', 'lua52', 'lua', required: fals=
e,
-                      allow_fallback: true, version: '>=3D5.2')
---=20
+ dep_libarchive =3D dependency('libarchive', allow_fallback: true, requi=
red: false)
+ dep_libxml2 =3D dependency('libxml-2.0', allow_fallback: true, required=
: false)
+diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/regis=
ters/gen_header.py
+--- a/src/freedreno/registers/gen_header.py
++++ b/src/freedreno/registers/gen_header.py
+@@ -885,13 +885,14 @@ The rules-ng-ng source files this header
+ """)
+ 	maxlen =3D 0
+ 	for filepath in p.xml_files:
+-		maxlen =3D max(maxlen, len(filepath))
++		maxlen =3D max(maxlen, len(os.path.basename(filepath)))
+ 	for filepath in p.xml_files:
+-		pad =3D " " * (maxlen - len(filepath))
++		filename =3D os.path.basename(filepath)
++		pad =3D " " * (maxlen - len(filename))
+ 		filesize =3D str(os.path.getsize(filepath))
+ 		filesize =3D " " * (7 - len(filesize)) + filesize
+ 		filetime =3D time.ctime(os.path.getmtime(filepath))
+-		print("- " + filepath + pad + " (" + filesize + " bytes, from " + fil=
etime + ")")
++		print("- " + filename + pad + " (" + filesize + " bytes, from " + fil=
etime + ")")
+ 	if p.copyright_year:
+ 		current_year =3D str(datetime.date.today().year)
+ 		print()
+---
 2.39.2
=20
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-use-target-path-=
for-Clang-libdir.patch b/meta/recipes-graphics/mesa/files/0001-meson-use-=
target-path-for-Clang-libdir.patch
new file mode 100644
index 000000000000..4747738a4868
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson-use-target-path-for-Cla=
ng-libdir.patch
@@ -0,0 +1,57 @@
+From f2202e7c0d4cbf5ea9c9c783c3926c1b298e8464 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 26 Mar 2025 12:19:10 +0200
+Subject: [PATCH] meson: use target path for Clang libdir
+
+Instead of trying to detect the target libdir through llvm-config tool
+(and ending up with the sysroot path), get libdir from the build
+options. Clang is known to use the same libdir in OE build environment.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ meson.build                              | 2 +-
+ src/compiler/clc/meson.build             | 3 ++-
+ src/gallium/frontends/clover/meson.build | 2 +-
+ 3 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 095aec5d9ead..c0e47813cc34 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1895,7 +1895,7 @@ endif
+=20
+ dep_clang =3D null_dep
+ if with_clc or with_gallium_clover
+-  llvm_libdir =3D dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', con=
figtool: 'libdir')
++  llvm_libdir =3D join_paths(get_option('prefix'), get_option('libdir')=
)
+=20
+   dep_clang =3D cpp.find_library('clang-cpp', dirs : llvm_libdir, requi=
red : false)
+=20
+diff --git a/src/compiler/clc/meson.build b/src/compiler/clc/meson.build
+index 743cd236bb5c..ea9e83519330 100644
+--- a/src/compiler/clc/meson.build
++++ b/src/compiler/clc/meson.build
+@@ -8,7 +8,8 @@ files_libmesaclc =3D files(
+ )
+=20
+ _libmesaclc_c_args =3D []
+-_libmesaclc_cpp_args =3D ['-DLLVM_LIB_DIR=3D"@0@"'.format(llvm_libdir)]
++_libmesaclc_cpp_args =3D ['-DLLVM_LIB_DIR=3D"@0@"'.format(
++  join_paths(get_option('prefix'), get_option('libdir')))]
+ _libmesaclc_sources =3D []
+=20
+ if not _shared_llvm
+diff --git a/src/gallium/frontends/clover/meson.build b/src/gallium/fron=
tends/clover/meson.build
+index e569b86a1bea..0f7b50716179 100644
+--- a/src/gallium/frontends/clover/meson.build
++++ b/src/gallium/frontends/clover/meson.build
+@@ -44,7 +44,7 @@ libclllvm =3D static_library(
+     clover_cpp_args,
+     clover_opencl_cpp_args,
+     '-DCLANG_RESOURCE_DIR=3D"@0@"'.format(join_paths(
+-      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'li=
bdir'), 'clang',
++      get_option('prefix'), get_option('libdir'), 'clang',
+       dep_llvm.version(), 'include',
+     )),
+   ],
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-=
if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxe=
xt-don-t-try-zink-if-not-enabled-in-mesa.patch
deleted file mode 100644
index 036a0b494539..000000000000
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-=
enabled-in-mesa.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
-
-Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw=
 and sw drivers")
-added an automatic zink fallback even when the zink gallium is not
-enabled at build time.
-
-It leads to unexpected error log while loading drisw driver and
-zink is not installed on the rootfs:
-
-  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
-
-Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw=
 and sw drivers")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/glxext.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 05c825a..7a06aa9 100644
---- a/src/glx/glxext.c
-+++ b/src/glx/glxext.c
-@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
- #endif /* HAVE_DRI3 */
-       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
-          dpyPriv->dri2Display =3D dri2CreateDisplay(dpy);
-+#if defined(HAVE_ZINK)
-       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
-          try_zink =3D !debug_get_bool_option("LIBGL_KOPPER_DISABLE", fa=
lse) &&
-                     !getenv("GALLIUM_DRIVER");
-+#endif /* HAVE_ZINK */
-    }
- #endif /* GLX_USE_DRM */
-    if (glx_direct)
---=20
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index f6a91a7002f8..e52a6394bb1a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,21 +10,18 @@ HOMEPAGE =3D "http://mesa3d.org"
 BUGTRACKER =3D "https://bugs.freedesktop.org"
 SECTION =3D "x11"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9dc=
533a0735ef10"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Dffe678546d4337b732cf=
d12262e6af11"
=20
 PE =3D "2"
=20
 SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
-           file://0001-drisw-fix-build-without-dri3.patch \
-           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patc=
h \
-           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch =
\
-           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch=
 \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
+           file://0001-meson-use-target-path-for-Clang-libdir.patch \
 "
=20
-SRC_URI[sha256sum] =3D "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae=
2c7d96db93f6c26a"
-PV =3D "24.0.7"
+SRC_URI[sha256sum] =3D "adf904d083b308df95898600ffed435f4b5c600d95fb6ec6=
d4c45638627fdc97"
+PV =3D "25.0.2"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -38,8 +35,7 @@ do_install:append() {
   fi
 }
=20
-DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native"
-DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG', =
'opencl', 'mesa-native', '', d)}"
+DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native p=
ython3-pyyaml-native"
 EXTRANATIVEPATH +=3D "chrpath-native"
 PROVIDES =3D " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '',=
 d)} \
@@ -77,44 +73,43 @@ EXTRA_OEMESON =3D " \
     -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
 "
=20
-EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
-EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Denabled', '', d)}"
-
 def strip_comma(s):
     return s.strip(',')
=20
+
 PACKAGECONFIG =3D " \
 	gallium \
 	video-codecs \
 	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm =
virgl', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
=20
-PACKAGECONFIG:append:class-native =3D " gallium-llvm r600"
+PACKAGECONFIG:append:x86 =3D " libclc gallium-llvm"
+PACKAGECONFIG:append:x86-64 =3D " libclc gallium-llvm"
+PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm r600"
=20
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
=20
-X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes xrandr"
+X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes xrandr xorgproto libxshmfence"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
=20
-PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgproto =
libxshmfence"
+VULKAN_DRIVERS_AMD =3D ""
+VULKAN_DRIVERS_AMD:x86 =3D ",amd"
+VULKAN_DRIVERS_AMD:x86-64 =3D ",amd"
+# i686 is a 32 bit override for mesa-native
+VULKAN_DRIVERS_AMD:i686 =3D ",amd"
+
+VULKAN_DRIVERS_INTEL =3D "${@bb.utils.contains('PACKAGECONFIG', 'libclc'=
, ',intel', '', d)}"
+VULKAN_DRIVERS_LLVM =3D ",swrast${VULKAN_DRIVERS_AMD}${VULKAN_DRIVERS_IN=
TEL}"
=20
-# Vulkan drivers need dri3 enabled
-# amd could be enabled as well but requires gallium-llvm with llvm >=3D =
3.9
 VULKAN_DRIVERS =3D ""
-VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
-VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
-# i686 is a 32 bit override for mesa-native
-VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
 VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'broadc=
om', ',broadcom', '', d)}"
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'galliu=
m-llvm', ',swrast', '', d)}"
+VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'galliu=
m-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
 VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagin=
ation', ',imagination-experimental', '', d)}"
 PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_D=
RIVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-hea=
ders"
=20
@@ -137,7 +132,7 @@ PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
 PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')}, -Dtools=
=3D'', ${TOOLS_DEPS}"
=20
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
-PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
+PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Ddisabled, libglvnd"
=20
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled, -Dgles1=3D=
disabled -Dgles2=3Ddisabled"
@@ -145,9 +140,9 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3D=
enabled, -Dgles1=3Ddisabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
-OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-=
Dopencl-native=3Dtrue', '', d)}"
-PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue =
${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libcl=
c spirv-tools python3-ply-native"
+# "opencl" also requires libclc and gallium-llvm to be present in PKGCON=
FIG!
+# Be sure to enable them both for the target and for the native build.
+PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd,-Dgallium-opencl=3Ddis=
abled,"
=20
 PACKAGECONFIG[broadcom] =3D ""
 PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
@@ -157,13 +152,13 @@ PACKAGECONFIG[vc4] =3D ""
 PACKAGECONFIG[v3d] =3D ""
 PACKAGECONFIG[zink] =3D ""
=20
-GALLIUMDRIVERS =3D "swrast"
+GALLIUMDRIVERS =3D "softpipe"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
 GALLIUMDRIVERS:x86-x32 =3D ""
-GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
-GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86 =3D ",i915,crocus"
+GALLIUMDRIVERS:append:x86-64 =3D ",i915,crocus"
 # i686 is a 32 bit override for mesa-native
-GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
+GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
=20
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etnavi=
v', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno', ',freedreno', '', d)}"
@@ -173,8 +168,9 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'v3d', ',v3d', ''
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'zink',=
 ',zink', '', d)}"
=20
 # radeonsi requires LLVM
+GALLIUMDRIVERS_IRIS =3D "${@bb.utils.contains('PACKAGECONFIG', 'libclc',=
 ',iris', '', d)}"
 GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600=
', ',radeonsi', '', d)}"
-GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
+GALLIUMDRIVERS_LLVM =3D ",llvmpipe,r300,nouveau${GALLIUMDRIVERS_IRIS}${G=
ALLIUMDRIVERS_RADEONSI}"
 GALLIUMDRIVERS_LLVM:append:x86 =3D ",svga"
 GALLIUMDRIVERS_LLVM:append:x86-64 =3D ",svga"
 # i686 is a 32 bit override for mesa-native
@@ -187,8 +183,16 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PAC=
KAGECONFIG', 'gallium-llvm', '
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600',=
 ',r600', '', d)}"
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'virgl'=
, ',virgl', '', d)}"
=20
+MESA_CLC =3D "system"
+MESA_CLC:class-native =3D "enabled"
+INSTALL_MESA_CLC =3D "false"
+INSTALL_MESA_CLC:class-native =3D "true"
+MESA_NATIVE =3D "mesa-native"
+MESA_NATIVE:class-native =3D ""
+
 PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${@strip_comma('${GALLIU=
MDRIVERS}')}, -Dgallium-drivers=3D'', libdrm"
 PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denable=
d, -Dllvm=3Ddisabled, llvm llvm-native elfutils"
+PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC} -Dinstall-mesa-clc=3D=
${INSTALL_MESA_CLC},,libclc spirv-tools spirv-llvm-translator ${MESA_NATI=
VE}"
 PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3Ddisabled"
 PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,li=
bva-initial"
 PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddi=
sabled,libvdpau"
@@ -242,6 +246,7 @@ RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('P=
ACKAGECONFIG', 'opencl', 'lib
=20
 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
+             libgallium \
              libgl-mesa libgl-mesa-dev \
              libglx-mesa libglx-mesa-dev \
              libglapi libglapi-dev \
@@ -267,13 +272,6 @@ do_install:append () {
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
 }
=20
-do_install:append:class-native () {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', =
d)}; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
-    fi
-}
-
 # For the packages that make up the OpenGL interfaces, inject variables =
so that
 # they don't get Debian-renamed (which would remove the -mesa suffix), a=
nd
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
@@ -344,7 +342,8 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}=
/drirc.d"
 FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpow=
ervr_rogue.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendo=
r.d"
-FILES:libgbm =3D "${libdir}/libgbm.so.*"
+FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
+FILES:libgallium =3D "${libdir}/libgallium-*.so"
 FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
@@ -372,6 +371,9 @@ FILES:libxatracker-dev =3D "${libdir}/libxatracker.so=
 ${libdir}/libxatracker.la \
 FILES:${PN}-tools =3D "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools =3D "1"
=20
+# All DRI drivers are symlinks to libdril_dri.so
+INSANE_SKIP:mesa-megadriver +=3D "dev-so"
+
 # Fix upgrade path from mesa to mesa-megadriver
 RREPLACES:mesa-megadriver =3D "mesa"
 RCONFLICTS:mesa-megadriver =3D "mesa"
--=20
2.39.5


