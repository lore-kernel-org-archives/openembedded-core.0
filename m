Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A54FD2F7E1
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 08:21:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17730.1729239692194025696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 01:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00219826df=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I511Aq004425
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:21:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3esk0s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:21:31 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49I8LUiL006500
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:21:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3esk0s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 08:21:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtgrGE7V5bSG2AAM2k/l68sy1I9/pzhs3hFuLX9IOSpvmTegtYogNSJZZUtDlEX3XsYK3K+9zXZ6pTH39dMt+d1+W0tRwP6vaeKaPCGhk7RKeMoR5XEl92lEgAOANzl0T0mwx6O4EpKKsPvuWwskBMmZKEhHbkcDqLmucW87c5cp5qa+r/qzCM+V7G5/yPSKXssYPi+vakAyAycAC68k7rIa2ejaji9VGrLRQA8lTEBXUupXEiZKZ2PR+lTvqX3o9gu1WKo2PM5PEqO9JCXu9EMtJKnjnp4eIbgnQQ/qz1ZntJcL+4jMcOthXyJEkvjodmPFjQW8Gc2dTKr9VoAVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVyqIQF24pa6VqCAAGqg8FYHr3/TJ1M7yHtgcP2TF7w=;
 b=vJUTDmwUakwb8dChfty6yFnpK7j2TIb9f6kKcV3ygwmNFB220YI2uygsLYhgeWnj1GEGjRdJm299TJdiNANHVJrjK/w4XsxZHBo1sq6k0w7S4N7MvN8fnxK8KuZteTl/ps3XQ/0HbYf9x8y4EAg9O+Wc1PJ3kKmPbNfshyexpjYLjKNNSoiq+K3MNmoxQZhmfVzP8uhl5a6qI3N4rmvGqZx4fVMOizDViBYilrPirA8vynzznRIaSrpdMv1Y3OumdE3nm1AlGO2cupo2io5PYFupk6d1d8aNZR8y1FNXgtSlEq39gRnmYzZ7iQF98gQVILWPkInmZxUwptZhHMqwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Fri, 18 Oct
 2024 08:21:27 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 08:21:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com
