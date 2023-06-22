Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3DBEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:06:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15587.1687449982236437348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FSv9elqS;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MG6Hr5058248;
	Thu, 22 Jun 2023 11:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687449977;
	bh=Picd1SklwEpy7WHHIC5Jxp/GQEsKhL1YpHF7bwHmYd8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FSv9elqSc6wwu8zpv2LHXG6RmO5D6ISv/q2PHf6ED6e7NOtQgue82DQWqFnvLoXPP
	 C1CgzqL3/DqRU76InAWm3m09SRiYRdQgzOBH+VdrhJ2ZWUZY9axHeLhKmdsxm4g5Np
	 YAAxsiAsTCHEi+97g6fTKsxTbDHT+VT67HbU3TpI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MG6HB6027351
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 11:06:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 11:06:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 11:06:17 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MG6H2o001448;
	Thu, 22 Jun 2023 11:06:17 -0500
Message-ID: <b0476eb9-431c-4d22-8150-4de2eab6edf1@ti.com>
Date: Thu, 22 Jun 2023 11:06:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-Core][kirkstone][PATCH 0/8] Backport all weston-init qol
 updates
Content-Language: en-US, en-US-large
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>,
        Steve Sakoman <steve@sakoman.com>
CC: <s-adivi@ti.com>, <c-shilwant@ti.com>
References: <20230615210420.725559-1-rs@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230615210420.725559-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183262

On 6/15/23 16:04, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Backport all the weston-init QOL updates. Getting closer to the point
> where we can actually drop our distro specific weston-init bbappend. May
> submit a few more QOL patches sooner or later to completely drop it.
> 
> Ming Liu (1):
>    weston-init: introduce xwayland PACKAGECONFIG
> 
> Randolph Sapp (6):
>    weston-init: make sure the render group exists
>    weston-init: add weston user to the render group
>    weston-init: add the weston user to the wayland group
>    weston-init: fix the mixed indentation
>    weston-init: guard against systemd configs
>    weston-init: add profile to point users to global socket
> 
> ssuesens (1):
>    weston.init: enabled xwayland
> 
>   meta/recipes-graphics/wayland/weston-init.bb  | 53 ++++++++++++-------
>   .../wayland/weston-init/weston-socket.sh      | 20 +++++++
>   2 files changed, 53 insertions(+), 20 deletions(-)
>   create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh
> 

Rats. Sorry Steve, forgot to CC you on this series. Need me to resubmit it?

