Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876C9CD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 10:38:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7796.1778755127482387362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 03:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mJdGNUwX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 40B201A35B4;
	Thu, 14 May 2026 10:38:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D22E60495;
	Thu, 14 May 2026 10:38:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E99411AF8A6C;
	Thu, 14 May 2026 12:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778755120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XnZewtjqzmS9FuM/NcUjmkUOEvT4sUov0GEOHKHxCP4=;
	b=mJdGNUwXDlVG5KCj076Al3aoSrQxKn1G789nJzheAFSvyypPBEwk05mlxjr7hwPM7TJ4Kk
	5xH5NumGUUAQp553oB8cQtXrHwD1ZEN7IhE3XpviuHN6ei4YSu9PDQOOLeXn9S9HfFvX4J
	JBnT5LK0++tV2yWw2GtppoQP+9pmkoEhOFeakPZ5zFsajR88oHzU6Dml41WU5Bqxa7uGkf
	EGQIT9tti3v1DtmMf691HG11xuOVPsVJ5Efd31lpKDZDUoW6EBsBkhCgcIi2w86JKU5RiN
	5CHJRCzzEMM6SZIkrJBGIBhiGV8bg9TFIKpK3dLsvFngf84nDgAHXMPXvhN/rw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 12:38:33 +0200
Message-Id: <DIIC2A22J8TH.2IC6O1ZQ1MODS@bootlin.com>
Subject: Re: [OE-core][PATCH V5 1/7] recipeutils: add optional
 stable_upgrade parameter to get_recipe_upgrade_status
Cc: <alex.kanavin@gmail.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
In-Reply-To: <20260513052334.2271800-1-Qi.Chen@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 10:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237022

On Wed May 13, 2026 at 7:23 AM CEST, Chen Qi via lists.openembedded.org wro=
te:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> We want the ability to do stable version upgrades for recipes.
> To this end, add an optional stable_upgrade parameter to the
> get_recipe_upgrade_status function, which defaults to False and
> when enabled will try to get the latest stable version of the recipe.
>
> The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
> it, it will be used as the filter_regex. If it's not set explicitly,
> it means that there's no stable updates or the recipe hasn't been
> checked yet.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi Chen,

Thanks for the new version.

We got several selftest fails on the autobuilder:

2026-05-13 20:05:23,677 - oe-selftest - INFO - overlayfs.OverlayFSTests.tes=
t_mount_unit_not_set (subunit.RemotedTestCase)
2026-05-13 20:05:23,678 - oe-selftest - INFO -  ... FAIL
...
ERROR: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-37462=
/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb: A recipe uses=
 overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE =
configuration
ERROR: Parsing halted due to errors, see error messages above
...
2026-05-13 20:11:59,345 - oe-selftest - INFO - overlayfs.OverlayFSTests.tes=
t_wrong_mount_unit_set (subunit.RemotedTestCase)
2026-05-13 20:11:59,345 - oe-selftest - INFO -  ... FAIL
...
2026-05-13 20:22:13,763 - oe-selftest - INFO - recipetool.RecipetoolAppendT=
ests.test_recipetool_appendfile_add_bindir (subunit.RemotedTestCase)
2026-05-13 20:22:13,764 - oe-selftest - INFO -  ... FAIL
...
2026-05-13 20:23:11,171 - oe-selftest - INFO - recipetool.RecipetoolAppendT=
ests.test_recipetool_appendfile_add_machine (subunit.RemotedTestCase)
2026-05-13 20:23:11,172 - oe-selftest - INFO -  ... FAIL
...
2026-05-13 20:24:48,333 - oe-selftest - INFO - recipetool.RecipetoolAppendT=
ests.test_recipetool_appendfile_basic (subunit.RemotedTestCase)
2026-05-13 20:24:48,334 - oe-selftest - INFO -  ... FAIL
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3951
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3850
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3718

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


