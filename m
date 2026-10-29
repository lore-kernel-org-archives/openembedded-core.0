Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1907.1793301632818340939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 12:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=q8e6l02s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7E0C81A13AD;
	Thu, 29 Oct 2026 19:20:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 433F26076A;
	Thu, 29 Oct 2026 19:20:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80E2E10328F94;
	Thu, 29 Oct 2026 20:20:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793301625; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rmCPIeiF0ha5jYfsHQzJWBH6R/NKvy3/EO5GORauvnE=;
	b=q8e6l02sSFPBI0fxT3JTAW2A5bHwSjWV/MwGQY1EzKvvDNgD7sjr/Wn9p8qtptF9jF5M6N
	qzOKzLuoRevR06ATpJhPKgSNlzT0sgyLQwuWTanu0dGQ9rB4dKyuy+bkGiqoNoDZZNC+sM
	g9qHTmKRqOKeUS4MwdeMTjyyyqNSU/imhKGFbOSQjSHanmIIOyeNLbx0/W6KaVEcSOOXyh
	qx4BLjSc2Y2RtPy2d10beYuQQiPumOoVrPKt8kHygeqr/unsJdAbxttjD3hRgwlY7MHX8F
	NRGFJQZqh9OPWmUbOyNNdNPUYwKmYSuXegUWWvgMuZle/q/AgEAP1JBrhQiYww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 20:20:23 +0100
Message-Id: <DMHKDCKTNA0P.36QFAT6G2VED4@bootlin.com>
Subject: Re: [OE-core][PATCH v7 7/8] layer.conf: Fix initramfs-framework not
 knowing which udev it has
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261027224931.385138-1-JPEWhacker@gmail.com>
 <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261028220609.1348489-8-JPEWhacker@gmail.com>
In-Reply-To: <20261028220609.1348489-8-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 19:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248971

On Wed Oct 28, 2026 at 11:04 PM CET, Joshua Watt via lists.openembedded.org=
 wrote:
> The SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS from initramfs-framework to eudev
> and systemd meant that it would not correctly update when switching udev
> providers (for example, when switching from the "poky" distro to
> "poky-altcfg" distro). Fix this by removing both entries.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---

Hi Joshua,

It looks like we have two failing ptests:

2026-10-29 13:59:49,255 - oe-selftest - INFO - containerimage.ContainerImag=
eTests.test_expected_files (subunit.RemotedTestCase)
2026-10-29 13:59:49,258 - oe-selftest - INFO -  ... FAIL
...
2026-10-29 16:43:44,508 - oe-selftest - INFO - FAIL: containerimage.Contain=
erImageTests.test_expected_files (subunit.RemotedTestCase)
2026-10-29 16:43:44,508 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2026-10-29 16:43:44,511 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/containerimage.py", line 79, in tes=
t_expected_files
    bitbake('container-test-image')
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 247, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **o=
ptions)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  container-test-image' returned non-zero e=
xit status 1:
...
ERROR: linux-dummy-1.0-r0 do_deploy: No deployed artifacts found in /srv/po=
kybuild/yocto-worker/oe-selftest-debian/build/build-st-2057211/tmp/work/x86=
-64-v3-poky-linux/linux-dummy/1.0/deploy-linux-dummy

2026-10-29 16:06:26,004 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs2.test_sstate_allarch_samesigs (subunit.RemotedTestCase)
2026-10-29 16:06:26,009 - oe-selftest - INFO -  ... FAIL
...
AssertionError: {'nat[236063 chars]/do_package_write_rpm': '1c255309c294370=
cd4b42[66420 chars]25f'} !=3D {'nat[236063 chars]/do_prepare_recipe_sysroot=
': 'ec112619862bfba2[66420 chars]25f'}
  {'adwaita-icon-theme/do_compile': 'a25b554f7e8661288308f43852443b92aab5f2=
645308eb21ab8bcce1c016f7b7',
   'adwaita-icon-theme/do_configure': '75e61587201815e441c95207df638178c3c2=
5a68b31df2f59ea53262001118b6',
   'adwaita-icon-theme/do_create_package_spdx': 'f835ed6c0081ae4a047aa7e79c=
c8a9e6e655ec760e615afc1960f3aec4779703',
   'adwaita-icon-theme/do_create_recipe_spdx': '4dbac02267e196c377e849a6b6c=
12e8474f35e7d53ea5fe02a9dff6f3da5a78c',
   'adwaita-icon-theme/do_create_spdx': '5a1f1516ddb2b6fdbd73bf4a07a60e0c5e=
89d29e27a4f2be776071d15f34efd7',

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5152
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/5184
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4968

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

