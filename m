Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D649CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 16:24:54 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.28156.1758126284125713464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 09:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aDuuFwG4;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-72267c05050so286927b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 09:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758126283; x=1758731083; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G0houGmGCsxDvqBOIQEfvsNHK0pw6FqvLd1bQ5RA+I=;
        b=aDuuFwG4iZ2Wf9WBkw2Fvnkb2k6r0NVz4ErPpV4c+7dvM+s9Lbbxm7eK3mRCCh9y+g
         UOBDq0Rlf+iZ5Cjo2Avdz81ElXtDRj8kFLybTEWT8UGAXiEXVS/MncI5vri8oPtr5tY5
         HKR/PvblkLyBLmck440T7lSGKjsiHHwVlXG1SmRl9Ap1uHVgJBoEhIXPs9uY9QJNM77t
         s2rjy+frLHdx9cct4vtrZ5c3Mtq0kpGr2KFSW2j6j3zxhTn0QbrKKR0BUFCN9FTaBTrx
         Bl5Ke0gn9QXoc/guOmdVVIH358NSHHbReBCPEoeFj6/0DX195ROSotE7/z33LpbSWKzW
         MBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758126283; x=1758731083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5G0houGmGCsxDvqBOIQEfvsNHK0pw6FqvLd1bQ5RA+I=;
        b=gDHer5jSrcGf9RbclYt6Z+6tI/ju+wuAsj7JGol2etH6WQv3HKJ5wBJ5m+UoaHElwe
         nje6fOuv+ClVFKaZYQ5WXxsH+Fx2Ec/Mcz8JYECVD640Lbpj21dVXtb5to1AQdUcxSkm
         adjqmIyIXzxqHrm8BxPpO4wSkIMKdv6X8AIVtDj/iy2DsPiASIYLfFV4Tblw/wBgNTs/
         x7PH1jLQh0VPYvO0EHimkIuXyo6o8cXkiHwBKSqWyqUYwOESYbWyPKwbDP9aOG33Tc4w
         7amFolbTh9SsRBaRrPMfSM4Y1uiDOZnm9IQtGBNwEszl6PNqwybLOK8ANyw7dWMkLSiF
         L1VA==
X-Forwarded-Encrypted: i=1; AJvYcCUPf58o+k6RLLIiWKXIPk1+405v+D6D2Ap4tyOnCUnu62i0xtTKpKL9pTa0v42O7/YmlBxMyPlhuxkpXy1instnew==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6auySEmBWI6hD8tY8fHFhPYLwBtYWgymjwLCEjWlS3W5WP1mx
	wwGPTyDEy1AQue3m1H+K1NLNi627nWmZI1+1dD6o73qJss/GYcHJ7vVTtTrOOuBVbiGw+JFBWQm
	Zk8sQD6ZKv0zrHfHISRW/pCqDSkBdhPo=
X-Gm-Gg: ASbGncuouFdziVCrVZm/q1Pcfy+TRqQpybJH1/kmwLtQ/FduSdxfYdH8IYc7YkMtcbp
	3LF7bL10TvgVKouiZtDj53knCNEDjtusuZUDyk1mAVsX6LH6FxSNrM6csZXgOZVyM1J76LX98Qs
	wBL4wQnhxh9tuKywld9GdwYnJmRu8AQMT1O2O9RItPlrvu2lV0bO4pDs0faSTABC8JuzuqW/iiX
	MBkEqE2hMQRTbIABTU3xjhKWjb+HHw0VLkeiOup8gPUWMee84XVD/+canAw5do+wOMqPTDPefRK
	XMatKKH0QDZ7ruEqDkcjXcOVqafLdW0PPg==
X-Google-Smtp-Source: AGHT+IF/UyfrwZiYGbrK5msTX2dIwFl1K+bG+f7iiMWvhftrQhOwjZ6ddUHjj2E/CbtmTIkk0R3GAKKD+nn2k7lRy8Y=
X-Received: by 2002:a53:bb4e:0:b0:62c:aa66:973e with SMTP id
 956f58d0204a3-633b0600cdbmr1811860d50.5.1758126283057; Wed, 17 Sep 2025
 09:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250915191109.1117663-1-ross.burton@arm.com> <DCV0ZAHF908J.1UVS55MZ1J8G3@bootlin.com>
 <649e1641a6b3dac8cba302ea6b4b537da53ee892.camel@linuxfoundation.org>
