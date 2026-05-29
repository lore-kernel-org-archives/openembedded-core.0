Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2F7CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 18:43:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2123.1780080215829435266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 11:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QfGPThX9;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-512f750d4b2so148531641cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 11:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780080215; cv=none;
        d=google.com; s=arc-20240605;
        b=INzDgdREV/rIUZJ1RULa52wX1DaRKjENfLHjBXrYHJ+BQozBbiy4OtqSPXb/S0BRDv
         WH5qFBf1lp40j6CgpBf8RDBuhQwEzHOE+lKz/wBa6uST3P8ZvV6DO5X89AKwFihKcPPd
         6P4/Lxvg72+3T80r80ylVklJwABwoD5qPU2DLwqCmaSUSrPSJ2JUSqAPlpSDRY/trCz3
         mAW7Rj5ewRMN8M5ZDYVMiDbJ3XAYamRCNlSNzK/DKt/Kx3KYrLLPx1qhalmeQw4zBDmo
         UWEqaeezjqDx0HmhGaI+7T/IXLMTW4pK+i/TjbNO2d9Ox5ntWjwBPoAlOQ9CcBFlQmhR
         DtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DIN7UmS+8ZmQ+flGwxGNchgCpwxSvhyr/uufT6ED5b4=;
        fh=QMl2M2nBdcnfaYY07/2wR1SKbmUx8tCv4sC/cQ8VWk0=;
        b=c9aQ06RjEnijLsRXMU56IURVJLYXNSuCahkue+MCITqGAV4pX42/8NWK5lJvfBlYE1
         89bjGcbQOVQVDSfixjXgphBKtV5LSu9Zx1gFBj/ibguD69ko+9xqa0rRgM0Oz2rh1hrp
         Z+cHqmRernhpjqwYKV3SF/Fx4DrB984AgNp3XQSctPbQRAFRVj4q9y9DDr1Ak+c4B6n2
         dWM9wTodEdynBZVCtIfrv/rDapbN4Fybi+EyDYQA4qIvNhaeRGKbsMEOGgt8D7zfWkKW
         ZKcJtGnfMC1xhIdK9lAbnTvUv/fMIlaYooDp/VokpJbcTzXpmfVz7nwYqxwir8ILYHFD
         qZvA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780080215; x=1780685015; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DIN7UmS+8ZmQ+flGwxGNchgCpwxSvhyr/uufT6ED5b4=;
        b=QfGPThX9Wi/Rn5wfMFLoVMj61seZJYrza4gqVYLIyMkdgWJ1Y2gs4cVkH/cYTM8V91
         /8yotiIV8pAHlOD1k0/q4iGfsWj2LsmPtuSQmNSyWMnP+nhggLzbaE2xNJeW/r2BKJag
         OwM9MrtApng/ABmcRP03ZcsAApwHomUcsHZhmrUoqZnmgx0n4zUfZvPfhJ7U3F3rGqXx
         pBemk43+b4pqr7esSylCfjWCeOv/bV3v//eVxKfqWP3t5Inw5X0WmFg//d7V/VzGIwiI
         /togasn3SHdSHuCOxM2zLsU/CokRWyv5TI778D/IneY5ZEKrPr6DMAFiXllFIaV7kbsr
         hNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080215; x=1780685015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIN7UmS+8ZmQ+flGwxGNchgCpwxSvhyr/uufT6ED5b4=;
        b=GXr+VvzxWkI4LMDVWBDrjawJST0mwG2N3P1v3h0tEeUADONI26vJAwAfJHhIvbgZl6
         SY7qTL75kf3cBBq/BmgfB0ixGk/1C+/LaEWH9iAc9PuHZw6H2V9X7/j6bA0nkWlKheZY
         9nKVpWBlzikYVqtaGqaK9FiuQRsYAVsPp1JWDejW3fMI6z4x1UcvbtM9zWCgM3w7T3g/
         dVH8h3a6nQMF6+OLaqpL9rQ4VFLX4dunomohUeevuafH5aFgPN/7iU3duk5n8oeKQ0Uy
         pTaS6TEprjuBtaRZ/P6TMsS637D30GGsmXrE2uFZLHVS76sjEM6IDwI/xY7BZSv0UluM
         Hmrw==
