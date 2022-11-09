Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92FEC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 00:16:12 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web08.603.1667952963447748514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 16:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j4dWh3ET;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id c129so17320449oia.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 16:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H20FW9j2LWh4L/IDU64gVeaFV4E+at1QpygeJWfEz7U=;
        b=j4dWh3ETvVz6bFw5gtZ5pULRJHW8EQO5l08f2NEScjx17G6U9GvEXTv7FpZcRz5Nnm
         DFy0Xx/V6H5Xv8i0wIWVMEQ2doc4ZjdQjuhi2Wwsly+OhJWcfWMOWJG9D/irFDGnCkMj
         kki4UGbOAWSxm4guv0OTV5R8lg3SblKm+FUHyI9aaVeFczJTl0xAN2zbiJ+y/aHItHLQ
         7Zh+5W1OsUVXNM8jvPunHerjsawBLNVUDS2CqGP1Grst2Ou2NevWhw0pwDLzZ9bHJHeo
         tAcU+8qqaV5/9ywhz+8H1SGis7wjwMcozRBEFMzJ/CSAyvm7/BwxjZPZcVaJWqBrqHj/
         KJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H20FW9j2LWh4L/IDU64gVeaFV4E+at1QpygeJWfEz7U=;
        b=tvk5TVAJfyuCU/vJ4X1zuoHOHs0Mh6RrxHBNsoBNAu+uXBghvhf9ius3oNWNIGBb6b
         ZqprojbPBFw+1pYSblVpyMhpUFfL5UC6fQ5YLgu9/SPO6snIx5nSkBjvXACCqtbMdH3n
         UpupoSAQA0UZ4RwugwVOuEJQZ2w+NXQaCGPNA0xq/lIOqN+W0G/r3Xhy7Nf/tE7Feod2
         C5khYbhVivy6fwA4T7gKw+WeaNzmb7PQgSR7k6C3gKdCEuxXEY5UkEIA5e4Pa2QzzpnT
         Y9yAgyGuyIAdW0sI97xDilfAKQC/R+NmARVQuu8pITkssVIo8QAVmmOinmWzvWJZ2uhX
         nX2Q==
X-Gm-Message-State: ACrzQf2dukb+0OvHk15A+obs5rs7uYKRCEgRNSMMOpAloFixDcz6yMxD
	A1Aag2ZChUVU+wk4yvWUImBiBl6NkletgoQ9cpU=
X-Google-Smtp-Source: AMsMyM4DiXJiU/aRXzrRtGSC512A36uHlSJ5o0eLk6/BwqUH5VlYbmN3SsNrj7uG4fXw7BfyyS52o1kLYLI4w2/WpXs=
X-Received: by 2002:a05:6808:20a0:b0:359:e4d6:8bd3 with SMTP id
 s32-20020a05680820a000b00359e4d68bd3mr30694915oiw.262.1667952962549; Tue, 08
 Nov 2022 16:16:02 -0800 (PST)
MIME-Version: 1.0
References: <20221108215544.815033-1-raj.khem@gmail.com> <628329b7511560a532a20a6b5e5edfccf613dc9f.camel@linuxfoundation.org>
In-Reply-To: <628329b7511560a532a20a6b5e5edfccf613dc9f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Nov 2022 16:15:36 -0800
Message-ID: <CAMKF1sqZuAC6YsvT4f01q35CGt2t+3mMRKs8WsnfBnBRGE96Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] systemd: Fix 252 release build on musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Luca Boccassi <luca.boccassi@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173004

On Tue, Nov 8, 2022 at 2:39 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-11-08 at 13:55 -0800, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: Replace the utmp patch with an upstream backport
> >
> >  .../0001-Adjust-for-musl-headers.patch        |  84 +---------
> >  ....c-Use-net-if.h-for-getting-IFF_LOOP.patch |  27 +++
> >  ...trerror-is-assumed-to-be-GNU-specifi.patch |  42 +++++
> >  ...-test-utmp.c-only-if-UTMP-is-enabled.patch |  44 +++++
> >  .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   4 +-
> >  ...k-parse_printf_format-implementation.patch |  22 +--
> >  ...missing.h-check-for-missing-strndupa.patch | 158 ++----------------
> >  ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  29 ++--
> >  ...10-Use-uintmax_t-for-handling-rlim_t.patch |  14 +-
> >  ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  14 +-
> >  ...patible-basename-for-non-glibc-syste.patch |   8 +-
> >  ...uffering-when-writing-to-oom_score_a.patch |   4 +-
> >  ...compliant-strerror_r-from-GNU-specif.patch |  22 ++-
> >  ...-not-disable-buffer-in-writing-files.patch | 100 ++++-------
> >  .../systemd/0026-Handle-missing-gshadow.patch |  14 +-
> >  meta/recipes-core/systemd/systemd_252.bb      |   5 +-
> >  .../btrfs-tools/btrfs-tools_6.0.bb            |   3 +
> >  .../recipes-multimedia/alsa/alsa-lib_1.2.8.bb |   2 +
>
> Should a systemd fix be patching alsa-lib or btrfs-tools for large file
> support? :)

oh I should have separated these changes. Thanks for spotting.

>
> Cheers,
>
> Richard

