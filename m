Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E23C4451B
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 21:25:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3763.1784496333643013269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 14:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NJqIXTgz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4758bd3731bso2582843f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784496332; x=1785101132; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xA4JaBDJVKsA3DOeQnZSIh7DUWfX7xUu7EQbYoI2DrQ=;
        b=NJqIXTgzvLSmZ4MVkUpRCGJoF7M4Fdhl7kqQjD02gd7OlnecYAHdUsF5U3CRxHR4xO
         NanA2vwGIgc2LJKJ1v83aSgVCSM61i3lwn5nZH/5r4qFrbVneEGFN+BV6ndXprBEA5P9
         qKQ6x38CmejdVrk9pYaKd1TqpZybqTVe4oTgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784496332; x=1785101132;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xA4JaBDJVKsA3DOeQnZSIh7DUWfX7xUu7EQbYoI2DrQ=;
        b=As/d6f+eD+WqJxcsJFRt4tsYVnICGTMZf17waSWZK9IxFIBsn/edKG7J7ex4Grwitq
         GsR2fT9Vlb76j+2aq549MF1L2IBYe1sLJg/q/tS96O8OylZkVoa19LTJ50QdcKhxMTcy
         /1ZnO1eUmCGdsgOjpjHOL83PkWU0H3/in4EGMynNuAfMtxbIpHidt7CplpI0Fsd7SEcw
         O6dkhjhgyGueLh+XJ2fkvyu9/OPDrWGH1+4Tz2sb8/eBVk0g3IfzBkwE3zdQMYhotcj2
         jvSj65Qo1JMZe7jw69SIz+hZ1jxn+pP95KK3P4dvHx1LBXJAqnJ85R3Y8le1OF/T5kqp
         3pjw==
X-Forwarded-Encrypted: i=1; AHgh+RrP0wRx6Ac4+CB6bC2zQflF8aGDRboiGnuLleE9p//hQDOtBsfGgpcT6t1zZNi9xiQ9s+G1+Dcao+04U7eY3JJZZQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxW3tOcUB8okGzXylA5Yaqhc3ZQaD2wFzKHZO7cL+KNTxowSd3Y
	g/9eGqJn6HPtSHwPl27oL8thkun3DL3rboTRyLDDBZvzTj/rycrDh0NX/UJ4QIzafvPzG/LhpKf
	D3dRkOfM=
X-Gm-Gg: AfdE7cnvy51Zz9ky+XLOR+efH0Wk1WEGYwetYd4/qgnvJxZQNc+KDVmIRTitoDQW/u+
	UQfXhyd3mvYo1FDDS822nKme2Ksp4KZkfyUzwEb4ew6YMsAVm41Lp1J7+SxvyPHtS3c2u8KlvO/
	gkso06qfgJX3a7vxxmD0lLZ2nFvzYEpIRjTVPcQrtWHnDnywfLEifB0Kzk0aX+QRtkw4Byi+BvI
	5dVtITJaPRwNfhnRxZipf6fQAYhmqnSeVADMnsA82Cbl+z5DwkFnNAzWt3cfhCrjQPlBbDAW5k4
	wPjM2tMLtCnODID4nRaGbb05Ou+w8B0PUEPw+fH3RWXU2GTMddAli5GbuWik5SwFmlE6s0gWgce
	rWu8D7S/bNeQg60tLHdKMgNJhZyimsMf84so4koLWxo/azNHrTg9ONIyT89E1RoEtT9rG+YlU6C
	XXRk7NgepFSd/XvpPtVwZGY2seskoh3rUiqF9H8Xih5urRliq16Slrs120DEX6P84c
X-Received: by 2002:a05:6000:2910:b0:46d:d6b2:395c with SMTP id ffacd0b85a97d-47f623e8596mr13409940f8f.23.1784496331784;
        Sun, 19 Jul 2026 14:25:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f295:f98:ef6a:b332? ([2001:8b0:aba:5f3c:f295:f98:ef6a:b332])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eea8afsm24954440f8f.33.2026.07.19.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:25:30 -0700 (PDT)
Message-ID: <f3e758ba0987e94d70e6b2f9f4950073a9d6f80d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 01/27] bitbake: globally define
 KERNEL_PACKAGE_NAME
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: vince@underview.tech, openembedded-core@lists.openembedded.org
Date: Sun, 19 Jul 2026 22:25:29 +0100
In-Reply-To: <953617.1784488771319074426@lists.openembedded.org>
References: <20260712184307.3259642-1-vince@underview.tech>
	 <DB5PR02MB102131BF9EDB1F84965702DABEFFA2@DB5PR02MB10213.eurprd02.prod.outlook.com>
	 <953617.1784488771319074426@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 21:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241303

On Sun, 2026-07-19 at 12:19 -0700, Vincent Davis Jr via
lists.openembedded.org wrote:
> Any feedback besides
> =C2=A0
> Bruce and Peter comments.
>=20
> Before I submit v5 to address review comments.

We discussed this briefly in the patch review call last week and I
think we were all a bit concerned about the patch series.

There was some work some time ago to try and make multiple kernels
build in parallel and parameterise some of the code. This does seem to
be a continuation of that work.

What some of us were wondering is whether the kernel-XXX prefix was
intended to be the general "default" namespace which each kernel/module
would provide, then the provider could be switched without the need to
have all parameterisation this series ends up implementing.
Unfortunately I've not had a chance to think about that more deeply and
work out if that can be done or we really do have to change all the
references as this series does.

Cheers,

Richard

