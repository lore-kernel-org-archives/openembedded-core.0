Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7C7F428C9
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 19:10:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3128.1776280209846611272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 12:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=jkoyS658;
 spf=pass (domain: siemens.com, ip: 52.101.65.22, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgns3+Sv/AJuZ+K9159G3kdTqSfmnEa2gnRFhRgpNZs94v6OGY79DXpPcBZLHqCfDYcL419z2AnDKsiF3mWSuQf0oaWZvTw7ixY3877cvS3B1NUPWwcwTMhgQ0Icd0rWvhNg1fY1Ze931Ca3BMHiFwM1Wz95cHxHkxLPyYFr/wc2Wj36ly4B9Eb4SUS2I3/PI1RKaGKxOCTp6ekh9vu69OH1m/sA8ZblYLcfx+U3x9GZ/YWFoAr2DoWX+zSAXf/adcO1vPQArOvnyaC/hukyjj5kHRcEYqqhv9cJENlWOaY1CMH2DHS7jHceIKUJ5jYEJ43XNdO5z+uaO44LSVA4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV7fTbsRqGiZlrt3jTfV+vMz5KxTD/9vL8+uDkVKzoQ=;
 b=UNLYH/qKHdCCPOvTjyehKEZr1mtM3skJ/eRjEkbgk9ganFWyXSkrnPfb5ri6phBUf3V/CFKLk/AafgVhOSu67wGhM3M7y00nqZav8Q3fr8idG45P0ao92W/KJzg9RmH9UxUjvvfH8bLmP6NUj3n1kBFQPLxDJZ8iWOhA1R+0qAvDT2uXVKM1vL5fqT9sZVYQD9pkWdTJVxjVXM3/mFx0XCs0nDfU+bw5kFHsXc0RkWju/3fdnrdxhJI8H1urPeMY519VaDIYhkBECpNaiZn0SpQoXwpIqU6sJagvdohTDvDKWPI2emIpIwHjKJ//POhX03Zb5fu7C5s5Wyw/TAeQrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pV7fTbsRqGiZlrt3jTfV+vMz5KxTD/9vL8+uDkVKzoQ=;
 b=jkoyS658rYBEuixp7aPVtr4IqyZa6skNkgTKhTbltTii4rm7xtGTZ+OayQvl/ZXX4zALgjkVbOWW80MbxrZCOTkz8OHyEUkyrMR0IQeL3UL1K8C63ndnjc8QUSxMm6EmHxvM5L8SJM+Ubra3lsG7OUDM/h9WEas+sexA9J6KAOJqX7MShTW9tlFmWsyAqN7W+GgXLOZ8+eGgaP38SZQc+AVV/pQIUUGszIpZBrZyN9srDpiANZ3A3Gc+YZKO8U9qLwBUS+cGtM39RaRUdbDyTjLh0ZDIkZz8YtKlh0lEVh3nEhKc6l7CvLpWkcAe2oNqhN4pOzQXrJqzjokl/c/AHw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA2PR10MB8395.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 19:10:05 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 19:10:05 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 4/6] libexif: backport fixes for
 CVE-2026-40385/CVE-2026-40386/CVE-2026-32775
Thread-Topic: [OE-core] [PATCH 4/6] libexif: backport fixes for
 CVE-2026-40385/CVE-2026-40386/CVE-2026-32775
Thread-Index: AQHczCdumxmzxhZqM0WROwP1RTgdmbXgfoXg
Date: Wed, 15 Apr 2026 19:10:05 +0000
Message-ID: 
 <AS1PR10MB5697E819CF0D07BC4C21CD11FD222@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260414155652.1214302-1-ross.burton@arm.com>
 <20260414155652.1214302-4-ross.burton@arm.com>
