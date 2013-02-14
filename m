Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U63q6-0007Qk-M5
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 19:47:23 +0100
Received: by mail-da0-f53.google.com with SMTP id w3so1142070dad.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 10:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=W7fqVTtLK5bDNs+I7Rgds0xLdPI21vplGtUQNZVknx0=;
	b=IZU0r6oa8rKNpkQRAGi1iERmCAb/C11T4TzkuIN8djm06VjA+vGRk7MJ/ZMR+NTnBj
	73B51287gGes+eDyxBiegbl5Ilb8KCdBTFQZS8DuaQobtPHEZxpin/8F/9ICB0jRD2Gv
	9K7KjVto+PfrdkKaR4LwWe5dxRbNeMfqEZgc5jHPcXs5cej2/TBCSqp/uIJxWqxYqTi1
	m8cBoHgyzR6mU5as13nigh5MHb6c5CnzzDj0OaNVpDohCQpH0zFYx4SJId3Ajj/dnOEN
	++Ws3wmotCERR0cmf/Ia0N71f/L012v7OdeYbFBbdrxkhzIetnh1eVi7D63s+J8/l1LS
	+foA==
X-Received: by 10.66.88.6 with SMTP id bc6mr6462308pab.5.1360866679317;
	Thu, 14 Feb 2013 10:31:19 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id iv3sm2022813pbc.40.2013.02.14.10.31.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 10:31:18 -0800 (PST)
Date: Thu, 14 Feb 2013 19:31:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130214183114.GM3300@jama>
References: <cover.1360864224.git.ross.burton@intel.com>
	<b1c98f2ddb9165ae580daa42c509caca1fe7cdbc.1360864224.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <b1c98f2ddb9165ae580daa42c509caca1fe7cdbc.1360864224.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] package_ipk: check CONFFILES exist before adding them to metadata
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
X-List-Received-Date: Thu, 14 Feb 2013 18:47:23 -0000
X-Groupsio-MsgNum: 35482
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Mt39TZj+HFMr11E"
Content-Disposition: inline

--6Mt39TZj+HFMr11E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 14, 2013 at 05:52:50PM +0000, Ross Burton wrote:
> opkg-build verifies that conffiles exist, so verify that the specified fi=
les
> actually exist before writing them to conffiles.

Shouldn't this show at least a warning about missing conffile?

opkg-build error saved me few times before adding CONFFILES with wrong
pattern not matching anything in FILES.

I understand that you cannot use fatal error here for that xorg.conf
use-case, but warning would be nice.

> This mirrors the behaviour of FILES and package_rpm's CONFFILES handling.

=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/package_ipk.bbclass |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.=
bbclass
> index d735051..e5e76ef 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -440,7 +440,8 @@ python do_package_ipk () {
>                  bb.utils.unlockfile(lf)
>                  raise bb.build.FuncFailed("unable to open conffiles for =
writing.")
>              for f in conffiles_str.split():
> -                conffiles.write('%s\n' % f)
> +                if os.path.exists(oe.path.join(root, f)):
> +                    conffiles.write('%s\n' % f)
>              conffiles.close()
> =20
>          os.chdir(basedir)
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6Mt39TZj+HFMr11E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEdLXIACgkQN1Ujt2V2gBwdJgCguwHFVVJL98crZr7B7T1edf/x
AuIAoIKxSX0Wr5N9BM1KRbyCwFiALZi8
=sWBm
-----END PGP SIGNATURE-----

--6Mt39TZj+HFMr11E--
