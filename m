Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A99DC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 10:58:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.7738.1720090713077738418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 03:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kfh9EKZr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-362bc731810so390435f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720090711; x=1720695511; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ha2HIk8MQP0UrTJzjVw1o5ULnRmmr4m5B9xJi1u4ulU=;
        b=Kfh9EKZrT4f8v4+6qC9IhXFcUMGJsmzEvyT6fkdcZ1kKYZE7FJ2yf2H1SAbhoQQyWi
         mH6M6RYj2xCCZk9GJRWTNbWRY28nKQ/dEr9FikK+q44SFSZliSO+mv7hd04VHISIkl/+
         LlQZu0R3Tzkk9PA9xSYhO7F66Fu97sKRqDuUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720090711; x=1720695511;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ha2HIk8MQP0UrTJzjVw1o5ULnRmmr4m5B9xJi1u4ulU=;
        b=p6Dq9L1FPShdKelp/HwvgSjYQDqV4Oyv2OmeZyT5et+tNtplGwb2ZkPxHaVHN8ATxF
         qMibPuBgKSisDD60xwnirR0SmbjxL8iSdTcG9OllsioxbH5Tj8aZSRIPmrppXa+fzcCX
         PsuUk/d0OvPiwPgSMLZSWQdLRvKlHa9Qbv02d/HwrUi4xkl4T0o0oqqBb+1NOX/mEMd0
         mOjtb5w/oRtaBmQrKDXmRBlClGHEHIEvcn7Oex8uPu3YzzUaQKUHUTTCy2lWJzGJdYft
         /kokLDc6yPu+pVaqNPVv7ye9AcDA0pHS6CY8NzLlKJmkOIAxrpxDqLrqnn7Oa31o8hSh
         LuGg==
X-Gm-Message-State: AOJu0YytM1gku6O4qOqOhjcxjwq2whPHPlINe9qug2HFVgMiJy3TdYMP
	ocb/5g8AGuBztQh1L9zM4um32M9ZIdti88B4+gRt/3Q8TgUV8umjc6y6Pl9qLgg=
X-Google-Smtp-Source: AGHT+IE2gx2aJL/Qw2EqMCbBB9F9+7fMYd1gjjolXP1uwvNgyAPv4Pp1DnhSvI/gZ6F/MJ8/rmkAKg==
X-Received: by 2002:a5d:4c41:0:b0:367:8ff5:5870 with SMTP id ffacd0b85a97d-3679dd6673emr1173837f8f.47.1720090711505;
        Thu, 04 Jul 2024 03:58:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:be20:56c3:ce73:d7de? ([2001:8b0:aba:5f3c:be20:56c3:ce73:d7de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36791d7a93bsm4257075f8f.81.2024.07.04.03.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 03:58:31 -0700 (PDT)
Message-ID: <75f592bf302fbe9d338bf7c81e0499ca01929b7d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/11] devtool/upgrade: add
 RECIPE_UPGRADE_FINISH_EXTRA_TASKS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 04 Jul 2024 11:58:30 +0100
In-Reply-To: <CANNYZj_Ng3NZ47mnwX0A5S_BB_eh8==5HpGkLOpKKr_9s7VFMQ@mail.gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
	 <20240621103414.2842509-2-alex.kanavin@gmail.com>
	 <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
	 <CANNYZj9hXzes_pH_tH1P4wVUsLOKiQpRnucds-YpVtJDQRTMuA@mail.gmail.com>
	 <f9d0520c75c0144cb6f7a433769b593ddcf9091c.camel@linuxfoundation.org>
	 <CANNYZj9xwEDEw9HxHQ5zAPJY2--iuq_JvTW0foOVTF=83zefsQ@mail.gmail.com>
	 <3bd89c381318290050137e1ab5f65bd25f94ec83.camel@linuxfoundation.org>
	 <CANNYZj_o8bFtNGWj48mhDwbrisjjowV1xR_xOfWWJ-Jx3pRwbg@mail.gmail.com>
	 <d6da4fb9ffe93b23d095b72c8310fd7bfa7ade4f.camel@linuxfoundation.org>
	 <CANNYZj_Ng3NZ47mnwX0A5S_BB_eh8==5HpGkLOpKKr_9s7VFMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 10:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201536

On Thu, 2024-07-04 at 12:52 +0200, Alexander Kanavin wrote:
> On Wed, 3 Jul 2024 at 15:31, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > Sorry, I've got confused. Look at tinfoil.cooker_data.file_depends
>=20
> AttributeError: TinfoilRecipeCacheAdapter instance has no attribute
> 'file_depends'
>=20
> I had looked into the code, it seems that data is internal to
> bitbake, and isn't exposed to tinfoil.

We might consider exposing it?

There data is there and in the cache so in theory we should be able to
do something with it, even if we filter the data so we don't expose the
internal data structure (only list files that exist via tinfoil).

Cheers,

Richard


