Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86157C021AA
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 08:12:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18788.1740125551217245286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 00:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41470c5b36=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6pNpX006635
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 00:12:31 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kufee-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 00:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfLmznYmedZ/pTZ+YIxtycrqWk+O9LDVIpxBqMbExkINm2lIOKAcV65KVp8KCzmOw3+qUfB+EHTXc3RwWn206x2kEPlhMEwIemaTt97N+zfy+fIaWEH5RGjeYg895QNyrFBwrkYw2b9mF03mc3DPdg4MueyKRPH/1Knqc3hR04MFHkLGSlV/fDFa/HphtPzmJ4DmYkKsAcfK8Zfh+utJcYDnPUqgVRICp0CXWPa+zRPq9dJYO7TZSGqj2v3eTNwMawj2r6eCSrCLVk1WGLVQlYwn0o1UOWH/JI9765N3XoIz9nwQSQI/XYKWAQepjw0fsKXLDiIvrxOZrZkyxSX1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH5qWrHPxl1ATHelO38RlonV+no8ggGQuV5U61mOWY8=;
 b=NxJ7jKzzHikhyaJuSu+M6qTJQ4I1Kj94dHth+GjYH+TLIpBdra3I5GlsPl3m0NFQ0AEpM0oJPUMTfiuFh5KbOJ/yDWGqjYXxFkOK8RCogQIBqglbnQ4Ggtdx2wDOOuFzCP1hzpjw4GZPyyQjXwp4yu7n9c5b0H+GSboncuzGc29cuJ2OCnMgHM87BEItp767t5V1e0TCr3OPuWDONdO6LjG8tqsqm3pfL7gqRzP3aV/z5okNykvzIdbjy/8ZjXnzSZKKtoNjhrZ8/+xj/sl98VtvSR7OPhmGkDVEgzk1xyBOYWkSB3rbK9/jf+byL+2VGDEneihUZ65C+hUSqfFyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 08:12:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 08:12:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kea: avoid assertion on empty DHCPDISCOVER packet
