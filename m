Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CEFC369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 02:55:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.197.1744858546541868262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 19:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6202e9a415=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H15Nfx017842
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:55:45 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2m9ynp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:55:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMiyMvmYdjfrGwNRd27V9F7KtaMB+CR/DwBVGZ5Z8rZjPG2Mu1oTLWe+ycLihIH6Mcf8qJ4xsmPKg86NzK74Ay+bDouRRgrRSTRKDhxNkomNjgAAZ9hXQXYfikif6DOnMjrXOC5pVIEl+3DHJlhJ7e54StFK+jSX0RZ0g0qi9XWp6G0z9upB2mgXHpfOhzaN6yyzY7vAdycQlt86PBL8zsxamvwLMs1+wR124QMYpq7K6Amk7D6WXF5Lvd0+P0X6ixtXG8hVWz91HEQiSkigV915TQ/OxbMIhrHl/5t/HeZnkyfYn2zptNWpFQK1tDh9QiFvjdw//pQw0KrMepMnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfQfbYylvA/0XHwx28fPPHvRpsRIJHY9lFqSwtNBKTE=;
 b=Qc1BXcgAvmjkqtXiZg3NYYEblb0qH6WFvx3+2XcqjURREJFbXF4tmRFCG3MVMa5Ea0H70iGZT9SrLj/CtZVqo30Yz3Qlw5m+P2cxN1b5NAISjRcaMaWj3cE1106A/xnxaQAVsbvEktYeFhmdQ6y38vjhd+6sDqpQ2X98/WNveQqZTG4tRlQFLVQxqonln1uXv1pqop1ERTLxJxrwHgzXCmTZkvNIZSEQtOw+dl3KEZEUUHEwRlzx2eUyh7Ag9doD28+eC6AZdH+Gc4ZC8kQ2fRibDNZ39DDts7o2XY9lbiJUniFURwipXytSfZIb0oFhxoXz23jGo/0Pa+L28EfLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 02:55:42 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 02:55:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] python3-unittest-automake-output: fix version mismatch
