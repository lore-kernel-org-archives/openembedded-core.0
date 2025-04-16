Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAB1C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 16:05:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.23056.1744819555032089440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 09:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UaZutcAS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mEwS024769
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 16:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8x36pTNpTXEzlJHZwKEFjGPtF6/Mp9TdsptLiMjpJh0=; b=UaZutcASTr5S1F2R
	VJ512T0sJrAVsyXJzb2NjRf8tFNEvgjwciEHqn2mXAqdH4KxS2Of2o0dNfP5oQz6
	yXE2BEmI8CtlwwCUcHIt3x7IjW0ucDM4+qUGOdDAnDyQQ2JWFHABjk2eAZT9AF0K
	uPxhyBEO+HK1BfO4JS7kAIMYemKG5r6oPZZhP6puYJdvj/7lCG5HtXKKHjr21TKe
	mQy3wwz3ZHVvitMsOZOqg/LTbBoVcY7Sgh1/Z+/g5pWm09tZ5xtOk8Yy0PQjkarX
	C2iGxVfRyh1+oNaTvIWedTp8TqWiWXjIYPGUJJCUBHsSGeg2xttn163QOVvyJTkV
	uzaXvA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjc95g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 16:05:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-306b51e30ffso5984486a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819552; x=1745424352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8x36pTNpTXEzlJHZwKEFjGPtF6/Mp9TdsptLiMjpJh0=;
        b=f/M7m7KsZUkbwoHO2Ap108LQkluWxTh0zwf/MWhst6s/kbwnowIJ5aO/119rx1nd72
         +9D/P8K1Vfo3pJdXyMyyESrGfPnii95yRxcEx5NjANu8YdeGY3xkI7FbQk6n3+1ycAnM
         Eva5+B96QxnRElsjqYiJEjPwbkuF2QPJlm13b4CgNO+Th5JoiVFBU40tlHuNqXeQ46NZ
         xYQVVPP6MxGSszQH226qzqvP7R+FC1xw/nk/b3JEuVcSUaPjqjOD7OLoC8Y/fRwV6KC0
         Z2wVa6Zkxf3/baA7rXs8yMRwvO5lDY6gzw0NQMX7xIpQSgoH1dciKtCD1NcUhhgnqwUB
         pL/g==
X-Gm-Message-State: AOJu0YyvZ2N80AanEqIrCBK7SMCTBqVuCT9JP2FHVuFLZBJu4iGaqJcD
	itGn7jU0em5F1q3JhbeHSjdW5EtXvDyiKdCXd1GsEvoZVyj7RxxFqonr57frtWCSul3E84D1R/Y
	sv3lCdq+QctncW2IJgLJcUBcZwmC+FQswsg40Lj488L4qE5hRd2+lb4yVxV7ALHQdCzIcFoca1G
	djSEY9xk035jW3lJcacWHG7b4m5ple9r/0zJFZnCqPZ6w12pn43YHezb+ThyxMmQ==
X-Gm-Gg: ASbGncuNLdp+Ef3sXvYU7Fu56yATYl6N+vt9i3tCQ3YQTY/0mWDH5u0bp1HMR/aUN72
	FjzKFxEdpo9RyFJlj7AjeR494+XwlqIjX99BdPF1f2tfF5MW7I9/WFiyHJ+dIKQzV+RoHLsyYTF
	TuhcyJzMqq0+ercoIlCOiTEzR5
X-Received: by 2002:a17:90b:268e:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-30863f18540mr3978618a91.9.1744819552442;
        Wed, 16 Apr 2025 09:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKzZDmoXqS00ucayPY3NfZFzbBm758INFEHcwz7QmaSQQoLUuyDIJW7Ixz0y2hh0mhuk2I2epVMYec4Twj1Q8=
X-Received: by 2002:a17:90b:268e:b0:2fe:80cb:ac05 with SMTP id
 98e67ed59e1d1-30863f18540mr3978566a91.9.1744819551997; Wed, 16 Apr 2025
 09:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250416155929.2630778-1-dmitry.baryshkov@oss.qualcomm.com> <CAMKF1srC8E62aV5Vg6C2rhysmEvPcx1C1gQvRekWr2Fnmsv60Q@mail.gmail.com>
