Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F54CC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:14:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.2046.1646165656734639321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=h5iY1Rm+;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id ay10so4430165wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xF326Oe0IP/40FIlbW9WsRwlwjNhRB8x8iRH8YLc6/4=;
        b=h5iY1Rm+P50QtMvFKCehk1f6WHh3Ran4dxt1lY7Uw4AY1dfRSJeObygYK+qsyP3HWM
         kIlupc2LEG+5xfD8uLvneFyDHYxGEhYJExnL9dU9K3CaRLUocG0k9zLYLyCuiEhmfEyj
         X1xkrs4WrkiwRJ3F2dZPf48X7LOf25Cr9TcNxO2pmP+lT7zMifn1TvJesPKarZrLb96r
         1EL2lsBT7O5NbsEeo10xdf6vidgQWpDu+6iP2BrNAsuvXI8pmrJ+pGp2XPiUpAmlvtTa
         deUi3hEd5Jkelp5zaCm6SKSTtRIw6Vk8gsuN7052WQKafsuJsyAaSqzmFTZZJE5rZ1Zs
         HSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xF326Oe0IP/40FIlbW9WsRwlwjNhRB8x8iRH8YLc6/4=;
        b=5kFKL+IJ4NvWZZX5ZB9gpMwiAWGO5lcBiIz7kC9KC9ZdR+PmnWzLczrCUkzV/92fxt
         oBDVPiISPg4P5P6Q09DVmRsoVPL0HJYAJLfX7DxljlJ/B/zcu+87WNVM56MKjRmOzfIZ
         9e42iErrIXL7B6HO2mIgJUUT6Nw/4WhcYXgFrDEaEvHcBsImJJPssTzTWJg3ZjT3sMnZ
         KWqNW8IRlJsqqeSpzyNGRH21nnc17jpESD/+2qo+7vss7Gmcc+3IEDMv+g4GjYYmVAnZ
         vwUCPzPRdg5CCXaipWqucbh4vlZVoK17iDAOS608UDBjaKsRZ92zh2SU6O/Fk+APJOVx
         7gaw==
X-Gm-Message-State: AOAM5323lXaOgRF9SzN5t4WgJYzgfYC9eaqbBtJMpkOCbMfO/3Fo90g5
	UZDqT1huE2/lhGtX9EBPzSJ/Tvy8bKDH89R/5kz3Yw==
X-Google-Smtp-Source: 
 ABdhPJwp+vOWfTPum+YeARm+9cc/fLCINkLu70aIpiCsMguDNx8tAL4YRr6lqvrLr6RMPdM11TH794NLelNtn+ZU0oo=
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id
 c10-20020adfe74a000000b001f025cb3ad5mr549127wrn.231.1646165655075; Tue, 01
 Mar 2022 12:14:15 -0800 (PST)
MIME-Version: 1.0
References: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
 <CAMKF1spMpkHH4-LpH6Fe=tcg+WM30x3_+0-ZHiDRnvCUqGOquw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spMpkHH4-LpH6Fe=tcg+WM30x3_+0-ZHiDRnvCUqGOquw@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 1 Mar 2022 20:14:04 +0000
Message-ID: 
 <CAAnfSTsU3h9tS=A8+cyJaDP1UQ350oEOHY18BCGRiaSTBwNvkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] pip_install_wheel: improve wheel handling
To: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 20:14:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162572

On Tue, 1 Mar 2022 at 18:48, Khem Raj <raj.khem@gmail.com> wrote:
> where the wheel file is called
> pytest_runner-5.3.1-py3-none-any.whl

I'm thinking we should tell pip to install the wheels to a directory
we control and then just install *.whl.

IIRC the option was --dist-dir, and we can [cleandirs] that to ensure
it's clean on builds.

Ross

