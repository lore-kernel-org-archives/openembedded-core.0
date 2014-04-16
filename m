Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1B565E54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 09:43:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,871,1389744000"; d="scan'208";a="75245992"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 16 Apr 2014 10:43:46 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WaMNd-0002Ri-S6; Wed, 16 Apr 2014 10:43:45 +0100
Date: Wed, 16 Apr 2014 10:43:45 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>, Chris Larson <clarson@kergoth.com>
Message-ID: <20140416094345.GA8872@mcrowe.com>
References: <20140407155333.GA19351@mcrowe.com>
	<CAMKF1spaiP8bkNxnSHqUs4tg6=gfZqR8fZaTrDn-N=s1iSDLkw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spaiP8bkNxnSHqUs4tg6=gfZqR8fZaTrDn-N=s1iSDLkw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: export TARGET_LDFLAGS and native sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Apr 2014 09:43:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 07 April 2014 at 12:35:44 -0700, Khem Raj wrote:
> -Khem
> On Apr 7, 2014 5:53 AM, "Mike Crowe" <mac@mcrowe.com> wrote:
> >
> > We're building for both ARM and MIPS-based MACHINEs in a single source
> > tree. This seems to result in us compiling (or luckily most of the time
> > resurrecting from sstate-cache) two different versions of all -native
> > packages due to different base hashes.
> >
> > It seems that this difference in base hashes is due to the exported
> > variable TARGET_LDFLAGS being different between the two CPUs:
> >
> > < export TARGET_LDFLAGS="-Wl,-O1  -Wl,--as-needed"
> > ---
> > > export TARGET_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
> >
> > which in turn is because TARGET_LINK_HASH_STYLE is explicitly set to
> "sysv"
> > on MIPS but allowed to be "gnu" on everything else.
> >
> > Every time I switch back and forth between building ARM-based and
> > MIPS-based machines the do_populate_sysroot_setscene tasks run for each
> > required -native recipe.
> >
> > If I modify native.bbclass to do:
> >
> >  TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
> 
> this is reasonable to do

I've submitted a patch that does this in
<1397640696-21281-1-git-send-email-mac@mcrowe.com> . The patch also does
the same thing to TARGET_CFLAGS, TARGET_CXXFLAGS and TARGET_CPPFLAGS. I'll
let the experts decided whether this is suitable for Daisy or not.

We're currently running our build with TARGET_LDFLAGS not exported and
haven't noticed any problems yet. I can submit a patch that does this but
I'd feel bound to also stop exporting TARGET_CFLAGS, TARGET_CXXFLAGS and
TARGET_CPPFLAGS for consistency though. Such a patch would definitely not
be suitable for Daisy.

Either (or both) patches solve my problem with task hashes.

Thanks.

Mike.

