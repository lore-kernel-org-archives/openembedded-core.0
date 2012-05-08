Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRjlr-0007m8-GY for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 14:44:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48CYB0W002735
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 13:34:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16654-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 13:34:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48CXvv3002721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 13:33:58 +0100
Message-ID: <1336480442.25084.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 May 2012 13:34:02 +0100
In-Reply-To: <4FA6B6AC.60301@palm.com>
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
	<1335999994.30113.39.camel@ted> <4FA6B6AC.60301@palm.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: SetScene tasks hang forever?
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
X-List-Received-Date: Tue, 08 May 2012 12:44:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-05-06 at 10:36 -0700, Rich Pixley wrote:
> On 5/2/12 16:06 , Richard Purdie wrote:
> > On Wed, 2012-05-02 at 14:48 -0500, Mark Hatle wrote:
> >> On 5/2/12 2:45 PM, Rich Pixley wrote:
> > What would really help is a way to reproduce this...
> >
> > Does it reproduce with a certain set of metadata/sstate perhaps?
> >
> > What is odd about the above logs is that it appears bitbake never
> > executes any task. Its possible something might have crashed somewhere I
> > guess and not realise part of the system had died. Or it could be some
> > kind of circular dependency loop where X needs Y to build and Y needs X
> > so nothing happens. We are supposed to spot and error if that would have
> > happened.
> >
> > Does strace give an idea of which bits of bitbake are alive/looping? I'd
> > probably resort to a few print()/bb.error() in the code at this point to
> > find out what is alive, what is dead and where its looping...
> I have more info now.
> 
> What I suspected was looping, (since it took longer than the ~1hr I was 
> willing to wait), isn't actual looping.  Given enough time, the builds 
> do complete and I have comparable results on 5 different servers, (all 
> ubuntu-12.04 amd64 and all on btrfs).
> 
> My initial, full builds of core-image-minimal do build, and they build 
> in ~60min, (~30min if I hand seed the downloads directory).  I'm using 
> no mirrors other than the defaults.  My second build in an already built 
> directory, (expected to do nothing), takes anywhere from 7 - 10.5hrs to 
> complete and successfully do nothing, depending on the server.
> 
> During this time, top shows a single cpu pinned at 98 - 100% 
> utilization, and strace shows literally millions of access and stat 
> calls on stamp files, mkdir on the stamps directory, etc.  Statistical 
> analysis of just the do_fetch access calls shows a distribution that 
> seems to mimic the topological tree.  That is, the most called access is 
> for quilt-native and the components higher up the tree get fewer stats.
> 
> Oh, and the setscene stamps are all nonexistent.  I presume that's expected.
> 
> First, I can't imagine why there would need to be more than one mkdir on 
> the stamps directory within a single instantiation of bitbake.  I can 
> imagine that it was easier to attempt to mkdir it than to check first, 
> but once it has been mkdir'd, (or checked), there's no need to do it 
> another million times, is there?
> 
> Second, I can't imagine why there would need to be all the redundant 
> stamp checking.  That info is cached internally, isn't it?
> 
> And third, the fact that it seems to be checking the entire subtree what 
> appear to be multiple times at every node suggests to me that the 
> checking algorithm is broken.  Back of the envelope... perhaps 300 
> components, maybe 10 tasks per component ~= 3e3 tasks.  Figure a 
> geometric explosion of checks for an inefficient algorithm and we're up 
> to around 10e6 checks.  I haven't counted an entire run, but based on 
> the time it takes to run, I'd say I'm seeing one, maybe two orders of 
> magnitude more checks than that.  I've seen a few million node 
> traversals in about 15min and a node traversal appears to involve 
> several accesses and at least one stat.
> 
> I'm not familiar with the current bitbake internals so my next thought 
> would be to replace the calls to access, stat, and mkdir on the stamp 
> files with caching, counting calls.  Build a dictionary of each file 
> called, if it's new, do the kernel call and cache the result in the 
> dictionary.  If it's already in the dictionary, then inc a counter for 
> it and return the cached value.  This should a) improve the speed of the 
> current algorithm, b) improve the speed of the eventual replacement 
> algorithm, and c) give us some useful statistical data in the mean time.
> 
> I'm also going to try reformating one of the systems and compare how 
> long a build on ext4 takes.
> 
> Any other ideas?

Well, this clearly doesn't happen with master or in any combination of
the layers most users are using. The logical conclusion would be that
there is something in your layer that is somehow triggering this.

Of course since that layer is secret and you can't show us it, we have a
bit of a problem. Can you reproduce the bug against public code?

Are you by any chance setting BB_STAMP_POLICY somewhere?

Cheers,

Richard







