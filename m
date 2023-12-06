Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5486C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 22:34:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web10.51295.1701902043644775150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 14:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=k3iRPI1Z;
 spf=pass (domain: axis.com, ip: 40.107.22.76, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4GCd/xm38T+igW980h/tSYepTPuMB3Gd20xNgZLUv7cW6H7YSGBP29gJUNh284EtWzxna5rZ2wsw9qWAb+94GA0c63FIs8EVxg4JG2/syHTkXyPceCXRdCgLWOF0oETNbJYT27UAvCOwtos2GZRpvwKDKWiaYNMMuvAlWJeOGGOiALsLIWK8bvKau/DHWiVUVMm/Oehnl6AIwwtogrb5MLBo9OxtXjSowpP205XkEM6fTFA1dSGRO9OW7DuUeyS9jUArIaxXC8rAnGbrGT6WjdL5auQypRk0OCxmOK5sNo71qKfiyh8XWWWg6NjIWJT2R7HI63zsCFXnJ34PIcBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srrnZfAdM049tS1wq+RiYillH+1whTZR7m4w85E6aS4=;
 b=X2zUy+rUT+V8+OOY7AgIHo7u9hiqxaCZnz2Wp7bsxNHvt72yG8K7ycG8M5/rrlwaTYgMta5tkZsIlQjkR3bYdgJR1BT9NLpY+bMJMSZNKO3Y30sNtJ5W7f/BHY1vxFUmEIkA/NtFUSDcwW/NTGCPWHag6t4hJR6qLMh2RxQ9jJnjtIvdlfV7xPI7khHu0CqAnWjVE14roOofU2t0Ikr3nR1qqr9SeAhJxg6itYUj3StMcGlrJ1HH3xKZA4iqov1bsnJTp+8I1N9NvuY/ncF/emsJmidQc5i6fMWLRKWczeZPGF4umw5bpWsXa89wuWT0mt0G27fTSrKMhakSgXF4SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srrnZfAdM049tS1wq+RiYillH+1whTZR7m4w85E6aS4=;
 b=k3iRPI1ZtMQvEW/G+sE92Dx37DZv9iq2aBeuSaSN8c2PmEtHPtky1JnxYZ30swqorjbAMWi6O1+exwgRgHJ7jQRDXQWyNoXTKHCv1ZsuHeha0CuqJ01aYgUrgN62ZV5vPwbzrL3WSsy6TaZvZKYz+Mp5Xw4hjwi16uiUvqaUlJk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBAPR02MB6487.eurprd02.prod.outlook.com (2603:10a6:10:194::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 22:34:00 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%6]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 22:34:00 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option to
 customize sshd mode
Thread-Topic: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option to
 customize sshd mode
Thread-Index: AQHaJz80yjiDqvHewESrfhYpxZUvYbCc1VxQ
Date: Wed, 6 Dec 2023 22:34:00 +0000
Message-ID: 
 <DB5PR02MB102131007FD5B5098EB7D4D6CEF84A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <ef31fe38-2390-ecb8-405a-570895ef1ab9@windriver.com>
 <20231205055201.1738005-1-mingli.yu@windriver.com>
In-Reply-To: <20231205055201.1738005-1-mingli.yu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBAPR02MB6487:EE_
x-ms-office365-filtering-correlation-id: 72a24e83-8fe3-41bf-1245-08dbf6ab7125
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OJfLobsRUUVI8dxSyMFrQMtQJquxgNJnxwBFzM2DRwzGSeahZ2wG1J/prJwM3qhmUslpZhXyFFLoXd0A938yF6LmW+27VFdLxu3P3P+T0U5p/ZpCbZjvOeRat5AwsueZWlb6U8oFlDUu6Ve+txUGJn2SrXnFbjq0zSih0nHmx5xmUbwaZulx3f4WEz21txZSyp6K+avjqrv9JPceXt1/diOwgCVCZmyX3iid6/E7ZvbsI1al4O6+e/sRLg0Hy2jCQnLqElTZyM48gvtpWkkn1J8avzVj2vc9KION+ck8twh11NYxkmsPZNlDAxBnqA9lyyuyxs4pjBE82qvkBEebDS+fcahu4RfiIKUqdx90ygj3LRR1vf9nW6zrw9hccFO7akGEaUL7svhcTgadZXli74o58SCKQGOgWqocdhAcyVTcSW3RN7WfKLAMhZoB5OI0bhB/XD6X9xnkbDS6O5kFnyFlHinS83Za+3MvkrWkJqbOUns5k/LTgI0mpqeWOcqpDJSb5oWw4hiNs7cpHecM0W3GZt/nV4Z6TJkmm8hVOTs9plpIybGJepd5kB6gI8YK9o0WWv0MwhKi3qsGB6KLBIaag8GI1XPnbOit99weHx5+THmTmtHDEbAx1/uUtfMr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(39850400004)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(122000001)(38100700002)(41300700001)(86362001)(55016003)(33656002)(83380400001)(7696005)(9686003)(38070700009)(53546011)(71200400001)(6506007)(2906002)(8936002)(8676002)(478600001)(316002)(44832011)(110136005)(52536014)(26005)(76116006)(5660300002)(66556008)(66946007)(66446008)(64756008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Y+1POCuB3BmGO0qIhWAgD54BHHFQl7winFFkTlsPuYMZlznGZlHF1dM1i153?=
 =?us-ascii?Q?CwhGDzoOIU0PdJ3VSxJ8h++XUjILST2ZEGbZ4bkGeQmkJCQRVpwDfW0tgF5Z?=
 =?us-ascii?Q?NxZcuGfYausOoeOcYhCk2tvUiUZV6tx7af/d4B8X5SLKcrJs8t3oK2BGTaP0?=
 =?us-ascii?Q?eAkzYIYuvauW6rsMkPxcUlaChHwt6sR5BlSNuzJoO2K8O/vG8DyEcVcU5CqJ?=
 =?us-ascii?Q?SDJTuCmAKzm56xZJXsm7pJNyKtZ34OxNUia57nvdb6D1OIRWUtTFTl4MUamN?=
 =?us-ascii?Q?k17Lj5mv4idKsQ952vIdu1ZZDlzlIDlSJDNRWRtVeGL/xrIujvjjTNuhM5Ka?=
 =?us-ascii?Q?jSMdgVgFJ+FbgrxAOLam6CQfXzgWuSCqJHNWa1DUD8dmlKsmZ/mNqJcRvOMm?=
 =?us-ascii?Q?aBw3RAdZI5DhWr/4u7qGjUGrWUxVlfStOgb+qOEfnn4Vy/fIoEbkdWhChjrI?=
 =?us-ascii?Q?35V5X/AG+MwCIyH2JY1RHj4hH563iRDF9laY7iRmnXmBbeJ0xneYGCfHTC1p?=
 =?us-ascii?Q?pU9dWfVgv3JDevK5w+Dm4TnqvIgRAQbA7hjTCFMK7+fCckKymPUXzhFPi/vx?=
 =?us-ascii?Q?+jahJcjYKUVlMzNeVo6QgQk9On5DS7FzR/kELUlDZRKIhe1Fr6FEl1AMlXyr?=
 =?us-ascii?Q?NFSLpzBn3z8ZVTysc//egqnnwusnOKsG/uszZmA92bpWGBURdG46TTnDCyrG?=
 =?us-ascii?Q?Dwdm2XwmBCfjIjAF3tSH9CGbBNanMlfS5ctFB/u3vkNt6o+psMZWj/NLIezF?=
 =?us-ascii?Q?LYv4m6kXwzvyqJHmHfZsTfb0Ubd4xTfiyAXLEnKU+5/yatnuIJ2WUMtcHxIJ?=
 =?us-ascii?Q?OfGx5YqrTHcVph0fskpnXSnrGeQiumNV/9FfxsO2D8NZRz5B041SImS5GzWj?=
 =?us-ascii?Q?N+V9J9rOY4H3jjXHIdJwdF/XTk/4l6OgTcdnRsGXJFmqboi7VXtLICIZ6AXS?=
 =?us-ascii?Q?2bXLUxZSKTl9HOlQL2DBLBA9mmaJaKjRZMJN+/oIMO0l7XvHk7DtCmW5SZGD?=
 =?us-ascii?Q?GV0l9WFoB05VwzjNBZ/zZQ7ZWoksPgpg46D5KeaX6a8KTaSzslMwP/6tyBWd?=
 =?us-ascii?Q?WYAzfMs8Bxzv7o4SPw7inHvHEeUk2vfGW9GhrahzKYqUK6+0VSs1EDdlqn4/?=
 =?us-ascii?Q?cc8I2l1z6j5SpUie50Gqh7QQ2b0fPCc+qJjLq6YG70NUBZHo91zjVt5xE4i0?=
 =?us-ascii?Q?o9YnUhrmh4HUEZnaEel6Sj3oiD6AYUXGWqsA7U2B7b9DWO+YsjJUmyTgYw7i?=
 =?us-ascii?Q?JvZcLIn7cj7Mnkj/t2FrxVlmQv3Vi1Whu4a32DKSWeuOeNaLr7CSKQfuJ5EK?=
 =?us-ascii?Q?wMTSpvcr2BcQGNRp8K92r94tGfhMggD3/OP6qYnyezd0hc7r6rKRu5J4Ry3k?=
 =?us-ascii?Q?0bYLI2oQ/+RzTo4Qpho42yBw1F6noYL3cCuLq2VPytEmgDNqgQQwIlu1O+yk?=
 =?us-ascii?Q?UKAn1LwIqYGhqWSvZuqz7jo5qU0816s3l3XSFbpPFbbPS1A7aJjCIDMFDS7A?=
 =?us-ascii?Q?uaHVDjeCc7v891Z0/J+BhPci6O8/sIoCeaZOHk3kYl/4/KDpvGmpmIZFqdGZ?=
 =?us-ascii?Q?VlqviMZzl/JWHMihDIg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a24e83-8fe3-41bf-1245-08dbf6ab7125
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 22:34:00.0523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +bPESLK8orbTH5l8l3zl/woMYATGqDJ4SUHNFFGef2GCAL/p++mv0nT/FkNs1hlC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6487
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 22:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191936

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Yu, Mingli
> Sent: den 5 december 2023 06:52
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] openssh: Add PACKAGECONFIG option to custom=
ize sshd mode
>=20
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> Add systemd-sshd-socket-mode PACKAGECONFIG option to choose sshd.socket
> and systemd-sshd-service-mode PACKAGECONFIG option to choose installing
> sshd.service.
>=20
> The systemd-sshd-socket-mode PACKAGECONFIG option is enabled by default
> and user can customize the above two PACKAGECONFIG option to choose the
> sshd mode.
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../openssh/openssh_9.5p1.bb                  | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.5p1.bb
> index bbb8fb091a..a10f5c5a61 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> @@ -50,16 +50,20 @@ INITSCRIPT_NAME:${PN}-sshd =3D "sshd"
>  INITSCRIPT_PARAMS:${PN}-sshd =3D "defaults 9"
>=20
>  SYSTEMD_PACKAGES =3D "${PN}-sshd"
> -SYSTEMD_SERVICE:${PN}-sshd =3D "sshd.socket sshd.service"
> +SYSTEMD_SERVICE:${PN}-sshd =3D "${@bb.utils.contains('PACKAGECONFIG','sy=
stemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains('PACKAG=
ECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}"
>=20
>  inherit autotools-brokensep ptest pkgconfig
>  DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'system=
d', '', d)}"
>=20
> -PACKAGECONFIG ??=3D ""
> +# systemd-sshd-socket-mode means sshd.socket and systemd-sshd-service-mo=
de
> +# corresponding to sshd.service
> +PACKAGECONFIG ??=3D " systemd-sshd-socket-mode"

Unnecessary leading space after the first quote.

>  PACKAGECONFIG[kerberos] =3D "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] =3D "--with-ldns,--without-ldns,ldns"
>  PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] =3D "--with-mantype=3Dman,--with-mantype=3Dcat"
> +PACKAGECONFIG[systemd-sshd-socket-mode] =3D ""
> +PACKAGECONFIG[systemd-sshd-service-mode] =3D ""
>=20
>  EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
>=20
> @@ -125,15 +129,23 @@ do_install:append () {
>  	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/s=
sh/sshd_config_readonly
>=20
>  	install -d ${D}${systemd_system_unitdir}
> -	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
> -	install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir=
}
> -	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdi=
r}
> +	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','tru=
e','false',d)}; then
> +	    install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unit=
dir}
> +	    install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_un=
itdir}
> +	    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +		    -e 's,@SBINDIR@,${sbindir},g' \
> +		    -e 's,@BINDIR@,${bindir},g' \
> +		    -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> +            ${D}${systemd_system_unitdir}/sshd.socket

There is no need to duplicate the sed command here. The original=20
command below would take care of all the files that are actually=20
installed.

> +	elif ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','=
true','false',d)}; then

Are the PACKAGECONFIGs mutually exclusive? The `elif` indicates=20
that this is the case. If so, they should be marked as mutually=20
exclusive by changing them to:

PACKAGECONFIG[systemd-sshd-socket-mode] =3D ",,,,, systemd-sshd-service-mod=
e"
PACKAGECONFIG[systemd-sshd-service-mode] =3D ",,,,, systemd-sshd-socket-mod=
e"

Alternatively, if it is useful to be able to install both the=20
sshd.socket file and the sshd.service file at the same time, then
the `elif` should be changed to a `fi` and an `if`.

> +	    install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_uni=
tdir}
> +	fi
>  	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_system_=
unitdir}
>  	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>  		-e 's,@SBINDIR@,${sbindir},g' \
>  		-e 's,@BINDIR@,${bindir},g' \
>  		-e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> -		${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd_system_unitdir=
}/*.service
> +		${D}${systemd_system_unitdir}/*.service

Keep it as it was.

>=20
>  	sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
>  		${D}${sysconfdir}/init.d/sshd
> --
> 2.25.1

//Peter


