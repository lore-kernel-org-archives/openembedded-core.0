Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E247C0015E
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 21:03:50 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.68])
 by mx.groups.io with SMTP id smtpd.web11.13840.1690059827223116367
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 14:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=L1gCVizQ;
 spf=pass (domain: welotec.com, ip: 40.107.249.68, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5VGApmMf8fA/JjAOCOPY9ZOGcjPwPFgfPTgNJKqGOwfRcUFdsrCEPkB74C9UXSbS1dpLs9VO1MWe0xFpkOovRP9Ttl20cUB4kWJnGCfTY5sZLvIASWJjKvJNE6sXHDokzdPDV4PzZ0oVb/RdYs1KPDLcEp13dtdPE5WewvogFwmHnqLZVFwmcmrwtPdPW6l76/wrmcl5dt4TRBN1/++tbDgt0glG0GsVUWYEOh5Vfz38OiS8iKp5yYtYktOx2Fu03Ht41AxED9id3tut4A/cQDYssY0pHVXppoDdueEo86/b2jcGHy0iLMDW8mGmsdAibwg9zTClf81M4Ij86lCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VX8UhBscCJQkGTi/3m+1yURkYYLPBB7QPDriaytl1HE=;
 b=JR1uVYt25dQPH3RTcF2zz2Szeo8/rLgSkt5mmf+JR2nYfA5Fk39bGgfr35farj4ICm68gwuweA3DCFBcVzD/xZeDUuaZO/YI7EtIiJ+LuS6/0p3iAm4Zk59hzuaYdEhQBRNEDeOHWoOHM+DOpD4pPtfaBo3gXz5xvcfsvTCMcPnBYrIoI3BcB5TiyN7XD53blqQD5fdXsfE2H8NFhSVzANqnTKPg6AYMwKGqV94YrU9+v1d/9XQtotGYaRuNtpQQuQLoul2XsdZIHteax5XNn+cmsHxE/bpBfehNnSnc7eBKDhkPg+hmeskEMUc2/kzpDB+M0X30o9CpNaKDcCZlBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VX8UhBscCJQkGTi/3m+1yURkYYLPBB7QPDriaytl1HE=;
 b=L1gCVizQs33nQ1YFs4bjar8cIYVFZ9XNRIUJYKmfXPYEmZJsi5TqsSTNHqfyu+DiV3MisR430qvAcjvvSTlrKh9Z0E6xx7cSa/APFIE03wXf+yO2GOssUzVTXoTnPwSz1OyNylmOazESLPDL421r4XiKAjy61b/YRrtmTyw3YaY=
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 by DU2PR04MB8629.eurprd04.prod.outlook.com (2603:10a6:10:2dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Sat, 22 Jul
 2023 21:03:43 +0000
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53]) by AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53%7]) with mapi id 15.20.6609.030; Sat, 22 Jul 2023
 21:03:43 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, =?iso-8859-2?Q?Piotr_=A3obacz?=
	<p.lobacz@welotec.com>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: ODP: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Topic: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Index: AQHZvN72YDZpL3/QxkWU514c4O3nNa/GRH9l
Date: Sat, 22 Jul 2023 21:03:43 +0000
Message-ID: 
 <AM6PR04MB5368ED123188D5223D0F14B7913CA@AM6PR04MB5368.eurprd04.prod.outlook.com>
