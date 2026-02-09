Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E39E81BC7
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 13:57:49 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47863.1770645463823241380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 05:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fpaR2VYp;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50334dd44d2so36507581cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 05:57:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770645463; cv=none;
        d=google.com; s=arc-20240605;
        b=AqD8DjwwaEiYL7SOxB63sQx7vpp8vmg98+QyBPaAH1p2M+bhC9432yOra6pi93a6Oe
         +Th8vyLqLuNKUsZKS6Zw9xSS2evdDpa33zgjY4dVw7s6qsy+DyNRnwe50PbkSxbK/VCF
         lIjNtxaIB8OKqJCSsSS3UBM2NYrylKTP0yLkVGGKVAmVEmaHfiYSaw3GZSj0GIDBKNyD
         UdgHKbD0m+fIn821af7PCd0dOI9dicav03Sx5ImSZo8TGwfpzEdyIdIPVCTVU91HxIoi
         UVKiu6nqylSy86Y5faqYkttd5qTNll2sltVTEJMaJRGrLcowbt9qfDOZfKFcN02WL6sy
         ynyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x7Cb2ijMtkUaB5q9Rids5Gc5+LIjdeD5Vl4UHrAQCmE=;
        fh=F7qgriudDbqfthxq7BN6WG+H+qMwoOh4lrmBiGIVSY0=;
        b=hNz/XqiFWe1/OkVeW1JkvYbV9Bt93Qt7VceN3o3qvZ3QHkHcx0QOgbxsj8APT09riM
         NGhvJzASbUh32NTv7VvaafPG6SejVQa5DE/XUPlHJ9vvAqtqTU0Oi7O2krueTSe8G07h
         ysINRWwUOUwutYSa0EOnPAvD4ewjvEXoN0Sjad1kZB3LeR5WknUb0udwR0n9SfxXNqf1
         RFMoBJxYHp0yrTK02ZD4Qp4Fb07Vu3nY6+TvsHN2XAvFnbhIGXxTCxRITF907fOzPMg0
         eavFs/2KNbgifKSIK50OE64B9U3MdNnezpB1SM7vw2SCzf1UM8CKAWvAkzV+9RsMKEA5
         uArg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770645463; x=1771250263; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7Cb2ijMtkUaB5q9Rids5Gc5+LIjdeD5Vl4UHrAQCmE=;
        b=fpaR2VYp5ZpDDbpY/WEuDg62Tgv5sy1pDIm1mHHqVNouQyWCHqYeOkhZYlUijNtPzI
         M9HJYbJi7w1yjxLDDUyN3X9cKTDzZcTBkvDZmfAGQR4PObe79WCqoqnTA3ZPTysyT2FB
         XWP12TY7L3bR2N/0cY5YhwF4kE+FvT6DGPXkitganeL1+w79K7RUty0hJLJdlerg81Mb
         z8DCGAHVMlZ+W08Scs7xFxnWeNRYxca/6Wn7ibO/KKKLwAcnRnLekDEAvqVQhCAHy0WM
         U/srbFpEnBps+9pkGVvHRisqY9dWdBRiEUYrEoqYa5MFCmQpteN2yUiB7eNOTScdMXfT
         uaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770645463; x=1771250263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x7Cb2ijMtkUaB5q9Rids5Gc5+LIjdeD5Vl4UHrAQCmE=;
        b=P8qGUHSzkBiIzFJDGObnKM1pY+fjDlgvBxk+oBfIr+UJFN0ZEoFQPcf/8yrREn75I7
         J19f9BglMJO1Gef35OLcBFHM4dCWaNzLHcK2cnfVkGi1kH7XEI9rEQMuoftsB9+8hmJY
         oXLd6s9b8RrUSzTgxRRjd8V1JMW/hjRpemxokrSWW9nTdmoBAKOMOu+ppZpBbqmpQsOm
         9pebKBWRKW8f4icBytzSaoNTmYzA+uMBI01PAvEVD1wGqPsqRQQl0yUiOH9FcglKMywu
         XEpOeDMk9soTy5EOLMzp+S6D+oN8NmkHF67M01WTem7B1rNuY3meJYgaLnH62R8lMkYq
         J+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOQjnIyHiEIuG0d85ny2hX6G+QWXaoysfoC/jezqLzUrcagE8kUbjT5GWAX775UYy6W02ZO0KFtQvQCcFn93Qgkg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7meJH858pZmeNTll1WMAi5q2l9THkFmMPLkr7NgeHIfDDGMnZ
	UCtfl3vid3dM+/JNBiwEJLrsMFQIIUJGPPIpsGyl0ycYUHZ/DA8bHFqjhghiNJpvS2P7qX1knCd
	l6riJqgWI8cVhVh2Yh+gzcx5YqeQbLg8T/axn
