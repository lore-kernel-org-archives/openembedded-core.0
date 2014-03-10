Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B2F866F7A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 20:09:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Mar 2014 13:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,625,1389772800"; d="scan'208";a="497234471"
Received: from dvhart-mac01.jf.intel.com (HELO [10.7.196.55]) ([10.7.196.55])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2014 13:09:29 -0700
User-Agent: Microsoft-MacOutlook/14.3.9.131030
Date: Mon, 10 Mar 2014 13:09:54 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <CF43694C.761D6%dvhart@linux.intel.com>
Thread-Topic: [PATCH 0/4] Add gummiboot boot manager alongside grub-efi
References: <cover.1394379900.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1394379900.git.stefanx.stanacar@intel.com>
Mime-version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/4] Add gummiboot boot manager alongside grub-efi
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
X-List-Received-Date: Mon, 10 Mar 2014 20:09:31 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 3/9/14, 9:04, "Stefan Stanacar" <stefanx.stanacar@intel.com> wrote:

>Hello,
>
>This series adds recipes for gummiboot and a class allowing it to be used
>as the boot loader for live/hddimg images.
>Without changing EFI_PROVIDER, we have the same behaviour for EFI
>machines.
>Using EFI_PROVIDER = "gummiboot" an installed image will use gummiboot
>instead
>of grub-efi as it's boot manager.
>
>I've tested this on FRI2, NUC and minnow (live USB boot and install from
>USB and boot) 
>with  EFI_PROVIDER = "gummiboot" and  KERNEL_FEATURES_append = "
>cfg/efi-ext"
>in local.conf
>
>This is a partial fix for YB#4082.
>
>Changes in V2:
> - split the first patch in two
> - used ${B} instead of ${S} in gummiboot do_deploy
> - change the function names in bootimg/grub-efi instead of using a
>prefix
>
>I've tested again the changes on top of master.

This series looks much improved to me. I think it can go in as it stands.

Acked-by: Darren Hart <dvhart@linux.intel.com>

One thing I would like to see improved it the definition of the efi class
interface. I don't know how we do something like an abstract base class in
bb-speak, but someone wanting to add another EFI class needs to be able to
learn what the required methods and arguments are. Also, efi_populate()
isn't one of those interfaces, and that should probably not use the
generic efi_ prefix as it is effectively a gummiboot or grub-efi private
method, and should be named accordingly.

But, those are nitpics that can be cleaned up over time as we polish and
extend this mechanism. Time to get this in and get some broader
use/testing.

Ultimately, I'd like to see gummiboot as the default, but I can also just
set that in meta-intel if others do not agree.

Thank you for you efforts here Stefan!

-- 
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center