Date: Thu, 17 Apr 2025 10:55:26 +0800
Message-Id: <20250417025532.1363790-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb33139-7771-486d-5f31-08dd7d5b5796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iDiZHdTk/JQ13n9p7ZLt0wUQ8qMNh+vzuV0I3Lv1+qhlm3ssPvyZbhRyPkUK?=
 =?us-ascii?Q?4y5lc3FR4FlrO2wIFivUi116zbFWGjl4iKGxp4qS8iBCJQQsgv9hh/ozg07v?=
 =?us-ascii?Q?gl2c4g88l3vcI1//OY674dmnNINmfn3DvBIucMI33+Sm/4lhrlETg0LrD0tb?=
 =?us-ascii?Q?8jzz0s/ZDsyr775s7rI1V1gSN+M0IFZ45nDNvS65fFfOlLmBp1hqvNBiex2I?=
 =?us-ascii?Q?izFXIxHFm0390Fs/navQ6wWw7i4GKO8/Zyj0hRpPcixB0R2lt7jD9fVMGRQX?=
 =?us-ascii?Q?DbGzhdvidjGZt0Q3Wj02T/iC56i+DBqFzYQ16xlOGMcApHukzdLYzbY43tHv?=
 =?us-ascii?Q?G5gQKmYq4WjrkA6ooe25+Tts4/p9Sl599eEBhwUh2UxYLkWCYpohlRvl8jjk?=
 =?us-ascii?Q?j+zHqqDPqHKPEsottLyVQrEp40WNVIPvQ+DCDoL3NS5wMRxn+lLpNitWk6Xg?=
 =?us-ascii?Q?35AuwBo/104OQnulZ5GxKmuZpUP9FE95eShLb/BctkpO/UnxYsyKZx76cDMN?=
 =?us-ascii?Q?potU7pwfjHYRGjWQ7IUFYQmwDvD1UCXbHppMutUjLSRv7yRHCD+TsZGhxF3g?=
 =?us-ascii?Q?rXTJ3eFL7A1hDUzXrP9lb1JfvPM+AKP34qGinNDnyKppVuhj9cCTh+J4rCWS?=
 =?us-ascii?Q?09Grkm518kW6QXCnd8Cv18m5tjRaBG9HlQGi0lSQ8+z3P2v+PRmpQIQahTwf?=
 =?us-ascii?Q?GhLnRNZEnYAainroimiKfO0TZ9TbShRG6t2n+W7B62jCsNVlnW5Mj+BbjpaR?=
 =?us-ascii?Q?+WJFWkN/K2W3+HN0n6wmm0V9/AxlfbWQk7ul7uSYzrcPg54h70YtPqx4CY1H?=
 =?us-ascii?Q?A6s/XbsQCTPKMeiYoSbZTnHpygyMpA4DieNR/PNiJ8SbZxTBhs3sKF6YExf1?=
 =?us-ascii?Q?tskKOwkpAa5UQtpBMSfLNm3fK9DNaoFYqCEV1+ECCFk5AAwDdDh7Iof5Si5e?=
 =?us-ascii?Q?ar9JrT0KLyUlCXSPENRvz/KoGOk8gfQLKCBd7p6t7leDHjtxokMvg5Xgi+7k?=
 =?us-ascii?Q?AR9KAFn8ybXQO3Qdk1bPCWNzD/zN5H5laUw1+ylo97rjP7xW13FkihD69YXR?=
 =?us-ascii?Q?VVOo8EwxzzyuTuPSzAt2cH7vGP6e83MqXut3Orkf3NimaCi7mQnow8Hkx+yU?=
 =?us-ascii?Q?jdREV2XFs1ZliL8E4im3tEjSOZRTq4+V7HYKIfpjM93l4uS8D51uVav7Y/yK?=
 =?us-ascii?Q?5AWOgrQvBCjWtWqgL/nadqisfrc2hmM83p0gh0Um1ugiYePEIXtqm8aqa3ms?=
 =?us-ascii?Q?UVfOwvozf3gOZcTJfoFhKFHMJWlXbnLnMH+FY6hm2Lnhotqgc765y1mLuKXT?=
 =?us-ascii?Q?wurkUYDxv8F3wvtRU1ZgnLJWKSzFWuq2bKbdwFxWg+P8lb3RNQvmpbdYSRDS?=
 =?us-ascii?Q?Ao7Cn/aTzIs97K3k88r5J6wI2sIrZYe4Zi60yeQ+8bauC4vUktD7ZgkX6SQK?=
 =?us-ascii?Q?s5nR8Mz+TskE0CEE859kNr6uh3UxDHEm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dBpOhuB89GNtBhkeYFMzou4M23UDHn5qvA8czveBjD1+dqypZgvRBqKVtbhe?=
 =?us-ascii?Q?2svNBuadVwnDIueX6GIjhKNGBOY4t8ljBmROgKga2eaMALHuvfBUY6Zlfo+I?=
 =?us-ascii?Q?BE9/LzLk6hRoQyKaDh/IhZmmHnmJRiq0CNByCxNaPPv8sH8gUQOoYR++CGAp?=
 =?us-ascii?Q?0YV4R98zDX8oC0hcGxT5QYjOBGBVeywVAstI6J2CTCnBiulY49LZe9RHVb74?=
 =?us-ascii?Q?n4Se1ByPIsnr/iWNyyiore+3xXiGuYkW0rQnBSBgOF/8hZbbEnGP88l3QJkF?=
 =?us-ascii?Q?UbLZDql4CMj+V1iMwvHWCywP4c6nWU8ZfvkVvlZWilimjzSHsVo+xHgwXO8g?=
 =?us-ascii?Q?TZWqgt5u8LBiWz9KI7MalqYMOVVY04EzfUi+Fw43Qp/s78m2U4QQMdBlRqMR?=
 =?us-ascii?Q?k2VzOHvWxGZdRW2a5wktJy4BAOYe6JUwDk1MLVimE3NfDmeTktvwnu44DxmD?=
 =?us-ascii?Q?UR4iSYKSz7NIwDH1IIcGF9Q6AuL7RWMgfDoP2fJ2oqAJaHYP6ko+1utd9yBi?=
 =?us-ascii?Q?uVWEgOIzNDLfqby8hlxBmuX2qRaIjnaN3OsRMzY6I1GwtfLPu+2x1wM4St/O?=
 =?us-ascii?Q?Y5rrtvMvAjHvUQQSPmJlCrlJ9hYyVPcAvMsDSuhQIKbAuPXGpYaEhc2sQmLB?=
 =?us-ascii?Q?jTl1eOfOyetsSFUclIhvP+8cHoyNjB6Yjf64RL/fEb47BGhVXlh1lnlSe9MQ?=
 =?us-ascii?Q?kzN2GQD28FvPRypn7qXFgfzRmx161golwA5ZEIgjWNrncrAnJkmod7bZc/m5?=
 =?us-ascii?Q?EhI2ILLUyXXPkEuSZJNFwFqM06Bo5SQodTXGCqlnjcAKvILEsDplBGv7v6+P?=
 =?us-ascii?Q?B8glvJf/SQwkM7/WXnqK85bpZRZe8dpYJmcO7B2CTkbckE42ti6wIXE2+n+S?=
 =?us-ascii?Q?mcJO10FrTXNVH6dIaqRiQTIoSUPH7YS5IvQtmW0r7+W2fo7R7wavzeInbGyF?=
 =?us-ascii?Q?EscFXQ7hlbW+PhX9y7Qn9OIEEfh/S/FFvVkrebnROGbg9p5n6aPW+oDkArJN?=
 =?us-ascii?Q?6znNzMG1MKNWiGogywPrkFCK2TMPHKGcwfcQaT0YBknm2CghItdVTmdjYWHY?=
 =?us-ascii?Q?QEgIZm31kePP7zG0XvEsZ6bS9G/byhNYfTYBH6g/DYZj55nQsxKEStTcYO5W?=
 =?us-ascii?Q?vSCzgPHd2SqGS1mphK9O6lIJyMcJU7A2YLWH8ep/gxN8MZHSqmuGS3RnOZ4J?=
 =?us-ascii?Q?NLHDCXLveBBxBVnfpakJPUWzoevjqqLihvcXGgq6a8jI0h3Ut3Q377UeS0DR?=
 =?us-ascii?Q?oi7C50vBl5zyjEK/R7MIEy7SSftU2m8Ib9dF7AFI1gtG4U2HRofoBciSN41t?=
 =?us-ascii?Q?RlRtNR90WSH5O+zvB5GaYzEcpBNaadRUfG2qjgRuG2UKyuno2iWVUet9NRQJ?=
 =?us-ascii?Q?dGGFPsOltUUv5fENBcRzEJ3RTu8vpBit6zC2yHzZeDl3ecDP0yPYa8J2hFnp?=
 =?us-ascii?Q?lt6KAKUhdg/DAQW2rhTo5jz3sbLLTO6j2PdhNrcS1JkCMBYEpfLJxFWjwKub?=
 =?us-ascii?Q?Ak85MKiTd+e2qxsNFiHK2iXzxER0yvrCQ7zEsmreMoXowoftwhfMpLOntlSU?=
 =?us-ascii?Q?qwT/Jv4+rr51VhRPMn85SZ16xX+c2vbRAsazDSlh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb33139-7771-486d-5f31-08dd7d5b5796
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:55:42.3783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpn6VE92fQk7QQ7b4XROqhaCawsV0D5E85a6se/ETGQv+WiG2Qs5pTGdngQfzwrEwom3WKuLeTBOR60Ez1O88w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
X-Proofpoint-ORIG-GUID: E6_X35WMksCNHQBj4tZdS-RQSjKkH99m
X-Proofpoint-GUID: E6_X35WMksCNHQBj4tZdS-RQSjKkH99m
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=68006db1 cx=c_pps a=2/f09Pi2ycfuKzF0xiDRrg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=6uKOi5zTHXshXRaFOj0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215025

