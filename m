Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5209F78288
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 11:14:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 04:14:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="1139595604"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2017 04:14:38 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 69F3A5803A4;
	Fri,  9 Jun 2017 04:14:36 -0700 (PDT)
Date: Fri, 9 Jun 2017 14:13:34 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Wold, Saul" <saul.wold@intel.com>
Message-ID: <20170609111334.GA15584@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1495028624.git.ed.bartosh@linux.intel.com>
	<1496330509.6426.82.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1496330509.6426.82.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/7] i#10073: generic EFI for wic
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
X-List-Received-Date: Fri, 09 Jun 2017 11:14:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 01, 2017 at 03:21:51PM +0000, Wold, Saul wrote:
> On Wed, 2017-05-17 at 13:47 +0000, Ed Bartosh wrote:
> > Hi,
> > 
> > This patchset is an implementation of generic EFI approach for wic
> > images.
> > 
> > Instead of introducing yet another wic plugin it uses existing APIs
> > from
> > EFI_PROVIDER classes to populate ${WORKDIR}/bootfs directory with EFI
> > artifacts
> > and bootloader configuration. This directory can be used by wic
> > rootfs plugin
> > to put into boot partition of the image.
> > 
> > Example kickstart file and 2 test cases were added to wic test suite
> > to better
> > illustrate the approach.
> > 
> > I personally like this approach much better than duplicating oe image
> > creation
> > functionality in wic plugins. This way we can have the code in one
> > place and
> > bootloaders can be configured the same way for oe and wic images.
> > 
> 
> Ed,
> 
> I have been looking at this set of changes over the last few days, and
> while I like the basic approach, I don't think it goes far enough.  I
> am looking at how one would create a generic bootfs via a DEPLOY_DIR
> and an image-bootfs.bb type of recipe that does the bootfs construction
> instead of the existing systemd-boot or grub-efi bbclass construction.
> 
> This will allow for more flexibility in creating labels for
> bootloaders, different types of boot loaders without having to create
> classes.  We should then be able to construct the equivlant of hddimg
> or iso images via a recipe that depends on the various do_deploy()
> tasks of the images dependent items (syslinux, grub, virtual/kernel)
> and configuration.
I like the idea in general. In practice it could be hard to synchronize
variables between a recipe and .wks file

Obvious example of this would be generation of partition UUID and
writing it into bootloader configs and .wks.in

I spent quite a bit of time on this. The only way I found to get them
synchronized is to merge both tasks (generation of .wks file from
.wks.in and generation of bootloader config) into one:
http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136551.html

If we find a way to solve this then I'm all for your proposal.

> I think we are still too locked into prepare_wic_build() calling
> build_efi_cfg and efi_bootfs_populate, which means wic still needs
> knowledge of the boot loaders instead of just having a recipe populate
> a bootfs partition and wic creating the partition and copying files
> into it.
Well, I tend to disagree here. Yes, my code expects that build_efi_cfg
and efi_bootfs_populate APIs are provided by bootloader class. However,
it doesn't need to know any bootloader-specific internals. It calls
those 2 APIs of current EFI provider class and expects fully populated
bootloader artifacts in bootfs directory.

BTW, even if we use recipes to generate bootfs we'll most probably end
up using some classes to avoid duplication of code in recipes. Those
classes will probably contain less code than currently, but we'll need
them unless we want to duplicate generation of bootloader configs and
copying bootloader files in all bootf recipes.

Regards,
Ed

