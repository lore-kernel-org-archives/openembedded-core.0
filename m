Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD39CC5DF85
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 13:13:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8631.1787058814276985837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 06:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qbc6wGfO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E15CC4E412AC
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 13:13:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A78D460355;
	Tue, 18 Aug 2026 13:13:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E3FE11C70518;
	Tue, 18 Aug 2026 15:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787058807; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xdo2isuqP+Axo+zh1sGKT4WY8uk35y5bkwfZ0o0ogVA=;
	b=qbc6wGfOzHFeh41VEeLA/HMiyokWK58fGga1Oq5qLXLdGTiQ5d+8cqj0I5bkkIOa9G8G93
	B2U+pA85kR01XXk17v7+zhvZq/P2oCWpNWcM1ib3EoSj9DdlEGDafIUlMLJ7XMi4STA7NA
	wClm8w4aVcwDH32JNr/MfX2ppkFtfdhOV/semLC3/JVTY1nI+8Iv/n9jQFMmRXNQfGtV8P
	jq1fC7S+Ms9PgnKyvUDisY4b4dRVT2tMjjbw+Ci6qVDUGf/syUexitXNJZcDRe/jX3XGDX
	+CRxou13FitI0kDiU17uaur4dPuqiiH9Q2dNVTURyiUXUNnVehqH6COxlj4f5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 15:13:25 +0200
Message-Id: <DKS3H5V66DML.S0T04UJ1AEW4@bootlin.com>
Subject: Re: [OE-core] [PATCH] python3-pygments: update 2.20.0 -> 2.21.0
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260817-update-pygments-v1-1-da836eab9640@bootlin.com>
 <DKRTRX9N7CAV.1AZXJ5P8QS36Z@bootlin.com>
 <DKRWWL8NYSSQ.2TTCOYTRP2AO7@bootlin.com>
 <bd1815271e8babc6248563bb7b8da5adecfe55a0.camel@linuxfoundation.org>
In-Reply-To: <bd1815271e8babc6248563bb7b8da5adecfe55a0.camel@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 13:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243681

Hi,

On Tue Aug 18, 2026 at 2:18 PM CEST, Richard Purdie via lists.openembedded.=
org wrote:
[...]
>> I don't really understand it yet, the issue is always the same it seems:
>>=20
>> =C2=A0 '"/usr/lib/python3.14/site-packages/pygments/util.py", '
>> =C2=A0 'line 13, in <module>\n'
>> =C2=A0 '=C2=A0=C2=A0=C2=A0 import html\n'
>> =C2=A0 "ModuleNotFoundError: No module named 'html'\n"
>>=20
>> Yet the html module is provided by python3, and does show up in
>> python3-pygments' sysroot when I build it:
>>=20
>> tmp/work/cortexa57-oe-linux/python3-pygments/2.21.0/recipe-sysroot/usr/l=
ib/python3.14/html/
>
> Those are ptest runtime errors (i.e. an image booted under qemu) so
> probably a missing RDEPENDS on a python module somewhere...

You're right. I didn't realise the html module was packaged separately
(python3-html). Adding the runtime dependency fixes the issue for me. Thank=
s! v2
incoming.

Antonin

