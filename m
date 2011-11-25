Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTwIz-0000Ae-G1 for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 14:59:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPDqQbs005694;
	Fri, 25 Nov 2011 13:52:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05426-01; Fri, 25 Nov 2011 13:52:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPDqI7U005687
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Nov 2011 13:52:19 GMT
Message-ID: <1322229145.10928.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 13:52:25 +0000
In-Reply-To: <B216D4A1-D3C8-4C0A-835C-A7509C350CDB@dominion.thruhere.net>
References: <1812495.zPKFoIJV0g@helios>
	<B216D4A1-D3C8-4C0A-835C-A7509C350CDB@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Image history (testlab)
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
X-List-Received-Date: Fri, 25 Nov 2011 13:59:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-25 at 14:17 +0100, Koen Kooi wrote:
> Op 25 nov. 2011, om 12:44 heeft Paul Eggleton het volgende geschreven:
> > Hi Koen / Beth / all,
> > 
> > Following on from my work extending packagehistory (which is still under 
> > review), I'm looking at tracking history of the content of images so we can 
> > get warnings about regressions. Thanks to Koen we've had this capability via 
> > testlab.bbclass in OE for some time now, and from there into meta-oe, but what 
> > I'd like to do now is bring this into OE-core and extend it so that it 
> > supports rpm (or even better, all of the package backends we support.) This 
> > could involve abstracting the package backend functionality out into 
> > rootfs_*.bbclass.
> > 
> > It also looks like testlab.bbclass in meta-oe has some license dumping 
> > functionality. Beth, does that mesh with what you've been working on / 
> > preparing for Yocto 1.2?
> > 
> > Thoughts?
> 
> Don't forget its integration into remote git: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/?h=yocto 
> I must admit that it completely sucks when you have >1 builder, but that is fixable. There are a number of other things we need to store somewhere (e.g. package history, PR config, etc), so coming up with a plan to store all that in a single repo would be good.
> 
> The are a few issues with its current output:
> 
> * License info uses the filename instead of the package name (f'oo_1.2.3_arch.ipk' vs 'foo') which leads to too much changes with small version bumps
> * Dependencies are not sorted intelligently, so sometimes you get diffs which don't contain any actual change, just ordering junk,
> * It only reports oe-core rev, not layer revisions, config and shortlog. Ideally it would output something like:
> 
> meta: angstrom-staging:b3ffd40a4a1eacab90dac26df8a4a047486f3b96 pulseaudio: update to 1.1, delete 0.9.x
> meta-oe: master:7019fbb50796fedcedef6ff92981a7f26659a251 mplayer: fix build with -Wl,-as-needed 
> meta-efl:
> meta-gnome:
> meta-xfce:
> meta-angstrom master:bc72e71ccf7e79cdc8246e0ae0dbe62d11355263 angstrom-2010-preferred-versions.inc : Stop pinning python-cairo
> 
> Taking this a step further: it's output should be able to get passed into layer tooling (combo-layer to yocto people, setup-scripts for angstrom people) to reproduce builds.

So the real question is one of the approach. We have several options and
its related to how compatible we want/need to be.

Do we import testlab from meta-oe as is, then add patches (multiple
package backend support and so on)? How compatible do we need to be? I'm
conscious its something being actively used.

Do we enhance packagehistory reusing code from testlab as appropriate?

Do we start something new as a hybrid of the two? (shouldn't be needed
as I'm prepared to say packagehistory can radically change as needed, I
don't care about compatibility there).

At the end of this I want to have one great "history" tracking mechanism
for finding regressions covering testlab's functionality, package
history and more.

Just to be clear I don't want to reinvent the wheel :).

Cheers,

Richard





