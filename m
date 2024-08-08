Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1B3C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 14:51:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.61949.1723128681322394699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 07:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=895026df3f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478Bf7qw008456
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 14:51:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0bshpgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 14:51:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W//4w07k6ptmSQe2kiPj0BZLaPRVv4grYG3kXgCOBmEl6g9jyjOi5iCIE28eEJYeqTfqZebkNCEWgu/TOTQFdsVhyZIuVQuKTY/WFdX6pSQuPslIt4F7R7Y4cLAoarwRMkXNIGV6pLkMw0aWEt1REqiz7yierD3Y/yLp7Cp69daBBlVBm1XpQmVujrn772Jb/zVoQqp6Nx2UvP4qKIFaG2Mw03+JLCcpzaeMsgjh1xOmtsjyMXTlJDiHG41u/PmoXxYb1eyCCDkYTwD+25Jw/VqLrsGmsGaBwZchSXeBFFS+hCmzNECcXJKoNXfEJ2eOsNy82cmzhD6C9uvOLFUTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5MPxmlIWozhGRaG0IgX/VTWSWMs8/9dbjKVdibWSLE=;
 b=TueEjdkenZMPMl8ZxUc+CpFF49Zv0PbT9lKghxmW9/uBKbk4qgLMbQxD2x63w5klYfLupjd8xqfusWRiJTUEQOO59ZKlzsRSE9CS/PMqHGB1zhD+5i4nSA+wdznkw2TwJnuV1/jV04/c98nayhBYclsx6GjJn7F3F6iJK7uB1kR8Q8HLzojLkf4fBAKa0WK9Pf/lwYn/VqVQYiLE0SH7Ka0M9BP/gEZZcee2D7WZux69WWGPu1x74+RvZzZxNtrCQJxN9coSuB8HDDC9cTMFQK0omeqwDuRbqHNTEupEh/08VNCF6qvAW3FtWeOtTps1qIiGjTsySY0bv/FJaau+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 14:51:11 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%7]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 14:51:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH 2/4] oeqa/selftest/gcc: Fix host key verfication failure
