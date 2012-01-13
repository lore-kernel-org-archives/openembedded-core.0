Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RlZrw-00053a-8J
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 06:40:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2012 21:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97969887"
Received: from unknown (HELO envy.home) ([10.255.13.219])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2012 21:32:31 -0800
Message-ID: <4F0FC1DB.1040802@linux.intel.com>
Date: Thu, 12 Jan 2012 21:32:11 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.3.4
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Variable expansion order: bootimg fails with MACHINE_FEATURES += "efi" in local.conf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jan 2012 05:40:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I find that if I want to build a live efi image for testing on qemu, and I add the following to my local.conf:

MACHINE_FEATURES_append_qemux86 = " efi"
KERNEL_FEATURES_append_qemux86 = " cfg/efi-ext.scc"
IMAGE_TYPES += "live"

And then try to build core-image-minimal, I'll get an error like the following during do_bootimg:

| WARNING: Function build_grub_cfg doesn't exist
| ERROR: Function 'build_hddimg' failed (see /build/poky/qemux86/tmp/work/qemux86-poky-linux/core-image-minimal-1.0-r0/temp/log.do_bootimg.16296 for further information)

build_grub_cfg is defined in grub-efi.bbclass, which is inherited by bootimg.bbclass as follows:

EFI = ${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}
EFI_CLASS = ${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}

inherit ${EFI_CLASS}

Testing with -e reveals:

$ bitbake -e core-image-minimal | grep EFI_CLASS=
# EFI_CLASS=${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}
EFI_CLASS="grub-efi"

However, if I add garbage to the grub-efi.bbclass file, the parser doesn't complain. Adding garbage to dummy does cause it to fail, but without pcbios in MACHINE_FEATURES, the PCBIOS_CLASS should cause dummy to be inherited, so this isn't definitive evidence that dummy is being inherited _instead_ of grub-efi.

So, is there a problem with the inline python call to base_contains to get the grub-efi variable if MACHINE_FEATURES is modified in local.conf? Can anyone suggest some rule that I might be missing that would cause this behavior?

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


