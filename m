Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id EA6447002B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:53:54 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id DNtt1s0060BmcFC01Ntuwb; Tue, 02 Feb 2016 10:53:54 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=VT51laBfDCZq1CrkDxoA:9 a=29CzwlC_J2-XQLEL:21
	a=T18Kqg6XGAwyUqqg:21 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1aQYan-0000qu-Dj; Tue, 02 Feb 2016 10:53:53 +0000
Date: Tue, 2 Feb 2016 10:53:53 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160202105353.GA2917@mcrowe.com>
References: <20160201165925.GA6886@mcrowe.com>
	<1454349151.27087.49.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1454349151.27087.49.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: sstate-cache contains many seemingly useless siginfo files
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
X-List-Received-Date: Tue, 02 Feb 2016 10:53:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 01 February 2016 at 17:52:31 +0000, Richard Purdie wrote:
> On Mon, 2016-02-01 at 16:59 +0000, Mike Crowe wrote:
> > Our sstate-cache cleanup script was written long before
> > 80b3974081c4a8c604e23982a6db8fb32c616058, so it only pruned siginfo
> > files
> > if the corresponding tgz file had not been accessed recently.
> > 
> > This worked well until siginfo files started being written for every
> > task -
> > even those that didn't also generate a tgz file such as unpack,
> > configure
> > and compile.
> > 
> > I've just cleared up over two million siginfo files from our sstate
> > -cache!
> > 
> > This exercise has left me wondering why these siginfo files are being
> > written to the sstate-cache in the first place.
> > 80b3974081c4a8c604e23982a6db8fb32c616058 suggests that they aren't
> > being
> > used by anyone.
> 
> These are used by things like "bitbake -S printdiff" in order to debug
> why things are being rebuilt. Without them, there are gaps in the
> dependency chains and the tools can't figure out how things changed.
> 
> So they're not used by main builds but are useful for debug.

It sounds like keeping them around would be useful, but since they aren't
touched during a normal build they would be expired from the sstate-cache
while they are still current.

But, perhaps running "bitbake -S printdiff" periodically would be
sufficient to ensure that they are accessed and won't expire early. I'll
try doing that.

Thanks.

Mike.

