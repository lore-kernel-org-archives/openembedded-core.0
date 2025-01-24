Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81527C0218D
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 16:29:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12987.1737728351803683824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 06:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31193392e9=beniamin.sandu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O7G1bx018325
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 14:19:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3jwkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 14:19:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIzoIT38sWchO7XexFs41qHCgAoKIepqpbmXaSSZJAqw/H2duK2aAygXFLgGxrMV29cz28ZLQ0yV6MOnVHNuCKt59k8/9tbiaBqQC/dDeIhNKxiRwyKkj/TehEZA1Kp1m23eUaus/WAb/f/YMtTtxniG7AmHX7D2cT3LLImDASP3Pp/rkG4oTYz7OR15J2C06ZqZRtU+7rX5iKlbfQN1gQk2GqfExtkLfIHJeNSTXdqMcH2XRFz9v8vP8QOoEyIUrCMJ2gxR5OT7/bxAjvVwMI9KCV8d01RDErOmHkwUawQXlaoMi/CdRuO/7V9VhlYln2pHZw08d47YR8crwf2mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aetJKSKuCxlqkJvy7NE5b9VOR3c8WEFGLgOwqEkCKRQ=;
 b=J+uUCOlLcROE1k0/+W8ZtDYUm1xf15LBsTrBJp9w19GtoeVxdFEqYrrmzxeE29gsNlRnoMX7ca0yxrwmM0hy3BF6hpVRYiM5cW57OlI7a8lSftxu3UWhZFj5fFkt9WQ3ysXF2MDj2nnKlIDLKGEpe9+CypNW2m2wUfZgJ6V0/5dmRIAFOevCrselcPyhQ+Lc/TGKrcnaS4UwLs8o49g6yAk99GuXL5nKVn6SiKhehZ5UJt3QLbtqoKGmHByeWEYDJOcUZDYWg1nuhaxSDtUJib+OWtgMGYZuNfpa/Dhfoz7mlfe/BuXz5HNgnKUmmFFED97vGQ/cHdKd5Z4LG0v07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) by
 CY5PR11MB6091.namprd11.prod.outlook.com (2603:10b6:930:2d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.18; Fri, 24 Jan 2025 14:19:07 +0000
Received: from DM4PR11MB6067.namprd11.prod.outlook.com
 ([fe80::295d:bdbf:742f:7bf3]) by DM4PR11MB6067.namprd11.prod.outlook.com
 ([fe80::295d:bdbf:742f:7bf3%7]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 14:19:06 +0000
From: Beniamin Sandu <beniamin.sandu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes: add rootfs-footprint
Date: Fri, 24 Jan 2025 16:18:52 +0200
Message-Id: <20250124141852.2089467-1-beniamin.sandu@windriver.com>
X-Mailer: git-send-email 2.39.5
X-ClientProxiedBy: VI1PR08CA0252.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::25) To DM4PR11MB6067.namprd11.prod.outlook.com
 (2603:10b6:8:63::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6067:EE_|CY5PR11MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: de491f88-d8cf-42e4-677e-08dd3c820ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZNjuSH7F6FgEJ0NSu89YO6nbU7dC0wGmOG+LnEOqEsiHeoKro6PczOaJ8HDe?=
 =?us-ascii?Q?aGcXeX48beji9cIkVnOVf0afJa3EW3z0RJfLJQdrP+f4CNuWCFmXZcxAo08b?=
 =?us-ascii?Q?kfjAIAcywI5587vpJwRP/VGFgtkTPfHL62EuzEV8vNaVoNR5BCMEDDQ7a2Vd?=
 =?us-ascii?Q?4N09eJ0RHSMbLB/4wSwBy0G0ZQrL0pMvxffha9AI6nTmxBmR7btu9gtQaf/l?=
 =?us-ascii?Q?tWGrscLzB6WBXmTUVIXm2WfCvOxBdtT4NPCRUaBbJ+US0/v7wBaE1eCAPOAc?=
 =?us-ascii?Q?hrfKrwjq4pUwWABjc9wc4O+1CHRdqYgarQa5UTsUFfVE7UdS3a1xokEjAIqA?=
 =?us-ascii?Q?Jcgm5NzkdiClSHRCKt0K3HmBMoAOFK4d9EpCVtpx0XTIPNyyzDaKtEjFJhQF?=
 =?us-ascii?Q?gKDBjMGVZNMGAxqzsuLvXXkHmp5dJ49useL/r0un3IWc/GD7J908R8+bc/5c?=
 =?us-ascii?Q?NzDWPp9a1rJ1J1rSv1yZ36Ikb4yJy9MxQoBN/WOjbDEiGsj1M11wqBSE4teS?=
 =?us-ascii?Q?jhrVMFM01dF9gg3tF1NFSTAswTUJpiEsgjzTY5OB/q7enseIr9EOVG0VGpj/?=
 =?us-ascii?Q?UUvSTNrAMVY6sVO7BfBruG3e/uwMkSLYThBjPsRm+KePS5sNdsZRT0EP0Uur?=
 =?us-ascii?Q?v3LzWN7Yum3pzguOOtAD8wF567rvXXgsIku+rBSK7SYU6/66NJQibgboT2wc?=
 =?us-ascii?Q?uAc6EuR9HIBcdfM3U0/r8/KkjH19BGpUwXXVv8ruT7IH9AlNRLqLrUrQq8yP?=
 =?us-ascii?Q?fTAQJ3fBO1uQM/noMM/4PI17rpwkQTua/dCiojWAlcxuWJi2OaQh9fJL2AfR?=
 =?us-ascii?Q?avrx3gsQB3aIyEfuWQvaZsPQM7H7ELmv8CpGz7vGWd2VIGzDpcNUp7ap4lNK?=
 =?us-ascii?Q?w/t8lQGx1Acp4okwdeSWooXwVO8JfjfICpRCB1imLexYRNRCpVVBT28oIk20?=
 =?us-ascii?Q?LZmx2pT7VC4itQbqphyjBcv8aB9lDCR1ZPJNZKq7GHUyk7fosbfkSXReKZiA?=
 =?us-ascii?Q?YsIEa16+r6F0vA/CkcawKsUERfbLRhVdPQHP3Tth28+bX2qcr2lo+VJF+V1p?=
 =?us-ascii?Q?LBlx5i4wVTrCOhkuVrBWTPWi4hlmBiG8QKk1Kz69iQlzUnH88DYJhgMHd1FC?=
 =?us-ascii?Q?S1ungFKGEOTfrlUUaVBGJmQD99Fcs8zUBbG+XRsvQyuLbmatBsqfjlSV34D1?=
 =?us-ascii?Q?nHl/Yv+2cgBP/pRXp255yCliP7mpSLSlDaokcc9nTx/G1trtJnwe10xiwo7M?=
 =?us-ascii?Q?6FlXzBh1sora0zViEUJKuiBssfS7DS2p7GCTlpCYx8GYCGqOxnPikKjxeHV5?=
 =?us-ascii?Q?KDXfYTXeOdzCyAogioEGx+lVGOk3zmcZtNSOhkXl+PP4voTLmoYT3LbWwrWX?=
 =?us-ascii?Q?Nt4Y61DNpGDOzXDBeJQbTgf799kekagPGAHRVsplBUTvbKiV7NALQ/iIBRpH?=
 =?us-ascii?Q?V65B5EA07Dz3QCU4b0y80fFNVfOllx3a?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6067.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zC0zkqvuk4sQY9gq/lRLc7g7EtaWbLMTHTyyr4KZTid7vq+/cbXH+vwrjNgS?=
 =?us-ascii?Q?LWxqTh44E0PIQGI4rz9wSgE9FTSan8yzTlOwMcrfqTkTiAhGQmonDNxI2tef?=
 =?us-ascii?Q?JrlkhdW3nETTPRwEiMAC6g8cAv0RvCggG3GFAz74jQro2o0nXk+j+R+wlirB?=
 =?us-ascii?Q?cR9Uvx7cEutQWvzCINU3MhXnrwU8eIRa7UrMuIX3UQCvGRcFh3X+g1favhtf?=
 =?us-ascii?Q?FbXwKYITJYlrZImIeANkv2m6opBGKNghXgp0d7PlnAbDr/zY+hAiX7Rx4Bpa?=
 =?us-ascii?Q?qXFh8fbipeaveDAphNlQWQ2+dEoIXbVfgg3ykfuROWLaHySoQaZkz87gwT7R?=
 =?us-ascii?Q?9DpGd+KDzrkEAf/VehKVi4fLcOsIgpcI3MsfoUzi3SVISTe+y5N1RJu5JfwU?=
 =?us-ascii?Q?AwTLk2RbSDSk+BQ8BnPfFeSAgTGLD9t3TrbUG2QmKnxq3O+uAqhdH3Uv2FBg?=
 =?us-ascii?Q?RRVl6g7Ft6s0ehuaEcmPPj2JDVt/9JPyG9rhqXE4Y0mrQPDHDGdW3YzEiArP?=
 =?us-ascii?Q?Q6RHrMaCdDQ9eFXrhLREzaTpS/+7I0Y+3XyPwogpq1p3ml9kafAduZuWTlRE?=
 =?us-ascii?Q?gX77ikOCIPSncMay2bv+LufuNAdtM7eKepWjO/q7D6Lf67N/byfF9Car8/uZ?=
 =?us-ascii?Q?gLG0WwSbUV5nyxQAOhrjjNODMJMmjHtG2d3ACJ3Pgvj/0ktQ2AFiKo/ukcPs?=
 =?us-ascii?Q?fSj6kAhg0EYld8vA7dKm1OkB0GbyOvUGV/YU4w31ZXcDnWyOSaDHSWBVwZ0Y?=
 =?us-ascii?Q?Ak7EcKq2q/nUUw/8RTFgL6YuZCOVDfqDUqejF113rkGGcH1OktvS255yhL9Z?=
 =?us-ascii?Q?F1VLbiKCpoXp/FdeTX2OkIPDDB7nAvKW/mF2w/KL6Lk7ImVmt8Er5VYt3WDL?=
 =?us-ascii?Q?cus74Hh2YPai+vtcXG556OanfzQM0f7Z8VZ+Gx+8EDgJR6MH5fkaN06dttxM?=
 =?us-ascii?Q?yukAhijssJY4W33Nt3/0s2Q7oXsGjR+eJIEt5/PmDJY+YqT6KBeSCUnYimTO?=
 =?us-ascii?Q?doSbckzuU+O5syykfr9M96t4Xt9uA/Equwz9SbWmI7/2aa9IW6FocxEPeVfn?=
 =?us-ascii?Q?sOx2jMrwmydk/Qv0HoIyekkjf6ECWDjOLLwU3FvVZf2Kn1c18hxTWsrSaSO1?=
 =?us-ascii?Q?rQEqXNIBqvsoGyjxLfidTuRdyu3b36lMw39PCmO4ZPvWtHy6ka+mImAaQZzT?=
 =?us-ascii?Q?QBdNbrqljjUHDYVwaeLeGOKd6vB1r+lBpQb65w9qnISBShgCBXwBTWosCk/z?=
 =?us-ascii?Q?EIXHejFeaebmolRrJXW8qwt71tbEeqLuqRw/KK8Wh+oTGaRm2SD1IYH9Q0yb?=
 =?us-ascii?Q?Kq55+Feu+A/LKtXAvTKSx2oew3juG6hQwkr+EqnPKu6QMXoYTmuA+4t3DO1k?=
 =?us-ascii?Q?/wMe77j05f/oMuVLvoTmU+DVbisnkFbtmGy/dj4b9ZWoOtVEbPW/ktOh7YEl?=
 =?us-ascii?Q?syP57GUB91OICQNmzbWN1Eda108x77wSY3+HsrI07eQdfywIl5nCLz3uW9H6?=
 =?us-ascii?Q?L8ilwSROqEPRDy0RnjR1JzPgdaUTFGccQCiByD7xsDYRMzU0POG0jnHhAg4g?=
 =?us-ascii?Q?0zLZBw+T1Yaj7kf8bU9UTB4x1hmen4RrILEXby4ymx88S4SUyNltrKMXbMTz?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de491f88-d8cf-42e4-677e-08dd3c820ff6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 14:19:06.9268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erXqawgcc0vmjjbjjqxFVITHqVCBzCtTjW+1a+Bq2Irmacqjqk4G6s6zBoeCD2fNRvCxzRpKvxtqNTjAXJAJqOetf4viV4qCrtUfItK8uz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6091
X-Proofpoint-GUID: kcG8Ky3DiUvjkye5NSCVCdxtbpaii28s
X-Proofpoint-ORIG-GUID: kcG8Ky3DiUvjkye5NSCVCdxtbpaii28s
X-Authority-Analysis: v=2.4 cv=fZVXy1QF c=1 sm=1 tr=0 ts=6793a15e cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=BnnXWuJVhKsCD668QDAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501240103
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210236

The rootfs-footprint class can be inherited by image recipes to generate
a .json footprint file. This file contains a list of all installed packages,
with the following format:

{
    "package_name": "busybox-udhcpc",
    "version": "1.37.0",
    "total_size": 2701,
    "installed_files": {
        "/etc/udhcpc.d/50default": 2652,
        "/usr/share/udhcpc/default.script": 49
    }
}

The data can be used with other tools/scripts to generate detailed
rootfs reports or perform relevant comparisons.

Signed-off-by: Beniamin Sandu <beniamin.sandu@windriver.com>
---
 meta/classes/rootfs-footprint.bbclass | 54 +++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta/classes/rootfs-footprint.bbclass

diff --git a/meta/classes/rootfs-footprint.bbclass b/meta/classes/rootfs-footprint.bbclass
new file mode 100644
index 0000000000..247db0b709
--- /dev/null
+++ b/meta/classes/rootfs-footprint.bbclass
@@ -0,0 +1,54 @@
+# Generates a json footprint file with the list of packages installed in the rootfs image,
+# with the following format:
+# 
+# {
+#     "package_name": "busybox-syslog",
+#     "version": "1.37.0",
+#     "total_size": 2824,
+#     "installed_files": {
+#         "/etc/init.d/syslog": 2104,
+#         "/etc/syslog-startup.conf": 651,
+#         "/etc/syslog.conf": 69
+#     }
+# }
+#
+# Copyright (C) 2024 Wind River Systems, Inc.
+# Author: Beniamin Sandu <beniamin.sandu@windriver.com>
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+ROOTFS_POSTPROCESS_COMMAND:append = " create_rootfs_footprint; "
+ROOTFS_FOOTPRINT_FILE ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.footprint.json"
+
+python create_rootfs_footprint() {
+    from oe.rootfs import image_list_installed_packages
+    import oe.packagedata
+    import json
+
+    footprint_file = d.getVar('ROOTFS_FOOTPRINT_FILE')
+    pkg_info_dic = {}
+    pkg_dic = dict(package_name="", version="", total_size=0, installed_files="")
+    pkg_list = sorted(image_list_installed_packages(d))
+
+    pkg_data_list = []
+
+    for pkg in pkg_list:
+        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'), 'runtime-reverse', pkg)
+        pkg_name = os.path.basename(os.readlink(pkg_info))
+        pkg_info_dic[pkg_name] = oe.packagedata.read_pkgdatafile(pkg_info)
+
+        pkg_dic["package_name"] = pkg_name
+        pkg_dic["version"] = pkg_info_dic[pkg_name]["PV"]
+        pkg_dic["total_size"] = int(pkg_info_dic[pkg_name]["PKGSIZE:" + pkg_name])
+        pkg_dic["installed_files"] = json.loads(pkg_info_dic[pkg_name]["FILES_INFO:" + pkg_name])
+
+        pkg_data_list.append(pkg_dic.copy())
+
+    with open(footprint_file, 'w') as f:
+        json.dump(pkg_data_list, f, indent=4)
+
+    footprint_link = os.path.join(d.getVar('IMGDEPLOYDIR'), "%s.footprint.json" % d.getVar('IMAGE_LINK_NAME'))
+    if os.path.lexists(footprint_link):
+        os.remove(footprint_link)
+    os.symlink(os.path.basename(footprint_file), footprint_link)
+}
-- 
2.39.5


