Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C296CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 14:14:24 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.39118.1712240056668791543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 07:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=b6EuFGhP;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516bf5a145aso1299677e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712240055; x=1712844855; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aCXJAj01tGKHEINGVYa6cOZ+mBOn8DihKOpJcC826oQ=;
        b=b6EuFGhP0n9ikB25VzWQZgteonLFT7ePR+HKzXGztDzyxnXwRWeGIiNIH1dEqxAQ30
         gEkHXMAVxICDxq7UKFwRF4B49FrrBFDtDR5axo9olmDmeG9K65xdYDmoBFJLxu07YAeD
         Eh/znS+XN8N8ng+VH9rTMBfDVwMEPKnA+gqbB6FbJd+vuaEJrrqmjCZvA40Y2A9Dfvb0
         veuCOYB8KMEnaDTKZzRHiaAtlvMLXy4wk5GgkPmbxVwpQ0G33Ks74HMuSSD8hbZUE2UC
         oWoWWXDgxkoZR452hVeZKISrF+9U78KacpYZYIIoUFi5XeST55MLexhBb0NgUn6r3lnd
         OuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712240055; x=1712844855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCXJAj01tGKHEINGVYa6cOZ+mBOn8DihKOpJcC826oQ=;
        b=Ced2N9fKrtuEztgdeZWuHP8HBYFX7HJpsuvhoC6aqfg/eQnPg97E5BjhcQritPhX6l
         VyZv4WciGLtoXUq2dlSjizbwYRJuu5bYconVTglj8PPbAAQwUo5WoYHcpGSp96RWM3gj
         2jh1Ghr8MlAqeL64RIAPI3RmxHcfAmkOF9htaRBqPK4pV95rJdiaZAZ8ogRdM0e3ZsGb
         7TqSZ5aovz7Mbuzit7yVJLfVjR5F8RczmjAf5K/3qNiYVAi6I/kY50yETGrseAkhZ3MN
         rAqR8c0+epVTbm9tt8NB7VbOvGwW9EcfGn6UVeh57s3yMo9Ha2cm/+sTRvAm72GkhOGU
         iVKg==
X-Gm-Message-State: AOJu0Yx0Oi2vu9Nd3Mv3UfLJsxyZdPO0YRcZsnmnyvc6hvEAlX7uHUKi
	PULNooHR8VYE3CDm90wyFi9cl7OFN2CGaqkbJQ7aOzXvkHPpt2S1Phurzvmz+tU=
X-Google-Smtp-Source: AGHT+IEtqashx7+PXtHuzj1gVfeASFBBmyGmNrJN6eox8nvEYgG2Tei7VXpNPeAYTMGdEEzznQy3fQ==
X-Received: by 2002:ac2:5290:0:b0:513:a977:933b with SMTP id q16-20020ac25290000000b00513a977933bmr1833000lfm.42.1712240054444;
        Thu, 04 Apr 2024 07:14:14 -0700 (PDT)
Received: from nuoska (drt4d6yywjht56pm8q3st-3.rev.dnainternet.fi. [2001:14ba:7430:3d00:1239:a19d:315c:6ddf])
        by smtp.gmail.com with ESMTPSA id 13-20020ac2484d000000b005130ece9099sm2304094lfy.277.2024.04.04.07.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 07:14:14 -0700 (PDT)
Date: Thu, 4 Apr 2024 17:14:10 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [OE-core] [PATCH 2/2] curl: disable ca-certificates.crt path
 setting for native build
Message-ID: <Zg61so8SJcuRXg31@nuoska>
References: <20240404132902.68631-1-mikko.rapeli@linaro.org>
 <20240404132902.68631-2-mikko.rapeli@linaro.org>
 <CANPvuRnAhHTg8rftCLuHzcWh5Cdy9P0gdZByD1+s6MV8r7kzmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANPvuRnAhHTg8rftCLuHzcWh5Cdy9P0gdZByD1+s6MV8r7kzmw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 14:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197967

Hi,

On Thu, Apr 04, 2024 at 02:57:20PM +0100, Jose Quaresma wrote:
> Hi Mikko,
> 
> Did you test with the below change already merged on master?
> Looks like it was to fix the same issue.
> 
> git: git-replacement-native: depend on ca-certificate
> https://git.yoctoproject.org/poky/commit/meta/recipes-devtools/git?id=421083c46c97bf758496b8c58402aea5d74aa097

No, I was on slighlty older commit 47c201da56155f80e18ee1269096ffec1864bce0.

421083c46c97bf758496b8c58402aea5d74aa097 fixes the issue too, thanks for the hint!

This patch can be ignored.

Cheers,

-Mikko

