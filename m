Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5YUY-0000zC-Vu for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 10:46:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7Q8YVHx004489;
	Sun, 26 Aug 2012 09:34:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03431-02; Sun, 26 Aug 2012 09:34:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7Q8YE39004483
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 26 Aug 2012 09:34:20 +0100
Message-ID: <1345970056.7252.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Aug 2012 09:34:16 +0100
In-Reply-To: <4D9F71D8-B4DC-4070-8FD4-E2605855880E@gmail.com>
References: <1345913213.14369.131.camel@ted>
	<CAMKF1sqsvRFa0iC0p4RCaCkQ+swt6E1YiSc5UYXEZT8tBN2FDw@mail.gmail.com>
	<1345928435.14369.137.camel@ted>
	<4D9F71D8-B4DC-4070-8FD4-E2605855880E@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Heads up: xxx-nativesdk -> nativesdk-xxx change
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
X-List-Received-Date: Sun, 26 Aug 2012 08:46:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-08-25 at 14:14 -0700, Khem Raj wrote:
> On Aug 25, 2012, at 2:00 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > On Sat, 2012-08-25 at 13:25 -0700, Khem Raj wrote:
> >> On Sat, Aug 25, 2012 at 9:46 AM, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >>> As was previous discussed on the list a while ago, we have a problem
> >>> with nativesdk where the code is getting complex and convoluted as its
> >>> simply not possible to automatically "extend" using a suffix.
> >>> 
> >>> Extension using a prefix works comparatively well be comparison as shown
> >>> by the multilib code. Its for this reason I'd like to switch the
> >>> meta-toolchain nativesdk recipes to become a prefix rather than a
> >>> suffix.
> >>> 
> >>> I'm going to propose some patches soon that do this. The patches are
> >>> fairly nasty to write and maintain so will need to merge fairly quickly.
> >>> 
> >>> If anyone does have a strong objection to this change, now is the time
> >>> to raise it. I'd prefer not to have to do this but having considered all
> >>> the options, its the best thing to do for the future and will result in
> >>> cleaner metadata (look at PKGSUFFIX in eglibc for an example of how
> >>> messy this gets).
> >> 
> >> I think we should then also remove prefixing others too for consistency
> >> 
> >> its hard enough to get the OE terminology to users for gcc and
> >> gcc-cross and gcc-crosssdk and so on and now we are creating an
> >> anomaly here. I am ok
> >> if call it cross-gcc and crosssdk-gcc and native-gcc and so on. That
> >> will make it consistent to prefix everything then
> > 
> > This is a cost/benefit thing. nativesdk is pretty crippled at the moment
> > by this, we can't easily extend it to several recipes without more
> > PKGSUFFIX nastiness and it will limit its functionality. We do already
> > have precedent with the multilibs.
> > 
> > On the plus side, nativesdk doesn't feature strongly in most OE user
> > experience, the documentation and its not massively engrained in the
> > code base.
> > 
> > Equally, you could change -cross as those recipes are corner cases,
> > there are not many of them.
> > 
> > For native things are *very* different. There is no PACKAGES problem
> > there, we actively want to keep the numbers of recipes low, there is a
> > higher volume of -native references in the documentation and the
> > userbase is exposed to the naming. There are many -native recipes in
> > other trees out there. So I'm afraid my view is that -native is simply
> > not worth the pain.
> > 
> > If we make an invasive change, I'm ok with that *if* we have good reason
> > for it. We have that with -nativesdk, we don't for -native IMO.
> > 
> 
> I am experiencing teaching new folks OE tricks and one day they might
> be OE contributors and believe me it does not help if we have
> inconstancies, its hard enough and this doesn't make it easier.
> 
> Since multilib is something not of interest it hasn't appeared so
> strongly in my case however it was easy to say you extend recipes and
> by appending to their name its easier to change to prepend but some
> append some prepend I don't know personally I know it enough that I
> can deal with it but for new folks its another
> thing to learn.

I might also have some experience of showing people the system ;-).

Whilst I understand the point, I think there are other areas that time
could be spent that would benefit people more than the naming of the
native recipes.

The native recipe change would be extremely invasive and effectively
require a flag day where everyone changes every layer. We lose our
compatibility and layer interoperability story and we cause a big
headache for anyone working with this from a commercial perspective too.

Its ok to require some changes for the right reasons but do this too
often or for the wrong reasons and we'll seriously upset users and
suffer as a project as a result. Its very easy to decide to make some
change to "improve" things but the implications need to be thought
through and accounted for.

FWIW, I think we did a bad job with the gcc-intermediate change. In
hindsight I think we should have changed the gcc-cross-initial include
name in master, allowing backwards compatibility. The intermediate
include could have then been moved to the toolchain layer, removing the
need for a flag day for every eglibc/gcc out there. I'm saying this not
to pick on anyone, I'm as guilty as anyone for merging the change. I do
want to illustrate we're thinking about the issues people hit and how to
better in future though.

Cheers,

Richard







