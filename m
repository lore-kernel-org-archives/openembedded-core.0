Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98887CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:27:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.24562.1758119262347209633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 07:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RSWN8Si4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45f2b062b86so25719195e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 07:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758119261; x=1758724061; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1PgT6rzWiwdSjKXUSsl+bC1EfnN5OVl7xEOouoz4po=;
        b=RSWN8Si4Fkky67MvaM1K+2Fly5BUrjrzQFMPUiJMq83qgvk8DkGjps7iKDljuIRWm4
         euQqc4zseoHtO9q1eICMCsocOJ9n7FNV2o0Y3rlTM3HCiwfkO95a2Yx8dRxOQF858TaD
         4LJXdJTOMSl+jWjSGxWg8yJH5Nm+EfjFhdXw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119261; x=1758724061;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1PgT6rzWiwdSjKXUSsl+bC1EfnN5OVl7xEOouoz4po=;
        b=whfzrzvpmIRYWKf76HW8x5qFVuhfGM0tiYVjCQ2XyhdpvGm3nyzGqQ0jP3/XeyH9YW
         9CLjlzBLRvsmGJfUFZtxSmLDcXjXHeTf3gofn/aOeGn5SS0A36AH/LDJvw8u96flygL/
         P9eNYFl45ugn+aAh+lTiCViC0dmbplrnDU9NLdI9DMnD21xkSKyE3nTtx6lBRdKbZDpo
         jTLHaaO1Oa6AYmq2+ckp7Qy9Vx+VLz+6qtmdjHkxaEvi9OT5SusrimmEgvnWARKUeEbx
         lWY4zpeG2qpf3CuTj42i8OHpOwvYKa3Qc3nkLfpkIX3nXjdvcgQEyFUJvZDJHniWrYwK
         +DOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqJ2ccXfN2j+hNtOu+tE0f4C5y//I5rtbrz1JfMQVDsGz3pGdMROefZjCVGhLBneBkeWoAkPi1ZcaPBSIznt99Rg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzonlExCD5L7/ekJHTfKV8YONnxBnIle5m2ruP3DhwmlfkjUG7v
	DaoSu6ECERzKZSChqKJ91rpMxbmMg40hOmmnQXTXgvhuRC1KmiQdzn3kVzpP9QkpLww=
X-Gm-Gg: ASbGnctr7zCstPactYcumWxfP4eqLe0VlnZ6eoCSMvl7vanRb25ellwKsXPIuvj98Ki
	fIp63wPCcFPVDju1+MSXbVwuxNMR/4NLiTUYpKKyhcNstjF1EnZkWOWahYc+HY+fuO2UUUjDvxA
	9kM46YJQTzCQBFRf0OtMttptBs1hgg44+IkQ6GedhvQEX1jc/4uutSABgDdEcae3FH9lLyGeNBY
	6IIziZUmuDSkbhoDUzdCm1J0Hk7usz/KeBKcXQ5PSyfU4TAJeAZixLUX6CVzLEJNFtlBIknjnWy
	vQv8BS3zj7N5u1+JKIXxd97QSu6joTkATvV3cdixkAu3JvR6N6VbsjLodqk+CuFdrQuCfc+e06N
	MtCtIj3Voo/MTbU31V9m8WWtMBJg8VhfbLCxMOe6wSEdSiPJvAsw6xZ4+zHVnOvQR0yynOWuRzE
	euzOFVVcAln9w=
