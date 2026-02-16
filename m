Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC52E63F31
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 06:51:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14592.1771224716217014070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 22:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=a89WhUh4;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D1F0BC17B47
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 06:52:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7FCB606CF;
	Mon, 16 Feb 2026 06:51:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CD95102F1D2B;
	Mon, 16 Feb 2026 07:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771224713; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Po4I0Ccwjnu+AyGc7zW7Gx9CAGQxS9c+18LR8f6WFnY=;
	b=a89WhUh4WPCMYxwNBi+KeFLqjIkL8Aq3mg+546ZX6Uj06koidj2Aaijap8zlqeYJVh4Iby
	scr8irzGyI3qEM5VgFsVPWUA941gOmI/4D9Px0wJYBB3Brk9RMdqvuf6+V0VWZcRTaMTsk
	KjqOhdTn7IpAFQTjVSugJ6xzp3+wgjUTchxloEq0xikQaRicBZsPLNOqobb0w6oMNUyYsH
	+HxVZ9zSh/tJh1CmFgWpFIbjJ5efuyDTAoSiVW5WWsNNbhVMimmhTq+b/29IGYTId9xcnk
	0qVoypOL7juUQFvGvDnyNkJKvaJGTQ5u8L/kPJPveMMIxIkIeycW2WwiKgcA/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 07:51:52 +0100
Message-Id: <DGG6RBRHEHWH.3AZ2ZBL0IW4NP@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd: Stop supporting sysvinit
 compatibility
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260213175618.1801591-1-richard.purdie@linuxfoundation.org>
 <DGFOGZFG9RCO.2210182JJUNRG@bootlin.com>
 <1671a6263c305f54398e74a0a826387f343bbe34.camel@linuxfoundation.org>
In-Reply-To: <1671a6263c305f54398e74a0a826387f343bbe34.camel@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 06:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231181

On Sun Feb 15, 2026 at 6:03 PM CET, Richard Purdie wrote:
> Hi Mattieu,
>
> On Sun, 2026-02-15 at 17:32 +0100, Mathieu Dubois-Briand wrote:
>> On Fri Feb 13, 2026 at 6:56 PM CET, Richard Purdie via lists.openembedde=
d.org wrote:
>> > Systemd has worked with sysvinit compatibility but upstream plans to r=
emove
>> > this and hence we will no longer be able to support it. We need to rem=
ove this
>> > before the LTS since the support will certainly not be there for the l=
ifetime
>> > of the LTS.
>> >=20
>> > This patch disables that usage mode and removes some of the compatibil=
ity logic.
>> > There is more that can be removed, this is meant just to signal to peo=
ple it is
>> > no longer supported and start that process. Further cleanup can be mad=
e over time
>> > in later commits.
>> >=20
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>=20
>> I suspect we also want to remove the "Systemd with sysvinit compat" and
>> "Sysvinit with systemd" steps from qa-extras2:
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/3165
>> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n=
1562
>
> Yes, that is on my todo list! I knew we had a few tests to remove, I
> think that is the only one I haven't patched yet. Thankfully an easy
> tweak for a change.
>
> Cheers,
>
> Richard

Just in case: I also noted following selftests:

bbclasses.Systemd.test_systemd_and_sysvinit_in_distro
overlayfs.OverlayFSTests.test_not_all_units_installed
overlayfs.OverlayFSTests.test_not_all_units_installed_but_qa_skipped

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


