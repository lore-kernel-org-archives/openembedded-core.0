Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58000C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 12:35:33 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.21163.1739968531654385654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 04:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HrU31NEm;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5452e6f2999so5384221e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 04:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968529; x=1740573329; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9YKtmCW6Cac5uBJONu3l/z03ITUvzzIcI+HgKCGru0=;
        b=HrU31NEmz3e1a8HHpGwXb7tI+2A8cCkVvowi+lpo0EPdcZN5ARzZNiIiObwJv9UY42
         NMh0XBDZ0heZzim2FXEtr1GhAUFjmtrbjWE2oq6Am7OZOCDcalCfkOEFknwusXEMKwze
         5FXQJ0z4m2o/Dh1omQ/ts3aRCJuUSjOj+geH62TD7KhYVxSOGz2VpBlX511jtHmbaxL5
         QL22xhIWT7MiuyIDL6u1KShkago9HLXhmCVCZSyvdb6g59z5+p6IhAiQVw9Il1lI9z+q
         tIc/pwSX46+uu6/HcEZ0uJ3opfcB38YtAQP5nkMLedjqMoRWtgApLV8uybOv5Px2P7BU
         IRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968529; x=1740573329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9YKtmCW6Cac5uBJONu3l/z03ITUvzzIcI+HgKCGru0=;
        b=IWcvBIiz6d74LivmTnRYmKPr13xM1zDvIJDy2LPEIc/8CHdbVZzMdczSMQKFTrSvUN
         ThCEulpge2mrcWkzgiFEIVYscYE5MwwbiBJ66bFUSfllTs8kPVU0XnnGp4cK9voy49+B
         pCD4i/B7mHD7UzceuxAZ9C+Q5QNLqBq9y7vE6DU9jikWDs5vc8HgsRrwbOuwBaQAOo/U
         FBbSWb8dlhRzT8+oh2hXYDxL2cSVedjSs5tBfxn//vUkfAYVAWX9EwwuGRkA+afifUWZ
         BuwxyDCkFbqxZj8dv9awagdmLU5rRxhUiJgoRWicBfNCsqg9HduDa/Xa1CkUkmt7wMep
         yb2g==
X-Gm-Message-State: AOJu0YxxlF4cJ+tvBvS4KqNaWEnRiKNzLmeUwwUUOqxDCCqozWfN0kcx
	J7pJu5zxsHxeYLXju1SkOZ4gMxraQcwa2bo0CvGcdR+NKlBXej/jBTW+DS/PXB4RCtSnNj2aFKQ
	JFJpAKMyod1DemvbqlmlEJrVYDQE=
X-Gm-Gg: ASbGncuViXSIMHfZDM76UXcmHEh3MF2sgxzdIwt4T65PFoGNelfqm90uj+QP0dG+imU
	V5t5/PrL9lyjmxsFgf5mABm28D7BXpBHtDiNJiHlFOc5qXmWQNtjAJ+/rLCxfplm74xtQYQ/+gQ
	sRviFGN4l/0batoztSaUFO7KQara4=
X-Google-Smtp-Source: AGHT+IHNPCQV6OTWrqK1jix2oAgr1IgM0ZHtEULTvml39S2pnXK/aE/EWfDfYoGum4EbcjjdhP67ccXxrke0RdjuU7I=
X-Received: by 2002:a05:6512:ba6:b0:545:2550:7d67 with SMTP id
 2adb3069b0e04-5452fe6af3emr6115930e87.36.1739968529158; Wed, 19 Feb 2025
 04:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20250218134336.1976728-1-festevam@gmail.com> <CANNYZj9QEnkPDekf9Nf5Wo2zJsSfT28C9hJkj5_PqB0oDgs9qA@mail.gmail.com>
In-Reply-To: <CANNYZj9QEnkPDekf9Nf5Wo2zJsSfT28C9hJkj5_PqB0oDgs9qA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Feb 2025 09:35:17 -0300
X-Gm-Features: AWEUYZn-jJBbfm-nYl1H33qnqJulhg-k_QtFO2Co6a98VORe5jVb6woRy_vnpkg
Message-ID: <CAOMZO5BSugZdDcPxwbZj_H6ik7bR4P1Vj+QVVa0YxCBkfUbEJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] libexecinfo: Move it to the core
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 12:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211705

Hi Alexander,

On Tue, Feb 18, 2025 at 10:50=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:

> Can you submit these upstream please?

Unfortunately, libexecinfo upstream is inactive.

The https://www.freshports.org/devel/libexecinfo page says: "There is
no maintainer for this port."

