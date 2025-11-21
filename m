Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17809CFC267
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 11:47:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9749.1763725665530073503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 03:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IK0H4lwC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so11423735e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 03:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763725663; x=1764330463; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wGUX9cl3cJZ3YhxYlxJjJJLJnvT0hqPKZnsd+WP6BM=;
        b=IK0H4lwClUax2NacYwfp6tC1iH3bUsXQC/Gh6XpplnIRtkJBUzQaOyrK1J63Vh5kch
         Gg1iTva7ICGjH6FuJRpb/VMh1ylBT9wJICEaqc6JkJpBkdE+e6pIzX7SWki62gEZH6Na
         uY871/EhvWxvx7HdXVRMAeO9U6svBwDAKJ5JA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763725663; x=1764330463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wGUX9cl3cJZ3YhxYlxJjJJLJnvT0hqPKZnsd+WP6BM=;
        b=CWkqz4COP20EkRXcpmM4cZ+GWAi9lRVnjdrBhjCfyoCyRS1PDkslx5SyuWOsEeX03I
         0xrBwnB2jYEEyl4iRmA3wNQ2ZXoolDhXTZz6SYL4zAleGJydngFSfsvDZrMAWR8cq4K2
         1E1rWfU1zawEjt7PNSYZRgUHA6oJ8qxd6alF7a87bdmNCXD0Sq4sZzYhWj0Pf+1GGx5U
         tN330m4PxVhViu9idbOpC6dzeQL73RlyGJm7TB348htsVfHC3HRxDhXVuQR4xo5FqpTZ
         SZ6WU+ctO8HPX8DB//ckyH9vNzbcFQpproBF7Pu3bnMgoL+wHp59Pw77mSrCaY9Nrw1g
         t47g==
X-Forwarded-Encrypted: i=1; AJvYcCWOsnBjil5wxBt/5R/sKd9kSaGItdx9GokDtfxpTU75NYzw+0fdU/Lunp0GE+n9FBYwYEWoojhGhmr6b7WGLQhFDg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCw7cf9mwfFqUAnolIk6VpEwckOmA1aRafQyw/gOoc0JzBsNow
	mCJfxkKZ5gXeskNgt9gHDEgh6bmi8/HL6wOCmVyTKLalyTIG69TIE635PpZ4GDcnqTM=
X-Gm-Gg: ASbGncsTFpA5v2UJzLnjXXDlbxQo70xtmLZmeTD5l3VrmDSlu65TFPTEkpyX25452OL
	jI+x3kYhGp/Lv0keT82AjrY1J0v6a0xxBi5bI/Zxb90vU0dcaPiyMcqehEfhcYpBxFoswEXz2CM
	/AR9MITm0cKcaLj7UNNDC54MYr8lF9NQ6Ygiu7O0Ldul6MhqW41XF6j1I7gl7wwQoJcLCJHxTu5
	Wb5cUbMaWhuOKvNHvZw5vYa9yNEfRtKXvsdRt6y9rpfPqBs2m5X76NoLxQlPrEVgxTDx3R0R7eK
	yFgOmGHff3zHCe+F+ZLMAtwGob8fmqIuVEO1GGWtRy3dxLMQV6xBvwHIB3OQKXtXz7SYkHwbXgd
	yIuFCw3yknGoX3TayWt16DV7Uq6baz9wv/1ryLRbY9vMvZZg066PQt0K1HT+HG5xlt6eU9r4vBZ
	IK8Cay4foZreDChAO1kujRABUd8qfrNyZ0UMKNulqlMLeOZ8QVVNLXyUbNFItAkAur0FMkpfTB
