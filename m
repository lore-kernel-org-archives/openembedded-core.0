Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7137.1793350436979968775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 01:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EUFceno3;
 spf=pass (domain: est.tech, ip: 40.107.159.32, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/rZqQY7GW6ZgVkhYqlRWxRYlYN8R4hzvOMozEi3Ciu5PU5zRnZaBonvbMKNS1xjCPnvrMgU9C92OuJCZpXGpb+X+NzjfskYbMp744XXj9W2xphuMJ/ov6+LOR4tMtCcqmYyjcaE7WOAZYu8kNUxroWEhG25prjJs9MLn9VNE/oD29lDXS3zmfOj4exUyhWYJEvNvRonlbh8/R67a2/xK4U2Cn79hhXQtmPEMJyEzoxVEDyyZW0oQDNGsQKcn/FPJ0fvVrTk1AuCLqUNgPtpvpkeFdFcnebZXApY/4N1MKIAf0fuKnAAJCLgTQAF98pJe7pxeJmF3nw0bNxCFMKlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1B6Nq9Bt7ETgTlO4jwLk2enWZliy6exJPCuA5n5FT0=;
 b=ffPDqbOk5W0Uznx7uQE6sT4eMlkk0pWATs8Qr4JF6HP/sz0mGRwnGOD/ieC+2EkGfDuRKfC1b1Flmgfsu3+nEhJo2/7HoeMn1KwFpDYyf4nA2Wfxsc8amrwcDRNaH3gAWw/eqfn/+hlppuzFx8XPIesucgj1+YzlSj0ytq5V0KqkuTu/WPUmG4UB6HFY2IOSAxwvP3gUygGSjPiqJ/420yFUnuCCp9tqdFotpr5LciRq/hsG2tTH+gR7xBsZAZGNW25wxDqGP7e1T3ewZVeUX4FPjt3OvxQsCKWBklzHRc+VbUcBc14KCeUllt3eJJI8Keu1rkPZUHI/rFVxAVu9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1B6Nq9Bt7ETgTlO4jwLk2enWZliy6exJPCuA5n5FT0=;
 b=EUFceno3RV1+cF67FCWWasSr8LjFfA4IK/FbCqz6oW1tt4ASJ6kXqVmMojmoihQoDEw3TN3wJ4E68TIKv/WstVp0/8A9iiRslTa7wSyxqmu7h3mg3eeTLxALdTwGuL5lvfQImMyDnKY0anUIl7oDZGj2JB1si6nlabYoC2yTn/Dmk0SjQhYe0jT0GdJYL4nayIdmhXEVowmFru9xE1kszV+oJQMscgS4fKaKLPBRliy5Bt3M7bFCD8IC/WCTafU08ahdpuwPlJbtll0YBwIcLBZxd4vdBycjgeHa8XppgIifaJ8YVWi0fkjA/lZeSEcW7bSTiUgHQ4ex1KYYEG8svQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by PAVP189MB2434.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 08:53:51 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 08:53:51 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/2] curl: fix CVE-2026-87864
