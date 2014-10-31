Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2864E71F2C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 16:47:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 31 Oct 2014 09:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="629109561"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2014 09:47:02 -0700
Message-ID: <1414774022.3268.18.camel@empanada.home.network>
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Fri, 31 Oct 2014 11:47:02 -0500
In-Reply-To: <5453AC6C.5090206@pabigot.com>
References: <5453AC6C.5090206@pabigot.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: issues encountered using wic
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
X-List-Received-Date: Fri, 31 Oct 2014 16:47:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2014-10-31 at 10:36 -0500, Peter A. Bigot wrote:
> I've started to transition to wic (in master) in hopes it reduces the 
> amount of host passwd contamination resulting from creating SD images by 
> untarring the rootfs onto an SD card.  I've run into the following 
> initial issues:
> 
> First, wic requires a populated rootfs, by default in the recipe build 
> directory.  Two issues: (1) this normally removed by rm_work, and (2) 
> bitbake foo-image will not populate that directory if the required 
> artifacts are available from sstate-cache (as happens when you then add 
> foo-image to RM_WORK_EXCLUDE and reinvoke bitbake).
> 
> Both could be solved by getting the rootfs contents from an archive 
> created by the image instead of assuming it's unpacked somewhere 
> already.  Requiring IMAGE_FSTYPES to contain "tar.bz2" for wic doesn't 
> seem burdensome.  Taking this path also opens up the possibility for wic 
> plug-ins to customize configuration files (such as host keys) in the 
> image rootfs without contaminating a shared resource used by other 
> invocations of wic.
> 
> If this seems like a reasonable approach and the wic maintainers would 
> like assistance with it, I'd be happy to put together a patch.
> 

It sounds like a nice enhancement, though I'm not sure about the exact
implementation.  As it happens, someone just today asked me to review
some changes to wic that include a 'rootfs building functionality' that
might overlap with this.  Let me take a look at that and get back to
once I've taken a look.

> Second, wic requires IMAGE_BOOT_FILES to be provided (normally in 
> machine.conf, as with meta-yocto-bsp's beaglebone.conf).  I normally use 
> the beaglebone.conf from meta-ti, and found copying the IMAGE_BOOT_FILES 
> setting to that BSP layer didn't work because the reference to 
> ${UBOOT_SUFFIX} remained empty. meta-yocto-bsp's beaglebone.conf defines 
> and uses UBOOT_SUFFIX="img", but this is fragile as the real 
> UBOOT_SUFFIX comes from u-boot.inc (where the default is "bin") or some 
> other override.
> 
> Is there a way to resolve the potential inconsistency other than 
> hard-coding a specific suffix in machine.conf?  "include u-boot.inc" in 
> the machine.conf seems like a bad idea.
> 

I don't see any way around this, unless you added wildcarding.  Adding
Maciej, who added this capability for uboot and might have some ideas...

Tom 

> Peter



