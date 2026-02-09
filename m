Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7599E7E0D5
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 18:25:58 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1481.1770661551965604896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 10:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+DVYPDm;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c6b16bd040so472690185a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 10:25:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770661551; cv=none;
        d=google.com; s=arc-20240605;
        b=fpQ4WAiudyEfeGfRh/mEbCyW9LkycCKhhQK78qzvpGwEW+wPtZITlOUgT6zfN4LyNT
         nd7rqsh0SJOpT0diwPw57XSgMiZm694fz5vnrPWYgoIvsglBKNgAEUmwGlHeNgpcy2Yw
         D6MgIxkqzedJSWPM/L2x/PpRQAGWwoDNItHj2aOkKGLB9dK05TcU/7wQ0GS6b65ZGB7d
         SQGrpGdFZFT6ND3E/BGOCjvZW2H4JGWrR0YaVUcw6DyWmIesWHMG7b8PcaobF6wcI2bE
         juMd7IIHP3AVA6pjWCVn4hrAu8qZzy0ON9XOtaxqwTogqPT+6ga/z2EoYkLKa6Hcfeko
         Wk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i3wHKX7FjAz+6QmXLDeT+wtUupuM3pRGmkQJ9dc4fbw=;
        fh=hNAxtwwA5pz69/P6HREPrnUJ06d9l4SJEbDE/zpuT1I=;
        b=P08VeEzkttsl1IfT+1H65aoajZ/TOcDEtLAlFB/bWunyVaXPO9HXIblAyq5RwShkvc
         ineTR0icRmjeNklx0QDUjDS6cQuy0oH5avKA+UguNc4M3HroAfIubk8WR9giYQ1haW2B
         BMWG7M5otmm2Mc0TAbFYyleZppAStURXGcSULr+ngfDp6/wuEIIH5H8oyeiNp26i/tWY
         aEs3tYMrrvMqW8AKZnrk/MEz/ha7rPXaVnd6urJaU1EpA6wQqIVk7hsnNgs8e9HX8dk5
         Q/NbOJSJ+HYgPGnE+ThvY8RIoWwMF812pmHhl+p5gebH1olUFAalHRzxMuuSH1DqI7Rh
         Veqw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770661551; x=1771266351; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i3wHKX7FjAz+6QmXLDeT+wtUupuM3pRGmkQJ9dc4fbw=;
        b=i+DVYPDmXKlRf6egynAF7kjgTMi5dSMbe1havn5f9GFwEoGPz6k4bizmTZsT7xNxfR
         mYPB3fEETAsGGDesB+8DBrHG8Y2xSDfo2YjKHSll2s7vDFRGx19p7SYH1OHv+MRUnHq2
         dOHKJdJ8Yax8CvdSD3ChoVFNuOba6ol5Zz46W3Xpk1Rrvk7GVU74WPfJtx6eTu+XS7Sg
         /up230J0/Ac2k/NvLEXlP9TGj1lMsvk/t39vWUpKtqPXCuGCEuPRqlK+8ZVXyuG9mjCq
         muxNUwTBD0EWtviezVDBPJev831trL5OhgsgVswQpZEiAWp6pkWYvoHAXj2GqDqoopiq
         jg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770661551; x=1771266351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3wHKX7FjAz+6QmXLDeT+wtUupuM3pRGmkQJ9dc4fbw=;
        b=sbHdLCi2lSsAD34+YhowAgWKciKY/I/MEGV9uLD93YcH9o8Q5RhQ4bMbQ3p+M3enHw
         LCfUxcdt94XDeH0UiEjOY4nVf8nNGdYqHuTUxWY6h9dGL1MN9hfl4XSddUum1D0zB18X
         zQKMPi5nkUKSJlvncL3xGUru40WZShJLND+Ov/728r7s9I3m60F5P8W8nHQUeklIZ0uz
         h9cPqfA1pGwmbJssllT6tWB4vAV+O+TRmHYSgBYs1u2w1taLpFZ2+q+nP27fGmoIRjF/
         YAbOimv0AudTgAOrIvwEcrhDslwS4ZTnqZ8bAzucFf/y6/L6shVLr2aN9Nh8F9VFse/s
         clCg==
