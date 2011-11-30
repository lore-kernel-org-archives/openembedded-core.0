Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVsWb-0000e8-C0 for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:21:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUMEAsX006115;
	Wed, 30 Nov 2011 22:14:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05846-04; Wed, 30 Nov 2011 22:14:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUME2rr006109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Nov 2011 22:14:03 GMT
Message-ID: <1322691251.17484.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <darren@dvhart.com>
Date: Wed, 30 Nov 2011 22:14:11 +0000
In-Reply-To: <cover.1322674459.git.darren@dvhart.com>
References: <cover.1322674459.git.darren@dvhart.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org,
	Chris Larson <clarson@kergoth.com>, Josef Ahmad <josef.ahmad@intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/5] EFI live image support
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
X-List-Received-Date: Wed, 30 Nov 2011 22:21:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 09:47 -0800, Darren Hart wrote:
> This series provides optional support for EFI boot for live images, both hddimg
> and ISO, on ia32 platforms. It creates a new grub-efi-native recipe to create
> the boot image. bootimg.bbclass has been refactored and syslinux support has
> been made optional. The new live images can be built as PCBIOS-legacy (the
> original type), EFI, or both. The MACHINE_FEATURES values "pcbios" and "efi"
> dictate this behavior, if neither are specified, it defaults to PCBIOS-legacy
> only to maintain current behavior.
> 
> It is careful not to add unecessary dependencies to the build by dynamically
> including only the necessary bootloader classes (syslinux and/or grub-efi).
> 
> EFI hddimg's do not install into /EFI/BOOT as is proper due to a bug in the
> dosfstools: http://bugzilla.yoctoproject.org/show_bug.cgi?id=1783. For now, the
> files are installed in the root directory and users will need to update their
> firmware or use a startup.nsh script for pure EFI booting, or move them to
> /EFI/BOOT manually.
> 
> Testing performed includes verification of the images built for the n450 BSP
> with all combinations of the MACHINE_FEATURES. The syslinux and grub-efi boot
> methods were validated on the n450 hardware as well. EFI-only ISO images are
> untested, help here would be appreciated.
> 
> While the "install" target is preserved for the EFI boot, it will perform the
> same install as it does currently - namely a GRUB legacy boot mechanism. Support
> for EFI boot post install will follow in another patch series.
> 
> Thanks to Koen Kooi, Chris Larson, Richard Purdie, Josef Ahmad, Saul Wold, and
> Joshua Lock for their contributions of expertise, code, and testing.
> 
> 
> The following changes since commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:
> 
>   getVar/setVar cleanups (2011-11-26 22:42:00 +0000)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/user-contrib/dvhart/oe-core efi/v1
>   http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=efi/v1
> 
> Darren Hart (5):
>   grub-efi-native: New recipe to build GRUB EFI images
>   bootimg: Refactor build_hddimg and build_iso routines
>   bootimg: Pull syslinux specific bits into syslinux.bbclass
>   bootimg: Add grub-efi support
>   bootimg: Allow for EFI-only boot images

Thanks for this, I know its taken a bit of work!

I'm a little frustrated we have to jump through the dummy class hoop but
that isn't your fault and we need to improve bitbake to better deal with
it. Some of the syntax in places isn't ideal either but I can't come up
with anything much better.

I'm going to merge it on the grounds this provides a good starting point
and if we find improvements we can make them on top of this.

Cheers

Richard



