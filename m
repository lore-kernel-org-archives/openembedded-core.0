Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93D7C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 04:54:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7889.1670388886801142102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 20:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9340152798=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B74p0Lk027367
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Dec 2022 04:54:46 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we934n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 04:54:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjaMnmcTk0JnTK1FnoOpWkI2K/moT98csKK7sakxmA9rO/pKWr7+/hG8TwjVK4xwSeI1s6F5A7qPL6oVKeeb0MBrXBkwTp+TVaihx5vNIKjxCz4Td6RHAxsFSdKxMWyu6OEU/JwTB6fIH/Pm1RFxUBtD5LHQUgJBhWMQ3MAAAreWJIfPzaUAJLvOWSmKsKHkwcLfGllE8qi8QYsO9mSxUTvRBHUg5fJ48h24rv4MLxQfCH80uif1QqauvPibT/owmCUg5nzKlJPjsw4Cfpur81PUNkH8l3WLwCTSccZy+5tE5FKB0/jOJR7/AhwM/kjTshyVRPIa4gXZyptIknKB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBvP819TqsvDQk7V20YEH0gmXeRh71pDiWXLp5AOzyM=;
 b=gYCSYXfsaxiFcg51CSYjZ6dN1g0eSpm4YJtmDQKEwMBlHoVEF/z3WMEVewkFkqNKthlT3Wit7bDW2Qp9BA8tEmy4/2j6n2gEZgSOMZISFnEzoqtWR49bDo9PAa7Q8CegFjXF+EGn/196tTWjjLBWpAfW2Y7hgjn/HvlkusIQ6oeqY08W7S7HmALvIauDSBhpM1Z9D2Z9SNBvUvpQW24kxYuEEgdxqQwDPI+NUw28DZPNwxXvGW9H7GgZ+kwTCMe9jw70oISk06PfDGO+s/CzpzLRCzBKtrMjYZ7JzvqjTRJ9XGQ3aD+d8H22FIycPStxtU/VnpiC2KYSgxMg3uykWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 04:54:42 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 04:54:42 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] grub: backport patches to fix CVE-2022-28736
