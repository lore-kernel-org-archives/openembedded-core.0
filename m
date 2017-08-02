Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 598B97808B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 08:49:03 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 02 Aug 2017 01:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,310,1498546800"; d="scan'208";a="134334091"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2017 01:49:05 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 0999F5809DF;
	Wed,  2 Aug 2017 01:49:03 -0700 (PDT)
Date: Wed, 2 Aug 2017 11:26:04 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: liu.ming50@gmail.com
Message-ID: <20170802082604.GA2944@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
	<1501607630-30241-3-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1501607630-30241-3-git-send-email-liu.ming50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] image_types_wic.bbclass: deal with dependencies only with WKS_FILE_DEPENDS_DEFAULT
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
X-List-Received-Date: Wed, 02 Aug 2017 08:49:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2017 at 07:13:48PM +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> Drop do_image_wic depends varflags, move the dependencies to
> WKS_FILE_DEPENDS_DEFAULT. I can not see the need to maintain them
> in two different ways, besides that it's out of USING_WIC control.
> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/classes/image_types_wic.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index b825b47..7b0a1c7 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -39,9 +39,8 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
>  USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
>  WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
>  do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> -do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
>  
> -WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
> +WKS_FILE_DEPENDS_DEFAULT = "parted-native gptfdisk-native dosfstools-native mtools-native syslinux-native bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
>  WKS_FILE_DEPENDS_BOOTLOADERS = ""
>  WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
>  WKS_FILE_DEPENDS_BOOTLOADERS_x86-64 = "syslinux grub-efi systemd-boot"

This breakes wic build on qemux86-64 target on my machine with the
error: "ERROR: A native program parted required to build the image was not found (see details above)."

--
Regards,
Ed

