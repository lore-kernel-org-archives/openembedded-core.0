Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4CFA960579
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 12:16:55 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so5304593eek.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MBZmW8WnDV4OO4j/Dxp5QUVcZbOkXUsd+j/UzoRR6hQ=;
	b=kzUjawB4ypWU2U3fZ925eBNd417n4bf5oQRC2YXFo92vvIQAAbvwQWtaib4KSccwG6
	W2GpQv6UdmCbPKN+LmDr3FMGI9Y33l5H0tkdKnv1IIKZJqHpwFAn/iVPMLJ3rhsTCtp4
	+GD1bRwGmf5g75Bu3dwxl3Aa/ERYzcabVHxikj8OO854iu5FJNoesXN3IXtezS05CQEi
	7Plz+Er5+/DcabnjIN/n4Hc6q9M6ElvjhhkfNv0Lztl8VwzJnEojSZFS8x88Kzl4fkmE
	A96MYzy9HCxknKNuMr200IfM+GINR/pUxAyqMfwgBUsF4vMfmyzZutF+yCTG3spDGzGV
	B1qw==
X-Received: by 10.14.3.9 with SMTP id 9mr2076484eeg.72.1378988216651;
	Thu, 12 Sep 2013 05:16:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm5390244eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 05:16:56 -0700 (PDT)
Date: Thu, 12 Sep 2013 14:18:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20130912121823.GZ11500@jama>
References: <cover.1378978986.git.Qi.Chen@windriver.com>
	<4802511117bc648d9cd10d8262645069d9db1317.1378978986.git.Qi.Chen@windriver.com>
	<20130912102503.GY11500@jama> <5231A2F4.7070107@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5231A2F4.7070107@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] update-rc.d.bbclass: change RRECOMMENDS to RDEPENDS
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
X-List-Received-Date: Thu, 12 Sep 2013 12:16:56 -0000
X-Groupsio-MsgNum: 44881
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0k2ZE0YWsaeoufzj"
Content-Disposition: inline

--0k2ZE0YWsaeoufzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 07:18:12PM +0800, ChenQi wrote:
> On 09/12/2013 06:25 PM, Martin Jansa wrote:
> > On Thu, Sep 12, 2013 at 05:43:55PM +0800, Qi.Chen@windriver.com wrote:
> >> From: Chen Qi <Qi.Chen@windriver.com>
> >>
> >> If a package inherits update-rc.d.bbclass, it actually needs it to
> >> update the symlinks under /etc/rc?.d/ directories. This is a runtime
> >> dependency. For example, if we try to upgrade the dropbear on target,
> >> its postinst process will need the update-rc.d utility available,
> >> otherwise, the upgrade process will fail.
> >>
> >> Besides, if we only recommend update-rc.d, the do_rootfs process will
> >> fail once NO_RRECOMMENDATIONS is enabled. Because in OE, we try to do
> >> the postinsts at rootfs time.
> > IIRC it was changed to allow systemd images to be built completely
> > without update-rc.d (with BAD_RECOMMENDATIONS +=3D "update-rc.d") and i=
t's
> > IMHO still valid use-case as update-rc.d is inherited even when systemd
> > is used.
> >
>=20
> Now that the 'rm_sysvinit_initdir' function has been added to the=20
> systemd.bbclass, I think we can safely use RDEPENDS here. Because
> 1) If the /etc/init is removed, update-rc.d command in postinst has no=20
> real effect.
> 2) If the /etc/init is not removed, that means symlinks under=20
> /etc/rc?.d/ should be set up.
>=20
> So I think there's no negative effect if update-rc.d is installed in=20
> case of a systemd system.
>=20
> Also, I don't think adding update-rc.d to BAD_RECOMMENDATIONS is a good=
=20
> idea.
> For example, we have a systemd based image running and we are installing=
=20
> a new package to that image. That package has an init script but no=20
> corresponding service file. If we only recommend update-rc.d and it's in=
=20
> BAD_RECOMMENDATIONS, the install process will fail. This is not what=20
> user might expect.
>=20
> So I'd like to suggest that we change it back to RDEPENDS.

commit 2c403979c03898c679c5a1e1092aec784dbeb77c
Author: Ross Burton <ross.burton@intel.com>
Date:   Tue Mar 5 11:57:00 2013 +0000

update-rcd: drop depends to recommends, check for update-rcd in scripts

This class is still checking if update-rc.d is installed before using
it, so nothing should fail terribly if image developer decides that he
want's image without any sysvinit related stuff.

If you want image which supports both you can add runtime dependency on
update-rc.d somewhere else - it doesn't need to be pulled by every
recipe which inherits update-rc.d bbclass.

> Best Regards,
> Chen Qi
>=20
> >> This patch fixes this problem by changing the RRECOMMENDS to RDEPENDS
> >> to let the packages actually rdepend on update-rc.d.
> >>
> >> [YOCTO #5169]
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   meta/classes/update-rc.d.bbclass |    2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc=
=2Ed.bbclass
> >> index 5588569..3dee13a 100644
> >> --- a/meta/classes/update-rc.d.bbclass
> >> +++ b/meta/classes/update-rc.d.bbclass
> >> @@ -6,7 +6,7 @@ UPDATERCD_virtclass-cross =3D ""
> >>   UPDATERCD_class-native =3D ""
> >>   UPDATERCD_class-nativesdk =3D ""
> >>  =20
> >> -RRECOMMENDS_${UPDATERCPN}_append =3D " ${UPDATERCD}"
> >> +RDEPENDS_${UPDATERCPN}_append =3D " ${UPDATERCD}"
> >>  =20
> >>   INITSCRIPT_PARAMS ?=3D "defaults"
> >>  =20
> >> --=20
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0k2ZE0YWsaeoufzj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIxsQ8ACgkQN1Ujt2V2gBwC2wCfZnCk0ModrF1vW8IxW8k+Jm/Q
+AkAoIPHdrQdEy2tEqn+7si1ZxYQVW9x
=O4dy
-----END PGP SIGNATURE-----

--0k2ZE0YWsaeoufzj--
