Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45272C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 11:35:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4165.1784115294181196564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 04:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=liuGAGqy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EABE91A0FFC
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:34:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B92996035C;
	Wed, 15 Jul 2026 11:34:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3336A11BD1F08;
	Wed, 15 Jul 2026 13:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784115291; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=93p4E993edYNRPd5jBUpzYXOy/3sZp/hqiui9P9NDc8=;
	b=liuGAGqyBVPWy5HyfDgmp5l7+swSgxw5LrKBhWE7DSnnjPUM8EZa9C4O5rMyxDCIjnSTha
	6L5Vz3SSbR9T+XQc3gRyy0xX8lieaQTkDqiVocbxR2/RA90EVoAVaUDPbdTd15tOmQZLUE
	NWDTRgrNDXCQL265glOy7j0wACsdHvehXoXE5pqYKCEE7dz+iz5DymQ0ytheFlQXnRPXAd
	ZQ2p2MD9CyT6a0mZ7DrRS2cm5xQ7mFMNTm9ViYuGL+WHUFuv2kVjQ0yyNHqf3DfhJHMAEy
	RRQP04OAdlxv6ttigBDQj2bacwrLDA8uFEpHZDMm9peCo+bXTA+p/FihobbJdA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 13:34:47 +0200
Message-Id: <DJZ434ABE440.139ZCYRQH7UM9@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/3] module.bbclass/make-mod-scripts:
 inhibit default dependencies
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mark.yang@lge.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260714132642.2225115-1-mark.yang@lge.com>
 <20260714132642.2225115-3-mark.yang@lge.com>
In-Reply-To: <20260714132642.2225115-3-mark.yang@lge.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240950

On Tue Jul 14, 2026 at 3:26 PM CEST, mark.yang via lists.openembedded.org w=
rote:
> From: "mark.yang" <mark.yang@lge.com>
>
> Modules and make-mod-scripts build against the shared kernel build
> tree with the kernel toolchain, so the default virtual/libc and
> virtual/compilerlibs dependencies are unused. Inhibit them and add
> the cross toolchain explicitly, as kernel.bbclass does, which also
> keeps compiler-rt and libcxx out of module builds with clang.
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---

Hi Mark,

Thanks for your patch.

We get this error during selftests:

2026-07-15 07:01:52,991 - oe-selftest - INFO - bbtests.BitbakeTests.test_no=
n_gplv3 (subunit.RemotedTestCase)
2026-07-15 07:01:52,992 - oe-selftest - INFO -  ... FAIL
...
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/compilerlibs' (but /srv/pokybuild/yocto-wo=
rker/oe-selftest-fedora/build/build-st-1131783/meta-selftest/recipes-test/s=
elftest-ed/selftest-ed_1.20.2.bb DEPENDS on or otherwise requires it)
gcc-runtime PROVIDES virtual/compilerlibs but was skipped: it has incompati=
ble license(s): GPL-3.0-or-later GPL-3.0-or-later WITH GCC-exception-3.1
ERROR: Required build target 'selftest-ed' has no buildable providers.
Missing or unbuildable dependency chain was: ['selftest-ed', 'virtual/compi=
lerlibs']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4104

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


