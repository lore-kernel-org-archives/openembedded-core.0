Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AA1C4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 16:18:20 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.41087.1699892292438997731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 08:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sbfjYaWo;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9c2a0725825so708309966b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699892291; x=1700497091; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0mFbr7ALSn8E4iFNGkJkvooSHK+rE9NgYjEm7/+2kc=;
        b=sbfjYaWoiBA7Lm2Pum93R9/ozrF2tgf5Gd/cLc3fzC8Euxq06CZhDsG2ofpI4xbvmW
         NxKnhQ/UI/fKmMKML1WXkN+6saRktNA0UzHrRDjE6G0+Oz/MCiNHcIgQMqAq84cELDTo
         fXGivyKjwEvvWFncIzV67SmEoZoaA1STGmgLaDKn3Ts2/gnX67mX6sVuw1Qif0fXHqZz
         KjrgbeiUxMj2EKxdEQc5rKV8puSGrSL70lC1jkaS74jw+O6970toB4zw8sKOF/9ePJ8l
         NCio5jz4Y36ZIJc1n7XbnH061Ksb/lG+tZ5OqGbmzJrNHVoJjlTBSVOIDBJIF21BpOhJ
         6Pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699892291; x=1700497091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0mFbr7ALSn8E4iFNGkJkvooSHK+rE9NgYjEm7/+2kc=;
        b=F5oZQFl2yg9DEokoqD9ywgDnIhwH+my9QThxfFP0uKkjmaBujZsZlofG42yU66pbLq
         BhBbmmqlRtOwF4QJKNmpFg88lM+FGQpJktz5wYkVbwTC7gkxD8cM4uHztuNPY1y54KaG
         sMnFZ/2zaf9T0kQZqkQvSXxhiz/e8QP08KJDKgaCd9LuAmRfpb97OFYT3Zal1gnDGtse
         3zTJ1oOKeE7w4Q8TsicTPR1LmAGs3g3Guz5aDmbsip+KaK7jCigscH672OaobmZ90+9P
         Zvohqwq2csy7s1O9lJAKwfl2SiLoallgMKBDoJYbkX7N6XaJ2OorAW3bQnV6Yk/3FK8e
         ArDg==
X-Gm-Message-State: AOJu0Yy3XCNVY6jOQxiq+wb5d1V+V/MbWHPs+GABaykuAFaCFlGWUXqe
	CuThiAXM1mTLsUWXDK8HqHtX3ShSM5WlLQDe8Rc4ZQ==
X-Google-Smtp-Source: AGHT+IGFX5tElG5C8Dmx7eXw2u6Oci0fFjvxaGvW5deVUJTOYjJyGtOcpvh3g6K3uyIY22eAMnGkdBRug0X3FyNBV3w=
X-Received: by 2002:a17:906:5653:b0:9c5:158e:f61e with SMTP id
 v19-20020a170906565300b009c5158ef61emr5482762ejr.34.1699892290785; Mon, 13
 Nov 2023 08:18:10 -0800 (PST)
MIME-Version: 1.0
References: <0101018bc385844a-d32fb9cc-7763-4fa2-8415-f9e65cfd111d-000000@us-west-2.amazonses.com>
 <45622371-efb7-476c-8756-52d68e27d6e0@baylibre.com>
In-Reply-To: <45622371-efb7-476c-8756-52d68e27d6e0@baylibre.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 13 Nov 2023 06:17:59 -1000
Message-ID: <CAOSpxdZRS3B-0QfbV4OcK063MNTmYcGaM5BtD4rb1H-sHHq7xQ@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][mickledore][PATCH] grub: Fix for
 CVE-2023-4692 and CVE-2023-4693
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Patchtest <patchtest@automation.yoctoproject.org>, 
	Xiangyu Chen <xiangyu.chen@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 16:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190481

On Mon, Nov 13, 2023 at 4:38=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:
>
>
> On 2023-11-12 07:33, Patchtest wrote:
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> >
> > ---
> > Tests failed for the patch, but the results log could not be processed =
due to excessive result line length.
> > ---
>
> Hi,
>
> Patchtest failed the signed-off-by test in the CVE-2023-4693 patch
> because the "Signed-off-by" lines don't have the proper email format in
> them:
>
> +Reported-by: Maxim Suhanov <dfirblog@...>
> +Signed-off-by: Maxim Suhanov <dfirblog@...>
> +Reviewed-by: Daniel Kiper <daniel.kiper@...>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@...>
>
> Can you correct this and resubmit?

I'm trying to get the final mickledore release built today so I will
correct this, no need to resubmit.

Steve

> > Please address the issues identified and
> > submit a new revision of the patch, or alternatively, reply to this
> > email with an explanation of why the patch should be accepted. If you
> > believe these results are due to an error in patchtest, please submit a
> > bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> > under 'Yocto Project Subprojects'). For more information on specific
> > failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> > you!
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190477): https://lists.openembedded.org/g/openembedde=
d-core/message/190477
> Mute This Topic: https://lists.openembedded.org/mt/102541228/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

