Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BC8C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 10:31:13 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.4379.1705055469405507579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 02:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PoHLvLAS;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso6098023e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 02:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705055467; x=1705660267; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3TOszjtAiv0Nebpaxf+HSPwpiNuBWgSoVVZuLop3Dy0=;
        b=PoHLvLASy0CvX2u+/wBrd5SEBvnoHfVT9/Mx5eo2UVJoYKNGaTGClbkKfGmk4ijbuf
         KmZB9Gkg77yyPFBhxfFHAMQSH84n0RbVJT1mXjcn8ETyT6t4g7zRIUduvXBu2/MmPFbT
         Oz3xfIan8VhKZ9YuwRFUbrdCv/TA5HI4Og1bkwSE3mVtoVjstDeJT5leMnjzKQhl6tYj
         az4aK+8yfLdmiEqwfDqqGleu4n9pmSmmMIvsn8wZSo1nlY0vT1cqnnDFAslxK5KYgmsY
         ByuWjSw9vuAn1qZ/gpIFA9txt75LMJgNZzA67T2kHQVlFmFw81zlWAxHrdSTXOv38T1V
         zwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705055467; x=1705660267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TOszjtAiv0Nebpaxf+HSPwpiNuBWgSoVVZuLop3Dy0=;
        b=pca+A+V95ek1gv6dhFfOvEcugI1thdxdO8F0li1PkHgiPpFYda+pAMuCTwgcoFNdeM
         HCdyJ/5W0yuqSmXJuleOhsVQ899qs8LmL1Oengoir7qinZ2wt43leA78XsiZMrN6X81F
         BwZf+MkhMYmI5iGK39F6QHHySj4mmta6YDTFZ7JHMznyX5IrgtCA5HCAhA7zvXg0Hfzu
         Zy2G3Z0NEIloUYNAKqGS/FZE+V3GeZv4VM5HsY2qPNC/Uu0xlFAXC/e88lgrj+F6T96G
         fturST5w17afdmvIlUuWYf5e9CplNkDDZDR2MltkJ63ockweEUvQRAwiMmfxpVAoP3tX
         6aKw==
X-Gm-Message-State: AOJu0YwjArdSB1oUIYPTZ+HAd2JQoUp0CG1jlTkwk0AJVdtiDyTbEuFD
	HOv4lTf9gkkrHbdPcoEBkFBIu/NF5TnOozIR88A=
X-Google-Smtp-Source: AGHT+IHdHtv7tk1hhK12QQxAPH2e9b8B0Xgh0CUSBStQ0x58ceu6rlrbFYA8tqM/Z5fdRqO7ymVUIDFgc8KsegJ/QYg=
X-Received: by 2002:a05:6512:474:b0:50e:73e8:8d05 with SMTP id
 x20-20020a056512047400b0050e73e88d05mr1357336lfd.30.1705055467401; Fri, 12
 Jan 2024 02:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20240109170941.3422308-1-f_l_k@t-online.de> <CANNYZj-tsx5S-PTikmO43sY-0-QEEiLnqs-1QAmTGpPFRfOabw@mail.gmail.com>
 <96e2b562-424b-473a-8610-a2d31f4cc64e@gmail.com> <17A992A29B3722DF.31870@lists.openembedded.org>
In-Reply-To: <17A992A29B3722DF.31870@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Jan 2024 11:30:56 +0100
Message-ID: <CANNYZj--dn9QJfbfKLsOtPphR-Yd0mfX8_d_PA4L8bnS37zudA@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCHv2] webp: switch recipe to cmake buildsystem
To: Markus Volk <mrksvolk@googlemail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 10:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193576

On Fri, 12 Jan 2024 at 11:26, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > Aside from the fact that I can't send suggestions to upstream at google
> > anyway, because I'm not willing to accept their requirement for a google
> > account with a gmail address.

Also: this is not correct. Google account can be created with a
non-google email address (there is that option when creating it), and
if so it's not any different from a github or whatever account.

Alex

