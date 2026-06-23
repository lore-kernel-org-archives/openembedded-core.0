Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3C3CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 09:29:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16788.1782206944908985254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 02:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mEYPAY68;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 94D451A0871
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 09:29:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61713601C2;
	Tue, 23 Jun 2026 09:29:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E00ED106C83AD;
	Tue, 23 Jun 2026 11:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782206942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xPTzpAU969zSvnf7gnYRfy3CQZriPUqhZaJoCUvvwWg=;
	b=mEYPAY68j2y3DCiWik6x0BLk2BkEfky6siCQ2BEPgTB6keE0jQpw5fkqr9Cn7mFKWXYFgI
	1PSwaNcRrwmXncjJ3XvAVjTyLoQZFJfptchhV8rcmM+9/2xZ1jPxuOweMGnaY80FRjsBjw
	GBMByLWaPCbd2hcziO3h/dJ3BgAKZsPvCqGCcLsRQdLSfD7p/5fdlXqWshJRbGAV/z8F7y
	dwj1r/erYxAI2af96jqYy10r7hKjlhy7BsNBuarXvo8JfstM497ucGlZw2QIxH5jZwDhJx
	K70KXZZ5IXV7u64/T40g5sLVAjLKbFuig1kHnNUFbXgRyelILG3R4nN4EJivlA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 11:28:58 +0200
Message-Id: <DJGBMSUJFJ0M.2OQLN1VTUVDZV@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Joshua Watt" <jpewhacker@gmail.com>
Subject: Re: [OE-core][PATCH v2 0/5] Implement SPDX for deploy tasks
Cc: <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
 <20260618165032.347436-1-JPEWhacker@gmail.com>
 <DJEHMH0KYGRH.1BI8DRKQCG0R8@bootlin.com>
 <CAJdd5GZm27XJuaWYeRJ=bTHePXgr27wmTv+A4=xkn7dUkVWvHg@mail.gmail.com>
In-Reply-To: <CAJdd5GZm27XJuaWYeRJ=bTHePXgr27wmTv+A4=xkn7dUkVWvHg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 09:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239342

On Mon Jun 22, 2026 at 11:14 PM CEST, Joshua Watt wrote:
> On Sat, Jun 20, 2026 at 11:45=E2=80=AFPM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
>>
>> On Thu Jun 18, 2026 at 5:38 PM CEST, Joshua Watt via lists.openembedded.=
org wrote:
>> > The SPDX use case for file system image has been well defined since SP=
DX
>> > was first implemented, however there has always been a desire to also
>> > express SPDX output for other non-image deliverables (primarily, those
>> > that have a do_deploy task or similar). These types of tasks cannot
>> > easily use the traditional method of having a separate SPDX task that
>> > runs to create their SPDX output as this causes lots of problems with
>> > the way dependencies are specified. Instead, it is desirable for these
>> > tasks to directly produce SPDX output that can be consumed by other
>> > tasks that depend on them.
>> >
>> > This patch series adds support for this. Any sstate task that starts
>> > with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
>> > will run a postfunc to generate SPDX output that describes what is bei=
ng
>> > deployed. For classical do_deploy tasks, this is setup to be easy by
>> > automatically capturing all the deployed output files in the SPDX data=
,
>> > but other tasks can be added as well.
>> >
>> > Finally, the do_create_image_spdx task is removed and replaced with a
>> > SPDX deploy postfunc using this new system. This means that any task
>> > that depends on do_image_complete will automatically also get the SPDX
>> > output for the image, simplifying the dependency handling.
>> >
>> > V2: Fixed SPDX documents missing at SBoM creation time when the
>> > documents were not a direct dependency of the SBoM, and were present i=
n
>> > a sstate object. Previously, these sstate objects were not restored
>> > because they were "covered" by the later sstate tasks, but now they ar=
e
>> > restored if they are depended on by a task that creates SPDX output.
>> >
>>
>> Hi Joshua,
>>
>> Thanks for the new version, but I'm still seeing some errors on the
>> autobuilder:
>>
>> ERROR: systemd-boot-259.5-r0 do_deploy_setscene: Recipe systemd-boot is =
trying to install files into a shared area when those files already exist. =
The files and the manifests listing them are:
>>   /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core=
2-32/by-task/systemd-boot:do_deploy.spdx.json
>>     (matched in manifest-qemux86-systemd-boot.deploy)
>>   /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core=
2-32/deploy/systemd-boot-do_deploy-deploy.spdx.json
>>     (matched in manifest-qemux86-systemd-boot.deploy)
>>   /srv/pokybuild/yocto-worker/wic/build/build/tmp/deploy/spdx/3.0.1/core=
2-32/by-spdxid-hash/c0/c00d8889d28fc9521178ce481c8e76cfc116eb5f57bb1c1bb7d9=
d98271b16e07.spdx.json
>>     (matched in manifest-qemux86-systemd-boot.deploy)
>> Please adjust the recipes so only one recipe provides a given file.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3927
>>
>> 2026-06-20 11:34:04,962 - oe-selftest - INFO - spdx.SPDX30Check.test_bar=
emetal_helloworld (subunit.RemotedTestCase)
>> 2026-06-20 11:34:04,963 - oe-selftest - INFO -  ... FAIL
>> ...
>> 2026-06-20 11:34:04,963 - oe-selftest - INFO - testtools.testresult.real=
._StringException: Traceback (most recent call last):
>>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 155, in test_bare=
metal_helloworld
>>     self.check_objset_missing_ids(objset)
>>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 73, in check_objs=
et_missing_ids
>>     self.assertTrue(
>>   File "/usr/lib/python3.11/unittest/case.py", line 715, in assertTrue
>>     raise self.failureException(msg)
>> AssertionError: False is not true : The following SPDXIDs are unresolved=
:
>>   http://spdxdocs.org/openembedded-alias/by-doc-hash/de503ed2af15b13f05a=
8f9025f181bbb421f080060947c2e31b480bd76d017b7/linux-libc-headers/UNIHASH/re=
cipe/linux-libc-headers
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4105
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3936
>
> Mathieu, I looked at these links, but they do not seem to be related
> to the error you listed; are they perhaps wrong? If so can you provide
> the correct links?
>
> Thanks
>

I believe the links are correct, but maybe the fact that we have
unrelated (weston) failures is a bit misleading.

Yet I confirm we have test_baremetal_helloworld failures:
- lines 7695 / 7803 of https://autobuilder.yoctoproject.org/valkyrie/?#/bui=
lders/35/builds/4105/steps/15/logs/stdio
- lines 7330 / 7478 of https://autobuilder.yoctoproject.org/valkyrie/#/buil=
ders/48/builds/3936/steps/15/logs/stdio

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