References: <17744C0B55ADA271.25264@lists.openembedded.org>
In-Reply-To: <17744C0B55ADA271.25264@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5368:EE_|DU2PR04MB8629:EE_
x-ms-office365-filtering-correlation-id: 760a3582-ed34-45d5-b101-08db8af721f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cYbwkp8CfZRMrEZxZA6XCt3Q/BedvAhrfWSspsgHaPfuzA0VImwlT7N4WoceuqxT6/VhC2qVyHwsxwMEHdur41wkXPEGStXpCgQYGcCUs8ROIgSUsq5AgFr97TWPdTdzCnHfbKW8S2Bv2PXnSkr3ZFVZho9kUu75Ox1dd8W+nVAc/8Mft9ITb1Ol/Wkj7wLWZlERbPIASCKrKI8Y1eeJeXy7171eCa5c0mCEmXPYPVFQD8ngVxLHUU80yuu3lkqsOqLD/b5QCIvPy6Sm4A6Yo0GPfKCvGHRdI9pgXR/Ed4xwQID6DWV2REjAL3tfUkTtsJo4N1wg3hlfE1W16Xg33FXGh/tPlY+20niPsawJ1NQHOAv62OjackwdYKaJhNZpSPDJSfuARNOnlVYu7cAYLJtFqxIvzQKZUQMw2gNZW3sV9IpjL4l3SXvomGkqRK1WZqzFbSnWruMLz+nlyUk4Ycx06mBT00Zi+N46ylwE2QSXZs22vUgPdQ5ED/5AgAz9BIIXK9Ko2eoocyplLAav3EF3HIbKIeScM2pPV12FwvfjY8JogqgL/ZtLxN7jZVJxPbl1msAYFBpIa8/SJf73Q5tL1pqaqQ5e+ATZ25XvgUc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5368.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(396003)(376002)(346002)(136003)(366004)(451199021)(71200400001)(45080400002)(966005)(7696005)(9686003)(91956017)(478600001)(110136005)(186003)(6506007)(26005)(2906002)(316002)(41300700001)(76116006)(66946007)(66556008)(66476007)(66446008)(4326008)(64756008)(5660300002)(52536014)(8676002)(8936002)(122000001)(38100700002)(33656002)(38070700005)(86362001)(66574015)(83380400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?i3QenTL2I2oUixcoMT4hfEyqnD3ZhSCFfXVe9lJS2cXQNainW9FFT7S5kw?=
 =?iso-8859-2?Q?GcM+qcEzYrmNrMR6Bz1DcIj2PTgfYUdYm953LJHQ9JO17+IOR64GJm12Hh?=
 =?iso-8859-2?Q?6U0kaYMbIqaDtnX8bwd8KICQsN2O1Yft2EmtSiKEGPaUe4VC/hjTZVTWNa?=
 =?iso-8859-2?Q?mWMHQME951w8FPoZ1hvpFNMBkml0WM1rKcQpsrbzXU98pHwrisYSBfeTIY?=
 =?iso-8859-2?Q?cncslBXI4QpfwEBknAD5Rs9YIvgflW0Iqew3Cp6DO+q7qfCn9hVBwbQQ1o?=
 =?iso-8859-2?Q?8RxQKXXC3h1dXtOseo58mu++qc39pVxSu7Tf0DJ4FzzRECpYJ+xtX4Aciu?=
 =?iso-8859-2?Q?3ppVNasbYNkQoz69XWakgR87ooMB/H9InLMIsgCS+OUUZyf2KSkCJYQAiA?=
 =?iso-8859-2?Q?CK9hmmnSgznPrAatPiu6AUXqTVhu8zz/h7/OgBgDojI0NEs6pPe9SY4ofn?=
 =?iso-8859-2?Q?nUefb3z+CQbbFf6FC9hfbRKJOUr3i78/+BJGYIGBXL4/QWB6ng2tnz0PR4?=
 =?iso-8859-2?Q?aJlzQRPS7wMVpT0mKULRR/M2NAMaxbk8fnx+vn8YLvQ+k2V+oRib4+1l/Q?=
 =?iso-8859-2?Q?xlFhC0XQoaYNizVi8wfqNcJMtShweIHXdfYxkqGmReQ7jzdHM0vx1+LkFA?=
 =?iso-8859-2?Q?NQyasvaAe2L1TCxlCQkAxQRqCfWejsU/wGM71JLpYVx7UIh3WrTxETGFlh?=
 =?iso-8859-2?Q?Z/4uTjPACPVYyDdu7Qld4RzCGTxSWWXqhP5UuFLjJ6mxkePErc0R9jixVp?=
 =?iso-8859-2?Q?2wOnSTWsQqTrrw5FsIXnGtOtXpWjM8BgNIpUsl9B8S4CrYMpy3Mxims9GX?=
 =?iso-8859-2?Q?mRAW/cW1/9KuxMOqic/VRH/UNQfsjzVet5tBou1/ZxUPhypL1GMRKaBs3B?=
 =?iso-8859-2?Q?HlNfKammVEkY9iNjvWs1/zVQQZO8iatkBOASesnKdLcqSrLfi/rbAsTRB3?=
 =?iso-8859-2?Q?ZnUZupy7gev68Z2M1jtOBveKRfvOlw/EnzpgS1mu5R5Qpx3IkNVBc2V5bS?=
 =?iso-8859-2?Q?739l2KkJJRAWRQ6A4kdtHykp3zr9h00sh0d2TGo0DwWvbRv8xqFgM03DMU?=
 =?iso-8859-2?Q?pooNu2+QXn2+zg/+/zdDYoLCTdbOj4utkv+cmGHauNCNeNGVAMzHx2nlYX?=
 =?iso-8859-2?Q?Q3Ezbd1m5yg0AONTzkVe92iOxE4Hl2R2pJikG8NNeM2hBTLWsAfAm+J0pN?=
 =?iso-8859-2?Q?wSAYgnTMmfrtzLp00SanTk6VBt/Fjz8snMIDMpnizDmd6eH2s39Wx9sJyT?=
 =?iso-8859-2?Q?EUPvX1QkGPGBgepmqGURFqO/B5fHCINE8OlTGYizXMeyJU73hWNKAjgQgO?=
 =?iso-8859-2?Q?ROmsrm/RQZ9dxfGZDWC8f1Uvx+2uex11FcosxnIE8cBQfn1ru6IbKYtLSr?=
 =?iso-8859-2?Q?11H3g5w5l73YJG9yFtGSLqxxC5tPIofTiX4zFl6Ojm3Q148TO3PEdZdPKc?=
 =?iso-8859-2?Q?WOpq3oq5mt0k8bXTWCy8LqL1TcYmCi70TzLYllu1K5+RhQC+6XXlqf1Jvm?=
 =?iso-8859-2?Q?uTdnGed5kNQAYCS/YUgPUx2zYlgJq81oY7pJibkyd7DDEDQ6EZouLwOw+K?=
 =?iso-8859-2?Q?8uHwBM+VAQ6NxX2DLI41bDSuMtqdY/Yi7zBtyr0CCcRVC9vP+jKepYRMMf?=
 =?iso-8859-2?Q?I0gVQu6hRnOR4CZE5CEOjXF4pwhuWev9JD?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5368.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760a3582-ed34-45d5-b101-08db8af721f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2023 21:03:43.3829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fPjaHGTHhSWluHPSBrascYaMmWvLkGlghzQ5BIPpsXRJcyHJA4pehGmf07fmU6olzZMUhvNLd3ylt3Jyz4hVGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8629
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 21:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184740

Hello Alexadre,
this time everything should be fixed and working :D I have tested it thrice=
:P

Additionally I've discovered that somehow, during all these patchsets, an e=
xtra param "--numeric-owner" has gone from opkg-build script,
which is important to store uid(s)/gid(s) as numbers instead of names in ta=
r archive. An updated patch has been already pushed to opkg-utils
upstream.

You can run it and tell if everything is OK.

BR
Piotr


Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org> w imieniu u=BFytkownika Piotr =A3obacz via lists.openembedded.=
org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
Wys=B3ane: sobota, 22 lipca 2023 22:55
Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
DW: Piotr =A3obacz <p.lobacz@welotec.com>
Temat: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass: add suppor=
t for ACLs and xattr

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..a0f106e4ad 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"

 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'

 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--
2.34.1

