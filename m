Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5436FE7E360
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 09:46:58 +0000 (UTC)
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8458.1775209613378599076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 02:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=rkG6roqI;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.14, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 901CC760B73
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 09:46:52 +0000 (UTC)
Received: from fr-int-smtpout17.hostinger.io (100-123-15-51.trex-nlb.outbound.svc.cluster.local [100.123.15.51])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E01567627D7
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 09:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775209612;
	b=gXdqzSHKYMD3b0RyL6JCmM6LWj7mqGwt6xACne+180lA7ff9Q+68NWHdkwE4WADV46+/9W
	A/p8jHYCTktNIVB/Y166xvVdWT1e9YFWFUZLkWMsEJc+CXPdOXz+6Ye/DtF+8aV61S0ct3
	vFkCkhZlf8cPLUwIqDoqScvSRl2kYd3FYVzMjzzAbmUMiyeMZwDZZk2OEx2Dj7LeMJ0F75
	+WwI7EZoi413ZygbNFNHcUYP/XgYVHzL9Zdrf6dPb9ewQke77xqa5JcNjSlJfyPHN1H6tm
	Um483OcgalpEuRhbPOMtvA724Ml2xmbD5Xb8/G8kmabmJ3hUNd9pHOtF5EY8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775209612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=CBT7WpkpTMAc4QhwqKJKuSV/aMYy1Agk9D2CFXeW1uc=;
	b=xFjccCAhpzcvSylq7CrUNVM9pBLMkCC12U3WeO+IVyelopCcPHmZc+xd1iVgYMhDHzOcuL
	t7jWs1VdnvIt7BnVi+V3RI+ingNG3uqtJpgAvp703aGQixuOyNsRERpJz7jEM3Wbi2BPug
	q50sCVxJpvOWnRqblBjNKjKhDfPLqCev2ILUWs2JlnCeUy1USQ5QPFBKUOigjaSOdVQKrB
	pWSfgNEzleyaq3QuyrXy4/83QvuZl+ob4/iOYsgYLrWh+7tGCoCwUCXJVi9EyTEzkRn23/
	HO0Z/H9Ugx5ZWTXSOanTIfh7hCwkrqNcwd1oKZGgy1f9/CnkE7buCPNz1AqveA==
ARC-Authentication-Results: i=1;
	rspamd-7d86dcc447-2krgd;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Spot-Inform: 2b621eeb631fe314_1775209612427_3183549780
