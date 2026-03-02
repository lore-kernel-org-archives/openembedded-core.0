Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7904CE9B35E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:43:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157818.1772448213020044671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k2t/hsdV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6224HAj51201972
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 10:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=B4Z8xzuVmZGXrE1/xXKNPY6dYsfvIfhj9TdiatpZKN0=; b=
	k2t/hsdVXVYl73je3F0oyLMeVNbqo03dKIUBR8zabsCIFI4pkDkM/ANGxqwA1Nxy
	lix3jNyn4A5ly/hyCltLLJgLCZfFYxjT0FVUanNJ6aoz19eJ/dgoAVltSrUvMI+Q
	AfBJjHNT7CJwXLUByQN79MnMpR39lZBIuodtamtl09DJV7rKVnnpJtPTSwS9BBdN
	c5FR6MyayM9U/FIn/M4hplIyxKVGc+EgJS3T3PslxWUj3rEcTWdKYUSFD5XI6bkU
	Mg133K03UXT5OFp3G7J8wRz9px4jK2G5KoDtuCDcTTrXNkRK0BM8Ss2WJTwIHZvp
	N9FvrG/IGKSQqILeBFX18g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvj9bc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:43:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZhfJN2CQW9y8pRd0HkdLYM415eE8P1VQ5aVCWNaRX/k/pepoX0CeIVy1WgVfdPlEBIvD2Rvf0mV7IDet47FF8D+J5iubRm4bw9ntlZffcNT8lKYKCaZ6pWRHiv2W5TKZBanX/yA3Zhx9ScCG/BNinmcmPwdIXLbnGWt8iwAvLj+DwGiHx6bv9lGVmsULVTd6ZFCb9qeWf1pUhRoZIGyO1JMHB8Fkwthj0Ix0TtpyZE3oAd8Cn7vZ60p8gGBtf65eHO7TtLwGS0i35B5lINzBxfNodlpoXqlBkI8HkDSgzBAJbE5N6AQUpYyv4zbgulMqlg/hJ8gcQ0rVh0EO2NFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4Z8xzuVmZGXrE1/xXKNPY6dYsfvIfhj9TdiatpZKN0=;
 b=CtYNGTEUW+SsxCOj23paNpz7EbhCONmnblopl06NZ+ZfIMfDHlfGTIv2LUjKL/iMc81bQoVD+68RXVRFImcrUyroqdsCf8Oy1+QLHy+UeZ8vGo+yNqlbin+x3WpBw7iUX+5CIugqJpbJyxd9ESqOx0plvaALxlHAjWMwYeoH+ajEm+WkyfNkd2ja49fhjxFIhdFTJ1MVo5FILBV/jRgZ5kwjDnKaK500T2Rf4Luco0u8Uuiavqg9ImZxrEnTZQ/q6pH2x8bhmre6qxF8aEsYdnfsJYnJVVhZjUuX3JfC+YGmcJk4SjAUHmXO92cj9uSocSVUIn9poYgIYWIN5Qo3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 10:43:30 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 10:43:30 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 1/4] clang-tools-extra: disable tests
