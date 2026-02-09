Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE48FE7E0D3
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 18:23:58 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1434.1770661437080598394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 10:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dHbFNdaC;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45f015a3259so1189151b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 10:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770661436; cv=none;
        d=google.com; s=arc-20240605;
        b=O7B/lByZsR0BCerbHvI+/y72TO1vX87/Po7nRzuHgA8ai07KVmH2ShhzO7E+KbejBv
         LOaX86ytfO2WkXsliO1HHvbFQCWiORCn6IaI8X78RraMgNu4rWDnpo02pioFdDZutzvc
         VcC9nJCAZKTg6Ke2S9EzRHDOENnUv2zB1NnthjTr3+nefSlo06mCzJWHFRwl4JrW16+k
         SdtM2/MAhVl7AXFVj2noi/KEdrosAmb5Gzc8EiNqjUTLA/3BSCbMLCIWalXZq+nDYcTL
         mm54fhK4jXwBAJ/mTrzeZj6cVrASLcJddB8Ojj9zNED5Fayip9QDjqiot8cTAA/fKk0C
         vFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2HDOSFcrpR02ZwLPIPDnPhONUHCY3rogD4MYwMzeumE=;
        fh=B/692YpSOO3xEbWky1peUlsdgZGvadtf72KYioLRIOE=;
        b=Wi2lFql0s9h9L4sWeA7/C3nSqxQyNialo5oKkG68tTRK6KUvwfo0oPZ5baALlu6qzz
         jmAD2yqId4++qf7/eBB2L7jLe9Lk1Klhfq0klQHbCc+Y6Ao/WuBOdsE6+qe8LQHew13p
         PZs0bEgXbESyIOCOT5akEa3sSabiwPFwk+M13mrLsrxEZaAHwxQmD60wA8LdSKbm4H5t
         1xk2p8lTGx7ZfmMYDMOxyYiwnk0t3f99lqsXtEjRwq6Fci9lfTcUJ+ziuYXOlLrE4rkI
         YUfU75r3OtBAhw55b4OUDjoelqU3VFgKBaEPjLKLwtcFc2+nfK/E5TBRxmwHnML9q52W
         mm8Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770661436; x=1771266236; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HDOSFcrpR02ZwLPIPDnPhONUHCY3rogD4MYwMzeumE=;
        b=dHbFNdaCctaS9V6uQwltZsrswZW00ZaNbGFX7Gugq4KgcJhp3OsdwyG8GwNqChY/pN
         hoK7bWusOmi3qPTZk/3AwCmnw5sTBlRCO9NlDBC8jO7fNi6KF6S2yzr5Y1t9Q8LsN745
         5XH99Xwn8xiCo4fxtVtwkGmBWnN2qEtIJaISfeyuzJkv0lEhvoxuQpoRTEUvypPV4sIs
         LlLuUuNC7PAr8due6cKEBzJkfiD84uXVh3EZBa/R05k/ZSTW4kcxrrvczQA6M+3r+vQF
         14fyLEGYP4ljphN8Snz8zQEZ0M3xm6RtEZw/Nyw7+xDVY5v8QOz+hKGHylD2tujt3CB0
         7wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770661436; x=1771266236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2HDOSFcrpR02ZwLPIPDnPhONUHCY3rogD4MYwMzeumE=;
        b=K7HaoDKCNdem+xDk8I6IwJzqmcOjecbrzmPOKE9E9E6NNNMp0eSgd2h+VrvnBjjXdA
         nofP/zTDEBeYLo/32zvaNI2W/DK19jmakuB6k948ei3AmsAxnxAPpGFk5UvCOhmGwW8x
         l81xmrg2vARG31TYziWcnSHS01zDnriQuWCCvOoDxetAxYbnIgVQsH8pZKvIIX1lqGzD
         5Bo/Ez/KxVGzx5Zxdl9Ysb1K3Mx2aU5TgCtUQnn5R2fFjjsD9cejT1R/zGNTykqBou6P
         EPo6jTb+6DRtPDpXJFTJDEEGR7bgw2kkLWxjvMdvQ1FsHZF9ZE5K/kflmlWtwK77T0Dp
         Or3g==
X-Gm-Message-State: AOJu0YxiwBPRUAJPjCKOmtF6YLTKAGLIP67r/6Rv5Rq+n/SQiSOiLX7/
	m+fyvVD69qrw/P329XQokzYSUxZAG3VEpiiX3nWxVK7MCjOxOtFVpnWvT8eMKt+Bh5FoQMTzx2a
	J99dq5tsxusyxFkaRmaVp3CnGcSSut78=
X-Gm-Gg: AZuq6aK9HrPXa44ziN5mDsd6vpUUsOnpAKdKvDH9FMO7h3GRPo45PZCtQlKx/dGDV4p
	F4zkTUIhvXPuTRcDaaAZvzfnVc6WGCn0MW0pI1J0xP1RURXd2xPyT8fmz6qBYvW/nnnXm70QYFf
	W6ZRgvZWiV6QkePNM4moEXDQ7D1Zo72vcVSzXZLpJx6xOZH5BLvgZcedIC0+Pd0XtkYMDaKJ9hk
	BIN8RSGSg5xYWwqLh0Oqi8+PA9gV32E20/5ysdTQCJ8UKRHJNrSPI/OZxMawGVqMAtiVTT/
X-Received: by 2002:a05:6808:2291:b0:45c:7c2f:9b41 with SMTP id
 5614622812f47-462fca3bf20mr8176461b6e.26.1770661436252; Mon, 09 Feb 2026
 10:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20260202023457.133774-1-ankur.tyagi85@gmail.com> <CANNYZj90xJsK-COQF9XPbvT37gcdTuS7=M6QJu-KBf+3D6G=ig@mail.gmail.com>
In-Reply-To: <CANNYZj90xJsK-COQF9XPbvT37gcdTuS7=M6QJu-KBf+3D6G=ig@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 10 Feb 2026 07:23:45 +1300
X-Gm-Features: AZwV_Qj76vEBnPxdNeHinhflf7yN5AfWgj1A_Gl1K96en60NydkZ_nOy85L-VKk
Message-ID: <CADySD0EYAL-tmTz1AKvm_sgfJyy+a=+GnFruyN6zT8V4jujuDQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] mdadm: upgrade 4.4 -> 4.5
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker <paul@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 18:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230812

On Tue, Feb 10, 2026 at 2:39=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 2 Feb 2026 at 03:35, Ankur Tyagi via lists.openembedded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> > - dropped mdcheck install patch to address reproducibility issue
>
> >  EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CWFLAGS=3D"" CXFLAGS=3D"${CFLAGS}"=
 SYSTEMD_DIR=3D${systemd_system_unitdir} \
> >                  BINDIR=3D"${base_sbindir}" UDEVDIR=3D"${nonarch_base_l=
ibdir}/udev" LDFLAGS=3D"${LDFLAGS}" \
> > -                SYSROOT=3D"${STAGING_DIR_TARGET}" STRIP=3D'
> > +                SYSROOT=3D"${STAGING_DIR_TARGET}" MISCDIR=3D"${datadir=
}/${BPN}" STRIP=3D'
> >
>
> This has merged, and unfortunately the same reproducibility issue
> appeared in nightly master:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3317
>
> The issue seems to be that sometimes the sed command to patch BINDIR
> in mdcheck works, and sometimes it does not. I am baffled as to why
> that would be, but we can't have such fails in master, so for now I'm
> afraid this should be reverted.
>

yeah, that's odd.
Let's revert it and I will spend some time understanding what's going on he=
re.

> Alex

