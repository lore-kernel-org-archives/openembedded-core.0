Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id BB7D665E8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 16:15:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,835,1389744000"; d="scan'208";a="66922386"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 10 Apr 2014 17:15:10 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WYHd7-0000NF-1a; Thu, 10 Apr 2014 17:15:09 +0100
Date: Thu, 10 Apr 2014 17:15:09 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20140410161509.GA421@mcrowe.com>
References: <20140407155333.GA19351@mcrowe.com>
	<CABcZANkEyt9M=A0SEWBTGedh713vdYhgqJciKDvZeQ_f-NoLaw@mail.gmail.com>
	<20140407164951.GA20653@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20140407164951.GA20653@mcrowe.com>
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
X-List-Received-Date: Thu, 10 Apr 2014 16:15:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 07 April 2014 at 17:49:51 +0100, Mike Crowe wrote:
> On Monday 07 April 2014 at 09:17:38 -0700, Chris Larson wrote:
> > On Mon, Apr 7, 2014 at 8:53 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > 
> > > We're building for both ARM and MIPS-based MACHINEs in a single source
> > > tree. This seems to result in us compiling (or luckily most of the time
> > > resurrecting from sstate-cache) two different versions of all -native
> > > packages due to different base hashes.
> > >
> > > It seems that this difference in base hashes is due to the exported
> > > variable TARGET_LDFLAGS being different between the two CPUs:
> > >
> > > < export TARGET_LDFLAGS="-Wl,-O1  -Wl,--as-needed"
> > > ---
> > > > export TARGET_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
> > >
> > 
> > Heh, this i another case of a likely completely unnecessary export.
> > Software we build expects LDFLAGS to be used, not TARGET_LDFLAGS, so I
> > can't imagine that anything is using this export. Of course, it's
> > non-trivial to confirm that this is the case :)

My git archaeology shows that this dates from the very first import from
svn back in 2005. Back then it looks like it was necessary for
wpa_supplicant which used it in its defconfig file. This is no longer the
case.

I didn't look at any other layers.

> It did strike me as an odd thing to be exporting. Given the name I assumed
> it had something to do with building the toolchain. I notice though that
> the gcc recipes explicitly export LDFLAGS_FOR_TARGET inside tasks based on
> TARGET_LDFLAGS anyway so the toolchain "should be fine". :)
> 
> I'm happy to try our complete build without exporting TARGET_LDFLAGS as a
> first step but I realise that probably wouldn't be enough proof.

I've tested our build without the "export" in front of TARGET_LDFLAGS in
bitbake.conf and saw no problems at all so I'm in favour of doing that.

Would a patch for this be acceptable? It does cause the world to be
rebuilt. :(

Thanks.

Mike.

