Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RT6wm-00073I-RJ
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 08:08:45 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Nov 2011 23:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="79120468"
Received: from unknown (HELO envy.home) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 22 Nov 2011 23:02:12 -0800
Message-ID: <4ECC9A64.4080009@linux.intel.com>
Date: Tue, 22 Nov 2011 23:01:56 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.3.3
Subject: RFC: grub-efi native tools
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
X-List-Received-Date: Wed, 23 Nov 2011 07:08:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

While working towards supporting efi boot in live images, I have been
refactoring bootimg.bbclass, syslinux.bbclass, and adding recipes and
classes for grub-efi.

I'd like the seasoned OE experts' opinions on a question of
implementation. grub-efi seems to require a final step after the normal
build to assemble the efi image, specifically:

grub-mkimage -p / -d ./grub-core/ -O i386-efi -o ./bootia32.efi \
             boot linux fat serial part_msdos normal

grub-mkimage is a tool built during the grub-efi do_compile step, so it
needs to be native in order to run the above command. So I'm left with a
few options:

1) Use BBCLASSEXTEND="native" and make grub-efi depend on
   grub-efi-native so the native grub-mkimage is available.
   - I'm not sure how to avoid a circular dependency there,
     other than making an explicit grub-efi-native_1.99.bb.
   - No component of the grub-efi build needs to be installed
     on the target rootfs - so perhaps the the target arch version
     isn't needed at all...

2) Only build grub-efi-native.
   - The above grub-mkimage command fails with some incorrect elf format
     error messages on the grub kernel.img file. A similar error was
     reported on the grub mailing list when compiling with cygwin.
     Some work may be required to fix GRUB here.
   - Installing output of -native recipes onto the target seems to be a
     bit at odds with the existing mechanisms (it doesn't find
     bootia32.efi when placed in ${STAGING_LIBDIR}/grub by a -native
     build, for example).

3) Tweak the build so that only the grub-* utilities are built natively.
   - The Linux kernel build does this for some of the internal
     tooling required for the build (Kconfig, etc.).
   - If we did want to install the tools on the target, we wouldn't have
     the target arch binaries available. Perhaps both could be built.

So there are a number of ways to go about this. If someone can leverage
some experience with OE to indicate which of these would be met with the
least resistance, both in terms of implementation as well as upstream
acceptance, I would appreciate it.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


