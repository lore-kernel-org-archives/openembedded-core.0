Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A105FD3E2BE
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 19:46:24 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.2076.1730144777383634018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPWzT4I7;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb443746b8so44398171fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 12:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730144775; x=1730749575; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GQwZhwDaDq60MDH4LWmT/z+uTQ1jl0k4inv/AdXAb1w=;
        b=nPWzT4I76iq+BUzM2yPx0DfRYi2YSA7aXyFXb30lBp3jyKZdAByFEdi9QsEAxHa9VZ
         g6u3njpcodqMzAsM/q5C45E+Nh7CSnn9XjrxgP7vDnDvyc0pGBuoXepnbcMJvY3Lo7BZ
         au7Ldue0/j/hD7Xu7fxgYwtX/xV5FpR24gdaqgYblm7u1mCkzWsjAPUU6C0/OuGA5Chg
         wbHdT3os8QpWNls4mC8Nso1Y0dabKYcIEz1Yyf+Ick2hnAq1GNBjfVRIBGoCicuvkxUP
         klzWTYSH0ySSI375sRQh4eOorI0HD/zRd8KyrNYBczVSt/tYJBWhK8ZKmTMCs1b29mhw
         pQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144775; x=1730749575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQwZhwDaDq60MDH4LWmT/z+uTQ1jl0k4inv/AdXAb1w=;
        b=ZB2KG/mJNMMXZ2EYvfYO7lW63hgJE+QeF/0qNIX1QVp5ZGNIJaRf4UWZjIZT1vfqL3
         c7XDiqYyt9HJQzpFGpOGzgr+lqJIm1jAwMVN96d/PV+/rj9aTODnBdpWTVpWrotnGM31
         aw3tdthS+4Li9/yCguy95rxzJUnuDnkLuuWq/X/I0ag2GmxatgYrzKXYkoRnQ85d/JMU
         Ec0iGjYjbUzYsdi/BmWNR2TK6BBdGG5WsjW5T8WhxSFP0aQMy6llD7EohLAXVn1IVgMp
         JOTKxpB9Yg6EACZjbEhaEleJtpRzNlGFVPnQQPZSNWiiTcS6/e+fOrhqE+PmqVP2rvCI
         lzrg==
X-Gm-Message-State: AOJu0Yzv8Dqu2TXYLA67/T1NpxP5jyLzeVK11JK/mBGGqfhBFF7dgcTy
	uil60LPNWYCWNHNJvCE8sK4T9hNU1iyByjjF2giJX55YKxz+4F+zO0Z2W7EdH6JrzZ0eQkOEnO2
	NsyuUd511WkyyOOBcvEzJLdI59aI=
X-Google-Smtp-Source: AGHT+IFZvD88+6i4hzhtjUGUSBfwI3XYs1gtE7qpHXH9Pr4rGqVHdy4GmAkbumCVqRIpM8EMD7OvaOdzqIyhRWR7HDU=
X-Received: by 2002:a2e:80a:0:b0:2fb:5ac6:90f0 with SMTP id
 38308e7fff4ca-2fcbe09ad70mr35261071fa.34.1730144775083; Mon, 28 Oct 2024
 12:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
 <1729834769-4717-14-git-send-email-wangmy@fujitsu.com> <CANNYZj_BGyi_Gz=h_62x2QSU+BWE2Ae-UB_fmbTP6BnVuccscg@mail.gmail.com>
 <TYWPR01MB11861A53BDFF03E210AFB60E6DC492@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861A53BDFF03E210AFB60E6DC492@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Oct 2024 20:46:02 +0100
Message-ID: <CANNYZj80DdEwqRFURP+mAtqtvN8J0_JhQpwqwa6_0aE=iFdrNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 14/22] ptest-runner: upgrade 2.4.5 -> 2.5.1
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 19:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206458

On Sun, 27 Oct 2024 at 04:12, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wrote:
> It was indeed done using devtool upgrade, but the version number of the resulting bb file is 2.5.1.
> Although the version number is recorded as 2.4.5.1 in the bb file, I deleted that line when modifying the content of the bb file.
> When modifying the patch, I forgot that the actual version number was 2.4.5.1, so I made a mistake.

That's fine. But why did you have to modify the file? Did devtool
change something that you had to fix afterwards?

Alex

