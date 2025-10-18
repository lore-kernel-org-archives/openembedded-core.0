Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9323ECCD184
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 00:01:25 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.6526.1760745676123526765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 17:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X5QIXjnt;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59I01CpB2480160;
	Fri, 17 Oct 2025 19:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760745672;
	bh=BZj0ri1y5O50oqjWqW0/3X92IwLkAADaCUsYUdq2IwY=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=X5QIXjnt7F9tck0cKM6DoUC9IewI4lui6Ee7B03Yhwh8QL2XytK7kMRjMDOXiStge
	 3vATRPScAagZUghgxWytUEb8pL3yMQxKHUgt/QJNtmn1JLcnL5moQFF+FkUDqacOGN
	 YM7sRoTqDDn/PdobOtzRz6AgjCew3JpUoth/WHxI=
Received: from DLEE211.ent.ti.com (dlee211.ent.ti.com [157.170.170.113])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59I01Cgd2760672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Oct 2025 19:01:12 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 19:01:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 19:01:11 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59I01BdF2066611;
	Fri, 17 Oct 2025 19:01:11 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Oct 2025 19:01:11 -0500
Message-ID: <DDL08YXMD0E7.BI7D2M6H4P10@ti.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] sysvinit: create tmpfile dir for x11 domain
 socket
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Ross Burton <Ross.Burton@arm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251007234809.435300-2-rs@ti.com>
 <FA907A20-0CE7-47B3-B38D-A627F8A96D2F@arm.com>
 <186EB9ECC2726DB8.13861@lists.openembedded.org>
In-Reply-To: <186EB9ECC2726DB8.13861@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 00:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225070

On Wed Oct 15, 2025 at 12:22 PM CDT, Randolph Sapp via lists.openembedded.o=
rg wrote:
> On Wed Oct 15, 2025 at 9:37 AM CDT, Ross Burton wrote:
>> On 8 Oct 2025, at 00:48, rs@ti.com wrote:
>>>=20
>>> From: Randolph Sapp <rs@ti.com>
>>>=20
>>> Register a volatile directory entry for the x11 domain socket when not
>>> using systemd. This will make sure the directory is always created with
>>> the correct permissions. Systemd already provides their own tmpfile.d
>>> entry for the same behavior.
>>
>> We discussed this in the patch review call on Monday and concluded that =
it
>> definitely felt like it should be in the xserver recipe.
>
> Sure.
>

I am a little bummed that we don't want to have symmetry between init syste=
m
packages though. Gonna need a gross "VIRTUAL-RUNTIME_init_manager" check
to make sure we don't clash with tmpfiles.d entry.

>>> Currently some x11 related applications will create this directory if i=
t
>>> doesn't already exist, but this is not true for everything. In addition=
,
>>> if the application in question isn't started as root, it's possible thi=
s
>>> directory can be owned by a non-root user. This isn't an issue by
>>> itself, but it can potentially lead to problems in a multi-user
>>> environment.
>>
>> Can you clarify what applications will create this directory and which w=
ill
>> not? Surely it=E2=80=99s the responsibility for the xserver to create th=
e sockets?
>>
>> Ross
>
> Forgive me, as it's been quite some time since I initially tested this. I
> believe during testing with the current default xsession managers will cr=
eate it
> but xwayland sessions will not. Given that systemd has determined they ne=
ed to
> ship this as a global tmpfiles.d entry I assume there is more nuance to t=
his
> than what I have outlined.
>
> - Randolph

Ah, now I remember, all rootless X sessions also have the capability of
generating this socket directory with the wrong owner, given that the serve=
r may
try to make the directory after it's already dropped to user permissions. I=
t's
normally fine because they throw 777 at it. Not great, but whatever.

- Randolph

