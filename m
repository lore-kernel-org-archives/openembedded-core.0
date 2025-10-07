Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C75CCA472
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 12:38:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.17622.1759840732688020617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 05:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F/gMPiNV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24B14C085EE;
	Tue,  7 Oct 2025 12:38:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8014F606C8;
	Tue,  7 Oct 2025 12:38:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7CF8102F2142;
	Tue,  7 Oct 2025 14:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759840730; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lFAfu6Ha8TtEyyKtRTiLMjCGwG4oY4zU4pYPeHqsqnA=;
	b=F/gMPiNV5aI/hp3ZK5ABgNISC/200Xq0Bx0UTw/XvJCLWnfuKGYhXuTt29IM2Y4zKJRPYT
	PdxeVUOj50BqEOzbQZJ2gKR1CYDSQEys9XfEzUDpvcM7WwEi7eNULLSRcrCIg/4Bn7am8R
	dwa541CkfQjJccOx54f01HCqhxW3ucJ8J41BR/7XxMyZZf5fvpQGsthFpJBFD+7ydjppBj
	7f5cFkJ+J9A+i3XOSaOnwUMYJJa35EzUFUR24RbZ4UHB1a8kHz6IvVH5YWBvLhEJWBL9ML
	L/sexeFrlexrtCOXtbKNg9zEHzrhlmRf/cNJS2cvE7V2BMVuMla53ZZbarzHeg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 14:38:49 +0200
Message-Id: <DDC3H21DQESE.13KUYX3Q8V49X@bootlin.com>
Subject: Re: [OE-core] [PATCH] toolchain-scripts.bbclass: fix bitbake-setup
 compatibility
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251006191055.729066-1-adrian.freihofer@siemens.com>
 <DDC3GJAAS7WK.31NKW97S8NPBT@bootlin.com>
In-Reply-To: <DDC3GJAAS7WK.31NKW97S8NPBT@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 12:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224528

On Tue Oct 7, 2025 at 2:38 PM CEST, Mathieu Dubois-Briand wrote:
> On Mon Oct 6, 2025 at 9:10 PM CEST, Adrian Freihofer via lists.openembedd=
ed.org wrote:
>> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>
>> Pass the BITBAKEDIR parameter to oe-init-build-env when called from the
>> environment-setup script. This fixes compatibility with bitbake-setup,
>> which places bitbake in a different directory structure than the
>> standard poky repository layout where bitbake is located alongside
>> oe-init-build-env.
>>
>> The issue was discovered when running the oe-selftest test
>> DevtoolIdeSdkTests.test_devtool_ide_sdk_shared_sysroots, which failed
>> because the environment-setup script was not able to find bitbake.
>>
>> File ".../openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py",
>>   line 2955, in test_devtool_ide_sdk_shared_sysroots
>>   self.assertExists(cmake_native)
>>   ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
>> File ".../openembedded-core/meta/lib/oeqa/selftest/case.py", line 251,
>>   in assertExists
>>   raise self.failureException(msg)
>> AssertionError: 'Error: The bitbake directory (/tmp/devtoolqah9ndff2x/bi=
tbake)
>>   does not exist!  Please ensure a copy of bitbake exists at this locati=
on or
>>   specify an alternative path on the command line\n
>>   .../build-st/tmp/sysroots/x86_64/usr/bin/cmake' does not exist
>>
>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>> ---
>
> Hi Adrian,
>
> Thanks for the new version.
>
> It looks like it is braking some tc tests:
>
> 2025-10-07 06:03:00,760 - oe-selftest - INFO - 9: 2/4 4/18 (0.31s) (0 fai=
led) (meta_ide.MetaIDE.test_meta_ide_can_compile_c_program)
> 2025-10-07 06:03:00,760 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/qemuarm64-tc/build/meta/lib/oeqa/self=
test/cases/meta_ide.py", line 40, in test_meta_ide_can_compile_c_program
>     runCmd("cd %s; . %s; $CC test.c -lm" % (self.tmpdir_metaideQA, self.e=
nvironment_script_path))
>     ~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/qemuarm64-tc/build/meta/lib/oeqa/util=
s/commands.py", line 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
> AssertionError: Command 'cd /tmp/metaid
> ...
> cc1: fatal error: test.c: No such file or directory
>
> Can you have look at this failure please?
>
> Thanks,
> Mathieu

Sorry, I forgot the AB links:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2449
https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2443

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


