Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981F1C19F2A
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 13:04:18 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.24294.1659359045515559905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 06:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Us2F7CRu;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0201110000B;
	Mon,  1 Aug 2022 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659359043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKU54uYT04RDyr73vHWCyJWbXs29xwgRZIm1aIcYpVs=;
	b=Us2F7CRuYugvTo4NZi12nFNCsdDnRxYaSpkWLP3kkFvquhaxhDIf9wgAlLI6GsosTXMtYC
	gERHPo3xjehtiwN3r065lDDHXXIAJog54uE473V2E9Vv5EhIp2jnmqkLWl6X6n4/alokpq
	BT9/Hb882nxirj7YpNfpDBQ70QFnHLA/jR3Iqs2f/2AUO7qpenhJ88NmPIujKnb5g0HXWB
	/WX3h2URAyYokGjpAU7Xy2uJiLWdTckFQZwg09K+XDbRl32A9UGppHBUuBAVMxyMEOydUF
	IsLF9ZY4FQVNydqn8H6zRcOBN5P/uPCjEWPBj22P19AFwCQ2oWsQ+IgPZLJ9Yw==
Date: Mon, 1 Aug 2022 15:04:01 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "He Zhe" <zhe.he@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] lttng-modules: Fix build failure for kernel
 v5.15.58
Message-ID: <20220801150401.28861502@booty>
In-Reply-To: <20220801085136.38110-1-zhe.he@windriver.com>
References: <20220801085136.38110-1-zhe.he@windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 13:04:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168748

Hello He,

On Mon,  1 Aug 2022 16:51:36 +0800
"He Zhe" <zhe.he@windriver.com> wrote:

> Backport from upstream d8254360c7f2ff9b3f945e9668d89c0b56b9bd91
> ("fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)")
> 
> tmp-glibc/work/qemuarm-wrs-linux-gnueabi/lttng-modules/2.13.3-r0/
> lttng-modules-2.13.3/src/probes/../../include/lttng/
> tracepoint-event-impl.h:133:6:
> error: conflicting types for 'trace_kfree_skb'; have 'void(struct sk_buff *, void *)'
>   133 | void trace_##_name(_proto);
>       |      ^~~~~~
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch | 51 +++++++++++++++++++
>  .../lttng/lttng-modules_2.13.4.bb             |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
> new file mode 100644
> index 0000000000..0140c4b989
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
> @@ -0,0 +1,51 @@
> +From d8254360c7f2ff9b3f945e9668d89c0b56b9bd91 Mon Sep 17 00:00:00 2001
> +From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Date: Fri, 29 Jul 2022 15:37:43 -0400
> +Subject: [PATCH] fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)
> +
> +See upstream commit :
> +
> +  commit c504e5c2f9648a1e5c2be01e8c3f59d394192bd3
> +  Author: Menglong Dong <imagedong@tencent.com>
> +  Date:   Sun Jan 9 14:36:26 2022 +0800
> +
> +    net: skb: introduce kfree_skb_reason()
> +
> +    Introduce the interface kfree_skb_reason(), which is able to pass
> +    the reason why the skb is dropped to 'kfree_skb' tracepoint.
> +
> +    Add the 'reason' field to 'trace_kfree_skb', therefor user can get
> +    more detail information about abnormal skb with 'drop_monitor' or
> +    eBPF.
> +
> +    All drop reasons are defined in the enum 'skb_drop_reason', and
> +    they will be print as string in 'kfree_skb' tracepoint in format
> +    of 'reason: XXX'.
> +
> +    ( Maybe the reasons should be defined in a uapi header file, so that
> +    user space can use them? )
> +
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Change-Id: Ib3c039207739dad10f097cf76474e0822e351273

Missing Upstream-status tag here.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