Date: Thu,  8 Aug 2024 07:50:40 -0700
Message-ID: <20240808145042.3914762-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808145042.3914762-1-Harish.Sadineni@windriver.com>
References: <20240808145042.3914762-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: b5735667-c466-41da-2a9b-08dcb7b98b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s1iDstimPUT5lElC4MU0EbXKghD0Tzhn/xDkKWVsTXdshupjpN+K/JFp4xmS?=
 =?us-ascii?Q?rDUroHB1SJv1c1XM8Q1s4GI4CI4ic8QyvdXTDAq50FKWLRLv5fvOmOZaRyav?=
 =?us-ascii?Q?QjB2leYxEOXhdblgZrwC0IUuGzApr1fZD9+kP5XDkMpa1fzWhhYbi/Z0QJkx?=
 =?us-ascii?Q?7EeNC1uNO19H1JI0YUrjdsepeyOPDM/h1qEW9Wei3tFVzeXYJvWIxFM5gbXt?=
 =?us-ascii?Q?RwKpY+KONNHfko2RncLORECfq2RuaXS1jXPgCQ1tQyMlpmWnfY2PFbzmHvV6?=
 =?us-ascii?Q?URia4B2knCcFjZmtXuAsdcUgea/6bghEc59jYZoodhWIg3p+H+NyKPfg9aTw?=
 =?us-ascii?Q?sa8xJzwLuYqFMLkCK7fqp5YqeX77Hjwzro6/4LkYdzwoluOG/GQJOUr/VMMf?=
 =?us-ascii?Q?PdgFicnTMBVORYGVdfXwBcv3zmZlcnoLkO0wtYp2c3eakjbndqfEZ5LzQcmT?=
 =?us-ascii?Q?uuEx/4BRBMB0wBKfekRB9fGA2yV8wOSg84J1c1vV3ge3ZQ+JoXKS+l/9rjxp?=
 =?us-ascii?Q?xESl1bOS4DSbNw/d3Wski1C89hxZ+iJu7QJMSSDK0rcMxoUysCmO8NbZ5+Aq?=
 =?us-ascii?Q?50P2tKfmmuoqY49wGVdkM5mqq32nplwA8gjH1xRF5QZsA+tWFB2VIenF/QV/?=
 =?us-ascii?Q?/yIAxJ4ztjSdnBqC/FBZrjDW29yTd8Cq9Zssyor3aRsnMh8Nuk3ykgP6TIBz?=
 =?us-ascii?Q?TJVYtvpReHbftGSAouOO3334MzJ/1gSixu2D3Zhqsk7pmLUMT7JnpKiAI7mD?=
 =?us-ascii?Q?QqQNG7jtcZB8OWoRKqbjfTCoKUPWefmz4tTfU4dxQP8oP6Rfu3JQUTQCT21V?=
 =?us-ascii?Q?+7dFnDgLNvAe/VEcqhShSU0xPoTlzJ7PLU6FmQWWLfpLFeLNpnVg1lrxjpOa?=
 =?us-ascii?Q?eM6WWymg6tiPXNNfbbEtiB5PHfl0xu6Nrk9ud9XTiUan15U6xvUGUn3VS2IW?=
 =?us-ascii?Q?a0KZLIvHHfXicIxvk4ZdpOrws19M3pCDU29+fv27cosl3dHvreQtWHfPax/b?=
 =?us-ascii?Q?ivyYzRJo8C0uzSGzDNGbMeK7tmqQtCOJhC+fs5gKMkbYE6pen2dKOp7c6MlN?=
 =?us-ascii?Q?3shkwvmo1G+auVbL8L/klmmn+XP9eG1JRa7wOa8Vj3U3NBdOW1HhpjMfh4fy?=
 =?us-ascii?Q?HboAU4kM+pwnymX6l7MiVgTnXncjiMHpQORURBDRGjy3fS5QqnqcuOWbUADQ?=
 =?us-ascii?Q?dSAG3Be7ICr3Xh9uTGfZYu0lF+VWHLWBLtSWjSLxCHjwgb3jKEAHfbqnsC7N?=
 =?us-ascii?Q?KInIOmrejTOmmApr7fNucVd/15b4IVgONe1uPvcqmLp/0aj+LNx9iZoui79R?=
 =?us-ascii?Q?ft+tYlBxMesQJlgSfMWtC4Tss+xpHhAyYUc9mUwKYEVJerpOxKpPHdb8V6LL?=
 =?us-ascii?Q?GFd5yPLfUAN/A6V/tQbqqbj1P43anC/+TZDwHpkGTPZapoxQRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3dACe4/nFHNbqZmMoLgnfcuPx8D6xVlrTa0BMBV32ck/muLB+25c9al7KZ5V?=
 =?us-ascii?Q?BplkkJOVX5xwIRn2yCBGeLTZP88S96M2PzvguOJHDBUcddwBiOQ8/xEssLho?=
 =?us-ascii?Q?H5Qe1URoU+A1Nf9e2DRzK+TQViGUVh/qPdW766YLSwG0X0taTsvVwyo0exaa?=
 =?us-ascii?Q?NTL6tWSs1+ZcLNjqFEJLDeDGfTwyAxffHEXVbtWraySddCQpN/U0Q+fDY69d?=
 =?us-ascii?Q?9AdS55KI8sCEM5SBnRFUkRiJn9p5yXITj6MEMNEJ45tmINRcl4uCL4cML1MF?=
 =?us-ascii?Q?g2H3WkpwFqRmwK63QxFI6DvRlSNJuNZeUnhcY7sJYEw8LlEs70RRUKApwJ7m?=
 =?us-ascii?Q?5SxZVf+Ym2an3vxckyXYytyyN061C40uZueAGG4JOgISJEPkmL4sRCuVkxpq?=
 =?us-ascii?Q?TgKUtCDGb4Fm6boX5p8irZzSnDa8SGCuxiZlpjVWVmqxHt/OwcEs+Uu2ooHO?=
 =?us-ascii?Q?YwWjVGjWVOv/KGedmZ+kT4P3x6zz/aD5apPKigZ4i90zXGzHj5+FDeKytu3k?=
 =?us-ascii?Q?biw9DC/bOaztwIz/15zuEqGK380/CZfV9z2p66Lc4tvraa6pqq3XMpnlQ77i?=
 =?us-ascii?Q?cBOYI6bsri5uYm3g0ne6utYa5uu8mh2kIPMvu/y2tFpesmqVG3pb5VSMHik9?=
 =?us-ascii?Q?/Ul+kBqbHzxwXz4wcpUi7BjW52rQO+XZsQqkGj+cItZuQNIIt8pnFeYtkMHq?=
 =?us-ascii?Q?Xyh2Sab9CybXXJNrB6g3RsCH4lUQRxxZdRe9TJANAZgI1Q030iH16XDyg8Sq?=
 =?us-ascii?Q?H99niuCdOvihGV7JKQ7Rhknah2rMP3R9JVtP/XlXA1iJ1VBkc9MKB3kHCEi8?=
 =?us-ascii?Q?eLEpImUKLR1iQ7dJEtm5ZilbHcRtD5hlJIATyLiSbwf6Re/NUxVUwMBFWJVo?=
 =?us-ascii?Q?EbA3filaUOqGP3KMvDOB4GlvihzUc6fOv6tw2DvXdc3l8KXWoCQOuCEEue+8?=
 =?us-ascii?Q?VORjSem0ezsYxFsFWASy3PoDxbsMxonXYCouCrFUhwVKxKvsBTxvwziB8sSo?=
 =?us-ascii?Q?cxW3+7/elsUsfiHPPb/rPL9nukkTqMw7TqpK9V5L3vI/br+6/7SLh7LtQE6l?=
 =?us-ascii?Q?R2IjPmLfTnVkwDTdDDzfFu1CNShaxvjmR6Z37XtHqS3uUtI9+dvar0rlA2aG?=
 =?us-ascii?Q?HEos4qENB0BWuKzWK88W1zlkWML35iGCb7cdcb7Z8gXw/YUtDn02ANyn3CSF?=
 =?us-ascii?Q?daJ5ZEdQOrqr4ict5/SaCyVmwwHkUjwdIvnUmZ2ZFMTOi16Y0XSUOkifHuMZ?=
 =?us-ascii?Q?0my05dxebjGtQStx4NIpqDT/60RMiFh40yZnazz8bG8+LoCvFCxV7qZa1MUD?=
 =?us-ascii?Q?pQBNXpPDfLCV240FLcdRiiroKEMbpP2o38oK6go9uXXKVlKJ/kz/MrqhA+p7?=
 =?us-ascii?Q?PQ51oxVT70/Tdo2ajse+fVclTj84EpX9VlnWPkubqy+mqehPpf4Q7SeSIM4x?=
 =?us-ascii?Q?b5gusZpFSgAw/PTI8LgNn2xEWzcMieyCDFttAmIDuOafHNwtlwyhJ8pnc9pF?=
 =?us-ascii?Q?tIHy81nzRuh2DZrbkicdmm6NOHNUj0o8JkPqwf4a9NmtWWDd2V9Hj7cjjjy0?=
 =?us-ascii?Q?Lf6Deo//qM5agCT350xFcfryuSjM1SUsOJiLG1z1PFpAkuzXvp64FEpLs7hi?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5735667-c466-41da-2a9b-08dcb7b98b64
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 14:51:11.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mVFT8eyYe+3kxyy4bzYrKT62F5mezS6dRA+l8ULbKfmKdbgmZ7Svb0z89OtNhT6urgaS+gH1XPtQmftEfxcPfot0AHU17gEI+PmeJSdFCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
X-Proofpoint-ORIG-GUID: OPe2-xIA5UxzBU7Fsf1TFzR7hAaiqA0A
X-Proofpoint-GUID: OPe2-xIA5UxzBU7Fsf1TFzR7hAaiqA0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=881 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 14:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203140

