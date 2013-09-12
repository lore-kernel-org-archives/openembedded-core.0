Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB946BE11
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 18:01:33 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2013 11:01:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,892,1371106800"; d="scan'208";a="294143041"
Received: from unknown (HELO [10.255.14.99]) ([10.255.14.99])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2013 11:01:29 -0700
Message-ID: <52320176.2070802@linux.intel.com>
Date: Thu, 12 Sep 2013 11:01:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Jason Wessel <jason.wessel@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-6-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1379006387-20186-6-git-send-email-jason.wessel@windriver.com>
Cc: dvhart@linux.intel.com, Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] grub-efi.bbclass: Add serial and graphics menu options
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
X-List-Received-Date: Thu, 12 Sep 2013 18:01:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2013 10:19 AM, Jason Wessel wrote:
> The syslinux.bbclass already has support for automatically generated
> serial and graphics menu choices.  This patch adds the same concept to
> the grub-efi menu.  That makes it possible to generate a single image
> which can boot on a PCBIOS or EFI firmware with consistent looking
> boot options.
>
> [YOCTO #4100]
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   meta/classes/grub-efi.bbclass     |   41 ++++++++++++++++++++++++-------------
>   meta/conf/machine/qemux86-64.conf |    2 +-
>   meta/conf/machine/qemux86.conf    |    2 ++
>   3 files changed, 30 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index c6f5d4e..c07e4a1 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -9,6 +9,7 @@
>   # External variables
>   # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
>   # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
> +# ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the boot menu
>   # ${LABELS} - a list of targets for the automatic config
>   # ${APPEND} - an override list of append strings for each label
>   # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
> @@ -16,6 +17,7 @@
>
>   do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
>
> +GRUB_SERIAL ?= "console=ttyS0,115200"
>   GRUBCFG = "${S}/grub.cfg"
>   GRUB_TIMEOUT ?= "10"
>   #FIXME: build this from the machine config
> @@ -55,6 +57,8 @@ python build_grub_cfg() {
>           bb.error("WORKDIR not defined, unable to package")
>           return
>
> +    gfxserial = d.getVar('GRUB_GFXSERIAL', True) or ""
> +
>       labels = d.getVar('LABELS', True)
>       if not labels:
>           bb.debug(1, "LABELS not defined, nothing to do")
> @@ -88,6 +92,12 @@ python build_grub_cfg() {
>       else:
>           cfgfile.write('timeout=50\n')
>
> +    if gfxserial == "1":
> +        btypes = [ [ " graphics console", "console=tty0" ],
> +            [ " serial console", d.getVar('GRUB_SERIAL', True) or "" ] ]
> +    else:
> +        btypes = [ [ "", "" ] ]
> +
>       for label in labels.split():
>           localdata = d.createCopy()
>
> @@ -95,24 +105,27 @@ python build_grub_cfg() {
>           if not overrides:
>               raise bb.build.FuncFailed('OVERRIDES not defined')
>
> -        localdata.setVar('OVERRIDES', label + ':' + overrides)
> -        bb.data.update_data(localdata)
> +        for btype in btypes:
> +            localdata.setVar('OVERRIDES', label + ':' + overrides)
> +            bb.data.update_data(localdata)
>
> -        cfgfile.write('\nmenuentry \'%s\'{\n' % (label))
> -        if label == "install":
> -            label = "install-efi"
> -        cfgfile.write('linux /vmlinuz LABEL=%s' % (label))
> +            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
> +            lb = label
> +            if label == "install":
> +                lb = "install-efi"
> +            cfgfile.write('linux /vmlinuz LABEL=%s' % (lb))
>
> -        append = localdata.getVar('APPEND', True)
> -        initrd = localdata.getVar('INITRD', True)
> +            append = localdata.getVar('APPEND', True)
> +            initrd = localdata.getVar('INITRD', True)
>
> -        if append:
> -            cfgfile.write('%s' % (append))
> -        cfgfile.write('\n')
> +            if append:
> +                cfgfile.write('%s' % (append))
> +            cfgfile.write(' %s' % btype[1])
> +            cfgfile.write('\n')
>
> -        if initrd:
> -            cfgfile.write('initrd /initrd')
> -        cfgfile.write('\n}\n')
> +            if initrd:
> +                cfgfile.write('initrd /initrd')
> +            cfgfile.write('\n}\n')
>
>       cfgfile.close()
>   }
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
> index c572225..6f68410 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -21,6 +21,6 @@ XSERVER = "xserver-xorg \
>              xf86-input-evdev \
>              xf86-video-vmware"
>
> -MACHINE_FEATURES += "x86"
> +MACHINE_FEATURES += "x86 efi"
>
>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
> index 94ee573..57a9a50 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -22,5 +22,7 @@ XSERVER = "xserver-xorg \
>              xf86-video-vmware"
>
>   MACHINE_FEATURES += "x86"
> +MACHINE_FEATURES += "efi"
> +#MACHINE_FEATURES += "pcbios"
>
Did you intend to keep the commented out like vs what you did above in 
x86-64?

>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>

Will this affect the genericx86* also?

Sau!


