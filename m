Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D74BCAC5B5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 22:30:16 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.3969.1758839408912456005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 15:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Q+C5pU5s;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PMThRP2016167;
	Thu, 25 Sep 2025 17:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758839383;
	bh=fBT1kioxFv/IMs2e4drbIx1uPZCmyTwu4nA80B//HTo=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=Q+C5pU5sRgcHytzZJHql83ejwcID6emiJumX0pDYCG/cKkUy5R6VQFYDHoU6FNuy3
	 NgCC57bIzBmGhNS+Bv+ve7c+x722LNiBmrgUDUxq3llaxC4tKbpoonBSkDmJlEcWub
	 /agH81OVpwZH7f5ixRKSeGdiAma96bRIcsK+9F5o=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PMThpK3524615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 17:29:43 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 17:29:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 17:29:42 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PMTg5N270649;
	Thu, 25 Sep 2025 17:29:42 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 25 Sep 2025 17:29:42 -0500
Message-ID: <DD28IXWGNHNT.6IKBTTAPS0YG@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv10 7/7] xuser-account: merge with
 xserver-nodm-init
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Richard Purdie <richard.purdie@linuxfoundation.org>,
        <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
        <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250923225150.2407390-1-rs@ti.com>
 <20250923225150.2407390-8-rs@ti.com>
 <2868d1ad803cb9d135c09104470c0614a7cd2f17.camel@linuxfoundation.org>
 <18680DB08C963B21.19236@lists.openembedded.org>
In-Reply-To: <18680DB08C963B21.19236@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 22:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224049

On Tue Sep 23, 2025 at 6:38 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> On Tue Sep 23, 2025 at 5:57 PM CDT, Richard Purdie wrote:
>> On Tue, 2025-09-23 at 17:51 -0500, rs@ti.com wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>=20
>>> Merge the xuser-account recipe with xserver-nodm-init, since:
>>>=20
>>> =C2=A0- This is the only recipe dependent on it
>>
>> This is not a good reason to merge them. The reason they were kept
>> separate was so that people could replace the user with their own user
>> setup whilst reusing the xserver init code (or vice versa).
>
> Sure, but now this is all encompassed by the virtual-emptty-conf provider=
s, as
> the conf dictates what user is to be automatically logged in. This conf n=
eeds to
> be kept in sync with whatever user is submitted.

Richard, did this point make sense? Are you still in favor of keeping the u=
ser
and display manager config separate?

> If people want to forgo managing the conf and just manage their own users=
 then
> they can just set the preferred rprovider for virtual-emptty-conf to empt=
ty-conf
> and add their own users in their own recipes. This will give them the des=
ktop
> like experience where they are greeted with a console login prompt and se=
ssion
> picker on tty7.
>
> I guess this also means that the x-session-manager recipes should be upda=
ted to
> provide their desktop files for their sessions instead of us doing that i=
n
> xserver-nodm-init though. I may need to address that in another revision.
>
>>> =C2=A0- This matches the current behavior in weston-init
>>> =C2=A0- Running x11 as root is no longer a supported path in
>>> =C2=A0=C2=A0 xserver-nodm-init
>>
>> Does rootless X work everywhere now?=20
>>
>> Cheers,
>>
>> Richard
>
> Uh, that's a good question. I didn't think there were any particular usec=
ases
> left that were limited by rootless X. It's been a desktop thing for so lo=
ng now
> the only issues I remember were specifically around the way the handoff t=
o the
> user account occurred.
>
> Gentoo cites the difference between using a login manager / display manag=
er vs
> the old suid scheme as being problematic for remote start depending on ho=
w seat
> management is handled. We didn't seem to be relying on that behavior so I=
 want
> to say it's fine.
>
> - Randolph