Date: Mon,  2 Mar 2026 02:43:11 -0800
Message-ID: <20260302104314.301665-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
References: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 195c1984-84fc-4edc-8672-08de78488b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	UgZSUrNQsEF7uBqHiLcv0tpmXgP3p6rjcHonRCdTy2JrxHzdJC0MR7evPE1zSTx1tiQdI70hsmRPZJSWm3dJ567HIVaEft0FEyysbw3Re/VxFoXNsx9Y8/GOmfH7EM73RcTv6HetdNRD3pSr5YX+j/yQCh6oUpWvsVlD/DloFyuWCoK8mKT+lrQrcGrkh5HRIJq3XYFu2wLiU1NuOmBGCZktQBm/1d+jaUvprke5c6Z8G4CwuSUR/TBDvC/efiT34zRBZDyZBnEKHA7NlfluGJcAsCdqGnEGoopbFMXHErB94DzWTqPrzrYfpWYR/55VfcMeI92B93hE+Cun4VyWZNDCQHre/gfuKbxsrVXLqDGmbPf3BAZw0OHUzZw8B/K8PDPTrsi/2K1Nw/dbcD6ucYMgmC/wmdgchR7QaKjF+ok/SpP6SX4fPRVjXJMPBvJ+1n+DNQgfW9pQ4NceNDiAAmOIYok5zF2bez8FVlwD982r3F1voLoNeYyuH9BG+14YzhiH2KhMQ69SIlM0+AV6+naRX/hayiruqaYPt7iYBsh6V055AlEmSkH7X0ybZM81kQzCCPStw3qNLHgyZugYMNdfd2VcA+1idSHhcVp0X9lwBsN1qElJOnlCsuba8dr25Q6Ae+1My2xuDNhtSm+3ZYn5M/P55EOvfgcxE9O+BAqkYecNsRKa2JTAa+PrmQb4+lwzrM+YB3hfSUuum6pxS96dkUtUZ5UgNC0vdtj2DNVnSxV5MhZ2QMkhbeq4+5EFsjlgC3Q+O3xELj027Fx77EXJZc6n/Sw22s9tJ1jOQwM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6JTlVg3j2HJWU8HOgMKoh0RU5B8quMpv0goABXvRA8wuF6y40JTJwgDIXZih?=
 =?us-ascii?Q?uaO2RZ9qNkF9rF0CNBIklmGYsnKS/HevHQm0TbdJE80sYMaXeIfUCFQUUQSn?=
 =?us-ascii?Q?KBZQwxPD7SY1/g76kIhdZHavQardZkI+66yO5bmWYVPIrgYPp/8S9mpHDmkE?=
 =?us-ascii?Q?pauFf6BNb+I/ZKoBpROjIeDGQHu5zJ1kyixvdnbhhvnTVospLD5WcNbmGBXQ?=
 =?us-ascii?Q?UOyl36e8H5VxQ0QgLjx7Bj2qghURDr7TTmj5tjgcavRTd2aaPfHqSF3oG6Tb?=
 =?us-ascii?Q?eWoSo2WmOmpZcjoC4yl4Kqy7b/G/jGbINfpd4o4IeuUnJOsmOM1L9RRDqog1?=
 =?us-ascii?Q?5GJcCl4TPZEHCXqSK6N9S0hO66HE6H18uUVekAUK0thXFgUBhM/3xZARkN7G?=
 =?us-ascii?Q?scKZksUiV7kMbVA3PKpF8k/PsFX30hLUX1sD/4h+f/iPsryGdGqcKmcmDzDJ?=
 =?us-ascii?Q?OR6a3/o+B+hoSZ8ZU0vRgawi36mcKQSn8FFTDX3n8AtHvTEuUpiQBXNNj0DN?=
 =?us-ascii?Q?rgQpbsLgcvaft3VWwypLwu2kLSohOMhdMTkraqJq7bHbDFkathGqqhla6NyR?=
 =?us-ascii?Q?x5b50KIhOa200oypR555j2gpjW5GgJx5N6w35RbXVzgltVfCQQzgYuCNWGZZ?=
 =?us-ascii?Q?DUK4Z2KpeOsBXJAht+WT5FqJ/l16care6Mp0IsdXO0z2O3k3ZMmNYlsKf6Ey?=
 =?us-ascii?Q?QitSDE3oCINPDlQDlUIhI+luDtnC3xRNR8C0KdU6UqXi2e10KOoNIIJucWLV?=
 =?us-ascii?Q?Skj++nfvfv66PB20l7EvxqS1+8Ea0xpzS+nbkozwdTu7SDgv8WpAIda9fp1h?=
 =?us-ascii?Q?fxJ/d52ppnFw2IhnoOTF93xGiSd8AOO/Y/CY1YDCfwrZnSmvt76kFAJkag6G?=
 =?us-ascii?Q?jFHMnUGUibntDd/Ay9WXbc7jb0RkJOIDrA5e8FjvSgBAVdChBzqKr73eZXTc?=
 =?us-ascii?Q?yLn6gKx35mOqKGf/zx6lWZl665hVBjJ9cy+9GApxt2Q64N2koy9a0EhOxa+9?=
 =?us-ascii?Q?LEpN+pCQDgu/bodhpZeIxKa0YKh9uAItM/e9YUqD2snCIKlBaDRwzJfmixWm?=
 =?us-ascii?Q?OOXw/0YfYVlTjJ5o4kJUXLrEPM9cSJ73G2deApqK9Tt16uXhQPQbcjOhzm58?=
 =?us-ascii?Q?8yaviR8PctUCb99qjTOiLfRImURyjCOkrcZQ2D2q/uBC0DOETTcJ2U8j1Wx8?=
 =?us-ascii?Q?RPHGxmTqz9IYvCaYvlfmr7w5KvLbyCcFB4pl1JkQFcSoH5psT8YFP5wI3plw?=
 =?us-ascii?Q?AfwPI6BpAddYTjKMWV6BiBB99ineyEPxQgB3b3Si+3cwFHuYN58qqaz8qVzD?=
 =?us-ascii?Q?ofnLNZOD0+EPuedLiAquoByVg8kRBKyeiabsqHmahV4JFx2fInOv+MQ0KFm1?=
 =?us-ascii?Q?XHzRTK/6LX1cVG4a51BXBqd/v7KHGcfLEd849M0hJIcKZivstqDv/RKvMJzb?=
 =?us-ascii?Q?No32WE8K6xLVN6+33PDg3+s5mXx3IMOXafc27MYh9cYcTLxaRt8k7cABBh1M?=
 =?us-ascii?Q?8VvMBPeFqHRBFixY/CqsQCYNmncamirA+PYs65s8fzyEMMfEOXiyRtLNG4bc?=
 =?us-ascii?Q?sUyriSgliTi/S9VEePhqboFhEf1KS1t/O2rYOoIKARKbHQuyP88lMwutZk7A?=
 =?us-ascii?Q?5PgxIDBOhLhl41JdPHdD162jzWBzdkDaGyc4shGuz+kFMFOPgzGdMMk1t6HN?=
 =?us-ascii?Q?PX+LkXnSl3/mr0IN+GyE7xNjyabc/BF58txeyMfH90pKAArAHbIfnKW6SdfH?=
 =?us-ascii?Q?alTbsIo/gk4i8SupXqLO0EKiIlTe64qGQ5nek/c1G0QWS0HAyaS8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195c1984-84fc-4edc-8672-08de78488b01
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:43:29.9463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9NsXFzGM4lKgmtQXHIH2bwUWa8qqMPRZIWxwd1w6oNB7N38sOmkUDzoiERuX7iOhXICDeA5pQ7EaOQuNtVXbABqaOy+oQ0hVczF8XxYSE7NOB/rZNYKrmTxKVmJPQqB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
X-Proofpoint-GUID: DIyLr4rDFPtypF5ZPljEgA08U160fwl8
X-Proofpoint-ORIG-GUID: DIyLr4rDFPtypF5ZPljEgA08U160fwl8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NyBTYWx0ZWRfX/U8+wkqDa+T+
 W5XRhHwQqjcr3R1XxljUGQoJFVy1j3VclTha/qZT/AVQzByXRe2RUQo1FLJVegRtXpPR7u3WPcu
 /Z5Ccl0CvO0G/WVvW1umjW97vS2z/shmlRSXo20inRpPmgG1MLzdWcJhtcbPw8VgF+hBVhs942E
 NNIrQ+4k0ckfqvokf2L+Xrc+IE14kvDqKoXYVAatl8feDJu/XMi/frQE0+qvngARTC42DVk9hCs
 Zny61c0nIIQ29KGHvBfwx7NIIlM2TewlgCgpnIpOy1EWKvZ2BJg69nQNNYGqW2ffpPB+wHJbwmA
 39oPYMkJ0fKst6xYS0cw6mCwcAIuo7yOSvjdZ+nOOKXHhe+9gNJo0CkgI9Eq3sMlK6SDjwvjC6u
 XahBTGkQZj+tnQ9vheBvU1CoaTasNStfqkSsisr0KvBA4uHtmlWkihTUZwokPWvmkp/5YB7FC9O
 iOFJ954VYNZqwKD2pDg==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a569d3 cx=c_pps
 a=Al0BzvsZ99ielPXA9PThCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=IQOrjEw-PoaY6VFe8koA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232188

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
exists in LLVM's CMake project but is not visible when Clang is built
separately. To run clang tests, disable clang-tools-extra tests for now.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../0042-guard-clang-tools-extra-test.patch   | 74 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

