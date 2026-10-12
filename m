Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002CACC6B1C
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3950.1791914045202377035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 10:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xgYjZo15;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8D5ED1A1215
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:54:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D3896075C
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:54:03 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id D510311D7188E; Tue, 13 Oct 2026 19:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914043; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=akC3HB9IffmDj7JTUDXwIRlVqOMKbT4REOGebkjgyQE=;
	b=xgYjZo15GRlRCRTM+WCVYyeJtyN3j71qGeJq8WBN+jGbvwK4YmAJQTow1GKX0uki5y77Jg
	J6iqYpQs7fu4ifRedLsUxmdwCsLkXxD5jq30LNzGRg4andyy/bKxfIjL/sLXBKhFi3M7y3
	qmhIY+ntSxa8P/K+amUCV1oM+91EK3i9Yn3bQaZgctLTMPwbKeOy3WCGCDyJCxfsZVKnOh
	ICrX+01CZ8K3B7EYDUDidoBQJJsZjoSQkNfDXGMuZ4MswDbNl0dEWSHb8GGJdKAAunKSqO
	8Oyu4WIigmP2EvdoUJfdt9tKEX42IUXo0CxbQz1DzA5OLqa1yEEyQ8UOZL6N9g==
Authentication-Results: mail.galae.net;
	none
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 19:15:22 +0200
Message-Id: <DM312DDZ2DWX.2IXZ0C78337R1@bootlin.com>
Subject: Re: [OE-core][PATCH] libsoup: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261012095602.19261-1-pratik.farkase@est.tech>
In-Reply-To: <20261012095602.19261-1-pratik.farkase@est.tech>
X-TUID: cluclto/XKr6
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: D510311D7188E
X-Spamd-Result: default: False [-1.26 / 30.00];
	BAYES_HAM(-2.66)[91.32%];
	DATE_IN_PAST(1.00)[24];
	MV_CASE(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	TO_DN_SOME(0.00)[];
	BCC(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:mid,bootlin.com:url,est.tech:email];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247734

On Mon Oct 12, 2026 at 11:56 AM CEST, Pratik Farkase wrote:
> Build the installed-tests via the meson tests/installed_tests options
> (enabled through a new 'tests' PACKAGECONFIG when ptest is in
> DISTRO_FEATURES) and run them under ptest with
> gnome-desktop-testing-runner.
>
> header-parsing-test is excluded as it aborts in do_param_list_tests()
> with the current glib; the rest of the suite passes.
>
> Tested on qemux86-64 with ptest-runner: 34 tests, all pass.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

We have an upgrade to libsoup 3.8.0 that was merged a few days ago. I
could try to merge the conflicts, but as the recipe did evolve a bit, it
would mean the merged patch would be really different from what you
sent. And we should probably avoid that.

Can you rebase on top of master and send a new version please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


