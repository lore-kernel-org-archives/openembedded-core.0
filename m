Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEFFD58E6A
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 07:03:42 +0000 (UTC)
Received: from mx-relay15-hz1-if1.hornetsecurity.com (mx-relay15-hz1-if1.hornetsecurity.com [94.100.128.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155065.1772435017849908986
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 23:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=AmyZjAGz;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.25, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate15-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.130.136, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=mrwpr03cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=+ilLqm4OjGRLm9MSLmBuHSdcbBMu3TMFnkLB/FXTKMA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1772435015;
 b=a5CvGTPJZIBs5hP2SZcgYMP2GVxD0mPms9q5N48oB5QwLlw6j6lMLycbdwWRPVMSeb3i1I+3
 z7O+KBNyQJV1gXO/8s6+ssZFZm7ytFYuX0IctzA13AgMGaTAiEhmTSNSObDZtfZXHwIETHf+vDA
 nzSMmoUkS23/c0siLYtMt7Sx3UU6oCdrTU36yVx3AwW9KRW2ssGhZmKiURKU9AP3/ueTdCmwfiq
 hPU0yXi/4PHR1UOffwXOqcXaxQYI/AfqfvYEcjNGFqHYscDFZrGiwIb1IU5b020/QrYeSUWMT/T
 Vrould62/dkmn4FRflpCnbvB/U+fh0Dj5MvnA3nr5Qjew==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1772435015;
 b=mtdhxHvbKgm8jfv5ggbqUSe6RZ8OMlYxR4B2Lcu7H/LUJDXaE8sAJEFercp62oKfiQI+bnjC
 enZNmurJ5A/uN6tWQqQl693zXmjbNMZPYDMi1xDpGDTL6cZu7HvY/0I1XzV789Q547Xb33LHuct
 t+WJE6aGgB1+QNYwbff4GtwSmMdrL7UoQFRacgpEYUuEeourNiKiC3tWR3eBRarwTQN7QYF+cdn
 buDFLnAXX5Et07tjZq3ySLzrVNoMdOvuA+TiO8i5vidt/eRpTRRk/52L2hIi3dWup0mb/D75b/O
 gm7E1fOvsPWVj3KwCT2GVa/P5bTi0NAtwfSLRVtUve/WA==
Received: from mail-francesouthazon11021136.outbound.protection.outlook.com ([40.107.130.136]) by mx-relay15-hz1.antispameurope.com;
 Mon, 02 Mar 2026 08:03:35 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLI0Op2JRit6+Dn7ttRhcHv5w+R+I/vMnl4UxKkrqUGxcgWWucK1gno17VeCHgLiLZIm+QGYB3KYYZcDW02UdrPlCL/7QSPkGyrb15XWaA7N1eLsnioXxWkmOzSsjZxgqvPSv1B4mQaq5s3jeG6A9dbhxjKn9YyI3DTc50BOxTbMVuhZU5OTajnV8ulk/AhM3mFtZJ6XXSGQvuH3CThlpKFQw0UP6tToEvu3Z9cqb7k3tJxrJSAXOqIQJ5Kz+svIq4IoRl06kLIrj7Emwty1MczzXYWkb81CPQrSXaNZQBFIKcnvMdthUX21aWw2r8t/fTqyULTUvf8j35yO/BjMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ilLqm4OjGRLm9MSLmBuHSdcbBMu3TMFnkLB/FXTKMA=;
 b=zJz8Vfsp0gi4LqbRIbjQXBG5NBbRNts8sAWWgPIEky4X6DeIfXrLc2B1tCFyGH+jxQE3rxAdeoNVU7YZ5btg2wZ7ZtbML45sjCsfM7XfKP31B+yhHcE3Q4VnrGLdKC/xvjU0p7+D3wGM4s5LL+5OsMRtfOpDYvtu4Y4LONg/wYiVbRugrHsAlFvOJCb3t6pnevoCUy7DrRx8dKnARKU08eHWjjHFbt0LVoUM2s8OAPnfJl4GdGgrc10MaDJaIxR8+A3RoQFpxlBuLHV2bh3lnOmZObMXPwBPLzrDUKXNA5HLNMQ9CnyjT/wzHYTBeenR0ZzmXEUjnCVxGafgRJMNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ilLqm4OjGRLm9MSLmBuHSdcbBMu3TMFnkLB/FXTKMA=;
 b=AmyZjAGzjkUV/wnt6+YFT7xMa8B3t9zwiZvvzbKv0CvHb+wX4TziC5HqP5hHq3Kd7H5nsl5xSS/gE0nEKnFGryPmgsikOs02ZjNeF0vfLMfjwoW2TyNoQ8IAdFpQO9RucUNitbht7YCB5+rbiT6qG3jiIR/GimB9fKAKekdmEGoH5or4RDT+D2vQvqcY+r+hVTK6l8CSsuUYcdH5eH63QZGr4zB3lfs8xTODIVa0X34h7Q80opra7P52ujsIXNHNt6NOjrk+cE6GcAF+rHkeoSGBc+jcaTUXJVE9L54GB92t0ZiGUohLFbDNAeEsaygpCfBBSDmR6Okl5+YNwaBM6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 VI6PPF8E720A8C1.EURP192.PROD.OUTLOOK.COM (2603:10a6:808:1::219) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 07:03:26 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 07:03:26 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][whinlatter][PATCH v2] harfbuzz: Fix CVE-2026-22693
Date: Mon,  2 Mar 2026 08:03:10 +0100
Message-ID: <20260302070310.31474-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::20) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|VI6PPF8E720A8C1:EE_
X-MS-Office365-Filtering-Correlation-Id: e1df6837-f8aa-4394-5f9f-08de7829cd2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|52116014|376014;
X-Microsoft-Antispam-Message-Info: 
	Jj6KCqcSJmqF96XAL+ObR6DSCfV9G2DN2RPa5rxmjmgdbaQMAlLLo4BKzcXftO3h8pRZczYPTMPe50TNBMSPrRb0ztvSsYDRtn/tAISnGRREkdQ6Siet9NjR313oMnkNBMGdhp2o+QMeWRpFz47t63qdTzbVmPsnEGs+hXtCQzkC7Q7Q1806y+TsnmUq+pAyuwgPF/x8PiodcFozfrANV+jCO/UNN7KOfN4YNGEqn2pyIlNL1wg5jwPGkc38mIJAf/3NbOu00y0EK5gm3KRUOJ06JahikSb6PspoV15IeiSg8argLYRYMtXp9azAinVnxqSYAhBUZKEW1rdnqDR4qIxA6tFEjg639mHBliupydjDVV0hxFBFiMzl1HFCF+kYxRCVa5MRxMEBqCLX6ZyE2KeYyUXoceGL5ZP2pSRoaIuejncRwppI2opG5YCxXssL+XA2Aoqa5qj+YP4uQBQxNEOl7SB+oeB/6NovhxDAhKLBm4+kQh8wUXvpwMR+GDc8Ub6lV//MLgs18M0qWYLtbKBxcV+9P9dnxIJeLvxGapaBEb7xWMQxNtIpihvQjOYDtUiFNNqem17x+uCvJGL7s+fIomPtJBvUUl92VH0f6bmHCfbih5F3+ZNilAKBFw83GnRtYxnW4AV0zZHjNkj5l78u8ngRm0WQ9FxKgh7vEZiSbD9clYXPBO85QxxHbMxnMQk28hIutzCSXOGYg9+Pmrll9UuEon+Dg2FfNoA0UgA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(52116014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rC0jZw0E6JYEZ2ZXVl1eSKVHtH0br2aBmMWjnOeY6dhpZ9zjxNY7haMnqgik?=
 =?us-ascii?Q?ibjv4IvWV0s+IRXS7fBIskW75ss5WeLqa+PffDu554661uVuE5/LaC2Huijx?=
 =?us-ascii?Q?zZuKBVJrT7bOpVvYnHUqNQ0cu4d2vzsBLQxNcxcj0qMSplkd0vP7dPszaCGX?=
 =?us-ascii?Q?FKnz2NHjcQtCn2gDdq4Y9Jr3C9KCfW4j9CW/4BDEhcezA+Y8Ue9+W+Zem3aW?=
 =?us-ascii?Q?LZlzira/fX/7WrhCGwFDIhz0aHxecJcX4DNt8eO/8Te18Wqi7SPxrrAdXOJr?=
 =?us-ascii?Q?nCzffw1EHnmOtSRZ588gbrJZ90NkK0E+N7hGP838y9C0CT+Bi4vRuQEJSbHJ?=
 =?us-ascii?Q?uk3v6eNJRTOUkKW44+4Y5j6NKN68qsODA5j5kLXNYOI+mEyCUjNoaHe7nVNm?=
 =?us-ascii?Q?O9W5W+timeKSxnRj0x2QP+5w1pfuAZFf5k0RIpUweAKvaRnlkDHVzMFNm9PG?=
 =?us-ascii?Q?Hgl+KhbI/mLlFRm0dHTEW8iXRvqmvHLiZsait6QDUdTQ8J83IQovZBJWqyok?=
 =?us-ascii?Q?zQb3Zs1Qu0Xt/TpeewqP64EWVtwxD4xFcgVyTafbCzax+dKlslmBkhtw4nHp?=
 =?us-ascii?Q?Y7hUwzkIahp19sl7sz+/qSQoPORFxXUJpy1QJRg/1y0lG12WQXriWqG4uVBF?=
 =?us-ascii?Q?PvfuPbK3/Cwpxd6kXG4VXO+Z87BobSW+ia2Saq2qLCO5eeIXyeKmXVSExhtO?=
 =?us-ascii?Q?9Bj4GPsaJSpqJEMpYVLoF02nN52t0DaY3mNdIyjtzmGhPD6rA7oH+hsZHPqP?=
 =?us-ascii?Q?dFxNvApbxtC7TzUTP333oisn6pefG0nN2OLyiuk3qM+0ptQsIU4J8zZh57Vt?=
 =?us-ascii?Q?dXaGU2UVNp5aKs0o1k6h0axGn3xFaMjftMmSvg5QX6x1sxflb+ZiPpcXldVg?=
 =?us-ascii?Q?bKDvEGf2aCXv33ZaduPigoM55s8OTrbJiiMoFLXWlKgZO29HGXAFFdP9TX/z?=
 =?us-ascii?Q?G4VFrLkRLdbiKjyavpAm1jmEJmCIMlmSb+esl4xvTAiiCXCdw/FybvRYNdGc?=
 =?us-ascii?Q?mnObk6t+GikPvMbquc/UnzHD6TUZetKJ1dyzvGxY5iMcH2s964m0PlMltfgQ?=
 =?us-ascii?Q?fh54FYNtgTyzKtMvSKLHxWrvscaWB/8zQfW+7q0rA7soKdj75NUxykLA6sY6?=
 =?us-ascii?Q?M8x84A4bAARX35oDr3O4chO+VeUGcOVjVWg4vP6XFjkd+5GCEApFopFHpcpp?=
 =?us-ascii?Q?E+MrJutozdlsokjtZDp5KO4PxFAGbimGC6qCEgsbwptjIKFEiSZkiNyoA3Nq?=
 =?us-ascii?Q?wbykhLk1sXTmahyQgvdN2L29r7RrBN2MUzZI+D8tyWO+0z8nVrKT/MhzNX/0?=
 =?us-ascii?Q?igLsFSwXU9qV31XFcd109wmb557XW/YwVzyg360VBtwsiYbQJY4WNOAhe1o7?=
 =?us-ascii?Q?cVuEbnPlJT82bNMNli8LT3/aYKTIR9dh0FYq4zDQKyYQr6aPnQyed/q1kavM?=
 =?us-ascii?Q?2pseXgexnMAuURy5pDz5HUgsx7J86ojYo0T/SjHENlC4qc9R5UBcVQM+Tn8a?=
 =?us-ascii?Q?vo9dQJ10keB7t0Hr/EI1yRWdtValkkK/a6UW/3jOfiSG70trITE6NatoVSDh?=
 =?us-ascii?Q?JrAKLBUaPxSA//yOvqNthUR/5/e4uW9YPj4NAFUp3F5gvg0yGK1WeGyeW2qZ?=
 =?us-ascii?Q?w2SAav+SKrNOZ9vXKhvROkVJueIEYpclxrNtTNJ5WtkEfIeUrWe8g2l/kAyj?=
 =?us-ascii?Q?wuxCz4UkfkT8S+rF7wIGwR3GXLFd757wLqchuObIEsv0DqDljHQ44nAuXpez?=
 =?us-ascii?Q?sQA7nui2z+brPe9CxFdMXnLp4EQWJ28QaH2tE11e7oEg7mhvEDGwPWdSHL7N?=
