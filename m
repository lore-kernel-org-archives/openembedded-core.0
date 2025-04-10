Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B44C369A8
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:40:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34792.1744292434198141693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A1BJf6021255
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1q18p-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nhr83X32xgtRmkN5wZjBSh5V/zcn7fzQc0Ng1vrcV4fDr3PTvE9VKX7d3qLq0AAFgxOfbku0MqhGX9VOpJzefdkqOmPy3NANY84jIMv9VMhVVx9xxtzsw6XEngAj8G3gcydZGl+QhDCFAlpMHOpRBJEQRTFTTHDi6gTux1cmph7vR8DSuRgxVhxFy9drRJH9A9+2YcjSPdiaH3Ln8VwsO/R47t69zXuzBrMzpW8+XNQuLjIm1xE48xdNHCMGW8XaeAvPCyXZIbLhkgT1GnXG87/YUG+n2ikWm5KUFrxRgMyxIq68UOnNZXC2gQUsHC6wo36ZmzK9ye0mLWdvBguCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZJoeTSYBJzkzB1qBIm3koGehgDLKwHf1wS8H19Va80=;
 b=yapMdkR7UKlZbi5pXhLd2q+lUtYyzWxwz7FF+qO6eqJAGIlryVLTS7DxKJ0kUu+ao5sHEShqusiy9PnKRMgXyxVHQxbojLkqaTnp5u8M+BTkqZTN8TsLNUedu/xLO49CZ8W4mqmhvqewGcSscxaLdyW+jdFLGOKh0Y0z+/BP4k23EVEG0Us8IQpMZ0vHRjLzfNlHCMomlRgjwgjNPvUyhP/j97Yi3OVWYqo9hQJEThud88QxpcfRd0VcuVApjDdLmtavkUi+LJhtlLuZYmDwrBsMkYha/1yVfV7SKLV3iNw0fkSQF+A99iI9l1No/4LEFZOecMcfjSBUgKl0LReX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 13:40:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 13:40:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 4/4] lib/classes/recipes: refactor qemu.bbclass functions into library functions
