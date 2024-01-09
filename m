Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADA1C4707B
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 21:44:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.29952.1704836670995671549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 13:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X/C4PJCO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7EB54000C;
	Tue,  9 Jan 2024 21:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704836669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMeP6pwMGBaEGYQLrFcA4O7UPPKUCWK0OBmyd5bEz9o=;
	b=X/C4PJCOjtPif1KlWsNSkC4jjBco2zk5WZeOAC1+aNszrES1dOT7m9+ZNJrommcPw9F+N1
	jm8QIcr9l2Q4obJaTA6GB3QuzMXKJh8ubsjDUEW7XPjsyYORDk296VXV1qzwEyxz2flsTw
	jtGFDV6UKAi8e7EXLnhpMr2OWNK3dypdh8dckYikt932MsE8k9BBisqyl9BY0s0za/ARUs
	gwEc9NXrJloGhqD6pJBGa2aNxG7t1aIWt8m3obeq4pe4kzE/OUInC/ATlWBAnP9/EPtvzc
	xFZjrBNOy0C1ijJplSaZKTQtFp0L4IzDjy4j8FAnEl4P7hmbn3GGi30jlmpDLA==
Date: Tue, 9 Jan 2024 22:44:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] package_rpm: proposal to use internal
 dependency generator
Message-ID: <20240109214428e0404a43@mail.local>
References: <20240109075641.993044-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109075641.993044-1-xiangyu.chen@eng.windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 21:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193483

Hello,

This causes failures on the autobuilders:
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8478/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/8432/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/5523/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6142/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5957/steps/12/logs/stdio


DNF version: 4.18.2
cachedir: /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-ptest-valgrind/1.0/rootfs/var/cache/dnf
Added oe-repo repo from /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-ptest-valgrind/1.0/oe-rootfs-repo
User-Agent: falling back to 'libdnf': could not detect OS or basearch
repo: using cache for: oe-repo
oe-repo: using metadata from Tue 09 Jan 2024 09:11:27 AM UTC.
Last metadata expiration check: 0:00:01 ago on Tue 09 Jan 2024 09:11:29 AM UTC.
--> Starting dependency resolution
--> Finished dependency resolution
Error: 
 Problem: conflicting requests
  - nothing provides /bin/csh needed by valgrind-ptest-3.21.0-r0.cortexa8hf_neon from oe-repo
  - nothing provides /this/is/a/bogus/interpreter/name needed by valgrind-ptest-3.21.0-r0.cortexa8hf_neon from oe-repo
  - nothing provides /usr/local/bin/bash needed by valgrind-ptest-3.21.0-r0.cortexa8hf_neon from oe-repo
  - nothing provides /usr/local/bin/ksh93 needed by valgrind-ptest-3.21.0-r0.cortexa8hf_neon from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)



On 09/01/2024 15:56:41+0800, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Currently we are using external dependency generator, the rpm upstream already
> marked it as "Old Style Dependency Generators"[1], they also added a warning message
> in rpm source code to inform that the external dependency generator is deprecated[2].
> 
> Since it is only kept for backwards compatibility and may get removed in a future
> release of rpm, so here is a proposal to use internal dependency generator by default.
> 
> [1] https://rpm-software-management.github.io/rpm/manual/dependency_generators.html
> [2] https://github.com/rpm-software-management/rpm/commit/cfcdd942
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/classes-global/package_rpm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index 2fc18fe98c..05cecee7d7 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -681,7 +681,7 @@ python do_package_rpm () {
>      cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
>      cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
>      cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
> -    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
> +    cmd = cmd + " --define '_use_internal_dependency_generator 1'"
>      cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
>      cmd = cmd + " --define '_build_id_links none'"
>      cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193444): https://lists.openembedded.org/g/openembedded-core/message/193444
> Mute This Topic: https://lists.openembedded.org/mt/103616137/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

