Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E17060197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 04:25:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9E4PXvu006107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 13 Oct 2019 21:25:34 -0700
Received: from [128.224.158.164] (128.224.158.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 13 Oct 2019 21:25:33 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <dbaryshkov@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20191012142414.26283-1-dbaryshkov@gmail.com>
Message-ID: <dec79a88-8071-8398-aa76-d8cf07011df8@windriver.com>
Date: Mon, 14 Oct 2019 12:25:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191012142414.26283-1-dbaryshkov@gmail.com>
X-Originating-IP: [128.224.158.164]
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: Re: [PATCH] conf/image-uefi: fix building images for multilib case
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
X-List-Received-Date: Mon, 14 Oct 2019 04:25:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thanks Dmitry.

But this patch introduces a minor issue. The lib32-systemd-boot will 
fail to build when enable multilib and EFI_PROVIDER = "grub-efi":

$ bitbake lib32-systemd-boot

ERROR: lib32-systemd-boot-243+AUTOINC+efb536d0cb-r0 do_compile: 
Execution of 
'/buildarea/build/tmp/work/x86-pokymllib32-linux/lib32-systemd-boot/243+AUTOINC+efb536d0cb-r0/temp/run.do_compile.254335' 
failed with exit code 1:
ninja: error: unknown target 'src/boot/efi/systemd-bootx64.efi'
WARNING: 
/buildarea/build/tmp/work/x86-pokymllib32-linux/lib32-systemd-boot/243+AUTOINC+efb536d0cb-r0/temp/run.do_compile.254335:1 
exit 1 from 'ninja src/boot/efi/systemd-bootx64.efi'

ERROR: Logfile of failure stored in: 
/buildarea/build/tmp/work/x86-pokymllib32-linux/lib32-systemd-boot/243+AUTOINC+efb536d0cb-r0/temp/log.do_compile.254335
Log data follows:
| DEBUG: Executing shell function do_compile
| ninja: error: unknown target 'src/boot/efi/systemd-bootx64.efi'
| WARNING: 
/buildarea/build/tmp/work/x86-pokymllib32-linux/lib32-systemd-boot/243+AUTOINC+efb536d0cb-r0/temp/run.do_compile.254335:1 
exit 1 from 'ninja src/boot/efi/systemd-bootx64.efi'
| ERROR: Execution of 
'/buildarea/build/tmp/work/x86-pokymllib32-linux/lib32-systemd-boot/243+AUTOINC+efb536d0cb-r0/temp/run.do_compile.254335' 
failed with exit code 1:
| ninja: error: unknown target 'src/boot/efi/systemd-bootx64.efi'
| WARNING: 
/buildarea/build/tmp/work/x86-pokymllib32-linux/lib32-systemd-boot/243+AUTOINC+efb536d0cb-r0/temp/run.do_compile.254335:1 
exit 1 from 'ninja src/boot/efi/systemd-bootx64.efi'
|
ERROR: Task 
(virtual:multilib:lib32:/buildarea/poky/meta/recipes-core/systemd/systemd-boot_243.bb:do_compile) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1661 tasks of which 1660 didn't need to 
be rerun and 1 failed.



//Yi


On 10/12/19 10:24 PM, dbaryshkov@gmail.com wrote:
> From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
>
> Building live images for lib32-core-minimal-image will fail because
> image target override won't match grub's override. Fix this by
> introducing anonymous python function. A proper fix should be to
> introduce multilib overrides, but it will be more intrusive.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> ---
>   meta/conf/image-uefi.conf | 11 +++++------
>   meta/conf/image-uefi.inc  | 23 +++++++++++++++++++++++
>   2 files changed, 28 insertions(+), 6 deletions(-)
>   create mode 100644 meta/conf/image-uefi.inc
>
> diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
> index aaeff12ccb80..57fd18f02742 100644
> --- a/meta/conf/image-uefi.conf
> +++ b/meta/conf/image-uefi.conf
> @@ -8,9 +8,8 @@ EFI_PREFIX ?= "/boot"
>   # Location inside rootfs.
>   EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
>   
> -# Determine name of bootloader image
> -EFI_BOOT_IMAGE ?= "bootINVALID.efi"
> -EFI_BOOT_IMAGE_x86-64 = "bootx64.efi"
> -EFI_BOOT_IMAGE_x86 = "bootia32.efi"
> -EFI_BOOT_IMAGE_aarch64 = "bootaa64.efi"
> -EFI_BOOT_IMAGE_arm = "bootarm.efi"
> +# Parsing python anonymous functions in .conf files does not work, so move it
> +# to .inc file
> +require conf/image-uefi.inc
> +
> +EFI_BOOT_IMAGE ?= "boot${EFI_ARCH}.efi"
> diff --git a/meta/conf/image-uefi.inc b/meta/conf/image-uefi.inc
> new file mode 100644
> index 000000000000..94c5813494cb
> --- /dev/null
> +++ b/meta/conf/image-uefi.inc
> @@ -0,0 +1,23 @@
> +# Determine name of bootloader image
> +python () {
> +    import re
> +    if d.getVar("MLPREFIX") != "":
> +        target = d.getVar("TARGET_ARCH_MULTILIB_ORIGINAL")
> +    else:
> +        target = d.getVar("TARGET_ARCH")
> +
> +    if target == "x86_64":
> +        arch = "x64"
> +    elif re.match('i.86', target):
> +        arch = "ia32"
> +    elif re.match('aarch64', target):
> +        arch = "aa64"
> +    elif re.match('arm', target):
> +        arch = "arm"
> +    else:
> +        raise bb.parse.SkipRecipe("image-uefi is incompatible with target %s" % target)
> +
> +    d.setVar("EFI_ARCH", arch)
> +}
> +
> +

