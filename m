Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD2AC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 23:03:53 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.1097.1746572626711201913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 16:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=B1Bw/4xf;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546N3Wdo641705
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 18:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746572613;
	bh=6ie61Dfkcf34VIublew4FfWfmUKShe2lqvIwccXr9Q0=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=B1Bw/4xf72Fyb1SH1k9T+LbnnChZNwDmvu4RVnCegWatf2OHmIfiMGdZOUEU2Vn1u
	 PfpG+Qw69QRPT1MA9VlHQzDViTFjh233i0RmwbTAip1Ed22PjaD/FD1Z8uhTrUlzkS
	 29NymMhtV9fIgDdWQ7gFR2jy/yx9lyNO0LsL2400=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546N3WgK102815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 18:03:32 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 18:03:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 18:03:32 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546N3WkJ102992;
	Tue, 6 May 2025 18:03:32 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 6 May 2025 18:03:32 -0500
Message-ID: <D9PGBHDAZ7RF.16SWU58NCK9NV@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv2 0/3] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250505224801.3181046-1-rs@ti.com>
 <D9OWUBHID8JT.3FJEJAXYPMT2W@bootlin.com>
In-Reply-To: <D9OWUBHID8JT.3FJEJAXYPMT2W@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 23:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216085

On Tue May 6, 2025 at 2:47 AM CDT, Mathieu Dubois-Briand wrote:
> On Tue May 6, 2025 at 12:47 AM CEST, rs wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> We've recently run into some issues with weston-init attempting to start
>> Weston prior to all drm devices being registered. There's not really a
>> good, scriptable mechanism to listen in to device registration events
>> that works with the existing weston-init package. Well, at least one
>> that doesn't involve polling files or introducing more dependency on the
>> init system being used.
>>
>> I also see there is also a lot of scripting around starting X11,
>> xserver-nodm-init, that (from my limited review) should experience the
>> same issue.
>>
>> I'd like to introduce the following display manager for oe-core, emptty
>> [1]. This display manager is, as described upstream, a "Dead simple CLI
>> Display Manager on TTY". It supports both x11 and wayland sessions, with
>> togglable build parameters to completely remove x11 and pam
>> dependencies. It's licensed MIT, which shouldn't be an issue for any
>> users. (It is written in Go, if you have opinions about that.)
>>
>> With this, both weston-init and the xserver-nodm-init packages can be
>> re-tuned to leverage this display manager and simply add a user and
>> emptty config for an autologin session. This can resolve the current
>> behavior across init systems without additional scripting, and move some
>> development out of this layer.
>>
>> This lists myself as a maintainer of emptty as well as xserver-nodm-init=
 and
>> xuser-account since these are currently unassigned and I've reworked the=
m
>> significantly here.
>>
>> Sorry for the delay on this series. I found a few bugs in emptty that I =
wanted
>> to address before submitting this officially.
>>
>> [1] https://github.com/tvrzna/emptty
>>
>> v2:
>> 	- Address spelling issues in commit messages
>> 	- Attempt to resolve some test related issues with weston
>> 	- Add additional logs to X11 related tests
>
> Hi Randolph,
>
> Thanks for the v2.
>
> However, it looks like we still have an error with the emptty
> dependency:
>
> ERROR: Nothing RPROVIDES 'emptty' (but /srv/pokybuild/yocto-worker/qemux8=
6-64-x32/build/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb RD=
EPENDS on or otherwise requires it)
> emptty was skipped: incompatible with host x86_64-poky-linux-gnux32 (not =
in COMPATIBLE_HOST)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/1512
>
> Can you have a look at the issue please?

Ah, this is the first I hearing about the gnux32 triplet. Well, that is bei=
ng
filtered out by COMPATIBLE_HOST in the goarch bbclass. Some of those values=
 seem
to be invalid now (powerpc64 is supported upstream). That being said, I don=
't
see any mention of the new x32 ABI upstream. Not entirely sure how to addre=
ss
that at the moment.

