Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DF8EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 22:41:58 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.6187.1687819309806938258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 15:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HRqwdK7k;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-401e38e203dso4386661cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 15:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687819309; x=1690411309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dmydo6pMOmCIG8/OAeoSMoUEMKJQTVN/g5U7nZkmZyY=;
        b=HRqwdK7kfOu3m0ihbssljEevHpyTrxiDqRIkTNRT88NVY4RAkrDYbLCz+7kNHtNHTA
         zMek8bpM1XXYtBHMIXvCiZ0bhvBPPVWzneK7k5KxcKhZfDKOc//zM2ZSmduFsiDKJCTk
         ycEInWzMURZ/rxYXT9Nrrp2wVCafR/ZgS8SLghGz0U7dn0EFRC0SIRFnEV3YDDtaIA88
         7jXNyggsK7ts/oQeJ3MFKoAaTAvRmHGF/dTTaV8HM07Lsw0aQBaavfN+Mz+avr2t4HS4
         HMnbYGB60EbqKPwtEnkbLgA2kPRwLNwTJ4TTEuOTllHcPRvYd0A7uJyO4d5w3JxTgwxo
         qKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687819309; x=1690411309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmydo6pMOmCIG8/OAeoSMoUEMKJQTVN/g5U7nZkmZyY=;
        b=HIn+bG+McQEE8SSmq94Ic5H9RHbs8qzCmtK5IkAm1Xh/xnTqRamNfoyOB49paFaPdx
         DgXMvsHoEHblbFRR+csOWTJwjaqHHmVQGN+oXV2B+wSYQ6b8O4JUxA7Iky0mkyR8/OVm
         HY3vDVQiKVvGE7Al/ONr0jX9jcaa1efFYoS2b+0gRRIswklcOtPbZLTc+Rs4uE5YnDeU
         P7kbTov9t2SaQyIVUqNR3bMkZCYf+N4KvfoCIa/g4bzw9OGYMgyy2JqRUiWEdPILzxd6
         LIcQjm9tirVHz7tNS8kl6rUdDHLLSIIHvBsIN3bQq8dAWZhX3x9qzg2lTDOWjVw4/Td4
         XrFA==
X-Gm-Message-State: AC+VfDyldvixpKcdb//BU2H2aAos9PPDAkuB3yqyQJaiEjpy+XJy3rVy
	7/pkk1EHFwed3U17t48vwoM=
X-Google-Smtp-Source: ACHHUZ72gVI+QN6HfvG4Y5PMUvn4J4h4V6vKxVD+T0Mz68XO1Cso3z5sKDpSUP3QGJZcZL6VEU/qsg==
X-Received: by 2002:a05:6214:1d0b:b0:62f:eae4:b2cd with SMTP id e11-20020a0562141d0b00b0062feae4b2cdmr39343107qvd.16.1687819308779;
        Mon, 26 Jun 2023 15:41:48 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id ev14-20020a0562140a8e00b00631fea4d5c2sm3644425qvb.98.2023.06.26.15.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 15:41:48 -0700 (PDT)
Date: Mon, 26 Jun 2023 18:41:46 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v2] kernel.bbclass: hoist up "unset S" bbfatal from
 kernel-yocto.bbclass to kernel.bbclass
Message-ID: <ZJoUKtpDe4BRwDnh@gmail.com>
References: <20230626135024.34405-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626135024.34405-1-luca.ceresoli@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 22:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183435

In message: [PATCH v2] kernel.bbclass: hoist up "unset S" bbfatal from kernel-yocto.bbclass to kernel.bbclass
on 26/06/2023 luca.ceresoli@bootlin.com wrote:

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

That's the current task flow, but the checkout has moved in the past,
and could move again.

My "don't fix it if it isn't broken" inclination tells me to just
as for the new check to be added for the use case, and leave the
one in kernel-yocto as a backup, in case the task ordering changes
or some other strange path through the code appears later.

But either way, the change looks ok to me.

Bruce

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

