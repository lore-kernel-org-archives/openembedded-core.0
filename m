Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B416C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 16:58:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.52])
 by mx.groups.io with SMTP id smtpd.web11.48072.1676998725547355600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 08:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=xgYi/dfa;
 spf=pass (domain: witekio.com, ip: 40.107.7.52, mailfrom: hsimeliere.opensource@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHAcgYeK7anQQzdCHSYbtUJ78dL8AJRSu1uenIQEGS7nkeUMOYrxPmotbASy6OmW4Iv1Hi8yq/AnCNZDavoHgg9C3JaUkfFvvnaXPJPdwtFf+cj1CsXT7XZC73Pvzl/MuQuSY8gDsg1D2dQEr5A6+4Ptrptm1a/Z9KBZNvsxwE5MgyF3OJNgvCAaU3BJCXL0gOMlVE5d5PFSeFRXUdKB6D14eso2+YWgxXu7zXEvOtJ75oHvzuCH7OWX/LzMC1jtcczPUj2QUMUuSVBhvJdIiwOmV3vlIQYPdGiiNnGpwIhkg+g5bbc0ip7HSnOaNp+dBQwUhKxkW3D+sWzlTBfmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xArn/FuRmV4+YJaLPgECk4Yl117byzrWFfldsc6q2fo=;
 b=h7Fd4tCQHjzUnXwIvVLvmi7M9kx4/+QHgH5o6wnfnTt6UH4vBksxJAGe34RAs9gpkwCTIPMnKGyGD24X1KYNSv27Iuot3EGFnOKOGTWML9a0upGpYIZFhMBAZIC3sQ58aEiq58zRIcmTJ2EMDCEyU8O6ibx3B7tpBKLqgkEQsi9olK1ysMOdOcDEFI9xP1oLXSC194c8aSQeAEaNaWZlFITYmL06J/J/dZozmjJe4VcH1wwfz8q4FObyipF3XieVvnGbu2YotgeBSoR0m9hB1LC5DlJl7ERcMwy2gx4Gq/Mq2BvgIQprcusHcFddu0ulEjalm8ZqgfkrPuRfw5j8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xArn/FuRmV4+YJaLPgECk4Yl117byzrWFfldsc6q2fo=;
 b=xgYi/dfasO1iMHE2pG22B1zbBYGq8sTaN+A464WHdx/ludS8RFDFcFkc042h+rntA3vpEiEd430Z3DVJ9MTch7hS76L4U70Gwe7ijehIow46K1yHZP7fPwdzVVFh+VbZG+pT2K8bwQMzXF0JteRwPcbMzAN6VX+vbow2TVZZaPlMEkG3IgR3mceDR5/kysYIDa89XP5HmFXnFW7vj+hgzxizNCOD6ywOz6ncFlduJ+G9h4RATit1eI1OM0pnXRBv72ye0Z9C15QHNwCxlRuEQdQKZfPEDcB5ZQGFW35GT475PWtvKPIDsrhuhN4P4UcN1ORA2VgRjJWBxr0S942oFQ==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by AS2P192MB2167.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:643::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17; Tue, 21 Feb
 2023 16:58:42 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%7]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 16:58:42 +0000
From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core][dunfell][PATCH] bluez5: Exclude CVE-2022-39177 from
 cve-check
Thread-Topic: [OE-core][dunfell][PATCH] bluez5: Exclude CVE-2022-39177 from
 cve-check
Thread-Index: AdlGFbBwoJkdUbGhT0qGu/XObDo4fg==
Date: Tue, 21 Feb 2023 16:58:42 +0000
Message-ID: 
 <PR3P192MB071469B386531AC4342395CFDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P192MB0714:EE_|AS2P192MB2167:EE_
