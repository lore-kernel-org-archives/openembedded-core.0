Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RvrI6-00025i-OV
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 15:17:35 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Feb 2012 06:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="65299546"
Received: from unknown (HELO helios.localnet) ([10.252.122.199])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Feb 2012 06:09:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 14:09:25 +0000
Message-ID: <8983108.GyvSNSG0Wm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <1328882587.14363.87.camel@phil-desktop>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
	<1440799.NqLiKZanR0@helios>
	<1328882587.14363.87.camel@phil-desktop>
MIME-Version: 1.0
Cc: Phil Blundell <philb@gnu.org>
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
X-List-Received-Date: Fri, 10 Feb 2012 14:17:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 10 February 2012 14:03:06 Phil Blundell wrote:
> On Fri, 2012-02-10 at 13:56 +0000, Paul Eggleton wrote:
> > What the code is attempting to do is provide its own "nullptr" if it isn't
> > being provided as part of the language:
> > 
> > ------------------------------
> > #if __has_feature(cxx_nullptr) || (GCC_VERSION_AT_LEAST(4, 6, 0) &&
> > defined(__GXX_EXPERIMENTAL_CXX0X__)) || (defined(_MSC_VER) && _MSC_VER >=
> > 1600 && !COMPILER(INTEL))
> > 
> > #define HAVE_NULLPTR 1
> > 
> > #else
> > 
> > namespace std {
> > 
> >     class nullptr_t { };
> > 
> > }
> > 
> > extern std::nullptr_t nullptr;
> > 
> > #endif
> > ------------------------------
> > 
> > gcc 4.6 is preempting this and complaining about the use of the
> > identifier. I don't think renaming it is going to be acceptable upstream
> > either.

> Does it work if you build with -std=c++0x?

It does, yes (well, compiling the above code on its own anyway).

-- 

Paul Eggleton
Intel Open Source Technology Centre


