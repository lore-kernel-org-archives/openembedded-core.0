Return-Path: <paul.eggleton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 814E76CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 11:05:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Nov 2013 03:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,751,1378882800"; d="scan'208";a="439800386"
Received: from pauljbro-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.218])
	by orsmga002.jf.intel.com with ESMTP; 22 Nov 2013 03:05:20 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: "Hart, Darren" <darren.hart@intel.com>
Date: Fri, 22 Nov 2013 11:05:19 +0000
Message-ID: <1583959.f3sbDcLors@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1385059626.3614.10.camel@dvhart-mobl4.amr.corp.intel.com>
References: <1385059626.3614.10.camel@dvhart-mobl4.amr.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: distro/machine:kernel feature mapping and version checking
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
X-List-Received-Date: Fri, 22 Nov 2013 11:05:26 -0000
Content-Type: text/plain; charset="us-ascii"

Hi Darren,

On Thursday 21 November 2013 18:47:07 Hart, Darren wrote:
> Regarding the following 2 bugs:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5574
> Add kernel version / configuration check mechanism
> 
> and 
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2267
> Integrate DISTRO_FEATURES with KERNEL_FEATURES
> 
> There is a need to reduce errors where a DISTRO config might break due
> to lack of kernel support, things such as systemd. There is also
> interest in enabling certain kernel features based on
> DISTRO/MACHINE_FEATURES, such as wifi.
> 
> Neither of these should depend on the Kernel Version as even with the
> right version, if the CONFIG_* feature is missing, the image will not
> work correctly. There is also the risk of false negatives when a feature
> has been backported to a kernel version that didn't have the feature
> previously.

Right; I hadn't appreciated this when I wrote the bug but we definitely don't 
want to be checking versions.

> The recommended approach would be to check for the required CONFIG_*
> options after the linux-yocto configuration stage.
> 
> There is also the topic of DISTRO_FEATURES ~= "wifi" impacting how the
> kernel will be built. The MACHINE should have some say in how this is
> done - if the machine can never have wifi, building wifi into the kernel
> doesn't make a lot of sense. Something like the following might make
> sense:
> 
> for FEATURE in DISTRO_FEATURES:
>     if MACHINE_FEATURES contains FEATURES:
>         KERNEL_FEATURES += FEATURE_override
> 
> Where FEATURE_override is defined something like this:
> 
> FEATURE = FEATURE_default
> if exists FEATURE_distro:
>     FEATURE = FEATURE_distro
> if exists FEATURE_machine:
>     FEATURE = FEATURE_machine

There are a couple of slight quirks here:

1) Not all features match up between DISTRO_FEATURES and MACHINE_FEATURES like 
this, just a select list. (This is why we currently have COMBINED_FEATURES.)

2) There is some handling in packagegroup-base.bbclass to enable 
wifi/bluetooth/3g/nfc functionality in userspace if these features are *not* in 
MACHINE_FEATURES but they are in DISTRO_FEATURES *and* MACHINE_FEATURES 
indicates some means of expansion exists e.g. pci, pcmcia, usbhost. Whether we 
want to try to support this at the kernel level I don't know.

> This is effectively a fragment name which needs to be provided by the
> linux-yocto kernel meta data as it will be kernel version dependent.
> 
> The linkage I'm not sure about is how to know what to test for in the
> kernel.bbclass without intimate knowledge of the kernel version CONFIG
> options in recipe space.

So are you convinced you want to try to solve these two with one solution in 
kernel.bbclass rather than giving individual recipes some easy methods of 
checking kernel config options? I agree they are related, but I had imagined 
that we'd solve them both and solve them separately; only doing the feature 
map when we're building the kernel still leaves us with recipes like udev that 
aren't controlled by a specific feature but do still have kernel config 
requirements (of course, you could just assume that if you're using sysvinit 
then you're using udev and handle the issue that way, but that seems like a 
hack to me).

Cheers,
Paul
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


