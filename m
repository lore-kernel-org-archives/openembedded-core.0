Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A2CCD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 10:09:10 +0000 (UTC)
Received: from mx-relay18-hz12-if1.hornetsecurity.com (mx-relay18-hz12-if1.hornetsecurity.com [94.100.139.218])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8898.1779271746147117791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 03:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=CiZsOrdA;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.218, mailfrom: hsimeliere@witekio.com)
Received: from mail-swedencentralazon11023096.outbound.protection.outlook.com ([52.101.83.96]) by mx-gate18-hz12;
 Wed, 20 May 2026 12:09:03 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGJvU57eZGkP8hFJDuBKx3tXbh9O6RM4YNOoqQOjznOXDw+oaTHyZCmG4DoJvadDwF53ySB6DmGqlVScAKXoRAJxN6s8dOzymx3BqUbBsg141X9iJEv/Eie14r2nU/y9uWWMavxnd38gLf94WYfH3vOsqsWsPpS+ovbe3q8JC2il3haCkRtx2ZTq2MfbO6E5UIbVDejdEBa0cFx+ISXeVrlDQxZeGUGc+UuGpnG7WC0qUJBNldwrNmzYQHdJOSyW13ZyG20s1x5Z7xOWc6IzrQs9BbWLN2RnfD65k6SmQKIccJXhhh+Wo7ed38yjP/BV/d0dGdzEjK61gTPLrTMSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJrDf5kCn4RM5ogjOEO0DBsIitWyn9trIU3DfCEjFcM=;
 b=GD9ISKPxJYIZx7sEv9CLsJ6/EdwQuoClP/bYYXZoB/ahNBWzYDiX9YBrijEt20vXPvOg+khmqK4fhMQWfYgveTf3kXBI7aXdb+HX65UcnKVGi7EN6lED7c3/GaK7KDgv3enu/Oyd1+Mhy2agHrru16cwfedvHgm566p2YlGZBbWLlO725FTAALkyjb9DGl4kBylGnjzUSzXLQO8n+CR3Jyz08ltDSNgH+YQA4V5aSx0Yi1DpqzNj+Vd3zMNTC785+3k707ckPN1UnGb/Q63OxFOn+IqNWQAsyLim+spLMkzJxOINghdxpAAJOSXXH9nL7zjb6iOJCH3Q/9REqjSMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJrDf5kCn4RM5ogjOEO0DBsIitWyn9trIU3DfCEjFcM=;
 b=CiZsOrdA8j5BRpf37L/JX6qtDsa+c3YOagH5xgm1Os43dUJbed72QTSlHEYKPplCpBycveYfG8N/zUKX275RKUK/1mzkwlHVX7UtxzAJz+KtCTDMfENptYtW+tRGUCN1rZhVtwwsIgl0DVYd/N4cprETQgphxH0ITWK6o5Iv4GscjVGXmRmrnUNHk3KpoUmkNTi19qD4Bbt79eC2drkpuRqnob2Ef4v5NFZdFdmZWJN0X8nYdjv1vZzmbu1i6cI3w8VNz66cfmAZs0dtGIz+Er7tVd5Hlow/J975Lw3PaZhIyCTJIx6rMAd78sEgkPvyIPkknNWuVtYIK3DUfLVSOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AS4P192MB1648.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 10:08:57 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 10:08:57 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] xz: Fix CVE-2026-34743
