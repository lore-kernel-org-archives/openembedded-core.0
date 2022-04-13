Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A367BC3527D
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.3271.1649832401059704826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 23:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TI2f+zEP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 00BE21BF203;
	Wed, 13 Apr 2022 06:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649832399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/KUUg2bye/vy7zYlVrHM7tYPuqSU/vjQhBALOUwLxZc=;
	b=TI2f+zEPWEAxS5Ka4OadEjN3wDmEZgwacgXZPfIe/991UfW6g9Srn/WKmtRTuZi0Wbi40B
	y8oGrJQp8MkPHsG0+0n0w476GVMEQ/yJkY8M1xnBwWOEvkwEQHQ2XusfMlT+yp94KiBWVq
	+3EAeegqzHIvaC164y+zTAs7UwAuEAoH0q3EC+yaKIHRfwfik9LcdDZOg61S0FBY3TKNY4
	sNALK49xBek9wb3EQsIAy3RnJafeica6aXGiCPYEeiTTCZFj1uBaw9V5Dpi0/6B8swGemS
	4O03qdGh1iQlTVoyaUir5NaD/ScXM6FhH8BIEDyXXDbGdRT1EJe+SvCjXrSgJw==
Date: Wed, 13 Apr 2022 08:46:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: yozhao@google.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel_configcheck should be run for SRCTREE
 linux
Message-ID: <YlZxziZLkT5LLhhq@mail.local>
References: <20220407013959.929748-1-yozhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407013959.929748-1-yozhao@google.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164301

Hello,

I believe this has introduced a race condition and is the cause of those
two failures:
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3442/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3399/steps/14/logs/stdio

2022-04-12 22:43:44,845 - oe-selftest - INFO - FAIL: devtool.DevtoolUpgradeTests.test_devtool_virtual_kernel_modify (subunit.RemotedTestCase)
2022-04-12 22:43:44,845 - oe-selftest - INFO - ----------------------------------------------------------------------
2022-04-12 22:43:44,845 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/devtool.py", line 1911, in test_devtool_virtual_kernel_modify
    runCmd('devtool build %s' % kernel_provider)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/commands.py", line 207, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'devtool build linux-yocto' returned non-zero exit status 1:

ERROR: linux-yocto-5.15.32+git999-r0 do_kernel_configcheck: config analysis failed: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-3540668/tmp/work/qemux86_64-poky-linux/linux-yocto/5.15.32+git999-r0/temp/log.do_kernel_configcheck.342487
NOTE: recipe linux-yocto-5.15.32+git999-r0: task do_kernel_configcheck: Failed
ERROR: Task (/tmp/devtoolqasd4ey4qf/core-copy/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_configcheck) failed with exit code '1'

I tried to get the logs from the autobuilders but the
linux-yocto/5.15.32+git999-r0/ directory was not present anymore...

On 06/04/2022 18:39:59-0700, Yong Zhao via lists.openembedded.org wrote:
> The task is useful for a SRCTREE linux. Because it won't modify the
> SRCTREE, it does not hurt to run it by default.
> 
> Signed-off-by: Yong Zhao <yozhao@google.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  scripts/lib/devtool/standard.py   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 1d5a8cdf29..56ba340c1b 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -1,5 +1,5 @@
>  # remove tasks that modify the source tree in case externalsrc is inherited
> -SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
> +SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_checkout do_fetch do_unpack do_patch"
>  PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
>  PATCH_GIT_USER_NAME ?= "OpenEmbedded"
>  
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index 01fb5ad96f..35cea6f320 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -949,7 +949,7 @@ def modify(args, config, basepath, workspace):
>  
>              if bb.data.inherits_class('kernel', rd):
>                  f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
> -                        'do_fetch do_unpack do_kernel_configcheck"\n')
> +                        'do_fetch do_unpack"\n')
>                  f.write('\ndo_patch[noexec] = "1"\n')
>                  f.write('\ndo_configure:append() {\n'
>                          '    cp ${B}/.config ${S}/.config.baseline\n'
> -- 
> 2.35.1.1094.g7c7d902a7c-goog
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164095): https://lists.openembedded.org/g/openembedded-core/message/164095
> Mute This Topic: https://lists.openembedded.org/mt/90304701/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

