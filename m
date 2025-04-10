Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B63C369A9
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:40:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34790.1744292432598170160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A1BJf3021255
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1q18p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vj97uo0qWF603G1iv+eKRDLGnotS2QQucD49GDiEVTHIoB+3zm3HiAQitTfTGvWhOohhPq5D21CZunsha7FZ5VGMEesYAQxooT8TSC2NLQaj5olUh9Am1keinCsO1JHbCcCBTjxs6VHWc/PH4x8TaHxkn6K3jzSXCEiSl26PDrs92QzgWdDPeTCbX4pOfCTCW2oNrYfSLLI0hVxnpQY3i/fOBG+U8oWdsA+OiEbD33sXvud0y/uiBJQ2oMLAlFACsoOPPq5xw1gsrITtaWbxUjtzgwaiJstvMX6jVzLSjex/WG7JfvejNMHav31V0sYoWSF7dabhFnp9CCE0IKcb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFkG2UD95c+oOMnkLCmu34I0My8b82q2AnnsFwo3x/g=;
 b=TlktjQVmCpBOHt6Ga0rxe0Fj8lvPaEQdppA4rczbWq0Gho5tZBybVEe0TJ3Ue86Lrqy1irBJWhvgs0EptdYX06Ga6lEIvFnkJWxEs9myOV402BoEy5kiGJEQO5FhKQuLGhFmyKC6NORzlY3c8/wiVb4XVOYvtcQRJbZBEn2OUTATfp+6n3uBLKMCdpG4GQotXdQE1Y7In2Sy5vDe65a/6LmTbvzSBHlfxhfDYTELYxED8DGjS/VgtFU7hwY356qPFoeD8f1wu04lLtAjnaw6dcBqFsUv6vw2IsK8grZXQe0vwjowJawkbwSJ/JdnOHSpaQyW8qzWsntEWkFfWk+kQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 13:40:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 13:40:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 1/4] classes/recipes: remove unnecessary qemu inherit and use qemuwrapper-cross
