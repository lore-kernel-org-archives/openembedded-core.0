Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01ACE7C0C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 00:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6E0371832C;
	Tue, 15 Jan 2019 01:59:32 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Dpvblo1inVo0; Tue, 15 Jan 2019 01:59:31 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6DD7118423;
	Tue, 15 Jan 2019 01:59:31 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E0DD1E083;
	Tue, 15 Jan 2019 01:59:31 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12A5E1E078;
	Tue, 15 Jan 2019 01:59:31 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 15 Jan 2019 01:59:31 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 0699D2A41;
	Tue, 15 Jan 2019 01:59:31 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 15 Jan 2019 01:59:31 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 15 Jan 2019 01:59:30 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] systemd: Correct and clean up user/group
	definitions
Thread-Index: AQHUrGwzMBDxaXVM9kezRJfnbq4F7qWvgG3w
Date: Tue, 15 Jan 2019 00:59:30 +0000
Message-ID: <de0650c05fe84ea58d3ee89fa6bfef7f@XBOX04.axis.com>
References: <20190115004906.5256-1-pkj@axis.com>
In-Reply-To: <20190115004906.5256-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/2] systemd: Correct and clean up user/group	definitions
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
X-List-Received-Date: Tue, 15 Jan 2019 00:59:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 15 januari 2019 01:49
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] systemd: Correct and clean up user/group
> definitions
>=20
> This makes sure that packages are only added to USERADD_PACKAGES if
> they will create users/groups. This avoids the following error:
>=20
>   ERROR: systemd_239.bb: meta/recipes-core/systemd/systemd_239.bb
>   inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or
>   GROUPMEMS_PARAM for package systemd-journal-gateway
>=20
> Normally this problem is not triggered even if the conditional code
> that
> expands in, e.g., USERADD_PARAM_${PN}-journal-gateway is empty because
> it is assigned with +=3D and thus ends up as " ", which fools the check
> in
> useradd.bbclass.
>=20
> However, if USERADDEXTENSION +=3D "useradd-staticids" and
> INHERIT +=3D "extrausers" are used, they cause the problem to occur. The
> reason for this is because when useradd-staticids is used, it rewrites
> USERADD_PARAM_${PN}-journal-gateway, which strips unnecessary
> whitespace
> and thus USERADD_PARAM_${PN}-journal-gateway becomes empty. And
> extrausers is needed, because otherwise the test in useradd.bbclass is
> triggered before useradd-staticids has rewritten the variables...
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/systemd/systemd_239.bb | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-
> core/systemd/systemd_239.bb
> index be836ffa42..aa05af3beb 100644
> --- a/meta/recipes-core/systemd/systemd_239.bb
> +++ b/meta/recipes-core/systemd/systemd_239.bb
> @@ -343,17 +343,21 @@ SYSTEMD_PACKAGES =3D
> "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
>  "
>  SYSTEMD_SERVICE_${PN}-binfmt =3D "systemd-binfmt.service"
>=20
> -USERADD_PACKAGES =3D "${PN} ${PN}-extra-utils ${PN}-journal-gateway
> ${PN}-journal-upload ${PN}-journal-remote"
> -USERADD_PARAM_${PN}-journal-gateway +=3D
> "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M
> --shell /bin/nologin systemd-journal-gateway;', '', d)}"
> -USERADD_PARAM_${PN}-journal-remote +=3D
> "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M
> --shell /bin/nologin systemd-journal-remote;', '', d)}"
> -USERADD_PARAM_${PN}-journal-upload +=3D
> "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d /
> -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
> -USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;',
> '', d)}"
> -USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;',
> '', d)}"
> +USERADD_PACKAGES =3D "${PN} ${PN}-extra-utils \
> +                    ${@bb.utils.contains('PACKAGECONFIG',
> 'microhttpd', '${PN}-journal-gateway', '', d)} \
> +                    ${@bb.utils.contains('PACKAGECONFIG',
> 'microhttpd', '${PN}-journal-remote', '', d)} \
> +                    ${@bb.utils.contains('PACKAGECONFIG', 'journal-
> upload', '${PN}-journal-upload', '', d)} \
> +"
> +GROUPADD_PARAM_${PN} =3D "-r systemd-journal"
>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;',
> '', d)}"
> -USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;',
> '', d)}"
> +USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;',
> '', d)}"
>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'polkit', '--system --no-create-home --user-group --home-dir
> ${sysconfdir}/polkit-1 polkitd;', '', d)}"
> -GROUPADD_PARAM_${PN} =3D "-r systemd-journal"
> -USERADD_PARAM_${PN}-extra-utils +=3D "--system -d / -M --shell
> /bin/nologin systemd-bus-proxy;"
> +USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;',
> '', d)}"
> +USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;',
> '', d)}"
> +USERADD_PARAM_${PN}-extra-utils =3D "--system -d / -M --shell
> /bin/nologin systemd-bus-proxy"
> +USERADD_PARAM_${PN}-journal-gateway =3D "--system -d / -M --shell
> /bin/nologin systemd-journal-gateway"
> +USERADD_PARAM_${PN}-journal-remote =3D "--system -d / -M --shell
> /bin/nologin systemd-journal-remote"
> +USERADD_PARAM_${PN}-journal-upload =3D "--system -d / -M --shell
> /bin/nologin systemd-journal-upload"
>=20
>  FILES_${PN}-analyze =3D "${bindir}/systemd-analyze"
>=20
> --
> 2.12.0

This also needs to be cherry-picked to Thud once it has been accepted for=20
master. I assume it is too late for 2.6.1, but one can always hope...

//Peter


