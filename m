Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8050CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:42:43 +0000 (UTC)
Received: from mx-relay12-hz12-if1.hornetsecurity.com (mx-relay12-hz12-if1.hornetsecurity.com [94.100.139.212])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7600.1779266558235803574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=l56CS/c/;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.212, mailfrom: hsimeliere@witekio.com)
Received: from mail-northeuropeazon11022072.outbound.protection.outlook.com ([52.101.66.72]) by mx-gate12-hz12;
 Wed, 20 May 2026 10:42:35 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PP+bkr6pMdMxVqgQfTJzDG+TOlUG1zJKDZZgHASwDg0ywSlwY2QbnOUiath73HM/zOXTf0nMDkjLbc8OCYhaU3rE+S/9TgdzBwsRtJ1SdaPdW+XkcbfvdJFH5ZTG2CAtZAvF0JW2O/BDdqZ/ntWMg6dxsZh89hrYFGoyNsZrREON+t4mPtyb0tYLacXy/X0lY4oLNbs8Z4w7OWg8oOanXq8m3BeymvP7h3p1q/IEKGpCOADq0Ujkmd6dBlnuWo+OkMTb/kxQwwdj1zc3n+vULqL8zKooEZiWy/uvaLScftuCXVPjHFsiuDW2F0KzP3L+EogMEK2GC62svr5ZmHxwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tanWFXqvvvqpfAWl5+X890MdnJJgUhNDWRZ6l9EYI4=;
 b=NyNcte4JpRHZUf4hxh9eJGuUCUaVm0GJtpUNRLbMmHujESMycMf9BnzBO65ebwnEFmQXvYYI3TRv1vVoWxamwh+4IbuqmBx4Y5dWX4DJAYua+nJvGTwk0qdmek5gXXIhnexuW0vJKYtLv+f8Qe3tPFCBPdm7W05xGRtlki+h5jH8ZU/xmknpS7+qt0RGw+gTQCujE+vQ6i2vf8oN38W/mHgUZ0CQhmBcFRgtSDFN3SR1vR6lZdh/diniKo3/hzUjdpDIt6+1/EMXM/WCz7cZGWhpMp3AK9UcGvT19b2e7+mIOTbw8Ai8yigmcErWhYJAZ4N+Ny/i0fcxCRri2c5U3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tanWFXqvvvqpfAWl5+X890MdnJJgUhNDWRZ6l9EYI4=;
 b=l56CS/c/dzqSacbuRi9tmlJZHBRSXN6aIN598dDgGbo1slfX36TWSwJ1zImTi+p0v0xUB3OKeRc7NDGqFX5w0gjFvSXYjhIlasaO9d//qQlJX47DSYvBdEQP9eg6wekzo12L4pGMusqwWgvobA4noMQsNMcrMX5q+ihGPy+lky6OPncdeFJmHCiVdQlpgbnQHyKGVTvAenPEdxtTzdSmZnWfDXcWiZjaxFhFVkP5dNjG4HJ4kawhqqFirYjuPX0iml9EwYVjeY9HJ6gkJnUHVtjQ0m9EljAuf1/q5bgezdUraWqLI83cDc0M61g6pYIm0hi7NbOVuH+xeNzlgeXFqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AS1P192MB1590.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:4a0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 08:42:28 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 08:42:28 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] libarchive: Fix CVE-2026-4424
