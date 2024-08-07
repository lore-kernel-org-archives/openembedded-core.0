Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0016FC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 16:44:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.38229.1723049047275836122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 09:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ceL0DV5b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3687fd09251so34691f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723049046; x=1723653846; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b3hQ4x4sAkRdmJNlyzuJvJTE86OCAW/8bisOasam1wY=;
        b=ceL0DV5b2ueCKOOU3N9iI0qfo2uzqLwfa9fYdn4hoiuLJjwZTdYp2FxatuaMPnEEC6
         5MAty2XuKIi/8eohPb8ZuyOnmyCJsj32ApizlTKYRmJVwNEWZFOxlfSaJ6l7MKXFtehL
         +eJF96EMuujh6YdiW4FkxF4Xr30a9r5dCVBuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723049046; x=1723653846;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3hQ4x4sAkRdmJNlyzuJvJTE86OCAW/8bisOasam1wY=;
        b=hwrWqcjKLwAoIUk+GeKebZ94+6cdrVA24+Fqan5BSvfMUs3oNHXT+y/vmnqq/Tn3Wd
         G/QopJQdi7cK3BU2S3895QOdIAi5vhEJn1kB27Sr9PjQgsQVBj2zFNKwY9fAVn2v9xZg
         /bDBsuyepNbrfBNHdX9ZZjcwdYVutL8jkkbx71JBFgI98Yq8NjI2HAHVa8HMxzbexc4Y
         OCf3NAqtK8uE1Sj/fkzvlVX4V6KmP1Jt+0zEOM01BWaVgN82Q+2F62Jt1694Q73J38uN
         HNo9zCf8iCQSKmwMsElkQ+TN/dQPfLZ+cdfydXdG2OIvrjhzRfvluSP0UI7IvFP7C1tp
         bP0Q==
X-Gm-Message-State: AOJu0YxcjVWG/PYu3GtIVKJFKE/i3LAnvCPBtwk2nPhmzYeP2aZZPYd2
	PDrvku6hMogGSKMW60S9kz1S6PrlQAX+tN6z6PCXSLqvQq6lronic+8QJTY6/pA=
X-Google-Smtp-Source: AGHT+IGiprPMPnB1/+RuOBmvwZZW0uSQUb4zr9DbZQyfv88g0WmM7xrtlZbwF0AAgnUwAoCAtqxvJw==
X-Received: by 2002:a5d:67d0:0:b0:368:7a18:908c with SMTP id ffacd0b85a97d-36bbc17c13dmr13918439f8f.51.1723049045587;
        Wed, 07 Aug 2024 09:44:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:db20:52fd:c091:c903? ([2001:8b0:aba:5f3c:db20:52fd:c091:c903])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0cc41sm16497039f8f.14.2024.08.07.09.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 09:44:05 -0700 (PDT)
Message-ID: <ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] buildhistory: fix package output
 folder creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, pedro.silva.ferreira@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 Aug 2024 17:44:04 +0100
In-Reply-To: <2024080715553757b6284c@mail.local>
References: 
	<20240806125955.160835-1-pedro.silva.ferreira@criticaltechworks.com>
	 <2024080715553757b6284c@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 16:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203092

On Wed, 2024-08-07 at 17:55 +0200, Alexandre Belloni via
lists.openembedded.org wrote:
> Hello,
>=20
> Because of DMARC, you really need to add your From: here
>=20
> Also, the patch is still mangled and doesn't apply.

I manually fixed it up when I tested it and I did merge it earlier as
the initial test run was fone.

The patch has since caused breakage unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/6389
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/6441
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/8203
https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/4576

and more. They're all glib-initial breaking as it doesn't have
packages.

I've sent a patch to fix that recipe, I'm not sure how many more
recipes will be affected overall though.

Cheers,

Richard


