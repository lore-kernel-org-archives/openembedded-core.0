Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DDDC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 08:56:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38624.1710752178329298098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 01:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3807d582a6=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I6U1kj011089
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 08:56:17 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww2d6hg2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 08:56:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diAxOheR88rI4ESDYmV0/W2nZeG5dc9TlLh143B7e2dSbcx9G6zZgW3b9BWlcCL9/8HBndiUlr9ymSG6xqxU/Vh6CI5ZZ/JziGoteqwV8aWqTOeee1215AlqHuwI/xBf1fbS+wDJNeLBB7d7pLNeZEgzihU3Vvw8LqsSGIVy87vVxspAu0qOfKPmHC2KrlNzc9HLZ1z3Ydf+6np8ojGT69OHb1tUYBiRGFS0ec6Jlvwy9AoYxHDfZCseOgp0g1n21Wrw3aubaYyVUbu0V53BqD3K7BOClXIH4EiIcgdY8gU6eEaeO7lSQBjFCrU7PE0q+3iGfQpN18iqWA8OCKqRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybAe/u/xHgG8kG0/WuEO6jFmcVBJfwlGsHLl9eq1+Ns=;
 b=g1r7lXtwi65iqe88YGRWMR6zw1X9FIrZNuROYfOTBdtN6sWH0cL9dEgmW9tIVuImco9gtzOEpytk0rXEdNsGb+djlU209oXptJEY7tuup7oAsig/nDa2DjSoIlORxWLvM7P6WPr+8Cc547ghIa9HBDCEZqiDNazW5MNBHz/BHSUXcqVT/wyXBAg8vKYg/L56Y569loz7uKcllEU5m+QIhhhbayIL/gOkjEEoXNNw6NDmhs3IfrEuXMhGO8pLcqTYRdY3w4Wjc3kXmwDwNzHuHvB2vt2kdY9aEgliSOqPdNdzHX0DVqrTpY8PoPBmKAbHbVmKwVa0jHPOq4st1Fv4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ0PR11MB6575.namprd11.prod.outlook.com (2603:10b6:a03:477::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 08:56:15 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 08:56:15 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] python3-gpiod: add recipe