In-Reply-To: <20260414155652.1214302-4-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=00e44043-c643-4a6e-a763-09b36ce4e6f0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-15T19:09:41Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA2PR10MB8395:EE_
x-ms-office365-filtering-correlation-id: c904a309-5b9d-49f6-ae1c-08de9b229a79
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|55112099003|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 MRrYwSpmx+uYLt6oHVD5o4bd9jD06evHpw26LBOxFoqMb4MsyfAXgU4/NNvh1LCVQ3yiQ0lqHi+3khGXExv6UI1f0I+y36DyP28+pkHMdGDy3oO8PX//dd5/1K86bHK/II0uiSChO6irMuH4sWiruCa7ARSPzjL4mlV33Bp8dEu9RU1N3vq/SQu/pm38pL4F1Q7KehNEkUzKSuA2IZqb06LbwZ/RlRR/Qzr8GZSiGU2W5sGgLvq2SO0Q1dunKurgSV4OTIcXb2ebXFZTVchjOGeUr8HECXsuucROXZFV+oOWii9P+x7vGOB0v7+2OJIfsNeu3X/KwiqhWjpyjzGBTaDyuzLO3An8uD2LIX4hcYltFYVq9rdNwgGpR9eUpZiY6zzQi8W3x851Rd/mVJvNX94V+z3nd+49t90qeSMbRMrqDvU89APCMmazSTpDHDV/rmqIRlhz2DH3OHk6LnEKpDxtFfFnC0InPncusYkDzmNATtFaPjxnNUISYpHBiXVIL9shC4kSSg4icbXPSuMKc9BKarXkEQQonHX+vcooAbYEp8a7hLYq031cZVcfAVivXJVG5OZ7qCvUyfpVzVY9HhYJCeA6zzJL5gqwPV5x3RRk6B5nuKMrvShb95sTIydomiT4AJ89SWNKHdELVZOONdlLt+QJdqnKFT5H0JpFKRx5RGk4S0yHHFAukZqD/erEW6V0cuguxHN1UVvfge26u5m3KsLWpeTUgnBMXDBI1r6opRfrX9S7tvXTIM4urFhFioyZzCneM9XyXKyFKvuCxrzHlP3he1lOxwQh+ZcsSbk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(55112099003)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?i6Xerqlh26ns2fNneAfdXYO8H4/boHnJcYROzI8rtecHhxtodAfSv+29PCks?=
 =?us-ascii?Q?TfXK+mRVUY+ZqbUlk4YUzYsrIolZS70OrtI3rAn+SptKKBsb+vcOd7WepZrn?=
 =?us-ascii?Q?yPM6ArSOzs4oUhp+FfkJnmrKwanIhXJ0WfV4ToqNSiiKGjaSeLA83zP34EM+?=
 =?us-ascii?Q?FWuh66wFYXpTK3b5hc2Np+vZ3Je0yiH4rYqAai4+t6+ISslVoviyYgJrq8CN?=
 =?us-ascii?Q?GsbMj+QWoUCYL07WHRYxFY3HhHJhUmPReLyiwwpt+buaU2TbjW5C4k0+iYV/?=
 =?us-ascii?Q?Yinfz8Pmt0vQNp3BJumdS9ZmidrcUdleUAjvWfbt22/iLfxwEpHWV77YLHU9?=
 =?us-ascii?Q?S2Sgfeek05hQC4ncMEq73+z0ZN3I085qFL70x+WUjcBKEk30WvP5j6vIKyGv?=
 =?us-ascii?Q?lvAPu48SWhpDgArsHOhQJRBfX1EneGz6sGtE5fvtXmj6lVUFVwpoQl1Bzv8n?=
 =?us-ascii?Q?fN4g+zdmeb9lhQ7OXuQgZhv+LsvdNtlIsCLqNJtmQCgFLV/sDppg57nQABju?=
 =?us-ascii?Q?DlTafWFfwQD1bD9lYm9tEUfMy9e9JcMviJUKW7dqJ2d9jbuYk0oigww+ls+E?=
 =?us-ascii?Q?Dn6xMeTe+8bb1gCId+weFpsHUGKJu1zqVBt6tv9IwpqmjICn4xwQ/KRLzMvO?=
 =?us-ascii?Q?xr4XSHHkfJpvOgjYkw1X3hBLNah93dIapBYqpyWv+rqJIjVZuzsYpf4kC0UI?=
 =?us-ascii?Q?kTkKTlQODcrFrSpIoRb+8aNSSQBI8RVjEV8/1fJB5ynWot8OSg97L+zYc9eL?=
 =?us-ascii?Q?e0bMUtOQ8aSsodW+o+nT6tSp3O+JIA8HFNCl0tWGzXOWOkUxRTTLlXyfZ12P?=
 =?us-ascii?Q?TNpY2d0k43pWdnNo+WJcnTYFrsjJm9CTSz+b2tzqrxPFvzj+jjx9DMXdFND/?=
 =?us-ascii?Q?v/5gF1b4kZsTY1LU+0Hso8kLYlthl6pE/nGMs+ywDmhH7oorkFa1O8v8Qn18?=
 =?us-ascii?Q?G1YfxSi3QKcnF/NkOdLedGG3EQa99qL6QrlGnfzp96FulLvOCFYAyuQkS0Si?=
 =?us-ascii?Q?YScn3YVZcY2iYcI1QcOc1RYAcACct5X29cPQu/NFxbDZ7MFJay3+N6PU6KAg?=
 =?us-ascii?Q?Aabj5qJLKjTFQGdK7HTn6box+VCrP6BUCFiGaQ9J85suKROFEbG84sHpHa3B?=
 =?us-ascii?Q?CakzyYHQxU6K7LPoMCIhLPnGe9T3sEyf4BeWm9/WyRsx+2HeY/wOEwDRSvMT?=
 =?us-ascii?Q?5Dp1W1EgYhRSSl4QGx9ea+Ke/au6Sw5d9sFpBnDZQth1zjLu503CZwgb3Ojl?=
 =?us-ascii?Q?d8Nv31g4upDvBTNuHwPcV9+wbQwQ8jEf7LcJ4d9BpQyFKC/sC4qP5PigwABI?=
 =?us-ascii?Q?laOrCKyPrlLqByDumMP4SBXaZpxCOdmuGNc8hofezy3G3Btf/aPmYd9ABYAR?=
 =?us-ascii?Q?yQ6ho9RhNGFH5JWBlQiK7Gy0oKzmewOFN1lVKPl+CGL2FT9YlThN2THHk8nV?=
 =?us-ascii?Q?ubJ/MS8GRmZ8p3nq5KEqgmMA8so3ggR9A/8oTFUq5pPWUHVpB4IPcm57nI8g?=
 =?us-ascii?Q?gRi/SwiTalA5mH3jc59yOjdSygL/A15LxRkcIOIk2iyN9V0skp6KTL3Lr4oy?=
 =?us-ascii?Q?MrlhE1EUiGEC1yXaiOiWebbk6JpqluXyLgKwCpiOcM+gfBfQXi4kmGV0XcTO?=
 =?us-ascii?Q?n89rMUcB/YOPNdygRhMdn6NaUtT+sJK6rlviYAnaEk0xDL+LYrnI3/jN1XUI?=
 =?us-ascii?Q?E/DvRJCfL4jUoereEsW3zqEG86mHr0U9JCkUYOC2HC7SMkYt+loMKWWeUaS4?=
 =?us-ascii?Q?pwYj4203eQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c904a309-5b9d-49f6-ae1c-08de9b229a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 19:10:05.5727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NymsF/C/9Y8d8sOQb4OZLhs7i7ShlmX6+QaL/7qU3Lwc8oJ2J0faTREx8sz9zmnnCfFDVzRUv/O/VjceJgtIrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8395
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 19:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235322

