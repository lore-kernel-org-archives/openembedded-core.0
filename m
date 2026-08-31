Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D089C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 18:43:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3379.1788201802143192869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 11:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vvHVq8MM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB1831A1911;
	Mon, 31 Aug 2026 18:43:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FD2560231;
	Mon, 31 Aug 2026 18:43:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0348611C79233;
	Mon, 31 Aug 2026 20:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788201799; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w1xqxz7HD/Iy4Ns+MDJW/Q7+6Pa9voSN+iXb2VySHBY=;
	b=vvHVq8MM8WRb/ye3EVqNUCDBqkukVwZ/4JBFDTxeWBRen1EExb2h98f/WZSdWamcueKWNs
	+mH3nbiyRD6iNfj3++fZoXnYOVks0eF7/G1YJgjyjGopj5Z506yfXJBS7LF3XOROxBkGl3
	SB1c6Sqosn2EnuSHkiCmvQitsq7LpBwEF+Ur6NZsfnDxRSUitjZgg9k/p4dCSF3UXhccfa
	LX/53agpEPuqkIA9CANVOQerIjPCEkgxjkvk1lHn3f8koJqf26UNzp919roTdVPx0iGCbP
	CcfgUo2F6BX71qOB8bkpASzS2RVwKOAEv53evnQTDebfc9/eKFhuKRuX74Xwaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 20:43:17 +0200
Message-Id: <DL3CMSSL7NVB.3VHN20632I39Y@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] oeqa/sdk: run the SDK's own copy of a
 host tool
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260830183616.4026354-1-twoerner@gmail.com>
In-Reply-To: <20260830183616.4026354-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 18:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244773

On Sun Aug 30, 2026 at 8:36 PM CEST, Trevor Woerner via lists.openembedded.=
org wrote:
> ensure_host_package() decides whether a test can run by looking for a
> package name in the SDK's host manifest, which establishes neither that
> the package is present nor that the command the test runs is the SDK's
> own. On an extensible SDK the manifest lists what the shipped sstate
> could provide, so a case can pass the check and then run a command that
> is not there, or one belonging to the build host.
>
> Ask the SDK for the command instead. An eSDK ships sstate for more than
> it installs, so when the command is missing devtool installs the recipe
> and the lookup runs again. A command that resolves outside the SDK now
> fails rather than reporting a result about the build host.
>
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---

Hi Trevor,

Thanks for your patch.

It looks like this is breaking the
meta_ide.MetaIDE.test_meta_ide_can_run_sdk_tests test:

2026-08-31 12:29:54,708 - oe-selftest - INFO - meta_ide.MetaIDE.test_meta_i=
de_can_run_sdk_tests (subunit.RemotedTestCase)
2026-08-31 12:29:54,709 - oe-selftest - INFO -  ... FAIL
...
2026-08-31 12:29:54,709 - oe-selftest - INFO - 12: 3/4 9/21 (127.32s) (0 fa=
iled) (meta_ide.MetaIDE.test_meta_ide_can_run_sdk_tests)
2026-08-31 12:29:54,709 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-co=
re/meta/lib/oeqa/selftest/cases/meta_ide.py", line 60, in test_meta_ide_can=
_run_sdk_tests
    bitbake('-c testsdk meta-ide-support')
    ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-co=
re/meta/lib/oeqa/utils/commands.py", line 236, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **o=
ptions)
  File "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-co=
re/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  -c testsdk meta-ide-support' returned non=
-zero exit status 1:
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/4509
https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/4500
https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/4614

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


