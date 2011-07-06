Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1QeWgw-00008p-8Y
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 20:19:18 +0200
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	(Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPA id 93960A6206D;
	Wed,  6 Jul 2011 19:15:27 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1309787936.20015.676.camel@rex>
References: <1309780493.20200.17.camel@desktop.home>
	<1309787936.20015.676.camel@rex>
Organization: Katalix Systems Ltd
Date: Wed, 06 Jul 2011 19:15:26 +0100
Message-ID: <1309976126.2875.15.camel@ce-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PROPOSAL] Package feature switches, redux.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: celston@katalix.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 06 Jul 2011 18:19:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-04 at 14:58 +0100, Richard Purdie wrote:
> On Mon, 2011-07-04 at 12:54 +0100, Chris Elston wrote:
> > Since responses to my previous mail were generally positive, I've
> > reworked the package feature switches so that the interface is as RP
> > suggested.
> > 
> > In the recipe for foo you would have a set of features defined like
> > this:
> > 
> > PACKAGE_CONFIG[bar] = "--enable-bar, --disable-bar, libbar"
> > PACKAGE_CONFIG[baz] = "--enable-baz, --disable-baz, libbaz"
> > 
> > The default set of features for the package would be defined with:
> > 
> > PACKAGE_FEATURES ?= "bar baz" 
> > 
> > Perhaps this set of features could go into a metadata field in the .ipk
> > - would this be helpful for feed users?
> > 
> > The package features can then be tailored in a config/layer with
> > something like:
> > 
> > PACKAGE_FEATURES_pn-foo = "baz pop"
> > 
> > If a layer requests a feature not supported by the recipe, you get a
> > warning (should help distro maintainers detect bitrot in their layer):
> > 
> > WARNING: foo: Unknown feature 'pop' requested
> > 
> > The patch below uses gstreamer as an example of something which would
> > benefit from this:
> 
> Looks good, thanks.
> 
> My main concern is still the PACKAGE_FEATURES variable. I've been
> meaning to reply to your original email about this.
> 
> I understand your issue that you want to be able to do this on a per
> package basis. I suspect you also see my concern about maintain this
> centrally as a distro decision primarily rather than letting things
> descend into more of a free for all.


> FWIW, even if done centrally using DISTRO_FEATURES, you can customise on
> a per recipe basis if you ever needed to, e.g.:
> 
> DISTRO_FEATURES = "a b c ${MYDISTROTWEAKS}"
> MYDISTROTWEAKS = "d e f"
> MYDISTROTWEAKS_pn-gstreamer = "e"
> 
> Now I'd agree this is a bit ugly but I think it would encourage less
> misuse of the variable.

> Any thoughts on that?

Apologies for the delay in this response.  For those not present, we
discussed this a little on IRC the other day, and I'd like to resurrect
the on-list discussion.

I don't really understand the way in which you're worried it could be
misused if implemented as PACKAGE_FEATURES.  I'd imagined that
PACKAGE_FEATURES would have it's canonical setting in the recipe itself,
and would only be overridden in private layers.  I accept that my lack
of understanding is probably due to my inexperience with OE :)

I'm hopeful that we could find a technical solution that you're happy
won't cause maintenance problems down the line.

Cheers,

Chris.



