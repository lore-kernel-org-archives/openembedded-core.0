Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RQqmY-0006CI-KU
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 02:28:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Nov 2011 17:22:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="76474044"
Received: from unknown (HELO envy.home) ([10.255.12.86])
	by orsmga002.jf.intel.com with ESMTP; 16 Nov 2011 17:22:24 -0800
Message-ID: <4EC461CF.8080501@linux.intel.com>
Date: Wed, 16 Nov 2011 17:22:23 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Zanussi, Tom" <tom.zanussi@intel.com>,
	"Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, 
	Mark Hatle <mark.hatle@windriver.com>, "Wold, Saul" <saul.wold@intel.com>
X-Enigmail-Version: 1.3.3
Subject: RFC: EFI Support
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
X-List-Received-Date: Thu, 17 Nov 2011 01:28:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm working to provide EFI boot support for the BSPs in the meta-intel
layers for the Yocto Project. There are several points to consider and
before I start work on an implementation, I would appreciate a review of
this proposal. I'll present the various points to consider, and then
follow with my proposed solution.

Booting on a pure UEFI system requires an EFI loader. This can currently
be one of GRUB2, elilo, efilinux, or even a Linux bzImage with the
experimental EFI_STUB patches applied. Many targets can boot with the
legacy BIOS services or will need to support both legacy and EFI
booting, depending on which firmware version is installed on the target.
This decision is complicated by license issues (GRUB2 is GPLV3),
functionality issues (efilinux has no UI), and complexity issues (I'd
rather not introduce yet another bootloader - elilo - into oe-core).

Supporting EFI boot has two meanings in my estimation. First, we need a
recipe for an EFI capable bootloader which can be specified with
EXTRA_IMAGEDEPENDS in the machine config, in the same way uboot is
specified by beagelbaord.conf. Second, the live (hddimg) images need to
be constructed to support EFI. We could build EFI for every live image
and build universal live images with support for both legacy and EFI
boot, or we could provide a mechanism to indicate if one or the other
(or both) mechanisms are required for a given BSP.

As for the selection of an EFI bootloader. For the IA32 BSPs, I intend
to move to an all Syslinux set of bootloaders eventually. They provide
all the necessary functionality and are much less complex than GRUB2.
Unfortunately, Syslinux does not yet support EFI boot. The efilinux
project does, and I now have working recipes for it, but it does not
have a UI, and requires either a script, built-in kernel command line,
or nvram changes in order to boot a kernel with kernel parameters. It
also has no UI, which would break the existing live image "boot or
install" boot options. For the time being, I propose building GRUB2 with
EFI support for BSPs that support it. That limits live images for EFI
BSPs to GPLV3. When Syslinux has EFI support, I propose switching to
Syslinux, removing the GPLV3 requirement. This will simplify the images
as Syslinux can be used for the ISO images, the legacy boot, the EFI
boot, and the boot after installed to the harddisk. A common menu format
can be used and provide a much more consistent experience for these BSPs.

As to the mechanism for building the live images, I propose using a set
of MACHINE_FEATURES values to indicate the type of boot, for example:
PCBIOS and EFI. Machines wishing to construct live images for both,
would specify both. The grub2 recipe would then be modified to build the
efi option if EFI is set. The bootimg and image-live classes would be
modified to test for PCBIOS and EFI, and prepare the FAT32 hddimg
accordingly, with either or both boot mechanisms in place. If an
EFI-only BSP assumes a custom image needs to be created, they add grub2
to the EXTRA_IMAGEDEPENDS, specify EFI in MACHINE_FEATURES, and drop
live from the image types.

I believe this approach holds true to the intent of the live images and
enables EFI systems in the most compatible way, while being minimally
invasive to oe-core.

Have I overlooked anything? Would I break some use case that I haven't
thought of? Is there a better mechanism than MACHINE_FEATURES for the
EFI and PCBIOS flags?

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


