Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDE6C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 17:29:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.48906.1677000549739539532
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 09:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=i1EKrjnR;
 spf=pass (domain: witekio.com, ip: 40.107.8.47, mailfrom: hsimeliere.opensource@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNwKRsU3YpObPTeTvyDGiJ1XpV+nmY7j9JozBZdqljbY+eR8FxfkxJbKtbJrmhUD+LtKyxLECUl54OO1by1Az7zSEL27QDbojaOEKUXBTe4J8IdM+NJ418C5Kd1+L5ovWLB8Tqrh0xSw0x5R8ISFlmzRj0hNVMa4mKqLf1eB5ADUnDHAAPC1fkIWDIwxkQ7arz2wAoD1YtC7JfQtUlQTskO06/QZfqWJEsXXggEm4jJJc3AaI6C4nF3IUJLvuRQymYLS/LVunoE2Nfn/xYrX00MTeNk/s6VPW2Iqq+GoIwe6kKhALnreXny7Jw/Q3/8PJ97TP7/Z5B+81V+xCQTRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1U5UVQ9rqxE9PKr7N2LtGfExKJ1gJlaQsuY0g86pAs=;
 b=lyCGrzt/P3/ZJbQHJdyqydKPhU/a312dSX8vXWIGhiJwm3yCu4ZGrBu9sCT8+vAQ5g/ZoQsNlWwGoR1pfYUDKRnW+IVQgxc06TEiZefsZ3BfmS6PEjW7uynaIItEP1yNL9gk6iTLLWFbJ6vSCGwMi3QhhZphxe76ynW5g497OpAdH+3gia/K9jr4rzdsrDpC8xQ/lHJVmaQba/5exjij60Ao0hG4POKFF0DR+khpvH2+la6ZO7/94kBzzePCKXf/awoD63XkBRGaNnWsZ3ExcwtiyTeLpFPy3P/voTeLEDDq2AbSvlTRoOkfSVzlpYH+0X14FaeC97HVBnRbt1x8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1U5UVQ9rqxE9PKr7N2LtGfExKJ1gJlaQsuY0g86pAs=;
 b=i1EKrjnRuFkUFwCHmLqfcDLS48DxM0N6z723jUgcVamyhtKZiZeERIYI61ckYB72hKSQreayhSiJEA8NkFri69BpI9/iHAnTZt8Ueain767AUPvVAnRvtSs1whECUydVmykggrsx7spzdaw7nCJZ6h3j+j+nF2BL7l7+4Em5tWC8GYuP+0eBi8YPSyqn5A9GHn8Wr99SWrUv/jKXevfvMAteiygoXwsN4j5NGu2dwBAtZR64wt4OHNEyoGKCwQcpgYGsElLr8P9V60oYQ1xKccLcV7wa3Fc5SPXQ+aNI7mHTOaMinu948c+AhJS4q235Ta7WEvRdwJ4vRWpCe0qu2g==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by PAXP192MB1558.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:28e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.12; Tue, 21 Feb
 2023 17:29:06 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%7]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 17:29:06 +0000
From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [meta-oe][dunfell][PATCH 2/2] zeromq: upgrade 4.3.3 -> 4.3.4
Thread-Topic: [meta-oe][dunfell][PATCH 2/2] zeromq: upgrade 4.3.3 -> 4.3.4
Thread-Index: AdlGGe/m0o0Ky96+TPSv8yrnfit41A==
Date: Tue, 21 Feb 2023 17:29:06 +0000
Message-ID: 
 <PR3P192MB07146222CB16983334D716C4DAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P192MB0714:EE_|PAXP192MB1558:EE_
