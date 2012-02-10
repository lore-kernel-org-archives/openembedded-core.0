Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RvwJR-0005Ym-Vj
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 20:39:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Feb 2012 11:31:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="108791358"
Received: from unknown (HELO helios.localnet) ([10.252.122.199])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2012 11:31:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 19:31:08 +0000
Message-ID: <1862774.ijFNRjIgdo@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <1440799.NqLiKZanR0@helios>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
	<CAMKF1spuyaA4ZJTe1pH8qyRA0nXQfJ67hAKjs5daf_Lmxy=8Tg@mail.gmail.com>
	<1440799.NqLiKZanR0@helios>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Fri, 10 Feb 2012 19:39:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 10 February 2012 13:56:44 Paul Eggleton wrote:
> On Thursday 09 February 2012 13:19:22 Khem Raj wrote:
> > since there is a namespace conflict that should be fixed IMO removing
> > Wrror is not quite the right thing to do here IMO.
> 
> So removing -Werror is somewhat heavy-handed, yes; perhaps we can simply
> add -Wno-error=c++0x-compat and mark this patch as inappropriate for
> upstreaming instead?

So, I dug further into this, and I discovered that the reason for this 
breaking was that the Qt configure script thought we were not using g++ as the 
C++ compiler (!) thus it did not detect the gcc version, and therefore when it 
came to the check to see if gcc 4.6+ was being used in order to add the -Wno-
c++0x-compat option to CXXFLAGS (which it already has code to do), the version 
was not set and the option was not added.

I've updated the contrib branch to fix this as well as reformat the other patch 
as Koen requested.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


