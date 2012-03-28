Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCr63-0004Zb-J2
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 13:31:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Mar 2012 04:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="124257482"
Received: from unknown (HELO helios.localnet) ([10.252.123.244])
	by azsmga001.ch.intel.com with ESMTP; 28 Mar 2012 04:22:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2012 12:22:18 +0100
Message-ID: <12232640.MdqDDZk2lY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203280713020.2164@oneiric>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<26662553.TyMenuqT12@helios>
	<alpine.DEB.2.02.1203280713020.2164@oneiric>
MIME-Version: 1.0
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 11:31:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 March 2012 07:14:41 Robert P. J. Day wrote:
>   even though i realize this technique is not encouraged for
> local.conf, as i mentioned, i just tested using it from scratch in a
> brand new build and it still didn't add that package to my image.  if
> it should have, then something isn't working.

So, there are two reasons why it might not work:

1) If you're using core-image-minimal, it will never be included using 
DISTRO_EXTRA_RDEPENDS (nor MACHINE_EXTRA_RDEPENDS, for that matter). This is 
because core-image-minimal does not include task-base - only the minimum 
required to get a working system.

2) Otherwise, if task-base has already been built and will be included (which 
it will be for any image that inherits from core-image and does not override 
IMAGE_INSTALL, e.g. core-image-sato) but you aren't using OEBasicHash 
(defaults to enabled for latest Poky, but not for OE-Core's default policy) 
then changing DISTRO_EXTRA_RDEPENDS after the fact won't do anything unless 
you force task-base to rebuild.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


