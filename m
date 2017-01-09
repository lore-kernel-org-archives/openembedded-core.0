Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C5ED360123
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 10:41:00 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 09 Jan 2017 02:41:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,339,1477983600"; d="scan'208";a="51084225"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 09 Jan 2017 02:41:00 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2E8036A4006;
	Mon,  9 Jan 2017 02:40:05 -0800 (PST)
Date: Mon, 9 Jan 2017 12:18:39 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20170109101839.GA13582@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170107180301.1935-1-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <20170107180301.1935-1-adrian.ratiu@ni.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: ken.sharp@ni.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] wic/isoimage-isohybrid: remove do_stage_partition()
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
X-List-Received-Date: Mon, 09 Jan 2017 10:41:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ioan-Adrian,

Thank you for the patch!

It looks good to me.
+1

On Sat, Jan 07, 2017 at 08:03:01PM +0200, Ioan-Adrian Ratiu wrote:
> The purpouse of this function was to check dependencies for building a
> hybrid iso and build them using bitbake if not found. Calling bitbake in
> this context means this wic plugin itself cannot be instrumented inside
> bitbake recipes which is undesirable, the benefits of this are clear:
> there is no need to maintain outside scripts to generate an iso using wic
> and the isohybrid building logic can be further abstracted away into an
> isohybrid.bbclass in the future which can be easily inherited or something
> similar.
> 
> So remove the function and add all dependencies to NATIVE_RECIPES so that
> wic can print useful errors when they're not built.
> 
> To automate building the isohybrid image dependencies, add the following
> somewhere in your image build inheritence hierarcy (or maybe create a
> bbclass in the future to do these sort of things automatically):
> 
> DEPENDS += "syslinux syslinux-native cdrtools-native e2fsprogs-native \
>             parted-native dosfstools-native mtools-native grub-efi-native"
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../lib/wic/plugins/source/isoimage-isohybrid.py   | 49 ----------------------
>  scripts/lib/wic/utils/oe/misc.py                   |  4 ++
>  2 files changed, 4 insertions(+), 49 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> index 3858fd439b..15fd858d22 100644
> --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> @@ -194,55 +194,6 @@ class IsoImagePlugin(SourcePlugin):
>          return initrd
>  
>      @classmethod
> -    def do_stage_partition(cls, part, source_params, creator, cr_workdir,
> -                           oe_builddir, bootimg_dir, kernel_dir,
> -                           native_sysroot):
> -        """
> -        Special content staging called before do_prepare_partition().
> -        It cheks if all necessary tools are available, if not
> -        tries to instal them.
> -        """
> -        # Make sure parted is available in native sysroot
> -        if not os.path.isfile("%s/usr/sbin/parted" % native_sysroot):
> -            msger.info("Building parted-native...\n")
> -            exec_cmd("bitbake parted-native")
> -
> -        # Make sure mkfs.ext2/3/4 is available in native sysroot
> -        if not os.path.isfile("%s/sbin/mkfs.ext2" % native_sysroot):
> -            msger.info("Building e2fsprogs-native...\n")
> -            exec_cmd("bitbake e2fsprogs-native")
> -
> -        # Make sure syslinux is available in sysroot and in native sysroot
> -        syslinux_dir = get_bitbake_var("STAGING_DATADIR")
> -        if not syslinux_dir:
> -            msger.error("Couldn't find STAGING_DATADIR, exiting.\n")
> -        if not os.path.exists("%s/syslinux" % syslinux_dir):
> -            msger.info("Building syslinux...\n")
> -            exec_cmd("bitbake syslinux")
> -        if not os.path.exists("%s/syslinux" % syslinux_dir):
> -            msger.error("Please build syslinux first\n")
> -
> -        # Make sure syslinux is available in native sysroot
> -        if not os.path.exists("%s/usr/bin/syslinux" % native_sysroot):
> -            msger.info("Building syslinux-native...\n")
> -            exec_cmd("bitbake syslinux-native")
> -
> -        #Make sure mkisofs is available in native sysroot
> -        if not os.path.isfile("%s/usr/bin/mkisofs" % native_sysroot):
> -            msger.info("Building cdrtools-native...\n")
> -            exec_cmd("bitbake cdrtools-native")
> -
> -        # Make sure mkfs.vfat is available in native sysroot
> -        if not os.path.isfile("%s/sbin/mkfs.vfat" % native_sysroot):
> -            msger.info("Building dosfstools-native...\n")
> -            exec_cmd("bitbake dosfstools-native")
> -
> -        # Make sure mtools is available in native sysroot
> -        if not os.path.isfile("%s/usr/bin/mcopy" % native_sysroot):
> -            msger.info("Building mtools-native...\n")
> -            exec_cmd("bitbake mtools-native")
> -
> -    @classmethod
>      def do_configure_partition(cls, part, source_params, creator, cr_workdir,
>                                 oe_builddir, bootimg_dir, kernel_dir,
>                                 native_sysroot):
> diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
> index fe188c9d26..489393a24e 100644
> --- a/scripts/lib/wic/utils/oe/misc.py
> +++ b/scripts/lib/wic/utils/oe/misc.py
> @@ -35,8 +35,11 @@ from wic.utils import runner
>  
>  # executable -> recipe pairs for exec_native_cmd
>  NATIVE_RECIPES = {"bmaptool": "bmap-tools",
> +                  "grub-mkimage": "grub-efi",
> +                  "isohybrid": "syslinux",
>                    "mcopy": "mtools",
>                    "mkdosfs": "dosfstools",
> +                  "mkisofs": "cdrtools",
>                    "mkfs.btrfs": "btrfs-tools",
>                    "mkfs.ext2": "e2fsprogs",
>                    "mkfs.ext3": "e2fsprogs",
> @@ -44,6 +47,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
>                    "mkfs.vfat": "dosfstools",
>                    "mksquashfs": "squashfs-tools",
>                    "mkswap": "util-linux",
> +                  "mmd": "syslinux",
>                    "parted": "parted",
>                    "sfdisk": "util-linux",
>                    "sgdisk": "gptfdisk",
> -- 
> 2.11.0
> 

-- 
--
Regards,
Ed

