Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4523EC531D1
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:07:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25755.1784819257175423875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 08:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qDxz802F;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D655E4E40F12;
	Thu, 23 Jul 2026 15:07:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AF4C602B8;
	Thu, 23 Jul 2026 15:07:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01A6F11C10C9F;
	Thu, 23 Jul 2026 17:07:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784819253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1CaQ3sjoxWfi7QpFmDQnkmm3myizkrgssUtRZfTiin0=;
	b=qDxz802FkPBk7nLAu/GnuzYrT3N8bHahg+/dP3jd5rbeb2p7CisLIkw6JVkN0KPonKvtHM
	iVn2ePgLfX8VZnE9UFRIJN9KG5HCeJz+c1ENmVLT77GfrQmOiBL1wlzQEpH4j8UhhtB1T9
	dOmEay8sHBHNzaV9kVBA8PsvSu5rMnKEc5ql86Z16QxfR9/7D+8OMXpgs7m8EqZNXkHa3S
	a7G7OyEoLSDsKd3Hr1Xpi/T7ioTt7FcUI+8UBlP8ZPCDQE8HbnfUgyniLXBpPUCHhkJd+c
	1eQky2AXuRo/vHFJypyP4V0dqK95cWCAa+Jk3ljTH0t7wpxO0duAB3UWhMFVjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 17:07:30 +0200
Message-Id: <DK61MC7B9VH0.2408UF4LVISPP@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bbnpreetsingh@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] devtool: standard: guess srcrev update
 mode for gitsm:// recipes too
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Chris Laplante"
 <chris.laplante@agilent.com>, "Peter Kjellerstedt" <pkj@axis.com>, "Adrian
 Freihofer" <adrian.freihofer@siemens.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260723060209.8-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20260723060209.8-1-bbnpreetsingh@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 15:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241855

On Thu Jul 23, 2026 at 8:02 AM CEST, Baban via lists.openembedded.org wrote=
:
> 'devtool update-recipe' and 'devtool finish' default to guessing the
> recipe update mode: 'srcrev' when the source tree HEAD sits on the
> upstream branch (the "checked out another upstream revision" workflow),
> 'patch' otherwise. The guesser matches SRC_URI entries against a
> literal 'git://' prefix, so a gitsm:// recipe never has any git URIs
> from its point of view and always falls into patch mode.
>
> In that case there are no local commits to export either, so checking
> out a different upstream revision and running update-recipe reports
> "No patches or files need updating" and silently leaves the recipe's
> SRCREV untouched, while the same operation on a git:// recipe updates
> SRCREV. Forcing -m srcrev works, since _update_recipe_srcrev() is
> scheme-agnostic; only the guess is broken.
>
> Accept gitsm:// URIs the same way e7076f1742 ("devtool: gitsm://
> should be handled same as git:// in upgrades") did for the upgrade
> path, where the same omission was fixed; the guesser itself dates from
> 9b9733b7d7 (2015), before gitsm handling was a consideration.
>
> Note this changes the guessed mode for existing gitsm:// recipes from
> 'patch' to 'srcrev' when HEAD is on the upstream branch =E2=80=94 the beh=
avior
> git:// recipes have had since 2015. Trees carrying local commits still
> guess 'patch', because their HEAD is not reachable from the upstream
> branch.
>
> AI-Generated: Uses Claude (claude-sonnet-5)
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---

Hi Babanpreet,

Thanks for your patch.

It looks like this is breaking some selftests:

2026-07-23 11:11:54,785 - oe-selftest - INFO - devtool.DevtoolUpdateTests.t=
est_devtool_git_submodules (subunit.RemotedTestCase)
2026-07-23 11:11:54,786 - oe-selftest - INFO -  ... FAIL
...
2026-07-23 11:11:54,786 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 1960, in test_dev=
tool_git_submodules
    self._check_repo_status(recipedir, expected_status)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 140, in _check_re=
po_status
    self.fail('Missing file changes: %s' % expected_status)
  File "/usr/lib/python3.11/unittest/case.py", line 703, in fail
    raise self.failureException(msg)
AssertionError: Missing file changes: [(' M', '.*/vulkan-samples_git.bb$'),=
 ('??', '.*/vulkan/vulkan-samples/$')]
...
2026-07-23 11:53:42,632 - oe-selftest - INFO - devtool.DevtoolUpgradeTests.=
test_devtool_finish_update_patch (subunit.RemotedTestCase)
2026-07-23 11:53:42,632 - oe-selftest - INFO -  ... FAIL
...
2026-07-23 12:43:54,062 - oe-selftest - INFO - devtool.DevtoolModifyTests.t=
est_devtool_modify_nested_gitsm (subunit.RemotedTestCase)
2026-07-23 12:43:54,062 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4355
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4355

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


