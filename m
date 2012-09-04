Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8oij-0001GA-3s
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 10:42:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Sep 2012 01:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,366,1344236400"; d="scan'208";a="217490354"
Received: from unknown (HELO helios.localnet) ([10.252.121.161])
	by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2012 01:30:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 04 Sep 2012 09:30:28 +0100
Message-ID: <1937737.ltCaXIobqa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <5045687E.7010505@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<1a2dd4def9f665707e0b8e99f52166906f14f1b5.1346668109.git.paul.eggleton@linux.intel.com>
	<5045687E.7010505@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/28] classes/core-image: remove *_IMAGE_FEATURES variables
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
X-List-Received-Date: Tue, 04 Sep 2012 08:42:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 19:33:34 Saul Wold wrote:
> > -IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES}"
> > +IMAGE_FEATURES += "apps-console-core package-management x11-base
> > apps-x11-core apps-x11-games x11-sato ssh-server-dropbear"
>
> Should package-management be here or should it be a DISTRO_FEATURE and
> have the ability to be enabled or disabled more on DISTRO basis?  I know
> that we explicitly disable it on core-image-minimal and have a
> ROOTFS_POSTPRESSES_COMMAND there, but I wonder about setting that up on
> a DISTRO basis?

DISTRO_FEATURES are usually items that influence changes at compilation time. I 
think it's also reasonable to expect people want to be able to produce images 
that have package management for development/testing/debugging and those that 
don't for production, side-by-side, in which case it has to be in 
IMAGE_FEATURES (especially as changing DISTRO_FEATURES on the fly will result 
in a lot of recompilation).

> It's part of the following:
> 
> meta/recipes-core/images/build-appliance-image.bb
> meta/recipes-graphics/images/core-image-clutter.bb
> meta/recipes-graphics/images/core-image-x11.bb
> meta/recipes-sato/images/core-image-sato.bb
> 
> What about LSB? core-image-base or core-image-basic?

The latter images never had package management enabled; I think core-image-
basic at least could reasonably have package management enabled though since 
it's meant to produce a more fully-featured Linux system (mental note, still 
need to rename some of those images). AIUI, LSB doesn't require full package 
management to be enabled, only that rpm packages are able to be installed; 
installing rpm should satisfy this. We would only want to enable full package 
management in the LSB images if it was in some way helpful to run the LSB 
tests.

I'm not entirely sure how we ended up with package management in the Sato 
images and not with some of the others - perhaps there was at one time a 
package management application within Sato or plans for one?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


