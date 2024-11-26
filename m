Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D1BD3B982
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 11:11:22 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.43781.1732619480944401855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 03:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I8Br//mb;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6eebb54fc48so48886727b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 03:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732619480; x=1733224280; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vHD+D/e5R+dgXx9br2SwsUkOE89MMVs7vWIg2EQf2Z4=;
        b=I8Br//mbw+QbgNXrS2xvOhek1EFbaRulbpGFGmIsNa0HiPi7/6Gk8e+wYT2jeRHr+T
         8HqFV7i82BaVPMj6Nus0pHbX85en0OTbkxfm+9LnF4ni+oy8PCBczbzWfLDw8dyTyVZg
         6tA6ovUotddu1jafnv4nGj2oztikvLvJbvoG/hCNiQ/xwczgfXrj/PK+Dx48DOoVmlML
         oiNT65VvBbM8hB2hm3lTfxbv4B49NtDHJY1gdQsxPxHpCtbjUQeDAgzhyla3lR7ECsfY
         GVVXjovprcME72LBRnCFV5HYaPyqpGwbs7ua6f1qKQ4f3zKdQhPC+pP4HSAjzGKeZlSl
         UTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732619480; x=1733224280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHD+D/e5R+dgXx9br2SwsUkOE89MMVs7vWIg2EQf2Z4=;
        b=j5Xui06b5v37Dd7giOZhu9ghUnNpg3HsCi7UF+k8n8tRzC1v6Eb9nXDL83JFNUcljE
         pB+TqLlQADtbRfkwHxb2uauqyEwlubbgreEvDv4CSj8sJebb0/RP6dWUOoqL1JGuPs8y
         sZJjB+kFYOAb28qFaEJnQE8ECS7tNJ+JfSRr5HAo96PVsRHG1YBk2aJN5FgRaLFspDR3
         VwH9PxcwZR3EVvN9Hr8ECwEDckkYo5mnoH8EinIIZDEN/SFLnbRnyG6B9UK0UVfg5euA
         /yN7g3lH8TAldUuC6DXXggrZe2eRvBZfNkp9evuHXGeuWIrVGBWIsuVOsx3k8+exzFt9
         GB0w==
X-Gm-Message-State: AOJu0YxtzcQXdi9l6vPZEUKAopUjQ58k8A5cksDCsXdMba+IREV0fILG
	ra+T0xvRCClimvBE6prlTuMyQ9nvaU5t0CnJoodtOn/lQrogYsD7kJUA34lIsvlh6HsBW/JA73X
	CuGhHRsPDhDTI+mGU9ImVC8EkDLs=
X-Gm-Gg: ASbGncvVU8lhinuNephVHXFprir8IZhSFjse60XreBTOpwxSzfVgyHCvXlSYDaiciI4
	OcsYXqUUVyO2/2xzPRNzU9RJ603SabLjtOM94qrzm5p+1ibPmFKGkgFPrP+9xHoxiLw==
X-Google-Smtp-Source: AGHT+IFh9Lbhsw0qcaAD4MZ/+n6xqfQECNOVpPZL0L0pc7jFCCRhP/SEG8PB39NLIcfoz1WiBpu2E3RxDME6wE5wArc=
X-Received: by 2002:a05:690c:450e:b0:6ee:781a:a29 with SMTP id
 00721157ae682-6eee0a4b8e5mr176500377b3.35.1732619480102; Tue, 26 Nov 2024
 03:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20241126015518.2463257-1-danismostlikely@gmail.com>
In-Reply-To: <20241126015518.2463257-1-danismostlikely@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 12:11:09 +0100
Message-ID: <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: package tkinter's shared objects
To: danismostlikely@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Dan McGregor <dan.mcgregor@usask.ca>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 11:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207845

This is not correct and will be undone by the next manifest update
again because that works from a default set of options. You need to
add this to the python recipe.

Alex

On Tue, 26 Nov 2024 at 02:55, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:
>
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Seems every time python is updated this gets removed. That's likely
> because the tk option can't be enabled in python3-native without
> creating a dependency loop.
>
> For now, re-add the tkinter packaging info to the manifest.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 4b7f9cc7e33..3ed99b9012d 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -1092,6 +1092,7 @@
>              "core"
>          ],
>          "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>          ],
>          "cached": []
> --
> 2.47.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207824): https://lists.openembedded.org/g/openembedded-core/message/207824
> Mute This Topic: https://lists.openembedded.org/mt/109783729/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

