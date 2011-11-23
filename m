Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTGzU-00024G-5s
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 18:52:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Nov 2011 09:45:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,560,1315206000"; d="scan'208";a="40591059"
Received: from unknown (HELO helios.localnet) ([10.252.121.207])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Nov 2011 09:45:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2011 17:45:35 +0000
Message-ID: <6713028.ehgggRD6ui@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1322068148.15626.15.camel@ted>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<1322066940.26081.27.camel@phil-desktop>
	<1322068148.15626.15.camel@ted>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 17:52:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 23 November 2011 17:09:08 Richard Purdie wrote:
> I'm wondering if we can do something in the core like:
> 
> DISTRO_FEATURES_BACKFILLOPTS = "pulseaudio"
> 
> and have the distro set:
> 
> DISTRO_FEATURES_BACKFILLCONSIDERED = ""
> 
> and then add some code which looks for anything in
> DISTRO_FEATURES_BACKFILLOPTS but not in
> DISTRO_FEATURES_BACKFILLCONSIDERED and adds it to DISTRO_FEATURES.
> 
> Distros can then opt out of a given feature by adding it to
> DISTRO_FEATURES_BACKFILLCONSIDERED.
> 
> This would let us maintain compatibility but also move forward and
> create new settings with names that make sense.

This will solve the issue, but the more I think about it the more I don't like 
it - from the perspective of a new user it just puts a fairly arbitrary line 
between old features and new ones. If you want control over the full range of 
options you'll need to look at two places.

I think I'm right in assuming that when we introduce a DISTRO_FEATURES feature 
we are almost always doing it to allow disabling some existing functionality, 
rather than enabling something new. In that case, should we not be providing 
the appropriate mechanism so that can exclude the features they don't want 
rather than including the ones that they do? That would avoid breakage over 
time in a much simpler way than the above, IMHO. (I'm aware that we have 
oe_filter_out but I think that's a bit untidy.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


