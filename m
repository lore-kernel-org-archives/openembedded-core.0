Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274FECA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 07:53:09 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web10.14637.1755676380198800482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 00:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=W2Q1BrX+;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=3209dcacb=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1755676380; x=1787212380;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R7LDM8G41JxN67IXeVODi4BTeEAxHywUonaImgINGxY=;
  b=W2Q1BrX+TikLFrMIlMmr2Q/Q9vLHEmcdBJYahH2flwDt9XnmkKDV9/zK
   ETv7vhdl3QfUpTZ24oZt9Ij9HUlitt1lFR4BLgRBME6+JbPlOO9rFmoQP
   bNypQ6U86tK74gToO4iVOVK0cRw82g2PxfYtOzWq/F6rmh8gD3VLe/DvK
   M=;
X-CSE-ConnectionGUID: U0n1iA8hRGeFRQ/0Xidgig==
X-CSE-MsgGUID: XfsXKeQjRJahB5Vk9XsAYw==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 20 Aug 2025 09:52:57 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw2.muc with
 ESMTP/TLS; 20 Aug 2025 09:52:57 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb6.muc with ESMTP/TLS; 20 Aug 2025 09:52:57 +0200
Received: from [10.242.8.36] (10.30.85.213) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Wed, 20 Aug 2025 09:52:57 +0200
X-CSE-ConnectionGUID: X1oeOVQeQNOCbCYDlzUM/Q==
X-CSE-MsgGUID: qjCnJTDsTfKTNne/V6Piyg==
X-CSE-ConnectionGUID: a4YB2UCdTG22dQsFd/u0LQ==
X-CSE-MsgGUID: 1joT9NvER/isLN1jTOaBIQ==
Message-ID: <878b5aca-397c-49db-b45b-c77de3627330@bmw.de>
Date: Wed, 20 Aug 2025 09:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] insane: Improve patch
 warning/error handling
To: Steve Sakoman <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20250815094509.3034151-1-philip.lorenz@bmw.de>
 <CAOSpxdbT1VigkVchb3SroTCYA0kPhMGDiKd179zJf7o6Ku6tMQ@mail.gmail.com>
Content-Language: en-US
From: Philip Lorenz <philip.lorenz@bmw.de>
In-Reply-To: <CAOSpxdbT1VigkVchb3SroTCYA0kPhMGDiKd179zJf7o6Ku6tMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: smucmp16f.europe.bmw.corp (2a03:1e80:a15:58f::1:148) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 07:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222160

Hi Steve,

On 19.08.25 18:42, Steve Sakoman wrote:
> This patch set is causing warnings for various non-oe-core layers used
> in autobuilder testing:
>
> meta-intel
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/41/builds/2086/steps/12/logs/warnings
>
> meta-virtualization
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/89/builds/2099/steps/12/logs/warnings
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/89/builds/2099/steps/16/logs/warnings
>
> meta-agl
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/55/builds/2088/steps/13/logs/warnings
>
> meta-gplv2
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/33/builds/1299/steps/11/logs/warnings
>
> I'm not inclined to take this patch set since it is adding a lot of
> noise to my testing.
>
> If you submit patches for those layers to deal with the above issues,
> or work with the layer maintainers to fix them I am happy to
> reconsider.

One alternative idea: I can also drop the addition of 
patch-status-noncore to WARN_QA which avoids raising these warnings for 
layers (which would have been the better choice to begin with as this 
ultimately avoids any behaviour changes in the default configuration). 
Given that the warning merely informs about missing metadata in patch 
files and this missing metadata was already added to the layers when the 
QA check was merged to master I'd argue that patching all those layers 
will just introduce noise with very limited benefit. Does removing it 
from WARN_QA sound sensible to you?

The rationale for backporting this to kirkstone is to make sure that 
patch-fuzz QA issues, when classified as errors, actually abort the task 
(and therefore no longer create a sstate cache entry). Otherwise the QA 
issue will be bypassed as long as the sstate cache entry remains 
available and only reappear once the offending recipe is rebuilt.

Thanks,

Philip

-- 
Philip Lorenz
BMW Car IT GmbH, Software-Plattform, -Integration Connected Company, Lise-Meitner-Straße 14, 89081 Ulm
-------------------------------------------------------------------------
BMW Car IT GmbH
Management: Michael Böttrich, Chris Brandt, Christian Salzmann
Domicile and Court of Registry: München HRB 134810
-------------------------------------------------------------------------


