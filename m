Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4Bvb-0002fc-A8 for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 14:52:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SCmhwb028847
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 13:48:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28592-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 13:48:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SCmapw028841
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 13:48:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AANLkTi=NeEXCqdyiQWaxA=aU96-Osuj+gE-zGRwkPH6-@mail.gmail.com>
References: <20110327200802.GA23980@sakrah.homelinux.org>
	<AANLkTi=NeEXCqdyiQWaxA=aU96-Osuj+gE-zGRwkPH6-@mail.gmail.com>
Date: Mon, 28 Mar 2011 13:48:33 +0100
Message-ID: <1301316513.3018.192.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: DEPENDS tranlation with BBCLASSEXTEND
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
X-List-Received-Date: Mon, 28 Mar 2011 12:52:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-03-27 at 16:03 -0700, Chris Larson wrote:
> On Sun, Mar 27, 2011 at 1:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > I observed that if I have
> > DEPENDS = "a b" in recipe.bb which has BBCLASSEXTEND = "native"
> > then dependecies for recipe-native shows a-native b-native so far so
> > good
> >
> > Now if I want to add a dependency which only is needed for native recipe
> > I do
> >
> > DEPENDS_virtclass-native += "c-native"
> >
> > what this does is it will ignore a-native and b-native dependencies and
> > only adds "c-native" to depends of native recipe
> >
> > DEPENDS_virtclass-native_append = " c-native"
> >
> > This does what I wanted i.e. have deps on a-native b-native c-native
> >
> > I think behavior of += or _append should be similar. Is my understanding
> > correct ?
> 
> They've never been the same.  += is immediate, _append is delayed.  If
> a class, say, native.bbclass, defines the variable with ?=, and you
> used += before the inherit, then it will have a value, and the ?=
> won't assign.  I assume native.bbclass does it this way today so you
> can override the automatic behavior by defining the variable yourself,
> but I'll let Richard speak to that decision.

Thats the quick summary, yes. The DEPENDS variable is manipulated in
several different ways by the core and by .bb files and to coexist with
that, native.bbclass needs to play more games of its own. I recently
commented on that in another thread on this list.

I don't like the current situation, I'd like to simplify it and am open
to proposals on how we could do that as its too complicated at the
moment.

I would add that it does work though and the current situation using
BBCLASSEXTEND is a lot better than having many native .bb files IMO and
moves use closer to where we'd like to be.

Cheers,

Richard



