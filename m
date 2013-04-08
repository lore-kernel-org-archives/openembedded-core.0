Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPADk-0002w1-Q4
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 13:26:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Apr 2013 04:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,429,1363158000"; d="scan'208";a="319000343"
Received: from unknown (HELO helios.localnet) ([10.255.13.125])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2013 04:09:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 08 Apr 2013 12:09:23 +0100
Message-ID: <1580357.lcDe81vJOD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-26-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <2ED8DCD8-2873-4DE1-85C2-5CB254B8FD58@dominion.thruhere.net>
References: <5162038C.2020706@pseudoterminal.org>
	<CAJTo0LbOMz+MninSBv6d8UjeQ3cJMn-WXfq1v5Cqu4npDh+eng@mail.gmail.com>
	<2ED8DCD8-2873-4DE1-85C2-5CB254B8FD58@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: gstreamer 1.0 recipes
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
X-List-Received-Date: Mon, 08 Apr 2013 11:27:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 08 April 2013 12:47:51 Koen Kooi wrote:
> Op 8 apr. 2013, om 11:35 heeft "Burton, Ross" <ross.burton@intel.com> het 
volgende geschreven:
> > On 8 April 2013 08:57, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> I've been meaning to ask the same questions, since I need both orc and
> >> external libav to make gstreamer  (0.10, but still) useable on my
> >> platforms. I came up with the following ideas:
> >> 
> >> 1) Make every external dep a PACKAGECONFIG option in OE-core gstreamer
> >> 2) Add bbappends with extra PACKAGECONFIG options for gstreamer in the
> >> layer that has the external dep 3) add bbappens in the DISTRO layer that
> >> enables extra external dependencies.
> >> 
> >> Angstrom is currently using 3) and I absolutely hate it. 2) is scales a
> >> lot better, but apparently is verboten judging from the patches sent
> >> that remove the qt bbappends that do the same. Which leaves 1), which
> >> will cause problems for most users, since they will spot the
> >> PACKAGECONFIG options but not bother to read the comments saying they
> >> need to enable extra layers.
> >> 
> >> I favour 1) since that has all the knowledge in a single place, looked
> >> after by the OE gst maintainer (which we don't have yet, but still).> 
> > (1) definitely needs to happen in my opinion  I'm not a massive fan of
> > (2) in general as it leads to stuff changing simply by adding a layer
> > - you may pull in meta-oe for some other packages but suddenly the
> > GStreamer package is pulling in more dependencies.  I guess for things
> > like GStreamer where the dependencies are generally isolated into
> > separate packages this is less of an issue though.
> 
> Same thing is true to Qt, the *sql plugins are all subpackages. I realize 2)
> is unclear on wether the extra PACKAGECONFIG default to on or off.
> 
> Both Qt and gstreamer have nice automated packaging of their plugins, so
> bbappends are generally safe to use, but both of them also have configure
> options that enable/disable complete libraries (e.g. QtOpenGL) that might
> trigger missing symbols in other libraries in Qt/gstreamer (again,
> QtOpenGL).
> 
> So were do we as OE(-core) community draw the line for bbappends in layers?

Let's be clear, we're talking about bbappends in meta-oe and other software 
layers.

> For Qt it seems to be at "No bbappends allowed", but should we consider
> drawing it at "safe plugins only"? For generic layers like the ones in
> meta-oe I sure as hell don't want the "unsafe libraries" bbappends.

Apart from not having its configuration changed, given how huge Qt is I want it 
to *not* be rebuilt just as a consequence of adding meta-oe to my 
bblayers.conf. (Of course I can't have that yet because the bbappends have to 
at least have PRINC set in them still, but as soon as PV gets bumped...).

Honestly I think solution 1 is fine; in fact we already have that for some 
recipes. We would have had PACKAGECONFIG for these Qt SQL plugins except that 
as I've mentioned numbers of times, PACKAGECONFIG can't work for these three-
state options. One alternative would be to auto-add DEPENDS / CFLAGS based on 
QT_SQL_DRIVER_FLAGS.

Returning to the original topic, a case could be made for just bringing orc 
and libav into OE-Core. That's not going to work for every situation but we 
ought to be looking at these kind of things on a case-by-case basis.
 
Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


