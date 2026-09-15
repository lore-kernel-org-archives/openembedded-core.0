Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF06C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 13:23:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23064.1789478582659923330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 06:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yISWZvFC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 60F1B4E405F3;
	Tue, 15 Sep 2026 13:23:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3478C60498;
	Tue, 15 Sep 2026 13:23:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65C7511C7AFF3;
	Tue, 15 Sep 2026 15:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789478575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2TE6bRuTOPtsIzHx22Yd/ieyj1+t0dM7lJ2a/JLAFVs=;
	b=yISWZvFCerx75m2nhCA9i+Qefi3SDQIgleAUv9EFx9YZcMQHqsyz6qjXmNd7xOctxllC3f
	qKloZ+MCa9CSGMJQVpDMp3cIwSSipMQzhvzzyD7V6q9mY+OjRkDeAvYqptOl1HZ4FJwU/2
	IOA39zdmnSrw8YCs9VmPf75tkayJkIyxbXwbEqOeOxcrDG9gSaaabdhpbuZLbpafEDmnAN
	8vl9NmvgoFO+0VHPVp/dAa4m19aiGUS/FJz5rXWflb0qajfwUv3Ye/HOy8q3osMKc1/8PI
	JNzUfGwJButAw3wyRLVp3c4vVgqWvnbFK4iDmfJCJiNfx2F62Qg+Ne4n5uDZDg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 15:22:53 +0200
Message-Id: <DLFX7NYAA4GM.WL30OCNY86BL@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v1] psmisc: add ptest support
Cc: <pratik.farkase@ericsson.com>
References: <20260914130447.107189-1-pratik.farkase@est.tech>
In-Reply-To: <20260914130447.107189-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 13:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245841

Hi,

On Mon Sep 14, 2026 at 3:04 PM CEST, Pratik Farkase wrote:
> Add ptest support using psmisc's upstream DejaGnu testsuite, which
> exercises killall, pslog and fuser via their .exp scripts. The tools and
> the testsuite helper programs (socket_test, test-listen) are installed
> under a src/ layout so the scripts' ${topdir}src/<tool> paths resolve on
> target.

I'm seeing failures for these ptest on our test infrastructure:

AssertionError:=20
Failed ptests:
{'psmisc': ['fuser_-a_no_proc', 'fuser_-av,_no_proc', 'fuser_-va,_no_proc']=
}

Full log: https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8929945=
/raw_inline

Similar failures:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4533
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4560

Can you have a look at these?

Thanks,
Antonin

