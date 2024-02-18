Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98360C48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 21:59:25 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.27980.1708293555755039792
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 13:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=AJ60XGUw;
 spf=pass (domain: axis.com, ip: 40.107.20.50, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6xBkORwUY/ua/54VUQTzMPeBssYwzDNHBX98S8LyMaQKUjq2rcPs6XW0BvyRSfd+6QFT54ulXLZQ5zjYXa5YQs2qYjP81TSkg3NIyO90DkxVkh3h0AfYJU1ylTfBJ2F5DVq9t/Hp9QLRLZpspWHhIRAReJzshzQIKt+6DBrNcq014xTs41O/IiDoSHN/r9DmcADrmZeEnLYB7dXXHRg3ckC0kZNuNrYuRU3MV/BqJ1MndYIgSFhuh4dSX2eWTXdwVcAu/PluQvUxTXBr+KxdObjR78M+sgk3m3Q2IHkJrhKtq9GigD4vvlgxn56mSTrywmf1B/RCG+34xI7e79oKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5HAoC+UKWgNdFKaFdVKF3K7heu3P7aE0FFpwZkDcn0=;
 b=HDx4tg0voeY7Rgyv04MMXvxBdutQRbAR+Qc1jP9qh0WFMf31vbNULHNt6eWrNg0Yx69l85NZEKwcetsKaiIh6B1K3IZWGhFOyq2ZCT82AURWg9nqxqJCUrOvkGyVwFUq239lpPlEkQpoU6k8jhozXleloadoHLGCLVcfKD20N3OlhDdp4X7AzijWFsm9W5zUULDgbUVLcbZgcj1FxWq6e7o7ucOuwjxNHbwNG0DrYZxlVgdjsewM+jSfEu+xuC4c7sKqtub6jrEq5GI1JtsuxPFppqDZcftpj1L2GGdxunaVk4oS2xBhXZW2l8RFZpHHsQH2/PuT2SlFkKUXd3bsKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5HAoC+UKWgNdFKaFdVKF3K7heu3P7aE0FFpwZkDcn0=;
 b=AJ60XGUwclBCPmpWP1iwyhg+OGk93N2znk4skBJoGx0+BA0Ua/Xp/SqiFmBycVB3K69j+V+4QgZbkQ7vHigQaNJ/sZM9OkINpTh+DlJl46kl4owXt2L5410OkALMlot5NDSgvHJelw6FZ/9r/4o1L+0VvOZpbPmNVGCskPwbMKw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB7193.eurprd02.prod.outlook.com (2603:10a6:10:25d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.37; Sun, 18 Feb
 2024 21:59:12 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7292.033; Sun, 18 Feb 2024
 21:59:12 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Changqing Li <changqing.li@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V4] systemd: fix a dead link under /var/log
Thread-Topic: [OE-core] [PATCH V4] systemd: fix a dead link under /var/log
Thread-Index: AQHaYi0bHJYsvTRfBUez2oUapWLFnLEQoGcA
Date: Sun, 18 Feb 2024 21:59:12 +0000
Message-ID: 
 <DB5PR02MB10213FB30BD5A1FE9328F0C80EF522@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240218054112.3637709-1-changqing.li@windriver.com>
In-Reply-To: <20240218054112.3637709-1-changqing.li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB7193:EE_
x-ms-office365-filtering-correlation-id: 9906e56c-e0fe-4899-a272-08dc30ccd74c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 W2OjXEvbc6zO0xWm/RvYVTHmOC2Edug9xzJcZ9IxQtg1ft8DcsIiJkc2ALKCELzpoPG+JwFuRQCM6GQXzWeukD3yqkjlDY+10ElNv6XfGwFh6r3kCghoUhVhWi8KS7a3rhchXc2LgEYj1Hiqo3X/NOUYvmnaaX45RL+d5/jfOQjAvjqdT1TFmUwl7KjCThZL4+oMv1KUSEW70JaL+knI4KwMoig4M9WjC8AdIAzV2qx4qDh4m9LwDNn4rGDCgH4AmcLmbXuTvB6WplHMy96DFD9HZhqv+AXw4Md4jRWq3OjplNDcPNL5D/MWg6aId8Ou8EuhF4cM1hnWAoT1uHMqviQQaQgHHMzO0ScPdNi2/e80YWXNEGipmntK/eWXrGdGcp8bxGppOX/COlnCewI/eNKaegGpgh+kbG+D2kJMQCBby4G12rbz54OMxPtBy4qAo9uqoc8S3btZ0Y89HoSFIBNxA4gZZ+hKiIcNOxbc21mEaW4cupcmcj6WRP8Wa3oIZ7E0oynnaNng6TCwIroYpbnaZPsn5GBMsFWrC3+JOpHRbodDrWM6MLARX5e+Rg3Gr6yVy3QFtwntfVE161vCVsOk81BlahjovyH/X5hC4ECX+Q6MVe2LU8SDyrWxLOlE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39850400004)(366004)(376002)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(8936002)(8676002)(55016003)(64756008)(66476007)(66556008)(66446008)(66946007)(76116006)(52536014)(44832011)(2906002)(86362001)(33656002)(122000001)(38070700009)(71200400001)(110136005)(26005)(83380400001)(41300700001)(6506007)(9686003)(7696005)(38100700002)(53546011)(478600001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8hqG7RznB/Dn5VhDDCmW9pN7cDWJmjEGbCxBuAeDsleI+epaWPwGOS7WDXnc?=
 =?us-ascii?Q?RkFeQOHiNqYcPl2LOti4K0zf3jsUSdPGXfdwCv5EAvRbJNS8srmR11y9FIFm?=
 =?us-ascii?Q?z1rH9FsQEqeo+LlcbKc6Lv3qacBaQhYS0rBCKY2G74FddHZ+gdJGCO1aE7fB?=
 =?us-ascii?Q?HV5Hgs6gOZSw2idKYFQnbojN6o3aLK7SKWHA6DUCQyA9ydXrbVfkqphNm2oi?=
 =?us-ascii?Q?G4e9ylYsJYQx7V8LazvFEB1w2HgdNhZe2VvIPV6wfB+Qy7dOIJRORCCe+cp9?=
 =?us-ascii?Q?OP4hl5RSyWB60e795yQy5LkSxoSCnPmP5FRlWatRuXsfUiejwcB7j0mRbyuQ?=
 =?us-ascii?Q?qs+fTBui2BQ5P3ohdD2M2jdLBrisOPP3uTTGRFyfIOgS5WZWtTOhi5EdxGvn?=
 =?us-ascii?Q?/NSv/TvW946a4VHT2+NM51+KtMLtGlSh5xs2fOIW5YBZYnXCRQlhevViMWis?=
 =?us-ascii?Q?qL+ZQqfxWM6ux2culp1r32ZzecMIzB5XVJgKrMC+Zb09XRoz5N4zVdWWIg0s?=
 =?us-ascii?Q?q0/kW+nbCSIMkzm9jqUpNR2ojQ8fn4DmMGkDo3eVneTfsf6BI208ZfIjo66g?=
 =?us-ascii?Q?cpWUluUU9iRlOAIKj5mfAHlptlFQMCukihKVPDNMbGapy/q6hyVmHTKgnNr2?=
 =?us-ascii?Q?3Oug9dx5WCTU6KSTSnaf0AdDkwYQFnPpCt7waF77j6VpuQpFLfWAVWO/w4Ts?=
 =?us-ascii?Q?Yk3dev9/oqYpS6uy1vMHcLNOP63MoRbM1KcJ8vBTG3GK8VMBcgucZ/28b1qi?=
 =?us-ascii?Q?w820HSRl2HDFa2l/Fsr/JvrPFwccbLgNaCUYltl/9/NAbXQ7V1qIW3zpPsxU?=
 =?us-ascii?Q?SX8yhkdDD4Vn0gM2mRE8u1jhdADb3z6G0mPz9NohUIOA7Qw/C5E6/rpXEZo7?=
 =?us-ascii?Q?7oUIuvyBPIDDi5y30xT/jki5Md6WZk52pB1mcJv7RzFxYeRYZwsqnSSemHpe?=
 =?us-ascii?Q?FItBsSAbcsZy6tanN3O4nXTZKqoCS651hy6mX8KHdcfRMBioMVS8d+H54qFg?=
 =?us-ascii?Q?tyZ/3wm8AC4IfF1ZZomjE5cYlzZv11DccLqBM5fDGB+PsfyBRxuU8sh+kqR8?=
 =?us-ascii?Q?jZA7C9VZwN9mzpaTb7vlioTjjedLqSLkmEs/jpeXB/r9UyeAHfCsQi/buaC+?=
 =?us-ascii?Q?yj0DNPrkJ4XQhoYmSLtilL29QuGV/TJpia5AGfq1HuDDGh7dQqwCjK51L/Wn?=
 =?us-ascii?Q?2UpDo+ZPbBTfS+4VqRGQ+fyaPrk92XmZZVz+5kEP6HS2dbtss+EF1PeqbV2y?=
 =?us-ascii?Q?AokIO3lgeuE6pAViLEMo3yw1FISTHKoW8BWpyKvcCingEVFezpUqxnDGm1Nw?=
 =?us-ascii?Q?xhq0OZ9icpgNm0frHcdn1OKKrGhq6efzOOeORf2Woxiqks7efczSKjFT6Vnk?=
 =?us-ascii?Q?AmuWAo1kAv6pRciQ1NdjyDKVh8do4wCeH+H6EMEcyTLadbLaZvfBqPleMkYH?=
 =?us-ascii?Q?cHAhD3vhRiNPWKR5Es92lmnoVBSjLkz0c1hSJ3jWRugDEXwU2KxvMfdNw2zf?=
 =?us-ascii?Q?+CqlYYzBl29Be4rQEwvB7qhb7CwQ0hRV4/KbyWPpy0KGlZS1gceDHgHuVWTY?=
 =?us-ascii?Q?mcw979mmzo4/ukg7/rI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9906e56c-e0fe-4899-a272-08dc30ccd74c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2024 21:59:12.3111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zt7DHM/3mh8Itssf0V2FYku/IE20xV0ap/FkwiXVq6W5NCT44nH1F8BDm6YZS5UV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 21:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195850

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Changqing Li
> Sent: den 18 februari 2024 06:41
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V4] systemd: fix a dead link under /var/log
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
> install README.logs under systemd doc dir.
>=20
> But for OE, systemd doc dir is splited into package systemd-doc, when it
> is not installed on the target, there will be an dead link:
> Eg:
> root@intel-x86-64:/var/log# ls -l README
> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/syst=
emd/README.logs
> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file
> or directory
>=20
> First, package this link into systemd-doc to fix above issue.  Second,
> create the symlink according to the value of VOLATILE_LOG_DIR, when
> VOLATILE_LOG_DIR is true,  /var/log is a link to /var/volatile/log, so
> /var/log/README need link to ../../../usr/share/doc/systemd/README.logs,
> while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README
> need link to ../../usr/share/doc/systemd/README.logs.
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_255.1.bb | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-
> core/systemd/systemd_255.1.bb
> index 9e09c89355..db21b70718 100644
> --- a/meta/recipes-core/systemd/systemd_255.1.bb
> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> @@ -382,10 +382,22 @@ do_install() {
>  	# add a profile fragment to disable systemd pager with busybox less
>  	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.=
d/systemd-pager.sh
>=20
> -    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
> -        sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D${WA=
TCHDOG_TIMEOUT}/' \
> -            ${D}/${sysconfdir}/systemd/system.conf
> -    fi
> +	if [ -n "${WATCHDOG_TIMEOUT}" ]; then
> +		sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D${WATCHDOG=
_TIMEOUT}/' \
> +			${D}/${sysconfdir}/systemd/system.conf
> +	fi
> +
> +	if [ -f "${D}${nonarch_libdir}/tmpfiles.d/legacy.conf" ] \
> +		&& grep -q '^L \/var\/log\/README' ${D}${nonarch_libdir}/tmpfiles.d/le=
gacy.conf 2>/dev/null; then

If you format the above like this instead, then the \ on the first line=20
is not needed:

	if [ -f "${D}${nonarch_libdir}/tmpfiles.d/legacy.conf" ] &&
	   grep -q '^L \/var\/log\/README' ${D}${nonarch_libdir}/tmpfiles.d/legacy=
.conf 2>/dev/null; then


Actually, since you pass grep's stderr to /dev/null, you can skip the=20
first test. This will work just as well even if the file does not exist:

	if grep -q '^L \/var\/log\/README' ${D}${nonarch_libdir}/tmpfiles.d/legacy=
.conf 2>/dev/null; then

> +
> +		sed -i -e '/^L \/var\/log\/README/d' ${D}${nonarch_libdir}/tmpfiles.d/=
legacy.conf
> +		touch ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf

Remove the touch, it is not needed. The echo below will create the file.

> +		if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else '=
false'}"; then
> +			echo "L /var/log/README - - - - ../../../${datadir}/doc/systemd/READM=
E.logs" > ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
> +		else
> +			echo "L /var/log/README - - - - ../../${datadir}/doc/systemd/README.l=
ogs" > ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
> +		fi

If the link information added to legacy.conf by systemd's build=20
system isn't correct and we have set it ourselves, then we may as well=20
create the link as an absolute link instead and thereby avoid the need=20
to differentiate depending on the value of VOLATILE_LOG_DIR. Might as=20
well correct /var/log to ${localstatedir}/log too:

		echo "L ${localstatedir}/log/README - - - - ${datadir}/doc/systemd/README=
.logs" > ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf

> +	fi
>  }
>=20
>  python populate_packages:prepend (){
> @@ -622,6 +634,8 @@ FILES:${PN}-udev-rules =3D "\
>                          ${rootlibexecdir}/udev/rules.d/99-systemd.rules =
\
>  "
>=20
> +FILES:${PN}-doc  +=3D "${nonarch_libdir}/tmpfiles.d/legacy-doc.conf"
> +
>  CONFFILES:${PN} =3D "${sysconfdir}/systemd/coredump.conf \
>  	${sysconfdir}/systemd/journald.conf \
>  	${sysconfdir}/systemd/logind.conf \
> --
> 2.25.1

//Peter


