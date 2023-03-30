Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A650CC761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 08:48:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20462.1680166099780852791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 01:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lAGCT5vB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1C3A4FF80D;
	Thu, 30 Mar 2023 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680166097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCcNTP/xGjmJkAmtn/IuxotuymLOusfa6w67BdkQTHQ=;
	b=lAGCT5vBt8LAbV2TOgAcACbbKQqyusMK8gVSjLZEWD1FG6UE+gks2s98khIuw/58aqbSFs
	G9vvrTeVBFbIEr/gb1KNcnVJ9GEe0Kj7Vea8zqU7K9N6fcuz9nA8yeG/JE+DVyTD/9N3ql
	6+LXRz/tl2g5xrzt9TPyj1XDgZwAZTFulTp6Q3qcIip7zOV0LHc/L23ezCkxyOGC9o9t6o
	5+XnWCFUf0K3pxaEwSMlWBoyeGnIbMJD0LyPd3vBIb0eTDk2sWxhjEBuJwpShokjjjn5RG
	XozK9AcMLpr2jkJOz4FAVVbzVEUu36LAZ5/2FypBTLf6Xf+DlbjjeK5cKepmUQ==
Message-ID: <67ba133e-e51e-f586-4134-96ab921b7230@bootlin.com>
Date: Thu, 30 Mar 2023 10:48:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: ranjitsinh.rathod@kpit.com, Sana Kazi <Sana.Kazi@kpit.com>,
 Sana Kazi <sanakazisk19@gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] busybox: Make high ASCII chars
 printable
Content-Language: en-US
To: nikhil <nikhilar2410@gmail.com>,
 openembedded-core@lists.openembedded.org, sanak@kpit.com
References: <20230329064717.2486576-1-nikhilar2410@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230329064717.2486576-1-nikhilar2410@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 08:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179306

Hi Nikhil,

On 29.03.23 at 08:47, nikhil wrote:
> Currently busybox utilty "ls" fails to display filenames contains
> UTF-8 characters and replaces with "?".
>
> Steps to reproduce:
> bin/busybox touch utf_test-Ü
> bin/busybox ls utf_test-* > sample.log
> bin/busybox cat sample.log
> utf_test-??
> bin/busybox hexdump -C sample.log | grep "c3 9c"
>
> Therefore, above hexdump command is unable to find matching hex value
> for the umlaute character.
> Hence, change the libbb's printable_string() function to allow high ASCII
> characters so that unicode filenames are displayed correctly.
> This issue is not observed in upstream busybox.
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
> ---
>   .../270-libbb_make_unicode_printable.patch    | 39 +++++++++++++++++++
>   meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
>   2 files changed, 40 insertions(+)
>   create mode 100644 meta/recipes-core/busybox/busybox/270-libbb_make_unicode_printable.patch


Thanks for the patch!

There's an issue with your e-mail identity. You should add one thing to 
your git configuration, so that your patches are given an "Author" field 
which matches your "Signed-off-by" information. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity 
for details.

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