Date: Thu, 10 Apr 2025 06:40:18 -0700
Message-ID: <20250410134021.1299595-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ba2277-e893-4c15-0f8b-08dd78354140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZIR61xGcYafZEuZQppN/Vr4zQ3M4G6sLVaD1DekxLod7cv/EQ0lfU14X/Ggg?=
 =?us-ascii?Q?aaqeWEDV5J4cqohCWIfAEd6qXqPvstmOg++InFC9HXubp1ZIy6Mm1G5CygZI?=
 =?us-ascii?Q?wEGSHEHfjx9NN0NMlNhO0b9Hu80ZyE6jmPczNBHggTQaUCuOZyJMUldbKKQt?=
 =?us-ascii?Q?VQrA575cOV1Voltpgn1YtR/jDpXe2ZewcQ4IyIIcEqf8x4lvR7EPDCAzwdKI?=
 =?us-ascii?Q?D9E0wSVfqgj79CGm91O2qwVN3kQFfUqvYLI0VaVm7rML+6nUHOF3xINQiczQ?=
 =?us-ascii?Q?OVziey4XEG4/kiUrfhYl8vXh07tizX3Ag+UKrqRPMxS+Fg+7Q10GqdDQ+mZ3?=
 =?us-ascii?Q?IMDC6V+S5vxT2Tyf4wHjW/NS8bdlerFEimFvNzkATPyn9RK7k1czF2bbWstw?=
 =?us-ascii?Q?8o876A7BTX+4K3a5xJlVqxnJbTLox8tpzGbZ8+TfCOFfGOQETVifIRCNyGWv?=
 =?us-ascii?Q?6CcnCohh11T5jF0r4bWXQ8hmueI48DgdmvtfMEED9K5rRcy5sfs4NC1WSgX+?=
 =?us-ascii?Q?dbe/V7d9o5fNKq5nuiwjGK0GP0f8wKQyOD9xihpbn4dCpaGC7NOApf0pFdx6?=
 =?us-ascii?Q?fbUXzwQMLtbl7ZsLH94HOvRyVb8+ECEs4vDNL0tvFQQwHI8n3Wv3HN0dq++Z?=
 =?us-ascii?Q?Na6ct/PIy6DVK0IwWlOLcED7tJMQw35qMueq11L/7SO0KWoR1Mp0n2wk2+uS?=
 =?us-ascii?Q?911TEJ697FEfC+LBDgNge84ovuhmPtRYOIu1UrTos77jCveY8Ef7L/LkAK51?=
 =?us-ascii?Q?hvNllNtFp6HkICpQ/hFNb/HwpBUToIEmNC3BNBXGhPzBys9paCaXXISdD9ZO?=
 =?us-ascii?Q?FYDEQTMCnApw3mkcju2qDcn+oWih06o+LLObPTPwB31fqvlRVPlNBD43JjOx?=
 =?us-ascii?Q?glOBY1zadvCwRBbPR3A4q2KUX6DXhe6EEn2OzusU1LNTVdpZw+RRoP3vTodv?=
 =?us-ascii?Q?VlccoUzfseuOGaIqZLDuYCoWtaiXsCDReubIEjLX1CosuCnPaxcwWiBS+i44?=
 =?us-ascii?Q?pQWKqviNvR8bIzAdHYHt97rAGXgF0Fpp8YNNI5M0Q/jjwsWNtP5v+1qX/0kv?=
 =?us-ascii?Q?4MwKmM2j447ygBSPIIXn5DQJLbhXOIc9/oEqsrAltNlyAOw+WmCGB0pSvx/A?=
 =?us-ascii?Q?8bkbZrXVa9Je5UAOWAE/T+ls9D4iODw+6N4Ph6fgg/Tqls4Rklb8jezNF99c?=
 =?us-ascii?Q?LdHHDLQZxWjIjohVGX7B7ZD4F2KmmYve8mWlUR2hm/2MaxRd7nFTNhS0qCBA?=
 =?us-ascii?Q?ci7+WW3I9PJeiQNsXEaPsNx2qNkVEm01cynZIAGg4yxRP6qILjoD0WGwgqwL?=
 =?us-ascii?Q?qVF9F8tk/8fnCsBsmwrat3hce2l2Y8RTRCJW4lAJu+Z8eGci23qbpRaX+5SI?=
 =?us-ascii?Q?DRD0dVxGYBRLYuAen/MBu2UD3xiPC+TcKN8tbovnBSpaR8YgBYfMncx9FzRR?=
 =?us-ascii?Q?smnYKm+WzCp58Abh3XgKgVKV1tEu0BF4NxgutxIavH4OG3rzRbvp6I++XgOJ?=
 =?us-ascii?Q?32fvo3YuXGYCyjI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YRoF69EZyBUPIPzNQVmdC51sDbsPqtdG7FmbBJ5IMjYjNhFLCMTkCAsZijyQ?=
 =?us-ascii?Q?rlJmHdRNTnjZyNg8q6j/u0aLpQfvSeU6PhMTELEwxuJDcdzFXtaKXPtzRPv9?=
 =?us-ascii?Q?f9ULAf/6YuPgR9f79qdVc45aBg+/J0LzO+N32F9p00S3s2CcMA/UtFz2q05y?=
 =?us-ascii?Q?U3Zgbv9hvJFIsTvaTQ8Vg6vEw7d/2mybNdu/qLYTbSeOsAEgOQ+2CS+gRfQK?=
 =?us-ascii?Q?TqiJ0vcZCXpIfXEPQJbzrzjqe8xAaKS7iXInCfwA7kDNnpru0ppDun6ODozl?=
 =?us-ascii?Q?xWELOMm1k3edUgxoxEpOGcDMXEfs0+jzYgK/EKOVRWDEMIGlx7ARHRSvvKXs?=
 =?us-ascii?Q?h4rVKH9PE5EDd+0TGilNQtZhFwUH62x6e8osQHWvTQCtFLb84Qf/tB6TG+K0?=
 =?us-ascii?Q?AClu13g4EK3W6jA64xs9Tc2ehWyqjrkvOO3Nwv65VwYBAsVK5ov5uULYJNUk?=
 =?us-ascii?Q?pMov9C7xW6sIS4TsN12vPmNzWDrR9Akf0/xHIcISUqZmumWw+KExI4uz3b2l?=
 =?us-ascii?Q?KvUDGlHGHrZV+sNj3SZBfR4nHZh4kmaIqb0JXM8iA8cf+Nzt9/y0rqd4CPQ7?=
 =?us-ascii?Q?Zne1mGn3wxLbIH/FxhwwpbbNcAfowC6D+EoWm72PRVsR+dfZpSgHij55TiMa?=
 =?us-ascii?Q?JS4lQhDmxNPEuALQB7+X/QtVMI3vmtnVJxzLO2z7hCA4WPMFWhxtAN2q+Cdp?=
 =?us-ascii?Q?egRv+2TUjJf0UjQB+igEPrsh/m+4M3TP6201zXDaZqsQb8dUJCYKzRYk9kGz?=
 =?us-ascii?Q?OD3j1FgTz4xq7sQNDivVuNoJIdSIGI+xpXBI51jeh6TK8XF5PX1y4Ekc1hkP?=
 =?us-ascii?Q?JJ3ArUIJGcbCdaww35iZ5/jsLHglp8mAzPNAzgbTEvGoMn9PZgghHt9j0roC?=
 =?us-ascii?Q?r6+iukJsFxnYSEUiPbXd4PhLHX9GZQn/Nn1gSR2YXZyXlWuv8EYA3nV8uoFp?=
 =?us-ascii?Q?dvLH9VQId4V0WHriT3fCc0O7fQULUBMAoLi/vOXBn9esm695AcIBYc5bsI34?=
 =?us-ascii?Q?J0Oh+ynIz7IVjO+5mVzzhaO0/56DQhsIGm/GdFHSy3yAwavFCOzC9jQ5AAn0?=
 =?us-ascii?Q?BJHH0pYJ6rjLffxnDKu2AvH+ZIv6bKbaDTVi4p2hnxsRsbdIKGrAfA6M26X/?=
 =?us-ascii?Q?c9f5E9eVXoWb0uQIKvMCvHfKfQ27AEB8ZW0wy8bqMu0Y6+X65Qqyq3S1qiOU?=
 =?us-ascii?Q?zoSeZ1qeUgJSJmJw+nHLJTemSsqIgWldQwpZ0ID6ZtIJf84hLpttV0leqGrz?=
 =?us-ascii?Q?RDVfhUf656tZzYWqmNIwYaRFVkbEI9JycQqa/KsSEjtUS0+oBtLmf0rt+leN?=
 =?us-ascii?Q?gVJ/CvNcBD1DmZMw/fcyPEMVMSd0FHRnjz+L5mWBYDeaNHwCqK6ABDDJISYO?=
 =?us-ascii?Q?J9uSEx8OIwbdgWKYRHdSXMzgT5ni8W3c7ctBHntYwVQrtgNVwq+5jc9uZVJT?=
 =?us-ascii?Q?HyIMutcANkqcRoKcthA0D6ZVj3VJA+1XSyUzen6a1UozFHVBg+0Kk1ITXCwq?=
 =?us-ascii?Q?07Yibiz0hvQZK1b3MrES6XOwlCSBnygee1gxtx1wCORkZeFURX87zuh/iEzp?=
 =?us-ascii?Q?kMHv0EH1LmXA8+hAysAv6a6rN3FnRh6x23KhLq3EWzIOUsgm2RO//OCSBsQL?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ba2277-e893-4c15-0f8b-08dd78354140
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:40:28.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuuBOfHvEN05aQ5d4vWLLqFfwHf7rKF9ufL2qtEvPET1ESY1masvxmb50GRBCH7vC4+cNWHQC2HOLZ5HXI0JPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f7ca4f cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=WEx28BAWv0HXPgO7D68A:9 a=J6Dv6ctt5JGYP2we:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Cc6OsodaEqEXJlzYpXqmE4qtZ1SXk9oa
X-Proofpoint-GUID: Cc6OsodaEqEXJlzYpXqmE4qtZ1SXk9oa
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214670

