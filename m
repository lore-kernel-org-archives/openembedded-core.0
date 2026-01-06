Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50682CDC195
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 12:54:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89213.1767704060043391426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 04:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CumXGzTm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1E7511A2696;
	Tue,  6 Jan 2026 12:54:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7FAB60739;
	Tue,  6 Jan 2026 12:54:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D948A103C866F;
	Tue,  6 Jan 2026 13:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767704057; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pHLz8IYyuY8JMDpRs/ZUL4v8HlnkmhAzOFq2zOd+SEk=;
	b=CumXGzTmiYF3sRke25/uL/5/bfwF8KYOBUYHEumC2pJ/vFTJKN7zu41dKBM2r9U0ZBnnwF
	xt+/Y+p2ZC5uH1sjualCWOyQidSK6wagVBinGkq+xXaX1jfI8o6EsWQtOfJ3CvlrEhb4a6
	6V7kkhwGdy2ZEadodLNVfFOmhLWSbmtfwMnBF22ksIO1l4minLZuv1M993na4iw/Ilvv7m
	LSjeCTk9ehsYX3fFyQS3+6dk4vViWTwFhcLskpxmjjuC3OOPQ85PjjY44ApCDeyGx4FBPH
	S2QVp1/odtfaSmBAAhZ64e0KOBKDDjgoYO45aUCMleklnbEQEvxy/pnUDRtnlg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 13:54:16 +0100
Message-Id: <DFHISGOL9ZIH.23RLCKD2MBHAS@bootlin.com>
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 2.3.5 -> 2.4.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260105171830.3762638-1-tgamblin@baylibre.com>
In-Reply-To: <20260105171830.3762638-1-tgamblin@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 12:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228888

On Mon Jan 5, 2026 at 6:18 PM CET, Trevor Gamblin wrote:
> Changelog: https://github.com/numpy/numpy/releases/tag/v2.4.0
>
> ptests look OK:
>
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> |Testsuite summary
> |# TOTAL: 48248
> |# PASS: 46447
> |# SKIP: 1767
> |# XFAIL: 32
> |# FAIL: 0
> |# XPASS: 2
> |# ERROR: 0
> |DURATION: 327
> |END: /usr/lib/python3-numpy/ptest
> |2026-01-05T16:24
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
> |root@qemux86-64:~#
>
> and reproducibility:
>
> |2026-01-05 12:08:19,641 - oe-selftest - INFO - Ran 1 test in 1449.498s
> |2026-01-05 12:08:19,642 - oe-selftest - INFO - OK
> |2026-01-05 12:08:23,069 - oe-selftest - INFO - RESULTS:
> |2026-01-05 12:08:23,069 - oe-selftest - INFO - RESULTS - reproducible.Re=
producibleTests.test_reproducible_builds: PASSED (1402.66s)
> |2026-01-05 12:08:23,069 - oe-selftest - INFO - SUMMARY:
> |2026-01-05 12:08:23,070 - oe-selftest - INFO - oe-selftest () - Ran 1 te=
st in 1449.498s
> |2026-01-05 12:08:23,070 - oe-selftest - INFO - oe-selftest - OK - All re=
quired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Hi Trevor,

Thanks for your patch, and thanks for launching ptest and
reproducibility tests. Of course, it failed somewhere else. :)

We have this error while building piglit, reproduced and bisected
locally:

ERROR: piglit-1.0+gitr-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/piglit/=
1.0+gitr/temp/run.do_compile.891103' failed with exit code 1
...
| cd /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-6=
4-v3-poky-linux-musl/piglit/1.0+gitr/build/generated_tests && /srv/pokybuil=
d/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-mu=
sl/piglit/1.0+gitr/recipe-sysroot-native/usr/bin/python3-native/python3 /sr=
v/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-pok=
y-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tests/gen_bu=
iltin_uniform_tests_fp64.py > builtin_uniform_tests_fp64.list
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/=
x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated=
_tests/gen_builtin_uniform_tests_fp64.py", line 47, in <module>
|     from builtin_function_fp64 import *
|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/=
x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated=
_tests/builtin_function_fp64.py", line 1147, in <module>
|     _make_vector_or_matrix_test_vectors(test_suite)
|     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/=
x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated=
_tests/builtin_function_fp64.py", line 1122, in _make_vector_or_matrix_test=
_vectors
|     f('op-div', 2, _divide, match_simple_binop,
|     ~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|       [doubles+dvecs+dmats,
|       ^^^^^^^^^^^^^^^^^^^^^
|        doubles+dvecs+dmats],
|        ^^^^^^^^^^^^^^^^^^^^^
|       template=3D'({0} / {1})')
|       ^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/=
x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated=
_tests/builtin_function_fp64.py", line 1101, in f
|     _simulate_function(
|     ~~~~~~~~~~~~~~~~~~^
|         test_inputs, python_equivalent, tolerance_function),
|         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/=
x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated=
_tests/builtin_function_fp64.py", line 536, in _simulate_function
|     expected_output =3D python_equivalent(*inputs)
|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/=
x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated=
_tests/builtin_function_fp64.py", line 311, in _divide
|     if any(y_element =3D=3D 0 for y_element in column_major_values(y)):
|                                            ~~~~~~~~~~~~~~~~~~~^^^
|   File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/=
x86-64-v3-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated=
_tests/builtin_function_fp64.py", line 257, in column_major_values
|     return list(np.reshape(value, newshape=3D-1, order=3D'F'))
|                 ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| TypeError: reshape() got an unexpected keyword argument 'newshape'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3035
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3001
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2982

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


