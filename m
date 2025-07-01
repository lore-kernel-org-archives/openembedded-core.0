Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E87FC83F03
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.522.1751384872960254796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5615S6Ie010135
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:47:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1b8t3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:47:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HR8VA7+pgqcEY3dXwMRw3F8OHJhKC2aDdi6GsHB9Wfld6458t82erppNCliag+uEJyKhcTbZojzOkq9wc1A840ZB3JlEQXYhlZMs3jgsFxkGogeoPVfC+huurl/F82AOIEJz4/ZPyFXZTJPp4j0zae0ojKuJYPqj/4ettWPmgZWwepGrqfx5aOMY5zFxLkwEhtzexlIIPfqvi3UoFwRBqpv5MnHNFmGlNOLM/8t3r50yBLSWim1OENAMivMrihbz6g6YlH6dnboIBH0gUzlJRkALWP5AvUOoit1TQ+DvtE/xmFqFAejTakw72gXd4F0kXtghgpdymVkOdAGJGGd0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFl46i+J70BU3+S0jhk4A6yHMa/E1bvSpVng7WyXZKw=;
 b=rxLi2haIpYjIwDMPNy0kydqcqFKSm5Y7k71uD9pAeAeyA9SRYtzNcgCURNzTcrb6QVRkV2PuRFYadaZ7LH8RxFmgeQg82J5KaMPuG8GVoMW7OiYD/GeopFVRPsbv6RsiRufLC46u3D3Predia5QfmPBK48b/UN601YE0GXAbxExxtlb1BaRGgChgyjTvpLt1RY7YoeiVi8tZnC4hmTTx2ca7yzDDGSq0rF3SNQAA+bhSAPw3QQNuuV6Osu+zcY+QLuwdojld8BUpkw4A2pt56U9BJyvgvZ5NgYwwNmYdNr3TYDpW/emji4U2USXfJrY3akiZIOBcfxEWQJuRoliIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 15:47:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:47:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] gnupg: drop -unknown suffix from version number
