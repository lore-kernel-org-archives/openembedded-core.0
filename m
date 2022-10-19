Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94E6C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 19:32:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1120.1666207969384373814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 12:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s5QBA5XS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=729131849a=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29JCiGiw011984
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 19:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=wuMxeHo9DCdx+gn6HRj1BlURUPEBj2FAW+n87UZAWtA=;
 b=s5QBA5XSDGNbGWn5GXGJHG55k6/5lTZVeIkWsfGChh4J/FvgA/HmgdZkq6S3AslhZb5V
 AjGwe1U3irgwm23PN8QmbvbayYriEE7q3YFEHXiXXvTiqOXwg3lEaY5KCfllo+fZ2eLL
 1QIIVPKZ+lDI6iAZcFdfFOim81rE3lAornmQIN7x9VSX6dmxBp11Mo2IyagBMovLeFtm
 FZWbmxbLkyc/C5jFxv1GesKmyUYaPy13p6lZ2YD21efvGPEfOlhQcKhjc2GzVkUOfXXT
 ZjmCGBBZgSNdNLsZNnUXvhu2LkaeEwBMDaz7lgQ4poJ2aXQT9zbdGJtQHuZJElar6YPb HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7j324msk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 19:32:48 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JJWlAZ030065
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 19:32:47 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7j324msj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 19:32:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhPxkfkruNusU3yS+AhRHqf+xqbhHZzfAoiIOANeA5M2qL3QvCPyqPj9/kR8pC4i1I5bnw3cx2anFLQKgnRQjwRtHNs7LQd2H1uMHeDarBMio6Egb2zqGWYAi/2BCtjb5j8nUx9talIdxC06JY3ebewWTA4l7apl+c4+cRhMZGlzp5S9U9hrnLI4W5hxPbo5NX+miYWobslhVa/6y6sZSFn6TP0SZAqLEuJob3gUGXAHqDDzSqV4y9/D/UQ7pFg4zXsmuvvcgoneIMr8r+/dxyVknreqFhOYYF2Fddaz5bTRMlzmW93tr5sWvbuViHgg3EWkbRxhwFEhQo3PgBPftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuMxeHo9DCdx+gn6HRj1BlURUPEBj2FAW+n87UZAWtA=;
 b=gIOjxVbKPel+WojHV+5A24MM0anwrt3jbCTAzaHid6Y6SYvZkz+zjPCAJ9MweGb9Y01vJvJbDRt8bDJagvcupMXU8Vdrc7NPT5RW+Dku7VwJhegsmXEgQ3PwMkSm7UeaQDeeYTS4zRYFHWUdB2oeP3hBokS+ixzQVe6hlz34PML0MTpmVjAa6/nUwR/heYyW1i4CTosz3OH7eJTvL1RQWGXwHdRs9Z/8n6UC9Q9acr8iDgzefpBIzqHDXB6ilH/wHS8pFVf3dB1QzfHzIFmKQsUGTVcqInBYtmBh1WT/zAjBZSg9Tot+3hU6Yx1OLb1W/X2UEiYsVMkPTUGT65kBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DS0PR11MB6493.namprd11.prod.outlook.com (2603:10b6:8:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 19:32:45 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::9900:3433:7cff:ce14]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::9900:3433:7cff:ce14%9]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 19:32:45 +0000
From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH 2/2] tiff: backport fix for
 CVE-2022-2953
Thread-Topic: [OE-core][kirkstone][PATCH 2/2] tiff: backport fix for
 CVE-2022-2953
Thread-Index: AQHY095Em6nXJTLpZU++TSOWwxs6yK4WMrVQ
Date: Wed, 19 Oct 2022 19:32:45 +0000
Message-ID: 
 <DM4PR11MB5536C6540613140ACF826C1FE62B9@DM4PR11MB5536.namprd11.prod.outlook.com>
References: <20220929083319.2225406-1-jay.shen.teoh@intel.com>
 <20220929083319.2225406-2-jay.shen.teoh@intel.com>
