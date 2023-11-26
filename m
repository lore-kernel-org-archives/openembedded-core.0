Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B570C4167B
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 21:22:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web10.66386.1701033717665672313
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 13:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=l+25D7AS;
 spf=pass (domain: axis.com, ip: 40.107.20.88, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONPkrVAzyP/R7MIlrYUDKw4nrb45SYSIyV5rvbyVjuERs84zonPnBPjU0rcOSGxInAphHJJyQmcphQUHtOJknvOFbXCSzKR45cJKBqGtKGqxQlGuLzncAP2vmvnZBZxNLzipVjD7Ua6Pyf9N/zWPc9WUBxZloXuQvPbRfr0OfcfL4KKnVlm5AmxIImL2fr6WYbtpGPxY9CcPi2zfvBl/d+qkBblCCJf70sEC5LACd2kM9iV4l2TbP33uzSRmHSeWpYFDZrHE78F9AZuD0SqQT0d/fuzTFEuisUimXXRFfBkvkElpYahy4ipaSGAmJD03aajhQEmUDWX+uKPfsrFKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLTq/HsoTWsAWdsHus246ExGIJNk0OcEsqUYLjYxuYU=;
 b=FNzfAXpWc4hCq5I3MUTOhwaPJbAmwTwTMelLM5gOge8PlyvQhgC8gQ0xhnSD4Cv7PpaYuiUcTV7M16PvALqg/t5/v99R2HGKuKFF5ioR9bF3ZNFWE/l8f+2DiO5FcfF+maVsKO+EejEZN4ZwX8FLV2LleUk6k7hxn5LhLVyQDkObf2I6EQyhp9SafXbeHyduCXYPM75SezQY6T9oCixn0uNanh72yYgnUSIrMz/eTqS78KmLNrV/6J7ZZMC9KJTfAeIlbDLbyuUXrwNDduiEP0WETPVWsE3YMEMygDISvvD4s/BKMAm7DpWQ7V1TJa5JLfbLSQeFv6TaWBT2Voh7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLTq/HsoTWsAWdsHus246ExGIJNk0OcEsqUYLjYxuYU=;
 b=l+25D7ASVB2atTkXSCT97uMJAmWF6iI0SVH7Zd6heiIADBJqxi26FIv/tMLYy22VL4ART74i1VUVdeVvT+wBd2reIgfDNlA+bg5ecHgvFno77ITvQLjuVJLMepHxubPf2cdyhyakQzXrKDrrPLypqtisItWMDGaFle58l+/nrCU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8308.eurprd02.prod.outlook.com (2603:10a6:150:53::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Sun, 26 Nov
 2023 21:21:53 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e%5]) with mapi id 15.20.7025.022; Sun, 26 Nov 2023
 21:21:53 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Joakim.Tjernlund@infinera.com" <Joakim.Tjernlund@infinera.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH 2/4] base-passwd: Add PW_SUBDIR
Thread-Topic: [OE-core] [kirkstone][PATCH 2/4] base-passwd: Add PW_SUBDIR
Thread-Index: AQHaHuAjXhTfGrc9w0ik0XvjvhAASLCNC33w
Date: Sun, 26 Nov 2023 21:21:53 +0000
Message-ID: 
 <DB5PR02MB10213D2E9905D5D115A8F4EF9EFBEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
 <20231124141108.1397342-3-joakim.tjernlund@infinera.com>