From: Harish Sadineni <Harish.Sadineni@windriver.com>

while runnig oe-selftest for gcc, testcases that need to be run on qemu are not running due to below failures.
- Executing on ssh: mkdir -p /tmp/runtest.3549641   (timeout = 300)
   spawn [open ...]
   Host key verification failed.
   ERROR: Couldn't create remote directory /tmp/runtest.3549641 on ssh

Host key verification failure is happening when ssh board config file name is
defined as "ssh.exp" and there are multiple ssh.exp files generated during the build
and a wrong ssh config was taken. To resolve this changed the board config file name
to "linux-ssh.exp" which ensures correct ssh settings are used.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py         | 2 +-
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 89360178fe..4cc0894d42 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -37,7 +37,7 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         features = []
         features.append('MAKE_CHECK_TARGETS = "{0}"'.format(" ".join(targets)))
         if ssh is not None:
-            features.append('TOOLCHAIN_TEST_TARGET = "ssh"')
+            features.append('TOOLCHAIN_TEST_TARGET = "linux-ssh"')
             features.append('TOOLCHAIN_TEST_HOST = "{0}"'.format(ssh))
             features.append('TOOLCHAIN_TEST_HOST_USER = "root"')
             features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index f16d471478..0a950b6c9e 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -101,7 +101,7 @@ python check_prepare() {
         f.write(generate_qemu_linux_user_config(d))
 
     # write out target ssh board config
-    with open(os.path.join(dejagnudir, "ssh.exp"), "w") as f:
+    with open(os.path.join(dejagnudir, "linux-ssh.exp"), "w") as f:
         f.write(generate_remote_ssh_linux_config(d))
 
     # generate site.exp to provide boards
-- 
2.43.0


