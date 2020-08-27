Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.27259.1598557158120167710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 12:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.100, mailfrom: randy.e.witt@linux.intel.com)
IronPort-SDR: lzvDYZFQdV8vTht7ZtelPJUmMMkcyY9VgBxeokX9vbYncEGFwv4GbPcp7EIVMoBHnuBWdve0IQ
 vtVDRO9w/+tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="220805390"
X-IronPort-AV: E=Sophos;i="5.76,360,1592895600"; 
   d="scan'208";a="220805390"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2020 12:39:11 -0700
IronPort-SDR: 5Vrykh5AEmGFPWDsS4nrHoPALnsuxt3SPfFjdH1OioWZYN7nlWUGAms+EzgFjv4Gpb18ceuTni
 f5DyrvNE3c3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,360,1592895600"; 
   d="scan'208";a="329699807"
Received: from rewitt-desk0.jf.intel.com (HELO [10.7.159.145]) ([10.7.159.145])
  by orsmga008.jf.intel.com with ESMTP; 27 Aug 2020 12:39:11 -0700
Subject: Re: [OE-core] [PATCH v2] wic/bootimg-efi: IMAGE_EFI_BOOT_FILES added to separate bootimg-efi and bootimg-partition
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>,
 openembedded-core@lists.openembedded.org
References: <1598429593-16162-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
From: "Randy Witt" <randy.e.witt@linux.intel.com>
Message-ID: <eb3245c7-b8a8-f060-cf10-ee13496e34e7@linux.intel.com>
Date: Thu, 27 Aug 2020 12:39:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1598429593-16162-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/26/20 1:13 AM, Jamaluddin, Khairul Rohaizzat wrote:
> From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
> 
> Due to recent changes in bootimg-efi to include IMAGE_BOOT_FILES,
> when both bootimg-partition and bootimg-efi occur in a single .wks
> and IMAGE_BOOT_FILES are defined, files listed in IMAGE_BOOT_FILES
> will be duplicated in both partition.
> Since IMAGE_BOOT_FILES are crucial for bootimg-partition, but
> optional for bootimg-efi, hence allowing bootimg-efi to have the option
> to ignore it.
> 
> Added a new variable, IMAGE_EFI_BOOT_FILES, to handle this
> issue. Its basic usage is the same as IMAGE_BOOT_FILES.
> Usage example:
>          IMAGE_EFI_BOOT_FILES = "u-boot.img uImage;kernel"
>          IMAGE_EFI_BOOT_FILES = "u-boot.${UBOOT_SUFFIX} ${KERNEL_IMAGETYPE}"
> 
> This commit is also squashed with the updated testcase to cover for this change.
> 
> [YOCTO #14011]
> 
> Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
> ---
>   meta/classes/image_types_wic.bbclass          |  2 +-
>   meta/lib/oeqa/selftest/cases/wic.py           | 10 +++++++++-
>   scripts/lib/wic/plugins/source/bootimg-efi.py |  8 ++++----
>   3 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index 7b1db50..def44bb 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -1,7 +1,7 @@
>   # The WICVARS variable is used to define list of bitbake variables used in wic code
>   # variables from this list is written to <image>.env file
>   WICVARS ?= "\
> -           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
> +           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_EFI_BOOT_FILES IMAGE_BOOT_FILES \
>              IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
>              ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
>              KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND"
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index e6b23c6..1149ae0 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -235,6 +235,14 @@ class Wic(WicTestCase):
>           runCmd(cmd)
>           self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
>   
> +    def test_efi_bootpart(self):
> +        """Test creation of efi-bootpart image"""
> +        cmd = "wic create efi-bootpart -e core-image-minimal -o %s" % self.resultdir
> +        kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
> +        self.write_config('IMAGE_EFI_BOOT_FILES = "%s"\n' % kimgtype)
> +        runCmd(cmd)
> +        self.assertEqual(1, len(glob(self.resultdir + "efi-bootpart-*direct")))
> +

The test fails because "efi-bootpart" is not a wks file like 
"sdimage-bootpart"(which this appears to be copied from). There is an existing 
wks file ./scripts/lib/wic/canned-wks/mkefidisk.wks which uses the "bootimg-efi" 
plugin and there is already a test, test_mkefidisk(), for that wks file.

This new test, test_efi_bootpart(), doesn't actually verify the files in 
IMAGE_EFI_BOOT_FILES exist in the partition created, it only checks that the wic 
command ran successfully. So there isn't really any utility in this test over 
what already exists in test_mkefidisk().

Also, the file being added in IMAGE_EFI_BOOT_FILES in this test ends up being 
"bzImage", which is already added by default when using bootimage-efi.py.

For this test to actually test the IMAGE_EFI_BOOT_FILES functionality, it would 
need to do something similar to test_include_path() which actually verifies that 
files exist in the partition created. In this case it would need to verify that 
the files in IMAGE_EFI_BOOT_FILES exist in the partition. If we assume "wic ls" 
works, it could probably be used instead of debugfs.

>       def test_sdimage_bootpart(self):
>           """Test creation of sdimage-bootpart image"""
>           cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
> @@ -689,7 +697,7 @@ class Wic2(WicTestCase):
>           wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
>                                         'INITRD', 'INITRD_LIVE', 'ISODIR','INITRAMFS_IMAGE',
>                                         'INITRAMFS_IMAGE_BUNDLE', 'INITRAMFS_LINK_NAME',
> -                                      'APPEND'))
> +                                      'APPEND', 'IMAGE_EFI_BOOT_FILES'))
>           with open(path) as envfile:
>               content = dict(line.split("=", 1) for line in envfile)
>               # test if variables used by wic present in the .env file
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 14c1723..cdc7254 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -212,8 +212,8 @@ class BootimgEFIPlugin(SourcePlugin):
>           except KeyError:
>               raise WicError("bootimg-efi requires a loader, none specified")
>   
> -        if get_bitbake_var("IMAGE_BOOT_FILES") is None:
> -            logger.debug('No boot files defined in IMAGE_BOOT_FILES')
> +        if get_bitbake_var("IMAGE_EFI_BOOT_FILES") is None:
> +            logger.debug('No boot files defined in IMAGE_EFI_BOOT_FILES')
>           else:
>               boot_files = None
>               for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), (None, None)):
> @@ -222,7 +222,7 @@ class BootimgEFIPlugin(SourcePlugin):
>                   else:
>                       var = ""
>   
> -                boot_files = get_bitbake_var("IMAGE_BOOT_FILES" + var)
> +                boot_files = get_bitbake_var("IMAGE_EFI_BOOT_FILES" + var)
>                   if boot_files:
>                       break
>   
> @@ -292,7 +292,7 @@ class BootimgEFIPlugin(SourcePlugin):
>               (staging_kernel_dir, kernel, hdddir, kernel)
>           exec_cmd(install_cmd)
>   
> -        if get_bitbake_var("IMAGE_BOOT_FILES"):
> +        if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
>               for src_path, dst_path in cls.install_task:
>                   install_cmd = "install -m 0644 -D %s %s" \
>                                 % (os.path.join(kernel_dir, src_path),
> 
> 
> 
> 

