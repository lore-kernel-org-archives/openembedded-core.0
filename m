Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A81D2F7E6
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 12:02:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4081.1764936151005151332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 04:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=x39O2hMc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A66204E41A6A
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Dec 2025 12:02:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E56A606AC;
	Fri,  5 Dec 2025 12:02:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91EEF102F2334;
	Fri,  5 Dec 2025 13:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764936147; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HCd0VXBrjzWa17K60D2uoOmyK3lef7owgvANjAv6O1U=;
	b=x39O2hMcrxkUeAkvh/SySTxpoFrcbUS9DvThsN++/cbizQhlNJncHDhMgGUGfkwV6rWm0N
	0H6gCsZcoyElazNVgvzwW32q/bHjbHlYs+3peYC8RVxjiQ6Wbq+5B5a3iTP4JEC2Uniab5
	3i4iJmvayveMgwKymH7+zEQHlNrtv+UUETgwnbWr3xUyqAqoRy5Mmy61lYxfXDQnPQnsWU
	siSAlI5GraW5kyeRnEJQ+r9GE4E9JkjlD+cloZ1MbwVh3JfvWYbtdNeqDz27wWYOgWyRdi
	nz40SQBszKs6yoJ4MkoYG6NsBKIvH7+mw7uaV1S0mDKoFSkKp5Ia1XpIOuQ8KQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Dec 2025 13:02:24 +0100
Message-Id: <DEQ9NBR19R81.2AR83JOIBN2X@bootlin.com>
Subject: Re: [OE-core][PATCH 0/6] python3: upgrade to 3.14.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251204180945.3112334-1-tgamblin@baylibre.com>
In-Reply-To: <20251204180945.3112334-1-tgamblin@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 12:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227351

On Thu Dec 4, 2025 at 7:09 PM CET, Trevor Gamblin wrote:
> Here goes the first attempt at upgrading the python3 recipe to 3.14.0. Th=
is will
> likely break some stuff, so it'd be good to start testing it early before
> Wrynose begins the build phase. You can see the specific commits for more
> details, but I will note that in addition to the buildall-qemu, reproduci=
bility,
> and ptest checks I've reported in the python3 upgrade patch itself, I've =
also
> done the following on my build machine (F43):
>
> - bitbake core-image-ptest-all (which is how I found the problems fixed b=
y the
>   bcrypt, jsonpointer, and pytest changes);
> - bitbake -k world (which IIRC is where I found the rpm issue).
>
> Trevor Gamblin (6):

Hi Trevor,

Thanks for your patches.

It looks like we do have some issues on the autobuilder.

A first one, maybe only with alternate distro?

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/layers/openembedded-c=
ore/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/layers/openembedded-c=
ore/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/layers/openembedded-c=
ore/meta/lib/oeqa/runtime/cases/gi.py", line 20, in test_python
    self.assertEqual(status, 0, msg=3D"Python failed (%s)" % (output))
AssertionError: 1 !=3D 0 : Python failed (Traceback (most recent call last)=
:
  File "<string>", line 1, in <module>
  File "/usr/lib/python3.14/site-packages/gi/__init__.py", line 40, in <mod=
ule>
    from . import _gi
  File "/usr/lib/python3.14/asyncio/__init__.py", line 8, in <module>
    from .base_events import *
  File "/usr/lib/python3.14/asyncio/base_events.py", line 18, in <module>
    import concurrent.futures
  File "/usr/lib/python3.14/concurrent/futures/__init__.py", line 8, in <mo=
dule>
    from concurrent.futures._base import (FIRST_COMPLETED,
  File "/usr/lib/python3.14/concurrent/futures/_base.py", line 7, in <modul=
e>
    import logging
  File "/usr/lib/python3.14/logging/__init__.py", line 26, in <module>
    import sys, os, time, io, re, traceback, warnings, weakref, collections=
.abc
  File "/usr/lib/python3.14/traceback.py", line 8, in <module>
    import warnings
  File "/usr/lib/python3.14/warnings.py", line 15, in <module>
    from _py_warnings import (
ModuleNotFoundError: No module named '_py_warnings')
...
RESULTS - gi.GObjectIntrospectionTest.test_python: FAILED (0.67s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2793
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2804
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/2785

And another one here:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarmv5/build/layers/openembedded-cor=
e/meta/lib/oeqa/sdk/cases/maturin.py", line 30, in test_maturin_list_python
    self.assertIn(expected, output)
AssertionError: '3.14 at /srv/pokybuild/yocto-worker/qemuarmv5/build/build/=
tmp/work/qemuarmv5-poky-linux-gnueabi/core-image-sato/1.0/testsdkext/buildt=
ools/sysroots/x86_64-pokysdk-linux/usr/bin/python3' not found in '=F0=9F=90=
=8D 1 python interpreter found:\n - CPython 3.9 at /srv/pokybuild/buildbot-=
venv/bin/python3.9\n'
...
core-image-sato esdk (poky-glibc-x86_64-core-image-sato-armv5e-qemuarmv5-to=
olchain-ext-5.2.99+snapshot.sh:environment-setup-armv5e-poky-linux-gnueabi)=
 - Ran 30 tests in 616.844s
core-image-sato esdk - FAIL - Required tests failed (successes=3D19, skippe=
d=3D10, failures=3D1, errors=3D0)
ERROR: core-image-sato-1.0-r0 do_testsdkext: core-image-sato - FAILED - che=
ck the task log and the commands log
...
RESULTS - maturin.MaturinTest.test_maturin_list_python: FAILED (3.43s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2661

Can you try to fix these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


