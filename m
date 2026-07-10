Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AA2C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:31:54 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8403.1783672309022738974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 01:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mAzsuBLL;
 spf=pass (domain: est.tech, ip: 52.101.69.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+nkD3sMDV+g2d0MfBg4TWFILwb5E8WeAyvL5/Vnhw10DGM94FMKJkPrfu1XpFJU1gFGH+JlzTLvRQdius9UDcrjbUvx1BTpzxplEUM2mkmNw4KxHvOUmgJzzOBO0j9kzxrXwL50z/oHMXLDlh851pBfAmOYf9BDVct3pSzs5v+giLxYhW75xc0d+s7s3nonC6NZ8rKeGGhBAEgpO5q/nPoBnofMFEnjkqQqmMiqQz4exL/jcLKXByB8vTJ4stHHPh8HlyeZMHQjyUBrR5NcuneQ48ZNRtbguT+lVGWin+ZJjq/cefX183trraaSsF9ToW0GG61m4H2j9rm+qm8UOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF+aj36wfT1rIOolo8OJZ1tha3rO6WEIo9Rk0PfYIwA=;
 b=SOuA4avVBBLR3q7i9clTxWKw6gnANuEIWJIrH6VMyrVgaVJsKSupW30QSiCt0znHbVyTRT2wXM/A2XwWQnxPx3YZ4qqw1TrmxyRDlB4Pr1Llx5cACM+v6lprImrLLFe6ke+8NKe3ifa8ZDsEC/k5NsfTFh5aWOhttrt5IzalQGDgI+Cp9ncKgQluJw2nzWWh9NPqSDClO9tEJ8y4wLEjPjq8N8oet9QSGBzx+V40AqFnZoytULm4sNgfLUt2qaVVJJq5oS9NL0Qa/md3yyZFb6dNaJv/I8keuH5U5IrHexNDREPs3HbdnWydBRY5YF4Idk1xvmzTtZrY4+FNgE/Wxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF+aj36wfT1rIOolo8OJZ1tha3rO6WEIo9Rk0PfYIwA=;
 b=mAzsuBLL8qtBn/4mmcTZ1MJlP8LUjoHTTfTlpiAOfIZSGl1YRp907VvJc3GYtieTblXtcBaL2xm9Lv179JBq6jXPus2lVQg9f+K2/Ycu8YDN09puMwPkA1rdBifyOF3tNt3G+KQST001uieJ4FXIELHMBFv6J31eFCFWKL1wi2nvfGyAPPc8yRCiPl+dwg7+IkAdBIyDJ6/MB468iiORC2qtBkVXlSaJDrK5IXrHFg53imuwaFEY7No5TDkBxhd3tf/LqT2HWo8SKxqXb68DKULdtlyYo6u3PoQ8R5th85ZspiE3VSj5qHhdcg8PwrvWAIHfmFki2D2cGqrL7uwwag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU7PPF2D2FDEF54.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::acc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Fri, 10 Jul
 2026 08:31:44 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0202.009; Fri, 10 Jul 2026
 08:31:44 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] bzip2: Fix CVE-2026-42250
