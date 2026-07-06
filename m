Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8441C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:29:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148042.1783337368615744078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AmLim9UY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=164719aade=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666B2EHu3158164
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 04:29:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=oSMLjKy8lBFsIA5aY7dVo2NI0AF6wf46mhyMmr6IbGw=; b=
	AmLim9UYp0v2nVFuW5CdeTMEpVvvTS9f4MmYDStXXp8WrNS4ja4UU60zvMYCaVfB
	DxnVAuMY/nqFe8Xnc+hD5rBeYTPUYssrTK8bBwqT9MRQ7deDyMj7sr6be7TEclHj
	bbuh13b9VRh7lcM/c6z5m4gDZqLhjLpnDnS5gXiIXUNR9T091kxdxrIZItjYQQBM
	B+goPUba2jT56WvwoeRE/3ZvXxrQoxrUx+rfyWARaFHMJz1c3Tqr8XDTXdBbxBgF
	8F+rZJTe7JTC2EBqgUBd7WvFjf5c3f0Uq78TNGgieJcY0wK+ANV6dEDcz7c0NBcu
	eS3zGSBxf6UlMncp3ZgDIA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f71pe1tg7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRGQkJkwBD6YFfl19iLjL+cwbES3VFIsir/65eDc9q2D/vJW8Km8oiuEtWaZ07+/DWDQqD1BfuCzt04u8So8Gc8xnDL5GN4ChJD5g5c7R3E9+y1+JJJOxPWKGn7+IFtX8Kyf9njks/EmN4nh6cx/5r/70sDaW4bfDWdrikjV/EuDWe1AK1m4mc5AClWfXQp4VRNh93SHkPUd6JBTlh8cTthHTs6AFs74L8txLLQQD8mposGpkXmPmjXhgBdhygOOObTGyUIl5UybgC3iEQHxo5+R80WiCloEeeovLzLzlHExGOwVAnc1qdoZalFS5Puk8c4iihIAhm3h8o7TzDNoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSMLjKy8lBFsIA5aY7dVo2NI0AF6wf46mhyMmr6IbGw=;
 b=yHC6GUgHxYhoJjG3+O1CDbYO7/B8XCyixuHkZiEj9JTn+3yKy/1iRRV25dsKu4XwgM9PQ2RT9siQeJiPHu8JbLJqBFAZfeIMYXB/Kq5B5z9BN2jnYknUrE6wDCaqRiQ7qFsn41p+MbHiMUfWEFvNJxUz7esVxESyd9iXBN7JM82K2Re/jF/Wwb6qkwvZjDOhwcm0KqwaQHhOmALeC3CiY/MVvDgmPkXlcLbfKZalkoB6wuNy3kchXYGSK5cuw94jHxGEE7YsnSYCdhYyOmqrH63iEO1CcZy3iOHjHoAQZeb+7Cl3teadJXu8Xkq9mYqZ/f5IkknH/6EUHzdGTvZxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM3PPF67FA1A8F8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 11:29:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 11:29:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH 4/4] kernel-yocto: Set CLANG_FLAGS for kernel config checks when using clang