In-Reply-To: <649e1641a6b3dac8cba302ea6b4b537da53ee892.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2025 09:24:16 -0700
X-Gm-Features: AS18NWAbKfH5mqHjDGlMQ17TcGNFycRjcZ0idSGJsWkevRgAaGohuAHnw7G2thg
Message-ID: <CAMKF1sq2fGEMYKsbNDwC+z5NuScxzoQXD7bRcAhgXdAhspJLUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/8] clang: improve opt-viewer PACKAGECONFIG
To: richard.purdie@linuxfoundation.org
Cc: mathieu.dubois-briand@bootlin.com, ross.burton@arm.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 16:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223613

On Wed, Sep 17, 2025 at 7:27=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Wed, 2025-09-17 at 13:06 +0200, Mathieu Dubois-Briand via lists.openem=
bedded.org wrote:
> > On Mon Sep 15, 2025 at 9:11 PM CEST, Ross Burton via lists.openembedded=
.org wrote:
> > > Instead of patching the python module detection, we can use the hidde=
n
> > > option LLVM_TOOL_OPT_VIEWER_BUILD.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> >
> > Hi Ross,
> >
> > Sorry, but it looks like one of these patches is breaking tc tests:
> >
> > ERROR: clang-native-21.1.1-r0 do_compile: Execution of '/srv/pokybuild/=
yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/work/x86_64-linux/clan=
g-native/21.1.1/temp/run.do_compile.1114131' failed with exit code 1
> > ...
> > /clang-tblgen.dir/ClangCommentHTMLNamedCharacterReferenceEmitter.cpp.o =
utils/TableGen/CMakeFiles/clang-tblgen.dir/ClangCommentHTMLTagsEmitter.cpp.=
o utils/TableGen/CMakeFiles/clang-tblgen.dir/ClangDataCollectorsEmitter.cpp=
.o utils/TableGen/CMakeFiles/clang-tblgen.dir/ClangDiagnosticsEmitter.cpp.o=
 utils/TableGen/CMakeFiles/clang-tblgen.dir/ClangOpcodesEmitter.cpp.o utils=
/TableGen/CMakeFiles/clang-tblgen.dir/ClangOpenCLBuiltinEmitter.cpp.o utils=
/TableGen/CMakeFiles/clang-tblgen.dir/ClangOptionDocEmitter.cpp.o utils/Tab=
leGen/CMakeFiles/clang-tblgen.dir/ClangSACheckersEmitter.cpp.o utils/TableG=
en/CMakeFiles/clang-tblgen.dir/ClangSyntaxEmitter.cpp.o utils/TableGen/CMak=
eFiles/clang-tblgen.dir/ClangTypeNodesEmitter.cpp.o utils/TableGen/CMakeFil=
es/clang-tblgen.dir/MveEmitter.cpp.o utils/TableGen/CMakeFiles/clang-tblgen=
.dir/NeonEmitter.cpp.o utils/TableGen/CMakeFiles/clang-tblgen.dir/RISCVVEmi=
tter.cpp.o utils/TableGen/CMakeFiles/clang-tblgen.dir/SveEmitter.cpp.o util=
s/TableGen/CMakeFiles/clang-tblgen.dir/TableGen.cpp.o -o bin/clang-tblgen  =
/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/work/x8=
6_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/libLLVMSupport=
.a  /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/wor=
k/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/libLLVMTab=
leGen.a  /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tm=
p/work/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/libLL=
VMSupport.a  -lrt  -ldl  -lm  -lz  -lzstd  /srv/pokybuild/yocto-worker/qemu=
arm64-tc/build/build-st-3689262/tmp/work/x86_64-linux/clang-native/21.1.1/r=
ecipe-sysroot-native/usr/lib/libLLVMDemangle.a && :
> > > /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/h=
osttools/ld: /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-368926=
2/tmp/work/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/l=
ibLLVMTableGen.a(TGLexer.cpp.o): in function `llvm::TGLexer::LexNumber() [c=
lone .localalias]':
> > > TGLexer.cpp:(.text._ZN4llvm7TGLexer9LexNumberEv+0xea): undefined refe=
rence to `__isoc23_strtoll'
> > > /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/h=
osttools/ld: TGLexer.cpp:(.text._ZN4llvm7TGLexer9LexNumberEv+0xf1): undefin=
ed reference to `__isoc23_strtoull'
> >

I wonder if we have a uninative out of sync here, the build is on
debian12 and it has glibc < 2.38 so __iso23 symbols won't be there.

> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2313
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2308
> >
> > On the good news, reproducibility issues seem to be gone.
>
> This is a horrible one.
>
> For a bit of background and the fun we had in pseudo with this:
>
> https://git.yoctoproject.org/pseudo/commit/?id=3D865ca5b647bba47ca5c4d3e6=
5597d9a25d4261bf
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223608): https://lists.openembedded.org/g/openembedde=
d-core/message/223608
> Mute This Topic: https://lists.openembedded.org/mt/115260480/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

