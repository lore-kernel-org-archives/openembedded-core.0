Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sh2di-0005KD-DT
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 19:54:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Jun 2012 10:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158270885"
Received: from unknown (HELO helios.localnet) ([10.252.120.169])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2012 10:44:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 19 Jun 2012 18:44:06 +0100
Message-ID: <4256903.kAPMsSF2tk@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1206191257390.1069@oneiric>
References: <alpine.DEB.2.02.1206191257390.1069@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: proper use of CORE_IMAGE_EXTRA_INSTALL?
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
X-List-Received-Date: Tue, 19 Jun 2012 17:54:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 June 2012 13:05:35 Robert P. J. Day wrote:
>   followup to earlier post, it's easy enough to see the point of this
> code from core-image.bbclass:
> 
> ... snip ...
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
> ... snip ...
> 
>   but i can see this snippet from
> meta/recipes-graphics/images/core-image-gtk-directfb.bb:
> 
> ... snip ...
> 
> inherit core-image
> 
> IMAGE_INSTALL += "\
>         ${CORE_IMAGE_BASE_INSTALL} \
>         task-core-basic \
>         task-core-gtk-directfb-base \
> "
> 
> ... snip ...
> 
>   now this would seem to be exactly what the variable
> CORE_IMAGE_EXTRA_INSTALL was invented for, no?  certainly the above
> will work but then what's the point of having
> CORE_IMAGE_EXTRA_INSTALL?
> 
>   however, if one used that, it's obvious that one would leave the
> line "inherit core-image" to near the bottom of the .bb file, but
> returning to my earlier question, what is the proper ordering of
> setting CORE_IMAGE_EXTRA_INSTALL and inheriting core-image.  it's
> clear "inherit core-image" would always work *after*, but what about
> before?

I feel like we've gone over this ground quite a lot; but I guess that's 
because our documentation and examples still aren't clear, so fair enough.

There's nothing forcing you into a specific usage here, however we might make 
some recommendations. My recommendation would be to leave 
CORE_IMAGE_EXTRA_INSTALL for use from local.conf - i.e. don't use it in your 
own image recipe; if you want to add things there use IMAGE_INSTALL += or 
IMAGE_INSTALL_append (see other thread).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


