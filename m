Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C73C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 13:44:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11241.1739454276821165699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 05:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=413986df3b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D7QZEi006433
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 05:44:36 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6k00m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 05:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t89FnEldywM/gKhsZnXUaFomC4UhOMOqw/uTbzLSn3JbHQDkMX00dSwgvfrzpQLMjFma4hsEspCbv+K4N2BDcT7+YXAHWwJzgtEE0UM2vzFUj6bwZ9keDDhN5bBJbtTthMVgkqeMiYJTaOFU2AsCh8UJs3GzwF1v/CSaSWZ+zFMor7BxuuS3QvDWQQEhsZN1l6Di8degjcEnODQtyRLbTmXFSXiZObL4kYnmid9Xa97DZo6oZFdy+85mUtoxEavUERSfk4InkXbEtCzqxC9f27ne3y3weymD6h2zKljKOS+94KLeVlcEKPGny63qJJ5aVuCMlp2pm8+UTYoz5lSSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR7bqbssZpEmANAzjS4SZLbsirTImGwJ5lD5nT6LvS4=;
 b=YqMQSMEQZa8gh4bgTxgdjWp2jodYwIe97apEo3m0aUSXZ/Lbe0A3O2P4v0D0R6oLqwzlcxT3isiMOX19WC5IorBDwpLDAAJH8x4FdItSr5mgCyTrXGKlrnaXL9zhSx9vZtKRJWQBp179Sg+CKQ4ovjqXDzHYQ586vZaJynlm5uyPeoXOh/XOI1FUqt3ix1dmXPkIL0OuEqc95dGlXE1jwHlAaH2vb2y2+UMiwYtcQ1nFaLGsdVbszM6mUlJh8qfaVEiP3u7homIAezcH77BAS1HTcHnAjf2cqEZC9pxBnXrceY/vqq4+YJdS/Zme/13mUDeYIgOCJ4RH71BJ0h9Vzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.13; Thu, 13 Feb 2025 13:44:33 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 13:44:33 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: make kea environment available to lfc
