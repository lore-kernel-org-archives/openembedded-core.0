Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C5EC54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 12:24:52 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.77174.1724761482681805945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 05:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBLeyVFT;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5334c4d6829so7491088e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724761481; x=1725366281; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7npMC0X6NCFnBn0QophD2JUztTWXm8RvgNEZI9M3Pk=;
        b=XBLeyVFTvzJTvRxzkg6cjF2JFIucdmAmtjySiGyk12UBUhx6w8pzuFjm4akkLIpK9N
         mQe5pLSp8aO7Q0Ziau0oyp2RqkFtJxfcreh/zUtH9LyZW+vnj0l9YJW/HmvxSIJPlsO3
         T3wxp82cUzS4JHOgnNVnzCPFrRJYODQ/qqjJ4TtgSKgOrGKAoxUKQO9//SveJYQ0Kif1
         2rBmbDoHapnqbgz+kAJ67JQCjSgb2RU5cdiT5mRAYQQqVdx0XTM/Nnk/2/XnDiSgfhxn
         rZR3mMYS1rgF152LU6BqFaMJ97ljCIE+M98xbabM0YyrylLUmOigGV/5+GnvBk+EZ9pj
         I/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761481; x=1725366281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7npMC0X6NCFnBn0QophD2JUztTWXm8RvgNEZI9M3Pk=;
        b=U0qvEL5fmHMun/LTiVFo6w/0jomOKBgH+OVBKiKx0hlMC7ijnozpAZ8Hx9d2rYwHyH
         +rtqw+7XZQ0mTW+bhiQjIlNBHgsf21QjoBY1YbmBpz2HQMIMu3EAxkCsEs4oqc/UZJ9d
         q1S74DCVdwaHtFISz1vN01fUpcUrAmjlfPBI34c4fnrbSjMlj3ubtkznTW9haTKEQk8K
         HrUn7pKFHHfkFbgx6E0NrNZYAggFrGiRjcvVJP5ivs3Qa1LfUWzJSTVomF7G0yptkiZC
         WDEqAs6ZpoC6JK9KEUtdk38yTycu9zPTF39FBcGU+LT+tHPvhC+GdTUl7UHVxTNJsE0C
         9KGg==
X-Forwarded-Encrypted: i=1; AJvYcCVfOklo25eYcOJMU4ZOgTWZRZiVqCSGxVMBkQdCTHG89WorPYT+vZeIIXGO7x8S+YXy3/O2B77FRFiQ7myA728YWA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBLGW407cRC0w79gj6CDIXcXMY5+iyU2LkzsYiboGVccX02WI4
	O5Gk/GD57DLPkSy2uvCKoPXlYdXWyiPekrzU4OfE44qbORuGWf0vC/XA0b6BqqCKlMVHFNLnI+e
	NVWN5fNWwFP7G/2rJBSVRzhDUB54=
X-Google-Smtp-Source: AGHT+IEX0ZIVoRD16yIzRBikMyfwkPVbLsK0sIHv0BGmRzRz1dfAFPCZhoG/ysqbTp91kIABicyyk7tVp2aszjNP8P8=
X-Received: by 2002:a05:6512:1192:b0:533:484a:7bf5 with SMTP id
 2adb3069b0e04-5344e4ee648mr1382408e87.44.1724761480188; Tue, 27 Aug 2024
 05:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
 <20240825170553.566798-2-Yash.Shinde@windriver.com> <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com>
In-Reply-To: <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2024 14:24:28 +0200
Message-ID: <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
To: Yash.Shinde@windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 12:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203837

> The error log says:
>
> stdio: ERROR: cargo-native-1.79.0-r0 do_compile: Execution of '/home/poky=
build/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native=
/1.79.0/temp/run.do_compile.1874995' failed with exit code 101
> stdio: ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/=
qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79.0/temp/log.do=
_compile.1874995
> stdio: ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/qemuarm64=
/build/meta/recipes-devtools/rust/cargo_1.79.0.bb:do_compile) failed with e=
xit code '1'
>
> stdio: ERROR: Command . ./oe-init-build-env; bitbake core-image-sato core=
-image-sato-sdk core-image-minimal core-image-minimal-dev core-image-full-c=
mdline core-image-sato:do_populate_sdk core-image-minimal:do_populate_sdk_e=
xt
> core-image-sato:do_populate_sdk_ext -k failed with exit code 1, see error=
s above. (1724719291.3: 11079.3)
>
> I checked "bitbake cargo -c do_compile", "core-image-minimal:do_populate_=
sdk" and core-image-sato:do_populate_sdk and all passed successfully.
>
> The build cmd has many core-image minimal and sato build cmds.
> Could you please help me to point out which of these exactly cause the is=
sue?

The key error is at line 22936:

