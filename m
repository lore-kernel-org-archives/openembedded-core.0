Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D22BD58E68
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:50:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154919.1772434200414038389
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MHf3stGJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225VA8u1328217
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 06:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=B4Z8xzuVmZGXrE1/xXKNPY6dYsfvIfhj9TdiatpZKN0=; b=
	MHf3stGJLKADZLB5cYo+GClQBIUpbPDrEQ9/R3bIJKIajkdStMug8COoQEo3bzka
	dPzsAXKpBlpcCnxyjs3ytHCXfTOJVgI56wjYRyMgHZ1GKfCHhzMXe8+8pHMkX725
	jc7weLLu5mx7HDCzyNjDxXAQFYYstrjgeYmIzQqE3GQu3tUbkmPLvMN+Wvp1RJtN
	sa47q7tYtuHKxucBOrV6bninTTfSHoDyt+DN+pVkIUtkhl4SyeWzm+5ayGq0A4x3
	7QBV7zEzm/fdof9dnOn2O+WMy/Q+mCj0Bt8g+pw/WfVkNOOY3aAnYRgLr6pGNXzk
	UXHzqRDPEhUtamqV6PAgMQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010068.outbound.protection.outlook.com [52.101.193.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvj2jk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:49:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBe0QGwEC1KdaS1ZVX8lbgiaCCtkJWpiFbcpO8rh9es8pkFjtqYhCAwOIq4qEhX0AfxRqg3c0OYO3lvfj5JXS8IZHlCjl8c7ohfGNN4ZdYRxkhGCVWDe+kWAaFMHF5jppUmatKFZq8SpNOgNRF0Q/FHl7pv4SvuIwsEu3N8IE3nfH0ueURoOdOECCmkp/1+dArBuWtUlhujxH0aM1c1oaFf/YjvTgqfTjN2QHlxDY0PtB1HKRRbZNFVl91pNr729zGas8i3z72a5esi+NCvRyKBzrs8kFnKQD0pkmcL8XQocoZsV0b3ht1d0HeBpYeoYuB81yYIdx4oi4NvhvhZm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4Z8xzuVmZGXrE1/xXKNPY6dYsfvIfhj9TdiatpZKN0=;
 b=CMOR6omdeEB8eWGRsCbMfw5SIU6CASnsC8Xu4rbNe7xBec5s2ECfdMsYazsPfAqm/3TkEjNEF96rEDA4HzwzxYEBN+nxNNIiJGYiqAk807Hx/0gD786W5uNUjkkiD0kgO3RRG1QRbvUo1hakhlTfBaAZqhHol4v8L+/Fvw14fPLPRZMjuGAHcH+eF/0Pw9f2TRutBlerqfO+F//aG0UoJ3/+wXKau55fgHIHGbI8D/Xz4r9j6UIhqg/cMjb6vh7Kn60L5m3zRKRp/ZBPezasEtQAzUgNvUmizdp+bsP5VPkkkRRmJoTxsIIRq6GgV/bZ5cGE2LESYq9RqVmzxgoZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 06:49:57 +0000
Received: from PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de]) by PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de%5]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 06:49:56 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 1/4 V2] clang-tools-extra: disable tests
Date: Sun,  1 Mar 2026 22:49:35 -0800
Message-ID: <20260302064938.2052450-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
References: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To PH8PR11MB6682.namprd11.prod.outlook.com
 (2603:10b6:510:1c5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6682:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7b5b87-10ca-4601-c009-08de7827ea19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Blx211FPyEyjxn7a4JTt0HcqSvQT4kIz2GvtUaQqPViDzfwJr72I9Dph8dyjzi7L42TlPuhyBiEePRe16uwfgBMxK8uCzfHNx7FXaGsAWd7x4iHZ/BqQQrL0LOVsNCxVmzgCk3dTxe/dixNwR5XGg1TKFCLdufh14QQ58JmCD8cctXGv/8XHyChe0o1/3hJ3R4f0TDXbzrTncRE8wAEGHZ8AGlOtAjJQxkQTQIIkoBJlQpwmwaf/kvV3Qy4AMnLBRq8Wc/wTa1QIIoFpSYqyrV6FdCJTKeqrV1k2Bjm0i6OS6+wDfXSzNNPSgcLLUFazzG9sEFR+5xYMS/eRmXMlhTt3xX6Uomt3loovBcEeIPPXjaP8btvBirMOy3XSVdEMfZ7sL+6wNqK2DZLSe34jaq1Dp8bups3FdQcRWiBnc8ExqRjkZp4lnSrSgkSrptM4jpUNcEAzzBGWs7p5ImWDQc7DHGpsMP2fH4JDkw0N0JNjDT7oHPhorrSmXE9HSFOdwVqt/DlYRTvGggHSNHLCViA+13l+jYiHNuWe+MZbNjs5jDegfxY9x3Gqbkn/TSDXgchoB4EJuE8fT5orYq1+zxIW3Bk+YV9u6ThrkYzQZ7hRCMp9AZbOCBq4SAz1BnYZ9GhdGgH+lejM97bbmLH9aEjwT1+1iAzrEx34JExXvbcAcowQxQEduQdRzeSYQjmBX/Ryldxiq66p24YlEqLaUHf92Sr+Zs4+4sIUGjb5u6ayIu+1zF9o77w6Xc+pr48P6Z2lsrtp6Xc7oxOJznNUYm5MaRjFzUGVc+ilxsPoGbU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ktIfk1QkckR/b268W4zyXM2xaCnEbj2lcc9Ye7M3q4Ckd/y/OADkTC57nZZC?=
 =?us-ascii?Q?MZkLEvm7mxKVW0DXWwh+699nhnW920mnJ78lDevX9jRgC01RUoPGJ0QJHli/?=
 =?us-ascii?Q?7AAxNHpgMScDxntdp5EwlNBas13FwgDmUgMhtqZlK6mdkwcgRBIgKMgLHZZY?=
 =?us-ascii?Q?CjgC9YJqJnGT3yqx7nW93m9OwL1EPK7UnM/Np2OnHtPJx9u3s5n8Q7LD0c2k?=
 =?us-ascii?Q?auHSLpie14KoumxW1jongkdjyocR45a14FRU9uB7l6ckeqrKJeSacPXTEkkt?=
 =?us-ascii?Q?zbartWvXjNuwYFzcWn/UCqkV7q6oBT19PFukUaJY537excLrFgcVLwNSo8X2?=
 =?us-ascii?Q?+1VBLbXiAdUb1oAl28aig/I4qHRHOveILm23YqdzLAgKLuIuPa6NsqUEwmis?=
 =?us-ascii?Q?fbFYDtQQ2xX8inioObxN0gUSRBksT9BZL8ZSVLczarLKmkurDFMEgmLqeBki?=
 =?us-ascii?Q?B/oTIcY45Bp9skm6ehwg+ZWsYOaMI7kZFoSS5KRvb/YpKp0nrAFV/r/TRXs4?=
 =?us-ascii?Q?t4wSf2CEdpFhn7bjQ56f6+g6cVTC29JSkM0/5eO89LiLkiTizQ+yfMgo+0k9?=
 =?us-ascii?Q?NCkuP4AU7vCOAieZwMwaUHBcLnBhoud2y5WaenPpEbxfUC/ncX2d7yztxNIm?=
 =?us-ascii?Q?CBjG6f2UNGYlZ/iODOdpLztt+wGnPtca+S4N5v9mGPYo9f7oe2H70eSy1IWe?=
 =?us-ascii?Q?N8vmjiiZBLY0bn30J9eH4AlrB/qOXTG0qUY0mCQgABwjZLjCF32644bcsLzU?=
 =?us-ascii?Q?MxVG+c0uHPDjogf/rJnc4ToOsLL37sWJF+ibEfEI2m57VE56sDiRbOoIQjhO?=
 =?us-ascii?Q?4UgQC7tgEy5++BEPcVg4pS9d8kReNgstM/x50g9bp8sULqJWsC2NDp6sHotB?=
 =?us-ascii?Q?xsh7EBpW4e/2FB7yTGJUbY9ntu/TsFTH3VhGFMB+WtDipuQ+dEahGpezUbf9?=
 =?us-ascii?Q?Kf80ESVupLyysXi69RN3/9zwoHdB6YyW2wSDdK1ur/r5cgh4G9F35UfBfTit?=
 =?us-ascii?Q?95avpH8odoV+hoehIpdnW/PmRZOfvXDIUkz/ZsSQKWSjjRqGWFAw9YzWxCDP?=
 =?us-ascii?Q?EaLqdwWVIPXPBDb28m35eFXYtBLPNcOnT5o/yNN+Wqk+CO+nLG4NQI90VaX0?=
 =?us-ascii?Q?IjsXNyL0tQPezTbhaxVx6F7/nwtccB/jPEbexHOEurhY2wJdGDLn0m0eENZv?=
 =?us-ascii?Q?IxCHQ2hyeSrLblvmmRrn2uyZmJbYycAZh0jRC4nLu7kagAkV+8fulpC97NkQ?=
 =?us-ascii?Q?WZGTaYxrpqchz+KO7++GFtEgWWDYZKAeCAd16m2tbJk6X4ons8nByAL4Dv2u?=
 =?us-ascii?Q?jXEbBIifTHsVEH6hO3/xmo/xjwRGHQvLJbuLahhxNlfTZqDeYHm8vflKg5+k?=
 =?us-ascii?Q?Z7Q2+gMZx0zNwKKyWC9710ejSM7nLNNOrYGFju/yZeui32M3GKM5tSM9uPSb?=
 =?us-ascii?Q?CWS37Gl1LD2xxdjqOGHBeIeVaiKZRFpubhalIMp4ViZyk2qXDHamJp7ek/ej?=
 =?us-ascii?Q?ayYycGBra4b6rCAow/Zt+IpOEPbzW/ztMCX8q/RYp8SpxPwqdaMMVUTrWvJn?=
 =?us-ascii?Q?VuxZB5IMc+fkVbWOyMh/mHq1wLyhFv7TpFRKVfdwueB3/x0ypQergaxttR1v?=
 =?us-ascii?Q?b0865LhABFfxrpitOa2itHUb6lqvQ/XIb1ylewA63f4zUSzaikXPzVC8xtP2?=
 =?us-ascii?Q?2GrkOQ6j2Parw4szHfUsKcGMj2XuhoAozthYuzjzQE3C1ZLkZKfj7ojpF1bm?=
 =?us-ascii?Q?fuZP02Ruu8jRJc3r4mZE93vWYZlyzlBw+Y6NlLf+FfIqxx+up1OI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7b5b87-10ca-4601-c009-08de7827ea19
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:49:56.0521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0dvtzUBugaDNLmw1tVthZfYTU6e2oO5EyuaLLtErYKknTb841cOKppNOdk3sVbo6dPJ8DZ3WNaZVjVKgek1LQWuqu3LiNfoRuxAGu7zf2I5dh0XwB907xZs1WgsZIFp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-Proofpoint-GUID: 5qfBwx6vrO1aU0pnRBloQgOq9FJpBRrU
X-Proofpoint-ORIG-GUID: 5qfBwx6vrO1aU0pnRBloQgOq9FJpBRrU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA1OCBTYWx0ZWRfX8hz5KQN+50mv
 xjPDEjObxrBbpflm42rOfmmqMgr1SloqzDINjdUhLYGCuvsAgoe0jnwgxxzXYKKchlF9ld4iEKx
 ilURSJFypq4/CZ66dQUCKsKeAu4Np+eey1fC/+Sq6r9eG0EKDdf8kgD/ei25x7LhESkGsvE1H2N
 Tzag3gVyv/otOt0TD81Nc6eqkBJqLAzyqPRZLqj3AURaWBevMF2AwfztYmTWWITJyMJL2tuu7dV
 FzpaMPcvFEi3N/3yX5zHaaEf3M2FP8rdO8nIOOu/RyEE3jPgNNGoRo3SQOcFycNCyyxVmgUhrff
 QolGoSv2B3ulkiAnI4FkUa061/uRHU/D8jiLb1sW8NXGBu54TWWqsjBPRC1klrj3VlgkxnAtYG0
 9N5mpQdPQ5GNbRsDaJenzIFhsTlZ4ttrzfueXqqtRYBA+O2xPbrmofRhArT9SKgZt/Y2rT12/sm
 OkDSm75oZR2A+hqtqRQ==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a53317 cx=c_pps
 a=k/S6D1Pxv1bk3xTbD0KMJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
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
 definitions=main-2603020058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232174

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


