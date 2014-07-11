Return-Path: <diego.abelenda@domo-safety.com>
X-Greylist: delayed 869 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Jul 2014 13:37:41 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1lp0011.outbound.protection.outlook.com [213.199.154.11])
	by mail.openembedded.org (Postfix) with ESMTP id 071F7701DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 13:37:41 +0000 (UTC)
Received: from Arika (128.179.67.139) by
	AM3PR06MB099.eurprd06.prod.outlook.com (10.242.245.147) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Fri, 11 Jul 2014 13:23:12 +0000
Date: Fri, 11 Jul 2014 15:22:56 +0200
From: Abelenda Diego <diego.abelenda@domo-safety.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140711152256.7c5ad7b8@Arika>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Originating-IP: [128.179.67.139]
X-ClientProxiedBy: AM2PR06CA007.eurprd06.prod.outlook.com (10.255.61.24) To
	AM3PR06MB099.eurprd06.prod.outlook.com (10.242.245.147)
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 02698DF457
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(6009001)(199002)(189002)(99396002)(93916002)(19580405001)(84326002)(89996001)(19580395003)(87286001)(42186005)(101416001)(46102001)(50226001)(102836001)(4396001)(77982001)(79102001)(92726001)(77156001)(512954002)(62966002)(568964001)(66066001)(33646001)(95666004)(110136001)(229853001)(21056001)(33716001)(106356001)(31966008)(74662001)(92566001)(20776003)(107886001)(2351001)(64706001)(107046002)(81342001)(105586002)(81542001)(85852003)(86362001)(88136002)(87976001)(50986999)(83072002)(83322001)(104166001)(71186001)(85306003)(77096002);
	DIR:OUT; SFP:; SCL:1; SRVR:AM3PR06MB099; H:Arika; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; LANG:en; 
X-OriginatorOrg: domo-safety.com
Subject: [PATCH] Try to make urandom more random using the proper seed.
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
X-List-Received-Date: Fri, 11 Jul 2014 13:37:44 -0000
X-Groupsio-MsgNum: 54789
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/PlRDd+kwDZFUsCmncYHUj0H";
	protocol="application/pgp-signature"

--Sig_/PlRDd+kwDZFUsCmncYHUj0H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

=46rom 963a99512475b6bc402d2339fa4e4765960e4c26 Mon Sep 17 00:00:00 2001
From: Diego <diego.abelenda@domo-safety.com>
Date: Fri, 11 Jul 2014 14:30:56 +0200
Subject: [PATCH] Try to make urandom more random using the proper seed.

If we follow the syntax here we think that previously, at shutdown, the see=
d file was created after urandom was re-seeded with its state at boot. This=
 might make the state of urandom pretty similar to its state at last reboot=
. Even if it might not be the case since the /etc/init.d/rc script tells us=
 that it stops services in reboot and shutdown runlevels.

If this patch does not makes the initscript called with argument start at b=
oot and stop at shutdown, it will at least make things less confusing and g=
ive the correct names for the /etc/rc?.d/ links. But from what I understand=
, the initscript will not be called at all at shutdown because of the doubl=
e start pervention in /etc/init.d/rc.

---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipe=
s-core/initscripts/initscripts_1.0.  bb
index 531b2b6..b266ba6 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -104,7 +104,7 @@ do_install () {
 #
    update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .=20
    update-rc.d -r ${D} sendsigs start 20 0 6 .=20
-   update-rc.d -r ${D} urandom start 30 S 0 6 .
+   update-rc.d -r ${D} urandom start 30 S . stop 30 0 6 .
    update-rc.d -r ${D} umountnfs.sh start 31 0 6 .=20
    update-rc.d -r ${D} umountfs start 40 0 6 .=20
    update-rc.d -r ${D} reboot start 90 6 .=20
--=20
2.0.0

--Sig_/PlRDd+kwDZFUsCmncYHUj0H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTv+UzAAoJEKJk+FAH5Bn4rTwQANOuwWXUi7nvqtt7LPKL7F5C
FcJSTFxGMXy0a8sI2c7wg0N3kmAOgtqwXVOyXMIuY5bwTJ00rR8jfm6mLpGA4Hmm
BsaDRjFGHySniPhjH5Fu+UN/6J4/GTY+Ef7JMWxUHgcIEtMF2LPrLVGWo0lYMRy2
d9NfVbZ0XOiCEHZqwYUgZ/TuNkMgfZaiPFFxKACycsv2Ncklz1DeRtWU6m6Tl7eL
OIPJH+M2IkyZ1CVpRFk6R0ac6BuCllTt+v6zTiRfM7pzfknIiDl2UAP9XlEGIYbn
oAfGkuBy0w+Bh5YGL3ODQNZow39RFzRdN1syeQHhmVuiatBXqE42/B59+iw3erCI
AUtqjVZkfAfk7I6FtFHRkd4q6BfSYBptCKAI79qUtijGhrBv2mQJkJu/5Oz9vAC+
ppT8pigQsmzUQSK3aOetoTjOa8ZzDmxob7VfICWOKO4OINDBb1zm4D6Ehq8crIep
KffAn87VeQod0DOCbYKHOJ1hhCXVXaRW9xFmXobN38kRpO1IqNTSfMPavJdx5vzt
oNyrprIRtXR1etRhlrP1gfkAerfi08rPWEL8hYHMkubBd7erTEhsidAvhCDCa9QQ
OaYWA+csPHWy+D1x+3066Txu3hoCnxkpRoA2SIaotrGc2YoWRVFloPVsZmWXElBF
DUsjiwqbfAC4gIztnJv1
=fiPT
-----END PGP SIGNATURE-----

--Sig_/PlRDd+kwDZFUsCmncYHUj0H--
