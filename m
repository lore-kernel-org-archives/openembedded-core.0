Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD6BC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 21:54:18 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.2350.1668376454965625065
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 13:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AAO7R68r;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id s24so10814014ljs.11
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 13:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eV2L8P5/oj2kkmk0c9DgF92QCmMJ8wNPUiJrJMPjxHw=;
        b=AAO7R68rKAryDJ+qcs3NjZvzw5KJ22jOpU2UlfDURSa12G/3Mfus2OQF8J/p0kJJp1
         EaALJn8kF29ZpdwwVkYNiNbIUBXYmYkdAcUFmX+D7qAJG6qHXBgr2U0PkQOdMIHQBC7D
         P7jNfcETwgCFgg9s8WCmI2PKnzNsHA8rEXAuV9PG7qsgDCWwQFB2lB4SlI96kLZbCBz2
         mfUuvKuFPgJRI4ht83JVMTFNLHlSYA2RYiT8JE0jl5ndAtWwV7Y+MpvfrlxCVrpI3oKv
         UeePs3bztc44ZlijviU+apNkZ2AZ0y3ozwo0f+Gxl5iA6T4dQDEdFci52U0UT+aBDoDf
         zgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eV2L8P5/oj2kkmk0c9DgF92QCmMJ8wNPUiJrJMPjxHw=;
        b=SVaf3PZDo78bmFeK/6nlIyk/+10waAeoxRgrM0xkiKW/y/SYA9JJK5BxNvrEwDe61k
         uANcRxldJOOh8/N8esafiLF0pmq5vDm5AP1Lazj4Sdrj01gnf/ZZgdsTdxxt/Q1MXCXV
         ws/4B/SqhWOeiRK6rPX4jRzW2k5vUgU+XvgHqwv6yBG+oPFfQa/MQ3qZqQgVhrYUCkuq
         r4ZsbeQM7KpulfJAwryi1WhjIVPnPYvPi808g4llKmOc1wlLirKS2pUauhlaHl2FcZk7
         jga/h4kIhP6c1uGZLdPvbzHcF93z3RjK/pczPVF5IsGkILZNms2QmpCtntPBfGHnJS/P
         NuMQ==
X-Gm-Message-State: ANoB5pncODCyuHnRTXKr3veB221ywF9flN+95LOczKOB0f/XvPedwKic
	3A5rTZxwex2aySTPCi02Ow6t+cGWZvCbuV3kxfo=
X-Google-Smtp-Source: AA0mqf61zF0+CUm8zR4/zqCv7rYKQau5B1BqPeG/l2kmnSTQJqPwuZ7hPzHkjGrbnDxgEIczqY2AYNRED1RizCdvKgQ=
X-Received: by 2002:a2e:b8c5:0:b0:277:8144:2eb6 with SMTP id
 s5-20020a2eb8c5000000b0027781442eb6mr3556171ljp.45.1668376453086; Sun, 13 Nov
 2022 13:54:13 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj_hMQeMh-Rp-fJ=nezRUcwaOk3mMpX4iKSxAEia7tmZeg@mail.gmail.com>
 <3205.1668367024981923542@lists.openembedded.org>
In-Reply-To: <3205.1668367024981923542@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 13 Nov 2022 22:54:01 +0100
Message-ID: <CANNYZj9oLXwtbPEsQH+333TvfEAVnDLQMsna-WdJFERFtLykHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: fix native llvm-config RUNPATH
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 21:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173210

Wait. When you invoke native llvm-config it must be able to locate
*native* libraries that it is linked with. And so rpath must be set to
where they are, which is $ORIGIN/../lib. Why does it need to be
changed to something defined differently for some target?

Then you seem to say that 'llvm-config --libdir' returns something
incorrect, but is that an actual problem? Where in the mesa build is
it used, and how can the issue be observed? We regularly build mesa
with llvm, and it does not fail.

Alex


On Sun, 13 Nov 2022 at 20:17, Vincent Davis Jr <vince@underview.tech> wrote:
>
> Hey,
>
> Desired outcome is for mesa meson configure to succeeded by updating
> RUNPATH on llvm-config native binary required by mesa when gallium-llvm
> included. When running bitbake -c devshell mesa. Then chrpath -l on llvm-config
>
> Should return on TARGET_ARCH x86_64
> $ORIGIN/../lib64:$ORIGIN/../../lib64
> not
> $ORIGIN/../lib:$ORIGIN/../../lib
>
> SNAPSHOT OF FAILURE
> *************************************************************************************************************************
> File "/../../../mesa/<version>/recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", line 223, in finditer
> return _compile(pattern, flags).finditer(string)
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> TypeError: expected string or bytes-like object, got 'NoneType'
> *************************************************************************************************************************
>
> Reason for above failure, at least for me, when TARGET_ARCH = x86_64 you run into
> bellow when running llvm-config --help or variant commands directly.
>
> llvm-config: error while loading shared libraries: libtinfo.so.5: cannot open shared object file: No such file or directory
>
> Because of that when mesa configure executes llvm-config --version the string is not returned. Thus, leading
> to above error.
>
> If you run chrpath -l on llvm-config you see
>
> $ORIGIN/../lib:$ORIGIN/../../lib:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
>
> When target architecture is x86_64 those folders don't exists in recipe-sysroot of a recipe that requires llvm-native.
>
> The llvm_sysroot_preprocess_native function in current MR addresses that problem by
> making RUNPATH target architecture dependent.
>
> As to why RUNPATH includes both the original RUNPATH and the update target architecture
> dependent directory name the llvm recipe requires the llvm-native llvm-config binary to
> compile, but the build libs are stored in lib directory not lib64. Tried everything I could
> think of change that not much can be done about that. When llvm-native gets included
> in another recipe however libs are located at $ORIGIN/../lib64:$ORIGIN/../../lib64, at least
> for TARGET ARCH x86_64.
>
> As for the second problem llvm-config --libdir returns
>
> /../../../../../../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib
>
> instead of
>
> /../../../../../../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib64
>
> Which causes mesa configure to fail as ../../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib doesn't exist.
>
> According to https://github.com/llvm/llvm-project/blob/a11cd0d94ed3cabf0998a0289aead05da94c86eb/llvm/CMakeLists.txt#L399
> and https://github.com/llvm/llvm-project/blob/a11cd0d94ed3cabf0998a0289aead05da94c86eb/llvm/CMakeLists.txt#L389
>
> LLVM_LIBDIR_SUFFIX variable is used to set command. MR addresses that by setting the LLVM_LIBDIR_SUFFIX
> variable. The reason I decided to use HOST_ARCH instead of TARGET_ARCH is because bitbake sets
> HOST_ARCH = "${TARGET_ARCH}" in bitbake.conf, but I'll admit there's ignorance on my part in terms
> of what I think that variable is set to and what class-native it used for.
>
> :)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173209): https://lists.openembedded.org/g/openembedded-core/message/173209
> Mute This Topic: https://lists.openembedded.org/mt/94995332/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

