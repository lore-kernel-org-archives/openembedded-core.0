Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABCCD2AB3B
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 12:47:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18623.1730206066830485654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 05:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gyCqGXAD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8274240009;
	Tue, 29 Oct 2024 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730206065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+9Vbc3PAyfyNUjgLsk1VgqRfYSS9nVrCPe+ps1RPBss=;
	b=gyCqGXADlOAPbJ7Hf7cN4ZQ3w6xThE2mPNEY3eaeU6miuqDtWmc//FfDf3a1sTzGWTymRM
	5lRntynJJilzBxcyUQUa+1qKk3O+CxaySjWYq12Ku0E2iPQ5JMc/U7jSigW6tMfewoFrPP
	RwW499fzY3FYZvGgqv+9jIZ+S10uXVaeeSdoX5G9wPuvVxvFtYf6fgRtNxqpDXHOw0MRbt
	7F7hsVBJdl3HgJm0FeWZ7B6jgld/tjhNka4bBt8fwTwp2iZGwEtE0Om+PI5/+jXGbi4pne
	IeI+ksgrFRwBVdyn3tItB4UwcYtMa+0SgUwAPLOIvOCB1xkw6cOAX7tlnVQ8pw==
Date: Tue, 29 Oct 2024 13:47:43 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] python3-dtc: fix language specific AppendOutput
 functions with swig 4.3.0
Message-ID: <ZyDZb3_9BfJZFddm@bootlin-mathieu>
Mail-Followup-To: Markus Volk <f_l_k@t-online.de>,
	openembedded-core@lists.openembedded.org
References: <20241028173602.1652935-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028173602.1652935-1-f_l_k@t-online.de>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206499

On Mon, Oct 28, 2024 at 06:36:02PM +0100, Markus Volk wrote:
> Swig has changed language specific AppendOutput functions. The helper
> macro SWIG_AppendOutput remains unchanged. Use that instead
> of SWIG_Python_AppendOutput, which would require an extra parameter
> since swig 4.3.0.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../0001-libfdt.i-Use-SWIG_AppendOutput.patch | 51 +++++++++++++++++++
>  .../python/python3-dtc_1.7.0.bb               |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-dtc/0001-libfdt.i-Use-SWIG_AppendOutput.patch
> 
> diff --git a/meta/recipes-devtools/python/python3-dtc/0001-libfdt.i-Use-SWIG_AppendOutput.patch b/meta/recipes-devtools/python/python3-dtc/0001-libfdt.i-Use-SWIG_AppendOutput.patch
> new file mode 100644
> index 0000000000..c9c3a886f1
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-dtc/0001-libfdt.i-Use-SWIG_AppendOutput.patch
> @@ -0,0 +1,51 @@
> +From 4eb1df0be56103b8058c126dd437bfb6dbaa5bb2 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 28 Oct 2024 18:05:53 +0100
> +Subject: [PATCH] libfdt.i: Use SWIG_AppendOutput
> +
> +Swig has changed language specific AppendOutput functions. The helper
> +macro SWIG_AppendOutput remains unchanged. Use that instead
> +of SWIG_Python_AppendOutput, which would require an extra parameter
> +since swig 4.3.0.
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +

Hi Markus,

Thanks for the update, but it seems the issue is still present :(

https://valkyrie.yoctoproject.org/#/builders/6/builds/340/steps/11/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/3/builds/343/steps/11/logs/stdio

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