Date: Wed, 20 May 2026 10:42:13 +0200
Message-ID: <20260520084213.3063069-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::13) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AS1P192MB1590:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b641b88-7992-40b2-d922-08deb64bb94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|10070799003|366016|1800799024|13003099007|56012099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	iBkqtBfAhnKFMfTV5SG9NpdJuM02M3muW8nTqhXQGwFyhDWvI/iL4p9VrkcCrYd1oXedDayT0UWNdhmpAi0F2g3hPGqAyVyrZ80y+119E6t1o42SLO23BE+6u5C6KmEmvcAwIRK6wYCllM1JJ+UWNsuYdOZsHBsGA7/qQt16CndM3TNh3VjLCO4r2qlxHFweBU73ZVOTDMW3wyx3e1C5YAidtGPnOO+J+RIa8ymFP5K5TZjOAp6nQjZAkJEQPNXt7SHylO4r9PZMd2eLLbFDzBcRT2gkw5d1+u/qB0JinozmFGuEKBsP/vxcAtignjambNIIPTcI7d5zg4hRWxPZJICyWVgbVs+0od4AwTpz4TOOIbDkmxqrUYlAErJAVi+/AjXTsmM9XNOmU8wrTiU/hbX/jDEILs6LQVVmz8P9NqXk4gm2kECupwxRtTiePHTGsZ/eOxPiJKsJcbmfY1HFS/l7rT5bpPribd4mV0mtkTOYd8gbdMOlIMM8T32TzfyfRFJOLOPPjYahvup3FJNgeUpUXTONvAGHRNit7qDzkvKd5oOCbac+UpseJhbqJ73fjrFLqIQ8U9Zr/r9QsdLOX/qR8ZTSWmCOf2S0kXTyDxYh301+H+Im4GwdHdbT46RXkpqRs9BlX6j+qj1ePWI4eQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(10070799003)(366016)(1800799024)(13003099007)(56012099003)(18002099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?emEPPjz412tOwggFAnsn6D3Yown/cL58FWVv4XGkCoIGh4HkgcolIC7fje5R?=
 =?us-ascii?Q?wHcyDme5wZ5um2TI5C2hkSu8vL6reJ3+9J8ZuY+OEy8ZunA4bopgW5dt5ed4?=
 =?us-ascii?Q?ihtxl3v6LXSGR7ws9csq6ZkCY0mZX6DlBZSoovFWpjmHBSMQWW0RXcCH8asH?=
 =?us-ascii?Q?bEKQhOzcg0VSqHJMpXrznvKkd7ynzg0JoKUCztX7CFYX6Xxuz0Y2HXOf4GUu?=
 =?us-ascii?Q?UoNzXv+uSV5B7cyMDDGUFoERA5Vn00FvX8J8OC+3Rghx4/sWRMBqd8zru70w?=
 =?us-ascii?Q?x19olFUq01InCepXfHFHMsEE5rPp4ws20l1qwqzdrg8XWlLMT177MN4qMW5Q?=
 =?us-ascii?Q?m2120y3cbWykGJmbrotHpYTD+ONwfE/qeSCpGpwr7snDugN4BYub+bZeZUZv?=
 =?us-ascii?Q?3AYsheFAoHFne6W8zwrmDJvoVbRbLEbyIHKXGe9wWXnM0ToN8CE4z2m6C0t0?=
 =?us-ascii?Q?U1FOgOYCJSEBSUMhrbHaJf4DrXcdjyTpF5zP1QK5aeWgu/32kwyZZdAyTE9X?=
 =?us-ascii?Q?ccY6wI1qi4mdPaPoC1kSJ83ncQ3SpRab8+8PthyZoG/9O0gHDLba/35QHOIC?=
 =?us-ascii?Q?vQWPwX1wKW/NuG7T6q+EZ4sUgDlO1siXPr2Pk+R9U5ZDuEGTKobzfEQv0CHW?=
 =?us-ascii?Q?Aus08i1uc34E6U7OveSlwWaX6OsYHKTVKfgkyqQILXlMzGvAdYmbpgOCB8U6?=
 =?us-ascii?Q?SXy5i5uLGGO1vxWw6lzHEdEiO5CIEJ7+UInhlZvYpF8hUOdEHl0a4QXhnZ3f?=
 =?us-ascii?Q?IiTlg5spzbCA1BDCgXKfwL++XUDxsmE63wURV/Z4ntYa0NxOSCC1kX6l/qSP?=
 =?us-ascii?Q?8uk8Jo1qoW8ZFIXg7IwDh69oDwL50yyKsDL7HnytrogGWdS4Vj5h7/u7H+hP?=
 =?us-ascii?Q?oHbAv4aFedxSFRj1OokZ1cFRXDzc0yHdg445DHiFj1S1TzQqdgjpA3snlFQy?=
 =?us-ascii?Q?gLB4oIY3nraNxAwbBbnQQQJMVMIFinYE7fsV13MN45xjbNP/VG3c+INDuRZZ?=
 =?us-ascii?Q?TwujEtZwJ7kHYEuHF+NCuLzNWieKo4zjOHJClA4r7emmgpExPHw8ww+7kgpx?=
 =?us-ascii?Q?p81p64ORj9jMUslG+7TQnWUXDHLHJMDasfBDfN+hUpLnU4ac7vcGS9S+rZi6?=
 =?us-ascii?Q?88y1fONVdW5oNc9axmoS6p7WfGz18fnyMTmSPAuynBgceaCy/3rhhCEDuNaD?=
 =?us-ascii?Q?dHpbhtDhPVNXt4iVQPilQ/2/tucyQXtrVNPNF91BU+fyCxfgwOfVl+oDXSxN?=
 =?us-ascii?Q?CAlu8s4GHqYJQ+6X7/h0jQfdfqsUow37SVfU3Nh8eiaY9yMXq4XP3rtTqTnu?=
 =?us-ascii?Q?FWgjnk/jAf48OWY6TmrWLXVVvGIuA3QnhaOsnkzI3FLvpxId5cOJ/agJxQpL?=
 =?us-ascii?Q?qMXHNGtTlmncl0n/DpQbDNUTWnZqGRXt1zdI9hFERtfxarFhnzEfPIXpvySy?=
 =?us-ascii?Q?Y/qX9mAHxuZ0yyqeHI1g3Xo+qGbq24V2h6bLczK4Yba0vHVsh44FWY/SE6to?=
 =?us-ascii?Q?i97UFrcLNOxIG+BIkTJWnyuO/XBEMyLzNVjpg0Y77oiwFsVmA+mAs6gBoTBK?=
 =?us-ascii?Q?aCSuK3Z5Tb1gPN17L32YYk3jxhS8KC6zWQ2tKswnUHXQ5FSG7/BJYob+lm/b?=
 =?us-ascii?Q?9PaSE4e4Yy/L/LXWmfUllXXimkn4KWkNI3bJW+NOwCFMTebt3r8qHUu6WDXH?=
 =?us-ascii?Q?vF2iBl45V+cD/H0rXNFfTRzW0+rmI+j5lT8YVLyH2vhuprk7UQ+j9oiolm5d?=
 =?us-ascii?Q?jXRp/nqDzH2OLcGhGBmcGrd/8rQkxdMT2JGRR/Bz+jFB8MD1PG2ieP5c+6Jc?=
X-MS-Exchange-AntiSpam-MessageData-1: L5fUQLrKh6iGXw==
X-Exchange-RoutingPolicyChecked: 
	KCiPWnZ1dxVqOjGX1JzKPMk5sBl0D35R4vBjHORMDn81hnzW6Tcnc0QyBg2c3NJTPZWxJRTiDS1HuK6dBHxC9dOHx6bUDg/b7zdFj50qwJTDoGnge3HTE0y83OHX4hkN9hhTl+YFzGSdTCYArWfzU72aFMF00jnbuAEOnKow2syQluPVf40KmDuNzxDJ3T9yKfD88pe1PhSRRgVFTfETmYanP1TkSfnfBLW8eaASV9ZMupETUAuC0uE0SdyS9+jmCkEefvEY8gLYOoDzVgVf4jrQVmd0qzYeWnR4Qmmn+JiWFqdAdOCXSXbIdvwMayIvgp/RKSRmDxEj0ol2A8SOMA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	J1lUkN4vGKUYz0cCf43qeGHzqvnsxona7HXVnDOdAMyCbPdNTMwMiebYc6dItHELH8TWGEmrCKGJlQ1SGASoYMLqzG3OQ72lb83o0EMn6NOroRP0k85Wef+TZH8KSECotcDlaRLTZzcZtzMde/+Lt9fQVkMbf1xuSvaJzlv55gtfsqxv1C5LczjiHCVcteZD+jrEF8h4uDRxPrbVqxgs3C5JocJW8aQB0ylWsFPPObcjwJ3qtlMiCc2GuMj44iJGfV2uw2QWr2/BLFwoEkKm2mJZV6P+TtsFyQiLvv4kMPV8IX9W63gQw19t3w/ieRgue9b1HXMOiiL4G3/dOIIKn7itigZhviO8pPjQGmKovBcCR0wOC0roD17zCFpKemkjsYbYooO9uGULitjwB4UHM4cN7q0E9j7x/WaMQGyyFUHJAWhWWau6gkmHvfFnQa25iA27AI44CqXUekMTGRLi7xPwEVL7U3m2zjlVe6WN5cLOrJ99lax8c0DiAs7ktEc4MZPgn5xOPb9Uv2vT5kDdlbhYUL2de6OiQrlVr0UEmqMQkpSrVsCUFAgNeuIbdLamzec3cucr7eIQ5/vVVoLzw3/fVL8i+NxzFEXEmwhh5c9++e22YgQUsCPJKTPnxEIa
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b641b88-7992-40b2-d922-08deb64bb94a
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:42:28.1493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3P4sQFuh5gQQhErcFqarwffbs+KPkbjR84j6zL9j/ogehDcuSOvk6bc5DBKsV0J4Roz9U93KEvJQ9s+cDFJvkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P192MB1590
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate12-hz12 with 4gL4mQ0LLFz3cmlh
X-cloud-security-connect: mail-northeuropeazon11022072.outbound.protection.outlook.com[52.101.66.72], TLS=1, IP=52.101.66.72
X-cloud-security-Digest: 1ebc06e46274250fd6e3b6802a2dc1d8
X-cloud-security: scantime:1.503
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237431

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patches from [1] and [2] as mentioned in Debian report in [3].

[1] https://github.com/libarchive/libarchive/commit/d379dc0b2976b7207d1ad78f5ed3eb99a5b6d375
[2] https://github.com/libarchive/libarchive/commit/e1907c5832b6489c7b4198b0825f857c93a03c10
[3] https://security-tracker.debian.org/tracker/CVE-2026-4424

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../libarchive/CVE-2026-4424-1.patch          | 61 +++++++++++++++++++
 .../libarchive/CVE-2026-4424-2.patch          | 28 +++++++++
 .../libarchive/libarchive_3.7.9.bb            |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch
new file mode 100644
index 0000000000..c805092746
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch
@@ -0,0 +1,61 @@
+From fa32110f851b121a3e1c19fda347e86396fde2bd Mon Sep 17 00:00:00 2001
+From: elhananhaenel <elhanan.haenel@mail.huji.ac.il>
+Date: Sat, 7 Mar 2026 22:32:09 +0200
+Subject: [PATCH 1/2] rar: fix LZSS window size mismatch after PPMd block
+
+When a PPMd-compressed block updates dictionary_size, the LZSS window
+from a prior block is not reallocated. The allocation guard only checks
+if dictionary_size is zero or the window pointer is NULL, not whether
+the existing window is large enough. This allows copy_from_lzss_window()
+to read past the allocated buffer.
+
+Fix the guard to also check whether the current window is undersized.
+Add bounds checks in copy_from_lzss_window() and parse_filter() as
+defense in depth.
+
+CVE: CVE-2026-4424
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/d379dc0b2976b7207d1ad78f5ed3eb99a5b6d375]
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ libarchive/archive_read_support_format_rar.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 88eab627..b23be937 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -2503,7 +2503,8 @@ parse_codes(struct archive_read *a)
+       return (r);
+   }
+ 
+-  if (!rar->dictionary_size || !rar->lzss.window)
++  if (!rar->dictionary_size || !rar->lzss.window ||
++      (rar->lzss.mask + 1) < rar->dictionary_size)
+   {
+     /* Seems as though dictionary sizes are not used. Even so, minimize
+      * memory usage as much as possible.
+@@ -3104,6 +3105,11 @@ copy_from_lzss_window(struct archive_read *a, uint8_t *buffer,
+ 
+   windowoffs = lzss_offset_for_position(&rar->lzss, startpos);
+   firstpart = lzss_size(&rar->lzss) - windowoffs;
++  if (length > lzss_size(&rar->lzss)) {
++    archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++                      "Bad RAR file data");
++    return (ARCHIVE_FATAL);
++  }
+   if (firstpart < 0) {
+     archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
+                       "Bad RAR file data");
+@@ -3266,7 +3272,8 @@ parse_filter(struct archive_read *a, const uint8_t *bytes, uint16_t length, uint
+   else
+     blocklength = prog ? prog->oldfilterlength : 0;
+ 
+-  if (blocklength > rar->dictionary_size)
++  if (blocklength > rar->dictionary_size ||
++      blocklength > (uint32_t)(rar->lzss.mask + 1))
+     return 0;
+ 
+   registers[3] = PROGRAM_SYSTEM_GLOBAL_ADDRESS;
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch
new file mode 100644
index 0000000000..a5c6ba2d2b
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch
@@ -0,0 +1,28 @@
+From d696008467844efca026bf198a8814a8647ec2d2 Mon Sep 17 00:00:00 2001
+From: elhananhaenel <elhanan.haenel@mail.huji.ac.il>
+Date: Sun, 8 Mar 2026 15:29:46 +0200
+Subject: [PATCH 2/2] Fix -Wsign-compare: cast mask+1 to unsigned int
+
+CVE: CVE-2026-4424
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/e1907c5832b6489c7b4198b0825f857c93a03c10]
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ libarchive/archive_read_support_format_rar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index b23be937..a28a6cba 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -2504,7 +2504,7 @@ parse_codes(struct archive_read *a)
+   }
+ 
+   if (!rar->dictionary_size || !rar->lzss.window ||
+-      (rar->lzss.mask + 1) < rar->dictionary_size)
++      (unsigned int)(rar->lzss.mask + 1) < rar->dictionary_size)
+   {
+     /* Seems as though dictionary sizes are not used. Even so, minimize
+      * memory usage as much as possible.
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index de9682400a..c167b164b4 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -47,6 +47,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2026-4111-1.patch \
            file://CVE-2026-4111-2.patch \
            file://CVE-2026-4426.patch \
+           file://CVE-2026-4424-1.patch \
+           file://CVE-2026-4424-2.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


