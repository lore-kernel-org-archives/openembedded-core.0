Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A783CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:21:40 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.26211.1697718097618619235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 05:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wi5rHXe6;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so104519051fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697718096; x=1698322896; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIyr5gy8TjPnF2E5JNjOCMhwnL+/HJOHIdvejXDCIgA=;
        b=wi5rHXe69rptAJljP9I0qf8+L3RK5X/6Cbyl2mcPDjIpSFqCqXeb162o5L9UC40xiy
         yKaL98fOY39HyWJqo0vPo/hxj5nnPlRVuO/h4r80WQ6TN1dSlnXdUdEt6jvvLAReTjDG
         ljAFyh+kNXCHZg8cLPuK758959c3kfHK9TIxsRsirnvQH5m9fhca1urhbcvE+6Dx4yuK
         M8V6Ho4dL6qI7tKlaUExNCiEoG4ytGN0E5sq+73jcGODGgL3ptqgllzDrC25yyGFgrYa
         EeRtP6+2wWExp99xCmDpZPLEgb3gyd6MwA/WHdf/uv3+9qjrGmHmlL5GA3lEESSVuMP1
         wPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697718096; x=1698322896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIyr5gy8TjPnF2E5JNjOCMhwnL+/HJOHIdvejXDCIgA=;
        b=k8hfzZorLD1sTEVARuKA5IJSaOtXEzJnh9fC8zWKGZNbI517nx0mD8sW0V5rgbZoaM
         Bn7iuHStjszKqlWBezTXHbWEOtgIDpY0coj759n8jizge0HMigWd1WfucZSQszU/b+IG
         um5XHYqyvr5tFZ7Q+Cdsm3TueClhf/zFUd5SFld0im/VLfGLMXrfqyobttFBm2k2gv9D
         LwsqzShQFQ02RyhLMLCe4ud17DfapVbdxXNZ3QGEn0ZdFH2Xs3jcYXyHHObySQix4w0/
         Kzc0b2A5lw8VuiGPloI4oPw2o2I8wJiEWtrqBRyL5tloFpxJSG8BdN1WS8X7OOrWX+ry
         R14w==
X-Gm-Message-State: AOJu0Yx4yuWaLJIKzysk87w1bToS9lWT0hv+fjOl07piUXEVjerc9rzb
	nA0GkEhT/2VBDrvZxNnPESaiWA==
X-Google-Smtp-Source: AGHT+IEz43yawVjhrxqnNMk6iyfDMI4iDYMuqIFY53Wlye7XTKPRNqTfYrwLiZ+92yarQakk8tsEGA==
X-Received: by 2002:a05:651c:229:b0:2c5:1553:9129 with SMTP id z9-20020a05651c022900b002c515539129mr1289691ljn.35.1697718095713;
        Thu, 19 Oct 2023 05:21:35 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id z16-20020a2e8e90000000b002c0414c3b6csm1085149ljk.121.2023.10.19.05.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 05:21:35 -0700 (PDT)
Date: Thu, 19 Oct 2023 15:21:33 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: support embedded SW
 components with different version number
Message-ID: <ZTEfTcgNMkUrITEG@nuoska>
References: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
 <CAApg2=SGxxCJ1yuXoMD6=ySRsL-Z2=rENw6xxn-dpQZ-Ta+4rA@mail.gmail.com>
 <ZTDzOs9PFGJUmIRG@nuoska>
 <CANPvuRn1q0a63ZWyYer8LP0htmo7cBwyX6LTv_=ipZFcJq3j9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANPvuRn1q0a63ZWyYer8LP0htmo7cBwyX6LTv_=ipZFcJq3j9Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 12:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189450

Hi,

On Thu, Oct 19, 2023 at 12:54:44PM +0100, Jose Quaresma wrote:
> Hi
> 
> This change will need some adaptations in the create-spdx.bbclass to handle
> this new variable with _PN

Good point. How does SPDX tooling handle embedded SW components in recipe sources?

I presume it does not because recipe and license don't handle it either. Should
there be a more generic PN_subpn, PV_subpn, LICENSE_subpn and matching CVE_PRODUCT
and CVE_VERSION? I don't have use cases for these currently. I would like to fix
the CVE reporting issues with embedded SW components though. mbedtls being one good
example.

Or would it be better to convert mbedtls users to use the meta-oe side recipe for it?

Additionally I don't currently read the SDPX output. I don't have use cases for it.
I do check recipes and their metadata like LICENSE though. Feels like the SDPX data
is used as reporting/export data format which is fed to some other tools which are
not open source.

Can of worms...

Cheers,

-Mikko

