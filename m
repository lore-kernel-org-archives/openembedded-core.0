Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883F9C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:26:02 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.47])
 by mx.groups.io with SMTP id smtpd.web10.52297.1690215956368155319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 09:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=Tvw44ag+;
 spf=pass (domain: welotec.com, ip: 40.107.7.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gar7c9juSo0HY4MRlfxmt/avq4EcTB+iMKH0AJcnW3Fa5KqyVQp2HCue2cal22hHpnZMHkxLA/FFQXwREEZH4+Oki/0R/Xaoo0coGDyweAzJFByuJgXkYXqSaEDkiIFlSZRasD+tiL9Rb+YMBLZYUFKHSEh/KEuBuYcNWj4pdPRqzdjD/17z3blm5sAP2Pn+82fx8mAhgzApW4XGT3nzBNvWYraNSfo7iZym5kbuAmBbrLqKVN/ahYPQoCe1tuttO90KZx3pYytIioGyi9dY00X7W2GzHZud8YKY9iyNPCJZ9GqBuCPBxLRf2eQs+87C0U8dbtuT7+uwRfHUQRIcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne6p6W5jwYOnZjjOxgi41ypz0upEuyxb2rQ7Rxqe42s=;
 b=PtQBwj86YdwAkkooEMDfbhtkskj9H99c0jkhpdigz+yHM6n/K/eNyGJu28TSy1C4uiRSpBP4H4c3nKpKXKGJoxN/kZGLR9su0DO4AE5NNnQAglwY19mNoLJzrJVCTzXcknPrFFAjVTipLt7uYrDTQOKMO2bh66R5SGKq/+JVqZ1M5MZTRSZMKTF3PjoY1NJAylW41O2NqRb3f9J8a/cqqN84tAN8VQpzka0iGyzJSOZJ6rNcQzqyqNoY+7LGmSYiKHi/pd3A2mXukWi4LlUKTAzGqakK5y4D4kqLJmCLAF9Q4pPOSl2dbvtH/KDI2HjKKgEAmIWU136tarKIIbBzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne6p6W5jwYOnZjjOxgi41ypz0upEuyxb2rQ7Rxqe42s=;
 b=Tvw44ag+CiHQySvdxJj5freyIvEt5yxjTkuLC38kvSky5SNeGexjimqxBGEwT4GzMB3NVuztmBER2H8t6KZMguWFUCj8NDdH+PcWXtTnIB9X29b98ms2kEuFpzxju9x8NXCWRKJK2NL68AHiBl8F0uPqLvQYuKwHHm2JKM4wtbE=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 16:25:53 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 16:25:53 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: ODP: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Topic: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Thread-Index: AQHZvkq6BTfQ5MLlqUOJ3kl6p3S0F6/JGQtx
Date: Mon, 24 Jul 2023 16:25:53 +0000
Message-ID: 
 <VI1PR04MB5373592C59C084143CCD7C229102A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230724162007.3701193-1-p.lobacz@welotec.com>
In-Reply-To: <20230724162007.3701193-1-p.lobacz@welotec.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|VE1PR04MB7390:EE_
x-ms-office365-filtering-correlation-id: 3e3ae995-1d00-4fac-b383-08db8c62a6b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jBdZFupEwQB70AUtolR9jwm/lBx7FLttxVOfXzZITSTtfJ6MQ4dFGyEWKn6M8YvhCe/oqSQazf5PHOYE0ldFRptZtsDJrqRfEATSgNtDT6QAKusNegWSvMNBq6sSIF8cDhdQdSNhZisNEZ08iNCIfz+pbfk52JCI/hKVKLGL8SYYyKvThJssEMXGE5ToDE4scCrAF75cAEy6ntO983UURyf5ky7zd9TgR2nSmyDFafITi86zTuqKhv2KgrM0OLM5e5eIYwFGXfawV9Zx7wIWScrg/BC1Z4lYPw4gYT+MUURTz5dAXMtR9PFGuj2kFaPg62dxdqAaFfL5JcxI8QbiGRcub0zxUlQ05ao7S21nz3/bdJkXhcVi/Nfg5drYlZSJxqjskaaLEqjYcCHnefiBIOsuVjaisQUZsCES/V4noEbfq/lZe59A/NX+XG+DRIKIHgV9UqxUkJtbsduNxLK1jbATI/qjNPeckvmT7kOfkX5FC+Znz44IHQtbknAaLuzA7Fb1TMROnbDePj4RMcQxBaPBzp1+CUgpZppEo/KBlgsA2HkrJtny7c7df43CL6hXve+cUYvnrv2QzbvJggh3/gDaJyPKSuwFCRXfhjVjK5A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(396003)(376002)(346002)(136003)(366004)(451199021)(71200400001)(966005)(9686003)(7696005)(91956017)(478600001)(186003)(6506007)(26005)(2906002)(76116006)(41300700001)(66446008)(66556008)(4326008)(64756008)(5660300002)(52536014)(316002)(8936002)(8676002)(66946007)(6916009)(66476007)(38100700002)(122000001)(33656002)(38070700005)(86362001)(66574015)(83380400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?QY4fsm5O3pnkTdhzQWsg1Acc5kykDnaUi7Wf1ok0IYUBGr3PG/xUrLLzPe?=
 =?iso-8859-2?Q?iLo+SFmtdOP57HzrjBXBklUG/n4tOkVvLFu5psPiuSFiSvg2f9k71c6W7v?=
 =?iso-8859-2?Q?AUJtHvsz3j7MfclbLI4KGUu5tOKeZf7/qtPInHAHubTe1JH1wCVE/uaX71?=
 =?iso-8859-2?Q?0hEtC14T9Cl47p3ttgeBib6OC/05+73KiDDGKBgNPcxGIR1ktn7hTiSyY1?=
 =?iso-8859-2?Q?ibWRJk/IZEInahGSYyfy6ZYKX2FgsAdTF6lnmTr6qRjOL8XXrNvzAkV0Ss?=
 =?iso-8859-2?Q?jWo2+KvlLfL02hLcNqQGwG0LC84Eyrrpb0nNrcYIqzvUhrBM02jKUEiK4M?=
 =?iso-8859-2?Q?MB+uDdTEMOHb9WXLVeu3IS4gMCEIgDImkS1WpNSEhaiiIc4jKoNl/xy6Gj?=
 =?iso-8859-2?Q?zPNjnabm7SSc3pZCIciq+mTMbNw1xoWi7TzlrgEbYCftTnZ0mspscg1uyu?=
 =?iso-8859-2?Q?Y/CJxqNVI3E8Lo8kIXsWXDoBWYiNEC24V+hOttL11L99nlhqJAJfqRK5b6?=
 =?iso-8859-2?Q?Mm2RviyfwvkRBWto92FA0eKO6idvCRN2TNQEUxVc7xrphg4tMjAuj22Es9?=
 =?iso-8859-2?Q?we9IkIuJoHsX7sPubcjNULeZ2nyaq4p49Y12etfj7LahqYRk9tdjfclm3i?=
 =?iso-8859-2?Q?imG6JJiZSCZv6Ujl8ReVvdIc5yZL6+kU0R0+zXzrTo9W7Anzm3YgEBXdK5?=
 =?iso-8859-2?Q?lwrEDziSdTqe04AdW94NihipyVKS20te/dvOJrigkth/Fduhz4ltGfPHMZ?=
 =?iso-8859-2?Q?wjyoRAYViX9eJvAzj9WfHEKFErDZKF2Jnxw23RewCvHK9mpypl0i6nHaKc?=
 =?iso-8859-2?Q?IhPl4ehhjHkX2Y1JjuVlg/j+aRXczW0JFtHMvarpngNW7Oy7FiByZVFN2D?=
 =?iso-8859-2?Q?CdimQd3Hr0zsmThmAeU1EmEsf5baQ/LKmIYd5osTF8tVtAfqkkki/CEalf?=
 =?iso-8859-2?Q?HLb+5JXyOQ8/eM7HP1IVJtn5GzT/K7cr3wNWLWq+OWUzeGfcuVus7Ww08C?=
 =?iso-8859-2?Q?xlUY+uYb1UAo/7C7s/9J4ndgjahOqDL+hvTRT9L8GQX0LEMSGLzryElrQU?=
 =?iso-8859-2?Q?F3r4TjHdpx8e44ISPhep9CjRygBGUinLZ8FLwX47bSIBaGpJD0/FjkmglB?=
 =?iso-8859-2?Q?52d7TtBgVBjBSh27VRuSjFvu6/ZVrTnzKozIAzTGsc/sDUBvzEByhefb+K?=
 =?iso-8859-2?Q?qI/YJ0EQUWfILkToBhV+kfiM8dulGPpHrL9x6oz8nBQF3SyHBl2LaFOUEu?=
 =?iso-8859-2?Q?pLOQZGhjvBPgUqiF8EN94/Zs2WxFVA4dRIKk6HM6O8CTmu+n0BakS6EpmD?=
 =?iso-8859-2?Q?ZW3l2R/TcqVQ9p0tO/SJweNRwFwHhmb2zsDjHcXIpascvo/FcdMZfp7O2I?=
 =?iso-8859-2?Q?fO/HuFkM3s7ZUTU8Ua3JG0To9CgfVaysfsKVKZkGsRW5DFO+Ga/+ICKkSC?=
 =?iso-8859-2?Q?9afCBFbhgDqTBB1JIqy1JWcJCVKuHjwaCHZFTNvH7z0kVJt+1wQmeUKSsj?=
 =?iso-8859-2?Q?fPDOYnzTWg8ob6QuqWsCTtBXMi4RWnzMwRpY1Tg4QYM5Ke1njbDk6gfDdU?=
 =?iso-8859-2?Q?iSslwQWITBH+/02FMz0+6fzl2cDFWC8sMjj7evI4nR3sfR7KC76ENszcvd?=
 =?iso-8859-2?Q?Q+EjwGljuqoZI=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3ae995-1d00-4fac-b383-08db8c62a6b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 16:25:53.3858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPqA80eeouyCvXLQ5UqGH2i7gpelBa2VJjahmvMczMsDrOS2zwlDwq7ABDweD19JCFa7wqOrawJjVQ1d7jczTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 16:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184802

Hi,=0A=
I have modified the patch for opkg-build to however have this gnu format, b=
ut only if acl and/or xattr features in DISTRO_FEATURES are removed,=0A=
meaning that now in your case packages will be generated without posix form=
at and the reproducible build will pass.=0A=
=0A=
Unfortunately, the issue itself is for 99% in tar hosttool binary and I nee=
d to find it, which for you at this moment is unnecessary.=0A=
=0A=
BR=0A=
Piotr=0A=
=0A=
Od: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Wys=B3ane: poniedzia=B3ek, 24 lipca 2023 18:20=0A=
Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>=0A=
DW: Piotr =A3obacz <p.lobacz@welotec.com>=0A=
Temat: [OE-Core][PATCH v9][master-next 1/5] package_ipk.bbclass: add suppor=
t for ACLs and xattr =0A=
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