X-Google-Smtp-Source: AGHT+IH8es8FjcUj2VH6xucvXawntdyPm6vqoC3ihN4DrmJL4Yrd42HyGWJe1ZseNdsZlw480ZZKNw==
X-Received: by 2002:a05:600c:3b83:b0:45d:d88d:9ed9 with SMTP id 5b1f17b1804b1-4649c312cb1mr2537165e9.34.1758119260679;
        Wed, 17 Sep 2025 07:27:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a42a:bde0:2db0:730d? ([2001:8b0:aba:5f3c:a42a:bde0:2db0:730d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-461371847d0sm40482775e9.2.2025.09.17.07.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:27:40 -0700 (PDT)
Message-ID: <649e1641a6b3dac8cba302ea6b4b537da53ee892.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/8] clang: improve opt-viewer PACKAGECONFIG
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, ross.burton@arm.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Sep 2025 15:27:39 +0100
In-Reply-To: <DCV0ZAHF908J.1UVS55MZ1J8G3@bootlin.com>
References: <20250915191109.1117663-1-ross.burton@arm.com>
	 <DCV0ZAHF908J.1UVS55MZ1J8G3@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 14:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223608

On Wed, 2025-09-17 at 13:06 +0200, Mathieu Dubois-Briand via lists.openembe=
dded.org wrote:
> On Mon Sep 15, 2025 at 9:11 PM CEST, Ross Burton via lists.openembedded.o=
rg wrote:
> > Instead of patching the python module detection, we can use the hidden
> > option LLVM_TOOL_OPT_VIEWER_BUILD.
> >=20
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
>=20
> Hi Ross,
>=20
> Sorry, but it looks like one of these patches is breaking tc tests:
>=20
> ERROR: clang-native-21.1.1-r0 do_compile: Execution of '/srv/pokybuild/yo=
cto-worker/qemuarm64-tc/build/build-st-3689262/tmp/work/x86_64-linux/clang-=
native/21.1.1/temp/run.do_compile.1114131' failed with exit code 1
> ...
> /clang-tblgen.dir/ClangCommentHTMLNamedCharacterReferenceEmitter.cpp.o ut=
ils/TableGen/CMakeFiles/clang-tblgen.dir/ClangCommentHTMLTagsEmitter.cpp.o =
utils/TableGen/CMakeFiles/clang-tblgen.dir/ClangDataCollectorsEmitter.cpp.o=
 utils/TableGen/CMakeFiles/clang-tblgen.dir/ClangDiagnosticsEmitter.cpp.o u=
tils/TableGen/CMakeFiles/clang-tblgen.dir/ClangOpcodesEmitter.cpp.o utils/T=
ableGen/CMakeFiles/clang-tblgen.dir/ClangOpenCLBuiltinEmitter.cpp.o utils/T=
ableGen/CMakeFiles/clang-tblgen.dir/ClangOptionDocEmitter.cpp.o utils/Table=
Gen/CMakeFiles/clang-tblgen.dir/ClangSACheckersEmitter.cpp.o utils/TableGen=
/CMakeFiles/clang-tblgen.dir/ClangSyntaxEmitter.cpp.o utils/TableGen/CMakeF=
iles/clang-tblgen.dir/ClangTypeNodesEmitter.cpp.o utils/TableGen/CMakeFiles=
/clang-tblgen.dir/MveEmitter.cpp.o utils/TableGen/CMakeFiles/clang-tblgen.d=
ir/NeonEmitter.cpp.o utils/TableGen/CMakeFiles/clang-tblgen.dir/RISCVVEmitt=
er.cpp.o utils/TableGen/CMakeFiles/clang-tblgen.dir/SveEmitter.cpp.o utils/=
TableGen/CMakeFiles/clang-tblgen.dir/TableGen.cpp.o -o bin/clang-tblgen=C2=
=A0 /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/wor=
k/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/libLLVMSup=
port.a=C2=A0 /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-368926=
2/tmp/work/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/l=
ibLLVMTableGen.a=C2=A0 /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build=
-st-3689262/tmp/work/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native=
/usr/lib/libLLVMSupport.a=C2=A0 -lrt=C2=A0 -ldl=C2=A0 -lm=C2=A0 -lz=C2=A0 -=
lzstd=C2=A0 /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262=
/tmp/work/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/li=
bLLVMDemangle.a && :
> > /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/hos=
ttools/ld: /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/=
tmp/work/x86_64-linux/clang-native/21.1.1/recipe-sysroot-native/usr/lib/lib=
LLVMTableGen.a(TGLexer.cpp.o): in function `llvm::TGLexer::LexNumber() [clo=
ne .localalias]':
> > TGLexer.cpp:(.text._ZN4llvm7TGLexer9LexNumberEv+0xea): undefined refere=
nce to `__isoc23_strtoll'
> > /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3689262/tmp/hos=
ttools/ld: TGLexer.cpp:(.text._ZN4llvm7TGLexer9LexNumberEv+0xf1): undefined=
 reference to `__isoc23_strtoull'
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2313
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2308
>=20
> On the good news, reproducibility issues seem to be gone.

This is a horrible one.

For a bit of background and the fun we had in pseudo with this:

https://git.yoctoproject.org/pseudo/commit/?id=3D865ca5b647bba47ca5c4d3e655=
97d9a25d4261bf

Cheers,

Richard


