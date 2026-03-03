Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E141EEC1458
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 14:08:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19070.1772546894080647087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 06:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XZPS00vp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 648C21A2381;
	Tue,  3 Mar 2026 14:08:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A3A75FF29;
	Tue,  3 Mar 2026 14:08:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3A8710368E84;
	Tue,  3 Mar 2026 15:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772546891; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qLQv0GA1RHnpiffHSNtsO0kQ3czGhv+oINjBeR9Ob+A=;
	b=XZPS00vpKYnZC181nfaCBZu3gd6X48/lFUL4rYPDFs2ejdZT4UaodILTH+YTv+CmLiiNvz
	S8fwzOdemvG+huOKg5xRwRPOkjl9UsU5fwShppvSgwPW9078zi1lXrMm05sKQ+6CPWXtPl
	ee9lna+ZYN8P1kohooeBsnTYLTzsUaxa+eVN6PzMmbFEVL67H5ZE8HFZBPcCZGWrmxyuS2
	INirTwYODt/GoSKbSW0YPKgT7IF4k8gBR4c7Pld2Qq2Djd9OJ+Y0/vDZdQla0psm7EtVx1
	wqhgbvZC3TBQLeszSLzZvtiNHeGWuFxZNnnInyD5a6qad1CIdiYBNNb9G/yrVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 15:08:10 +0100
Message-Id: <DGT7FJWBOCBA.17TLESQGK34QL@bootlin.com>
Subject: Re: [OE-core][PATCH v4 0/9] Add SPDX 3 Recipe Information
Cc: <benjamin.robin@bootlin.com>, <ross.burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
 <20260303004550.650726-1-JPEWhacker@gmail.com>
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 14:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232317

On Tue Mar 3, 2026 at 1:43 AM CET, Joshua Watt via lists.openembedded.org w=
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
> Joshua Watt (9):
>   llvm-project-source: Use allarch.bbclass
>   gcc-source: Use allarch.bbclass
>   spdx3: Add recipe SPDX data
>   spdx3: Add recipe SBoM task
>   spdx3: Add is-native property
>   spdx30: Include patch file information in VEX
>   spdx: De-duplicate CreationInfo
>   spdx_common: Check for dependent task in task flags
>   spdx30: Skip install package CVE information
>
>  meta/classes-global/sstate.bbclass            |   4 +-
>  .../create-spdx-image-3.0.bbclass             |   4 +-
>  .../create-spdx-sdk-3.0.bbclass               |   4 +-
>  meta/classes-recipe/kernel.bbclass            |   2 +-
>  meta/classes-recipe/nospdx.bbclass            |   1 +
>  meta/classes/create-spdx-2.2.bbclass          |  12 +-
>  meta/classes/create-spdx-3.0.bbclass          |  92 +++-
>  meta/classes/spdx-common.bbclass              |  22 +-
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  meta/lib/oe/sbom30.py                         | 192 ++++---
>  meta/lib/oe/spdx30.py                         |   2 +-
>  meta/lib/oe/spdx30_tasks.py                   | 488 +++++++++++++-----
>  meta/lib/oe/spdx_common.py                    |  11 +
>  meta/lib/oeqa/selftest/cases/spdx.py          |  41 +-
>  .../meta/meta-world-recipe-sbom.bb            |  29 ++
>  .../clang/llvm-project-source.inc             |   8 +-
>  meta/recipes-devtools/gcc/gcc-source.inc      |  16 +-
>  17 files changed, 669 insertions(+), 260 deletions(-)
>  create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

Hi Joshua,

Thanks for the new version, but it looks like one of the two errors is
still present on several builds:

ERROR: nativesdk-sdk-provides-dummy-1.0-r0 do_create_spdx: Could not find a=
 static SPDX document named static-nativesdk-sdk-provides-dummy

https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3310
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3262
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3282
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3267
...

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


