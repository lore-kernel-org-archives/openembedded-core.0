Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4438C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 14:37:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.85445.1701959867947838491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 06:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XQXPkz9a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E97BFF80F;
	Thu,  7 Dec 2023 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701959865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyxCFCshfLxrD2De1Todvlk5aSaz/qof6YHW5iJhMkA=;
	b=XQXPkz9aszi0vWHohLLMTze0QI7+iKl9PAryQQ2Kqgr+JU0cORQSV00IizF67bkk9pIfBP
	4IZKd9xCuy07nL4zXKAkhGVXOC/NjOELi80AW/lmH21FxyGjl2NZNQ/VqWzHjHaD6GFLrX
	WsHX2y2cuNgTcy7LtHl+3pQUjOrz9OId0vq+r/lz/K4qaHZ4A6KsDgrMHXqqBl+yfWHiFa
	KbMaUTeVx7GwrVACTtApWXTp4HGvUI+cVrL/FgvfqlsQ55Bk1Wc7aQLmuJk06YxDK5CxJ4
	ezUuFKNClW2+Ycuc/f+kSKvdziU8n3gezreOA4ae78uGndezN0nAlUMvSH9Zjg==
Date: Thu, 7 Dec 2023 15:37:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wic/DirectPlugin: don't update fstab if
 --no-fstab-update
Message-ID: <202312071437440f4ba911@mail.local>
References: <25627265bc672f5a617f0e3319302dc80b655ca7.1701887581.git.joerg.sommer@navimatix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25627265bc672f5a617f0e3319302dc80b655ca7.1701887581.git.joerg.sommer@navimatix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 14:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191963

Hello,

This causes the following failure:

2023-12-07 02:54:18,682 - oe-selftest - INFO - ======================================================================
2023-12-07 02:54:18,682 - oe-selftest - INFO - FAIL: wic.Wic.test_no_fstab_update (subunit.RemotedTestCase)
2023-12-07 02:54:18,682 - oe-selftest - INFO - ----------------------------------------------------------------------
2023-12-07 02:54:18,682 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/wic.py", line 768, in test_no_fstab_update
    self.assertNotEqual(bf_fstab_md5sum, part_fstab_md5sum[0])
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.11/unittest/case.py", line 882, in assertNotEqual
    raise self.failureException(msg)
AssertionError: 'af3c087d6c9131735c8d1f270a226892' == 'af3c087d6c9131735c8d1f270a226892'

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6151/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6166/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2551/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6156/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6101/steps/14/logs/stdio


On 06/12/2023 19:33:02+0100, J�rg Sommer via lists.openembedded.org wrote:
> From: J�rg Sommer <joerg.sommer@navimatix.de>
> 
> The function `update_fstab` should not touch the fstab for partitions with
> `--no-fstab-update`.
> 
> Signed-off-by: J�rg Sommer <joerg.sommer@navimatix.de>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 9b619e41c1..013aa4255f 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -116,7 +116,7 @@ class DirectPlugin(ImagerPlugin):
>  
>          updated = False
>          for part in self.parts:
> -            if not part.realnum or not part.mountpoint \
> +            if not part.realnum or not part.mountpoint or part.no_fstab_update \
>                 or part.mountpoint == "/" or not (part.mountpoint.startswith('/') or part.mountpoint == "swap"):
>                  continue
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191906): https://lists.openembedded.org/g/openembedded-core/message/191906
> Mute This Topic: https://lists.openembedded.org/mt/103018986/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

