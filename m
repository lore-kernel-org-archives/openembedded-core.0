Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F11C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:29:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149027.1783337364367749817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F5/w7uvn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=164719aade=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666B1KSG3047131
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 04:29:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ea5kG9aQW
	SBDWX/qKaNtc0uHfuYD+r/SjaDM5UERtkU=; b=F5/w7uvnwH6LockbXWzM3fWgO
	jdqn2ylUIer9HgBc6BP66xvvDz239Lw1w3JU4huDEvOGWGn7NJjy17wMm5yYzFWR
	OePneIcz8g3VHU5mUGR5bca9Eyb4pV74be26/M7f86NvE4KCJuxO3yUOVvzn5EUY
	HAnpa19Rx7TPeR7FNL+gYIqTtAcKkQRqWnqpUYqYLqWLJpqDXqCxgLFBo5XAeeDW
	Ktys5AfetbxAqJFQfBwYxBL8emg0UwtBbNqxrSR1mYbf2oYXnMvOqGp9smtvKk2R
	WoxmVB5IaLJ6Kd4Mhn8Qyitcp12sqRl+bdBA2p0u9rtBhSCFW1qDfQJwiAmkw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6wf19xqq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtTCqBr9NPt2GS9F0gOt++E1nJt9vRI6mCzZZNUTCJ9c4GKXPBxPaarR1OBvhmyGIXhKUPUTE/yEQ56Ca4i5r7yJKkWf5txpo8fRA7IAQbktJtITF0MBgPCkAzjxKIDX03eg5XYmmrx/47hxPL9A/QyVYQUqnV/HPLtsUOqMMsVRu3GdzttS647SbfC8jbVMlq3dHLHZimvXQ7UZMQ5ZifGHoNXHHGbyTAMI1SBmfnHQ0gKjY3fq8EfeAX8ovEE15yKa6O/8o3lxUFlfvSqA35k9UdogCeT7djqdCPiAA4NAr5k1PABZQ5YlwiuTEoU1eUFwuYzGdEw038OepE+KNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ea5kG9aQWSBDWX/qKaNtc0uHfuYD+r/SjaDM5UERtkU=;
 b=NXIpNwvZdzsZxj28w5jMM+zbHSS9w77ol1qgJh4+O8l9lw8MezbCX8AekLNTToVgSEAfpQWB5nPDx5/thxn0aa1L3schHj3NyhZqkAj2pKLQawoWGkXM0XdlZL41N0lAky3bt5R6gzrMmu8iuBiSFeu0FUBPs7MeUuldE060TTZpV0G95lyKWkhkoZv5v6rBjpPpYoo5sGsK7dnBBGsbhwtoE5EnOa4levjzH6VyZCPOwHK9L9h3Sn1LdSNIGH3ebION3bR2FP2LY4jWUAQjsmmWs3wcIyWSlWaOrnMmx8MmpgPPeR0Rf6cCfmJC59AZaxMIWXMNrhR4huszey1t2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM3PPF67FA1A8F8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 11:29:20 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 11:29:20 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH 1/4] kernel-arch: Add clang toolchain support