X-MS-Exchange-AntiSpam-MessageData-1: Fmm4TRdFtNfPqJcMZm1tSJIBsnqAyp8Ug84=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iKoG6vwIhrVb7vufR1/dlrhWbCmAxnLQ1m/jB78yzT2X7dQRE5HRhNslgyMxWtbedcNsS5GHVvdaW2BzJU6kFBm+d/k5ByACqXE4qwZPfGKZGZSNoqhXO4uqHNRTh8xHvp1kSwIbWueGKk2pNmlnnAVvS/1XdgkZ2x/QmG5uwxbNyqGeoF9xNaJQNNeAMSPCaotnkM1XfkMe0+HcRu3BUWqnfON62Z8VitX6k/+7PEfumxRkQ6c7IE+xjOksoVidnAk3kngGKOcZJvYhe5FPMEmNoGkivJQo/X1cpXxe6U9uk58ehFn2o0UfsrvdKZoRI47kpjZ1++K/5mJMVovoQRA4p0klNUyRftyRjK5Qbk1snE4iCl76U8NIh8bEthE4aL7B02MZREdktYWQKTYB3a6Rw4PUm7/VBqKM/ne8AKPzvDivETa56sFS1Q9irtAcBEgY87kxjkoIw9haGMdimImc6LDQqNcMh5S0xOPo3gw/wZZSBppEmhxPgKLdGwKJWhS729RcZNQxVivnZjPdK/aI2vlLfWz1WeUvZA3fYQCn5RzSgLhW5xF4oFwbBMtzAk7JTPxKGyf0urknLqonCF+eCTZnrAbsrrsBCzhnawkQ97kvg+zd7OGFwRRi++qs
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1df6837-f8aa-4394-5f9f-08de7829cd2b
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:03:26.5177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laV2hCP+FPro10sjgtLMfzeqLVE7oi1xdB9WBn7bTo38/XwrAQxdQ9OOC9oO9X47abskuDEXRKGxP0ahwZlaDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8E720A8C1
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay15-hz1.antispameurope.com with 4fPVJg0YXQz3B6Bt
X-cloud-security-connect: mail-francesouthazon11021136.outbound.protection.outlook.com[40.107.130.136], TLS=1, IP=40.107.130.136
X-cloud-security-Digest: 168c17f7e37fd3ecb31f390b0ed532c5
X-cloud-security: scantime:1.266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 07:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232182

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch mentioned in NVD report [1]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-22693

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../harfbuzz/files/CVE-2026-22693.patch       | 33 +++++++++++++++++++
 .../harfbuzz/harfbuzz_11.4.5.bb               |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch

