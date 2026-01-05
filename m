Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC3BC2A07A
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 09:32:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60723.1767605538042899343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 01:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CnAowQ8z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1399E1A2667;
	Mon,  5 Jan 2026 09:32:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD30560726;
	Mon,  5 Jan 2026 09:32:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 719A7103C846F;
	Mon,  5 Jan 2026 10:32:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767605534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0E49eF/UFtDGIcwWi1oZFNKqK0P/RvLpqVjFXE5mdyM=;
	b=CnAowQ8z+3ntRiMYdd4y5nqRS5xDX3vcMZO8nEDj5CMuPhbIXm9Yvog1BRuHdMpGtvxZY5
	gi1FrroKEhEhsj3ERfGihNwy2PuEOK+Du1GL36q9+36m0OPIJ5XKAMjJDRh81asEvxrx2O
	wIgBiN8izsvq8KZGnV6PA5b3kDLq+z1bd5Ne/y7t92Dyw7SHN+IMCmlUd08+54i2lZn6Zz
	0QAVAB5vtvcajJcxysbbSqew2fGZwq1OymY818q9mJdnzQq8GxGPxrKrx9JRFuA5MtsW4+
	dwtSdR2MuMrwUal91JR4OdPltIhQ3gb2aqsQv0+0br8LUews1STgqK3U9ypHWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 10:32:11 +0100
Message-Id: <DFGJV6ZAEFO9.46GUIB6FK2KV@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 10/15] selftest/cases/runtime_test: Add
 test for Linux Rust sample
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <bruce.ashfield@gmail.com>, <yoann.congal@smile.fr>,
 <elmehdi.younes@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
 <20251230141540.1974380-11-Harish.Sadineni@windriver.com>
In-Reply-To: <20251230141540.1974380-11-Harish.Sadineni@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 09:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228861

On Tue Dec 30, 2025 at 3:15 PM CET, Harish via lists.openembedded.org Sadin=
eni wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> This new case tests that the rust_mininal sample inside the kernel source
> tree is buildable and works properly: check that the module can be
> loaded and that it prints correctly.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---

Hi Yoann, Harish,

Thanks for your patch.

It looks like we got a few intermittent failures here:

2026-01-02 19:40:58,816 - oe-selftest - INFO - FAIL: runtime_test.RustKerne=
l.test_kernel_rust_sample (subunit.RemotedTestCase)
2026-01-02 19:40:58,816 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2026-01-02 19:40:58,816 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/runtime_test.py", line 514, in tes=
t_kernel_rust_sample
    self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
  File "/usr/lib/python3.10/unittest/case.py", line 845, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
  File "/usr/lib/python3.10/unittest/case.py", line 838, in _baseAssertEqua=
l
    raise self.failureException(msg)
AssertionError: 0 !=3D 1 : Loading rust_out_of_tree module failed!

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3082
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3095

I only saw two occurrences so far, on at least 10 builds, but maybe you
can check for obvious reasons before the series get merged.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


