Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE90CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 17:21:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1382.1759771295871221089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 10:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZDYN4eXB;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596HLN5D4105139;
	Mon, 6 Oct 2025 12:21:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759771283;
	bh=G0Sw+VJMjSfWncGjmRfy+xsOFiodjj0JZPig3aScjRo=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=ZDYN4eXBFXJJM63tVnj1Ze3vijOAlNCpU7thC7SUtwxstoNMA6hXwk2T/50c7WfHE
	 C4hsy8oTO5K13GlFvQsyyc1PKLH/6q2d+ZyoMnppysrq65e6RD/OUl2SbeWxPgtdDR
	 PkioAw2cjfWo87HshUgwAGR0aTKZdcBHv43TuaHM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596HLNV62997040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 6 Oct 2025 12:21:23 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 12:21:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 12:21:23 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596HLNCv3781422;
	Mon, 6 Oct 2025 12:21:23 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 6 Oct 2025 12:21:23 -0500
Message-ID: <DDBEUV3YD4MO.2KQ3UC10EUWFZ@ti.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] libx11: create tmpfile dir for x11 domain
 socket
From: Randolph Sapp <rs@ti.com>
To: Ross Burton <Ross.Burton@arm.com>, "rs@ti.com" <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251002003034.344992-1-rs@ti.com>
 <CE558C16-AD4F-401B-9734-E57067101F56@arm.com>
In-Reply-To: <CE558C16-AD4F-401B-9734-E57067101F56@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 17:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224500

On Mon Oct 6, 2025 at 5:38 AM CDT, Ross Burton wrote:
> On 2 Oct 2025, at 01:30, rs@ti.com wrote:
>>=20
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Register a volatile directory entry for the x11 domain socket when not
>> using systemd. This will make sure the directory is always created with
>> the correct permissions. Systemd already provides their own tmpfile.d
>> entry for the same behavior.
>>=20
>> Currently some x11 related applications will create this directory if it
>> doesn't already exist, but this is not true for everything. In addition,
>> if the application in question isn't started as root, it's possible this
>> directory can be owned by a non-root user. This isn't an issue by
>> itself, but it can potentially lead to problems in a multi-user
>> environment.
>
> Feel like this should be in xserver (as the xserver is the one creating t=
he sockets), not libx11.
>
> Ross

Fair enough. That got me thinking though, with potentially multiple xserver
providers, and systemd already shipping it's own version of that tmpfiles e=
ntry,
should this instead be part of sysvinit? If anything, just to be symmetric?

- Randolph

