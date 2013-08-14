Return-Path: <dvhart@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 116FD6007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 18:10:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2013 11:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,878,1367996400"; d="scan'208";a="386369092"
Received: from jfdmzpr04.jf.intel.com (HELO [10.7.201.153]) ([10.7.210.23])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2013 11:10:56 -0700
Message-ID: <1376503856.12272.217.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Yang Shi <yang.shi@windriver.com>
Date: Wed, 14 Aug 2013 11:10:56 -0700
In-Reply-To: <1376498514-23057-2-git-send-email-yang.shi@windriver.com>
References: <1376498514-23057-1-git-send-email-yang.shi@windriver.com>
	<1376498514-23057-2-git-send-email-yang.shi@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.4 (3.8.4-1.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "hello-mod: Ensure the produced package name begins with kernel-module-"
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
X-List-Received-Date: Wed, 14 Aug 2013 18:10:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-08-14 at 09:41 -0700, Yang Shi wrote:
> [YOCTO #4286]
> 
> The package runtime mapping rename issue is already fixed by
> commit 0bc564af07c1bae8112f834a60aea3b72af7de13, the "kernel-module-" workaround
> is not necessary anymore for out-of-tree module package, so revert that commit.
> 
> This reverts commit 71aafc214fe407b7620e747c11dfb8326c867b1c.
> 

Is runtime mapping rename the right solution to this? I don't have any
experience with it, I'm not objecting, just asking the question. Is
runtime mapping rename a catchall for things that don't do the right
thing in the first place, or is it the preferred mechanism?

My uninformed initial reaction is that it makes more sense to be
explicit with this sort of thing so people can know what to expect as
the output from recipes like this without having to track down what the
runtime mapping rename will do to the package output.

As things stand now, I can see from the hello-mod recipe that the
package will be called kernel-module-hello-mod, if we drop this, I would
expect it to be hello-mod if I didn't have a deep knowledge of this
rename mechanism...

My 0.02 USD.

> Signed-off-by: Yang Shi <yang.shi@windriver.com>
> ---
>  .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    8 --------
>  1 files changed, 0 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> index 621f700..64a6dda 100644
> --- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> +++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> @@ -13,11 +13,3 @@ SRC_URI = "file://Makefile \
>            "
>  
>  S = "${WORKDIR}"
> -
> -# Kernel module packages MUST begin with 'kernel-module-', otherwise
> -# multilib image generation can fail.
> -#
> -# The following line is only necessary if the recipe name does not begin
> -# with kernel-module-.
> -#
> -PKG_${PN} = "kernel-module-${PN}"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



