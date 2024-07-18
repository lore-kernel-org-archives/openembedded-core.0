Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D4FC3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 05:07:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.8627.1721279241429493319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 22:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=neizuejm;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb682fb0cdso196703a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 22:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721279241; x=1721884041; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J8urBWZjRVzdyg41CnaiQrE9nUwO9zbLXSe7C49GgK8=;
        b=neizuejmfPj8nLoRENUTMkiRIGf8+qVTRdVYm9U4RQOnpS2EKNCWIG5A9Jul+N61Di
         w5j6XGFE80SkjBSFrN1Zpo/HbqAyqELEYd2MiFrwDRsNe3BqB2awktQ4uVFa05W95LMr
         0F2UicrZiGYo5lkmqBdGkrPML+4H52UuULK/ZwDkWQ7lNJulOWA5870Q/rXFpL4htzvB
         BmWUk7ehMJY6QBDwAMWOBLRc0j7sXWQmXwBbLn5U2LnV3Fc41t2weAnyS1OBjkNVTcwx
         eYepNosjFuhtitfxF16B9jaDGQju5df/mraYSeJDz2JX04rwjqFBOff4lusEC2e6SVRm
         ZjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721279241; x=1721884041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8urBWZjRVzdyg41CnaiQrE9nUwO9zbLXSe7C49GgK8=;
        b=dS/00I/wQU+ZZsC9zZG+eS3HYt3AJEOLC2DAgnxrv6yxoW1noJSfjMNoXTm/2oxvtc
         yTkKcn0ds/zCofeZLbqatGpOdP80PoZswA5zhEgiql7c6WDaATTtQWM1n5Gu5/ounKxD
         b0dGDYGYcInw+F7zn9Q/McaWhScqC/NxPBYl5coEiAb0Qtf9PCCRkaC4vCWZ4A67cNYc
         +1D70Tu+Ao+vIom/gWfXjPtzAhUIMP3lflJ2CGbGoQmzt5aVxtr9icYOgi9QpY7zYkT3
         VHXOhA0Qo4vkv6Jkh3QbbHywDa2dFrEuE4k1B1qBcT53eGukrgcxGp0brOZQGWnlqOrG
         EM0A==
X-Gm-Message-State: AOJu0YzgL6HIcJhNwIcPxUb4tupTYrJB2/vzDu5GfY16rzZW12FO0Nee
	83VhSnTcvKDm6fmqcruUnl5wNwM5j2XUJMSkfXUr7hYplr3o8UpEUUNIBmu9h5D+OvkoHIjCmD5
	PORDcveVDwgolkzCZcfsNnVAan/o=
X-Google-Smtp-Source: AGHT+IGOhciLV+dB1ttMKnrOkM4oCGKbpyJGrHtd/ea9/XvfjKbGvQh1EBZFkW7m2XK9crcJlF0JKKOHfaNvvBVnujY=
X-Received: by 2002:a17:90a:bc84:b0:2c8:da73:af82 with SMTP id
 98e67ed59e1d1-2cb524575femr3131106a91.10.1721279240795; Wed, 17 Jul 2024
 22:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240715102003.10122-1-marta.rybczynska@syslinbit.com> <2024071710130827d9d2e8@mail.local>
In-Reply-To: <2024071710130827d9d2e8@mail.local>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 18 Jul 2024 07:07:09 +0200
Message-ID: <CAApg2=TNmSYrSauGR34qXiLe=RPcxa6RrsEa-_0J_nOc40o6Gg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] cve-check: enrich annotation of CVEs
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="000000000000b4fb76061d7e8dd5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 05:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202186

--000000000000b4fb76061d7e8dd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 12:13=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello Marta,
>
> This seems to break our tests:
>
>
Hello Alexandre,
Thank you, we're on it.

Kind regards,
Marta

--000000000000b4fb76061d7e8dd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 17, 2024 at 12:13=E2=80=
=AFPM Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com=
">alexandre.belloni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello Marta,<br>
<br>
This seems to break our tests:<br>
<br></blockquote><div><br></div><div>Hello Alexandre,</div><div>Thank you, =
we&#39;re on it.</div><div><br></div><div>Kind regards,</div><div>Marta <br=
></div></div></div>

--000000000000b4fb76061d7e8dd5--