Date: Mon,  6 Jul 2026 04:29:05 -0700
Message-ID: <20260706112905.41381-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260706112905.41381-1-Harish.Sadineni@windriver.com>
References: <20260706112905.41381-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM3PPF67FA1A8F8:EE_
X-MS-Office365-Filtering-Correlation-Id: b56637c8-64b5-4bc2-b19b-08dedb51d5b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|56012099006|11063799006|18002099003|22082099003|6133799003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	rWvJ8I6r8Dj5+I3DXSyHAos1/WRxLTPIa1Qe+qZOVe4mcWwzOgabKG5XkWXQBmDCZo3M/2rpLhQULeoG48A0pBDEtn8SvWbT6D8O2zTqi5Ob8/TIdpRtIsJoP6qIzYgH4ncJfQ+HjGHNGwi6IQieNvhUOrx1gEo2j6gx+XITgSta5WjM3TnE3sXY5GTawhFo3lMou2YLrFmZ7JWySCrk3dkIFnTiRPK2PqlnUjOuYgFQhE1dc2oESR+6aT4upiFGzOtNlvJyN6LlLtLO9+EFSDZmZ7lHn+1OhZIH+o27iqcgY+MPC814EJJbpRFJKTgRI0cc64S7Ka9Bqt7mKmBVklfgsjSK1P6Fat8JbnICf0bPQRCkWbf0BlrdQmvdwYcKOHTxxirmRV/bn1bHWqcf1dy86KSMD2fICG/6nIjm6hAlaEcUV385NgloHjeXHtxkIKgjr+N7p3+V29nqggqzYTLnSpjAnTccW8jmMZgy7UtO+U00Z64jOOWqDd8YzgXwjKgbkmzFeuBIh5Hp6FFZewuwU5ZsVcF+vdP/AHbjF6HU+Yu4lEF6Yq1MewyBoEFFlW5O1FrmIbEH2BFjxTLHWSKf+YvKBTp3dDZT2Vn7Eei/6iMNTY1psR3WbgdVeBCoE19S2yeL2Xs2Tpif8Q1N4kDNtpmV5YHSPAjjnteob9wdkl5Vw/rsn7ZR1QnUz5vJ69cx7aEwUTS6r9UZ/tm8fM5tXpH/hXcDyPo4gCnVNFs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dp9gfCwH1SD6PwbaVeB3qvwlXfDC4q3jwgxgt1LrkF12+U7vruhkkauh3CBm?=
 =?us-ascii?Q?l/wyVhK0Aws6FBG6q6zgH7Lo6nPbzeknAp+p6NTD+aIt0V//EoJl4fKtATnR?=
 =?us-ascii?Q?3o/kbolTA/GTF0PMFyVMvCQU/qqAaHDcYF9tx8tgmEpV8Djb8JkWWRi3fjUP?=
 =?us-ascii?Q?+fDUdiNPp493Tdsic4vPwFxHLBd+TCTkmq4fKN0QhEeeto5bkdyL4em9b6cL?=
 =?us-ascii?Q?KYzFbG4JhZJ0vMg+TPtEO/ETDYiTorfQZxWY1mBQiPlTV0egvJknAJF9+LWy?=
 =?us-ascii?Q?0I4K3f6EV54McamZtCuLB7lOca8H3amewoM/JyGCsIWc/E1HVSUcyHL42byF?=
 =?us-ascii?Q?Dy+OVaQIm+anbdW4Ql+BSqKQIjb6WI4XmFqJiiBzCWin+btUG4HZjVAJxn74?=
 =?us-ascii?Q?AZFXEBtFu5MC6ZeEWb9PkfWt0kcvAoHGr+8rT+qMKzXgQT2lyLiSPQR6U9HH?=
 =?us-ascii?Q?OEZSdHPYW8Xe5aMCHeOKpSy4Bzsj+k8SRIubURpnOJm0g8ezefgL1ZgxKanx?=
 =?us-ascii?Q?JBRKThEk/Zqev+I2CRAaVP10P+fYZqlylfGwVMz9BvHJWPy5dagiQ6uMWkEB?=
 =?us-ascii?Q?23KFwn0DkouLXJu9maIxBas2SeMVr87niYFyvo78USyCLVrTborQ87VQDeU0?=
 =?us-ascii?Q?aDpYI29HJ6S8f1wKgq8ndjzCcbw9bOjKVN+MeVMQwd7vu3TjhfeekjjLWxaq?=
 =?us-ascii?Q?c+1XPMF/Kqa9GNYlieq1tuiUOW/hsNVkxuFgvS3dZqcKXCNYkbEfSgsy/t9w?=
 =?us-ascii?Q?S40wxbJ21CZAzBqOZkyo/2fqj8aVN3Gmnr2DuRrBoH+0kuPdwF/t4ImyvrmI?=
 =?us-ascii?Q?9xUTcwUI2gnCKT75Wk6N2nWnM0tUpusYW1mtyBPjD6PHae4AINkJJNfVU/cd?=
 =?us-ascii?Q?WMbR9Yu4O+kZyQJE+R0xcqjj/0PBKuDc+LioZstlUfTcwvPCGPv4KDI6+yuJ?=
 =?us-ascii?Q?xsIYp9yEv1a3Q0OOCrNCsvrhoc62TMuMe1CUYfEWcYLtqi0wX/zf1sQAVvtU?=
 =?us-ascii?Q?qQhmbhpYAH4zkhrj3KOYhD/DyqQySlZhkMCzPwZx99v54HPcPjg1nPonayLg?=
 =?us-ascii?Q?6ZyVDUb8okCs3m07KJ2OfjVwl7tMDGZn+A+qUSTRzH2qc3HZ+TfYzsIOWq6D?=
 =?us-ascii?Q?dzjpqKUfUdxYCL3P3W5wjbP+sJ5sfw16SSShMTVKSc68tJH+E88FtReDReBM?=
 =?us-ascii?Q?2bnOIpA2RJA+HEjgRu3JSIuoaApNw7rhWzU6FFz3RZKvzMENLO7taHEUtmvq?=
 =?us-ascii?Q?/xz8ORiFgbCx6SuoFs4qXbDUOeFpIcYjSFI0xd302LozlvSVbU68tZCRgQHT?=
 =?us-ascii?Q?J45IMtWo7HQZ0ILsM2DjJfaEAdl1tFft65pWcz9Qon8R/FbI5JL+tRu3XNhe?=
 =?us-ascii?Q?g3Ahw417f0/+8AUcU3b0QBexqA5WniEkgYN4nNW1iznZjk/UBN+74PpqVzgw?=
 =?us-ascii?Q?D3LPSrxYN3Ih/2yTA8edpGADHUO/TMDkJmSqRvssTwGmdAxa8DIMyhD5f/Vk?=
 =?us-ascii?Q?yfhoyoXTJXCys5CwP5e5QYVdlWO/iFaymztAAAZE7t4jtOqgzHjpIbcOTdJw?=
 =?us-ascii?Q?rgr4S2aEJ2gHsigXDxQb4F+AKNRS4bXiyO/5gyzo/1qxWkuz928CMn8L5od0?=
 =?us-ascii?Q?Q21+vv2HNUWfQiX0TiuIAIvErp3ihCK4vWNO1S/RUNXV2xYGBigrsmjhZ0mH?=
 =?us-ascii?Q?4HiAvFFgSm59SbmUR1CNXr0KV8nkzOwjYX9ctQ/WSk6mtu/lygX6XRrLGWFw?=
 =?us-ascii?Q?9NKkOg7k4NT550pjrbzfXjDYOrJ++mg=3D?=
