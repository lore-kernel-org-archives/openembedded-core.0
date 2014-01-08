Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1EAA86D1A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 23:58:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08NvpJq000660; Wed, 8 Jan 2014 23:57:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pDYPg6sqgX1t; Wed,  8 Jan 2014 23:57:51 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08NviQs000651
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 8 Jan 2014 23:57:46 GMT
Message-ID: <1389225459.19102.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 08 Jan 2014 23:57:39 +0000
In-Reply-To: <3583228.liS9SqzWlO@helios>
References: <52CC470A.9030302@linaro.org> <1759035.6JVm74GdRW@helios>
	<52CD9CAB.5020501@linaro.org> <3583228.liS9SqzWlO@helios>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Wed, 08 Jan 2014 23:58:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-08 at 23:21 +0000, Paul Eggleton wrote:
> On Wednesday 08 January 2014 13:44:59 Trevor Woerner wrote:
> > On 01/08/14 10:56, Paul Eggleton wrote:
> > > However, one concern I have always had with Qt being moved out of
> > > OE-Core though is that I very much doubt the same will happen with
> > > GTK+ and GNOME UI components that we carry, which I think will lead to
> > > the (perhaps erroneous, but logical) assumption in new users' minds
> > > that we support or recommend these more than we do Qt. Given Qt's
> > > popularity in the embedded space I don't think this would be the right
> > > message to be sending out. Any concrete ideas on how we would address
> > > this perception issue?
> > 
> > Would it be worthwhile to ask that the OE TSC take on the task of
> > defining what is "core" and what is not? Does this definition already exist?
> 
> If we can't come up with a consensus here, then yes. The trouble is one 
> person's idea of "core" is likely going to be very different to another's. If 
> your UI is written using Qt, that's going to be core to what you are doing. If 
> your UI is a custom one written using SDL you won't give two hoots about 
> recipes for building Qt/GTK+ and everything related. Where do you draw the 
> line?
> 
> Although it hasn't been rigorously defined since the beginning and there are 
> definitely some fuzzy edges, I think the selection of recipes in OE-Core has 
> worked reasonably well. We should stop from time to time to evaluate it, but 
> equally we should think carefully before we pull the whole thing to pieces.

Agreed. Its nice from a theoretical perspective to stand and say yes,
there should be all these layers. The reality is a lot of the stack has
fairly tangled and crossed up dependencies.

I'm much more interested to look at things and say "which are the mostly
commonly used pieces of software which a significant number of systems
would use"?

Not every system has a screen, not every system has networking etc. but
there is a common "core" OS which is used in most places and I think
OE-Core should be aiming to provide those basics.

LSB is one guideline we can use for reference of trends. Gut feeling and
experience are other factors that feed into this.

There are then other elements. I'm on record as strongly believing its
not enough to have a software stack, we need to test it too and that
having test capability in the core should be a key value. This isn't
something found traditionally in desktop Linux however it is key to what
we do and we therefore should differ here. (I should explain that by the
fact we allow so much customisation, being able to easily test the
output is important).

There is also another element which is one of the Yocto Project's
objectives. This is to focus people around creating a small number of
good tools rather than many all with some bad points. Its not
specifically an OE objective but OE-Core is a collaboration between OE
and the Yocto Project and I think it should be taken into account (and
is a good thing in general for embedded Linux in general too).

Piglit is interesting in that context since it would be nice to focus
around one way of testing GL rather than having many different ways. If
putting piglit into OE-Core helps that objective then I'm in favour for
that reason too.

So whilst its good to ask the questions, I do think what we have in
OE-Core is pretty good and I wouldn't like to hastily change what seems
to be working quite well at least from where I see it, particularly to
satisfy some "clean" separation idea which looks good on paper but is
less useful in the real world. Regardless of what we do, there are going
to be edge cases and at the end of the day someone has to make a call.
In the case of OE-Core that is ultimately down to me as the maintainer
and the TSC.

We've made choices to remove some things, we've also made decisions to
add others and this will continue and is healthy. With piglit, I'm
leaning more in favour the more I think about it. With meta-qt5 its
still marginal. The wishes of the existing meta-qt5 maintainers need to
be taken into account there too.

The TSC have discussed this before and to one extent or another these
points come up. I'm more than happy for others to add to the list or
correct the above but this is probably as good a description of the core
as you're going to get. Its simply not possible to avoid corner cases
and there always will be some grey areas. Personally I think there are
other things we need to spend time on beyond this.

Cheers,

Richard


