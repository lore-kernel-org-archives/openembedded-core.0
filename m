Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CE7C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 13:48:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6263.1784123325813132533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 06:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=C2kvqkrJ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 907844E40DC1
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:48:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A7736035C;
	Wed, 15 Jul 2026 13:48:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B04711BD1518;
	Wed, 15 Jul 2026 15:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784123323; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8OEWf1czj1oQ8gYop1ZV+BbkOiI+H4kAthGgYYt4tJ0=;
	b=C2kvqkrJ926cRYtr8ha6KbYuqmFd3CRuWwjS373hw6/FEqYr3TI4Vg+FUsDYdcm2pZX2HF
	8CB4yJZQIGUNbAIgTZ7qfd98Bj8i4ubUpq2maOOjJatNAPLi2vFqYazwOqRVzjB1D7nVly
	7BnSUoSBLnBwfFqOIwiEDaUEgC887eZg36MW1n7QDBx7oVwKuEK89OhDqhQIBVXjtQpxQy
	hCkNMG2e3k1hj875DNRa0NMPAfTabdXF2PyzBhcpCD8iyvJ5/AD2SMegdPTb/Fr0Gj4dyr
	UTtaLNbxwFg6lrfmFgF3GYaowazZOBvOiWeoN9S6Abnt6XrTv22C0AglNmH0/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 15:48:40 +0200
Message-Id: <DJZ6XMICUYAK.1U6TMONPZO9YJ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mark.yang@lge.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/3] module.bbclass/make-mod-scripts:
 inhibit default dependencies
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260714132642.2225115-1-mark.yang@lge.com>
 <20260714132642.2225115-3-mark.yang@lge.com>
 <DJZ434ABE440.139ZCYRQH7UM9@bootlin.com>
In-Reply-To: <DJZ434ABE440.139ZCYRQH7UM9@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240956

On Wed Jul 15, 2026 at 1:34 PM CEST, Mathieu Dubois-Briand wrote:
> On Tue Jul 14, 2026 at 3:26 PM CEST, mark.yang via lists.openembedded.org=
 wrote:
>> From: "mark.yang" <mark.yang@lge.com>
>>
>> Modules and make-mod-scripts build against the shared kernel build
>> tree with the kernel toolchain, so the default virtual/libc and
>> virtual/compilerlibs dependencies are unused. Inhibit them and add
>> the cross toolchain explicitly, as kernel.bbclass does, which also
>> keeps compiler-rt and libcxx out of module builds with clang.
>>
>> Signed-off-by: mark.yang <mark.yang@lge.com>
>> ---
>
> Hi Mark,
>
> Thanks for your patch.
>
> We get this error during selftests:
>
> 2026-07-15 07:01:52,991 - oe-selftest - INFO - bbtests.BitbakeTests.test_=
non_gplv3 (subunit.RemotedTestCase)
> 2026-07-15 07:01:52,992 - oe-selftest - INFO -  ... FAIL
> ...
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'virtual/compilerlibs' (but /srv/pokybuild/yocto-=
worker/oe-selftest-fedora/build/build-st-1131783/meta-selftest/recipes-test=
/selftest-ed/selftest-ed_1.20.2.bb DEPENDS on or otherwise requires it)
> gcc-runtime PROVIDES virtual/compilerlibs but was skipped: it has incompa=
tible license(s): GPL-3.0-or-later GPL-3.0-or-later WITH GCC-exception-3.1
> ERROR: Required build target 'selftest-ed' has no buildable providers.
> Missing or unbuildable dependency chain was: ['selftest-ed', 'virtual/com=
pilerlibs']
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4104
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

Or maybe not. I suspect something else, and I will test again your past
shortly.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


