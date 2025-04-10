Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2851C369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 04:08:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26669.1744258118647341389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 21:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A3mq71030775
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Apr 2025 21:08:38 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m5w52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 21:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAnP9Cin4FOybRwWjJ2JRGz5MZbK0eHFczji9+PT2HbvSes72+8sr85xGyjxzlfwhSBZFoWnRnVdiJ/ny4J9lysP/Kx022vje8ysEDAhwDxQC6hd3fIaTGOe12yn3WR2seR9wQheJxTDnoJYKZQiPkyun8pa7vpA9GeuxY70/fRRtSKytc/Z7VNzZciHOUFsi2b87KJv36/+a+ynalnVk5xFjwTl4olzBV6sq+Fpw/YTMA+WJUf1YO1UsjSbWHDSE1tmVeNZIMhUua/HZEfx6jh5iCHhbtlB/3ROVjX1TiZu/A6l7khrfRa6fjmgLazX6VJD+4XGqpXE0gxn9T109Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtKh/JHCp8i9jqJbnFgr9hMtAALb4JiFvzYITOla+Eg=;
 b=AbeHa2oinLmaWbp4CKaka5KDf1vm7wZeQdc6bFmVZxw7vXVNrwYEpjmEw4qtauPeofLxgkS7ddtPxCgHK+qaGnWXz5IIThPOmmg8j0su92F1WbB88IbA+exJeBsf7+LkGdnyeH2i+nwbOmZ1aqMRpGUYyjBhPU/wc98CnpjjZFEhnUbYSwbB6KHunShhxE30QT9yz8Wvk5ONBKpBQE1/fCi5G32Kr4xz35/My/8mNPmTd185qH6Dc+1Dn6K3r0K2Z6Te1GLq6sISVXu87QK9PbSmkID1saNXkVRpDZhjqfc1+3wG9nT+MaG6Gy/CPPKQxVwmQnmnjAa6uHk8ufBJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 04:08:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 04:08:34 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] lib/classes/recipes: refactor qemu.bbclass functions into library functions
