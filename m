Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6CBC5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 11:03:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10467.1786705420470764022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 04:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Mg62rJGu;
 spf=pass (domain: est.tech, ip: 52.101.70.58, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqDCoKghwCu+FRe0I/XrALKZeQ3xD39sDtn2ST7NpxVExFkDW9TM0o1wJ46ph46rrRXmxQBE9Go6OSajmpHmdtoGFezMKf31eZVp2FBx65iGeLVfS/5KDpY+lk1UDN5CGOFsO+VAB5HDkMFhSaNxIOyrDH1JYSAQxqMckubWuVl/5ZeQQ3IqVvk2dRXJy1QR8azkiqb2zA7Nr2Sexskya07G5xsrHvCblTXWyhh4oZw1Ty9Lg6LZbwhiobrH6OYUrhgzln5X2Rb+GkWMO/A85Cx4Q4xz7hX0zMVlvj0977ENiNFLbOFznmIM9Nrszn3TI0WTVPktL1sTxB/qvoC7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m0mRv1JOVEFEelk7QUnGPsedFj4Ia6ZO1KIl3ryOeI=;
 b=rBUo08TRNaW4M2qsjPTTt16W0cJ3F2Ajl5oaP2RJ4hC24YCj0i0FSS+FnQDz+6b6ELk6EQfYQgtxPB/6d1mEtcZYYVv/uyCDJgrgTM+u4ZKyYMWm57RGChyknf55EztnrwcnfkBh0ATimkfkEbJLnto1XKb9Os1tJ2x8BsOhDnqpu9+sHOJpHDN0nEBQC5IsolffqBvXXy/ckknwjIhgTit/NtBk7hTEHDnO3pJHrijDLF/5yRbZDoctWC8+pOvX1Msi1tqsY705vBL8RGWNyM8Z5jejqWp/r54IkQlDglJseilVmfXDxpQdJgtajN498vRFMvDfQt3rcShzjXGpSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m0mRv1JOVEFEelk7QUnGPsedFj4Ia6ZO1KIl3ryOeI=;
 b=Mg62rJGuefmoCCB2VCwBJk/CS6sCw5zxweJbfDWsST6j4qlHecxf5JgOT3TxwYLOjapXbfs+UkBQ5RRQK8DpCnFvkAKUodSRRlXlFjucXenYE7DINwJSkoS0+VaKUD2AVaI7e4KB5MWyqPKboFlCmUGxMEWYDQQN9DTU/d0YP1zEffyxDmIzfe1q4LTT8RdxHS47xQkhi6pfRV33EEnw4s5OBTN3F8HzHnmzkquzcdc0YApq8IdK0knK/hXRD0spgJV+0rTHoq96kMlkiV7q7lpZN7jiT2Em1zCnoaMV6uGcEZDWCAb3Nuaycrf8kLOPSu5jcxr9HamGIjgNsvofwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA3P189MB3263.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4ad::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 11:03:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 11:03:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/3] python3-pbr: upgrade 7.0.3 -> 7.1.0
