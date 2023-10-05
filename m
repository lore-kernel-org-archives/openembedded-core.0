Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC51EE9270B
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 15:11:51 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.17936.1696518700726724173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 08:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPcTs3c1;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9338e4695so13598601fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696518698; x=1697123498; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Z18KtBZ4HPSdX5jf3+LcIWN//hT3uX1LCf9mUM2sPI=;
        b=nPcTs3c1cXVid2KGxXwmsZEJ29MgqO+I0A4/LfTBvLh4fEFvrl4Ra4DXTpspoSZ2MN
         pPa/Avwb+nCe69pkngzJ+aWAixiIS57efLaM4XpB1wktV2VvIJTTaPEOZc+oTdio8TZW
         SXw/nTaa/sy1FMm4ZB/k1xYAvZ33VtIqdTe9PXkJdrPCtIa6W1MrxcXiBVJPHYwF+q+O
         vkwiNziS/XJyTOsY/1hoE4rQpSmVnalWjAnuCzITqfnO6PSGc8Y8i0shJkYOC3meOyfp
         6sIKvgiuuo7h402d70gVMr3+/NIDSRPEq4dtMQtoMhkQBBaPJlxRXDkEa7pyvLYEZ6Hb
         Nu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696518698; x=1697123498;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Z18KtBZ4HPSdX5jf3+LcIWN//hT3uX1LCf9mUM2sPI=;
        b=bRIZrBbzV6rgMj2B52IAkbYAXgB1sTlY7tq5G2XN0hUCYsjCcxHW0LUfVutKCtLJfc
         IUt/TEOCewN6hW8HQS8Cg50snZ3t+8tR94rsZJP1N77Nzss0EQDybEF/gfbafEqSxB3Z
         D/CzzBv/azl+wS+l3bf7IagTTlyzOCXbwZ1VTJuZrGkZt/wuLYaYW/bFts/Kh+BZN3E8
         UCm7dJLrPHZ7/8c66zArdYlpmTD5/5uUM1N9wdY1+LsCUIiry9D34vZvEFDmh5Pvr5nE
         NADcJLdo8XVYf30mqCCkrAktD6J0qSKeHwHLXPemUhz/Dx/VOdITCOXERjPQZEo9CrKc
         V9ow==
X-Gm-Message-State: AOJu0YyXQ05TtJv0YYGIlnBo5rmHLOBTl7OuxaDCDSKYXJJuO9ZEDSxo
	PXib5P440yfFy5fMyF5WqpA=
X-Google-Smtp-Source: AGHT+IHLnqfVaXY9PetTeSEBe6VAC7VodO79VRkOkBPdMC2GqPhofJo93+FfSBTW/8cfmrLvqIG+/g==
X-Received: by 2002:ac2:43cf:0:b0:503:655:12e0 with SMTP id u15-20020ac243cf000000b00503065512e0mr4623461lfl.50.1696518698131;
        Thu, 05 Oct 2023 08:11:38 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d60ce000000b0032763287473sm1990932wrt.75.2023.10.05.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:11:37 -0700 (PDT)
Message-ID: <a78c16681f1f2220041c90a94dddfcee9d20ef54.camel@gmail.com>
Subject: Re: [OE-core][RFC 2/2] rust-cross-canadian: set
 CARGO_TARGET_<triple>_RUNNER for nativesdk
From: adrian.freihofer@gmail.com
To: kasper@krinvent.dk, Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Thu, 05 Oct 2023 17:11:36 +0200
In-Reply-To: <CANNYZj9fD256i8hzOuvSswfMLBv6NZ+fK+wjEActVoFrOYdZXQ@mail.gmail.com>
References: <20230928081035.604380-1-sean@geanix.com>
	 <20230928081035.604380-2-sean@geanix.com>
	 <CANNYZj9mQZuFDUCVVZDMpm0zPVFwDTW-w55i6NRpCwSja6aNjw@mail.gmail.com>
	 <1696245131835.6.23594@webmail-backend-production-787464fbc7-86bhw>
	 <CANNYZj9fD256i8hzOuvSswfMLBv6NZ+fK+wjEActVoFrOYdZXQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 15:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188722

Hi Kasper, hi Sean

Yes, I did some trials with C/C++. There are 3 different approaches
which I investigated into. All come with pros and cons.

1. compiling for the SDK (native) is easy and running the resulting
binaries on the host also works. It is also relatively easy to create
an tool-chain environment file that can be used to use the host
toolchain with the native Yocto sysroots. I guess that's the proposed
approach here.

The downside to this idea is that it is not really reproducible.
Compiling for the host uses the compiler and other tools provided by
the host distribution. Since these may be different, the result and
errors may also be different. Also, all recipes involved must be
patched with the line BBCLASSEXTEND =3D "native nativesdk", which cannot
be mainlined unless it makes sense to use a recipe as a native recipe
in general. As far as I know, the Yocto project rejects such only
partially implementable ideas for good reasons.

2. Stick to cross-compiling also for this use case, but compile for a
MACHINE (e.g. Qemu) with the same CPU architecture as the host has can
work as well. The build part is solved acc. the concepts of Yocto. But
executing the binaries on the host is not that straight forward. For
example this does not work even if xz is compiled for the same ARCH as
the host has:

./build/tmp/work/corei7-64-ccp-linux/xz/5.2.6-r0/image/usr/bin/xz --
help
bash: ./build/tmp/work/corei7-64-ccp-linux/xz/5.2.6-
r0/image/usr/bin/xz: cannot execute: required file not found

With a little trick (using the correct linker) it works:

LD_LIBRARY_PATH=3D"./build/tmp/work/corei7-64-ccp-linux/xz/5.2.6-
r0/recipe-sysroot/lib:./build/tmp/work/corei7-64-ccp-linux/xz/5.2.6-
r0/recipe-sysroot/usr/lib" ./build/tmp/work/corei7-64-ccp-
linux/xz/5.2.6-r0/recipe-sysroot/lib/ld-linux-x86-64.so.2
./build/tmp/work/corei7-64-ccp-linux/xz/5.2.6-r0/image/usr/bin/xz --
help
Usage: ./projects/ccp-sd-virt/tmp/work/corei7-64-ccp-linux/xz/5.2.6-
r0/image/usr/bin/xz [OPTION]... [FILE]...
Compress or decompress FILEs in the .xz format.
...

3. Use Qemu to execute the binaries. This approach is transparently
implemented with my SDK here:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/devtool-ide

If for example the unit tests are executed in VSCode they just run even
if they have a different architecture than the host has. This is fully
supported by meson and by cmake. The disadvantage of this approach is
that Qemu is not transparent when it comes to debugging and probably
other use cases.

Regards,
Adrian