Date: Wed,  9 Apr 2025 21:08:25 -0700
Message-ID: <20250410040825.1283228-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410040825.1283228-1-Qi.Chen@windriver.com>
References: <20250410040825.1283228-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:610:50::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b420ad-355d-4752-06ac-08dd77e55c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5HDVux41Cb+xyzmBhqjuGNtn1kQD1LLaYmCcnWof+ULBODiM6TNARH1k1XWJ?=
 =?us-ascii?Q?dvRre/BVmk8JrkfpweN08ooSxTXrSTE7aXvrBq1EcISlrcrHim1kdK+tM6BU?=
 =?us-ascii?Q?PTrRs2clJFAu5Dsz8/xfcfDJijampWr7M5ZVsteBcVATyVIAxQvUe+Bg4OIa?=
 =?us-ascii?Q?KaTAFovNrWJvyf0ffvIAOZDtigjoPLh3kgwoTqJbmImsNLYkD+iDrLOo8lHn?=
 =?us-ascii?Q?jhHzGnqPvgDFyqJAcMD83x2a9JzKJ64rdhMx+sVabKu3PE0eoodq7xC5oeKE?=
 =?us-ascii?Q?DUmwdrNQAn1zGDgjdffatIZU8Lr74aEXT8zIr9gVMjaKYF/LvgjnXL8V4WZk?=
 =?us-ascii?Q?C545N+tR7dXjnDE25V7n4U3LEkckG7wDrpnsThYvWGcLv3Scx6+OtHOxG4ms?=
 =?us-ascii?Q?LOyFgfVtjxXywB1GeR6VytWaFy3betvbA3Xt/wdm8cumnKY3JtZWXUxAecWX?=
 =?us-ascii?Q?LcxPc3QHWCpYhfEWW2b8W5YpyUlkpYME1H5rQ23hGYFLg/jbceG41qziMfHy?=
 =?us-ascii?Q?AgA1E6AmhcyOHoo3WzNTao2+GIAcNZQG4Zb5z8D5A/tAH8/8V1O2JLfChrmi?=
 =?us-ascii?Q?1RaDSbY7ZqSo0veErEQAZiU8m79ruwnkyx99GoUGAO6heX8jE4Yijp90fxDn?=
 =?us-ascii?Q?66RBdZda+hl7emxTLuYj7ThckLuFT1WsXl3MsrevCFL7IRowhi/zIQGCIG+B?=
 =?us-ascii?Q?eCwJZWl/tf/bDCVzD6QFJ+O3EupQfKqGDFURU1oW8Txy2b0kC1/5ZsKEng8m?=
 =?us-ascii?Q?/cRTDOqXd5BImmF60jcCOBT8IaEA+jopMPp1rMvTp+4sTSa8YFT7mFSKMuTN?=
 =?us-ascii?Q?yLPT6f1dw9MH1ahxpZd5p/IIqKQtSJ3amvooOyJgP9qcXBcExMpybGg0mnrh?=
 =?us-ascii?Q?kVpjrigRXic18HU7bE96rtJ0kGXcWUnRwhB0f7AVpkw2LWWnIEPrL7hixGck?=
 =?us-ascii?Q?laOI1doPnvt3atf+cqi13+cDjk60dJE2kwN6tKhSSwWHwUeerk/tdSEDkrhB?=
 =?us-ascii?Q?rZvCtVtK5QMF/ALbg8ZsHKBAeP4KqeuqCtsTitfxVKXafhLxGqlcMo0sgXiz?=
 =?us-ascii?Q?U9tRl85SyfJ9dLpt+BCmZG81HbjU2GAHWCgDCIeB+UC7JFKHcageixIMw1em?=
 =?us-ascii?Q?Lr16GtBrgm1l7ZLdjwfeXRz6NPVVoeEJjQEbFW02HpzEsg5gH+yW74MLXpuk?=
 =?us-ascii?Q?nCzIA/x4ntk2DrcVyBnhqL8Bj5Tx2A3IERARCH82riY8My4waYltExi/XNMz?=
 =?us-ascii?Q?ETTCeJzSCoJDXBfu4ro8wY6VAyGtE34pm9DoqbPa/C1txSFxUYFgW0b/p3zn?=
 =?us-ascii?Q?dFtSClWT6hrV3GS5HhvII5Vn+psL4uDgZa2+vG5xiMiuys8sTNgCgqED2ZAm?=
 =?us-ascii?Q?9Sz/nPHMAigwi4V9w81XidU306eyBA/z8Bbw6sY3Gv0EE030PkfCSxe7hxcS?=
 =?us-ascii?Q?td8p6WW4aCqLQPurKqm4fzvslN3t8WIS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uFY0LiJT2Dkisx73W5jNWcLG4gqiSztiYyUVPKa2rEMONNaiLb+Eqf6ndNHc?=
 =?us-ascii?Q?jj+Y0qR3KVZKeAzkbm7mVGYYyG/A6/i/p5Jf6cjRrrhAkAAWyOFEj/r0gsBZ?=
 =?us-ascii?Q?iNxRqaheVb0WUUgfTmPaURhc9AkIjDcVIpcMeDKDOVQSEBA+WeULfA0hu3i/?=
 =?us-ascii?Q?pxxInTXjD+CqP0ZMOcYcNsocTBYBFMZ2ZndOMeJXWTiYXRiTW2O+2hRym1NY?=
 =?us-ascii?Q?TdTkLq/kPzD3K0+UTZ6QN5SKec1oahIW0DKff8RP8XfwYlziSt6NnCGwGnQ+?=
 =?us-ascii?Q?lPGvYCQDLEfsmb8MxuHphERs1CXfaUL4944wYKAFQVvgA2SiW9RS41GPDYvI?=
 =?us-ascii?Q?g8DVv4w+yNrwfaoOKrGG+QbHCmREdLd5RL6uCtRfTJqbr57ZIaNyVqBEXsAW?=
 =?us-ascii?Q?cCVBVbfmEtg8+xM+xbjnNKfLw8ELgZ08ip4cN8ZKHlcTNg3eCss2B5x8jd79?=
 =?us-ascii?Q?faCsGRqb80e8y3vqhgF/SXnjaaxNgCHj2HempON/pI72uvaYgQhP3nQAcj8Q?=
 =?us-ascii?Q?rE4WD1pokh2rVUO4q42rHYh9QYgxHbSMu+wts9OzvDIJhXMZI6Hu4ULdz42W?=
 =?us-ascii?Q?El1RqgoEiCU5ZzAB8U5xoJJew+TMqrfXMsgkOdPFXNOoKnQ1LzgiwsduUtvs?=
 =?us-ascii?Q?zIuJb4lemKPsmO3eoEnrH7yNB45rdhYGBnSI9fR876pES4N4AaVYQmylZffl?=
 =?us-ascii?Q?eBrlRmzHZrs5e5mqsApnir1NAGEf5sacqjDbN6Ej+eVMgx5Kj/mVIz4V1VEe?=
 =?us-ascii?Q?Gk7Cx3DFPhqXPBGtZ78a5cw3V7VR8ASf6L5ueIG8EFQPjCdM+fSaObeCVl03?=
 =?us-ascii?Q?3lmxNUcNQBkPz4EQcJWG8DuAw6by9SR5UDGIPy0I6jdKdIdJK3DYrC2FcMKD?=
 =?us-ascii?Q?P5DZDk0yPf1eA0NbwY0KtyRZKY0qds+kcgCZjV7VH13ectpTTbhopEj7S4H7?=
 =?us-ascii?Q?8FD7iX4TTHttU3d1grinhMQXgS5S8uLL3dVgOMb1KWfIoStpEfhdan6aTMgv?=
 =?us-ascii?Q?SBSqwoU0C5cy8kH1O0ca9ocPztvEq2uKLynQKhJY4MBXED7yQP8WbhKYXQVn?=
 =?us-ascii?Q?X/1wA8Hb7PgsMVOftIQZx8Wy/Ckms52Z/vTQ6qPlcQegVZtgeHAyHGKD8b5b?=
 =?us-ascii?Q?UYc9dVsKCfFOlnmgwvskzUAP5xnEXgEjKKc2gJNTNml5fg/hO1CyK97i73xf?=
 =?us-ascii?Q?CjGge6mzfatuEIzWJdJ9IsCuzaHpg4jvLGHc0xD2m7oIz4rHgvjqAmaOXNUz?=
 =?us-ascii?Q?TUGowRZrqHR3FPug11AcNMwy10Fwid/acHXfVkW920AddVjIdCAQW9GA15qO?=
 =?us-ascii?Q?TXqIV2aKp8IITFQyyu0wtnW+tYZR6PaF+WKHekdbK1kHnqKwj/3fgNa/V8Ip?=
 =?us-ascii?Q?524RrcHd8W0YV9duZNnWTyP7CxId5eGuFWrPf3B1W8WDrUsNUX/UG+/eric8?=
 =?us-ascii?Q?OwFQb+gz9biHb+5RaqY3jGPNkfhJfAluLNBrYVhi/I1yMEE2MeicHe6nO1Tw?=
 =?us-ascii?Q?l1DnFYqXKS1s4uF0kLgKRUPlrKmamyYa/jthdeFYEKGyAy+291V23QeI4g3+?=
 =?us-ascii?Q?YrzTDq+bRXGS0AcaWx7ZM/iKQVHBElmT6Ica7fgFkSUfTFRoiwqlcGxuZhIJ?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b420ad-355d-4752-06ac-08dd77e55c5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 04:08:33.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tz3sqW4DSWid2xa91YwBGgb/9SOGd7QjdKMkHl9BqxTxKtQtSUrjD9nCEFRXGHGtJ55lndyLHBOFBMyEq/8poQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
