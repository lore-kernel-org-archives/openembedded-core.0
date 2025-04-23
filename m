Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781EAC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 11:18:56 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.6013.1745407126078102224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 04:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hmPFBN4R;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so47368551fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745407124; x=1746011924; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzqlrgM5fZb1D6zozqSD6FFwezC05BvE9zwdmxBJyQE=;
        b=hmPFBN4RbQxUfaYhf47VZBZfne6Fc7W+zg2BNUMXFPOeeJySjAQSqFaVK6TT/QtnET
         D/PRBylXRGdvk6s+73H4c41oGhy4YVYLng+2a8JZ4ib8dGW8EGG+9FrOwiAZvJLyVUSg
         CXpt/VG5q9KxCGh6Q+DpM3vZyl4G3ky9JttP+OKdG764GHu6JtN/+E65SJXyFr7bK8ID
         VldF+VvYGe4hMF7CH9ls1IOtSWwN8RaVcg1qKQqL4l8I7VmEp1s4+2VSgudvMDaF08ix
         Ttg6LQDD0SasKYIEhpMbAfvOb+eUU1QeUr9ND/oN87hwg2G18xXp4eksiQVtdwz4gFOF
         wXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407124; x=1746011924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzqlrgM5fZb1D6zozqSD6FFwezC05BvE9zwdmxBJyQE=;
        b=cQk4VF41ymhEiur2QgCr+RXgSvy24NBa+mIZkdMZgiTsRd5L4PGsp3BUO75FZtB9Ex
         WbNCSFqZ5pDgh8ttHmAM6MQ6u5mZbil6WjovWaDJRKsbfhyzoTojKV+yr/4CtBw2Az6M
         4KKvAIdUd4s4dFuQR7RTZBhYCnIKVf2JWCMRScfUD1Vx+iLRmcSVZAz8jOFUR2nD5Z3s
         hw5aI+kC9JzhXPP1d+Dt8KYSbESLH2ilHUTSZk6z2DyGfjyOwaedpgXa8ybdMkOmMRzh
         h/3O9PMWtsoXLUFHTyAorNbeAMi6Enp9wG47aT3sLTK+GGVth3ogLG+j8Ox/pidIKoss
         Va+g==
X-Gm-Message-State: AOJu0YzhpB9DHgK6kW5Z8wvfFQkY2kUM1vZ8Bz9lic2tlY+99A8QXbSz
	uovlbcNDEq58A55DgSG3R2TqY+De/JCoMKnRSyocta/idLjiCmlSAcVkFHFZX7I=
X-Gm-Gg: ASbGnct1Uib7LfCZcOurV2I5wXnj1qvzGUSb3Qzrx8bgUbX7yhNW4dNG1bd6fgyx/4K
	9km7x+T123uyvIKUynv4YB9cZ2xAaJpc39v0gzmvRnwL2htmFJof0M3mtQva1+M6O+5FbOFeTSX
	EjUeyO7/zTt6PFijKAOlzK8avC8EAqJsmnpesG3Q1cl7BJJSRJ0DamWsXF/TSRQe+CyPMP139af
	UuXmJPgUjDmxa/kh/ju0YkSV99ZtsLMbfGDYRTV+CkaAieLLTZlaPp3BtMMm2jR6/m22D79o8sW
	WOl3Qzm2TRPqfgXwt9RMYzXp89YTMI99ZySTvoiIel1FysVl5uphvH3loA0W7QgMU2KRiGrG/w=
	=
X-Google-Smtp-Source: AGHT+IGYZgluXEKtW7huc2rSlRmGByGjEn9c+ffSP0M5LyTuPKCuZZl9ixRSPqkownabhxHTkCiL1Q==
X-Received: by 2002:a05:651c:1582:b0:30d:7c12:5725 with SMTP id 38308e7fff4ca-3109057b61amr72983981fa.33.1745407124143;
        Wed, 23 Apr 2025 04:18:44 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090784e71sm17638351fa.46.2025.04.23.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:18:43 -0700 (PDT)
Date: Wed, 23 Apr 2025 14:18:42 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, bill.mills@linaro.org
Subject: Re: [PATCH RFC walnascar 2/3] systemd: always depend on the explicit
 serial console units
Message-ID: <aAjMkh6O3bUq1hjS@nuoska>
References: <20250422190053.3244331-1-ross.burton@arm.com>
 <20250422190053.3244331-2-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422190053.3244331-2-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 11:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215280

Hi,

On Tue, Apr 22, 2025 at 08:00:52PM +0100, Ross Burton wrote:
> The systemd-serialgetty recipe generates explicit units for consoles
> that are defined in SERIAL_CONSOLES, and if that variable is not defined
> then just produces an empty package.
> 
> Even when systemd has been configured to use the getty generator, if
> there are explicit consoles defined then we should respect them.  Don't
> conditionalise the dependency on systemd-serialgetty so that we always
> pull in the explicit consoles.

So all boots of genericarm64 on all HW now wait for the configured
SERIAL_CONSOLES timeouts.

How should that be fixed? Unsetting SERIAL_CONSOLES in genericarm64 machine config?
So systemd-serialgetty is allowed to be machine specific but not systemd itself?

Cheers,

-Mikko