In-Reply-To: <20231124141108.1397342-3-joakim.tjernlund@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8308:EE_
x-ms-office365-filtering-correlation-id: f9d2dcce-d05e-4f67-d214-08dbeec5b642
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GZM80odnOsNLrH+h4CjGhmLUq1Ol4LHZVzPiENPYN2x0SXdP0j5n1r5/TJugTlZ3jhHJuWKgTec9pclJ1g15yBBDHg1La+zMZMWnACpsIUM4U8uf6Upg4B6hskErfPtL4X1fwLFazHyop+vo0VoHenR5v1BHItyZpIXUN/bTO8lvPJZCQfubQ6RGw6zia9kaU+wcUKDMH45rih9ERx3ekfyVYKvyNZUxOEgfh5Tpif4G/qwtBa1JP87h/yzU51i0lKHVJ2mPl8ujiz5O0b17sAUoDbp8/Yf/0RdTi62wWZ4YZzPpAKFhSXex1QKfcLNwEmT11Tc/nzCNJSa/8RgPymxSw1KtvAL6inbqMFggXGEij/1YyEXZaN4hsjkoikvYK9TpA1X7VHQTdjY1heK2UBxNuAfqV/W1dFtDOD1ZZv5nI7Rw83yaYDJ7mA0IDSwVgmiUIt0spxvD7N5iwZc/s2RNTSAm2oiPsvKmhOqtXMng4XgJnZsspI/0p+lfZ5eRvqdXgod7mkTtaWgTDTUeAauZZ/ubjpBpCDKfnYBOCF1YfxKh+FYM58yw9tksi+72rpkzcaUEAq8+kjeWs3NwicQKj/wXTh5RKE83XtmWcJ4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39850400004)(366004)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(86362001)(8676002)(8936002)(44832011)(7696005)(38100700002)(6506007)(9686003)(53546011)(83380400001)(122000001)(55016003)(478600001)(71200400001)(76116006)(66946007)(66476007)(66556008)(316002)(64756008)(110136005)(66446008)(33656002)(38070700009)(41300700001)(52536014)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nJ4ev48sdv67MCQO+sPKvcQHjQIkDEKYs2Gsg9QLyHsuOKZf8gDlNyJ4h5UQ?=
 =?us-ascii?Q?lLarhY5IK76Sd5dDuqEYO6XoAaDpcmi/PrBwB2hHKJfi6JqteYAX9EtJP5y+?=
 =?us-ascii?Q?1BmAUxun2OZXNIyAkmfPYxi8eMGsDoWG1iJ7tri83PbsfxblBCD0aFhWg3d0?=
 =?us-ascii?Q?PLaa2EDoopWaTI4LAd2J8WMrqabcnfuGMyRxR13bpW2dxQ3QbANcnn+myfZQ?=
 =?us-ascii?Q?hYHIRNUijtjPnO/56xQ35TnkTDBVNK1cPyL4TSmMLvOfASubYaC+EGsoZ9hP?=
 =?us-ascii?Q?io70PtXhMhzbuCVM/MJ07FnWrCy1nDWuaPp6XtxoTPgFrblGJ2Xuc/GzmM1p?=
 =?us-ascii?Q?lBohl0Hf7slicWBuHixrW3sci6aFCVpZ38PMJNsQytI9XBUmYNkmMVNRC5xo?=
 =?us-ascii?Q?+xXTRwsAXpoQVoo62w0oBboSUTjNkeKIQifSZlPpdK71rpEiwJwjmTb+rSdK?=
 =?us-ascii?Q?Rm4Vep11pB40rHQWqKXRpfymkCkRuilwKK7phYX7q+hhssyr1KoNkq0A5Gk4?=
 =?us-ascii?Q?ywbbR64i2UVW1EhWNpnhdOH9cM5Nac90/Hnb1p9S4b9LGot+e7gCjTWtPkA9?=
 =?us-ascii?Q?Li8bjqf1qK3sOBw+m7orebaFGY9FW8VZBzZ8LaCkoGqYQHtaafOlPG6ZVQHY?=
 =?us-ascii?Q?mm8DuEFwwgRJajnO6plp+n5KupabFkf5pmd/+R+GdWXy3llF7Ef+ymN3L3Tx?=
 =?us-ascii?Q?QObru7VhoF4/6r9jePUQ3C/9WMlohxbOmv6HyqAh1RoB70MTy0o+QGq1x4hv?=
 =?us-ascii?Q?64mAjNfwtHXAcyg/c1+HCvL6U8qUKfnI+s2Ckh2cku8d/6TTC/BxnOIrOGh6?=
 =?us-ascii?Q?IeOK22XTOn8KIH0r3/FEl0/JeZMSJwt21C+Rqg/kCG9cf9QlBZE3OS9juH6P?=
 =?us-ascii?Q?FGbYvJE8/6VfWqF8UWCh65f2s+7M6t5gzHXEVQlb6+rgd6hqm3EIduV14AkF?=
 =?us-ascii?Q?NwwFeP0/DygV48dhb3vD4prMcrzRIBIUhzwOvqOW0E3bnGRwKII2YF1LGKLj?=
 =?us-ascii?Q?Tcu1E2eCQV746LPipsPQG2ydeJYU5n7lGfikLsxhU9YnhDwe97fZ64EpUHrW?=
 =?us-ascii?Q?WKSfFJtPNThnPBwolTn2DgaD1j8RQcwS43DgwAcrpA+RAui9vSzqvgTsoucO?=
 =?us-ascii?Q?qaqCwq4SNiMcj6y9Z7iclOH9mvzGGlTGAIUsCZkDQl4rzdBIq4l8eFPDVwSH?=
 =?us-ascii?Q?oxpfYlSeiR52hxeaopldcz6ojQvbkIEJhI6DbqHPXu5e96Cg+psPEa92XRk+?=
 =?us-ascii?Q?kW+cmF9chITiBCDlICydIY7/8rRq3+d/eXysNpIiUnFYUCxiqpaeVvS1qYHI?=
 =?us-ascii?Q?9BSLc2H3xzPq8WyB8uv+HvZaBukxFFxzxnljvwDsp+GqWaxoMrVP5ZJDQEpx?=
 =?us-ascii?Q?+8zo/md2nypu08xzctj+D9nOe+ffUZosATzPCdth2O8JDf0EP9SbKPV6Weba?=
 =?us-ascii?Q?jBe/Q/cbeY/VvLEsPPEOrw2cjEu6zn8vwDFRTSYMgCiEl7CdNcXwtPrrK5DP?=
 =?us-ascii?Q?SIPtSseHFntIIC7d9unO0V9yMTsfQfShIw0VzBZAARnG+cpI9BQXpZjAMgoM?=
 =?us-ascii?Q?vLtNnvIlvU8UHHT23Rw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d2dcce-d05e-4f67-d214-08dbeec5b642
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2023 21:21:53.6747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tNtQFAwr7jOyLpRvXPzlKmy3yPqKztxFw2gpYuNXFNPJW5ba7Mk0KtRs9GYrwu9d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8308
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 21:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191238

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Joakim Tjernlund via lists.openembedded.org
> Sent: den 24 november 2023 15:11
> To: openembedded-core@lists.openembedded.org
> Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> Subject: [OE-core] [kirkstone][PATCH 2/4] base-passwd: Add PW_SUBDIR
>=20
> Add support for creating passwd files in a /etc subdir
> Set PW_SUBIR to pwdb to get passwd  files in /etc/pwdb
>=20
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
>  .../base-passwd/base-passwd_3.5.29.bb         | 24 ++++++++++++-------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/r=
ecipes-core/base-passwd/base-passwd_3.5.29.bb
> index ef7792ae49..e453be0763 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> @@ -20,6 +20,9 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/prim=
ary/+files/${BPN}_${PV}.tar
>  SRC_URI[md5sum] =3D "6beccac48083fe8ae5048acd062e5421"
>  SRC_URI[sha256sum] =3D "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f=
64accc55986b6a36"
>=20
> +#Set PW_SUBDIR to pwdb to get passwd  files in /etc/pwdb
> +PW_SUBDIR ?=3D ""
> +

