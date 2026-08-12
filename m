Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AD8C5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 12:19:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6510.1786536977031956264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XwQ4x5tL;
 spf=pass (domain: est.tech, ip: 52.101.66.50, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keRh4aSdYEduqCuBCoenUJMs1eJmETb2jUsf4kDX/3/YITsg7HGUFjF4f446d5X3iVmj+XspynLCL60UPQIFRrAXITYjnc/T08Myb0QBcN6MypuYGcy+oamZj9lmaoZPMwQVAd42Du8KHnfCItNfaLWWxzfySlsSYuLcQZEh8jQlnpYuF+vE0ve1SJRfn5n1Gx/W2MQnt99Ncdq6RhgF9lZMeSaiyHojqgRLBcpDunfCH62g1vRlG9DTjCuGaPOLuE4uW54aVwVHrRXd9wZ41xiqFPlWl1MG8XFi23Jo7V62DtOot3MkEd6LNHdSS3dsjG09GOW3JcLLDqT1CW0EFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK3axrznaYzYc6o0jyeIJTJvKiM9KDyXueNvVtYioVk=;
 b=ZE96f0yaefX0fDNytJTdpdXMn77ctK7cK66neTi44fTqOmfdD4cIDj+Kwj7UBA12iALt1CWq4NOXWHHLs4Ezh2sIriMxyT42REwosu237WHCKxlAYWPIh/NcIGqmsTOKRWZvljv9qNVb7936CgIIQbd07q0zSAGUNljYmUpYzF1z0G2KQVSG+i563yOK5/ehHJXh157wV2ZwbWa8LLYr1uXjrPErlRBZLKfdjTfIz6ABfztqoGhfbxncpLyxTDleeeRzvUs4FpOkj7+iPY1TUTqtC9eWIodWtLDokaLRE3PZ+dTEwtwP4qnWs9FguLQpTXW/RZFeuW5rYsDxK9S1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK3axrznaYzYc6o0jyeIJTJvKiM9KDyXueNvVtYioVk=;
 b=XwQ4x5tLpXYMmPYMhE5kTanwtMaan5O8DOjlBIWjw27FoSyL7JfN4JprjpAB8wwo+yuuJR8td6H9ZouTuie1vZkX+La47XdGEyFe3aK15dDKncj03llkHzhM6uN8I89AKNtS68j0BLJewx0ekVrpZUzYK4OdMon8Iy0jMhgVoFueeqAMLZXQhlCxKUP0I7DtUoroTy+hqrStEVIagEhfRi2dzSQtzSgTCUUlQ0zliWVC63MgMt1rGTOA1GGgCtFzSUP3wB0nk4FkceWsNveSmJwX/KBkYjdVY8w3JyL8CjMafqCZ7IH56GuFiXO9AZeViIMbN/9D7dnPpT9wYh5vlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB2713.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Wed, 12 Aug
 2026 12:16:09 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0339.002; Wed, 12 Aug 2026
 12:16:08 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libssh2: fix CVE-2026-58050
Date: Wed, 12 Aug 2026 14:15:23 +0200
Message-ID: <20260812121529.334101-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0237.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::32) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB2713:EE_
X-MS-Office365-Filtering-Correlation-Id: 0763ebc2-ac0b-4c9b-3312-08def86b7db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|6133799003|12006099003|18002099003|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	2ESOMcaV8IaMeM2PUwK1pY0dVgh9UMze8eIwIl6x2O7bnbedsCktkTxK+OHvAEFNnoOiwFzNlCfXndqkUX4Ti5OQ68P8o/r9oAryP4ERoEQ27Vvg0vhjXV1uZXXR7XJgSXCkIhV/XoE+60AihI8s3sUwRgwVRz9gj3P6V1yklCfgHJMQQWF9fPtIN+Zr369rrCdTPpkWsItYeTLcI/vLVbw/XchiLLPA239Svdc3g5/HEAE94NZfTd9+HzeCp+avPH0xd5/dHJV3uH0ptPV/aOCzUcgBboqPDMRoNIHCw66Rx6d2s2UmheV4SoNrRGoqOWES1IqAwZ5z2y29vT09RygbDzc6G07amROBLxb+aoa0GH+zRXC/IyoltEOIzfS73ypPXz6laqRkUJLerQESD9DWSTBnIYn5wuX6GioLrCopfP9W3/nY/m2bq/N+efG+i3r2ylRBRq3RDjkM+ZAfAkXpiors/XIs1sJxRqlyogRfE4xvV8Pa+c+R0vPi8em+0EPP3/dVvPKHECuwHx+zOWjRs/Mkyg/YO6JEKZMCA3eeHAPNUuRNXJmhiIY6iZ5jKgi6R41E3bY+Oho48qviw4jTsTCOOZ+TugRXAFBQynrky64RWTldxA1y5el0I5tFxabvfrBUtVpuUT+A47KLpZynVJZB4aIIxNR762BDXc4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(6133799003)(12006099003)(18002099003)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ncOLxNQwKyoNy1cBYv4mLPa5R+myIt34MoQ8NW2Ruz6WkbxIm2Xz7Irynkyf?=
 =?us-ascii?Q?nUAsFjBWQEOzc5vC4ogbSf4E143ltw8V1sDDDbquOPZrjHsk5et6vqwEqj6S?=
 =?us-ascii?Q?ldO69c+mS40VasPYF0gYHcPC8KAJ/l38sje4eO+3Bc7hCQ+xSmrYekz8WVb1?=
 =?us-ascii?Q?75o9t0jHYSNw0wZkJ1Di2jwaZQS3MvSFOSCZ+FA3T0bx7ylSQEwx0YHFt6TD?=
 =?us-ascii?Q?jaCeGB0j7+zoqFUisO4qqA9bMm5e+A7gEv65GcCDQlWTmfIpF8Lv6UtYz1hL?=
 =?us-ascii?Q?UMafrCSWOMohjloHj6aQjs7+slxHUFTGWdvg+rmgrmcZJUGEApRe9qDhEsFM?=
 =?us-ascii?Q?fkxLDf85LyqfnvSMnjllcCxAna4h46+YEbkIo2Kp4nDTQREkSroexj9QEJNe?=
 =?us-ascii?Q?yqBElbX1mIVYth5DRE+zBf4nwuLko6MAWhWjtdiON/rGT06mgf1c/haUYFSU?=
 =?us-ascii?Q?Fk9FjXb3sq4dOQ19JToltb8Hv0miuYihRAATB2c3T+X42U0s0LEXF83dlM3a?=
 =?us-ascii?Q?uE6CqyCdPG959Io+YbpIhKIlKsDtLhzoeTWFMOrLfCB+RBCrdcL813EkU+g2?=
 =?us-ascii?Q?kKsGiMOuhMRbqiWKexvRTuGVjV3GvFYek60L2cTspZejF2KVOJ+QpAdVB+lJ?=
 =?us-ascii?Q?54/4BOQ98j9VBvTDoDzk4SnAaR+bErINHU9vLJOUImx/4y+1UlLd6dzspSVj?=
 =?us-ascii?Q?CWsa+BssBUnpvSsp15OfHAfpE6zLM/yn3Hk/HBQ7Nf18OHAZrgoFfvd5YlYA?=
 =?us-ascii?Q?YixYDpq0oWEE08RTdrcqjyLK19Y54PRib5afz1BDB0Sf86p0co2sj7qU0CFz?=
 =?us-ascii?Q?ZE9WuHOMyHmkq5IJIJv/6Z1ehgr8hcOAuWhUPUGrzUoCO3h7I53BogRj/rtv?=
 =?us-ascii?Q?3Knn+ggaDhP/MFHRMx9A2B3M61cyC6rknpGVCpnpi/Jb8K2+5Zup4Pw0dGnB?=
 =?us-ascii?Q?8KTvzV5JSqwBalLcCwTT0gAx9Ft3/sBnZ8aIBPvWLuGn3UkVIqBr+rpP2isp?=
 =?us-ascii?Q?CBup+aSVbRqLKxkAkDxbtsRCZOXHJz9ag7dxqiLkMk35RdnrN58YQeWpH4rH?=
 =?us-ascii?Q?7AsmdK8mvboue4hzsKitz7Ffnv3nDXLrzIOU1LoYfSVclLxXc7fZuNisskME?=
 =?us-ascii?Q?ffBBLZrq4VEw2vFedm7N0sPHdR9Jf3oVdKCaHRSmEQcV/JB4NZty+cDyQRFr?=
 =?us-ascii?Q?o91XmRtUHkR721W5/qUdVGf8xSxmRFzPyDgS/AD2vOzO2Pq//C10SpM5DreM?=
 =?us-ascii?Q?DRBy7yrLtSe75QvIWwIVmJ5kpJvTCR3PaQ4sTtQIAYDPdpVBQbD/1Tiy3O/J?=
 =?us-ascii?Q?W0b/AHpdwqWCqRFTAhh6CJiFIBmmUc8ecxOhwjcjXnAAR7G98ViLZg9p0eaY?=
 =?us-ascii?Q?1dg0J/CpHQPSlN3AQsKbTkJcDbkwzr1kolz6q4yZ6Oa5kEMm6E3ARIJMZ8Qg?=
 =?us-ascii?Q?7fQNPvLXGXlI3kU1TOziQbAIqlJxFHuRoQMozhBLL3QWL+H/0hzqzLIqdlrC?=
 =?us-ascii?Q?ut+GuQzpETVZsJKl9L0GEjwJIpiIclVgD9UzwNW6pv0IK7n5cLsd2tznCsPs?=
 =?us-ascii?Q?IhvEyuw0j9RK3M/a4h8h+2tvQltSlBBJrWOhHGHlssAS4Gym8aJ5mLb0xzrK?=
 =?us-ascii?Q?MCJBL+sGfmZ7aeK1N/s8y0pLHuemXEI/+WByI3O7maI1w05DwOY0nPHgeD8X?=
 =?us-ascii?Q?aWwoHImSUHdsW1F9cQRK6ET7xHqf07t0JiW++1BuBR+JicNKQwA29VxELQZW?=
 =?us-ascii?Q?X7f2xJB87MgfLvICR/tJRyF19zpp//4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0763ebc2-ac0b-4c9b-3312-08def86b7db5
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:16:08.8755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa8LaQuNuS7oQcfoEt+2toj6VAICWp0M6rRsz8+Dmr94vO5q+/p2BC2jAQXOCNBtJvijeFpi4Ry6VrYfnLsV0GgAalTuHi4znGwTN0GZeWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2713
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 12:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243284

