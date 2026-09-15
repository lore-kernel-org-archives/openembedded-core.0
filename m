Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA06AC88E73
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 08:03:01 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18345.1789459359396672270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 01:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rMTj6yY9;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77D7DC5CD4E;
	Tue, 15 Sep 2026 08:03:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECC3360498;
	Tue, 15 Sep 2026 08:02:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90FD211C7AFF3;
	Tue, 15 Sep 2026 10:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789459355; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zvrby4DeHXo7X0dn76hz9AmGCbgEt6V9Hekk3UApGu0=;
	b=rMTj6yY9tkPZY0Zyw53k65CunGVj1Dc1mNM/3wWAw0P2OKpDxQ91ysCb3PyHaSWHPY1vc5
	4Tk/GMfil57WsL2XfOOkddVEE6iB87r0plVJZ39ORv8l/b9c+K5cCQsajhEd5LCKzn9Htx
	zNMuZdYJG8VUVN6sB19u11/c2zoHL8330h9EFxydNqWHGzhKqypgxuaqJ+zysu4JuQxHYu
	Ek5NKnKsttwYYIpGdoXoTFFL1H9HN9elJj1AgIPwLzg+dFF/VTp4Mm/0sGosXyP3a/XpFt
	D7iTjpX2zh007/yM9VMnjY2s/CIIXKoITorwqIAg+IDuj47e6jCcLXrbAx1NZQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 10:02:32 +0200
Message-Id: <DLFQEDRDYFEW.1N7Q1KDCOBXUD@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/2] Add meta layer information to spdx
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dwagenknecht@emlix.com>, <openembedded-core@lists.openembedded.org>
References: <20260914114526.2646773-1-dwagenknecht@emlix.com>
In-Reply-To: <20260914114526.2646773-1-dwagenknecht@emlix.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 08:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245824

On Mon Sep 14, 2026 at 1:44 PM CEST, Daniel Wagenknecht via lists.openembed=
ded.org wrote:
> Hello,
>
> as discussed before here
> https://lists.openembedded.org/g/openembedded-core/message/226131
> and here
> https://lists.openembedded.org/g/openembedded-core/message/225774
>
> it would be good to include information about the layers used in a build =
in the
> generated spdx documents.
>
> My primary goal is to track where all the configuration files added via f=
ile
> protocol in `SRC_URI` originate from, but the approach could be extended =
to
> track recipes, classes, machine config etc.
>
> These patches are meant as a basis to discuss the approach and should be
> considered draft status.
>
> The approach is to generate a `layers.spdx.json` on each build invocation
> that lists each layer used in the build as a `softwarePackage` with versi=
on
> and source information as well as - if can be reasonably deducted - the
> downloadLocation. Each source file added via file protocol is then linked=
 to the
> containing meta layer via a `contains` relationship.
>
> Open Questions:
> - is the overall architecture reasonable/correct?
> - referring to layers is inconsistent across tooling. E.g. the core layer=
 is
>   either named `core` as defined by `BBFILE_COLLECTIONS` or `meta` as tha=
t is
>   the layer directory in the openembedded-core repository.
>   I chose the latter since that is what the utility function
>   `oe.buildcfg.get_layer_revisions` returns. The package URL (PURL)
>   implementation uses the other naming scheme though. Any thoughts on whi=
ch
>   should be chosen and why?
> - I do not understand the alias linking yet. With the current implementat=
ion
>   I see many hash mismatches like
>   WARNING: gcc-runtime-15.3.0-r0 do_create_spdx: Element http://spdx.org/=
spdxdocs/layers-7ad0d8d7-57f9-5c3c-9411-49227dd50610/layers/layer/meta
>     has alias http://spdx.org/spdxdocs/UNIHASH-7ad0d8d7-57f9-5c3c-9411-49=
227dd50610/UNIHASH/layer/meta, but it should have prefix
>     http://spdxdocs.org/openembedded-alias/by-doc-hash/e80f1d61f4749e663e=
80a4dfb25ebb1127b5f50600d3065de7ed91030942a1ef/
>
> I've currently got some time available to work on this to get a proper so=
lution
> integrated into openembedded-core.

This series is causing the following issue on our Autobuilder:

  ERROR: No SPDX document named /srv/pokybuild/yocto-worker/qemuarm-alt/bui=
ld/build/tmp/deploy/spdx/3.0.1/bitbake.spdx.json found

See full log here: https://autobuilder.yoctoproject.org/valkyrie/#/builders=
/74/builds/4598

Can you look into it?

Thanks,
Antonin

