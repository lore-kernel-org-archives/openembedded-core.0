Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEF0EB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 18:34:32 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.1965.1691087668261582373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 11:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NRH1ADFq;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5860c7fc2fcso15309887b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 11:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691087667; x=1691692467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YEfj3hgTCV/xUNRd7ixsBCR3sP9tT1ERw3lfJLvoEc8=;
        b=NRH1ADFqiyNajRtBZIeA+jpLwo7uwMnx/luPsb5pCrHlFr0SBmH804SFKZrQuIydN1
         Oc7NA6pIlnkDxce/NRwFQftzQfIKI0ft4W/rkvUHUNsWV/Kgx41484eGLLkDFXoU8B5v
         5eW46EcKuHeVDCiIuPTbeCVXzFERAlmfNCzJZwYsqn9OZ4IiPu0cUmxM5hEd0S2cScGg
         3ER4ETlNFAeOTpEF1hH4Vk7k6nM7RjO6Bn1PmvAgLz6eFezVZDO4wq5dFcFBOHHi3AU8
         yULm/nGnvVX4gbEy3CgKyIPGkpS223/6GxqVatuTrf9SffmZecBa1uTroTdBFB/0TzIE
         xMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691087667; x=1691692467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEfj3hgTCV/xUNRd7ixsBCR3sP9tT1ERw3lfJLvoEc8=;
        b=CvtT6htAyHaZx2BRZmAIXOeCCM+pKUCwudpWHsOjMdDwI7h3xDmWboVEH857UkMuTi
         FWBnQ6QMtpCHnduylKhyE7PpNWAGvuFm2ehAaDVrC/InYLpTcM3ImGJEU1TTCv+koGU0
         XAfV/QrBB6kUD/pf+ekNjBgv3sQaV/l7PPhMAotORhi+Lm5PEj5Z990lq2xsE5ZvkkU0
         bjJ3KK+5aBTlqZQt+BIx4hOkqazSMC8i0Zc8ifQcoqXT8nNWkpxYeVo9IjA6SIwyKi3A
         xoufXXwN1CUlgPXqbDCJ0aPJA+85MsGBKu3YyHDGBSsYR0mUKMhHQSz1aAfF7gm9CChk
         Enpg==
X-Gm-Message-State: ABy/qLZQB5QumVlhknqSYm6ntNgt/8GHr155CPS4tCvhuEfZovV17aGr
	kqY+O1u8/bWS/AsJsY9ilt5trbNAW55vQuQMGjA=
X-Google-Smtp-Source: APBJJlHCJ/+Z4Qd2il+JLinzgw/B6d7Sgxg0Lm5hn2r6FkFZ/9oGV85NQRYhYBiHQ3FLyL3t5LyG4SxffAUvKjj5Tkw=
X-Received: by 2002:a81:4f54:0:b0:583:fa2b:26d2 with SMTP id
 d81-20020a814f54000000b00583fa2b26d2mr18612558ywb.7.1691087667469; Thu, 03
 Aug 2023 11:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802185425.2044630-1-luca.boccassi@gmail.com> <b7a75eb0-caf6-d999-42c8-d1532200807e@gmail.com>
 <CAMw=ZnTgBDUJg9-rmzVxEcHUx3OJbt1=nDnjkZ41BJ9+kaPiXQ@mail.gmail.com>
In-Reply-To: <CAMw=ZnTgBDUJg9-rmzVxEcHUx3OJbt1=nDnjkZ41BJ9+kaPiXQ@mail.gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Thu, 3 Aug 2023 19:34:15 +0100
Message-ID: <CAMw=ZnR6FsD8CUhys+K61vtHaeRErjg-08-1kbq0AD=8-qmMdw@mail.gmail.com>
Subject: Re: [PATCH v7] systemd: update to v254
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 18:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185495

On Thu, 3 Aug 2023 at 00:16, Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Wed, 2 Aug 2023 at 20:27, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On 8/2/23 11:54 AM, luca.boccassi@gmail.com wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >
> > > - Drop dependency on gnu-efi, add dependency on pyelftools for EFI builds
> > > - Refresh patches
> > > - Ship new files and directories
> > > - Use meson target to build sd-boot instead of filenames
> > > - Change libpam recipe to set ANY_OF_DISTRO_FEATURES = "pam systemd" to let
> > >    logind pull in pam-plugin-umask
> > >
> >
> > We need to fix the includes in few more places, I have submitted another
> > pull
> >
> > https://github.com/systemd/systemd/pull/28651
>
> Merged and backported in v8.

Anything else we need to do here?

