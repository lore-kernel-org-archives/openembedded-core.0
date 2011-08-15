Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QszUZ-00053n-Eo
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 17:54:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2011 08:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37920881"
Received: from unknown (HELO helios.localnet) ([10.255.18.70])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2011 08:49:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 16:49:40 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <201108142050.37352.paul.eggleton@linux.intel.com>
	<1313420625.6733.182.camel@phil-desktop>
In-Reply-To: <1313420625.6733.182.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201108151649.40904.paul.eggleton@linux.intel.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 15:54:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 August 2011 16:03:44 Phil Blundell wrote:
> I can't immediately think why this should be behaving differently to any
> other library (eglibc for example).  It's quite normal for those
> packages to be architecture-specific and not machine-specific.
> 
> What I think is meant to happen when you change MACHINE is that
> populate_sysroot will rerun (because ${MACHINE} is factored into the
> stamp for that task) but it will use all the previously cached build
> artifacts from sstate and hence you won't end up having to rebuild
> everything.  It sounds as if that isn't happening in this case for some
> reason, though I can't immediately think what libopie2 might be doing to
> defeat it.
> 
> Is it just include.pro that goes wrong, or does the whole of libopie2 go
> missing from the sysroot when you change MACHINE?

Actually it's just include.pro - everything else gets copied to the sysroot 
for the new machine just fine.

I've sort of figured this out. include.pro is getting installed to the sysroot  
and not ${D} in do_install (and it's the only file handled this way). I'm 
guessing that because of this it never gets picked up by sstate.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


