Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id E92226B898
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:28:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3500LRYPVCUQI0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 28 Mar 2014 12:28:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5ED1620398; Fri,
	28 Mar 2014 13:28:24 -0400 (EDT)
Date: Fri, 28 Mar 2014 13:28:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Phil Blundell <pb@pbcl.net>
Message-id: <20140328172824.GJ3370@denix.org>
References: <1366735649.5732.21.camel@phil-desktop.brightsign>
MIME-version: 1.0
In-reply-to: <1366735649.5732.21.camel@phil-desktop.brightsign>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch: Always use ld.bfd to link the kernel
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
X-List-Received-Date: Fri, 28 Mar 2014 17:28:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 23, 2013 at 05:47:29PM +0100, Phil Blundell wrote:
> The kernel's penchant for custom linker scripts means that it doesn't
> generally get on very well with gold.  Make sure we are using the BFD
> linker here no matter what the distro default is set to.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/kernel-arch.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-arch.bbclass
> b/meta/classes/kernel-arch.bbclass
> index b3b71ba..4a140eb 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -53,6 +53,6 @@ TARGET_AR_KERNEL_ARCH ?= ""
>  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
>  
>  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH}"
> -KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld ${HOST_LD_KERNEL_ARCH}"
> +KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"

I know this is almost a year-old change.

The question I have is - what should one do when using an external toolchain 
that doesn't have ld.bfd provided? I know these days with gold vs. BFD linker, 
it's common to have ld.bfd, but there could be exceptions...

Should this assignment be conditional, so it's easier to override from 
local.conf or distro?

-- 
Denys

