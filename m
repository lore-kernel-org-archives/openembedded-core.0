Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A72FF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 09:55:19 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38474.1777278475224997174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 01:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QzvvszAv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: olivier.benjamin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 597E1C5CD44
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 08:28:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46DBC600D1;
	Mon, 27 Apr 2026 08:27:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A1301072121E;
	Mon, 27 Apr 2026 10:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777278472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Hc9YnKJts6GtPaqlcUCkAgTcWhzpa+AoqcGFV8RrZEo=;
	b=QzvvszAvw3RQdmR5AVukWzbeWFzm9KJS1m7aDtussf7ryV37rX+AHDzX1bxT8ijDIoS8mu
	guFtTZMZvFhPksGCuf3p+nj/DdpVniZy6eakCAg9hdD5RsE9daf/uszv3j+PunGJRykGLM
	dgbnnnXFDegfND7Fkg//aEmhuuhHAAcMJZN2mXy+oRz4uBt5vLxJpgJGgCWUo7rV5a5ZBt
	+5uHbgmmg0cZYaVho+S26ae8hUDUCozIMRswTAut8PAOXUxg6PSb339YlhmZ07M6ClNNlr
	H0oWCzIEmHivQQSvHAtsS/xWaA+yfgQHHkn6kTJz3UXNUuRrxb7vL5w7YI9gPg==
Message-ID: <21f76971-7cb6-4bef-9ac2-cd06f0098043@bootlin.com>
Date: Mon, 27 Apr 2026 10:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ANNOUNCE: shipcheck - CRA compliance auditor for Yocto builds
To: Javier Tia <floss@jetm.me>, yocto@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <d196fb98514a14652a8e6a6ed1b5fff0@jetm.me>
From: "Olivier Benjamin" <olivier.benjamin@bootlin.com>
In-Reply-To: <d196fb98514a14652a8e6a6ed1b5fff0@jetm.me>
X-Last-TLS-Session-Version: TLSv1.3
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235998

On 4/24/26 11:20 PM, Javier Tia wrote:

> Hi all,
Hello Javier,
> (Cross-posted to yocto@lists.yoctoproject.org and
> openembedded-core@lists.openembedded.org.)
>
> I just published shipcheck, an open-source CLI that reads a Yocto build
> directory and drafts the paperwork required by the EU Cyber Resilience
> Act (Regulation 2024/2847) - the Annex VII technical file, the
> Declaration of Conformity, and an evidence report pivoted by CRA Annex
> item.
Thanks, it's great to have a tool filling that gap!
> The short version: CRA is a paperwork regulation, not a
> scanner-selection problem. Yocto already emits most of the technical
> evidence - SPDX SBOMs via create-spdx, CVE scans via cve-check or
> Bootlin's sbom-cve-check, license.manifest files, signing-class config.
> What's missing is a tool that walks those artefacts, maps them onto the
> CRA Annex structure, and renders the drafts a compliance officer can
> review.

Not super relevant, but I would dispute the "paperwork regulation" bit,
and one can only gloss over the "scanner-selection" issue if one assumes 
that
problem already solved.

> shipcheck does that piece, with seven registered checks:
>
>    sbom-generation    SPDX 2.x validation against BSI TR-03183-2
>    cve-tracking       consumes cve-check, vex.bbclass, and
>                       sbom-cve-check JSON (the last is preferred)
>    yocto-cve-check    reads tmp/log/cve/cve-summary.json directly
>    license-audit      per-arch license.manifest walker
>    secure-boot        detects signing class configuration and flags
>                       known test keys
>    image-signing      detects FIT signatures and dm-verity config
>    vuln-reporting     validates the vendor-commitment half of the
>                       dossier from a separate product.yaml manifest
>
> It is deliberately narrow: Apache-2.0 Python, no runtime probes, no
> shell-outs, no network calls at scan time, and no LLM or AI inference
> anywhere in the pipeline - shipcheck is fully deterministic. An
> auditor can read the check code and confirm exactly what each check
> inspects.
>
> Pilot 0001 (poky Scarthgap, core-image-minimal) is committed at
> pilots/0001-poky-scarthgap-min/REPORT.md with the full kas-container
> bootstrap. A worked example driven from a product-vendor.yaml (every
> field set to the placeholder "VENDOR") is committed at
> audits/0002-blog-demo/ if you want to read the generated Annex VII
> and DoC drafts without running shipcheck locally.
>
> Install:
>
>    uv tool install shipcheck  # or: pipx install shipcheck
>    cd path/to/yocto/build
>    shipcheck init
>    shipcheck check --build-dir . --format evidence --out dossier/
>
> Blog post walks through the Annex structure, what Yocto gives you for
> free, and where the paperwork gap lives:
>
>    https://jetm.github.io/blog/posts/auditing-your-yocto-build-for-cra-compliance/
Thanks, the blog post is very helpful!
> Repo:
>
>    https://github.com/jetm/shipcheck
>
> Feedback very welcome - especially from maintainers on the cve-check,
> create-spdx, and vex side of things who have opinions on how the check
> defaults should evolve. File an issue on GitHub, or reply here.
I haven't tested the tool yet, so more feedback to potentially come later,
but I would certainly be interested in being able to validate SPDX3.0 
output.
> Best,
> Javier

Cheers,

Olivier

>
>

