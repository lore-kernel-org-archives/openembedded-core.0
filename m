Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41DCCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 14:13:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.21147.1758031996957923328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 07:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CVdGDJe8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 45990C8F462;
	Tue, 16 Sep 2025 14:12:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 926966061E;
	Tue, 16 Sep 2025 14:13:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4424D102F1709;
	Tue, 16 Sep 2025 16:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758031994; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=No6y3RfSBNqZIzjjnnP/UiNnk+/10xQ6BpMQj26dT5I=;
	b=CVdGDJe8hWDtc6X25mItNyUWHPtoS8nP1kI3Q38dCFy6JyPjAE0IBsKEmLUkP1uxdm5iyr
	OOLzezzs7n/kzG3gqfbMiUSB4ixeKEYRvDCY5lnICLzeEfy6oJmhrO0DY8+orHljywIw5P
	1un5YoQozfBzKA5ZxTsoi9gvDnEU+xv2rXxzFnb9fLCszmEnmgcYZa5/egpYsidmjsFuJS
	n3CJcCBxKU9Ig3vYzcLphxB8A4t/lzHX4APrZUOcidz9S5hPAfVEgG9sRk9F/eIKHyq0Im
	qBSpwgpk0Ky/8rtTyDRcPnnNlkRrEsznEQookN9/0Sd3Fk6/93V0mxZpovdLJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 16:13:11 +0200
Message-Id: <DCUABVK54RV2.1J4Y32K76D5W9@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] selftest/devtool: make 'git status' list
 all files separately
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250916130800.2616414-1-skandigraun@gmail.com>
In-Reply-To: <20250916130800.2616414-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 14:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223553

On Tue Sep 16, 2025 at 3:08 PM CEST, Gyorgy Sarvari via lists.openembedded.=
org wrote:
> By default, when running "git status", and git finds an untracked folder =
with some
> files in it, it lists only the folder, without the file content. In case =
the folder
> is already tracked, then the new/modified files inside the folder are dis=
played
> separately.
>
> Some tests rely on listing all the files separately to be able to determi=
ne the outcome
> of the test. As an example, test_devtool_git_submodules creates a patch t=
hat's stored
> in the meta layer. It verifies from git status that the patch is present =
in the layer.
> However, when using the default "git status" behavior, to be able to see =
the file listed,
> its parent folder must be tracked by git already, otherwise only the fold=
er is listed.
>
> Specifically vulkan-samples recipe is used for one devtools test, which v=
erifies patch
> creation in the layer, however an update[1] to the recipe removed all the=
 patches and the
> folder that stored them (as they became unneeded), which in turn broke th=
is test, because
> the test coulnd't find the newly created filename in git status output, b=
ecause it was
> stored in the folder that became untracked after the recipe update.
>
> To avoid this problem, add "--untracked-files=3Dall" argument to the git =
status request,
> which displays all untracked files, regardless of their parent folder's t=
racking-status.
>
> [1]: https://lists.openembedded.org/g/openembedded-core/message/223296
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

Thanks for your patch.

It looks like this is breaking some selftest. I used v1 of the patch,
but I believe the code is the same.

2025-09-16 12:37:31,459 - oe-selftest - INFO - devtool.DevtoolUpdateTests.t=
est_devtool_finish_modify_git_subdir (subunit.RemotedTestCase)
2025-09-16 12:37:31,460 - oe-selftest - INFO -  ... FAIL
...
2025-09-16 12:37:31,460 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/devtool.py", line 1657, in test_devtool_finish_modify_git_su=
bdir
    self._check_repo_status(os.path.dirname(recipefile), expected_status)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/devtool.py", line 135, in _check_repo_status
    self.fail('Unexpected modified file in line: %s' % line)
  File "/usr/lib/python3.11/unittest/case.py", line 703, in fail
    raise self.failureException(msg)
AssertionError: Unexpected modified file in line: ?? meta/recipes-support/d=
os2unix/dos2unix/0001-Add-a-comment.patch

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2337

Can you have a look at this, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


