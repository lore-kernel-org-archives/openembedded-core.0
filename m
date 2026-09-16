Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257B8C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 06:49:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9021.1789541340333155569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 23:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2KV2ced2;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D89C0C5CD56
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 06:49:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA73A60337;
	Wed, 16 Sep 2026 06:48:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89EEB11C7AFD8;
	Wed, 16 Sep 2026 08:48:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789541337; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JOdF4iiUFXl62hssLmAdy6w5vPOMm+VKNgdocMRf+mU=;
	b=2KV2ced2DRY1OZys3QFfHB+r4Ke3eJfDdLrPhMLCGuhAWlMd0NUVPILQGszHAy/8YOu0UQ
	OLvfQFmpVKV7K6eIep9Q+XpH+MVL4ZEWpDQmXW9pJoC9oPHKEkxD2N/n0JCohoNmngd65c
	7brnrB9SMFfaxjclamw9dLyQJaNl5C84eCDaGJPBxccyubc6TYrQEm14g6yRE13fZg7X8K
	9ViOR820qC0CyFtESeBmrcOj+ZWbCalyS5Pf6usbjEufU5e2LGdQH0qLdPl8pMdMrry8GA
	bWzZnhu+Xizf/auIz22kaL1kBje8bAO4ol7E1ZcHzoquoS4tMX7Conlx8gtDoQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 08:48:55 +0200
Message-Id: <DLGJGK7BLL8S.3CPNDSZM9ZQZD@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/6] devtool ide-sdk: cleanups for the
 upcoming release
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260913200624.331753-1-adrian.freihofer@siemens.com>
In-Reply-To: <20260913200624.331753-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 06:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245929

Hi,

On Sun Sep 13, 2026 at 10:05 PM CEST, Adrian Freihofer via lists.openembedd=
ed.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> - Fix: opt-out of automatic IMAGE_INSTALL for recipes providing
>   virtual/kernel or virtual/bootloader (deployed via do_deploy, not
>   installed into the rootfs).
> - Feature: --ide now accepts a comma-separated plugin list
>   (--ide code,none), generating multiple IDE configs from one build -
>   this is what enables the test refactoring below.
> - Test overhaul: consolidate the GCC/Clang, ide=3Dcode/none and NFS/slirp
>   oe-selftest variants into one shared flow per toolchain, cutting qemu
>   boots/image builds while keeping the same coverage, plus dead-code
>   cleanup.
>
> Adrian Freihofer (6):
>   oe-selftest: devtool update: recipe drop dead code
>   devtool: ide-sdk: support opt-out from auto IMAGE_INSTALL
>   devtool: ide-sdk: add initialize_modified_recipe() plugin hook
>   devtool: ide-sdk: allow --ide to select multiple plugins
>   oe-selftest: devtool ide-sdk: consolidate GCC/Clang ide-sdk tests
>   devtool: ide-sdk: trim _add_broken_srctree_prefix_map docstring
>
>  meta/lib/oeqa/selftest/cases/devtool.py     | 1028 ++++++++-----------
>  scripts/lib/devtool/ide_plugins/__init__.py |    4 +
>  scripts/lib/devtool/ide_sdk.py              |  117 +--
>  3 files changed, 475 insertions(+), 674 deletions(-)

I've hit this issue at different occasion now:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8936796/raw_inlin=
e
Parent build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/b=
uilds/4895

Also:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8936698/raw_inlin=
e

I'm on this branch:
https://git.openembedded.org/openembedded-core-contrib/log/?id=3D2b273bd92e=
22d31b751d9c0f06df3f73182ae00b

To me there's nothing that stands out that could be related to these issues=
,
apart from this serie which was already merged to master.

Can you have a look?

Antonin

