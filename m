Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05461C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 11:53:08 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.10566.1685706783227181629
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 04:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=VNRbjtBu;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so2622957e87.2
        for <Openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685706781; x=1688298781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AovgvDczZGo6VdLwoXQRjdbOlqo3+AnfVFMgy2f9nsE=;
        b=VNRbjtBunz4/KLE8LELGKccl1GsZPq5xPxgrky9HlMx3hZpDzyhyc9ULcRbj9ynTIM
         JGqAHdx8SESd1B0txutL4HWR9E2jTHpJsjgd3XUrHz6Yr2qnNBPYxs3qW2OVQGcLz6dy
         tefdrMFQovTYoOZg6BXMBH0wsXC9T93eLFqKasXJpRlUKdbtSvuYfd119ac1TUZ1+uBk
         MNVZs7njaU9ijFDAFwE0V1NrDMNqdbyB3RQP+40f23Lo4DBe3lUwzk5WZ54dgvsDd0kL
         qa5WfH8tn0yDbs7MzgSBLdp5cTXip6J6kc1d2V99x/S/y9VWTddsBkAiBxJmTHHBsBuw
         MPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685706781; x=1688298781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AovgvDczZGo6VdLwoXQRjdbOlqo3+AnfVFMgy2f9nsE=;
        b=LTDr1tQ4kgMbbEw+O1kpAAemSdZNBHNTRg37vWh3BRsXYwiFjdGkAuXA/I4pmbPZI0
         GcOwz5JEcMRDoZhrD6MvHW4w5cLJaZ6J2ZFntypDXCzRpBDUcMdlEbBwNurpzsOnAydl
         PpJ/hsEs4IhSaKz09kscLJsnD0cxSiy6V3nnq55hZ0f+OUF8rsafiPHLRWgHBjzn8Zp+
         smNgIxw06cR1lVc8Loul3I5jDOIfn5UDuUQM4JsvuTVD/a4o/uX80oHxliTW6xVPwUmi
         avKFcNgUv18LX9ft6ZPotKSjBu6TK74e3R96d+61KYTHMP9JrSWTdVC3wW8UqfdSMGFh
         Koeg==
X-Gm-Message-State: AC+VfDwu1lnHQHqr7lIxHldgiloTJG1P4YAqhP9ITT69zp+eZpVz3Mye
	34k2vNw+fqqyy/VynFRLjT9VzSprcO3dyssJFbo=
X-Google-Smtp-Source: ACHHUZ4LHsVVF7Y4T/njCpE7JiYShq37VYGrSxTiSR6weOkjrdGjzeWR/ErmJ4ACCLrP5PKPCW2Hmg==
X-Received: by 2002:ac2:4ac6:0:b0:4f3:a051:58e1 with SMTP id m6-20020ac24ac6000000b004f3a05158e1mr1474837lfp.56.1685706781233;
        Fri, 02 Jun 2023 04:53:01 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id n13-20020a19550d000000b004db3900da02sm139995lfe.73.2023.06.02.04.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 04:53:00 -0700 (PDT)
Date: Fri, 2 Jun 2023 14:52:58 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-Core][RFC][PATCH 3/3] testimage: implement test artifacts
 retriever for failing tests
Message-ID: <ZHnYGjE3ahdytp+g@nuoska>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
 <20230602095037.97981-4-alexis.lothore@bootlin.com>
 <CANNYZj8vV1=GOacn_vHpfeJ1h29AdLNJsO6X-wXPrW9vahc_5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj8vV1=GOacn_vHpfeJ1h29AdLNJsO6X-wXPrW9vahc_5Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 11:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182307

Hi,

On Fri, Jun 02, 2023 at 01:46:03PM +0200, Alexander Kanavin wrote:
> On Fri, 2 Jun 2023 at 11:50, Alexis Lothor� via lists.openembedded.org
> <alexis.lothore=bootlin.com@lists.openembedded.org> wrote:
> > +# When any test fails, if path to an artifacts configuration (listing
> > +# files/directories to retrieve on target) has been provided, all listed
> > +# elements will be downloaded from target before shutting it down
> > +
> > +ARTIFACTS_LIST_PATH ??= ""
> 
> I think this should be simplified further by simply specifying the
> default list directly instead:
> 
> TESTIMAGE_FAILED_QA_ARTIFACTS ?= "${libdir}/*/ptest/ /var/log/ /etc/version"

Try fetching /etc/os-release too, please.

I like this patch, thanks!

Cheers,

-Mikko