Date: Tue,  1 Jul 2025 23:47:24 +0800
Message-Id: <20250701154731.1465906-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701154731.1465906-1-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a08243a-523f-4733-8884-08ddb8b6a1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?03QrkDjUyzy76fKotqw2n+AKjfvD5j9ZmjeTUlWR9WX53+3mFgRnJ6IMHMWr?=
 =?us-ascii?Q?9Y+PDbRkAO91+6ccNO9e6KTYqW+rgCK7jK/g38sJh+GCMawVkg7KyWriHOPM?=
 =?us-ascii?Q?0GNH8mQlBBCSCkUiMuetudf4uyS0pLdAT0eHmT6jJhksmFUojLQ+5LmIDMR1?=
 =?us-ascii?Q?WTvzqSTrkPBpCu9c4cvCvqI+JFLiyOWsCV8SDeB76V2pbf5UOjHNn2jocnmC?=
 =?us-ascii?Q?EneW36CyWBZ+gkiQXkf27qOJCwEbBHf79fJDutf443S4CJcYamWNIRH10Pzs?=
 =?us-ascii?Q?tbtevZodqyKpRxXKXs4jn5MyLBrnpfgjqNwxeDvNpvD6h0gHfoZHjzVJ1ft5?=
 =?us-ascii?Q?/iCFXGqAsJGp2G4HIVitAG4bu01lweSIdPJCMKq6DrC3H23KLLEGRSM4rkXN?=
 =?us-ascii?Q?pufYQxcYhxvf0JwL7n6Gn3d4xfCFrcZpqjVy1qL1253EPphtmNibbpglpTGq?=
 =?us-ascii?Q?xtOEP8rEwKCPNuOjXIhBSySQnHY9HpdkMROc44c+kTK9l318GX8IYg8cS/1U?=
 =?us-ascii?Q?+cywhsEZIDaZ159qpIPgFpY7uXp81xiHp4UdRQh5yjKrCpsvXRmUdnwLxXt0?=
 =?us-ascii?Q?AdlOan7buT9bv4ot1tPYjJORXRSzZhgmlCtLmOqDAYNVe960209EhrV9Aq2A?=
 =?us-ascii?Q?/Wlp0OKEmg8naKWiBA4OnBnA2eXN2QvUCpFv8ZWRWN5dCmiMHLqwXTrPr85G?=
 =?us-ascii?Q?vNc8skIAMVmuxI43suV56YvZl8mcoO3Gvu+CcmwQGe/hacOmHBDqam9yV/FK?=
 =?us-ascii?Q?m272UNdxMgbYhwzCEXebn1YCOADr5tOmKPlWwQ0YD7ViCKXJiIZNjrorFfNb?=
 =?us-ascii?Q?KoqkbuxlUhVaYIk5w/VQ2Wfa6mJM2jWT47UKMnrw5OW0pvzAiUEwXdj9Lbj3?=
 =?us-ascii?Q?WuIJ2zJejhEhiO152rXOXwj72BHOU11rk62czGgU7LcNfDBhPU6F2WU8fGa7?=
 =?us-ascii?Q?jmpL3/YR6e2p6WVA1ruUWoEi0nfFMkjen19KbcFbLcIkf4Bzdqo/RngaDtn9?=
 =?us-ascii?Q?WO8fq50jcD+YWP9z82ZFnHRZRafUO9d9BlbnInqicueM43b86fOhckwVzU1+?=
 =?us-ascii?Q?t15S4rprbLrolwzindokehDY3Lsa4RZRhtKhX+K0qP/Xgu+VDEEgpcBvplZo?=
 =?us-ascii?Q?PFiiYumNPA0IieWRblimm3SthWzQwmRZ1QqqhXZ5lr1E9GHqz7A5cL/r0ME1?=
 =?us-ascii?Q?9vH5anVrAR9kLm/7z9XZnvDY/QlfJh81nIHvE/8i7KyS7kbFuacBzCtN78g8?=
 =?us-ascii?Q?WmvGzIlxemQ+KhVJygwbO6hl10Wk1pXbqA41c2jUwrejwTrGR2eLDkaNzibS?=
 =?us-ascii?Q?nYsRqpWQseI2erYSOMK5Y8icouSP6pj75JD9P6ovZWmmQof3lGp8Srfebtb7?=
 =?us-ascii?Q?rWYLws6IS+6DndN0t4hwkNdbav9iCOrBOeAEiOedlfmpLblz9FRCI+AHswiv?=
 =?us-ascii?Q?3BDRD3NV63G8b57VDwfvHGR+gfb1yPuqYt4hTtCCikmuQxhsyGWzQvxuH0qq?=
 =?us-ascii?Q?8EqvxLCU3B5ynrM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SbywXvt9IsL337WIJAUB5gVpVoZMcynPfhS84mF/6j8l0pyiLb1+u1FdNliM?=
 =?us-ascii?Q?fkLmm4zpQT6ODms/7ZoXj7HL+aQN7aWT3d4F+eOLDFZ/4E12rX29xQPH4KYo?=
 =?us-ascii?Q?Krpr7tQoW6BPre1/T0RtHWs6rk17nElWGWFiaS8s8sIrJv6vzyQxNeWO0KPF?=
 =?us-ascii?Q?evMHgg5EfaSvgkalRG9rvlXc/DaR7rGVeU9r9susPY68P/vWe7SK33vIK31G?=
 =?us-ascii?Q?H3d8kEriPookdjoVhdYJAfGrivAVwQg6JMCx0QSShmZoJnxy48x+BDlG6BGC?=
 =?us-ascii?Q?03EZUWCV+RstbQjg29A2jgiuPJ0Zi529Q/qKhXBU7m/pandEDdfeIuk6Zstc?=
 =?us-ascii?Q?JID6Z2lP5LERLhPbtBZ+a9xsutl598ZeGysLFgvj0iiQLAALCh80WggDCVRH?=
 =?us-ascii?Q?pexFDB90b4wLsHDOfJvpaDKYVi5Ov/3qE1b+53f1Hum6xTc22m9VvAU++VaZ?=
 =?us-ascii?Q?rJyuUsbiKJSuOUDPEhigOeHGt6ZU4g3aiq9OkzVdK4eFSDL75xRHUEX5iYIh?=
 =?us-ascii?Q?idSe1Qsqp7ZRBswQVBdD9ijkEBdxon9ih/rjj3ao6G7soLGemFYpyWxl3+1S?=
 =?us-ascii?Q?tqEjbglmjBbmBpbX9+kGUIxRZDRSs15/8EpFX5OEl3CpwJpk3Q0LqGVzhavJ?=
 =?us-ascii?Q?Qrwf//7aPR3WT2C0zIFoNmabY3w19dSXI3nVxOntFV8EHWaNKw2bkqMUAVYf?=
 =?us-ascii?Q?L0gLbiTd262nsdGqiftOc10QPYtAcR8hlnYF4ooQUmyAPYDhr8+ZOJ+agQXL?=
 =?us-ascii?Q?7Cx9dtEtDziHb5FtWe2bQ/pq1Oxuc2OxwszbqvWolJCxn3exKW8dpI0r28bh?=
 =?us-ascii?Q?8Ka1OAwQUWZsiO3yBgr4Vvp/V7OSFBLACcrlshHxydnwprEPJJmzk2lCBu84?=
 =?us-ascii?Q?WqweOICdxBp4w0E/K15+C9lRmsAnDS3j3eZK5VNTo0b9kfU6TYm82ksjP9uQ?=
 =?us-ascii?Q?Nzv5X0pg4fjqwcuq0+rdnE0/MCXgr72urw+F5ZWmj+5ptTgg097fNCObjFfM?=
 =?us-ascii?Q?lHxheiPHmTwukUE9gEHIGBZzl+dxQsHseE1/02CfvpZAosHO4PzFAc+ENuzR?=
 =?us-ascii?Q?PZkygvesQxkkDCBk9RfoATRoHKdKUcnYMP48R06KfWNkYWuZckePk2jkQeB1?=
 =?us-ascii?Q?ala53O0V9m/4J4x0UzDIFcCbQp+2o++5+nOdHv/v1Gmb2w352mZ+I/ZXmLn5?=
 =?us-ascii?Q?n25nlsMhjsN0cEdIvbGHEGYghDBHbbVolQIUVfFD4iFFwaw9i7/tBiZCy4b3?=
 =?us-ascii?Q?LG1QmpdZluzXwnckJGt0bV9Q6Mtixuuv+LSA59qQGNBkbwLQZXFcTHwF/LWe?=
 =?us-ascii?Q?4DnqPP70Kc6V/bcdXejrD7VRoun2Q3kbAgkuDWSF5Yc7p2zftEwiUv2zhx1r?=
 =?us-ascii?Q?49wMuRXEZbK9LfHdzveYvbDSHHB3jmrCgzUMUHc3o+fqleZlL0xEz/Pl2mT3?=
 =?us-ascii?Q?if93rkezqjvqeWMLoUqIoGS/Yz+dIm4Y9viRmQi2MtrUsHy7qLlbxInDCocr?=
 =?us-ascii?Q?o2XaumIPH7Atu6dJuq/vXiCf4Vd0KHN6PO/BLn8e47j6vprYWlIXyWA81/AB?=
 =?us-ascii?Q?gDFyzPZRoE6RLwtNcPuskfTCrI0KfyPxERFyBKNA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a08243a-523f-4733-8884-08ddb8b6a1b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:47:49.6442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrH+HPdIFdyjk77Grk4zClHipAB+crq7oO8w+DXaLl00joFIpPnmPj65XIfHARUxD2WeuurQjDWvvEtjpg2VHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfXwgJlJEA/SH9Z 0EUxqM4cmVEic3fjoNRmT8FVtdhYV9Dvkiw7bXbkOwVqJucwfgTKCGAur4rTK+lK+7CTBhyEgVD nNXwsLj3SRKdcbeviqQ4hp/xJO9H9xeNdrelBenl7kQrPQ9H2wA1Dw8Kc/L2ykSI/ONchBAj4Fb
 dyDESdwzXo4cHrUFLqfNDRJh7IhcJI2t50Kqi1AcoCuYllVoGJMKtD+qQj8NFeiTOL/HQsbTIR6 388cbKhua9QnOf4NtjBhwZxKsOXQ5vg5yU79DU1xwsfu+1N9KGmlosKG8o1pyVWWQGOfSvvMqrw Iq+3ay2WcCUWbUqv/GAuO76s2RmJ82yayAG8mppaZBIHfCzemdQdEbrbItYdJJ20KTNTKn6GCaY
 DmTZQaHwwyDE/rkt7t8dhpn93NBcuiRwip+5dPmOJNAzGtpzyjmTHhZWzdgAR54Vwi3HuREh
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=68640328 cx=c_pps a=kuLTmBVh2a3dvdeKPdY0HA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=m7sLtJ0G8pUWWsESV5YA:9 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ryAEkuJH2x1Z1_Uvr72WMPQiDSPgutOk
X-Proofpoint-ORIG-GUID: ryAEkuJH2x1Z1_Uvr72WMPQiDSPgutOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219590