X-Google-Smtp-Source: AGHT+IG98r/THctSpnxD4+h4AHtZmiNM3kQvT0BTX1jBcbCHJnPwOMF4XR2ajLdXywmV/DCm54Vttg==
X-Received: by 2002:a05:600c:1381:b0:477:994b:dbb8 with SMTP id 5b1f17b1804b1-477c016e7d5mr21123375e9.11.1763725663404;
        Fri, 21 Nov 2025 03:47:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a944:2a75:79dd:caf? ([2001:8b0:aba:5f3c:a944:2a75:79dd:caf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9de4765sm82606405e9.10.2025.11.21.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:47:42 -0800 (PST)
Message-ID: <b2f06ec99671955d7e45ef0815a865d226a93907.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] rust-common.bbclass: filter out incorrect
 compiler flags in wrapper
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: skandigraun@gmail.com, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2025 11:47:42 +0000
In-Reply-To: <8b45a24f-e24c-48d7-9674-65936d3bcc39@gmail.com>
References: <20251120121947.3473848-1-skandigraun@gmail.com>
	 <20251120121947.3473848-3-skandigraun@gmail.com>
	 <DEE9DLQRPI5N.368W9VM5LPRIA@bootlin.com>
	 <8b45a24f-e24c-48d7-9674-65936d3bcc39@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 11:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226672

On Fri, 2025-11-21 at 11:51 +0100, Gyorgy Sarvari via lists.openembedded.or=
g wrote:
> On 11/21/25 10:17, Mathieu Dubois-Briand wrote:
> > On Thu Nov 20, 2025 at 1:19 PM CET, Gyorgy Sarvari via lists.openembedd=
ed.org wrote:
> > > This patch is a workaround for https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D15976
> > >=20
> > > cc-rs crate is used by a number of projects, including rust's bootstr=
ap also
> > > to invoke the systems c/c++ compiler.
> > >=20
> > > A few updates ago it has changed the way CFLAGS/CXXFLAGS are handled:=
 it now
> > > merges them with HOST_C*FLAGS and TARGET_C*FLAGS.
> > >=20
> > > This is a problem when a recipe is cross compiled, but it has a build=
 dependency
> > > which uses this crate to be built. In this case the C*FLAGS variable =
contains
> > > target flags, while the HOST_C*FLAGS contains host-specific flags, an=
d when the
> > > two are mixed, the output is not what one expects.
> > >=20
> > > This change tries to filter out the incorrect flags:
> > > - If the wrapper is invoked as a c or c++ compiler wrapper,
> > > - then determines if it compiles for host or for target
> > > - Depending on the on above, it considers the TARGET_*FLAGS or HOST*F=
LAGS
> > > =C2=A0 correct, and the C*FLAGS variable content incorrect.
> > > - It subtracts the correct set from the incorrect set, and drops the
> > > =C2=A0 remainder from the compiler flags. (Which might be often an em=
pty list, so
> > > =C2=A0 the flags are frequently unchanged)
> > >=20
> > > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > > ---
> > Hi Gyorgy,
> >=20
> > Thanks for your patch.
> >=20
> > I suspect one of the commit of this series is responsible of this rust
> > test failure:
> >=20
> > 2025-11-20 21:59:48,098 - oe-selftest - INFO - FAIL: rust.RustSelfTestS=
ystemEmulated.test_rust (subunit.RemotedTestCase)
> > ...
> > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/ope=
nembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapp=
ed_f
> > =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
> > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/ope=
nembedded-core/meta/lib/oeqa/selftest/cases/rust.py", line 131, in test_rus=
t
> > =C2=A0=C2=A0=C2=A0 retval =3D runCmd(cmd)
> > =C2=A0 File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/ope=
nembedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
> > =C2=A0=C2=A0=C2=A0 raise AssertionError("Command '%s' returned non-zero=
 exit status %d:\n%s" % (command, result.status, exc_output))
> > AssertionError: Command 'export TARGET_VENDOR=3D"-poky"; export PATH=3D=
/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/work/x=
86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin/python3-nativ=
e:/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/work=
/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin:/srv/pokybu=
ild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/work/x86-64-v3-po=
ky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/p=
okybuild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/hosttools:$P=
ATH; export RUST_TARGET_PATH=3D/srv/pokybuild/yocto-worker/qemux86-64-tc/bu=
ild/build-st-1700604/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/rust-targets=
; export RUSTFLAGS=3D'-C strip=3Ddebuginfo'; export TEST_DEVICE_ADDR=3D"192=
.168.7.6:12345"; cd /srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-s=
t-1700604/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/sources/rustc-1.90.0-sr=
c; python3 src/bootstrap/bootstrap.py test=C2=A0 --exclude src/bootstrap=C2=
=A0 --exclude src/doc/rustc=C2=A0 --exclude src/doc/rustdoc=C2=A0 --exclude=
 src/doc/unstable-book=C2=A0 --exclude src/etc/test-float-parse=C2=A0 --exc=
lude src/librustdoc=C2=A0 --exclude src/rustdoc-json-types=C2=A0 --exclude =
src/tools/coverage-dump=C2=A0 --exclude src/tools/jsondoclint=C2=A0 --exclu=
de src/tools/lint-docs=C2=A0 --exclude src/tools/replace-version-placeholde=
r=C2=A0 --exclude src/tools/rust-analyzer=C2=A0 --exclude src/tools/rustdoc=
-themes=C2=A0 --exclude src/tools/rust-installer=C2=A0 --exclude src/tools/=
test-float-parse=C2=A0 --exclude src/tools/suggest-tests=C2=A0 --exclude sr=
c/tools/tidy=C2=A0 --exclude tests/assembly-llvm/asm/aarch64-outline-atomic=
s.rs=C2=A0 --exclude tests/codegen-llvm/issues/issue-122805.rs=C2=A0 --excl=
ude tests/codegen-llvm/thread-local.rs=C2=A0 --exclude tests/mir-opt/=C2=A0=
 --exclude tests/run-make=C2=A0 --exclude tests/run-make-fulldeps=C2=A0 --e=
xclude tests/rustdoc=C2=A0 --exclude tests/rustdoc-json=C2=A0 --exclude tes=
ts/rustdoc-js-std=C2=A0 --exclude tests/ui/abi/stack-probes-lto.rs=C2=A0 --=
exclude tests/ui/abi/stack-probes.rs=C2=A0 --exclude tests/ui/codegen/misma=
tched-data-layouts.rs=C2=A0 --exclude tests/codegen-llvm/rust-abi-arch-spec=
ific-adjustment.rs=C2=A0 --exclude tests/ui/debuginfo/debuginfo-emit-llvm-i=
r-and-split-debuginfo.rs=C2=A0 --exclude tests/ui/feature-gates/version_che=
ck.rs=C2=A0 --exclude tests/ui-fulldeps/=C2=A0 --exclude tests/ui/process/n=
ofile-limit.rs=C2=A0 --exclude tidyselftest --no-doc --no-fail-fast --bless=
 --target x86_64-poky-linux-gnu' returned non-zero exit status 1:
> > ...
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2691
> >=20
> > Can you have a look at this error?
>=20
> Yes, I did already:
> https://lists.openembedded.org/g/openembedded-core/message/226640=C2=A0- =
I
> believe this should take care of this issue
> (but I have to admit that currently I struggle executing the selftest on
> my machine - both inside and outside of docker I get mysterious qemu
> startup errors).

I think I saw that issue in selftest with your patch applied.

I'm trying a simpler patch on master-next right now as a workaround.

Cheers,

Richard