Date: Wed, 20 May 2026 12:08:48 +0200
Message-ID: <20260520100848.3096463-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::13) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AS4P192MB1648:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a19ac1-6b8c-4492-f0d9-08deb657ce40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|10070799003|1800799024|366016|13003099007|56012099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	pmnyLXMQDw3TlM3rj1nBduMHsHnLNZHBM9fxzrAqB29jB4IWs5YfiVwwa6/ULO6bOGrKQ3O51qoPkwCYISd1R0QyyKNMbK1x2+sJAUKTfkEGMeSzyiw1HWx9s3scL9kX7KvTjOjlR3cv0f2Zsd7WX0LRfcA3O3sM7Wif4bIjespTq0xWWGR1+cTiD0ROeqNZ8xCXDiglB3fouSU22LUYVfDmVTlcmu3Z7rK4RApU/BQDVktMapvqOhzWFqAk9ogEUHYBXRT77+gisk8hNOAIIwSCQslyzBe5HTUNWkwWu7yPGUhtoINputZcR8MUKuiG91RsijCGfHq/4ZB0wPqPxyYy5fmkdq8mnhz/WifGMTiQ5EF0dblk6s3jbJe+/IYKrzxV34WiY/83rZ0X0tcKg7X09Nbm/ouDjBEBTrqoXmlGHRatC3B+W66X7gW3BW8/quD0pc8OYOmggd/1+hRExUnAFtmCnLcpPH9RKcxapsC/eT+mchZWs5pJqsBj9dl+lT0V8rXrbcnOd9w7PY0sWOdKCxFqBLemh+2JtMo88jP9GXNyBAMzT9y986mgV170dJ0XQK8y6OlSGoF1gewGF8KKQ8vH+CJvGY9hnh9U03zT8faQJygM6k+Mfw4VzDDzp5VwolW+gdE+wBbf7CkwLWSYj4geM325cHeTaJCDZ93yfrmXXLzEUdAz2Xh/IyMAFjRTGdfvbRlbfs/UTAeWUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(1800799024)(366016)(13003099007)(56012099003)(18002099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rh0IPS8VDEmp2GSxRdTVCtTdbPeUA6JfWNdNbVg/yNEEc99RP4UZCItaI+5m?=
 =?us-ascii?Q?a9+HDiXIbJZM+u/vrhz05P7j43zyKlHOi22fZqSb1r4aYY+a5nYRPsJ3y7tB?=
 =?us-ascii?Q?oaJH9eAzwzegzEiic6UXb7tMx+/TgN6PpXimovaSfdmaimqHzqOl5QBYNlXS?=
 =?us-ascii?Q?DAK2YxMELY0ZDhsPDz5GBN+LmGeVk0k7Px4I71Qx5nMDit1IV3eWcd5CvTiJ?=
 =?us-ascii?Q?ug8X8Yw0movr6E+yz2x3VQWTUaD8/I4MmkPApDQa5Y8CqHLnMuRNMd9DuWa5?=
 =?us-ascii?Q?6THFMEDZCGyK6Q12dXas1CI2+3NgqzAwgNdsmHd72xGMJTScwG5Eal/WBrQ9?=
 =?us-ascii?Q?j5nJz2KKHxoZVqUoBXhrDgyxSleNKajTzSn/X+UC48aNCUUsgqUVHFUTasjP?=
 =?us-ascii?Q?eivpfqlXiOGb9gbkX2NF1SGXGbx9xsMyivBQ2g+0GwKG2oEh5HLfXm08YKJ2?=
 =?us-ascii?Q?Yo7giqbdsgLZsQPwDQ0EgOGS0p7CkHBNf2qb1LU5ZrK/Wl+SIHS1xPWOh/3t?=
 =?us-ascii?Q?YbqAZJvejgqJw8osQWNdo0icW7SYiKM+HBzV7QaNsPyKDk+ymL3fZbkLXgFl?=
 =?us-ascii?Q?vjiuWMHkgu6b3jFtH58d1UkxR2xSeMwMB741CKgapNi0eNyV0WCtmzu0+VIF?=
 =?us-ascii?Q?aUbvCGAYbZUjVaNoyPFE47B2o6pLo4IMpMkQfDbuMOgQ75zZqpZY9q87Kvca?=
 =?us-ascii?Q?34bnmuuben9fsHg3Csyq40CDSNFgOGJogbCN/GiZO9jVncrC4oKeIVfOMmmj?=
 =?us-ascii?Q?RLwHNOSwmJQQ4soLn+yUaSmRzzDZPj0tzCVjG0f7C9NFZ+snUmfp/l/WNIGX?=
 =?us-ascii?Q?PpQKHyBl24Bg4x2UH1FvxvPXGx5DsnNamHgqU+gH0Y2d0UGAAr0fuir5i9Ly?=
 =?us-ascii?Q?yrtNg7b2IwGLqt6rUaJg6WKB4yYGRRYxdXAmtpkkgOi2yGwXEW5wZN+Gd6b8?=
 =?us-ascii?Q?NpTHFraJM3Il1AU99mg+xdKSW/0nZckFqClR8dNzjmzT9INWWtxAfhZ76TVA?=
 =?us-ascii?Q?4zPY5aXoXNu+e1epKNRywtDzCGpqTLnQ3w8HK2CqMvuVn2Hx6d20S3Gz38yI?=
 =?us-ascii?Q?dK6nSfJUy7oY8HSd8N7zFA61skMw6dzZfnqEqN2PfrYvtxhDIJ04G1Uw78qz?=
 =?us-ascii?Q?76Kh1nQoYTRP/HBbhUP+GDTRgUvupKt5Y4vh8CbSwIoNW7pLtlVBomrBbFJa?=
 =?us-ascii?Q?P600OGrQhaPkzM18wS8hz5dqBH5wE5vtT7uP6hnAr/4VQ/kG7WXk9YI/+h2f?=
 =?us-ascii?Q?QFnaPyee8G2yHFNffQ9JSf4RhAfvmvjPu6qj59NlY5Ec/0PGRZHDzWfA0nvO?=
 =?us-ascii?Q?3AVBb3eUROKN9YpIn1Rufhbw9ecfsYwto+5VRp76gEH7BfUAw+BerhK73JVF?=
 =?us-ascii?Q?+XYsmvFiZHkUFk/98QOi1Khmx29zwk0bnJrRC/n+yJZaDiRZq6plSucLRpdV?=
 =?us-ascii?Q?kXjXGPa2sV2xDjcc+QLjpx+gplflWRyRAgC/SekRnAaN2upzXRwF3GJ4S0+2?=
 =?us-ascii?Q?YE5HB2O5EkoQJJCFxZpvO2td94wr5IioZbo3F6dBPdrSz1TVUS8ZWDQm6gTs?=
 =?us-ascii?Q?AWLWe/oAeNmj9vxSVgHINeNu/J5bxQkcy29IxKNRJEy/KswXU0Z1t35rwoeo?=
 =?us-ascii?Q?s+CFVbJ7CR2nxI0a5nYFwcp8wsEDwmgHcmAmdM4AmmeQN7BLwzTtM4c8284S?=
 =?us-ascii?Q?o1rGyXuBZp+jC6Y1gV5QBINyr+K8+NOq6FfzvyfD9zrzUsBlSVw9I/MkEIzZ?=
 =?us-ascii?Q?TGnZWztEglwNSa2xsXyjwFsDNt6e3sgHCz60HXeFKmnt03OqHPRlKbirVBRS?=
X-MS-Exchange-AntiSpam-MessageData-1: fP++N0oHupYShQ==
X-Exchange-RoutingPolicyChecked: 
	c0RK+PIr13g7Hiul3EBN+Mbxd3ZS3dwUjWnsXUrLb8KngtRrbfVZNhkAVFt9vDOyhy+O8iC4BqxA1U6B1DNeA+jukEbCnuIAa7+Rkv85RN7Gp0roTiQzSQscklDNsNE5SboDZ0BmE/q54iDheZZkKkWfWtR96V0Yn7aY/RUEg9/rlyVho3aU0/TC8dKBlE6Oa/JWIUwxjUAWYG7igmmKImyySE5vUjPBdHIV/i0yD/q6l7vYD47/qftMaO5+S/mrJ1HexFWBqpEXCNVlSVoLk91jHJY4KH/PGqdujgbJ7eb/k+VXe4s9DY59Yfkubx43SyaZAwWuELVRdXlLB0xKpQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	kvxVoCED1FhbS1ct6URUs8tCywOaBXC9og64TlriLGDCgeUKcn8arl/kdzgu0YQCvzUlYSLXXtXAobnmVeLW2h7KGZ22RphQlNdcqiGLU2Yzg9GTzCySRlGGb0AiY99Zf7O6gE1v7RP3f6b5DN0KnCo4UXhOtJ7bvKaLym6/HGshVZSRa/25Dr324Wtj5JZ2XxPlH92R3FbLFLNQhhT5ucQW2GWT5xTbsUXBlAqaiWys1gMFfInkGypqQt4Jxkp3y9u9kF4Gix96M89fbwx66kJaiObCaQ6LigmawmjefvpY87hqZFbI+9msTBSjYu0rz/sGfmn33Td7V0ykKbVZoL4jHRqyzJ4jIWkXlhSHB3p/GPqOSTEwYl2t3ZzUQsHHhZT9FDiDMbjiX17auMxuQFwKV5nsvwWRMIlD9jR9uNFoJ87qJ7BFb1cdFpzF072/vEUyU8K9F54KdpF7fOjUxHClt8eVS63IzwHq/aQ8oWMInI8dMtLkY5XIBl2yhtARL7nz0ianZbKUMUWODgzwlZLMbf4G8LTH7V2to8xLCowfQ2S1WPTLFTcgmJZe+v2Nu/k9AnIRZD1GzEIMfhSb6jMOIGhw2aApzQ7s4NBp7Ugbr0Wf2fCFctkNzQaCPNpW
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a19ac1-6b8c-4492-f0d9-08deb657ce40
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 10:08:57.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOxjMW6BbN58TIxcNS//5IiTMg3F8q8bR73yj+SMon0JyQS4izzpctVkN4xfwn564gTNfJ61ViY6TybwvzJvJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1648
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate18-hz12 with 4gL6hC4mhyz2fSyD
X-cloud-security-connect: mail-swedencentralazon11023096.outbound.protection.outlook.com[52.101.83.96], TLS=1, IP=52.101.83.96
X-cloud-security-Digest: 89dd894ac37ea206c52bd752be7be4a1
X-cloud-security: scantime:1.420
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237441

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as 5.4.x upstream backport of [2] mentioned in Debian report in [3].

[1] https://github.com/tukaani-project/xz/commit/8538443d08591693a8c61f3a03656650f39c7c32
[2] https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87
[3] https://security-tracker.debian.org/tracker/CVE-2026-34743

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../xz/xz/CVE-2026-34743.patch                | 68 +++++++++++++++++++
 meta/recipes-extended/xz/xz_5.4.7.bb          |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2026-34743.patch

diff --git a/meta/recipes-extended/xz/xz/CVE-2026-34743.patch b/meta/recipes-extended/xz/xz/CVE-2026-34743.patch
new file mode 100644
index 0000000000..f890851cb2
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2026-34743.patch
@@ -0,0 +1,68 @@
+From ae7abca7c721c73bb4aadf41a82a720a842a4364 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Sun, 29 Mar 2026 19:11:21 +0300
+Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
+
+If lzma_index_decoder() was used to decode an Index that contained no
+Records, the resulting lzma_index had an invalid internal "prealloc"
+value. If lzma_index_append() was called on this lzma_index, too
+little memory would be allocated and a buffer overflow would occur.
+
+While this combination of the API functions is meant to work, in the
+real-world apps this call sequence is rare or might not exist at all.
+
+This bug is older than xz 5.0.0, so all stable releases are affected.
+
+CVE: CVE-2026-34743
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/8538443d08591693a8c61f3a03656650f39c7c32]
+
+Reported-by: GitHub user christos-spearbit
+(cherry picked from commit c8c22869e780ff57c96b46939c3d79ff99395f87)
+(cherry picked from commit 8538443d08591693a8c61f3a03656650f39c7c32)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/liblzma/common/index.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
+index 8a35f439..dae7cab5 100644
+--- a/src/liblzma/common/index.c
++++ b/src/liblzma/common/index.c
+@@ -434,6 +434,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
+ 	if (records > PREALLOC_MAX)
+ 		records = PREALLOC_MAX;
+ 
++	// If index_decoder.c calls us with records == 0, it's decoding
++	// an Index that has no Records. In that case the decoder won't call
++	// lzma_index_append() at all, and i->prealloc isn't used during
++	// the Index decoding either.
++	//
++	// Normally the first lzma_index_append() call from the Index decoder
++	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
++	// lzma_index_append() isn't called and the resetting of prealloc
++	// won't occur either. Thus, if records == 0, use the default value
++	// INDEX_GROUP_SIZE instead.
++	//
++	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <= 5.8.2
++	// didn't have this check and could set i->prealloc = 0, which would
++	// result in a buffer overflow if the application called
++	// lzma_index_append() after decoding an empty Index. Appending
++	// Records after decoding an Index is a rare thing to do, but
++	// it is supposed to work.
++	if (records == 0)
++		records = INDEX_GROUP_SIZE;
++
+ 	i->prealloc = (size_t)(records);
+ 	return;
+ }
+@@ -686,6 +706,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator *allocator,
+ 		++g->last;
+ 	} else {
+ 		// We need to allocate a new group.
++		assert(i->prealloc > 0);
+ 		g = lzma_alloc(sizeof(index_group)
+ 				+ i->prealloc * sizeof(index_record),
+ 				allocator);
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/xz/xz_5.4.7.bb b/meta/recipes-extended/xz/xz_5.4.7.bb
index 30a4c8e88c..72759edea0 100644
--- a/meta/recipes-extended/xz/xz_5.4.7.bb
+++ b/meta/recipes-extended/xz/xz_5.4.7.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${P
            file://CVE-2025-31115-02.patch \
            file://CVE-2025-31115-03.patch \
            file://CVE-2025-31115-04.patch \
+           file://CVE-2026-34743.patch \
           "
 SRC_URI[sha256sum] = "8db6664c48ca07908b92baedcfe7f3ba23f49ef2476864518ab5db6723836e71"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


