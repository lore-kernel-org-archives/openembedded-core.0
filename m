Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RSnFm-0001mA-DO for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 11:07:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAM9di4r017304;
	Tue, 22 Nov 2011 09:39:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16111-06; Tue, 22 Nov 2011 09:39:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAM9dYJH017298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 22 Nov 2011 09:39:36 GMT
Message-ID: <1321954781.18926.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Tue, 22 Nov 2011 09:39:41 +0000
In-Reply-To: <4EC461CF.8080501@linux.intel.com>
References: <4EC461CF.8080501@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, "Wold,
	Saul" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: EFI Support
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
X-List-Received-Date: Tue, 22 Nov 2011 10:07:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-16 at 17:22 -0800, Darren Hart wrote:
> I'm working to provide EFI boot support for the BSPs in the meta-intel
> layers for the Yocto Project. There are several points to consider and
> before I start work on an implementation, I would appreciate a review of
> this proposal. I'll present the various points to consider, and then
> follow with my proposed solution.
> 
> Booting on a pure UEFI system requires an EFI loader. This can currently
> be one of GRUB2, elilo, efilinux, or even a Linux bzImage with the
> experimental EFI_STUB patches applied. Many targets can boot with the
> legacy BIOS services or will need to support both legacy and EFI
> booting, depending on which firmware version is installed on the target.
> This decision is complicated by license issues (GRUB2 is GPLV3),
> functionality issues (efilinux has no UI), and complexity issues (I'd
> rather not introduce yet another bootloader - elilo - into oe-core).
> 
> Supporting EFI boot has two meanings in my estimation. First, we need a
> recipe for an EFI capable bootloader which can be specified with
> EXTRA_IMAGEDEPENDS in the machine config, in the same way uboot is
> specified by beagelbaord.conf. Second, the live (hddimg) images need to
> be constructed to support EFI. We could build EFI for every live image
> and build universal live images with support for both legacy and EFI
> boot, or we could provide a mechanism to indicate if one or the other
> (or both) mechanisms are required for a given BSP.
> 
> As for the selection of an EFI bootloader. For the IA32 BSPs, I intend
> to move to an all Syslinux set of bootloaders eventually. They provide
> all the necessary functionality and are much less complex than GRUB2.
> Unfortunately, Syslinux does not yet support EFI boot. The efilinux
> project does, and I now have working recipes for it, but it does not
> have a UI, and requires either a script, built-in kernel command line,
> or nvram changes in order to boot a kernel with kernel parameters. It
> also has no UI, which would break the existing live image "boot or
> install" boot options. For the time being, I propose building GRUB2 with
> EFI support for BSPs that support it. That limits live images for EFI
> BSPs to GPLV3. When Syslinux has EFI support, I propose switching to
> Syslinux, removing the GPLV3 requirement. This will simplify the images
> as Syslinux can be used for the ISO images, the legacy boot, the EFI
> boot, and the boot after installed to the harddisk. A common menu format
> can be used and provide a much more consistent experience for these BSPs.
> 
> As to the mechanism for building the live images, I propose using a set
> of MACHINE_FEATURES values to indicate the type of boot, for example:
> PCBIOS and EFI. Machines wishing to construct live images for both,
> would specify both. The grub2 recipe would then be modified to build the
> efi option if EFI is set. The bootimg and image-live classes would be
> modified to test for PCBIOS and EFI, and prepare the FAT32 hddimg
> accordingly, with either or both boot mechanisms in place. If an
> EFI-only BSP assumes a custom image needs to be created, they add grub2
> to the EXTRA_IMAGEDEPENDS, specify EFI in MACHINE_FEATURES, and drop
> live from the image types.
> 
> I believe this approach holds true to the intent of the live images and
> enables EFI systems in the most compatible way, while being minimally
> invasive to oe-core.
> 
> Have I overlooked anything? Would I break some use case that I haven't
> thought of? Is there a better mechanism than MACHINE_FEATURES for the
> EFI and PCBIOS flags?

Not one I can think of. I think this all sounds reasonable to me. I
suspect grub2 may need to stick around but certainly we can move to
syslinux being the supported/default solution if we can fit it into the
existing use cases. So the plan sounds good to me, thanks for putting it
together.

Cheers,

Richard