X-Forwarded-Encrypted: i=1; AFNElJ95lJjap/MeZZ5TYCPVDZiJWtlftiwb5HVU2mnT9Z/28yrcU+HvXEFa4uA3hOXsBSQ+ZVwcj8tDI85AzTLXLkPjBA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyhl0s5XYZNeYL5PexD6Jy+ZXkPyE0eFIb2oxSpFRqk/IjcpnL4
	s3t3jL/P19yQ0B6sDBZVM9RTmg82X0sCo8kglwXZ9dQKK9VTdyraItBkPL6Nm5IhiP119J6nNst
	ukchbq5qQuSpnV8+0Zv4MsvRBpAxlI7c=
X-Gm-Gg: Acq92OFiqpZVeV1DlkZrMZ7m5I4eGlTeYTe5Q1frfD8TEd8+lZxhoxWp0lZ40OEjB/r
	aw7fHN63ltF+wjRQA4Z0NmOmLlvrukWLqtBEaljazQuIion53IiazvxKsv+/oj2oYHPw1sM1dyR
	Oofb9oVMO08iO97cUrVR23GX8qNigj+RhAj0VcE0OgfdXi/7u/fmCRa1f/fDW38L3VL2WrgkdPc
	m1ZHAmhExZBu6f23capLJIcwuDdjrHTch9Aw2KDH21eQ9NA/7eEShug2Ta4i2a/emAJj1S3XqB9
	WhvzMXYJIeK+OUQGgPII+mqurfKo8LbB4bQ03fj06Q46mrY1NsXF
X-Received: by 2002:a05:622a:6181:b0:516:e236:1d3e with SMTP id
 d75a77b69052e-5173a6cdeebmr11874001cf.6.1780080214715; Fri, 29 May 2026
 11:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com> <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
 <f43b9715-1735-4e16-96b7-963daa162c90@windriver.com> <CANNYZj-tR_2rPGBpkX_UymmaqpDpBvMs0dr1xBbn6vyJm5f2zA@mail.gmail.com>
 <2b8473e9-931c-4a4d-92e5-f4c462650a5d@windriver.com>
In-Reply-To: <2b8473e9-931c-4a4d-92e5-f4c462650a5d@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 May 2026 20:43:22 +0200
X-Gm-Features: AVHnY4Kz4QYuPTd5bdeSukTVxZJq5ZsZJaf-VNaO9PpUDgpfuTwiix330BxrEhM
Message-ID: <CANNYZj9Xa=bFNMRbDQ_HY1cC0gyOLjWxWospLtvbO7+1img6yg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan Sun <Quan.Sun@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 18:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237773

On Fri, 29 May 2026 at 20:14, Quan Sun <Quan.Sun@windriver.com> wrote:
> Because I haven't got much info when it failed, and through these email
> exchanges I know more and more about what's happening - you guys know
> more, although AI was used in analyzing some of the behaviors, I'm not
> blind to trust it - sorry that it bothered you. But apparently QEMU 11.0
> changed its GL initialization and now tries Wayland/EGL paths before (or
> instead of) the GLX/X11 path that worked with 10.x. On these CI hosts
> there's no Wayland, so it crashes when it shouldn't be probing Wayland
> at all. We'll investigate why this is the case.

Thanks, this sounds about right.

The option of disabling the failing test (and possibly disabling
qemu's sdl UI frontend by default, in favour of its own built-in vnc
server) is on the table too, I just need to write up the rationale.
It's now Friday evening here, so I'll get to it later :)

Alex

