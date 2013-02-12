Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1U5DVo-0007FV-7O; Tue, 12 Feb 2013 11:54:58 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 02:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,648,1355126400"; d="scan'208";a="261456255"
Received: from unknown (HELO helios.localnet) ([10.252.120.87])
	by orsmga001.jf.intel.com with ESMTP; 12 Feb 2013 02:38:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 10:38:52 +0000
Message-ID: <1906630.s5um26QAQj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 10:54:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 February 2013 10:24:50 Burton, Ross wrote:
> > * tslib: OE-Core has the 1.0 release version, meta-oe has a git recipe
> > that is ahead of 1.0; the OE-Core version has two patches not in the
> > meta-oe version but that both have been merged upstream in the git
> > revision being used in the meta-oe version. There is no newer stable
> > release. What do we do here? Should we ask upstream (Chris) for a new
> > stable release?
> 
> Is anyone actually using tslib these days?  oe-core dropped kdrive,
> and we don't package the apparently unmaintained input driver for
> Xorg.  I guess a new upstream would be good, and then move to meta-oe.

Qt Embedded as we build it is currently configured to use tslib, as is
SDL. If the alternative (evdev?) is supported they could presumably be
switched over though. I don't know how practical that is however.
 
> > * xserver-nodm-init: the two versions are quite distinct. Not sure I
> > understand the full history here but perhaps someone else can fill in the
> > blanks...?
> 
> I don't understand the full history either yet, but this is clearly
> something that needs to be sorted.
> 
> > * meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> > As far as I can tell this just adds an /etc/busybox-syslog.default file
> > containing OPTIONS="-C64" and seems to have been added for systemd
> > support.
> > I'm not sure why this wasn't moved to meta-systemd, but I assume it needs
> > to be merged into OE-Core now that systemd support is being added
> > there... ?
> When it's understood *what* that does, then we can evaluate it for oe-core.

The following commit introduced this:

http://cgit.openembedded.org/meta-openembedded/commit/?id=c48a6a605c6d8d38cfbc5df39b3dc310bffc07c1

Otavio can you explain further?

> > * meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> > Another bbappend apparently for systemd support. Again, this should have
> > been moved to meta-systemd; do we now need to merge it into OE-Core?
> 
> Yes, half of it has been merged to master already. The rest should be
> in Radu's branch, we can sort that today.

OK, great.

> > * meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
> > Builds against external libav instead of using the builtin copy of ffmpeg,
> > apparently for better performance on ARM (and presumably that is not the
> > only benefit). It's less clear to me what should be done with this, but
> > I'd still rather it could be eliminated. OE-Core does not have
> > ffmpeg/libav; one wonders if it should or not.
> 
> libav/gst-ffmpeg/gst-av (as it's called in gst1.0) has interesting
> legal issues, but I do think it should be in oe-core.

Well, we already have gst-ffmpeg in OE-Core so I can't imagine libav
would be any worse as long as it is similarly protected with
LICENSE_FLAGS.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


