Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34B51099B2B
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:23:06 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18574.1774027379229970022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vQNK8E1M;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7AF45C5668D
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 17:23:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D567C600E0;
	Fri, 20 Mar 2026 17:22:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B7EB10450CC1;
	Fri, 20 Mar 2026 18:22:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774027376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zlZiGWHhCUfnrLEsDPh3XPh6Zfyu9rBBLAD2Gy9ziZs=;
	b=vQNK8E1MUnlO0hCkIgO4kDGUIpkH8lHb9Vk9mtMX78MBIB7B+pULnAssCuLMYXqDIF4WFq
	MZNNJwRYWd1Ulj5ibIuJzyJ81hh4SIrI1o/iKiZCchuD4su+GHTLgPYNe130XYzCMpPE+o
	LRfrIMqN0tQZYNucVjuhLIM3U32IxDsTwp0ClGaeQUcTPwJWpaTpXjgs6i8w2oZuJ59IKi
	GyuQS3XOsF87AIaNyHuYPlvGUeb3EX2/L4DLL/roWmA9iewjRYzJ+W8VB7CU5o6tZofSZk
	s2yflcC7/yGosIo1ocpwfjwwcRjIAkCRElcGtlOVzf3M4d3FG/95snYeAsgA4g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 18:22:54 +0100
Message-Id: <DH7S7WZ1RF7O.FSB1M0J2ZLLO@bootlin.com>
Subject: Re: [OE-core][PATCH v9 0/7] SPDX 3.0 SBOM enrichment and compliance
 improvements
Cc: <JPEWhacker@gmail.com>, "Stefano Tondo" <stefano.tondo.ext@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <stondo@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
In-Reply-To: <20260312153845.164369-1-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 17:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233630

On Thu Mar 12, 2026 at 4:38 PM CET, Stefano Tondo via lists.openembedded.or=
g wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> This series enhances SPDX 3.0 SBOM generation with enriched
> metadata, ecosystem-specific Package URLs, and compliance
> improvements.
>
> Changes since v8 (addressing Joshua Watt's review):
>
>   1/7: File exclusion now uses re.compile() for proper regex
>        matching instead of substring matching. Excluded files
>        are tracked in a set() returned from add_package_files()
>        and passed to get_package_sources_from_debug() for
>        precise cross-checking.
>
>   2/7: Unchanged (Reviewed-by added).
>
>   3/7: Fixed npm_spdx_name() to use bpn[5:] instead of bpn[4:]
>        since "node-" is 5 characters.
>
>   4/7: Dropped PV fallback for non-Git source versions since
>        the recipe version does not necessarily match individual
>        downloaded file versions. Ecosystem PURLs (which include
>        version) from SPDX_PACKAGE_URLS are still used.
>
>   5/7: Renamed recipe-m4/recipe-tar to build-m4/build-tar in
>        tests to align with upstream rename.
>
>   6/7: Unchanged (Reviewed-by added).
>
>   7/7: Unchanged (Reviewed-by added).
>
> Stefano Tondo (7):

Hi Stefano,

Joshua series has been merged. I've been trying to rebase this series on
top of it, but I've got a few failures in
spdx.SPDX30Check.test_download_location_defensive_handling and
spdx.SPDX30Check.test_version_extraction_patterns. Either my conflicts
merges were wrong or a few changes are needed.

Can you rebase this series on top of master, make sure the said tests
pass and resend? I believe this is the last step before we can merge it.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


