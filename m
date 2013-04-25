Received: from mail-pd0-f180.google.com ([209.85.192.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVKVZ-0005Md-Gb
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 13:38:41 +0200
Received: by mail-pd0-f180.google.com with SMTP id u10so1756005pdi.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 04:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=KvUqv3g5vTN3pCKsecnlrj1zKvzR8Afw2d1WkxX2JBs=;
	b=JCvj2kfk4t9tq7VVqreBU707++MIdTWqz1nESlc9wixKoviomQgQpkaVuxJ1cgV6TP
	/xJe/mZnG35xF6Cix4nzIPZTai0sStPB3vgyyC3hU4fObgknQIY8Jn8416TzRYoDRwuZ
	oASMaCUKt3kZiP5hGg/lhdCOqp3g4sHi6xjapiBpEqtCiV2duwfyCaVJkOZ/Hq4D2Lpx
	jIglHObqsK5pJ16x5V1NhvDQ9BcNlvh7BjEnzbdVYpbzqFfUNFqMps/Z5ICZDctjS6Dy
	1ToLk+6uQv/pXZQnI8BWs8PeD3hZKfnYH1kZJ44Sf0I0PTQz+uLf4RsT67TYu9EjOyV4
	6OYQ==
X-Received: by 10.67.10.133 with SMTP id ea5mr24846029pad.135.1366888853063;
	Thu, 25 Apr 2013 04:20:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ya4sm6993342pbb.24.2013.04.25.04.20.50 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 04:20:51 -0700 (PDT)
Date: Thu, 25 Apr 2013 13:21:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20130425112102.GF5538@jama.dyndns-home.com>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
MIME-Version: 1.0
In-Reply-To: <1366888374.14512.78.camel@phil-desktop.brightsign>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Thu, 25 Apr 2013 11:38:42 -0000
X-Groupsio-MsgNum: 38384
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iBwuxWUsK/REspAd"
Content-Disposition: inline

--iBwuxWUsK/REspAd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2013 at 12:12:54PM +0100, Phil Blundell wrote:
> On Tue, 2012-10-02 at 12:38 +0100, Richard Purdie wrote:
> > On Tue, 2012-10-02 at 12:15 +0100, Phil Blundell wrote:
> > > On Tue, 2012-10-02 at 12:12 +0100, Richard Purdie wrote:
> > > > Hasn't Paul added a general mechanism for doing this so we could add
> > > > this feature a level higher so that it could be used by all packagi=
ng
> > > > formats?
> > >=20
> > > Ah, possibly.  I'll have a look.  Can you give me a pointer to the
> > > mechanism you were thinking of?
> >=20
> > Something like IMAGE_FEATURES +=3D "dbg-pkgs" should trigger the additi=
on
> > of dbg packages.
>=20
> I've somewhat belatedly gotten around to using this and encountered a
> couple of issuettes:
>=20
> 1. There was a spurious-looking RRECOMMENDS_${PN}-dbg in bitbake.conf
> which was causing ${PN} to be dragged into the image whenever ${PN}-dbg
> was installed.  This is undesirable because it means that, for example,
> any image which includes sysvinit-pidof will end up installing sysvinit
> and this might cause quite drastic changes to the behaviour of the
> resulting image.
>=20
> 2. Having fixed the above I'm now left with a couple of file conflicts
> in the -dbg packages.  For example, sysvinit and util-linux both
> ship /sbin/sulogin and so sysvinit-dbg and util-linux-dbg both want to
> install /sbin/.debug/sulogin.  This is unfortunate if you have an image
> which uses, say, sysvinit-pidof and util-linux-blkid.
>=20
> I'm not quite sure what the right way to fix (2) is.  I suppose in an
> ideal world the -dbg packages would be separated in the same way the
> parent binary packages are, but that doesn't look entirely
> straightforward to arrange.

yes there is a lot of conflicts between PN-doc and PN-dbg, I had similar
issues when trying to build world-image:
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/034744.=
html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iBwuxWUsK/REspAd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF5EZ4ACgkQN1Ujt2V2gBytWQCeIMtDtW8rFt27nTJeXQ40tf2j
o8EAn2MdlXp3+t/6TMFFN+a4JORQrsNK
=oQJD
-----END PGP SIGNATURE-----

--iBwuxWUsK/REspAd--
