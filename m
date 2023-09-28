Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7CEE732F0
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 16:43:58 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.18313.1695919433826280256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 09:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yutiz7DZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50306b2920dso15702122e87.0;
        Thu, 28 Sep 2023 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695919432; x=1696524232; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j2OB1CNXpzriND9gs2+nisX6A4ZOdx5ALgUjV5uUvCU=;
        b=Yutiz7DZeFqFd2bVJhMqX5RwOvDaT9nvBTCQLgZewcj6R80quXjrnzCUgHYab909PO
         ih1WfbJ2PyiEmPnsjhOmGUy+yt93xzUYT5WREG7KnCIvwcLGkyztRI+J58VxIIfAmsMR
         CtWIav2GRNttW3Vpl/vzrt4OaE3Tt9wDM8p2Kf1/F1WRFQfrsrYZ4kw9rsAbDJNM3sGe
         2cdq/1HGukerx+CNzXNYpUQcDs+5i7hdVQtCXt8xC2vdDRog9yVMcK4rGUq9ukjaQSqA
         pAP13Uy/2DZl9R/5k8Qj9TIF16vhFxVyc2nezrJbmJONIgjp0I8xz38mcGNwb+0bRnQM
         pDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695919432; x=1696524232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2OB1CNXpzriND9gs2+nisX6A4ZOdx5ALgUjV5uUvCU=;
        b=PD1H1dAEGzd8V9hYUjgRdqNU0w+x7luDhx76Guv2MoIMc7Rd85iMxIBDTh5YHTyfJ0
         7w7ZryVCL+Y48Cjof9yx+eZnlsixUcU/vBkmX5mGFk5eqV05yMiuEWPT+dXhxw9K+Mas
         NizSyCdgpDbFFvHlcxWXaWxymQJqS9fKGNWuVFScLg/FlxrQi29RJ4sBcbrijfB2EmWy
         Dx/ZZyNkeg04Se5j2quU9qBPWVAdJZpNIKK6ZWFLSz4jbKH5xMRlSG7ar/22Sp1Fl/QH
         v5tkdV3EcqEh+RbcIngE9UwhawpuDb+A8xNQFgVbnLTIkl2fr2mTreUAX78BMrxin1Sn
         sQDw==
X-Gm-Message-State: AOJu0Yw/eE4Q+veJOt1I4vuuHKt/SLhjfVcNQbKO2Mn1CL4w6wF8lXId
	4VFgsSNcI6c/uLrgsIR01FqCYNSyRCqwnCxLdw4=
X-Google-Smtp-Source: AGHT+IFxT4X2r3jiDEvNOFrx+QJro0hTZDO27aABdoZlPDK83NUcHzb31Rsye6iEpFq2Wbn9jnUjQc4HMv0efkVCkkM=
X-Received: by 2002:a05:6512:1282:b0:500:7bf0:2b91 with SMTP id
 u2-20020a056512128200b005007bf02b91mr1448619lfs.13.1695919431633; Thu, 28 Sep
 2023 09:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
 <CANNYZj8RAvj=sJtQuH9J_zKKAsUbhcdKe0hiA2JJy1wwxuzDNQ@mail.gmail.com>
 <DM8PR12MB54304C00CC6C924121E1CBDF8BF8A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CANNYZj8eSZZOfPGYCdYPrWjHf74dmRW5uYAZfTBp7JemPXxQCg@mail.gmail.com> <24b60007a669d075fa1e4ccd18980ada93714c7a.camel@linuxfoundation.org>
In-Reply-To: <24b60007a669d075fa1e4ccd18980ada93714c7a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Sep 2023 18:43:40 +0200
Message-ID: <CANNYZj-YBTN_yje-fyzp12YDF9XMaZSuMvLh6qA1H+9GEYEmfA@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Core workflow: sstate for all,
 bblock/bbunlock, tools for why is sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 16:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188374

On Fri, 22 Sept 2023 at 12:42, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Things which used to be problematic:
>
> a) changes involving changes to gcc-source since it uses a shared
> sources stamps which confused the tools (at least used to). That may
> have been before gcc-source became a recipe?
> b) changes to a very common component (e.g. autoconf-native's
> do_configure) which make it hard to understand where the root cause of
> the changes came from
> c) changes which affect many recipes at once, e.g. the do_configure
> function in base.bbclass
>
> It might be helpful to write test cases for the scenario you showed as
> working above and some of the ones I mention above, then we can
> document they work and have an easier way to add tests for issues
> if/as/when we identify the problematic scenarios in future.

I've now written down the tests for these three scenarios and got them
to pass (in oe-selftest too \0/):
https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/sstate-for-all
(check the commit message too)

I am going to look closer at bitbake-whatchanged, what it aims to do
and why it doesn't work. I have a hunch it can produce useful high
level reports, and so shouldn't be simply thrown away. 'bitbake -S
printdiff' is too techy and verbose for some use cases. Maybe we can
fold that functionality into 'bitbake -S whatchanged'.

I'm on holiday next week.

Alex

