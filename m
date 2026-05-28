Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE47FCD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 13:08:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10552.1779973716523346100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mJF8SodB;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5AB4B4E42D78
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:08:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1137F60495;
	Thu, 28 May 2026 13:08:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 628831088807A;
	Thu, 28 May 2026 15:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779973713; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HY6Xkx/W1aN5O8pFuvL14SYIqFAc68wLGdE6WrXjqj4=;
	b=mJF8SodBgmAeky5LWxhZ5OhiC0UtOA1dbNEhkaGSOq+4mfk4IV8qplMQh4CC0xiCa7YS+9
	I5Eng/xylnu1VhS0yePMQPuyc2+3SYv774VP3zlbucx4T30jfKMVxkaN9+jmJhNRy0Gfvs
	kE1QV0+Qghdm6kxt3ojOlI2GEGGpP+FvV9FC623nMgSx3tFSNDmOnqzBvkQgTMdmX0fjcR
	/tjjDuCo/V0l6be6elGuogOC3xwMyQ4R+TioyYFzB9IvBu7oipmHX8su9E3e17GlgG/hW/
	oJUboNAU/qsiH2qaQVNZ46CwL5+zLKErp/dFNNEZ+/oXPTismzpPuB2BA0kQOQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 15:08:30 +0200
Message-Id: <DIUC0PZ04O4R.Z6A4SM69JD8H@bootlin.com>
Subject: Re: [OE-core] [PATCH v4 0/4] Add missing SRCREV check for SCM URIs
Cc: <yoann.congal@smile.fr>, <corentin.guillevic@smile.fr>,
 <martin@geanix.com>, <paul@pbarker.dev>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <saisneha196@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260527111756.1306022-1-saisneha196@gmail.com>
In-Reply-To: <20260527111756.1306022-1-saisneha196@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237704

On Wed May 27, 2026 at 1:17 PM CEST, Sai Sneha via lists.openembedded.org w=
rote:
> This patch series adds a check for git:// (and other SCM) URIs in
> SRC_URI that are missing a corresponding SRCREV, addressing
> Bugzilla #16051 [1] and referencing Corentin Guillevic's RFC series [2].
>

Hi,

Thanks for your patch.

It looks like this is breaking the test_git_unpack_nonetwork selftest:

2026-05-28 09:51:08,030 - oe-selftest - INFO - bbtests.BitbakeTests.test_gi=
t_unpack_nonetwork (subunit.RemotedTestCase)
2026-05-28 09:51:08,030 - oe-selftest - INFO -  ... FAIL
...
ERROR: gitunpackoffline-0.0+git-r0 do_fetch: Bitbake Fetcher Error: FetchEr=
ror("Recipe uses a floating tag/branch '2.11' for repo 'git.yoctoproject.or=
g/matchbox-panel-2' without a fixed SRCREV yet doesn't call bb.fetch2.get_s=
rcrev() (use SRCPV in PV for OE).", None)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4009
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3916

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