Date: Fri, 10 Jul 2026 10:31:29 +0200
Message-ID: <20260710083131.58029-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0271.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU7PPF2D2FDEF54:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edd1904-a2ce-4486-897b-08dede5dacb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|12006099003|11063799006|56012099006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JvA9tkSjYZQRbT1wfnzybyDtI9V9G5fJYHXm2sorcPcE2i2U799NdYZmm+cF9tJZ0QY4WRBDvXq4eeCDRislhzpMKOEQjbj9JaOsruqFizDG7dQrQsOSn7x83DyBgyJGjP08wX1A0g/cTEbaeEf+LQIm3qk6XURxybYRi5l8SjAxNnKx1grFFuKlpHEAqO/3975x+KKXyYFWoDZ2bOlaDo/CClJnbElexiywCtMgn95+0GafECFmXaZd7IAnuP4IEAmkBt3mCZEoZmecfXhTscxDqhA7dvDGD12eI4H1Ols50n56lv6bZ330WWKD2ePASWLTynNv2TJYr1OOf/LWJjWIXchgENPWUok82wsouSdM3BxdRn0KznImlH3bv83GSiwh33701QruzUYNL7tdawySto+4BEyUaipHulxg7k4uxcqX2i/uFkGh8FtAR7J4Q6ny922UhqZPaKbZqI+1Ifb+b8uwKWz8ZNxV++4XsQ6Ro0HcOEs1Aq79urKAHIQx+sx4Si/D3EtAPqRyuHtjij+u0Zc9vhYdLdxZrsqYPXyh4TRyOpEMQ+uPgRyWXT6Byl/t2WzZ6gZIQJ2lGlhMtj3hOcMF+Ir6rHXVnDIT2u3Y9UGy8NODuyfQ0dCR37mIF7AH2ClAg68Przbl1RlHOgPUnFIWXqLUyahlvPZchug=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(12006099003)(11063799006)(56012099006)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UwOQLK/KiIa42CoA8t9bePiO5SWAO9iiqryi4+q69Sip2qeNWYR8fZ71w3aS?=
 =?us-ascii?Q?rFOMwVEihtWp87Gii57dDbHEalVhhB5renbzMrSiehRcsouNCoMNbNZjs3o9?=
 =?us-ascii?Q?q+9VCdvAPRoCuxOkJ9pXwj8hOb9YGEmvVCuOTZLD4ZOhDaTfhFu1o9fnkb3J?=
 =?us-ascii?Q?mo07pFQnTnUBJGuLQxiD1Q7vu/qYh69V3ACzoIIPfX8V3CoxfzTDU05/O455?=
 =?us-ascii?Q?YRblWEH9AQDoy20RxrqXM+omBH33C6DuNVlVVQ2wAK90/sjaVLpmj5D8Zhj/?=
 =?us-ascii?Q?XxLaVKpyi+EXU/2dbdyUbP4r7u3lMlzGVkZ71AXAmKkLUBXB8F4qYnmD67vq?=
 =?us-ascii?Q?MWxZMf0t+BkgyLErxUbSbD2MK3PTddLZ9VeL1dUwEPd68XXsB2fc6z4XbCx4?=
 =?us-ascii?Q?ENFf0nOcQuUbmHeGcxUPn5vskdAVV5QdnCvjSKea/mjkUE4XBsG/rkybk9hC?=
 =?us-ascii?Q?UjaxE+b++77TwlVweLjUxcYMXY/GKcBCGatc2DgR0VprCRAWb0hBwCnS1dV7?=
 =?us-ascii?Q?e3T5uZXBlLFLZPg6x45rSkf4SFK5HPMJp2qkzEbgtRucFvAC90x6NEKaU4l1?=
 =?us-ascii?Q?cTOn3fu72imCE6u5xUjzxPGTaljKITLe9U5yQu9PgG0xra2dtR3zpjqvLp6W?=
 =?us-ascii?Q?rmXfW0LGO0f4nAuCrJmWvmzQB1V/G0u+kfwIMTSh3dM4Ud0xHx+mokogzrsO?=
 =?us-ascii?Q?PSy5EnZ/wlg/T4K/7qGiapns2JUeM0xs49RnyoqwBPyrnplPoKCX47ZYABxI?=
 =?us-ascii?Q?YLkKBw0kev9jGR1LVfmW0IXJ6xWNh4QGX3y02G8y0yujHJ6Lf7/C2sFcwGqp?=
 =?us-ascii?Q?YedzrHZGs7uZG93IcvkQ8SuyBKNPw09LAk+y+Kh+qOdmHvWC8nHTr7sDmmh1?=
 =?us-ascii?Q?UI5Ftl4V+ev/jMQr76+F9iGTQoKBGyxEkeUphoRIT+XUxKk6XOsAXx3sb9G+?=
 =?us-ascii?Q?rRGke1UkDFPOJJZKllhhrCwOdyBJ6yzJSrcQqc1YnxECG2laqGlDjY6tdz1P?=
 =?us-ascii?Q?hl7z0tWHuQ2IYupPebcY/n29eIwAtmvNtLvp3f2TLuJKAMEL0euMP0z36tnR?=
 =?us-ascii?Q?8OIUo5X9++7dRxgD+7WcdBXtXPdd3iIrmHnLFugJj6BxKgdWfLV6Rc2Df69B?=
 =?us-ascii?Q?p/p65JVRSxYgutVTRQmhXzgJXShJnQhwF+OMc1qjK9i4c02D8iMVz0qZC5sX?=
 =?us-ascii?Q?iwTl4/qWrchJUxTjiBwy7LOJs0yJ80h3oaiXHSpnRPWi6FmOzwaVnhT+S7wo?=
 =?us-ascii?Q?tyiJqxF2sTI4H2p2vO/i5gDLrnmMPeWY5LrSXpcH6r1U8lIG2Y7stCUaYZca?=
 =?us-ascii?Q?VKXLB7ZM1iAi47I6fXzkcezxbxLgirhrCaJzzTBb9kWYrHM8RXpGXNsR2qPI?=
 =?us-ascii?Q?2pyXYDavLru+Scfp5YU4cLp4iKUFlE7zVf7hCKfNgoed4sAucroaJwg5/xWL?=
 =?us-ascii?Q?5It0eBdD+RR2v+JkbzAw55p5kJvdufz6pdg+mJtn09SWEOtwbjpjcLzE/Ti+?=
 =?us-ascii?Q?7GnhvG19OmimIysLTGoEAa/k7sJWmvK2oF7ugpdrAifMCi3668ADGEUxTX0x?=
 =?us-ascii?Q?3cxOIO6bTUoCLmZIwZVqdfYeQGZxZki/6Vwqok976N/orNlLJ2fHD/ONSUtq?=
 =?us-ascii?Q?/GUfDBisuUBOTiXlcuAm69NBV/ShSahZNAAp16Xm3i8aQGjurQCZd6dJJtGp?=
 =?us-ascii?Q?MfJYfnpwtlXBHtADZvCuecMJXNq5ELSBGuGCfjSfVuzPHd2EVyAaMi6s0FTc?=
 =?us-ascii?Q?PNjcUddJqA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edd1904-a2ce-4486-897b-08dede5dacb1
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:31:44.5112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9cvyE+XbLyMJPEwqU5E+3J2nmGNRh1uFxjSUO/x5k9vBGsYBoRLue9HcPkUtApe2OAqTO5cGv84JSlXsHKs4sqrkq44NTHfGCW08yI6vK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF2D2FDEF54
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 08:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240618