Date: Mon,  6 Jul 2026 04:29:02 -0700
Message-ID: <20260706112905.41381-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM3PPF67FA1A8F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 1713d0e4-303a-486c-43e7-08dedb51d240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|56012099006|11063799006|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	2u/BffyFydcoQ+i85FItHvxkWSLctjD8O7mHeFLFMTlBHPJq0UEkONHSdLgYynnFi0GB0x123ZxruKt1iX90Jpri45GWuG7LI/9BNCUSWet8TDA1NdHscSBalyg+oz0X5CVM7EM6Af7ntKem0dK9pyc+mVdeFpeA9RPixwhKtHmoQ//tuQxqDlAa75+eYmTt+JrrW3qN5CohIitIC8GHf7fES4eiCHdTvMN9m7UQRKqF251xt0k2qA7ovMrbJxu/eVWbYplLcM2k/I+QRsZx1Uiu2zKg7Nds9jfVgoct7Rj2VVbZCfdQeAzPIpzgGy7r7lsBVbr0LyRV8TkQANZFNs+JjlfVKDEuBmy6s2kRlfKmHOFrqPXjH5N2060ob65kd5eSvJnOTsNImrA19VeHBTJil+owtGTntJaJJUCZs10VScghAxmJryzOnKxy2ZOHIDUpYak0+Hl0tFhh16EDbyYUHej4IvvApYciQNigrslQs8kFOoFESnQt2+U4Ls8ivZbyvudxIoQH5LqU6sSY2MJZpx+3aWvuLS4kE7hEN+DE6USMbfNqZ5NBHI9spyN4gdTv/x2myeh4U8bDg2QWvhHAFy7bOi6lvIQGBgoRWQgcYrTlqj1SXopydyZ0PkmZyY/PnKoR+06rMGP7SJ/8lEw9UIjo13oLtVlLQg0ySR6OsfXBSKFVW7FRWMJFiDDwI2E7cKDQ/pMUnqZDLNjO98+Vh0cJ2GHBeY+EwElnGsY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7+l02GvJyd6de3jS/D9pB5w5nUC5je8H0O/4RaM4DQZ8j7l8l5H4HCd9Aua6?=
 =?us-ascii?Q?VoM219yivubbESe2gjG8IVIHAU0IFBwH/sjuYyb5Jxt/HB7fHh9cT2HY6g4E?=
 =?us-ascii?Q?tgvCLL6Ts1SLbEUu5OyeMI7zDhJmRhk1BbqGLfFef8xyOwhGExAOgmsgKzyV?=
 =?us-ascii?Q?Zn/Td2UJ8p0O7RvPZmHzEaO3wZBT6zAcs5IDL0Q3JY0OwmkGH4A5T0BuJ9Aj?=
 =?us-ascii?Q?5+tV6bnul0rwfxT0PcE1M9//eC6foAR4tv8NolB4sq+nvfFtqr4wE11H9ehc?=
 =?us-ascii?Q?krg48HBZNF8N8NL02I06jU0NOiBfy4Bs5Ynn6m6nBfzDkfMkon+ampwrncxT?=
 =?us-ascii?Q?5JFdKfJkjcqP8rFcI11RACeY9D28nAHjtnwd3l8Q+OoRDxGEoX2WMME+4F8n?=
 =?us-ascii?Q?y3D5cqEGmlThboJEKcmuKUH2Ix4bmDbiOAkYdA8u7r4YETcob91FsvG17acx?=
 =?us-ascii?Q?tlb+YZiRiiS+XTtGZZEJOLxE1rirEUao6f9RWnO+pJtb5/lVtRESRb1FP1ea?=
 =?us-ascii?Q?wyzbzEEzm6OD0oMUNlFugNqyMl+odiY1nw94HLmUwh84/XI8GQkRXdbJmh6p?=
 =?us-ascii?Q?Od5K6p3JsgCcTNJ/9pYYyKcMjh8StLOgj56Mzojues7QH+ujjkkewFNFMCU/?=
 =?us-ascii?Q?Gdy9eO88PbQYZ6OW8TD+w0X+kv9ZOkwYiZT0cX2eyldXuRSQsKoeXQbqzusj?=
 =?us-ascii?Q?2sP1oYiqaGMt0ISfpqzjta79iQDMLeqjOPGbAPUNvvMJ+DQK6kcfvn1Dsydg?=
 =?us-ascii?Q?4gAPLPN7GCUeEiCG3IAfUStyiOfD7cXwQivK3axrn2sVLXJu4PVU5inkY2Ec?=
 =?us-ascii?Q?y++JA0ZZ2kwjoMB/PDfanQjtR78gsbYiAP0s9DiDlDNSAIE0rZ1w9JhgIUsP?=
 =?us-ascii?Q?+cLxX5lp39fmultbCcM/gJAQ9Adzioc8GuaLZdy14EE5bTwOSrCzjsyxC5fP?=
 =?us-ascii?Q?fsQb37mCf/7YI+G3jorDGXLtIDOb525rwJ+DHgBEPqAwPQYadAiXzSgsrn4C?=
 =?us-ascii?Q?tAkQeJcjfJdbtsOWbtdf+C9kuwLg5MKcMCvfPpofL27oWisU8GnRdz/0t3zR?=
 =?us-ascii?Q?HfCktkBq5vTGIO2K2R6lZ/vBErOHF8gBkju06exHBinIyhlTVrReT+BQ25R4?=
 =?us-ascii?Q?p55HLfDs88Dqka33eKX6nlDyLa//VZGLVhnfsw858QoyhmcpeesV6BcYPH8Z?=
 =?us-ascii?Q?aCmlfsmjAOucOTGZOhopvnqMOG2ln717WkOtuBzXKZqF9aO8pcSBmLSIs5QX?=
 =?us-ascii?Q?dUf7IDOhwOs3ntBBl/kkanYxuXHCAqV8o9v6Oegyb36Yr07TsQ/hnJ8xHc5O?=
 =?us-ascii?Q?Sic7xjzqsfC7sL1+BNIbJH8tZll5E8872pI7Qt0dXvPzFihv7YZNJcPdd9jR?=
 =?us-ascii?Q?iDz5K6pY6atZuQvDS8dvhM208G6+YuUVwkrX7xKgkEQisiEmepbJd463StAk?=
 =?us-ascii?Q?ZkNkxa5AHj1tHBHm3S0QO2z4okGY+a9En2zrNjBTyLRO2w+eN6XzY9EGDdPU?=
 =?us-ascii?Q?w5kGyhUo0Yayh3W8Q6UpfDz8LQ5ZI7vqDbHGPhpqOBbaUdLg3mrJEgJ6YOya?=
 =?us-ascii?Q?qss5GTIyBWO1t7UmhN4d/pTVhw/MhZ1i/aqTxC23DoRo20bBk9evXiqguzQQ?=
 =?us-ascii?Q?f6QbHn66pT73nDgh1n/Aqv/Mc8izl5xJPHXc3Xu6LKEZappcW8eaWPokdYzi?=
 =?us-ascii?Q?2DHya0t9/aVoL1PP4SeBVolqFsow85fk9ZKyqKInUNh5WcJO1u9xHrQhNloz?=
 =?us-ascii?Q?jbCvlhlK+62Z6A4r/U6Bo1kjTNPHMlk=3D?=
