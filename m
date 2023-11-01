Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B9DC4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 15:19:47 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.10031.1698851981254228773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 08:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fpl1IU4R;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c5720a321aso89288391fa.1;
        Wed, 01 Nov 2023 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698851979; x=1699456779; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tQO8VwiRKREozLSHDAg6JNtkxmm2aLzixBNKyQAJNk4=;
        b=fpl1IU4RVF9M4+FoZijdlKhhOEoUX45m0mJPXbjkN/L291W/gqvENcTuwBkwyQUQiy
         z+LysMbK8++r5TYRPAMeT8mUy4iYLQ5o6stzDRjCSaS0zf6KTySkcBZkF8d8qCdiTO2z
         MLvgS+LmOlD9I2WX6pg+LiAQcFRPzp90Cvsrm6VZAqbWvEfO2md1bb3GtmvgljZbeVce
         UML6ehFlfLB7tO0eM0W+a0iTQgrQyER+7pmfdZrlswFLaQ3HLoC86+8rsrVMQZEQO8T/
         KKCC+1PaCnNux2c4NmmcpUnxZrtbEg8TykckmpoNOFxjsxRr6NPYF6sGjm4N3itr9anA
         GfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698851979; x=1699456779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQO8VwiRKREozLSHDAg6JNtkxmm2aLzixBNKyQAJNk4=;
        b=gZBIY4dadu70MhC+HtEaxUE/mjXBdlQ/cRs519Y37kTh6J22+en4UhAP6e0sKRIBx7
         HkSYQzXGTowYG1eNcuxj4eyp8mGvrx1o3zt0WChlvIdSpZwIjj5YZofv28M2u7JOYUFz
         gO2TF9RnbGzU8dFZNddQ9krVw24xM2FFfPqNiK8jvxqJKvmMxp2c2J7awlCS0m3ltKkx
         oEj7gxAPkUegxO7jEKtsRkfe701gywVJQV2F1ruyV5iE8vaG0JIlij73lCzeNqdKWs7C
         MQwLzOfwjaQZD7sRgTHYBj3AJxXIHzXiT2/Wcbd4pDMIOzRyTPy93Qe1xfd6yzqXQ9NN
         5eqA==
X-Gm-Message-State: AOJu0YxU0LM99FnnWUQpJxjWdigFf6f52Aadu8EE+1uXA1LtTxfoCinj
	JUWP6uI3KXMzUHFcXHuJP7Wlx4wbXUdS2lSrc0s=
X-Google-Smtp-Source: AGHT+IEvJ037NWBjNHuB/J3dXCL+QevejM+8BkRY8msJYvRQMbOE6NqQI0DFYwKpc1wJI3ccyKToTBT20pnLHrwYLT8=
X-Received: by 2002:a2e:3e1a:0:b0:2bf:ab17:d48b with SMTP id
 l26-20020a2e3e1a000000b002bfab17d48bmr13309789lja.34.1698851979153; Wed, 01
 Nov 2023 08:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com> <649b2f000761831cabd1f5737fb5b30a2ffc3654.camel@gmail.com>
In-Reply-To: <649b2f000761831cabd1f5737fb5b30a2ffc3654.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Nov 2023 16:19:27 +0100
Message-ID: <CANNYZj_Cq+cncw5SCGii=Mhj0KGgo=qr=hCuo+wpdvtR9C=Qyg@mail.gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
To: adrian.freihofer@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 15:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190041

On Wed, 1 Nov 2023 at 15:18, <adrian.freihofer@gmail.com> wrote:
> We are currently experimenting with replacing the eSDK installer with
> the bitbake build environment for our users. Part of this
> transformation is, of course, the shared sstate-cache, for which this
> discussion seems quite relevant. The workflow we are aiming for is as
> follows:
>
>    1. Setup the layers and build config (out of scope here)
>    2. Download the sstate for a particular recipe (usually an image
>       recipe).

I'm not sure I understand the case for downloading the complete set of
cache objects up front. What's wrong with 'lazy' downloading, e.g.
only when the objects are actually needed in a build?

Even then, does --setscene-only do just that, or am I completely confused?

Alex

