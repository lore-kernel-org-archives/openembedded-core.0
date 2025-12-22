Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6947E67807
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:24:33 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84675.1766424266406110781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 09:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAqIGRbs;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a367a1dbbso65620866d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766424265; x=1767029065; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UsT1NRy8ZOkg0oW3oPHVAruPMIS1GrKfGVpJP0Mu+yg=;
        b=lAqIGRbsy63pD4+WKxnwC6RPi+P9BMQGREnMfaxNidxBh+R0R24f+TznOHbZp9s/PB
         Jofino5hfZBblkMyDh1vv7l4X2ezLqY+aKygqyP/EjoWb/ypVaXMKlkf5TjU6wh/A10d
         arraeHGivt42pMq4sv+iMYJ5MfLoNSi3DP2sdcfWQe1H845qPoBYaLcRDskdvpsVuTQ3
         r1v1sz3kXnksHdkqnACFGUoLFtSsCTsa9rea0pbp5WeMTJ/u1wVNsTKI87tXmHOtTFvD
         Aija90J3KsKhsDZ0CZO9l3hg2cMLrp8ybYENtasQub26nvP3iLdU65vlXQVi2WKY4Uj8
         gBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766424265; x=1767029065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsT1NRy8ZOkg0oW3oPHVAruPMIS1GrKfGVpJP0Mu+yg=;
        b=XhQaoMzKQ52tPv8MWjIyMEfrzcr6iD5W02eSGG3rMqjt+WI9KY2kxCMrcjuVKKAOHV
         owIdJxEq3YCik6J/NAkE56q/jvwlgHp20GFOwsw4Iun/AgSwIGcEjx7LY+gp7CMxSoSN
         r7AraDmkyZBX2DMNEhyCiiTz2A7LS/CJ8BLFWskn1J2MWw6h1e7kzMMImveksXuVDILx
         0grx8AwLe5kjUSf6ISo6vw1KbKEQZbMsSez+oeuKz1NTm8hqvHXtn+RqraIzBXAOrNuj
         dfYyUMV3YeEl5me7SSIvtRNK3u/gcHnKBXPpLFzNEGunU31ig0y7cKJYuWpbsR5RddAW
         1XpA==
X-Gm-Message-State: AOJu0YxWkZ2/O9eevAEKgcHQSLtfbmNNqEVTQcsaKOwf+azObHeO5zPP
	SjoLvvtbbWGEp/KSlD9xTGTgF2xG9Gbpi3g6OrE0KTX82LEBugQIkMrDasY8uWdyPmEa7Me1nVo
	lTdvBM9DQdcNFjxZLRF9wDMTfouugakA=
X-Gm-Gg: AY/fxX4yvNwtNRzd5E3f6Ntg9x+I2MzE/Kqqb3RJxklWd4zTZG37xEVBj1m7mub6W79
	Q4K3olV6ccAhZzPNNbArFBPdGuSIS4kKHMc6PF45lnpbDPh0XIV81Zg3OwEu/JAXFEP8wBquXGl
	+ZJkF/Y6YV8ySmY2RUb37MiMJ5mftRsS7I8+M0sVQuBxs288CJeBEwGVlvxjBG3TptkQlk+5ALa
	/hXXAgx7YATBRwMDu9kzLAAIKl7FICAUhJ8aaoAJxF3VaKvXuxeKSZqaeBwS8kVVjwAtA==
X-Google-Smtp-Source: AGHT+IEpBp/dyU/fN1FuWVBcpURtDvIgfrTtV3l5eaVZ0Ta9imX6xge0P2ProcacRB6p+kjnbT0tS6j9tAnyV6Oo4O8=
X-Received: by 2002:a05:6214:2f8a:b0:88a:309d:d76f with SMTP id
 6a1803df08f44-88d87be8a68mr175527286d6.56.1766424265198; Mon, 22 Dec 2025
 09:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20251217160533.600164-1-michael.opdenacker@rootcommit.com> <20251217160533.600164-3-michael.opdenacker@rootcommit.com>
In-Reply-To: <20251217160533.600164-3-michael.opdenacker@rootcommit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Dec 2025 18:24:14 +0100
X-Gm-Features: AQt7F2pxL0-eLxd-QUC9fwxkwwh9dbaP8hDD3o89g895Q4BsEfdNL6TL7hPYlFU
Message-ID: <CANNYZj9BS-ztuQd5txArSADdp7T_PZG=UuQTrknv0qNXcspOKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/5] alsa-utils: upgrade 1.2.14 -> 1.2.15
To: michael.opdenacker@rootcommit.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228312

On Wed, 17 Dec 2025 at 17:05, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=rootcommit.com@lists.openembedded.org> wrote:

>  # On build machines with python-docutils (not python3-docutils !!) installed
>  # rst2man (not rst2man.py) is detected and compile fails with
>  # | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.  Stop.
>  # Avoid this by disabling expicitly
> -EXTRA_OECONF = "--disable-rst2man"
> +# EXTRA_OECONF = "--disable-rst2man"

Hello Michael,

is this commented out by mistake? Either you need to explain why
--disable-rst2man is not needed anymore (and remove the comments
above), or not do it.

Alex