error: linking with
`/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/wrapper/target-rust-ccld`
failed: exit status: 1
| |
| =3D note: LC_ALL=3D"C"
PATH=3D"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-=
linux/cargo-native/1.79.0/recipe-sysroot-native/usr/lib/rustlib/x86_64-unkn=
own-linux-gnu/bin:/home/pokybuild/yocto-worker/qemuarm64/build/scripts/nati=
ve-intercept:/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/sysroot=
s-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/qemuarm64/bui=
ld/build/tmp/work/x86_64-linux/cargo-native/1.79.0/recipe-sysroot-native/us=
r/bin/python3-native:/home/pokybuild/yocto-worker/qemuarm64/build/scripts:/=
home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/car=
go-native/1.79.0/recipe-sysroot-native/usr/bin/x86_64-linux:/home/pokybuild=
/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79=
.0/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/qemuarm64/bui=
ld/build/tmp/work/x86_64-linux/cargo-native/1.79.0/recipe-sysroot-native/us=
r/sbin:/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-l=
inux/cargo-native/1.79.0/recipe-sysroot-native/usr/bin:/home/pokybuild/yoct=
o-worker/qemuarm64/build/build/tmp/work/x86_64-linux/cargo-native/1.79.0/re=
cipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/qemuarm64/build/build=
/tmp/work/x86_64-linux/cargo-native/1.79.0/recipe-sysroot-native/bin:/home/=
pokybuild/yocto-worker/qemuarm64/build/bitbake/bin:/home/pokybuild/yocto-wo=
rker/qemuarm64/build/build/tmp/hosttools"
VSLANG=3D"1033" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/wor=
k/x86_64-linux/cargo-native/1.79.0/wrapper/target-rust-ccld"
"-m64" "/tmp/rustcgeGK7l/symbols.o"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/build_=
script_build-559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-cgu.0.rcg=
u.o"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/build_=
script_build-559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-cgu.1.rcg=
u.o"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/build_=
script_build-559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-cgu.2.rcg=
u.o"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/build_=
script_build-559f5ce7ae478850.build_script_build.a4202d660cdaa2b7-cgu.3.rcg=
u.o"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/build_=
script_build-559f5ce7ae478850.23ia22jv7py8po1d.rcgu.o"
"-Wl,--as-needed" "-L"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/build/target/release/deps"
"-L" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-li=
nux/cargo-native/1.79.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../us=
r/lib"
"-L" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-li=
nux/cargo-native/1.79.0/build/target/release/build/libz-sys-4aaad36e8fa0c1c=
8/out/lib"
"-L" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-li=
nux/cargo-native/1.79.0/build/target/release/build/libz-sys-4aaad36e8fa0c1c=
8/out/lib"
"-L" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-li=
nux/cargo-native/1.79.0/recipe-sysroot-native/usr/lib/rustlib/x86_64-unknow=
n-linux-gnu/lib"
"-Wl,-Bstatic" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work=
/x86_64-linux/cargo-native/1.79.0/build/target/release/deps/libtar-50d87f85=
44312d1c.rlib"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/build/target/release/deps/libfiletime-3998b29f82907e6b.r=
lib"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/build/target/release/deps/liblibc-8df5257514cf4a7e.rlib"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/build/target/release/deps/libfla
work/x86_64-linux/cargo-native/1.79.0/recipe-sysroot-native/usr/lib/rustlib=
/x86_64-unknown-linux-gnu/lib/libcompiler_builtins-8272a355176f4c87.rlib"
"-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl"
"-lc" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L"
"/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/c=
argo-native/1.79.0/recipe-sysroot-native/usr/lib/rustlib/x86_64-unknown-lin=
ux-gnu/lib"
"-o" "/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-li=
nux/cargo-native/1.79.0/build/target/release/build/cargo-559f5ce7ae478850/b=
uild_script_build-559f5ce7ae478850"
"-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "-nodefaultlibs"
| =3D note: /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttool=
s/ld:
/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/ca=
rgo-native/1.79.0/build/target/release/deps/liblibz_sys-28dfff8940ad7a90.rl=
ib(deflate.o):
relocation R_X86_64_32S against hidden symbol `_length_code' can not
be used when making a PIE object
| /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld:
/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/ca=
rgo-native/1.79.0/build/target/release/deps/liblibz_sys-28dfff8940ad7a90.rl=
ib(trees.o):
relocation R_X86_64_32S against hidden symbol `_length_code' can not
be used when making a PIE object
| /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld:
/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/ca=
rgo-native/1.79.0/build/target/release/deps/liblibz_sys-28dfff8940ad7a90.rl=
ib(zutil.o):
relocation R_X86_64_32 against `.rodata.str1.1' can not be used when
making a PIE object; recompile with -fPIE
| /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld:
/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/ca=
rgo-native/1.79.0/build/target/release/deps/liblibz_sys-28dfff8940ad7a90.rl=
ib(crc32.o):
relocation R_X86_64_32 against `.rodata' can not be used when making a
PIE object; recompile with -fPIE
| collect2: error: ld returned 1 exit status

I'm not sure what any of that means, but it could be specific to the
host distro (alma9 as seen in
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9385).

Alex

