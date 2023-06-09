Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A927C7EE37
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 06:52:17 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.7464.1686293527568337462
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 23:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=kiBuIX4Z;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f61b45ee0dso1738733e87.0
        for <Openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 23:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686293525; x=1688885525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHJJTc/TDw/r0J3/qV3FEAkReVf4u/qFJXFfFFOqBcE=;
        b=kiBuIX4ZcaeTOMuSIg/GmPTD2t6xXe6j58+UraBovesqUe3vH0X/nldAiustsKxBdK
         1X1w3OOVct+agru/llWtpILVX/Z62TNz8KN9fyggrklI0RgAvWOuSXsd4uYyVdZ86yVs
         flmHtPTv1fn8Mk7LOgr2RxDTFiguFDy+RiOsZjuof1crCfbSJ2MqfxPMSfyouYbCX7C+
         ztwbOxlUBf4EZpzHCrgnFhoTr2wOxqlPi8FfVQ3CuKTx3UeKKE+ITIeB5Y8B72QmxDoi
         d5/Ao54QmQlkgNGVii6vTmQfG+/8SUjLXMGRn8cvdt8gB6vM70T1W7ivu0izhvjHNhG9
         NeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686293526; x=1688885526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHJJTc/TDw/r0J3/qV3FEAkReVf4u/qFJXFfFFOqBcE=;
        b=AZlDhFYHM2lcux9ImZcVzd92ieafCuo9sXKnBL31KmftzAfLXMfnmyucVRoFMUyOi2
         Op2661dAsxNvTdkHynFXayIpO7TsXIfGaISEwQHDbOBgbBalNHuGKwTvJvDAzNe8aeAa
         0ounJ7sWQ+UFLyZU4wCAOdNS2Oa8Yoxfte+KBA1XCDo9tngybdPjwtJVEcPvFhDhGks8
         2+eORgtyG1QhE1YN4mM460899yMi6mo09/JpWjaEwx+0nNhbtBnEPdJiR7u7drIMs14e
         hXpiIQxqs2CiSn/pfOgoz0/xjHl5bHWD0olFQJIq0qzc26/HDHwF4iKwSVfz988qeeqB
         AFUQ==
X-Gm-Message-State: AC+VfDyPyBFNsPxXNLbR1g3a0JH5uxbByVoh+L74uL9EuRBteLpCEzex
	uKvTtCnQf5RcSTZerHyI9ZJxaQ==
X-Google-Smtp-Source: ACHHUZ7awPp8VpsdDACNhP/4tyBdAaerOW4oR3O9rdPnAwCyVHRlnk4nSoxe/ktznClAvtT4mZYodg==
X-Received: by 2002:a05:6512:3121:b0:4f6:4996:727f with SMTP id p1-20020a056512312100b004f64996727fmr211908lfd.35.1686293525669;
        Thu, 08 Jun 2023 23:52:05 -0700 (PDT)
Received: from nuoska (85-76-36-237-nat.elisa-mobile.fi. [85.76.36.237])
        by smtp.gmail.com with ESMTPSA id g5-20020ac25385000000b004f6337508afsm433801lfh.222.2023.06.08.23.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 23:52:05 -0700 (PDT)
Date: Fri, 9 Jun 2023 09:52:03 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: alexis.lothore@bootlin.com
Cc: Openembedded-core@lists.openembedded.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-Core][PATCH v3 4/4] core-image-ptest: append ptest directory
 to artifacts list
Message-ID: <ZILME/DYo6hUkXv0@nuoska>
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
 <20230609064802.11777-5-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230609064802.11777-5-alexis.lothore@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 06:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182538

Hi,

On Fri, Jun 09, 2023 at 08:48:02AM +0200, Alexis Lothor� via lists.openembedded.org wrote:
> From: Alexis Lothor� <alexis.lothore@bootlin.com>
> 
> TESTIMAGE_FAILED_QA_ARTIFACTS is defined in testimage.bbclass with a
> minimal list of files to retrieve when a test fail. By appending the ptest
> directory only in core-image-ptest.bb, thanks to multiconfig feature used
> in the recipe, only failing ptests will lead to corresponding ptest
> artifacts retrieval, instead of all ptests artifacts retrieval.
> 
> Signed-off-by: Alexis Lothor� <alexis.lothore@bootlin.com>
> ---
>  meta/recipes-core/images/core-image-ptest.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
> index 90c26641ba3a..e1be81bb2666 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -28,6 +28,7 @@ QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
>  QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
>  
>  TEST_SUITES = "ping ssh parselogs ptest"
> +TESTIMAGE_FAILED_QA_ARTIFACTS:append=" ${libdir}/${MCNAME}/ptest"

Why not += ? Also, spaces around =.

If :append is used, bbappend in other layers can not easily override
this variable.

Cheers,

-Mikko

