Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC73C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 21:40:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.66])
 by mx.groups.io with SMTP id smtpd.web11.25108.1707514855934814495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 13:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=LI+dG8Hw;
 spf=pass (domain: axis.com, ip: 40.107.6.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8EKibEfRwLmR6ti7EYU/ZsaoRWSeAxuWr6qdO3eViC3FzhXDlea1Yn0VZ7p104cyC9DPenixzAQF2wYu1rx/NmTkX6ApUqJfu7ECbg5TS0Q4u/Prsdb+tgT4voihmwY2ITc8ne6ECA3WNflGx5EfUfMgrH1kBQIoCQE8wJilDOi22DSbCVRU66HlZjzQBrvn6KubEsu9c7sBH9kHnL8gmVRYbcj+tQyXfWnouVIze2IIjnQywQitSoq+qhsshoB3JwwKEzxyLavm87TONGkXhUOsVByREY3x1rPK+135559NEDaEeJrSm19ilgUq2vEJTs3CzPULtXEpy83rFTokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOds0KV/4lo4jp/We3ggxkbsjwPsdyC6EUmWicaQo/o=;
 b=U/j/GVOE/TRrPzyXvp7XtHbBBctRs1nZlFrqdSiw4ibi4U8fOlI83oU6pfOVngnTq5TPDmrE3mBdpc6L45mq4okzTm9/60eXNHxj+EhF1qQ1lmW94/WnS2tgcQJvg3EWoC1SuekJs4/BYIEwya4DHaBP67PE91UdyrpYsDtUdWhS7vlWNfEGzZxYROPKZ6ex/vF5uxEprmk2QkPuJP3UTmsxzsrt88ZNc8e+XzLNcFfzKN6EbYFcbw9l2baZhvTl7pr6q+kz3KSWlHrxUnZUhsSK/qpbaraVPmpC8fn0icPV+R979y9/esa42P2J9F1xn8alb+nzKuyLmihigzhweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOds0KV/4lo4jp/We3ggxkbsjwPsdyC6EUmWicaQo/o=;
 b=LI+dG8Hwly8hBku9HPibDYFh20fBPMOAPUcMrPTCSP26uWPP0bbPf4HnwZduirkULMZk0Wu27yhP8nLDiUjMvbYX5YL+8OSE7XOVvSzhtSVdtcllcQRm7ZC0gpGDbWws44y7sTP08y7oTw45Du3jzm0jv9gaf9BGIzZ3hPsGTVI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB9620.eurprd02.prod.outlook.com (2603:10a6:102:30f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Fri, 9 Feb
 2024 21:40:51 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906%2]) with mapi id 15.20.7249.027; Fri, 9 Feb 2024
 21:40:51 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Changqing Li <changqing.li@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V3] systemd: fix a dead link under /var/log
Thread-Topic: [OE-core] [PATCH V3] systemd: fix a dead link under /var/log
Thread-Index: AQHaWaBd1hlu/ERgeUqQVBJuphFqjLECdcJw
Date: Fri, 9 Feb 2024 21:40:51 +0000
Message-ID: 
 <DB5PR02MB10213E702244E4060D157880EEF4B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240207083337.2180157-1-changqing.li@windriver.com>
