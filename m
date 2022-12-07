Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1903C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 03:43:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6798.1670384592476201291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 19:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9340152798=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B73hCMi023313
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Dec 2022 19:43:12 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqtuua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 19:43:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcffwSXW5BJou4jd5DF+5kgpuKo6PQULbbknlZoRV0mqjXUmEeQzJ4+t2qndwrWvHRx8W7QCDvdU0HG/DniRq9fHddzk8RbYez47uV6sqaMip3s+Lst7zJwDr8/f9jFubhMfEKgebHCya1OcjdhIiSjCZoNXAt/qYEGbcATx+6JD0uZw2jmx0L4Ay0C5ryBgcPUIsUt+P4ixUiFqHAkRXph482tdKjuSzXcIk4CZ3dPJTNmiSi/JZnhavoSsI1WsDL9AMTbxjFJATzh7W+Ss6x/GbArLjvJNvEezeYpMQqDizgiN+bzXuwMIxBBEPLgpOHm0jOBUPbTggOS+7+9+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvOSOHYx3KvT4ITrUTyV27dMW763CVE2mG0YGUmSoVU=;
 b=TMCydPfXrPcTrRsOS57nEVJUmhLiDJeGneGO8ayHQJulsQeIPqZl5b7afDCJ28PGUOqrXwZ6judtNLnkzHxoJFyK3DdeD6O7Z3jvXwR+da7UCoGc9wanUZ39sDs2J4FdO7nJTyCFvU/WxRZzpIB4E4ktn21FiTVJKxoboGTLkNvxqz8XHxfVE6jTTxK4goOeNP+G8bbnaDao8CTU5BrForQmaeHAicaZdyjPAzau6RN9GgGhAvCcVsOfJnl18paieS4RRh/wODz/f7JeFZZnSgkJzldDCU/vhVGH7a8GWlDg2jWwuW4SaDItVQaM9kK32GKRvVDKp2wvFZzvN/Aj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 03:43:09 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 03:43:09 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][master][langdale][PATCH] grub: backport patches to fix CVE-2022-28736