diff --git a/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
new file mode 100644
index 0000000000..bf821bb63a
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
@@ -0,0 +1,33 @@
+From 21c880d1154a5bcef2ef68c1687d286820a274ee Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Fri, 9 Jan 2026 04:54:42 -0700
+Subject: [PATCH] [cmap] malloc fail test (#5710)
+
+Fixes https://github.com/harfbuzz/harfbuzz/security/advisories/GHSA-xvjr-f2r9-c7ww
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae]
+CVE: CVE-2026-22693
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ src/hb-ot-cmap-table.hh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/hb-ot-cmap-table.hh b/src/hb-ot-cmap-table.hh
+index 294b2b60d..95a436b54 100644
+--- a/src/hb-ot-cmap-table.hh
++++ b/src/hb-ot-cmap-table.hh
+@@ -1679,6 +1679,10 @@ struct SubtableUnicodesCache {
+   {
+     SubtableUnicodesCache* cache =
+         (SubtableUnicodesCache*) hb_malloc (sizeof(SubtableUnicodesCache));
++
++    if (unlikely (!cache))
++      return nullptr;
++
+     new (cache) SubtableUnicodesCache (source_table);
+     return cache;
+   }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
index 9e0e42b717..2364dd7efd 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://CVE-2026-22693.patch \
+           "
 SRC_URI[sha256sum] = "0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa"
 
 DEPENDS += "glib-2.0-native"
-- 
2.43.0


