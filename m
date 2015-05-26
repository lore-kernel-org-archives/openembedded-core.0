Return-Path: <pbarker@betafive.co.uk>
X-Greylist: delayed 16206 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 May 2015 12:02:37 UTC
Received: from 5.mo3.mail-out.ovh.net (5.mo3.mail-out.ovh.net [87.98.178.36])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD3870331
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 12:02:37 +0000 (UTC)
Received: from mail412.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 3C790FFA0F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 09:14:07 +0200 (CEST)
Received: from localhost (HELO queueout) (127.0.0.1)
	by localhost with SMTP; 26 May 2015 09:14:05 +0200
Received: from cpc19-shep11-2-0-cust55.8-3.cable.virginm.net (HELO
	bang.betafive.co.uk) (paul@betafive.co.uk@81.111.243.56)
	by ns0.ovh.net with AES256-GCM-SHA384 encrypted SMTP;
	26 May 2015 09:14:03 +0200
Received: by bang.betafive.co.uk (Postfix, from userid 1000)
	id 574F940A9C; Tue, 26 May 2015 08:13:21 +0100 (BST)
Date: Tue, 26 May 2015 08:13:21 +0100
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150526071321.GA15470@bang.betafive.co.uk>
References: <1430847181-11913-1-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1430847181-11913-1-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Ovh-Tracer-Id: 2106277252449680357
X-Ovh-Remote: 81.111.243.56 (cpc19-shep11-2-0-cust55.8-3.cable.virginm.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekuddrvdejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekuddrvdejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Cc: Paul Barker <paul.barker@commagility.com>
Subject: Re: [dylan][PATCH] kernel.bbclass: Complete fix for modules symlink
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
X-List-Received-Date: Tue, 26 May 2015 12:02:38 -0000
X-Groupsio-MsgNum: 66020
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 06:33:01PM +0100, Paul Barker wrote:
> From: Paul Barker <paul.barker@commagility.com>
>=20
> The fix backported in commit aa9fc551 of oe-core does not completely fix =
the
> issue (Yocto #4595) as intended. The modules symlink is still created in =
the
> working directory instead of in the deploy directory. To fix this, we jus=
t need
> to use an absolute path to ${DEPLOYDIR} when creating the symlink.
>=20
> Signed-off-by: Paul Barker <paul.barker@commagility.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 324e812..67b662a 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -372,7 +372,7 @@ kernel_do_deploy() {
>  	if [ ${MODULE_TARBALL_DEPLOY} =3D "1" ] && (grep -q -i -e '^CONFIG_MODU=
LES=3Dy$' .config); then
>  		mkdir -p ${D}/lib
>  		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
> -		ln -sf ${MODULE_TARBALL_BASE_NAME} ${MODULE_TARBALL_SYMLINK_NAME}
> +		ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLI=
NK_NAME}
>  	fi
> =20
>  	cd ${DEPLOYDIR}
> --=20
> 1.9.1
>=20

Ping on this patch.

I know it's for dylan but sadly we're stuck with it for now.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJVZB0RAAoJEBwoJlo7UPQD+VQH/1Fn0UIWMLuPdbldbcyOYCKJ
DoGXNlMKWmCMYOrle5AkCDQlaj8Z/7xghoQax9rK2VluYihLKKeMU73lx4U/kRwN
TE9nCiYGOiXKSwdLByMK4HwKhhufISXSOEgVnqZ7DGNwMHvGLKlVIu5suPbCjDib
v6ds/FsxywkSJbimrdonzu46hwbX45TxjA6R5uYFQ49geLh5umNyrBN9RqK8NViY
YFxjJBs5k/gDMEQVDrHD578jvrg4Qdlx2X8Eg9VYcROO1ZqUZkm08ReqTavduB2d
ImBJ7MFPT3TW6q8t9mroMhS3K33TYuzRbuydcrDW6wPVseghLHRSfw/jiiEen/g=
=goBs
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
