Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 090276D001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:37:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,730,1378854000"; d="scan'208";a="49422811"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Nov 2013 17:37:25 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1VipEr-0003mf-A4; Tue, 19 Nov 2013 17:37:25 +0000
Date: Tue, 19 Nov 2013 17:37:25 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131119173725.GA13018@mcrowe.com>
References: <cover.1381266484.git.bruce.ashfield@windriver.com>
	<9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <9f62e2e632692c5919a0de25a785d17d477a64b3.1381266484.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Tue, 19 Nov 2013 17:37:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 08 October 2013 at 17:12:54 -0400, Bruce Ashfield wrote:
> When building against the sysroot, out of tree modules can require modpost
> and other utilities normally found in the kernel's scripts directory. For
> the kernel source in the staging dir, these scripts have been removed to
> avoid mixing archiectures when packaging kernel-dev (among other things).
> 
> Rather than further complicate the kernel's install rule, or its packaging,
> we can restore the scripts by building them in the kernel staging directory
> after the sstate is installed, making them available to packages that need them.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4acfb7e..d5fa801 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -292,6 +292,17 @@ kernel_do_install() {
>  }
>  do_install[prefuncs] += "package_get_auto_pr"
>  
> +
> +SSTATEPOSTINSTFUNCS += "kernelscripts_sstate_postinst"
> +kernelscripts_sstate_postinst () {
> +	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
> +		( 
> +		  cd ${STAGING_KERNEL_DIR}
> +		  oe_runmake scripts
> +		)
> +	fi
> +}
> +
>  sysroot_stage_all_append() {
>  	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>  }

This sstate_postinst fails for me when the compiler isn't already present
in the sysroot.

Also, I notice that the environment and parameters passed to oe_runmake are
not the same as those used by kernel_do_compile etc.

Patches to follow.

Mike.

