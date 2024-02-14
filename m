Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D49C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 11:33:41 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.39651.1707910412548475407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 03:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WVRZnu4m;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-511531f03f6so6333643e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 03:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707910411; x=1708515211; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rdt4ZzFoTIKFOfnH5LMGGNRxcPJ5V5hCOSl7SX+66IY=;
        b=WVRZnu4mYxReRL4zT0WePUianajOAa6gQoEBYiRgmBjl4nHKGkgNUjRjCvwHMi5k6G
         gvRBDFLHoN/CJCFrHXAKMofB6PxiyYk4nxofuwsuvhmxcKhUc+kl3LsQxvngOGuyV5j8
         PnC7YLU/61GpsULRbzI4Eyo+G2p/qcVhyk4nnXo3T9B84zkmyBZkvIePZTfRLeuQEkB6
         KXeuKrk3JeCeuHOl4lW2VWEzsFrgQ8ozgG4asCjuJMMOqiPE2vD/AQtAsb9eftz3NKQv
         vGxwUxyy664nSrVK/fRbSDnTJi3sOEG73DDz5x1y4sZzDlzB/76XrJ1fYHn0ERhpGxeK
         7xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910411; x=1708515211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdt4ZzFoTIKFOfnH5LMGGNRxcPJ5V5hCOSl7SX+66IY=;
        b=XxZsbSoYj019nUnTpbwNE5AD3vXPk6eXL7XSB1KSIZHSy0TjjPYNN/A99Lfo8HDOI6
         ISD949vMoTB7gNRFCXb7H/tBp+hmBLTuCOu0lAZ6WjkBvVC3LI5/KUGDMm6ka/E89lf2
         cDF6kC2WPA+ko7tEG9qeiNUO3oveKCQ/KKAacJswPpdBGlzsGyYXKg4Ib/tE9a3XQkRQ
         JZVVTcQmNtO4C3gPFhWtjw+mE+WjsH0fYmMPOEw/8ti487DOV+q9QFC7MV7TGoBYC9ph
         /uZ4UWl50YGzUkbAhV85Nsj9AvWQel7K508fKrzLf9Zwivf3rnAiUx3lhkoqfRpowdDA
         Mtvg==
X-Gm-Message-State: AOJu0Yyq/4IzRJACLCKOLFyETW6Zgx7/7vqOeLHmx9iqXTRcP2qN/gBj
	lDTCi5ddSfsjo7klCryAylkoc4z8KKmxgzyGXn/njcQE+3NTVRvTyv5VyhF197APiPQmPKZzovF
	isPiVzZMY+ojjZUCl09It5UpTCrY=
X-Google-Smtp-Source: AGHT+IEJ2G3GjvAXtBoW/hZ8SdKz2fkKw0lILxr8NjiJ7x9SHX3CGXhlQGU4KPJoGYdq6wvIqaBVbCegOmS+OK/YVmE=
X-Received: by 2002:a05:6512:605:b0:511:9e5a:922d with SMTP id
 b5-20020a056512060500b005119e5a922dmr1568040lfe.14.1707910410615; Wed, 14 Feb
 2024 03:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20240213221846.109260-1-adrian.freihofer@siemens.com>
 <20240213221846.109260-4-adrian.freihofer@siemens.com> <CANNYZj_=BJdma_-NuhAoBEzD+To0XR9LqrrGedGT+ogP-CAXcw@mail.gmail.com>
 <91f17540acafafe3a16ea187e2f57e04936dfb34.camel@gmail.com>
In-Reply-To: <91f17540acafafe3a16ea187e2f57e04936dfb34.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 12:33:19 +0100
Message-ID: <CANNYZj9gZqbzcBw8n659FQ=dk8q2SLFgGBUDMYavoTNegqPqHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/4] oe-init-build-env: generate .vscode from template
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 11:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195470

On Wed, 14 Feb 2024 at 11:37, <adrian.freihofer@gmail.com> wrote:
> > > +    "bitbake.pathToBuildFolder": "##BUILDDIR##",

> Ideally there would be a generic template (as the one here) which is
> used by default for all build configurations.
>
> But the .vscode configuration can also be much more specific. The best
> would be to do something in the middle from what my patches do and what
> you suggest: Take the .vscode templates from a user specific folder if
> there is one, otherwise take the default one which is found in poky.
> Currently this is possible with sym-links on the user side but I agree
> that this could be better (without sym-links).
>
> I will send a v3 which will improve that.

In the other thread the following format for multiple build dirs was proposed:

 "bitbake.environments": [
         {
             "name": "product1",
             "pathToBuildFolder": "${workspaceFolder}/build_product1",
             "sshTarget": "root@192.168.7.2",
         },
         {
             "name": "product2",
             "pathToBuildFolder": "${workspaceFolder}/build_product2",
             "bitbake.shellEnv": {
                 "BB_ENV_PASSTHROUGH": "MACHINE",
                 "MACHINE": "product2"
             },
             "sshTarget": "root@192.168.7.3",
         }

With that in mind, I think it's not longer possible to copy a template
file with macro replacement, and something more sophisticated is
needed that would adjust bitbake.environments in a file that may
already exist?

Alex

