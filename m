Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D72AC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 17:28:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web11.48870.1677000492238958604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 09:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=hWS1utYw;
 spf=pass (domain: witekio.com, ip: 40.107.8.81, mailfrom: hsimeliere.opensource@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOqKwqszkqlADkjZD3NLTqV7Zbtu2+2zzrwtLPNMece6FLvgvQ4zqNJ5Lr9OdOXZFbdYXCfX6GoEMWG83t6Gpjf178uEBSr2G9lJZe6IbcURLso/Kh2DoWxVF8TO/Sp0jbn98ZQA+IapylUdnV9Jlitv5AK3n2eLMp9lD4Y+I5LaqZKz+rZ5cemWjAFD3eyJ98uJVaJ1xbMhaPos5io9l+x9IgUZP19/wQ99/0APBePDndDVxboD0PThk34X2zccroUZ8B0DwJeWPZ+P7i7ChlsaTIqyIvApC5oDRnwcc7mEg+zwzUHu6v5H1Gesk1qXmgYmyUWir6I8kWz9VqOHPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jc3xSpLZWADIxyBvHJFZiXuiggoYnJaBcxfBDRlpds=;
 b=WMv5qkYJFlTrGXrBN57GsWHn4j8zY/82U6bBeQtu61jNhodbT+01rxV6fj/747pBYC+g827G6unyoUofeEP9cag8MbYB8BFUj7JC872dNVJm0+sirozo/yqRLV7W5vt7nJvzCKpuzmJtZJZq4r+7N91sArCdHlWSP0FAF6beHXpvCEtww1NnheVajspNgJrjvCnGirUKFpT0JV16qOGLvAjOfyq8dZYfmFXD4F4WDGCxvSEgEzEjmU7Ln3YgHbCy2unquDiTHM/i7uKAGMctfoYxiiK0ucO2cj79qiggMV29J9l6CMTJAnoUAI5fcbAyekenQMgOGhhoLURhDuRVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jc3xSpLZWADIxyBvHJFZiXuiggoYnJaBcxfBDRlpds=;
 b=hWS1utYwzxPpFleRf0kTXeIIOjs78JVhOz44XRgEvE77tn/5+GsMSxkIUrVUrGwWY2+oIDoIt9ThfEpg7cC9RMOuvpiwwGwamxJwvq0jGMrXG8K/ZFsLzNcN0X+NBhpk8YPGVmCfMxRjzZOxSJ1v1qn2XnO08FPeCBKSHX0pZEOdnhsn+1dJjGMfAuKQwVqDCExKohannqUWXcl1DY5+gRbp9I3ALuKWyFH0qjnulYqDemBLs6l9I3n+9k9edZ/w5vAbyhwi4tHAdcsGWwoMJZaBy807J/Ra2THwxPtfYqSKkCCEwj67bsXNi5+ErLMzReOeDGFE6ZINq6TP8SgpYw==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by PAXP192MB1558.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:28e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.12; Tue, 21 Feb
 2023 17:28:07 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%7]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 17:28:07 +0000
From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [meta-oe][dunfell][PATCH 1/2] zeromq: upgrade 4.3.2 -> 4.3.3
Thread-Topic: [meta-oe][dunfell][PATCH 1/2] zeromq: upgrade 4.3.2 -> 4.3.3
Thread-Index: AdlGGatDY7TETaqlSg+biHq2lD+VUg==
Date: Tue, 21 Feb 2023 17:28:07 +0000
Message-ID: 
 <PR3P192MB07147F5AED87B5910212E896DAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P192MB0714:EE_|PAXP192MB1558:EE_
