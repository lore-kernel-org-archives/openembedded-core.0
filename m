Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RT7bJ-0000Vu-K3
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 08:50:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 23:44:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,557,1315206000"; d="scan'208";a="78277801"
Received: from unknown (HELO envy.home) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 22 Nov 2011 23:44:04 -0800
Message-ID: <4ECCA446.7080509@linux.intel.com>
Date: Tue, 22 Nov 2011 23:44:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ECC9A64.4080009@linux.intel.com>
In-Reply-To: <4ECC9A64.4080009@linux.intel.com>
X-Enigmail-Version: 1.3.3
Subject: Re: RFC: grub-efi native tools
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
X-List-Received-Date: Wed, 23 Nov 2011 07:50:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 11/22/2011 11:01 PM, Darren Hart wrote:

> 2) Only build grub-efi-native.
>    - The above grub-mkimage command fails with some incorrect elf format
>      error messages on the grub kernel.img file. A similar error was
>      reported on the grub mailing list when compiling with cygwin.
>      Some work may be required to fix GRUB here.

This turned out to be the result of TARGET_ARCH changing from the real
target arch to the BUILD_ARCH via the native.bbclass. I can force a
correct build by hard coding my target. So GRUB is off the hook.

If I cannot access the real TARGET_ARCH when building natively, then
perhaps I should not be trying to assemble a target image during this
step. I could install the native binaries and all the supporting files
in the native sysroot and assemble the target bootia32.efi binary either
as part of the bootimg functions (via a grub-efi.bbclass which depends
on the grub-efi-native do_sysroot)...

This seems pretty round about, and I would prefer for a grub-efi recipe
to deploy (to tmp/deploy/images) a bootia32.efi file. This means that
the grub utilities need to be built native, but grub needs to be
configured with --target=i586 (even when my BUILD_ARCH is x86_64). This
seems to not fit well with how the tooling is setup.

Is there perhaps a better approach?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


