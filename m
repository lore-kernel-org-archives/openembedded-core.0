Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgBKc-0004YV-4q for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 10:31:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB59HSTG015592;
	Wed, 5 Dec 2012 09:17:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12860-10; Wed,  5 Dec 2012 09:17:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB59HIwo015585
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Dec 2012 09:17:20 GMT
Message-ID: <1354699028.25268.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 05 Dec 2012 09:17:08 +0000
In-Reply-To: <50BEA7A8.2070600@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
	<13c1d96727b678dc95430f1144b3017c9e62948f.1354641032.git.mark.hatle@windriver.com>
	<20121204170432.GH14870@jama.jama.net> <50BE342E.1070401@windriver.com>
	<1354654017.25268.65.camel@ted> <50BEA7A8.2070600@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/22] update-alternatives.bbclass: Add missing runtime dependency
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
X-List-Received-Date: Wed, 05 Dec 2012 09:31:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-04 at 19:47 -0600, Mark Hatle wrote:
> On 12/4/12 2:46 PM, Richard Purdie wrote:
> > On Tue, 2012-12-04 at 11:34 -0600, Mark Hatle wrote:
> > I keep telling people this and people keep ignoring me.
> >
> > We DO NOT SUPPORT switching providers at runtime since its a package
> > manager specific problem for which we currently have no general
> > abstraction.
> 
> We do support switching providers already, that's the whole alternatives system 
> itself.  What is different is in this case we can't use the update-alternatives.

We do support update alternatives, yes. We're talking about something
else here though.

> But with the RPROVIDE of update-alternatives within the dpkg and opkg code..  We 
> can certainly require 'update-alterantives' and the packaging systems will do 
> the right thing (they have so far...)

Ok, let me put this a different way. What exactly tells tells the
package manager what it should be installing as "update-alternatives"?
Where is the variable that controls this?

I think you will find there isn't any mechanism for it. The only reason
it does the right thing is a combination of:

a) We've configured things to only build one provider in most cases
b) We use the VIRTUAL-RUNTIME_update-alternatives substitution that 
   Martin mentions.

> > This leads to patches like:
> >
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=fe21ace36e19e06cbfdb83f73e60623bd4e382af
> >
> > since the virtual/ space does not somehow magically work at runtime,
> > worse it breaks the deb package backend.
> 
> It works in RPM... but if it doesn't in deb (and ipk) I understand the 
> limitations we are bound to.  Limiting the character space (i.e. no '/') is 
> different then saying we don't support RPROVIDES...

We support RPROVIDES, no argument. What we don't have is any mechanism
to indicate to *any* of the package managers that if there are two
providers, which one should be preferred.

The character was just a detail, the whole approach was also flawed, at
least as the system stands today :(.

> > PREFERRED_PROVIDER is a build time thing. virtual/ is a build time
> > thing. How do I explain this any clearer?
> 
> I'm still confused on the PREFERRED_PROVIDER honestly.

That much is clear from the email :/. It only works for build time
resolution, not package management.

> conf/distro/include/default-providers.inc:PREFERRED_PROVIDER_virtual/update-alternatives 
> ?= "update-alternatives-cworth"
> conf/distro/include/default-providers.inc:PREFERRED_PROVIDER_virtual/update-alternatives-native 
> ?= "opkg-native"
> 
> There is no 'update-alternatives-cworth' recipe.. but there is an opkg recipe 
> that happens to provide an update-alternatives-cworth -package-.  So does 
> PREFERRED_PROVIDER select packages or recipes?

It works in "build" namespace, namely DEPENDS and PROVIDES, so recipes.

Recipes can have additional PROVIDES other than their name, not to be
confused with RPROVIDES which is package namespace and separate.

We have no support for PREFERRED_RPROVIDER for example since that would
have to get communicated to the package manager. It would be interesting
to see that work...

> > The only mechanism for distro selection of runtime is VIRTUAL-RUNTIME_
> > which is pretty horrible and likely would be better done with something
> > debian package renaming like since we already have that mangling code.
> 
> And the VIRTUAL-RUNTIME isn't a runtime selection, it's a build-time selection. 

I realise that. As I said earlier, we don't support runtime selection
and we allow distro selection of some things (at build time) using this
rather ugly mechanism. I'd love to have something neater but its hard to
interface that into all the packaging backends.

>   If we need to select this at build-time, we can.

Rightly or wrongly, we need to.

>   I'm happy with changing the 
> patch, but as a distribution person I really don't care who provides this as 
> long as something does.

We care about deterministic builds so we have to care about details like
this.

Cheers,

Richard



