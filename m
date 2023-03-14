Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F5AC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 17:25:55 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.645.1678814750745624086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 10:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6596oWPz;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id da10so65186724edb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 10:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678814749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2Se3lTL2Xq4KV2QOM0Y+r479WwxyKqGqSgE+FdsM6A=;
        b=6596oWPzZQoVB1j7mZ/6tB0OEtluln1KPtcEjF6qicGpPTrqrBSdSOz2PtZHAaFpwj
         udWOobI7/CvFi7RIlLECJKZEqL4bFqRaxhECJG04vx54xF9uPLZiTMTl9bQczCk4VLWx
         wrRCcWTtd9xMnke3CQqlMqr9qJqP/IGVw91oSfyEnysHiY4+jMYDIoE3wg85qm87YHYx
         O1hO+LfpRIcpmAFBlAwiP41VJgqZNiTr+Aa7nbIT7C/KGFq5HFa9Vt2WXG/FVyMocAWf
         N+mod+YSGaqUSqKwtC2dubJVFVmdpV429jexcwhC90Llti+pxH70q0Zdlc7bp0dVod+k
         amCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678814749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2Se3lTL2Xq4KV2QOM0Y+r479WwxyKqGqSgE+FdsM6A=;
        b=QwhSeEWZT47j57DWGKvLBk4DrYo6c/qNa7d4jq3e4JC2aN4TLOCi2OH3eV/NjP6Wkw
         bkysP8CqBExBOgTsXe5imy0bcP74B5cAk7+KyeK2ibsOCXIOEsDX+GjFzTQvLUmoL7P5
         n7Z4WZvJpe33nJJWzlfywIQftlE1s0AN7v7E0JKdvpw8Yf7IQNrvhVxazu5icvxfsM1y
         8FTCIMqsiZCb9sn0MMIg1WXeHzwRn/7JanEZWdjhVNZ5xYd7fEbHUqr3UaSv64cUafi8
         IhQpnxCF3LU8k6cvIVLgA0uhGxevuNdAXW7XT9xexquVfrD3Q71mKcUcHDG4rbWZi4iS
         Btyw==
X-Gm-Message-State: AO0yUKW73vBYILWClqKjtLeqMseknwa09Xtf2gEj8ndBDuU9uytlfnwR
	if0oXgVru3wnCMiMG6OI89c9EoD2FYxFwBBV8ow04w==
X-Google-Smtp-Source: AK7set880KmQEzt7q5onPsqTwWIeW4IjhhzZTxkNA35XeH0U0WpO0DANfMgQ11c4dLNuW9e2ajq17yd8pHuLdpuaKOM=
X-Received: by 2002:a50:8704:0:b0:4fa:794a:c0cc with SMTP id
 i4-20020a508704000000b004fa794ac0ccmr5778636edb.2.1678814749125; Tue, 14 Mar
 2023 10:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <MRZP264MB1544487A07884D37D9CFD78E93BE9@MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM>
In-Reply-To: <MRZP264MB1544487A07884D37D9CFD78E93BE9@MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Mar 2023 07:25:38 -1000
Message-ID: <CAOSpxdam2mGY6BgHwdSMOdPQVfMWJfD7i3zd3uhUUKMraFKUKw@mail.gmail.com>
Subject: Re: [poky] [meta-yocto][langdale][connman] Partial integration of
 CVE-2022-32293 fixes
To: "VAUTRIN Emmanuel (Canal Plus Prestataire)" <Emmanuel.VAUTRIN@cpexterne.org>
Cc: "poky@lists.yoctoproject.org" <poky@lists.yoctoproject.org>, Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 17:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178513

On Tue, Mar 14, 2023 at 7:16=E2=80=AFAM VAUTRIN Emmanuel (Canal Plus
Prestataire) <Emmanuel.VAUTRIN@cpexterne.org> wrote:

> I have noticed that 2 patches fixing CVE-2022-32293 have been backported =
on meta/recipes-connectivity/connman/connman_1.41.bb (b33cf2d113d0 "connman=
: Backports for security fixes")
> Unfortunately, the last one (CVE-2022-32293_p2.patch) brings some regress=
ions, which have been fixed by  e6523511d736 ("wispr: Fix context refcounti=
ng in wispr_portal_request_portal()"). Can you integrate this commit as pat=
ch?

Hi Emmanuel,

Thanks for bringing this to my attention.

In the future please send this sort of thing to the openembedded-core
mailing list.  It would also be good to copy the author of the patch
you are commenting on. (I've cc'd  the openembedded-core list as wel
as Khem)

Would you be willing to send a patch to the openembedded-core list
that implements this regression fix?

Thanks!

Steve