X-Exchange-RoutingPolicyChecked: 
	VJzKJgIBqsUkoGktnF4jXMRQ5yAsXg3Hgj/NrOgeFaJFllZexNSKNU3ZWQYWWlpS+FuFXLW8pMhWtOD9Lm4GsDyO6KX5Xg5ydjn0H7BkMCndEzF03cN+p4Fj4DwJtaJm9X+A3l9pWl422TSkDU/bcQGhrqYAMuWfobfI5gm6HJKTe27AV9a0feVWnjw4t8AcinFGRrH/gDeoeLn/4iWZLESkJm237qFU+lm7m8v7z4/ykNCL3rPJN7FL7ZOL4E/ntqq2hTIFF8UAO04wUMAlP1ecKa4jKDY8NbPa9G9S7ghb6nzahDXy8xVhPTSKpW1QkKopmrEBfemzoE0HGe3glA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1713d0e4-303a-486c-43e7-08dedb51d240
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 11:29:20.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUThToSrRqh0MiYwDh/CX7qV+dKHg2dGQr+NmMZ73yNyYRD2x+CZNUZGd5vGia9dro3PvLDl3UCvg7aQablZ4eabSlZ+McNIzpRmYLwNO2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF67FA1A8F8
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfXy2+S11zED17t
 XloJTCuli69PVKZJLwHVtPQkyZIOVI6fOhSFnHeOjKYBgzGn/1vw7mpxgnaWsHRIbvxBY5r/v1F
 MKkxyD+wgwWqaQv1QGPK6WZ2mw4hYY/XbqBF3j1IIH4PGIiKTiE7wuYH1SOZkCR1ppia/h7kwMS
 arvKhU1ZBIMQghOsyRIlV9XKpX/RAyY/puebH0ipUhJi88tkBrJo6ozay+owj9lL+JfzD/zp4mj
 u0N8lHGl9cfHn6zBax6T6gKjHkFSvqRs+9826xUz/XH3dEwXh/B91fdv7ugDBiZZU2R6fQdKCsI
 VZ4XuYTQIaSvS9wcEUt8c/zCPor1wc8kHcX26Lv4q3pkWp3YW4vpm8MU8NoHrg6Qr0K6PHmXit5
 xXhMCoguB2cR2zmuOUACX+cmVjCiodOW0v0jZD+80HQH5NoROStKAStu+NSEH8uB4EdKvKMB7k4
 45q6PJ7Sp4d+Z++uTmg==
X-Proofpoint-ORIG-GUID: fFwLuFeHlycjy5Omi1CE2ZUiP79qGzm7
X-Proofpoint-GUID: jZZ7q0p1ZNxxZWCXIhw8MzTN61YmVjP0
X-Authority-Analysis: v=2.4 cv=cuarVV4i c=1 sm=1 tr=0 ts=6a4b9193 cx=c_pps
 a=wYVaD1eOHCZ7T07lO2spig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=kWAUPiode8oiIj8Mea4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX3becVZiPFNPe
 d3g1q5PzhO1r4+bTiDbbK1Z3OCA7Xcy/dyI3XrHsQ/21yRye/PmL5Ax/x/XfFDOPNmC85O0Xjbi
 g3L9mtOiwPuindSpj5HAYDeRgbzLcCBbJe6X/uExQ42+2FMXy3Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240256

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Convert the existing GCC tool definitions to use the `:toolchain-gcc`
override so they only apply when `TOOLCHAIN = "gcc"` (the default).

Introduce new definitions for `:toolchain-clang` that use clang,
ld.lld, llvm-ar, llvm-objcopy, and llvm-strip, allowing the kernel
to be built with the LLVM/Clang toolchain.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 7aea9cd3e8..6ebc0f13ea 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -71,14 +71,25 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
 HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
+KERNEL_CC:toolchain-gcc = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
  -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
  -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
-KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_LD:toolchain-gcc = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-gcc = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-gcc = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
-KERNEL_STRIP = "${HOST_PREFIX}strip"
+KERNEL_STRIP:toolchain-gcc = "${HOST_PREFIX}strip"
+
+
+KERNEL_CC:toolchain-clang = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH} \
+ ${DEBUG_PREFIX_MAP} \
+ -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+"
+KERNEL_LD:toolchain-clang = "ld.lld ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_STRIP:toolchain-clang = "llvm-strip"
 TOOLCHAIN = "gcc"
-- 
2.49.0


