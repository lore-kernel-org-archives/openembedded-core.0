Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TzpoA-0003qx-Js
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 15:35:49 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jan 2013 06:19:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,551,1355126400"; d="scan'208";a="279262453"
Received: from unknown (HELO helios.localnet) ([10.252.123.209])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2013 06:19:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 28 Jan 2013 14:19:57 +0000
Message-ID: <4710226.v3bfS80rgU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.4 (Linux/3.5.0-22-generic; KDE/4.9.4; i686; ; )
In-Reply-To: <lypq0pl8ee.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<1359377661.22371.54.camel@ted>
	<lypq0pl8ee.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Mon, 28 Jan 2013 14:35:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 January 2013 14:55:05 Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> >> > Backfilling DISTRO_FEATURES and MACHINE_FEATURES with _append
> >> > statements
> >> > happens too late to use those variables with conditional inherits, like
> >> 
> >> > this:
> >> This causes regressions for setups where DISTRO_FEATURES_BACKFILL uses
> >> the override mechanism. E.g. I have
> >> 
> >> | DISTRO_FEATURES_BACKFILL_mydist = "ld-is-gold ${${PROJECT_FEATURES}"
> >> | DISTRO_FEATURES_INITMAN_mydist = "systemd"
> >> 
> >> Before this commit, DISTRO_FEATURES contained 'ld-is-gold' and the
> >> project features.  Now, project features + ld-is-gold vanished and
> >> pulseaudio is in again.
> > 
> > I don't think its possible to make everything work :(
> > 
> > The question is therefore how do we want to proceed? I'll take further
> > proposed patches but I don't know what the best thing to do here is...
> 
> I made my setup (--> overriding DISTRO_FEATURES_BACKFILL by distro
> configuration) working again by assigning it weakly in bitbake.conf:
> 
> -DISTRO_FEATURES_BACKFILL = "pulseaudio ${DISTRO_FEATURES_INITMAN}"
> +DISTRO_FEATURES_BACKFILL ?= "pulseaudio ${DISTRO_FEATURES_INITMAN}"
> 
> ditto for MACHINE_FEATURES_BACKFILL.

Why are you assigning *_FEATURES_BACKFILL at all?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