Backport patch to fix CVE-2026-58050.

References:
      https://nvd.nist.gov/vuln/detail/CVE-2026-58050

Upstream fix:
      https://github.com/libssh2/libssh2/commit/34497525929b9a47f03dfb81887=
ac896202b7e12

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../libssh2/libssh2/CVE-2026-58050.patch      | 45 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
new file mode 100644
index 0000000000..0163b379f3
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
@@ -0,0 +1,45 @@
+From 05b2fb4ec89d75235dbd97c5965dc0e46b405a7c Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sun, 28 Jun 2026 02:12:52 +0200
+Subject: [PATCH] publickey: fix potential multiplication overflow in 32-bi=
t
+ `libssh2_publickey_list_fetch()`
+
+Cap list size at 1024 elements.
+
+Reported-and-initial-patch-by: Mateusz Gierblinski
+Reported-and-initial-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+Closes #2128
+
+src/publickey.c: replaced ssh2_err() with _libssh2_error() to match
+the stable branch's error-reporting convention.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-58050
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/34497=
525929b9a47f03dfb81887ac896202b7e12]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ src/publickey.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..196d2f9f 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -1114,6 +1114,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pk=
ey, unsigned long *num_keys,
+                 }
+=20
+                 if(list[keys].num_attrs) {
++                    if(list[keys].num_attrs > 1024) {
++                        _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUN=
DARY,
++                                       "Too many publickey attributes");
++                        goto err_exit;
++                    }
+                     list[keys].attrs =3D
+                         LIBSSH2_ALLOC(session,
+                                       list[keys].num_attrs *
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index f9c15ea977..0eb263b017 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -20,7 +20,8 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
            file://CVE-2026-66035.patch \
-           "
+           file://CVE-2026-58050.patch \
+	   "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"
=20

