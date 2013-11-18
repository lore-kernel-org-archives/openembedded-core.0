Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 435C96D125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:54:41 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c4so2617483eek.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G+CVh14QEAmsIYta/FHrn1Xzy8ea7KcVXhOc+wXszBE=;
	b=YHTEuvkdUjqIJXvd7gk2l5P0mMp0XTAUlSDTbVxTXCD10QZYKEBPXan2ocxhIo5iJz
	ny85VJN6dDAHIeBG3xUW+xdibpBqDOPQmp6qE2DunwTvRM1LHw+Q4GeJfP3Vo4mQZcll
	6aWKlmDJaF7n5F7A5/G/+8ejn6W31ixYhgdYREmrXpihdSNMZHKa6VSexoQsfcGsnnIQ
	MblOTMK5p62WJ0DqL4GDZZYbUxaEZnQyWA6CrQ1WrxBHmvScfn1aVXvwjjMQ5Civ2m5f
	WBUVtVr+EtINQI+oKWO0gOpuYx3g5ZmZE5qZNNQNHLIST/6Hw+xWsdA+aXWiPcaTknMS
	ST6A==
X-Received: by 10.14.246.140 with SMTP id q12mr389808eer.123.1384790082793;
	Mon, 18 Nov 2013 07:54:42 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w6sm39114753eeo.12.2013.11.18.07.54.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 07:54:42 -0800 (PST)
Date: Mon, 18 Nov 2013 16:54:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131118155442.GE3727@jama>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
	<1384777875.6460.228.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1384777875.6460.228.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] allarch: Always inhibit default dependencies and set empty TARGET_PREFIX
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
X-List-Received-Date: Mon, 18 Nov 2013 15:54:41 -0000
X-Groupsio-MsgNum: 47227
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline

--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 12:31:15PM +0000, Richard Purdie wrote:
> On Sun, 2013-11-17 at 14:52 +0100, Martin Jansa wrote:
> > * typical case where we inherit allarch and override PACKAGE_ARCH
> >   are packagegroup recipes, but those need default dependencies
> >   inhibited even when they are MACHINE_ARCH or TUNE_PKGARCH.
> >   I don't know about any recipe which inherits allarch and needs
> >   default dependencies.
>=20
> The code there was added to allow the allarch class to be enabled or
> disabled. I don't remember exactly why we needed to do that however it
> was added for a reason and making part of it unconditional again will
> probably break whyever we made it optional :(.

I think that use case was MACHINE_ARCH packagegroups loosing -gnueabi
suffix, so that everything except packagegroups (or other MACHINE_ARCH
allarch recipes) was built in workdir:
MACHINE-oe-linux-gnueabi
and packagegroups in
MACHINE-oe-linux

I don't think we had the use case where we needed to conditionally keep
default deps (but of course my memory isn't perfect and I can be wrong).
=20
> I can understand how you came to this conclusion though. Which cases is
> this causing problems for?
>=20
> > * set empty TARGET_PREFIX
> >   This has a bit weird reason caused by unsupported setup where
> >   external-toolchain is used in some DISTRO only for some MACHINEs
> >   and internal is used for other MACHINEs.
> >   Because external-toolchain usually comes with different TARGET_PREFIX
> >   it was causing allarch recipes to have different signatures even
> >   when they don't use toolchain at all.
> >   Empty TARGET_PREFIX also helps to find allarch recipes which still
> >   have default dependency on e.g. virtual/${TARGET_PREFIX}gcc.
>=20
> This seems ok, I'd have taken it if it was a separate patch.

It's related to above, because "thanks" to empty TARGET_PREFIX I've
found few MACHINE_ARCH+allarch recipes in meta-webos which weren't using
toolchain, but default deps had nonexistent "virtual/gcc".

So we cannot merge TARGET_PREFIX without the above part.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKKOEIACgkQN1Ujt2V2gByCIACgko1GSxAzBqW10WF48uNa6XCX
8/oAnjZOGVu7HeVNVckoxNLQ9AJnFmJL
=jKQ8
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--