Subject: [styhead][PATCH] oeqa/selftest/gcc: Fix kex exchange identification error
Date: Fri, 18 Oct 2024 01:20:57 -0700
Message-ID: <20241018082057.2658823-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:40::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf31e60-91a0-4fe9-a538-08dcef4ddc97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G5H8F7w5SmrwSnkU0NTZ2Js9m/V1BmownvnBebSp5L+oncU2/ebc97k5OJxw?=
 =?us-ascii?Q?ZdGFU+dycMvouxVlgfxc1PcZithZsbJPV6ZT17FNorx5JCLEgc52o2CnocRj?=
 =?us-ascii?Q?RSKGD92JLM6QL0Kdj/8xTu2kO/7E+33QddNSgTg+31bgp9HZNbuyXQ1Izj4+?=
 =?us-ascii?Q?95dwQVQXElX9aoQME6xDy9ENhU/2Nnq1TqkgeKWz2IJWGH0lw9KMAMw8+B14?=
 =?us-ascii?Q?zMVvCCe21y+tfnaMjHej/QDvWqRHgUq1sXu7BojNrQAA5MvsM29dCFa0lWnc?=
 =?us-ascii?Q?hhqjfdYWDWHqKk7ZtWSdSYN8ndch7NS5AXYr39Ebmkb9zTC900Cf2GU7f9jm?=
 =?us-ascii?Q?WQUiC4H3M5yWk6LoaVJKdrCyrzN+YzyIBnaC2SmCvMqwcbM+e4xTNXC8udiK?=
 =?us-ascii?Q?vdN0lBFmFMQwBdzCTFm4GxiQ3uDuA01OWl6qkXCT0S19LZrSijNHOIOgIebu?=
 =?us-ascii?Q?fMPCOUu0EkSEh1CddyRjsCl6fjDhKzFTHXHwqPjwYYWGEwkNoc+M0jGtxB0d?=
 =?us-ascii?Q?pG7IZXFtqHNW7Wt++PCHCX4Zngx6W7YbgTfWYngiNyRVTP7Bat1NVtK8A4pR?=
 =?us-ascii?Q?tEPvxeVSsLprX5Ek6Ex+wKRRK4jfvRdba+eTgxOuhov6A++UbIY+SbmQeZrC?=
 =?us-ascii?Q?RRh/5G++azyB+YtBm/WU0A5xaQquzr27NoSNV0+VKSK6N8Io61jf7uDiEGtQ?=
 =?us-ascii?Q?J7uJ5VJekVcTVXIp8bC0OloP+QWO5JzHp2tuJDQSf4Pwggt4XlUgG5IMitf5?=
 =?us-ascii?Q?JLoeMV5N6f0ZN27YkZhKICUpywXQivmjfFy6KqmeJLLXXLSxNGfVy/PTvZre?=
 =?us-ascii?Q?OplDqYWRq+2K5gitmLHRgLPGCjoLcu4BgPy/a9sKkkp67XV6PqcirYqzanaR?=
 =?us-ascii?Q?7RbH1xMK6Rh4eCgah3u/e+jVFBRBVcR/Ii6eKmykjvf1aJNm1ekS1kAkiLhP?=
 =?us-ascii?Q?LZVdpmUaBH/454RyxqV0zXa5itBBO/TKAL21ldYOgetL8Md6cDN1dbE3FcO+?=
 =?us-ascii?Q?vjygj6yJN355jWQzfRn2FlcVqs6DPwBf6hix5bhJyti9ZJ+vHCjVVYdhWvpW?=
 =?us-ascii?Q?WvEt6kcaW3ukyprY2TimUSzF7omzXzjQ2aPFo5fV2HayG8x0Qt8G0M5GUTs0?=
 =?us-ascii?Q?inII5RPj7pBCw08ujPrLDcyblABK3rTfM1vAmIEIHwaS5DtmHLqxXjcNH1MT?=
 =?us-ascii?Q?Gl5EO5vEb9MRnnYYzOG98E9caTdvLlLgEtnDNapNjdfqNFjoTMqNy9p2rJio?=
 =?us-ascii?Q?aA+qkc2vMbF16C/vZfU1+jsuKhRNtPHSgjYoXHFx2s8x571jIwHdYxXA4vEc?=
 =?us-ascii?Q?gUvw8QQF1VLK1SMNwAN6Ibhp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mXNMDI3jk1bMuzW5jnN36QHwKTuZO2Zv481L57EnPAR73R3Y5MF/lplEvdFA?=
 =?us-ascii?Q?nsaRc+7ed6OH9+Yv69p6EWMamJQR+/hRDYbgnk/vqf4LwsQJWAJuOfz8IBOv?=
 =?us-ascii?Q?2la5Dkbuxd8FxXsY94XAH33W8aqLLlCp5dcbB1HfRSYNbVs72/V6KtGPB6uh?=
 =?us-ascii?Q?vkpb1V/KFMqWrrQdm/bpSOG8n+u4DA3H/hfMB8gryD8iTSOjsPyChHjM12LV?=
 =?us-ascii?Q?Z1eOQJvbDsPgC7WjPvJQHxk9l4PMfDYNpoYyN+5YT5uaib+4CSHFDBxmEAhL?=
 =?us-ascii?Q?yS2GoG2Ms8ya1JCtDhc1D1cfLx+j6wn30e1IYEIMzdLBVUX97F5611ZVU8UN?=
 =?us-ascii?Q?MfJHaX39LDfBAWDeT13kRUjRF5PV0v5zneBM1gbIqbL2NBBWn3PfvJ5a5iKg?=
 =?us-ascii?Q?zr6A2On5LAnscflIfKPwuqJt8ymX3qlDSIun46mmgtztg9Q97D01bcKwPhOw?=
 =?us-ascii?Q?LF+22Cgx8XeatUvuj+24lzNb+DPajLf/W5TTe2yvqoa2RQe+Uh56Qby+GnLm?=
 =?us-ascii?Q?irzHht/5U1eSE6P7XLpFjCBl8qlfEbzAkhSdatMCNDbpHybFwsUCBVqMj59L?=
 =?us-ascii?Q?kXI5HYqdiWehLQPDNm/6QLlEdYrYV54ouASqkOD4aNbF6YK8SgLpqCaMzSAg?=
 =?us-ascii?Q?KW55BDYfrZzfBfBNluJSDEx7a6iR38gA4Bq0ty4VN4EGsROHX/PnlafHHYOL?=
 =?us-ascii?Q?lQR4yb4yEDb34gCrrJjVLkZHy1n2g9UzZNbhsybY4z4UriR7niexYkMz/Miu?=
 =?us-ascii?Q?CJh9Gps2xSoM7O2FjHbiQCWl1FttxcU7YVlRsdcumwB276DSh4A+5+0ou6tg?=
 =?us-ascii?Q?6y8BBdyj1cj9OSNmsfKlaiHDtlqxyYGWRAg9sFpaRNYk4hVCDhZeZwW8Kd8g?=
 =?us-ascii?Q?P2Or8xa08tj3nITY+EKuYqacwiava6MuaGptS+C2Ul2uGgqfY5do/ZI7ySgE?=
 =?us-ascii?Q?/pkdq5Fv8U+GUilPCHJnx1bIfrQ9IXUv+Kl/popvdBQZd1dXmiRdrd6jfXJG?=
 =?us-ascii?Q?KWA3ifHB6ULak+60IWZ1ieAVv5jj7cIgQ86Wm2A3qhh2BvqodPSgX3HXpIBM?=
 =?us-ascii?Q?wXwQBtMEiMsnmU0XEAcy9GdlGMnl/h5l7gR2AaMLUiByC0ErbEhCQQpQMY+2?=
 =?us-ascii?Q?qaHx3E4QbNZWabBMSgp1pWmbEA+Mw9PnoM4om7TfbRiYNmKnUjtC1mzTK3IF?=
 =?us-ascii?Q?99uCCfkrmkQRki98sRF+dpXbSfi807+niF4OFJJ303jubvJrRSUbrM0I5spC?=
 =?us-ascii?Q?J2+NTUxrUldp+sAcW8BKyTBn/3KV94qlqjZrSoyuCStZH55WNe+hKCJHNBIh?=
 =?us-ascii?Q?GonenGXWKKpE8I7bmKVrYrM8oSA1e71w1wbMEkYX/Bulu/JFVnbCddVnmBiN?=
 =?us-ascii?Q?cq+/YuPHQDeKuuAAZUBmv9hPS1pXAEwIId9occjSFpqO04IDTOXMrRirzcSB?=
 =?us-ascii?Q?epOJRfOhr0Frgt+qXGDrFHwAoUpgcAPTs9fJnSZ6VFe2tsQpCx1Yn7deZSoa?=
 =?us-ascii?Q?7xJ1zhvo0Sbvt+5p3uKuqA6kRvB8p1DNn3lOB3Y32zh+N9l7MbVv1dVHe20M?=
 =?us-ascii?Q?s/S7+JXqhldqzjKZqZpPkG7kJEwDYgm5wEYk2NhM0jOqkLN/4y/Z+16UvhEj?=
 =?us-ascii?Q?0VnKx8vExHZLrhJOGELsG8w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf31e60-91a0-4fe9-a538-08dcef4ddc97
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 08:21:27.3811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKb02frfRUyhGkToepeE1g3ifaWdl4izLdrJP7CX8brHbMPd6Krrv9uwznJ4a7hTW12uuS57XyP9Mlp+2zX8D2VBrY/FlhCCL4pY4qiT+3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-Proofpoint-GUID: N-jEbc0i2vZSKgKDimOM01ylAaFbNirN
X-Proofpoint-ORIG-GUID: VXGEpEfnkEu_oFPJV0vTPxUnsm_5RulB
X-Authority-Analysis: v=2.4 cv=cPWysUeN c=1 sm=1 tr=0 ts=67121a8b cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=a7vr31CzYvJzpkUOuFcA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_04,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 bulkscore=0 mlxlogscore=845
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410180052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206039

From: Harish Sadineni <Harish.Sadineni@windriver.com>

while runnig oe-selftest for gcc, some of the testcases that need to be run on qemu
are not running due to below failures:
- kex_exchange_identification: read: Connection reset by peer^M
   Connection reset by 192.168.7.2 port 22^M
   ERROR: Couldn't create remote directory /tmp/runtest.3549814 on ssh

To resolve kex exchange identification error increased the MaxStartups.

Backport from oe-core master: https://git.openembedded.org/openembedded-core/commit/?id=df64d5ab6eb37dcdc2046f449ec539a3f4b985c8

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 4cc0894d42..1bda29a72b 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -83,6 +83,8 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             # validate that SSH is working
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
+            qemu.run('echo "MaxStartups 75:30:100" >> /etc/ssh/sshd_config')
+            qemu.run('service sshd restart')
 
             return self.run_check(*args, ssh=qemu.ip, **kwargs)
 
-- 
2.43.0


