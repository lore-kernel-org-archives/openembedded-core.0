Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AD4C04FF8
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 19:11:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.2682.1713467470339609016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 12:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Znxxl9q9;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516f2e0edb7so1610451e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713467468; x=1714072268; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWLiHqIGYNUz8exgY+6OJJPdPBLg/RlmFLP727PrjRY=;
        b=Znxxl9q9BMy4WMBo6Md4kKc0DuFEtyremSvAab2jVdz6aZGewMQRPkk0XCjgK7e55V
         bzJDVxrbWwXBwY1hGxJCO2+Pz3NHfxxYktgK3uEE9rpbcM7d3j1QOxsuTMX4c/wimZl/
         itkn+b7jSl3Ua6J7nCkuFelTOaqQlkFfY5p+4ht3MRNDemJTVz7tq8i6yzpiQ4eZo0V/
         wgQ7rl+qZ95cpHIy3xkQSjkHSlbCoIjQEXSIIQkodMy6kcF0Wp8yJhQDrSF8wNKNIVb1
         KIlLbqBX8u1JWAY+y/mRcern1SGLKFJIGk/Z9Irm+83crcn1/OeRQCeGth1q2yMLrbLN
         Gn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713467468; x=1714072268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWLiHqIGYNUz8exgY+6OJJPdPBLg/RlmFLP727PrjRY=;
        b=t3b9+PPIFc8CcPjJyWGNIUQc7jjyTgl/+FgEbn2PbqkFZ+Finj2zr8tg2CfLjgi2fD
         jZTFOiYOZ7G7sx56ZGZ7GKgt1fcTcD7yWO6g7RPX7MArCSbCFVOMPMCaq0H83/qed33L
         Wcpf08+ltNVcOMrz81SJ50WLqbvv4LtUpWV1O850NCqSCL317ZeY8taKJEtlxCUwU7lt
         +FxoLQYKgP9huW4gFW5uoyXXlDj8lmS1QAeXD28CWOpYO8Mb7DO64IgaFycM/h2icWll
         KmkstDN8Od1xoGjeelqgNnUmiNchvDkvzZgvf2ZDe/wRScAcwXBydCw/mVqCtL8lharD
         p4XQ==
X-Gm-Message-State: AOJu0YyzyLzvWHahOIwqWBwHsQRPOaK2s+0NlJw802lPf2PzDJbQ6bk1
	JzoK8oBW345NLqqLItPQdNp2LWZEdVeT4uFKzJJH/oEPQGZOhCEh9vjHvhGQIzzVO5HY+0uCkz8
	NAKjXeFk2HwGr3SUVXkky10p1agw=
X-Google-Smtp-Source: AGHT+IHqCWTprtEoHU6qpJHYjbUPgNSmnwBw5A6DCqvEUvR+7UZpI7I0l6242wJUKc+pJk36YYS2Su3Fq1yZKNDz1+8=
X-Received: by 2002:a05:6512:2303:b0:518:d259:8542 with SMTP id
 o3-20020a056512230300b00518d2598542mr3089419lfu.2.1713467468047; Thu, 18 Apr
 2024 12:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240418155558.3399658-1-jdmason@kudzu.us> <CANNYZj8dwnv61TtHj5F5F1rAthb_ucYgkLMocc101YsTs7QVOQ@mail.gmail.com>
 <CAPoiz9z4h=6r=wX5DqDR5ywDkFf6tKywCcb=e_97ZDmrjE1Zvg@mail.gmail.com>
In-Reply-To: <CAPoiz9z4h=6r=wX5DqDR5ywDkFf6tKywCcb=e_97ZDmrjE1Zvg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Apr 2024 21:10:56 +0200
Message-ID: <CANNYZj8WSp7LcwSSG+k1NGGb_hpeOdjcX+R3k+rL8_uBHYG-7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-c: add UPSTREAM_CHECK
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 19:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198524

On Thu, 18 Apr 2024 at 20:48, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Thu, Apr 18, 2024 at 1:17=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I have a patch for bitbake that solves the general problem of checking
> > latest crate versions from crate:// URIs (and fixes cargo-c check as a
> > result):
> >
> > https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/package-=
version-updates&id=3D6afcb9100b8d99fabcad70afb4f37628a2f62cc6
> >
> > So this patch is unneeded.
> >
> > Alex
>
> Push it already :)
>
> With those changes, I think all of the UNKOWN_BROKEN stuff is out of OE C=
ore.

Of course. I have a whole bunch of things that piled up while
scarthgap was being prepared. I'll rebase and send those tomorrow.

There's also the bitbake-setup prototype which is basically ready, but
needs a patch in oe-core master-next ("scripts/oe-setup-build: write a
build environment initialization one-liner into the build directory").

Alex