In-Reply-To: <CAMKF1srC8E62aV5Vg6C2rhysmEvPcx1C1gQvRekWr2Fnmsv60Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 19:05:40 +0300
X-Gm-Features: ATxdqUFKNkaMcQbvI7Jjk9NL_gBT_aTKOuLfahKkw8QT5Rz31oWh1ceZ2x8Cpas
Message-ID: <CAO9ioeVbpSUtw4hZBJcc9F59XV_OkPFZx5qDWqc=dx-cRhBAew@mail.gmail.com>
Subject: Re: [PATCH 1/3] llvm: import build fix from meta-clang
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67ffd562 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=SrIcC01xWQvUTe6s6YkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ibSiXxx1JP7shPkHgl3LGLpLPoYzykqM
X-Proofpoint-ORIG-GUID: ibSiXxx1JP7shPkHgl3LGLpLPoYzykqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 16:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214999

On Wed, 16 Apr 2025 at 19:04, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 16, 2025 at 8:59=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Import a fix from meta-clang, which allows packages using LLVM to find
> > tools from the native sysroot.
> >
>
> I am working on getting the clang merge into core. Perhaps it will be
> good to do this along with that.

I think this is good to go before, it helps to fix building of OE-Core
with the current meta-clang.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  ...gure-for-packages-using-find_package.patch | 117 ++++++++++++++++++
> >  meta/recipes-devtools/llvm/llvm_20.1.2.bb     |   1 +
> >  2 files changed, 118 insertions(+)
> >  create mode 100644 meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-conf=
igure-for-packages-using-find_package.patch
> >
> > diff --git a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-f=
or-packages-using-find_package.patch b/meta/recipes-devtools/llvm/llvm/0014=
-cmake-Fix-configure-for-packages-using-find_package.patch
> > new file mode 100644
> > index 000000000000..94c056ab8e0a
> > --- /dev/null
> > +++ b/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-pack=
ages-using-find_package.patch
> > @@ -0,0 +1,117 @@
> > +From 93141cee493022d9f39dbd1f5f0bb0a1110ac829 Mon Sep 17 00:00:00 2001
> > +From: Ovidiu Panait <ovidiu.panait@windriver.com>
> > +Date: Fri, 31 Jan 2020 10:56:11 +0200
> > +Subject: [PATCH] cmake: Fix configure for packages using find_package(=
)
> > +
> > +Currently, when a package (i.e. bcc [https://github.com/iovisor/bcc.gi=
t])
> > +that depends on LLVM/Clang tries to run cmake find_package() during
> > +do_configure, it will fail with a similar error:
> > +
> > +|   The imported target "llvm-tblgen" references the file
> > +|      ".../recipe-sysroot/usr/bin/llvm-tblgen"
> > +|
> > +|   but this file does not exist.  Possible reasons include:
> > +|   * The file was deleted, renamed, or moved to another location.
> > +|   * An install or uninstall procedure did not complete successfully.
> > +|   * The installation package was faulty and contained
> > +|      ".../recipe-sysroot/usr/lib/cmake/LLVMExports.cmake"
> > +|   but not all the files it references.
> > +
> > +This is due to the fact that currently the cmake scripts look for targ=
et
> > +binaries in sysroot. Work around this by not exporting the target bina=
ries in
> > +Exports-* cmake files.
> > +
> > +Upstream-Status: Inappropriate [oe-specific]
> > +
> > +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> > +---
> > + clang/cmake/modules/AddClang.cmake | 2 --
> > + llvm/cmake/modules/AddLLVM.cmake   | 9 ++-------
> > + llvm/cmake/modules/TableGen.cmake  | 6 ------
> > + 3 files changed, 2 insertions(+), 15 deletions(-)
> > +
> > +diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/=
AddClang.cmake
> > +index cdc8bd5cd503..5faa9117a30f 100644
> > +--- a/clang/cmake/modules/AddClang.cmake
> > ++++ b/clang/cmake/modules/AddClang.cmake
> > +@@ -182,7 +182,6 @@ macro(add_clang_tool name)
> > +     if (CLANG_BUILD_TOOLS)
> > +       get_target_export_arg(${name} Clang export_to_clangtargets)
> > +       install(TARGETS ${name}
> > +-        ${export_to_clangtargets}
> > +         RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
> > +         COMPONENT ${name})
> > +
> > +@@ -191,7 +190,6 @@ macro(add_clang_tool name)
> > +                                  DEPENDS ${name}
> > +                                  COMPONENT ${name})
> > +       endif()
> > +-      set_property(GLOBAL APPEND PROPERTY CLANG_EXPORTS ${name})
> > +     endif()
> > +   endif()
> > +   set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
> > +diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/Add=
LLVM.cmake
> > +index d3e9377c8d2f..fe22d6f2b35a 100644
> > +--- a/llvm/cmake/modules/AddLLVM.cmake
> > ++++ b/llvm/cmake/modules/AddLLVM.cmake
> > +@@ -1492,7 +1492,6 @@ macro(llvm_add_tool project name)
> > +       if( LLVM_BUILD_TOOLS )
> > +         get_target_export_arg(${name} ${project} export_to_llvmexport=
s)
> > +         install(TARGETS ${name}
> > +-                ${export_to_llvmexports}
> > +                 RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
> > +                 COMPONENT ${name})
> > +
> > +@@ -1503,10 +1502,8 @@ macro(llvm_add_tool project name)
> > +         endif()
> > +       endif()
> > +     endif()
> > +-    if( LLVM_BUILD_TOOLS )
> > +-      string(TOUPPER "${project}" project_upper)
> > +-      set_property(GLOBAL APPEND PROPERTY ${project_upper}_EXPORTS ${=
name})
> > +-    endif()
> > ++    string(TOUPPER "${project}" project_upper)
> > ++    set_target_properties(${name} PROPERTIES FOLDER "Tools")
> > +   endif()
> > +   get_subproject_title(subproject_title)
> > +   set_target_properties(${name} PROPERTIES FOLDER "${subproject_title=
}/Tools")
> > +@@ -1556,7 +1553,6 @@ macro(add_llvm_utility name)
> > +     if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
> > +       get_target_export_arg(${name} LLVM export_to_llvmexports)
> > +       install(TARGETS ${name}
> > +-              ${export_to_llvmexports}
> > +               RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
> > +               COMPONENT ${name})
> > +
> > +@@ -1565,7 +1561,6 @@ macro(add_llvm_utility name)
> > +                                  DEPENDS ${name}
> > +                                  COMPONENT ${name})
> > +       endif()
> > +-      set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS ${name})
> > +     elseif(LLVM_BUILD_UTILS)
> > +       set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY=
 ${name})