X-Proofpoint-GUID: QQXg64GPQmGwWVH78hPjv8XV_SpsY4TF
X-Proofpoint-ORIG-GUID: QQXg64GPQmGwWVH78hPjv8XV_SpsY4TF
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f74445 cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=05caZQWP-9MGXGHOnJUA:9 a=ILrxbXL7mD7Ha1I0:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214615

From: Chen Qi <Qi.Chen@windriver.com>

Move the functions in qemu.bbclass to meta/lib/oe/qemu.py as they are generally
useful. Add a deprecation notice in qemu.bbclass so that we can remove it in
the future.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/allarch.bbclass           |  2 -
 meta/classes-recipe/cmake-qemu.bbclass        |  4 +-
 meta/classes-recipe/gtk-doc.bbclass           |  4 +-
 meta/classes-recipe/libc-package.bbclass      |  4 +-
 meta/classes-recipe/meson.bbclass             |  4 +-
 meta/classes-recipe/qemu.bbclass              | 57 +++----------------
 meta/conf/bitbake.conf                        |  9 +++
 meta/lib/oe/__init__.py                       |  2 +-
 meta/lib/oe/qemu.py                           | 54 ++++++++++++++++++
 .../glibc/glibc-testsuite_2.41.bb             |  4 +-
 meta/recipes-devtools/gcc/gcc-testsuite.inc   |  4 +-
 .../recipes-devtools/python/python3_3.13.2.bb |  4 +-
 .../qemu/qemuwrapper-cross_1.0.bb             |  4 +-
 .../gobject-introspection_1.84.0.bb           |  4 +-
 14 files changed, 87 insertions(+), 73 deletions(-)
 create mode 100644 meta/lib/oe/qemu.py

