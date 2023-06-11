Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411D1C7EE23
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 21:25:59 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.45229.1686518755925512036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 14:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=JQbvlxi2;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1686518756;
  x=1718054756;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j294BP5H/ATaYt0iwKJzjZGg7xS4RDmayKF6ZNBIXSQ=;
  b=JQbvlxi2GOP5/QR/jB7OyKqkmy4jmHrDlhcxQp0ol117K+o654RUtEFd
   UTxP6/bNkXxl8w4jlPDiadDWEQlXvmz8bWBqUKSL9WOPBNqLgIrqIv15w
   m0jSfJjzuW0NKnAwb5ZflTPz4FRVzuCZKr8Z4HDgRWVGj0PG+wycKiPxc
   QQpNN4p2hjReXXpoZIcwdLOnExHPWWYrY4hW93voCwJykRh/Tvuyw2JaH
   fnAZ8b/F1tY8ib8BAy24H/YK9aUqgcFNPX00sig/ed0Xt0eXjCfyK5G4q
   FTqAG7h+dbugMdZHGpKq2zKOHq6t1zHr3ECqcL6j6MW4FN1D+vbava9+1
   A==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtrG55J7HV9bW/nQlDN7eS2X20dENK6M4CmotW65BOwxVUsCHP9WLIkyKcoAqRZ2Z1mFedj3xJI/kZx8KudFGSn0SiI/Q4vHpMkaSDxlEK5VnoZbmOYA00H8PfRgFni7SWiNUsNePkPpQBjwt30shPqxqwYM5JND2CYWSMHKvJLLIXcSbWdofSF7n0HnRcKeLi3MoBqJeIawwUfxUcTihXZA8zvzQWPqwnBXyxPhiUY34KT+FuB4kexOByAcrJ1UCeMPiBeTD714PWl1gPEvJks7u3NxXyCQGCSWTURsavcaVTDTtEPn0anh+p3hlCGFr+yx9nhOMcqhVddbAehDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j294BP5H/ATaYt0iwKJzjZGg7xS4RDmayKF6ZNBIXSQ=;
 b=F8fUTDarnlCsPZN8lp6TRNB1IWuHFADBaMOPf9Pj7VpQloBULJuuVmuBy5p1NwZGe3W0IneUZd/Rc1YqO9qZJfmOaI8EJ3vyfPDielKaR9MF9HPMNmmcGursUsgQwb7EPsv6xP9KVgJHwjoGvgMrZ6CfSYxjTIIB7gdpvw7fWIGDYdXTuxo5Vx5w2P/0BAwAtV5aGihVPbJXVhHiSCcR9cBS3dvR0tVfnAnsqHXIvusoxtgaU0IHdfunFCLWwGTEU2442AVgBN7zluD6AKKsTIyFYLO9JPjW+jTbehR10ThJ+J31bQ0fguHBFd0+z4nEjXu+2xOhzWz037pvxB+A0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j294BP5H/ATaYt0iwKJzjZGg7xS4RDmayKF6ZNBIXSQ=;
 b=Zx8zM6X1i1aHAIREMJKwCc51cQ3fhD3bqNaVoewFjcNh6a7ZAhqV9RLktDNu/yTrVc2+LHgzHVrFyPEpnZWJg6ri0TFffeYfsBYcvsVxFMGGaZzFcugdO7EH5JOMPYBwoEtm3A4DrOpqvlS8JJYwuaTzegiRbWzU1zHMUp46wnA=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "rs@ti.com" <rs@ti.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"reatmon@ti.com" <reatmon@ti.com>, "denis@denix.org" <denis@denix.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 4/6] weston-init: fix the mixed indentation
Thread-Topic: [OE-core][PATCH 4/6] weston-init: fix the mixed indentation
Thread-Index: AQHZmzjx/G59YnmtU0CwX7A4Kek356+GHOLQ
Date: Sun, 11 Jun 2023 21:25:51 +0000
Message-ID: <DB5PR02MB102136F50D6C9E9121C9FD08FEF57A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230610011339.3716428-1-rs@ti.com>
 <20230610011339.3716428-5-rs@ti.com>
