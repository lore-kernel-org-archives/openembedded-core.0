Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871E1E7E379
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 11:31:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9817.1775215906376124362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 04:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=x4tHxRI5;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4177E1A3121;
	Fri,  3 Apr 2026 11:31:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16671603C1;
	Fri,  3 Apr 2026 11:31:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 987CD10451B78;
	Fri,  3 Apr 2026 13:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775215903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lmevFdBVWzNnYSrfZoacnhpTrZpvoasGu3BqhpQbLbw=;
	b=x4tHxRI5irc7vuOXx6twVuXR81493cDsKuIBsacRnOHVGXOmUKLE9smh0thIS1O4ATE62U
	Ts/AKwweSqkDrUSJl84PGhdaxZ1mTBaudy2MgeHsmu5RK+Aafdsb88XKhj/GDmeKH0ImG0
	Hjlq7e9JSxsmXJRw/DG15LK+E6A3SAEi2g7dGqN+yAzuWRJ6/8JZh4LCXZJQcqF9ndD4++
	GbZFsA8QTLLBj1LmWICas0nRI9sigHieOqqrMT9cbV3WwIG4xI9KPWA43dUknmVTLmUliv
	16Y8UPudOO1avw84A48VuzGYib18mIMDlIudvUOilsMM9qbvOU1tw6ZjXGLwHw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 13:31:42 +0200
Message-Id: <DHJHIMYYUTH6.16YUU1V7MJZY@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/4] package_pkgdata: fix typo to stop
 calling undefined function
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Adam Blank" <adam.blank.g@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
 <20260402-dead_code_and_unification-v2-2-259169372299@gmail.com>
 <DHJD0XSTONE6.2ZXL04SBPR664@bootlin.com>
 <CAFAffzx7EdXXEudpQGCgSA-1M7aDDwMuRLW+Dta5urcmVx_yWg@mail.gmail.com>
In-Reply-To: <CAFAffzx7EdXXEudpQGCgSA-1M7aDDwMuRLW+Dta5urcmVx_yWg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234581

On Fri Apr 3, 2026 at 12:32 PM CEST, Adam Blank wrote:
> Hmmm, can't see any connection between those tests and this particular
> patch...
> The thing is, that since the patch fixes a call to an undefined function,
> there could not have been a test covering this case in the first place ;-=
)
> In addition, the function call takes place only in the 'bitbake -b' case.=
..
>
> Where can it be found, which other changes took place in those builds?
>
> On Fri, 3 Apr 2026 at 10:00, Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>

The tested branch can be found here:
https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.yo=
ctoproject.org/valkyrie/a-full-3579

But I confirm git bisect points to this commit, and the error is gone
after a revert. You can easily reproduce the issue on your side:
oe-selftest -r sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


