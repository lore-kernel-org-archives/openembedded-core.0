Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A49C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:10:50 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.27216.1709827848469929594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 08:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MbUB4KED;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d220e39907so15661781fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 08:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709827846; x=1710432646; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NPvadT0fWXXtZEtb2nWuoUoDIkiK81rUS9IG066FHy0=;
        b=MbUB4KEDNEwmzaH+tTE+bwA/L03etpRvsnCwkobPr+1DZ6R0uMBOzvcn0e4sOrAeys
         Zh+v7D+6G6JseogqGQbOZLI4QWDNEaPKMr0djlYzy/mPMH97Qq924LhdXiHRpYD9JP+a
         qxMhKkGf26V1R6n2Y9So1FJBphGHbnpEQtULPmKbpQpbzSfoT7GkNo1hv6eyzIy0e9Mf
         f2CXOTlwJ46Zlpc1pRCCGu1uO2k34OhRMaoVp4Au8Y627XSPaYSFnsHieBREvtkC1l5D
         2l02Cbmsn126DTjATVSlvkOzvy8fnbue1OghFDu7UWb9B6+KwrVY8YtnU/60UGcTtYfK
         WgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709827846; x=1710432646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPvadT0fWXXtZEtb2nWuoUoDIkiK81rUS9IG066FHy0=;
        b=TSvV5UyiGHXzEDxt+0UMUdWMZ8rPamR7LNHASZiKB3dClpQvMu7OxFzMr1EUDXEb1e
         r15HkT/87BMJ9vcxtAhmeig7BOvs7aDJnKVyILfYVABsVUTqqSOWCf2mscFfx0ngPaMu
         1jL2YutrVIglb3uA1+jBHcyAU+iDBgcicY/T4eb7V1sS3sLmSfFQB1pf9s9VT4wCyGCn
         xCcS80jVQBvu/3W5OplKLW2xatG66xQBdmhdxG3a1PDYikbWm09aAODMTGw1dw6GLAmB
         U+8xXsMyES38kQU7yUyYYYkm3QvxyRjWpEyS+YBjS8RJqvm9JMHVvhd7DoSC9Af+Xh9K
         Fk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaXzt+CBhrSm2G5lj2uEc8x4SWBTjojuXSFp/KcTUEMd/MzRSDTRsfl9xk498iWpL2B6OykG5b8Sjwi5vSYBtQsqyatG1vT99KGv1bGL91jp2OZ20iBuET
X-Gm-Message-State: AOJu0YzY7vSO3TMrUt12MjS1dp6xvwztbpzJzoRx60nQ/xwbcmNECIL9
	zgtlVbIr9REKzmlvfIHxWCs2WTDIGB9GqfMvl1TGO0D18xqEjAhgg9Sa9GMX9pw1v5IInOSv+3f
	dVInVqstFmwQYZNrIU2aYl8WEKxE=
X-Google-Smtp-Source: AGHT+IF/NxHX2nFufrOVfhWMCEf4ljChb7+42uixAyNTQOW8jnlD0u27tFwXfaw/pcAcmQGFh/IRtS/tVspAIVPALNo=
X-Received: by 2002:a05:6512:3709:b0:513:22d2:ede8 with SMTP id
 z9-20020a056512370900b0051322d2ede8mr1550969lfr.39.1709827845919; Thu, 07 Mar
 2024 08:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20240225093726.1113403-1-martin.jansa@gmail.com>
 <CAMKF1sr1SVSnAZ2_ZCTHfMyM8i01msDQ+81M5h+Bb9zmKGPLCw@mail.gmail.com>
 <17B78F10F29044A4.14830@lists.openembedded.org> <CA+chaQfh47nRBVAjhxpo1xeXWkmw-vHf8Jk-MWX6Npn4GfyGXw@mail.gmail.com>
 <CAMKF1sroBXyZwPqLyehFLD36orrh7fC3Z5A_b98863-5hbRFxQ@mail.gmail.com> <DB5PR02MB10213AB74AFAAB16C842B2E78EF202@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213AB74AFAAB16C842B2E78EF202@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Mar 2024 17:10:34 +0100
Message-ID: <CANNYZj_r9yXTXCLsA+-g5sCowBfXnzK2w-HAs+=hcjp-ybnXEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 16:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196803

On Thu, 7 Mar 2024 at 16:49, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> We have a lot of recipes that use gdbus-codegen and are now facing this
> problem. To solve it, I have added a gdbus-codegen.bbclass that does:
>
> DEPENDS:append = " glib-2.0-native python3-packaging-native"
>
> inherit python3native
>
> This adds the dependencies needed to use gdbus-codegen, and is similar
> in spirit to pkgconfig.bbclass, which adds the dependencies needed to use
> pkg-config.
>
> I can send a patch to add it to either meta or meta-oe if it sounds
> like this is something that would be useful to others.

I wonder if instead of a class, this can be solved by tweaking
RDEPENDS of glib recipe (perhaps with a class-native override), so
that python3-packaging is pulled in through that, and no special
dependencies are needed, other than glib-2.0-native.

Alex

