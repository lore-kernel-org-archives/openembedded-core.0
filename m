Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F3EC982C7
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:45:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5557.1789501526272473796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HS9wZTf2;
 spf=pass (domain: est.tech, ip: 52.101.66.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWoaufBQFBpkAK0pHaex/dnaqCbQdVShgRfqsM+tMHYRsbv693MDC3t+/XWLea3JOj1rYSJEEznOfhLnbDSApxgJka9WEe5JGnXIwdCg4U6xoY+jJ6uNqwKHJuDdr272Bg8OOmbabEwJlBTGUjIpek3F3tYOVwMxmlIGn/BgOYklWZvZnAeT/xpPRiUdvX9XorZV+E6DaTzZBqq7/MmcKYn4y5jEp/auZDXWE6xkoPBaqrXXKseoPwHbzykaPqImv0RhVcpB5GB+LAATCY75legjVXUb3F/4StFw9DfaFB2Tzjjor2TAGIszqiRwWYCWLV13ldRLoKfemNf9LERSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yTSSqyQmLERakG2YBE1ox4fQxaWgVs0cM1VBi5WXyI=;
 b=oAsO/GkQ5hw7u+NNrxuiSP+hZkDZ3vX6EmHH7e9Sz/yWAu9LMlSf/WVmzFjhHINulXrZ6hJHTqCsaCM3xiLuq+NAUzCoxkkWHiK0dW11Cjy7l3iEvGL6ZdQRWM3HhB1tXy6eT3fMVXLMufuyNvsOBFOmumJKsuI+i4jXd3thAXNqT1IXb9hg94b/L7Vu+ek+XoB1ZLL7szMkUW9yTViPIPY18bmIT4R8aUQGd6MtpF2V3uMPxrCjmBJM7DX+glpJMXOLQxH2RG3yAynxKNYZLzl3V/A2HVRDVu6MUNo1UxQB2b8BE17g/ceeSlO5wSxJiFspJ1rG6T9p679chz8qtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yTSSqyQmLERakG2YBE1ox4fQxaWgVs0cM1VBi5WXyI=;
 b=HS9wZTf2IpLftyQJt8s5lNQ8iiGTQFc8TpVvgY3Ie4sAN39xlGOGCSXTzEt0dA/F4FoBGiDtlxPPUYKRGF4Mq1TcKRt97Pl2Dt1s5RTzRFxebbtbQavBooQBYXsdoj4pImNr/wrVkHcavZG+PbP1iKCVVfjzkIRE2pg52C7RpSoNtbPFvlXwGT9lZ/Hna3+tY4WJnqIopLotIHaKiHR+hMRWZn6T9wywMEnP+rXF+VBNK9Oiwdl8eU4ThwQAO/13QBrS8OOzbFGPHRQTj/ZfhkJ/jXxUb9gvjnBone3aS10e4tw55rGBsU9fOip8+eg4R0PuMZKrYFqa9a7EFKXMog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3172.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:45:23 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:45:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 1/7] libpcap: Fix CVE-2026-0799
