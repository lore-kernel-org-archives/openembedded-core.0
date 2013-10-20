Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4F61C6CFF9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 10:59:29 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so2842661eaj.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZND+am3JtT0D9ubvff5tQUBfpK1XuylaonRY8Lv1ypA=;
	b=pRZlqyKrLtybGoidA+N+HYQnJJJ6cS9OxRBzqQuEfwHB/lT2L/eRv7mo1d4tnZ2do1
	UGSdqricNWvhKLXlHqRjYEMLareeFGsG3lBRf5XFVqXViYFcuEKc4dP3/Un0H8GTQA8p
	kIJWerQJKBLcEAwTU78EtTsoPBF3N5S0Dib9XjW31Bt5JCt15WrkXy3YePjjZhxTk9Yu
	9Ncvu1bzodPyMVVN7UpKbtpMOj+zexMStHRZ54bnN4jFIIXFT8/yCiU/NZrsufWcNjuu
	ypySuZVyJHUc+FpgxxD23RIrzZVZdqrsy/0WccJ3qyh3YAH6R0iSxEIVpzCwZ7PgdAhl
	oUkg==
X-Received: by 10.14.4.1 with SMTP id 1mr15643858eei.21.1382266770581;
	Sun, 20 Oct 2013 03:59:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-36.net.upcbroadband.cz. [62.24.80.36])
	by mx.google.com with ESMTPSA id b42sm29247485eem.9.2013.10.20.03.59.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 03:59:30 -0700 (PDT)
Date: Sun, 20 Oct 2013 12:59:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Message-ID: <20131020105929.GA3697@jama>
References: <1382266112-24559-1-git-send-email-ming.liu@windriver.com>
	<1382266112-24559-3-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1382266112-24559-3-git-send-email-ming.liu@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] strace: replace += with _append for appending to OVERRIDES variables
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
X-List-Received-Date: Sun, 20 Oct 2013 10:59:30 -0000
X-Groupsio-MsgNum: 46062
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2013 at 06:48:31PM +0800, Ming Liu wrote:
> In some cases, it's unfit to use "+=3D" in a conditional appending, we wo=
uld
> end up with the variable being set rather than being appended, which is n=
ot
> it mean to.
>=20
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/recipes-devtools/strace/strace_4.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-de=
vtools/strace/strace_4.8.bb
> index 79a4ad7..aad53b7 100644
> --- a/meta/recipes-devtools/strace/strace_4.8.bb
> +++ b/meta/recipes-devtools/strace/strace_4.8.bb
> @@ -19,7 +19,7 @@ inherit autotools ptest
>  RDEPENDS_${PN}-ptest +=3D "make"
> =20
>  PACKAGECONFIG_class-target ?=3D "libaio"
> -PACKAGECONFIG_class-target +=3D "${@base_contains('DISTRO_FEATURES', 'ac=
l', 'acl', '', d)}"
> +PACKAGECONFIG_append_class-target =3D " ${@base_contains('DISTRO_FEATURE=
S', 'acl', 'acl', '', d)}"

Doesn't using _append make it unnecessary harder to changed default value
in .bbappend?

Why not use
PACKAGECONFIG_class-target ?=3D "libaio ${@base_contains('DISTRO_FEATURES',=
 'acl', 'acl', '', d)}"
at least in this case?

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJjt5EACgkQN1Ujt2V2gBxiqgCgutaxOdmRDqVhPCOt8HPpiRTq
bLkAmQHSMWJN8FWqCOujELNxnP8nYjb8
=6vo+
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