Date: Wed,  7 Dec 2022 11:42:54 +0800
Message-Id: <20221207034254.58292-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0214.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::20) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf14d1b-1a38-44f7-52af-08dad8052888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qUs8zvgZlRL16prXl2al97AQcImt+LNYG1w5xY3KhJ0KalMDRFCrgWTk7lKqrBJAppi+SR3OI93ULOQlzI4ZGb7KXetSVZ8ckXcrrkvVdyatqbIWEywnbt3fIaE4l3FSPC+2zK+bKl72O5UgasTXiMo2ns+tF6o9M0TQey1a9cElfFT74ockLlGzgxg7OXLm1QLHl/u9MoAxRQdNVA/T27txynPYTSSnP+aVF+5JPi2jxWTC+aql4EPwV0q81bgKb0lGfVs/6qgBiiPPgEhf9Yq8L+JnHXl8unrghN665ZW1Vvd1Ynfsm5XWs0G83ayJ37+Ru3ZlvlgQ66M46r+bpMYBPM6E133HqYzL6F/zs7ynnss9gqO7ISLKgNIn+46XcP9uMRAXSfz2ucpIkPKPMFKw3zdJlTNbKtw5rQ+D0GI65S83tI68WOFB7Nx07641IgznHevtmQr9WaCt7+rJyRVCUC+B2lHXhr3RrDlIIGTb2FqCXrv/QccaiD7YwLY7vz5LQFQBBUfi0A68mzTo9O9AQ0HkD35EgYn39k0I8/kHSSjzx1Y6Akze5lDvSyP1AvvVxnpna+obFzhZfKI6NYTzJVCYt8OV/t8J66w/BlnjXRJds0ThHB271PAjLGGKIOLc5iTHwoKIAbRtpEuBowubOnOmdgXoguzDsWEj40Y6ysGUILWLPyGfs0gHDpxs/900niw4ZQaK4H4BbZeEHOU3jgQS8E688Jt8J5wVRDYEixNstYREGqFzWWwlLvCGMdhIbdgx6VVSmBdZC8jxqA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(451199015)(5660300002)(38350700002)(83170400001)(8936002)(44832011)(41300700001)(2906002)(30864003)(83380400001)(6486002)(66476007)(316002)(2616005)(66556008)(66946007)(6916009)(38100700002)(8676002)(6666004)(186003)(6512007)(6506007)(52116002)(26005)(478600001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AaTRSnZSlq/qk1Rt5VCe+WSZtxHm73C4FZE0Yswdl02TdpUaRb3yuC1SYVLC?=
 =?us-ascii?Q?PL4kWlvZZrgkNKcrdHFpmS3CHp5xQwt7p+fMu6X4ryoxQeIPpJMZWm6wVQCN?=
 =?us-ascii?Q?7JnTuCeYTarswRKy7Kp2vgsu/q1zkRznvtsuAfmV5Zb0z9ZNo+uG3xI8oTqn?=
 =?us-ascii?Q?LZqBzrrx3J92W0E1cTvM7jwoQsoccFc27+yhLxp79pn6+fs1ZtW4FbaD6EUZ?=
 =?us-ascii?Q?uVxzidxxwn+cXgQyyGgv4nUDMbvx/kZIWxVIiTjMXs2hyUO2e6G23EhrkcU0?=
 =?us-ascii?Q?4M7iuImHfxcS/yPd8e1Rf2yABVCCBPVsN8tDrGoWqq40AcGVOHf1gwleTKfD?=
 =?us-ascii?Q?UrmabZZk7M0tDvEwbMAjjcLTLojB77KHutfzLEEMwaFuXRgmuUFrspmm8dJ3?=
 =?us-ascii?Q?lYuGYDiyLFB0nNuiRZejOe5f7NrMnsdUkoP1YdDwgiYUTmV1/7A4GAQLsXqL?=
 =?us-ascii?Q?tk7YzQ/B07EwFfNQ+8d0rWSjxoM/0cf1qJUTmeZx0rVeNvkhGs/7BIDU3Vyi?=
 =?us-ascii?Q?aXa4DSkomM4uCuBzC2Of81xe2zOPWnraGNx8jpJ05y+qK5BLfatsaDldcTev?=
 =?us-ascii?Q?9FlLjFygeIwrXf1J3DK8Z1j/vNwiQqLFcXUp19k8YCP7TmdN4Bw81P0zje3a?=
 =?us-ascii?Q?ctMp+vlzPXtvYvsHae/r90gYeWyG9fyhSdUmVQeWxewF9Xrj1eE2cnetVs+A?=
 =?us-ascii?Q?7wwh2p6F22aiwIHlHYJiSqTdrlRC5YlBuYcyyPgU8fyM5jmU+TACNvdftvcY?=
 =?us-ascii?Q?gKtljNwOUce4+i2ekGKrJyp4KErX38dZBedkK3aip2JuAJcLekGabfqpzInv?=
 =?us-ascii?Q?ZIQ9T1BcwSz15C2aNxySNLnJm5odjnb7Q3mpuboPfsh9yp7bp7VcnNQLRRVl?=
 =?us-ascii?Q?PuKIPTYyDb4Rm+dp5JuyjMtG7wRlSuUCV3SW75zny9CFfLey/lRc+MaYOW7u?=
 =?us-ascii?Q?BVNUwE8C4HeuV86cktFpNsquPvKV6JyvkykwXZP8dxHxGR5L6X8jHDYOa5l/?=
 =?us-ascii?Q?G+MU764MeLAxTttkoJGj+QU9EktqMPeif14Y4M7SwbJ5VULBCH2c10YHEzuU?=
 =?us-ascii?Q?hnMR0cPRlypbroQbHibR1xtdZq2E5Iv2vuvCxp3wD6SXMsMTdFxNTMf61i5P?=
 =?us-ascii?Q?T77Yy1uScQrMfG9BnZtgegXhmzdpgA0o5DM+TLkaOmTHMRL4aMyv3afvvJrO?=
 =?us-ascii?Q?5QPcUqGHZGr2jZtDj8OoGsWU9CVCg/hW+ss8Y7RuiIf2J2JkbG8LvL3Cyjer?=
 =?us-ascii?Q?X4O2MhKMPxbhPMl/AKaxiA8O5oIA2pA//NPcmVMlI7ayRsv7PrueVXdhyduQ?=
 =?us-ascii?Q?Y71eNFx14IOe0VV6xQoX2cXppGuLJQO5ssF2ETimYgfmOu4lR/S/90oFiE8W?=
 =?us-ascii?Q?h1xDASXga7ZcZ7xP4diCb65oYaiWRVIybOfyd+wAsf4L9eW5d9d4F74+n2zF?=
 =?us-ascii?Q?y8Ds0IrIDB3jtUxOcqujDpX8nYZajL6E8KSC3DjQauEM83kABh6lydPy06Ut?=
 =?us-ascii?Q?O8YhnwgDtUsEBzvkFOklSCkVEBWKJPjhKvtKVgkuW8wKN8UlhdvIZXmGXbFA?=
 =?us-ascii?Q?4ueHmGIH6jrBwTRWthiJB5JSth0yucrRGtVoq8HsEPuWcuonwMnDM8L2fiqL?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf14d1b-1a38-44f7-52af-08dad8052888
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 03:43:09.4836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfuWzkIyIfJmkSXEsckzRfVBaWdl0o0ZIf6TcywjfzLhP2l4wXq6LHNIBS39OtRqRYd3j7EcM1xk/ni2tlbqUPtxcEiEt+2sTm5SRU39Z4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-Proofpoint-ORIG-GUID: JuFSa5EdoppTPU-s7pSqu4gmKKagoeCX
X-Proofpoint-GUID: JuFSa5EdoppTPU-s7pSqu4gmKKagoeCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_12,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 03:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174341

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...i-chainloader-Use-grub_loader_set_ex.patch |  86 +++++++++
 ...ot-Add-API-to-pass-context-to-loader.patch | 168 ++++++++++++++++++
 ...hainloader-Simplify-the-loader-state.patch | 129 ++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 4 files changed, 386 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
 create mode 100644 meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
 create mode 100644 meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch b/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
new file mode 100644
index 0000000000..5741e53f42
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
@@ -0,0 +1,86 @@
+From 04c86e0bb7b58fc2f913f798cdb18934933e532d Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Tue, 5 Apr 2022 11:48:58 +0100
+Subject: [PATCH] loader/efi/chainloader: Use grub_loader_set_ex()
+
+This ports the EFI chainloader to use grub_loader_set_ex() in order to fix
+a use-after-free bug that occurs when grub_cmd_chainloader() is executed
+more than once before a boot attempt is performed.
+
+Fixes: CVE-2022-28736
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-28736
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=04c86e0bb7b58fc2f913f798cdb18934933e532d
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/loader/efi/chainloader.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
+index d1602c89b..7557eb269 100644
+--- a/grub-core/loader/efi/chainloader.c
++++ b/grub-core/loader/efi/chainloader.c
+@@ -44,11 +44,10 @@ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+ static grub_dl_t my_mod;
+ 
+-static grub_efi_handle_t image_handle;
+-
+ static grub_err_t
+-grub_chainloader_unload (void)
++grub_chainloader_unload (void *context)
+ {
++  grub_efi_handle_t image_handle = (grub_efi_handle_t) context;
+   grub_efi_loaded_image_t *loaded_image;
+   grub_efi_boot_services_t *b;
+ 
+@@ -64,8 +63,9 @@ grub_chainloader_unload (void)
+ }
+ 
+ static grub_err_t
+-grub_chainloader_boot (void)
++grub_chainloader_boot (void *context)
+ {
++  grub_efi_handle_t image_handle = (grub_efi_handle_t) context;
+   grub_efi_boot_services_t *b;
+   grub_efi_status_t status;
+   grub_efi_uintn_t exit_data_size;
+@@ -225,6 +225,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   grub_efi_physical_address_t address = 0;
+   grub_efi_uintn_t pages = 0;
+   grub_efi_char16_t *cmdline = NULL;
++  grub_efi_handle_t image_handle = NULL;
+ 
+   if (argc == 0)
+     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
+@@ -405,7 +406,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   efi_call_2 (b->free_pages, address, pages);
+   grub_free (file_path);
+ 
+-  grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
++  grub_loader_set_ex (grub_chainloader_boot, grub_chainloader_unload, image_handle, 0);
+   return 0;
+ 
+  fail:
+@@ -423,10 +424,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+     efi_call_2 (b->free_pages, address, pages);
+ 
+   if (image_handle != NULL)
+-    {
+-      efi_call_1 (b->unload_image, image_handle);
+-      image_handle = NULL;
+-    }
++    efi_call_1 (b->unload_image, image_handle);
+ 
+   grub_dl_unref (my_mod);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch b/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
new file mode 100644
index 0000000000..a2c0530f04
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
@@ -0,0 +1,168 @@
+From 14ceb3b3ff6db664649138442b6562c114dcf56e Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Tue, 5 Apr 2022 10:58:28 +0100
+Subject: [PATCH] commands/boot: Add API to pass context to loader
+
+Loaders rely on global variables for saving context which is consumed
+in the boot hook and freed in the unload hook. In the case where a loader
+command is executed twice, calling grub_loader_set() a second time executes
+the unload hook, but in some cases this runs when the loader's global
+context has already been updated, resulting in the updated context being
+freed and potential use-after-free bugs when the boot hook is subsequently
+called.
+
+This adds a new API, grub_loader_set_ex(), which allows a loader to specify
+context that is passed to its boot and unload hooks. This is an alternative
+to requiring that loaders call grub_loader_unset() before mutating their
+global context.
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=14ceb3b3ff6db664649138442b6562c114dcf56e
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/commands/boot.c | 66 ++++++++++++++++++++++++++++++++++-----
+ include/grub/loader.h     |  5 +++
+ 2 files changed, 63 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/commands/boot.c b/grub-core/commands/boot.c
+index bbca81e94..61514788e 100644
+--- a/grub-core/commands/boot.c
++++ b/grub-core/commands/boot.c
+@@ -27,10 +27,20 @@
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+-static grub_err_t (*grub_loader_boot_func) (void);
+-static grub_err_t (*grub_loader_unload_func) (void);
++static grub_err_t (*grub_loader_boot_func) (void *context);
++static grub_err_t (*grub_loader_unload_func) (void *context);
++static void *grub_loader_context;
+ static int grub_loader_flags;
+ 
++struct grub_simple_loader_hooks
++{
++  grub_err_t (*boot) (void);
++  grub_err_t (*unload) (void);
++};
++
++/* Don't heap allocate this to avoid making grub_loader_set() fallible. */
++static struct grub_simple_loader_hooks simple_loader_hooks;
++
+ struct grub_preboot
+ {
+   grub_err_t (*preboot_func) (int);
+@@ -44,6 +54,29 @@ static int grub_loader_loaded;
+ static struct grub_preboot *preboots_head = 0,
+   *preboots_tail = 0;
+ 
++static grub_err_t
++grub_simple_boot_hook (void *context)
++{
++  struct grub_simple_loader_hooks *hooks;
++
++  hooks = (struct grub_simple_loader_hooks *) context;
++  return hooks->boot ();
++}
++
++static grub_err_t
++grub_simple_unload_hook (void *context)
++{
++  struct grub_simple_loader_hooks *hooks;
++  grub_err_t ret;
++
++  hooks = (struct grub_simple_loader_hooks *) context;
++
++  ret = hooks->unload ();
++  grub_memset (hooks, 0, sizeof (*hooks));
++
++  return ret;
++}
++
+ int
+ grub_loader_is_loaded (void)
+ {
+@@ -110,28 +143,45 @@ grub_loader_unregister_preboot_hook (struct grub_preboot *hnd)
+ }
+ 
+ void
+-grub_loader_set (grub_err_t (*boot) (void),
+-		 grub_err_t (*unload) (void),
+-		 int flags)
++grub_loader_set_ex (grub_err_t (*boot) (void *context),
++		    grub_err_t (*unload) (void *context),
++		    void *context,
++		    int flags)
+ {
+   if (grub_loader_loaded && grub_loader_unload_func)
+-    grub_loader_unload_func ();
++    grub_loader_unload_func (grub_loader_context);
+ 
+   grub_loader_boot_func = boot;
+   grub_loader_unload_func = unload;
++  grub_loader_context = context;
+   grub_loader_flags = flags;
+ 
+   grub_loader_loaded = 1;
+ }
+ 
++void
++grub_loader_set (grub_err_t (*boot) (void),
++		 grub_err_t (*unload) (void),
++		 int flags)
++{
++  grub_loader_set_ex (grub_simple_boot_hook,
++		      grub_simple_unload_hook,
++		      &simple_loader_hooks,
++		      flags);
++
++  simple_loader_hooks.boot = boot;
++  simple_loader_hooks.unload = unload;
++}
++
+ void
+ grub_loader_unset(void)
+ {
+   if (grub_loader_loaded && grub_loader_unload_func)
+-    grub_loader_unload_func ();
++    grub_loader_unload_func (grub_loader_context);
+ 
+   grub_loader_boot_func = 0;
+   grub_loader_unload_func = 0;
++  grub_loader_context = 0;
+ 
+   grub_loader_loaded = 0;
+ }
+@@ -158,7 +208,7 @@ grub_loader_boot (void)
+ 	  return err;
+ 	}
+     }
+-  err = (grub_loader_boot_func) ();
++  err = (grub_loader_boot_func) (grub_loader_context);
+ 
+   for (cur = preboots_tail; cur; cur = cur->prev)
+     if (! err)
+diff --git a/include/grub/loader.h b/include/grub/loader.h
+index b20864282..97f231054 100644
+--- a/include/grub/loader.h
++++ b/include/grub/loader.h
+@@ -40,6 +40,11 @@ void EXPORT_FUNC (grub_loader_set) (grub_err_t (*boot) (void),
+ 				    grub_err_t (*unload) (void),
+ 				    int flags);
+ 
++void EXPORT_FUNC (grub_loader_set_ex) (grub_err_t (*boot) (void *context),
++				       grub_err_t (*unload) (void *context),
++				       void *context,
++				       int flags);
++
+ /* Unset current loader, if any.  */
+ void EXPORT_FUNC (grub_loader_unset) (void);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch b/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
new file mode 100644
index 0000000000..a43025d425
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
@@ -0,0 +1,129 @@
+From 1469983ebb9674753ad333d37087fb8cb20e1dce Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Tue, 5 Apr 2022 10:02:04 +0100
+Subject: [PATCH] loader/efi/chainloader: Simplify the loader state
+
+The chainloader command retains the source buffer and device path passed
+to LoadImage(), requiring the unload hook passed to grub_loader_set() to
+free them. It isn't required to retain this state though - they aren't
+required by StartImage() or anything else in the boot hook, so clean them
+up before grub_cmd_chainloader() finishes.
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=1469983ebb9674753ad333d37087fb8cb20e1dce
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/loader/efi/chainloader.c | 38 +++++++++++++++++-------------
+ 1 file changed, 21 insertions(+), 17 deletions(-)
+
+diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
+index 2bd80f4db..d1602c89b 100644
+--- a/grub-core/loader/efi/chainloader.c
++++ b/grub-core/loader/efi/chainloader.c
+@@ -44,25 +44,20 @@ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+ static grub_dl_t my_mod;
+ 
+-static grub_efi_physical_address_t address;
+-static grub_efi_uintn_t pages;
+-static grub_efi_device_path_t *file_path;
+ static grub_efi_handle_t image_handle;
+-static grub_efi_char16_t *cmdline;
+ 
+ static grub_err_t
+ grub_chainloader_unload (void)
+ {
++  grub_efi_loaded_image_t *loaded_image;
+   grub_efi_boot_services_t *b;
+ 
++  loaded_image = grub_efi_get_loaded_image (image_handle);
++  if (loaded_image != NULL)
++    grub_free (loaded_image->load_options);
++
+   b = grub_efi_system_table->boot_services;
+   efi_call_1 (b->unload_image, image_handle);
+-  efi_call_2 (b->free_pages, address, pages);
+-
+-  grub_free (file_path);
+-  grub_free (cmdline);
+-  cmdline = 0;
+-  file_path = 0;
+ 
+   grub_dl_unref (my_mod);
+   return GRUB_ERR_NONE;
+@@ -140,7 +135,7 @@ make_file_path (grub_efi_device_path_t *dp, const char *filename)
+   char *dir_start;
+   char *dir_end;
+   grub_size_t size;
+-  grub_efi_device_path_t *d;
++  grub_efi_device_path_t *d, *file_path;
+ 
+   dir_start = grub_strchr (filename, ')');
+   if (! dir_start)
+@@ -222,11 +217,14 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   grub_efi_status_t status;
+   grub_efi_boot_services_t *b;
+   grub_device_t dev = 0;
+-  grub_efi_device_path_t *dp = 0;
++  grub_efi_device_path_t *dp = NULL, *file_path = NULL;
+   grub_efi_loaded_image_t *loaded_image;
+   char *filename;
+   void *boot_image = 0;
+   grub_efi_handle_t dev_handle = 0;
++  grub_efi_physical_address_t address = 0;
++  grub_efi_uintn_t pages = 0;
++  grub_efi_char16_t *cmdline = NULL;
+ 
+   if (argc == 0)
+     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
+@@ -234,11 +232,6 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+ 
+   grub_dl_ref (my_mod);
+ 
+-  /* Initialize some global variables.  */
+-  address = 0;
+-  image_handle = 0;
+-  file_path = 0;
+-
+   b = grub_efi_system_table->boot_services;
+ 
+   file = grub_file_open (filename, GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE);
+@@ -408,6 +401,10 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   grub_file_close (file);
+   grub_device_close (dev);
+ 
++  /* We're finished with the source image buffer and file path now. */
++  efi_call_2 (b->free_pages, address, pages);
++  grub_free (file_path);
++
+   grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
+   return 0;
+ 
+@@ -419,11 +416,18 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   if (file)
+     grub_file_close (file);
+ 
++  grub_free (cmdline);
+   grub_free (file_path);
+ 
+   if (address)
+     efi_call_2 (b->free_pages, address, pages);
+ 
++  if (image_handle != NULL)
++    {
++      efi_call_1 (b->unload_image, image_handle);
++      image_handle = NULL;
++    }
++
+   grub_dl_unref (my_mod);
+ 
+   return grub_errno;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7161c4560b..e819cb9775 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -34,6 +34,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch \
            file://0001-configure-Remove-obsoleted-malign-jumps-loops-functi.patch \
            file://0002-configure-Check-for-falign-jumps-1-beside-falign-loo.patch \
+           file://loader-efi-chainloader-Simplify-the-loader-state.patch \
+           file://commands-boot-Add-API-to-pass-context-to-loader.patch \
+           file://CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch\
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


