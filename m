Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BC3C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 12:11:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11472.1700050274496091075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 04:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I3kP56V3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=968395276a=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AFBxvNH029446
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=rkUK7CsbfWxnnPSVKY
	6dsMVJxQUCxTCzzzys+m0jUVM=; b=I3kP56V3Y1WOHBwbS1eXO2b8F0MF4n94p7
	jCCt79BDn/cksgyK/2qyJ/ye5YpzwSQ3VEIqgT8Vl8GjKXYw3bsfxVG6sUUQRujD
	T3JlZ96EBqo+92DATZKm7D5cfAkVWE/AAQRO8zPL4aCUnS7S+YhJQU3NYec+CuZJ
	+VYmfsKX8q8wGqheicWBau4aMS2lOwjYsNbHLFIS0YotMPUbhVust93JhrA5tecq
	PCHI0llA7e/ifqHlrJp7DP3NeDWJpPnNz68GUC9ERif5/chRHuRbEqaBMr9SNEcH
	6BpjwX+7QYJkdcGrvOfWdqRVySEb/vMWKyk/CSHkchK21fByztYQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u9xtxbqn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:11:13 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3AFCBCTq017874
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:11:13 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u9xtxbqn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 12:11:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvK3X2vhaO52LPzN9RU7DKI08C4Xd2ayziHaJo5C+7uQkZ4qD1dtMVa8c26IEjQ4waf0jZ4e8uIFnN4xEf4WADPHG9ms3rKhbSanRIWJaStXKDA2LB5hkQOlQ1JacTi+jdO5IO5tmVQ0FWnTBx85ZNFbhgb2i/1gWaNF9Nv9Eiu6wC5qwmrusBDRszm8xdop+J6Ul/H+CMe2945uL9JPvio9l8hyu2VkXhpPVEqIeRyvyB/ztKrb1lHQ8u4kg0MAagxgYUknIXguW1xl5UZcBuVOFXJq5NzixLvR8/vWYZTk+hruZ11hBlTH268BnkNNT1H2ws6FPTjLWL3dnWAX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkUK7CsbfWxnnPSVKY6dsMVJxQUCxTCzzzys+m0jUVM=;
 b=gEoZ60yJUC+X/AETwAnWwxJTVqbyWGHYcnssWm02JtC/sspZ0MfzdqN5zvkSGQH3BAsn05U5VBf27aAztgcyjKYeHdhIzFxUt7wKvgfi72wS+K5cBtwC10n+qzho1Q5PWESuJHPPWz9ohdrB97xQ1TMhlL9qP1MChzDsAoWIS8yyUxqtskRyy0hKlo2fQT2pi/q5/b2fOhiKhRADONm16rnTVWMUQslqjQvyayS5RJH+KCVJLvw0ke+8Z/yhePgPdTCAK+210vvtaFm7Qp8Z+8Ic3BxCbSkpl4FrvuU+LXVzbrNQ60qCxFefM6YkLEPL0Icp7L05TCrwddK0kaUCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 12:11:10 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391%4]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 12:11:10 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] vim: Improve locale handling
Thread-Topic: [OE-core] [PATCH 2/2] vim: Improve locale handling
Thread-Index: AQHaF1LttvF1Ev3Hs0+fRc9V05ehbbB7R5DA
Date: Wed, 15 Nov 2023 12:11:10 +0000
Message-ID: 
 <MW4PR11MB58224AD271C46B0D27AABBF684B1A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20231114233220.2567795-1-richard.purdie@linuxfoundation.org>
 <20231114233220.2567795-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20231114233220.2567795-2-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|PH0PR11MB4872:EE_