In-Reply-To: <20230610011339.3716428-5-rs@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAXPR02MB8042:EE_
x-ms-office365-filtering-correlation-id: 04fbb902-f56d-4ce8-e8c3-08db6ac26e7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cmg0XAUrmgUmsBvW1YZ06uoiNTUAIm0gVTN8e0tNJxkU8IdIELp75dBIwseJx41PX/omdqBjth3NwsocNmOytllEYkECsl2Y5mmBiiI33iZT16tVe5DfSTOLH5XNVKgijyhJ1Yk+tAjkuFQQKMSSwa8AmDZ6ohnC7s59giYYH+PHNvldJqfGcekqfj0al+nGzG0Z0bkyuyUzGfvoMgMsnpXYS/DZ+qZcnZ3bvVFO3DPJV1ttVCAobf5aeidAAOcdnnacnMON6dQowc7ReWudV6HWkIfDqDu7/KpHYv/RMsPXshmS+7xtHpX2w6oY/ujmnVHbWC6GMFQ59kh5QLj/NiF6e3YU5Gx4INOnqm8oPSGE7uxdKsqPQUCsRSUMxwGxKhIk9rzmjgEbNfkdEoSh2CfUhU4BuwAhxFWRnjV7Jw0PX3YltvHD90YqnPy+rPvH0D3PUJFax2qRXfloGsDwtQ4kwG1uppkqcHKN2OlI5VBOO4VZ1Uwrtp0sE5JIGX9poqZTgSo2K/IdsYSQDbz5EWFkBA0B0kvBxxSCv/JVqg6QR4n6vcHjnM5pren0jVBxTefqTa43y3mhfqxxQMlsE2lvjY3L2Z3smLIdk/a0CkxcakejFgDdVrE3Ou+KCcbw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(451199021)(66556008)(66446008)(66476007)(66946007)(76116006)(316002)(71200400001)(64756008)(54906003)(6916009)(4326008)(478600001)(38070700005)(33656002)(86362001)(9686003)(6506007)(26005)(53546011)(83380400001)(186003)(41300700001)(8936002)(8676002)(52536014)(44832011)(5660300002)(2906002)(7696005)(55016003)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J3MDCxwztK6xey7y02bJX5rtlfNQJeXlXSj8wyYPJOjyEhfQh4h3vfXDuYLV?=
 =?us-ascii?Q?SPtRKjzCNhltJsMWcCubf13hUaDRWXuxyYV2jndRiHfijAy13YclN2Exgiqf?=
 =?us-ascii?Q?N9PafKTYKNNYHoYUWsE6VOPnPHPpcO0mSJqtXJZiqp98kdDHntCWudab4qb0?=
 =?us-ascii?Q?RsGxMgSkghyJw0/x9rVLKEDQfLTNLqHSsRf2jivLjbUss94/Ld0kNugR7oS0?=
 =?us-ascii?Q?ybZ93fawn7vsrtlxNaZzLgIMpfwaBtiGMHnINSuFglhSWLTOCHSXftoOJw0P?=
 =?us-ascii?Q?nKzv/4aYK58cVcp50aogni7UJCDOyMeU2+Emmi5eMahqS9nSoDKOSHgQZRvp?=
 =?us-ascii?Q?a+74ra/j7jqRxnHgo1VsxCr6ZLT2ByJWDhf8oo+4OTcBEtjOfqmAUuhHZHav?=
 =?us-ascii?Q?Phhr8SxtWDCyeM+EW0LPWGgifPMP/+L4asDpiCBd+yK4JX1tBkbACtJK06/I?=
 =?us-ascii?Q?gOWZ5U7GiD5q+ymsQz31IUdHgpBTmvnt65ZmhcReC6DAetpyNFgqNQ7kq9OC?=
 =?us-ascii?Q?HMKaJNahtxh1FOnqo28GKZD7LcIMkC37/tx6EZD59GIZa58RpkdyQAyk/ja0?=
 =?us-ascii?Q?/Dq/muFkT9kumkTULT/xGt1UxDLt4IoEv7wV6YmNt6bmEO6nU6Bifyvs6ZD+?=
 =?us-ascii?Q?JEJwkhrCOf8uCPIKxFTe4gudyLQjOSWxiVMv1TFdLciqVcLqmLyRmyv4jhUS?=
 =?us-ascii?Q?yqLu54ws+0NU3rNJW+NE/WUPqISRRjyMHRrXxjttPOnyW7sQk2+QBAs3JwEk?=
 =?us-ascii?Q?hVUMYl80E96JpH1DcKtpOgClrNgiukexolccApV11QtumNpZty0iYXdsU+M8?=
 =?us-ascii?Q?Z1F9daWkSlOiPQUfW3VZUxG6r6EkvAuM7W5YNXsT05FbKUsCAq7QEnYtae+D?=
 =?us-ascii?Q?UAZSPOBIIkn0s0zqxUmYjhFTitowXM88ZeHg7GKsbw0U2Lp853B917+fJifC?=
 =?us-ascii?Q?fkL3NSrzzgtplZXALn10GAkDiUgBBUKt3aqxh7k8Vx7PIMIrL1JpI8aXAHA8?=
 =?us-ascii?Q?rB0aiOw2M+MUaWZbkNM7i5gPLLVbqq8I0su4/YNyVPsXqT1MlaS2MWSAgB8L?=
 =?us-ascii?Q?lk3h20rMk8xIv1Fi9CbiIsnxicHaAJAR13OHGuOxyO+2Tjv4tWhvp93PLz+W?=
 =?us-ascii?Q?YekukuHCyoVPPm6PW3D+uewD9SApnLaUIoiYbixykHM7h0122HbIYWkM2vJj?=
 =?us-ascii?Q?K/bJGUK0L25bg0MuZT/l1YiTwCv2iFm53vSEB7fO3bQ20cRN2gc4KzWUtuZ+?=
 =?us-ascii?Q?LXi9CCHJJqKph5iyrgLUGpcQmM+gwi6eBss+hJ6Y1xQGItOEyyvRIhBIszL9?=
 =?us-ascii?Q?pVcuLUPX3F4eoniM9KPA1rQGe7GWGUV1sAcCPYiZTwX0jTMAh2sgHjs7tQFP?=
 =?us-ascii?Q?fErfUDQHYhbbartdEAH5m6F1UaDJTRXULWqO49T2xhmf3ydZlCv/ceMG3T/A?=
 =?us-ascii?Q?8E8W6NPIECMIfNxQC8siaMa22Nm4GHP/XWa64oYIOXCuKt073gznjUs1177q?=
 =?us-ascii?Q?yipdtcuyno6/GI4FfJkroC8r7K7anWiqaz0zXJBP+kAKnFPSRUap0uf0A/Fu?=
 =?us-ascii?Q?iaGip+hKhp3xhfmLbpQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fbb902-f56d-4ce8-e8c3-08db6ac26e7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2023 21:25:51.2678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwa+IuQYYaq2g8gQbhMc/8R8cBCzHTT9By7LMO5noT8W0rhmDcUSU6nxxhnaqEYA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 21:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182640

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Randolph Sapp via lists.openembedded.org
> Sent: den 10 juni 2023 03:14
> To: richard.purdie@linuxfoundation.org; reatmon@ti.com; denis@denix.org; =
alexandre.belloni@bootlin.com
> Cc: openembedded-core@lists.openembedded.org; Randolph Sapp <rs@ti.com>
> Subject: [OE-core][PATCH 4/6] weston-init: fix the mixed indentation

