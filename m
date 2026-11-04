Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4783.1793780328456154270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 00:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jQfMLU+w;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9A5BB1A1451
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 08:18:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6708760770;
	Wed,  4 Nov 2026 08:18:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EC9D103291D1;
	Wed,  4 Nov 2026 09:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793780326; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sshNqZFTdZvOx+IxJ2hXCBLir1D/iXXnCNXMnlPjKlQ=;
	b=jQfMLU+wJSh+VuKFwWZA1Sm1kHdCYzEaIiKHHqGDNkmGF5kNpuxL+2tuHaL2lhul5HL4ql
	fKO88C0V1Ql6zUiNFpYXBvp8vsuVxj4j78nE8+kIYKlR4A/1RLnDw6aOoaaRYMbqPaQNoT
	UoWQbYTAkqvo6mjiqoqtEVyw+mXWTd2/rkVFKP1/mSQa4VDSg9IsYHPlOJ2KWIoZrTKqI7
	qqMfKG9ZG3+GjMjnQrng8vFqsHXTSduSAJG2mmLZk94n/RXKUxO6hbgPwGpWV//708La+I
	nMrzj/wb/WgGBt4ylB6ixXhOiAJp4bv3XOVkBn9pHJF/AJytI04/kfefRvpYaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 09:18:44 +0100
Message-Id: <DMMA20XX82TT.25B06OAQZF9KX@bootlin.com>
Subject: Re: [OE-core] [PATCH v11 1/4] libtoml1: fix building tests with gcc
 16
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261103145914.1229467-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20261103145914.1229467-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 08:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249345

On Tue Nov 3, 2026 at 3:59 PM CET, Adam Duskett via openembedded-core wrote=
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

Thanks for the new version.

We can see three selftest failures on the autobuilder:

2026-11-03 21:45:31,569 - oe-selftest - INFO - buildoptions.ImageOptionsTes=
ts.test_incremental_image_generation (subunit.RemotedTestCase)
2026-11-03 21:45:31,580 - oe-selftest - INFO -  ... FAIL
...
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/buildoptions.py", line 32, in test_=
incremental_image_generation
    self.assertTrue(incremental_created, msg =3D "Match failed in:\n%s" % l=
og_data_created)
  File "/usr/lib/python3.12/unittest/case.py", line 727, in assertTrue
    raise self.failureException(msg)
AssertionError: None is not true : Match failed in:
...
ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['pos=
tinst-rootfs-failing-0:1.0-r0.noarch'] have failed. If the intention is to =
defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
Details of the failure are in /srv/pokybuild/yocto-worker/oe-selftest-debia=
n/build/build-st-847819/tmp/work/qemux86_64-poky-linux/core-image-minimal/1=
.0/temp/log.do_rootfs.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/oe-selftes=
t-debian/build/build-st-847819/tmp/work/qemux86_64-poky-linux/core-image-mi=
nimal/1.0/temp/log.do_rootfs.3494045
NOTE: recipe core-image-minimal-1.0-r0: task do_rootfs: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/op=
enembedded-core/meta/recipes-core/images/core-image-minimal.bb:do_rootfs) f=
ailed with exit code '1'
NOTE: Tasks Summary: Attempted 4387 tasks of which 4386 didn't need to be r=
erun and 1 failed.
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/o=
e-selftest-debian/build/build-st-847819/tmp/log/error-report/error_report_2=
0261103225802.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/oe-selftest-debian/build/bu=
ild-st-847819/tmp/log/error-report/error_report_20261103225802.txt [-s serv=
er]
NOTE: The contents of these logs will be posted in public if you use the ab=
ove command with the default server. Please ensure you remove any identifyi=
ng or proprietary information when prompted before sending.
...
2026-11-03 22:58:43,332 - oe-selftest - INFO - runtime_test.Postinst.test_f=
ailing_postinst (subunit.RemotedTestCase)
2026-11-03 22:58:43,333 - oe-selftest - INFO -  ... FAIL
...
2026-11-04 00:03:04,207 - oe-selftest - INFO - FAIL: runtime_test.Postinst.=
test_failing_postinst (subunit.RemotedTestCase)
2026-11-04 00:03:04,210 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2026-11-04 00:03:04,210 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/runtime_test.py", line 459, in test=
_failing_postinst
    self.assertGreaterEqual(bb_result.output.find("Postinstall scriptlets o=
f ['postinst-rootfs-failing'] have failed."), 0,
  File "/usr/lib/python3.12/unittest/case.py", line 1275, in assertGreaterE=
qual
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: -1 not greater than or equal to 0 : Warning about a failed =
scriptlet not found in bitbake output: NOTE: Reconnecting to bitbake server=
...
...
2026-11-03 23:51:38,596 - oe-selftest - INFO - runtime_test.TestImage.test_=
testimage_install (subunit.RemotedTestCase)
2026-11-03 23:51:38,597 - oe-selftest - INFO -  ... FAIL
...
2026-11-04 00:03:04,274 - oe-selftest - INFO - FAIL: runtime_test.TestImage=
.test_testimage_install (subunit.RemotedTestCase)
2026-11-04 00:03:04,277 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2026-11-04 00:03:04,277 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/runtime_test.py", line 131, in test=
_testimage_install
    bitbake('-c testimage core-image-full-cmdline')
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
AssertionError: Command 'bitbake  -c testimage core-image-full-cmdline' ret=
urned non-zero exit status 1:
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 2109 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5181
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4997
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/5213

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

