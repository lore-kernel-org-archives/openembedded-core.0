Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1A9C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 10:30:01 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.38478.1707906591981412646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 02:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Unm/sfWn;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51147d0abd1so6171376e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 02:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707906590; x=1708511390; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JkC3CuEu5OoaFL1XmFOVKgkeAIgQi2ZXd0a0q4iulLs=;
        b=Unm/sfWnf0+joF++An22XnkO5LBc/yD58Y3B6v44Jri9BCW9l9U+2acTDhaMppa1k8
         efarYDQETVp6Pi7YK5jyKclU6zYqSJJhKzE6xcpKxdZligfYhocuTYSoAwh8Rg6X2X4m
         067dx93SC347fnGuy2GFQJiQ8RjvairAAZF/MYAMETODYCCny/ktnCSV1NscZ9pnIH6b
         yHHeyh8ISGQ0V7d4ZRSNOwwCw1Z2Q5XdIlaUMhc2ZYnlflzFDKwOs50Vxw6Oqc97zbuU
         iIYHo05m+8vs5Wrx1LclCLgG+aGpofZ0Y8+iLlmjq24MtPP6duq/aurwWyYrtp9hKgvD
         Gr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707906590; x=1708511390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkC3CuEu5OoaFL1XmFOVKgkeAIgQi2ZXd0a0q4iulLs=;
        b=VFbUUOXFvAtebKZNt5cet36VB16fAOGR0MUH2XkfDqphehKUkEyj2VvmpL+5CKbL1D
         P47jg9Bc02W4uVRVcIz9CTKG95reWlC4dPj4fbXJn4980xe+nygff+UoRcXOZXJ6RHFH
         j0uYQ+S2lacXkJ2vLjPVm2ss5sUpPTJxZuzZVYSuXCx2FQ8GbYmB8ztLw+0c47eH61Gi
         FpxmI/oEvMgI7cffwMweeDkUDG1rgr0rCIOLOJv7X79EPNhN6dSxlm56a9DrZ32HcQv9
         ikE+fKCBOIUVymetn/h+V0ELP8Sb/tlQFnQive4VnAfdcIbtIVT9Nn4F5vge4a50P5Rj
         23gQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5i3DEq3ILo6rtMlTBLpTUHe+VE2/DArUhW/3xSxPJp+9TLxQ7i4i1jU9y2epWXUn4iW7XVv2Sv1n2+yakC9oaPRzejZfoeleiwjM9gnZJyGisN3c4us1z
X-Gm-Message-State: AOJu0Yw6xyR/oLWMY+OdjUmxkp7fuy1SvvT34ZdUGSJhZmrwkYDJTe45
	RuOUjVYuqVuPpVHjE3J/4lyXow93I5S4yHanJTt9lSA5VYEPm3T1muhRYBF4SOLPSF8W9dKuzVQ
	xOinqMOqp6y57J0MZ6Gb2h4CaFMU=
X-Google-Smtp-Source: AGHT+IGIozJEw3SPaw6C7ihABLRcslWaN2Pq77NLXMSYqDqEK0d41W7OwnM3nX/wjhLbPu1QxWbEEhOp5DZZN4DgAv0=
X-Received: by 2002:a19:ca5a:0:b0:511:5d0c:4abd with SMTP id
 h26-20020a19ca5a000000b005115d0c4abdmr1437719lfj.38.1707906590014; Wed, 14
 Feb 2024 02:29:50 -0800 (PST)
MIME-Version: 1.0
References: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com> <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
In-Reply-To: <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 11:29:38 +0100
Message-ID: <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
Subject: Re: [OE-core] VS Code plugin and multiple build directories
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Ross Burton <Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>, 
	peter.kjellerstedt@axis.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 10:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195461

I'm with Adrian here. Multiple build folders are the standard,
expected setup in yocto.

Multiconfig was added for the use case of same physical hardware
containing multiple chips that need different build settings, don't
extend it to some kind of monster universal build across the whole
product/distro range please.

Alex

On Wed, 14 Feb 2024 at 11:24, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Hi Enguerrand
> >
> > I may be mistaken, but from what I understand of your use case with
> > multiple build folders, you can do the same thing with multi configs.
>
> How I understand it:
> Lets assume a company sells 2 different products, product-gen-1 and
> product-gen-2. Both are built from the same layer meta data. But the
> builds are configured differently by using two different local.conf
> files in two separate build folders. As an example the gen-1 product
> uses a minimal busybox init based distro and the gen-2 product uses a
> systemd based distro.
> That's probably the most common use case how Yocto/OE is used. It's
> without multiconfig.
>
> Now lets assume that the product-gen-2 has a Cortex-A CPU and a Cortex-
> M co-prozessor. That requires building two firmwares for only one
> product. One for the Cortex-M and one for the Cortex-A. The Cortex-A
> firmware includes the firmware for the co-prozessor. That's were
> multiconfigs are used to work with two different build configs
> (DISTROs, MACHINEs...) to build only one firmware image for the
> product-gen-2. For this example the command bitbake my-cortex-a-
> firmware would also build the Cortex-M firmware as a dependency of the
> Cortex-A firmware.
>
> Conclusion: The plugin should support multiple build folders. A build
> folder might contain a multiconfig build configuration. But
> multiconfigs are a different thing than multiple build folders are.
>
> Adrian
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195460): https://lists.openembedded.org/g/openembedded-core/message/195460
> Mute This Topic: https://lists.openembedded.org/mt/104333624/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

