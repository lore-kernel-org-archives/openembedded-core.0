Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC47C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 21:38:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.512.1635457133988751702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4C70A20004;
	Thu, 28 Oct 2021 21:38:51 +0000 (UTC)
Date: Thu, 28 Oct 2021 23:38:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] musl: Update to tip of trunk
Message-ID: <YXsYakP5+N8KLUuV@piout.net>
References: <20211027185405.3939665-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027185405.3939665-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 21:38:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157612

Hey Khem,

I believe this is the cause of:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4268/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4266/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4252/steps/13/logs/stdio

[   82.973565] python3[11480]: segfault at 1 ip bfcee8d4 sp bfcee63c error 6
[   82.974156] Code: ce bf e6 08 c9 b6 3c ea ce bf 0f 00 00 00 08 00 00 00 d4 e8 ce bf 80 04 c9 b6 8c 33 73 b4 01 00 00 00 f0 da ce b6 fc 74 75 b4 <30> 16 d0 b6 00 00 00 00 c3 17 ed 1f c0 45 7a b4 a6 08 c9 b6 f8 9b
[   85.101543] traps: python3[11550] trap invalid opcode ip:bfe4fe5c sp:bfe4fbfc error:0
[   86.683349] python3[11620]: segfault at bf95ea71 ip bf953234 sp bf952f9c error 6
[   86.683997] Code: 95 bf e6 98 c6 b6 9c 33 95 bf 02 00 00 00 08 00 00 00 34 32 95 bf 80 94 c6 b6 68 9b 81 b4 01 00 00 00 f0 6a cc b6 40 31 77 b4 <30> a6 cd b6 00 00 00 00 46 59 6a 4e f0 9e 78 b4 a6 98 c6 b6 f8 2b
[   88.255210] python3[11690]: segfault at bfd95459 ip bfd89c14 sp bfd8997c error 6
[   88.255927] Code: d8 bf e6 78 ce b6 7c 9d d8 bf 02 00 00 00 08 00 00 00 14 9c d8 bf 80 74 ce b6 98 7b 89 b4 01 00 00 00 f0 4a d4 b6 10 91 80 b4 <30> 86 d5 b6 00 00 00 00 ce 99 0a 2d 50 f4 93 b4 a6 78 ce b6 f8 0b
[   91.137778] traps: python3[11760] general protection fault ip:bfe6b9b8 sp:bfe6b71c error:4790

Sounds fun :/

On 27/10/2021 11:54:05-0700, Khem Raj wrote:
> This brings following fixes
> 
> * b76f37fd add qsort_r and make qsort a wrapper around it
> * 7be59733 add SPE FPU support to powerpc-sf
> * e3e7189c fix undefined behavior in getdelim via null pointer arithmetic and memcpy
> * b713b8b2 fix excessively slow TLS performance on some mips models
> * 3eed6a6f fix error checking in pthread_getname_np
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 06b0e060d0..82fd9e9079 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
>  
> -SRCREV = "3f701faace7addc75d16dea8a6cd769fa5b3f260"
> +SRCREV = "b76f37fd5625d038141b52184956fb4b7838e9a5"
>  
>  BASEVER = "1.2.2"
>  
> -- 
> 2.33.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157565): https://lists.openembedded.org/g/openembedded-core/message/157565
> Mute This Topic: https://lists.openembedded.org/mt/86635702/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

