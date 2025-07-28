Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E288C83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 09:05:06 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.77412.1753693500403444429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 02:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lECSo1AZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70739d1f07bso20617796d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 02:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753693499; x=1754298299; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=twTN63rQti07TufVHdhB7DdZ6W4XuMWrV1ZY0Xn0w+M=;
        b=lECSo1AZ1LZTfhvVzr6KIOk1W3Bo/40j6bGZtM86Ogel0vcnDlh6zcdGPe3318/Svk
         2+u+UsISngQX6va9t8UtHF5VzCTeVhDkpcWo5X3wwKb/mMy9ODt0dX8wNMG3M6CcMOzj
         itdoX0jntWcE64V7I2OS45I3npvdTWppdVuvtjYXxMweKM2oGi3HKX4U52q+eCoK2crx
         gxgu6g3ZwQDLna3qX3egtazmnuxQg3igiMqiIAN3sOFuPpiHdPU1gJ1p4SKo/ryNmsMw
         TVyRpRqEPyi1wJjqR0UjZBTMpdpHVoOdyFY0DlvK2NWVaHXP7I74KXXTHCBBWEyI1hvi
         mtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753693499; x=1754298299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twTN63rQti07TufVHdhB7DdZ6W4XuMWrV1ZY0Xn0w+M=;
        b=LLYBpzCJVf6zN+tfccQrXrlwcyd6/LMc79nDkU448EZL8kHRzm7MO/7NhiqS/9r7d3
         sTEnwEjJCr+pMf+o3IrsEYAzlhsLfuVCr6dyS4GZ+c5j9SOg3TTSpEJQ3Y79Ej2wQjIT
         etYGWY0+Q//4HVFlxwrEh+8uSrpgbMEhsStjc3xjx0OK5d98Gm7jTl7EPxKbXLBr0v6p
         5LOLr4Va13Wbf0WhbvcjuKb899sz/tP0xtqgR3PStKbUE5frQ0IT4KTzsGTdVhmhMKwx
         NvSh9mbcoHOjHXRa9ZN11U1JJsh9Xt3fEqpJxw2CpvI+MtVwZYS0nl3IxOv+vaKa2CvY
         mCKg==
X-Forwarded-Encrypted: i=1; AJvYcCUpMr2RVSlIvkX1WgV3vMV7qiBz1L/SQtBFOf2bd2g57NweEpNQQNW/KDILBpIhcKRMqqJ5ZDBGq5rx7U7xGBVxDQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzW8O46vG6SyKw1lYsyOm0J726Tjgz9Qp4BhWDqHTi4ubIeacM1
	SaHNz7C4EbOnXAONfkfuAj4sGAgc/ExeQJQKN47RomAm9xpVzQBXNVREweFcUgxdZONNi/bObO5
	W90mwOskJnzAyv4s9KL/LaADiLKBKMFnj8LyW2/A=
X-Gm-Gg: ASbGncvvEaZQReCZnagZVvkUc0tdHEa7bo0w7oUHtoRpPX5pZFq3VWW505Iwlwe749y
	JF3in70czokxmIDzlly4lbjOX8ljV3AMJxuwhF7yMBIYKZIBzKID+CObeCG5LafozkaAgML6d/n
	Aoq3GR6gXx+OTd2yIo1fj/t9nLqLQVr1um9T4VCiIZTnvfl+ea02v1VkqnIFqw6K7BsrRQlJD1i
	uZJIm7CV3/lRTOfpaoU5k5I3KdFltx39j1blD7YIw==
X-Google-Smtp-Source: AGHT+IFm4tgNKBDH5Z+L7/J1XNUUDEcjGnPmgVUSbGUCK1yAJeEIB4nlrD68d177fEqKoEvrO+JdcO30Qdlp/QmNLDE=
X-Received: by 2002:a05:6214:f27:b0:700:bc3e:4499 with SMTP id
 6a1803df08f44-707204a233bmr153185036d6.10.1753693499294; Mon, 28 Jul 2025
 02:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250728032045.2783514-1-raj.khem@gmail.com> <20250728032045.2783514-3-raj.khem@gmail.com>
 <efc50221-0504-48ab-abf9-0a76e5f076e1@gmail.com>
In-Reply-To: <efc50221-0504-48ab-abf9-0a76e5f076e1@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Jul 2025 11:04:47 +0200
X-Gm-Features: Ac12FXxY0FoqB5p9-j1SXO7fkZMgwpOxwCtV3VoNCVzpdMWuz5pJ3yxYJ1pBs1Y
Message-ID: <CANNYZj_aVTnQ6bK-0pf_=M-G6mn-JWQGSqnOjwzowcJA5JYP4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] spirv-headers,spirv-tools: Update to tip of trunk
To: skandigraun@gmail.com
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 09:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220994

Also, I'd prefer a backport of the needed fixes, as this would
mis-match with other vulkan items, potentially breaking them.

Alex

On Mon, 28 Jul 2025 at 08:58, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
>
> On 7/28/25 05:20, Khem Raj via lists.openembedded.org wrote:
> > This is needed for compiling SPIRV llvm-translator from llvm 21.1.0 rc1
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb | 3 ++-
> >  meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb   | 3 ++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > index 1da2e74f93b..b1cec77080a 100644
> > --- a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > +++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > @@ -4,7 +4,8 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
> >
> > -SRCREV = "2a611a970fdbc41ac2e3e328802aed9985352dca"
> > +PV .= "+git"
> > +SRCREV = "de1807b7cfa8e722979d5ab7b7445b258dbc1836"
> >  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
> >  PE = "1"
> >  # These recipes need to be updated in lockstep with each other:
> > diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > index 319b25b7f43..f66b25c60db 100644
> > --- a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > +++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > @@ -7,7 +7,8 @@ SECTION = "graphics"
> >  LICENSE  = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >
> > -SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
> > +Pv .= "+git"
>
> There is a typo in PV
>
> > +SRCREV = "a983ab19d6f91a07a8272767427b6c5208576d08"
> >  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
> >             "
> >  PE = "1"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220992): https://lists.openembedded.org/g/openembedded-core/message/220992
> Mute This Topic: https://lists.openembedded.org/mt/114408566/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