> > +     endif()
> > +diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/Ta=
bleGen.cmake
> > +index ffcc718b4777..a76f28e74b86 100644
> > +--- a/llvm/cmake/modules/TableGen.cmake
> > ++++ b/llvm/cmake/modules/TableGen.cmake
> > +@@ -232,12 +232,7 @@ macro(add_tablegen target project)
> > +
> > +   if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AN=
D
> > +       (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPON=
ENTS))
> > +-    set(export_arg)
> > +-    if(ADD_TABLEGEN_EXPORT)
> > +-      get_target_export_arg(${target} ${ADD_TABLEGEN_EXPORT} export_a=
rg)
> > +-    endif()
> > +     install(TARGETS ${target}
> > +-            ${export_arg}
> > +             COMPONENT ${target}
> > +             RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
> > +     if(NOT LLVM_ENABLE_IDE)
> > +@@ -248,6 +243,5 @@ macro(add_tablegen target project)
> > +   endif()
> > +   if(ADD_TABLEGEN_EXPORT)
> > +     string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
> > +-    set_property(GLOBAL APPEND PROPERTY ${export_upper}_EXPORTS ${tar=
get})
> > +   endif()
> > + endmacro()
> > diff --git a/meta/recipes-devtools/llvm/llvm_20.1.2.bb b/meta/recipes-d=
evtools/llvm/llvm_20.1.2.bb
> > index b51ab703a136..4b24d28364cd 100644
> > --- a/meta/recipes-devtools/llvm/llvm_20.1.2.bb
> > +++ b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
> > @@ -39,6 +39,7 @@ SRC_URI_SPIRV:append:class-native =3D " \
> >  SRC_URI =3D "https://github.com/llvm/llvm-project/releases/download/ll=
vmorg-${PV}/llvm-project-${PV}.src.tar.xz \
> >             file://0007-llvm-allow-env-override-of-exe-path.patch \
> >             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-=
as-we.patch \
> > +           file://0014-cmake-Fix-configure-for-packages-using-find_pac=
kage.patch \
> >             ${@bb.utils.contains('PACKAGECONFIG', 'spirv-llvm-translato=
r', '${SRC_URI_SPIRV}', '', d)} \
> >             file://llvm-config \
> >             "
> > --
> > 2.39.5
> >



--=20
With best wishes
Dmitry

