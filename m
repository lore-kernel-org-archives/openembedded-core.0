Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBjtL-0007YU-4b
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:33:07 +0200
Received: by fxm19 with SMTP id 19so3293599fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=qsOahNsq6BvtPff3pK7szupvXKV+5cvTzZyCfRoqvQg=;
	b=feIj8zPEEX6nuIujXVyjnbX60IGefcsPPP/OT1S9KS6yc0WnpNq3ir135DJLejPjHS
	V/uXshKi+GprkZlKP34Jpd/6VHK9q0j4agO8+/svTTXmhORfTfjSHzxfmAGBqj7vm5KX
	sFdVovcbVjn9ziymLB7qSej/8DSBy4fiisZFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=DHCWEEc2uUNgHwsmpL7rxga+rylgnZ7NXUNVeIBIPkyxINEvi/c6w3PF23p9R/jUfm
	coewxwzR5G/L/SVzpwlDDOUVhlttPTcV6GG4oDD17+/nmgMvgeP/sdJT/6QOlN0anJBL
	H6FVJ3T/S9n5Lr/oBQ5zerdiTglPmAexonmfM=
Received: by 10.223.77.4 with SMTP id e4mr1905209fak.51.1303115439830;
	Mon, 18 Apr 2011 01:30:39 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e17sm1580565fak.24.2011.04.18.01.30.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:30:38 -0700 (PDT)
Date: Mon, 18 Apr 2011 10:30:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110418083037.GA24192@jama.jama.net>
References: <1303107421.5518.45.camel@rex>
	<20110418065013.GI25122@jama.jama.net>
	<1303110555.5518.64.camel@rex>
	<B4EB4EB4-C631-481F-94DE-65C7789136F2@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <B4EB4EB4-C631-481F-94DE-65C7789136F2@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: RFC: Layer tooling brainstorming
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
X-List-Received-Date: Mon, 18 Apr 2011 08:33:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2011 at 10:01:59AM +0200, Koen Kooi wrote:
>=20
> Op 18 apr 2011, om 09:09 heeft Richard Purdie het volgende geschreven:
>=20
> > On Mon, 2011-04-18 at 08:50 +0200, Martin Jansa wrote:
> >> On Mon, Apr 18, 2011 at 07:17:01AM +0100, Richard Purdie wrote:
> >>=20
> >> maybe I've missed something, but
> >> * Parsing error when ie foo_1.0.bbappend is found, but foo_1.0.bb in
> >>  upper layer was upgraded to foo_1.1.bb
> >>=20
> >> This can cause big problems when distribution explicitly enables
> >> something in .bbappend with EXTRA_OECONF, and someone updates all
> >> layers, builds foo_1.1.bb and installs it on targets before noticing
> >> that foo_1.0.bbappend wasn't used. Then he has to bump PR after adding
> >> foo_1.1.bbappend to distro layer (to fix foo on targets), so I would
> >> prefer parsing error in this case (won't help if upper layer keeps both
> >> versions foo_1.0.bb and foo_1.1.bb ;/).
> >>=20
> >> This should be combined with your 2nd point and person who changes
> >> versioned dependency on upper layer should check that all needed
> >> .bbappends still apply.
> >=20
> > Agreed but I thought we already had a tool to handle at least some of
> > this though? Certainly integration of that with the above is essential
> > though.
>=20
> This is what I get for my setup:
>=20
> koen@dominion:/OE/tentacle/build$ bitbake-layers=20
> <string>:1: DeprecationWarning: Call to deprecated function bb.parse.pars=
e_py.BBHandler.vars_from_file: Please use bb.parse.vars_from_file instead.
> <string>:6: DeprecationWarning: Call to deprecated function bb.which: Ple=
ase use bb.utils.which instead.
> WARNING: Bitbake has not been run using the bitbake wrapper (scripts/bitb=
ake); this is likely because your PATH has been altered from that normally =
set up by the poky-init-build-env script. Not using the wrapper may result =
in failures during package installation, so it is highly recommended that y=
ou set your PATH back so that the wrapper script is being executed.
> WARNING: Pseudo is not functioning correctly, which will cause failures d=
uring package installation. Please check your configuration.
> Parsing recipes..<string>:1: DeprecationWarning: Call to deprecated funct=
ion bb.which: Please use bb.utils.which instead.
> <string>:1: DeprecationWarning: Call to deprecated function bb.which: Ple=
ase use bb.utils.which instead.
> <string>:1: DeprecationWarning: Call to deprecated function bb.which: Ple=
ase use bb.utils.which instead.
> done.
> INFO: State of append files:
> INFO: base-files_3.0.14.bb:
> INFO:   /OE/tentacle/sources/meta-angstrom/recipes-core/base-files/base-f=
iles_3.0.14.bbappend
> INFO: libusb-compat_0.1.3.bb:
> INFO:   /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-support/li=
busb/libusb-compat_0.1.3.bbappend
> INFO: sysvinit_2.88dsf.bb:
> INFO:   /OE/tentacle/sources/meta-angstrom/recipes-core/sysvinit/sysvinit=
_2.88dsf.bbappend
> koen@dominion:/OE/tentacle/build$=20

This is great for distro maintainer who maintains also those required
revisions for upper layers, if distro building scripts (oebb.sh or our
SHR Makefile) allows such revision locking.

But I don't expect regular distro builder to do such test after every
git pull in some layer (that's why I think parsing error would be
better).

My workaround for revision locking is using branches oe-core-contrib/shr
meta-oe-contrib/shr from SHR Makefile, where I can stash some patches
not yet applied from pull request or even not yet sent in any pull
request and also control which upstream revision will be used (rebased
on).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