In-Reply-To: <20240207083337.2180157-1-changqing.li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9620:EE_
x-ms-office365-filtering-correlation-id: d13fabcc-48b5-4063-f661-08dc29b7c975
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OFubVA3YV4M0qmUPBiQGrLqTZBq92fNPOMeRzfopMDxZNnUNUCBBvQ1tcQ1evxSutnng5X679NBmevVBecNFAtOGifTiOK4NCMV/yWC2P4jX0OBSFUZha4ziGfiNCy8WnqLYyCHB7c2KRmbmVUrl8NKOUx62+7aEh4zkp4jmj42yliNJF3o15pTM+VewYNqCdmqupSZHHJ1DfCpAA5zOn2D/KhCMPEZ9vNMaxSd+4m1XT4rVLXNdSd3+6zsTibRQ6o1cFv0HqxHnS/fI/ZD2O71rK62MTJKkH0bhXIvqXlkPLyddStbhEeIOPQX5u/mepwtkn5z4Dd5b/dItgWawdaaf/7sEOp59tf7BUrQlZp5ADnksA3jqLjCyHOPqxnhZYzUvNJ5iZAFMMTWa1rR4orLCwZLMVTAGCyKdElRQZVcklJWXcGJ2o+kWQdJwmUnXcx0F+5eOlYz3HXww825N1CtpyvB77L8/SONA80di154rIYXNPW00GN9dKsiBCC9ykVLuuDC3cNbtKicw79520qlIaOit2fslF3cwTtDzXmgIz66Uh3XYRqtF9+Z9Qsh6dXFIBDo3u+1qyWo+y5hARuACWqM0D9ikCJDcxyFrxsZtw71cbHr8gMGcpF5zGJWU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(136003)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(86362001)(41300700001)(110136005)(9686003)(5660300002)(478600001)(64756008)(2906002)(44832011)(66946007)(66446008)(66476007)(38070700009)(316002)(76116006)(66556008)(26005)(52536014)(8936002)(8676002)(71200400001)(33656002)(7696005)(122000001)(55016003)(6506007)(53546011)(38100700002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iv0q7+Ag6YFoj7xeWeDSTDZCt5wA9uXFxvQx42soQr1N4EA13LUEY1pxVKU8?=
 =?us-ascii?Q?Sr+Haj68TOfy/SQuRn8PC/cJkotSzJYeHbQMYN9hAAnEwcvBl01THR6VBDkK?=
 =?us-ascii?Q?FF9ZYMmh8NkgtyhUVE/JnsAIZLywqvvd8B8Df+UH3kvjT3l6xuuxoYslskOa?=
 =?us-ascii?Q?RlzoYadkLptcjSQfiVTZQBonImSEOWRFKTl2hVszRUNl/5sHVTF+agB+3JNq?=
 =?us-ascii?Q?jFCGi+qih26mrYP/yGNDkjkqhfShNamXCs8tdjQof18ZUNgpsC9wmlXdiASd?=
 =?us-ascii?Q?vi5xHZ0eng+P9FLKlsEBQmIGQwuui3wrq0KKCZmtCjNQw2UZbtUUjrDoSisV?=
 =?us-ascii?Q?gLBY/S7Cd/YOiONHEljfrUYO7SlJiPn964CtjYPPfuaS9UHUxDR2w863i11J?=
 =?us-ascii?Q?JhtIAT2tr5l2QjQFkdfjgggUBbMxkT+8XAAf9H9pr2wj4RRcFWHir1/JsRc5?=
 =?us-ascii?Q?O1yCcsbMsSY2dOyDTWw6j4GastEOxa+8yvRIkEglpxhqqmyfOUzArtcciZbB?=
 =?us-ascii?Q?O8Tw8Psm9WCvOl3MD0de4eIGFz59Pj4E8mc9HnFlB5ChhFoZZnY8BjE1nUT6?=
 =?us-ascii?Q?K3mCW5JdiSUjrmrcza9wAvlBVBje2ZaMP1s/QkDCQ4c5A0AN9wUyf3Y6lrdx?=
 =?us-ascii?Q?W+PVr8R1FF5dY8VET9/2A8GC8mkMK3BOF59JfbPFsxxiRmgDrm85fqL2sHzB?=
 =?us-ascii?Q?GPN5U2HiAu2+QdzlbDjK/2RkNZEok+Tfybd55oaI+GmsCX8FY782PHHrkHNB?=
 =?us-ascii?Q?6l+mKvsBdMJoX2mySpgeiokUunQ9DTvOPMZ7bPEm59wKBd2OIVo4rcmpXx8q?=
 =?us-ascii?Q?66H+ObOu+KbhcirXKcMW6xL/N9vFWmhy4Io82l1Z6XPmE/U3+ze/ZLaN6yGQ?=
 =?us-ascii?Q?c/BxYPCTP21cj/CdjsVkjdc6kOCHEuXMpVOrqlp5kw9XyvacxBNKKrNng6jz?=
 =?us-ascii?Q?yYdbCudG7sxnO1seVxoZNVQdsTdn1mOvctQHvxHPth3UmMZf6trMGMz5ac9I?=
 =?us-ascii?Q?4e372kAr7lQ2pkaUBd2ApjIGWabaN3U9AYg3hDAKYyLDp6UMLyU3cYgov5W2?=
 =?us-ascii?Q?eygq13jq6O7zG0tkwNV5nb3YV/wzjdwfADf1LnubgB02TkjfRsvWYRoI5lJT?=
 =?us-ascii?Q?giI6w9oLNzWIZsw7IAccxlJzA4fZ91+X6nSDZBNDiryJk4tzXllv0Y0Nn4/M?=
 =?us-ascii?Q?yospqxEcCNG7TNGAixUfYDRf5JRAEKSbiw74rxcOrbzWNjw4Pzha55hHoUc/?=
 =?us-ascii?Q?E6GRuB82dfhoxQHg4/kpNnUPftJilKNP29Wwh+zpkFleAYhYzGjGUAEXJL3r?=
 =?us-ascii?Q?t/9mZzHBKzajxI9+zGXpGcjsjMFDdzRIHainAdnzy6CWMtBPNVfTf270DTqS?=
 =?us-ascii?Q?iZNzTWUnTLL9zeatFFId1GzPcIo9vnwPL5QXZAbYFwdkD5hHM3cHjsL3sE0T?=
 =?us-ascii?Q?cCiv2SgY7knY2oTbWAGQfs5cx+k9KM+JBAhwCPCfESj7OphcnRphpvA+/LLc?=
 =?us-ascii?Q?t5+lXyaNCdSdmROVt9dVq6VlmgAFzcG8yXTsU7pEV9xUxCHG3m3HdDj2PRqq?=
 =?us-ascii?Q?false+FWDRdYnc7+YXQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13fabcc-48b5-4063-f661-08dc29b7c975
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 21:40:51.4945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26wNLhvLbTicnzW/fRRnnV3NHfpSG5JZJuOMbXcgSDihkiQ7u7esOlaj2NyoH75w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 21:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195248

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Changqing Li
> Sent: den 7 februari 2024 09:34
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V3] systemd: fix a dead link under /var/log
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
> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README ->
> ../../usr/share/doc/systemd/README.logs
> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file
> or directory
>=20
> Package this link into systemd-doc to fix above issue, meantime, set
> symlink according to log dir path
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_255.1.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-co=
re/systemd/systemd_255.1.bb
> index 9e09c89355..eccc916af4 100644
> --- a/meta/recipes-core/systemd/systemd_255.1.bb
> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> @@ -386,6 +386,18 @@ do_install() {
>          sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D${WA=
TCHDOG_TIMEOUT}/' \
>              ${D}/${sysconfdir}/systemd/system.conf
>      fi

While here, please correct the indentation of the above if statement=20
to use tabs like the rest of the do_install() function does.

> +
> +    if [ -f "${D}${prefix}/lib/tmpfiles.d/legacy.conf" ]; then
> +        sed -i -e '/^L \/var\/log\/README/d' ${D}${prefix}/lib/tmpfiles.=
d/legacy.conf
> +
> +        touch ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
> +        if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) =
else 'false'}"; then
> +            echo "L /var/log/README - - - - ../../../${datadir}/doc/syst=
emd/README.logs" > ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
> +        else
> +            echo "L /var/log/README - - - - ../../${datadir}/doc/systemd=
/README.logs" > ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
> +        fi
> +
> +    fi