diff --git a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
new file mode 100644
index 0000000000..a37ab65975
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
@@ -0,0 +1,74 @@
+clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
+exists in LLVM's CMake project but is not visible when Clang is built
+separately. To run clang tests, disable clang-tools-extra tests for now.
+
+Without this patch when CLANG_INCLUDE_TESTS is ON got the following error
+
+--------------------------------------------------------------------------------
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-clang-tidy-infrastructure-header-filter-from-config-file-simple"
+|   does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+|
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-modularize" does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+-------------------------------------------------------------------------------
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
+index 6b6f2b1..26e4c10 100644
+--- a/clang-tools-extra/CMakeLists.txt
++++ b/clang-tools-extra/CMakeLists.txt
+@@ -6,7 +6,7 @@ include(GNUInstallDirs)
+ option(CLANG_TIDY_ENABLE_STATIC_ANALYZER
+   "Include static analyzer checks in clang-tidy" ON)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   umbrella_lit_testsuite_begin(check-clang-tools)
+
+   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" OFF)
+@@ -43,7 +43,7 @@ if (CLANG_ENABLE_CLANGD)
+ endif()
+
+ # Add the common testsuite after all the tools.
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+   umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tools-extra/include-cleaner/CMakeLists.txt
+index dc147f9..4855577 100644
+--- a/clang-tools-extra/include-cleaner/CMakeLists.txt
++++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ include_directories(include)
+ add_subdirectory(lib)
+ add_subdirectory(tool)
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
+index a1e9da4..94dcb96 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -213,7 +213,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 1e70e9c64b..c5f607aa21 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -65,6 +65,7 @@ SRC_URI = "\
     file://0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
     file://0001-clang-Support-building-native-tools-when-cross-compi.patch \
     file://clang-no-tblgen.patch \
+    file://0042-guard-clang-tools-extra-test.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.49.0