Inherit drop-unknown-suffix to remove unknown suffix in runtime version.
Also remove 0004-autogen.sh-fix-find-version-for-beta-checking.patch as
it is no longer needed.

Befor the fix:
$ gpg --version
gpg (GnuPG) 2.5.5-unknown

After the fix:
$ gpg --version
gpg (GnuPG) 2.5.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...h-fix-find-version-for-beta-checking.patch | 31 -------------------
 meta/recipes-support/gnupg/gnupg_2.5.5.bb     |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch

diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
deleted file mode 100644
index fc7d964ec4..0000000000
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4d8cc1982273d571b4e80fe981878d0fa5884236 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Wed, 16 Aug 2017 11:23:22 +0800
-Subject: [PATCH] autogen.sh: fix find-version for beta checking
-
-find-version always assumes that gnupg is beta if autogen.sh is run
-out of git-repo. This doesn't work for users whom just take release
-tarball and re-run autoconf in their local build dir.
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
-Rebase to 2.1.23
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- autogen.sh | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/autogen.sh b/autogen.sh
-index 9f91297..116fb7f 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -270,7 +270,6 @@ if [ "$myhost" = "find-version" ]; then
-       rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
-     else
-       ingit=no
--      beta=yes
-       tmp="-unknown"
-       cid="0000000"
-       rev="0000000"
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.5.bb b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
index a30dbac62e..85308fdc34 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
@@ -11,12 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
 
 DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
 
-inherit autotools gettext texinfo pkgconfig upstream-version-is-even
+inherit autotools gettext texinfo pkgconfig upstream-version-is-even drop-unknown-suffix
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/ftp/gcrypt/gnupg/"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
-           file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
-- 
2.34.1