From: Chen Qi <Qi.Chen@windriver.com>

These classes/recipes inherit qemu.bbclass but do not use anything from it.
What they use is qemuwrapper-cross, which is needed at do_rootfs time and
needs to be pulled-in by PACKAGE_WRITE_DEPS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/fontcache.bbclass           | 3 +--
 meta/classes-recipe/gio-module-cache.bbclass    | 3 +--
 meta/classes-recipe/gtk-immodules-cache.bbclass | 4 +---
 meta/classes-recipe/manpages.bbclass            | 2 +-
 meta/classes-recipe/pixbufcache.bbclass         | 5 +----
 meta/recipes-core/systemd/systemd_257.4.bb      | 5 +++--
 meta/recipes-core/udev/eudev_3.2.14.bb          | 4 ++--
 7 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
index 6f4978369d..deadcd2fbb 100644
--- a/meta/classes-recipe/fontcache.bbclass
+++ b/meta/classes-recipe/fontcache.bbclass
@@ -9,8 +9,7 @@
 # packages.
 #
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-inherit qemu
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 FONT_PACKAGES ??= "${PN}"
 FONT_PACKAGES:class-native = ""
diff --git a/meta/classes-recipe/gio-module-cache.bbclass b/meta/classes-recipe/gio-module-cache.bbclass
index d12e03c4a0..3714678c7c 100644
--- a/meta/classes-recipe/gio-module-cache.bbclass
+++ b/meta/classes-recipe/gio-module-cache.bbclass
@@ -4,8 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-inherit qemu
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 GIO_MODULE_PACKAGES ??= "${PN}"
 
