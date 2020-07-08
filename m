Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web11.13762.1594223302812715872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 08:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 4B23cM0VmzzlbJZ
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 17:48:19 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4B23cL2vsfz2TSBr
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 17:48:18 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.17) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 8 Jul
 2020 17:48:17 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: license.manifest misses header-only libraries
Date: Wed, 8 Jul 2020 17:48:17 +0200
Message-ID: <15493295.j7L6bUlEPz@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [192.168.54.17]
X-RMX-ID: 20200708-174818-4B23cL2vsfz2TSBr-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

According to [1], a license manifest is generated during image creation:

"The Yocto Project generates a license manifest during image creation that =
is located in ${DEPLOY_DIR}/licenses/image_name-datestamp to assist with an=
y audits."

This manifest lists all packages installed on the target (either being inst=
alled
directly via IMAGE_INSTALL or due to other packages RDEPENDS).

The manifest seems to miss header-only libraries (like tclap or big parts
of boost), which were used during compilation (headers) but do not
contain dynamic libraries required at runtime. I guess that the same
may be true for libraries linked statically.

Setting RDEPENDS_${PN} +=3D "tclap" in my own applications recipe
seems to improve the situation as now the (empty) package tclap
is included in my image and in the license.manifest. But this requires
manual work and cannot do this for all recipes shipped by OE.
Additionally this doesn't work for boost, as rdepending on boost
will pull in ALL boost library packages.

Is there a reliable way to get the header-only/static libraries into
the manifest file?

regards
Christian

[1] https://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html#main=
taining-open-source-license-compliance-during-your-products-lifecycle


________________________________
 [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1=
.jpg] <https://microsites.arri.com/stellar/>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler
