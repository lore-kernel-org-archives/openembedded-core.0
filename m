Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2854C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 06:19:19 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.8091.1675923554991412355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 22:19:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ABgkYKnF;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id bl9so315295iob.7
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 22:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y7Bbb19VL4hzx94PhkdUa1XsW5IpoShq7O2EXqxKg4=;
        b=ABgkYKnF5Uf1Vn12OLt4sYM3i+iys3hDFIjdVzQ0wToSLCanP3P1+LpBn+17cyaaG/
         9Kr/Mk5xTx1LJaVV/Pe9Mji85KrmUzopkhpt49l69cjkeNXZXO2YP+wQwGgYmaJhckU1
         XUN/Hk/POojWVcx6G0oS4mkGLlWdcLgPEdjbFXnY6+1jrPvIaqKar/MLYBMK5wqyCU+I
         uF37tujIUQlqhL0/1Z2XCB0AGShtGeC4cwnqDo3O6jfjPFdwn0oBlo2PY0H8dsBQJKl5
         vKzV7RgLsRQB5BdB3GAJ1hqmVDqpfgoqz/2C4RTcoa54U5/2ybyGBx7ATvpY8IbDyJl7
         EcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1y7Bbb19VL4hzx94PhkdUa1XsW5IpoShq7O2EXqxKg4=;
        b=7at2FxxzHl9qDCXesqSyZSRIEaUaODR3Ep+0xcxPtrPWq4xfO6Upl8/eV7IXdgfWy6
         j7FfW2TOjieJ5Djxi1c8Zgi/Yc03B/Q06ViDcIC/Kb+JSSnuxxzNf25rR67HyHp3rOJL
         OM7iC8FbtsKehQYB58CFvBdoQDEyhScvU7wRBw5MAMu6pmEToab9/nLOiDPMtVuM0RDc
         f3dBjnOWdEhrCLxRtJ2+eL0zLBOPJFQNUhu/5rm+wf0dCvRLtDJYeKHvoZCgSO0bthXw
         nLc45uRV7Ut9+bh74xOu79AOzP/b+rDmUVOr4XyaJybbhhuf3PTJpLw5lecHQHg+Q9LX
         qKGA==
X-Gm-Message-State: AO0yUKUHO5SvtbckKlDuITRh8W7d+tJpuurFu70oebVpWK99Q9i0jQhQ
	SWkp8BZyTyh0G44TrcMJ366oeGkYPrysVhgWqvE=
X-Google-Smtp-Source: AK7set8z4P8X3yV/8/lWeB+KflStW18WVxjWKL0eP5loNm2LfpLr0RvmRQJOvoIhXW9/AFrost97JUEaSKi6V5iPn1k=
X-Received: by 2002:a02:b785:0:b0:3c2:a284:287f with SMTP id
 f5-20020a02b785000000b003c2a284287fmr6194283jam.18.1675923554140; Wed, 08 Feb
 2023 22:19:14 -0800 (PST)
MIME-Version: 1.0
References: <003001d93b15$5c8396e0$158ac4a0$@gmail.com>
In-Reply-To: <003001d93b15$5c8396e0$158ac4a0$@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 9 Feb 2023 06:19:02 +0000
Message-ID: <CAO5Uq5T4NQ=BrHBWCBC+7sSPKnfdUoUC+qLpnFtVRPdnmhtxhQ@mail.gmail.com>
Subject: Re: Yocto Bug 14965 - Need info on rmeta hash
To: sundeep.kokkonda@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 06:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176915

Hi Sundeep

Not sure I can really help - at best I'm a novice rust user (albeit
with a team who are writing rust).

Looking at the source for rmeta generation
(https://github.com/rust-lang/rust/tree/master/compiler/rustc_metadata/src/=
rmeta)
it looks like it's really just a dump of internal state. So I'd expect
pretty much anything can cause it to change - running strings over a
couple of files I have here I see things like the compiler triple in
there and the paths to source files.

Given we're seeing this in libstd-rs, I wonder if this is really an
issue with how we're building libstd-rs - as far as I can tell the
(current) supported way to build it is as part of the whole compiler
build. Looking at the arch build by comparison its all in one pass,
albeit with no need for separate native/target complications:

https://github.com/archlinux/svntogit-packages/blob/packages/rust/trunk/PKG=
BUILD

Though I don't know how you'd fit that into our world.

On Tue, Feb 7, 2023 at 4:58 PM <sundeep.kokkonda@gmail.com> wrote:
>
> Hello Alex,
>
>
>
> I am working on Yocto bug 14965. There is a build failure happening durin=
g rust build because of 2 rmeta files with different hashes are generated.
>
>
>
> I found that the changes with below commit id causing the 2nd rmeta file =
(libcore-c5fc82c620226960.rmeta) generation.
>
> e33afcd0dc rust-common.bbclass: use built-in rust targets for -native bui=
lds
>
>
>
> I am trying to find the changes in build which causing the generation of =
2nd rmeta with different hash. I gave 2 builds by with & without e33afcd0dc=
 commit changes.
>
> I checked the sigdata of librsvg & libstd-rs in both builds and those are=
 identical.
> The dependency files (../build/tmp/work/core2-64-poky-linux/librsvg/2.54.=
5-r0/build/target/release/deps/*.d) also analysed and the shown differences=
 are only the changed hash value (did not get any info on what is causing t=
his change).
> But, some interesting changes I observed in '.rustc_info.json' which are =
related to e33afcd0dc commit. In this json file,
>
> 'host' tag changed from 'x86_64-linux-gnu' -> 'x86_64-unknown-linux-gnu',
> an extra 'target_feature=3D\"fxsr\' is added, and
> =E2=80=98rustc_fingerprint=E2=80=99 has different values between 2 builds=
.
>
> Since you know much about rust, can you let me know is there any way I ca=
n check which exact changes are causing the hash to be changed? also, are t=
he above changes in json file will cause hash to be changed?
>
>
>
>
>
> Thanks,
>
> Sundeep K.
>
>



--=20
Alex Kiernan