In-Reply-To: <20220929083319.2225406-2-jay.shen.teoh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5536:EE_|DS0PR11MB6493:EE_
x-ms-office365-filtering-correlation-id: d0274916-c3d2-4548-10e4-08dab208b302
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5MyqDfk7+3QqS3lLT43EodEfGtDtOhLjJvdwtWv8QQSd0ZLy/5JYY9EdE2pM3opY18fP+7Ml6xMEMzPMI5l2qQ+HQxzo1BWrAnDPgQKGYfw4h4wl6+vgZcGwMo+I5365DNsEX12Au0LY4ouVMwTsy4YtgJCx/fTCj/CXu4aJRAk/bljrcRVDxaLBqEbYdF+Ma3XsFyRwItvGVm9NV/ZM+V1WxdqPy+yc9QnQQ3Y4SCg/maj3GZ3ZpmW1eG8oS3BZT5+P/ZXM9L0WhB7qcQp5tVKduaICdBT0TpFwUnnCsSnfa9rhnR++pl0eorh/PQiVyEDJ9cyFFn1tE8hKnj9seJQx2YpcZ6rj9Xrk7N8Uke9T3NLyYnK9LBOP542i22W0gL2oEyhS1/+20DHcso/yLl6hIBQXcQe/jxJ+EKxqGPkz26+YYYTfA7Ap3L8rDtNbbkhMyq3WEg9JvruAXLqU6TglRsO/xuuYGI86LnEjUC9l5JCinVehEql7Ko88KBjWVwRBs+1ay6h/g3O+cgrnJ8oSJ++PlS1AmD8piplyp7Ha+3hn+zmL2v2D5Ak+dxFIyk1cB1/fHHBvHv7yRZkhx8pnmYH7LX68T2CWa0XnIH7YWCTBhTSFmyvWNNdGsUarkhXuA2NKkBRuotRmQ2CFzZJ2rrwY0SZg0cQyaHeDZI4jDSCOQjz6DqH+j1fJsh6mw+p9mRqC7gqCx7OETBSf6TbVHzVfWgSEj4IDLNamY4M0DvXLKY3cwuhK+YrQ5c0vE61qHwpLcNmzbMoAx0uRaN/utb++ydElyWNc/2R77fRmWD/jhOOji9hONVm5+UmYJf+iL/GPRNERNt/bYQjyTw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39850400004)(366004)(376002)(396003)(451199015)(76116006)(38100700002)(83380400001)(38070700005)(55016003)(40140700001)(86362001)(33656002)(122000001)(66476007)(66556008)(316002)(6916009)(66446008)(5660300002)(64756008)(2906002)(8936002)(71200400001)(84970400001)(966005)(186003)(7696005)(478600001)(6506007)(66946007)(4326008)(26005)(9686003)(52536014)(41300700001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pCkRpn5FCk7GQ0U4+HE5kVc7YDMi44QmMYMtyqErUJ5K4481qxzubgJhIh?=
 =?iso-8859-1?Q?xflnXTUZGb9hUvTRDKehRWY9AiEki2+w+E5nb4wbZcvKhMrGdHfwzOw7D1?=
 =?iso-8859-1?Q?o2vYDCwLpYW+eaNsdxQiY2olCdiO2zLpe6otSi8CGTBcTC5GZFi5fA1jLH?=
 =?iso-8859-1?Q?52LSur+thH9srHcESEfwVVGQvfUPuuKRaSttE/3r721cBwyc2KC29anwjp?=
 =?iso-8859-1?Q?ZlsKKf3226ageyCNSmbB60ca4asnEi9i967e9MWTxqNSmzlmbYxTRyyHv8?=
 =?iso-8859-1?Q?i45sMHST3VnKr+2lxkFVL9uU9k+D9YlzI1WW/iMMawjS6xf4gyZyWxiEKj?=
 =?iso-8859-1?Q?rB4Id48OiaG6vep0j7+lfMJQValiE2n9Ri3qh+xC2Pmvrl9EmPCmIBj6IR?=
 =?iso-8859-1?Q?iTje84agfi6NC9WBpjiPRgL5cDt+o0x9tO/L9cGePjqmf6K4eR7I7b0Uz0?=
 =?iso-8859-1?Q?W9MLVXqE6jFGUDTN/jybWYhiwGj5EkSUHNVWTdcpS8EixSC0kLHbr5aSAT?=
 =?iso-8859-1?Q?rO2XCn9WLvZszwLoqFPZP14lnDBoo6fjgLg7eOyHW1FZpY3viuoYqqTj4A?=
 =?iso-8859-1?Q?ad5CXB0a+awrPALJwtGh15a0Ru9edJklSr1YS8cxUk6UTpP0eh7HiJA6wl?=
 =?iso-8859-1?Q?1CIRsIiDvxlO3OygH54n2ktm73BW+UDIT0GkIb7kwCfrJ7ldoK18ldAotI?=
 =?iso-8859-1?Q?fyHZgurxVetncMkcvJ+LkB+JFSrakSuFuVX/AlY/yyT1vvf+0+dUror/qs?=
 =?iso-8859-1?Q?47PEL0cKgnj3A3cVnX0k7SCj6F6SpsEo7JaAHyc8lrtw0DOn5Q+egp19Re?=
 =?iso-8859-1?Q?JNe047o6feDSkqV8ius3sNT5+4fwh6z73KEeGto2VyP/HEqjEJPxZInX+Z?=
 =?iso-8859-1?Q?vlPH+qNsJZ5OE6FuZsFJv8OLgMaHrSyf4h0lsH0x8k2lwjqg/WXtOgmU+g?=
 =?iso-8859-1?Q?2tl2Ug3Qb2bv2TNhRHs7OAxzg4LJz4JrlywpAftS3pl9d1BSTPyQxyjYzT?=
 =?iso-8859-1?Q?FuUPufAdVHqhW5Ifa6Zxq+y2uTptzbn4PZOhf4+ljZB38QT85QJ1j4d83q?=
 =?iso-8859-1?Q?x6P1FHvFrWtEpvProJUvkOdF/viNIy8SnAUPdaTQJB1h4kPZOYaTIOyjuo?=
 =?iso-8859-1?Q?0SGDVQK/FJ3nykQz/nxu2f24LataOKnLd0w4awO5uRaOv6hZwaYCSZDIoP?=
 =?iso-8859-1?Q?Se62v4BUzp/X84PNGSKaEGqKByE8UBCfqmWOQS7zrAJZvqSAXuqMSn2KVm?=
 =?iso-8859-1?Q?UJmN/ukGKYWdLZWXTrgbbbgtbBzuOJpXu8ghm55ngM/Spo3wf2u+2X6b/A?=
 =?iso-8859-1?Q?EBQplI3LaA78e+ReJyoGMcFNLmwkiog713keo6+aVaPVX2bWbfsBe8SRYO?=
 =?iso-8859-1?Q?jALHQUpUWJYzSK9WS59lREve4V/4GzJ9RVcjl389lQQaYukzjVgmXulRs7?=
 =?iso-8859-1?Q?bsKveyOaFQjCiTf1kSiw4m8LyoTudj/mAEvnYwEAhmddxJqJ/KViNkx+wU?=
 =?iso-8859-1?Q?a1+oYG5Hd23EwiFvVhTxj6ZlQjrRRiiyfyRMQ64x9AVgA3BGHqoCyK8R4E?=
 =?iso-8859-1?Q?kJm1aFJGGfTG48I+ul68QUNMYVyMu5dzgGYuZoLmP3SfzrA8qXfvFAGdrt?=
 =?iso-8859-1?Q?oQ6Tk+SnECskkdVYFVxndQNYZJF0qJA6gw?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0274916-c3d2-4548-10e4-08dab208b302
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 19:32:45.8461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EIHVFNWJR6YguT1wI/3pq069PokDD9WjAuHsqo934hmZ3HiR6TnlEaL7OAjoIx4/jwlx15dqYBSsaf4qIlvMsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6493
X-Proofpoint-GUID: j0uYCtnwwgfk0ljqUboNbHMC1lYjIM4y
X-Proofpoint-ORIG-GUID: ymf2k7xD3333c71xnxQov0LlqLpjIn2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_11,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 19:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171978

kirkstone now has tiff version 4.3.0.

As described in https://nvd.nist.gov/vuln/detail/CVE-2022-2953, this issue =
is reported here: https://gitlab.com/libtiff/libtiff/-/issues/414

Tested with libtiff source code on version 4.3.0 by using " /libtiff$ git c=
heckout v3.3.0", and follow the step listed in the bug report, cannot repro=
duce the bug.

Use " /libtiff$ git checkout b51bb157", is able to reproduce the problem fo=
llowing step listed above. That confirms the issue occurred after v3.3.0, a=
nd the commit that brings the bug is not on kirkstone, which means the issu=
e/fix is not applicable for kirkstone.

Zheng Qiu
Linux Developer
_______________
Wind River
M/=A0(437) 341-1849

>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Teoh, Jay Shen
>Sent: Thursday, September 29, 2022 4:33 AM
>To: openembedded-core@lists.openembedded.org
>Subject: [OE-core][kirkstone][PATCH 2/2] tiff: backport fix for CVE-2022-2=
953
>
>[Please note: This e-mail is from an EXTERNAL e-mail address]
>
>From: Teoh Jay Shen <jay.shen.teoh@intel.com>
>
>Link for the patch : https://gitlab.com/libtiff/libtiff/-
>/commit/48d6ece8389b01129e7d357f0985c8f938ce3da3
>
>Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
>---
> .../libtiff/tiff/CVE-2022-2953.patch          | 86 +++++++++++++++++++
> meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
> 2 files changed, 87 insertions(+)
> create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-
>2953.patch
>
>diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
>b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
>new file mode 100644
>index 0000000000..2122b46566
>--- /dev/null
>+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
>@@ -0,0 +1,86 @@
>+CVE: CVE-2022-2953
>+Upstream-Status: Backport
>+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
>+
>+From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00
>2001
>+From: Su_Laus <sulau@freenet.de>
>+Date: Mon, 15 Aug 2022 22:11:03 +0200
>+Subject: [PATCH]
>+=3D?UTF-8?q?According=3D20to=3D20Richard=3D20Nolde=3D20https://gitl?=3D
>+
>+=3D?UTF-8?q?ab.com/libtiff/libtiff/-/issues/401#note=3D5F877637400=3D20th=
e=3D20
>+ti?=3D
>+=3D?UTF-8?q?ffcrop=3D20option=3D20=3DE2=3D80=3D9E-
>S=3DE2=3D80=3D9C=3D20is=3D20also=3D20mutually
>+?=3D
>+=3D?UTF-8?q?=3D20exclusive=3D20to=3D20the=3D20other=3D20crop=3D20options=
=3D20(-X|-
>Y),=3D2
>+0-?=3D
>+ =3D?UTF-8?q?Z=3D20and=3D20-z.?=3D
>+MIME-Version: 1.0
>+Content-Type: text/plain; charset=3DUTF-8
>+Content-Transfer-Encoding: 8bit
>+
>+This is now checked and ends tiffcrop if those arguments are not mutually
>exclusive.
>+
>+This MR will fix the following tiffcrop issues: #349, #414, #422, #423,
>+#424
>+---
>+ tools/tiffcrop.c | 31 ++++++++++++++++---------------
>+ 1 file changed, 16 insertions(+), 15 deletions(-)
>+
>+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c index
>+90286a5e..c3b758ec 100644
>+--- a/tools/tiffcrop.c
>++++ b/tools/tiffcrop.c
>+@@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] =3D "02-09-2022";
>+ #define ROTATECW_270 32
>+ #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
>+
>+-#define CROP_NONE     0
>+-#define CROP_MARGINS  1
>+-#define CROP_WIDTH    2
>+-#define CROP_LENGTH   4
>+-#define CROP_ZONES    8
>+-#define CROP_REGIONS 16
>++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and page-
>>rows/->cols !=3D 0 */
>++#define CROP_MARGINS  1     /* "-m" */
>++#define CROP_WIDTH    2     /* "-X" */
>++#define CROP_LENGTH   4     /* "-Y" */
>++#define CROP_ZONES    8     /* "-Z" */
>++#define CROP_REGIONS 16     /* "-z" */
>+ #define CROP_ROTATE  32
>+ #define CROP_MIRROR  64
>+ #define CROP_INVERT 128
>+@@ -316,7 +316,7 @@ struct crop_mask {
>+ #define PAGE_MODE_RESOLUTION   1
>+ #define PAGE_MODE_PAPERSIZE    2
>+ #define PAGE_MODE_MARGINS      4
>+-#define PAGE_MODE_ROWSCOLS     8
>++#define PAGE_MODE_ROWSCOLS     8    /* for -S option */
>+
>+ #define INVERT_DATA_ONLY      10
>+ #define INVERT_DATA_AND_TAG   11
>+@@ -781,7 +781,7 @@ static const char usage_info[] =3D
>+ "             The four debug/dump options are independent, though it mak=
es
>little sense to\n"
>+ "             specify a dump file without specifying a detail level.\n"
>+ "\n"
>+-"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.\n"
>++"Note:        The (-X|-Y), -Z, -z and -S options are mutually exclusive.=
\n"
>+ "             In no case should the options be applied to a given select=
ion
>successively.\n"
>+ "\n"
>+ ;
>+@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char
>*argv[], char *mp, char *mode, uint32
>+               /*NOTREACHED*/
>+       }
>+     }
>+-    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and -z a=
re
>mutually exclusive) --*/
>+-    char XY, Z, R;
>++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z and =
-S are
>mutually exclusive) --*/
>++    char XY, Z, R, S;
>+     XY =3D ((crop_data->crop_mode & CROP_WIDTH) || (crop_data-
>>crop_mode & CROP_LENGTH));
>+     Z =3D (crop_data->crop_mode & CROP_ZONES);
>+     R =3D (crop_data->crop_mode & CROP_REGIONS);
>+-    if ((XY && Z) || (XY && R) || (Z && R)) {
>+-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z a=
nd -z are
>mutually exclusive.->Exit");
>++    S =3D (page->mode & PAGE_MODE_ROWSCOLS);
>++    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) || (=
R && S))
>{
>++        TIFFError("tiffcrop input error", "The crop options(-X|-Y),
>++ -Z, -z and -S are mutually exclusive.->Exit");
>+         exit(EXIT_FAILURE);
>+     }
>+   }  /* end process_command_opts */
>+--
>+2.34.1
>+
>diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-
>multimedia/libtiff/tiff_4.4.0.bb
>index e30df0b3e9..caf6f60479 100644
>--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
>+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
>@@ -11,6 +11,7 @@ CVE_PRODUCT =3D "libtiff"
> SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
>            file://CVE-2022-34526.patch \
>+           file://CVE-2022-2953.patch \
>            "
>
> SRC_URI[sha256sum] =3D
>"917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed
>"
>--
>2.37.3


