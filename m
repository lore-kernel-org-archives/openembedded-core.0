Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Si1JY-0006Cg-UD
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 12:42:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 03:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="114990944"
Received: from unknown (HELO helios.localnet) ([10.252.120.123])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 03:31:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 11:31:18 +0100
Message-ID: <2779429.QaclkbfKlo@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1206201416170.821@oneiric>
References: <alpine.DEB.2.02.1206201416170.821@oneiric>
MIME-Version: 1.0
Subject: Re: CORE_IMAGE_EXTRA_INSTALL has potential to be misleading?
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
X-List-Received-Date: Fri, 22 Jun 2012 10:42:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 June 2012 14:28:40 Robert P. J. Day wrote:
>   was reminded of this as i was perusing some old OE core notes.
> remember this from core-image.bbclass?
> 
> CORE_IMAGE_BASE_INSTALL = '\
>     task-core-boot \
>     task-base-extended \
>     \
>     ${CORE_IMAGE_EXTRA_INSTALL} \
>     '
> 
> CORE_IMAGE_EXTRA_INSTALL ?= ""
> 
> IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> 
>   except there are some core image variation recipes
> (core-image-minimal-dev.bb, among others) that do things like this:
> 
> IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE}"
> 
> IMAGE_FEATURES += "dev-pkgs"
> 
> IMAGE_LINGUAS = " "
> 
> LICENSE = "MIT"
> 
> inherit core-image
> 
>   note how the explicit assignment to IMAGE_INSTALL in that second
> example will copletely override the "IMAGE_INSTALL ?=" in the bbclass
> file, at which point ${CORE_IMAGE_EXTRA_INSTALL} will obviously never
> be evaluated and included.

Right, this is not really ideal. In the case of core-image-minimal(-dev) we're 
trying to be as minimal as reasonably possible, and that includes eliminating 
a bunch of the stuff that core-image.bbclass adds. The easiest way to do this 
is by simply setting IMAGE_INSTALL explicitly.

It seems like core-image-minimal-dev has been a little neglected - at least 
two changes that went into core-image-minimal were not also applied to it, 
including the addition of CORE_IMAGE_EXTRA_INSTALL (or POKY_EXTRA_INSTALL as 
it was known at the time). I'm wondering if a better way for this specific 
recipe to work would just to be to "require core-image-minimal.bb" and then 
set IMAGE_FEATURES += "dev-pkgs" as appropriate.

core-image-minimal* are somewhat special cases, however I do think we do need 
to improve the consistency of all of our image recipes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


