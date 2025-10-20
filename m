Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F2ACCD1A2
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 21:30:44 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4026.1760995842131725807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 14:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pHxkrdQo;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59KLUccv995482;
	Mon, 20 Oct 2025 16:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760995838;
	bh=TqrIu6uKBAhq/toGIjgh3G9wYs9yNoMTRLKlJO5ACzY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pHxkrdQoeyglFki+BmOfz5Y73C0azoltOIoWE/LUsxKGqYUk54Xd6NBh2sI3ERep1
	 QfxqkxymyNj+ellnYg7IB8MKE6QYNanvgSwvW4McOa7SwF9oKwBRp/xGYGokAWPf3d
	 AgOiL7sfgRg0GulnU1pXzDm0qyq3+ThWNrFe5ogw=
Received: from DLEE215.ent.ti.com (dlee215.ent.ti.com [157.170.170.118])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59KLUckK726830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Oct 2025 16:30:38 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 16:30:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 16:30:37 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59KLUb9W2644173;
	Mon, 20 Oct 2025 16:30:37 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Oct 2025 16:30:37 -0500
Message-ID: <DDNGXBPJ11C6.3UNJJ4FUT0JBG@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] sysvinit: create tmpfile dir for x11 domain
 socket
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251007234809.435300-2-rs@ti.com>
 <FA907A20-0CE7-47B3-B38D-A627F8A96D2F@arm.com>
 <186EB9ECC2726DB8.13861@lists.openembedded.org>
 <186F6CDD2E45611C.1873@lists.openembedded.org>
In-Reply-To: <186F6CDD2E45611C.1873@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 21:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225134

On Fri Oct 17, 2025 at 7:01 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> On Wed Oct 15, 2025 at 12:22 PM CDT, Randolph Sapp via lists.openembedded=
.org wrote:
>> On Wed Oct 15, 2025 at 9:37 AM CDT, Ross Burton wrote:
>>> On 8 Oct 2025, at 00:48, rs@ti.com wrote:
>>>>=20
>>>> From: Randolph Sapp <rs@ti.com>
>>>>=20
>>>> Register a volatile directory entry for the x11 domain socket when not
>>>> using systemd. This will make sure the directory is always created wit=
h
>>>> the correct permissions. Systemd already provides their own tmpfile.d
>>>> entry for the same behavior.
>>>
>>> We discussed this in the patch review call on Monday and concluded that=
 it
>>> definitely felt like it should be in the xserver recipe.
>>
>> Sure.
>>
>
> I am a little bummed that we don't want to have symmetry between init sys=
tem
> packages though. Gonna need a gross "VIRTUAL-RUNTIME_init_manager" check
> to make sure we don't clash with tmpfiles.d entry.
>
>>>> Currently some x11 related applications will create this directory if =
it
>>>> doesn't already exist, but this is not true for everything. In additio=
n,
>>>> if the application in question isn't started as root, it's possible th=
is
>>>> directory can be owned by a non-root user. This isn't an issue by
>>>> itself, but it can potentially lead to problems in a multi-user
>>>> environment.
>>>
>>> Can you clarify what applications will create this directory and which =
will
>>> not? Surely it=E2=80=99s the responsibility for the xserver to create t=
he sockets?
>>>
>>> Ross
>>
>> Forgive me, as it's been quite some time since I initially tested this. =
I
>> believe during testing with the current default xsession managers will c=
reate it
>> but xwayland sessions will not. Given that systemd has determined they n=
eed to
>> ship this as a global tmpfiles.d entry I assume there is more nuance to =
this
>> than what I have outlined.
>>
>> - Randolph
>
> Ah, now I remember, all rootless X sessions also have the capability of
> generating this socket directory with the wrong owner, given that the ser=
ver may
> try to make the directory after it's already dropped to user permissions.=
 It's
> normally fine because they throw 777 at it. Not great, but whatever.
>
> - Randolph

Are we still dead set on splitting this into both xwayland and xorg-xserver=
 and
conditionally masking it based on whether or not systemd is selected? Feels=
 odd.

