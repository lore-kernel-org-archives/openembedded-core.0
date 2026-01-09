Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4363DD232ED
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 08:09:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5987.1767946150242163119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 00:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=s+7CS1m6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2A7441A273B
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 08:09:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EEE6560734;
	Fri,  9 Jan 2026 08:09:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0709C103C87D3;
	Fri,  9 Jan 2026 09:09:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767946147; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dDcTmH0VQMTzkngG9ceg3YNvlTP8qVQb7tsS0N8eGBA=;
	b=s+7CS1m6MAGMfxg8pv3AsBfUq/26x3cx0VIgmfcK7Mxea6o9ZoD9RX+V08hJsQt2p2daJ6
	kzRVwKgOOpL3J3O2bhQZiOgscQAC89CxB2IAT8S428ahOPP0BBn+7JfXAjrS6moKWI2EWP
	gZECLZcpLoSEj5//WpSL/p5jOXXJvGI35g5rxIZlzRhER3WJQ0yPCyXjv0I46XhpswTioX
	kL5AtKYPlYq7HlEw8Kuej+QCQDfHiRzrMOFuJOLiFrTWzrMu5ZBVIrDMpcXQmMF/+gIbsW
	cqQflqNFHcevZSWMS3/WNG1o3Qc9Qi5Utu4qX4+q3mH7LiQkoGgd1UDawX02gw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 09:09:04 +0100
Message-Id: <DFJWLQHKFVV3.3NP73J5UXWC0V@bootlin.com>
Subject: Re: [OE-core] [PATCH] fitimage: introduce FIT_CONF_STRIP_EXT
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dev@g0hl1n.net>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260107092600.73848-1-dev@g0hl1n.net>
In-Reply-To: <20260107092600.73848-1-dev@g0hl1n.net>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 08:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229094

On Wed Jan 7, 2026 at 10:26 AM CET, Richard Leitner via lists.openembedded.=
org wrote:
> Introduce a configuration variable named FIT_CONF_STRIP_EXT which
> removes the file-type extension from the configuration node name.
>
> This feature enables us to give configuration nodes arbritary names
> (based on the dtb file names). This is in my case needed to ensure
> consistent configuration names which where previously (walnascar)
> generated using a fitimage_emit_section_config:append() function.
>
> Signed-off-by: Richard Leitner <dev@g0hl1n.net>
> ---

Hi Richard,

Thanks for your patch.

It looks like this is making some selftest fail:

2026-01-08 18:18:47,312 - oe-selftest - INFO - fitimage.FitImagePyTests.tes=
t_fitimage_py_conf_extra_mappings_unused_error (subunit.RemotedTestCase)
2026-01-08 18:18:47,313 - oe-selftest - INFO -  ... ERROR
...
2026-01-08 18:18:47,313 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 1257, in test_fi=
timage_py_conf_extra_mappings_unused_error
    self._test_fitimage_py(bb_vars_overrides)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 1203, in _test_f=
itimage_py
    root_node.fitimage_emit_section_config(bb_vars['FIT_CONF_DEFAULT_DTB'],=
 bb_vars.get('FIT_CONF_MAPPINGS'))
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oe/fitimage.py", line 498, in fitimage_emit_section_con=
fig
    default_conf =3D self.configurations.sub_nodes[0].name
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^
IndexError: list index out of range

...
2026-01-08 18:18:47,317 - oe-selftest - INFO - fitimage.FitImagePyTests.tes=
t_fitimage_py_conf_mappings (subunit.RemotedTestCase)
2026-01-08 18:18:47,317 - oe-selftest - INFO -  ... ERROR
...
2026-01-08 18:18:47,322 - oe-selftest - INFO - fitimage.FitImagePyTests.tes=
t_fitimage_py_conf_mappings_unused_error (subunit.RemotedTestCase)
2026-01-08 18:18:47,322 - oe-selftest - INFO -  ... ERROR
...
2026-01-08 18:18:47,327 - oe-selftest - INFO - fitimage.FitImagePyTests.tes=
t_fitimage_py_conf_mappings_with_alias (subunit.RemotedTestCase)
2026-01-08 18:18:47,327 - oe-selftest - INFO -  ... ERROR
...
2026-01-08 18:18:47,338 - oe-selftest - INFO - fitimage.FitImagePyTests.tes=
t_fitimage_py_default_dtb (subunit.RemotedTestCase)
2026-01-08 18:18:47,339 - oe-selftest - INFO -  ... ERROR

I did not copy all the errors, as they are all similar to the first one.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2989
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2880
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3127

Can you have a look at these issues?

Note, I had merge conflicts on your patch, so maybe my resolution was
incorrect. If that's the case, can you rebase on master before sending
the new version?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


