Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAC5D3177F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:24:34 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.27337.1730831069971324902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UfDMDrrD;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5ee1e04776cso1020282eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831069; x=1731435869; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj5il3LJ5hVDyldIXBa2dC6X1PsMJYJYuX242jjw+3A=;
        b=UfDMDrrDvaNAVe6eXDkvtRzgRq9Sq4uWGmQBpPUEjyFWGwtU+OjCyizdcQymjkcEiC
         VKwnm7FzjEMLycWdpPuBoZiMJ6eJRvcSW1uhFATSHakJkOehsMu7P6ihRmlBCovFCah6
         ocvnLt66quDZYH65EnIFRBQh+avdfy/HEbG69VtaR6HirCrntkPNwDoKer/2lYbT+iv5
         l3cTpQ9p9UM15XyA2H9E8soeA0qG6YyFxOOhe2AK3ao62sQ6cBPCtr4bnv9q1SSvdXuu
         fUhPjT8AcAFznFB+hBFLT1RWvoxLvLqGTLkC/AuHBjtYgDHMRgkecpa0Y/jYPvKAjjdv
         t/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831069; x=1731435869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj5il3LJ5hVDyldIXBa2dC6X1PsMJYJYuX242jjw+3A=;
        b=NivKrYmXptPL17POK+TN6Lp6jzNONSInOCmpuNoIjMRgYvrfZE3x+YfQnBYye+PE89
         bpuBO9DFya+WH5MxLjZhXchHD08UfO13n4Cyh/hQRrSw4Kw8XSsuG8/TLW+nd8/AT+FA
         dnVzRe7G75FPrqEh9zJ9eo+f4cYS8rrpQTHGWf+ky/DzSYw2TaNJSkkYwoeFNI2KRNFl
         4JXoF70nOprocCYoa+lcQlvMyFH68D8d74uGH1fhspjaBnnfHPEem8uLmpc4+L+z/Fub
         ZZCenohfwlW+K4SXF2KBBqkE9bmTOlkIxjmnvDZeDmNtBYv3ouCY8p4C/40zVZsuiGbV
         luVg==
X-Gm-Message-State: AOJu0YweH0tzrdi65nxRZFHp4HQvJvsovhYI1ipt6est7juCcjdWDluN
	IQ/06qo3/RgpQchgWtNwur8myWslHa0REfaq3c7fD156IM37ELyb+4fWhUnqEFy3kdvrUZfD09I
	6t2N3+kl7jy1Wkmny86iqY6GxqwU=
X-Google-Smtp-Source: AGHT+IGY6UEBeZ6EK5goM8kNRrIK36aB+lW+rvQUizDNSH7U4+hRnkSY9J/QJIbXV4/qTWZh7xH3OfnoKsNLuSJBXXk=
X-Received: by 2002:a05:6820:1b94:b0:5ec:5eb6:1acc with SMTP id
 006d021491bc7-5ec6db9a003mr11817507eaf.5.1730831069226; Tue, 05 Nov 2024
 10:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20241031101556.1913400-1-alex.kanavin@gmail.com>
 <CAMKF1spGp5xPKbVv85dKoC_E9Vk28C_r0vc3a48z2m+f1HnXjw@mail.gmail.com>
 <CANNYZj8pwm0wgV8Dzz_Z07v=OOnssxEibhtYHTqL8Uvq-jTmRg@mail.gmail.com>
 <CAMKF1srvd=CGhG97bGPWttum4MFd5MtoBf1QQc3e-6ruSEkL3Q@mail.gmail.com>
 <CANNYZj-pJ8rWJY_a=GMkBTeTHBosdSjxmvQ=_1nJFTo+ULGKAw@mail.gmail.com>
 <CAMKF1soY3+YTpYeFEHRA=CtcfGGEpbiBRQzfebW42RmD9gG0Cw@mail.gmail.com> <CANNYZj9toUVNH8012YNNJmzNZgXp7br=S=H0hHDwL1RUE8XFAg@mail.gmail.com>
In-Reply-To: <CANNYZj9toUVNH8012YNNJmzNZgXp7br=S=H0hHDwL1RUE8XFAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2024 10:24:02 -0800
Message-ID: <CAMKF1sqA1qg9mdca2_LZzXU4=tPvNKE5t-H7NeW5=+YwtiF3eQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] tcl: update 8.6.15 -> 9.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206728

On Tue, Nov 5, 2024 at 10:10=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 5 Nov 2024 at 19:05, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Nov 5, 2024 at 1:37=E2=80=AFAM Alexander Kanavin <alex.kanavin@=
gmail.com> wrote:
> > >
> > > There's an issue in tcl 9 recipe (tclsh is incorrectly symlinked to
> > > tclsh8), so I'll send another respin. Postgresql was hit by this.
> >
> > Thats only part of the problem for postgres, they expect the APIs to be=
 reworked
> > and tested to work with tcl9.x
>
> We can also disable tcl support in postgresql. I have a hunch it's not
> used much, and it's not on us to fix it.

yeah perhaps thats what should be done and someone needing tcl support shou=
ld
fix it to either work with tcl9 or get it to use tcl8 from new paths.

>
> > I think, we have to keep tcl8 version around for both tck and tk,
> > these kits are used
> > for packages which are stable and not as actively developed and might
> > take a while
> > for them to start using tcl/tk 9.x. Looking at other distributions
> > e.g. freebsd thats what
> > they have done too.
>
> That's what my patchset is doing, isn't it? I specifically
> re-introduced tcl8 to support expect, which a) has been unmaintained
> for years; b) is needed by GNU toolchain testsuite.

https://sourceforge.net/p/expect/bugs/107/

expect is integral to dejaGNU used by GNU toolchain testing sadly we need i=
t.

>
> Alex

