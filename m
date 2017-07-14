Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1317B6612D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 09:13:44 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 14 Jul 2017 02:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,358,1496127600"; d="scan'208";a="126617963"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2017 02:13:46 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 940075804B6;
	Fri, 14 Jul 2017 02:13:45 -0700 (PDT)
Date: Fri, 14 Jul 2017 12:01:20 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170714090120.GA15794@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1499326977.git.ed.bartosh@linux.intel.com>
	<c1ab5f6f84e705b6d17e1aa7b03a2cc0aa0cdcf4.1499326977.git.ed.bartosh@linux.intel.com>
	<1499761760.20211.97.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1499761760.20211.97.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/8] image_types_wic: set default WKS_FILE_DEPENDS
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
X-List-Received-Date: Fri, 14 Jul 2017 09:13:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 11, 2017 at 10:29:20AM +0200, Patrick Ohly wrote:
> On Thu, 2017-07-06 at 10:56 +0300, Ed Bartosh wrote:
> > diff --git a/meta/classes/image_types_wic.bbclass
> > b/meta/classes/image_types_wic.bbclass
> > index 05ee68d..e9750b5 100644
> > --- a/meta/classes/image_types_wic.bbclass
> > +++ b/meta/classes/image_types_wic.bbclass
> > @@ -40,7 +40,10 @@ USING_WIC =
> > "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s
> >  WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> > os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
> >  do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> >  do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot'
> > % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
> > -WKS_FILE_DEPENDS ??= ''
> > +WKS_FILE_DEPENDS ??= 'syslinux-native bmap-tools-native
> > cdrtools-native btrfs-tools-native squashfs-tools-native'
> > +WKS_FILE_DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
> > +WKS_FILE_DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
> > +
> 
> Using _append here adds these additional dependencies even when
> WKS_FILE_DEPENDS has been set explicitly. How about this:

True. Sorry, overlooked this.

> WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native
> cdrtools-native btrfs-tools-native squashfs-tools-native"
> WKS_FILE_DEPENDS_BOOTLOADERS = ""
> WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
> WKS_FILE_DEPENDS_BOOTLOADERS_x86-64 = "syslinux grub-efi systemd-boot"
> 
> WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS}"
>

Thanks, will do it in v2.

--
Regards,
Ed