Rather than defining a subdirectory, I would recommend defining the full=20
path, e.g.:

PW_DIR ?=3D "${sysconfdir}"

This avoids generating a lot of "//" in the middle of paths for the majorit=
y=20
of us who do not use a subdirectory for the password files.

>  # the package is taken from launchpad; that source is static and goes st=
ale
>  # so we check the latest upstream from a directory that does get updated
>  UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/b/base-passwd/"
> @@ -50,10 +53,11 @@ basepasswd_sysroot_postinst() {
>  #!/bin/sh
>=20
>  # Install passwd.master and group.master to sysconfdir
> -install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
> +install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}/${PW_SUBDIR}
>  for i in passwd group; do
>  	install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/\$i.maste=
r \
> -		${STAGING_DIR_TARGET}${sysconfdir}/\$i
> +		${STAGING_DIR_TARGET}${sysconfdir}/${PW_SUBDIR}/\$i
> +	[ -n "${PW_SUBDIR}" ] && ln -fs ${PW_SUBDIR}/\$i ${STAGING_DIR_TARGET}$=
{sysconfdir}/\$i

I generally recommended to use `[ ! ... ] || ...` instead of `[ ... ] && ..=
.`:

	[ -z "${PW_SUBDIR}" ] || ln -fs ${PW_SUBDIR}/\$i ${STAGING_DIR_TARGET}${sy=
sconfdir}/\$i

Or, assuming my recommendation above is followed:=20

	[ "${PW_DIR}" =3D "${sysconfdir}" ] ||
		ln -fsr ${STAGING_DIR_TARGET}${PW_DIR}/\$i ${STAGING_DIR_TARGET}${sysconf=
dir}/\$i

The reason is that the return status ($?) of `[ ... ] && ...` is 1 if the=20
test fails, while it is 0 for `[ ! ... ] || ...` when the test succeeds.

>  done
>=20
>  # Run any useradd postinsts
> @@ -89,15 +93,19 @@ python populate_packages:prepend() {
>      f.close()
>=20
>      preinst =3D """#!/bin/sh
> -mkdir -p $D${sysconfdir}
> -if [ ! -e $D${sysconfdir}/passwd ]; then
> -\tcat << 'EOF' > $D${sysconfdir}/passwd
> +mkdir -p $D${sysconfdir}/${PW_SUBDIR}
> +if [ ! -e $D${sysconfdir}/${PW_SUBDIR}/passwd ]; then
> +\tcat << 'EOF' > $D${sysconfdir}/${PW_SUBDIR}/passwd
>  """ + passwd + """EOF
>  fi
> -if [ ! -e $D${sysconfdir}/group ]; then
> -\tcat << 'EOF' > $D${sysconfdir}/group
> +if [ ! -e $D${sysconfdir}/${PW_SUBDIR}/group ]; then
> +\tcat << 'EOF' > $D${sysconfdir}/${PW_SUBDIR}/group
>  """ + group + """EOF
>  fi
> +if [ -n "${PW_SUBDIR}" ]; then
> +ln -fs ${PW_SUBDIR}/passwd $D${sysconfdir}/passwd
> +ln -fs ${PW_SUBDIR}/group $D${sysconfdir}/group

Use \t to indent the above two lines like the code before.

> +fi
>  """
>      d.setVar(d.expand('pkg_preinst:${PN}'), preinst)
>  }
> @@ -114,5 +122,5 @@ pkg_postinst:${PN}-update () {
>  if [ -n "$D" ]; then
>  	exit 0
>  fi
> -${sbindir}/update-passwd
> +${sbindir}/update-passwd -P /etc/${PW_SUBDIR}/passwd -S /etc/${PW_SUBDIR=
}/shadow -G /etc/${PW_SUBDIR}/group

Replace /etc with ${sysconfdir}.

>  }
> --
> 2.41.0

//Peter


