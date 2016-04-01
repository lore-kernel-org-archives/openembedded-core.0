Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5D36731E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 10:01:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u31A13Jl000117
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 03:01:04 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 1 Apr 2016 03:01:02 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1459502011.git.liezhi.yang@windriver.com>
	<19f9e2e1bf005d885453ec2d5ead37de78c6bd0c.1459502011.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56FE46DD.3060609@windriver.com>
Date: Fri, 1 Apr 2016 18:01:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <19f9e2e1bf005d885453ec2d5ead37de78c6bd0c.1459502011.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 3/3] grub-efi.bbclass: don't use APPEND
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
X-List-Received-Date: Fri, 01 Apr 2016 10:01:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


For patch 3/3, RP said that changing APPEND may break some other BSP
layers, I will update this patch.

// Robert

On 04/01/2016 05:14 PM, Robert Yang wrote:
> APPEND is a keyword of syslinux, grub should not use it, use GRUB_ROOT
> to instead of it.
>
> [YOCTO #9354]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/grub-efi.bbclass | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index 3d8ff11..f80a3cc 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -11,9 +11,9 @@
>   # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
>   # ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the boot menu
>   # ${LABELS} - a list of targets for the automatic config
> -# ${APPEND} - an override list of append strings for each label
>   # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
>   # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
> +# ${GRUB_ROOT} - grub's root device.
>
>   do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
>   do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
> @@ -26,7 +26,7 @@ GRUB_TIMEOUT ?= "10"
>   GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
>
>   EFIDIR = "/EFI/BOOT"
> -APPEND_prepend = " ${ROOT} "
> +GRUB_ROOT ?= "${ROOT}"
>
>   # Need UUID utility code.
>   inherit fs-uuid
> @@ -131,12 +131,12 @@ python build_efi_cfg() {
>                   lb = "install-efi"
>               cfgfile.write('linux /vmlinuz LABEL=%s' % (lb))
>
> -            append = localdata.getVar('APPEND', True)
> +            root = localdata.getVar('GRUB_ROOT', True)
>               initrd = localdata.getVar('INITRD', True)
>
> -            if append:
> -                append = replace_rootfs_uuid(d, append)
> -                cfgfile.write('%s' % (append))
> +            if root:
> +                root = replace_rootfs_uuid(d, root)
> +                cfgfile.write(' %s' % (root))
>               cfgfile.write(' %s' % btype[1])
>               cfgfile.write('\n')
>
>