Date: Thu, 13 Feb 2025 21:44:18 +0800
Message-Id: <20250213134418.2499590-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0225.apcprd06.prod.outlook.com
 (2603:1096:4:68::33) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b545c8-773d-4fba-4115-08dd4c348c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wFTG1F3pze1R/e9BaBoSBeiDSE0606phEidBiQoKShHASopuSOuqDYRUnqoa?=
 =?us-ascii?Q?hZDkBbdjEz3Hq7uO4hA7VgG3LIEg8rFef4KPs3cLv7hVw3S7qYLbcY06HMo6?=
 =?us-ascii?Q?Uztxp/Kj62gti+zpnz/ozHNC4IGgRMizkT8GjWA1bgy76iKgdT0uOwDa6Ktt?=
 =?us-ascii?Q?Z7rBdznAZHjJNXeXE3kWsnZxeaBWbbb680WsC9ctbrGgOg0ktwOalBLGdP4G?=
 =?us-ascii?Q?GnyjmqYCvVjcxu/Y1/KuETg1GrDj2Pel49yTFSNA68CeO4WlbSirkhDi/FzQ?=
 =?us-ascii?Q?b+gewEKbpXuf4mbypz67c4Zbyj6d/aHvvIjGXku72LNcwZ7o1oa/b+24Tgtk?=
 =?us-ascii?Q?MWAWV0KYJIZ9DySm2CiXCPvyZDRs99VZx+vtUwuWbvQ3BjmDOhv5e3TP96bP?=
 =?us-ascii?Q?h7CF+Gsq1YFxfiXptt/SfEMJazvitJiro0Q7UGPKqZErc8PkDx9JI0eXWvZh?=
 =?us-ascii?Q?oeWmTvmwEcklOATA3pXtbDiqOVIni7Q3yZ+9lL7NdOZVdAbiS/wQmEh0tNXD?=
 =?us-ascii?Q?QudKUKrOlGIALjWpNK8BYazKc/10ScoTksvkyfCKcfj9IcSuJ+hs9Wbduf+k?=
 =?us-ascii?Q?dBpRkDqLAEyY54cBQERaiKQmV6jpwAm+3HdiusED22heeadngf9dLqEca2ge?=
 =?us-ascii?Q?iT7tSp8NEnBjM3L22v0HEmiXL2zezoN0SsCkZs89of3SgEBafO15AabTEhji?=
 =?us-ascii?Q?dvNrZgG1+RFoehMjEu7+hysDAMunmqBd9K9L1/VUO4t/41bgY/PCpeyagzzw?=
 =?us-ascii?Q?yUaKEPkbAZBLKgav/6xI8yziFbfxazbFqPgBhcqUkmzDYIg3pldoCjAqMiWK?=
 =?us-ascii?Q?uBapemzpWwEGRfgbQ6OVHFdO7ykyO7IM6T/oBlttK1z945Akz1OkIQyGr1H0?=
 =?us-ascii?Q?vB+mZhaA/7Gp46BkxL+ySI412QRLISLVCw/8AxUkcNO3+dKgydXPUrX3hQEn?=
 =?us-ascii?Q?2TEV/yFIWmc8pbiiYuE7Lms2PiVPwA9sXcYA/DqkgJEJjgX1aK5v07CKITub?=
 =?us-ascii?Q?N3gEE9rocJD4E5RIUBAOj/p+o4UW64IDdtsYs0UVvhbPl/ElMNzluVw422rR?=
 =?us-ascii?Q?CyyWQDaOJwP7EIGv5vPYdNlKpTbVSDt+LgYDyV+bXqH9JXE3jtlQ7PFFG24m?=
 =?us-ascii?Q?mg9sCaOfOjIIMcpHtGuKi2OaePtA1eSm7+CvXSHmiRV+wwd6nT/hi2a3o6Xf?=
 =?us-ascii?Q?aOa9DUaaodv9eLSyz2D7fWOz3+tWRlj7B2EdKIRzHXzg0lF2B5GG4MHGMd+P?=
 =?us-ascii?Q?+JPkOf5x7KGWL+9NYbx5RU+lLMTodBwT1JXx/st9lUHjOz6unpjWBRuvX4Ou?=
 =?us-ascii?Q?4sfO9FWqHTskgpcfuh8T3XvpuyazPCeB0ZDIBNYVO+2j0NSt/uHPauxt53rz?=
 =?us-ascii?Q?JW+zvft3UYY+SWXnITT6SYtEzDQUssx596L1+EZ8ziT6i/i2/bPRGk4yEYme?=
 =?us-ascii?Q?gKNEGP1Oi2yMUJPMBxeplsy7OWJZ2POv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eAwSPQuglM1fv8z+5TS2vQEhU0He6MOReOYDpUgMisfSN53keLvpyhSrFFO5?=
 =?us-ascii?Q?K5u5d6klPeZdVXCyopbDRaN+qRCsIvpOup9n+RTbMETIq2PzOOsu6L+izbCB?=
 =?us-ascii?Q?60cuZWM5D1XOJzASBWsg20PftOZ+m7ZA6JSdZRAIw53UAFRsGBSO2NxAmQsb?=
 =?us-ascii?Q?nmwiLVk6Hvy1kfUHvsT3pQFrt2KeV+XtQgqxIZCXuwBGcAKObzFok7zrLevm?=
 =?us-ascii?Q?iP1/X9zstbRJNZNFTh8gHkqFv+1FNIKceuLzwG/GQxTO9yHH8PyicjBHDWTT?=
 =?us-ascii?Q?lh3m/ZxcWnBQrMS/VfG1Hc6iG8Z++OEXIRZiYNdAzNOEnobdFzWhSRfa4DRp?=
 =?us-ascii?Q?Sii4h7me8UfGBh7qgcbZt0aBZ74RSfM//jUdY0C8i/Ez4ziblHOkZzuyg/1L?=
 =?us-ascii?Q?g/t+UwOr1Tc0Bx2i7TnLX3pAjoqtISs406pjNlJ0XcHhmj2KS9C3NNhvkWDN?=
 =?us-ascii?Q?VGhaz0JDMNr3sAznMPqvA0kIfWamGIYvCRu8MgWVgQR/AEPFzx0/1zsoiHrH?=
 =?us-ascii?Q?QURAtEn4Aa46ucu4HphLOc0zpMTX90d254VuuUfGwlgFeTZxJQtt6PjFiMdO?=
 =?us-ascii?Q?XGn2i0xy1DRQZbHkHXxtRYJ3yA9sdXkxNJXAE+QD11/QuBUYyFvxqZSCn0sS?=
 =?us-ascii?Q?+1jWwvjJ8CxVmeD/yryF4pHlyRwIFAUFK5RGJYqBFNB+8yabZUi0ASGO9O3H?=
 =?us-ascii?Q?JfIgWGMyNtXiw2ilSMTmi6VNMak5ndbnYpc16kHvgQNLIWDlNl2Xz+65MXiN?=
 =?us-ascii?Q?gxivrUH2+ZXIkflWSXg7QgkkmrwRgrlOWNbGjgzwtdWYt0qAsqejTs2Gns5q?=
 =?us-ascii?Q?SedFZMCJc3dKjvJmqTyE6ZLKlbFw8Eqh1sXJLmA4fdm5vtdz5te/wRiv+aco?=
 =?us-ascii?Q?LNwS0klE4EPUaqi6WRboI1XYKieHoXb/1dvW5ZUs/3ucxbQKMPE/r0jil3Yp?=
 =?us-ascii?Q?uSPPZfpXkmQGvEqTK+Up4AGCMpoM8ehkgKYOJ631HjyOiY2Kdne6fhnt4auX?=
 =?us-ascii?Q?orepQZ0Yym4DE9Q0WaQ/pO4HPiEx3u4rJ9tcE5Jz+eGPmEt2ueyCco1eUiMt?=
 =?us-ascii?Q?UB81XOBFJWbJ10uDUgSwmbC3pyHrdCAX+OYSqPJv8to7lpmAJlcStU9sAKUB?=
 =?us-ascii?Q?2PRWuYP56l22eHyqA62KYKBJ7fGfguC4DzRE4onEnfhA8ZLk7NSugPI9ginC?=
 =?us-ascii?Q?v8BR0SKUGe5JImTumFgNGFrH3IO7RvXlzj3Vezhk7O514ls+f6vYdLJPDCsJ?=
 =?us-ascii?Q?HsB+3OZvG7bi41d3VByqkmJPc0cULz7SibNqyiE+Q29WDkfdUzF3Qma8jPdX?=
 =?us-ascii?Q?haE/XiSiBM6YqSiTzHDT8+mgwxOWOUxZxwH6GUAAc1fhnr8nkmN+73W8GouQ?=
 =?us-ascii?Q?bgHq1t1kmElivzVzJdipnWW+TMFt9H4i6xNlYWiVgWcoJqzYm24HMihnsWAu?=
 =?us-ascii?Q?y+t1OP21WdLLdZ8mhiFixRhxxLqE2IQi1i1MT5pa9hzxTM24lNzdxS4aGoOY?=
 =?us-ascii?Q?G9cPxd41bkPemOIROigfkBei9jPIrgbZzgH0yJEbTPRDa9NnY6tygd4kfrC0?=
 =?us-ascii?Q?cekCvIx/5ayRfQ/YGbtXdfsT4O2RPSyE9e7NlDHU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b545c8-773d-4fba-4115-08dd4c348c32
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 13:44:33.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdUX6H3bYOpW0n98k7cJ/7hBDtUtaqdrg+QNmmKE3U/gHquNo9RcoKKUy4aE9qgwJQIidEK9Qq/YkPkkM4Pzjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
X-Proofpoint-GUID: xdnnL2d3o6_PsOfeF3WA4y6pmh_5jlmA
X-Proofpoint-ORIG-GUID: xdnnL2d3o6_PsOfeF3WA4y6pmh_5jlmA
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67adf744 cx=c_pps a=E16apIjzS4FSNrpGVxxkkw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=SCo1hh1FAAAA:8
 a=t7CeM3EgAAAA:8 a=XzdbgVAW2zvpJcglhTUA:9 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_06,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 13:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211332

