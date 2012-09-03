Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8QxQ-0001vq-3t
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 09:20:28 +0200
Received: by wgbdr1 with SMTP id dr1so3352169wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 00:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NhdrVy5OOM9PA+/6CiaI9vUFMzNu+m0pMpYoEtbf7lw=;
	b=HmrSUtDaz2x+oLgQTBzkvxeivi31RgVW9OLXIGXid2CWueTkfW1Yerrg/Y15/XS1pz
	J+5hkHTmpmnKFVK9f11HeeTVgqQQwU2+XUPGY+lS7ypChJ1hG8OcugU1/3qia4ZblIEK
	btNr4XqEn1vfkodVMoo/cjX5/ylPW5Tqk1pXy8ezcll2GyMslgWBWxhJ4lUoh8Lg95JW
	WFN7UdJHpWXt4SYteyF9aEXIrpvNuH8QcP+8NKGk3vxpSVOEHshzwJEAlozri/N8tBT0
	ixiXJqNtd6dOu7Zh8umbJ+JYu4pvlVmnmEX8CdNTw49+MpuOA6BSvJOwd0RS4HvgNjZ/
	WHvA==
Received: by 10.180.100.35 with SMTP id ev3mr21109123wib.7.1346656088137;
	Mon, 03 Sep 2012 00:08:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm17631717wib.8.2012.09.03.00.08.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 00:08:06 -0700 (PDT)
Date: Mon, 3 Sep 2012 09:08:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Message-ID: <20120903070832.GC3205@jama.jama.net>
References: <5040A5BB.7040601@r-finger.com>
MIME-Version: 1.0
In-Reply-To: <5040A5BB.7040601@r-finger.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: runstrip() in package.bbclass fails when run against a kernel module
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
X-List-Received-Date: Mon, 03 Sep 2012 07:20:28 -0000
X-Groupsio-MsgNum: 28516
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Content-Disposition: inline

--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2012 at 12:53:31PM +0100, Tomas Frydrych wrote:
>=20
> runstrip() in package.bbclass fails when run against a kernel module,
> because it tries to do a bitwise & with a 'None' argument. This throws:
> TypeError: unsupported operand type(s) for &: 'NoneType' and 'int'.
>=20
> (This bug triggers, for example, when building ti-linuxutils from
> meta-ti (v2012.05-yocto1.2 tag) against Denzil.)
>=20
> Patch attached.

Was this for denzil?

In master it was fixed a month ago by:
http://git.openembedded.org/openembedded-core/commit/meta/classes/package.b=
bclass?id=3Da834ab8a6d53cae504fa112a89bab93d726539ec

Don't know why they merged your patch to master too now..

Cheers,

>=20
> Tomas
>=20

> From 6abe978d8e0acdb35c1abfed83e775b276b1231f Mon Sep 17 00:00:00 2001
> From: Tomas Frydrych <tomas@sleepfive.com>
> Date: Fri, 31 Aug 2012 12:02:18 +0100
> Subject: [PATCH] package.bbclass: fix stripping for kernel modules
>=20
> runstrip(path, elftype, d) does bitwise & on the elftype parameter, so it=
 has
> to be passed an integer. Passing None fails with: TypeError: unsupported
> operand type(s) for &: 'NoneType' and 'int'.
>=20
> Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
> ---
>  meta/classes/package.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 44e551f..f046fbb 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -877,7 +877,7 @@ python split_and_strip_files () {
>  			for f in files:
>  				if not f.endswith(".ko"):
>  					continue
> -				runstrip(os.path.join(root, f), None, d)
> +				runstrip(os.path.join(root, f), 0, d)
>  	#
>  	# End of strip
>  	#
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

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBEV3AACgkQN1Ujt2V2gBzA1QCgu98tBf599yZccSbj0hd4o90O
D+8AoK8pbdzeeoz0lhOAQtpFeAzR+0U4
=iJfw
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
