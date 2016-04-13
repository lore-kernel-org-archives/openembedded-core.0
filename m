Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 9B91C70031
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 14:01:24 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id hq131s00J0BmcFC01q14Js; Wed, 13 Apr 2016 15:01:06 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=kziv93cY1bsA:10 a=ag1SF4gXAAAA:8 a=SVtGHLTNMxBnvoDCy5gA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1aqLLr-0003ww-ES; Wed, 13 Apr 2016 15:01:03 +0100
Date: Wed, 13 Apr 2016 15:01:03 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20160413140103.GA14803@mcrowe.com>
References: <20160329125626.GA11712@mcrowe.com>
	<1459260670.21672.25.camel@linuxfoundation.org>
	<20160412185126.GA14627@mcrowe.com>
	<1460494253.9308.70.camel@linuxfoundation.org>
	<CAP9ODKrgznCG2ezJLxF7fRsa13-ffD+3tLSttEegp832OoDFog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrgznCG2ezJLxF7fRsa13-ffD+3tLSttEegp832OoDFog@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Over-pruning the sstate cache
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
X-List-Received-Date: Wed, 13 Apr 2016 14:01:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 13 April 2016 at 10:47:13 -0300, Otavio Salvador wrote:
> On Tue, Apr 12, 2016 at 5:50 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2016-04-12 at 19:51 +0100, Mike Crowe wrote:
> >> On Tuesday 29 March 2016 at 15:11:10 +0100, Richard Purdie wrote:
> >> > On Tue, 2016-03-29 at 13:56 +0100, Mike Crowe wrote:
> >> > > 80b3974081c4a8c604e23982a6db8fb32c616058 implies that at least
> >> > > some
> >> > > people
> >> > > are pruning the sstate cache based on file access time.
> >> > >
> >> > > Is there a recommended way to ensure that all the sstate cache
> >> > > files
> >> > > are
> >> > > touched, even those that are not actually required to build the
> >> > > image
> >> > > currently due to task optimisation?
> >> > >
> >> > > Does anyone have any better ideas?
> >> >
> >> > generate the "locked-sigs" inc file (bitbake XXX -S none) and then
> >> > with
> >> > a script touch all the objects listed in that file?
> >>
> >> I'm most of the way through writing a script to do this. I've
> >> discovered
> >> that the sstate filenames contain bits that aren't in the locked-sigs
> >> file
> >> such as ${PV}, ${PR}, ${TARGET_VENDOR}, ${TARGET_OS},
> >> ${SSTATE_VERSION}.
> >> The hash is the important bit for identifying the file uniquely so
> >> these
> >> bits can either be hard coded or wildcarded as appropriate.
> >>
> >> There's also the need to apply native OS name prefix for native
> >> packages.
> >>
> >> Is there a a way of getting hold of those bits so I can avoid the
> >> wildcards?
> >
> > In theory the key part is the hash, all the other pieces are there just
> > to make human understandable filenames/layout (and would be encoded
> > into the hash in most cases). Whilst we could generate that info, I'm
> > not sure it would help much since the hashes should uniquely identify
> > the files?
> 
> Couldn't this to be done, similar to the fetchall task?

That's the sort of thing I was thinking of with my "all_populate_sysroot"
task in my original question.

But, I've a working script using Richard's method now. I'll share it once
I've tested it a bit more.

Mike.

