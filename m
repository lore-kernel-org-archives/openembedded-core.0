Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83EEC5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:20:43 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92.1787584841778568195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=g9XUzy8S;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.83.30, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uR2DcAkPWznLA74t8fQLabzVtq2NTS6aFuU4y/zO6R39GWRVcPpFA2QSBS8ZCprrjiZogE/FlBiMKkDs2XB21BKmz99PRHvMOhFOym1ZDGu2S76SaxyLWUHkYoCB3sCufZ7cvQubiL7hySmPN1fkAniw0+3O6UzXKhqQvjpl3SufBhoT5rX6USbmMkboHI0XbOiq3ZlT1VrZEOpadb+fbWArKsoXol2qTTy/yPqkUkgtE67VDDv5qpwgyk2e0OZT7nj5YRFe12FC6HQOyMQsl1v3OabvpluELZECmTW+4u1K9rVDaQHjlI9nVgtCSjeOyRH3IJgCvLgZqD/psDgzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9drUwvdeVUlUZzpoPzD0w6RFgtgvE8mubnf4Ycuxavk=;
 b=PZPDfJiQq2cALvfE0Kch02n8brv5xOSaQ+hX1eEDlx6I/zD6pbnAgb9uvgAP9GMrTk2M1MFLJ3eMZk9q6S5Fx12kceVtrDaGfKg2/qeYx4FY5tm6eJlEgNjKHBCp85OEiS4cZ3PIPH1O7ee/y3nXBZ54S9+LZhJpdWt6k9W0pM0yNfrK+O5hK2Wtf+GyLxy9/TBj7KJRtQnJpPXM2U7W/rkPW4AtbCVYCvvPoqq6ZdQPVZ2PnNoLChQDfZd1wyDUj9vHYZtkNtaBbmTNBp3ALgmtKhZGvb3D7UUWQadSM5LCbvcZN2Yk3pVcNRl4NaTIoKFc3t/MiC2ek1m6FBHXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9drUwvdeVUlUZzpoPzD0w6RFgtgvE8mubnf4Ycuxavk=;
 b=g9XUzy8SttK23AgkySKcEc/v0RtJeADl5zSGfNFnFaFnItfECD6NxzHUhiarDnjX75HjwJNrWsUKbM9fcTQXwS0Qll9ZE6ywD4f3ReVTcOtkFhi1CCdutbJGQlSZF1Qa/WP+63LNWLYBRA4zAH9rD1xyM1bWRbnWGH0B+vSwxkQ6HtO7UJ0jVMhfEHpl2DS/w4p1zZVNJbkgB/h1QWuPo4hUy31SyIEV4Y5mi8Pfnzl9C0GX3bTexjab27h5Rzl9wfpaZWA2f505qiOKziB5XsOBCESCO5ryvk3IF3wGJnCgwznbMGEW4rorYYyisryEhMw5/4kwPmQ02tqNkeNbAQ==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by DUZPR07MB9935.eurprd07.prod.outlook.com
 (2603:10a6:10:4ae::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Mon, 24 Aug
 2026 15:20:40 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.005; Mon, 24 Aug 2026
 15:20:40 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH 3/3] expat: fix CVE-2026-56412
