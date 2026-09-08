Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C728C79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 07:00:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1533.1788850849944237519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 00:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nJzCjoM9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 18F1C1A1A4C;
	Tue,  8 Sep 2026 07:00:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0F09603C4;
	Tue,  8 Sep 2026 07:00:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42EDD11C79AE2;
	Tue,  8 Sep 2026 09:00:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788850843; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t6JDwVdWAdvVDHx4oLcM374RbXNqr5wOexN5wu5O/lA=;
	b=nJzCjoM9B9ajfhjkwvgx7D2/Ddm+63nQSiD12wghlcJ0Tx7ALrJrp5XLvJmzvhvZWLKczS
	NLV3P/N9wLez6o0XPps20zbuWQk3gkTr9ELCNSj8wQKpdS2kBw74j1XK2xww6d9nOOhifO
	ESKJ8O0Yw/9Pv7Fna3zUpDRgL2bOmB52X1TUe8n8FTRShOtBO8FrCeJjcW75aDYeTuEWSp
	sBAIhnWH4FYQg5m+j+1HiHcHePNK06xVxMTHVuNdzvmA/EsiOGeS3nbW6yeruVj+r87rtQ
	6mpZirt12id5ZEU+EWgo9AnGDJSv25rgVXVJR4nZJITZwXN37py0OylRI3jbJg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 09:00:27 +0200
Message-Id: <DL9QP1CJD4I3.1CD0XIMDCNH2N@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <HimaniRamesh.Barde@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] systemd: re-enable ptest support
Cc: <Randy.MacLeod@windriver.com>, <ross.burton@arm.com>,
 <jose.quaresma@oss.qualcomm.com>, <raj.khem@gmail.com>,
 <richard.purdie@linuxfoundation.org>, <Shiva.Komati@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260907114507.294436-1-HimaniRamesh.Barde@windriver.com>
 <DL9QO37EJTBL.1CBZPRPTN8QNP@bootlin.com>
In-Reply-To: <DL9QO37EJTBL.1CBZPRPTN8QNP@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 07:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245333

On Tue Sep 8, 2026 at 8:59 AM CEST, Mathieu Dubois-Briand wrote:
> On Mon Sep 7, 2026 at 1:45 PM CEST, Himani Ramesh Barde via lists.openemb=
edded.org wrote:
>> ptest support for systemd was dropped in 2018 (commit 906230a73b3c)
>> when the recipe switched to meson, as there was no easy way to install
>> and run the test suite. Current systemd and meson resolve this: the
>> meson 'install-tests' option installs the unit-test binaries and a
>> run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and
>> run-unit-tests.py already emits PASS:/SKIP: results per test.
>>
>> Add a 'tests' PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtests
>> and -Dinstall-tests and pulls in python3-pefile-native (needed to build
>> the boot hwids test). do_install_ptest relocates the installed tests
>> into ${PTEST_PATH} and drops the mkosi/integration-tests harness (which
>> needs a booted system). A run-ptest wrapper drives run-unit-tests.py,
>> and systemd is registered in ptest-packagelists.inc.
>>
>> The test/units integration tests, which require a booted system, are
>> out of scope here and can be addressed separately.
>>
>> Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 342
>> unit-test binaries plus run-unit-tests.py install into ${PTEST_PATH} and
>> systemd-ptest packages cleanly with no QA errors.
>>
>> [YOCTO #16386]
>>
>> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
>> ---
>
> Hi Himani Ramesh,
>
> This is failing on the autobuilder, as we are running ptests using the
> poky distro, but poky does not have systemd DISTRO_FEATURES. I'm not
> sure how we can fix this, but we might need to hack a bit.
>
> Do you know how it was working before it was dropped in 2018?
>
> Thanks,
> Mathieu

Sorry, I forgot to add the log:

ERROR: Nothing RPROVIDES 'systemd-ptest' (but virtual:mcextend:systemd:/srv=
/pokybuild/yocto-worker/qemuarm64-ptest/build/layers/openembedded-core/meta=
/recipes-core/images/core-image-ptest.bb RDEPENDS on or otherwise requires =
it)
systemd RPROVIDES systemd-ptest but was skipped: using DISTRO 'poky', which=
 is missing required DISTRO_FEATURES: 'systemd usrmerge'
NOTE: Runtime target 'systemd-ptest' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['systemd-ptest']
NOTE: Runtime target 'core-image-ptest-all' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-ptest-all', 'core=
-image-ptest-systemd', 'systemd-ptest']
NOTE: Runtime target 'core-image-ptest-all-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-ptest-all-dev', '=
core-image-ptest-systemd', 'systemd-ptest']
ERROR: Nothing RPROVIDES 'core-image-ptest-systemd'
No eligible RPROVIDERs exist for 'core-image-ptest-systemd'
NOTE: Runtime target 'core-image-ptest-systemd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-ptest-systemd']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4482
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4509
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1157
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1137

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


