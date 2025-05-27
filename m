Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83982C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 22:16:43 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.2692.1748384200413266710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 15:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hSU4QXkn;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54RMGJCG1885509;
	Tue, 27 May 2025 17:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748384179;
	bh=T3E9T4pdyxCnduokJqGIbbP60bFPzLNiiK6uoimljAU=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=hSU4QXkn5nTwlBDUyIbl7ftz59hyXI/7v0aUxZOalgt4+HRdhEJjSTFoDUTngSY2/
	 B6kEH3nA6q1QWkpacEI8xPs9lo0uyhzQON8UoAiGg+J0bg1Hw9zfg9qTLiB/eRk4fS
	 3jzXyfbfOxcal5ebS4xsM0fakggvAcjYMG4gdTI0=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54RMGJ2B3157544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 27 May 2025 17:16:19 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 May 2025 17:16:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 May 2025 17:16:18 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54RMGIBn3706833;
	Tue, 27 May 2025 17:16:18 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 May 2025 17:16:18 -0500
Message-ID: <DA7AGREX7HJ9.33KJKYJPO1A3N@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv6 0/5] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250520233935.740242-1-rs@ti.com>
 <DA1YOI4L8TYX.ALF8S230UTO1@bootlin.com>
In-Reply-To: <DA1YOI4L8TYX.ALF8S230UTO1@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 22:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217322

On Wed May 21, 2025 at 10:58 AM CDT, Mathieu Dubois-Briand wrote:
> On Wed May 21, 2025 at 1:39 AM CEST, rs wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> We've recently run into some issues with weston-init attempting to start=
 Weston
>> prior to all drm devices being registered. There's not really a good, sc=
riptable
>> mechanism to listen in to device registration events that works with the
>> existing weston-init package. Well, at least one that doesn't involve po=
lling
>> files or introducing more dependency on the init system being used.
>>
>> I also see there is also a lot of scripting around starting X11,
>> xserver-nodm-init, that (from my limited review) should experience the s=
ame
>> issue.
>>
>> I'd like to introduce the following display manager for oe-core, emptty =
[1].
>> This display manager is, as described upstream, a "Dead simple CLI Displ=
ay
>> Manager on TTY". It supports both x11 and wayland sessions, with togglab=
le build
>> parameters to completely remove x11 and pam dependencies. It's licensed =
MIT,
>> which shouldn't be an issue for any users. (It is written in Go, if you =
have
>> opinions about that.)
>>
>> With this, both weston-init and the xserver-nodm-init packages can be re=
-tuned
>> to leverage this display manager and simply add a user and emptty config=
 for an
>> autologin session. This can resolve the current behavior across init sys=
tems
>> without additional scripting, and move some development out of this laye=
r.
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
>> v3:
>> 	- Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When running
>> 	  under QEMU the first auth attempt almost always fails.
>> v4:
>> 	- Add a tmpfile entry for the x11 domain socket directory.
>> 	- Remove some scripts associated with weston-init that were being
>> 	  shipped with weston
>> v5:
>> 	- Move tmpfile data to individual files
>> 	- Add explicit entries for these in the FILES variable
>> v6:
>> 	- Do not attempt to ship a tmpfiles.d entry in libx11
>>
>
> Hi Randolph,
>
> Thanks for the version, but again a previously seen error. Sorry for
> the bad news :(
>
> RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.31s)
> ...
> AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER =
      VSZ STAT COMMAND
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1637
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/1638
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1649
>
> I will drop the patch on my side, but I will keep the a-full build
> running, we might see some other failures in the coming hours:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1630

Ah, the auth failures persist. Normally this is caused when the user attemp=
ts to
login before the user account was created or something unusual like that. I
don't suppose there's any way this could be happening on the test machines?

I'm not able to reproduce this locally, but my build config is different. I=
 tend
to use oe-core and nodistro instead of poky. They aren't playing around wit=
h the
reproducible build date stuff or anything like that are they?

Well, I mean I did see this on occasion. The first login attempt almost alw=
ays
failed, but the subsequent attempts were fine. Bumping the attempt count ba=
ck up
the default (2) was enough to resolve it on my end, but evidently it's not
enough here.

This is not happening on hardware from what I'm seeing.