X-MC-Loop-Signature: 1775209612427:4131552149
X-MC-Ingress-Time: 1775209612426
Received: from fr-int-smtpout17.hostinger.io (fr-int-smtpout17.hostinger.io
 [148.222.54.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.15.51 (trex/7.1.5);
	Fri, 03 Apr 2026 09:46:52 +0000
Received: from [IPV6:2001:861:4450:d360:9414:2cdc:f6b4:b35d] (unknown [IPv6:2001:861:4450:d360:9414:2cdc:f6b4:b35d])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fnDQL0Ymzz1xxw;
	Fri,  3 Apr 2026 09:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1775209610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBT7WpkpTMAc4QhwqKJKuSV/aMYy1Agk9D2CFXeW1uc=;
	b=rkG6roqIF9qpf93APD8fxXc0Ctz2TeLYnOcP8VF9fMw1oqoSoRQQgUlfYUfIwDRtmMJoUF
	wIi933+SyAMu0yeZWaxCG4swG7ZOVRG21hPvqZ7u3nHIjDLraICojvTAndfvcvpveLw5Ll
	Z5SQ/L6Te5qB3AoVcodqpOpl9OgMcdEPOZI6VtgwPmSTZzi2AFQZ4cq6OIG2hSBCv84gdA
	mFFVU1XpOY+sVbOCD7/iTSmHhUp0AnoA28IGa2osuSsYX0PIemshfT9M+163YkarcQCcpc
	vzC7fnfQAJFtAn97gc5xXo7FvIbzU09X0IgGc8w8/GXg1oHqZoCy4MCrK8AQEw==
Message-ID: <36b63c79-2640-4fa7-9c82-d96ca77582ee@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [PATCH] initramfs-framework: init: fix kernel cmdline parsing
To: openembedded-core@lists.openembedded.org
References: <20260326173432.3286250-1-michael.opdenacker@rootcommit.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260326173432.3286250-1-michael.opdenacker@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri,  3 Apr 2026 09:46:49 +0000 (UTC)
X-CM-Envelope: MS4xfLoyWYoRlyXiG+Mj+EI5zjdDM0dPQNRlilZwTH23rhceULWLQ7O4YYejOirwfGYan2uUpdUB3Qy04VvwujGExQXldp+oXUwV+5ojVMSwqCd5Cq61DN4F aPOtpC9Wtq/Jy8rrO3AWTx0HvUMqChSGVtXuaGFsIyfgcTnuXPZam14D2DIlLkiCEfXZTHwotec0i0JBqrSNMXf8HbNUpO0HGXX4drdInDrg2O18yQ9J0ZQL H3GPK09ShsbQmwZnMOJWha6ALmShNNkcl4/fxDV6SY9rzt5SwNhsvdPH6boyBK9QnBE/PG4PT3NFY7b9XZDS1lEtxWAQRtdHmMInLRYYn7nYmo1RB2lFMdLf s9E67DPzalk8eHM2S0yZdLFmSoR2j27Ig5ZXs7VOZp+X/A6vcvI=
X-CM-Analysis: v=2.4 cv=GMJaEfNK c=1 sm=1 tr=0 ts=69cf8c8a a=s27xH1gK8AVWpcxtsJ646g==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=XX-f_xd35yGD9FjD57kA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 09:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234577

Greetings

On 3/26/26 6:34 PM, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> Fix several issues with double quotes in kernel command line
>
> - Kernel options like 'opt="value"' were breaking the parser,
>    causing the whole reminder of the command line to be ignored.
>    The code only supported 'opt="word1 word2..."
>
> - Setting variables without removing quotes in the value
>
> - Setting variables to values with spaces without enclosing
>    the value with quotes. This caused execution errors evaluating
>    expressions like:
>    bootparam_opt=word1 word2
>
> The first fix is particularly needed for people using the kernel
> "bootconfig" configuration parameters to add options to the kernel
> command line:
>
> CONFIG_BOOT_CONFIG=y
> CONFIG_BOOT_CONFIG_EMBED=y
> CONFIG_BOOT_CONFIG_EMBED_FILE="additional-bootargs.bootconfig"
>
> This mechanism systematically adds quotes around options
> with values, for example:
> init="/sbin/preinit"
>
> Without the fix, the wrong init program can be started from the
> initramfs and debug messages are ignored when "debug" is
> present after "init" in the kernel command line.
>
> For readability and performance sake, also use shell variable operators
> instead of "sed" to remove leading and trailing quotes.
>
> Tested both on host and target machines.
> With the below kernel command line:
> rootwait init="/sbin/preinit" debug root=/dev/mmcblk0p2 console=ttymxc0 dyndbg="file drivers/usb/core/hub.c +pltf" quiet
>
> The following variables are set:
> bootparam_rootwait="true"
> bootparam_init="/sbin/preinit"
> bootparam_root="/dev/mmcblk0p2"
> bootparam_debug="true"
> bootparam_console="ttymxc0"
> bootparam_dyndbg="file drivers/usb/core/hub.c +pltf"
> bootparam_quiet="true"
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>   .../initrdscripts/initramfs-framework/init    | 24 +++++++++++++++----
>   1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
> index 51db083e2e..67590ad765 100755
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
> @@ -94,9 +94,11 @@ fi
>   # populate bootparam environment
>   for p in `cat /proc/cmdline`; do
>   	if [ -n "$quoted" ]; then
> -		value="$value $p"
> -		if [ "`echo $p | sed -e 's/\"$//'`" != "$p" ]; then
> -			eval "bootparam_${quoted}=${value}"
> +		p_rstripped=${p%\"}
> +		value="$value $p_rstripped"
> +		if [ "$p_rstripped" != "$p" ]; then
> +			# End of a opt="word1 word2..." parameter
> +			eval "bootparam_${quoted}=\"${value}\""
>   			unset quoted
>   		fi
>   		continue
> @@ -105,11 +107,23 @@ for p in `cat /proc/cmdline`; do
>   	opt=`echo $p | cut -d'=' -f1`
>   	opt=`echo $opt | sed -e 'y/.-/__/'`
>   	if [ "`echo $p | cut -d'=' -f1`" = "$p" ]; then
> +		# opt parameter
>   		eval "bootparam_${opt}=true"
>   	else
> -		value="`echo $p | cut -d'=' -f2-`"
> -		if [ "`echo $value | sed -e 's/^\"//'`" != "$value" ]; then
> +		value="`echo $p | cut -d'=' -f2-`"	# Option value
> +		value_lstripped=${value#\"}
> +		value_rstripped=${value%\"}
> +
> +		if [ "$value_lstripped" != "$value" ] && [ "$value_rstripped" != "$value" ]; then
> +			# opt="value" parameter
> +			eval "bootparam_${opt}=${value_lstripped%\"}"
> +			continue
> +		fi
> +
> +		if [ "$value_lstripped" != "$value" ]; then
> +			# Start of a opt="word1 word2..." parameter
>   			quoted=${opt}
> +			value=${value_lstripped}
>   			continue
>   		fi
>   		eval "bootparam_${opt}=\"${value}\""


Any objections to merging this fix?
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


