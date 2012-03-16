Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8Uyc-0000mg-Dp
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 12:05:42 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Mar 2012 03:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="78315564"
Received: from unknown (HELO helios.localnet) ([10.252.123.171])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Mar 2012 03:56:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Fri, 16 Mar 2012 10:56:51 +0000
Message-ID: <1481997.vT15FBqihJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F62875C.60303@opendreambox.org>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<665936693.QMobc8r8oH@helios> <4F62875C.60303@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Fri, 16 Mar 2012 11:05:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 16 March 2012 01:20:44 Andreas Oberritter wrote:
> Sorry, I messed up some details. In fact, pseudo-native doesn't get
> rebuilt, but bitbake pseudo-native still gets executed for every
> machine, unless $BUILDDIR/pseudodone is present and contains
> PSEUDOBINDIR. This just wastes time and confuses users who receive a
> message saying "Pseudo is not present but is required, building this
> first before the main build".

It takes a small amount of time just once. However if this is really an issue 
perhaps we could address it directly rather than hacking around it?

> >> BUILDDIR doesn't seem to have any other use than pointing to the
> >> 'pseudodone' file. I don't understand why it's required to run bitbake
> >> from there.
> > 
> > Well, it's required that bitbake is run from the build directory and when
> > you use the setup script as intended that's where BUILDDIR points to. I
> > hadn't anticipated that anyone would be changing BUILDDIR to point to
> > anything other than the build dir, however I don't really think it's a
> > good idea to support that.
> 
> That's because BUILDDIR has no meaning outside oe-core's setup scripts.
> In scripts/bitbake, BUILDDIR would better be called PSEUDODONEDIR or
> similar, because that's what the variable really means in this context

The naming is such that it should point to the build directory because that's 
where pseudodone is meant to be written. I think when it was introduced there 
was an idea that it might be useful in other contexts, thus the naming.

> In order to verify that scripts/bitbake is called from the build
> directory, you could as well just check whether $PWD/conf/local.conf exists.

Unfortunately it's not that simple. bitbake.conf pulls in local.conf using 
"include" and not "require", thus it doesn't actually have to exist anywhere.

> I'm not using oe-core's scripts, because they make assumptions about the
> directory layout that don't fit my project's needs. I think they are
> overly complex

Could you perhaps elaborate on what needs those scripts are not fulfilling?

> and they display texts that seem to suit yocto's needs but at least not
> mine.

We print these messages so that people know what to do and where to find 
further information. I don't think that's unreasonable. However if you have 
suggestions on how we might improve those messages or allow them to be 
customised if necessary, we could look at changing them.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


