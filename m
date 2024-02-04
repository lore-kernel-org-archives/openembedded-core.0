Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3D8C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 16:57:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.113])
 by mx.groups.io with SMTP id smtpd.web10.42505.1707065862654303209
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 08:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=jN0Vd/KR;
 spf=pass (domain: axis.com, ip: 40.107.22.113, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlYaNgE9pVDtm0AC9xwYQB5U+SOgc4j3eI8WKIT0ZTB/7uIPCwl152s18M/uXqjI0KXENqupOzNPw8u07/Wjw5K+f9CvkNrgnRLnPkbb/qvobkimN5mMiX62IAFV1q9FGkXB9imC5BQsiaF7O8P6TYqzjvfu7ei0zuo95q7M/gNEU+5Ff4CS3+PWmghughhRv8XbU5vry0PKrhcmFSroBtBjnxV5o8JwqeN7v6zcSFariQTuJ48hdpJmwa251iLvaXQLA+XsaYLiW9AlcK2nOdreMZ1nbAJ6UA7Ns6eZBjH4zaDsIC7c7m2ZWJ+t7IDW84gpvMnSp8VmdYWdwY5YxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYW3gKokctQNrAHPVec3iawSQy6tLuXPkGtblZRc5j8=;
 b=XEW41GrSfkWDALdzGsvp/Dh9NfbQpbmjFinCWyic91Koq5gEwQpqmsa7Yc4sf0AB9hsnQHQYb7wG/7kyXAP274Oz5jvK2+g6uzCzVqu5mZYeghEUMceRryJ6Bfk0cUrfTSh8K4e8K4m0xkjAQXLF6kPWcATljFB+8Y21yKSPM1/8DXJKo4GxHtV9cE8wVGnriHZrSU4BOOI4n0QSKr4iYRFMLI4fhMbNAF++sYsJOSfdvzHmjK8i9WDUKEUy5XX6/RGB+XoEqEBZBEc+KnCUsiE+nCkXM+xL4MPlszpU00FMMSziutEEfr1lizXCzoQKPAxmhQB6FhX4ZONYIjw3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYW3gKokctQNrAHPVec3iawSQy6tLuXPkGtblZRc5j8=;
 b=jN0Vd/KRotvkXd0wafZT57/6LxsZQ+TMI9/yK34TpXcN6GA00hWtcz5Nymx7BNuLp27HxueQup07TDS8EP10rmG5zZ9JuUS+I19P2qVBXvbPGg3vXWxYBmgNahn4+SvFtsAOrjYWnu1eleIdMcX0KCOvtn9jctnwm+Ih2kHOQoo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GVXPR02MB8399.eurprd02.prod.outlook.com (2603:10a6:150:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 16:57:36 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906%2]) with mapi id 15.20.7249.027; Sun, 4 Feb 2024
 16:57:36 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Changqing Li <changqing.li@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2] systemd: fix a dead link under /var/log
Thread-Topic: [OE-core] [PATCH V2] systemd: fix a dead link under /var/log
Thread-Index: AQHaV0BbhW16NgtnpEWQJmcVa4r9JbD6Zuyg
Date: Sun, 4 Feb 2024 16:57:36 +0000
Message-ID: 
 <DB5PR02MB10213A3C2CCB6320EEB1A4FBFEF402@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240204080105.3614423-1-changqing.li@windriver.com>
