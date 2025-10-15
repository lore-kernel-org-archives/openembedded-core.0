Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009CBCCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 17:22:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.23785.1760548930563240702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 10:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nXZqaxB0;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FHM6LE1903681;
	Wed, 15 Oct 2025 12:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760548926;
	bh=l76AjBMO4BiaTlk9eBUYFVdeYLRZwGxudU4W7bYDH6A=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=nXZqaxB0Bn3MSf1Rp/sODVBn8tIXgihCFS1ZWgP/EQW+ZjjBorbRTJaJNdWsLX1Uu
	 6Zs1+ZmBkDFRdFUxRLBRxP8qbASqBQQxX7/Lr13jX36CZvz5bgIIpz70eSf3/xV8D4
	 gD2PdXttsCfq3FzSNNokDRLbIfN/+kdgdSZnI/GE=
Received: from DLEE208.ent.ti.com (dlee208.ent.ti.com [157.170.170.97])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FHM6SQ1394028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 12:22:06 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 12:22:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 12:22:06 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FHM68D2339616;
	Wed, 15 Oct 2025 12:22:06 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Oct 2025 12:22:06 -0500
Message-ID: <DDJ2IB8W1DO5.L8IUVVXTRMSQ@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] sysvinit: create tmpfile dir for x11 domain
 socket
From: Randolph Sapp <rs@ti.com>
To: Ross Burton <Ross.Burton@arm.com>, "rs@ti.com" <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251007234809.435300-2-rs@ti.com>
 <FA907A20-0CE7-47B3-B38D-A627F8A96D2F@arm.com>
In-Reply-To: <FA907A20-0CE7-47B3-B38D-A627F8A96D2F@arm.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 17:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224902

On Wed Oct 15, 2025 at 9:37 AM CDT, Ross Burton wrote:
> On 8 Oct 2025, at 00:48, rs@ti.com wrote:
>>=20
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Register a volatile directory entry for the x11 domain socket when not
>> using systemd. This will make sure the directory is always created with
>> the correct permissions. Systemd already provides their own tmpfile.d
>> entry for the same behavior.
>
> We discussed this in the patch review call on Monday and concluded that i=
t
> definitely felt like it should be in the xserver recipe.

Sure.

>> Currently some x11 related applications will create this directory if it
>> doesn't already exist, but this is not true for everything. In addition,
>> if the application in question isn't started as root, it's possible this
>> directory can be owned by a non-root user. This isn't an issue by
>> itself, but it can potentially lead to problems in a multi-user
>> environment.
>
> Can you clarify what applications will create this directory and which wi=
ll
> not? Surely it=E2=80=99s the responsibility for the xserver to create the=
 sockets?
>
> Ross

Forgive me, as it's been quite some time since I initially tested this. I
believe during testing with the current default xsession managers will crea=
te it
but xwayland sessions will not. Given that systemd has determined they need=
 to
ship this as a global tmpfiles.d entry I assume there is more nuance to thi=
s
than what I have outlined.

- Randolph