This patch applies the upstream fix as referenced in [1], using the commit =
shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-42250
[2] https://sourceware.org/cgit/bzip2/commit/?id=3D35d122a3df8b0cc4082a4d89=
fdc6ee99f375fe67

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../bzip2/bzip2/CVE-2026-42250.patch          | 35 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch b/meta/=
recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
new file mode 100644
index 0000000000..1679e74447
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
@@ -0,0 +1,35 @@
+From 71bf61d2e664c754ae5b1eb04018c8eaf5f99ae3 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 28 May 2026 16:15:45 +0200
+Subject: [PATCH] bzip2recover: Make sure to not process more than
+ BZ_MAX_HANDLED_BLOCKS
+
+There is an off-by-one in the check before calling tooManyBlocks. This
+causes the scanning loop to run one more time and cause a possible
+read or write one past the global bStart, bEnd, rbStart and rbEnd
+buffers. There are no known exploits of this issue and you will need
+to compile with something like gcc -fsanitize=3Daddress (ASAN
+AddressSanitizer) to observe the faulty read/write.
+
+This has been assigned CVE-2026-42250.
+
+CVE: CVE-2026-42250
+Upstream-Status: Backport [https://sourceware.org/cgit/bzip2/commit/?id=3D=
35d122a3df8b0cc4082a4d89fdc6ee99f375fe67]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bzip2recover.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bzip2recover.c b/bzip2recover.c
+index a8131e0..4b1c219 100644
+--- a/bzip2recover.c
++++ b/bzip2recover.c
+@@ -402,7 +402,7 @@ Int32 main ( Int32 argc, Char** argv )
+             rbEnd[rbCtr] =3D bEnd[currBlock];
+             rbCtr++;
+          }
+-         if (currBlock >=3D BZ_MAX_HANDLED_BLOCKS)
++         if (currBlock >=3D BZ_MAX_HANDLED_BLOCKS - 1)
+             tooManyBlocks(BZ_MAX_HANDLED_BLOCKS);
+          currBlock++;
+=20
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-exte=
nded/bzip2/bzip2_1.0.8.bb
index 9cecf6a331..36267e5073 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${P=
V}.tar.gz \
            file://Makefile.am;subdir=3D${BP} \
            file://run-ptest \
            file://0001-fix-bzip2-version-tmp-aaa-will-hang.patch;subdir=3D=
${BP} \
+           file://CVE-2026-42250.patch;subdir=3D${BP} \
            "
 SRC_URI[sha256sum] =3D "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248=
e682cd0c4a2269"
=20

