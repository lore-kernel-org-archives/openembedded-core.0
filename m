Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D273DC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 06:52:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.95158.1755067953473400928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 23:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03202b054f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57D5REkr2724451
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 23:52:33 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2060.outbound.protection.outlook.com [40.107.101.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fvk21fcr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 23:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTYq97P+aqu04NpXDnNirYDfmOALyvu8seRs7KijwVv/h/3KSSOU7PSToi9njTNVSWImfZfck2dZ7Owlh+5NF2jnk4TZK+myA2/+TdsHWdjHOXG3We31e4OsCyPopoKv+vYkNH6mkgeQc+funxz8uG8cLfACdDiAk3IFfm5YrpbNURlv73FxrUctZgCphn18kvJpmbWFZJG7K29vk0JS+C/0+NgYehr266MSwqavZ3giJeU3YlY1yE1YvGoUUtuQT7BwHhSf4XatymOikficWqMgnM0Zp9aj9vaBCLc7JzJjk2jyMR2z9uVyf3/U13f41rWvjoxMyKUZUNAfXWCQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=do6EENLgsO25sBF7ApPD3I5K6N8lTHfMnJrmzjJNYtw=;
 b=X16XAOzYVEyK0eFKZxY00z2g5PVE2/Ryt9cWtwd8DLOyOmzRWUod7jsupxjyg46whkmiVjcIWeVPLnuO92iUdOQ17tzJFQde/CoWJEhWIhMv2tv19I4WI5UEjLQwf54G1tgr43rbCo2dWe/vdd6skV6jR2cDUqJ73F2pZEzvl1Vv2GSp9ymynpg6TsHSGrxIyxaUf5R5d4UCQOgOMhU1A6t2EOwisfFwMjjTq8Bs2/cK5yc0EwXRpv3absRbqNI0qEHu+a7VLPP+dtyQS6r1LyG0op09U+vqkmoYtbIyWZNJaPX36MrzE0wHZ3/I3zAKU8XUgNFO0C46PqQblKVRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA0PR11MB4734.namprd11.prod.outlook.com (2603:10b6:806:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 06:52:30 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 06:52:24 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [walnascar][PATCH] binutils: Fix gprofng broken symbolic link with gp-*
Date: Tue, 12 Aug 2025 23:52:07 -0700
Message-ID: <20250813065207.1326635-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0004.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::17) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA0PR11MB4734:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bab2873-0d4e-4253-7e95-08ddda35f587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WtPyGONuSVHr8EqfAu/wVSOvfKLgh0tAIohic9VeeBx4pzPSh109uQj1ewWF?=
 =?us-ascii?Q?ltsrYr+Z7ZX9Da+xkfQkj2PcSRRXwBzjsnqUonf8wGX52JCibQXnIJGIy4Vj?=
 =?us-ascii?Q?oAgPmBga9X+YtSauk839ra78xItutZBqK4VxrUHjNY4h755Xqe5lgVSpqS1I?=
 =?us-ascii?Q?uDNmQBCnxbaaF1TGhJBEKfRSBd7NwcyyYV+PjJ9lIQBnrPvpG5CyIjCL8hav?=
 =?us-ascii?Q?9QjUyZRd3o0h1oD6C/1xaKiuWEVh+ahpuhyNjIgV52N5KL7Ly8WIaWmXDrJf?=
 =?us-ascii?Q?iX09QP+037/8bNsFRVqracbH/wnV4rzprjTvZvHXlptztxNmzcyGBf0FFIxb?=
 =?us-ascii?Q?71LPsfzUoMgoZ+/ruXldUVXQF5EoX7brzLEGVX2y8GNbtjtyXGfil5cgOhoJ?=
 =?us-ascii?Q?vwzIXyHxSHDsFgsu9n/Mx/XyM4gZRpWt7I0NGglTL2qMYNj0ENd4PSBeNjx9?=
 =?us-ascii?Q?520TyqPUyFqXmWVVpmlWO+Xb1NwBKtmKjwMVjozw/H2D1h7ZJw30FfjoOaPJ?=
 =?us-ascii?Q?GaDKypV8ZrAASQAtcI4kGfFEbNOvqO9NRBTA/stqwMw/GA4xU16BBSL/8zi1?=
 =?us-ascii?Q?CHARH1+5jaSk+S0vuMcfO2qPNkvEBuBrUplfM7UP5n3wTibkGfth1OWacg7k?=
 =?us-ascii?Q?jHkbCN3lDXNxBYAHFe3Xg6C23aTIJt+hsxbBhsQzd5gj/rHBGbnstRPrXRmh?=
 =?us-ascii?Q?QEDdxejrG18WXzqBib3LwZttqjnL5b79qoC9Yw7AW8NRy1Ot9YRKriqvL2T9?=
 =?us-ascii?Q?sq9avVD90NeTpHGJKcoqBHhXddzRORPeSGbwK19iQEu/rqxGqRv+z8X0RnBu?=
 =?us-ascii?Q?dTWB59RtMhu2bHWz5Z/LiNatmuhlbphgzqFv0ZWjgx3PDk/nkg9We8ETynZ1?=
 =?us-ascii?Q?VGxkzDDjjLnHljqpKV3JC1wMCkZd7avl507ouMtfQ/CLYBvyo2ANCVo+rhvU?=
 =?us-ascii?Q?J4mDJMZrt2+wJ9bQsWe7jcsnZWRV2DV7thNfAJmWyCOeUkTKflzbnebtJY6E?=
 =?us-ascii?Q?t3kkCcEd9Yzt91WFbsYq86HWMq7aUggoqqY6et8nApNcjH8zZFMPEdi/MWXo?=
 =?us-ascii?Q?od7mIP/QeiaIJ4JpOLvtszi5W9c6GbkpTXYh3BWopNV6NR/7Ea2brXBPr/w2?=
 =?us-ascii?Q?SxmSduqE8a6G+8cFYJWHrfE8WEuPH55V4xdaxXDO+oK2uSJdSVKzMt8OTftF?=
 =?us-ascii?Q?9HhI87RJvw37WaWhW9sljTAy7urgvypFSgDZ26Zia7h+FSPAuV/ojgZhQzLy?=
 =?us-ascii?Q?sPwYU98P8aiyhp0MUYFkGikmY7RbEHq+vSY975eCI2yDmbEkl2f2z4jExsOp?=
 =?us-ascii?Q?kdiATk1Gj6tYVQdRyKWggCxubx6Cv2u4PEEsYXddwTiL5ljoblbwqGnT9Ztr?=
 =?us-ascii?Q?Zlph9BuIi2QvylnFHdv6tOrPiePTUrVub8H63CaHbIGUacVq9Tlub/fHpMjO?=
 =?us-ascii?Q?N5Ch0FhVOIc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q8Lv9iNXdZH3xCT0FiElg06GLzigPSqJ6fGhLuWKrDX/j74K+nqc/Stnhapw?=
 =?us-ascii?Q?jW0KsamDoTohW5jjVLSLdQ/4Pl41kLvP+OjkRmTVLUfNTuHTOZ4BBLDr/e65?=
 =?us-ascii?Q?XUMc/44d0WkiVRAwCsqod0QLYrxFulAd25zmPE9OKwSrRi9RovHalLiCs46r?=
 =?us-ascii?Q?u5qcTt0QjvqUKc+GY6RutXo8eni/A6SuvIUuVA3SU/qHHWgoyt9ZmFDl9MU3?=
 =?us-ascii?Q?qxWzUZ75glWFOaebenJufjK5mff+tIlCoA3idTJTI2TZaooLWAyJNS7eW1TJ?=
 =?us-ascii?Q?uV+QhkShggEp17kqOLvFYC2ntlidgwzXdoWXGkgswf/MpBIJWeNOyrImKf8W?=
 =?us-ascii?Q?hutTb5FKP9cpuuEAEbwOhWOvw/gZBloTlq9KeI9h1mVPATOPW+DGokwlyACd?=
 =?us-ascii?Q?7fq12tTyAUcxyoevu2QG56zRStOuMrTXN2PiohdOuKKB4Yzylsw5R7uEhHUc?=
 =?us-ascii?Q?4NbD8zPFj8t3oqlE+msnzQJz2V29DeKXBhl2B0QFv3KrhA3XIdUBKGhsgq2H?=
 =?us-ascii?Q?5NDd/2QlEGkoMiAQn5YTRAJP4TrCPDRTQ+JkubMevtguGBCgR6Wh33XPk7e3?=
 =?us-ascii?Q?NFFhsL2SWY5xoCHFjWFJQSicLMVOzJ5zW+JG/3vMWlbpuvfS7MK0dVzt5JRP?=
 =?us-ascii?Q?WuS/0qXzIdLDMfEZlrfEqKsi0qlqiADtiikyTd24CUR9iecBKNaeelPSy5PL?=
 =?us-ascii?Q?raQHHzvOxjrqGKP89O1s/DkPUGZezJL1118oAfKX0ltRWIJNGgvKCH2iQE6F?=
 =?us-ascii?Q?8os+KpGre3jrG5A9Keh5WOlwt+8LRTa4iaJNmld0XIVF++e8P4RbdJ+bTwQp?=
 =?us-ascii?Q?0V67es4sn6ACCot2bS+G+XhC8Etu4mNSDEAmbgE6MQvpvbhExVyhTvYBUNao?=
 =?us-ascii?Q?c2pAWz+fuZcEVCAZNl2q7joDForPoGGimAEZgi3qYaMkAg1EvNAit/g9bQV9?=
 =?us-ascii?Q?ac1SIpMMjnK4ynhcpGqlkRP1JY8KSnpFeKw52YfJYgy/hpfSxN9M3XrZ+2zC?=
 =?us-ascii?Q?Dv+52I4RmE4IaqSRQikTaRoIMm4P5FgQrX62l6OiWI+oPX2YTnZuxxxADbJD?=
 =?us-ascii?Q?TKoXf+w64eW9d4Hlcrld+5hSAZkRr+gMDFiGiZGvHVJ1eTmYSJ18RpW45WhJ?=
 =?us-ascii?Q?yuQf8XJTHAvW3GRaZWl49ujEMyuKjSkobTbOewU1AdcVWN8fRjtp7oaqfmGh?=
 =?us-ascii?Q?5UBD3vWLAnMDPr5Ur2Q+i9pPDwp8SdzvIzxVxGpWOLLf6HlzS9KA9Bxk+4Ch?=
 =?us-ascii?Q?dMHtiF3wZ/9rds88v4wrAV2PFSOTlGSGwkVt17UM/ZflFT9vjjZz3M4glCIH?=
 =?us-ascii?Q?wcNnNPX9aOTFUXtQx5jq6q/+aRC5HRupvjTHdIW5W22BSkk1d45IdGfpga/5?=
 =?us-ascii?Q?C+ILk0IkDNBkZV63RTagv+usggQAbi3APe2pjwo/2rEcjo+1A0pp8GP8hANI?=
 =?us-ascii?Q?yxBgqZGyvdy4VoBC9z08cMBInnUVxH3PBECKZ+Ksug/IjH7EW6t0MyCYnKOW?=
 =?us-ascii?Q?yW8Tvu73QwhOVhN5WZbcXdD68CjxTIPNGuULEs7/Gx1NsHtuu4160wZGcDQI?=
 =?us-ascii?Q?9gk4DOrEwZJrSMB2fYEkp8iY2NSwer9DM6x69jKutm6jBIFv8zC9kFwixNsY?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bab2873-0d4e-4253-7e95-08ddda35f587
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 06:52:24.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VTDEW8TdzfqfJt3C3K3MjuQ43zKEFA+Hf1R+gXJtDXg4AZpM+X+l0OLwMaRGEsthWhBjST8kNqqCXYn4l9fLb86Qffh6mJRUNrcc6MFUIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4734
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA2NSBTYWx0ZWRfX8sN+bE3w3A2c
 7kk27GAELC+G8rH25zmsoAzrIZXyvf1dKG6mFD8RWUiZpu1Zn9SSCDt5xllhfIc+5FA75kSeeSd
 RSGAl3ENe+Vy/CX+nAymTsU1eW7bTzdbPWzpDlOfyn6UYMqijveiHs9/8gubP/4fWSVXBPtc8xW
 enElvUipY614z7KodWsSKEmSFHrMM7xljNXPT3x9RM6zvyPE5uHBUrmGmlLW2hQUtMnUbOR4meD
 rATEswTTclt8JqWZfFpj7A+KAq6FSsdKHjrAqxy+dfyUZdKBLdenKyeN3RjM7PVcSAZXOHlKYWr
 mobkor+waRPJur8k1DKfJace/gLjtbQUGpl2v8kTdZuTA5oGpUugkKFmOLneuU=
X-Proofpoint-ORIG-GUID: lgivaicbC5tfH8Zl3HUsZEH1RcQ9ce43
X-Proofpoint-GUID: lgivaicbC5tfH8Zl3HUsZEH1RcQ9ce43
X-Authority-Analysis: v=2.4 cv=PsOTbxM3 c=1 sm=1 tr=0 ts=689c3631 cx=c_pps
 a=7IpPCSUbfOSQOy/pEBi7VA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8
 a=IVixbjnIvSYxi23TSw4A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 06:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221790

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In binutils 2.44, application names were changed from the gp- prefix
(e.g., gp-display-text, gp-archive) to the gprofng- prefix
(e.g., gprofng-display-text, gprofng-archive). Temporary gp-*
symlinks were added to maintain compatibility with the older
gprofng-gui.

However, these compatibility symlinks did not support cross-platform
toolchain prefixes, which resulted in broken gp-* symbolic links.

Support for cross-platform prefixes are added upstream in binutils 2.45,
so this change backports that fix to resolve broken symlinks issue.

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=90803ffdcc4d8c3d17566bf8dccadbad312f07a9]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../0020-Fix-for-borken-symlinks.patch        | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-Fix-for-borken-symlinks.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 32928ee167..26c2a413b8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -45,5 +45,6 @@ SRC_URI = "\
      file://0018-CVE-2025-5245.patch \
      file://0019-CVE-2025-7545.patch \
      file://0018-CVE-2025-7546.patch \
+     file://0020-Fix-for-borken-symlinks.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0020-Fix-for-borken-symlinks.patch b/meta/recipes-devtools/binutils/binutils/0020-Fix-for-borken-symlinks.patch
new file mode 100644
index 0000000000..b26cf8a83a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-Fix-for-borken-symlinks.patch
@@ -0,0 +1,62 @@
+From 90803ffdcc4d8c3d17566bf8dccadbad312f07a9 Mon Sep 17 00:00:00 2001
+From: Zheng Junjie <zhengjunjie@iscas.ac.cn>
+Date: Mon, 10 Feb 2025 17:04:55 +0800
+Subject: [PATCH] gprofng: Fix cross-compilation binary name.
+
+commit d25ba4596e85da6d8af78c88b5917e14763afbe1 create symbolic link
+no care cross-compilation prefix.
+
+(cherry picked from commit:90803ffdcc4d8c3d17566bf8dccadbad312f07a9)
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=90803ffdcc4d8c3d17566bf8dccadbad312f07a9]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ gprofng/src/Makefile.am | 12 +++++-------
+ gprofng/src/Makefile.in | 12 +++++-------
+ 2 files changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/gprofng/src/Makefile.am b/gprofng/src/Makefile.am
+index a132a9ddb05..0465cdb06e3 100644
+--- a/gprofng/src/Makefile.am
++++ b/gprofng/src/Makefile.am
+@@ -179,10 +179,8 @@ $(srcdir)/DbeSession.cc: QLParser.tab.hh
+ .PHONY: install-exec-local
+ install-exec-local:
+ 	$(mkinstalldirs) $(DESTDIR)$(bindir)
+-	rm -f $(DESTDIR)$(bindir)/gp-{archive,collect-app,display-html,display-src,display-text}
+-	ln -s gprofng-archive $(DESTDIR)$(bindir)/gp-archive
+-	ln -s gprofng-collect-app $(DESTDIR)$(bindir)/gp-collect-app
+-	ln -s gprofng-display-html $(DESTDIR)$(bindir)/gp-display-html
+-	ln -s gprofng-display-src $(DESTDIR)$(bindir)/gp-display-src
+-	ln -s gprofng-display-text $(DESTDIR)$(bindir)/gp-display-text
+-
++	for i in gp-{archive,collect-app,display-html,display-src,display-text}; do \
++		oldname=`echo $$i | sed '$(transform)'`; \
++		rm -f $(DESTDIR)$(bindir)/$$oldname ; \
++		ln -s `echo $$oldname | sed 's&gp-&gprofng-&'` $(DESTDIR)$(bindir)/$$oldname; \
++	done
+diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
+index d0dec12e244..d6f1f9438b6 100644
+--- a/gprofng/src/Makefile.in
++++ b/gprofng/src/Makefile.in
+@@ -1119,13 +1119,11 @@ $(srcdir)/DbeSession.cc: QLParser.tab.hh
+ .PHONY: install-exec-local
+ install-exec-local:
+ 	$(mkinstalldirs) $(DESTDIR)$(bindir)
+-	rm -f $(DESTDIR)$(bindir)/gp-{archive,collect-app,display-html,display-src,display-text}
+-	ln -s gprofng-archive $(DESTDIR)$(bindir)/gp-archive
+-	ln -s gprofng-collect-app $(DESTDIR)$(bindir)/gp-collect-app
+-	ln -s gprofng-display-html $(DESTDIR)$(bindir)/gp-display-html
+-	ln -s gprofng-display-src $(DESTDIR)$(bindir)/gp-display-src
+-	ln -s gprofng-display-text $(DESTDIR)$(bindir)/gp-display-text
+-
++	for i in gp-{archive,collect-app,display-html,display-src,display-text}; do \
++		oldname=`echo $$i | sed '$(transform)'`; \
++		rm -f $(DESTDIR)$(bindir)/$$oldname ; \
++		ln -s `echo $$oldname | sed 's&gp-&gprofng-&'` $(DESTDIR)$(bindir)/$$oldname; \
++	done
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
+ .NOEXPORT:
+-- 
+2.43.7
-- 
2.49.0


