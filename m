Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNmWp-0001Zj-Tc
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 17:56:46 +0200
Received: by mail-da0-f50.google.com with SMTP id t1so1159830dae.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PFkwzPqOcaGxO7B+MbN0Cs2LHRNU9ijyBhFvukDFFDo=;
	b=SN9ZLhsXjRI2rEAo8YPds1Yc6JPnyvjyoxz2H6QBff3/Z3JEo7kCgzK7HJMKjSZuFS
	zXw1OMsjieLmnM+Gw473wmNMNA69GKNmf/Dh4LadpPohrIBEa1peEnhbu91b91Tm0xsd
	aPeZK27ATC7ZXFDNJTICY3G9FtBrtqPZfoT3QAWC3VLGFb0+Hj3Z75BSUicOoCKp2oWG
	zvnInsbVVWNew6dPtoX5e3CXYUasD9puv9TNdz3rvd9Xn68Jy2G6Az2gzz1YTURw0CkW
	t+4iBGr14TOG8Rfjdkb1DaAEDotQRG9jUc2TGlY+cKHAqdsKRfiN80wkCSG9QGXG2Wqp
	KZYQ==
X-Received: by 10.66.49.229 with SMTP id x5mr10239135pan.185.1365089969699;
	Thu, 04 Apr 2013 08:39:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id tf8sm10586193pbc.42.2013.04.04.08.39.26
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 08:39:28 -0700 (PDT)
Date: Thu, 4 Apr 2013 17:39:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130404153930.GD1271@jama.dyndns-home.com>
References: <20130320202206.GD3220@jama>
	<1364984074-3636-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1364984074-3636-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][PATCH 1/2] packagedata: show error when there are multiple pkgdata directories
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
X-List-Received-Date: Thu, 04 Apr 2013 15:56:47 -0000
X-Groupsio-MsgNum: 37429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline

--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2013 at 12:14:33PM +0200, Martin Jansa wrote:
> * when PACKAGE_ARCH is changed e.g. from MACHINE_ARCH to TUNE_PKGARCH
>   get_subpkgedata_fn is still reading old MACHINE_ARCH directory instead =
of newer with TUNE_PKGARCH

This is too strict in some cases, e.g.:

ERROR: More then one pkgdata dir found for pkg 'opkg-collateral'
(
'/OE/shr-core/tmp-eglibc/pkgdata/cortexa8-vfp-neon-oe-linux-gnueabi/runtime=
/opkg-collateral',
'/OE/shr-core/tmp-eglibc/pkgdata/armv5te-oe-linux-gnueabi/runtime/opkg-coll=
ateral'),
returning first

Why do we need to look in all pkgdatadirs? Why not just PACKAGE_ARCH?

> ---
>  meta/lib/oe/packagedata.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index 62fd718..2533700 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -34,11 +34,18 @@ def get_subpkgedata_fn(pkg, d):
>      dirs =3D all_pkgdatadirs(d)
> =20
>      pkgdata =3D d.expand('${TMPDIR}/pkgdata/')
> +    found =3D None
>      for dir in dirs:
>          fn =3D pkgdata + dir + pkg
>          if os.path.exists(fn):
> -            return fn
> -    return d.expand('${PKGDATA_DIR}/runtime/%s' % pkg)
> +	    if found:
> +                bb.error("More then one pkgdata dir found for pkg '%s' (=
'%s', '%s'), returning first" % (pkg, found, fn))
> +                continue
> +            found =3D fn
> +    if found:
> +        return found
> +    else:
> +        return d.expand('${PKGDATA_DIR}/runtime/%s' % pkg)
> =20
>  def has_subpkgdata(pkg, d):
>      return os.access(get_subpkgedata_fn(pkg, d), os.R_OK)
> @@ -68,6 +75,7 @@ def read_subpkgdata_dict(pkg, d):
>      return ret
> =20
>  def _pkgmap(d):
> +    import bb
>      """Return a dictionary mapping package to recipe name."""
> =20
>      target_os =3D d.getVar("TARGET_OS", True)
> @@ -85,6 +93,7 @@ def _pkgmap(d):
>              continue
> =20
>          for pn in filter(lambda f: not os.path.isdir(os.path.join(pkgdat=
adir, f)), files):
> +            bb.warn("Trying path '%s'" % os.path.join(pkgdatadir, pn))
>              try:
>                  pkgdata =3D read_pkgdatafile(os.path.join(pkgdatadir, pn=
))
>              except OSError:
> --=20
> 1.8.1.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFdnrIACgkQN1Ujt2V2gByH8ACglRm2bvWhTkxs8SliQREiXseq
JvsAnREV5eDKa6cJG9FCFz+Szs5otnIm
=rji3
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
