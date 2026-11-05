Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2694.1793902389914030391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 10:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JyfiR8TM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B7737C6915D
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 18:13:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6554A5FF43;
	Thu,  5 Nov 2026 18:13:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 649A9103292AC;
	Thu,  5 Nov 2026 19:13:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793902386; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fl16yQCccEEA/F46zwkSHbLxBdOMIfOFCjRO5O4BAbQ=;
	b=JyfiR8TMj3LazaDIzOsfOtW9GQUJOFe5IrMD8dY3uJqzS51NjRw70CJn1GDkMJydfQ4DIK
	IRoHNoARhlhMQhjo0fkAZYvnxNxyC6UeeBp5xRB44xEKj+yNyDZ2EKIfx9PlceL7XqQrLS
	r9VLcdSTu/3yWJJkghDlUCkQi+fzVpvvIYBVv8bIG2fXgNJiqxFvGRoTL0b7XpFWj9VWAn
	vVnPwDl2pBmWv0kZ7Iiwkhv03/XiH5iqSScggf/HgojoFyp1xs+7mPGV61kBOjCByzFu9E
	aW5ExGhWaDsbQhXP38+KA4FlFPDw3IBb8LixXa++qY66phyjBgCz0GCIoVE9jg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 19:13:04 +0100
Message-Id: <DMNHBMHYU9DA.39FGYAZSDM7NX@bootlin.com>
Subject: Re: [OE-core] [PATCH v12 1/4] libtoml1: fix building tests with gcc
 16
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261104132057.607953-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20261104132057.607953-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 18:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249568

On Wed Nov 4, 2026 at 2:20 PM CET, Adam Duskett via openembedded-core wrote=
:
> GCC 16 warns that the format may be used uninitialized when a value is
> assigned a different type, for example:
>
>   toml::value v(true);
>   v =3D std::chrono::hours(1);
>
> The warning is a false positive, but the tests build with -Werror, so
> the build fails.
>
> Every operator=3D copied the old format out of the union behind a type
> check that GCC could not see through, so it flagged a possible read of
> an inactive member.
>
> Add a small helper that keeps the format when the type is unchanged and
> uses the default format otherwise, so the old format is never copied.
> The convenience overloads now convert their argument and forward to the
> main ones, removing a lot of duplicated code.
>
> Fixes:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/4814
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---

Hi Adam,

Thanks for the new version. It looks better, with only one selftest
failure, only on ARM hosts.

2026-11-05 09:43:06,955 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_sign_initramfs_bundle (subunit.RemotedTestCase)
2026-11-05 09:43:06,956 - oe-selftest - INFO -  ... FAIL
...
2026-11-05 09:43:06,956 - oe-selftest - INFO - 14: 8/74 452/795 (183.10s) (=
0 failed) (fitimage.KernelFitImageRecipeTests.test_fit_image_sign_initramfs=
_bundle)
2026-11-05 09:43:06,956 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 1629, in test_f=
it_image_sign_initramfs_bundle
    self._test_fitimage(bb_vars)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 719, in _test_f=
itimage
    fitimage_its_path, fitimage_path =3D self._bitbake_fit_image(bb_vars)
                                       ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 828, in _bitbak=
e_fit_image
    bitbake(self.kernel_recipe)
    ~~~~~~~^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 247, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **o=
ptions)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  linux-yocto-fitimage' returned non-zero e=
xit status 1:
...
ERROR: linux-yocto-fitimage-1.0-r0 do_package_qa: QA Issue: File /boot/fitI=
mage in package linux-yocto-fitimage contains reference to TMPDIR [buildpat=
hs]
ERROR: linux-yocto-fitimage-1.0-r0 do_package_qa: Fatal QA errors were foun=
d, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/oe-selftes=
t-armhost/build/build-st-1135637/tmp/work/qemuarm64-poky-linux/linux-yocto-=
fitimage/1.0/temp/log.do_package_qa.159937
NOTE: recipe linux-yocto-fitimage-1.0-r0: task do_package_qa: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/o=
penembedded-core/meta/recipes-kernel/linux/linux-yocto-fitimage.bb:do_packa=
ge_qa) failed with exit code '1'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/5224

I know this one might be a bit tricky to reproduce, as it only occurs on
ARM platforms. If you want to run some tests, I can schedule some builds
on the autobuilder.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