I have sent upgrade instead of patches.
Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
Sent: Tuesday, April 14, 2026 5:57 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 4/6] libexif: backport fixes for CVE-2026-40385/C=
VE-2026-40386/CVE-2026-32775

Backport the fixes for these three CVEs from upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-check-maxlen-to-be-at-least-1.patch  | 74 +++++++++++++++++++
 ...-fixed-2-unsigned-integer-underflows.patch | 46 ++++++++++++
 ...n-32bit-system-when-reading-Nikon-Ma.patch | 36 +++++++++
 .../recipes-support/libexif/libexif_0.6.25.bb |  3 +
 4 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-support/libexif/libexif/0001-check-maxlen-=
to-be-at-least-1.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0002-fixed-2-unsig=
ned-integer-underflows.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0003-Avoid-overflo=
w-on-32bit-system-when-reading-Nikon-Ma.patch

diff --git a/meta/recipes-support/libexif/libexif/0001-check-maxlen-to-be-a=
t-least-1.patch b/meta/recipes-support/libexif/libexif/0001-check-maxlen-to=
-be-at-least-1.patch
new file mode 100644
index 00000000000..e5b7eb14b5b
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0001-check-maxlen-to-be-at-least=
-1.patch
@@ -0,0 +1,74 @@
+From 2d12cc141c4d799cea2b42639645db5142940ff7 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Mon, 9 Mar 2026 10:02:53 +0100
+Subject: [PATCH 1/3] check maxlen to be at least 1
+
+maxlen-- on 0 will become a high value.
+
+(likely found by AI)
+
+Fixes https://github.com/libexif/libexif/issues/247
+
+CVE: CVE-2026-32775
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libexif/canon/mnote-canon-entry.c     | 2 ++
+ libexif/fuji/mnote-fuji-entry.c       | 1 +
+ libexif/olympus/mnote-olympus-entry.c | 2 ++
+ libexif/pentax/mnote-pentax-entry.c   | 1 +
+ 5 files changed, 8 insertions(+)
+
+diff --git a/libexif/canon/mnote-canon-entry.c b/libexif/canon/mnote-canon=
-entry.c
+index de0fac4..2849d5b 100644
+--- a/libexif/canon/mnote-canon-entry.c
++++ b/libexif/canon/mnote-canon-entry.c
+@@ -561,6 +561,8 @@ mnote_canon_entry_get_value (const MnoteCanonEntry *en=
try, unsigned int t, char
+=20
+ 	if (!entry)=20
+ 		return NULL;
++	if (maxlen < 1)
++		return NULL;
+=20
+ 	data =3D entry->data;
+ 	size =3D entry->size;
+diff --git a/libexif/fuji/mnote-fuji-entry.c b/libexif/fuji/mnote-fuji-ent=
ry.c
+index 47e01ed..5d9f16f 100644
+--- a/libexif/fuji/mnote-fuji-entry.c
++++ b/libexif/fuji/mnote-fuji-entry.c
+@@ -201,6 +201,7 @@ mnote_fuji_entry_get_value (MnoteFujiEntry *entry,
+ 	int i, j;
+=20
+ 	if (!entry) return (NULL);
++	if (maxlen < 1) return NULL;
+=20
+ 	memset (val, 0, maxlen);
+ 	maxlen--;
+diff --git a/libexif/olympus/mnote-olympus-entry.c b/libexif/olympus/mnote=
-olympus-entry.c
+index e5200be..f938d40 100644
+--- a/libexif/olympus/mnote-olympus-entry.c
++++ b/libexif/olympus/mnote-olympus-entry.c
+@@ -286,6 +286,8 @@ mnote_olympus_entry_get_value (MnoteOlympusEntry *entr=
y, char *v, unsigned int m
+=20
+ 	if (!entry)
+ 		return (NULL);
++	if (maxlen < 1)
++		return NULL;
+=20
+ 	memset (v, 0, maxlen);
+ 	maxlen--;
+diff --git a/libexif/pentax/mnote-pentax-entry.c b/libexif/pentax/mnote-pe=
ntax-entry.c
+index 46900c3..0a6f87a 100644
+--- a/libexif/pentax/mnote-pentax-entry.c
++++ b/libexif/pentax/mnote-pentax-entry.c
+@@ -317,6 +317,7 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
+ 	int i =3D 0, j =3D 0;
+=20
+ 	if (!entry) return (NULL);
++	if (maxlen < 1) return (NULL);
+=20
+ 	memset (val, 0, maxlen);
+ 	maxlen--;
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libexif/libexif/0002-fixed-2-unsigned-int=
eger-underflows.patch b/meta/recipes-support/libexif/libexif/0002-fixed-2-u=
nsigned-integer-underflows.patch
new file mode 100644
index 00000000000..2879d488f61
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0002-fixed-2-unsigned-integer-un=
derflows.patch
@@ -0,0 +1,46 @@
+From ef8d6041d567bcf2b7f466b1bad470689fb4d159 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <meissner@suse.de>
+Date: Thu, 2 Apr 2026 13:26:31 +0200
+Subject: [PATCH 2/3] fixed 2 unsigned integer underflows
+
+this could cause crashes or data leaks.
+
+Reported-by: Kerwin <kerwinxia66001@gmail.com>
+
+CVE: CVE-2026-40386
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libexif/fuji/exif-mnote-data-fuji.c       | 2 +-
+ libexif/olympus/exif-mnote-data-olympus.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libexif/fuji/exif-mnote-data-fuji.c b/libexif/fuji/exif-mnote=
-data-fuji.c
+index c28c541..2dcb877 100644
+--- a/libexif/fuji/exif-mnote-data-fuji.c
++++ b/libexif/fuji/exif-mnote-data-fuji.c
+@@ -70,7 +70,7 @@ exif_mnote_data_fuji_get_value (ExifMnoteData *d, unsign=
ed int i, char *val, uns
+ 	ExifMnoteDataFuji *n =3D (ExifMnoteDataFuji *) d;
+=20
+ 	if (!d || !val) return NULL;
+-	if (i > n->count -1) return NULL;
++	if (i >=3D n->count) return NULL;
+ /*
+ 	exif_log (d->log, EXIF_LOG_CODE_DEBUG, "ExifMnoteDataFuji",
+ 		  "Querying value for tag '%s'...",
+diff --git a/libexif/olympus/exif-mnote-data-olympus.c b/libexif/olympus/e=
xif-mnote-data-olympus.c
+index a57af17..428f365 100644
+--- a/libexif/olympus/exif-mnote-data-olympus.c
++++ b/libexif/olympus/exif-mnote-data-olympus.c
+@@ -78,7 +78,7 @@ exif_mnote_data_olympus_get_value (ExifMnoteData *d, uns=
igned int i, char *val,
+ 	ExifMnoteDataOlympus *n =3D (ExifMnoteDataOlympus *) d;
+=20
+ 	if (!d || !val) return NULL;
+-	if (i > n->count -1) return NULL;
++	if (i >=3D n->count) return NULL;
+ /*
+ 	exif_log (d->log, EXIF_LOG_CODE_DEBUG, "ExifMnoteDataOlympus",
+ 		  "Querying value for tag '%s'...",
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libexif/libexif/0003-Avoid-overflow-on-32=
bit-system-when-reading-Nikon-Ma.patch b/meta/recipes-support/libexif/libex=
if/0003-Avoid-overflow-on-32bit-system-when-reading-Nikon-Ma.patch
new file mode 100644
index 00000000000..e1f9d12a7cc
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0003-Avoid-overflow-on-32bit-sys=
tem-when-reading-Nikon-Ma.patch
@@ -0,0 +1,36 @@
+From 62f657ab2b01ede7ab85adbdec333c81176518e9 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <meissner@suse.de>
+Date: Fri, 3 Apr 2026 11:18:47 +0200
+Subject: [PATCH 3/3] Avoid overflow on 32bit system when reading Nikon
+ MakerNotes
+
+The addition o2 =3D datao + exif_get_long(buf + o2, n->order)
+could have overflowed on systems with 32bit unsigned int size_t.
+
+This could have caused out of bound reads of data, leading to
+misparsing of exif / crashes.
+
+Reported-By: Kerwin <kerwinxia66001@gmail.com>
+
+CVE: CVE-2026-40385
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libexif/olympus/exif-mnote-data-olympus.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libexif/olympus/exif-mnote-data-olympus.c b/libexif/olympus/e=
xif-mnote-data-olympus.c
+index 428f365..37f08ff 100644
+--- a/libexif/olympus/exif-mnote-data-olympus.c
++++ b/libexif/olympus/exif-mnote-data-olympus.c
+@@ -386,6 +386,7 @@ exif_mnote_data_olympus_load (ExifMnoteData *en,
+ 		o2 +=3D 2;
+=20
+ 		/* Go to where the number of entries is. */
++		if (CHECKOVERFLOW(o2,buf_size,exif_get_long (buf + o2, n->order))) retu=
rn;
+ 		o2 =3D datao + exif_get_long (buf + o2, n->order);
+ 		break;
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.25.bb b/meta/recipes-=
support/libexif/libexif_0.6.25.bb
index c57855303f4..d869f8c6c3b 100644
--- a/meta/recipes-support/libexif/libexif_0.6.25.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.25.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4=
a1e5920b344b86ad"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://0001-Add-serial-tests-config-needed-by-ptest.patch \
+           file://0001-check-maxlen-to-be-at-least-1.patch \
+           file://0002-fixed-2-unsigned-integer-underflows.patch \
+           file://0003-Avoid-overflow-on-32bit-system-when-reading-Nikon-M=
a.patch \
            file://run-ptest \
            "
=20
--=20
2.43.0


