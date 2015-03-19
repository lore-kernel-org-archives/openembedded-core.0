Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 89B4865CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:04:20 +0000 (UTC)
Received: by wibdy8 with SMTP id dy8so107599197wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GKpVlTaNUzh67qY62VqAm/I1guS8lYlWwzlctT1h+FU=;
	b=gFaTrWDwc3VGMwmYVz+pdYFwRGCpsQi6UzaZlhqnYqbdNwgG+V0rKqwnSnEcIGVJOO
	UBJr0OL9pk32xkAjnZYMzL0sW2LkeXNh/WoGgEv4CDmZXlw7vjN0U1fhchoBcnFdAhsD
	1VFZoKfBqTlbzW/5t+0nNO70JQV1vjNYr5aEyI/zp21bJE5ByyyeyZuLxNF001EuSUkO
	sJ8BjUr2+Kd79lO54cl/tmhMKmFACjRc6ZVi2UMa+M0uQI7watwonBZlMzvweF9qN3or
	xizHqDI2W6a87XOWuCNfMiLgRC5oWwFUDpXYvN824leQUdRn4KNjAqBgHX9d9FSNHyvb
	XywQ==
X-Received: by 10.180.79.65 with SMTP id h1mr12753247wix.59.1426741461832;
	Wed, 18 Mar 2015 22:04:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id ka1sm353811wjc.2.2015.03.18.22.04.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Mar 2015 22:04:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Mar 2015 06:04:28 +0100
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20150319050428.GE4738@jama>
References: <cover.1426733823.git.Qi.Chen@windriver.com>
	<e017310c52ec2c0b47b3c8cef2ea76925c38fa08.1426733823.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e017310c52ec2c0b47b3c8cef2ea76925c38fa08.1426733823.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/5] rootfs.py: two changes regarding log checking
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
X-List-Received-Date: Thu, 19 Mar 2015 05:04:22 -0000
X-Groupsio-MsgNum: 63487
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
Content-Disposition: inline

--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 10:59:13AM +0800, Chen Qi wrote:
> This patch involves two changes.
>=20
> 1. Extend the regular expression to also catch '^WRANING:' in _log_check_=
warn.

Still has the typo I've reported earlier.

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

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUKWNwACgkQN1Ujt2V2gBzPpgCfVaPiA7WRel7yA7jhtpSXBoyv
tEQAni+p8kG9k6/YAAFfTAiKDH+QPWf1
=HeQR
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--