x-ms-office365-filtering-correlation-id: 7a5f5c24-69ce-4f3c-353f-08dbe5d3f45b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BEWMH9G6fek+71jRVh6I+q+4OCJG7kFVKGp1XL79vwDQO//icKsIxQaCZ/+LQnZoREeWwF/qT8SdRRB3dh5RTL6wCEGZzE6tHham8z63urdMWiSzLrhLaUkodtMb4xR902KAfiHMszLK0NZt1+1hHW78XzI5v19rGwGOAh679a5R+qDzH+d0VpKeQUXCPxJpsiaoTdfsQdGLV1KDOjDqEXBVLPkkYCbsqPER6veG8CKcikOrEX4HAuFZvwHViyrhSlFNk2PJN91VqdGgqbkSkG2WIXK0p9ZVq07iKhCCRXCXZUzMLh7h2RMTynqyUdX6svFAf8qbIcsTvQDzN6rznw/AbVc+qRWSeVbJoq5ov7NfSmNEyI7go7KXHrAvYo+mK1MvKFLLQmI6Khms/GKourCOfYSioTKg8eSgilVXwkkNHF/zKNw7PQhlNTQ74VZVsEqz4/jgFjBvV7VaKH8khcy5S5TwfQH42oawns92kpeVL3LEnjRaEaWvUZ8/A65rpv2vpgrQLmUYnK3n1WxywW+/EC/+Rrn6q6Y0EyTmQF3+lmDkjz48Qsn909KpMLuOI3N+sta+LOtTBp5BkX/E7uexzDMCPg0k9/q3U0JZTC53+TLYjVjXpTa+LXJhfcl1ts8ndyraKn46hOrrwyCUOtfhjW7zfhPWX8pEjMrEA8M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(346002)(136003)(366004)(376002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(1800799009)(186009)(52536014)(2906002)(8676002)(8936002)(26005)(55016003)(76116006)(478600001)(33656002)(91956017)(86362001)(316002)(110136005)(19627405001)(66946007)(64756008)(66446008)(66476007)(66556008)(5660300002)(122000001)(38070700009)(38100700002)(71200400001)(83380400001)(9686003)(41300700001)(7696005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8/Mo6o5ExMTjLVwjOW2fzXAmZ8HTL2rSSvnE1v3+LQQGme3cxC1ZwMLf5/n1?=
 =?us-ascii?Q?QT/kOuYvFQaX7oxipIxSUTwQWwEJhKyWmKEa0hjU+AXOwLqUDByI5G/16y/D?=
 =?us-ascii?Q?e2Tz6nZYUGYCbcPCaba7tC+FslWrqB0tY8IJWr4OJCf9VP5ZOZNeLaTDO9fM?=
 =?us-ascii?Q?3Fw+iEhaew1KjEywPF7qCMl2eyCNbI4UgDExowOSUtPwXBE0jCnxWvVVbp+t?=
 =?us-ascii?Q?qTslvo29eWfrQLma3doZCxVwwzP03ttDCZhk/bUIc6RlfNPoLwWE/hwqMdil?=
 =?us-ascii?Q?koTNaQjWvZWS1HJXtMqhbdbJyK4KRMHaElVqlpUlWW7m8x4kijXVVQMDlDyd?=
 =?us-ascii?Q?XhMXB4XsdAIR/rotfEcHZxv+9+C4Nf81WViZ6FAWoWjD1EyX8LzYu32UcW1+?=
 =?us-ascii?Q?QgYgBZFdbFIaAdc/i2kYJ6EPesyTZk9K7QpOieJHCix1zs8WZm6LFa1XOtWL?=
 =?us-ascii?Q?V+dq/0a+k4MwJhoYWXvj+ok5kneS8EYaTTdE93wvQ503y3U2oZ06VAEl7Dcg?=
 =?us-ascii?Q?2u+dkceXZEhqK5wFZaNsoIiH5bkye2RCT+A/lIazFZoRNR/vCWVyTcWnZ2E+?=
 =?us-ascii?Q?E8WnllaAsxNgpcGfj7cE69Rsb39G6ZXVIxZw00mxb7O0T+SfTQIWKe48nGxW?=
 =?us-ascii?Q?wWrpMezoYIj9+QuVJph0x7+GGOQOcC5Ctfx0qeYrpjrbvyvf1uzcpmXIkXCR?=
 =?us-ascii?Q?n3NtrGaOoJBZ2hXeA73P0jz9pglyAMnbPxdPnR28N5oDoGA9jjuzJk1fi8YZ?=
 =?us-ascii?Q?/Sf+FoJWZaHW+Y7GQY/uPBNHnRDt39IbGPFf2VrfZpFA52kOHkCaM10k9q/e?=
 =?us-ascii?Q?sOsU/4cn3PKIZM3qLNko3Mj3ksTGTiy6z17PTjOAoqTRIaMuDeuAV8LO5Srd?=
 =?us-ascii?Q?xbv7n7eiC1iUKCmuZYfSr24BBFvQAHZO5oQFaRo7aIYRCP6OBUzPpkPiOwjG?=
 =?us-ascii?Q?EEl5R8BTyJ1hc62wunpGR1LKzVEpG7cfntWb0npIVjcBVGy189OnZdlGcE6r?=
 =?us-ascii?Q?EIumx2tNSrXN42Fp385hfuFaTn6EZx+fWwMge0eoyEdc8JqvUSfzN4lCFS5k?=
 =?us-ascii?Q?OjqPBCwXzUlfnDVsxKLFQ/u6ImWeMihLl/eBtq/gfKiBzRbs7Eavjl2LiEcQ?=
 =?us-ascii?Q?v8vXet/XWU4rAiUjcCF/glVAiEVrcMp3AjXnSCvPQzf4pSR7IJmkqbhdeXa6?=
 =?us-ascii?Q?Ftyh2ofl8l0E+Zph0uLkC1y5iUaBx6HjGVStcE7h5uWnRlxWpbyaxh9WNvJG?=
 =?us-ascii?Q?vDvMFDuYSTaBvto9BgLvxSxDdorq5zUg9SXhP9/ohFYn3CW3NLW4mpBcTdnT?=
 =?us-ascii?Q?f6hlWwMaZ7XcEwK05RFxmTwPFwxJL4Xtxu/X4L/iG3cq+Y6uSfbpA32PEENS?=
 =?us-ascii?Q?wjtugvDzD5pBGcMQd0p3RG9IAfvBiHPgDjKN8MXi0T5IEc5Arq3vhw0CAZgX?=
 =?us-ascii?Q?FcUkoFhnGOYuoS2cNFqWgku43r1SxgpYM10QdWjJnnybI+4MSCikd+L++RvV?=
 =?us-ascii?Q?Kaa2gpbnecs5rKRQ43+JpP/U3BbGzcqNR7GaQzs5BiVnwnSKtQ26t21hxE3c?=
 =?us-ascii?Q?l1sCcz5ghg5xn+hRXFPrUrn+tJ86enTCL9brAjsElwqsL1WpsQHUoIKWDKkA?=
 =?us-ascii?Q?0g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58224AD271C46B0D27AABBF684B1AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5f5c24-69ce-4f3c-353f-08dbe5d3f45b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 12:11:10.3325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Pkc8eOIWhET3fEjHdqD8P6+Mie/ZxXVzP8IogX/gjOLZ4f+eZznoRKNf5bUQl+oJX8Mm5EHr+Nw3QxcXcRntfZdKtQMREjyVKm2RRasIe11Xl2nAUm0uxRV2rTGhSWk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
