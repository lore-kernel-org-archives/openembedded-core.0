Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C446EE49AB
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 07:31:05 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.6610.1692775864733909091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 00:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bOblDxSE;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4ff93a7f230so6073025e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 00:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692775863; x=1693380663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BlJhLJDTDSJwvkCFLggQAR1Ioa0faUTCFYi4aMVBcPs=;
        b=bOblDxSE0PuS+NF9kGrPenR9oYE63bcNNYjFI297367QNB8Y8Fzi0STzTJevz8AVoK
         Uwo3IpiW0GixcZvKBfd4gYS7ZGgS+Yb+TbMR7zNe+3bXTqzrqshiTCJJm31AZXuE6cQg
         7SwBjrps3SDrHO106/lXc6M2l/GhWRWsU/7KYmT5bOdED3bI3TMq3kcmYZhIos2+5vRF
         m8/67JzykKMp2v8Zjhf3iM8J5AawNxJAChPZPyTaonHZZEc9dIwjCWmFKA2gfQb50Dz1
         WrHnw/NN8qsL5WmxXsdhjGbC+mPbmK6XkpHGE8q0WaKmXiQtvxwNIy4r9sQUJk1Y48m9
         bwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692775863; x=1693380663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlJhLJDTDSJwvkCFLggQAR1Ioa0faUTCFYi4aMVBcPs=;
        b=DscDZkZdm6+25uRh8gpA4HfZE3UIZ5a7voqB17Yq1j25txjgRjJ04+tZwzAwhgQWd3
         R2KhT5LlI597k/RvF+tvfO56EgXQhk2fBI2vFPPCuFC8Y5cOPEkPLu9oz4q2/cnARjkR
         52Nvhvdtg1xohA2Kn3XnQpqYQAOMsOZ4IpzToTL77yGSzBLfqysfrW/KW89EElIIGMlZ
         ffDPBMHYqb4tckw9bydHsTGAAabQtMF+3HMbT9jKjYZdmil+ovmGKfollMLwZ4uN9hZX
         izJtWU1KVd4qmVg0KVMrrv0iQaDJkqa6NxOm69fhvh1G9VOSdMJ0bY0iarXee2Fe155O
         bU1w==
X-Gm-Message-State: AOJu0YyzZii4cgwbKPvg2x8BTglPkP1yhIyGF0if4puG7KCx8KQxt+Og
	I9ylKCozPlOg8oA/6RRgUE1NRw==
X-Google-Smtp-Source: AGHT+IFFPn/cupfwD3wsdto1K+aeux1IVyUBcDlJDx+mwF1pcL0b9bgocN0ufW/6uGe5O0y5Rt5inA==
X-Received: by 2002:a05:6512:1294:b0:4f9:6adf:3981 with SMTP id u20-20020a056512129400b004f96adf3981mr4676788lfs.33.1692775862745;
        Wed, 23 Aug 2023 00:31:02 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id ep9-20020a056512484900b004fddaddeb63sm2514328lfb.137.2023.08.23.00.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 00:31:02 -0700 (PDT)
Date: Wed, 23 Aug 2023 10:31:00 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Message-ID: <ZOW1tEl+PiOK09l/@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186561

Hi,

On Tue, Aug 22, 2023 at 11:25:58PM -0700, Khem Raj wrote:
> will this work when running multiple instances of qemu ?
> e.g.  try bitbake core-image-ptest-all

I was not aware of core-image-ptest-all. Tried to build it but it doesn't
seem to be compatible with IMAGE_FEATURES += "ssh-server-dropbear" which is
needed to test core-image-minimal:

Error: 
 Problem: package packagegroup-core-ssh-dropbear-1.0-r1.noarch from oe-repo requires dropbear, but none of the providers can be installed
  - package dropbear-2022.83-r0.core2_64 from oe-repo conflicts with openssh provided by openssh-9.3p2-r0.core2_64 from oe-repo
  - package openssh-9.3p2-r0.core2_64 from oe-repo conflicts with dropbear provided by dropbear-2022.83-r0.core2_64 from oe-repo
  - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages)

oeqa runtime testing core-image-minimal without ssh server doesn't make sense as all tests will
just be skipped.

Cheers,

-Mikko

