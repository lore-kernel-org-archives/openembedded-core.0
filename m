Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFA4C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 05:21:09 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.4351.1646198466734746056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 21:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=piXV9lpP;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id a1so666477qta.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 21:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KtRoxeqIlxwpWSqr7KONsYy4lZNE5+/k+q2b1XU+qkA=;
        b=piXV9lpPWFmBlyj8PQOOrVkrAb98+YfKBAxHRKxfeqsp2RmmBNKtoq5wcR+RrOP6cT
         6wQQWujH2ORcFJl8OyBOcIPk9tFA5YONxDYbQOcAXWgvS3GUOX6+rz6+Nny5ti6Oqykd
         iMrJbirbVf2XkGZMmYy1nz8rgE++HehfrXCZ2DYsETIAk9dLtcW7fovw3jhJbYvQPxd+
         +A9i2rSmrM7e9oOg9P7WEBigoPBEWpBZZ7HM+WdShq6MZMuOs3MF1eAwDchZ7a4ERII+
         A05oNudtdCLf8ybm4evP5lFK8cIkxWwPycPqx7GbAQ7WcZjTzIVFeOIZEwFx41e02Uzf
         LJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KtRoxeqIlxwpWSqr7KONsYy4lZNE5+/k+q2b1XU+qkA=;
        b=l+kljciBUgL5lW59RZpwm+YJvg3lmvRal1k/lloPqFkGJiTLJElWKBPOGDDtlmLHNH
         MpphtDNiFAWlNkCegYImCDfakAESTa7TJNm3kTBAhYCnxyRp0EcMNyzKoSe/fyIgH/Hc
         sMBbfPGgc0RezW9ZSlFgz25wEkT0LGT3BmDT1MSuiBxwZ723T1QUY3NsZfEtqZ2/Rr12
         jbVTNrf4e+Q2MAkPswiiPnuE7TzHTv8V0vE4bW0ERsnY6AOLKrFsIiQMmZRxg7NFcbPr
         SH8dgqNVWK9V6h/76eFIOYABaHkJDGQH79tbBpY7o7cWsl/K4FSxigz2/8/WhhZ6FkJa
         Ibrw==
X-Gm-Message-State: AOAM533l59CIphOeDZjIVIBFgUiovFVBq05TImy7IVqJR9o6ooDNAGVp
	D7YshvxiddHwWgFfUlVnsfPRcAlHW6+ZsmZjh78=
X-Google-Smtp-Source: 
 ABdhPJz3XPgFyYn9xaF/0T2FVy3tWXwspSJUvU4Lc3x0ORU0ZB3Ic54Wpv7gJZTKlKRi0mO0n4EDWeZTDoNRepbIar0=
X-Received: by 2002:ac8:5a86:0:b0:2de:29af:5658 with SMTP id
 c6-20020ac85a86000000b002de29af5658mr22555973qtc.54.1646198465271; Tue, 01
 Mar 2022 21:21:05 -0800 (PST)
MIME-Version: 1.0
References: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
 <CAMKF1spMpkHH4-LpH6Fe=tcg+WM30x3_+0-ZHiDRnvCUqGOquw@mail.gmail.com>
 <CAAnfSTsU3h9tS=A8+cyJaDP1UQ350oEOHY18BCGRiaSTBwNvkQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTsU3h9tS=A8+cyJaDP1UQ350oEOHY18BCGRiaSTBwNvkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2022 21:20:39 -0800
Message-ID: 
 <CAMKF1spreuzybUvdA-2o_J6Q4pFoFdSQMrc3LN89DWOs0BW7zA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] pip_install_wheel: improve wheel handling
To: Ross Burton <ross@burtonini.com>
Cc: Tim Orling <ticotimo@gmail.com>, Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 05:21:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162589

this is causing 100+ packages to fail see

https://errors.yoctoproject.org/Errors/Build/142116/

I suggest to include meta-python for wider testing of such changes.

On Tue, Mar 1, 2022 at 12:14 PM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 1 Mar 2022 at 18:48, Khem Raj <raj.khem@gmail.com> wrote:
> > where the wheel file is called
> > pytest_runner-5.3.1-py3-none-any.whl
>
> I'm thinking we should tell pip to install the wheels to a directory
> we control and then just install *.whl.
>
> IIRC the option was --dist-dir, and we can [cleandirs] that to ensure
> it's clean on builds.
>
> Ross