AFAIK, the official standard for OE-Core is to use tabs for indentation=20
of shell code, and four spaces for Python code and bitbake variables.
(But beware, other layers may use different standards, e.g.,=20
meta-openembedded uses four spaces for everything.)

>=20
> From: Randolph Sapp <rs@ti.com>
>=20
> I know my text editor is going to get angry at me if this continues.

Get a better editor. ;) At least for Emacs there is a bitbake-mode that=20
supports the different ways of indenting shell and Python code in the=20
same recipe.

>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta/recipes-graphics/wayland/weston-init.bb | 76 ++++++++++----------
>  1 file changed, 38 insertions(+), 38 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-
> graphics/wayland/weston-init.bb
> index 4fa302c833..01abd4ce78 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -26,44 +26,44 @@ DEFAULTBACKEND ??=3D ""
>  DEFAULTBACKEND:qemuall ?=3D "drm"
>=20
>  do_install() {
> -        if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
> -		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
> -		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
> -        fi
> -	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston=
/weston.ini
> -	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
> -
> -	# Install Weston systemd service and accompanying udev rule
> -	install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_uni=
tdir}/weston.service
> -	install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unit=
dir}/weston.socket
> -        if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
> -		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam=
.d/weston-autologin
> -        fi
> -	sed -i -e s:/etc:${sysconfdir}:g \
> -		-e s:/usr/bin:${bindir}:g \
> -		-e s:/var:${localstatedir}:g \
> -		${D}${systemd_system_unitdir}/weston.service
> -	# Install weston-start script
> -	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
> -	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
> -	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-star=
t
> -        if [ -n "${DEFAULTBACKEND}" ]; then
> -		sed -i -e "/^\[core\]/a backend=3D${DEFAULTBACKEND}-backend.so" ${D}${=
sysconfdir}/xdg/weston/weston.ini
> -	fi
> -
> -	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)=
}" =3D "yes" ]; then
> -		sed -i -e "/^\[core\]/a xwayland=3Dtrue" ${D}${sysconfdir}/xdg/weston/=
weston.ini
> -	fi
> -
> -	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', '=
no', d)}" =3D "yes" ]; then
> -		sed -i -e "/^\[core\]/a idle-time=3D0" ${D}${sysconfdir}/xdg/weston/we=
ston.ini
> -	fi
> -
> -	if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no', =
d)}" =3D "yes" ]; then
> -		sed -i -e "/^\[core\]/a use-pixman=3Dtrue" ${D}${sysconfdir}/xdg/westo=
n/weston.ini
> -	fi
> -
> -	install -dm 755 -o weston -g weston ${D}/home/weston
> +    if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
> +        install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
> +        sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/west=
on
> +    fi
> +    install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/wes=
ton/weston.ini
> +    install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/westo=
n
> +
> +    # Install Weston systemd service and accompanying udev rule
> +    install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_=
unitdir}/weston.service
> +    install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_u=
nitdir}/weston.socket
> +    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
> +        install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdi=
r}/pam.d/weston-autologin
> +    fi
> +    sed -i -e s:/etc:${sysconfdir}:g \
> +        -e s:/usr/bin:${bindir}:g \
> +        -e s:/var:${localstatedir}:g \
> +        ${D}${systemd_system_unitdir}/weston.service
> +    # Install weston-start script
> +    install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
> +    sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
> +    sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-s=
tart
> +    if [ -n "${DEFAULTBACKEND}" ]; then
> +        sed -i -e "/^\[core\]/a backend=3D${DEFAULTBACKEND}-backend.so" =
${D}${sysconfdir}/xdg/weston/weston.ini
> +    fi
> +
> +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no',=
 d)}" =3D "yes" ]; then
> +        sed -i -e "/^\[core\]/a xwayland=3Dtrue" ${D}${sysconfdir}/xdg/w=
eston/weston.ini
> +    fi
> +
> +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes'=
, 'no', d)}" =3D "yes" ]; then
> +        sed -i -e "/^\[core\]/a idle-time=3D0" ${D}${sysconfdir}/xdg/wes=
ton/weston.ini
> +    fi
> +
> +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no=
', d)}" =3D "yes" ]; then
> +        sed -i -e "/^\[core\]/a use-pixman=3Dtrue" ${D}${sysconfdir}/xdg=
/weston/weston.ini
> +    fi
> +
> +    install -dm 755 -o weston -g weston ${D}/home/weston
>  }
>=20
>  INHIBIT_UPDATERCD_BBCLASS =3D "${@oe.utils.conditional('VIRTUAL-RUNTIME_=
init_manager', 'systemd', '1', '', d)}"
> --
> 2.41.0

//Peter