X-Gm-Message-State: AOJu0Yz6qT5eQj8gyhhoCroSiNVS2MgPqun3IlrUXHGBwaY3qJJL8bT+
	MBdpFZ5tWkYozVb4mgptce3Hmup9eLuqk9RdAzcQISmhvFkCbPbj8snjtvX76GY4hOq1dvCmGq+
	/iwLbi9COZdJnTcdUPVth8pvI931+Neg=
X-Gm-Gg: AZuq6aLBFENj1zxH3zTLixvfMMYG4nlyTHs4eCUUvTO9ScgxeJbBu2OmXg8j4EuhZew
	2eHpH6viEaj80XHY1sdg/dqkMD2LbYbtRctt21l7tOHDwoFoCnO67CoCBTe6r4pTIBTLS1TqoYu
	JS+0Tx0Jv1iUGJL3ruwi9UhhQlDGcztdHYcGxJFpmoUJcOJXvqM4edCtuJtU6lLsgMf6lJybJZt
	zY3XtPCkcqrDt/TlsvepL9N4OINzWAdVFV0SV62ZClbR3Tx9q9ZeQF2bK9bgwWdjjlJzfAo2TJ5
	5EVoGvvNdy6iW7/3/9VgpHsWsHoBRw==
X-Received: by 2002:a05:620a:28cf:b0:8ca:d5cb:6842 with SMTP id
 af79cd13be357-8caf0c44afdmr1656195285a.44.1770661550940; Mon, 09 Feb 2026
 10:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20260202023457.133774-1-ankur.tyagi85@gmail.com>
 <CANNYZj90xJsK-COQF9XPbvT37gcdTuS7=M6QJu-KBf+3D6G=ig@mail.gmail.com> <CADySD0EYAL-tmTz1AKvm_sgfJyy+a=+GnFruyN6zT8V4jujuDQ@mail.gmail.com>
In-Reply-To: <CADySD0EYAL-tmTz1AKvm_sgfJyy+a=+GnFruyN6zT8V4jujuDQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Feb 2026 19:25:39 +0100
X-Gm-Features: AZwV_QjOg6cIldQ2Q4f1jt7I6O5HoxHYEYafP1KcuE9JkdhjtcnF6g-Zb3YYTv0
Message-ID: <CANNYZj9LmZBBYzmkxdHqkuA=q-aE2HZrv39W4QMcXdESG_EdoQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] mdadm: upgrade 4.4 -> 4.5
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker <paul@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 18:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230813

On Mon, 9 Feb 2026 at 19:23, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> > > - dropped mdcheck install patch to address reproducibility issue
> >
> > >  EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_system_unitdir} \
> > >                  BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev" LDFLAGS="${LDFLAGS}" \
> > > -                SYSROOT="${STAGING_DIR_TARGET}" STRIP='
> > > +                SYSROOT="${STAGING_DIR_TARGET}" MISCDIR="${datadir}/${BPN}" STRIP='
> > >
> >
> > This has merged, and unfortunately the same reproducibility issue
> > appeared in nightly master:
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3317
> >
> > The issue seems to be that sometimes the sed command to patch BINDIR
> > in mdcheck works, and sometimes it does not. I am baffled as to why
> > that would be, but we can't have such fails in master, so for now I'm
> > afraid this should be reverted.
> >
>
> yeah, that's odd.
> Let's revert it and I will spend some time understanding what's going on here.

One idea is to try to catch the issue right when it happens, e.g. add
a test patch that greps the offending file for BINDIR, and if that's a
yes, then it loudly fails, stopping the build. We can take it into a
staging branch and then once it fails someone can look into why sed
didn't work.

Alex

