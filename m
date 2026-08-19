Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72121C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 07:10:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1724.1787123439592342466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 00:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=j+L7Qvs4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5CDF71A1728;
	Wed, 19 Aug 2026 07:10:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22B095FF42;
	Wed, 19 Aug 2026 07:10:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A22A911C75363;
	Wed, 19 Aug 2026 09:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787123436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=spkeDoSnPtVFKU9hh+y2+z7OEKeWNC88yJuPqoIxLvg=;
	b=j+L7Qvs4CmkhBDlK24i5iQOUm2m1i4X34lRVeq6oK2dqXhfaCk8KHjzVfN7yN+KA+VssNg
	oDBU2RlyUt02CPTupPOvmCuOKU/px8dOjxMqaob/cxJ1hkYLZT8ZGF2j4K9U+yrW96mo5r
	PkshCLa14fsCDAoi0cPTnhSR4fgn2n1TwY5q11NJD3Uhk0MycJsXRRktzogEOQIBEXlHcL
	jcoTmbwJ0HNbrl2F2XQht3PhyQ/P95YE8IxE9yI6b8gitb0qW19hxOSIcpSm8O+Pk0RTRF
	yMppVaeGr+2bAMWkFUlApH4o1P8b7EDN4IKAAg3BUU3hLrETzbdUZb1h86MMnA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 09:10:31 +0200
Message-Id: <DKSQDUJXCH0M.30UUJLHJY0D9H@bootlin.com>
Subject: Re: [PATCH v15 01/12] package_rpm.bbclass: Drop external dependency
 generator to support rpm 6
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "mattware@cisco.com"
 <mattware@cisco.com>, "esparlin@cisco.com" <esparlin@cisco.com>,
 "peter.marko@siemens.com" <peter.marko@siemens.com>, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Gavini, Sumanth" <sumanth.gavini@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
 <20260816231104.3871015-2-sumanth.gavini@windriver.com>
 <DKR3DBY7HJGC.1DTHOPVL8ZOS8@bootlin.com>
 <0687c7a0-8f97-4750-bbf0-e8c18772f293@windriver.com>
 <DKRAVGZFGDPM.LZPQQB1MV24E@bootlin.com>
In-Reply-To: <DKRAVGZFGDPM.LZPQQB1MV24E@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 07:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243716

On Mon Aug 17, 2026 at 4:48 PM CEST, Mathieu Dubois-Briand wrote:
> On Mon Aug 17, 2026 at 3:34 PM CEST, Sumanth Gavini wrote:
>> Hi Mathieu,
>>
>> Thanks for testing v15.
>>
>> The pkgconfig() errors are likely from old sstate packages built before
>> v15. Our change to package_rpm.bbclass invalidates do_package_write_rpm
>> sstate for all packages (the class code is part of the task hash), so a
>> clean build should regenerate all RPMs with consistent metadata and=20
>> clear the errors.
>>
>> Could you trigger a clean build on the autobuilder without reusing
>> existing sstate? Also, if you can reproduce locally with a clean build,
>> that would help confirm whether the issue is the sstate transition or
>> something else in our fix.
>
> I can't really do a clean build without the sstate cache, sorry. Or at
> least not just by myself. Cleaning the cache on the autobuilder, will
> fix the build on the autobuilder, but not for any other user that will
> have the previous objects in the cache. So it means we could be breaking
> the build for some users.
>
> What I could do is, as for last week, forcefully increase PR on a bunch
> of recipes, to force a rebuild. This can be used to tests that
> everything works fine on the autobuilder when everything is rebuilt from
> scratch, but probably could bot be merged as-is.
>
> Weekly maintenance will happen soon, so I can't do that right now, but I
> will try to launch such a build tomorrow.
>
> Mathieu

Ok, so I finally managed to have a working build without sstate cache.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4508

Some builds are still in progress, but we can probably already get some
conclusions:
- We do not see any installation issue. So the issues we had are
  probably related to the sstate cache in some way.
- We have one selftest failure, described below. I believe we already
  had that one with the previous iteration of this series.

2026-08-19 00:02:09,674 - oe-selftest - INFO - runtime_test.Postinst.test_f=
ailing_postinst (subunit.RemotedTestCase)
2026-08-19 00:02:09,681 - oe-selftest - INFO -  ... FAIL
...
2026-08-19 00:02:09,683 - oe-selftest - INFO - 5: 27/36 295/762 (7157.38s) =
(0 failed) (runtime_test.Postinst.test_failing_postinst)
2026-08-19 00:02:09,683 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/runtime_test.py", line 409, in test=
_failing_postinst
    self.assertGreaterEqual(bb_result.output.find("Postinstall scriptlets o=
f ['postinst-rootfs-failing'] have failed."), 0,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        "Warning about a failed scriptlet not found in bitbake output: %s" =
%(bb_result.output))
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.14/unittest/case.py", line 1315, in assertGreaterE=
qual
    self.fail(self._formatMessage(msg, standardMsg))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
    raise self.failureException(msg)
AssertionError: -1 not greater than or equal to 0 : Warning about a failed =
scriptlet not found in bitbake output: NOTE: Reconnecting to bitbake server=
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4599
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4425
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4649

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


