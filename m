Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E132AC78859
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:05:10 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.20523.1726844708597838583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pRibnsjy;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ddccc408e1so17517987b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 08:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726844708; x=1727449508; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTaHlgt9DMuFill17S7WtDwDx9zR2Fbs0yEsGNGU7S8=;
        b=pRibnsjy8m5Gi7GHbCC9lyFvpmQkj33msosUt4HotghFwfVCcv4WOdARpGG/en0y0E
         em7vIZFWuysxB7ZPqWxE+8iQE0BdP6wlcElBBnDB61/O8AQdVLj0MJTlWrT2MxY/MA+A
         XXo/nT8U0YLSxzqMWPf8yii+iT7n3XaEll0Mxg2YMX9HZFBaskL0m54p3CSXHM38BL1w
         l4/38woU0JEI4uDYCI1a7hhPmLEmTRDovLXfnLp+x0CgTORINte5eANXXhAEs0mJ9cD8
         sTrkrZW/GECpKYR6tcnTKxuhAfmlwCo/YmzCqMVOXgjUyhE9+/9hUCSYpIvj5Od0Q7Ps
         paEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726844708; x=1727449508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTaHlgt9DMuFill17S7WtDwDx9zR2Fbs0yEsGNGU7S8=;
        b=Q4pT/2lvODCgOXZ/a6CttDgDrWytk9Y7QfUXsiV3HjRNogWj0ILxiPX+tyVKBgVrJm
         qq2kadbpeswY/YiaCmKs6RzYEI8jn+tdfJ2pyLVy8qGUtT9vB43FKOnjQBgBIQ9vOYG3
         Dr/i+gV+qBUm1EKgGjr7ec4VVgeEXjXMXR4hnc8Qm5/iLHmqJkVs11dU3RWs/2Bt3qfK
         BTFVl9hoyBjRrFDenRa1d75ke1RIoWfmufkDJW8arXhZLfAkIapd1SfeUFijaoxkS6OY
         s+NDvVWYxrAknIMQypCy0wEDyzSOuz5iPFHwTA1kzegTEKloN/6CYSpOkQFGsQzOhKLu
         qVSQ==
X-Gm-Message-State: AOJu0YzNfufMzKrX3EW2Pp+3JlaSId9B3CnJDLABoEyogaiZnj9DLMCL
	TDGPKF3OZJK7ZmdLzkLCAsiBpjc8EM/prm8NZWyI1g/0UbOKWnbzd5mS9Vrfsgt3gKk6FJ6hoha
	KRvPjksjcHNdW7GID3L/7cHypcpOTOVVNKoQNdRMhVNgSYh6h
X-Google-Smtp-Source: AGHT+IF+0rJbtx/WoblVlvy3SYrANmxa+Wf+CgDujeR64zkWhOjbNUGpTk79EEKWJyzI6tcxVrelDBla+htOKYCHpNE=
X-Received: by 2002:a05:690c:ec6:b0:65f:8f77:720f with SMTP id
 00721157ae682-6dfeed0838bmr28642887b3.5.1726844707707; Fri, 20 Sep 2024
 08:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <GV1PR07MB9120F113BECCDD2540ED5333A86C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
In-Reply-To: <GV1PR07MB9120F113BECCDD2540ED5333A86C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 20 Sep 2024 08:04:57 -0700
Message-ID: <CAOSpxdZq5cnXR_FLpjhP0eVPchWq3WPYCaMvFkkaB58zee4_GA@mail.gmail.com>
Subject: Re: [scarthgap, kirkstone] backport request
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 15:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204758

On Fri, Sep 20, 2024 at 7:30=E2=80=AFAM Konrad Weihmann <kweihmann@outlook.=
com> wrote:
>
> Hi,
>
>
> could you please backport the following commits to scarthgap and kirkston=
e
>
> runqemu: keep generating tap devices --
> https://git.yoctoproject.org/poky/commit/?id=3Dc9a999940069623b95e8300fea=
d4838de9edccb8
> testimage: fallback for empty IMAGE_LINK_NAME --
> https://git.yoctoproject.org/poky/commit/?id=3D309d1bd9357e91934dce1e8fe4=
15cf945a264be8
> testexport: fallback for empty IMAGE_LINK_NAME --
> https://git.yoctoproject.org/poky/commit/?id=3D2de2968b8c142589a6fad47b9a=
82771ab7e5c0ab
>
> in the next batches of scarthgap and kirkstone.

I was able to cherry-pick the above commits to scarthgap, but they do
not apply to kirkstone.

If you would like to submit versions adapted for kirkstone I'll add
them to the test queue.

Thanks!

Steve

