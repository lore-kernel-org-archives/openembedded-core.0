Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FEBC0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:27:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.87])
 by mx.groups.io with SMTP id smtpd.web10.7310.1690363677743532581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 02:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=z9VkUAQp;
 spf=pass (domain: welotec.com, ip: 40.107.21.87, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWf/PvAjquKLX+eOhR5CJxreG5Yg++obB2P+hW88CktqX+YMamY5IpICM5P4uICY5BYzS8qaqFBCKJM54/eYwc0oqsBTqcStxFZhyroMfac2cv6KXJQSjfP2eWFXftUXTs1qaS7dA1v9cGUdLQyJouXZFjDIH+QVEb+nBA7PxAp0cGfqIljQqeBCSYq7WtSocYYE5DJ4JDMs8vS3rv6aDnSPLOhyIVTDtNAMlAvmIteDKZalxKkIRlLlJR4a6yFpVWO1M9qV8Tc6B1CSVT23/w2TyVBCT5DlcVYPiJbvcRhn8zOrL5GmeWvr8t1mt0nBBmLpWTX3usGK2nOWE7ZDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vacSY01lw87kQQY/EISUJ7gHtVF9Ko9Sezz6urXud5Y=;
 b=IjbTv36gSz35Se0hn21ZM/RQx7OoLXr8nwTTiBDrmGrqjyReVz7A8fJ/2XHlwI5pGBLIeb/Il/oSDTdGS9FDQ0obIZSwocgaox23Woagza8EMOmCN3vzFHDnKc7g45nIi0aTT26Z5acu5uK3RTLWtiH4U2+fEejd8WJe2q6cHHELsGouPXBzImacxwyX9ZGJynTpKWO9/0/BAJSYF85NPZerDvX77GvNSNwX3mYJgVDehjt77zWvJzMhX2gal6Yroyz6cPMKTJuIQrXJ9IIbQggXU7fWIwdLixM0JlgEyRm7HfnaZfxcMSo9Ur8jNFYmRZTR8aiy4AcAyx5IOXkGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vacSY01lw87kQQY/EISUJ7gHtVF9Ko9Sezz6urXud5Y=;
 b=z9VkUAQpTy+ZcKBtLp18ExyfVzrL61Y4HZ8KQ/DjnXVbeLy/KfGocCgBmUfj55/w6reZixqUFHKq+KKspR2EomdNUOLT3B2XChQnBw8xmSRsSUS6uRFjaJ4DDTTWPVhWCpso2BHpHJyHJrpInQyj9k/YmG/GMvmd6Ci9hANEElI=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PR3PR04MB7369.eurprd04.prod.outlook.com (2603:10a6:102:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:27:53 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:27:53 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Alex
 Stewart <alex.stewart@ni.com>
Subject: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Topic: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Index: AQHZv6K3lu9AQllKHU6ArcdlQLIROa/Lxl5F
Date: Wed, 26 Jul 2023 09:27:53 +0000
Message-ID: 
 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
In-Reply-To: <20230726092228.1005306-1-p.lobacz@welotec.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PR3PR04MB7369:EE_
x-ms-office365-filtering-correlation-id: 4a636b88-0c85-4159-5da6-08db8dba96b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VUAx/iso8wtN7xL5EYZGKoO9aKNPZboJ8/rZX5++wcqsf7FGJtXWg6tDswqIZyc/xRHoKBN3z6C+/e5RSUx1y26LKzFNtYwcPvUcYf3hB93v07xgvVGK2lo17Vy+mioq/8vV6yum/Y/YqWpAMAxdfvIgKzEjPYraalH1MPS1wzfANkKQHnm+7+IlHxICElnN+TlLmaWjFT31xjsqn/QR5XZuGUkeNzdWYJhne0JfTiQlD8509H6JdFbe+vwvhCRDaG13W1S/4f3f+TC6kj+Rc/escVq0RiwinRsrkRsincCfdGCT6+vHYdFDLeVzHfcGdPvn5G7NlebXjmPapUoFm0WaWO83KfMABIfl2oL/4XksIrAdbRAJVZ7oapIE9D2iCYBEdB7T2dtiVcnUlYbTlB2GNM0so49Ui1nS0yOedmY8CMM6Ip6OezLVpSADrOlH9mU14A77nQJc5zYrrHsBkPKc20ODhDEN42W6I4x/3+EYDz87cVIYgN8j+muwAg77bY2oaJbP+jEYZyGt6ualjPPt/Z+qCfoBj+pqOvTO6BX3vJSqFkDZ6oEeWkvfse/gAH3xovmZhf58O61E3HmvJMqUOOEmmwV2DfORfErUMOc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39840400004)(376002)(136003)(346002)(366004)(451199021)(7696005)(71200400001)(478600001)(83380400001)(26005)(6506007)(966005)(9686003)(6916009)(4326008)(122000001)(54906003)(66446008)(66476007)(66556008)(91956017)(76116006)(64756008)(66946007)(186003)(66574015)(38100700002)(38070700005)(52536014)(8676002)(8936002)(33656002)(5660300002)(2906002)(316002)(41300700001)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?kZh8xAS4XAfPiIyw9PRqtbLf4wxyD9ZHhHgO9Kr9ebyorjf9z8qXVqGZre?=
 =?iso-8859-2?Q?CcROVVLfeegaV5iX2ACJiZeIScuAxF/GH7wtty6cuA7ZNMX9fotWoJawSQ?=
 =?iso-8859-2?Q?4bRS9im30oHvQp2PyiyX2dq33/Evztmot0dtDCYUcP20ziYObxyA3AYLWc?=
 =?iso-8859-2?Q?QnT4UBu1WDiOvCbPcL1ySh7XCoyvzLOc/noPg6Jrh6TiQ+M8sUmKWfRoB8?=
 =?iso-8859-2?Q?LjXp40J/iRL9R1e6/U+NXPo/gnNuKqj5IOupI8lPg//oiXnQJJQpDKY0cj?=
 =?iso-8859-2?Q?CooDAocz5oS6f84regEqJ1DpfFz3w6QS894dDFJRBfDb6vI1qg8bJ8Ltjr?=
 =?iso-8859-2?Q?K02RZay6SjT0hrrnoBMKX9P3ZEQiLg7/SZFaY0+I68xeZiawR5sv+YBrPJ?=
 =?iso-8859-2?Q?KMgNundn66Io9428a4V2tWlGRXe6mSyP5e+480sdVafoGWNbMeM9ltCMYY?=
 =?iso-8859-2?Q?FETuHl1ccrE87MDFDzKFejIrpMuPRJLkEOLhSnF30tjHFa6VA3tuZ+LJoW?=
 =?iso-8859-2?Q?VG1BJR2utj8PUfO5AY4liEsFTr6IJkFVs/OYQR9nZoZs/hiB1C5DUj//E3?=
 =?iso-8859-2?Q?aSP0o83jhBT4B2exA+QCVhfIjCa8/RLayHE62Oen5Y1e/fo5WgswjKwohS?=
 =?iso-8859-2?Q?mArLz2yPeHTwYB1fUJyz6QKV6IM6hjmccd4y8TkDxXgsF/eyKdmGU/+Z9J?=
 =?iso-8859-2?Q?L4M6ouhDwGG2VNbZtxIBvCn6Vj3UesuDEYgST4Fkw+hpaW8aLUczO2XuvL?=
 =?iso-8859-2?Q?N9vFpX7K4avYgXA/jFgBZQ97cmiJ3JY+laDyxzrBGOQmZG0dbAuDBhr+Ye?=
 =?iso-8859-2?Q?cQY1A+BzyiAZlfUkJXh0h5SMFXIdnQy9j1cEwBxDziRtG/HQHdLfORdJ2T?=
 =?iso-8859-2?Q?A9iGzELmecEOzgzZ1zpc0gS21N/XkimBwUfbJdlhfvN1LN1Yp6m6qMCgbz?=
 =?iso-8859-2?Q?/1FxMy78Wo1vEzw8909zQnHpAZZMdozTAOLY9sowM1rHNaXSAse5pxukWR?=
 =?iso-8859-2?Q?rnuqp/Sf4CpK6Cq85zoN4wGm/NBkdHkdiA+CcSO+qO2SsV7IdOMu3jetXK?=
 =?iso-8859-2?Q?Q6llaCB/7LoDrK7mdVeUmxIHoTjKnZXJibU+E8/vu+8BmbM3obhC7bBj+e?=
 =?iso-8859-2?Q?5NPp4HCVze46l8jDSrxTR/pfRWSCwLXoawE8SYY7xzD4H1vi/JhIvvbsG5?=
 =?iso-8859-2?Q?QFeMTtD8BefHzQDpjbsREKJ/BdmGQR7miarqYuA+DN61W46pmZs+W1IqAy?=
 =?iso-8859-2?Q?TiqNyj8uueqMSUKPG9gm+EQpGUiqgm0qHOZ9He026CkcYdckx1FFO5/Z5L?=
 =?iso-8859-2?Q?idFn3HlxCzj0f2ELli5PNLjBbEyHuB7JHbenw/OUINyxEmgLaMwYEbEdZg?=
 =?iso-8859-2?Q?zmT2kBnE/t3bHe8IVqyz9sZLySQoYIzYR0KavVTM7Ml6XRmZ9zYRGYNZca?=
 =?iso-8859-2?Q?OrDvKm3cvXNqmIhMTk8xMWwgMd3+oa0hwcnX8s49TbWTa5/fETWRdCBCk/?=
 =?iso-8859-2?Q?OyjtHUCcDiTTbZZYAysAXcsKLMfKGtwKX+BmqxGtQHX1fFY70C4MuYEw+x?=
 =?iso-8859-2?Q?mwCyWgPC+LaNkZdNoazTcqNa4btjKHi6Z/NMVemvp1ifL8WIhVOrGuPY35?=
 =?iso-8859-2?Q?gl6BD0QcFwCnU=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a636b88-0c85-4159-5da6-08db8dba96b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 09:27:53.4365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MBDSkBymobxgwGYEUtKUFsLe8tAXsoM9mVG7tvyZmN4meF/W3cMQjF7xFwxEqSDlnApslLqquo1h8R+wizSr9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7369
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 09:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184875

=0A=
Hi Alexandre, Alex,=0A=
Thx for supporting me, I have finally discovered the issue regarding this p=
ackages differences.=0A=
It occurred that I was badly comparing two strings for tarformat comparison=
. Now it is fixed and should finally work.=0A=
=0A=
This has been additionally tested with oe-selftest -r reproducible.=0A=
=0A=
BR=0A=
Piotr=0A=
=0A=
Od: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Wys=B3ane: =B6roda, 26 lipca 2023 11:22=0A=
Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>=0A=
DW: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Temat: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add suppo=
rt for ACLs and xattr =0A=
=A0=0A=
Extend OPKGBUILDCMD variable, with additional parameters, depending=0A=
on target distro features, in order to support ACLs and xattr.=0A=
=0A=
With fix pushed to the opkg-devel:=0A=
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8=0A=
opkg-build is able to create tar archives with ACLs and xattr.=0A=
=0A=
Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
---=0A=
=A0meta/classes-global/package_ipk.bbclass | 2 +-=0A=
=A01 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass=0A=
index b4b7bc9ac2..a0f106e4ad 100644=0A=
--- a/meta/classes-global/package_ipk.bbclass=0A=
+++ b/meta/classes-global/package_ipk.bbclass=0A=
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"=
=0A=
=A0PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"=0A=
=A0=0A=
=A0# Program to be used to build opkg packages=0A=
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'=0A=
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FE=
ATURES', 'xattr', '-X', '', d)}'=0A=
=A0=0A=
=A0OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"=0A=
=A0OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"=0A=
-- =0A=
2.34.1=0A=

