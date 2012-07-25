Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Su5iQ-0006cc-GM
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 19:49:42 +0200
Received: by weyr6 with SMTP id r6so666470wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 10:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=linD0s5Knueu4ZuKBbleJ7L+/anbB2KADtcX3+vefeE=;
	b=v8goO96gvkRHge3sP367lYFgsc2eVCdI6y6Wg8sARSUxS/mmnNA+EKc7QYg5/8vvtG
	+Kgg8nClMwDZ+i534Bvp6joTUDBaidi00DTkeHnTYQrSdPr91THJSBkUFe6hrlLcw259
	Dc7tDvfdQyUC2FmymzqmmtFgOIRxoze7HlalTgWDMzGoraBj/9gR+/4e+mv4JEy7Ze/e
	3RPCzPvfiL7GM4iK7m+T/cFVAElLr4nt+OBjAjPnjslJzADhHnyrXXBwOO/4vfop0seN
	fXgM5z+//g7+3CvfwJs/q7Bp70lt/Ii9dXbJutLxsdTPLyVeZ2ffxJE5o/KcUh228rIZ
	JiRg==
Received: by 10.180.98.138 with SMTP id ei10mr6536879wib.1.1343237892889;
	Wed, 25 Jul 2012 10:38:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm3602372wiz.0.2012.07.25.10.38.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 10:38:12 -0700 (PDT)
Date: Wed, 25 Jul 2012 19:38:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120725173817.GD20145@jama.jama.net>
References: <CAJTo0LYgXx4camSSmap_HpitQ+gMOhshDLbJDDEr71=kfYnyUQ@mail.gmail.com>
	<1343234476-22803-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1343234476-22803-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] package.bbclass: don't error when the root doesn't exist in do_split_packages
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
X-List-Received-Date: Wed, 25 Jul 2012 17:49:42 -0000
X-Groupsio-MsgNum: 26164
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline

--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2012 at 05:41:16PM +0100, Ross Burton wrote:
> If nothing has been installed in the root automake 1.12 won't install the
> directory, which means os.walk will throw a file not found exception.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/package.bbclass |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index fc83424..85d6e81 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -74,6 +74,12 @@ def do_split_packages(d, root, file_regex, output_patt=
ern, description, postinst
>      given package, usually plugins or modules.
>      """
> =20
> +    dvar =3D d.getVar('PKGD', True)
> +
> +    # If the root doesn't exist, return early
> +    if not os.path.exists(dvar + root):
> +        return
> +
>      ml =3D d.getVar("MLPREFIX", True)
>      if ml:
>          if not output_pattern.startswith(ml):
> @@ -88,8 +94,6 @@ def do_split_packages(d, root, file_regex, output_patte=
rn, description, postinst
>          if newdeps:
>              extra_depends =3D " ".join(newdeps)
> =20
> -    dvar =3D d.getVar('PKGD', True)
> -
>      packages =3D d.getVar('PACKAGES', True).split()
> =20
>      if postinst:

Isn't this real error which shouldn't be covered by this?

e.g. if someone removes or loose tmp-eglibc/work/foo/image (happens
to me all the time because tmp-eglibc is on tmpfs) then do_package is
reexecuted when sstate checksum is changed (even with
BB_SIGNATURE_HANDLER =3D "OEBasic") and in some cases it successfully
repackage .ipk files which are now empty and in some cases it fails
(e.g. with systemd.bbclass checking that requested .service files are
available in package during do_package).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAQLwkACgkQN1Ujt2V2gBw7ewCgi4rmouzI5IgIdyAapHTvHb3v
hYMAoLmucC37nea3JhiZ2j4J2A0D0rd+
=6OG5
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--