x-ms-office365-filtering-correlation-id: 9c13c677-4120-4272-aaf4-08db142ce313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6fstqvfU4WH2h9UpADlHb3WNKsOHI7m+pj4FCLNklDLvslRc2Pi44cFZgfl3GIdE2+H2D/8mg2NDSd/idI0APDvNZB6g8m/jlgd2z5QySHN/tcxFQjeAJAfsyGoP+2K1vizOaXDx4+JHTPyg8Qq1ID1E6x0x5ss9vhEBrslAv5YVIGoqzNk2Z+fKvdHSKBYo3kw4FHBwdftrR4gJbO28x4VaS3X/BIEMmVXguCWSbfCJhhmn7qAtKseVzRFWr7j1MS9s+x7kf12k2Lby7eg4gvpJAm3anUojvf2RhI+GGYRyC8+HxigA/J6a/YRt/AFJCl/D2Mh4wHa4+Jx1KDE9l8SzH4wi+NJlETc+7iP/JUYynQzJ000aamajwsIGuqHC2G+yLQNKaFsyn7z7F7hN78uzVMNoqMm/3PqOC5jUmybvO48U6pRjWt/gxZ7Har8GN8OX+6zahqmGBUNSAxRCV6IjRRUmQl1UHzAjG3hUB4en6dQGAuP93krEU2zyLLOv7HfwCeixfeE2e5UF9Hs3FYNFDnR/7KVnODG7OwBvYT2S590IUKQr+U/+LCfrIn3p8eHBw6/6ncIZ5YNsAm1bnQkL3GDooPSZwv0SAPlReMHoWLjd2RHSJ2PbeDI4A5N0nvKGi5XgJSjfdhvQ5cnwPgOr7FJnIEohJI+l4MKlIMx6ziodOCF1QD982AsDUlii
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39840400004)(366004)(396003)(136003)(376002)(346002)(451199018)(966005)(7696005)(2906002)(478600001)(38070700005)(5660300002)(52536014)(55016003)(122000001)(6506007)(38100700002)(186003)(6916009)(8676002)(64756008)(8936002)(66476007)(66446008)(9686003)(71200400001)(66946007)(41300700001)(33656002)(76116006)(66556008)(316002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?HcSDCy0Da5wcAPkJYmClEt5JvEMrM6XRp9AWRv3Fc1SviI9z9fdr1qmw6g5i?=
 =?us-ascii?Q?blaHnAGbexUIqdbdLLyPd4SIhoRWkL01CYDPdcsvviYXEkkjcpvmXOIfiB7+?=
 =?us-ascii?Q?VTjU7sCuz9KbcIEohSvXUOFsKAX1KqA7HzT+utrP9Er5soM5Tsx7wdDpQI/5?=
 =?us-ascii?Q?K+adkJOdAxnUo5LvDM5gQ2jKZsCg2m7IU79rjgehD/5nSt7kY4U043jb6kG5?=
 =?us-ascii?Q?kKtkLYc6O38dgNz2pjbxqmdpXsb83jZC2RY3CAphOPvazWpreCEw4cDnbwT6?=
 =?us-ascii?Q?4wt5MvmAs7ujuEZM36NMmtmkaq9hOJeku8l61IZ7ntrN4a67YURFUiF9IAwh?=
 =?us-ascii?Q?Z9KOiaFaI3zKU41sDYZmcgFu/pduy2e/VdPXX1hhOye5I+wuVBm6N4v5Co9n?=
 =?us-ascii?Q?zvhb1xv4Ls8nowaEmk8qKsuFq9wB3LD6HjIgZ6SWhJmnv/bevNEffbcI/QSR?=
 =?us-ascii?Q?8O8dXcDFjhbn45aHekjEoLVxNcT4LO6Gtwv6v42FCFQYcCpOaaFdh4J8tsyp?=
 =?us-ascii?Q?bcvPwdRkkEYX5zy4t3LO1HrFY7BNpYaGXM7I5XWut+nZFOkiocTdiXWlPg+k?=
 =?us-ascii?Q?iL4d2JxAyXKtzaUX+ZSHcbsIc6f6Q9Xa3dAMpQrWxx4EWXup58+dtbqP+rq+?=
 =?us-ascii?Q?RtCw4FX23UmDsBTN/DrSFfny2jrcnOFFBu5a3M5LPfQ+mhFYnafiBTWfmITb?=
 =?us-ascii?Q?P5WaxcuNBW4uHkI6qIydUlskhcvkxhHfQrqTmP89Pt8Hz3/mmVTcGjDIYPJ5?=
 =?us-ascii?Q?d46RVOzhy4XCFnBuwq7Do5ND1NVXQg/VF22RMwcknozJtJlgzS5f5Dpjth5B?=
 =?us-ascii?Q?5Wdl1HRYxTaWf1mR56glTTVcoZT2C92/6RNZRg2J22O26j07pjeWJZlWLn2x?=
 =?us-ascii?Q?4dNJQufbqllvH/eJN6mDrzNfHou0qqRV5FgGtScVPbkrngYNuGNIQc9X14Q1?=
 =?us-ascii?Q?G+ZNjWzSo5aM6GQX72eJkrT6F2FsOoRqUm+FTkTZOuQdHf8uloJ6mzvYvO2l?=
 =?us-ascii?Q?7IIKDygpQMzWQbSPlmDh7F3ohska/G4bwMeofxTIJsyR4mgtWmwOc0U0+l/R?=
 =?us-ascii?Q?GFBmMaiEEgvlyUPFbitu0XBvHR2Rj7LROeZXKozyYmZdyYi6A06OIfjO4R5b?=
 =?us-ascii?Q?whKiS6AMoVMFdsilvHK1YkowaMptOKz3/Tazn+5LCvz1PD2o6MKfUkXbCJZv?=
 =?us-ascii?Q?eWMg4thejTbLhT2ID+2KRS8UY77wzOov+ASsiCNfFvPbSI+/s9rAWval23fo?=
 =?us-ascii?Q?TDuMoWGVq1TZzGCpr8TSnXp1vd7GqQF3Bt/rfub4biCAdz/TpahwAI4lVi1U?=
 =?us-ascii?Q?ijsRuwrR93GXnBHYOeMuAXCpMx1z5FTtpu4iYXMpBLZD6hl9LqEbDG3ZdZlj?=
 =?us-ascii?Q?5JIrRsrozsin48aPbORqV7u5HqkJXVJu/cTBmzR3Meq+5/QoiXDqx5ohnRCf?=
 =?us-ascii?Q?IuqdYVuhqpjku2x8HZvLM+UyqJ+puSEwoJd4pSV5lyM705lFO179VxCgm49H?=
 =?us-ascii?Q?0sBh7Fe3M/juJcYFGJGZnqFKTKqOaVd2jMgOuoEgRXTi+vxPUWfU2wpzmhnj?=
 =?us-ascii?Q?W+kXVbcgu8Qhwxb2wko871OU5+cg03du4ewrTaHvfwJOsFoLK44NMfzqoGu6?=
 =?us-ascii?Q?XvziXOK/skXh5Q7Ch7enc3eGxGhD/Lo3X4p11qzIvxQO?=
Content-Type: multipart/alternative;
	boundary="_000_PR3P192MB071469B386531AC4342395CFDAA59PR3P192MB0714EURP_"
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c13c677-4120-4272-aaf4-08db142ce313
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 16:58:42.3421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7my2dLkFGjmp2QtyaK7mzDPEe13UkzeZV5O6H0prsIgg9xFc/Y4OnlmF7Em5DRd5MleAp/BKOZAz0tWmhl+61A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P192MB2167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 16:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177529

--_000_PR3P192MB071469B386531AC4342395CFDAA59PR3P192MB0714EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

CVE already fixed in CVE-2022-39176.patch

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 7 +++++++
1 file changed, 7 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/recipes=
-connectivity/bluez5/bluez5_5.55.bb
index e5353bd815..be74a35e0a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
@@ -6,6 +6,13 @@ SRC_URI[sha256sum] =3D "8863717113c4897e2ad3271fc808ea2453=
19e6fd95eed2e934fae8e089
# These issues have kernel fixes rather than bluez fixes so exclude here
CVE_CHECK_WHITELIST +=3D "CVE-2020-12352 CVE-2020-24490"
+# Commit 7a80d2096f1b7125085e21448112aa02f49f5e9a, e2b0f0d8d63e1223bb714a9=
efb37e2257818268b
+# and 0388794dc5fdb73a4ea88bcf148de0a12b4364d4 to fix CVE-2022-39177
+# already backport in CVE-2022-39176.patch
+# https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1977968
+
+CVE_CHECK_WHITELIST +=3D "CVE-2022-39177"
+
# noinst programs in Makefile.tools that are conditional on READLINE
# support
NOINST_TOOLS_READLINE ?=3D " \
--
2.25.1

--_000_PR3P192MB071469B386531AC4342395CFDAA59PR3P192MB0714EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Source Sans Pro";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Source Sans Pro",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">CVE already fixed in CVE-2022-39176.patch<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Hugo SIMELIERE &lt;hsimeliere.opensou=
rce@witekio.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 7 =
+++++++<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 7 insertions(+)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta/recipes-connectivity/bluez5/bluez5=
_5.55.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb<o:p></o:p></p>
<p class=3D"MsoNormal">index e5353bd815..be74a35e0a 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta/recipes-connectivity/bluez5/bluez5_5.55.b=
b<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.b=
b<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -6,6 +6,13 @@ SRC_URI[sha256sum] =3D &quot;886371=
7113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e089<o:p></o:p></p>
<p class=3D"MsoNormal"># These issues have kernel fixes rather than bluez f=
ixes so exclude here<o:p></o:p></p>
<p class=3D"MsoNormal">CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-12352 CVE-20=
20-24490&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">+# Commit 7a80d2096f1b7125085e21448112aa02f49f5e9a, =
e2b0f0d8d63e1223bb714a9efb37e2257818268b
<o:p></o:p></p>
<p class=3D"MsoNormal">+# and 0388794dc5fdb73a4ea88bcf148de0a12b4364d4 to f=
ix CVE-2022-39177
<o:p></o:p></p>
<p class=3D"MsoNormal">+# already backport in CVE-2022-39176.patch<o:p></o:=
p></p>
<p class=3D"MsoNormal">+# https://bugs.launchpad.net/ubuntu/+source/bluez/+=
bug/1977968<o:p></o:p></p>
<p class=3D"MsoNormal">+<o:p></o:p></p>
<p class=3D"MsoNormal">+CVE_CHECK_WHITELIST +=3D &quot;CVE-2022-39177&quot;=
<o:p></o:p></p>
<p class=3D"MsoNormal">+<o:p></o:p></p>
<p class=3D"MsoNormal"># noinst programs in Makefile.tools that are conditi=
onal on READLINE<o:p></o:p></p>
<p class=3D"MsoNormal"># support<o:p></o:p></p>
<p class=3D"MsoNormal">NOINST_TOOLS_READLINE ?=3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.25.1<o:p></o:p></p>
</div>
</body>
</html>

--_000_PR3P192MB071469B386531AC4342395CFDAA59PR3P192MB0714EURP_--

