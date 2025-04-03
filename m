Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98A9C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 08:37:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8443.1743669442950831977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 01:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61887b46b6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53350L6d009252
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Apr 2025 01:37:22 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0r8f4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 01:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itb9T1BnAZzeWJlhpKZvReidCDx/XEi7BOau8/23tPP4FueWfw28E6g5z3DaF+nfV9JmRYDCRcjjfryoovGqh0K75xXEE/TACHJwMo3sIT+OPZx12E3B0CSjtnEEvUxC5zvM+jN5fo5BTvdhrBe2EBo5apMZZ4exeCYTv89dq+ITkMDQ4aCeekGgCrl/BlFFd+2jFls9WjAf9daiOAuu/4ugElVxyLEdv9myBrkv/k3AeML5KP4cwA7vp4clVx27HHDlgJgYnX0gdmqtjXlxWqH3MVMdRnIyY4bJJU14tNVbB36atNImQLHraZRBPbxd7Wx806wzsedugtsgj1zWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp+4bb5BbgVHxsRfkaY5q9eptQvhpW4vYUVZB46Mvh4=;
 b=Ub2zEY/UyFoG6wvak3fHXFm0Solrg9DKVHFTn6GJ4kcVMekY7aP2aMmu+2z/5xrmjytUC70CQXDN+BqOz7g9FYUSIRKf2CGE9gAwX/QtI6gzaDSE54Q0B2dvRnDoHGo2cbbL1IKsfZrHHVSgQHdLmoqX0KNaW0qSD2hMuAppydG7JNqVsiQDUZOm/dHXHglWnpeGpM0r4fC55/o/2y/Pf6Q39O2V44NLGw82rBDCLTTnKRnyzkPZ5cwPjhIP0P58sASLeyGO3iIEit7Jtq4ZUql0wMvKOphCEjIbfWzoaqYbbpSStRHHFS2ukYhIh4k62k6DEHRgKwBGnGYfpakWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB7658.namprd11.prod.outlook.com (2603:10b6:510:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 08:37:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 08:37:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/wic: add test for excluding symlinks
Date: Thu,  3 Apr 2025 16:37:04 +0800
Message-Id: <20250403083704.190164-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1d4b60-9f36-4ead-c06c-08dd728abf23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jbwwcxGxt1weh2E3YU9u8oucW1lty1JSVYqsFmPg6zyuy876MdeJ51VZEn2v?=
 =?us-ascii?Q?OWnG4JCFAoDtbOjCWjn1iq3pZHT2YXMY6MPklcm/4Y0Y7YKsh72F5/hAASZD?=
 =?us-ascii?Q?iGNvQxQ2+udGRPXhDfCU6c9J7HqGwGyVlrzx6B1h7KdJScgfn5/p1gG+my+p?=
 =?us-ascii?Q?obakahN4tt6Fa9JZUz3OfUASv80Ny3p5q3m2wFsLjht7yG9M5NEfK4iuPLAJ?=
 =?us-ascii?Q?/nQCVtjA5Jd553mDs87zuv2AcuLZpyeaRgZObZZ0VURrwmwpMwFhowga6Ahl?=
 =?us-ascii?Q?MNo3RUw78JuqT4Z6Fo9OaehR3ySgrF275todT4v/gTvfflg1KYGr/ajr+C8x?=
 =?us-ascii?Q?1fI+K/kaU+tvlgrwPpyYbXD8IMD8iL+fYN6bfPeRnD7qgkDBP6rUd0zxZBYl?=
 =?us-ascii?Q?3rspHU9/OcehqqHgkVkPHxXpruuZLk2s/GwFeySpMphyqCHZsyN6T4g+G2Hy?=
 =?us-ascii?Q?I/hFv02B8KzdOXByJbRPZLeEk/MJBKiHznGT6sedGZrvjIDtBmS4rUOOXpw6?=
 =?us-ascii?Q?EJGbgCIeTjq5bDDx8QcWQKQbnk6wunzbSNGTnClP5EKsJ7oiwEGSBBZdgdk5?=
 =?us-ascii?Q?m6KIWqQ1PxeUNxYuDRIqgZpZlvV0rkgNDmlPz4rnVrSnYvTBQj7+rRPP2hwj?=
 =?us-ascii?Q?+K2WhlWjvdYNyUNxRpVAfl5LchtDm4zpjyYFYv19VgKYuGqz9KLIxPun92d5?=
 =?us-ascii?Q?YAvtCXnicXOCnny9UKjUPL+0v6HiJnUlGvm+l0uwNYFlEzbIYMANSBC4s8+5?=
 =?us-ascii?Q?qCnIN6x6zQbGCG2KEcrNSF0zROpRurxT/lGrnqAIZl6ReyBOLM0u7NT/G6y8?=
 =?us-ascii?Q?JdLrisC0jcm8Z2C8+FR/URKuuCOk3+WrdtoJhlLBKFqZ5hgedQqrA49y5qwk?=
 =?us-ascii?Q?Yooy5/Psc7eJehjzrenlREobBThHB26OJU0I79rIvB5wxiwvgnPD5FIo0BG/?=
 =?us-ascii?Q?kkC3iof3xOkARrtnrgxrdaGy/mMuhwl3b+Cr4d9a9ulE7CGvENEmXY0x6+XG?=
 =?us-ascii?Q?7pXsduymftHlngrYksBxoXz95gKW7lYHhotnvV0cQWjE/Hk+2jdVVzB43hnP?=
 =?us-ascii?Q?rq9HD/iIrtxYPd7pPWy8UsP4bfY78X8HXe59qMF6MB2OJSXSsPc/NEcT4AiS?=
 =?us-ascii?Q?wKxB6S03C0NXcx8VEsL+Ck68DUT6gaXha3vNEWDOILcAdRFIP0OYsa9pEKMT?=
 =?us-ascii?Q?D3WN1eqEICO03GQA9DIDp51uvhje6GqzI3mahwgfi1n95wi4v22S80Vf88rq?=
 =?us-ascii?Q?6moT9Q8LRB1+PICQV43rTJA6FFA/TWCFkNcvtwYJrq02IY0WS/hVhyXLmmYq?=
 =?us-ascii?Q?7z9w/0/e4qZeLV9QbWgq0gyVtueczQ/y0dh+w95HuSqQz3ShyiQmOQqmgGU0?=
 =?us-ascii?Q?rFztFoKtpodJMbhTvJXRb1RYDELT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IsvcVTQqPrOl2BjtAT72V1B8ghARH4mXLZ5XqwRMnY+bEvvzyCGF1VeFxXk5?=
 =?us-ascii?Q?jnvM4YoLVrWfT0tJKEMTAXQun87txxmq8r+o9Vv7SlQcp+sR1DktNmgpgZme?=
 =?us-ascii?Q?H3FrcjgwgfLVIS/fu3DvMev3koSR55PFBlMgtcSt1VoprSIhwKsuC0gkK5ev?=
 =?us-ascii?Q?yhpD7peQfyskBSA5qIiS0pefMF6d2sW1itO3mzp5Hvyxk+C7GSCaXpQNkYQq?=
 =?us-ascii?Q?sXqAteik/+dLic3ceue0lP15EDEX5gkrDCDnsGNWQhSyORazwzdVSCIMeYLX?=
 =?us-ascii?Q?x0E8ulmV8CuvFCzmXW8oBXFcC6rACYxctWFI5XCfivuDFiaNgrB4711eOeW7?=
 =?us-ascii?Q?MHKwjc8EjpHF4JemNE4F7rhhj7uH1lnklJhJ/ww/Djgeg+0BZAvmYgoO+cWn?=
 =?us-ascii?Q?b97cR6M9MKhNhdj6og4oAvPwzVHf9wXFzzGI1ly+b+XJTuEaaKx3xwcO9kZE?=
 =?us-ascii?Q?pP/lFEEkvQraqLjar8QG6Yq3EE5ANyo678VWb7vnd+YvCfyt4roTAlpHLkj6?=
 =?us-ascii?Q?4B+mK/qkEDfLsufhbq7gO90zcVPdWcQhWiOGHPN5HvB0Q7vgTOZ7+w+ZnJ7h?=
 =?us-ascii?Q?V0wENikheUsPp3+WgjEQ2pQtDoeDCHrM0iLMFt05WKEw5VVI1cJMS3GEJQ6y?=
 =?us-ascii?Q?Y2bBq4I5f5HbhbwPPylBG+SRSukyYJy4yPmNO0WORTIDWxUmogoUAfDb0rsI?=
 =?us-ascii?Q?2INlxpXl9ggL+xqDsOFPVyRNOybBKqPCNCXs/JYYg/pSyQ+6li5avaltb092?=
 =?us-ascii?Q?ljD1Z1O18mK0Qp1fdxaYXhVcM5Pd4u89LyephRnJBr4Qk7ILjNIOepJCmvhi?=
 =?us-ascii?Q?h5wkBX5gifcaK/BE6W0MH49mugVeBB4vDHxFBp6HuHfcUYxDy2HgvnJ73nNp?=
 =?us-ascii?Q?2V1DuIEQKV8rmAaFv4R6Vzrp2vBHv6dca31+G2JkYZrRyriqkbVnkolur6Yr?=
 =?us-ascii?Q?gNHU7brzk0c+giauAjixgYZgWm+UCNIfeaUmsCHdfdSDMmyZvWBUUKphk37S?=
 =?us-ascii?Q?nXxcFw0ON0ptFzgxeKBveDSrns63Rty8/AXjxi2NKKodhacdTxypSGRT3ODV?=
 =?us-ascii?Q?rZnnFnPXPmpYIIzrSi1VsFgWiHv69Nae9dwRGV1J/gbs5StvJ7WWrV6xCzci?=
 =?us-ascii?Q?cThz4x0aXLBQ8LgnfgByzkGYYmcDjTQMJeC18gev/zg954n9+sVGCd3f3X21?=
 =?us-ascii?Q?jX0JxL0zK3Te2wcCNN7WDoGTRfQjXz8R/A1ABi6YPTJXH1yUyPfK+1oCjWlM?=
 =?us-ascii?Q?6ZyXRG8ZYzMEpANpA1QIeyfsYBZlJSNvkoFwtr9kW6Q+g+wA62dSjJEPOshE?=
 =?us-ascii?Q?S8Tuo/B2gpYPvulDyEKoDUQ1+51JoKKzEpQXTfmIlMsm3obmNyKcmg1Aazk1?=
 =?us-ascii?Q?yZFacct+s5P9fQYZJyDW7mCEOIug1k4/DQhBZpgYbk/EEQeKk2u5YuKlX8gw?=
 =?us-ascii?Q?325CYbKqt3QSO6q8btF3goLGLgplNM9W6E2ywRn0zQx9GHt+gKVNMxaP21De?=
 =?us-ascii?Q?xNkEGVbJu2+iBLZcPcZjJ/UHe+LFutppFeU3uvQmvqg7UfCmzCWxiY1tyEtp?=
 =?us-ascii?Q?LePkYobLO+mbWLQS7diyqaGr86mKZfR5c5kT0RPN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1d4b60-9f36-4ead-c06c-08dd728abf23
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:37:19.6101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgsFSxEicugDU4MYXbqvo7d1U9yL3OO51Q2W52vXsQC9+Pubzs/zkAY4SP0vPV/6tR9ZqOL/rqGJZriiHO5I/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7658
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=67ee48c2 cx=c_pps a=1mby/iHf9ieL9308fKykyA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=0N7b1OelbYKXCaVqINUA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5WTnHRrWbyyOiGWfcCbrNOCwgdp__-zI
X-Proofpoint-GUID: 5WTnHRrWbyyOiGWfcCbrNOCwgdp__-zI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=875 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504030033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 08:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214307

Add test to check if --exclude-path option can exclude symlinks. This
test validates commit[1].

Test result:
$ oe-selftest -r wic.Wic.test_exclude_path
2025-04-03 15:11:25,211 - oe-selftest - INFO - meta-selftest layer not found in BBLAYERS, adding it
2025-04-03 15:11:30,016 - oe-selftest - INFO - Adding layer libraries:
2025-04-03 15:11:30,017 - oe-selftest - INFO -  /buildarea/poky/meta/lib
2025-04-03 15:11:30,017 - oe-selftest - INFO - /buildarea/poky/meta-yocto-bsp/lib
2025-04-03 15:11:30,017 - oe-selftest - INFO - /buildarea/poky/meta-selftest/lib
2025-04-03 15:11:30,019 - oe-selftest - INFO - Checking base configuration is valid/parsable
NOTE: Starting bitbake server...
2025-04-03 15:11:31,652 - oe-selftest - INFO - Adding: "include selftest.inc" in /buildarea/poky/build-st/conf/local.conf
2025-04-03 15:11:31,653 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2025-04-03 15:11:31,653 - oe-selftest - INFO - test_exclude_path (wic.Wic)
2025-04-03 15:43:11,341 - oe-selftest - INFO -  ... ok
2025-04-03 15:43:11,341 - oe-selftest - INFO - ----------------------------------------------------------------------
2025-04-03 15:43:11,342 - oe-selftest - INFO - Ran 1 test in 1899.900s
2025-04-03 15:43:11,342 - oe-selftest - INFO - OK
2025-04-03 15:43:14,834 - oe-selftest - INFO - RESULTS:
2025-04-03 15:43:14,835 - oe-selftest - INFO - RESULTS - wic.Wic.test_exclude_path: PASSED (1899.69s)
2025-04-03 15:43:14,836 - oe-selftest - INFO - SUMMARY:
2025-04-03 15:43:14,836 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1899.900s
2025-04-03 15:43:14,836 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

[1] https://git.openembedded.org/openembedded-core/commit/?id=42e829ac1e9d74646b6dfb327b18b15f6b0df60b

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 4f5d43b5ee..59fd99a788 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -446,8 +446,9 @@ class Wic(WicTestCase):
                 wks.write("""
 part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
 part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
-part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr"""
-                          % (rootfs_dir, rootfs_dir))
+part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr
+part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoami --rootfs-dir %s/usr"""
+                          % (rootfs_dir, rootfs_dir, rootfs_dir))
             runCmd("wic create %s -e core-image-minimal -o %s" \
                                        % (wks_file, self.resultdir))
 
@@ -466,9 +467,9 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             # 1:0.00MiB:200MiB:200MiB:ext4::;\n
             partlns = res.output.splitlines()[2:]
 
-            self.assertEqual(3, len(partlns))
+            self.assertEqual(4, len(partlns))
 
-            for part in [1, 2, 3]:
+            for part in [1, 2, 3, 4]:
                 part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
                 partln = partlns[part-1].split(":")
                 self.assertEqual(7, len(partln))
@@ -510,7 +511,24 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertIn("..", files)
             self.assertEqual(2, len(files))
 
-            for part in [1, 2, 3]:
+            # Partition 4, should contain the same as partition 2, including the bin
+            # directory, but not whoami (a symlink to busybox.nosuid) inside it.
+            res = runCmd("debugfs -R 'ls -p' %s" % \
+                             os.path.join(self.resultdir, "selftest_img.part4"), stderr=subprocess.PIPE)
+            files = extract_files(res.output)
+            self.assertNotIn("etc", files)
+            self.assertNotIn("usr", files)
+            self.assertIn("share", files)
+            self.assertIn("bin", files)
+            res = runCmd("debugfs -R 'ls -p bin' %s" % \
+                             os.path.join(self.resultdir, "selftest_img.part4"), stderr=subprocess.PIPE)
+            files = extract_files(res.output)
+            self.assertIn(".", files)
+            self.assertIn("..", files)
+            self.assertIn("who", files)
+            self.assertNotIn("whoami", files)
+
+            for part in [1, 2, 3, 4]:
                 part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
                 os.remove(part_file)
 
-- 
2.34.1