diff --git a/meta/classes-recipe/allarch.bbclass b/meta/classes-recipe/allarch.bbclass
index e429b92437..fcaa580a4d 100644
--- a/meta/classes-recipe/allarch.bbclass
+++ b/meta/classes-recipe/allarch.bbclass
@@ -63,8 +63,6 @@ python () {
         d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
         d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
         d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
-
-        d.setVar("qemu_wrapper_cmdline", "def qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return 'false'")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
diff --git a/meta/classes-recipe/cmake-qemu.bbclass b/meta/classes-recipe/cmake-qemu.bbclass
index 383fc74bf2..7b988f45ed 100644
--- a/meta/classes-recipe/cmake-qemu.bbclass
+++ b/meta/classes-recipe/cmake-qemu.bbclass
@@ -14,7 +14,7 @@
 # with this use case in mind this works very nicely also out of an IDE
 # configured to use cmake-native for cross compiling.
 
-inherit qemu cmake
+inherit cmake
 
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
 
@@ -22,7 +22,7 @@ cmake_do_generate_toolchain_file:append:class-target() {
     if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
         # Write out a qemu wrapper that will be used as exe_wrapper so that cmake
         # can run target helper binaries through that. This also allows to execute ctest.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
         echo "#!/bin/sh" > "${WORKDIR}/cmake-qemuwrapper"
         echo "$qemu_binary \"\$@\"" >> "${WORKDIR}/cmake-qemuwrapper"
         chmod +x "${WORKDIR}/cmake-qemuwrapper"
diff --git a/meta/classes-recipe/gtk-doc.bbclass b/meta/classes-recipe/gtk-doc.bbclass
index 9d3911966b..28c0adba0a 100644
--- a/meta/classes-recipe/gtk-doc.bbclass
+++ b/meta/classes-recipe/gtk-doc.bbclass
@@ -35,14 +35,14 @@ DEPENDS:append = " gtk-doc-native"
 
 export STAGING_DIR_HOST
 
-inherit python3native pkgconfig qemu
+inherit python3native pkgconfig
 DEPENDS:append = "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 do_compile:prepend:class-target () {
     if [ ${GTKDOC_ENABLED} = True ]; then
         # Write out a qemu wrapper that will be given to gtkdoc-scangobj so that it
         # can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
         cat > ${B}/gtkdoc-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
index c06a2ce90a..ad00b2e211 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -94,8 +94,6 @@ do_collect_bins_from_locale_tree() {
 	cross-localedef-hardlink -c -v ${WORKDIR}/locale-tree
 }
 
-inherit qemu
-
 python package_do_split_gconvs () {
     import re
     if (d.getVar('PACKAGE_NO_GCONV') == '1'):
@@ -284,7 +282,7 @@ python package_do_split_gconvs () {
             cmd = "PATH=\"%s\" I18NPATH=\"%s\" GCONV_PATH=\"%s\" cross-localedef %s" % \
                 (path, i18npath, gconvpath, localedef_opts)
         else: # earlier slower qemu way 
-            qemu = qemu_target_binary(d) 
+            qemu = oe.qemu.qemu_target_binary(d) 
             localedef_opts = "--force --no-hard-links --no-archive --prefix=%s \
                 --inputfile=%s/i18n/locales/%s --charmap=%s %s" \
                 % (treedir, datadir, locale, encoding, name)
diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index cbfc45b94b..c4e764e620 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit python3native meson-routines qemu
+inherit python3native meson-routines
 
 DEPENDS:append = " meson-native ninja-native"
 
@@ -132,7 +132,7 @@ EOF
 write_qemuwrapper() {
     # Write out a qemu wrapper that will be used as exe_wrapper so that meson
     # can run target helper binaries through that.
-    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+    qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
     cat > ${WORKDIR}/meson-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index e9fe757c7f..5b5a26dfc9 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -9,56 +9,17 @@
 # existence.
 #
 
-def qemu_target_binary(data):
-    package_arch = data.getVar("PACKAGE_ARCH")
-    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
-    if qemu_target_binary:
-        return qemu_target_binary
-
-    target_arch = data.getVar("TARGET_ARCH")
-    if target_arch in ("i486", "i586", "i686"):
-        target_arch = "i386"
-    elif target_arch == "powerpc":
-        target_arch = "ppc"
-    elif target_arch == "powerpc64":
-        target_arch = "ppc64"
-    elif target_arch == "powerpc64le":
-        target_arch = "ppc64le"
+python () {
+    funcs = ["qemu_target_binary", "qemu_wrapper_cmdline", "qemu_run_binary"]
+    bb.warn("qemu.bbclass has been deprecated, please remove 'inherit qemu' and replace function invocation:\n\t%s" %
+            '\n\t'.join(["{0} -> oe.qemu.{0}".format(f) for f in funcs]))
+}
 
-    return "qemu-" + target_arch
+def qemu_target_binary(data):
+    return oe.qemu.qemu_target_binary(data)
 
 def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
-    import string
-
-    qemu_binary = qemu_target_binary(data)
-    if qemu_binary == "qemu-allarch":
-        qemu_binary = "qemuwrapper"
-
-    qemu_options = data.getVar("QEMU_OPTIONS") or ""
-
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
-            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+    return oe.qemu.qemu_wrapper_cmdline(data, rootfs_path, library_paths)
 
-# Next function will return a string containing the command that is needed to
-# to run a certain binary through qemu. For example, in order to make a certain
-# postinstall scriptlet run at do_rootfs time and running the postinstall is
-# architecture dependent, we can run it through qemu. For example, in the
-# postinstall scriptlet, we could use the following:
-#
-# ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
-#
 def qemu_run_binary(data, rootfs_path, binary):
-    libdir = rootfs_path + data.getVar("libdir", False)
-    base_libdir = rootfs_path + data.getVar("base_libdir", False)
-
-    return qemu_wrapper_cmdline(data, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
-
-# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
-# PACKAGE_ARCH, *NOT* overrides.
-# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
-# enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
-# this dance). For others (e.g. arm) a -cpu option is not necessary, since the
-# qemu-arm default CPU supports all required architecture levels.
-
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
-QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
+    return oe.qemu.qemu_run_binary(data, rootfs_path, binary)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 501808204e..b6215fd7ee 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -896,6 +896,15 @@ ZSTD_DEFAULTS[vardepsexclude] = "ZSTD_THREADS"
 # may fallback to using all CPUs
 export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
 
+# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
+# PACKAGE_ARCH, *NOT* overrides.
+# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
+# enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
+# this dance). For others (e.g. arm) a -cpu option is not necessary, since the
+# qemu-arm default CPU supports all required architecture levels.
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 3179a3f3d2..f25e7f8b7c 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -10,5 +10,5 @@ __path__ = extend_path(__path__, __name__)
 # Modules with vistorcode need to go first else anything depending on them won't be
 # processed correctly (e.g. qa)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
-             "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
+             "packagegroup", "sstatesig", "lsb", "cachedpath", "license", "qemu", \
              "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common"]
diff --git a/meta/lib/oe/qemu.py b/meta/lib/oe/qemu.py
new file mode 100644
index 0000000000..769865036c
--- /dev/null
+++ b/meta/lib/oe/qemu.py
@@ -0,0 +1,54 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+def qemu_target_binary(d):
+    package_arch = d.getVar("PACKAGE_ARCH")
+    qemu_target_binary = (d.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
+    if qemu_target_binary:
+        return qemu_target_binary
+
+    target_arch = d.getVar("TARGET_ARCH")
+    if target_arch in ("i486", "i586", "i686"):
+        target_arch = "i386"
+    elif target_arch == "powerpc":
+        target_arch = "ppc"
+    elif target_arch == "powerpc64":
+        target_arch = "ppc64"
+    elif target_arch == "powerpc64le":
+        target_arch = "ppc64le"
+
+    return "qemu-" + target_arch
+
+def qemu_wrapper_cmdline(d, rootfs_path, library_paths, qemu_options=None):
+    import string
+
+    package_arch = d.getVar("PACKAGE_ARCH")
+    if package_arch == "all":
+        return "false"
+
+    qemu_binary = qemu_target_binary(d)
+    if qemu_binary == "qemu-allarch":
+        qemu_binary = "qemuwrapper"
+
+    if qemu_options == None:
+        qemu_options = d.getVar("QEMU_OPTIONS") or ""
+
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+
+# Next function will return a string containing the command that is needed to
+# to run a certain binary through qemu. For example, in order to make a certain
+# postinstall scriptlet run at do_rootfs time and running the postinstall is
+# architecture dependent, we can run it through qemu. For example, in the
+# postinstall scriptlet, we could use the following:
+#
+# ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
+#
+def qemu_run_binary(d, rootfs_path, binary):
+    libdir = rootfs_path + d.getVar("libdir", False)
+    base_libdir = rootfs_path + d.getVar("base_libdir", False)
+
+    return qemu_wrapper_cmdline(d, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.41.bb b/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
index 3a2764e40b..d5e3a2cb19 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
@@ -1,8 +1,6 @@
 require glibc_${PV}.bb
 require glibc-tests.inc
 
-inherit qemu
-
 SRC_URI += "file://check-test-wrapper"
 
 # strip provides
@@ -22,7 +20,7 @@ do_check:append () {
 
     oe_runmake -i \
         QEMU_SYSROOT="${RECIPE_SYSROOT}" \
-        QEMU_OPTIONS="${@qemu_target_binary(d)} ${QEMU_OPTIONS}" \
+        QEMU_OPTIONS="${@oe.qemu.qemu_target_binary(d)} ${QEMU_OPTIONS}" \
         SSH_HOST="${TOOLCHAIN_TEST_HOST}" \
         SSH_HOST_USER="${TOOLCHAIN_TEST_HOST_USER}" \
         SSH_HOST_PORT="${TOOLCHAIN_TEST_HOST_PORT}" \
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 3257f86907..42f7f244c3 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -1,5 +1,3 @@
-inherit qemu
-
 TOOLCHAIN_TEST_TARGET ??= "user"
 TOOLCHAIN_TEST_HOST ??= "localhost"
 TOOLCHAIN_TEST_HOST_USER ??= "root"
@@ -41,7 +39,7 @@ python check_prepare() {
         content.append('process_multilib_options ""')
 
         # qemu args
-        qemu_binary = qemu_target_binary(d)
+        qemu_binary = oe.qemu.qemu_target_binary(d)
         if not qemu_binary:
             bb.fatal("Missing target qemu linux-user binary")
 
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 0f0505c66c..30835796e9 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -57,7 +57,7 @@ S = "${WORKDIR}/Python-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
+inherit autotools pkgconfig ptest multilib_header update-alternatives
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
 
@@ -168,7 +168,7 @@ write_pgo_wrapper() {
                 cat >pgo-wrapper <<EOF
 #!/bin/sh
 cd ${B}
-${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])} "\$@"
+${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])} "\$@"
 EOF
                 chmod +x pgo-wrapper
         fi
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 6d0e7883ad..9fe43a6ce2 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -7,14 +7,12 @@ UNPACKDIR = "${S}"
 
 DEPENDS += "qemu-native"
 
-inherit qemu
-
 do_populate_sysroot[depends] = ""
 
 do_install () {
 	install -d ${D}${bindir_crossscripts}/
 
-	qemu_binary=${@qemu_target_binary(d)}
+	qemu_binary=${@oe.qemu.qemu_target_binary(d)}
 	qemu_options='${QEMU_OPTIONS} -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir}'
 
 	cat >> ${D}${bindir_crossscripts}/${MLPREFIX}qemuwrapper << EOF
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
index ac5f4e9370..3110c151a6 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-inherit meson pkgconfig gtk-doc python3targetconfig qemu gobject-introspection-data upstream-version-is-even multilib_script
+inherit meson pkgconfig gtk-doc python3targetconfig gobject-introspection-data upstream-version-is-even multilib_script
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
@@ -64,7 +64,7 @@ do_configure:prepend:class-native() {
 do_configure:prepend:class-target() {
         # Write out a qemu wrapper that will be given to gi-scanner so that it
         # can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
         cat > ${B}/g-ir-scanner-qemuwrapper << EOF
 #!/bin/sh
 # Use a modules directory which doesn't exist so we don't load random things
-- 
2.49.0


