Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8116CCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 19:04:48 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.1943.1760641487049201304
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 12:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Av5xtfp/;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-87c1f607e72so9512436d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760641486; x=1761246286; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eOQydj3CKJYJ4omj2KzPKT67hseuV64Y0t0XVbwlg6E=;
        b=Av5xtfp/4dkyGrj+sMs1BS5h70oX0qqHEfwA+szf2JXmJUoIHVmHbJgrpVWey/Xaky
         Z4FRmqASKHKb6TYr//jHajK5/gt4+Pj83S6hZUGWQ6O3vVaRKm4tZ/yZDDo4/bjxcBGZ
         gotC7XJ5wgRE8GF2t9uCI5zMM/po6zg7+8qoLWeBOipBKUzUOyriB2qwJmaQYUuoVskT
         dL6bSXiUqxCiKvSfWcLbq4yHwcGIEfcF6iHI+cTTw0kxfrm6Dq0DAdSvsRDgWeCN6eoH
         SWn+qJG1veqBFWQBSzniPgxu/UseVHUbKHsHj4m49BgwbfqSg3NcWYMZ+1HVhpb1G38a
         iRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760641486; x=1761246286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOQydj3CKJYJ4omj2KzPKT67hseuV64Y0t0XVbwlg6E=;
        b=uOWcH7hBQrsirvUGn2UJzdaO5hYAQb+vfABDaOGbMuqFFgWvNNEma7Ow/ASeKM8q+/
         cu7Y8ljAFDiU9I7HSdCe9JU2TaHkJKGJce163PLLY53khVQpkPVgH4fz8TnKVYtSIzCv
         EH45uMxCse3LfsnCy9SSLHvprtW/E4WFrp6iMq3a7g82xRE1NbZkXaZuydknmK1Lqf+g
         3Y23bk5Qqafj/LeSggA4cKVm0uk3KacDyNhDx2jfpQjHMJA+L1HYq+HpqP6zRqTt4mOP
         iPZCw2dt587nl/F56Fgk/Fx3y4A77HYFcwHzjsvAPx0rBuyZWjNIr+RhvvgpMlrkD3Ii
         r1Og==
X-Gm-Message-State: AOJu0YxRCBGjF5gjo33GaHZ2UBN3jtTAtHIDQFxiRGLkfOyTNpgGsubB
	aeLxTz+zbggGBvSMwyufRXzE8lzVhAqnHutFU9mRqOE3l+ryJZdbciBbNCiTmKtFv/J5wcyyGTD
	reLWzzErkeAP/3gfqnNIIwHaEVVXpC2c=
X-Gm-Gg: ASbGncs5K4/JzIZJsWga8WGP3XuQ4EH8Msv9iKGmBh8TbzD4g+4lrh2BbdL8UgrNLGq
	HPGUb9waw7omA5m3dW8gUzg+rOhDAevba0QW4oqL3rsA8rdBOm41gi/BLQQCaNBPWYBgmeEBDfg
	M5zLHUamkbCwPptWr2aZXF34ayKZnMPjdz5ly/9mQBgAwqonkCQOlEpE+BLlkkGlDkQHecb8aaw
	CaEQ13M1LFe++q+3rXxYpR6eiJPw44qGCLuL3DzI9Y5wUKgdX6PFtMOTlFaes4WKtfJzaYiUIe9
	x4aMwrTt3e92gs4NnWAALqYF2nWSzLM4u6FsYWSLgvdWRVsx/+bp00W+uXhS
X-Google-Smtp-Source: AGHT+IHX/HH6PpdZ8loHBZWKgooMOJ5MR5GMhH0e/cgw65Sl54p2iAHaOY91/7nmc+lMio3XSfR+mKVXSI4oT+yoiS8=
X-Received: by 2002:ad4:5c85:0:b0:72a:87e6:f8d9 with SMTP id
 6a1803df08f44-87c0c7d9cb4mr62082116d6.8.1760641485869; Thu, 16 Oct 2025
 12:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251015081156.11738-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251015081156.11738-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Oct 2025 21:04:34 +0200
X-Gm-Features: AS18NWBzaDRF3XE0VL7HzVE03bBuerQnfySDxVvUOpB0790o7Q2Yw7nx4NAQUjo
Message-ID: <CANNYZj-A_jSagKfHmL=_V5B3K+GzjJo5mYizTWQre2hZ7B52ZA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kea: fix installation umask to 0022 of meson.
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 19:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224979

On Wed, 15 Oct 2025 at 10:12, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> +Upstream-Status: Submitted https://gitlab.isc.org/isc-projects/kea/-/issues/4171

Should this be submitted directly as a pull request? Is there a reason
why it isn't?

Alex

