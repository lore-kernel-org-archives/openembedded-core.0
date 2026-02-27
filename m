Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612DAFD530B
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 07:33:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90293.1772177593733829659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 23:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ccYI6gnf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 978194E412D9
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 07:33:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63B205FE46;
	Fri, 27 Feb 2026 07:33:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EB3410369424;
	Fri, 27 Feb 2026 08:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772177590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XYxdpmzi6P2KmpN3rEEf1In4xWBC+046OYj5hFsOKr8=;
	b=ccYI6gnfXMMYvuSfTFNZ/sc7d8yayLn3j4bwsrqdMvpVFNmDTSXV68fpWDpxwauqtHWo/8
	jjHDmYWBW/n9+2/gbNxPXtb2uT1gbiN+Qkrb3U2cIaFRo+eDcTWO0QVZldZJ/x0cSfTD6t
	2ZzF8iZeJl2t2LmhxhJf6J6mne/t85VHGr52hhuvdqxgBu9ZX2HWztQfKO4y+96/b9s/6P
	cizv3mn7ALg/l31SCxo4IfSI0kUIHLPwuMuX1nBBZOX88Fmsj70rC46O1S1mRMJbCRk9+L
	wBVanwaONCywYdoXW85R5NCfrqModImlyhm+iK6qni39Mkb58aq/BQ4Uw02dmQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 08:32:59 +0100
Message-Id: <DGPKIT38LERA.190KG9RZ2LXIX@bootlin.com>
Subject: Re: [OE-core][PATCH v3 0/8] Add SPDX 3 Recipe Information
Cc: <benjamin.robin@bootlin.com>, <ross.burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260224230234.679049-1-JPEWhacker@gmail.com>
 <20260226173930.2847872-1-JPEWhacker@gmail.com>
In-Reply-To: <20260226173930.2847872-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 07:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232082

On Thu Feb 26, 2026 at 6:33 PM CET, Joshua Watt via lists.openembedded.org =
wrote:
> Changes the SPDX 3 output to include a "recipe" package that describe
> static information available at parse time (without building). This is
> primarily useful for gathering SPDX 3 VEX information about some or all
> recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
> vex.bbclass.
>
> Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
> helping work through this.
>
> V2: Fixes a bug where do_populate_sysroot was running when it should not
> be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
> incorrect (this is already handled by bitbake in the taskgraph, and
> doesn't need to be manually removed).
>
> V3: Fixes a bug where meta-world-recipe-sbom was reporting a circular
> dependency. meta-world-recipe-sbom also no longer runs in world builds,
> as there's no reason to this. Finally, fixes a bug where
> NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
> (because do_unpack was not run).
>

Hi Joshua,

Thanks for new version, results looks way better overall, but we still
have a few errors.

I now have this issue on some builds:
ERROR: nativesdk-sdk-provides-dummy-1.0-r0 do_create_spdx: Could not find a=
 static SPDX document named static-nativesdk-sdk-provides-dummy

https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/3335
https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/1105
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3238
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3233

And some errors in oe-selftests:
2026-02-26 20:46:06,214 - oe-selftest - INFO - newlib.NewlibTest.test_newli=
b (subunit.RemotedTestCase)
2026-02-26 20:46:06,215 - oe-selftest - INFO -  ... FAIL
...
ERROR: gcc-cross-x86_64-15.2.0-r0 do_create_spdx: Could not find a builds S=
PDX document named build-linux-libc-headers
...
ERROR: sysroot-test-1.0-r0 do_create_spdx: Could not find a builds SPDX doc=
ument named build-sysroot-test-arch1
...
2026-02-26 21:03:31,870 - oe-selftest - INFO - sysroot.SysrootTests.test_sy=
sroot_cleanup (subunit.RemotedTestCase)
2026-02-26 21:03:31,870 - oe-selftest - INFO -  ... FAIL
...
2026-02-26 21:20:09,006 - oe-selftest - INFO - spdx.SPDX30Check.test_custom=
_annotation_vars (subunit.RemotedTestCase)
2026-02-26 21:20:09,006 - oe-selftest - INFO -  ... FAIL
...
2026-02-26 21:20:09,006 - oe-selftest - INFO - 4: 37/50 612/670 (18.90s) (0=
 failed) (spdx.SPDX30Check.test_custom_annotation_vars)
2026-02-26 21:20:09,006 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 306, in test_custom_=
annotation_vars
    objset =3D self.check_recipe_spdx(
        "base-files",
    ...<7 lines>...
        ),
    )
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 123, in check_recipe=
_spdx
    return self.check_spdx_file(filename)
           ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 81, in check_spdx_fi=
le
    self.assertExists(filename)
    ~~~~~~~~~~~~~~~~~^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/case.py", line 249, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build=
-st-2700993/tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-base-files.spdx=
.json' does not exist
...
ERROR: gawk-native-5.3.2-r0 do_create_spdx: Applying patch '/srv/pokybuild/=
yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/recipes=
-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.pa=
tch' on target directory '/srv/pokybuild/yocto-worker/oe-selftest-debian/bu=
ild/build-st-2700993/tmp/work/x86_64-linux/gawk-native/5.3.2/spdx/3.0.1/wor=
k/sources/gawk-5.3.2'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/oe-selftest-debian/bu=
ild/build-st-2700993/tmp/work/x86_64-linux/gawk-native/5.3.2/recipe-sysroot=
-native/etc/quiltrc push', 0, 'stdout:
stderr: /bin/sh: 1: quilt: not found
')
ERROR: bzip2-native-1.0.8-r0 do_create_spdx: Applying patch '/srv/pokybuild=
/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/recipe=
s-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch' on t=
arget directory '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build=
-st-2700993/tmp/work/x86_64-linux/bzip2-native/1.0.8/spdx/3.0.1/work/source=
s/bzip2-1.0.8'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/oe-selftest-debian/bu=
ild/build-st-2700993/tmp/work/x86_64-linux/bzip2-native/1.0.8/recipe-sysroo=
t-native/etc/quiltrc push', 0, 'stdout:
stderr: /bin/sh: 1: quilt: not found
')
...
2026-02-26 21:27:01,979 - oe-selftest - INFO - spdx.SPDX30Check.test_gcc_in=
clude_source (subunit.RemotedTestCase)
2026-02-26 21:27:01,980 - oe-selftest - INFO -  ... FAIL
...
2026-02-26 21:27:26,620 - oe-selftest - INFO - spdx.SPDX30Check.test_kernel=
_config_spdx (subunit.RemotedTestCase)
2026-02-26 21:27:26,621 - oe-selftest - INFO -  ... FAIL
...

2026-02-26 21:27:50,868 - oe-selftest - INFO - spdx.SPDX30Check.test_packag=
econfig_spdx (subunit.RemotedTestCase)
2026-02-26 21:27:50,868 - oe-selftest - INFO -  ... FAIL
...

Also, it looks like you did not add yourself as a maintainer of
meta-world-recipe-sbom.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3288
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3405
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3463

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