x-ms-office365-filtering-correlation-id: c78cf402-5716-4553-d482-08db14312270
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BU2kkxrdPtb+KHPmHWc/QIGC857gWOJNHTJmPqveNg62NONGn3oUSWn0yQ/yKdXHwk0XfXSYWTgmnkkydpPLBLzQMuxSRmJf9UDe86f8LWMe7l+caXs9MNRScSMOrPc81nFkbVsUHpzG74obVxw0hhRGK7a8HHV1EBS9hpHpXWdr7n8GC1A8gHqICufiDM4DaEOtHn8sZL6oC/KvZWzneJUNVKkmy7P7UICZrtets0H31c/tKbo2NbP8fiXAiMxxgAPXUk1+8Pa/HhNTtH6AVDwvODmeX54CvRftsjzHjWxZv13HehDlF8A8wlxcHCuWjfY4XUB3u1XVz7MPlgWHYotkuHNuFLOB0GuD+afu66r4TGYtKRj4iZb9ai1oPs5Qd6HNh8aYaKIQFKBqrutp4lxEi9EaHG9A/mdy5c9+sP0+6A0s6ICHdkPcW+ca8a41DysgG27sIBRw1zLWeMyxJH9xDTK+f4fi7q6COa9d8zn2S3Uc0jYgMmcSZZ6vZi72MYDsf2SP/bRN6z50r5SUY+qKOa2AtBI9qOZXTZSapj82f1e9G5hlQp+GHfIH2DWjswIr2/92nRsZO4xJInv2YfxZuwc0cyGWgnFTcYWg+JY+1h9uBJ+I9LXrJy7BcO0sI2hk1hLH0S+RHY8FD1y00ZactnkZ4Wng7J4MmKI+Uh3b8I1z3ODZl5tYP2y6glTI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(39840400004)(366004)(136003)(346002)(451199018)(2906002)(52536014)(186003)(41300700001)(38100700002)(8676002)(6916009)(76116006)(66556008)(64756008)(66946007)(66446008)(66476007)(122000001)(8936002)(5660300002)(6506007)(9686003)(316002)(55016003)(38070700005)(86362001)(83380400001)(7696005)(71200400001)(33656002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oZLriC4TZparvHRrItJKkHMXRCRKLRBLyK4bc6c7MEoxZjhoDlff4B/ITHie?=
 =?us-ascii?Q?XnlediVOnJS0XUQiMR4mwW6eqAREriHCXnNFIAkHL5Bg+oGb6GkUhY15kTmY?=
 =?us-ascii?Q?PGLIPIuMydUrZgWGHaK6X1xwcifpShpcQA1dm+pJ8t5vbhgdYP7l2RS6AEjQ?=
 =?us-ascii?Q?cIUAf1LHaydtNetU/D0pmZA9Ka8+0n4kFkZ/X/SvxoL6A2ASZKxT5B+wuZl2?=
 =?us-ascii?Q?/oPyDhDk3TffyZ0YLvQsBPBmykcHP8U9VHDRAPljoEaNUIfTE/SVD7RVfJ4h?=
 =?us-ascii?Q?K6mQb7yrOyc6wA/21r/f9cu6QNLixSOcBusYRfTB01k2NwqLablgqD49itTu?=
 =?us-ascii?Q?9xcLzJh8mdOlMPXisfxU5uQqH6JDtmCTxHv0dfxlkzRqEzBjEFKbGVd/dt6a?=
 =?us-ascii?Q?y/KvUvMvOHL2jGiBkJvVzvC5xKPpaWIdsqZPbQ035He84lBtbdVpYTyNpf5C?=
 =?us-ascii?Q?6ZuD5crhYPZYE3SS8SuIBQrtsbBLnudu0iduowtAR5L6dGyoesRzyGaUdnYV?=
 =?us-ascii?Q?GQHIR+hGT1Vwy4qb6aANNfSF2VM8dKgW8+rLKNRH5o4ywEcAA7XEPRqI+soG?=
 =?us-ascii?Q?woDC04dO5CrRjZcOSuSPn8Iwdc9sF3J59/FESxpKunsHgIPhugymQtHgUPyM?=
 =?us-ascii?Q?mSa76mp3JxJzKIvyxMRP5inFTb42d6lGNwNfb5iS7qERNFfszwgwh56w3GWV?=
 =?us-ascii?Q?k9vGe8GfydT0XhsR5J2zAeLbSXErgmUC0v29Unnpa5o4pt+2bJODgHFUu9LS?=
 =?us-ascii?Q?0Y7+DEkbMQUrqgWVyrqXGSDg1kaPFFWGX6EuIgYIh14K8smIwPqjtHGeeMYh?=
 =?us-ascii?Q?MCo1zrt8sxnkEKtfiVFRIKJPhbZUBW7QfnIH6WtJ40tBi8QP9QOGKzZfBsCR?=
 =?us-ascii?Q?W+oiqn+Vkzpu3FEof0YOV0dy8nwFtDU8I68K3BDWuI5t7vONBymfibxrP4sG?=
 =?us-ascii?Q?Yn9CT5gqQu2LN+IIhhmkgVDHaxfmmhsQ/5tpSDhFQe+E3swkQdAntpHZ9eDQ?=
 =?us-ascii?Q?oKXhvMd0xhEiwdH3WVHbCbGVBgVT/a8sfBP3TxcBkg87oLAza6ie1jlWP1tJ?=
 =?us-ascii?Q?F4y40xSucpfpaZDCXvn5jKMg+LAehtCZ4OcyIIX1r1Y+Qs/DJNpn8qZv3pO/?=
 =?us-ascii?Q?zMV9VfLpbRFNw8dDubrPZ0hk8r1n887htPecTEcZTnYA067xFxexdwlOPxLc?=
 =?us-ascii?Q?K/hXLWc9kRqnSy/QcmYD2AhFmvkumh/5kS65VVnwkucx4YLsX2SmjjYfTq2o?=
 =?us-ascii?Q?OdCffoNEc2voCNM60NcJZlZaeV3n7IJujVuUfemwHCCXBSN/Dnx9dmIY521O?=
 =?us-ascii?Q?6nzICIEpwwv+xCZPBF/m5/HVRtt2Ej4rrNqSDbRaetnSUBiRAsoSja+kiRAM?=
 =?us-ascii?Q?r7m8EdVQmHvVZVs3Vnumu3Zg/vbrrO/KsjmAdbxixUbtEGqIIlSaJPRj8qGO?=
 =?us-ascii?Q?pGSbe6na/AcL/A8hkKhIC8mJFE45xLhARhgsdoF+byL8Vo06OrrpOUtHDht4?=
 =?us-ascii?Q?tCuioflATBJX+ZZUVyLUF8zJT3dNQCS9aoxwOnUdAH5TIqpXYQVvi1iYEaJ8?=
 =?us-ascii?Q?OHDzQiW0lWp3Y27czR4f5YsOfGY4SNdAov8pzzeriVs9EYEuyW/rnm/vTrN9?=
 =?us-ascii?Q?gzA34OQSLT0KNF1CgDlpSg+Kv2Rt4lCLgXtal/TWjCAJ?=
Content-Type: multipart/alternative;
	boundary="_000_PR3P192MB07146222CB16983334D716C4DAA59PR3P192MB0714EURP_"
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c78cf402-5716-4553-d482-08db14312270
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 17:29:06.6517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y3pjoHPd3UzLsuDPNiuj3gierIMUJ5V34MWMMb6fj8P1nQGXM5mG2nOjmzOlLJ5cUTTJhUeiSSi97iapLjuOEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP192MB1558
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 17:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177531

--_000_PR3P192MB07146222CB16983334D716C4DAA59PR3P192MB0714EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8ced89f62f152e2b233c532ce03408bf46bde55b)
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
.../zeromq/{zeromq_4.3.3.bb =3D> zeromq_4.3.4.bb}               | 4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)
rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.3.bb =3D> zeromq_4.3=
.4.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb b/meta-oe/=
recipes-connectivity/zeromq/zeromq_4.3.4.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
index a10500475..4381f2d6d 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
@@ -10,8 +10,8 @@ SRC_URI =3D "http://github.com/zeromq/libzmq/releases/dow=
nload/v${PV}/zeromq-${PV}
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch=
 \
     file://run-ptest \