Backport patch to update __version__ to 0.2 to match current version.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...__version__-to-match-the-tag-version.patch | 30 +++++++++++++++++++
 .../python3-unittest-automake-output_0.2.bb   |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-unittest-automake-output/0001-Update-__version__-to-match-the-tag-version.patch

diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output/0001-Update-__version__-to-match-the-tag-version.patch b/meta/recipes-devtools/python/python3-unittest-automake-output/0001-Update-__version__-to-match-the-tag-version.patch
new file mode 100644
index 0000000000..c2e519a12a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output/0001-Update-__version__-to-match-the-tag-version.patch
@@ -0,0 +1,30 @@
+From 8da931c5e9e32a15091d517b28cdf2e2b5395f77 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 8 Apr 2025 15:55:42 +0800
+Subject: [PATCH] Update __version__ to match the tag version
+
+Update __version__ to 0.2 to match the current tag.
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Upstream-Status: Backport
+[https://gitlab.com/rossburton/python-unittest-automake-output/-/commit/8da931c5e9e32a15091d517b28cdf2e2b5395f77]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/putao/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/putao/__init__.py b/src/putao/__init__.py
+index e8758de..00265e2 100644
+--- a/src/putao/__init__.py
++++ b/src/putao/__init__.py
+@@ -5,4 +5,4 @@
+ Tools to write automake-style test reports.
+ """
+ 
+-__version__ = "0.1"
++__version__ = "0.2"
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
index fefd4654c7..a8b834a126 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://gitlab.com/rossburton/python-unittest-automake-output"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f6f16008d9fb7349f06609329f1ab93b"
 
-SRC_URI = "git://gitlab.com/rossburton/python-unittest-automake-output;protocol=https;branch=main"
+SRC_URI = "git://gitlab.com/rossburton/python-unittest-automake-output;protocol=https;branch=main \
+           file://0001-Update-__version__-to-match-the-tag-version.patch"
+
 SRCREV = "aebdfb188e368c690ea55cf6c9c9ffa1a52def65"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


