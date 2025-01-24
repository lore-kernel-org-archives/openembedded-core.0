Return-Path: <beniamin.sandu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157ABC0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:31:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14826.1737732691811597052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31193392e9=beniamin.sandu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OCkcKA012366
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:31:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3k041-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:31:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwP50gEUD5WE9Z3qT5rvnxLQjn7GDPZbLQbF8ngNfYqbpVBxOU1VeesuRVbP+ABo3YIY0OOjOcq2sfumkauTcSy4GM6Hl1+IHVEL9EtYZgLyBPLgBG99kKFxO98hJKMfl1j/tip4xOARdUluVNEwhtIpI3lZOMbJVCBOBGaIN8K2P0betW5pB+eB8n2PrVKA+dlxGOLXSRrQdzvlkC+TsxfIkga1TiE8uqpZO8hEGrjEghQVIhG0tScykQfQemDXa/w9+B2ni5iz/XJk6N7rn483kaJCpGPYRerM5gmMiOm6jJY2s9NgZnvJfdXGnicKUjQKqJqNUlo5qm3lIlyjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aetJKSKuCxlqkJvy7NE5b9VOR3c8WEFGLgOwqEkCKRQ=;
 b=epVVKjD22yKv4v2Z0ek3y1WoPpCCf0BaTK9F2og3fttEY+DC9FaSNvJfbLKeLXKwG1L6kYCdqBrvrYC+IciCBzLABypabc8N8Ydm06qyl1crgEWkJ8KDq8YQlNKvf98dW+S6fXfm4tWZTM56ppCUnl4tsL74wl1rKDZHk698XoGxrcl4AZzH0UZmWAY/7qIkRgiQfFSOAnJYuCFeX06Tv0Cis0/c4qLptVBECcY2B0Cd2SlC6XNU3IKquQu/eMnxd29N00TOmyp+XW2ma0yr8HkBenYorZITVHtrbUEdhRU/I+NBKh9bt9VLRWYGg+aMqM9REHN5r+xC2Pp016p82g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) by
 BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.21; Fri, 24 Jan 2025 15:31:26 +0000