"
-SRC_URI[md5sum] =3D "78acc277d95e10812d71b2b3c3c3c9a9"
-SRC_URI[sha256sum] =3D "9d9285db37ae942ed0780c016da87060497877af45094ff9e1=
a1ca736e3875a2"
+SRC_URI[md5sum] =3D "c897d4005a3f0b8276b00b7921412379"
+SRC_URI[sha256sum] =3D "c593001a89f5a85dd2ddf564805deb860e02471171b3f20494=
4857336295c3e5"
 UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/libzmq/releases"
--
2.25.1


--_000_PR3P192MB07146222CB16983334D716C4DAA59PR3P192MB0714EURP_
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
<p class=3D"MsoNormal">Signed-off-by: Zheng Ruoqin &lt;zhengrq.fnst@cn.fuji=
tsu.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<o=
:p></o:p></p>
<p class=3D"MsoNormal">(cherry picked from commit 8ced89f62f152e2b233c532ce=
03408bf46bde55b)<o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Hugo SIMELIERE &lt;hsimeliere.opensou=
rce@witekio.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../zeromq/{zeromq_4.3.3.bb =3D&gt; zeromq_4.3.4.bb}=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; | 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 2 insertions(+), 2 deletions(-)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">rename meta-oe/recipes-connectivity/zeromq/{zeromq_4=
.3.3.bb =3D&gt; zeromq_4.3.4.bb} (87%)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-oe/recipes-connectivity/zeromq/zer=
omq_4.3.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb<o:p></o:=
p></p>
<p class=3D"MsoNormal">similarity index 87%<o:p></o:p></p>
<p class=3D"MsoNormal">rename from meta-oe/recipes-connectivity/zeromq/zero=
mq_4.3.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal">rename to meta-oe/recipes-connectivity/zeromq/zeromq=
_4.3.4.bb<o:p></o:p></p>
<p class=3D"MsoNormal">index a10500475..4381f2d6d 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3=
.3.bb<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3=
.4.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"FR">@@ -10,8 +10,8 @@ SRC_URI =3D &quo=
t;http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR">&nbsp;&nbsp;&nbsp;&nbsp; </span>fi=
le://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; file://run-ptest \<o:p></o:=
p></p>
<p class=3D"MsoNormal">&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[md5sum] =3D &quot;78acc277d95e10812d71b2b3c=
3c3c9a9&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[sha256sum] =3D &quot;9d9285db37ae942ed0780c=
016da87060497877af45094ff9e1a1ca736e3875a2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[md5sum] =3D &quot;c897d4005a3f0b8276b00b792=
1412379&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[sha256sum] =3D &quot;c593001a89f5a85dd2ddf5=
64805deb860e02471171b3f204944857336295c3e5&quot;<o:p></o:p></p>
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

--_000_PR3P192MB07146222CB16983334D716C4DAA59PR3P192MB0714EURP_--

