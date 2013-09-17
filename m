Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7E96A6105E
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 22:19:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Sep 2013 15:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,926,1371106800"; d="scan'208";a="404859611"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.59]) ([10.7.201.59])
	by orsmga002.jf.intel.com with ESMTP; 17 Sep 2013 15:19:19 -0700
Message-ID: <1379456357.4438.61.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Tue, 17 Sep 2013 15:19:17 -0700
In-Reply-To: <1379424738-16798-7-git-send-email-jason.wessel@windriver.com>
References: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
	<1379424738-16798-7-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>,
	Openembedded-core@lists.openembedded.org
Subject: Re: [v3 PATCH 6/9] grub-efi.bbclass: Add serial and graphics menu options
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
X-List-Received-Date: Tue, 17 Sep 2013 22:19:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-17 at 08:32 -0500, Jason Wessel wrote:
> The syslinux.bbclass already has support for automatically generated
> serial and graphics menu choices.  This patch adds the same concept to
> the grub-efi menu.  That makes it possible to generate a single image
> which can boot on a PCBIOS or EFI firmware with consistent looking
> boot options.
> 
> [YOCTO #4100]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>

I think I finally get GRUB_SERIAL. GRUB_SERIAL is intended to be
bootloader menu specific secondary console parameter passed to the Linux
kernel if it's set. The BSP console= options are still used from the
APPEND variable.

GRUB_SERIAL needs to be documented in the glossary, Scott R. on Cc.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>



> ---
>  meta/classes/grub-efi.bbclass |   41 +++++++++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index c21babb..ffbcf4c 100644
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
> @@ -63,6 +65,8 @@ python build_grub_cfg() {
>          bb.error("WORKDIR not defined, unable to package")
>          return
>  
> +    gfxserial = d.getVar('GRUB_GFXSERIAL', True) or ""
> +
>      labels = d.getVar('LABELS', True)
>      if not labels:
>          bb.debug(1, "LABELS not defined, nothing to do")
> @@ -96,6 +100,12 @@ python build_grub_cfg() {
>      else:
>          cfgfile.write('timeout=50\n')
>  
> +    if gfxserial == "1":
> +        btypes = [ [ " graphics console", "" ],
> +            [ " serial console", d.getVar('GRUB_SERIAL', True) or "" ] ]
> +    else:
> +        btypes = [ [ "", "" ] ]
> +
>      for label in labels.split():
>          localdata = d.createCopy()
>  
> @@ -103,24 +113,27 @@ python build_grub_cfg() {
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

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



