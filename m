Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E10C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 17:03:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.202318.1673974991390547084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 09:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XLZAjjH/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E981D1BF204;
	Tue, 17 Jan 2023 17:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673974989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R61D9lpuD9+sMF1FcBT/2S4y1FVcyN7/jjoLLDL6MVM=;
	b=XLZAjjH/pUk2Cnj1GXZ8hJvv9vSciL63gflZcparpdXU6fEShwM2MRjJUV5r+Nb5BXfZt0
	s1GZeDJAXJ6zxOcCkIeiX9CsxF5dJ24s9s07JI+RWjrR2Clo6PH1bjRbc4dvFgCmeQIvIv
	ncDgHVv5HRt9EIqRmJW2GKGDvb/WBl1rfciO1GR5Rmeiw1oM1JImlH+ld10THrCmY6JCX2
	wBwmdKcmwUpO3QEtjNJI3V29Cd46Q9q/afkv/txyn3+6nt8DCYIJjs4UjoJVD8wyiL1SFL
	CLIEMLUwLUzVhev3levyfUFJhVUWWbRWjLVoZfLVbrST0ZQ701U1yYekvSXUvA==
Date: Tue, 17 Jan 2023 18:03:07 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Chuck Wolber" <chuck.wolber@boeing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] scripts/oe-setup-layers: Make efficiently
 idempotent
Message-ID: <20230117180307.52fdcce0@booty>
In-Reply-To: <1673920770-31378-1-git-send-email-chuck.wolber@boeing.com>
References: <1673920770-31378-1-git-send-email-chuck.wolber@boeing.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 17:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176056

Hello Chuck,

On Mon, 16 Jan 2023 17:59:30 -0800
"Chuck Wolber" <chuck.wolber@boeing.com> wrote:

> The effect of subsequent setup-layers executions is now either a NOOP
> or the minimal set of changes required to ensure layers precisely match
> the JSON configuration.
> 
> This change allows setup-layers to be incorporated into a team's
> configuration management strategy. In particular, the configuration
> JSON manages a "pinning policy" that documents the oversight of sources
> of change (a requirement for embedded development in highly regulated
> industries).
> 
> One model for this strategy would work as follows. Team level policy is
> developed to regularly review upstream commits that occur between the
> current upstream HEAD and the previously pinned revision. The JSON
> configuration is periodically updated after a review, test, and approval
> process. In the rare instance that an upstream change is considered
> problematic, the bbappend mechanism can be used to make relevant
> changes in the team's project repository. This approach also requires
> that team developers regularly run the project repository copy of
> setup-layers. This is most easily accomplished by including setup-layers
> in a wrapper script that all team developers use to interact with the
> bitbake tool suite (e.g. "bb bitbake foo-image"). Project level policy
> and oversight is effectively "contained" within this wrapper script,
> thereby reducing a significant source of human error.
> 
> Left unstated, but acknowledged here, are a number of nuances required
> to successfully implement the above strategy.  The details are out of
> scope for this explanation. What should be clear is that a larger
> configuration management strategy can now benefit from the utility
> provided by setup-layers.
> 
> Note: Neither the above configuration management strategy example nor
> the change itself is intended to alter the original intent to use
> "bitbake-layers create-layers-setup destdir" to keep pace with upstream
> activity for those who wish to use it that way.
> 
> Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>

I'm afraind I am unable to apply this patch on my testing branch as it
conflicts with another patch ("oe-setup-build: add a tool for
discovering config templates and setting up builds" by Alexander
Kanavin) which is already on my branch.

You might want to rework your patch on top of Alex's, or just wait for
it to be on master and then send a v3.

Kind regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

