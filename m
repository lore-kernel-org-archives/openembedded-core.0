Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F29DC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 21:55:28 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.2363.1668376527034461907
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 13:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LD3ip5MN;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id x21so10812619ljg.10
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 13:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K6IY6O6uQVrTo6/n2wzWr/4k32vozghN/7K4ckP9b00=;
        b=LD3ip5MNtDzf6LLFU0Rodbb1MwURG12p8PJbxQjlCJ4KVwFOn0UiO47wqJj11RgXP8
         jxXcSH+5M0jLVlYIrISgQeka+gMsQVweUHsT9of+SfXBMG6KZltyh5lA1nMzElVqh7h4
         pNFQRXZGDhlehOuhFnyavBeTecaA3pw7mAY8GCk3q7ZW0SBPn0kqMj45hqu+aIKTYc5c
         qusWGxrMTVqOKjmnikLtq1XaLa3JANEDufpB05yU3PelP1hyyEzKEpK2N1soruXp35Dy
         dH6TKBYcD+/+5LAHvg9sJT3V87Go8/A4osgLJl8jaBmw7vrlIkkIaxhWSqWH28uaUY1L
         ui0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6IY6O6uQVrTo6/n2wzWr/4k32vozghN/7K4ckP9b00=;
        b=fplnBDO4x8AZmVK1jNVZTRWc1x2tJ8RbTxJ2H2EshtT4PfioxHhkKDLP71mdClBCfm
         3B1g0+Z5GS0TbxJLNOf2qNhYoxG3A1F+mr9tv3agjCJEgkhZzJ2WBCEN+kk4zCrgD9rd
         v6cINJLPzKJ88lPNIVBPPojOjPDE6/cft6vUrIHA2UuAJCrPuoSBbT3+YFUNk6qjKNwV
         pJhwWD3fbtPySHZNpyU9KePu91HriH+JwGh6MVa09gYuEDNnw9r6n1zM4/dzOjOT1VRk
         e6YOSCWsaMnl90rZNTr4gbtxD+iYLpTIu6qV2JIFqfUhJyWDgsphcABvUhjChl7jOfVw
         h8aw==
X-Gm-Message-State: ANoB5plA+8ZmzILMQaXiZF6caDnUCuXF3mmUjfzWivxeKlA4Cqst5ov3
	lqYAQrvYQBWPBOrJAoQ3h8LdQQOuyUgPbNbroRQAPenJT4w=
X-Google-Smtp-Source: AA0mqf7FK6XmHy2vdZtRMos+0Kwd9Xtz8ho61PJx54hp+CNmk1tLcse6+gWjmQZX9ZcofpIjpihOAm08l3doLi55wMg=
X-Received: by 2002:a05:651c:b14:b0:277:e01:6119 with SMTP id
 b20-20020a05651c0b1400b002770e016119mr3752110ljr.33.1668376525246; Sun, 13
 Nov 2022 13:55:25 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj_hMQeMh-Rp-fJ=nezRUcwaOk3mMpX4iKSxAEia7tmZeg@mail.gmail.com>
 <3205.1668367024981923542@lists.openembedded.org> <CANNYZj9oLXwtbPEsQH+333TvfEAVnDLQMsna-WdJFERFtLykHA@mail.gmail.com>
In-Reply-To: <CANNYZj9oLXwtbPEsQH+333TvfEAVnDLQMsna-WdJFERFtLykHA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 13 Nov 2022 22:55:13 +0100
Message-ID: <CANNYZj_Gt0eou9UeCiq=kZ1dCVJoPqgqEzV0o6O4CvHyrJC4Ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: fix native llvm-config RUNPATH
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 21:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173211

To be specific:

alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ ldd
tmp/work/core2-64-poky-linux/mesa/2_22.2.2-r0/recipe-sysroot-native/usr/bin/llvm-config
    linux-vdso.so.1 (0x00007fffe9964000)
    libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
(0x00007f415335d000)
    libtinfo.so.5 =>
/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/mesa/2_22.2.2-r0/recipe-sysroot-native/usr/bin/../lib/libtinfo.so.5
(0x00007f415332e000)
    libstdc++.so.6 => /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f4153161000)
    libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f415301d000)
    libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f4153001000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f4152e2c000)
    /srv/storage/alex/yocto/build-64-alt/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
