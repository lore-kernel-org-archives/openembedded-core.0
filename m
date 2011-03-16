Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Pzqms-0000Bw-BD for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 14:29:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GDRZME002659
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:27:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02452-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:27:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GDRQix002653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:27:27 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D7FA2DB.1010605@mentor.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-4-git-send-email-raj.khem@gmail.com>
	<AANLkTiks0VSWcW4_54mQUv17ZQvb8+CsbWcsDkA_9ZA+@mail.gmail.com>
	<1299610396.602.104.camel@rex>
	<AANLkTim62_Vb=EumqASMY_ARCJkS8M7rTAUtpxnMR6gx@mail.gmail.com>
	<1299934200.1445.3023.camel@rex> <4D7E473E.6010800@mentor.com>
	<1300132473.30423.496.camel@rex>  <4D7FA2DB.1010605@mentor.com>
Date: Wed, 16 Mar 2011 13:27:16 +0000
Message-ID: <1300282036.30423.1873.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv3 3/6] gcc: Statically link in support libraries e.g. libmpfr libgmp etc.
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
X-List-Received-Date: Wed, 16 Mar 2011 13:29:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 10:33 -0700, Tom Rini wrote:
> On 03/14/2011 12:54 PM, Richard Purdie wrote:
> > On Mon, 2011-03-14 at 09:50 -0700, Tom Rini wrote:
> >> On 03/12/2011 05:50 AM, Richard Purdie wrote:
> >>> On Tue, 2011-03-08 at 11:04 -0800, Khem Raj wrote:
> >>>> On Tue, Mar 8, 2011 at 10:53 AM, Richard Purdie
> >>>> <richard.purdie@linuxfoundation.org>   wrote:
> >>>>> On Mon, 2011-03-07 at 22:38 -0800, Khem Raj wrote:
> >>>>>> ping any opinion on this patch ?
> >>>>>
> >>>>> This change looks rather hacky and I'd really like to understand more
> >>>>> about why this is needed and whether there is a better way we could
> >>>>> ensure the right flags get passed around. Can you provide more details
> >>>>> about whats going on with this. Obviously this change as it stands isn't
> >>>>> acceptable to upstream gcc and I'd like to see if we could find one that
> >>>>> was.
> >>>>
> >>>> this is because the supporting libraries like mpc mpfr that are needed
> >>>> by gcc itself to run
> >>>> we might have different versions of these libraries. So depending upon
> >>>> shared objects
> >>>> would mean we need to find same shared objects where say the SDK is installed
> >>>> so either we ship the whole baggage or we link it in statically. This
> >>>> patch makes those libs to
> >>>> linked in statically and cross gcc wont have dependencies on these
> >>>> libs anymore so
> >>>> it can run on all hosts pretty much.
> >>>
> >>> If you look at the way the SDK toolchain works in Poky, it automatically
> >>> ships the versions of these libraries that it needs so we don't actually
> >>> have this problem.
> >>>
> >>> Also, looking at the patch again, was the first LDFLAGS change meant to
> >>> be in there, is that related or different to the shared/static
> >>> mpfr/mpc/gmp issue?
> >>
> >> I think it's time for someone to build one at dig at it, but are you
> >> sure they're used and shipped and not just used?  That was a problem
> >> before and unless the exported bits are using a relative $ORIGIN in the
> >> link path (or we've broken relocatability, which would be another
> >> problem) there's problems today.
> >
> > They are used and shipped. As evidence I submit:
> >
> > http://autobuilder.yoctoproject.org/nightly/20110311-1/toolchain/x86_64/poky-lsb-eglibc-x86_64-i586-toolchain-gmae-0.9+snapshot-20110313.tar.bz2
> 
> Is 
> /opt/poky-lsb/0.9+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/i586-poky-linux/i586-poky-linux-gcc 
> the runs on host targets the target cross compiler the user should use 
> now?  If so, you don't have relocation as the RPATH is hard-coded not 
> $ORIGIN based.  If not, can I have a pointer to the right gcc to poke 
> at?  Thanks :)

Hmm, this sounds like something is not working with the relocation. I
could have sworn we'd made that relocatable :/.

It shouldn't be hard to fix with the relocation class at least...

I hope we at least agree it does find the right libraries to link
against which is most of the problem solved :)

Cheers,

Richard





