Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20195C982CA
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 14:59:37 +0000 (UTC)
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7943.1768575568096293502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 06:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=jFvVbmau;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.14, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 42DDA821BE8;
	Fri, 16 Jan 2026 14:59:27 +0000 (UTC)
Received: from de-fra-smtpout6.hostinger.io (100-117-48-27.trex-nlb.outbound.svc.cluster.local [100.117.48.27])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1CF28821C11;
	Fri, 16 Jan 2026 14:59:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1768575565;
	b=3CWz6WetxV4ioQ9Nzv7eeB9dfhisiSLHpyOFk3VY8ElcC8MMiEopJBpGq50CgiPB2vkgfo
	EAgLSzhs/uNBdgmtPAGPSIHKNUu237kidLe571Xr182djrZUX7IzNjMuj/YpccPgUr7MZO
	AUiNzcjdl8FFuqbkZPaa5i7c2Bpji+qTf15wD1QeIpiHJ4JPaEuLvX7YRB20iTv00dlDIq
	WX+CQJAt0u8Gf14KEXkNQg+YEdH2oP4NsJIguA9qrdEpoBkWoVJljmckqkhzsZddImjVib
	TLkghxhOX9Nc7Bn1G5aF4iE4waiKmwmzrzeofuOQQv2aETk0kNs/XpxeJkoUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1768575565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=IjLS8un4N8yIbxsGakUpHjWYs+o/k+WqZfYfkj+AfGA=;
	b=SY61tFpsUF03tRYY8oX+TiQkN+9xIdfB8fqi/iXGtLk4U2DP4wH9U+Yf2zgxF6+0+YmvHa
	zG0j2mOr+7jhRlT6c62rIpPfseIw7X+CMx8len6U0hXg7IzQWK/XT7UIJrU34r7KN0OInW
	P6JmnRBgYZP1m52jjm+5jBv6ffj+z3NfuiHeeqAoLgKzfenng6JKzff4KPOtHRJW3yQZ9p
	PC07cCtbqdRWnPrRFejYP6QAuY4hRFXjm/X/e57B6oxg49h4qe6/nw0zsOSysrSc47tu6L
	xHPOxfGvsBpJkXtT7LhXUHhl/XMiUUI7nUJCdvYechVoU/QvVWfBWmn7OjiSqg==
ARC-Authentication-Results: i=1;
	rspamd-84bff5b669-xlzpt;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Average-Tangy: 212c9c720872edf1_1768575565974_2895545078
X-MC-Loop-Signature: 1768575565974:3600523745
X-MC-Ingress-Time: 1768575565974
Received: from de-fra-smtpout6.hostinger.io (de-fra-smtpout6.hostinger.io
 [148.222.55.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.48.27 (trex/7.1.3);
	Fri, 16 Jan 2026 14:59:25 +0000
Received: from [IPV6:2001:861:4450:d360:6400:d176:8558:9223] (unknown [IPv6:2001:861:4450:d360:6400:d176:8558:9223])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dt30W0TLwz45bC;
	Fri, 16 Jan 2026 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1768575563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IjLS8un4N8yIbxsGakUpHjWYs+o/k+WqZfYfkj+AfGA=;
	b=jFvVbmau07DaA1x67WCJyKzOU/l6Ps3g129ZEHguMlAbptF48tMWNxSxyQ3/Fs91pLf/Rk
	FQZwrsZ18/80dQA9g0uDUKZniYxkU4hti8LLBLA6BV9Xl4kN0irHhCDgc1+z6kIBO5o5Ew
	lBkml7nEp2aJeX+cQkBrKhgp9UMK+qgCN76u4DQPr8QHtiNEMVcW43Qlk/bekQa9cJWsSf
	NsDefNPWh215IfCFO7evEMexz9ss9zoqXaLinvJxKWVYoX2PImEh01B0pmMWOGcIb59J2U
	h4rsbJXqe+hwPheNtWv/mnqXQtJkApoZgmVqujaXbKLMFh/8BR6+ZxwDXuX7Pg==
Message-ID: <56cd0e1d-80f5-4bea-9281-3283fe80b92f@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, thomas.petazzoni@bootlin.com
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.8.1
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
References: <20260116143121.1449415-1-thomas.perrot@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260116143121.1449415-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 16 Jan 2026 14:59:23 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=696a524b a=0kh9Q7y6Qv2z3S4oA49dkw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=NEAV23lmAAAA:8 a=amLw0-907b8Fma3judsA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-CM-Envelope: MS4xfGOnxHBlBuzUdwdHkrCapZkygJ1/NnCkODoYs1ANnrO2+iQ43AZPST2o+DV75CCEVk15yhQr+UB6iL5H063p8AOGKbjoVDWk0ang4MrjlWJrQDVzKozZ dCoY6AKy/0dikV4wmR9/sRSPwWjJQ9W+QdcMdcDYbWQQmGkdCmxF1+05ROjzu4C0n8ZuVdePJHKeJxOO/0VNdNVGmaGw9o4lxaDW3Bp5Y28y3LtoXTNuR8md 7FNZ6wRBjoY08pDPC13/yP80PSwc980eIgV6YZLbDvvHl1DoIQo3O6UvX6hr6Yt6wqJNbqdT1mwmQdQA721UmIFuDqODaEQhG736Q1XnBieyDHKZJ0vQoGKi vgk+NRKE2Y+0fqyKSdEgWrtz25fg1wVLXGz19doeMdQYwA9XFyGoVt8Nr3NLjRNWMu3SFFUAj2nMUSWh21ZBP3LrkHYMgytZIY1SsK0B5DeFUvd8AuwMMLvr SzPzOqg/7lRcwyZk
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 14:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229548

Hi Thomas

On 1/16/26 3:31 PM, Thomas Perrot via lists.openembedded.org wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> This intermediate release has following fixes:
> - Typo fix in comments of sbi_hartindex_to_hartid()
> - Fix hart protection abstraction for platforms without PMP
>
> Allow the platform to boot without PMP, but it is still necessary to
> enable PMP on QEMU; otherwise, there will be nothing to protect the
> M-mode firmware (OpenSBI) from lower privilege modes.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>   meta/recipes-bsp/opensbi/{opensbi_1.8.bb => opensbi_1.8.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-bsp/opensbi/{opensbi_1.8.bb => opensbi_1.8.1.bb} (97%)
>
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.bb b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> similarity index 97%
> rename from meta/recipes-bsp/opensbi/opensbi_1.8.bb
> rename to meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> index 5352c01d6693..0a9652c2831e 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> @@ -8,7 +8,7 @@ require opensbi-payloads.inc
>   
>   inherit deploy
>   
> -SRCREV = "e7fa66c2160ec139de1853a00f669c09320a9256"
> +SRCREV = "74434f255873d74e56cc50aa762d1caf24c099f8"
>   SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https;tag=v${PV}"


You beat me on the finish line for this one, by just a few minutes :D
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Thanks for the update!
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


