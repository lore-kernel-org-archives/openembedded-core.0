Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtHR3-0004F6-1H
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 13:03:53 +0200
Received: by fxg11 with SMTP id 11so4485005fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6EHsxwo5Wx0+z7gng30Y0bV48ArsqJF2EceT7j+W/4c=;
	b=h3vGW3RyqzD+GBQo69FoEudAP4/4Av2l6qoYct0IACl0AZHHtZaxhcjuDG+1wpQl4Z
	WQ1sXzSBJV2V5rl7bUELty/SXk1BPOC5toyXjldAf5eJCKg4Y5NfW/rjdw/Piz5m5bs1
	BJN7olBzqwepmfugIcH6vfJ+4yJXtQC9QcCq8=
Received: by 10.223.159.202 with SMTP id k10mr7045401fax.6.1313492355941;
	Tue, 16 Aug 2011 03:59:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y21sm2876610faj.47.2011.08.16.03.59.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 03:59:14 -0700 (PDT)
Date: Tue, 16 Aug 2011 12:59:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110816105907.GC10195@jama.jama.net>
References: <CAGiJk9euxaWGh_=hpspcLH0DtDSAejHZvj_HKLfKrcuvBHn6xQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9euxaWGh_=hpspcLH0DtDSAejHZvj_HKLfKrcuvBHn6xQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Error building any X11 image: "Nothing PROVIDES 'libxcb-native'"
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
X-List-Received-Date: Tue, 16 Aug 2011 11:03:53 -0000
X-Groupsio-MsgNum: 8275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 12:50:51PM +0200, Samuel Stirtzel wrote:
> Hi,
> recently all X11 images fail to build for me.
>=20
> The following error shows up (this is from core-image-sato):
> -
> ERROR: Nothing PROVIDES 'libxcb-native' (but
> virtual:native:/var/oe-core/setup-scripts/sources/meta-openembedded/meta-=
oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
> DEPENDS on or otherwise requires it)
> ...
> Missing or unbuildable dependency chain was: ['core-image-sato',
> 'task-core-apps-console', 'xf86-video-fbdev', 'xserver-xorg',
> 'font-util-native', 'mkfontdir-native', 'virtual/libx11-native',
> 'libxcb-native']
> -
> Looks like the DEPENDS are "wrong" and it should refer to libxcb
> (/var/oe-core/setup-scripts/sources/openembedded-core/meta/recipes-graphi=
cs/xcb/libxcb_1.7.bb)
> instead of libxcb-native (which is not known by bitbake), but i can't
> find the commit which changed this DEPENDS.
>=20
> After all I can't find any file that has this DEPENDS, "grep -r
> libxcb-native *" in my source direcory showed up nothing.

for some reason
http://git.openembedded.org/cgit.cgi/meta-openembedded/commit/?id=3Dceb4a1d=
eaabe81e0acaf9dd179d08736f598203e
is missing .bbappend part..

but you can apply this patch to oe-core instead..
http://patches.openembedded.org/patch/9871/

having libxcb-native directly in oe-core will help recipes-graphics
maintainer to copy new libx11 from meta-oe to oe-core.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5KTXsACgkQN1Ujt2V2gBzXKgCgkBgqFgi1TTdIvOVR8WXfd8xX
ekIAnRUEsimMNOdZWjudAm0JxtbtpgjT
=96Uc
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
