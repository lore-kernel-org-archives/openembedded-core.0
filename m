Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE7CC87FCA
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 22:00:45 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.50060.1753567238490076388
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Jul 2025 15:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XWY4BkEu;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso27649116d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Jul 2025 15:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753567237; x=1754172037; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kKgDBzpB482TvyFqvOq3d6wY6IS0m+ixRuGGE9LCXHM=;
        b=XWY4BkEusa5xpNaWA40Wtx5cNCEEiq/98JxGbgslRCK6UKR39J8sLnsQYZHTDzstx6
         m5mN9Zeq3UCBG3dQv6ZVFcVkekOesik/Ee3B9aKE9y6pyg0GYk/E4idhQM2rr0gYthtW
         3CHxf9CuQVtaCy3pxx6S9+sCBI9VRjx1cr7BBQ4asxiuvCqXmmf0NwqkQsJV/xjW/k/G
         tbdwxiDflipep3fWY0tCtXtdAVD73Qg2hYekzh9uffKafK+QyPQRTXVd+DtBqNYd0g6j
         0KLhrnzdEapaTxjs06/Q/340NXo7BddOkahSJB7rwstqGlek1duhbgKmbLxcsv5UsRZ9
         2+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753567237; x=1754172037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKgDBzpB482TvyFqvOq3d6wY6IS0m+ixRuGGE9LCXHM=;
        b=IpJ5F5BDUDHCgZIl4qZJVTwVn1Dc+4nEZo5CBM+4HzxOa9XIMU4wwwjN8mvMHR0a4u
         fGCvSmUUzELogeEfRkpySbWatEMoVSzBGqv1aE+E1tBU07kGgbAbutVDJkfPUVoGFJoF
         AmzOhmq2FcRW69kBRycw0Z2O0sr1MT65CkmUIwPzcvSL+ppqUU+V800dZzYZ6MOBzh9M
         JX5eg4KptEbbSgV2n4MUnqnlsqLNogodydB873PXQOor0SgZAIhuvRBQhmK2obMAh99c
         wwjw+k6mVkeNaujS2Bg3hdmgZnPR+gIMv6wSrUvvw/w/wBFQVmRjuLs6T8/NHNuE9caS
         g3gg==
X-Gm-Message-State: AOJu0YwUPpvuGDoliF0yXPzGSO2Wr0q8cemXoec4M5+ZBTo2AzjBWj+a
	ozp1yXmtG9B+lgQAyP8mcySB1Ph7sXjMoArxzqKNldSAPT/6ruhGe+BOxI6VnIKB9os4geh+Vcd
	OgfVy4CXrVGIONAWde0pCs9ln4F/cKzk=
X-Gm-Gg: ASbGncvepiHPp3Aveyl/05prHPDIib+bfrIqGsyhM4ACX1OYVRm/Ml4Bdn48UBpHqbd
	09ZxQt43xOSZXEq4YAkdBDO6w1Sr5VoM1griBp4KOxyUr5l+XvU7DE4g6BkRzioWcFgMoEiFD7C
	j8mqWy7IouVMmm1oFXWxUWq5bQXe19dl8HKs9sxoV9fFzRT3AZPEkgArrbaodh/QelOKQmrboBR
	dkihKPZ
X-Google-Smtp-Source: AGHT+IFKYAubs9VadEJ7mRywoDvu17G5zydmQudFG9vKiOWaYWA4+BLN+MyK7cFB6EcrfDdKnCgTkx/hl6qwAcKf0Ok=
X-Received: by 2002:a05:6214:20cf:b0:6fb:619c:98ac with SMTP id
 6a1803df08f44-707205e9d4bmr105126586d6.39.1753567237290; Sat, 26 Jul 2025
 15:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9EJBJoFQ=MzCWYPM-etwcjkbh1eGEmpS003tt_YreMsw@mail.gmail.com>
 <22749.1753471482928656004@lists.openembedded.org>
In-Reply-To: <22749.1753471482928656004@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 27 Jul 2025 00:00:26 +0200
X-Gm-Features: Ac12FXwybHwzQ6EBD6XDSbeDyD4HHEz3iGzgvjJ712ox_X2f7pb5c8tBjAmWsjs
Message-ID: <CANNYZj-HhugrjDMhxmpav2DB0hw04_+VC7v3=Wb5_2rouBVMRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package: disable renamed dependency error if
 allarch is overridden
To: ohnatiuk@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Jul 2025 22:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220941

On Fri, 25 Jul 2025 at 21:24, Oleksandr Hnatiuk via
lists.openembedded.org <ohnatiuk=cisco.com@lists.openembedded.org>
wrote:
> Do you mean removing the conditional or removing allarch inherit?
> I don't think I can find the time to work on either of those as it would involve additional research and testing to make sure nothing breaks in the process.
> While I would like to help, doing major changes or large refactoring to address an issue already solved is likely outside the scope of my job responsibilities.
> As downstream users of the code, we were hoping the patch could be merged, as we would then not have to maintain it on our side.
>
> I suggest to merge it as-is and then have somebody else work on proposed changes.
> Otherwise, I would like to open a bug report so that when the issue is eventually resolved, we could drop the patch.

Filing a bug report is fine. But do not expect that the issue is
somehow 'eventually resolved' just because a bug for it exists. This
is not how open source works.

'Merging as-is', on the other hand, is not fine. We have learned from
hard experience that merging 'quick fixes' means all incentive to
solve the broader problem properly is lost, and nobody would find time
or interest to look at it again. Or can you name that 'somebody', and
did they agree to do the work?

I'd politely suggest you talk to your managers, and explain to them
that using open source is not 'free' and sometimes you do need time
for making major changes in it that don't directly benefit your
company's products. Even better, convince them to let you maintain
something in yocto. I'd be happy to supply a long list of
possibilities.

Alex

