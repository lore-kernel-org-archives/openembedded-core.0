Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1Qcb0L-0007Pp-4M
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 12:31:21 +0200
Received: from [192.168.1.100] (188-220-141-241.zone11.bethere.co.uk
	[188.220.141.241])
	(using SSLv3 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPSA id 806E3A6206F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 11:27:36 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309472051.20015.465.camel@rex>
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
Date: Fri, 01 Jul 2011 11:27:35 +0100
Message-Id: <1309516055.7987.123.camel@desktop.home>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 (2.26.3-1.fc11) 
Subject: Re: Proposal: recipe feature switches
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
X-List-Received-Date: Fri, 01 Jul 2011 10:31:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> > I'm proposing something along the lines of the following:
> 
> This is actually along the lines of what I've been thinking too!

Cool, I'm glad I'm not alone on this one :)

> How about something like the syntax for the recipe:
> 
> PACKAGECONFIG[ogg] = "--enable-ogg, --disable-ogg, libogg"
> PACKAGECONFIG[vorbis] = "--enable-vorbis, --disable-vorbis, libvorbis"
> PACKAGECONFIG[theora] = "--enable-theora, --disable-theora, libtheora"
> 
> and then in base.bbclass we can simply:
> 
> for flag in (d.getVarFlags("PACKAGECONFIG") or {}):
>     <manipulate DEPENDS/EXTRA_OECONF>

This is much neater than having to have an anonymous function in the
recipe to call oe_package_feature_switch.

> I'm also strongly tempted to tie this into the DISTRO_FEATURES variable
> instead of individual PACKAGE_FEATURES variables to make it clear how
> this is intended to be used.

I'd imagined that there were some cases which weren't covered by things
implemented as DISTRO_FEATURES.  To stick with the gstreamer example -
it's possible that the distribution might have a feature, but you don't
want gstreamer plugin support for that feature.  For example if the
distro needs 'theora', but you don't want the gstreamer theora plugin
building.  When you're trying to slim your embedded platform down, these
things can really make a difference.  It makes sense to me to provide
consistent and intuitive ways to do this, otherwise people building
platforms on oe-core end up with fragile hacks in their own layers that
break when you pull a later oe-core.

Some worthwhile configuration can't be expressed in terms of high-level
distro features (i.e.: usb, bluetooth, alsa etc...).  What about "I want
SSL support, but NOT in library foo".  That case can't be covered by
distro feature 'ssl'.

> If we do this, we are going to need to exercise some measure of control
> as someone is going to want an enable/disable option for every config
> option for every package. How do we decide which make sense and which
> don't?

How could we tell what oe users are likely to want to configure?

> Note that the more options you have, the more combinations there are to
> test and the less testing the system likely gets. I would therefore like
> to see some kind of natural pressure to only add very useful
> DISTRO_FEATURES. Maybe a criteria like it affecting 5 or more recipes?

Agreed - this is where the default set of package features comes in.  If
you're not using the default set of features specified by oe-core, then
you're on your own (similar to using a tainted kernel).  This doesn't
seem like a reason to prevent configuration.

Embedded developers are going to need to configure packages for their
own application, if we provide an interface to do it, then that has to
be better than everyone inventing their own methods.  It would even be
possible to implement something which detects that a layer is adding
non-standard package config, and warn about it (perhaps in the sanity
check?).

Cheers,

Chris.



