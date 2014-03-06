Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 19B196E990
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 22:31:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 06 Mar 2014 14:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,603,1389772800"; d="scan'208";a="487525380"
Received: from clee270-mobl4.amr.corp.intel.com (HELO [10.254.88.187])
	([10.254.88.187])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 14:31:33 -0800
User-Agent: Microsoft-MacOutlook/14.3.9.131030
Date: Thu, 06 Mar 2014 14:31:46 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <CF3E36E6.74FE5%dvhart@linux.intel.com>
Thread-Topic: [PATCH 2/3] bootimg/grub-efi.bbclass: allow using a different
	class for EFI images
References: <cover.1394128875.git.stefanx.stanacar@intel.com>
	<689eae32fd2c27e92e5ed77dee0fcbf6586c8d4f.1394128875.git.stefanx.stanacar@intel.com>
In-Reply-To: <689eae32fd2c27e92e5ed77dee0fcbf6586c8d4f.1394128875.git.stefanx.stanacar@intel.com>
Mime-version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/3] bootimg/grub-efi.bbclass: allow using a different class for EFI images
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
X-List-Received-Date: Thu, 06 Mar 2014 22:31:41 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 3/6/14, 10:15, "Stefan Stanacar" <stefanx.stanacar@intel.com> wrote:

>Abstract away some names so one can select using EFI_PROVIDER a different
>class than grub-efi for populating live images, basically allowing the use
>of a different bootloader than grub-efi.
>
>Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
>---
> meta/classes/boot-directdisk.bbclass | 7 ++++---
> meta/classes/bootimg.bbclass         | 9 +++++----
> meta/classes/grub-efi.bbclass        | 6 ++++++
> 3 files changed, 15 insertions(+), 7 deletions(-)
>
>diff --git a/meta/classes/boot-directdisk.bbclass
>b/meta/classes/boot-directdisk.bbclass
>index 42b3415..c35b4bb 100644
>--- a/meta/classes/boot-directdisk.bbclass
>+++ b/meta/classes/boot-directdisk.bbclass
>@@ -32,7 +32,8 @@ BOOTDD_VOLUME_ID   ?= "boot"
> BOOTDD_EXTRA_SPACE ?= "16384"
> 
> EFI = "${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
>-EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "",
>d)}"
>+EFI_PROVIDER ?= "grub-efi"
>+EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi",
>"${EFI_PROVIDER}", "", d)}"
> 
> # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it
>does not
> # contain "efi". This way legacy is supported by default if neither is
>@@ -87,7 +88,7 @@ build_boot_dd() {
> 		syslinux_hddimg_populate $HDDDIR
> 	fi
> 	if [ "${EFI}" = "1" ]; then
>-		grubefi_hddimg_populate $HDDDIR
>+		${EFICLASS_FUNC_PREFIX}_hddimg_populate $HDDDIR

This seems like an odd way to call a function, via a constructed function
name. Would it make more sense to define an efi interface and only one
bbclass that implemented that interface? Such as grub-efi.bbclass or
gummiboot.bbclass?

This isn't my area of expertise, maybe some recipe/bitbake experts can
weigh in here...

-- 
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center





