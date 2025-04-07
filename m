Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56C2C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 11:22:50 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.44189.1744024963363356552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 04:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZC1gWerW;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c56a3def84so404029085a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 04:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744024962; x=1744629762; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DnRfcfx5CKFwRnl7aKJGf5Kcmr1FfhgAY/q5/6ZyTqE=;
        b=ZC1gWerWMuKn3bB4WSm1TpobP2k930N5AFfMLfUUZmMPcICMv7VR8N3dg0wD/whkfe
         3TGW6TE4j64/WpHDHgOGfAMYBPG9fVBXMpKT3WsuGSjderyKV1LG7qplUeTq6Ghdz0Xr
         fSsKulSvD5WLneiF9JnjuNLOB4qkF3o3xaJe3kgOMFRUYqN5R6rul4S1951QIFZTJJmg
         GCnZ7t8OC/UVEhPqdG3cq2xzP5agmx8gcEyEYkxP/Khw/xqq9kNiSYcmpLWNrao5Gw7P
         09SkJFH5B3F3i5j8PH4iC0SEEaXvxQwdzLdmRlxFkMdh6rmoIMHRSftkaocD4Hlx8uAd
         dqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024962; x=1744629762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnRfcfx5CKFwRnl7aKJGf5Kcmr1FfhgAY/q5/6ZyTqE=;
        b=SaqGAptV2JgjBFJ71u8E9jqPc+Se3uQRyb+6d09YzPODd4CV9dExkqAt6nGspjhA9W
         kl+R7wO79DPfUGmVAmmK4iMDAPXMweS5CxAo9JCwy0aaDaOXw/cPEOo40pFm2Io32wrE
         8R1nPOCN36mghy3gSnftzDj9632fYh0ihRUWRpWGFZ+Q6J2/GZdLOSy33CByk90/e/qv
         yK3ejbGfml3fbKt1NACCgR1fwkvnYoSFzAeDfH8cxZWJNek4/zkjo/Vzl2ABgdxU3tGC
         rPw75ZtwPxOnyco1yQx2X4OfORtRdlnVaGiJEPkaV3aqvDQbZwVSBgT9WQF4aW11ir3Y
         r2Pg==
X-Gm-Message-State: AOJu0YyK5k5dsDqkPQVHZS4yEji8Zcfiikz5nO8C+JWvE7/1F4k/YhJy
	gIfnDbhU4tn6ae6RD9eK6GjgOd8aQvkWmLcLfY4i6P6d5Flawq3NgbIregRCwp79BXIZxpXZ3eO
	Dc5pMdeJMyYH8Hw+niHKKgIWIFlg=
X-Gm-Gg: ASbGnct89aUMluiq/gORMKqxKmGiDoqZ9QKA54hnsw/IfFhq/fgL0C8GYqw2/LjYCMq
	5A95S4sAcPyQzI7ATEevlwd7sErN66aXwW8gS8TsTpnwhp+HaHO2xw+ZN1h/Zn8NTuo+D8JQokV
	MbgVZf2aziES1h3j4XMPoWuS7Fwsr8lOqGh2gU9+i2ly4usuKFnMVllK7XO6eNuo90bfM470k=
X-Google-Smtp-Source: AGHT+IE4ZYBq0q3oC2ypZoRBsmeBhfQV+cFihQckbH2QvB8D9euYBRZ46D5rMvcAnGhbs5/6tjXHlMDKw7GGlwyxOJA=
X-Received: by 2002:a05:6214:cc4:b0:6e4:f090:3634 with SMTP id
 6a1803df08f44-6f0b74f6875mr138382326d6.33.1744024962389; Mon, 07 Apr 2025
 04:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com> <20250407-mesa-25-v6-7-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-7-29bf4cae8d28@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Apr 2025 13:22:31 +0200
X-Gm-Features: ATxdqUHoxUi5evHHl9HZQooTPsGQKySeM5yFf2hgL20vdA1CUO9qnto3Ixf7sQY
Message-ID: <CANNYZj-wiJA=7DE=S8R5FF+APWNRxCn0WtP2hoaWOkAuwHu8Qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 07/13] llvm: forcibly disable __isoc23_strtol usage
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 11:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214452

On Mon, 7 Apr 2025 at 11:48, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
>
> In the multiconfig builds the llvm-native build can get reused from the
> sstate cache with uninative being bypassed. This can result in the
> undefined __isoc23_strtol symbols (which are supported by the uninative,
> but not by the host library).

I don't understand. How and where is uninative being bypassed?

Alex

