Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7AFC433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 15:27:27 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web12.11060.1666279639256361323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 08:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kRsF7KdD;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-13ae8117023so3402713fac.9
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2TGqUcij+wJCGf7gaDCOmbJ7DmzEzmLEe5C2QxcAX8=;
        b=kRsF7KdDbX4kl3QO2A3+srn9Uu/nIsYFivDeZIrBSzVdwxNhobOCztweEpCTRqVieN
         XZVkjlsextjzLio+/rpsRIAIQ15Y4mP0w+QlV0xoWB8O5UPKyZVwpb66g62/x3QaVqz9
         GN6Sd82+mzVqJObCz5QwghiK5/08cinbZddfZeLn7pM5FKqw2mBxtATmUpOZ9MFbiRMc
         4WbwVoCBXeyKkKB8U5FJuL+D26m2dmAfO+25ss929BA/EsiyxiCIAWE3wREm2Dd+f0KT
         bHtOax1DwszCG/tobI2hlTxRs24TUE34iDaw8O5YvnFb1ZfyWH7HhBhdYPK2KlvtFk18
         hHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2TGqUcij+wJCGf7gaDCOmbJ7DmzEzmLEe5C2QxcAX8=;
        b=lg2kbU3eeq7H3vvuRo68fsXG07vfAfMHLIQSUYRV9/kzSXfNECJ83O7hIxKQ7nUTr+
         gbOocRfo7REnBqajF0NICdRjLSwXLg/Q1oZNXiH4P5c9m4sVMjrTsNQo9T0/g8o6EYii
         XOoulMyEI+U5cA6IYI6zESVKD+jrMgBOpr/qqJYAwcEPemN7P+MdmLgtxvoiFl7wszox
         x/3eMqA5lfzlOeQTDH/lp3R5GMFQFuoaxU5O/iZ6itRo77hKE+GTUanCmkfXpyrD+8Au
         62MV5qlwdFx/NaKMpynMGbFs1JOOzHAO4J7pwROVr1Pk543MyeSQ1DsRFuPx4EWdRTEN
         w3UA==
X-Gm-Message-State: ACrzQf32v4vNeVOelgRe/aZcu/CyhnZpMB0cKwOhug11te9mYmAuguWp
	Jq3K7MzHK4DdiFe0Zht4s22q5+hVtJRhB5p+/gI=
X-Google-Smtp-Source: AMsMyM6R5tk5zUonL+EiNP0eMhdP7Bs9HFHDbU6Rk3mjYM1AdA2ylBZ57swdmsL5GWI0kcHeeTbuSnKqrPMQBKW4MBk=
X-Received: by 2002:a05:6870:d1c8:b0:132:1239:2550 with SMTP id
 b8-20020a056870d1c800b0013212392550mr25236062oac.55.1666279638527; Thu, 20
 Oct 2022 08:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221020135531.57483-1-arturo.buzarra@digi.com>
 <CAMKF1sqtNt+5UXRc18LR8Uhq9Vcppg2nadsQVpabKw5ekoNjMA@mail.gmail.com> <CANNYZj8_C_=HW+ALVikFWGcWH5yqEFuknFQtGKFuedsz1VxfXQ@mail.gmail.com>
In-Reply-To: <CANNYZj8_C_=HW+ALVikFWGcWH5yqEFuknFQtGKFuedsz1VxfXQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2022 08:26:52 -0700
Message-ID: <CAMKF1sq4+sdk9crFO1SgMLM=P0JMKmqKe2bKHXBVEXD_4Z137w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] run-postinsts: Set dependency for ldconfig to
 avoid boot issues
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Arturo.Buzarra@digi.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 15:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172000

On Thu, Oct 20, 2022 at 8:18 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 20 Oct 2022 at 17:08, Khem Raj <raj.khem@gmail.com> wrote:
> > > -After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
> > > +After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount ldconfig.service
> >
> > ldconfig is not always enabled, it's controlled via a DISTRO_FEATURE
> > so this will fail for such
> > systems. Maybe adding it conditionally via a systemd unit fragment
> > drop-in file would be a better way to go.
>
> But will it fail? I thought Requires= is the hard dependency, and
> After= sets only the ordering, but not dependencies.
>

Good question. After= will wait for dependency but not explicitly
activate it whereas Requires= will
activate it as well if it's not activated yet. I think it's best to
try this unit on a system without ldconfig.service
for finding the exact behaviour.

> Alex