Thread-Topic: [wrynose][PATCH 3/3] expat: fix CVE-2026-56412
Thread-Index: AQHdM9wf9xefMp8w/kOqGLwOV10IoA==
Date: Mon, 24 Aug 2026 15:20:40 +0000
Message-ID: <20260824152023.19501-3-jakub.szczudlo@nokia.com>
References: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|DUZPR07MB9935:EE_
x-ms-office365-filtering-correlation-id: 04f4d3e5-177c-4b16-61eb-08df01f341dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 pUfRP9O+Org3+lYuaQD/UtVaXbocaBAgD3Qgo66gdEfkS7/ae6g8iYi5c/HF3OdzyZ8CwoHai5mPDaDPMrJPYNhOJ0Sl5UTCPOl2B76oKGPaqoprvSeGAx0xFmaD+EQWgWYaF4rkzwsWnuHx0e49JWiaNkdI4nqilJY/PZ579GzsrIa0nLwiEysRQhPiKi+3Twt9FwNUkBxz9K1UKa65/vyg0OAxQDphqXZpBSiGExLQwOCZ2f9djCANOgtjfB/vnoqAWRyawEeom1+PTaYxYg7BsZFam0g4wobUog5ls+GPWYtf0Bmap+It0J4Lwaus4B83aPyFGm3YxtUp979hi5/a3/4Ps2Wkt4sN5h7BSkJHTNF/0wetmYJf2dGHYqFQ+ZzApB/bVhFmaAWEfDp4NFMCETViVvQsif75qqVst3phHJ0ogbBHsEPckDVULm/zor/9VjICQ5MZLCL2mL70Xy41juvXbzHR8StuaMyGBEvGKtsc1Lk64uRL747KfprS3IgG7wbxvueQdGlBHUNaT67Fs2Zr9RyyQxRI1nMU1n8ydamPkiJFa2od9nTctH2hqPTcGR0j2LoeFoyHjGm8KOtIyNt6+h+SsxDCaX7JwXdkYe4qR7uzfwmfekOuHX6OoJFWPKA2MWfDWjTLJyl7VvV7xIFcAu1Vu1mm1sv+FQU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0BFMnYi45V8qSUxb191SkuXxuHnimRxqz7xXMGW3g6BXSMSlVMFAUlHfoj?=
 =?iso-8859-1?Q?CJ4s+ukUv+Ggn9cYOKhc60NNV9Yd27+izA56aQ0d5B7FteO/6Ch1PWDu9V?=
 =?iso-8859-1?Q?IU1JoiUJIgaKuxpn9qGgEZye+OX19R5FyqWtQU3iprHGpdK8mpRXt5nWZM?=
 =?iso-8859-1?Q?VVsFLEA7kc98rQFT4M/HQEzoY/moUIMD6Ti0oeXfJbTV9TZ7byI12QsJpB?=
 =?iso-8859-1?Q?NPD1nf6m9F4EGql4BreAx76ijtraEiDrv11Ts0arvn+n1bsJKJr6rEPoew?=
 =?iso-8859-1?Q?47QJ11SuqCwyDuSbuV52X5F3gXIeYzpzTjKHEWX+PO6yWYDx4Hb2zgdnxm?=
 =?iso-8859-1?Q?8qVqJfVGFs0ekjBgLG5kTrRzCmU6z1G4k08PaJpfpggGXKXmxykG4X0h9m?=
 =?iso-8859-1?Q?bp32wDClXMdSylXRLzZ48XShs1tDC20k1G3Q4lfZd+J48VZ1iBAxvHGdv+?=
 =?iso-8859-1?Q?1kWBg3cFcNVp7d7RneqE+fcWrcTEkYEz2o4Ev/ecMgJsFSoeQ0X7ONVpSk?=
 =?iso-8859-1?Q?hr7NLV1dJ713NJhFVB9ZzD/kyxuPEVN5rjp8eOe0SsE0FQiwUTYW3xeS17?=
 =?iso-8859-1?Q?s+bDt1usXD7TvIQ7Q4TQrFzUp4gzw2sr1Z1E734TG+jlvqhJu8kNPojtfi?=
 =?iso-8859-1?Q?Z+P7oJeZYf10ftf2TTZf8Tt0NlwQj1yx4IdcRRwhcLXKP1jGjf95J8zkLY?=
 =?iso-8859-1?Q?ZlfPDQwcSmT3iEFnXF+jLNfbTYeyK5RKwPkub6ICIn7bk5oYgaoVO7E7XY?=
 =?iso-8859-1?Q?dS+IYkr7llg5UzClWBhoAjZcr8Y60s0JXVnNJrArkQuOMYH+9OoPOf83qO?=
 =?iso-8859-1?Q?Wq8zExBTvhPD2ggoqfkWLpl5bfK04Azh6cgd1yZUX41QQizA/3AIxetEJa?=
 =?iso-8859-1?Q?e/wwz0/rbFG3AGE0QSVdeo+Blhzf1Qu55zaovntCKlsrN7mgjj9TK47W9j?=
 =?iso-8859-1?Q?pntlHh0F0N+eCSSD0MYoBp5EKl6stPn9zw0GfZofrbvUfYiLq/voURGqrF?=
 =?iso-8859-1?Q?OJwTk0FTztOS4MmFVFqQDp9uPnxIMAwj8MXWXk8GWFINA9t0aPFc20oesz?=
 =?iso-8859-1?Q?KT/7CZlM7M+5OGosSe6HnoHAB8nxcrO8obvajPfVFf8QKMRE8VnRBcHLzq?=
 =?iso-8859-1?Q?eN+G+YJb35ZszCuEf3Qw/cyINaU8tgc6SKr75RAY0x17zkolAzGA/oCCPj?=
 =?iso-8859-1?Q?8ic3k5YboB6HZDqWjRlagZML0WgquIW+ELvd0+mFawJvSyXkP/ezSeFIqK?=
 =?iso-8859-1?Q?phecAeoLzT8LtiyvFdmZzC3rICxgxhMl1RU3NEpQwKaNkqZG503pF/kfR/?=
 =?iso-8859-1?Q?u5fOy3j5AZglUolcSZz3jLGxyRPjyugvdRyZi/xHP4E8bhF7pH6Wi5XCm1?=
 =?iso-8859-1?Q?B9zIJRaD+GWoATHW1PjyH1vfbO43XoDBF/t0iBiBO7Hr33/g39v2C/nNlc?=
 =?iso-8859-1?Q?qfl/KNd40SK1b3FiY4xRS26Rjs5xXi+46eQSHgrHM2CDPQATjJXCeMUMLg?=
 =?iso-8859-1?Q?k52NOAStM8dqiq5ObwMg6ou2fq6CAolZE/B9ZHuCb1uuQTxLSd5kVi2+ye?=
 =?iso-8859-1?Q?NoIWqd775Xr1Akb5RuFpXWOP7GBAe+xNKk3p3NQscZGNTT3nN7JiqnWyg/?=
 =?iso-8859-1?Q?uz+EEvWz7fDKGst4ELwMLNdEiHPEwUi+mDJasFTgjHuvysbyqFiGvXKegS?=
 =?iso-8859-1?Q?3C+HW/BnfiA8CYVJ1UiqtP+Ep3pNBnP6G6VpkTGN2jiLjzYtzjgQV9fy8v?=
 =?iso-8859-1?Q?+a4DeWnziqeOTta6C5EpMqp8jEzffgXfF0LCSDYTtyta8f?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f4d3e5-177c-4b16-61eb-08df01f341dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 15:20:40.3356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rSdHh5QvMyC/WwPRQ0cFlwaPu/IXbteAc1XeHuZr56o04a2VRFlXIV7UB4t9fO9WR5i3lXt6SAMrpZAjzXP37prt9faNCcyySM/l/3lzPWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB9935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244132