Date: Wed,  7 Dec 2022 12:54:26 +0800
Message-Id: <20221207045426.59552-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:100:2d::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: 197a17b2-a631-4b4a-2390-08dad80f272d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jXKdBuwxZihC511DsNAzU5umT1KCRcw1djfrgLV/RHBtdIiq+3Rpvdej8Q+RMTCy1SoBU/Mj3GsJNiwakTQbin0GhLPGmURgs4z2ZZgRZsqRV/DlBT+WcI1jl/8//0BtH/ba+SQ0bzKP3rHOGuuC0qK4FA1gjLe5eLAiNYmK7DJeczoyJAR8z9xYFuNVnMzYCnXtvH7BCk4MNvrdXl8772MSK/Gm8zhxy13CJvHPhkiqro51AaUyVco9lslkwolPSjsVheQIB/hrSTP4o1Z/wGcXC+PtVcVq00JUtIcPTnvdzamQmBG8tSfdZkioHps5Im2Tx8NWovgYK9qr/DVj+z+s+fNSp6KZiSIboevrZkDG2lGSqKZ7Ox58aN3yTxcDwhbjVtTG9MRIjV5fRWqN/z+HJWLC3g8feI6xWZXoMLq+Z6YKD5BJkl8pyH0oShfmgR7aNoijyqbYqqVYqkmzxeyfXRI2+8RX/o0A6lVeWykTvvpW45c3/HrfVAGLfIaAvbdOf07xFElVVDtfqFU//KRnja83yyPDUqrIVZ6cmbzn7RAFLU5aDOTe85y0x9Uu7mSVDHFw2pPbVYUARd9jEJ/t4BKACVtAwWf1P2R0oSBUL4zBIddsk0yo2RhsC4xR7hRDDAm0CXqMJB71ztm6TJAQG3B721BDpDr7NkGz2hwiuZOmvKgnZZWgdlQr+TJpYk33jjLdakM4Vi74Zbil0B8ZQo6dGYjgsUrCHEIkqwQ11N99hHwNd4Oo5vMzZ8U0WVNTWUiZubckimh/uxYy2g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(451199015)(83380400001)(83170400001)(30864003)(2906002)(5660300002)(41300700001)(8936002)(44832011)(8676002)(6666004)(52116002)(1076003)(26005)(186003)(6512007)(6506007)(2616005)(6916009)(316002)(66476007)(66946007)(6486002)(478600001)(66556008)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aehht8xE8Y/29iLTpVbwBspL4Y/T7poLpeSRTm61bcFmxsOQrVaVwbpR+I1J?=
 =?us-ascii?Q?xYAllv4+TGSH8si3hgilYOZNb3aiSeeYljem7bLiUEc6ARbx1wuXL+k6SY8K?=
 =?us-ascii?Q?cGnLCVIf08gC+ZC9nIhWo8kWjdnSl8P7/wDE/F7nE+xKsYwYHMDofBSstlSa?=
 =?us-ascii?Q?naq0viUwnnvVwGJhu4WnQLvk/6wysfrk1XxJFsOSd7LcQhGizhS7W6/lQciT?=
 =?us-ascii?Q?ahurB8xYF6pB6TaugAMzddHMnWpNUJ3LGaNl704d01ib7a9JDbh6WwMDlwI/?=
 =?us-ascii?Q?sLyHTY17JDaPxyNPIZnhRNSyKf7p4WAIn/VRa6C/kDDC446InZtiuTTXeOj9?=
 =?us-ascii?Q?IBdS06NTWt2U2IYAG6S8YKN4sKCTJDJFU9/BYDoFcy+DA+cUPTfEL1gYcqAO?=
 =?us-ascii?Q?hA9I1TURqoHGLbRUHOyKCu0ftCOpHa8pZW5q1O6j6BWxJPvMVme4ZHGWDhXE?=
 =?us-ascii?Q?EzZYLdwesdvo3w+jfh7+qFuK20v9mJZ/L/rz7p3eXE53M6VvMBneqMQSN6Gm?=
 =?us-ascii?Q?vM77n7eyT3qHurzL622OG6EPK/4enKL3qTLqQlHcupxdWn209SFa/qPBIBHY?=
 =?us-ascii?Q?iGyJBYu4t7gd38Kyru52DCSlU82dzwLssRd8WUU4mEMhfSfyYrjEow1vW1Bx?=
 =?us-ascii?Q?JPUlosSgoAj2I7dJsk+PyBzER1cU451rZRc97QqrC76/0UQ/nif69kYoJTq8?=
 =?us-ascii?Q?LYWaEnB+TQkqkUquoqIdjsgPbOexlPzuYVJtxwx/bePgdLXEycFQDaJsYN9+?=
 =?us-ascii?Q?E9/JDZcKprctPdF8s631UC6AkSSmdVdhNACxRhYky4wRmUDFf+nrMRAC82tg?=
 =?us-ascii?Q?uQr/aPS+6pDuruebJ7BCHXzFH61viFxt2oqCPR1ToDFmZv2cEhg0LjmQ6xu3?=
 =?us-ascii?Q?7Cm46yZaoLweW+dZwTt+/Y/2JvmMrKlDdiqpICV/bUF42j1SOgK1TY4K8cjR?=
 =?us-ascii?Q?AHVx1YSNl4FeeArXS9qRmY9Ju/f24CXW5jwQeqLhaFWi4dvxgjsdWLzhH2K9?=
 =?us-ascii?Q?QpXAer8Jt3NtDb+F7CDwJHFku6JVB07BQ8Rg+SGvZGgD8uaTnU5x8OiCvisE?=
 =?us-ascii?Q?O+8t/FRAiBE1cik9HfBzm8CR1ow+y0XKFJvJRKRpr6eqCHiVzJ2zurqKZDvm?=
 =?us-ascii?Q?e+9VdMw3GUJ3EXTieQB40qiSKdpeiaT+xixix51uZ7LK8hzeGwNiyNdpruMn?=
 =?us-ascii?Q?lcVjFJgSz6KDFUWESFVjn7mIBdt00DDVwxwx8ftANLLyJtjWpN4CNvJ5aQVW?=
 =?us-ascii?Q?qDru61grkFrLF/1a40SPCcOzzWDNeFw9n3JTigo674uTJfbyyydrl9q67bB4?=
 =?us-ascii?Q?F+cBxhukno2FAXLy61EfhdINBliYWugtCwfrxGcPA/ww1FtNK2GniKFgTJCU?=
 =?us-ascii?Q?nMuIGp6AWeI8AWrZNtcvISoDM53OKHr8JAS+DpKZIInOlCrg8fmXuyG5/VlU?=
 =?us-ascii?Q?j6oL9i4LLeZKHqRlu94R9hiWjlVG692K+9bChjcu6eH8rfkIyzhgyYDcxW6x?=
 =?us-ascii?Q?AOuQus3lJQ8PATWSlqn02frP+Hv5SFMZJCxfrJT7p8P7n57DMFQDgFIZ/S0y?=
 =?us-ascii?Q?80rkqfPaJ99bQfsn0LY1R+1ge3uX1cgrwMKN8MGc8l0rLVJztNnRh3FJq5A2?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197a17b2-a631-4b4a-2390-08dad80f272d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 04:54:42.2863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eE4k7ifabSv93S6C3tMJu1KnMHVx+uAVUYsoexMkiGeHLVBxat7asTXRLfPfIRVMiXCZPMWVAC3omzKSMo7tyb3g1FoyxwdboUfPJrO2t6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
X-Proofpoint-GUID: JfqOjcJBTosbWEDElBbW0pag8KsJzKul
X-Proofpoint-ORIG-GUID: JfqOjcJBTosbWEDElBbW0pag8KsJzKul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_02,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 04:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174342

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
index 270efd30ef..c14fe315d3 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -35,6 +35,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch \
            file://CVE-2022-2601.patch \
            file://CVE-2022-3775.patch \
+           file://loader-efi-chainloader-Simplify-the-loader-state.patch \
+           file://commands-boot-Add-API-to-pass-context-to-loader.patch \
+           file://CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