x-ms-office365-filtering-correlation-id: 458fa005-2b3d-4224-bc10-08db1430ff1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ld4yubzwlKb/L3BGyvqJa1xFji0NJ0udhBaLmgzzxLGM2B2MP+hNC/1TlPESv3SdLKXq3z4aB7miZxCkAa8OY2uiMOOfTSBNm2kHgpjfCFjuCUrO5w4Ro914kt7c9kU+hmAYX8y4THRCwo2sMuUz1gnV48OtNTicHWy27YhxylN/+ZsbO7H3tJpERiRi5BNiNSD5GGw+8+RQySo5rFjeqzNGgyh3MnBxsehCHw8ced63f+elm47iRXUaIHEFJejte/yW6fdUsNl64I+Jb7+/Knpm2IoRTW6H5t9nb5e1OkT1nYPLVZDaUSq9Q51A0GmgoNlCmCF7rrgyBCNmgLMWrkRpW3hLOwzZW2Va5CQp+QDFfbOEA0mfxoyl30Y/KiQEuXmkS4stDO6/Bkghf2U+B/YoDt/3i2nHi6Z9yxa2iTkCssDUKF0BIjMVR4f9gDSqL9CVti0lZu66haP7HPVNhbm4bSP8Vf6TGPpXnPlApx8uKVb59a0qHIUfK05id2XSOPp1v6ZtgfhSe7aEGH/8ffRh3iPubTjnn3YHLvCB5/gO8/YLpaqNSLlXgf99674Zc0CIy4hn419MkpHO8VPW4TvyWv+p23D8M8auQBTBTyvlGSxbZ/D+f649Ahmb4GDjbp228tI/KOjaKKo6DsV0V+YkjABXI+Qdcljm5Yk+dx+QzWCaLPTfdTFq2yEic4va
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(39840400004)(366004)(136003)(346002)(451199018)(2906002)(52536014)(186003)(41300700001)(38100700002)(8676002)(6916009)(76116006)(66556008)(64756008)(66946007)(66446008)(66476007)(122000001)(8936002)(5660300002)(6506007)(9686003)(316002)(55016003)(38070700005)(86362001)(83380400001)(7696005)(71200400001)(33656002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?f6d4GPAAFKaukSF//4xS+ko0WqK+Xoo9Q3eYXbkDL6tcWqikTkIrQVHXHRnD?=
 =?us-ascii?Q?7gGODDjJbvCQ7pUuGfdf/axwgXIlNRrQjLim7Wm+qj6F6JRx0/UXv6Su62iO?=
 =?us-ascii?Q?H2KhGz5d7U7G3dt+Vd2bydRWYyZ0wVHdR715kZVSh4Z/zSXp/8WTWdp5mdnD?=
 =?us-ascii?Q?L+IMyr0CebY28YHHKPgMR+xvwhfUSjOcRVIPcunoJpdPLB3Fz7wk6Cf4HmBC?=
 =?us-ascii?Q?Rj0Mow4LTOEKRXxAayRcVhecHxFZpz71kmi/qCUtSKsU25DETq/HowVo6I5G?=
 =?us-ascii?Q?AFYGtFpMSbSPS+l36MRJ+SjFJTwhw9alM4/SOwovbELWxDjI0ZYisdo0hokV?=
 =?us-ascii?Q?ONujrxmwEDpxcZ20OQ1KZEXLNLV5I1B0Ffls/hNE+pKbmZLecpXCdWxhv02n?=
 =?us-ascii?Q?kRnHpQB3vl7L5Azgz97YF7jf3YBZOGrZvWijVTvOtVgoLIa5RWrmq4AYzVaY?=
 =?us-ascii?Q?+z/oReTuaGYukNnif3FcHOrKueIY0hD8XcsBwrpSSNy6CVJouOXdeYVhVg7e?=
 =?us-ascii?Q?ZQqwN61xku+ZP13D2zbRW+fI5yG+gwyTwy5z13VeWyWUJLE1jVXKUhiVayL0?=
 =?us-ascii?Q?6rXld9ineIW8i4WVC/wonh7QbNHWdrhzcT1Pur6u4TWTC89iDhFPKQ98t9j2?=
 =?us-ascii?Q?csnG1XhiDzjSw5RrNtzvRGhOrs+jNrr6Ghy7tDYvTzLSpJrpaCp/XmtO9MbN?=
 =?us-ascii?Q?rihhGuqsuLsUXEDCUfA3h+dZm+u1ZFbcd5W92Df/PlroNOWEDVYaPiyska02?=
 =?us-ascii?Q?W4FAwV4ajui5atD4o3SigutAgB7mbxarvzGBBf+9O40aLVuGsn4+oMFvfAgO?=
 =?us-ascii?Q?obnmlkqcXYWlV75Z7AUL8143xWSB56jphATMA2twvr6UK3c8q5EezVxBtFgf?=
 =?us-ascii?Q?3Q9JQ8k1GDE1tOdo2OPe0HYdwKFjWC4c6TYxVZY4eVSGlg0lKMZ/EHuKWdNi?=
 =?us-ascii?Q?DlU8ICj1SpjuPgzEssqvYIp0m2wKaD21UmNfkwLRlnvDccer5I43eJAr8J+c?=
 =?us-ascii?Q?zzvhDhw5tDu7d4kYPW1fmULqo38wVYskq4gud2Wzgoq0PNeP8CytIsvcmOcB?=
 =?us-ascii?Q?vrTL80eW0xmMosJRDNh7zf9dAxjLpHKSpH1koQHVJQRQJF9rs69PbGL+n7jO?=
 =?us-ascii?Q?O3qruhzeovCgV9VzMisjuZYv6a2ERjgzQ+IECTfXtVaa5fKPfQQcCXB1Goqj?=
 =?us-ascii?Q?TPD25e8iHyjcNhSL+fjbhP0IZaibvcA/uFXvFZT8fSHhj1TA3+omRajxRvkr?=
 =?us-ascii?Q?UAM2vIFM32ETz+isahlmPKXjWsW04SsXz9POlYERmVLutmuVoK5in8Bd4mNI?=
 =?us-ascii?Q?MhL8aqxvEUtXbPCQhO5QwvfiLG4XGt41xsHgjqfqSO8XeII6WGDPEdZpA9D7?=
 =?us-ascii?Q?wrKI8OWgISElHdjHNUsrfRpGT9OJIj7CVGHjnynYwzurBIxMYA1xlqAahjaf?=
 =?us-ascii?Q?FsNCF86hpYr58aX0dfMSTWZfFbkRPqiGVSJ0Ur69326zuwJyhKZ5tUMZCB+d?=
 =?us-ascii?Q?XpbXWHxFBcZTo46EF20a8xQDyPKKm9rLHm0kIOUT3unNE1+WNPsQEVCSYyIr?=
 =?us-ascii?Q?lWhLF3wCPyYukl4+HIyM7CGPuyfqQ4cIgXTGsaljFH0jU8fP16CQ0irlyKYH?=
 =?us-ascii?Q?jiFVYx3zAbsRiOPL3e4uMJbvw6me/KmrT0NUjmN8zrRW?=
Content-Type: multipart/alternative;
	boundary="_000_PR3P192MB07147F5AED87B5910212E896DAA59PR3P192MB0714EURP_"
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 458fa005-2b3d-4224-bc10-08db1430ff1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 17:28:07.3959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1TrIjRaABYQ6+lZPKCR2zYTeDttLYmva5iXklDQy3mCkBAkabzgLHRWzJMXWHjCP+rp53AZP2Fo3fgXuEMEwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP192MB1558
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 17:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177530

--_000_PR3P192MB07147F5AED87B5910212E896DAA59PR3P192MB0714EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Refresh the following patch:
0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 117b3f95507b464aafe6a1948cf4a79f26194acb)
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
...void-host-specific-path-to-libsodium.patch | 19 +++++++++++++------
.../{zeromq_4.3.2.bb =3D> zeromq_4.3.3.bb}      |  4 ++--
2 files changed, 15 insertions(+), 8 deletions(-)
rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.2.bb =3D> zeromq_4.3=
.3.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-=
Avoid-host-specific-path-to-libsodium.patch b/meta-oe/recipes-connectivity/=
zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patc=
h
index eb3dee4d3..3b0300c8a 100644
--- a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-h=
ost-specific-path-to-libsodium.patch
+++ b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-h=
ost-specific-path-to-libsodium.patch
@@ -1,6 +1,7 @@
+From 24ad50286a87833329213dc0b0e68c21aeeee95f Mon Sep 17 00:00:00 2001
From: Niko Mauno <niko.mauno@vaisala.com>
-Date: Wed Apr 22 09:00:00 2020 +0300
-Subject: CMakeLists.txt: Avoid host-specific path to libsodium
+Date: Wed, 22 Apr 2020 09:00:00 +0300
+Subject: [PATCH] CMakeLists.txt: Avoid host-specific path to libsodium
 Avoid propagating full build host specific path to generated
