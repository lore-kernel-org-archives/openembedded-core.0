Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D628E6105E
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 22:28:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Sep 2013 15:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,926,1371106800"; d="scan'208";a="379730067"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.59]) ([10.7.201.59])
	by orsmga001.jf.intel.com with ESMTP; 17 Sep 2013 15:28:30 -0700
Message-ID: <1379456908.4438.66.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Tue, 17 Sep 2013 15:28:28 -0700
In-Reply-To: <1379424738-16798-8-git-send-email-jason.wessel@windriver.com>
References: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
	<1379424738-16798-8-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>,
	Openembedded-core@lists.openembedded.org
Subject: Re: [v3 PATCH 7/9] syslinux.bbclass: Fix hard coding of console=tty*
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
X-List-Received-Date: Tue, 17 Sep 2013 22:28:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-17 at 08:32 -0500, Jason Wessel wrote:
> The SYSLINUX_SERIAL variable was hard coded and occasionally needs to
> be different for the kernel argument vs the syslinux argument.
> 
> In the auto-generated boot mode console=tty0 was hard coded, and this
> is not needed at all, and causes problems in some cases if a end user
> wanted to change the console=... via the kernel boot argument APPEND
> mechanism.  The default can be forced with SYSLINUX_DEFAULT_CONSOLE
> for systems that need a special specification to enable the frame
> buffer instead of a serial port.
> 
> [YOCTO #3944]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>

The two new variables need to be documented in the glossary, Scott R on
Cc.

One question below, not blocking this though.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/classes/syslinux.bbclass |   14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
> index 223e4dc..91b9731 100644
> --- a/meta/classes/syslinux.bbclass
> +++ b/meta/classes/syslinux.bbclass
> @@ -12,7 +12,9 @@
>  # ${APPEND} - an override list of append strings for each label
>  # ${SYSLINUX_OPTS} - additional options to add to the syslinux file ';' delimited
>  # ${SYSLINUX_SPLASH} - A background for the vga boot menu if using the boot menu
> +# ${SYSLINUX_DEFAULT_CONSOLE} - set to "console=ttyX" to change kernel boot default console
>  # ${SYSLINUX_SERIAL} - Set an alternate serial port or turn off serial with empty string
> +# ${SYSLINUX_SERIAL_TTY} - Set alternate console=tty... kernel boot argument
>  
>  do_bootimg[depends] += "syslinux:do_populate_sysroot \
>                          syslinux-native:do_populate_sysroot"
> @@ -21,7 +23,11 @@ SYSLINUXCFG  = "${S}/syslinux.cfg"
>  
>  ISOLINUXDIR = "/isolinux"
>  SYSLINUXDIR = "/"
> +# The kernel has an internal default console, which you can override with
> +# a console=...some_tty...
> +SYSLINUX_DEFAULT_CONSOLE ?= ""
>  SYSLINUX_SERIAL ?= "0 115200"
> +SYSLINUX_SERIAL_TTY ?= "ttyS0,115200"
>  ISO_BOOTIMG = "isolinux/isolinux.bin"
>  ISO_BOOTCAT = "isolinux/boot.cat"
>  MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
> @@ -102,6 +108,8 @@ python build_syslinux_cfg () {
>              cfgfile.write('%s\n' % opt)
>  
>      cfgfile.write('ALLOWOPTIONS 1\n');
> +    syslinux_default_console = d.getVar('SYSLINUX_DEFAULT_CONSOLE', True)
> +    syslinux_serial_tty = d.getVar('SYSLINUX_SERIAL_TTY', True)
>      syslinux_serial = d.getVar('SYSLINUX_SERIAL', True)
>      if syslinux_serial:
>          cfgfile.write('SERIAL %s\n' % syslinux_serial)
> @@ -144,10 +152,10 @@ python build_syslinux_cfg () {
>          localdata.setVar('OVERRIDES', label + ':' + overrides)
>          bb.data.update_data(localdata)
>      
> -        btypes = [ [ "", "console=tty0" ] ]
> +        btypes = [ [ "", syslinux_default_console ] ]
>          if menu and syslinux_serial:
> -            btypes = [ [ "Graphics console ", " console=tty0" ],
> -                [ "Serial console ",  " console=ttyS0,115200" ] ]
> +            btypes = [ [ "Graphics console ", syslinux_default_console  ],
> +                [ "Serial console ", syslinux_serial_tty ] ]
>  
>          for btype in btypes:
>              cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], label))

Is no space between the to string "%s%s" correct?


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



