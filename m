Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5AEC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 09:02:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36322.1785920552849871037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 02:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nZdmjGDg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 866F91A1344;
	Wed,  5 Aug 2026 09:02:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C6CE602AB;
	Wed,  5 Aug 2026 09:02:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B63411C344F5;
	Wed,  5 Aug 2026 11:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785920549; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w6JnahCE+BoJoZ1Lua11we/NSS2Ni8sv50SSU4IrvD0=;
	b=nZdmjGDgEcVpHtqP0tzvf7KDwHFatWmu/ERGzkK4XsPcKX1TBci1JXbZ1dm/QVxJak8k6g
	44gRLpx+DO9FDA7El0sUNTaI+T+6z/azeL3HTb1plISSiuNkMlanF5jqxXzBaiTtyLa3E+
	kpX7Ah1xRv+8hiGJdA070vKLIPuKA8/8l20tPrRDyg2+WbuZzlTHsGSMY8t7ou/ylM+Tj4
	1WLXvUw999kiAHFYgH7vopfhp6wz1atOxIBWhQKyp/v1iM2DBxhOwZAV5QmtnquKlg2Drh
	0KJpTJDFmNL2wnwormBs/4TwpAnmOdP8npXFTovb0Ugf9HjfgHydYBGJFbtwrw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Aug 2026 11:02:27 +0200
Message-Id: <DKGVZWZHLKDV.2I8XWUPLBII27@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/9] classes/cargo: consolidate dependencies
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260804165803.598030-1-ross.burton@arm.com>
 <20260804165803.598030-4-ross.burton@arm.com>
In-Reply-To: <20260804165803.598030-4-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 09:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242847

On Tue Aug 4, 2026 at 6:57 PM CEST, Ross Burton via lists.openembedded.org =
wrote:
> Move the dependencies from cargo to cargo_common: if cargo is being used
> in any way then you need to depend on cargo-native.
>
> Inherit rust instead of rust-common or rust-target-config: rust inherits
> rust-common that inherits rust-target-config, and rust.bbclass simply
> adds the dependency on rust-native. This means we can drop the explicit
> rust dependencies to avoid duplication.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

It looks like this is breaking some selftests on the autobuilder:

2026-08-05 04:42:45,835 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs.test_sstate_sdk_arch_same_hash (subunit.RemotedTestCase)
2026-08-05 04:42:45,835 - oe-selftest - INFO -  ... FAIL
...
2026-08-05 04:42:45,835 - oe-selftest - INFO - 6: 27/69 387/763 (108.57s) (=
2 failed) (sstatetests.SStateHashSameSigs.test_sstate_sdk_arch_same_hash)
2026-08-05 04:42:45,836 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 416, in test_=
sstate_sdk_arch_same_hash
    self.sstate_hashtest("aarch64")
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 401, in sstat=
e_hashtest
    self.assertCountEqual(files1, files2)
  File "/usr/lib/python3.12/unittest/case.py", line 1216, in assertCountEqu=
al
    self.fail(msg)
  File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3947568/tmp-sstatesamehash/stamps/all-poky-linux/adwaita-ic=
on-theme/50.0.do_install.sigdata.cf83a7b1dadddfa2d6b44fc9390f46b27793c74918=
dbab4fe0048d924780eaf5'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3947568/tmp-sstatesamehash/stamps/all-poky-linux/adwaita-ic=
on-theme/50.0.do_create_package_spdx.sigdata.f15f70b42ba9db4c88b4cd7b650ddd=
f4f7b1dbbd911ff71f2c803f3b16d985ca'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3947568/tmp-sstatesamehash/stamps/all-poky-linux/adwaita-ic=
on-theme/50.0.do_package.sigdata.81c59c71a0ee5154503141307ed14df0ac325fce8e=
0351ec308317e951ea66f1'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-3947568/tmp
...

And I suspect it's also responsible of these two failures:

2026-08-05 04:39:10,815 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs.test_sstate_32_64_same_hash (subunit.RemotedTestCase)
2026-08-05 04:39:10,816 - oe-selftest - INFO -  ... FAIL
...
2026-08-05 05:32:43,041 - oe-selftest - INFO - devtool.DevtoolIdeSdkTests.t=
est_devtool_ide_sdk_code_meson_clang (subunit.RemotedTestCase)
2026-08-05 05:32:43,041 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4471
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4289

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