Date: Tue, 15 Sep 2026 21:45:14 +0200
Message-ID: <20260915194520.45847-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0317.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf3d3a4-e13f-45d1-abef-08df1361e21c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|12006099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	E2wOl+j1kSYxls8y/Ggeq0mRchH/3a02B/rABmDCZJbwI+jygM2FSPdZj1BD14F0Et1QOy9thQwObynYh4eRZpXnji8FAtlXtcTxhcVAWAljdC7pQK7/pg9Vt5BqlLQzm4C0/mU9IjBL8fBJdI02unUNWxOCLVssI0l7DYTlNrY7eeXHwEH5QymGwl4GAgSiW8DQn/HgV/uKVdD8ohpqvoz+G0NDcg45y8b1MAymjMCs99jC5CWnNERyhufGfeSpGuC+eG+7pOVgtR0Dg4WQf/J2PMVL+vUiynUQcPyr/Zbt52jngQmEr56QHz1Z1UREQzV+dFtH7NuWwp91V5MiZC3sZQ6MTYWB9RWu9vfZKmcApSStoc9ZMHW9WHn/cX8OCiKunNrDJrwK0XLozTaEqBYJRaBtfbyTcTvxkCZMNrt+ywH37eXe046rbi/PY6+MGOC32c/7VNs/6uPZZvtUWarz6dexaE3GbheK9PzV1++IcAWr6rclCOOW+CmiVFar2WUPFznInnkdSF/ZWDrdMpuJspEroEx6F0qa8y5DQb1sh3yfv99RcPNnHSYoepio/OMP7WK2w5zkdqPFIFwHnjaA1P6InhV4HKxFTPi2WwdVIDpajP+h1qYpmTjA1X9D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(12006099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qk2cEAK1Zw8DBmImqvgnb3MpMNBoGgAcDKXuioFmS7VhRmATaLtx87a+c+jU?=
 =?us-ascii?Q?ficRBipY7IdTuJS5G/HKhN/xFB7w72YatbIqZba+9KHttKrOHOaORXkmA2xP?=
 =?us-ascii?Q?d4zsp3HnNvSsatGN5UAiHCP/6C+aQiZuBVXOPC9SSfkOLXdnq+RgBwO+9krM?=
 =?us-ascii?Q?SxX/4WAqnnEm1GuEvE6PlAiNfvJfm/AnQFxrJqnm3L/1aKQ892GyNcVeGZQs?=
 =?us-ascii?Q?FQuaT0NuKNkmDQ645bDlykP1pYzJEofgHZLksfhZnfr8jlXKpPaxEw/tGObY?=
 =?us-ascii?Q?umvh2fdReyqVxGyyyfi4v8u0dFc6rIeAgxhc3XzO0oL8HpjwCd/lXhtYYobP?=
 =?us-ascii?Q?IIJg6Oj3FSMFaFhNiD8dUtl4aftWi8r3dycYO+4I9BjRniyP0eN5emECO86r?=
 =?us-ascii?Q?Mbol5zntFKTEekdOtpT0jyTMp6BnrsWU2oqGG/Q1sHFNYet0/LEH5ZAQsQHs?=
 =?us-ascii?Q?9FL7VrIaQq2exGDuiB02YnWeWS2Dg5nuC3/7a1/SFYeYL28ZPV3GVYHH58mE?=
 =?us-ascii?Q?dKbT/zf/3APR7jDWHZkzx2ul9U0I3AfX/mXyWfVE5DOVUsr16pRsokjQQ9N4?=
 =?us-ascii?Q?royICMjpfVE9vImMII1z9d3D+AnbQ19ITqBtbJYgcy7K6PTN0alJnCHg8M3q?=
 =?us-ascii?Q?StMHzjIV1s2Ew5+Wo8tOvjf3rxfXf56Y9+TtS4IcnwqSNnRsax0VkO8vQ/Yi?=
 =?us-ascii?Q?glIXZe+iC0b+pqfoVCdq7q1N7VzdCHHQEMxKXdzXa/QwT8B9yxJbhs8Su+dJ?=
 =?us-ascii?Q?2Y8s1PSaqGZXM/SZaBy9JrrErZhO/te1hKyXvQazBKTl8F9vOFV2g6/xEj6l?=
 =?us-ascii?Q?I1nBy6TxN98z7UWtvSSM3lb/Oay979cZMv7ptdcvBqd0xFf8ZaxBRlLExuaU?=
 =?us-ascii?Q?+JAtYiAM5HbiNFoF/clvlg7uhCKvNklZMP5Gq3zp0HMpA2O1Wmw1YpmdUw1R?=
 =?us-ascii?Q?tZOlhy1VaX8b0YIr1vEsVpyjQytRIyZsCNE0f8SnxIC69DHjCi5aKV6kOnXJ?=
 =?us-ascii?Q?pt52OiGliFWb4C4UORCZudISZhcmS4yL4sfh5aZGQ49/+SZDgDLPSRp+5A9j?=
 =?us-ascii?Q?evVrNwXLS3bpYcvmTs7aF7SW08YwG0UjKe0CZFTobB02QSDZO5xzxGSRXliz?=
 =?us-ascii?Q?YAuIM+A0njX3sanLdA6vhonlvAdyihH0msO7t9sVb6ji5oVIdqWdBk8/F4pY?=
 =?us-ascii?Q?GsCoBz5tY10O1pIVs57Ck9JYKWPoydLBRMsNzSusHume0RixmvqNdmtA4SKi?=
 =?us-ascii?Q?4IaQm4edCErHfTPYnCXT4U/fNa+7TO/IGUpwhlOA6rp5fGHGDFiNd2Fl84VK?=
 =?us-ascii?Q?Ae7tLjNmmY+9x3ZWP3JcXJXhta2cYL6nc2W/ciuArGQDng/Z1GcRPgCGUOCv?=
 =?us-ascii?Q?lwa225FlXkIUWBt27LpnDlwbOmRWajk7jrUPUhdamD/mefNyZHZ+/zlbI0on?=
 =?us-ascii?Q?ThbSEg6iUJzpryy92WFABxth4aKq3L6Q1SYOfF1Qo4VdQMvlf7HJlkSdw2vp?=
 =?us-ascii?Q?RTvZHUtwnlejDxi003JOQDbRQC5n1kZyGP/jL2McARRImeae5Y6XFzRtITGi?=
 =?us-ascii?Q?XwY6K2/y0XVxad2dCCk07X1WbX2d7zIAsQQP/GIhHBNY2ZxFKX6SM9/udSu0?=
 =?us-ascii?Q?B93VpAIoGY3Wr4scYHsHYbKgr81xkEcUSOjQAknjjPX6p+1FsnP/fkBgzYYA?=
 =?us-ascii?Q?Wlf9p4BmLfNUNqAhK1qKli9moKRt0xeWddd0hhoHxbP7l09pmvQYvTcbVoQj?=
 =?us-ascii?Q?gcosJ1qvFQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf3d3a4-e13f-45d1-abef-08df1361e21c
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:45:23.7322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmF40FAqC43iKzHOfFCsWWb01CbpJ7sjLQZFCzypQgY2ITjkOUOV39mUUCZPBehqNVYAgOt3ZEnMn7wpXunrgXEpe/wXScaSHfBipWnOOko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245892

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-0799
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/48e896=
0a7108e9e828f9d7bdc7e97bdab841aec7
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/01-CVE-2026-0799.patch    | 64 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0=
799.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.pat=
ch b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
new file mode 100644
index 0000000000..8651079d0f
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
@@ -0,0 +1,64 @@
+From 48e8960a7108e9e828f9d7bdc7e97bdab841aec7 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:33:41 +0100
+Subject: [PATCH] CVE-2026-0799: Access M[] safely in the BPF interpreter.
+
+Include Security identified and reported this problem as a potential
+vulnerability in 2018 (case reference "I7").  Their work was sponsored
+by Mozilla under the Secure Open Source program.  The vulnerability has
+been independently confirmed only recently.
+
+The current revision of pcapint_filter_with_aux_data() can, but does not
+check whether a scratch memory register index is valid in the "ld M[k]",
+"ldx M[k]", "st M[k]" and "stx M[k]" BPF instructions, and assumes this
+is always the case.  This holds for programs that have been generated or
+validated by libpcap.
+
+However, this does not necessarily hold for programs that come via
+pcap_offline_filter() or [deprecated] bpf_filter() from an external
+source and have not been explicitly validated.  If the interpreter
+executes such a program with an invalid index, it will read/write the
+process memory at arbitrary locations starting at the current stack
+frame.  Depending on the address, the memory layout and the OS, this can
+result in stack buffer overflow, SIGSEGV, SIGBUS or other effects.  To
+fix this, in the interpreter reject the packet if the index is invalid.
+
+(backported from commit 569f8fd3524192acbabf93c9cd704471bb38f84a)
+
+(cherry picked from commit 48e8960a7108e9e828f9d7bdc7e97bdab841aec7)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/48e8960a7108e9e828f9d7bdc7e97bdab841aec7]
+CVE: CVE-2026-0799
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 8691d0d1..fa82d1d0 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -219,18 +219,26 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			continue;
+=20
+ 		case BPF_LD|BPF_MEM:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			A =3D mem[pc->k];
+ 			continue;
+=20
+ 		case BPF_LDX|BPF_MEM:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			X =3D mem[pc->k];
+ 			continue;
+=20
+ 		case BPF_ST:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] =3D A;
+ 			continue;
+=20
+ 		case BPF_STX:
++			if (pc->k >=3D BPF_MEMWORDS)
++				return 0;
+ 			mem[pc->k] =3D X;
+ 			continue;
+=20
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index ee7d7540f6..692fdf606c 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://CVE-2025-11961-01.patch \
            file://CVE-2025-11961-02.patch \
            file://CVE-2025-11964.patch \
+           file://01-CVE-2026-0799.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