=> /lib64/ld-linux-x86-64.so.2 (0x00007f41533c3000)

See how it's able to link with libtinfo in sysroot-native? That's
precisely because of rpath telling it to.

Alex

On Sun, 13 Nov 2022 at 22:54, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Wait. When you invoke native llvm-config it must be able to locate
> *native* libraries that it is linked with. And so rpath must be set to
> where they are, which is $ORIGIN/../lib. Why does it need to be
> changed to something defined differently for some target?
>
> Then you seem to say that 'llvm-config --libdir' returns something
> incorrect, but is that an actual problem? Where in the mesa build is
> it used, and how can the issue be observed? We regularly build mesa
> with llvm, and it does not fail.
>
> Alex
>
>
> On Sun, 13 Nov 2022 at 20:17, Vincent Davis Jr <vince@underview.tech> wrote:
> >
> > Hey,
> >
> > Desired outcome is for mesa meson configure to succeeded by updating
> > RUNPATH on llvm-config native binary required by mesa when gallium-llvm
> > included. When running bitbake -c devshell mesa. Then chrpath -l on llvm-config
> >
> > Should return on TARGET_ARCH x86_64
> > $ORIGIN/../lib64:$ORIGIN/../../lib64
> > not
> > $ORIGIN/../lib:$ORIGIN/../../lib
> >
> > SNAPSHOT OF FAILURE
> > *************************************************************************************************************************
> > File "/../../../mesa/<version>/recipe-sysroot-native/usr/lib/python3.11/re/__init__.py", line 223, in finditer
> > return _compile(pattern, flags).finditer(string)
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > TypeError: expected string or bytes-like object, got 'NoneType'
> > *************************************************************************************************************************
> >
> > Reason for above failure, at least for me, when TARGET_ARCH = x86_64 you run into
> > bellow when running llvm-config --help or variant commands directly.
> >
> > llvm-config: error while loading shared libraries: libtinfo.so.5: cannot open shared object file: No such file or directory
> >
> > Because of that when mesa configure executes llvm-config --version the string is not returned. Thus, leading
> > to above error.
> >
> > If you run chrpath -l on llvm-config you see
> >
> > $ORIGIN/../lib:$ORIGIN/../../lib:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
> >
> > When target architecture is x86_64 those folders don't exists in recipe-sysroot of a recipe that requires llvm-native.
> >
> > The llvm_sysroot_preprocess_native function in current MR addresses that problem by
> > making RUNPATH target architecture dependent.
> >
> > As to why RUNPATH includes both the original RUNPATH and the update target architecture
> > dependent directory name the llvm recipe requires the llvm-native llvm-config binary to
> > compile, but the build libs are stored in lib directory not lib64. Tried everything I could
> > think of change that not much can be done about that. When llvm-native gets included
> > in another recipe however libs are located at $ORIGIN/../lib64:$ORIGIN/../../lib64, at least
> > for TARGET ARCH x86_64.
> >
> > As for the second problem llvm-config --libdir returns
> >
> > /../../../../../../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib
> >
> > instead of
> >
> > /../../../../../../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib64
> >
> > Which causes mesa configure to fail as ../../mesa/2_22.2.2-r0/recipe-sysroot/usr/lib doesn't exist.
> >
> > According to https://github.com/llvm/llvm-project/blob/a11cd0d94ed3cabf0998a0289aead05da94c86eb/llvm/CMakeLists.txt#L399
> > and https://github.com/llvm/llvm-project/blob/a11cd0d94ed3cabf0998a0289aead05da94c86eb/llvm/CMakeLists.txt#L389
> >
> > LLVM_LIBDIR_SUFFIX variable is used to set command. MR addresses that by setting the LLVM_LIBDIR_SUFFIX
> > variable. The reason I decided to use HOST_ARCH instead of TARGET_ARCH is because bitbake sets
> > HOST_ARCH = "${TARGET_ARCH}" in bitbake.conf, but I'll admit there's ignorance on my part in terms
> > of what I think that variable is set to and what class-native it used for.
> >
> > :)
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173209): https://lists.openembedded.org/g/openembedded-core/message/173209
> > Mute This Topic: https://lists.openembedded.org/mt/94995332/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