Backport patch to fix CVE-2026-56412.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-56412=0A=
=0A=
Upstream fix:=0A=
  https://github.com/libexpat/libexpat/commit/d19e834794060d18c061d94452c35=
d725393ea58=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../expat/expat/CVE-2026-56412.patch          | 45 +++++++++++++++++++=0A=
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +=0A=
 2 files changed, 46 insertions(+)=0A=
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56412.patch=0A=
=0A=
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56412.patch b/meta/reci=
pes-core/expat/expat/CVE-2026-56412.patch=0A=
new file mode 100644=0A=
index 0000000000..8959bdec5c=0A=
--- /dev/null=0A=
+++ b/meta/recipes-core/expat/expat/CVE-2026-56412.patch=0A=
@@ -0,0 +1,45 @@=0A=
+From b94cd5b9a6dc7f938a50db2417e4ff60ed35c4a1 Mon Sep 17 00:00:00 2001=0A=
+From: hextheshadow <hextheshadow0x@gmail.com>=0A=
+Date: Sat, 20 Jun 2026 21:07:29 +0500=0A=
+Subject: [PATCH] lib: guard XML_TOK_DATA_CHARS handler calls in=0A=
+ doCdataSection()=0A=
+=0A=
+(cherry picked from commit d19e834794060d18c061d94452c35d725393ea58)=0A=
+=0A=
+CVE: CVE-2026-56412=0A=
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1278/=
commits/d19e834794060d18c061d94452c35d725393ea58]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/xmlparse.c | 7 ++++++-=0A=
+ 1 file changed, 6 insertions(+), 1 deletion(-)=0A=
+=0A=
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c=0A=
+index a5fa256..1476c7e 100644=0A=
+--- a/lib/xmlparse.c=0A=
++++ b/lib/xmlparse.c=0A=
+@@ -4812,16 +4812,21 @@ doCdataSection(XML_Parser parser, const ENCODING *=
enc, const char **startPtr,=0A=
+             const enum XML_Convert_Result convert_res =3D XmlConvert(=0A=
+                 enc, &s, next, &dataPtr, (ICHAR *)parser->m_dataBufEnd);=
=0A=
+             *eventEndPP =3D next;=0A=
++            beforeHandler(parser);=0A=
+             charDataHandler(parser->m_handlerArg, parser->m_dataBuf,=0A=
+                             (int)(dataPtr - (ICHAR *)parser->m_dataBuf));=
=0A=
++            afterHandler(parser);=0A=
+             if ((convert_res =3D=3D XML_CONVERT_COMPLETED)=0A=
+                 || (convert_res =3D=3D XML_CONVERT_INPUT_INCOMPLETE))=0A=
+               break;=0A=
+             *eventPP =3D s;=0A=
+           }=0A=
+-        } else=0A=
++        } else {=0A=
++          beforeHandler(parser);=0A=
+           charDataHandler(parser->m_handlerArg, (const XML_Char *)s,=0A=
+                           (int)((const XML_Char *)next - (const XML_Char =
*)s));=0A=
++          afterHandler(parser);=0A=
++        }=0A=
+       } else if (parser->m_defaultHandler)=0A=
+         reportDefault(parser, enc, s, next);=0A=
+     } break;=0A=
+-- =0A=
+2.34.1=0A=
+=0A=
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb=0A=
index 78e35243c5..6fdae2458f 100644=0A=
--- a/meta/recipes-core/expat/expat_2.7.5.bb=0A=
+++ b/meta/recipes-core/expat/expat_2.7.5.bb=0A=
@@ -69,6 +69,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}=
/expat-${PV}.tar.bz2  \=0A=
            file://CVE-2026-50219-31.patch \=0A=
            file://CVE-2026-50219-32.patch \=0A=
            file://CVE-2026-56131.patch \=0A=
+           file://CVE-2026-56412.patch \=0A=
            "=0A=
 =0A=
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"=0A=
-- =0A=
2.34.1=0A=
=0A=

