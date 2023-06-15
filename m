Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1125EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 08:35:09 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.13380.1686818103371623456
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 01:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=RwwTHqSo;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b39bf8d5faso13791821fa.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 01:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686818101; x=1689410101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyieFMyfLSq6suZgAwJvAnK+Uko28kNQtDUv0XEgmv0=;
        b=RwwTHqSoVuVwQpcwxbA6zwb7znb1muiY92LzzzFScqxAQhWQVNw/nGgwWrwij4ABdq
         ORrJtjj2Wt6xknEllH81+hQX4lgZyeoRbnJ++ZjQCu6QwljqKL4zdVLeTODFm0RWq6y8
         r/q6eBedQ6G5PZ2cJNxQ+iZ5VCskLyTg5o11VF/9vm+Jh1D32YF6p+yR0btv6aJtN/Dv
         5k8bxrLiJmdTO3uD4LdGdvYVPx0xib9dkwCXrHetK8OgKq1X252Z5VrLTWHtdRYW1PNt
         iDB2YWV5d8bwQAoVfMyq5TVUgkaoIp4rqrSh1uZp5JzFJ6+WRNVfFRDubsXwDs4GrYWh
         lMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818101; x=1689410101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyieFMyfLSq6suZgAwJvAnK+Uko28kNQtDUv0XEgmv0=;
        b=RObmfbSvBmuszreIllejtw20gavdo26sOrNr6X9h925GjQmOhN4AP9obIh03kJ+PzY
         sxb+7zrhjmxWe8j9i/zatJpL1wX9vfRKi2P3nz8r3uxz4UBqUArM9eA2/TAQ6FBJ5w4V
         1HS7vLPBOJlsCS80rXULAceFEX7aI8rLB82tSk0XVMG6sgx7oQtbHUr2PJ7qwBlad6yp
         cXD9jSH/fAA8EnyTWr0nM9IvuQQ/QoQb/Tc/ISBuiq3KGZ7JT7Lhy6c+FBEOb2SCQrP3
         r9qkkMQRMTTYrgNFemy/xM2JJeUJFciutj6Wp1BtP6TF8RkX92wxWuUQTVE1DzP+4/VU
         Hb5A==
X-Gm-Message-State: AC+VfDyRNRzSoN7O1SewQ5IT8xBa1x27O6liasxSEh9Q7/VzGsMGPa5F
	L1p5BEry8sfdh0h9dBCqv55A5g==
X-Google-Smtp-Source: ACHHUZ5h/sAuJTKJkLXX6ms2SQ1dJDzYDn9nGWUxUa42pdNXsFPmLIhnujV9zIbn+CmV8vkJnzKlGg==
X-Received: by 2002:a2e:a419:0:b0:2b4:47ad:ce80 with SMTP id p25-20020a2ea419000000b002b447adce80mr480549ljn.43.1686818101417;
        Thu, 15 Jun 2023 01:35:01 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id l9-20020a2e99c9000000b002b349e08384sm641952ljj.50.2023.06.15.01.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 01:35:01 -0700 (PDT)
Date: Thu, 15 Jun 2023 11:34:58 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, alexis.lothore@bootlin.com,
	Openembedded-core@lists.openembedded.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-Core][PATCH v3 4/4] core-image-ptest: append ptest directory
 to artifacts list
Message-ID: <ZIrNMt5IcnBhTzF9@nuoska>
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
 <20230609064802.11777-5-alexis.lothore@bootlin.com>
 <ZILME/DYo6hUkXv0@nuoska>
 <212cdfaa-12a2-e292-ea51-7432efaef913@bootlin.com>
 <CANNYZj91ma6TFrZGsYegK6ZpQMRKudN_K6hqSW-o81MA2srntQ@mail.gmail.com>
 <2ab334cad37a96bfa119acd45a7e760c3ba3c429.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ab334cad37a96bfa119acd45a7e760c3ba3c429.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 08:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182839

Hi Richard,

On Thu, Jun 15, 2023 at 08:03:44AM +0100, Richard Purdie wrote:
> On Sun, 2023-06-11 at 17:16 +0200, Alexander Kanavin wrote:
> > Doesn't += override the earlier ?=
> 
> It depends. If ?= is parsed first, += will append. If the ?= is parsed
> after +=, the ?= will not happen as the variable has a value.
> 
> >  (or ??=),�
> 
> += would override ??=

In which kind of cases would ??= be preferred?

For basic recipes in oe-core and other layers, setting variables with
basic assignment and then appending it with += should be enough unless machine
or other override specific qualifiers are needed :append:machine.

Using plain :append without any qualifiers is annoying in downstream layers which
try to fine tune upstream open source meta layers and recipes and still remain compatible
to apply security and other updates, including full version/branch upgrades. 

I see some, for me, bad examples of ??= to set initial PACKAGECONFIG, for example.

Downstream layers would need to use PACKAGECONFIG:append to add some feature
to upstream defaults since += would require to fully control the PACKAGECONFIG
in a bbappend. I would prefer ?= for that so that a += could be used to add an
extra non-default feature but keep all the rest in upstream defaults.

This gets even more tricky with intermediate layers which might want to enable
features across recipes and layers, e.g. "selinux". Now they'd have to use use :append
to make sure "selinux" is added to PACKAGECONFIG everywhere and no other upstream defaults
are changed. And then product layers who 'know better' to for example drop some features
would need to :remove them explicitly and can't fully overwrite the PACKAGECONFIG with a simple
assignment in a bbappend. Messy. Staring a lot of "bitbake -e" ouput needed.

Cheers,

-Mikko