Date: Fri, 14 Aug 2026 13:03:30 +0200
Message-ID: <20260814110332.38407-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260814110332.38407-1-jaipaul.cheernam@est.tech>
References: <20260814110332.38407-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0345.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::8) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA3P189MB3263:EE_
X-MS-Office365-Filtering-Correlation-Id: d908c7cb-5432-47a7-232d-08def9f3b20b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|3023799007|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	FXw5ddZiiEbH5l1w/sWdR5G6Qg7SuxdBw7Roa8OJ5xWU4Lj0+kJOhHTwvcNiCdtF4is+GFxAPi7VO82dqWNzZG0Lvq32qHTn3hm0gGSUQqR7HQj1h/oL9bpyUyIRNt9NJf9ZRfsfdVMMdvHQ/XSo5Q34P6H4q1vB4UDPFYsnMeu86XVUDNOMVoDuATfWO1G+EJeVNnVsIn7N1t6vLupaqd8cw3GpcHX8jE4nOxgB0gBLOY2K5J9KF6ylQUCjSNz4FHx9PBrT6SnPdF6Xv/AGr7gUxY4QzFb+IBPdlXSsYeYmxgHnWKoemWx4Ol9I2RRZTNiegaE5YcBXAr969ibBVDAB6w71Dts5XpjPwkuHiOIB7ra22DwnC0IImW53ZzNLa/9CI3JNG508r+d1CYdr6H3GbNFOOXzhBM1aT2mYRLqz8zdKzDkMk4nHZlzUtEh1hWTsLvJtIjxW5fMWKEFUDmyYLKYarr5O7fT8gs9YxhaxnHsZ6GkcVsz8GMOMK6ptMkB5rk9FAi8w+SR8DhgfFnc/2toCMgWE7SQO4GifsfsYFHMF0MuXfdSGQv7rHkmKcefoLCd9oG3sYwNhq2EluWyRtdQGEyF+VE4vJtxh6HUc3WSMuZGa9w4FQ3qOFEpV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oxHaJeauwEL1ev37K9vML9NZtv9oDR72wHTFiTDXryLFiKlKlkeAqoO9xDhT?=
 =?us-ascii?Q?7WlAFp7lhmO+8vwEjnYdIP2DZf1nyixHh35BNCZxYKaNejTubJ1JUeOxrIsu?=
 =?us-ascii?Q?4mJf0mmr5or06k4iIpCIpwRMKIotGD2D+YYKqf8WOxuA8q+pqcTsXZtWIkmk?=
 =?us-ascii?Q?nIkOqy2f/8psRk0upymfd9SApREYl2TqWNB1uUqTdvRjQSnr3QHXdsA+F/Hs?=
 =?us-ascii?Q?S3hI3uIMCFB7cYPi3SN1IC/BkuiI7AKI2XoWeTr7AQqrRUI46qr3g67sVpu2?=
 =?us-ascii?Q?raSrvQGcQyz28D33AVUSK4IRiSeGRlUAOKWKiHrCcXYET2a2hhHwTQGrd4na?=
 =?us-ascii?Q?THS8gkIbPuwQ77VcJJslfsWNZxhf7UaZcjlCDjy3cOoH1Jrv5O9UwPHjoCgn?=
 =?us-ascii?Q?/GkR7uZI6HRyi+AlmXcDk3cW1v/PBpKy23u537Ii5MzWmeI8aJmH1UBZUMD7?=
 =?us-ascii?Q?3jO3Y2HgvUG8iFxQ1FpoHd0QhaGPnpaFY97vATKNfbbNGfr5+wNM/ZyjJPKV?=
 =?us-ascii?Q?ALrYey8yJHDFTAJYxOgsd1wDcg4PlBMf4ORZ8Rpo5zyIovEkHv7vRPk2zJME?=
 =?us-ascii?Q?O7uCRSwxjEDjL1RFJlgP0Ayj9GTIDp3kE1cnlZNNEj9V3aMYwpQdcCj1mu9K?=
 =?us-ascii?Q?hyea0eblS+AUlxPT1VAdS2kipSE98xwh0HnZCjjU0Y0L0e9vEluh7cOxIBq3?=
 =?us-ascii?Q?7C7cooWAB9K03o1I9cR1cC1FCZdl+OY81275spIGmg+GUNF3Boza8KwkgxR/?=
 =?us-ascii?Q?xA15HdQjvmILXsBwqWeDqp7xLzA+bc8NrWoDJFjob3nT1vZtfjaVfr+Z0/DI?=
 =?us-ascii?Q?3gXSYqd9RIRnVvZ31neSumiI02FwT9q4Pwa5oo8T63zM48i3D1zxeT/noZ3l?=
 =?us-ascii?Q?OZO9A3NDMYXB7GfwUqQBS6jgMqjRUtaD751yQU0Aowh5GBwK7apGIt8o/piE?=
 =?us-ascii?Q?rODXnYlt7MEYxygOfs/aZx4q8vfD0kJDEUAwfZzCRwRieif4LbD01vNfzc1c?=
 =?us-ascii?Q?vQtaPoCx6ppIVNAAyP9fokqv74hrCNg7qEAmNbSzM3XsjKwVcHpq5HNltTRn?=
 =?us-ascii?Q?XZIgoalora+DXJ9/IcJnSqxgdO+hz3tFOlp0HWcyWvcv8kt+hT4ErBWLe3a9?=
 =?us-ascii?Q?37RzxO1oISJ2/s4v1jBclM+cTiOtIezhHZzeWWSC6veXIzPvZHClKus0yXJ0?=
 =?us-ascii?Q?iBTluPPR5xuebwlirG33fObfoWeK20lm2vopn2zA/xnb7s8RcI9jlhyxNcR5?=
 =?us-ascii?Q?0cbYIiKbJzMavJX+keVMZBUOeA/sVCI7TKwcPx0CdZTGrcNb9mx1XOIPb2VT?=
 =?us-ascii?Q?iLdJOhk6WdpJCUUuUpF+zYCaCLE/6XW4EwpxmN3xlXBNfxUf/AwEVpkSeK2y?=
 =?us-ascii?Q?/hpmoCPAvYnCtMt8qHdEgSTwO2cXe6JI1YPrNXORoT2PJdfgeRUYS6Zn5sFR?=
 =?us-ascii?Q?0Zbxrl0YOlXwKQdiKeYqK9ewLDzHYu3O82BxG4M/JkrS0rh+1/EpSLQgez3C?=
 =?us-ascii?Q?ids+eU/6Vg2dFMahMgGQweqqpTrMyep0AWVPAKw5M/90ej/87Y04I1avhPgb?=
 =?us-ascii?Q?RETeFwLPRT0I2nyBlHfHMrduMk/bqUS1No+iowujHNjL0/Qlfh2ckGis1Xmf?=
 =?us-ascii?Q?oQ0KDBxLZVgB7A0K4xaM/axOChJnIR2ToKJH5coJK8wzGu0yx2Id86cg7F36?=
 =?us-ascii?Q?LE+0ffWoBaBtCLvmpTUCBFQD34O6ij5FSRMvafYj8rMd5gu4xnSpQqDy3gUz?=
 =?us-ascii?Q?pVzcmlrzlp/2OpkBDaJvgzdnChWZTa8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d908c7cb-5432-47a7-232d-08def9f3b20b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 11:03:39.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zA6itRq8wQo/SizjEv8RBieYi9MznRbULqpLHUuBYUjNkk86n2n7XV1yH00IRUyL8K5v2BZpA5RUgyycf/0oVCUaPOuf8ndD3x4lgS9BPL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 11:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243440