Date: Fri, 21 Feb 2025 16:12:07 +0800
Message-Id: <20250221081207.2318014-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221081207.2318014-1-yi.zhao@windriver.com>
References: <20250221081207.2318014-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7fd5ec-582e-4159-13c6-08dd524f7a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QqyZpJH5+DNjgbibnsBGD7O3W0loibyXVP5DImfpa5ccksvk5KsuFe/tbT5d?=
 =?us-ascii?Q?tW30m3WBeeRcTFl5UX37n+Th3aHw5G5aBM8S6kFAGlavjkl3PKwC01y2/F5x?=
 =?us-ascii?Q?nYeznGCSOP3MYczsADa5FQbaBB4OBfrBexZG7WvRE2hQAAJqpOCIW/Fuxdcr?=
 =?us-ascii?Q?eQDOHsqL3y3s82ItGihIZ41CLkrtL+oZ5sDQ8eWDJLsxTfXfCWXC0Zk18lDB?=
 =?us-ascii?Q?cpAyJSygkJ4n8/2CjO8EbAeIAz9nhOGpliZ5bn7jeVUCmi1TyRzBFDH91k0a?=
 =?us-ascii?Q?UOnOxcItwoQSi/3kY93SVeHABF29IkDQ+FygX+XHiJDpzs70TNpcnXiVoX6m?=
 =?us-ascii?Q?47SnvDOChuB6TkoU8yRimYXhYfVO5m7k2iwvrTA/pETdwGIH30YuNyNoBh4B?=
 =?us-ascii?Q?s+sxcv1yqLtEORT88d1Lr+eZh4ZVdOIu3CznbQPEPobnNQ+Tzr+5eoIXERm5?=
 =?us-ascii?Q?G6WabENTVBdObzgFGdt790qX+YMH6b+LrYd8TMIt5KaPRqFCXECp03srZn7/?=
 =?us-ascii?Q?SMEJv0DMGyagRlq2yNgqosKUBk+sqr7Y3jy7M1ptKfLDQqpT1M4pZkl9044U?=
 =?us-ascii?Q?83Gy/GuaI+BS/meoqthHN111LSUWaHbok26+3b8/gzbVlPuVUtjc8E+nsgDK?=
 =?us-ascii?Q?/9yi9MB3fjo75CGgLOtW/pGAj0Pj30eKlihUOESLHcmgX2dM7EZHYTPCUGrA?=
 =?us-ascii?Q?3h8SI19L5WWCRTFvADZw1wvo9d3i33Sf6tog7H+HD8yMZsUlJRpmwnUgEddq?=
 =?us-ascii?Q?LZmdBBxmckeNPSJPtJ6WdiPvasaC5BdPRgiQSUvDNMqtzQXVsX6PdgUV9iv9?=
 =?us-ascii?Q?ExadJqN0Or5vIEJ1NsgJLvxEeao822DoBppGqytKbuPTRyt6JAv6LAGhwp7m?=
 =?us-ascii?Q?IIxHpKsk0eIZMDD9gh9caNGkvXZfMxlk0sCyXVuc94yKykP4r+la4HEF8RKx?=
 =?us-ascii?Q?FaI36/TLM1XBSh2KUUPyXG2j3zl0Ytr747JjeB9ZJdB3ZvRON3otNL/1+VIU?=
 =?us-ascii?Q?FKNBbRKlFX1sxNHA2fgvP/XeMyFUzh96VInFneyXbivd5DT5v/28xTX/EuMB?=
 =?us-ascii?Q?5k5VlBUSgQ3wQeyFKK0DHGasqZY37tmZj4vD2c3ISC6o6AL/vylriQJ+oE+g?=
 =?us-ascii?Q?tyReEgdvgH/EKifNKUbMS5sSSxovfsmqxVLvbXWxG1Sh9pOqCvTWMxByksTw?=
 =?us-ascii?Q?DVJZRFCfuo7XxvHiTAT7+jWJOeW2dp5ERQTT7LhHAZP0BwY45ORvmSujNf0X?=
 =?us-ascii?Q?r7Cak7J2SSyQyfP8xIYOXUV0wJPRXeFhi36FhZ8yPmDaf/2ZTEO0ZMp/v2lo?=
 =?us-ascii?Q?1hqAurrmEwU3STO97gtNJ4i/tX21tHs/N4EcAoN3A3al3/Sr3c0hOpJ6NrXg?=
 =?us-ascii?Q?WHm919cXaZrBHWHVV8dsaHPfuHw3cyHKnOOXnbL5hSftAgKlXcAw6YlRXUlE?=
 =?us-ascii?Q?hXhRe7bF5iq9LDuxFAJuFH2tHGP5qevUt9SxqERxtLITvGJxseaXSA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7749SFdXr8LTg6TE5DcgWpb+KSY0ahg8ddQ+Q5Uzb/fD+kl/sDDD20f0feGz?=
 =?us-ascii?Q?5ahiQpWc3VtKeGLQ0KckpXnxtYUbz13NeDWhXJIOXGTEwamvYwBdR23z38+o?=
 =?us-ascii?Q?7+pvHpSfjiTBBOlyA94hx2t2oMSyKVEldw6JkqxJXLzO/rYzXKyr16NL4xan?=
 =?us-ascii?Q?VQY4evmDBg3YKrWRwHNY0gQjjzhA288KYSUTGAnvOHtY0OEhXoqm1JiIbRSN?=
 =?us-ascii?Q?aqWN5cq4AYcz9mUwm+CeNM3TFFSFjJVUIYoH0tvGYeGgUibVc42cly7JXuFh?=
 =?us-ascii?Q?WseqD5rxsXoMuUPsX6pyvRJX3XHEvg1iujgRUmFOPmnss8yTwBse0WArvBSe?=
 =?us-ascii?Q?Nrld7h8Wh5tUzIwHsyeWYmuLUCeXnFw5mBTlRWg5hHLAvnCXEOGNomcSvQ0q?=
 =?us-ascii?Q?Rbi/Z+FKVNl/zSfxf8zVzVv5jvcBAhxH2lEX9Od5f9Kk4X2lrJwn7xV4sR2E?=
 =?us-ascii?Q?YQIcTTqZgfY6KwMHt15awSfB54K6NXpeEPW92mo0+8GsHWUtk5BZIdKVi8C6?=
 =?us-ascii?Q?bsvxw4dDgGEDlU0gkc/6dI6VoOeZPe/8WnWmR2liWG/QoHLvJprgPTteViPG?=
 =?us-ascii?Q?Q2MAV9BNbgrzd5uaBqi0q1TTUgtyRry2qqnw3gQV2kfYNaoujKY3ejIFHWr0?=
 =?us-ascii?Q?Gsk0iMPquRt1YTmOEnBn/BjLAt9QCsrI7/sB6z+5rPcdgaZkUW515dpMEJCv?=
 =?us-ascii?Q?arAuWJ0j8UiN+kaQlRXyDJSZ3BGZDaz1/iu42ARuSvimZlfvmZlm6kuEihEm?=
 =?us-ascii?Q?x4G6IuVTKVYGXP8VbozeAQzxcX+UOBxhyGggcHvo8to5T14xLutPU9KFgFvT?=
 =?us-ascii?Q?I29SXEDkf3QQ6+8/YxBlX5+/jkc3JiLwtD7JKW9kamQsi5N4gsR3267jQXN5?=
 =?us-ascii?Q?yRCcgGw4GiqP+iXJ4LLPBdlrs22a5jz8CdqmNUCJuP2UuJR6FCHh/USm57d7?=
 =?us-ascii?Q?9sAxfH++WtaRBIgbSQGLf2hSMYYO0WWSjrY7bPIS9M/er2S8/AWyVRkQOc1A?=
 =?us-ascii?Q?2Q3i4DQG+uLe00oBnE5vi0X7FFhF47CEbU2UduWX0P9ibzV+3Q8JiMkt0w+2?=
 =?us-ascii?Q?KOS2t6CQlyOfN4Q6s22kgVaEPKtjFHgTYjauA8qbaPLy/lXjE+BvNnKRYfl0?=
 =?us-ascii?Q?asrOh8H1sIuwm7jxbbjigUZYlNwKZlCPEwZK3Y7TXNcPGD9hbweyHpfU/Xbo?=
 =?us-ascii?Q?z3kB6x6rKOoAKIHk2i9rKyCAguAV171Z4WwPyxovn39aKsLsiFaodgaN8PcK?=
 =?us-ascii?Q?CBvE36Ewm1sL9fTMQcAvb+xx7R5thT9Rn4VCAoj04I6CLniQ7BX6UHvuS/NA?=
 =?us-ascii?Q?Dy+7lPMGpxhoMJl3rffoQTPqQu7YhqLAjrKICxLUvOpO5XZzE4uwojkWY9tm?=
 =?us-ascii?Q?ed8g9+qBeWx8twl1P6/ybClGPWCauqicIkzMU8Ai522B78amKwXrMpFMslVw?=
 =?us-ascii?Q?j1+wxD8NPnetBeQwP1YgeNn1b7/2z32JkQVGcqGF2drg4raC/WXpLhYsnGxL?=
 =?us-ascii?Q?OVZlCAc01yUDFs2zZfliwQvuP8vdwbbmVR9j0Xzjj4QN76OUPC88AkmR09HL?=
 =?us-ascii?Q?C5Ba71H0nM1Gsxydq14/xA5DaQr+H/1lCSd4GixN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7fd5ec-582e-4159-13c6-08dd524f7a29
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 08:12:26.3854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuI5kA1rEu4FRxveyYIrRI6IiyygLg/qevUlDpByJ79uVwSGkybuziVD+4K6eYXPJW5j32qnmsGu3n4S/1j3pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
X-Proofpoint-GUID: WWTR19IyMSgWaU-jjNy5CAIQuv3ZmCWr
X-Proofpoint-ORIG-GUID: WWTR19IyMSgWaU-jjNy5CAIQuv3ZmCWr
X-Authority-Analysis: v=2.4 cv=Ao8U3P9P c=1 sm=1 tr=0 ts=67b8356e cx=c_pps a=SX8rmsjRxG1z7ITso5uGAQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8
 a=6olxqEbHqzkaEYcinf0A:9 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 08:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211794