X-Exchange-RoutingPolicyChecked: 
	MMb4jYY0rQQWyMSJg7f+U1K67ujFwIK0b4mtzeoZHGDJS/ivtNV68lh6AGeCcZUradfi6hLvbCVemk0IcgpH+xOzlXDCHOXmG43r850t3JrbQp4oSxJep8idPkaeF52yJzO97vuiK6RFRDbtB3ieZqyxIYFk3Vo402/Pj/WCOkj0C2nES8jElFDRuHmYFWXfbDMcS2W6TfqsJhH/pD2QQ6wVq95WE+FXeGvKFctd+yXZvyR7t8s/53QYlqygO/xO61K56hovO0NWJHTkA88a9zN0/eybj9pAF5cNru9sPfKxxcDxkFJFb9ecXP89Z8sxSZTUD6Uwr8/J/Q83icWDmw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56637c8-64b5-4bc2-b19b-08dedb51d5b1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 11:29:25.8760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+WsaXQ0PzEWhM7OhecpRiWJnhAPsV7Y/tE+7nCFn2TEMyt6oMO7N65H6RYZQDv+bY9vZTFXzN3P/0bnsx7YyewpKVHa+gY5j3AVEeLoJGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF67FA1A8F8
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: lJBK3I_-p1ZaG0cOuVdVVDqspmvkjJny
X-Proofpoint-ORIG-GUID: vrnBbcH7NdR5IXcmLMXGdST-XHX-bWlb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX2wPF/xX4BOBa
 oYWzZJDLzQt1Swp+dge4y7Niiub3c4Eim8s1SLwd3hqxlNLl+XZbV1BGHjF76/IOcBDW1N+MZ9K
 +7gg1Zm4FFN2tvkwwO+yHRGksQcoZpAHfTB+UG7IrDFPyWM9u35qSkOuX0dLSYkoX1h8zuP6qFe
 AqsktAtoY16FgyH2EndxGjJmT+3dQRo2H8TWl/gCDSJm7ha56CP3yS9xYG2JKkQirb7WS8f76LP
 j4ZRecosSCoqO8RN0Z0YDCuvnivAgCQl+9Zlsh4jqryMi5ZBeekf6ckWhcIeAA4WeUDCxOmx5I7
 mhPvVxozrvQBjQVWZMK2zUiVG1+KUr+TwRj1qH2U1r2/zAJ5hadhK/NqF9uCiEliHT+TPqOMtKK
 GBsCdezGAiv+jk1W4JAackFj/Z/w2dKlXItqQISXDeTosGkqbXmZxFpXpZuTt5KpkGOHsb/gx2e
 xBZkpfvCNPnvr+1HsKw==
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=6a4b9198 cx=c_pps
 a=Gv32SYzo0qTo49aZOIuVGw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=aOuplgckfP-gDmdpiNwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX9n5zQFJxnYMS
 tjiCMtjYcg4q9ItBfkHtuDSMr9eQJtq0EdFyMn+FeM6VqtQBTYSW3lHWA5Ka3TGiZbfG6EAuHqa
 D+cSE9XWGrrrvT40x/wQ3zF2sraQipVHAlaQzkM783iL5xPrkRCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240259

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When building with `TOOLCHAIN = "clang"`, the kernel's configuration
check (do_kernel_configcheck) fails with:

  kconfiglib.KconfigError: scripts/Kconfig.include:51: Sorry, this
  assembler is not supported.

Fix by setting `CLANG_FLAGS = "-fintegrated-as"` in the environment
when `TOOLCHAIN` contains "clang". This variable is used by the kernel
build system (via scripts/Kconfig.include) to pass additional flags to
clang during config checks, ensuring the assembler test passes.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e7fdeb5d4b..cda9ffcf9c 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -603,6 +603,9 @@ python do_kernel_configcheck() {
     env['STRIP'] = d.getVar('KERNEL_STRIP')
     env['ARCH'] = d.getVar('ARCH')
     env['srctree'] = s
+    toolchain = d.getVar('TOOLCHAIN')
+    if 'clang' in toolchain:
+        env['CLANG_FLAGS'] = " -fintegrated-as"
 
     try:
         configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
-- 
2.49.0


