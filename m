Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ACBC71155
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 06:11:48 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.11945.1750140702459968567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 23:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OaIEJpj1;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6facc3b9559so78059136d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 23:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750140701; x=1750745501; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5G6bmClU1cVn9outmxoxZZeu3Fy9ccWTwp2c8NbH/HE=;
        b=OaIEJpj1sm+a5ou4K4mgtbyBhcjx92fRXvjYbRBTexOnt9aVLYHIys1699Bu7ykXd+
         kKEkuPVen9o9FxQgmbCIODaCmHuPISBY8IiytrvM+Uqtt96jaMIxP3hlNte4+jzQw9kb
         chbRmAZNgaKBKqP99avYNoQQKBxcT/WTGjmR3SV4/5geNeaoLJvaUmQmz2pu9hv8eFTc
         9nooNGmDA3Vp2aonNf5ZnrCupU34LeWsaqiuzuY5I6OTWqeutwUIFoAeyk6oXxzcJxy1
         kR6COtcV4uxJs1Z8BXweNg492ZsxLR0HW3SCexJrbgDy4C72M66INqZHjlJ5OFwj5ZvI
         PE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750140701; x=1750745501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5G6bmClU1cVn9outmxoxZZeu3Fy9ccWTwp2c8NbH/HE=;
        b=p5+8Bf4qR/ZNpf0azKajJTdm3I5ORXCPMEIuwo1J9CCitPrilznbxjrO7/M3u3aStK
         smI9HwK82rL0Jl/cVDPD5oVqtTgNscrzID4MvcnWdaE5fThS8FqE5TqlROLin54u8lPl
         TxnnLnmGHmhTdNjL3wxDWyI0Vf+TxCwZwmPkwe+8zat0vS4IGKJJIeupIRU8NBVAkAiR
         5R2MUz4H+6EG4yaIOu+sZZSmliWi+X6NfY03yPRbkiSBTEzq5SsFZX6SkgO6p3bhdy/K
         PC7dzOvbkoiZ+C62Ls9O6yRaqG94Rs2JhoRNy0v/4vwkE43LB6snJgEhwHXIhJDAYGuk
         3hSA==
X-Gm-Message-State: AOJu0YyHSgxts5OkioS5vBdFRbKE340AkmhXTh8g5nBOP6Ae/mBpyx2M
	ClhtQNHiTEXyFpv5vQ8hClzgfVP+DgeJflrQrSxXDCaFE+QNb7MSy97kge5KCIV6ZKRDPq1Q+Q/
	K6m5cGX6CUwVn3HOcb7J76R1bBlYr6ME=
X-Gm-Gg: ASbGncuSGy1l42qHrivfU6qJfBsa/sec0sZ1wR836CSPitKxShuQs4pskn0OaLJfF1H
	OZlK0q857CqeNWMw2WdiNVQPwVdgVCaMOe3f67oPTVSqkPy0mqndWyy60okslajFe1s3xIYuT+i
	3AbHf6c27sEiVFPssgKaQUoELOC6UH4Bvo66KKj22tTnlICeztEEvUUqdul7FxPkZJmXfYOllxr
	I2LPg==
X-Google-Smtp-Source: AGHT+IFpwnDMnA54YCN9zErOBaR3iKxALsP9/fHS/5Ehfo9OYvObBnoTUDqmmFvoqq5NWbh15PqHzNkACRRlcNVUxjE=
X-Received: by 2002:a05:6214:1249:b0:6fa:c617:23f0 with SMTP id
 6a1803df08f44-6fb477d99abmr203259476d6.27.1750140701333; Mon, 16 Jun 2025
 23:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250617052540.8256-1-victor.kamensky7@gmail.com>
In-Reply-To: <20250617052540.8256-1-victor.kamensky7@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Jun 2025 08:11:29 +0200
X-Gm-Features: AX0GCFsrfctElTUYmD_fIFQLUD6Ag2LUaBGyRDC1BGtXcScdLmoHoxZKiyC6_eI
Message-ID: <CANNYZj9np2KGj20Khpgfa2Z_dnd0qNZKh_Q1Bp-E9HThdnB8ZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemtap: upgrade 5.2 -> 5.3
To: victor.kamensky7@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 06:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218854

On Tue, 17 Jun 2025 at 07:26, Victor Kamensky via
lists.openembedded.org
<victor.kamensky7=gmail.com@lists.openembedded.org> wrote:

> @@ -7,7 +7,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=https;branch=master \

Please add a tag parameter here to enable verification that the commit
hash matches the version tag. There are several examples in oe-core.

Alex