ZeroMQTargets.cmake when building with libsodium, which changes the
@@ -17,10 +18,16 @@ Upstream-Status: Pending
 Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e92141d..d0775c1 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
-@@ -1210,7 +1210,7 @@
-   target_link_libraries(libzmq ${OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LIBS_=
INIT})
+@@ -1428,7 +1428,7 @@ if(BUILD_SHARED)
+   endif()

    if(SODIUM_FOUND)
-    target_link_libraries(libzmq ${SODIUM_LIBRARIES})
@@ -28,8 +35,8 @@ Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
      # On Solaris, libsodium depends on libssp
      if(${CMAKE_SYSTEM_NAME} MATCHES "SunOS")
        target_link_libraries(libzmq ssp)
-@@ -1240,7 +1240,7 @@
-   target_link_libraries(libzmq-static ${OPTIONAL_LIBRARIES} ${CMAKE_THREA=
D_LIBS_INIT})
+@@ -1473,7 +1473,7 @@ if(BUILD_STATIC)
+   endif()

    if(SODIUM_FOUND)
-    target_link_libraries(libzmq-static ${SODIUM_LIBRARIES})
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb b/meta-oe/=
recipes-connectivity/zeromq/zeromq_4.3.3.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
index 02a4c04fd..a10500475 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
@@ -10,8 +10,8 @@ SRC_URI =3D "http://github.com/zeromq/libzmq/releases/dow=
nload/v${PV}/zeromq-${PV}
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch=
 \
     file://run-ptest \
