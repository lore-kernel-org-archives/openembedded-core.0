Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 702FC60655
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 21:26:55 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 May 2013 14:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,716,1363158000"; d="scan'208";a="244821252"
Received: from unknown (HELO envy2.home) ([10.255.12.173])
	by AZSMGA002.ch.intel.com with ESMTP; 21 May 2013 14:26:55 -0700
Message-ID: <519BE69F.9060606@linux.intel.com>
Date: Tue, 21 May 2013 14:26:55 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1369150787-21878-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1369150787-21878-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: Remove unnecessary cd and rm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2013 21:26:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Please include a a comment. The burden is on the submitter to prove
the cd and the rm are unnecessary, not the reviewer.


On 05/21/2013 08:39 AM, Martin Jansa wrote:
> ---
>  meta/classes/kernel.bbclass | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3320747..47a96c5 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -378,13 +378,10 @@ kernel_do_deploy() {
>  		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODULE_TARBALL_SYMLINK_NAME}
>  	fi
>  
> -	cd ${DEPLOYDIR}
> -	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
> +	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
> +	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}

So we are now in a different directory (do we know which one?) but the
source of the ln commands doesn't change. If we are in the same
directory, then why add DEPLOYDIR to the destination?

--
Darren

>  
>  	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> -	cd -
>  }
>  do_deploy[dirs] = "${DEPLOYDIR} ${B}"
>  do_deploy[prefuncs] += "package_get_auto_pr"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel

