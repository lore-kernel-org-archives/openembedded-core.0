Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2550E81A3E
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 15:48:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22560.1771256923098660044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 07:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fVcFvJXW;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 99A391A0FD9
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 15:48:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 681C7606CF;
	Mon, 16 Feb 2026 15:48:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A56471036908B;
	Mon, 16 Feb 2026 16:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771256919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BIVkq642iRNbk9Qof4l+eBGa8GoJwqA4mo/jgBwJtqg=;
	b=fVcFvJXWLG9tmBlBu/qnvoUCoI/ceEoJxguPye6Bx6qVx42/IpQ3k2DjoZKFp0HTCDGYAQ
	ygXPxQUqZJnU3zydGH/zBP/vxfCIqlL7okkCjxOkq/3TKJWi1ewujrHGAJnFDX1oTxXCAb
	LMwEZQ9GfQMTs9jnzzQxLcGon3TtfmPtA9+3Maf2cvYT8cZcDXNTu/CPOE+t/JcU6r/mfB
	axfcxpzc32KqltkLae6a9NwOrqze36wpA9xQUDLz3a18XnkocyRyaaa/3sYKthCim+YtVh
	viC2OpwQTIKE3akb0C/PKaRNEuzJq1GRZY5YsDgqFHrA3+5Ti1YrrhUoxWY8ng==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 16:48:35 +0100
Message-Id: <DGGI69KGL871.JD0YXGHLVBAH@bootlin.com>
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <bruce.ashfield@gmail.com>, <paul@pbarker.dev>, <elmehdi.younes@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Harish Sadineni" <Harish.Sadineni@windriver.com>, "Yoann Congal"
 <yoann.congal@smile.fr>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v6 09/14] selftest/cases/runtime_test: Add
 test for Linux Rust sample
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
 <20260212181039.1826154-5-Harish.Sadineni@windriver.com>
 <DGFKTMA2S0AH.2FYRLKHRWQT5I@bootlin.com>
 <DGFP3A56EZTR.1TWUE93WL575C@smile.fr>
 <7d5ca94b-0062-44ae-b941-5401bbc56aae@windriver.com>
In-Reply-To: <7d5ca94b-0062-44ae-b941-5401bbc56aae@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 15:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231214

On Mon Feb 16, 2026 at 2:09 PM CET, Harish Sadineni wrote:
>
> On 2/15/2026 10:31 PM, Yoann Congal wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Sun Feb 15, 2026 at 2:40 PM CET, Mathieu Dubois-Briand wrote:
>>> On Thu Feb 12, 2026 at 7:10 PM CET, Harish via lists.openembedded.org S=
adineni wrote:
>>>> From: Yoann Congal<yoann.congal@smile.fr>
>>>>
>>>> This new case tests that the rust_mininal sample inside the kernel sou=
rce
>>>> tree is buildable and works properly: check that the module can be
>>>> loaded and that it prints correctly.
>>>>
>>>> Signed-off-by: Yoann Congal<yoann.congal@smile.fr>
>>>> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>>>> ---
>>> Hi Harish, Yoann,
>>>
>>> It looks like this test is still a bit intermittent:
>>>
>>> 2026-02-15 09:27:44,140 - oe-selftest - INFO - runtime_test.RustKernel.=
test_kernel_rust_sample (subunit.RemotedTestCase)
>>> 2026-02-15 09:27:44,142 - oe-selftest - INFO -  ... FAIL
>>> ...
>>> 2026-02-15 09:27:44,142 - oe-selftest - INFO - 11: 13/57 404/671 (87.99=
s) (0 failed) (runtime_test.RustKernel.test_kernel_rust_sample)
>>> 2026-02-15 09:27:44,142 - oe-selftest - INFO - testtools.testresult.rea=
l._StringException: Traceback (most recent call last):
>>>    File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/o=
penembedded-core/meta/lib/oeqa/selftest/cases/runtime_test.py", line 506, i=
n test_kernel_rust_sample
>>>      self.assertEqual(status, 1, "Loading rust_minimal module failed!")
>>>      ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>    File "/usr/lib/python3.13/unittest/case.py", line 907, in assertEqua=
l
>>>      assertion_func(first, second, msg=3Dmsg)
>>>      ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>>>    File "/usr/lib/python3.13/unittest/case.py", line 900, in _baseAsser=
tEqual
>>>      raise self.failureException(msg)
>>> AssertionError: 0 !=3D 1 : Loading rust_minimal module failed!
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3319
>> This is oe-selftest-armhost on ubuntu2504-vk-arm1.
> Hi Yoann, Mathieu,
>
> I tried few builds locally, but not able to reproduce this.
>
> On the autobuilder, We ran following builds which were completed=20
> successfully on ubuntu2504-vk-arm1:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3326
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3331
>
> Additionally, One of Mathieu's build also ran successfully on=20
> oe-selftest-armhost ubuntu2504-vk-arm1:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3323
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3323>
>  From what I can see, build 3319=20
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3319>=
was=20
> triggered from a-full/3219=20
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3219>=
:
> However, when checking a-full/3219, it triggered build 3317=20
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3317>=
,=20
> where the rust kernel selftest passed.
>
> I can see few other builds were successful on oe-selftest-armhost with=20
> this patch series. I=E2=80=99m not sure why the failure occurred in this =
case.
> Mathieu, could you please try running a few additional builds to see if=
=20
> it reproduces?
>
> Thanks,
> Harish

Sure, I will launch a few builds and see how it goes.

AB maintenance will begin soon, so I will start either later today or
tomorrow morning.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


