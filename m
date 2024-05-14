Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86783C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 20:38:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.4528.1715719087274516915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 13:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YHuZ001I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13E31E0002;
	Tue, 14 May 2024 20:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715719085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8tjR0d+8kY9irMfu0S5WhRFFkUcjuTv79ccmzyTumIg=;
	b=YHuZ001ImV2EtiVYvlS/rZrbFosdQLRzSLJQxTdSCI8zW2moxg5Gxwvumy79R4PjpVmDyF
	rc8dc7Mf9T+b3HZ5+P8g//kPPcpB5x/gWMNy7FxoWmTra87566gDEddJlm6lSSoEikT60Y
	Hp6NaOa8hbSQmReG5Nu7pVpa6kqKgBZvQUbZN8pEME8E0g96iqum2gY30WWzgEimtZr2Aq
	A3+LPFFljNPP6N8REvNCDS4vLRQJSfdcmpIyqON8PuKRYDlwV/CJlKee8ujMYs9muSRADn
	qLKG/HhVcCXowbEc60tYK76Mp7p/eXgxxSjtrgKv102GeSGgT9vMqI7MZrIH+w==
Date: Tue, 14 May 2024 22:38:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Seungkyun Kim <seungkyun.kim@lge.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ipk/rootfs: run sanity test of multilib in
 parallel
Message-ID: <2024051420380480df3fef@mail.local>
References: <20240513133752.3818796-1-seungkyun.kim@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513133752.3818796-1-seungkyun.kim@lge.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 20:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199268

Hello,

This reliably fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/9008/steps/20/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/9012/steps/20/logs/stdio

On 13/05/2024 13:37:52+0000, Seungkyun Kim wrote:
> From: "seungkyun.kim" <seungkyun.kim@lge.com>
> 
> For multilib type packages, there is an additional temporary
> installation before the actual installation. It makes almost doubles
> the do_rootfs time if having many multilib type packages.
> To avoid this overhead, run sanity test in parallel.
> Installing package groups through opkg takes much more time than
> copying directory.
> 
> Signed-off-by: seungkyun.kim <seungkyun.kim@lge.com>
> ---
>  meta/lib/oe/package_manager/ipk/rootfs.py | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
> index ba93eb62ea..db1cc1650e 100644
> --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> @@ -6,6 +6,7 @@
>  
>  import re
>  import filecmp
> +import multiprocessing
>  import shutil
>  from oe.rootfs import Rootfs
>  from oe.manifest import Manifest
> @@ -198,10 +199,16 @@ class PkgRootfs(DpkgOpkgRootfs):
>  
>      def _multilib_test_install(self, pkgs):
>          ml_temp = self.d.getVar("MULTILIB_TEMP_ROOTFS")
> +        rootfs_temp = os.path.join(ml_temp, "rootfs")
>          bb.utils.mkdirhier(ml_temp)
>  
> -        dirs = [self.image_rootfs]
> +        bb.utils.remove(rootfs_temp, True)
> +        shutil.copytree(self.image_rootfs, rootfs_temp)
> +        dirs = [rootfs_temp]
> +        return multiprocessing.Process(target=self._multilib_test_pkg_install, \
> +                                       args=(pkgs, ml_temp, dirs, False))
>  
> +    def _multilib_test_pkg_install(self, pkgs, ml_temp, dirs):
>          for variant in self.d.getVar("MULTILIB_VARIANTS").split():
>              ml_target_rootfs = os.path.join(ml_temp, variant)
>  
> @@ -218,6 +225,8 @@ class PkgRootfs(DpkgOpkgRootfs):
>              dirs.append(ml_target_rootfs)
>  
>          self._multilib_sanity_test(dirs)
> +        rootfs_temp = os.path.join(ml_temp, "rootfs")
> +        bb.utils.remove(rootfs_temp)
>  
>      '''
>      While ipk incremental image generation is enabled, it will remove the
> @@ -300,15 +309,20 @@ class PkgRootfs(DpkgOpkgRootfs):
>  
>          for pkg_type in self.install_order:
>              if pkg_type in pkgs_to_install:
> +                sanity_test = None
>                  # For multilib, we perform a sanity test before final install
>                  # If sanity test fails, it will automatically do a bb.fatal()
>                  # and the installation will stop
>                  if pkg_type == Manifest.PKG_TYPE_MULTILIB:
> -                    self._multilib_test_install(pkgs_to_install[pkg_type])
> +                    sanity_test= self._multilib_test_install(pkgs_to_install[pkg_type])
> +                    sanity_test.start()
>  
>                  self.pm.install(pkgs_to_install[pkg_type],
>                                  [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
>  
> +                if sanity_test is not None:
> +                    sanity_test.join()
> +
>          if self.progress_reporter:
>              self.progress_reporter.next_stage()
>  
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199239): https://lists.openembedded.org/g/openembedded-core/message/199239
> Mute This Topic: https://lists.openembedded.org/mt/106072581/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

