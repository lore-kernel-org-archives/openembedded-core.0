Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TzruX-0005jA-Vu
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:50:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jan 2013 08:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,551,1355126400"; d="scan'208";a="283123318"
Received: from unknown (HELO helios.localnet) ([10.252.123.209])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2013 08:34:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 28 Jan 2013 16:34:40 +0000
Message-ID: <97105828.GXrr1zfWsR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.4 (Linux/3.5.0-22-generic; KDE/4.9.4; i686; ; )
In-Reply-To: <lywquxjmyb.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<1440434.Jn4S7oh0Xd@helios>
	<lywquxjmyb.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Mon, 28 Jan 2013 16:50:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 January 2013 17:23:40 Enrico Scholz wrote:
> Paul Eggleton <paul.eggleton@linux.intel.com> writes:
> >> 1. set some defaults on distribution base ...
> >> 2. allow to override these defaults on a per-project base
> >> ...
> >> afaik, DISTRO_FEATURES_BACKFILL + _CONSIDERED exist to allow the first
> >> two point without an '-=' operator which lacks in bitbake.
> > 
> > No they don't. They exist to allow adding new features that should be
> > enabled for all existing distro configs without each of those having to
> > be changed, and provide a means for distros to opt out of that enabling
> > if they wish.
> How is this different from my requirements?  Ok; atm,
> DISTRO_FEATURES_BACKFILL is pretty useless because it contains only
> 'pulseaudio' which is probably unwanted on >90% of all embedded devices

pulseaudio was enabled already in the recipes that care about it; that was the 
point of adding it in the first place so it could be turned off.

> and it is impossible to extend DISTRO_FEATURES_BACKFILL.

It's not intended to be extended; it's for use in OE-Core alone.

> > It's still not clear to me why you could not just set DISTRO_FEATURES
> > directly. If you have values you're likely to want to remove, you can
> > put them in separate variables that you can clear out later.
> 
> It is very difficultly to do within distro.conf. E.g. having
> 
> | DISTRO_FEATURES = "${@subtract_set('DISTRO_FEATURES',
> | 'UNWANTED_FEATURES')}'
> will probably result into some error regarding recursive expansion.

What I meant was something like:

DISTRO_FEATURES = "${DISTRO_FEATURES_BASIC} ${DISTRO_FEATURES_A}  
${DISTRO_FEATURES_B}"

And then in your specific configs:
DISTRO_FEATURES_A = ""

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


