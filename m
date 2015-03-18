Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D66F565CD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 12:03:11 +0000 (UTC)
Received: by wibdy8 with SMTP id dy8so88228127wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=55JhRGtrqvZWi4+DB0F0IavCr048Ss85OmPPtCC/vrI=;
	b=ARB8ijp6m6SOPAolb1i11cYHEvOf+nePGMrRaD9QYp+ywPj/uMl0XDw/pxJXR2iOWP
	za0lHaW7fDubCZi/EoCoWWDpC16PXHJ9A03PfS/VA4wgOHznHeWVM9q9fKSWbwadcSS/
	h7k5ZxxmcxK+bDwezYYtguU+fYv1NFTxsRxdoMod2V/72ckVhw0kOO5mkPtKG982hMlD
	kEMrMOcaeRBwi1FrFnLh/32blkiYjMu1JdjLOkfihI/qYmVzYsvFADO3De1eSM8ySreJ
	S2+olmzKzapVwK6LFbN/vdvmDLFDCi5g9STgmiyNygqt7X5/hEpgO7WkMi1bEyig4rKS
	2i7g==
X-Received: by 10.180.98.67 with SMTP id eg3mr6287011wib.11.1426680192209;
	Wed, 18 Mar 2015 05:03:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id j7sm2927913wix.4.2015.03.18.05.03.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Mar 2015 05:03:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Mar 2015 13:03:18 +0100
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20150318120318.GC4738@jama>
References: <cover.1426670089.git.Qi.Chen@windriver.com>
	<003afa4a3acb0670e6e3b9d3e12e9b276f03876c.1426670089.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <003afa4a3acb0670e6e3b9d3e12e9b276f03876c.1426670089.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] rootfs.py: two changes regarding log checking
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
X-List-Received-Date: Wed, 18 Mar 2015 12:03:12 -0000
X-Groupsio-MsgNum: 63452
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline

--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2015 at 05:16:10PM +0800, Chen Qi wrote:
> This patch involves two changes.
>=20
> 1. Extend the regular expression to also catch '^WRARNING:' in _log_check=
_warn.

typo WRARNING

>    Warnings from bb.note or bbnote begin with 'WARNING:'. So if we decide=
 to
>    catch warnings at rootfs time, we should not ignore those produced by
>    the build system itself.
>=20
> 2. Delay _log_check in rootfs process so that more warnings are likely to=
 be
>    catched. Note that we should at least delay the _log_check after the
>    execution of ROOTFS_POSTPROCESS_COMMANDS, because we want to catch war=
nings
>    there.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oe/rootfs.py | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 7e8d5d1..3a77e86 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -128,6 +128,7 @@ class Rootfs(object):
>              self._generate_kernel_module_deps()
> =20
>          self._cleanup()
> +        self._log_check()
> =20
>      def _uninstall_unneeded(self):
>          # Remove unneeded init script symlinks
> @@ -327,8 +328,6 @@ class RpmRootfs(Rootfs):
> =20
>          self.pm.install_complementary()
> =20
> -        self._log_check()
> -
>          if self.inc_rpm_image_gen =3D=3D "1":
>              self.pm.backup_packaging_data()
> =20
> @@ -355,7 +354,7 @@ class RpmRootfs(Rootfs):
>          pass
> =20
>      def _log_check_warn(self):
> -        r =3D re.compile('^(warn|Warn|NOTE: warn|NOTE: Warn)')
> +        r =3D re.compile('^(warn|Warn|NOTE: warn|NOTE: Warn|WARNING:)')
>          log_path =3D self.d.expand("${T}/log.do_rootfs")
>          with open(log_path, 'r') as log:
>              for line in log.read().split('\n'):
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUJaYYACgkQN1Ujt2V2gBytzgCgn2dhzQSZom/LEdB6iDpAhTkA
sS8AnjwjPnjW963kR63Gmxl2U5aoKI5S
=DfrX
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