"
-SRC_URI[md5sum] =3D "2047e917c2cc93505e2579bcba67a573"
-SRC_URI[sha256sum] =3D "ebd7b5c830d6428956b67a0454a7f8cbed1de74b3b01e5c33c=
5378e22740f763"
+SRC_URI[md5sum] =3D "78acc277d95e10812d71b2b3c3c3c9a9"
+SRC_URI[sha256sum] =3D "9d9285db37ae942ed0780c016da87060497877af45094ff9e1=
a1ca736e3875a2"
 UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/libzmq/releases"
--
2.25.1


--_000_PR3P192MB07147F5AED87B5910212E896DAA59PR3P192MB0714EURP_
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
<p class=3D"MsoNormal">Refresh the following patch:<o:p></o:p></p>
<p class=3D"MsoNormal">0001-CMakeLists-txt-Avoid-host-specific-path-to-libs=
odium.patch<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Zang Ruochen &lt;zangrc.fnst@cn.fujit=
su.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<o=
:p></o:p></p>
<p class=3D"MsoNormal">(cherry picked from commit 117b3f95507b464aafe6a1948=
cf4a79f26194acb)<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Hugo SIMELIERE &lt;hsimeliere.opensou=
rce@witekio.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">...void-host-specific-path-to-libsodium.patch | 19 +=
++++++++++++------<o:p></o:p></p>
<p class=3D"MsoNormal">.../{zeromq_4.3.2.bb =3D&gt; zeromq_4.3.3.bb}&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">2 files changed, 15 insertions(+), 8 deletions(-)<o:=
p></o:p></p>
<p class=3D"MsoNormal">rename meta-oe/recipes-connectivity/zeromq/{zeromq_4=
.3.2.bb =3D&gt; zeromq_4.3.3.bb} (87%)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-oe/recipes-connectivity/zeromq/fil=
es/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch b/meta-o=
e/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-host-specific=
-path-to-libsodium.patch<o:p></o:p></p>
<p class=3D"MsoNormal">index eb3dee4d3..3b0300c8a 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-oe/recipes-connectivity/zeromq/files/0001=
-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta-oe/recipes-connectivity/zeromq/files/0001=
-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -1,6 +1,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">+From 24ad50286a87833329213dc0b0e68c21aeeee95f Mon S=
ep 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Niko Mauno &lt;niko.mauno@vaisala.com&gt;<o:p>=
</o:p></p>
<p class=3D"MsoNormal">-Date: Wed Apr 22 09:00:00 2020 +0300<o:p></o:p></p>
<p class=3D"MsoNormal">-Subject: CMakeLists.txt: Avoid host-specific path t=
o libsodium<o:p></o:p></p>
<p class=3D"MsoNormal">+Date: Wed, 22 Apr 2020 09:00:00 +0300<o:p></o:p></p=
>
<p class=3D"MsoNormal">+Subject: [PATCH] CMakeLists.txt: Avoid host-specifi=
c path to libsodium<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;Avoid propagating full build host specific pat=
h to generated<o:p></o:p></p>
<p class=3D"MsoNormal">ZeroMQTargets.cmake when building with libsodium, wh=
ich changes the<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -17,10 +18,16 @@ Upstream-Status: Pending<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;Signed-off-by: Niko Mauno &lt;niko.mauno@vaisa=
la.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">+---<o:p></o:p></p>
<p class=3D"MsoNormal">+ CMakeLists.txt | 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">+ 1 file changed, 2 insertions(+), 2 deletions(-)<o:=
p></o:p></p>
<p class=3D"MsoNormal">+<o:p></o:p></p>
<p class=3D"MsoNormal">+diff --git a/CMakeLists.txt b/CMakeLists.txt<o:p></=
o:p></p>
<p class=3D"MsoNormal">+index e92141d..d0775c1 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/CMakeLists.txt<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/CMakeLists.txt<o:p></o:p></p>
<p class=3D"MsoNormal">-@@ -1210,7 +1210,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp; target_link_libraries(libzmq ${OPTIONA=
L_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})<o:p></o:p></p>
<p class=3D"MsoNormal">+@@ -1428,7 +1428,7 @@ if(BUILD_SHARED)<o:p></o:p></=
p>
<p class=3D"MsoNormal">+&nbsp;&nbsp; endif()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;if(SODIUM_FOUND)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; target_link_libraries(libzmq ${S=
ODIUM_LIBRARIES})<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -28,8 +35,8 @@ Signed-off-by: Niko Mauno &lt;niko=
.mauno@vaisala.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # On Solaris, libsodi=
um depends on libssp<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(${CMAKE_SYSTEM_NAM=
E} MATCHES &quot;SunOS&quot;)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; target_li=
nk_libraries(libzmq ssp)<o:p></o:p></p>
<p class=3D"MsoNormal">-@@ -1240,7 +1240,7 @@<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp; target_link_libraries(libzmq-static ${=
OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})<o:p></o:p></p>
<p class=3D"MsoNormal">+@@ -1473,7 +1473,7 @@ if(BUILD_STATIC)<o:p></o:p></=
p>
<p class=3D"MsoNormal">+&nbsp;&nbsp; endif()<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;if(SODIUM_FOUND)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp; target_link_libraries(libzmq-sta=
tic ${SODIUM_LIBRARIES})<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-oe/recipes-connectivity/zeromq/zer=
omq_4.3.2.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb<o:p></o:=
p></p>
<p class=3D"MsoNormal">similarity index 87%<o:p></o:p></p>
<p class=3D"MsoNormal">rename from meta-oe/recipes-connectivity/zeromq/zero=
mq_4.3.2.bb<o:p></o:p></p>
<p class=3D"MsoNormal">rename to meta-oe/recipes-connectivity/zeromq/zeromq=
_4.3.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal">index 02a4c04fd..a10500475 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3=
.2.bb<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3=
.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"FR">@@ -10,8 +10,8 @@ SRC_URI =3D &quo=
t;http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR">&nbsp;&nbsp;&nbsp;&nbsp; </span>fi=
le://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; file://run-ptest \<o:p></o:=
p></p>
<p class=3D"MsoNormal">&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[md5sum] =3D &quot;2047e917c2cc93505e2579bcb=
a67a573&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[sha256sum] =3D &quot;ebd7b5c830d6428956b67a=
0454a7f8cbed1de74b3b01e5c33c5378e22740f763&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[md5sum] =3D &quot;78acc277d95e10812d71b2b3c=
3c3c9a9&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[sha256sum] =3D &quot;9d9285db37ae942ed0780c=
016da87060497877af45094ff9e1a1ca736e3875a2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;UPSTREAM_CHECK_URI =3D &quot;https://github.co=
m/${BPN}/libzmq/releases&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.25.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PR3P192MB07147F5AED87B5910212E896DAA59PR3P192MB0714EURP_--

