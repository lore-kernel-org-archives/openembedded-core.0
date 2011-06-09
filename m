Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUbXY-0003mQ-Hb for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 11:28:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p599PEwc010973
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 10:25:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10791-03 for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2011 10:25:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p599P8tK010967
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 10:25:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110609083834.GJ23137@jama.jama.net>
References: <20110609083834.GJ23137@jama.jama.net>
Date: Thu, 09 Jun 2011 10:24:59 +0100
Message-ID: <1307611500.15712.133.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: LOCALCOUNT increased twice when there are 2 layers with same git recipe
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
X-List-Received-Date: Thu, 09 Jun 2011 09:28:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 10:38 +0200, Martin Jansa wrote:
> Hi,
> 
> I was wondering why I see gobject-introspection built on every image
> build and it's because LOCALCOUNT is changing all the time.
> 
> OE om-gta02@shr ~/shr-core $ find openembedded-core/ -name gobject-introspection\*
> openembedded-core/meta/recipes-gnome/gnome/gobject-introspection_git.bb
> SRCREV = "efa7266bcf78478ce62e8dd778a4f0417bfd4d15"
> PV = "0.10.8+git${SRCPV}"
> 
> OE om-gta02@shr ~/shr-core $ find meta-openembedded/ -name gobject-introspection\*
> meta-openembedded/meta-oe/recipes-gnome/gnome/gobject-introspection_0.9.10.bb
> meta-openembedded/meta-oe/recipes-gnome/gnome/gobject-introspection_git.bb
> SRCREV = "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
> PV = "1.29.0+gitr${SRCPV}"
> 
> I had to add gobject-introspection_git.bb to meta-oe, because we're
> using newer glib with gdbus-codegen included (instead separate
> gdbus-binding-tool we were using before)
> meta-openembedded/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb with
> SRCREV = "d97cbc6731deab137770bc0fe9c69b06f689f5b4"
> PV = "2.29.3+gitr${SRCPV}"
> and default gobject-introspection version is not compatible with it.
> 
> Problem is that with 2 _git recipes LOCALCOUNT is incremented twice
> because there are 2 different SRCREVs found during parsing.
> 
> I wanted to use gobject-introspection_git.bbappend, but it looks like
> changing PV/SRCREV from .bbappend is not supported (bitbake-layers also
> reported that it cannot find right gobject-introspection version to my
> bbappend. And I also cannot blacklist gobject-introspection_git.bb from
> oe-core, because Angstrom blacklister uses only PN. So in the end I've
> removed that recipe from my oe-core-contrib/shr branch which is used for
> SHR builds..
> 
> Is there better way to resolve this? With more layers enabled this could
> happen more often imho.. Maybe we could add unexpanded -PV to LOCALCOUNT
> persistent db key with sideeffect of reseting LOCALCOUNT on every PV
> change (upgrade to newer version).

I like this idea at least in principle. If you're changing PV, you don't
mind if the counter resets so I don't see that as a problem...

Cheers,

Richard