Date: Fri, 30 Oct 2026 09:53:50 +0100
Message-ID: <20261030085350.13089-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:10:234::15) To AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:305::16)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1666:EE_|PAVP189MB2434:EE_
X-MS-Office365-Filtering-Correlation-Id: 05910d00-15ed-4bc7-b9e4-08df366351fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|260925021911599003|260925022911599003|260925021311599003|11063799006|261028144727099003|261009223027099003|261022105027099003|261022113327099003|261022075727099003|261022115727099003|261021121427099003|261021123027099003|261021130227099003|261021133027099003|261021135927099003|56012099006|261026140227099003|261026135527099003|261026121527099003|261026130827099003|12006099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: eYDcGNV6vjBfnQ6uu+K92inN0gHDEEV6TGlK4iA6aUYf22QNTPPRNHvyS3zW0F1H9yvbFhUdtLl5ujlfL2Box5zGmefVT8qIZpp3NhkWqwkGUMwjZzuP0LBLxevVSNSf3rjeT9Kxh0+hRalX7LfPS9+iyLJQGFZ/6Dh/cwZuJXIGVmEbUA/qCUH9WHv4R1pWP/P6B7HwI2+dItII4Z1aVatZgNWGWqDmigTrkWfEKT6zpsbiEKDMHbzcATwvi9VNa5VTjZv4q4Uj+ZquxanJVjyBTcklsF757rCvPlXEe03L+MWVbVa29W8rVxWPHLKHYCNGEZzL45U9YtydmklajiJD0/r8Knk57YgcjzuQg/3Lyc3/2Ax9/oVjIWRn1p6Vp3auEfppOaXllWLvF6uNAv5l51PZSdI4kNIrDkfk4W/YWuWNMML5CAEzcVmiNfBmE0KldYEJURBDPBEXDcQDyi6ea06vtR87dG5n8y10Up3v2B7XCHZK88VFP3xApRr8bHH6BgiM4V1+ipNbaLai9RprAJplu7mGZ+z//spttJOrPL6AmktdaCVQdS0C/5kXB7JtsjVbz5+Gxyqzyy7j+T+QuUos2U7FHBj+hkTTfK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261028144727099003)(261009223027099003)(261022105027099003)(261022113327099003)(261022075727099003)(261022115727099003)(261021121427099003)(261021123027099003)(261021130227099003)(261021133027099003)(261021135927099003)(56012099006)(261026140227099003)(261026135527099003)(261026121527099003)(261026130827099003)(12006099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?diQagyV8p5+VQzd5HsnJdLEvCqVJ9FaekMCIzVi0lPp85/X8ztC13VGFvHJ0?=
 =?us-ascii?Q?O4FDb9+4Uqc655hkq7MjL/pa9DifQLYO3QZLLeqNzzO17GJIMz5mhYYCB1WP?=
 =?us-ascii?Q?VqWcN4iqSqphl6fs0R3KrzuqJB3TjHNncIwxj8q2Kib/+/RGWph9aMlOPsxv?=
 =?us-ascii?Q?DUdRP+I9OqnaGE0nV7GY5WYC1g6JI7/NcT9f+VrVaZVBBKI9/M/jRQVXp6Dz?=
 =?us-ascii?Q?O5BEHg8Zx4rlR25vsVDt2wxkIXMGdbT2NK1YJq1AOAGE3sTrzVkaqEdgC9FD?=
 =?us-ascii?Q?Utr8BSBwqhM50ewoB41UyVon6rstGgWkgfS1QBRqsZc0e8XDvCzEokdgqMgC?=
 =?us-ascii?Q?taODZZBof0oJMxcAD+IyieeAB8jzCF+DvdH8zBNcdEnvja8W0rSQZWL3M6nI?=
 =?us-ascii?Q?c75tfG85Vs1dpGhP4N3G8fHCJvD5XvgRyd6lVwvtCbJ01xbNDMKNTQZ6rKl/?=
 =?us-ascii?Q?vfIKeEf7x0tF9LndSm/kRNExafUGtPJpGWo0vQX1LT7KC6Y1wpfgSLUvoYY/?=
 =?us-ascii?Q?GA9VZoOKAtZuQglNciWgtH/ew2X/T0CyzWa6rh/vyZpRcz8GGefRfFY8Twuu?=
 =?us-ascii?Q?InUCNSg1K+PST9S8f2Orj4myAbELCk+sXOKhNBMk43RIzykUVPI14CmNbg1i?=
 =?us-ascii?Q?RYYr0RDfLszOXaR8u5XGF/46qnzcmyP/k6oNzizYeclq6CVgKaUTAIjmUCxT?=
 =?us-ascii?Q?HyO+rHA6WvWZ6eZ1VxX1rxM+wDZIpFIBGM8prIME9TJHLekaZUK6K33eUwhJ?=
 =?us-ascii?Q?8HvLNab9REmMVUkkxRPlWs3SJWYazMLhO70TbNKNLcHPVcbRW1UT5OW1q1Sh?=
 =?us-ascii?Q?T879DMxVxuyz4vqDjaekc3LuztSExlGLRzJuB65s9taGxexQwxx9x1pxk0Fh?=
 =?us-ascii?Q?N/FL8w5r2c3+vfkIq2jpb78c93uOo4LeP7YN9T0HJ0bX8eoUmz+l1ubpBCpw?=
 =?us-ascii?Q?RKUkjPWonAUA+pbSZGHyVfrXw1BtJ70kIv5slPzvS7fOsH4KBZvf+asdX/r1?=
 =?us-ascii?Q?rSqmqL3TtO5uhLjb///IsUCogi8ZgorjwFfcEj/dxsTyxubaOmOcq3XqTme+?=
 =?us-ascii?Q?ufve4uzbx+4sPHiiXOMxK73MxA2mRG1Fpyvs39q3FL7JcG5VCfkj7yg0+/KP?=
 =?us-ascii?Q?d6uNaLDaixxVZWyIPhQxtmFqr/lRGON4ux5WYXrexjZ+ACPEUv1wA9T4yf17?=
 =?us-ascii?Q?b0VYe4T1LI7Z1ycsm3aRev76W+wGihapyW5tzdNtdgv4Wuwcho7AeyHKJIXK?=
 =?us-ascii?Q?1BM7WJF9e88vNCDqoPv2RLnR2h+ZzTfaqE8ksMe1P/+v/xkefHuUs5RUnq5b?=
 =?us-ascii?Q?j4SJ2T9dwqmaXr7UUF5UBB3lnmhEt+MK8NBm+XdRKir82a8u4DQ3vs64fh9W?=
 =?us-ascii?Q?2uboqpr09X1SKliug3Oof6CNeZ3C1fAxVuunSF6phkv/Nt9kP3VTczaRQ4GF?=
 =?us-ascii?Q?n1DpeV35F3wP354G4YtEa9cyozrgc17s1M+sj/S4YnolVCm6XtIGket+xBuq?=
 =?us-ascii?Q?w3Obx48biHvn9OtKUtDzFl35oRwq1H3W7zvbr1lg7G+lShkPxDpuLUtb9AF8?=
 =?us-ascii?Q?7ad1FQyufdYw0q1euyIkNi3/ax/dfwYGxoVUg51Nae6q3gqlFmET0kMkaTZl?=
 =?us-ascii?Q?Y2OEnMzGeARxfyfMPCxibk2CmeKvdPzUmqjbmmiUVRxpajXms0+N53L6NHc4?=
 =?us-ascii?Q?V1USDEVfDkNeXnG/mROh3eyBwxlZehbVWMmipeZcfbYQP14sff8B5/6VgGVh?=
 =?us-ascii?Q?Kbz5gqIHy1NhzciD9K9DPyzaN2Z4BtI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 05910d00-15ed-4bc7-b9e4-08df366351fb
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:53:51.6194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PFxiuIak/hRXmWyoxryxP339jVK/c4ip3WBgepePqQ/ulxUUaA/0BDWFsxGDAEqHgnUKDYrqH8oQhJhHJng5HEpzEPaPLMVwe9D+8uvYf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 08:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249006
Content-Type: text/plain; charset="utf-8"