Received: from DM4PR11MB6067.namprd11.prod.outlook.com
 ([fe80::295d:bdbf:742f:7bf3]) by DM4PR11MB6067.namprd11.prod.outlook.com
 ([fe80::295d:bdbf:742f:7bf3%7]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 15:31:26 +0000
From: Beniamin Sandu <beniamin.sandu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes: add rootfs-footprint
Date: Fri, 24 Jan 2025 17:31:09 +0200
Message-Id: <20250124153109.2156894-1-beniamin.sandu@windriver.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::18) To DM4PR11MB6067.namprd11.prod.outlook.com
 (2603:10b6:8:63::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6067:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ec2032-5025-4606-c8b3-08dd3c8c2a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6HDYwYVdyo1IGSqWP+dGMZjur6ND+trkXXJyNiX2OfhLEv72xkiZGmMujKPf?=
 =?us-ascii?Q?IYwcJiygLg+fUElFDpq6TzN7G+DjezmPlhKa0aE6ake+iJJr5xW61HMHHhwR?=
 =?us-ascii?Q?Cw0Kb5fXQG3y/6nCbs5sJAb3hFKPWJutKJ6koLS6mmjzlK3kzP/1nO8i6kju?=
 =?us-ascii?Q?CBptCUFV94+jAVdrvT6PtkqRZrE33KGPfpZFp05djQW37T1xcEMb4X3bG/OQ?=
 =?us-ascii?Q?wH7QIJgw491Ne+/+g7KyKye0hn3Thu88PW+205kH4p+eTC+jNFjIOpEOvE2Y?=
 =?us-ascii?Q?sE1ZJZSZi7UkrJMrhBs4tevbQKa1c7zdl3NDORDSTkxjZ1PNlyxQe8qGcqEH?=
 =?us-ascii?Q?H7Cui43x/dXKotb9OzxR5VXOnokDzG3bUqSd5RXKzw45CXajF0BLtxwM4uQC?=
 =?us-ascii?Q?DlE6QhOKI0lhT/ZkpKgb2PrTsrqadWajiMLpJX8uGgv7UBWLLq0G8NPrMmcf?=
 =?us-ascii?Q?GYVMaVHdiIvyFv0K40KH82aJqLzS+pov3dwNXjSd4CNfBDmFgDe3q/u9Ekgs?=
 =?us-ascii?Q?xJ0OBiaWJy0xJ4c0RNaerxFi1lx6KKOOeXywkjvA6jXdkoEL7CRS1hpc5tK6?=
 =?us-ascii?Q?ZUs8xuWl8yHbbr6ZWPDEwMgUDM+YYlNRTchmrRQDUUhoELoBkXxXUDvoVgLo?=
 =?us-ascii?Q?mOGSIWOigoh7AfIVm2sXsd3K3/RwSGA3G6ZerHUALFPdPTo72UHP78tMfxOz?=
 =?us-ascii?Q?FtkgQuH4Q9Pn8QSquH4Lpsqw77Waib2BH0tAHPRqjCOropuOSmJQquN3du4z?=
 =?us-ascii?Q?2lFaYFM+DaglAXssAWBDu1pcqH6hFOyK41mWVu/DjZkIhtbSwAJ3w092tQDc?=
 =?us-ascii?Q?2Eg60o7eAcxO6TjlydvHWlSpxTy/B6LxtlwcQwSLmB39McMXPR4bIrYrby5q?=
 =?us-ascii?Q?+s6t55U4kURLzczv7oCNjgtHl+3zNoUJqNrp8AQg+gg1yUC7u7EAmy36ipGy?=
 =?us-ascii?Q?vs0Y2POL3gJ9oYLbKpjzcDL68ryCvtT7k5qyZGdYyLeCD/0XFaGzQys8xCm7?=
 =?us-ascii?Q?f2H/SCL6wqHVVMuc+jChJ8yXbbYiAKl7NF5pNYaSMSu126qKcAv5iuED5VXJ?=
 =?us-ascii?Q?EHNeQ2sFrX6qDsPH+u1Z6lWRAHxiN5TzTRWqAN/VvKBPsB4BquARZ7VHuJ7h?=
 =?us-ascii?Q?AcOJl4Yt1v52bvM+XVsAmwNI6MPTHKGxQBQFTGh+hWADqc3QFPZSeanWpURb?=
 =?us-ascii?Q?7uH2JP4v1k01a1a9sADaksVgZyDdeNSHdPWdyYSNWq1cP4qCGeQpZGo7bItF?=
 =?us-ascii?Q?JTSZvPMVilRrVey8k0FV9RkES6E/3M7OSOjAXbJ1huqrnxj3bV41rIkwnTZy?=
 =?us-ascii?Q?5awL/I5sZMdq0Cjw21h4Xvjuc2ua730tUwM9ho9TEhiiMy7U6034vmdcYZYF?=
 =?us-ascii?Q?jEbX77Twdoq4X/YQLEQokuk4cOBFkRHazeN3BfIf+RcFBejuqZRVGhl0gu+G?=
 =?us-ascii?Q?Z94t+wKsZ3Zr0OUTgUIPNIE4DxMUR6el?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6067.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wn6BD7mnfYqnkrx7ez91WGy17Wze652oq8z9O/FIx9jU179ztpY/3D9nEXWs?=
 =?us-ascii?Q?t5MWRDCUv2DF67AfTvLaLoY48ZWXGxlxf3EcstwDwsKFmczMeEfxmF/iZPZq?=
 =?us-ascii?Q?rBUNlajqraZx+N6ckaZEeU4yycB2NwaTbjsTCxTjt92pKnnbjlRqSEEVJXFQ?=
 =?us-ascii?Q?KESg2WlpfBXguNNOhSZnXxMhjre0KN66JRxOI82VRYMR3z+xLTgzQwQIhc/c?=
 =?us-ascii?Q?bD7Wtgen2RHmxzFiIJMfcVFWnDXAOryRDiehL4kKGftZpN8WHvrqatcwfFB5?=
 =?us-ascii?Q?UAVKswvMX8cTxvF3Qq+4TOp1csl1IyJnracIkbUe3LUhZU4wv6vrpot5N/wq?=
 =?us-ascii?Q?SEJULbSdVXl97W1xhQmog+ZbZULS1IKZd01KeO9ydYXMvBoRmx5MT0+xrRPh?=
 =?us-ascii?Q?qB6kcWUqRt8EY9y3hQegaN7gAmlK1INQ6okzG5suBgxpjHknnIT80GsRehAj?=
 =?us-ascii?Q?69MeTyWbI2UQIKgKK6GNJfbvyBlHidCCfW9kgtXbNfVJn7ckzaVRnOs9SMiP?=
 =?us-ascii?Q?y0mHU4CLbeHzUEovLv9mqqkX6pW3ngFIg+5V/P8Mrb1uNSm1onpXGx+srEHi?=
 =?us-ascii?Q?GcAFw5KbMs2R9eAwuUq4Ds/hMlDjkH68qvbQ3QQLXLcaafpTZv7y1NL9CJce?=
 =?us-ascii?Q?re9PVakB2bDDRRmY4DHMXThMyDy8glxaAj9llkfvhsZc9Yc3JQbiLA0fnxqX?=
 =?us-ascii?Q?nBU9W1j1FBaplSJWB1Fn/Do0npfaldpKg8HYEbkIXambaJSFoH8uR/QsNQdl?=
 =?us-ascii?Q?lX3xQXs6dF4yuajWdw/sJl0BpAQeamv/l5teG2JJ76wTWeJPHuEy/GQGtTmE?=
 =?us-ascii?Q?kVH8eb6Hc6XEo/oGWhFTf6bXnNxpoydvJxIBIvtux0EM2tLjI9IvNAzMoKIQ?=
 =?us-ascii?Q?Mjn2wJkvfnLVH2N79tdJGE2DDe9m09oDdCa0w/y4xhH+/PVVKqwmbMFwuZDr?=
 =?us-ascii?Q?2uib2dpwNeARI6UuWkB387yyHrZ+eZ59UVOEM2YihEqqVVlKisbREXtYAeBj?=
 =?us-ascii?Q?39nQj8EjhKd+h0IZ45U+amT9v6I7oS/FzKQy/o5KqfUR1Bt9UIC34ESGzJuf?=
 =?us-ascii?Q?dLZ79GbAWPydv2qLUho24SsnTignowdaxthCHNGgdOQPiOmQMcgtSvdnMyTd?=
 =?us-ascii?Q?WV5dnSCE6v4TKeer2bDnDgovJ+qEHBq8/UDU744ElUDQ2SMAK3EEgN4T+DN9?=
 =?us-ascii?Q?CWT1j+3lC37c8O1zGEdAFSbC6W3ACLCTbfb9xXUSM+MRSWh/4R+5laMHnGdu?=
 =?us-ascii?Q?mZMHOD/kLLw0ZZCI1mwxk7Xzal6+2w2EnfLWCWv+ZRPbc2qHV6qd1h2BrEk5?=
 =?us-ascii?Q?PmD4eQp4UyIzK2EmwY3ZBaAcFS9yBwwhOqiV9xggYvsI3MEDFgqTq3OG1qkq?=
 =?us-ascii?Q?Qk1tqn7fV50ltJwr8NBc5HItFQTLTzFdZR2QeCwJvZLVN6FRe9Gv5xAh/vzg?=
 =?us-ascii?Q?j1Vqd6QHkIbfZfHv71TV/wuXo5Sfd2URfvl3rDItCb/ZlWm3ls7HU7UNoGlh?=
 =?us-ascii?Q?lIv6hMgYzWMF/EcdL+DVsVdIIihPQ+tfuZLa+hjm1w0Q9TaUR3UFH7eccb/y?=
 =?us-ascii?Q?lZXpcB/PPURpKoABbzaDKnxutN3UGGzFK/ZGqSUUxVNS1D3iAKKyb+XNzccK?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ec2032-5025-4606-c8b3-08dd3c8c2a56
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 15:31:26.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rx+l0em++sDviKmiewa56zWyT7HqMfMQPsHUK3fOixANhV3M5AssB9xyP0TIsiNcFWH5JHNiFvCE5J3SXORikKbxNotKxuZsj54O7XxHAQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-Proofpoint-GUID: A4GBLj-FBqreV9z5s0u9hdUjeDSQDygm
X-Proofpoint-ORIG-GUID: A4GBLj-FBqreV9z5s0u9hdUjeDSQDygm
X-Authority-Analysis: v=2.4 cv=fZVXy1QF c=1 sm=1 tr=0 ts=6793b252 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=BnnXWuJVhKsCD668QDAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501240109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210224

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


