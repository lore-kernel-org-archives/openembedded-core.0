Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ROIL9-0006wy-03 for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 01:17:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAA0Bh06021784
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:11:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20086-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:11:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAA0BaeP021778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:11:36 GMT
Message-ID: <1320883898.10843.250.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 00:11:38 +0000
In-Reply-To: <CABcZAN=GPiw7nXaVxp4WQMy9Uwr38M_G2H2XjXzabZhfyU0=mw@mail.gmail.com>
References: <1320839575.10843.165.camel@ted> <4EBA9534.1010107@linux.intel.com>
	<CABcZAN=GPiw7nXaVxp4WQMy9Uwr38M_G2H2XjXzabZhfyU0=mw@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bb.data.*Var -> d.*Var conversion
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
X-List-Received-Date: Thu, 10 Nov 2011 00:17:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-09 at 08:24 -0700, Chris Larson wrote:
> On Wed, Nov 9, 2011 at 7:59 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> > Hi Richard,
> >
> > On 11/09/2011 03:52 AM, Richard Purdie wrote:
> >> I'm tempted to run the following over the metata to convert the
> >> bb.data.*Var(...,d) and similar expressions to the form d.*Var(...).
> >
> > Oh yes please!
> >
> >>
> >> Why? We get a lot of people doing copy, paste and edit of the code and
> >> this way, we'll increase the chances of them finding better examples.
> >>
> >> I'm still looking at the diff this generates to see if there are any
> >> more corner cases I need to tweak the expression for but feedback
> >> welcome.
> >>
> >> sed \
> >> -e 's:bb.data.\(setVar([^,]*,[^,]*\), \([^ )]*\) *):\2.\1):g' \
> >
> > Be sure to escape your periods, they are single character wildcards.
> > It's unlikely you'll match something else, but better safe than sorry.

Right, I've not noticed it doing anything nasty but I understand the
concern.

> >> -e 's:bb.data.\(setVarFlag([^,]*,[^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
> >> -e 's:bb.data.\(getVar([^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
> >> -e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
> >> -e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
> >> -e 's:bb.data.\(getVar([^,]*\), \([^) ]*\) *):\2.\1):g' \
> >> -i `grep -ril bb.data *`
> >
> > Why ignore case?

Accidentally left in from something else I borrowed it from. Its
harmless.

> > I suggest running the grep first redirected to the file, then editing
> > the contents to ensure you don't get things like CHANGELOG and probably
> > be careful with the Documentation.

Well, we'd probably want to update those references too. I checked the
resulting diff and it didn't find anything like that though.

> > The groups look sane to me.
> >
> > The only other thing I'd make sure to try and watch (not necessarily
> > handle) are multi-line bb.data.[sg]et(Flag)? calls. I suspect there are
> > few enough of them, if any, that they could be managed by hand.

I was careful not to make this replacement too aggressive. Its currently
ignoring anything multiline and anything where there are expressions
within expressions. There are much less of those and can be handled
either manually or a more targeted expression.

I also want to change:

d.getVar(x, 1) -> d.getVar(x, True)

but that is something for a follow up too.

> Heh, too bad bitbake doesn't know how to emit metadata back out from
> its ast. This seems like it'd be an ideal case for writing a custom
> 2to3 fixer rather than using sed. It would catch the multi-line case
> you mention, since it lets you specify grammatical patterns against
> the python parse tree and do transforms against it.

Indeed, if only I had more time...

Cheers,

Richard



