Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A09CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 12:00:35 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7909.1762344033854958730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 04:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XGdNYzCR;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-87c13813464so95942746d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 04:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762344033; x=1762948833; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rlAblCwwo0HAMyB0ICu2pnwQQiUF6THNeJucgig/aw=;
        b=XGdNYzCR/OfNkkOSDMfAlsEGLPwA7lPf7WACfVl8tx7xYjk05+1GoG1PdmK3Beg8Sy
         xmkmlWRy7E8WEQul2VLCTSegJHCXzO+xrCDOcHES2oR62Fk7D4qb60KkwjasC5Dmswjp
         g96uwIKCSfGefCF6NDCfGfCAYAKEDXz2SoZSPMieeGUPE/l5ZPDWYtj7tJJhFU1rhicy
         +tznmmCR1xefLLknRGNL/HPcq6WddzOE9ZiTLKoCIOPRNIQvJaKAyr/m6BSUueAUah8Y
         Yqfu6JyTB6d83ua82/I6ahy2KO4UQ+VQnbQ332qHpM/krT0rUOphUdUfAGbpPs9bFkqp
         NuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762344033; x=1762948833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rlAblCwwo0HAMyB0ICu2pnwQQiUF6THNeJucgig/aw=;
        b=lZOzvzKAy34v0loznWt3TTIvhUOFn7/SQS3idJQgMa7suVxCxWglK4gQhSdcDPS7Xj
         ERKd7x9R9ZnrIOThuL5r4K9MNimeX35ewEbGXKBYQ0934WSjaNf6S5k+OKqrLyNN9iAH
         4dOiXI6rFbG2A8kJbYIu4rQYrNIrpA+YIpj6R4HxyWWXTQpK32YR03W9S2uXl+T+lndJ
         y/jEjW4AalOIwpHewkCuEGwQiqtnxAcdNaR0awGfeq+Ptk1GHnGqY4JtkKECHjv+VCh6
         2O4A4/QSwEDGuOV6BrC3xya32yMJRdmS5PMhQp+jGD4kNhfGy0+HvVECvHHuNS/pgPrb
         SicQ==
X-Gm-Message-State: AOJu0YxJKgqF9CQ54v3NnBdUAoD+ddaH64BqQb2G9O++398toKozBk6Y
	UyaXywhW096Nd61DShH5hCzEXaC/KXL59+T0u5i2EfR3iilfPqiThJ6lHY5J34Zo+oiz++tDaXo
	ZvcPQShl+uozRyOuTnEkTOtPVBS1CudM=
X-Gm-Gg: ASbGncvvD3BA85tZ/HrJ55oHC4Ss5w9QjIoiZ5SzyN5n7ou6HXf4bfaUKfqmmR3hfCK
	yB/nk0BTXjgg5UPzbRcQs2pEvxUR326zXmp4hBPrTBalT4JZTQpYXcO9EA6bTDDToG7aiGEvMoO
	jmhxYD3e9uEwcDmOBQfanFSfegYs+lRchXc7cLUqGnI9rMt9Tu2jLoyT/hG1DUz9WJwnHPEqovO
	SyS9jKzo1Gl8QSf6JUlJUGQ0g2w3Zu130t8oSe00x9gGnCrN/tVrD6sRQ==
X-Google-Smtp-Source: AGHT+IEHaR5ym7JXOQlAcCjuUj/yyTn3e+9DXWQHq2gvTV71J7UnZqU82LI6PScZQpaJLha3O1hUd2LNcf3sX9ffEvA=
X-Received: by 2002:a05:6214:268d:b0:880:298b:3a6d with SMTP id
 6a1803df08f44-8807115b92bmr41361836d6.35.1762344032072; Wed, 05 Nov 2025
 04:00:32 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb_WSR5bx17YakRTQCmgJk3v=dDEtpJM1m_C3NrtN6bwCg@mail.gmail.com>
In-Reply-To: <CAK5yBb_WSR5bx17YakRTQCmgJk3v=dDEtpJM1m_C3NrtN6bwCg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Nov 2025 13:00:20 +0100
X-Gm-Features: AWmQ_blAIuCX1c31AtgXZHk7AlfDN9dc1gw5KreGup_lwPOk0vt2GxDezIWWFBY
Message-ID: <CANNYZj-nXjV016A3bgALfe-OHqsoQDtFuci9hpw8GDLjNSiNMA@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 4 November 2025 (WW44)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 12:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225753

On Tue, 4 Nov 2025 at 16:48, Stephen Jolley via lists.openembedded.org
<sjolley.yp.pm=3Dgmail.com@lists.openembedded.org> wrote:
> We are now past the feature freeze for YP 5.3. To be accepted, patches th=
at have a high bar until after we branch master from whinlatter.  Known iss=
ues:
>
> check-layer tests are now running under nodistro instead of poky, so some=
 layers are failing as they assume some DISTRO_FEATURES are enabled.
>
> Toaster is broken with bitbake-setup (#16012). Help moving to supporting =
non-poky layouts would be good if anyone is using Toaster.
>
> The patch/cve metrics jobs need reviewing to be sure they=E2=80=99re corr=
ect with bitbake-setup (#16013)
>
> The build performance jobs don=E2=80=99t know that poky and oe-core are t=
he same so the charts are currently wrong (#16014)

AUH broke as well. I'm testing a fix:

https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?h=3Dcontrib/a=
kanavin/fix-auh-bbsetup
https://autobuilder.yoctoproject.org/valkyrie/#/builders/38/builds/31

Alex

