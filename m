Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F3FC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 22:49:10 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.26620.1738795750285460175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 14:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dyZLHt2t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so2635745e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 14:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738795749; x=1739400549; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XiX7l6duPs9e7ZVDTW687t5RFUNEp+MNUTlBVGBRVxw=;
        b=dyZLHt2taV9et+VHCZILEgBeGEQTLR8GAg1JYMpUqcydV8E6t+9kG8AY8mMyeoVj4u
         +IGIoXN9VcZ5k4sSO8GzqEtAD4J2LS+52tJiAJTnWvCp1T+nbIJX3BP+LrrEIkZ+dA9O
         ov8DqTw9EZne1IGMeCxqF+LfY505QXqfQNusg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738795749; x=1739400549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XiX7l6duPs9e7ZVDTW687t5RFUNEp+MNUTlBVGBRVxw=;
        b=HTSi3A+7LLH0y1/nKIXydsWvc4DI/4XoZAY3HowOxA77pS4WSbU6fxJ9pgtZRrFQAn
         Ri+9JBxDpmYd3J7esfW33AL4aJsRK2NKU4qldwAgeX6m4xMBTgsE2OHANSNKHYihvQXJ
         AhqY0Nu+uhnphA0zfX3GODZ96zotCRLPBhyD3dzfBCcBxdrbSceByKtmWePee4BPZxer
         yl5JzHOVmEd0ARIOllQddpYAi3wLDpivn7JJUbEwUX4mvVWoQKzY5gy9LVG3v0glF1Kt
         8gcHUxXeVxBXkcqWu2zeNGk2arRqOtIv8K7h6gOxlkjxe15OQNkSg8bY2lMbJZhZ/Mwc
         /7BA==
X-Gm-Message-State: AOJu0YymKVm0/RA0lIhm1lnRdmY9yvIAZzzHdhw5Prs2JSUlO48PM+jQ
	Nez19F7H9KHl1XkJW9/7u85eei3BsC5KZqgb42B+EqsK1L5Rgjjj2lm6dhiGUHI=
X-Gm-Gg: ASbGncv2YmnY/wBarR2tPH+7UKbM8kheX5RB24VUhMl9vZCLbEHa3an35lUszECVFQ4
	f1/ndWZOvJYG47r3QMmCUwuDfQbJIxpCZPmcI4/RPWHnGOx8cqPw/cyJ0LeqQsfiZk0lRTdsCsN
	H3iDXlvZ+UnkQWgM6gVix6IZ9b2tNhePSwvNneG3U3yioBDWddtJcWJFfCC4l/lYFx9x5pjgx+l
	RMTYpdGs61XEmjzAOFQiRgsWp2+wR6ZyqoteHTcJ6yW3TWYvIX/Xv3+gG4yNiG279b8yTIouUxA
	HPOL3y+jyCwsDwJAj8DR3wd9PGMZw/tlDc9BHjjSPjrPIaNqA1yKei5SJs25gRBPi3SpoX9GO2U
	Adw==
X-Google-Smtp-Source: AGHT+IEfXD6d2vEjZVkZFHmqZfaJwDFJFvcqG63iNF6fVM7ikJDs4nQ3ok70TQzS7yrcWfMp38EA/w==
X-Received: by 2002:a05:600c:3556:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-4390d434579mr35356355e9.9.1738795748657;
        Wed, 05 Feb 2025 14:49:08 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:53a4:728:e20d:14f3? ([2001:8b0:aba:5f3c:53a4:728:e20d:14f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43913e6141fsm3023345e9.4.2025.02.05.14.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:49:07 -0800 (PST)
Message-ID: <1644d8c68e010b7bfe524c8fcc144ef650367315.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] bitbake.conf: Include fragments before
 local.conf
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 05 Feb 2025 22:49:05 +0000
In-Reply-To: <CAJdd5Ga3VU_CW_Dw2TTacOEsACgMJE9i4SnVo4mrZ=tGMwc95A@mail.gmail.com>
References: <20250205212427.2044310-1-JPEWhacker@gmail.com>
	 <CANNYZj9Ca6cQcFcb_moABSKX5=HtdRAzvL_ayyCg2cnkuEKcqw@mail.gmail.com>
	 <CAJdd5Ga3VU_CW_Dw2TTacOEsACgMJE9i4SnVo4mrZ=tGMwc95A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 22:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210886

On Wed, 2025-02-05 at 14:55 -0700, Joshua Watt via
lists.openembedded.org wrote:
> On Wed, Feb 5, 2025 at 2:36=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >=20
> > We have discussed this before. With this change, users will no
> > longer be able to set fragments from local.conf, as addfragments
> > would be processed before that file. You need to use ?=3D in
> > fragments instead for things that are meant to be overridden.
>=20
> Is there need to set fragments from local.conf? IMHO, not being able
> to override a fragment in local.conf is "surprising" behavior, and I
> don't think it's going to necessarily be possible to alway use ?=3D in
> a fragment; all of the ad-hoc "fragment" management systems I've used
> before have allowed local.conf to be the final source of truth, so it
> will also make migration to use config fragments harder if they don't
> follow suite.
>=20
> Anyway, maybe some other users of "fragment" like systems can chime
> in if they have an opinion.

FWIW, setting fragments in local.conf is exactly how I first tried to
use them and I can see users doing that :/

Cheers,

Richard