The above solution is error prone as VOLATILE_LOG_DIR may have been=20
redefined in a way that does not meet the expectations above. It is=20
better to reuse what systemd's build system produced. You should also=20
use ${nonarch_libdir} instead of ${prefix}/lib. Taken together:

	entry=3D$(grep '^L /var/log/README' ${D}${nonarch_libdir}/tmpfiles.d/legac=
y.conf 2>/dev/null)
	if [ "$entry" ]; then
		echo "$entry" > ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
		sed -i -e '\%^L /var/log/README%d' ${D}${nonarch_libdir}/tmpfiles.d/legac=
y.conf
	fi

That way the link will only be setup via legacy-doc.conf if it was=20
present in legacy.conf in the first place.

>  }
>=20
>  python populate_packages:prepend (){
> @@ -622,6 +634,8 @@ FILES:${PN}-udev-rules =3D "\
>                          ${rootlibexecdir}/udev/rules.d/99-systemd.rules =
\
>  "
>=20
> +FILES:${PN}-doc:append =3D " ${prefix}/lib/tmpfiles.d/legacy-doc.conf"

There should be no need to use :append here:

FILES:${PN}-doc +=3D "${nonarch_libdir}/tmpfiles.d/legacy-doc.conf"

> +
>  CONFFILES:${PN} =3D "${sysconfdir}/systemd/coredump.conf \
>  	${sysconfdir}/systemd/journald.conf \
>  	${sysconfdir}/systemd/logind.conf \
> --
> 2.25.1

//Peter


