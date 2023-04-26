Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3A5C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 12:12:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.6181.1682511165889456377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 05:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MM4tBKEK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96867E0002;
	Wed, 26 Apr 2023 12:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682511163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHMKEWQvGDozrYjzJMBs+Twlgd8UmagUf+lCLB0RUeA=;
	b=MM4tBKEKb07c2cKFfabeREBt6PviaigtzZMSZB71xf82q3TNEK6WgOP4stcyGzY0agaqF6
	cYztte4vMxyFjtAHqrcqtwN4TtfhGONPO4bOhJuPVMcyzDrw8N2BIg9O16tL58/uCADk+V
	qlHpwIrVhSVklMaPpLXJEBE1zwzSphkUg4diQdZqybHY7haxoG/qXERz1YuYeV09bAqaSk
	EIkGx4iQOiOytokdagzvLRS3nZOypVkwU7bbdnPlGNAEi+DzkoEbJpVEQUKiFpzVdzbypU
	xoCdAVuDJgQWbQuygpe7wkH1jip+1Y0i+2hf5MbFG5Rkgjs3cAW3XYOCTFn+gQ==
Date: Wed, 26 Apr 2023 14:12:41 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Enrico =?UTF-8?Q?J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Richard
 Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
 <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com
Subject: Re: [OE-core] [PATCH v3 0/9] Add barebox bootloader support (and
 testing)
Message-ID: <20230426141241.3a5d7a29@booty>
In-Reply-To: <20230425184720.456896-1-ejo@pengutronix.de>
References: <20230425184720.456896-1-ejo@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 12:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180436

Hello Enrico,

On Tue, 25 Apr 2023 20:47:11 +0200
Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:

> This adds support for the barebox bootloader (and tools) to oe-core.
>=20
> In order to have proper testing, this extends oe-selftest to allow
> basic testing of bootloaders. While at it, cover both barebox and u-boot.

Some tests are failing with this series applied. Logs looking like:

--------------------------------8<--------------------------------

2023-04-26 02:45:38,232 - oe-selftest - INFO - barebox.BareboxTest.test_boo=
t_barebox (subunit.RemotedTestCase)
2023-04-26 02:45:38,232 - oe-selftest - INFO -  ... skipped 'Test skipped o=
n x86_64\n'
2023-04-26 02:45:38,232 - oe-selftest - INFO - 1: 1/47 2/530 (0.00s) (0 fai=
led) (barebox.BareboxTest.test_boot_barebox)
2023-04-26 02:45:38,232 - oe-selftest - INFO - Test skipped on x86_64
2023-04-26 02:46:47,829 - oe-selftest - INFO - fetch.Dependencies.test_depe=
ndencies (subunit.RemotedTestCase)
2023-04-26 02:46:47,829 - oe-selftest - INFO -  ... ok
2023-04-26 02:46:47,829 - oe-selftest - INFO - 12: 2/20 3/530 (70.93s) (0 f=
ailed) (fetch.Dependencies.test_dependencies)
2023-04-26 02:46:54,605 - oe-selftest - INFO - barebox.BareboxTest.test_boo=
t_barebox_efi (subunit.RemotedTestCase)
2023-04-26 02:46:54,605 - oe-selftest - INFO -  ... FAIL
Stderr:
2023-04-26 02:45:38,230 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-312692=
8/conf/local.conf
2023-04-26 02:45:38,231 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
2023-04-26 02:46:54,606 - oe-selftest - INFO - 1: 2/47 4/530 (76.37s) (0 fa=
iled) (barebox.BareboxTest.test_boot_barebox_efi)
2023-04-26 02:46:54,606 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa=
/selftest/cases/barebox.py", line 63, in test_boot_barebox_efi
    bitbake(image)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa=
/utils/commands.py", line 234, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **o=
ptions)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa=
/utils/commands.py", line 212, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  core-image-minimal' returned non-zero exi=
t status 1:
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1872 targets, 55 =
skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'barebox' (but /home/pokybuild/yocto-worker/oe-sel=
ftest-debian/build/meta/recipes-core/images/core-image-minimal.bb, /home/po=
kybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-core/packagegrou=
ps/packagegroup-core-boot.bb RDEPENDS on or otherwise requires it)
barebox was skipped: PREFERRED_PROVIDER_virtual/bootloader set to u-boot, n=
ot barebox
NOTE: Runtime target 'barebox' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['barebox']
ERROR: Required build target 'core-image-minimal' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['core-image-minimal', 'barebo=
x']
Summary: There were 2 ERROR messages, returning a non-zero exit code.

--------------------------------8<--------------------------------

Some logs are here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5054/step=
s/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5096/step=
s/14/logs/stdio

FYI I had to manually solve a trivial conflict on patch 5 due to
another patch in my branch that is touching the same file:
https://lore.kernel.org/openembedded-core/20230411150503.2105880-2-lrannou@=
baylibre.com/

Best regards,
Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

