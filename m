Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C96D17123
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 18:07:15 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.2214.1729534027744630166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 11:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SrY6K7J7;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e13375d3so5278026e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 11:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729534026; x=1730138826; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J74tM8Dx6OniBoMFPzaqPLJr22LXZ4JkujQqnp87UVo=;
        b=SrY6K7J7g2ejCSNNZgRpfcbDBoL/kUEVR8Ba0sANQbsBwwy5gKrWAW5vtkFVKn4nzZ
         mnH2T1Pn0MizftmzVhdMxF5nADcgB+luz+JrQFCjKPXc/vRPFL1ks8vmfEm8z2/S700l
         Nj832aVSqhFS+eOD98CT+YgQSlXimJp0ESpprbDODppEC45u94Z1F8HqVowi49fYa1Jp
         INBB264vIYx+lYNUhNu3ZmFEHqq514f37XGBKJEewq5qr0G7sYjQX+eNv6SixP5cZ/Su
         RkdUEnu2SFmIfwlTyydlkT4gv7nbT0Z+GwmwrT51iAHd94wsjpabSNj8iJqLi87NyXeY
         aujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534026; x=1730138826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J74tM8Dx6OniBoMFPzaqPLJr22LXZ4JkujQqnp87UVo=;
        b=hW/gEnojClSOS0OinMQnYaJj6xT9r565Gev7IbqxucBmI/tZTcgSb+lFf5iFBR/CiH
         U+J57bGL2kKfx4oCtEwMHjpBQLuszoLkMWLkhzu+3k3ghI0MDNM+zNyGCUOnOhlIkIcA
         JAst8nl9sXDgllBSwqn0/ZodMDRrQuMJNjc6PiGimDAEmoU4ZwElbFgs6UMSIFFBsduE
         ndDGc/B09h6kKPqmtzOpqdu8a1P/bR/vYgOGQ4DkIh0Shbt+AYXD8KWWdzX5CzY/3/Ug
         BT70pyara2AWmsAJ/C9kXxa82NZf6t3exv4AmDF3mCFsmdf4JqLIEVI4tsVQ8PmcMZi9
         cXKw==
X-Gm-Message-State: AOJu0YwPN1B/ED6QVW8tc3mYLXSWlL4QgVhZceesEhF5+V6btjoLtJsP
	FMX/54v9jNJMLWKj6dW6hD/QIjrJdO0olRlPvWMJHqu94xrG0AQr2eaa4K5LH3dj7/reGZNlRck
	UdG9BDdfQs6VxIKHf/jFQsjrG1wZFgw==
X-Google-Smtp-Source: AGHT+IGU28f1KTuzozJyzlli0tin5ER6E46ohXTYc+pXijd2+P9q4UEqvsTOYygt+h18QHq6/7I5AKBsz6Rh3PIoJW8=
X-Received: by 2002:a05:6512:b1a:b0:539:f2b9:560d with SMTP id
 2adb3069b0e04-53a15512b16mr5387741e87.61.1729534025577; Mon, 21 Oct 2024
 11:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
 <CANNYZj-bdtFmFHnK2ppSMY+iXRDX-J5GwWaQjYMwX_t66SnJoQ@mail.gmail.com>
 <D51N9GUUD7NN.KLL01VZA4V8U@gmail.com> <CANNYZj-TGg4RcBwXyvfN2D0Pq5kKSE5mT5u8wsYHjsK3KPx6YA@mail.gmail.com>
 <CAHs7_BaKc3L-94aZrS1sewfTML13idmgL1c=KsN3KX4w17kvvg@mail.gmail.com>
In-Reply-To: <CAHs7_BaKc3L-94aZrS1sewfTML13idmgL1c=KsN3KX4w17kvvg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 20:06:54 +0200
Message-ID: <CANNYZj93okN5vqZ0VS2w5mqt1sZ50C6r1_Gap0Jh0Sfpg5mLYg@mail.gmail.com>
Subject: Re: [PATCH] classes: rootfs-postcommands: set better sane time to systemd
To: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay+rtone@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 18:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206130

On Mon, 21 Oct 2024 at 20:02, Ga=C3=ABl PORTAY <gael.portay+rtone@gmail.com=
> wrote:

> Also, I wonder what is the best test to symlink the file:
> - testing for the ${IMAGE_ROOTFS}/llib/systemd/systemd
> - testing for systemd in DISTRO_FEATURES,
> - testing for systemd in IMAGE_INSTALL?
>
> https://github.com/systemd/systemd/blob/4d47aa8c0435ad7bcd45aea3a091c2202=
7fc0aa8/src/core/clock-warp.c#L26

Maybe test for nothing and simply always symlink, leaving a comment
just above the line that does it?

Alex

