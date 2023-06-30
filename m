Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB57EEB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 15:06:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.14741.1688137615198232829
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 08:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KALUGNCo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688137612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UqDvctz4qQmE3PgTog+F/CeyQfNNPILyHFEb4uc1Fjk=;
	b=KALUGNCojiIpeYXDfBoPA+Ow8sz79qaFjq45BCi0He7XwSa+aRM02j69plTfzEA6VVa/zh
	oKFCN5e5irULtdVhqvVecjpy403ZpkP4YzQ1PyOmRiHaNm+skyB4fNXbsy+D5V57imeOkz
	g/kGuwHwKyG3NVCR37QXokZbCbsfpK+u1xzycgEwO5EWqNOClT/yzQQvDoo2Lslj8/0iMb
	CcOWp80NGISZ/TEbLxTELBCSiZSqN1UarL2mfBelV8vR0GUUrn+CRzfxhwGVRyJLp2AdX0
	sbOZsYnzwsR6do5ZmIxxuBqobsXw06JMVEAlh79XKM5odiR3ZTkqfKd038sEqg==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F1AF40003;
	Fri, 30 Jun 2023 15:06:52 +0000 (UTC)
Date: Fri, 30 Jun 2023 17:06:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: luca.ceresoli@bootlin.com
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: hoist up "unset S" bbfatal
 from kernel-yocto.bbclass to kernel.bbclass
Message-ID: <20230630150651a71148e4@mail.local>
References: <20230626135024.34405-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626135024.34405-1-luca.ceresoli@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 15:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183700

Hello,

This caused the following failures on the AB:

stdio: ERROR: linux-yocto-6.1.35+gitAUTOINC+b358c237cf_915f4d2237-r0 do_symlink_kernsrc: S is not set to the linux source directory. Check the recipe and set S to the proper extracted subdirectory.
stdio: ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto/6.1.35+gitAUTOINC+b358c237cf_915f4d2237-r0/temp/log.do_symlink_kernsrc.3914759
stdio: ERROR: Task (/home/pokybuild/yocto-worker/qemuarm/build/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc) failed with exit code '1'
stdio: ERROR: Command . ./oe-init-build-env; bitbake core-image-sato core-image-sato-sdk core-image-minimal core-image-minimal-dev core-image-sato:do_populate_sdk -k failed with exit code 1, see errors above. (1687981572.9: 11986.3)

On 26/06/2023 15:50:24+0200, Luca Ceresoli via lists.openembedded.org wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Writing a simple recipe that inherits kernel.bbclass and downloads a kernel
> tarball (e.g. a mainline release from kernel.org) via http or ftp fails
> with either:
> 
>   ERROR: linux-acme-6.3.3-r0 do_configure: oe_runmake failed
>   ...
>   | make: *** No rule to make target 'oldnoconfig'.  Stop.
> 
> or (seen on a different setup, based on kirkstone):
> 
>   ... do_populate_lic: QA Issue: ... LIC_FILES_CHKSUM points to an invalid file: .../work-shared/.../kernel-source/COPYING [license-checksum]
> 
> This happens when not setting S in the recipe. In this case, kernel.bbclass
> sets it to ${STAGING_KERNEL_DIR}
> (${TMPDIR}/work-shared/${MACHINE}/kernel-source).  This means that in
> do_symlink_kernsrc(), the 'if s != kernsrc' never triggers and thus the
> kernel tree will not be moved into work-shared, which results in an empty
> work-shared/.../kernel-source directory.
> 
> Setting S in recipes is usually not required when downloading a tarball, so
> it is not obvious here and the error message does not point to the problem
> or its solution.
> 
> There is such a check in kernel-yocto.bbclass though. Move it to
> kernel.bbclass so that even kernel recipes not based on kernel-yocto can
> benefit from it.
> 
> The check is moved:
> 
>  - from the beginning of do_kernel_checkout() in kernel-yocto
>  - to the end of do_symlink_kernsrc() in kernel.bbclass
> 
> and since do_kernel_checkout is executed 'after do_symlink_kernsrc', the
> code flow does not change in a relevant way when using linux-yocto.
> 
> As an additional benefit, the check is now taking place both when
> downloading a tarball and when downloading from git, so even when using git
> the recipe writer will be presented the explanatory error message.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v2:
>  - don't check for WORKDIR/git dir existence (Suggested by Richard)
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 8 --------
>  meta/classes-recipe/kernel.bbclass       | 6 ++++++
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
> index 4ac977b12207..3f2ce17aeb88 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -394,16 +394,8 @@ do_kernel_checkout() {
>  		# case: we have no git repository at all. 
>  		# To support low bandwidth options for building the kernel, we'll just 
>  		# convert the tree to a git repo and let the rest of the process work unchanged
> -		
> -		# if ${S} hasn't been set to the proper subdirectory a default of "linux" is 
> -		# used, but we can't initialize that empty directory. So check it and throw a
> -		# clear error
>  
>  	        cd ${S}
> -		if [ ! -f "Makefile" ]; then
> -			bberror "S is not set to the linux source directory. Check "
> -			bbfatal "the recipe and set S to the proper extracted subdirectory"
> -		fi
>  		rm -f .gitignore
>  		git init
>  		check_git_config
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index e82b696d1a14..75f43cb1134e 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -195,6 +195,12 @@ python do_symlink_kernsrc () {
>              import shutil
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
> +
> +    # Setting S is required with this class when fetching a tarball because
> +    # we cannot figure out automatically the extracted directory name. The
> +    # check is beneficial even when using git so don't check for git here.
> +    if not os.path.exists(os.path.join(s, "Makefile")):
> +        bb.fatal("S is not set to the linux source directory. Check the recipe and set S to the proper extracted subdirectory.")
>  }
>  # do_patch is normally ordered before do_configure, but
>  # externalsrc.bbclass deletes do_patch, breaking the dependency of
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183420): https://lists.openembedded.org/g/openembedded-core/message/183420
> Mute This Topic: https://lists.openembedded.org/mt/99787873/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

