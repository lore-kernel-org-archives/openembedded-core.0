Return-Path: <pbarker@betafive.co.uk>
X-Greylist: delayed 8863 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Sep 2015 10:19:24 UTC
Received: from 19.mo4.mail-out.ovh.net (19.mo4.mail-out.ovh.net [87.98.179.66])
	by mail.openembedded.org (Postfix) with ESMTP id 521387701C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:19:24 +0000 (UTC)
Received: from mail437.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 854EC103C14B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:51:38 +0200 (CEST)
Received: from localhost (HELO queueout) (127.0.0.1)
	by localhost with SMTP; 18 Sep 2015 09:51:37 +0200
Received: from cpc19-shep11-2-0-cust55.8-3.cable.virginm.net (HELO
	bang.betafive.co.uk) (paul@betafive.co.uk@81.111.243.56)
	by ns0.ovh.net with AES256-GCM-SHA384 encrypted SMTP;
	18 Sep 2015 09:51:36 +0200
Received: by bang.betafive.co.uk (Postfix, from userid 1000)
	id 1A28740A50; Fri, 18 Sep 2015 08:52:41 +0100 (BST)
Date: Fri, 18 Sep 2015 08:52:41 +0100
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150918075241.GA23863@bang.betafive.co.uk>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Ovh-Tracer-Id: 14017453840488643518
X-Ovh-Remote: 81.111.243.56 (cpc19-shep11-2-0-cust55.8-3.cable.virginm.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekgedrfedvucetufdoteggucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekgedrfedvucetufdoteggucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Subject: [dylan] Backport Request
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
X-List-Received-Date: Fri, 18 Sep 2015 10:19:27 -0000
X-Groupsio-MsgNum: 71275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm not sure if there are many other poor souls still using dylan, but if t=
here
are I'd like to request a backport of the following commit. In our case it =
is
needed to ensure that a package is rebuilt when INITSCRIPT_NAME or
INITSCRIPT_PARAMS is changed in a recipe.

Hopefully we'll be able to upgrade soon, but if so it will probably be only=
 as
far as daisy...

commit 4003218f774c38bb5de0d95a43153f8b8d7fc4ce
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Oct 4 12:29:08 2013 +0100
    udpated-rc.d: Track postinst/prerm/postrm in task checksum
   =20
    When these functions change, the package should rebuild but currently it
    does not. We need to add the dependencies manually as the dependency
    code can't track dynamically created variables.
   =20
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bb=
class
index 5588569..f726f2f 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -54,6 +54,8 @@ python __anonymous() {
=20
 PACKAGESPLITFUNCS_prepend =3D "populate_packages_updatercd "
=20
+populate_packages_updatercd[vardeps] +=3D "updatercd_prerm updatercd_postr=
m updatercd_postinst"
+
 python populate_packages_updatercd () {
     def update_rcd_package(pkg):
         bb.debug(1, 'adding update-rc.d calls to postinst/postrm for %s' %=
 pkg)

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJV+8LIAAoJEBwoJlo7UPQDp1MH/2EY8gXBnYI2AQMsoav0EHAR
c6IdXzVzEYHqEz1/EJm3iN8oKwtSo7J3LKJzieBmEVrCoEQe53kPI+P2yawOjsCo
TRZwsQ70h0/jnWqXuEVapfUkE3MCumHT7fmXUS75nd5wLs/IqMU3I5jpNuL84WHq
9MbUCoiQilVYlJRFqIWf++eQJRTZRjOuLdUFLP5UVIxM2B6qvgvC1Gchhrp/a2zj
4dnt0wI398eMkskIVEtycgNIXMNWp/o9aw5EUIpIJOBMnNgsLYk0z9HnXjEXDl5G
hHvAIqZfSoPg+HMVP0DLK7Xlnch1MWtUNOhoagcqMOJaZEe4vcDG+X5XLH6U/bM=
=pyp6
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
