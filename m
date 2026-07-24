Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6330AC531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 05:45:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13294.1784871907119094048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 22:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cjJJsYSI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D8A6C1A11DA;
	Fri, 24 Jul 2026 05:45:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92E8060393;
	Fri, 24 Jul 2026 05:45:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42CE811C1191C;
	Fri, 24 Jul 2026 07:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784871903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9DMdaDIE4pOioojk+TgGEl1PhVRDI+JCCgk7u2Cc/0E=;
	b=cjJJsYSIfx7VQM9NXbjkqcwvkEn87IiyDCtSy6DJM2sT3cLGuazlucZu5I9CxIUQbdkdVb
	5k8S11BwVmpFvYZbiplxCXRFPZX61jzHwIpKDv+ztUxdKdTNfvBlAM0J42giuC9GRmjftt
	FMhJfuS860zWmwk5ZeZLIfn6ClyjLHujV0UryvJ7gqBBvckBpS7F3GzYJPqQZEcrt+rl+j
	iplBbLzuQBOWZShNl7ExVQFBJZ6Xdp45+KzWTNXKgVRr5oZ9ygBbMjm2tQnb3VDy9yIzTN
	IucsyAAv+ISWI/cHOzMIhN4sslFsL6DENULLIVKqtTnVg6BN8J9aGWJMbWAFLw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 07:45:00 +0200
Message-Id: <DK6KA7IUOBHF.1Y7RDS9QCNL4T@bootlin.com>
To: <jamin_lin@aspeedtech.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
 <alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
Subject: Re: [OE-core] [PATCH v3 1/5] devtool: Detect nested git repos
 before the initial workspace commit
Cc: "Troy Lee" <troy_lee@aspeedtech.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260723081118.1558249-1-jamin_lin@aspeedtech.com>
 <20260723081118.1558249-2-jamin_lin@aspeedtech.com>
In-Reply-To: <20260723081118.1558249-2-jamin_lin@aspeedtech.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 05:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241898

On Thu Jul 23, 2026 at 10:11 AM CEST, Jamin Lin via lists.openembedded.org =
wrote:
> setup_git_repo() is meant to convert a git repo that a recipe unpacks
> inside S (e.g. via multiple git SRC_URI entries with different
> destsuffix values) into a regular git submodule, so devtool can later
> tag branches on it and extract patches from it via finish/update.
>
> That detection never actually triggers, because of the order the
> function runs things in:
>
>   1. 'git init'
>   2. 'git add -A .' + initial commit  <- commits the nested repo as a
>                                          bare, unregistered gitlink
>   3. checkout devbranch, tag basetag
>   4. scan 'git status --porcelain' for still-untracked directories
>      ("?? <dir>/") and convert any that are git repos into submodules
>
> By the time step 4 runs, the nested repo was already swept up by step
> 2's 'git add -A .': git treats a directory containing its own .git as
> an embedded repo and stages it as a gitlink pointing at its current
> HEAD, without registering it as a submodule. Once that gitlink is
> committed, 'git status --porcelain' reports it as e.g. " M leveldir"
> (already tracked) rather than "?? leveldir/" (untracked), so step 4's
> "line.endswith('/')" check can never match it, and the conversion to a
> real submodule silently never happens.
>
> This isn't just a missed feature: an unregistered gitlink that has its
> own untracked content (e.g. a further nested git repo underneath it)
> shows up as "dirty" to git status even though the tracked commit hash
> hasn't changed. patch.bbclass's patch_task_postfunc sees that dirtiness
> after do_patch and tries to commit it, but 'git add' has nothing new to
> stage for a gitlink whose hash is unchanged, so the follow-up 'git
> commit' fails with "nothing to commit" and do_patch fails outright.
>
> Fix this by moving the nested-repo detection and submodule conversion
> to run right after 'git init', before 'git add -A .' and the initial
> commit. At that point the nested repo is still untracked and reported
> with a trailing "/", so it's correctly picked up and registered via
> 'git submodule add' before anything commits it as a bare gitlink.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---

Hi Jamin,

Thanks for your patch.

It looks like this is breaking two selftests:

2026-07-23 17:18:01,965 - oe-selftest - INFO - devtool.DevtoolUpgradeTests.=
test_devtool_finish_update_patch (subunit.RemotedTestCase)
2026-07-23 17:18:01,966 - oe-selftest - INFO -  ... FAIL
...
2026-07-23 17:18:01,967 - oe-selftest - INFO - 1: 20/50 268/758 (81.53s) (0=
 failed) (devtool.DevtoolUpgradeTests.test_devtool_finish_update_patch)
2026-07-23 17:18:01,967 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 2629, in test_de=
vtool_finish_update_patch
    self._check_repo_status(recipedir, expected_status)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 138, in _check_r=
epo_status
    self.fail('Unexpected modified file in line: %s' % line)
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
    raise self.failureException(msg)
AssertionError: Unexpected modified file in line:  D recipes-extended/sysdi=
g/sysdig-selftest/0055-Add-cstdint-for-uintXX_t-types.patch
...
2026-07-23 18:03:48,429 - oe-selftest - INFO - devtool.DevtoolModifyTests.t=
est_devtool_modify_nested_gitsm (subunit.RemotedTestCase)
2026-07-23 18:03:48,429 - oe-selftest - INFO -  ... FAIL
...
2026-07-23 18:03:48,430 - oe-selftest - INFO - 12: 15/38 645/758 (50.47s) (=
0 failed) (devtool.DevtoolModifyTests.test_devtool_modify_nested_gitsm)
2026-07-23 18:03:48,430 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 1256, in test_de=
vtool_modify_nested_gitsm
    result =3D runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'devtool modify devtool-test-git-gitsm -x /tmp/devt=
oolqac4wc88gw' returned non-zero exit status 1:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4411
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4358
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4177

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


