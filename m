Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB2B60166
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 18:55:21 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e49so3056725eek.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HwbktfowetredYkQcT8MX9mim3mcXAdr+xv9WkEHr/k=;
	b=xbCmRbu3/lYE5HQA1Q8PR3q4FMn7wtelb6YRkqjZeMF3Fq4K/TuZbJyO+hbQ2VO8jk
	XCtbRgBjpUDWKfEdsWdQZmxIfSn+KlzH6CAWMncx+nDZ0smQfuKKThAxNHEYFreTHKQr
	zC0KwIAHBmOrcZGTLMu//G36o8e1pTeH+ZKtKhGp+8D1yO6UHwL69wjrL+zoBvrg+M7z
	VBb5uM3AzEgc40Pu68BLJjtlRoDmx/nkHmOKrBa+54PIurkIcHcLEJkmfYnqqPRVsjHM
	y8U1vX7S23Cww7NrkhEBLDfJt52e9X/CvatPwpBEB+PEK/THYVIv3VolwkxOcgnLzXXQ
	SkMg==
X-Received: by 10.14.199.1 with SMTP id w1mr13820508een.29.1390157722002;
	Sun, 19 Jan 2014 10:55:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm45896168eef.16.2014.01.19.10.55.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2014 10:55:21 -0800 (PST)
Date: Sun, 19 Jan 2014 19:55:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140119185521.GD5565@jama>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
	<f689af01e81dd9a6387b8f424ddf55358f846024.1390052636.git.Martin.Jansa@gmail.com>
	<1390151625.874.16.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1390151625.874.16.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] package.bbclass: add SHLIBSSEARCHDIRS to define where to search for shlib providers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Jan 2014 18:55:22 -0000
X-Groupsio-MsgNum: 49191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline

--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2014 at 05:13:45PM +0000, Richard Purdie wrote:
> On Sat, 2014-01-18 at 15:02 +0100, Martin Jansa wrote:
> > * when package contains some files matching "^.*\.so", but in directory
> >   not default linker search paths (e.g. /opt/package/bundled-lib/libfoo=
=2Eso)
> >   don't register it as libfoo provider, because it's possible that there
> >   is different package providing libfoo.so in ${libdir} and that would
> >   be better shlib provider for other packages to depend on
> > * recipes providing libs intentionally in some other directory can
> >   define own SHLIBSSEARCHDIRS value
> >=20
> > [YOCTO #4628]
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/package.bbclass | 26 +++++++++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
>=20
> Doesn't this mean we lose automatic dependencies for libraries not in
> the default system paths after this change?

True, recipes with such libraries would need to append to
SHLIBSSEARCHDIRS

> We should really be respecting the libraries RPATH in this code and
> searching the places it will look...

I agree we should respect RPATH, but sometimes it is more complicated,
because your own binaries can have RPATH pointing to
/opt/package/bundled-lib/libfoo.so, but you don't want any other recipe
to find your libfoo.so, because there is preferred "system" /usr/lib/libfoo=
=2Eso

So in ideal case we should respect combination of default search path,
ld.so.conf, RPATH and PRIVATE_LIBS :/.

I don't mind if you drop this one from patchset, it's the most controversial
one and can be work-arounded by carefully maintained PRIVATE_LIBS list.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLcH5kACgkQN1Ujt2V2gBzQgwCgry72m7OBZLivC5xnbc6HH7yv
TdIAn2ra9A2IpcC3BymJmaupbU80W4oy
=bnVj
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