When kea is built with "-D_GLIBCXX_ASSERTIONS " set in SECURITY_CFLAGS,
an assertion occurs if the kea server receives an empty DHCPDISCOVER
packet:

kea-dhcp4[596]: /usr/include/c++/13.3.0/bits/stl_vector.h:1128:
std::vector<Tp, _Alloc>::reference std::vector<_Tp, _Alloc>::operator[](size_type)
[with _Tp = unsigned char; _Alloc = std::allocator<unsigned char>; reference = unsigned char&;
size_type = long unsigned int]: Assertion '_n < this->size()' failed.

Backport patches to fix this issue[1].

[1]  https://gitlab.isc.org/isc-projects/kea/-/commit/0b98eae16d9b6ecdf57005624712b9b26fa05bc0
     https://gitlab.isc.org/isc-projects/kea/-/commit/16306026e37b32a2ce4b16fb5b78561ae153d570

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-Avoid-assert-on-empty-packet.patch   | 148 ++++++++++++++++++
 meta/recipes-connectivity/kea/kea_2.6.1.bb    |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch b/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
new file mode 100644
index 0000000000..14f3424570
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-Avoid-assert-on-empty-packet.patch
@@ -0,0 +1,148 @@
+From 9cf3b6e8d705957927c2fbc9928318f4eda265c8 Mon Sep 17 00:00:00 2001
+From: Thomas Markwalder <tmark@isc.org>
+Date: Tue, 11 Feb 2025 18:52:41 +0000
+Subject: [PATCH 1/2] Avoid assert on empty packet
+
+/src/lib/dhcp/pkt_filter_lpf.cc
+    PktFilterLPF::receive() - throw if packet has no data
+
+/src/lib/util/buffer.h
+    InputBuffer::readVecotr() - avoid peek if read request length is 0
+
+/src/lib/util/tests/buffer_unittest.cc
+    Updated test
+
+Upstream-Status: Backport
+[https://gitlab.isc.org/isc-projects/kea/-/commit/0b98eae16d9b6ecdf57005624712b9b26fa05bc0]
+[https://gitlab.isc.org/isc-projects/kea/-/commit/16306026e37b32a2ce4b16fb5b78561ae153d570]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/lib/dhcp/pkt_filter_lpf.cc        | 10 +++++++---
+ src/lib/util/buffer.h                 |  9 ++++++---
+ src/lib/util/tests/buffer_unittest.cc |  8 +++++++-
+ 3 files changed, 20 insertions(+), 7 deletions(-)
+
+diff --git a/src/lib/dhcp/pkt_filter_lpf.cc b/src/lib/dhcp/pkt_filter_lpf.cc
+index 69bdecc0e1..b0c8f108d3 100644
+--- a/src/lib/dhcp/pkt_filter_lpf.cc
++++ b/src/lib/dhcp/pkt_filter_lpf.cc
+@@ -318,9 +318,14 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
+     decodeEthernetHeader(buf, dummy_pkt);
+     decodeIpUdpHeader(buf, dummy_pkt);
+ 
++    auto v4_len = buf.getLength() - buf.getPosition();
++    if (v4_len <= 0) {
++        isc_throw(SocketReadError, "Pkt4FilterLpf:: packet has no DHCPv4 data");
++    }
++
+     // Read the DHCP data.
+     std::vector<uint8_t> dhcp_buf;
+-    buf.readVector(dhcp_buf, buf.getLength() - buf.getPosition());
++    buf.readVector(dhcp_buf, v4_len);
+ 
+     // Decode DHCP data into the Pkt4 object.
+     Pkt4Ptr pkt = Pkt4Ptr(new Pkt4(&dhcp_buf[0], dhcp_buf.size()));
+@@ -344,8 +349,7 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
+ 
+             struct timeval cmsg_time;
+             memcpy(&cmsg_time, CMSG_DATA(cmsg), sizeof(cmsg_time));
+-            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time);
+-            break;
++            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time); break;
+         }
+ 
+         cmsg = CMSG_NXTHDR(&m, cmsg);
+diff --git a/src/lib/util/buffer.h b/src/lib/util/buffer.h
+index 41ecdf3375..c426a14495 100644
+--- a/src/lib/util/buffer.h
++++ b/src/lib/util/buffer.h
+@@ -1,4 +1,4 @@
+-// Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
++// Copyright (C) 2009-2025 Internet Systems Consortium, Inc. ("ISC")
+ //
+ // This Source Code Form is subject to the terms of the Mozilla Public
+ // License, v. 2.0. If a copy of the MPL was not distributed with this
+@@ -233,7 +233,8 @@ public:
+     /// @details If specified buffer is too short, it will be expanded using
+     /// vector::resize() method. If the remaining length of the buffer
+     /// is smaller than the specified length, an exception of class
+-    /// @c isc::OutOfRange will be thrown.
++    /// @c isc::OutOfRange will be thrown.  Read length zero results
++    /// in an empty vector.
+     ///
+     /// @param data Reference to a buffer (data will be stored there).
+     /// @param len Size specified number of bytes to read in a vector.
+@@ -244,7 +245,9 @@ public:
+         }
+ 
+         data.resize(len);
+-        peekData(&data[0], len);
++        if (len) {
++            peekData(&data[0], len);
++        }
+     }
+ 
+     /// @brief Read specified number of bytes as a vector.
+diff --git a/src/lib/util/tests/buffer_unittest.cc b/src/lib/util/tests/buffer_unittest.cc
+index 66c43e8f21..bae051dd16 100644
+--- a/src/lib/util/tests/buffer_unittest.cc
++++ b/src/lib/util/tests/buffer_unittest.cc
+@@ -1,4 +1,4 @@
+-// Copyright (C) 2009-2024 Internet Systems Consortium, Inc. ("ISC")
++// Copyright (C) 2009-2025 Internet Systems Consortium, Inc. ("ISC")
+ //
+ // This Source Code Form is subject to the terms of the Mozilla Public
+ // License, v. 2.0. If a copy of the MPL was not distributed with this
+@@ -197,6 +197,12 @@ TEST_F(BufferTest, inputBufferRead) {
+     ASSERT_EQ(sizeof(vdata), datav.size());
+     ASSERT_EQ(0, memcmp(&vdata[0], testdata, sizeof(testdata)));
+     ASSERT_EQ(sizeof(vdata), ibuffer.getPosition());
++
++    // Verify that read len of zero results in an empty
++    // vector without throwing.
++    datav.resize(8);
++    ASSERT_NO_THROW(ibuffer.readVector(datav, 0));
++    ASSERT_EQ(datav.size(), 0);
+ }
+ 
+ TEST_F(BufferTest, outputBufferReadAt) {
+-- 
+2.25.1
+
+From 614a6c136fc20ee428b1c880889ef61253657499 Mon Sep 17 00:00:00 2001
+From: Thomas Markwalder <tmark@isc.org>
+Date: Tue, 18 Feb 2025 15:03:12 +0000
+Subject: [PATCH 2/2] Addressed review comments
+
+Couple of typos fixed.
+---
+ src/lib/dhcp/pkt_filter_lpf.cc | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/dhcp/pkt_filter_lpf.cc b/src/lib/dhcp/pkt_filter_lpf.cc
+index b0c8f108d3..3642915cc1 100644
+--- a/src/lib/dhcp/pkt_filter_lpf.cc
++++ b/src/lib/dhcp/pkt_filter_lpf.cc
+@@ -320,7 +320,7 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
+ 
+     auto v4_len = buf.getLength() - buf.getPosition();
+     if (v4_len <= 0) {
+-        isc_throw(SocketReadError, "Pkt4FilterLpf:: packet has no DHCPv4 data");
++        isc_throw(SocketReadError, "Pkt4FilterLpf packet has no DHCPv4 data");
+     }
+ 
+     // Read the DHCP data.
+@@ -349,7 +349,8 @@ PktFilterLPF::receive(Iface& iface, const SocketInfo& socket_info) {
+ 
+             struct timeval cmsg_time;
+             memcpy(&cmsg_time, CMSG_DATA(cmsg), sizeof(cmsg_time));
+-            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time); break;
++            pkt->addPktEvent(PktEvent::SOCKET_RECEIVED, cmsg_time);
++            break;
+         }
+ 
+         cmsg = CMSG_NXTHDR(&m, cmsg);
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
index c2818c3386..ff7fb51fe0 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch \
            file://0001-Update-asiolink-for-boost-1.87.patch \
            file://0001-make-kea-environment-available-to-lfc.patch \
+           file://0001-Avoid-assert-on-empty-packet.patch \
            "
 SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
 
-- 
2.25.1


