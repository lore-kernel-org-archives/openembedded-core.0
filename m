Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 64DA66BE11
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 18:16:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2013 11:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,892,1371106800"; d="scan'208";a="402472358"
Received: from unknown (HELO [10.255.14.117]) ([10.255.14.117])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2013 11:16:12 -0700
Message-ID: <1379009772.1285.30.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 12 Sep 2013 11:16:12 -0700
In-Reply-To: <1379006387-20186-6-git-send-email-jason.wessel@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-6-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 12 Sep 2013 18:16:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
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
>  meta/classes/grub-efi.bbclass     |   41 ++++++++++++++++++++++++-------------
>  meta/conf/machine/qemux86-64.conf |    2 +-
>  meta/conf/machine/qemux86.conf    |    2 ++
>  3 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index c6f5d4e..c07e4a1 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -9,6 +9,7 @@
>  # External variables
>  # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
>  # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
> +# ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the boot menu
>  # ${LABELS} - a list of targets for the automatic config
>  # ${APPEND} - an override list of append strings for each label
>  # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
> @@ -16,6 +17,7 @@
>  
>  do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
>  
> +GRUB_SERIAL ?= "console=ttyS0,115200"
>  GRUBCFG = "${S}/grub.cfg"
>  GRUB_TIMEOUT ?= "10"
>  #FIXME: build this from the machine config
> @@ -55,6 +57,8 @@ python build_grub_cfg() {
>          bb.error("WORKDIR not defined, unable to package")
>          return
>  
> +    gfxserial = d.getVar('GRUB_GFXSERIAL', True) or ""
> +
>      labels = d.getVar('LABELS', True)
>      if not labels:
>          bb.debug(1, "LABELS not defined, nothing to do")
> @@ -88,6 +92,12 @@ python build_grub_cfg() {
>      else:
>          cfgfile.write('timeout=50\n')
>  
> +    if gfxserial == "1":
> +        btypes = [ [ " graphics console", "console=tty0" ],
> +            [ " serial console", d.getVar('GRUB_SERIAL', True) or "" ] ]
> +    else:
> +        btypes = [ [ "", "" ] ]
> +
>      for label in labels.split():
>          localdata = d.createCopy()
>  
> @@ -95,24 +105,27 @@ python build_grub_cfg() {
>          if not overrides:
>              raise bb.build.FuncFailed('OVERRIDES not defined')
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
>      cfgfile.close()
>  }

I'm not very familiar with the cfgfile for menus and such, so I don't
have much to add. The one thing that catches me by surprise is the need
for the serial device. On EFI systems, grub here uses the EFI console
service, so if that uses the serial port you get it for free, no need
for GRUB to try and use it directly. In fact.... does the above not
cause some kind of conflict between the EFI console service and grub
serial?

Both of the following should be in a separate patch. In fact, they
should probably have a qemux86-common.inc which took care of most of
this (as was done recently for genericx86-common.inc).

> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
> index c572225..6f68410 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -21,6 +21,6 @@ XSERVER = "xserver-xorg \
>             xf86-input-evdev \
>             xf86-video-vmware"
>  
> -MACHINE_FEATURES += "x86"
> +MACHINE_FEATURES += "x86 efi"
>  
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
> index 94ee573..57a9a50 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -22,5 +22,7 @@ XSERVER = "xserver-xorg \
>             xf86-video-vmware"
>  
>  MACHINE_FEATURES += "x86"
> +MACHINE_FEATURES += "efi"
> +#MACHINE_FEATURES += "pcbios"
>  
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