ChangeLog: https://docs.openstack.org/pbr/latest/user/history.html#id1

Source: ChangeLog

7.1.0
-----

* Move pyproject.toml to the top of usage docs
* Docs and release note for setup.cfg/py removal
* Use PEP 508 inline markers for wheel builds
* Add support for local version as defined in PEP 440
* Add testing on resolute 3.15 (dev)
* Add python 3.14 support and testing
* functional tests: extend PYTHONPATH rather than replace it
* Hook in LocalSDist override
* Convert CapturedSubprocess, Venv fixtures to context managers
* Remove need for setup.cfg, setup.py
* Remove more unused code
* Avoid warning about setup.py deprecation
* Fix misspelled tests\_require in REMOVED\_KEYWORDS
* Fix tests
* Drop Jammy testing
* Add classifiers for latest Python

* Run py27 job with default ansible

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-pbr_7.0.3.bb =3D> python3-pbr_7.1.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.0.3.bb =3D> python3-pbr=
_7.1.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.0.3.bb b/meta/recip=
es-devtools/python/python3-pbr_7.1.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.0.3.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.0.bb
index 80092999fa..7fc227e6bb 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} +=3D "python3-setuptools"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-SRC_URI[sha256sum] =3D "b46004ec30a5324672683ec848aed9e8fc500b0d261d40a322=
9c2d2bbfcedc29"
+SRC_URI[sha256sum] =3D "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb19=
0533ea8ee8b10c"