In-Reply-To: <20240204080105.3614423-1-changqing.li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GVXPR02MB8399:EE_
x-ms-office365-filtering-correlation-id: d048f111-df99-4e64-ed42-08dc25a263a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JRgo3ny1p2b9ZOES6wLyCaZdA6RezTztOu4BlKChpnui30rrEHIfkeTj8016kvrgqJ0OzKauCqvELELsVJo9e7XgdKyrIC5UedWIxKemLZXBMBp74CxiS4SgQfxpC3eOUsVWPRv7bJN/ASZKgHLGHvaPHFseAcs+631WsoMlff12w8lzL4JdTKvcGnBvNDl66NyVk7+o+QzbrCpybbkTfVDzhedLl1ju8psm/Zfe+/cqujfBHkLFIISo4gZaMx/gUVzq6LqB7xHXv9uXd+I26aYOQ8fQw00dm8wc9qbAE2MatqxOtYvtkPvjZgGoL/oVaqsQqxJSA7ZYLkv3srbEXfvGXCAC5d0iYmLvQQU7ciOlkDugMVC8QO0tbnneThYYFIFjIAVJt9MslnP/UUicTM3tCxJiKxfj3jilDaYYzUzFhCoLnQsUJoYW2on6al+o4ivKBdt4GRHoAC1PP2iXymQOvoa1t93L8L5Wsf61qTApOjbzK/mMPbk9NNcX7odOtbCtUhP9HwTImj2lmPO0eQKkJIFxpwT/YRdcGoyhJOnJ0XtxgPVQR/27giLBmh5aDOoq22G+gbyTgzlWFVB/a8msytOWdJurTACQe0KEuCp2kPiWToRUrEjqXRlqpFxJ3AFikEXg2In8h0H72bHerg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39840400004)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(55016003)(41300700001)(38070700009)(316002)(66446008)(66556008)(66476007)(64756008)(38100700002)(478600001)(6506007)(7696005)(9686003)(53546011)(83380400001)(71200400001)(66946007)(122000001)(76116006)(44832011)(33656002)(2906002)(5660300002)(52536014)(110136005)(86362001)(8936002)(8676002)(457024003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MdxhPIMzli+OkUxIHCLxHqJR0sv0QksRGiRXS5M7m2qg9PKIdRawJribYkGc?=
 =?us-ascii?Q?0p0DPuWIf77MkiijT3hK0C1WvcTKefki7tDG5a1h5c+v0UAORg5kap3ouMRA?=
 =?us-ascii?Q?37joXHPOQz3+gRPGfx0zEt6rjf5+DRTygnnJ/MNe/xjy7DcnT2D46/5aXfVl?=
 =?us-ascii?Q?tV3DciXf0zNYMTOF0zN7QwmtHllY7lAhnNednW3egb1Ns5W9+hH7gE6Gs7kN?=
 =?us-ascii?Q?ZFOJuj0ER+5o+G3nctXODSbLfAebZqiPm+UPnyH9AL5uWoZFSrvj9RJtmHxF?=
 =?us-ascii?Q?iqNXfjOrdtTa1oRfLBpInpHwJr5vhNZzFVxNRpMa4Ja03PRRPJeeeAv7Jrt1?=
 =?us-ascii?Q?kU3n12mQlTXpOM884VGx2tQQwLBenFiLAdmWZYQ897Vt27hZOtR64Tj4udlx?=
 =?us-ascii?Q?BTUjuoNqx3rd3oLom5TDmHOV3q+hItalct9/yCLqYMBlWXihWx96nos3donp?=
 =?us-ascii?Q?GG7XxUzcrSeFZNRhjyRwPJxb5BWURuR6WM6Gm309I71xG2IngsKl7k/vPyRA?=
 =?us-ascii?Q?GL2LsWQuJ4M9RRkT81EF1bBr0idqmJIMZB8mxx2WgAI8Fuy8QqlePJIgMxmI?=
 =?us-ascii?Q?acf8FxdC2eHI2goF1EGe6ezPyzwiswQICYt2xwSsH7SAoGa7TSSQCD4oAZQM?=
 =?us-ascii?Q?RGNs5eDF/HELn5JcymKNnmlGTTE1C2YDaYIsK3F8JYo+fTQa1CAlgsJflpaz?=
 =?us-ascii?Q?hlzRF8ZNfmgBlg/Pfa4NuFvzAGgLBsLWpiydP+qC2XY+oNJMk9hnpJnJCmFh?=
 =?us-ascii?Q?iOSDsFl8p8XRbdGITYMiXPmtDrRROh6m4nM6WPDXetNa2WKatxk+nk8djX7e?=
 =?us-ascii?Q?RJ/Tsa7K8EOv0diZyXtY0pRMq1qOaUqKEboOHy72q8Wmey3I6wwOOZqvz/W3?=
 =?us-ascii?Q?Oy5xPEH84Rt+OhS5NVxg6WgHl1IiFH+4XSUfkpl2qpL7u4yyucfMmXAbYGFm?=
 =?us-ascii?Q?M/vKsPS6ahUe8+1hTfp8oWTWytctBqJj/7wdINPHRt0HmiBpXbC8rlfCWnIy?=
 =?us-ascii?Q?Xg9wE3iAVL8YTKZdjGQ7xydqPqG4lYRJmhgIirD3NATJWoHf0lOru4r5fTUS?=
 =?us-ascii?Q?oBMAkqVdYRJoI5cHzaZUdFpfFPkz0exX1mSqCDo0IIMnSy2gQr2L5fIS6/nL?=
 =?us-ascii?Q?REPPmNhO2/mJvBEtUhLVtqo6Ih+QQZgIBWLQi2QicuFqNQvsLMpe1fUOnwU2?=
 =?us-ascii?Q?2nOduQSMOt4Dj16faOiKP54+V48bQDu6RBhnWdq9vbeNFYiSqW2a4QcxDXtZ?=
 =?us-ascii?Q?Yu4tTdEv+zRpg2HqD88IBijjmIBOwG8kuwIgFWn0XJ/0rOYzLxMf3Ow9Xbi/?=
 =?us-ascii?Q?0Ih2jKeg0IhOqedlAfmedtipUBaU64lW4fCsFTHG9zTC4aU7R+zyrlOCpnBM?=
 =?us-ascii?Q?OwQD9XoC5rnckqk3CkOnd5es9/7hbf5QnQg1YY6F6TLqexKL6PngA6b4X370?=
 =?us-ascii?Q?btqB9GYBkbdBLUqo3X9ebVTWOOIATHZipxtz3j3gEzr5N6DzBggU92BNOU9y?=
 =?us-ascii?Q?yf3wRWtb3MsRJ5vWl8/WYUBgTMl/CkSYXcAr285jBvRzF/WRJzm8FgSZKzmF?=
 =?us-ascii?Q?1LSLzhFSJcq7Lfbx6e0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d048f111-df99-4e64-ed42-08dc25a263a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2024 16:57:36.6113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P56Pq6BBxPhyF4T1DiijPOHlSprxcsxDJgGxp1uqiwl3esAyCaX9o/gJUgv5kg6W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB8399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 16:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194900

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Changqing Li
> Sent: den 4 februari 2024 09:01
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V2] systemd: fix a dead link under /var/log
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
> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file=
 or directory
>=20
> Meantime, relative path for a symlink also will meet issue like
> "No such file or directory"
>=20
> Since OE have set ForwardToSyslog=3Dyes, this README is not needed.
> So remove this symlink from package systemd

Wouldn't it make more sense to package the link in the systemd-doc=20
package, along with the rest of the documentation?

>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_255.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-co=
re/systemd/systemd_255.1.bb
> index 9e09c89355..3669d3cdc8 100644
> --- a/meta/recipes-core/systemd/systemd_255.1.bb
> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> @@ -386,6 +386,10 @@ do_install() {
>          sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D${WA=
TCHDOG_TIMEOUT}/' \
>              ${D}/${sysconfdir}/systemd/system.conf
>      fi
> +
> +    if [ -f "${D}${prefix}/lib/tmpfiles.d/legacy.conf" ]; then
> +        sed -i -e '/^L \/var\/log\/README/d' ${D}${prefix}/lib/tmpfiles.=
d/legacy.conf
> +    fi
>  }
>=20
>  python populate_packages:prepend (){
> --
> 2.25.1

//Peter


