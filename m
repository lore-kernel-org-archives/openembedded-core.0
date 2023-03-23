Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1523AC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 08:25:19 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.67198.1679559911056161663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 01:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UEwuDd/U;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 27FF3240002;
	Thu, 23 Mar 2023 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679559909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xcyknOoGioR6Q9xVX0naYumm8zdXb/OlwFkQbT/WTQM=;
	b=UEwuDd/UmPf61fVDsEf+Kpt7JY3u2CPdLG4u+2lbjZtWndiIa9zogRXPzx8YoQLSS8BgKb
	8MhIdQgJDu9fo1VvvIgCZiSYdLmYciwBYUQr/+k+EowxJCnbSz6moDwQpfsN4ak3SNrIEw
	YWb5RpMXeOSsJwye7DkKUqddY7mmLDwbFBZookCyfK0LS5LelM8mmlZ0RCFXFN0pfxfgge
	KnwAnZCKbbEwf6T5MoKcxTx8UoE0pS5O2b99hrUV3z83yWXvl6/A4rvME+kdul3gg8tPMi
	61M/pbouEfoMHVTISwLtBd8/Cg2JlL5reoSBGGrRI08LbhZe5aUpdmxqEmsA4A==
Date: Thu, 23 Mar 2023 09:25:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fawzi KHABER <fawzi.khaber@smile.fr>
Cc: openembedded-core@lists.openembedded.org,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: Re: [OE-core] [PATCH 1/2] package.bbclass: check packages name
 conflict in do_package
Message-ID: <2023032308250714890ab1@mail.local>
References: <20230322164224.100884-1-fawzi.khaber@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322164224.100884-1-fawzi.khaber@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178970

Hello,

For some reason, this breaks the reproducible build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2589/steps/13/logs/stdio

ERROR: packagenameconflict-1.0-r0 do_package: package "packagenameconflict-dev" is renamed to "packagenameconflict-renametest" using PKG:packagenameconflict-dev, but package name already exists
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/packagenameconflict/1.0-r0/temp/log.do_package.3523737
NOTE: recipe packagenameconflict-1.0-r0: task do_package: Failed
ERROR: Task (/home/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb:do_package) failed with exit code '1'
NOTE: Running task 12650 of 16502 (/home/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftest/recipes-devtools/python/python3-async-test_0.6.2.bb:do_package)

On 22/03/2023 17:42:23+0100, Fawzi KHABER wrote:
> It is possible to rename packages with the macro PKG:${PN} and result in
> a package name conflict if the target name exists already.
> 
> Add a fatal check to prevent this issue to go unnoticed.
> 
> Fix [Yocto #12060]
> 
> Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
> Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
> ---
>  meta/classes-global/package.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
> index 7e96601cd9..30dfd63d4f 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -496,6 +496,16 @@ python do_package () {
>  
>      bb.build.exec_func("package_convert_pr_autoinc", d)
>  
> +    # Check for conflict between renamed packages and existing ones
> +    # for each package in PACKAGES, check if it will be renamed to an existing one
> +
> +    for p in packages:
> +        localdata = bb.data.createCopy(d)
> +        localdata.setVar('OVERRIDES', p)
> +        rename = localdata.getVar('PKG')
> +        if (rename != None) and rename in packages:         
> +            bb.fatal('package %s is renamed %s using PKG:%s, but package name already exists'%(p,rename,p))
> +
>      ###########################################################################
>      # Optimisations
>      ###########################################################################
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178951): https://lists.openembedded.org/g/openembedded-core/message/178951
> Mute This Topic: https://lists.openembedded.org/mt/97782594/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

