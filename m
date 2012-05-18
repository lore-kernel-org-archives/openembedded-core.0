Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SVGn7-0005fa-4k for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 08:35:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4I6Ps2Q001972
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 07:25:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32471-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 07:25:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4I6PiKe001966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 07:25:47 +0100
Message-ID: <1337322343.7473.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2012 07:25:43 +0100
In-Reply-To: <CABcZANnXuL8O6Kh0vKh4Puy0NSzt8r7ee5vr=_OkaWQGV6=C3g@mail.gmail.com>
References: <20120515140110.2ba5a1be@wrlaptop>
	<CAKSdS8K64oTpq4asBcL9k4BgCe6BOEAwX3exQyq4GoTHtAxW9w@mail.gmail.com>
	<4FB32EA1.3060601@linux.intel.com> <20120516115848.4348b984@wrlaptop>
	<CABcZANnXuL8O6Kh0vKh4Puy0NSzt8r7ee5vr=_OkaWQGV6=C3g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: FOO_subtract, the logical antidote to FOO_append.
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
X-List-Received-Date: Fri, 18 May 2012 06:35:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 21:18 -0700, Chris Larson wrote:
> On Wed, May 16, 2012 at 9:58 AM, Peter Seebach
> <peter.seebach@windriver.com> wrote:
> > On Wed, 16 May 2012 07:35:45 +0300
> > Saul Wold <sgw@linux.intel.com> wrote:
> >
> >> My understanding is that a _subtract is fraught with danger, there
> >> all sorts of ordering implications.
> >
> > Yes.
> >
> > But consider, if you will, the specific case of
> > DISTRO_FEATURES_LIBC_DEFAULT, and a libc which is just like eglibc
> > except that it lacks RPC.
> >
> > Anything I do that isn't processed at the tail end of everything,
> > around the point where _appends are processed, will be unable to
> > cleanly obtain "the value that would have been set by default if
> > nothing else happened", and then remove a word from it.  I can't set a
> > value in advance, because if I do the ?= won't fire and none of those
> > words will get set.  I can't necessarily set a value later.
> >
> > Overrides won't work either, because overrides also destroy the
> > existing values.
> >
> > It seems to me that for a subtraction to work, it *must* be the very
> > last thing done.
> >
> > Basically, the purpose of suggesting this as a formal behavior defined
> > to be The Very Last Thing is to minimize the complexity of the ordering
> > implications.  You get exactly what you would have gotten otherwise,
> > with these words removed.
> 
> I agree. I think this is the only sane option for implementing this
> given bitbake's current behavior. Clearly a -= would be extremely
> problematic, and would have clear complications with variable
> expansion, as we discussed on IRC. I'd be interested in seeing a
> prototype implementation of this, to experiment with it and see how
> viable it is.

The _subtract or _remove format of this might be a viable way of adding
this functionality. "-=" is the one I'd prefer to avoid as it will end
up confusing people which is why we've all effectively been against it
but the _xxxx syntax does match the behaviour/ordering of _append and
_prepend and hence could be added with less confusion.

So yes, I think this could be the best way to address some of these
cases. It has always bugged me that its near impossible to counteract an
_append other than with an override.

I also agree we should audit the system and change to ??= where it makes
sense which will reduce the need for this.

Cheers,

Richard



