Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82BACFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 11:00:57 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14327.1763982054489275823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 03:00:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ygh7D+02;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-882390f7952so46448616d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 03:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763982053; x=1764586853; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uCPCdYZXWM/TsaFaf/hG2joNiZurR3fbcYgy9SuPIQk=;
        b=Ygh7D+02GsuEmMoHPB2m4rHwrcrXnt60Ivb8CGe9d5jv1kPk55i1ZOJflKtNdFTfj3
         kyoA9DkCRMvEL6T3TDmd3Zwvbkj4yCYi9iJKaaBi7UindbkmdreUZXsmmDpTj6XdWiUt
         c5cog3MAY52FBNFiAkSFJlkMiR2ZDKoJcWyAZRdhhWCOiKAJ1Txtb8s8QISHYGE7l0yN
         19BwhH47oUYRSuHgxWQJ1cDJZsUty0rgVMZpgel+A2trxorF8C+sdEaLzDewUrGrJFDH
         bXh29snqN8UerD+CdXfwYFMBPicLA/gwwDnw+aHAjDQi6eo1xV67kinUcLaRREBEd1Sc
         urFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982053; x=1764586853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCPCdYZXWM/TsaFaf/hG2joNiZurR3fbcYgy9SuPIQk=;
        b=K3aFNOltWg1LttnOKQXXohpWdbUxacnlQu0k2m2ok6Y2mWvoTT6sChzwj8nk22OXC8
         tzT3uaOekI01ocWL3YbcoOqo7R4EVfb6YviuVKN5or/2RcgSo6BlGCmgEoKdUp3omBf7
         orxLgkEkv5usSIfp5x/KUqfXo85xIBumKlaZLrVWHozcbCGAd/jX+hOnnCkr+VkeAKIx
         nQGDmpNFscE6CpycDwITy5PQ6Hw70oOEkbvOVI/syg0oq+unxOT6RIb9VviT/J/ErX5i
         KM+IRncEJTIiijy81DZymTDsFj+geT9PkaHtX/7H5zD8IiMxqmDKolnK+zzBvePyZXtA
         u6qg==
X-Gm-Message-State: AOJu0YyIjP6+ichoXHDJVDy+RyCSixrDG5u0cxAOWQ4/HkL7Kd4BhI8x
	lWni8DM1dCYg37IXS8zuVXsFFg1nhpKe0Ix1OZra0ARoErJUtnA/4Fu131eF0kT3RvHTWukrvXQ
	vyoeCkPm7/y/6ehyIfBf5XfJoqNDK28Y=
X-Gm-Gg: ASbGncvML66HWoJs94RnNRcETwq3dGNO8vqu/F4N5cHBlyjfpM52uecEUWf/NpqdOsZ
	F4ioS7AlNKSg+zfHn1MmHhTHosFyq/DWf6Yc0ljajggp7Eem/6TqfcfqK89EGO1jYS0Crgfj8py
	r35Ng3ylm7YXM2cWqd0M9dNonZrsU4kkFDNELN3IIK/80bvHwJy25dEX0qLSV7izPu1FhVTlcDo
	XmXcjQy2e+fcasItZnjAgF7kTE9Kv2IYTo8wI4OqyYKGR4mR8k0nGqcKzwxk8Xz93o7Y7pDh7XU
	tl3zGawwrwAU4JPrwpFYy9+2pAVhWQ==
X-Google-Smtp-Source: AGHT+IHxGLZ0al+rgkVzWG41bmlhVZP2o0HzNppHKeWU0qmsZX3n14YiSxOQqiFBEgrurki8DjCreujHD6UAt9txZRs=
X-Received: by 2002:a05:6214:27ca:b0:87c:208b:9556 with SMTP id
 6a1803df08f44-8847c4d53bdmr177180656d6.30.1763982053406; Mon, 24 Nov 2025
 03:00:53 -0800 (PST)
MIME-Version: 1.0
References: <PA1PR06MB92523E3FDDFC687727432ACBABD0A@PA1PR06MB9252.eurprd06.prod.outlook.com>
In-Reply-To: <PA1PR06MB92523E3FDDFC687727432ACBABD0A@PA1PR06MB9252.eurprd06.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Nov 2025 12:00:41 +0100
X-Gm-Features: AWmQ_blvli1Tw7WmzXuCstROMiIXJ-_vIDkEbSH7En_zV9cOtGPHVFplfWQKrVg
Message-ID: <CANNYZj91CUJjTouA+tbLOCVz8Xw-R82mHEor3ZD0YJqp6mcoHA@mail.gmail.com>
Subject: Re: [OE-core] Is there a plan to update OpenSSL to LTS on Yocto LTS release?
To: piotr.l.lewicki@hitachienergy.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Peter Marko <peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 11:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226742

On Mon, 24 Nov 2025 at 11:52, Piotr L Lewicki via
lists.openembedded.org
<piotr.l.lewicki=hitachienergy.com@lists.openembedded.org> wrote:
> I just noticed that there is a problem with OpenSSL version on Scarthgap.
> We still have OpenSSL version 3.2.6 on Scarthgap but Scarthgap is LTS until April 2028, but OpenSSL 3.2 "will be supported until 2025-11-23" which is yesterday.
>
> Proper solution would be to update Scarthgap to OpenSSL "Version 3.5 will be supported until 2030-04-08 (LTS)".
> Is that foreseen? Is that acceptable to update from 3.2.6 to e.g. 3.5.4 (available on master now) for the Yocto LTS branch?
>
> Please let me know what is the plan or if there is one and whether updating to 3.5 would be accepted at all.

This has been discussed before. You need to research the impact and
propose a plan to the TSC. There is a need to be secure, equally there
is a need to avoid introducing potentially breaking changes into LTS
without LTS users' consent. So someone needs to sit down and
investigate the 'potentially breaking' part, and prepare the patches
and build the world (including meta-openembedded) with it. Or you just
add the new openssl into meta-lts-mixins (which is the option I
personally favour).

Alex

