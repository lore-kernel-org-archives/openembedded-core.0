Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1406CD6E73
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 14:05:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.17378.1697033121272206110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 07:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IoNoLLm7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32c9f2ce71aso1667715f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697033119; x=1697637919; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ssmfIwed4hXm2FF52ruNr4j7i57j0AdPqVzKS9AcfYw=;
        b=IoNoLLm7jdtKm4hSzTJkT9+zosqITW2f1vsrVDiOHpYgn1YpHSc+GAb2Mba1ynx5wO
         4/HpiZOmjHSKEo2/9s6plTJpCZZsgLDKcN9fd30WMpaa3zH4qGExlw0WO9ZPFXPhgd2H
         tyXZCRAe/d42ZIStEX6CKuuyiR7S7c2fcEk30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697033119; x=1697637919;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssmfIwed4hXm2FF52ruNr4j7i57j0AdPqVzKS9AcfYw=;
        b=g7teJTOu15AIlyu7eI4axRGR2+SCQV2JRp/rIIZ1fVvPbx95eDYdZ+8SZ02i7wvvIU
         li/XJMFCYBLtQTdgauXyNtIuXNtRDpYA2utSCWStS0KJ/54qWID5BWAxR79vREg4NFdh
         lebf3WHR3gcGOD+TKj/+1yV7KpN98FgLykSrizcQxs4GHpxNKmDsGyMkmLVcUDSFrAGf
         qRHEfQMbR/NODdZ8OfJ2Errlb+7kWDV5Z35xoTv90N+d7UUucwylj1Gmf3rwdGS8DxCV
         BdB1JjLir26L7fosQebcYFt6VZfxQj5e5OyKPqWC0peAYAMx6Nxin92OV9tQ+8jB1FqC
         3Gmw==
X-Gm-Message-State: AOJu0YyO+PdhbCt4NMsvL3QdIQ6Wob60F/x6c/hCTip1DoqnKfOvNht+
	dryHuyYFm2+iIIVqPsRMrEcZ8A==
X-Google-Smtp-Source: AGHT+IGn2SvsnNSrYpqHesWTCxaVhI66JOT8v/3ca4cZYcIEB/SWqQKzbKWpATSWOiyUU4Wk9R1BCg==
X-Received: by 2002:adf:fb0b:0:b0:31f:c1b5:d4c1 with SMTP id c11-20020adffb0b000000b0031fc1b5d4c1mr17395381wrr.35.1697033119624;
        Wed, 11 Oct 2023 07:05:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90? ([2001:8b0:aba:5f3c:af0b:dd0f:66a6:9b90])
        by smtp.gmail.com with ESMTPSA id n20-20020adf8b14000000b003296b62d413sm15176170wra.82.2023.10.11.07.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 07:05:19 -0700 (PDT)
Message-ID: <bec9448e12335b5b33b0e74266d903e01252d86b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, sundeep.kokkonda@windriver.com, 
	openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	umesh.kallapa@windriver.com
Date: Wed, 11 Oct 2023 15:05:18 +0100
In-Reply-To: <CA+cAkeqMcsqrRDLTar=XE7mGinWQ7bAnCM5ErCecQoooya8nAQ@mail.gmail.com>
References: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
	 <CAO5Uq5TK5W8SH5qO=Dc_GtVs+rL1RZNFokdkCaRxEa3nopjHjA@mail.gmail.com>
	 <178D0D506C537908.9719@lists.openembedded.org>
	 <CA+cAkeqMcsqrRDLTar=XE7mGinWQ7bAnCM5ErCecQoooya8nAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 14:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188960

On Wed, 2023-10-11 at 14:37 +0200, Frederic Martinsons wrote:
> We may want to remove the=C2=A0 EXCLUDE_FROM_WORLD in zvariant
> recipe=C2=A0since it was introduced for reproducibility issue (#15090
> which had been marked as a duplicate of the main rust issue #14875).
> What do you think sundeep ?

We should certainly test it, it really depends if there are further
issues present or not. This certainly is a good first step though!

Cheers,

Richard

