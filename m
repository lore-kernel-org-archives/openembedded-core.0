Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QK5TA-0005mf-OY for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 11:12:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4B99oVB017359
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:09:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17057-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:09:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4B99ili017353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:09:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CD6AE1D1-3C36-4269-B773-14C648F63736@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<6a6f3589dba7aff0cb89f233807e5d051d8d3e08.1305035617.git.richard.purdie@linuxfoundation.org>
	<CD6AE1D1-3C36-4269-B773-14C648F63736@dominion.thruhere.net>
Date: Wed, 11 May 2011 10:09:39 +0100
Message-ID: <1305104979.30391.310.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/6] bitbake.conf: Include the new default-providers.inc and default-versions.inc files
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
X-List-Received-Date: Wed, 11 May 2011 09:12:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 16:20 +0200, Koen Kooi wrote:
> Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende geschreven:
> 
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > These are the minimal defaults to allow OE-Core to function standalone with
> > no distro set and are constucted such that the distro can either override values,
> > or totally replace the include file entirely as needed.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > meta/conf/bitbake.conf                            |    3 +
> > meta/conf/distro/include/default-providers.inc    |   34 ++++++++++++
> > meta/conf/distro/include/default-versions.inc     |   18 ++++++
> > meta/conf/distro/include/poky-fixed-revisions.inc |   27 ---------
> > meta/conf/distro/poky.conf                        |   59 +--------------------
> > 5 files changed, 56 insertions(+), 85 deletions(-)
> > create mode 100644 meta/conf/distro/include/default-providers.inc
> > create mode 100644 meta/conf/distro/include/default-versions.inc
> > delete mode 100644 meta/conf/distro/include/poky-fixed-revisions.inc
> > 
> 
> > diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> > new file mode 100644
> > index 0000000..d51ac64
> > --- /dev/null
> > +++ b/meta/conf/distro/include/default-providers.inc
> > @@ -0,0 +1,34 @@
> > 
> > +PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
> 
> the dbus port has long been merged upstream, so proper gconf would be
> a better choice. We could ignore it and just use dconf in meta-gnome,
> though ;)

I agree we should be using gconf, could someone send me the recipe
though? ;-).

> > +PREFERRED_PROVIDER_opkg ?= "opkg"
> 
> We should sync with OE and drop the ssl/gpg stuff noone seems to be
> using.

You mean disable ssl/gpg in all cases?

> > diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
> > new file mode 100644
> > index 0000000..0abbd8f
> > --- /dev/null
> > +++ b/meta/conf/distro/include/default-versions.inc
> > @@ -0,0 +1,18 @@
> > +#
> > +# Default preferred versions
> > +#
> > +PULSEAUDIOVERSION ?= "0.9.22"
> > +PULSEAUDIOVERSION_arm ?= "0.9.15"
> > +PREFERRED_VERSION_pulseaudio ?= "${PULSEAUDIOVERSION}
> 
> AIUI 0.9.15 is the last version that doesn't need atomic ops. In OE we
> backported the necessary bits to gcc 4.3.x, gcc 4.5.x already has
> them. So lets drop the _arm override or atleast document why.

If we don't need 0.9.15, lets get rid of it...

> > +# Force the python versions in one place
> > +PYTHON_BASEVERSION ?= "2.6"
> > +PREFERRED_VERSION_python ?= "2.6.6"
> > +PREFERRED_VERSION_python-native ?= "2.6.6"
> 
> Not really related, but update to 2.7.x?

Sure. Patches welcome :)

Just to be clear, these are a reflection of what is in OECore today.
These things are good imrovements and  I'm more than happy to change or
remove these entries as needed but they're all further standalone
changes in their own right so I'm not going to hold the patch series on
them.

Cheers,

Richard



