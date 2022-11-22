Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C50C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 15:46:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22876.1669131980753400732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 07:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QoGr77XH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8325ca1ee6=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMEcUgJ032227
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Mr5Qwq42FNcgUU/k71xlbzWdtgmSH3Hrs9LUH0LX3uY=;
 b=QoGr77XHYLEYbC6otl42fA+CEHnJRiusqnaomHCbLQ45k8Zxl7AJ5c6rObDgxLb2tCjc
 JsSiP75qG9J3VCO9KMqlwRTgmoe40ClB09WnXF9+gq/fzYLk4xJv8Ks/sIs/b51a2huZ
 yIxBkIqHLeZvzn7L7I4Q52StaYjQcFoLfxWCTq44gC7p7Oc7pBUuu9AEsAdNXiYLzoLw
 RVG+0A7fUREf2fzry2831JdZ2B+trafQ5hk5D7ye994xgd9MDkV7o63lt+JpM6B+FyLb
 SgRN9zodNUVvoyfLb2y/fz6gnPk5QQP+mMD98iqKpvoITwna+6pWCEl5WD8i0hiRebwd pg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj2nj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:46:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKCBnicyQ2SnLmz/uw2wZbHbYj1xG4FIcTJCXE1YJKrln4MtD1INFz8rOPy1HCQqr+ltGivOoDmSE6OKfV+C/jRfygg+jmR+jIECpXfYFjwDq55LHZRvdbilgH7GKCZvoZPgtuyFDOIUU6OfQCmzonRUHgXbf/bSr8BDyxMSLhfCoHzCjj56YUhgrKAgNxYnLUBRrqOOvjUE3cnM5KL6fnb00bT3+I1wlZmhmVsfK6Iv0DtvR8YI6s2xRS/W7mxJptWh2RRZztyc8u+WG4KdHRy/sJhBsaB7+4xIK4wSWsVtoJCn31y5UvgKHi1MoNpFQYtCWFoC30mk8kyyKtbMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mr5Qwq42FNcgUU/k71xlbzWdtgmSH3Hrs9LUH0LX3uY=;
 b=SNp+sOokVTdJtf1SqR4ArAvReQ2jx/5Rbmy5st50zFdMYZD+blYTcN3rIrMeL2cOnl211NrZXbyv/KvJWXARqHlx9qee5JNalbHcOvBRT8f5NQmQEHRFXN8OlTNoiA9veNJ47F5fbCesDpg6+xkMghw8M6WxdryXceZyNfvNAC+2l88ejnRA7OaiOZinxKhU0Oax3wrZL/WB5qPD4LEYOdUdK4u2zmmgINfjn+g1zBI9c84BCdrn8Vv2nMX93IGL6dKntxEp9HwUNJaCgvTglJAt7nZJK0/u1BLlebcWTmp2GStgDTe4a0xZISixbxlLgxeQH1JMSh6pIPq/R695Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 15:46:10 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3f89:e405:8373:8c98]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3f89:e405:8373:8c98%9]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 15:46:10 +0000
From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>
To: "Qiu, Zheng" <Zheng.Qiu@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [OE-core] [master][PATCH] tiff: Security fix for CVE-2022-3970
Thread-Topic: [OE-core] [master][PATCH] tiff: Security fix for CVE-2022-3970
Thread-Index: AQHY/oh34wNGonEReUi/FBcwuv3yha5LFexw
Date: Tue, 22 Nov 2022 15:46:10 +0000
Message-ID: 
 <DM4PR11MB5536FFC02FBA05F367EC7CE1E60D9@DM4PR11MB5536.namprd11.prod.outlook.com>
