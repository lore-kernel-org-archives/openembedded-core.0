Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDAEF47CC7
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:59:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53498.1772740779595315764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 11:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2RLFOubV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04F94C4041E
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 19:59:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 314DA5FF89;
	Thu,  5 Mar 2026 19:59:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5090103683D0;
	Thu,  5 Mar 2026 20:59:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772740776; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tCuJJSewHOlP2ms4UF2aV9fxT0Jnki+Cnwv2pbhORkA=;
	b=2RLFOubVy1HcOB5tX0MhHLfw8jug3qtuqRe4xDTPvFSYy+GSP1KkmzJjz7DLyLIScyc2Ey
	PcZUxZ7K+O/qSoMK2XRLJWfFJuMu9UmOsZaKw9Axbm9nvhknFe16n73C4lYDjClbRcPhJu
	K79GqrmWTS07uv/uUHqhmmypgANeL5Tn5IsbDfV+WJ2EccftIZNha2rzck13ZgYzfm2Xp9
	VcVqxRvubSyTngGBW/93ww7oVSidLeCzP9G7on/0WvnxUDwGIUJCN3pwekOlrTsxKqgJJu
	opHbQvz391uvdJQ1O5llD4Zj3Eu24skqPUJm0eMJd3ZOebPeyfBztB4+rSZH4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 20:59:35 +0100
Message-Id: <DGV45PC0NCMV.3ROO7I3AKRMMM@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v5 00/13] Add SPDX 3 Recipe Information
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 19:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232516

On Wed Mar 4, 2026 at 5:44 PM CET, Joshua Watt via lists.openembedded.org w=
rote:
> Changes the SPDX 3 output to include a "recipe" package that describe
> static information available at parse time (without building). This is
> primarily useful for gathering SPDX 3 VEX information about some or all
> recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
> vex.bbclass.
>
> Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
> helping work through this.
>
> V2: Fixes a bug where do_populate_sysroot was running when it should not
> be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
> incorrect (this is already handled by bitbake in the taskgraph, and
> doesn't need to be manually removed).
>
> V3: Fixes a bug where meta-world-recipe-sbom was reporting a circular
> dependency. meta-world-recipe-sbom also no longer runs in world builds,
> as there's no reason to this. Finally, fixes a bug where
> NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
> (because do_unpack was not run).
>
> V4: Fixes test cases. Adds SPDX_PACKAGE_INCLUDE_VEX to control if VEX
> information is linked to binary packages, or just recipes. Defaults to
> "0" to significantly reduce the size of the SPDX output.
>
> V5: Fixes dummy-sdk-packages to not generate SPDX output, since it
> does funny things with its arch which prevents it from rebuilding SPDX
> data properly, and no SPDX data is needed for it anyway
>
> Joshua Watt (13):
>   llvm-project-source: Use allarch.bbclass
>   gcc-source: Use allarch.bbclass
>   spdx3: Add recipe SPDX data
>   spdx3: Add recipe SBoM task
>   spdx3: Add is-native property
>   spdx30: Include patch file information in VEX
>   spdx: De-duplicate CreationInfo
>   spdx_common: Check for dependent task in task flags
>   spdx30: Skip install package CVE information
>   dummy-sdk-package: Disable SPDX
>   spdx: Remove fatal errors for missing providers
>   spdx3: Use common variable for vardeps
>   glibc-testsuite: Do not generate SPDX
>
>  meta/classes-global/sstate.bbclass            |   4 +-
>  .../create-spdx-image-3.0.bbclass             |   4 +-
>  .../create-spdx-sdk-3.0.bbclass               |   4 +-
>  meta/classes-recipe/kernel.bbclass            |   2 +-
>  meta/classes-recipe/nospdx.bbclass            |   1 +
>  meta/classes/create-spdx-2.2.bbclass          |  15 +-
>  meta/classes/create-spdx-3.0.bbclass          |  87 ++-
>  meta/classes/spdx-common.bbclass              |  22 +-
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  meta/lib/oe/sbom30.py                         | 192 ++++---
>  meta/lib/oe/spdx30.py                         |   2 +-
>  meta/lib/oe/spdx30_tasks.py                   | 496 +++++++++++++-----
>  meta/lib/oe/spdx_common.py                    |  11 +
>  meta/lib/oeqa/selftest/cases/spdx.py          |  41 +-
>  .../glibc/glibc-testsuite_2.42.bb             |   1 +
>  meta/recipes-core/meta/dummy-sdk-package.inc  |   1 +
>  .../meta/meta-world-recipe-sbom.bb            |  29 +
>  .../clang/llvm-project-source.inc             |   8 +-
>  meta/recipes-devtools/gcc/gcc-source.inc      |  16 +-
>  19 files changed, 667 insertions(+), 270 deletions(-)
>  create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

Ok, we are almost there! We only have a selftest failure now:

2026-03-05 16:33:10,060 - oe-selftest - INFO - sysroot.SysrootTests.test_sy=
sroot_cleanup (subunit.RemotedTestCase)
2026-03-05 16:33:10,061 - oe-selftest - INFO -  ... FAIL
...
ERROR: sysroot-test-1.0-r0 do_create_spdx: Could not find a builds SPDX doc=
ument named build-sysroot-test-arch1

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3457
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3338
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3227

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


