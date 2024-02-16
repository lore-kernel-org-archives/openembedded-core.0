Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C038C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 09:35:49 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.15256.1708076142578947212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 01:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tz9tHBuW;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d10f52e7d8so19790731fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 01:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708076141; x=1708680941; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kG6pJTcW8FbXwCSe+fwmjP63fQmLxjMZsoHkG7TB2GI=;
        b=Tz9tHBuW/P9AqTazvuPix3TvK8+1GUep7dHFEZQpSmgGn0XF9FLCTmxtO7dMLRQtBC
         x25nKBnuxisvRtGKMeYviw0W6OsdC1earAKic/m0ROfQENvbdekLlDfZFCG9hC5nyJs/
         UHcPLuRf2lQQeyLmKNm2pVm49G/JPADZZzV+okuxieSjRIk18j8xTVrZpl4ih9j9tf7u
         vDdnrr74CCA/hByOYTXpoahU3M/ulM7xmFESAoS6HSm0Z2cp6D5iM0EAjPRBG774HlSr
         GeREAepfTv64GV7MI8tqcYVqEN/CNs4WeXjm4MJgN/7YPgcaaHQYeAyS3Z4HJQpwJrmj
         EfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708076141; x=1708680941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kG6pJTcW8FbXwCSe+fwmjP63fQmLxjMZsoHkG7TB2GI=;
        b=CgdTJJG62gluj2xkodToPK4JqvPextGfNIzYMpJ0CQ/dv6I2KPST0wWkuio5oEToPM
         ZexX4G1u3038wzUOSyF/EQgCOHBCJ5xdT/9IVZDYNd2vOKy9xCqcaaVIMh+bWq7SICaS
         kT/07t69mkihhYUNqSxn0jMVLA4pDjyBfRPD9xwK8x/nfaci1o8TzamGLs8u6gJOp22j
         aHTZwNquQRUVTwlZjkjMdiTz/dsguYQu8XH8zKMiGFtsMgY8mHPCWQpsGSkBEorOqqC8
         HllMO4I9DPt5tHsLggKfrEvN/21Mqanb0mlbB0xJYA1r9O6kuRqJGdOJXfvlaCx5Kr8k
         j/KA==
X-Gm-Message-State: AOJu0YxQcYrU3ovVkVtS+N1eVs+X3/S0dMZjZyFh24tiq1jwC1NgU3H7
	N4ukxvaojXJ+fO4E1sTluJILPuZO0uIelBzkW+7Mv26qgYpNTNp5ov/8zysb0Px3cCnS+EnbyX3
	iXxJk8353ZGsJmN6P7khGm8WczsU=
X-Google-Smtp-Source: AGHT+IGClZlSj2t7OGWu9Z0gjjdDPOXI0NhZiZgXPwt1wScn0in/uP3A5Z8XulXxP57hck4OJs4neGFVvTG8SRc3zag=
X-Received: by 2002:a2e:8047:0:b0:2d0:a52d:5510 with SMTP id
 p7-20020a2e8047000000b002d0a52d5510mr3219265ljg.39.1708076140495; Fri, 16 Feb
 2024 01:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20240215213705.3315438-1-tgamblin@baylibre.com>
In-Reply-To: <20240215213705.3315438-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Feb 2024 10:35:28 +0100
Message-ID: <CANNYZj_ooL_1SoQ17y_03cOXghrW5MaEUc6+tpA9PVi3x312nw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] patchtest-send-results: use Message-ID directly
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 09:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195741

Just wanted to note that sadly patchtest replies still aren't
threaded. What are regular mail clients doing that patchtest does not?

Alex

On Thu, 15 Feb 2024 at 22:37, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
> There's no need to use regex for extracting the Message-ID field from
> the patch email and mangle it by removing the angle brackets in the
> process. Pull it directly from the mbox so that Patchtest's replies have
> even fewer differences when compared to other replies. Also add a TODO
> so that it's clear this needs adjustment when full series support is
> added.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  scripts/patchtest-send-results | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
> index 8190fe86c32..8a3dadbd111 100755
> --- a/scripts/patchtest-send-results
> +++ b/scripts/patchtest-send-results
> @@ -65,7 +65,9 @@ subject_line = f"Patchtest results for {mbox_subject}"
>  reply_address = mbox[0]['from']
>
>  # extract the message ID and use that as the in-reply-to address
> -in_reply_to = re.findall("<(.*)>", mbox[0]['Message-ID'])[0]
> +# TODO: This will need to change again when patchtest can handle a whole
> +# series at once
> +in_reply_to = mbox[0]['Message-ID']
>
>  # the address the results email is sent from
>  from_address = "patchtest@automation.yoctoproject.org"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195705): https://lists.openembedded.org/g/openembedded-core/message/195705
> Mute This Topic: https://lists.openembedded.org/mt/104382040/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