References: <1729F2402CDD79EA.31464@lists.openembedded.org>
In-Reply-To: <1729F2402CDD79EA.31464@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5536:EE_|SA1PR11MB6805:EE_
x-ms-office365-filtering-correlation-id: fee3f6f7-3f89-4897-9a02-08dacca0ad93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Us1k3241L7tI2AQb6S8uK1P8RK5P59I4VliOHkfZBi12dETqK2f7KjBPHFEMVM0zcsFhtvGTAIN+v9564SbMY/akctKhfhn0DWKvTmIyNj7e0gKUXaFvhvgGMsuPK1JGP1aOwix5GA2njb3G+mPDL2ekk7zDLtWI6+xOpPyF7gfV1lmmp1ieseCItO3eBd5CvZNzSBIef9elJdjlpVsquxwHtB7S70nRv92OKQfiWX58+MI7FT5vMcdlrENm3Rm8ma05Qev9Hkrc0wSxGZzYT3xuX7s61gtYWqTxP07VYYBTBYD0vhiif5lMbHbnDx1tmi48XWQNqivQ86T7sUS7OfFPN1k5tfKuJ6aZKkxEPY9HWfOZhUSn3tthndJmjx7QFR02xxJTTkX1tTIq0VWANSUFuchihM9PJ2X+uGKpwVunesRilBzZUXw8uTkrI9jDS82bImeCVBsv9znzpncAKdrA0OmiTfDlKTe5VCx38PSqCuzjHKvoYpNxyN163htYX9FCQiwJqUxGKBxLBDhRboFBY2K+3itCw7JJRX4Wk2bXtl+iCP0Z274/egPK68ne7x3wY2ToXjCwXzjnEoLsU4jeySijCT5V3SUqbRXe4r/LCKoz7OEwyIy+vLrUjwcJl4UrRIhiYGuAl7u+DkUtQoduVZfKewhAOEHemP2RAjnKenFZmDkOo6tl9OA6EsI00XYLkP+HqCi4v832ASL9Z3mAzQ9sSNUvYp+dM0gWNFIrwLI84zPn1E+ECycNo6rPY1+yY0gFbjNImp5p/IwF7g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(451199015)(9686003)(186003)(83380400001)(122000001)(76116006)(55016003)(64756008)(7696005)(2906002)(38100700002)(5660300002)(26005)(6506007)(71200400001)(107886003)(52536014)(66556008)(966005)(8676002)(478600001)(66946007)(316002)(8936002)(66446008)(41300700001)(4326008)(66476007)(110136005)(33656002)(15650500001)(40140700001)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?VMTkh5y1i3TfMo7I+O4o0tIsHcspLSlMklI2eillsv9VkoftJDRd/bltWa?=
 =?iso-8859-1?Q?hzcp0j3EXfWmy41O/FD4xQlpqk3dfAyikiJ4gjwIYW9hzoJ/XTtKMVHNea?=
 =?iso-8859-1?Q?rFLV7/dfoqiA/A5mGzFjcHLqlfrlbUh8K2h9RxDoOU08Pl2lKRMgMsEtuL?=
 =?iso-8859-1?Q?uF1nSfH1gopXREBwgCEWxlX4kglxOMaIh4LNXccmlQ+U5Svl4L61aVnBtr?=
 =?iso-8859-1?Q?OZqvWroqUrgJTdZI4EYv5TBloThfiP7jkzP2J1bBwyrhUdYmITwHog8tSr?=
 =?iso-8859-1?Q?Hv2g6thQcbpaP3hhSyhPdzAvB8k3i4Ply4+uaCe1URZBf0oQowx3HgOu9X?=
 =?iso-8859-1?Q?FNgOR1+CI/Z2S20QLsSDPs6hawJ8Qgi8GGeT+BBjYQOsh8v7BbuKACe0Oj?=
 =?iso-8859-1?Q?TJmVaiebJDnmOvtGVifhFKB8ZuJiizBPRlFROVENtHGYa4gPYI0bLMctl0?=
 =?iso-8859-1?Q?AgS1AMgpMWDjLZ3l/+ReAomvRqdJZf1FMJK+hzVD5H7eiW1PPVockoUVUa?=
 =?iso-8859-1?Q?GPk41cllbtYjc57DHvbWGgP/+z9rgnbdN50pbILKGG3Y45OqD8xOBsvF9i?=
 =?iso-8859-1?Q?SabT/a3QCpkG2hlog4eiiDoURf5+pZyciEknSTK5bIRWWwf5g71OrjZbOF?=
 =?iso-8859-1?Q?NRVg+HYrJQ7iRphoRxSenz6gVqEY6JXb/OdE3Bzk1ozc1udi+RlFHf59Do?=
 =?iso-8859-1?Q?NKh/MTtIfLMX/e+qNTtob1pbHD7k8HC2M/jmXIayY7iuvUPLZSbVRxWPJM?=
 =?iso-8859-1?Q?+53qg6HvVrb6AKWfdqjKoBXh8N5gVa49M4bqo0mEqmj92usvb2ibcFK4Nb?=
 =?iso-8859-1?Q?Cwu9CWtqHB6mSOMIwOI7RRk3VIbD/aPVGIpb6WKPiV32VYqHVyfLDbjxmh?=
 =?iso-8859-1?Q?JF++UAjcDfnXpeI+pkqEy+OZuYHIGcIs1ccEZHVeztWzIJlHDLf9YxZ7AJ?=
 =?iso-8859-1?Q?msUjNx/GxHMRZgv1YotkWE5juporJhiMXFkuhFjxr4fgc0z3EXeglbMPAD?=
 =?iso-8859-1?Q?r1lLNe2KdyEhceekV5KOed7hgozVW5IJimgJnehyUZyH0emBZWN4DupAJT?=
 =?iso-8859-1?Q?fQt3HLNs0nHVoVGmu6c5nfHUOw7PNUdaMvOdorQauNHg/B8YeP7mRmXxdy?=
 =?iso-8859-1?Q?6RQZGU4U9BltX5JbToRQb7r65cz4GkXuehbKkEtGyaQCvppDvwetXeKuRn?=
 =?iso-8859-1?Q?UxlGjRHqutn67xBXBMQBBqsGt5qTVNzVnmg1QSz0d82HFhUPZZxJnM39G1?=
 =?iso-8859-1?Q?D5DM8u1gLlKlLNH0KfgUdFLjLmWqqyJky0IF8g8y092RRnRSVchXfqcXYd?=
 =?iso-8859-1?Q?jJASd5k4GlUsJFwhjUGGj35T/DDwaJtRcFCyH73cxTGib4TWOQ8VDqK0Yj?=
 =?iso-8859-1?Q?HJgPyPzRl06ZlkEQfznVlZNO0RVw+GI+jew/SyrBfCbwIsAjfz8hsxZAwt?=
 =?iso-8859-1?Q?Ouv7T4dj8N1gLujVqY4AcPBFabv9b0kLhkpZvjGSc0E1HIZhXn29/SIaur?=
 =?iso-8859-1?Q?mX0mPtBx9hDgWCQmscHsE9m75BerwRdHbg7xwM+RoQ0/Jh4tHMET4ufDft?=
 =?iso-8859-1?Q?V0PjVspxBAaITv2tDRUoFgXPDLtJiXg6/6pH3Z1iyx5XFE7CtM/KFAsMmY?=
 =?iso-8859-1?Q?XnT6k0/8rICbrs7524h2G/hfy7drMps684?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee3f6f7-3f89-4897-9a02-08dacca0ad93
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 15:46:10.5155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hImygyQ2xg1pGtGFuzMGfQqwfu5uvJono0WF4XZ4urHpDYnalR1lHhSu7sw2A/gGpblV677L+LdiWzsTIffDIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
X-Proofpoint-GUID: ICDt88zK7Axh5tC3OYxQhIRrtA9hQDj9
X-Proofpoint-ORIG-GUID: ICDt88zK7Axh5tC3OYxQhIRrtA9hQDj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_09,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=613
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173687