X-Gm-Gg: AZuq6aLiDPJsVdqDyEiRhY1RQ1uYxFx+7rBcg27orWhPWl4+0yIAyLjJbek4B0w6m8C
	sDoYsPQNwpC0qorGLUEGSLPVGszIUoTCDANYRInoGapZNKNAMrpKoyAIglFYfKwsDRQXgjjNtP2
	PfDU/CP78ZG5Sfm2jO/38RDXMvBgUCuOrVbWv4wUD5kXJ6R8ovOPCvojncQHtF+fPDZW4Z/Temk
	6fMEQmy5zCjXQ0K2SjI/zBHYKTyBtwrHw9boQN3kQa6T82TlDOnDITYK9VDnGj6HpyeLBz3cjwG
	A46+9bvgPsDnDKBzjFpsc5hgBsCp5Q==
X-Received: by 2002:ac8:7f0f:0:b0:4f1:ccea:6744 with SMTP id
 d75a77b69052e-5063995d9ddmr151443511cf.58.1770645462750; Mon, 09 Feb 2026
 05:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20260126123844.1052-1-wangmy@fujitsu.com> <20260126123844.1052-5-wangmy@fujitsu.com>
 <DG0DGSLH43T6.27SQHKZ8XUB43@bootlin.com> <TYWPR01MB11861B4947B9FE63E4DDEE869DC9BA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861B4947B9FE63E4DDEE869DC9BA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Feb 2026 14:57:30 +0100
X-Gm-Features: AZwV_QgEgmnQ9CjxQaM6QJyEmZiZrewC9OtdG5MoycGb4jmN3WtmJ3h9e3u1CG8
Message-ID: <CANNYZj-Hj6An36PXAjT0HYgA0iJNoVz3kTupa_6cNSu2_zp3Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0.46.3
To: wangmy@fujitsu.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker <paul@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 13:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230799

Note that wheel update has merged, but not the python3-packaging
update, which causes ptest fails in master:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3182

I guess we can wait until packaging is in, and then the issue should go awa=
y?

Alex



On Tue, 3 Feb 2026 at 10:13, wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> When python3-packaging updated to 26.0, this ptest will pass.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> > Sent: Thursday, January 29, 2026 12:45 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0=
.46.3
> >
> > On Mon Jan 26, 2026 at 1:38 PM CET, wangmy via lists.openembedded.org
> > wrote:
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> >
> > Hi Wang,
> >
> > It looks like we also have a failing ptest with this one. I'm not sure =
why id didn't
> > show on my previous builds, either it is linked with other commits or i=
t's a bit
> > intermittent.
> >
> > Failed ptests:
> > {'python3-wheel': ['tests/test_metadata.py:test_pkginfo_to_metadata']}
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1004
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2963
> >
> > Thanks,
> > Mathieu
> >
> > --
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230422): https://lists.openembedded.org/g/openembedde=
d-core/message/230422
> Mute This Topic: https://lists.openembedded.org/mt/117467143/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

