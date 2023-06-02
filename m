Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16E4C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:43:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.13431.1685713409224118679
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ajo8qOcT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f601c57d8dso16241695e9.0
        for <Openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685713407; x=1688305407;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VbXl8+ZwsaqPl65CjKAP5+tpjnNcmeYtAzqZVL0P/g8=;
        b=ajo8qOcT29vT0HJ4z950T8b/M2OOD3rRlWglnn+bBLfevnVE4fJxfNMhgO/+3S0gN9
         ewjNadAgli10mLIxsiusMoD754PaL9X4tZXR3fl3s/VCzHzyy3anRjin4TeRr97e9G8+
         YR0B91Av5i3touYWicW9ZatPVJHg9oH/nOMN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685713407; x=1688305407;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbXl8+ZwsaqPl65CjKAP5+tpjnNcmeYtAzqZVL0P/g8=;
        b=bYPPBInz051VfHmiSWGDOYIs2nboq/Hm6QZQRLi4uvKtrmUc12gFRa2n1Q6Hjk3ZzB
         9YtdLYk/wiYiuFb1FVIaX/KZWtgbOAisR7OJ69REmHSQfUOyzgctD+o8vf/0iyYLaeA1
         RBMCrhFvurNX7q6JzPvn1Oy+AdXdVg/GgDg1fIzmQj39bL1QAOuGq3aP1kvuGAIGZAb0
         9bfYhz1GzrfbFTTfyZ1JaVnmYmE8X+jRSj/U127aBalCJSDPMWeFVrMgYaLu5bzT0zIn
         N5cNiuxpicDFnNb/kw9eBP7oLcm+P6FMkpV6tgj/2pYAdD1/6ZxqHilR3uoi3WldYmLH
         AzWw==
X-Gm-Message-State: AC+VfDxmIpGmgXu0ad277TwZpgJ/EgetmHUtOar+egbWMNB/t15sOAbZ
	JosxIZDN3+6hvUgvms1HNhduYJGbX2JTR6yN2vQ=
X-Google-Smtp-Source: ACHHUZ6HSshs5sWNMHM5m2wAWM8PCK7JONnUkv6NMAg8V4utSWwWksrX+743b/H2ThBArd3mt9fLyA==
X-Received: by 2002:a05:600c:cc4:b0:3f4:ed2a:4347 with SMTP id fk4-20020a05600c0cc400b003f4ed2a4347mr2092699wmb.16.1685713407680;
        Fri, 02 Jun 2023 06:43:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:527f:ecab:4831:c523? ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id a7-20020adffb87000000b002ca864b807csm1778932wrr.0.2023.06.02.06.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:43:27 -0700 (PDT)
Message-ID: <060764275154579bc2d7fcd72f1b37b991bae74e.camel@linuxfoundation.org>
Subject: Re: [OE-Core][RFC][PATCH 1/3] oeqa/target/ssh: update options for
 SCP
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexis =?ISO-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>, 
	Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Fri, 02 Jun 2023 14:43:26 +0100
In-Reply-To: <a57ca55e-b65d-0e4a-8c77-9c74c90d1484@bootlin.com>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
	 <20230602095037.97981-2-alexis.lothore@bootlin.com>
	 <7f52a730227e60bb145201b27fc3fe827e2cc63a.camel@linuxfoundation.org>
	 <a57ca55e-b65d-0e4a-8c77-9c74c90d1484@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182331

On Fri, 2023-06-02 at 15:41 +0200, Alexis Lothor=C3=A9 wrote:
> On 6/2/23 14:02, Richard Purdie wrote:
> > On Fri, 2023-06-02 at 11:50 +0200, Alexis Lothor=C3=A9 via
> > lists.openembedded.org wrote:
> > > Add two options for SCP:
> > > - by default scp expects sftp server to be available on target, which=
 is
> > >   not always true (e.g: core-image-minimal image). Pass -O to force S=
CP to
> > >   fallback to legacy SCP protocol
> >=20
> > We deliberately switched away from SCP since it is deprecated and will
> > be removed in a later openssh release. This is therefore a step
> > backwards, we really need to do something different.
>=20
> Understood. Digging a bit about the deprecation issue and why it did not =
work on
> my machine without this option, and based on fixes seen in mailing list a=
round
> this issue, I found out that my image was not configured properly (adding
> dropbear package instead of enabling it as an IMAGE_FEATURE, which brings=
 in
> sftp support)
> I guess keeping scp command but with sftp support instead of legacy scp s=
upport
> is ok ? Or you are in fact talking about completely stopping using the sc=
p
> binary, even with sftp support ?

Using scp is fine but I don't think we can rely on the SCP protocol
staying around.

Cheers,

Richard