X-Proofpoint-ORIG-GUID: YrBTaYIEsiogNWZ5iWL9OXZMkYxyO8uI
X-Proofpoint-GUID: eTixHMVfZtJlVw3Z8Z_fWiCbNJTEOAm5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_10,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311150093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190589

--_000_MW4PR11MB58224AD271C46B0D27AABBF684B1AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I am planning to send Vim upgrade patch for all branches.

Could you please confirm Is it applicable to other branches as well, if yes=
 please confirm are you planning to send other branches also It will avoid =
patch conflicts to further vim patches.

Regards,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
Sent: Wednesday, November 15, 2023 05:02
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [OE-core] [PATCH 2/2] vim: Improve locale handling

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

When making checkouts from git, the timestamps can vary and occasionally tw=
o files
can end up with the same stamp. This triggers make to regenerate ru.cp1251.=
po from
ru.po for example. If it isn't regenerated, the output isn't quite the same=
 leading
to reproducibility issues (CP1251 vs cp1251).

Since we added all locales to buildtools tarball now, we can drop the local=
e
restrictions too. We need to generate a native binary for the sjis conversi=
on
tool so also tweak that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc
index 58025828f2b..38212a1fa60 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,22 +40,16 @@ do_configure () {
     cd src
     rm -f auto/*
     touch auto/config.mk
+    # git timestamps aren't reliable and we want to consistently regenerat=
e these generated files
+    rm -f po/cs.cp1250.po po/ja.euc-jp.po po/ja.sjis.po po/ko.po po/pl.UTF=
-8.po po/pl.cp1250.po po/ru.cp1251.po po/sk.cp1250.po po/uk.cp1251.po po/zh=
_CN.po po/zh_CN.cp936.po po/zh_TW.po
     aclocal
     autoconf
     cd ..
     oe_runconf
     touch src/auto/configure
     touch src/auto/config.mk src/auto/config.h
-}
-
-do_compile() {
-    # We do not support fully / correctly the following locales.  Attempti=
ng
-    # to use these with msgfmt in order to update the ".desktop" files exp=
oses
-    # this problem and leads to the compile failing.
-    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
-        echo -n > src/po/${LOCALE}.po
-    done
-    autotools_do_compile
+    # need a native tool, not a target one
+    ${BUILD_CC} src/po/sjiscorr.c -o src/po/sjiscorr
 }

 PACKAGECONFIG ??=3D "\
--
2.39.2


--_000_MW4PR11MB58224AD271C46B0D27AABBF684B1AMW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Richard,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I am planning to send Vim upgrade patch for all branches.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Could you please confirm Is it applicable to oth=
er branches as well, if yes please confirm
 are you planning&nbsp;to send other branches also It will avoid patch conf=
licts to further vim patches.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Richard Purdie via lists.openembedded.org
 &lt;richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, November 15, 2023 05:02<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [OE-core] [PATCH 2/2] vim: Improve locale handling</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
When making checkouts from git, the timestamps can vary and occasionally tw=
o files<br>
can end up with the same stamp. This triggers make to regenerate ru.cp1251.=
po from<br>
ru.po for example. If it isn't regenerated, the output isn't quite the same=
 leading<br>
to reproducibility issues (CP1251 vs cp1251).<br>
<br>
Since we added all locales to buildtools tarball now, we can drop the local=
e<br>
restrictions too. We need to generate a native binary for the sjis conversi=
on<br>
tool so also tweak that.<br>
<br>
Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br=
>
---<br>
&nbsp;meta/recipes-support/vim/vim.inc | 14 ++++----------<br>
&nbsp;1 file changed, 4 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index 58025828f2b..38212a1fa60 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -40,22 +40,16 @@ do_configure () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; cd src<br>
&nbsp;&nbsp;&nbsp;&nbsp; rm -f auto/*<br>
&nbsp;&nbsp;&nbsp;&nbsp; touch auto/config.mk<br>
+&nbsp;&nbsp;&nbsp; # git timestamps aren't reliable and we want to consist=
ently regenerate these generated files<br>
+&nbsp;&nbsp;&nbsp; rm -f po/cs.cp1250.po po/ja.euc-jp.po po/ja.sjis.po po/=
ko.po po/pl.UTF-8.po po/pl.cp1250.po po/ru.cp1251.po po/sk.cp1250.po po/uk.=
cp1251.po po/zh_CN.po po/zh_CN.cp936.po po/zh_TW.po<br>
&nbsp;&nbsp;&nbsp;&nbsp; aclocal<br>
&nbsp;&nbsp;&nbsp;&nbsp; autoconf<br>
&nbsp;&nbsp;&nbsp;&nbsp; cd ..<br>
&nbsp;&nbsp;&nbsp;&nbsp; oe_runconf<br>
&nbsp;&nbsp;&nbsp;&nbsp; touch src/auto/configure<br>
&nbsp;&nbsp;&nbsp;&nbsp; touch src/auto/config.mk src/auto/config.h<br>
-}<br>
-<br>
-do_compile() {<br>
-&nbsp;&nbsp;&nbsp; # We do not support fully / correctly the following loc=
ales.&nbsp; Attempting<br>
-&nbsp;&nbsp;&nbsp; # to use these with msgfmt in order to update the &quot=
;.desktop&quot; files exposes<br>
-&nbsp;&nbsp;&nbsp; # this problem and leads to the compile failing.<br>
-&nbsp;&nbsp;&nbsp; for LOCALE in cs fr ko pl sk zh_CN zh_TW;do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo -n &gt; src/po/${LOCALE}.p=
o<br>
-&nbsp;&nbsp;&nbsp; done<br>
-&nbsp;&nbsp;&nbsp; autotools_do_compile<br>
+&nbsp;&nbsp;&nbsp; # need a native tool, not a target one<br>
+&nbsp;&nbsp;&nbsp; ${BUILD_CC} src/po/sjiscorr.c -o src/po/sjiscorr<br>
&nbsp;}<br>
<br>
&nbsp;PACKAGECONFIG ??=3D &quot;\<br>
--<br>
2.39.2<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58224AD271C46B0D27AABBF684B1AMW4PR11MB5822namp_--

