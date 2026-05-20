Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE23BCD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 09:06:33 +0000 (UTC)
Received: from mx-relay16-hz12-if1.hornetsecurity.com (mx-relay16-hz12-if1.hornetsecurity.com [94.100.139.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8099.1779267986868535742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 02:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=fBuciyN0;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.216, mailfrom: hsimeliere@witekio.com)
Received: from mail-northeuropeazon11022088.outbound.protection.outlook.com ([52.101.66.88]) by mx-gate16-hz12;
 Wed, 20 May 2026 11:06:24 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTvzyqalxbR35LA7D5uR+iGptZe8Zsf/jDYye/KmjlCgfAyW5diJyjyxPbCqHBQLgSJmBdJ84ca9SsIRe4IiyJdPg22LvZ+wlurHQBwIVvhxUaKCJsaL1l7nbjIkGDFu552NJE9VjOLkGaR2tHO8DObxd9F9iYW+JvVYviHWOxAAPFuNA6KBnjIsPi2omoSZHNSxM1w3v5QVoseVh3O6jwHm5S6PQKUaFdgWp2o4Bh35Rx/B4+FyqMuBVp02WXCGzzmE8sEpqnBuAiQOaibaIuJLQg69ctmk2vBikK4fBPADeve/lC79sQodINJHcXQDyDBkGnOn7Tln4XDxxnrWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GBYtc7PH2PgYU84C5VfDL/qflYrNMfrMU3J1kdeTk8=;
 b=VCb3uxl/rqgsArtNRmMpJpJKA6uQgMk+/VtBi6sYH2ezqU39TZ4WH4P5QYnupjJ3IyfPop34a8YPMBBtbd9AmWGr3YGA1fcpIrIZfrPYpU861J0g5YXRsmifIRUjnBi7VYe8DdpOyHvAiu/0nL0sOH+hFcrRI5st02T90Mje1xaleyhqWvkbTGnH0mW04nr0WwE1MWFAL4XhAcAKPG1VrsHz+afQfI3C+74WS/g0Fb++p6/ntRoLZCgaIk0ueRSWraXgf66c/JUwBRU/kNh+OkFiZ0vAm57u7V23gPmpD/ZnQc21LIxSldzlICgH3HkvCM9AuD88jODUw4Bp8zhWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GBYtc7PH2PgYU84C5VfDL/qflYrNMfrMU3J1kdeTk8=;
 b=fBuciyN0OPojSIxV4nPQzsF8yQliXhBYCSJSdqnDXn/0ZXC2iOgvhOJX+KgVCifweEGoXBAmpPBHUJwnUyrJX7aSUSW2u3CKmtBcKdgH3iPD+Ev+ygY2Ps0zuLdATBbGsChGa92jXhCcpiF0XypH9EAdscPOk5Pv323bTYhZdE3ovg0eZ5Av3beWwcbZRsPOWArUaaQRyxKJeOvEgOUvY2St26NM4BwHH0aVr37dCaOqCOU40mLKfZ7EyTRYVt2ONagGRNf1VI9e6V6lhzAnISKR2+3XosjhRJdd86SzYKcfGVOVg//AwA1h6lwblzQOm+guvp3U7jeh82maDF7yww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU0P192MB2902.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5a2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 09:06:17 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 09:06:17 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] libgcrypt: Fix CVE-2026-41989
Date: Wed, 20 May 2026 11:04:33 +0200
Message-ID: <20260520090433.3071067-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU0P192MB2902:EE_
X-MS-Office365-Filtering-Correlation-Id: a655d077-291b-48ed-29d9-08deb64f0d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|10070799003|1800799024|366016|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nRtFVGeOLO71jgOl/WRJToOzEux3iPMifZzr5POycD1PgVk9Kw3WuiRSXt5dEPldBgSxuUOh3mrX0FhQNbkLinKOEE9A/fBRK6RxEEBMPyDgFP1qJDRTCGs3dYOBAADr6dUmZMQsfabbE5knjkqDw14LK/z6yFx0755czkV4xkza0xlxRsCOQ8ELDXq0IURwy5mBuqSLG3ieolYoD/qADhcckzY8I6zUjJxU5mu7WSutrQ2YmyaV+Dm7UIUBlJ9vyx+7KED0cTZ6zIUW9An0c7eGabSBYoJhUZ+FVzsYCdfFkzjFFgBedi5lzCQbMrhRqQjcgU8q5ZUxKaKU+1lWV/E6WyKVgR6XwpknR2AyJTrFUPiSO+0phOKTmSeNk2THZWJzYI9dbvrH8lvWG2VxotBgT85LRbDqOQsbUk6xRe/zmswK8G5YJ3ub4aWBrE/pPXcnUTNbv5y44jxwegnTo28scn42KmOtF30YLE7ZKILc7PPg07e2tQ4A3zOUCXw3eqZGukqEwDxEDuB5bZ4qdmxs/e3kdkqtA0u7HsDaDJGI4o8OUIL3kMY6/WYmYL2UBTDJkCJV+6P7LEbl9F6pmOBBofi3CpqX9TIVbPD2EunkMC8qpb0pd9n88mhN3Zos0q4hf5BrSKVRPBKFG+BZ6/5aKfpZSggP8emSFtzLni6lxmvE816mA1yqCp+/g5AbnM6RECzG/54wBGix6qpDJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(1800799024)(366016)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TUNgbFYdSnuhk3wjY9tHzPVgm5xGeTyqsT8xW5uBgvzfd/mjE+YZCe3zvQRs?=
 =?us-ascii?Q?IRpIbIXYo8zPDziQv1MaxPY02kTpbukcidODE8E7K5zl+WpIeoSVcCxihP0A?=
 =?us-ascii?Q?mku/jNnqTx8fnFnv9zWoH4MHUQVUWirhz+O2T4Jlz/8Au3lDTEwZLR9EyyEZ?=
 =?us-ascii?Q?elD3O3CfjUWibiJN1APV8oNeNQ4s1AO8vfua+4V5yc1AAQ+HUdJuCGzctduX?=
 =?us-ascii?Q?SxzZRWs7JUBUC9eXCYpzFthOAlgBV8gKPAK4WB2oTTJCwb7GZoJLBO1Asekg?=
 =?us-ascii?Q?Yv8NYYbJfGDc2w652+gCIXpq/jCYmGGw7WDJih5L7+4A884Csf5SJRE5iaYX?=
 =?us-ascii?Q?TxEeLRl26KF2AnrJ9LRZnRkg/AhmLmwaOCGWPCB0Lj4QC7HEA3BZ/5kgYgP6?=
 =?us-ascii?Q?c6uxrH692EwKDqYDT9y0xqBYBBA09Gp25QIOaNbaPr1HtvVwMUXgCIjBwPWu?=
 =?us-ascii?Q?gNaEaJ+fCq8H4k8pqpiho3+IPxl85OMKNkXczlO/RvVvuvG02R1IQM/VOyk+?=
 =?us-ascii?Q?/utynAXrzh0AbQXO5LVuoIzSD3dPg2561qJmFxKgcy25H7v7W8zYA54/xF3X?=
 =?us-ascii?Q?26+KFm82aqTLxV6lQYV0BOQjAEpzzG8dIbuELo/8IRBu0QSNjR/PyoIo1ljc?=
 =?us-ascii?Q?MzwlnQoCNNUJQA25DCtFN6Bm2pB5jVkYfJiJLHIwuw1SZ52yO8A9kHGxX4Ii?=
 =?us-ascii?Q?+X/WahLw2lAre2pF6J6SfX1COygRzp9eot5AjOkJCdczAhZbWjrKC1dnHJ++?=
 =?us-ascii?Q?KOekFZRLUMRGZkp25QYWlIOCWCvgxv0UeQ3tWpVJiF0/JfEdVWIZKHkj8TfW?=
 =?us-ascii?Q?lP7BE5qgFltFGnTEpPbNTR3y3E+4QGkI4dBROJA4CAf2aoLzVNhazF1kELjb?=
 =?us-ascii?Q?CJpa7KAH8cQkmtKSWMNwlZUuVC8oT6RbdIgvQ7u4BJetwc1YL+23WcryyUz1?=
 =?us-ascii?Q?JumjYxvKeBU66SrKlerJpSXvtTYzLcEtLZv7Ou5m7nBX1JH1MkymFfURAvKm?=
 =?us-ascii?Q?2L7eVtrR1t3BfZD6BqOSzIDKluSNzT6Flxjwoixv79f+Swbb29tncz6mLrjE?=
 =?us-ascii?Q?c1K4H7Ev2CdSahpz5gVldehfzSPyZP6sq+iTH34LwiJHXg3KN8DIm/J49UJY?=
 =?us-ascii?Q?6pSM5bQdZxDKOXe3Z71nCfMOaHuZXsvHLNYogBMUieRKNCoq+uX8bbq7jHoq?=
 =?us-ascii?Q?Iqmz+aWHzcee4q/b4i8DfWpdz3+V2L477gCmJkjmyoJeAkkUpQ+LHdY+wfyw?=
 =?us-ascii?Q?SxBinjJsViFrEINggmaHW1AxyEV+Ayp7LkNsczf1bV2/zE9GNd7gs7BDuYLd?=
 =?us-ascii?Q?+K4LCRd8NZ/73aB5fbDGbWUrQObVk4PpmliUakXrS03Z97MNuASuF2+xfK/o?=
 =?us-ascii?Q?cu8FFkQ2o0Va/SWxS/pj1pt9IC1ZP9N/Qq4ckAO1hM2KSZxwR0Oz1Sd3tk7o?=
 =?us-ascii?Q?W5FXcGUJEsf7hrXs/726U/Y+/gw8AeBggYGRgYcKXh+oHtIi5fKv94JNOA+q?=
 =?us-ascii?Q?X6neW4XPScVqiotijCDENcgsKP/ke3APFZKj06gmhnfJl/YaL3KgitO2sc3v?=
 =?us-ascii?Q?wib0eWicjeieY6YRNfczra1/NyenD2wlu1uRTd3cbEYLk3hqjWpiKDwDK7Ah?=
 =?us-ascii?Q?GTfbTWaA4yM/uN1QQBbiZbgumR0m8t54FIAgmnLUe7CZJKHTlLDAdegp/D5j?=
 =?us-ascii?Q?UA2WSRWwnbs2hHhd4hSxmnP4o3bRr7Y835mprAkCRsIWFejh7cH2p96RBrLA?=
 =?us-ascii?Q?xzoY3qqGrbXCAG9/KL93dah5e7ohME/sUnbGyQEzKw5Corh58qNvmp9smR0D?=
X-MS-Exchange-AntiSpam-MessageData-1: 79qHC/yChy/PBg==
X-Exchange-RoutingPolicyChecked: 
	G+GW/XrA6QzBQ6UgHWfslqOFHTk9YKX/RWvONb/ljVyTvINPqv64wXd8REys8AfPdzA9Q9ms5ptSPGzLqiT5w49hi1VVMYPGKteWcJC1uB+eXt9MW8UPTaNioVNCGdB74jmVOF9ac9mXfMH5HZrdsFVtswHwkmJ0/3RHhXIMgvh1UHusXLb6JzzACdD9ah2wuJvcmNqtveGoPsa67mAJL7hF04DZ1tiq6LneDfux2fjq6vgGXj6LVuypOnhGCxa6Fm/dSzvSYqppf0DBHDo05TMJIrjt01yh1x8WPCXJPG/0pYXUsX7gJSo4HrifKLtsDYeU42bk/+oEITczdSQZ+A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ccI8AjZlyO+gEG/YFNFiNyqZix2km69vfmuTFqYSGyQoogMElp5LeOenBMfKNZAO4qm1WbFPhTZzyXYrWe9cOpbGlshnyNagebOOEljrnMxI21TssHauWq8Fy1X9SZcXCXLK18Sf16Ge0jhmHzoC9PxKdJk8BNxIDCwBTRvrJCYvkll+kTgAMc4OC43gJ8N4bifs24g2ZpoD1JlgKxGDcbXYTxTdHU2ZQhrx65m0zOMcWQLiOGaj1gnA4MFFDRAp0zHqIRUHmgmHmEkKTl10BI6YpzF/tOnrWj118Qjf0wr258vyWpV5mphaBwh6w3QEiou374Q+X3sxC+qadN7b9XPT9C3PnnsK1HFL147CA5OvlysPEUq7gULIQSoADxIBukXOeCUKgh5NR2IpAQGMsbZ/1yfCtBfQCcrkI3BT24pZbdHQ/m9QbNbcYzFqyld7fQGEQZqKE/piAx1XAToemCHjadKYecrFH/2lhvWwuxx597eQYvlZkep/tHjSemgOPra1RVJF2hUUt8yWMkN8NulkKv1KoHkAAax1YgUa8+sxJn1VdXGbP7dU4cjHu6mGC5UlT9Zz8wzFkMQB9sbJjAWYX+3r97bZ21oTfA7gkNUKtSrgWVORb50IKCI1vFsL
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a655d077-291b-48ed-29d9-08deb64f0d36
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 09:06:17.6046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF9VobfqYV//npGn34YINhWlAhzBej6kejhwe11vUmvherw1OdU/X3NTjyy2ZPI4AgJdzY8Rs37YrlP5dSXJDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB2902
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate16-hz12 with 4gL5Hv2GBHz8smG
X-cloud-security-connect: mail-northeuropeazon11022088.outbound.protection.outlook.com[52.101.66.88], TLS=1, IP=52.101.66.88
X-cloud-security-Digest: 8996fbf0641c7c6011b9bc53a09e8fb1
X-cloud-security: scantime:1.545
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 09:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237433

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as 1.10.x upstream backport of [2] mentioned in Debian report in [3].

[1] https://dev.gnupg.org/rC6da0152595aabb569c88c6571d2fdf68e112ee45
[2] https://dev.gnupg.org/rC2d3d732c9bf87cc10729f69678dd9e6862f99fa3
[3] https://security-tracker.debian.org/tracker/CVE-2026-41989

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../libgcrypt/files/CVE-2026-41989.patch      | 45 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.10.3.bb             |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch b/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
new file mode 100644
index 0000000000..d9bc2d1844
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
@@ -0,0 +1,45 @@
+From b5ee371e621435c18a9a70e4982741ab65a019e1 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 10 Apr 2026 16:58:57 +0900
+Subject: [PATCH] cipher:ecc: Fix decoding a point on Montgomery curve.
+
+* cipher/ecc-misc.c (_gcry_ecc_mont_decodepoint): Fix the padding
+mistake and add updating RAWMPILEN.
+
+--
+
+Reported by Calif.io in collaboration with Claude and Anthropic
+Research.
+
+CVE: CVE-2026-41989
+Upstream-Status: Backport [https://dev.gnupg.org/rC6da0152595aabb569c88c6571d2fdf68e112ee45]
+
+GnuPG-bug-id: 8211
+Fixes-commit: bbe15758c893dbf546416c1a6bccdad1ab000ad7
+Suggested-by: Bronson Yen <bronson@calif.io>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+(cherry picked from commit 6da0152595aabb569c88c6571d2fdf68e112ee45)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ cipher/ecc-misc.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/cipher/ecc-misc.c b/cipher/ecc-misc.c
+index 6796ba2c..fd429a08 100644
+--- a/cipher/ecc-misc.c
++++ b/cipher/ecc-misc.c
+@@ -438,7 +438,10 @@ _gcry_ecc_mont_decodepoint (gcry_mpi_t pk, mpi_ec_t ec, mpi_point_t result)
+         *--p = *buf++;
+ 
+       if (rawmpilen < nbytes)
+-        memset (rawmpi + nbytes - rawmpilen, 0, nbytes - rawmpilen);
++        {
++          memset (rawmpi + rawmpilen, 0, nbytes - rawmpilen);
++          rawmpilen = nbytes;
++        }
+     }
+   else
+     {
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
index 3d49d586bb..44e4a39392 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            file://0001-Fix-building-error-with-O2-in-sysroot-path.patch \
+           file://CVE-2026-41989.patch \
            "
 SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
 
-- 
2.43.0


