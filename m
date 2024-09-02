Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C21CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:35:48 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.35762.1725273341748940716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=i/1TZBPa;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f50966c469so45448981fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725273340; x=1725878140; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ut7kr02/zo+QKAdVUldm2olbuVMwHuExzwL54Mj0ONw=;
        b=i/1TZBPa3n8i2iFKuOa8y78cYf8pTPmr3QbJQfrgc0hHXx/xA3CWqtG4Xejfapizi/
         ++n5HpqsKHFasU1+EU7PjG5+LHTYSULHdDu+wic3FykVoZtXaxzBI1qNqlIYVOuFbCBp
         /5nA+z1NPUdEd++8VLWUJgPnwxTnqdGtVRbKG3XuhW+rmVI43veqTd/wTyC9ot+e2esP
         eCiI1AvdmaloQ4zj79Qiw97zrfNCzXpBFhPlC/MSPeLwtG65pm8wHHK7+X6Pxfi9/yfv
         CiSwp5IibqvA4TLhKrEmV5A3IIg5PYtUrKpH/JW4fR+7amgHxmOZv+pMncDPPECksqfv
         Su/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273340; x=1725878140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ut7kr02/zo+QKAdVUldm2olbuVMwHuExzwL54Mj0ONw=;
        b=teiHCeYKDKk4UsZYbsXW1P7/pS0/oB3HsaEx8JIK13c11VtrxHOpV0fY+DL1yogVEp
         H3tfVBbf7euFN0ROIHa0XqGnqKTrKeGH0Zgrdlvz6TuqogAjtD0SDHxo5VLuRAYKAZEK
         b/QbpaQW4X0CMpAzpBbk4GquAihPTzP/EQMALvmoMxWn47o5Ez53YSoOdU0tbvtw/3pz
         ZjUNlu0seoeHBtsB6szq1aYqpTv6jDF1bhYyxecbCKknQ419p5wCK6/RobCcPFcxRTmZ
         UVClRB+RZVL+Cmx52Jrs7LqQRXLsg6jT1a2LUm6kO+sw/x2vVFid2LQNhfIFIVI3mvDO
         gccQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNS5TM0H170Bhh9YgcpjauG9KNa9DAg95L8MnbJz0mdzn8Ad8mQlabzpFiU4url+0NdpoUikktFvVlTMiGMlHGxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxq4jdMA0B1m49z327KOAoOPOa4cfASKsQLZeq7Ii0pYgMwBQRK
	qn6Y5GWN/scOjxPOFACjhcFZMDEAw7Cj1jU3hYYxHyhNOGyZgy1TrrpBKczX8xJ2qIquKWi+s64
	BVvY=
X-Google-Smtp-Source: AGHT+IG4/O2KtPgwK+R9vzmKmRcJcq/okOtA10VyQjjmNWHTt6aflKCdUNVoR+gSXqBjlfOcNZIAiQ==
X-Received: by 2002:a05:6512:b2a:b0:52e:fa5f:b6b1 with SMTP id 2adb3069b0e04-53546bcb1d4mr5481535e87.60.1725273339303;
        Mon, 02 Sep 2024 03:35:39 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535406e5549sm1554744e87.0.2024.09.02.03.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:35:38 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:35:37 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, peter.kjellerstedt@axis.com,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
Message-ID: <ZtWU-ZWPSQfkAozH@nuoska>
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-3-mikko.rapeli@linaro.org>
 <DB5PR02MB1021356397EAB4F11F18E3EE0EF922@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj_7Q6j1k2bFS3oSa2cjmp9EGd3QWT0HOUtecKE3spLCfQ@mail.gmail.com>
 <17F1667FB4E21297.30681@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17F1667FB4E21297.30681@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204085

Hi,

On Mon, Sep 02, 2024 at 01:27:05PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> Hi,
> 
> On Mon, Sep 02, 2024 at 12:15:02PM +0200, Alexander Kanavin wrote:
> > Also, can't this be supplied with DEPENDS? Adding to HOSTTOOLS to
> > cater to needs of a single recipe is not a good thing.
> 
> On Debian/Ubuntu getent is part of libc-bin package which is marked
> essential so installed basically everywhere by default. The systemd
> side meson build script was failing without it. I can try to check
> if there some config etc way to disable the dependency.
> 
> Or if this causes problems then I can move this to "usage instructions"
> of ukify.bbclass.

Dropping systemd-tools-native change since systemd-boot-native already provides
the ukify script and doesn't call into meson so this patch is not needed
afterall.

Cheers,

-Mikko

