Received: from mailout09.rmx.de (mailout09.rmx.de [94.199.88.74])
 by mx.groups.io with SMTP id smtpd.web10.21975.1594739244685189324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 08:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.74, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout09.rmx.de (Postfix) with ESMTPS id 4B5kQJ2PB1zbk87;
	Tue, 14 Jul 2020 17:07:20 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4B5kQF4dyCz2TRjk;
	Tue, 14 Jul 2020 17:07:17 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.74) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 14 Jul
 2020 17:07:17 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christopher Larson <kergoth@gmail.com>
Subject: Re: [OE-core] How to install individual -lic packages
Date: Tue, 14 Jul 2020 17:07:16 +0200
Message-ID: <1677376.LsCQ3QojgJ@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <162080BCA151ECDB.25249@lists.openembedded.org>
References: <2349716.bIJK7JYWuR@n95hx1g2> <CABcZANmiNUMz1W8UKpsFKmjJ9DvCCepH2u3XjSeKaZUaaXHkcw@mail.gmail.com> <162080BCA151ECDB.25249@lists.openembedded.org>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.74]
X-RMX-ID: 20200714-170717-4B5kQF4dyCz2TRjk-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In the meantime I could answer the question myself:

Am Freitag, 10. Juli 2020, 23:16:39 CEST schrieb Christian Eggers:
> [...]
> I think this is not what I require. How can I install -lic packages
> directly?

In order to known by other (image) recipes, -lic packages must be
added to PACKAGES_DYNAMIC. This is done in my distro.conf but should also w=
ork
from local.conf:

# Create separate ${PN}-lic packages for all recipes
LICENSE_CREATE_PACKAGE =3D "1"
# -lic packages are created dynamically. Satisfy dependencies to it (requir=
ed
# if a -lic package needs to be installed directly (e.g. via IMAGE_INSTALL)
# instead of being installed due to RRECOMMENDS_${PN}).
PACKAGES_DYNAMIC +=3D "^${PN}-lic"

After adding ${PN}-lic to PACKAGES_DYNAMIC, arbitrary -lic packages
can be added to an image recipe by using IMAGE_INSTALL. As an alternative,
other packages can RDEPEND on them.

regards
Christian



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