Backport patch to fix CVE-2026-87864.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-87864

Upstream fix:
  https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae797

Tested with ptest:
Before: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-87864.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87864.patch b/meta/rec=
ipes-support/curl/curl/CVE-2026-87864.patch
new file mode 100644
index 0000000000..01efc71c4a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
@@ -0,0 +1,52 @@
+From ca1b787c594b2f1b2fc7227b75d2166551aca32d Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 27 Aug 2026 09:47:53 +0200
+Subject: [PATCH] imap: APPEND CRLF fix
+
+Deny an APPEND operation with CRLF conversion requested as we are unable
+to predict the final upload size and APPEND requires us to announce it
+before starting the upload.
+
+The check for unknown sizes had already been there, but the crlf
+conversion that renders a known size unknown was not accounted for.
+
+Closes #22702
+
+CVE: CVE-2026-87864
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3b547de3013=
42b347fb3c6ea6ae797]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/imap.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/lib/imap.c b/lib/imap.c
+index 0546595f89..f37568fb20 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -884,7 +884,6 @@ static CURLcode imap_perform_append(struct Curl_easy *=
data,
+       result =3D Curl_creader_set_mime(data, postp);
+     if(result)
+       return result;
+-    data->state.infilesize =3D Curl_creader_client_length(data);
+   }
+   else
+ #endif
+@@ -894,9 +893,15 @@ static CURLcode imap_perform_append(struct Curl_easy =
*data,
+       return result;
+   }
+=20
+-  /* Check we know the size of the upload */
++  /* Check we know the size of the upload. This takes all readers
++   * into account. Especially crlf conversions which make the size
++   * unpredictable, e.g. -1. */
++  data->state.infilesize =3D Curl_creader_total_length(data);
+   if(data->state.infilesize < 0) {
+-    failf(data, "Cannot APPEND with unknown input file size");
++    if(data->set.crlf)
++      failf(data, "Cannot APPEND with CRLF conversion making size unknown=
");
++    else
++      failf(data, "Cannot APPEND with unknown input file size");
+     return CURLE_UPLOAD_FAILED;
+   }
+=20
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index c2697d6dd8..ac25f7f156 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -39,6 +39,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-9546-01.patch \
            file://CVE-2026-9546-02.patch \
            file://CVE-2026-80230.patch \
+           file://CVE-2026-87864.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
