Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F257C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 19:24:26 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.3658.1747682661701546981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 12:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uH65z-0003zC-QG; Mon, 19 May 2025 21:24:19 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uH65y-000IKS-2n;
	Mon, 19 May 2025 21:24:18 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uH65y-00EeSP-2V;
	Mon, 19 May 2025 21:24:18 +0200
Date: Mon, 19 May 2025 21:24:18 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: AdrianF <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org, marex@denx.de
Subject: Re: [PATCH v4 03/16] kernel-signing-keys-native: refactor key
 generation into a new recipe
Message-ID: <20250519192418.64tqckzic37h75fj@pengutronix.de>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
 <20250519110838.82978-4-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519110838.82978-4-adrian.freihofer@siemens.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 19:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216875

On 25-05-19, AdrianF wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> The do_kernel_generate_rsa_keys function from kernel-fitimage.bbclass
> is moved to a new recipe, kernel-signing-keys-native.bb. This
> refactoring introduces no functional changes.
> 
> Intention this change:
> - Remove the dependency of uboot-sign.bbclass on kernel-fitimage.bbclass.
> - Simplify the use of custom key generation implementations by
>   isolating the functionality into a separate recipe.
> 
> Known limitations of this (and also the previous) implementation:
> - When generating from an existing TMPDIR, the existing key is reused.
>   However, when generating from an empty TMPDIR or an SDK using the
>   sstate-cache, a new key is generated, which may lead to
>   inconsistencies.
> - The use of random keys (via FIT_GENERATE_KEYS) is convenient for
>   experiments but unsuitable for production environments requiring
>   deterministic and secure key management.

This is not related to your patchset but IMHO if the key handling has
this issues I would like mark the signing feature as broken and skip the
signing part.

Regards,
  Marco

