Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqNmo-0002q1-Dy for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 12:46:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QBcmDY021864;
	Thu, 26 Jan 2012 11:38:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21514-04; Thu, 26 Jan 2012 11:38:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QBcfn4021856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Jan 2012 11:38:42 GMT
Message-ID: <1327577923.19643.352.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 11:38:43 +0000
In-Reply-To: <1494171.ziDK2I0A7F@helios>
References: <CACW_hTb9UZACKZ+acn2jp-PZzrk1YkbmohyFxoi2deJdRvJpKw@mail.gmail.com>
	<1494171.ziDK2I0A7F@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: Re: should recipes be distro agnostic?
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
X-List-Received-Date: Thu, 26 Jan 2012 11:46:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-26 at 11:31 +0000, Paul Eggleton wrote:
> On Thursday 26 January 2012 07:52:22 Frans Meulenbroeks wrote:
> > By coincidence I bumped into this in oe-core:
> > 
> > ./meta/recipes-devtools/apt/apt.inc:EXTRA_OECONF_append_angstrom = "
> > ac_cv_glibc_ver=libc6.4"
> > 
> > That also triggered me to do this:
> > 
> > frans@frans-desktop:~/workspace/openembedded-core$ grep -r _poky .
> > ./meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb:DEPENDS_append_poky = "
> > libowl"
> > ./meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb:SRC_URI_append_poky = "
> > file://owl-window-menu.patch"
> > ./meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:DEPENDS_append_poky = "
> > libowl"
> > ./meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += "
> > file://owl-menu.patch;apply=yes "
> > ./meta/recipes-sato/pimlico/dates.inc:OWL_poky = "--enable-owl
> > --disable-dnd"
> > ./meta/recipes-sato/pimlico/dates.inc:DEPENDS_append_poky = " libowl"
> > ./meta/recipes-sato/pimlico/dates.inc:SRC_URI_append_poky = "
> > file://dates-owl-window-menu.patch;apply=yes "
> > ./meta/recipes-sato/pimlico/tasks_0.19.bb:OWL_poky = "--with-owl"
> > ./meta/recipes-sato/pimlico/contacts.inc:DEPENDS_append_poky = " libowl"
> > ./meta/recipes-sato/pimlico/contacts.inc:OWL_poky = "--enable-owl"
> > ./meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky = "
> > file://contacts-owl-window-menu.patch;apply=yes "
> > ./meta/recipes-sato/pimlico/tasks.inc:DEPENDS_append_poky = " libowl"
> > ./meta/recipes-sato/pimlico/tasks.inc:OWL_poky ?= "--enable-owl"
> > ./meta/recipes-sato/puzzles/oh-puzzles_git.bb:DEPENDS_append_poky = "
> > libowl"
> > ./meta/recipes-sato/puzzles/oh-puzzles_git.bb:SRC_URI_append_poky = "
> > file://oh-puzzles-owl-menu.patch;striplevel=0 "
> > ./meta/recipes-devtools/gcc/gcc-runtime_4.6.bb:EXTRA_OECONF_append_poky-lsb
> > = " --enable-clocale=gnu"
> > 
> > I'd hoped oe-core to be core and not know things about distro's etc.
> > E.g. the first case with apt, this should probably be fixed with a
> > .bbappend in the angstrom layer, shouldn't it.
> > And the poky things in a poky layer.
> 
> Absolutely, there should be no distro-specific items in OE-Core at all, and I 
> have to admit I was not aware they were there. Most of the poky ones seem to 
> be related to enabling libowl in various Sato apps - I don't know enough about 
> this area to know if we should now just always be applying these or whether 
> they indeed need to be moved out. Richard/Saul/anyone else?

Agreed, we need to find a better way to handle those. As you say, there
were nearly all libowl related. The poky-lsb override should become
linuxstdbase or whatever the dedicated override we created was, that is
just a simple mistake to fix.

The libowl changes shouldn't always be applied, they are rather sato
specific. We could add a sato override to replace that one?

Cheers,

Richard