This patch has a problem. Please waiting for v2.

Zheng Qiu
Linux Developer


M/=A0(437) 341-1849

>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Qiu, Zheng via
>lists.openembedded.org
>Sent: Tuesday, November 22, 2022 10:38 AM
>To: openembedded-core@lists.openembedded.org
>Cc: Qiu, Zheng <Zheng.Qiu@windriver.com>; MacLeod, Randy
><Randy.MacLeod@windriver.com>
>Subject: [OE-core] [master][PATCH] tiff: Security fix for CVE-2022-3970
>
>This patch contains a fix for CVE-2022-3970
>
>Reference:
>https://nvd.nist.gov/vuln/detail/CVE-2022-3970
>https://security-tracker.debian.org/tracker/CVE-2022-3970
>
>Patch generated from :
>https://gitlab.com/libtiff/libtiff/-
>/commit/227500897dfb07fb7d27f7aa570050e62617e3be
>
>Upstream-Status: Accepted
>
>Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
>---
> .../libtiff/tiff/CVE-2022-3970.patch          | 38 +++++++++++++++++++
> meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
> 2 files changed, 39 insertions(+)
> create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-
>3970.patch
>
>diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
>b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
>new file mode 100644
>index 0000000000..e8f143933a
>--- /dev/null
>+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
>@@ -0,0 +1,38 @@
>+From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00
>2001
>+From: Even Rouault <even.rouault@spatialys.com>
>+Date: Tue, 8 Nov 2022 15:16:58 +0100
>+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow
>+on  strips/tiles > 2 GB
>+
>+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D53137
>+---
>+ libtiff/tif_getimage.c | 8 ++++----
>+ 1 file changed, 4 insertions(+), 4 deletions(-)
>+
>+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c index
>+a4d0c1d6..60b94d8e 100644
>+--- a/libtiff/tif_getimage.c
>++++ b/libtiff/tif_getimage.c
>+@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col,
>uint32_t row, uint32_t * raster, in
>+         return( ok );
>+
>+     for( i_row =3D 0; i_row < read_ysize; i_row++ ) {
>+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
>+-                 raster + (read_ysize - i_row - 1) * read_xsize,
>++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
>++                 raster + (size_t)(read_ysize - i_row - 1) *
>++ read_xsize,
>+                  read_xsize * sizeof(uint32_t) );
>+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read=
_xsize,
>++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) *
>++ tile_xsize+read_xsize,
>+                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
>+     }
>+
>+     for( i_row =3D read_ysize; i_row < tile_ysize; i_row++ ) {
>+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
>++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) *
>++ tile_xsize,
>+                      0, sizeof(uint32_t) * tile_xsize );
>+     }
>+
>+--
>+2.33.0
>+
>diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-
>multimedia/libtiff/tiff_4.3.0.bb
>index f84057c46b..0fbe515e9d 100644
>--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
>+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
>@@ -24,6 +24,7 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-
>${PV}.tar.gz \
>            file://CVE-2022-34526.patch \
>            file://CVE-2022-2869.patch \
>            file://CVE-2022-2867.patch \
>+           file://CVE-2022-3970.patch \
>            file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
>            "
>
>--
>2.33.0


