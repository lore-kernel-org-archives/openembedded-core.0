Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 038926A533;
	Wed, 29 May 2013 14:37:38 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id 10so8966088pdi.31
	for <multiple recipients>; Wed, 29 May 2013 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BzCHZBBapMULq+x8NcqwZD+y0PUjuq3UYq1RmuylBJw=;
	b=rQn2sG7pRSSKfPdC+pSazncZciqn4d2uCsyPHOfW6kHpLih3am1tPQfK6e6QsCzPuz
	42L+ILTCHS2Xhr6aPRUAb3fk3vd6doAEj3NdXoAOV0kIsz+emv9bwtUbtqfvXtMULRhe
	is+Os8TbHzCRPZP4sXhCaQ+Jy4mMK21qIJsnZhM4lIXm/czFBYY0tNnS1Tl8ARg8tefe
	ejMWJ+xznniE4HHLF/jfor4nv/LuH5x4BmSFdk0mXxwXg9HizkUxhqpOyQlo+dLQdtjO
	dxu/bU9HG/qcX+RWrvIQcnmcfvebIysKKu/dayqZ9MQjq72fEgYtU8hkxa1WFqsFl8LC
	cFAg==
X-Received: by 10.66.163.99 with SMTP id yh3mr1871344pab.22.1369838260077;
	Wed, 29 May 2013 07:37:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	nt2sm37574391pbc.17.2013.05.29.07.37.36 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 29 May 2013 07:37:38 -0700 (PDT)
Date: Wed, 29 May 2013 16:37:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130529143740.GL3192@jama>
References: <1369835496-20815-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1369835496-20815-1-git-send-email-mark.hatle@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Wed, 29 May 2013 14:37:39 -0000
X-Groupsio-MsgNum: 39819
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZrCu0B0FMx3UnjE2"
Content-Disposition: inline

--ZrCu0B0FMx3UnjE2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2013 at 08:51:36AM -0500, Mark Hatle wrote:
> Background:
>=20
> At the recent TSC meeting we were discussing ways of removing the PRINC
> in favor of the PR server, which should now be standard.  The first step
> in this process is coming up with a simple patch that declared PRINC as
> deprecated.  If this type of patch is successful, the block of code could
> be replaced with a bb.error eventually.
>=20
> It is not expected that this patch will go in by itself, but instead
> should be coordinated with changes to the recipes in common layers such
> as openembedded-core, meta-openembedded/meta-* and other community layers.

This doesn't say what's the process of getting all PR increments
applied.

Should we send list of recipes and required PR increments per layer (and
someone will sum these increments and create actual PR bump from it). Or
will we take turns and send actual PR bump patches per layer and someone=20
will define order of layers to go in (so that we prevent many conflicts=20
while merging)?

> The commit message follows:
>=20
> The PRINC logic is now deprecated, the PR server should be used to handle
> the automatic incrementing of the PR (package release) field.
>=20
> A warning message has been added when princ is defined as anything but '0=
'.
>=20
> The default setting of '0' has been retained as some layers use embedded
> python to increment the PRINC filed.  This fails if the base PRINC is not
> defined.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/base.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b1642a2..29084a2 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -465,8 +465,12 @@ python () {
>              appendVar('EXTRA_OECONF', extraconf)
> =20
>      # If PRINC is set, try and increase the PR value by the amount speci=
fied
> +    # The PR server is now the preferred way to handle PR changes based =
on
> +    # the checksum of the recipe (including bbappend).  The PRINC is now
> +    # obsolete.  Return a warning to the user.
>      princ =3D d.getVar('PRINC', True)
>      if princ and princ !=3D "0":
> +        bb.warn("Use of PRINC is deprecated.  The PR server should be us=
ed to automatically increment the PR.  See: https://wiki.yoctoproject.org/w=
iki/PR_Service"
>          pr =3D d.getVar('PR', True)
>          pr_prefix =3D re.search("\D+",pr)
>          prval =3D re.search("\d+",pr)
> --=20
> 1.8.1.2.545.g2f19ada
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZrCu0B0FMx3UnjE2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGmErQACgkQN1Ujt2V2gBxl8QCfaZa4CeFbcmCu7fPJQjrZZ5ad
g5MAmgPBQR/quwUd0MQPyE5RCf89MWCS
=bWfV
-----END PGP SIGNATURE-----

--ZrCu0B0FMx3UnjE2--
