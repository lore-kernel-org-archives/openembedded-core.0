Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 29D027D597
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 12:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 46531185E5;
	Fri, 12 Apr 2019 14:05:37 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gj9maeCzb9mM; Fri, 12 Apr 2019 14:05:36 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id DA613186D7;
	Fri, 12 Apr 2019 14:05:35 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C35441E06E;
	Fri, 12 Apr 2019 14:05:35 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B82C81E066;
	Fri, 12 Apr 2019 14:05:35 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 12 Apr 2019 14:05:35 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id AC2981A4;
	Fri, 12 Apr 2019 14:05:35 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 12 Apr 2019 14:05:35 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Fri, 12 Apr 2019 14:05:35 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Wenlin Kang <wenlin.kang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] systemd: install libnss-myhostname.so when
	myhostname be enabled
Thread-Index: AQHU74GuFTjmZlQL3kyBDIXo/8YWh6Y4boEw
Date: Fri, 12 Apr 2019 12:05:35 +0000
Message-ID: <755e2a014f114ecdb7e02ed6b7040578@XBOX04.axis.com>
References: <1554888273-111881-1-git-send-email-wenlin.kang@windriver.com>
In-Reply-To: <1554888273-111881-1-git-send-email-wenlin.kang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] systemd: install libnss-myhostname.so when	myhostname be enabled
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
X-List-Received-Date: Fri, 12 Apr 2019 12:05:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Wenlin Kang
> Sent: den 10 april 2019 11:25
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] systemd: install libnss-myhostname.so when
> myhostname be enabled
>=20
> This fixes the follow issue, the cause is that net-tools needs
> libnss-myhostname.so when run "hostname -s".
>=20
> root@qemuarm64:~# hostname -s
> hostname: Unknown host
>=20
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_241.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core=
/systemd/systemd_241.bb
> index bfbfc81..251daaa 100644
> --- a/meta/recipes-core/systemd/systemd_241.bb
> +++ b/meta/recipes-core/systemd/systemd_241.bb
> @@ -547,6 +547,7 @@ FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${=
datadir}/dbus-1/interfaces/ $
>  RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev (=
=3D ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
>  RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty=
-generator', '', 'systemd-serialgetty', d)}"
>  RDEPENDS_${PN} +=3D "volatile-binds update-rc.d systemd-conf"
> +RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'myhostname',=
 'libnss-myhostname', '', d)}"

Do this via the PACKAGECONFIG instead, i.e., change the existing=20
PACKAGECONFIG for myhostname to:

PACKAGECONFIG[myhostname] =3D "-Dnss-myhostname=3Dtrue,-Dnss-myhostname=3Df=
alse,,libnss-myhostname"

>  RRECOMMENDS_${PN} +=3D "systemd-extra-utils \
>                        systemd-compat-units udev-hwdb \
> --
> 1.9.1

//Peter


