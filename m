Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CAACAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 09:36:25 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.5165.1760088983675227358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 02:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K/ETkuwv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so1442523f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760088982; x=1760693782; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U90H/WJJ4bO5Nil8onC9rLcPKI2Ac5834OEWeUGDxlE=;
        b=K/ETkuwvFGLhmaAOJgmaeVr19DywZc200V+G1VST84Zm1sl0XS9OThM1o3d3KDePIO
         kIwtFolvveZvu76fzP//EExywkZW+Mq2r0m/fn3q/OE+o8Sgw2uvzxyTAAPbkNQ9WAkz
         Hnn3qLn8/Vd3g4KTR0auA38XCICFrvztjqtro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760088982; x=1760693782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U90H/WJJ4bO5Nil8onC9rLcPKI2Ac5834OEWeUGDxlE=;
        b=I2zZBc3ySvwbk2xHsVCJKGpEigErzite1MBBB7J8Lg9ov7czdM6bnDWzjiUNC2xTA3
         KeNwsrWumo8usURpm2114u+SgQ3WUcPxmCukclbfpub4mELAssZFnT80ITpZwtRCViqO
         vKcxOqyScz1IxbudNg0ZvG6ufNnj3rm41oM8fUNWhhtPllruFg29usMfDMCLFiiP8Tmc
         w806jS9t68uwnNOb6fheSLL+OBe38fO0hNT0mG8/E6TpTB+hFSxU18iRz8MNqWCCUquX
         vLRC4So6PjfYnBBks1OuEuD2BJ35ezN0UzE3DZjL1NYtL+tx4xrzCBuKLVbHCAYLPsTB
         RhtA==
X-Gm-Message-State: AOJu0YyenE8eNWjj99L79KGrl4ytTD/A7vzslmXEb6VXln0ntbQ7RRMA
	nV0Fbumlwledn+EQBlvMJgs0mJjRwELRAMEHJC1DG7rN1qKbKMUd5Yd6b/ccpunrcrE=
X-Gm-Gg: ASbGncucSXcfUZTjIpFP9B7XMP4A1vV/p0yken/64aI3xeF98Wr/mUP6pdYsVwkRz18
	tGjZ2H3/F4OxBbgIun2vnyjEfbaUnVVon4Kf1Mf4BwTDSEUzY/Cr6fgx6wNTukNGwH5GFxHlwLB
	Bo/yltypFIZY6tOxn+5QxJ7ZegLd04q9BYK0fD/kHmNIuJLFJKjv8QmYneC3+BxceOo6gjcHKBg
	bHpjWQXj/9rdk+v412a09S1+cSNdW6FE6XV2Ec3JrOLZjbskvONJD7m9IUtvsicolyOcYXyqKYe
	L0l16DAjFUzH1Pw4fJO6cZiGzjnRBGG8HmKuG6LCBFhdISlUrQqwuCr+nxAOnA7CRAzNfjAXrUV
	DHWgLrY7/uu2cjHhQbZOUBpXQz/nM1/t5uxaCLbYAboDdLXUI9ljWZBI0QDIFYuzjwSp7vxdFUi
	/oqhv761tVrHvU8U+rffGZxSfKtX2Q4Q==
X-Google-Smtp-Source: AGHT+IH16OWqdVeVWTVeZT2l/qe2lW/a0Be92WVFBDksS1xQ3QKTqJPZyQThgcucmGG05TaFB58bUw==
X-Received: by 2002:a05:6000:400a:b0:408:5363:8266 with SMTP id ffacd0b85a97d-4266e7df744mr7991120f8f.44.1760088981940;
        Fri, 10 Oct 2025 02:36:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d6b:fc42:c556:a557? ([2001:8b0:aba:5f3c:3d6b:fc42:c556:a557])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d404sm3425654f8f.3.2025.10.10.02.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 02:36:21 -0700 (PDT)
Message-ID: <7e0eafcdb3e14505c20fd86e7e4c46aaf944e9e4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>, Khem Raj
	 <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Date: Fri, 10 Oct 2025 10:36:20 +0100
In-Reply-To: <c92e491f-6348-4c73-b899-c28611a5f803@windriver.com>
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
	 <9433bf5a-8648-4142-a17f-69092253dd46@gmail.com>
	 <f07bc225-e3b6-4ac9-b6e4-de52d4053618@windriver.com>
	 <CAMKF1spO_MP=CtN8rdG3S=YE2qmUEVYfCDsRrxzo6pipvpJD6w@mail.gmail.com>
	 <55dd2edb-6faf-446d-b28a-4bace9859169@windriver.com>
	 <CAMKF1srTjQc4ib7vo4+OPdDxzKj6fWowniUQajcvRGy-nUDv2w@mail.gmail.com>
	 <a7b7c7a1-7110-427b-b883-c097e62c447f@windriver.com>
	 <d9e3ca199410d01d4703bc5a07e16632e8a41272.camel@linuxfoundation.org>
	 <c92e491f-6348-4c73-b899-c28611a5f803@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 09:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224674

On Fri, 2025-10-10 at 14:57 +0530, Deepesh Varatharajan wrote:
>=20
> As you suggested, I was able to resolve the missing library issue by=20
> creating symlinks from the native sysroot to the target sysroot.
> However, I'm now encountering a linker error during the build:
>=20
> ../poky/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/rust/1.90.0/=
recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky=
-linux-gnueabi/gcc/arm-poky-linux-gnueabi/15.2.0/ld:=20
> ../poky/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/rust/1.90.0/=
sources/rustc-1.90.0-src/build/x86_64-unknown-linux-gnu/stage1-rustc/armv7-=
poky-linux-gnueabihf/release/deps/librustc_llvm-3e591ab97f1ae683.rlib:=20
>=20
> error adding symbols: file format not recognized
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0collect2: error: ld returned 1=
 exit status
>=20
> Upon investigation, I found that the issue stems from architecture=20
> mismatches within "librustc_llvm-3e591ab97f1ae683.rlib". I extracted
> the object files from this archive and ran the file command to inspect=
=20
> them. Most object files were correctly built for the ARM 32-bit (target):
> ELF 32-bit LSB relocatable, ARM, EABI5 version 1 (SYSV), with=20
> debug_info, not stripped
>=20
> However, some of the object files (originating from the symlinked native=
=20
> sysroot libraries) were built for the host architecture (x86_64):
> ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped
>=20
> This mixture of architectures in a single .rlib is causing the linker to=
=20
> fail, and confirms that symlinking missing libraries
> from the native sysroot won't work. So to resolve the issue we've left=
=20
> with only one option to build llvm target also for all
> the architectures as we build for native llvm build.
>=20
> Please let me know if you=E2=80=99re okay with this approach, and I can p=
roceed=20
> with sending the patch.

Thanks for trying that, I think it was worth trying and it is shame it
didn't quite work out. I agree with proceeding with the other
direction, thanks.

Cheers,

Richard

