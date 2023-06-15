Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B40EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 07:03:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.12415.1686812627598171909
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 00:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=P0I17jvM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f7ff69824dso2900955e9.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686812626; x=1689404626;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5I5GajVGiOt5ShfR/2KqA+Qd5MNnrcdoX6So7cpPIxw=;
        b=P0I17jvMg5TB8bwuDprxD8I7TeiISlYKStZKpb67MHdiZ9UIeg7xRN9YF0BNhxjHo/
         7BB3SUf7cSEOs7iVlIjMn4ZZBTKqEC4snHw/2qOqjrhzN1aRCNrJ/9a8lnVnwkXNVj5i
         pWG471LCIvNrbfq1oNg27I4RJHUoZE50veAO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686812626; x=1689404626;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5I5GajVGiOt5ShfR/2KqA+Qd5MNnrcdoX6So7cpPIxw=;
        b=OqnlR1P/QdbQ2RSts/e+O6hMkWuA7oCxPkdyaku2H4zcql+q8jqjNxT7FMfsQtCLvP
         4q1QbBdaq/k7YcO7sLk90bP9RcmSLNxQy5f7wrTVDmapOrsxF7dJkBRZyKyTPPoHshTm
         PRPlLkfrk3uma03ANBS6ENPG0UR8J95inY6O/ch4Kvf+8nmo5iAuxkyDHlSTVK4UT/RJ
         Rm2/1oov96KLehNML/MklTkOPymh0tIdoF95+RMrHRK4gWd/kvERWkSSkNGsJuRcWF9S
         a6J8qcU+AmZNFfazHxKWukSs86BEmj2SNFgwVxTUEkjeNGkeR0Y0LsmxJZ7TPg09rr4Z
         luWA==
X-Gm-Message-State: AC+VfDyRon+IQEg5XiKehSvfZVSqUhGHejf3aklqgGX6kaEXpFyN5E94
	7JsofTfjVIVaIsTfU1smYc4qfw==
X-Google-Smtp-Source: ACHHUZ4FBjk3iXT53SVShiRt/wWqCiw7w4BZNjl5UVsFrjlwjRWM8Hv0ufJ+gZYzfjbuZE0bl9SfjQ==
X-Received: by 2002:a05:600c:4b23:b0:3f7:6238:8103 with SMTP id i35-20020a05600c4b2300b003f762388103mr3320271wmp.11.1686812625947;
        Thu, 15 Jun 2023 00:03:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1? ([2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1])
        by smtp.gmail.com with ESMTPSA id f26-20020a1c6a1a000000b003f7ea771b5dsm19742035wmc.1.2023.06.15.00.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 00:03:45 -0700 (PDT)
Message-ID: <2ab334cad37a96bfa119acd45a7e760c3ba3c429.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v3 4/4] core-image-ptest: append ptest
 directory to artifacts list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, alexis.lothore@bootlin.com
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Openembedded-core@lists.openembedded.org, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Thu, 15 Jun 2023 08:03:44 +0100
In-Reply-To: <CANNYZj91ma6TFrZGsYegK6ZpQMRKudN_K6hqSW-o81MA2srntQ@mail.gmail.com>
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
	 <20230609064802.11777-5-alexis.lothore@bootlin.com>
	 <ZILME/DYo6hUkXv0@nuoska>
	 <212cdfaa-12a2-e292-ea51-7432efaef913@bootlin.com>
	 <CANNYZj91ma6TFrZGsYegK6ZpQMRKudN_K6hqSW-o81MA2srntQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 07:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182832

On Sun, 2023-06-11 at 17:16 +0200, Alexander Kanavin wrote:
> Doesn't +=3D override the earlier ?=3D

It depends. If ?=3D is parsed first, +=3D will append. If the ?=3D is parse=
d
after +=3D, the ?=3D will not happen as the variable has a value.

>  (or ??=3D),=C2=A0

+=3D would override ??=3D

Cheers,

Richard

