Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id BDB8D74197
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 12:26:30 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so15930776wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0se6obzT4rhyL6ywR+Xm1B99xFvU927dJ7vZSXMTylE=;
	b=UPAj4uAo78j7HWtV//V3cnPouOcACtuOCv4MqU4cHqCjSZlj3vvs86k0aGmlqkPbpm
	O5ALqb9vGLlWeTY/T2k5+Oqe/yjbfHzdhawrDNbF7rJK7ANWNaV9gSzHV2LRXxInNEEJ
	W8NGjTDas8R4ACQ8njtBgznaftBToLIc2Rlfek3WCmHDfcXojZjRCiDzXMtKK/NXrfBS
	o5+rVtFuC2od/i1L0JgsDGZDc0DyB/jYxDZuvpFp5V4khSLGpZCaDksZm8ze47mNtNef
	zpK/F4RaKbcmPLtxsGKhu+nDAub+SlkCu3SaH+CvZfPQJ++UQxEs7Ljk5QTOdSosRkyI
	zZ/w==
X-Received: by 10.180.99.232 with SMTP id et8mr6673026wib.80.1441369590373;
	Fri, 04 Sep 2015 05:26:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id p3sm3894915wib.16.2015.09.04.05.26.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 05:26:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Sep 2015 14:27:02 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150904122702.GB2457@jama>
References: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [RFC][dizzy][fido][master][PATCH 1/3] rootfs.py: Allow to override postinst-intercepts location
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
X-List-Received-Date: Fri, 04 Sep 2015 12:26:31 -0000
X-Groupsio-MsgNum: 70655
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline

--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2015 at 02:22:26PM +0200, Martin Jansa wrote:
> * useful when we need to overlay/extend intercept scripts from oe-core

2/3 and 3/3 could be a bit dangerous or controversial (main reason why
this was sent as RFC), but this one is really useful for us to apply
these fixes in advance (and without backporting them all to fido and
dizzy) - so if you agree please merge 1/3 to master, fido and dizzy.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/lib/oe/rootfs.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index c29843b..76950ec 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -164,6 +164,9 @@ class Rootfs(object):
>          pre_process_cmds =3D self.d.getVar("ROOTFS_PREPROCESS_COMMAND", =
True)
>          post_process_cmds =3D self.d.getVar("ROOTFS_POSTPROCESS_COMMAND"=
, True)
> =20
> +        postinst_intercepts_dir =3D self.d.getVar("POSTINST_INTERCEPTS_D=
IR", True)
> +        if not postinst_intercepts_dir:
> +            postinst_intercepts_dir =3D self.d.expand("${COREBASE}/scrip=
ts/postinst-intercepts")
>          intercepts_dir =3D os.path.join(self.d.getVar('WORKDIR', True),
>                                        "intercept_scripts")
> =20
> @@ -173,8 +176,7 @@ class Rootfs(object):
> =20
>          bb.utils.mkdirhier(self.deploy_dir_image)
> =20
> -        shutil.copytree(self.d.expand("${COREBASE}/scripts/postinst-inte=
rcepts"),
> -                        intercepts_dir)
> +        shutil.copytree(postinst_intercepts_dir, intercepts_dir)
> =20
>          shutil.copy(self.d.expand("${COREBASE}/meta/files/deploydir_read=
me.txt"),
>                      self.deploy_dir_image +
> --=20
> 2.5.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXpjhUACgkQN1Ujt2V2gBx59wCcDFbehmfDfiJhH3iwjjkPAr0v
NUgAoI0OfMf9Sh8OLlEk1ITQybBY3j1b
=drYW
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