diff --git a/meta/classes-recipe/gtk-immodules-cache.bbclass b/meta/classes-recipe/gtk-immodules-cache.bbclass
index 8fbe1dd1fb..585838c105 100644
--- a/meta/classes-recipe/gtk-immodules-cache.bbclass
+++ b/meta/classes-recipe/gtk-immodules-cache.bbclass
@@ -8,9 +8,7 @@
 #
 # Usage: Set GTKIMMODULES_PACKAGES to the packages that needs to update the inputmethod modules
 
-PACKAGE_WRITE_DEPS += "qemu-native"
-
-inherit qemu
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 GTKIMMODULES_PACKAGES ?= "${PN}"
 
diff --git a/meta/classes-recipe/manpages.bbclass b/meta/classes-recipe/manpages.bbclass
index e9ca2f895b..f3d034b046 100644
--- a/meta/classes-recipe/manpages.bbclass
+++ b/meta/classes-recipe/manpages.bbclass
@@ -10,7 +10,7 @@
 # by default.
 PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'manpages', '', d)}"
 
-inherit qemu
+PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'qemuwrapper-cross', '', d)}"
 
 # usually manual files are packaged to ${PN}-doc except man-pages
 MAN_PKG ?= "${PN}-doc"
diff --git a/meta/classes-recipe/pixbufcache.bbclass b/meta/classes-recipe/pixbufcache.bbclass
index 107e38885e..c32673df55 100644
--- a/meta/classes-recipe/pixbufcache.bbclass
+++ b/meta/classes-recipe/pixbufcache.bbclass
@@ -9,12 +9,9 @@
 # packages.
 #
 
-DEPENDS:append:class-target = " qemu-native"
-inherit qemu
-
 PIXBUF_PACKAGES ??= "${PN}"
 
-PACKAGE_WRITE_DEPS += "qemu-native gdk-pixbuf-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross gdk-pixbuf-native"
 
 pixbufcache_common() {
 if [ "x$D" != "x" ]; then
diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.4.bb
index 24aad11c0a..0f0c846db6 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check mime
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives systemd gettext bash-completion manpages features_check mime
 
 # unmerged-usr support is deprecated upstream, taints the system and will be
 # removed in the near future. Fail the build if it is not enabled.
@@ -932,7 +932,8 @@ pkg_prerm:${PN}:libc-glibc () {
 	fi
 }
 
-PACKAGE_WRITE_DEPS += "qemu-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
+
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} \
diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-core/udev/eudev_3.2.14.bb
index b3e7d092c5..a2d222e655 100644
--- a/meta/recipes-core/udev/eudev_3.2.14.bb
+++ b/meta/recipes-core/udev/eudev_3.2.14.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc192
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases
+inherit autotools update-rc.d pkgconfig features_check manpages github-releases
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -77,7 +77,7 @@ RDEPENDS:${PN} += "kmod"
 RPROVIDES:${PN} = "hotplug udev"
 RPROVIDES:${PN}-hwdb += "udev-hwdb"
 
-PACKAGE_WRITE_DEPS += "qemu-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 pkg_postinst:${PN}-hwdb () {
 	if test -n "$D"; then
 		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
-- 
2.49.0


