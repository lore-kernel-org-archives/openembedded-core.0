Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005B2CD3431
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 12:45:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.49058.1725453950103134405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 05:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfTf+77G;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53343bf5eddso8557169e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725453948; x=1726058748; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9o8SCszUcvLZAM8Lp7e944LmDmc2KdSygu0oxMoSHac=;
        b=JfTf+77Gj6iCPN9XCXW4Oq49iGodEaq862hK8xr6IG+41IlWGMFg8aYF175gdg17jE
         KccvynHgo75Gcq54soiGGj05bwYhQgKdYAl7MwVJgv/6dSP2FjCtH0CHruigD0gGko0c
         TO2OVrXRtTfKxLiIXoZgMRV05sLmwFFH+dEkSIk599NKbH2fQPJG1XpllCyu2VY9hOS0
         tHs5bDKX+4IrHZr/B3SSGoeP9G8U9EVsztCGTSYY6MQcVpjtyVGYIRHFVpHGlI+uJd6M
         grkp9U4c2lp2XK4FlX/B2Ezak8OZF611aFNdArRojGVjfF1KtVtMLV8UiudkKPh50RC3
         bxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725453948; x=1726058748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9o8SCszUcvLZAM8Lp7e944LmDmc2KdSygu0oxMoSHac=;
        b=XUhEQaUkw/Mqe4NZ72Ivk6xuehcSLWMUxpkEBiVTzRQ+Dp0ql0+xF5R4WC+B3Fgyei
         wKW34haSaL0ge5zM4eHfzsAMAnAG0cyD3X/hzYzQohn9nGM1AlpuqBNKBSeV2XpOh8sc
         DjAta06cNeLfP8MBbsbWKkRfXWvc+WMQbCMiBhVzciKZTGGhy114XoiVL4uhprHm6ki0
         MKcWUt+r58oe4gF2v6Hx9yBYZpJuJn0DTanMpYtnyTtdIyDdnFcfWZRU8tN0Rgkt5uRZ
         bxOdL+DmxHvpfzf5Cw/3/vE4DoS0cCgX4Qwb/f3pG2/hfcq7jEqopP7jvgAkvrtwtOac
         FKzw==
X-Gm-Message-State: AOJu0YxveP+N14s9QaxB5shQLD+fpyRKspzmcENPuOVyQ+3JKc1hTolY
	YcFYQeLRniJ1f2TLBPMXFzN2zDwN2SbB5PxN1hmpnUJ5TyCoK8HqhwC1G1E2yx7+MrmclWLO05x
	cl83nMW8SIYNa738XAEbg3kAfLdM=
X-Google-Smtp-Source: AGHT+IHDu3iQd4PKKJDLfvelC0GBb6ooiG88OFLhq0Iv4Hw2N8Hw4FU3JPJdcQmRVHyidqNn987FKmL0FIoPYlyUuz8=
X-Received: by 2002:a05:6512:2208:b0:533:44a3:21b9 with SMTP id
 2adb3069b0e04-53546b1916dmr12827248e87.1.1725453947205; Wed, 04 Sep 2024
 05:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <17F17A442A5285BD.17352@lists.openembedded.org>
 <17F1F7644487505D.17352@lists.openembedded.org> <CA+chaQcUf_Uw=uQD0fdheV_Cu7ohrpk6qudfaadBYz4hGZBMvg@mail.gmail.com>
 <3bb72a1e2632be40fc1e78450b09e16e15f853ea.camel@linuxfoundation.org>
In-Reply-To: <3bb72a1e2632be40fc1e78450b09e16e15f853ea.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Sep 2024 14:45:31 +0200
Message-ID: <CA+chaQdua_LyV5VbXA=1PS_RL_aAiEDqrDg5pv2BV+oHBYgzSA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: DEBUG_PREFIX_MAP: move
 STAGING_DIR_NATIVE before STAGING_DIR_HOST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 12:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204205

On Wed, Sep 4, 2024 at 1:57=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2024-09-04 at 08:53 +0200, Martin Jansa via
> lists.openembedded.org wrote:
> > Some related info I've found now:
> > https://reviews.llvm.org/D148975?id=3D516863
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109591
> >
> > maybe affected by -fcanon-prefix-map used since gcc-13:
> > https://git.openembedded.org/openembedded-core/commit/?id=3Dabe97fa74b1=
0c2c71d79bc3573d4edb509b111f5
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108464#c8
> >
> > and I was also using ccache which used to have some issues in this
> > area (but the python3-matplotlib issue is IIRC reproducible without
> > ccache as well):
> > https://github.com/ccache/ccache/issues/163
> >
> > We might need more experiments before this is applied (I'm glad I've
> > sent it only as RFC). I'll try to find some time next week.
>
> I'm a bit worried that gcc might apply the ordering one way in some
> locations and the other way around in others so there may be a bug
> lurking somewhere. I agree we should look further into this.

I had only a bit of time in the morning to quickly scan through them,
but if it's correct that gcc as well as llvm are applying the longest
substitution now, then the ordering might not be important anymore and
it might actually explain the case with python3-matplotlib I was
seeing, because for -fmacro-prefix-map there wasn't the native path at
all, so it "correctly" replaced the longest matching one which was
-fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D for python3-matplotlib and no
replacement for lib32-python3-matplotlib as it didn't match at all in
any of them.

Will redo both builds with just
-fmacro-prefix-map=3D${STAGING_DIR_NATIVE}=3D added at the end to see if
it fixes paths in both python3-matplotlib and lib32-python3-matplotlib
and should probably test the same with clang to be sure it works the
same.

Regards,

