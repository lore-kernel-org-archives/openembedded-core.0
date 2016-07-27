Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 99EE3606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:55:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2016 06:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,430,1464678000"; d="scan'208";a="1014853844"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2016 06:55:15 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 985FF6A4080;
	Wed, 27 Jul 2016 06:55:01 -0700 (PDT)
Date: Wed, 27 Jul 2016 16:18:44 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20160727131844.GA31757@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1469620052.23580.115.camel@linuxfoundation.org>
	<20160727122801.GA7061@linux.intel.com>
	<5798B1E4.2090508@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5798B1E4.2090508@windriver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: 2.7% build time regression caused by enabling debug/printk.scc KERNEL_FEATURE]
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
X-List-Received-Date: Wed, 27 Jul 2016 13:55:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 27, 2016 at 09:06:44AM -0400, Bruce Ashfield wrote:
> On 2016-07-27 08:28 AM, Ed Bartosh wrote:
> >Hi Bruce,
> >
> >Thank you for your suggestion to experiment with configuration options!
> >
> >>On 2016-07-26 10:32 AM, Ed Bartosh wrote:
> >>>Hi all,
> >>>
> >>>We've noticed quite big increase of core-image-minimal build time caused by commit
> >>>d55b7650d305ffad953dd36595ee6b9aa8df5a72 linux-yocto: Enablei debug/printk.scc KERNEL_FEATURE on qemuall machines.
> >>>
> >>
> >>That commit only enables the following options:
> >>
> >>CONFIG_PRINTK=y
> >>CONFIG_PRINTK_TIME=y
> >>
> >>CONFIG_EARLY_PRINTK=y
> >>
> >>CONFIG_EARLY_PRINTK_DBGP=y
> >>CONFIG_EARLY_PRINTK_EFI=y
> >>CONFIG_TTY_PRINTK=y
> >>
> >>And yes, that will add some size to the kernel, but I'm not seeing
> >>similar size increases here.
> >>
> >>If you take a look through the kernel source and build, there are
> >>relatively few additions to the actual kernel build that change
> >>based on those options, and most of them are runtime changes versus
> >>build-time changes.
> >>
> >
> >The actuall difference in configuration is bigger as far as I can see:
> >$ diff -u ../build-kernel/tmp/work/qemux86_64-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/config-4.4.14-yocto-standard
> >tmp/work/qemux86_64-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/config-4.4.14-yocto-standard | grep '^+C'
> >+CONFIG_CONSOLE_POLL=y
> >+CONFIG_PRINTK_TIME=y
> >+CONFIG_DEBUG_INFO=y
> >+CONFIG_DEBUG_KERNEL=y
> >+CONFIG_SCHED_DEBUG=y
> >+CONFIG_DEBUG_PREEMPT=y
> >+CONFIG_KGDB=y
> >+CONFIG_KGDB_SERIAL_CONSOLE=y
> >+CONFIG_KGDB_LOW_LEVEL_TRAP=y
> >+CONFIG_KGDB_KDB=y
> >+CONFIG_KDB_DEFAULT_ENABLE=0x1
> >+CONFIG_KDB_KEYBOARD=y
> >+CONFIG_KDB_CONTINUE_CATASTROPHIC=0
> >+CONFIG_EARLY_PRINTK_DBGP=y
> >+CONFIG_EARLY_PRINTK_EFI=y
> >+CONFIG_DEBUG_RODATA=y
> >+CONFIG_DEBUG_RODATA_TEST=y
> >+CONFIG_X86_DEBUG_FPU=y
> >
> >I guess the reason of this is that printk.scc includes debug-kernel.scc,
> >which brings more config options:
> >CONFIG_DEBUG_KERNEL=y
> >CONFIG_DEBUG_INFO=y
> >CONFIG_DEBUG_PREEMPT=y
> >
> >That probably explains the difference in kernel size and compile time.
> >
> 
> Yup.
> 
> >After removing 'include debug-kernel.scc' the difference in
> >configuration became more reasonable:
> >+CONFIG_PRINTK_TIME=y
> >+CONFIG_EARLY_PRINTK_DBGP=y
> >+CONFIG_EARLY_PRINTK_EFI=y
> >
> >And the size of kernel and modules became almost the same as before
> >enabling printk feature.
> >
> >Considering that the rest of the options from printk.scc don't appear in
> >the result configuration even if debug-kernel.scc is included I hope
> >it should be ok to remove 'include debug-kernel.scc' from printk.scc.
> >
> >Does it make sense for you?
> 
> It does to me. Since we actually have a "developer" kernel type that
> is intended for this purpose. Anything that we add to the standard
> kernel type should be more surgical.
> 

Looking at guilty commit
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?h=yocto-4.4&id=fd8d90ca69f53d425fdb34fc9a9debac1d0c5f52
I'd say that the rest of scc files should be also tested the same way.
We may not need to enable all 3 CONFIG_DEBUG options for each of them.


--
Regards,
Ed