Date: Thu, 10 Apr 2025 06:40:21 -0700
Message-ID: <20250410134021.1299595-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410134021.1299595-1-Qi.Chen@windriver.com>
References: <20250410134021.1299595-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5ab65a-15c8-4706-226d-08dd7835421f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EJ8zdsiPQD4v8Ipty1sb7GR9WpH1pRnD3O1bmSzzRQPo3heA0V74uWmYg7ow?=
 =?us-ascii?Q?MRlBB4z2UkWuymtTQk1n/CovSIPxKABfh4viQGy/VRze9Rv9NebVCRwBp0br?=
 =?us-ascii?Q?2M8oQ4REJL56eYsIuCvS6rmzEuLF5meHIJgh/Dm4J9uKJ+QAyYErDq1JEv/M?=
 =?us-ascii?Q?02oawjCL7jeDwPUn35Op87llIJu6YkEhNN8BZZe84dCVAc6qNqvy2olNEYeM?=
 =?us-ascii?Q?ljYqD6GOPX9dlWvyYVkH44cOQ9F1Xs69f/lJCaJXWW6CSiN/GFeV8J7V9rqg?=
 =?us-ascii?Q?rSSlwFIAzGgTRLHDlrk1y47h7oSYtBf3mIEj2YDcIGdaXqeZv41kjpmok6/l?=
 =?us-ascii?Q?8+16Hc/oQAOvr1zAelcn1xVzYsnZRsaChTeeb/PmfM+aim7Wrza+qMLKeUUZ?=
 =?us-ascii?Q?OfjJ6/2ltMhGRu2wDKUw9yfkv2u/1wTG4myDF3AadqY5jfpOoHWsJJH0BFqd?=
 =?us-ascii?Q?t+JmiFCEDLp1jcZZFqemrUT6QrQh27iW/nrjM0fsBPjAlk/RYO1ewAQFrTRY?=
 =?us-ascii?Q?LkrEpO9w0bw48OFUf6snXFYxxnp+kamMtTU0YgRPI3xIIqU2/Mg+1IjuDjpc?=
 =?us-ascii?Q?nxftrV1IOMsu95ZCH9UbwOYclxQMAu2dzRLp1BavBPpOeZPsNfwgExz3PuH/?=
 =?us-ascii?Q?Zni2fNscaUFYkdrePlu0rBsLfeSptcdhVi9Snp7tID2WWUHhpkEp2Mvp6W5n?=
 =?us-ascii?Q?3SqzEoAf4hSYutMsH4qEN5GXro6cTNNGRYHCLCr4atw+G4ZTDhtiTTHnfv45?=
 =?us-ascii?Q?aYTO3vTKaIBiE9baF/WexrSbNvGCMW4lQhDX5Bw3S14GE7EBB+pFH52nVL7T?=
 =?us-ascii?Q?3YEFwr68FF3CNFL8IoSBwFHxWLg6kF6ZVlfGXfKA9j34fBtNEKU58jLs0sOl?=
 =?us-ascii?Q?pkmHjpUd3nuVEbQSdR0wDQugywSCi69jWjDCo7gOmqpFI79xTELWpvikfRuv?=
 =?us-ascii?Q?QVEnHV/fVcvtoYsqoRiNJxa4XxPnsHtkXDG8bmnLjxyehRfaq3VR5PQ+NYRm?=
 =?us-ascii?Q?xH6Vo4xSlg/EmdfSX/Hc4OWpLQRZvuuOsPMMK9j8AGBGa383CAdYrXi53EcB?=
 =?us-ascii?Q?q10TcQcv5nFcjVETXMGtOyQZLh9RIahWZ9gdiIRhkHVsyfofM4VnXd6BdnnP?=
 =?us-ascii?Q?krivlfrTBBr+t8C0eEFxOG+JhYCp6LZ3XFYRHzgeZo4r057oLOOH2v0U8cQ6?=
 =?us-ascii?Q?xvJ0Rqad7tqo3ywwCrtNnRGx2ZY0CiiO+VYFZYQRBrPrXb0EWsYYsbR+wTU4?=
 =?us-ascii?Q?6TytY/pR1vM3O5wbYuM+e6jTQFIVeA8vnjFrmk+9wrfqluK6w9GHGsykFLpq?=
 =?us-ascii?Q?7KC4qr2Ovzyyinumor4o3FvQAf8rv351Du29SWQ3aHHJLLZxfXDtJBMoyP1A?=
 =?us-ascii?Q?TrrXoxiY1mIDtuPACY1IpHx4aK2vMQ1rJXAagq0aQdB4QVMMvkj7JSAGoDTC?=
 =?us-ascii?Q?DowVTK/N8JvkkD+WRVGtUTFJ8HqepH1DIgxzSBHgvKggR9mVPzeLNA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ib1TcpjIcDLimkWdEGNvfb+qgVeYVlpt0s23qYHFCp140naI6m3m8E3aKYwN?=
 =?us-ascii?Q?BZF4957lgdbE/k1GtGNddSXa1vynoQ8KxuV4mUXKA/zvytqch+FscQxZsp/i?=
 =?us-ascii?Q?kxQ/vBUz6JQsXdpVy8Yh2+YGgAD5XZKwo6xK+W48NLnYrvyMJT5YHvrhVUN5?=
 =?us-ascii?Q?7R8ARZwXwUNa2Mdaqt0JyrG8iTq9pNoqFAxOBampvTR4m6W5zVdNH60oGCyy?=
 =?us-ascii?Q?IKMcjY9HVftWOf2ig3nl+qIM2ipExU0xWVAeohPLoZCKBOi6njvYPxuhfP8B?=
 =?us-ascii?Q?BYNKe2eVd5YRoD6/cmgYir6/2eIyLwr/2tiJhR7cDE9m0yWlqNgc7nYwplmc?=
 =?us-ascii?Q?5eaK5DGiHIbPY+BLjwh131zIEXcBd8kFwByNrP06RlrAWMlx5dy0Y5oBKiIp?=
 =?us-ascii?Q?S+fCkIwlX9srEV1uNO2efV48OpCFPShZOBnZRhYZGWApcM9SLRoDdHPlZHNY?=
 =?us-ascii?Q?t7FwWFJ46TWPmObplZqBkJi+wOPfUcQiR/9CUbZFl48Z9hfG8ZMSVDGpDCIZ?=
 =?us-ascii?Q?/lQZcR2GAKRLAaMEkzOiwypxwIihKjTewuiKBO8IA8PRWbcDbn+DOjTuuYKi?=
 =?us-ascii?Q?G3+bSyXBfOo9gqU8JQbwefP1KdmPv/I7tTZBj7SpgMdOm1mGIqKHSVk/82+4?=
 =?us-ascii?Q?wMAiDfVl3u70dxDnzse8OSQNYdkUvKrauZod837qR3mS9uE3RF7rnhb2+Y4G?=
 =?us-ascii?Q?0JmrBfZ53vaPwKmpfpJcdPWf40gmXoMKwVxcNDG+g3lqjo49HoClbZf9/r+q?=
 =?us-ascii?Q?zb7VE+3W/GaBTetizwaynqs+KlyXy+DgadYaVc528RyIZqp41jRxUef0kPy/?=
 =?us-ascii?Q?db00VbGtf6Jaaf9D9DWQMenazVctoyKSVvUxAiIf2l+pP45nSEK1SzR2eWbc?=
 =?us-ascii?Q?HCtsnh7rkyOmD+83Nd+OYlQsc9hil1J5esJlkUmH30iD+BwrpUcnWQuR6jMX?=
 =?us-ascii?Q?C2GP/UWikssT2n6z0JGMMZYFS7ku8XBzc7QSnFblh1ZPwwFbDyC5EApDMx3D?=
 =?us-ascii?Q?6dZa8pxCCyL3CrGUAz5clqKiAeouAcy9j/3z+hTTua7IwWGPAtwjMtq8GiKt?=
 =?us-ascii?Q?0rMuV/Mq2t5yHkFK1MNoXkaZsMciel15xH2ozaEh+DeeZrC2jq0Ilo/XXRgC?=
 =?us-ascii?Q?oT6wt1NfQZRFGA4WJgpkPdKlQCQaXGylePum5A2Y/nEnefZWSPWiTg+HpH7W?=
 =?us-ascii?Q?VD0blIfhtVxJeHVE4C3G0aI7xqldQKbEt2BFECKH21EcKsiQkW03fMTyggzG?=
 =?us-ascii?Q?gVl1G+lxOmMnITz0m1pMfykiwZIRfUA2h9xdlTUoYAz1+4WQ8IrgS9M9aj2o?=
 =?us-ascii?Q?b8JMmE+b/JqiODuJQFJ0rvkjqF8sE0XlN0IF+ypRWCyfGn27bWbZSREOUSYY?=
 =?us-ascii?Q?FtwplF76j225fdH0uhFoTwhUKUXdHSfe/6RF79gxglLYWl/AKIBcA63Kovb2?=
 =?us-ascii?Q?A5y2ZyOI0NqJprMf1tB0Tpds5ipWwcIluKv1KykX4id8HtZEfWTnmxIkIjc1?=
 =?us-ascii?Q?S7M8oc5xZsOJjM1arAmQBJJkc0VdMhSzQu+4KJwSO+iRiNcyfUTq0ou96s/n?=
 =?us-ascii?Q?EG928u5oJo3oAcbpTXb7Y43H+0panlgGirKlf0aBQ/OhElLJAzSBOFbZs/be?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5ab65a-15c8-4706-226d-08dd7835421f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:40:29.7262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJkJdJ8m16bHoWdSo4tpTquDETT/psb6Tmv7/eR7d0PLZ8q5RaCqvjizkX8ulTHUwpqidS8rm59ESZlupqacyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f7ca51 cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=05caZQWP-9MGXGHOnJUA:9 a=ILrxbXL7mD7Ha1I0:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: yB6xbAw--BzQETivzq4kf-uQzqIp3YrN
X-Proofpoint-GUID: yB6xbAw--BzQETivzq4kf-uQzqIp3YrN
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214673

From: Chen Qi <Qi.Chen@windriver.com>

Move the functions in qemu.bbclass to meta/lib/oe/qemu.py as they are generally
useful. Add a deprecation notice in qemu.bbclass so that we can remove it in
the future.

The logic of re-definition of qemu_wrapper_cmdline in allarch.bbclass is moved to
qemu_wrapper_cmdine function.

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
index c06a2ce90a..b6094adbb1 100644
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


