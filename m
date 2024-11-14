Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D1D68B06
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:00:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.36660.1731589241409662205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=clLW1ImY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C90660009;
	Thu, 14 Nov 2024 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731589239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9WN03uPaCIVcmdVeAirpQ0oyKmrq75SBs6NneTyWLFE=;
	b=clLW1ImYJ1kbiaSEk2DdGV+3LezU8kLrXrF0ImlF8zp1w1v4B0wrGHiLYb098AzqzuHKNX
	Zq8h2IlZS8cIqLvAFSaR1lmN/gCGDrAZdA6A5ts3Q2Bw37uDGi4oaWjzllgMOoXmbNyFs0
	Smcv3K3fhK+GzJMhdjKMMagGweBp2NdPT4rscActrLYFAv9nTmt9B+GAZd2j8fToShAH76
	jKfAWPGwhULGuI3TVzxq68QCNwqZGoBizY0zntq2wEe2cAOI1ExywfPqRY5V/CtCue1E5i
	CIPmugQykb5ho7v0FQfkGdPe+tOQRP9NA9NuxcHIxcrZKS3et82vTHyUdCxFRw==
Date: Thu, 14 Nov 2024 14:00:38 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Liyin.Zhang.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lttng-ust: backport patch to fix
 cmake-multiple-shared-libraries build error
Message-ID: <ZzX0di8r1p4zh_PO@bootlin-mathieu>
Mail-Followup-To: Liyin.Zhang.CN@windriver.com,
	openembedded-core@lists.openembedded.org
References: <20241114111829.1182716-1-liyin.zhang.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114111829.1182716-1-liyin.zhang.cn@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 13:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207160

On Thu, Nov 14, 2024 at 07:18:29PM +0800, Zhang, Liyin (CN) via lists.openembedded.org wrote:
> From: Bin Lan <bin.lan.cn@windriver.com>
> 
> There are the following error when building doc/examples/cmake-multiple-shared-libraries:
> ld: warning: liblttng-ust-common.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
> ld: warning: liblttng-ust-tracepoint.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
> ld: warning: liblttng-ust-common.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
> ld: warning: liblttng-ust-tracepoint.so.1, needed by lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_common_alloc_tls'
> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_child'
> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_urcu_after_fork_parent'
> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_tp_probe_unregister_queue_release'
> ld: lttng-ust/2.13.8/build/src/lib/lttng-ust/.libs/liblttng-ust.so: undefined reference to `lttng_ust_cancelstate_disable_pop'
> collect2: error: ld returned 1 exit status
> 
> This change set removes the old patch file 0001-Makefile.am-update-rpath-link.patch,
> adds a new patch file 0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch.
> 
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> (From OE-Core rev: 89394da1cbe98652e1d0bd59c762ff7da2d6a113)
> 
> Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>

Hi,

This patch looks like the same as the patch merged last week:
https://git.openembedded.org/openembedded-core/commit/?id=89394da1cbe98652e1d0bd59c762ff7da2d6a113

Is there any difference ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

