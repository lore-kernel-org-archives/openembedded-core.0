Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TEIFx-0003v1-EP
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 13:15:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2012 04:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="223907179"
Received: from unknown (HELO helios.localnet) ([10.252.121.228])
	by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2012 04:03:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Wed, 19 Sep 2012 12:03:05 +0100
Message-ID: <224680354.d9icDWC9tY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A68BAF6@039-SN1MPN1-001.039d.mgd.msft.net>
References: <70CC66F5C30A414DADDA6973E4CA391A68BAF6@039-SN1MPN1-001.039d.mgd.msft.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: multilib errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 11:15:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 19 September 2012 02:37:35 McClintock Matthew-B29882 wrote:
> Is anyone else seeing:
> 
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry trailingslash.patch: file could not be found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry prefix-manpage-fix.patch: file could not be found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry rename-with-sysroot.patch: file could not be found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry use-sysroot-in-libpath.patch: file could not be found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry fix-final-rpath.patch: file could not be found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry avoid_absolute_paths_for_general_utils.patch: file could not be
> found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry fix-rpath.patch: file could not be found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry respect-fstack-protector.patch: file could not be found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry norm-rpath.patch: file could not be found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry prefix.patch: file could not be found
> WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
> entry fixinstall.patch: file could not be found
> WARNING: Unable to get checksum for lib64-build-appliance-image
> SRC_URI entry Yocto_Build_Appliance.vmx: file could not be found
> WARNING: Unable to get checksum for lib64-build-appliance-image
> SRC_URI entry Yocto_Build_Appliance.vmxf: file could not be found
> 
> With multilib enabled? Have not debuged but it looks like something is
> parsing SRC_URI for recipes under multilib when it should not be.

I have seen these errors as well. It definitely should be doing these checks - 
the warnings occur during the file checksum code but more broadly they indicate 
the system will fail to find these files should you try to build the targets 
mentioned. Looking more closely, I could be wrong but it looks to me that BPN 
is not correct at least in the case of lib64-build-appliance-image - I think 
it ought to be "build-appliance-image"  but instead it is "lib64-build-
appliance-image", which means that it can't find the files referred to in 
SRC_URI anymore given that they are located in a directory named "build-
appliance-image".

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


