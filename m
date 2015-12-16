Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 472BE7317E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 13:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBGDWf16021253; Wed, 16 Dec 2015 13:33:58 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sl5asWbXFgJo; Wed, 16 Dec 2015 13:33:58 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBGDXu8a021329
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 16 Dec 2015 13:33:57 GMT
Message-ID: <1450272836.13505.124.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 16 Dec 2015 13:33:56 +0000
In-Reply-To: <567164AF.1040405@topic.nl>
References: <5671310A.1000000@topic.nl>
	<1450269344.13505.113.camel@linuxfoundation.org>
	<567164AF.1040405@topic.nl>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: How to move a recipe to another directory without invalidating its sstate-cache?
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
X-List-Received-Date: Wed, 16 Dec 2015 13:34:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-12-16 at 14:18 +0100, Mike Looijmans wrote:
> ﻿On 16-12-15 13:35, Richard Purdie wrote:
> > On Wed, 2015-12-16 at 10:38 +0100, Mike Looijmans wrote:
> > > ﻿I renamed "recipes-some/foo/bar.bb" to "recipes
> > > -some/buzz/bar.bb"
> > > 
> > > Rebuilding bar and its dependencies will take about 16 hours. So
> > > I
> > > don't want
> > > to trigger a rebuild.
> > > 
> > > running "bitbake -S printdiff bar" only reveils this:
> > 
> > I'm not sure I trust the output of -S printdiff, there are some
> > cases
> > it doesn't seem to "guess" right. I wish I or someone one could fix
> > but
> > but we can do its work manually. Can you try something like:
> > 
> > set TMPDIR = "x"
> > bitbake -S bar
> > rename the recipe
> > set TMPDIR = "y"
> > bitbake -S bar
> 
> Found out I need an extra "none" in here:
> bitbake -S none bar

Sorry, yes.

> > then
> > 
> > "ls tmp-x/stamps/xxxx/bar"
> > "ls tmp-y/stamps/xxxx/bar"
> > 
> > and see which tasks change signature. Then run:
> > 
> > "bitbake-diffsigs <sig A> <sig B>"
> > 
> > and see if that makes more sense?
> 
> That gave the same output. Everything after "runtaskdeps" is bogus
> because its 
> value changes from [blahblah, foobar] into [buzbar, blahblah] and now
> diffsig 
> seems to attempt to match the "blahblah" signatures against those of
> "buzbar".
> 
> Which sort of hints that if my new name starts with an "f" the
> reordering 
> won't happen, so I'm gonna try renaming to "fbuz" now,,,

I still suspect this might be the way the tool displays the data rather
than the real problem as there is some fuzziness in the data that code
has to work with. Bitbake just knows there are dependencies on hashes
X, Y, Z and it has to try and guess how to match them up. The paths are
included to help reduce fuzz but are only used by the analysis code,
not the checksum creation.

Did the hashes themselves change or just the paths? I'm wondering if
the order that bitbake adds the checksums to the main checksum may have
some bearing on this...

Being able to see some real data would also help. Does this reproduce
with a public recipe I can see the real data for?

Cheers,

Richard