Date: Mon, 18 Mar 2024 17:35:54 +0800
Message-Id: <20240318093554.2521527-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ0PR11MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bccd0c4-2568-453d-e7af-08dc472944ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	02RK8KDSvlAG/gaZfcnCC3YMIrz1v6Y0FRNik9sIu3vsVJTi4tNSYlyuqGCfE2CU4+mwJ1Xa0YkU0yGrIBLc28Nw8mVP/KiM2G67gvPD2fcQbSq/wQGljg8SIXRJjWWUFRWj+BVjwLGiV9BfINc1n7y0Vey0v4oUoqs5UcKYqS/ZiGhwdwUQvY1uQISfXYX7OQUXN7gZvJUgsmpkBbycmoOUaesS9doQHhdJQJtmGZTXvlerSaSzaGw2nk7MPr9rDtG44qJAwCbmI9pMRrmhZ2GJA1F5DOGYpQzH795Dxp++ay0XtnBVT461T8VFIWI5jF+5x4+Abuh/4vvA7AtDg16j4XbbwMCWG7cWecd40podJFnECgwXob++Hzcdg38qW4Cj/edt6jKRgn3Jg3DjsO21a/RFVERby2WivUGg8ZNa1FVdz55ohtAuVqthJMQ7+J4af9Hyu4E3hL+F2HZsS3pH2JhXo//yKw7tQEyrvh5q9auxvQxoxbeg4n39Rm3wccGXIT0vc0fmzWYnE9+rqTkjkjwWoKfsMhh5VqzRlPXLdmIW12pxS6jk2ZyWu1N0xmNULuXf3nF3OvNUCk1OvQA3haTcM63Kbaw2Um2giHZdlCSI98Y4uDXZfLh3ZIiaCi4TZDw1Looiza70bLJX9F0+1uxDEjBcv5Myr3HaZPI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LzB7qOOkoZGvKqU5wmJi2Pb4NXrodrc2EdttYlJ4Q98/axtuzIXFT2VnhioA?=
 =?us-ascii?Q?VahofAWGRN2RjVuAe/VUhs6uefmlzeb7YF9AgoSZelvhff0a0hOLwcjzC/rS?=
 =?us-ascii?Q?NOCaqh7Ub6QLwpuOdqdAEaH/Uqj9d9agCt4xVnPdYmT3HWUo1xqf2g7zDIej?=
 =?us-ascii?Q?3PnM76kQN4+lweBJmvYbvX3HYhG5MWDSSgARKTHuneuDtCamjBiLehL6d5hq?=
 =?us-ascii?Q?cbNS22psRgN6RXlELcrxoPZRLtGYIO0xYaRY7ZzlT0a6BcmP6LIMETdW55hT?=
 =?us-ascii?Q?P0vqouQeQlN++ARS3HYwSDYqPKDg92d8lwVotg7+X5x4Fk56Xt7bWwcGjIYT?=
 =?us-ascii?Q?agtKRQHQ58kNTOxqWkjV2oz5UELg+QisrbZDqITH91a91Q4Uz+pohFdC8g8X?=
 =?us-ascii?Q?QJsieg6GLOUPD48qgNabwluwXUL/r++MwjUvRW/TBDAGqmqiK1qGeprfFNXK?=
 =?us-ascii?Q?S+NqhLOoxL+L7BDAMQh8truOKv3FhHOZtOsplz7MkUKR6+AlHwgT2ksYmJn5?=
 =?us-ascii?Q?FshTfR1TZjJoTDEhm/6C83dm8Z4OhzWZsjIY5b6sArqB6gcZmgrIFyM3ZwkZ?=
 =?us-ascii?Q?3nVN4j43HZZWZrGxCqp5cyY+/9xa1CMFaKV+mje+p0TYgCz784YuT4VVs1Ah?=
 =?us-ascii?Q?RxymgOimXqJCsRAkMCnPUWapZAOqGbYHY58wnjJyZruAEjERRNQfHocRPv48?=
 =?us-ascii?Q?rdslVff1PGEZit4FrUqe3x886LeN948TxDC2biftewUvY2j6BgFytgp0qVbm?=
 =?us-ascii?Q?K93MJIp8/3i0bbgCFv8bnqTvKYW4a9NC6Ca/JaO+nG77B6ZJ2lSaiQ+WZJkj?=
 =?us-ascii?Q?yqXCUqYfO1OHsQZ8C8aFK0cPdSQBfHu61mgnaTkzLmRaP1OyGIXV53ScGCR+?=
 =?us-ascii?Q?odpjw4ECI4B+DB4U2ngk4t6CuSTtGjDXdlGvPsFV0IqHCCe+DHvwBudikZPp?=
 =?us-ascii?Q?NFGrhDyOpGSTDLFQ3L86+FEk9W9EumeGokZ1zdkbV2nijsTVCXE+y5n6GbMK?=
 =?us-ascii?Q?QP2R2+44tki98Lpym6KN+uN275CLkfLeBtxlhGV96IFa6vGMZhqaPzDeDUr0?=
 =?us-ascii?Q?U6PBW8y7Tf0gGGDE9OgVKm0YPW/owxBqdiuNCVvIMSlHvK0grgb/0CjU0ww1?=
 =?us-ascii?Q?9Wfw/IsAJFg+X6XNWolvUBQVTPAtTXlgtJgzhX57yFSOClVh9PvHpmI0gE3P?=
 =?us-ascii?Q?Mo8drriHsKNGXHK7NTeYWUouT5Qk5Qhwa1hye6/5sFlUDDzdVpzqWpreUWo8?=
 =?us-ascii?Q?KN/vAM6xwZVGn5YP8WvHjciSRUWXhTWMG9donJhMYuE5lpz5oO/Wh6NpuU10?=
 =?us-ascii?Q?KyGURiu1aNIh4bVa8aYtMuzIwE6bRy/YEaewjBpKPd8Eqd5qSkAKThY8AAqH?=
 =?us-ascii?Q?ownTBEQSDC2CdS1ToBnk4u+eXUFaTW/bW+shcliXbkV+3RvgDNCz2WwrwxpR?=
 =?us-ascii?Q?B5xoQz7lbdmADXyZ3ag5xkGllBt0rRTFnxtYvFcgnXt3MQi9q+WAxBl5V5em?=
 =?us-ascii?Q?328bTuMJ+BjwzdJAyI5wUdM7rGJYKNO/QqMtBoX4PNSRqHEcuj4EYF4BYE7Y?=
 =?us-ascii?Q?aVlCgtj70wrHUAX+LxVOjpe78RivbICmezS6AHP9rbY8Ye8AyjVU7QobbnKQ?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bccd0c4-2568-453d-e7af-08dc472944ab
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 08:56:15.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlrKeyoH8Xhi1rM13/ZLC55SrN9fnuzHX9k74AJZb5XP52cck+eLMjXrpEmOdz7SKZwCDJCQs9ATk7yvlv6la1nH8h/q1dci0smqyu8mfOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6575
X-Proofpoint-GUID: iWKskbZd1wxas5fjPIhf6Ne8VYUl_c4i
X-Proofpoint-ORIG-GUID: iWKskbZd1wxas5fjPIhf6Ne8VYUl_c4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 08:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197296

From: Xiangyu Chen <xiangyu.chen@windriver.com>

python3-gpiod is a python library for interacting with the linux GPIO
character device, it provides a simple way to control a GPIO in less code.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-devtools/python/python3-gpiod_1.5.4.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-gpiod_1.5.4.bb

diff --git a/meta/recipes-devtools/python/python3-gpiod_1.5.4.bb b/meta/recipes-devtools/python/python3-gpiod_1.5.4.bb
new file mode 100644
index 0000000000..21f0f35cbb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-gpiod_1.5.4.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Python library for interacting with GPIO"
+DESCRIPTION = "Python library for interacting with the linux GPIO \
+character device. It is a pure Python library and has no dependencies on \
+other packages."
+HOMEPAGE = "https://github.com/hhk7734/python3-gpiod"
+BUGTRACKER = "https://github.com/hhk7734/python3-gpiod/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc4e57275d8c245894e576844466f725"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "d8e4daa655dee75c33a49f5859b2e36c72385021c06c5552968294b1ad5c2dd0"
-- 
2.25.1