If using KEA_LOCKFILE_DIR to change the location of the logging lock
file, kea-dhcp works properly, but lfc spawned by it does not inherit
the value and uses the default path[1]. Backport a patch to fix this
issue[2].

[1] https://gitlab.isc.org/isc-projects/kea/-/issues/3450
[2] https://gitlab.isc.org/isc-projects/kea/-/commit/f477e8ebcc8b8e1f1adaad4d55031084c0ff6f40

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ake-kea-environment-available-to-lfc.patch | 96 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_2.6.1.bb    |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch b/meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch
new file mode 100644
index 0000000000..15c09d4c41
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch
@@ -0,0 +1,96 @@
+From 72d7e6c0b6b5af4fea2e4db9ed33757984ccdc5b Mon Sep 17 00:00:00 2001
+From: Razvan Becheriu <razvan@isc.org>
+Date: Fri, 14 Jun 2024 17:09:50 +0300
+Subject: [PATCH] make kea environment available to lfc
+
+Upstream-Status: Backport
+[https://gitlab.isc.org/isc-projects/kea/-/commit/f477e8ebcc8b8e1f1adaad4d55031084c0ff6f40]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac                                  |  2 ++
+ src/lib/dhcpsrv/memfile_lease_mgr.cc          |  3 ++-
+ .../tests/memfile_lease_mgr_unittest.cc       | 26 +++++++++++++++++++
+ src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in  |  6 +++++
+ 4 files changed, 36 insertions(+), 1 deletion(-)
+ create mode 100644 src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in
+
+diff --git a/configure.ac b/configure.ac
+index c00edb5..7b572b0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1629,6 +1629,8 @@ AC_CONFIG_FILES([src/lib/dhcp_ddns/tests/Makefile])
+ AC_CONFIG_FILES([src/lib/dhcpsrv/Makefile])
+ AC_CONFIG_FILES([src/lib/dhcpsrv/tests/Makefile])
+ AC_CONFIG_FILES([src/lib/dhcpsrv/tests/test_libraries.h])
++AC_CONFIG_FILES([src/lib/dhcpsrv/tests/test_kea_lfc_env.sh],
++                [chmod +x src/lib/dhcpsrv/tests/test_kea_lfc_env.sh])
+ AC_CONFIG_FILES([src/lib/dhcpsrv/testutils/Makefile])
+ AC_CONFIG_FILES([src/lib/dns/Makefile])
+ AC_CONFIG_FILES([src/lib/dns/tests/Makefile])
+diff --git a/src/lib/dhcpsrv/memfile_lease_mgr.cc b/src/lib/dhcpsrv/memfile_lease_mgr.cc
+index db4f5d5..0ecf3e7 100644
+--- a/src/lib/dhcpsrv/memfile_lease_mgr.cc
++++ b/src/lib/dhcpsrv/memfile_lease_mgr.cc
+@@ -209,7 +209,8 @@ LFCSetup::setup(const uint32_t lfc_interval,
+     args.push_back("ignored-path");
+ 
+     // Create the process (do not start it yet).
+-    process_.reset(new ProcessSpawn(ProcessSpawn::ASYNC, executable, args));
++    process_.reset(new ProcessSpawn(ProcessSpawn::ASYNC, executable, args,
++                                    ProcessEnvVars(), true));
+ 
+     // If we've been told to run it once now, invoke the callback directly.
+     if (run_once_now) {
+diff --git a/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc b/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc
+index 034f1f5..9edf637 100644
+--- a/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc
++++ b/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc
+@@ -534,6 +534,32 @@ TEST_F(MemfileLeaseMgrTest, lfcTimer) {
+     EXPECT_EQ(2, lease_mgr->getLFCCount());
+ }
+ 
++/// @brief Check that the kea environment is accesible to the Lease
++/// File Cleanup process.
++TEST_F(MemfileLeaseMgrTest, lfcEnv) {
++    DatabaseConnection::ParameterMap pmap;
++    pmap["type"] = "memfile";
++    pmap["universe"] = "4";
++    pmap["name"] = getLeaseFilePath("leasefile4_0.csv");
++    pmap["lfc-interval"] = "1";
++
++    std::ostringstream s;
++    s << DHCP_DATA_DIR << "/test_kea_lfc_env.sh";
++    setenv("KEA_LFC_EXECUTABLE", s.str().c_str(), 1);
++
++    boost::scoped_ptr<NakedMemfileLeaseMgr> lease_mgr(new NakedMemfileLeaseMgr(pmap));
++
++    // Try to run the lease file cleanup.
++    ASSERT_NO_THROW(lease_mgr->lfcCallback());
++
++    // Wait for the LFC process to complete.
++    ASSERT_TRUE(waitForProcess(*lease_mgr, 1));
++
++    // And make sure it has returned an exit status of 0.
++    EXPECT_EQ(0, lease_mgr->getLFCExitStatus())
++        << "environment not available to LFC";
++}
++
+ /// @brief This test checks if the LFC timer is disabled (doesn't trigger)
+ /// cleanups when the lfc-interval is set to 0.
+ TEST_F(MemfileLeaseMgrTest, lfcTimerDisabled) {
+diff --git a/src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in b/src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in
+new file mode 100644
+index 0000000..3eb71d5
+--- /dev/null
++++ b/src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in
+@@ -0,0 +1,6 @@
++#!/bin/sh
++
++if [ $(env | grep -c KEA_LFC_EXECUTABLE) != 0 ]; then
++    exit 0
++fi
++exit 1
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
index 19e07f5da3..c2818c3386 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://0001-Replace-Name-NameString-with-vector-of-uint8_t.patch \
            file://0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch \
            file://0001-Update-asiolink-for-boost-1.87.patch \
+           file://0001-make-kea-environment-available-to-lfc.patch \
            "
 SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
 
-- 
2.25.1


