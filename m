Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5882C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 05:27:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26757.1723008447446453140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 22:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8949aa9b73=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4775Dpea009796
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Aug 2024 05:27:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0bsg30p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 05:27:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8y7DpBgD8ofkPuU+zjXb/tMdh/xsIBvkP6M8Nj/k1w9Q6pbzNV+yDUWGPawmY5W7RyM3lKYYDXQeyTQhbsUsz69bX7L0xtS3Q9sNmaHLyWFz0i8hS8O0ZaHl2CfpRRr0pRYcq15VsHe8oAzLK8lKBMoJCaEDCLQG0CaIdkPbfKvVE0RgzQrn27GOpfxbhTOKs1gR2kLSuYx/JfslX6G5bCdULANjU2ZTO/WJ0N5UyhDn9pS0QOkAOKprSwY1EZgILSJGil0vf3xDSvr4WaluRaplsn8z6ixmGoQrW1EDL7EHlKxFMYIzd+SwnhNWi+/spGwKGHH5ckxpESIIFTPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAPfahbzqPyMeL5JeDIQQ28fRoyliyTc6isPMTgGVUA=;
 b=AkHQDKe+1Z39GGRioXkt6lPpLIUrKKlBbg1gyA05AM8T1TnGa3nBV/8uMtfxV5CaIuiN5O6u58NE1f6MQD8Yr/4tWatu/OGAIroVGT+nMcfXPR71ez5PK0wyf1veNsC1fQFstlQWKMT5vlmTQk8p/OLg3r3+x1MUU6LPbYDMKTEJ30N8In/U9Ded6afbie+KxdQexMoWnm2e1iwxgOBEIs+SQV0v4auj23/C52jHtXq8OJrtMkpcwIG6Prjw6PQBqZUKQKoNTfGdm9PciMks+PVW2+F+uwXsiwhcZDJFxhFhZB2Cqa8FZ+imrrpPpgTbCf7lC4VaPzhYKorxEWuQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6283.namprd11.prod.outlook.com (2603:10b6:930:21::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 05:27:23 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 05:27:22 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] kexec-tools: avoid kernel warning
Date: Tue,  6 Aug 2024 22:27:13 -0700
Message-Id: <20240807052713.2535834-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 979faecf-6e7d-4482-6d05-08dcb6a19d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zK7bKSWKA0Ct8waWg5ITdhnFddChYplgD0zcR3sx3xJsFYOpnQ8YbBGAHAq2?=
 =?us-ascii?Q?4zEVnOPRq26Tvke/gMVrX+4Ls3feKCOENpJMYYatESTpUj8fjuNC0N7CuUIr?=
 =?us-ascii?Q?sJOQilPgmTOyiLVlog2fnPmGRg64pvG6sQCMW353KKXA1tVFj0D3cqwhJ0Ox?=
 =?us-ascii?Q?Pfqo4bVXOuWM80eyUb0XOnbrLNXp5u+rKDaA3NBoFD0iKxw4Sq2YaLMJ5JkF?=
 =?us-ascii?Q?QLHzlPQ/RHq2awVZtr3ArlkQbLC0oDqhzkUy/IdjKzmIYJz3i/sJH6jw86AD?=
 =?us-ascii?Q?o3vX/hHnOR+SqGp4qpeHYpOUO9BwC5s8ORh6JJHAGsXXkFX62xoBf2IP8RU4?=
 =?us-ascii?Q?+Iflb6eQUfHlHMJGFk/xGMe33gjRF23NgnvBSqfy1D+mW0QYgZ8Ld3DxwZh+?=
 =?us-ascii?Q?M0LWKMd5RM7M05s6+P2kkiOXA47LfkUia5oM3hCgupZcFLmMbF6nAZnIvcii?=
 =?us-ascii?Q?r49vUK2JZ6bPQAhGTiy8Av11JRu5QXnHMjlWb1yZVTVg25m2RxTyJxiI688n?=
 =?us-ascii?Q?Cg2HH+h5EmyBQK0mqgbJDASWvy5pWMdd59z7cpU7ZR4n4ArqamCzZH5g47gm?=
 =?us-ascii?Q?Yb9Kf9oWPFJzs3OFo3h43pyIbNcq3WBA3qCJI38r9RqMBZ0fkNu/hi6MhLlw?=
 =?us-ascii?Q?Gc9EeL2ooDLsp0qRKMzndEWCcbnOhfHSr5QOyGO8/uycgEsIumpLRQ9zApFZ?=
 =?us-ascii?Q?xL9aJLc42RBggdBjaiyGh2a1LCVntNbk5zU0AHpTSmVsm5k/NqCHcIPVRT5r?=
 =?us-ascii?Q?sOwIEalr6PRHOSbojMvh9UN7gezhpdZwmQYkWXOVsW3K3iZBVGycXG+40Ln3?=
 =?us-ascii?Q?/KEcRfdMBl1yoeVZFgPHy/HRJFVD5kM2+FwuYfETePSo4baqZmpN5Gx56Blg?=
 =?us-ascii?Q?0AS59auI/h6g+k11X5FHVeuD7qhpEIPpp41uBMWoNaEw8LY/3Je1fDblb8z5?=
 =?us-ascii?Q?9tLbb8NU7PemW/QePgecmGkp75CXeqMV+z+HG5ogU7raSguk/gcPEQdQdFux?=
 =?us-ascii?Q?zvy5+IsaLZwqnA29Dz2VR1Cbj3W/JA9XEAYwwnfpuG43vuhBDOinmtWzYpBr?=
 =?us-ascii?Q?OjxULox5pODPzUzuryipNjnFT1eSQHBULeg5S5tcB5NKNOcSKcdvdUhkg/TZ?=
 =?us-ascii?Q?BpiBBclt2eHqGnrtuq2y9eknKjMeTxhvtBSHpGdziAHXivRgvxOLBSnonXc5?=
 =?us-ascii?Q?eviTb6pypFTZq+crjcRjBXLjtHHwBcUtaFQ2WhAZxn9CLWI6QFyKD0Q/p5Md?=
 =?us-ascii?Q?ZoMzClDOa0Zi21q35ydINKRmmVmm7yOf7lK2s2IyqmrDHm9mbJ5xc6dseSS5?=
 =?us-ascii?Q?jn64ybOICqK2aanYe7/c9Fym1ylA8CVW1EXtVHtMy55d6/e74GK7UB9OhGpy?=
 =?us-ascii?Q?cgJKXgo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zr0GMie3tVMZR9T9B1FQSZrbpioYJal2dMxhAxcRSGeeuFhVDW7/QdI2Ah07?=
 =?us-ascii?Q?Ewr8ElIleGRTeH0E6l7sBCIg7Qy/zdJewyQbntOPCh9qm/MiW+OWEHlf88z6?=
 =?us-ascii?Q?OkSX1nmNSBHcfHd7fQgH5FTT3X7SlJNCLnInM8CmhY9nnEkHNa4ZuFqWuInM?=
 =?us-ascii?Q?TQOUUekKONHKLUKW3aguBktBNFUkT+5Qj0kPTTVl6+umPpp9Jo/uIeoYwR3K?=
 =?us-ascii?Q?pZj9Ohxhqih6DVdYtrH4Rpwcz+r0L2svsoMxEEbsIhP0dNMM6COy/zpS7nxm?=
 =?us-ascii?Q?DyE+jxjdSlOm4VnzKvWJYqPmyQqbENjYLjOOBfSINS5Mha2Od9NuSBAV6kh8?=
 =?us-ascii?Q?ZrGxy7dwfHHQ+Y7R1pQtboBjSL+3FXyxygrNVIHLdnRbcOsu5kgz/kOffiIJ?=
 =?us-ascii?Q?WSAoxVsarZV7pdvURQLZAfuOaTw9V5CBLD8w2fuwLWXfUcWS8dJizM2VhOig?=
 =?us-ascii?Q?NG5Uymdjrr+h1aeE+9bJSnGH+O/YpoAVGnfkny8GWUAuGRibIcXqD4uJ2Riy?=
 =?us-ascii?Q?rLkhNDkR2BHJxRZsxza9HuRjltajNIYPLqWW2pVIFW5hscIzj5cro2ORLvhS?=
 =?us-ascii?Q?KrA9LBn3KncDXbrV+f4M3lbD/TgvYHptmmiiEPodN2DcivFBZWSAUdcII3d7?=
 =?us-ascii?Q?7qy6VVwlg3t9CUQrQJ/Sbs8CK5krRDjfgkf7OtgFiBiftkZ6FZdssyG8jQjT?=
 =?us-ascii?Q?anKDPw4DpwdWIJ+ldUMeiNpmSgoHCu+oNT5C/g29oh59cig7TomvsV4n3mN6?=
 =?us-ascii?Q?hSyRfHMgOOWTnUMXEDyF4/yIgjBylkFjYhyegoL2iZI3KBetV2vEOc+HG7nX?=
 =?us-ascii?Q?SSjS2GAUVdgUwYhfurzK1GwyVtw6JYdfs6qFuuX9ehPxpztfhJKpzSskxGpU?=
 =?us-ascii?Q?r5Kt8qA4L0tFYoV7J8PihkkHCc/OuooXQJS0WKBDvtrs0dHOG0V7AQs0UVxO?=
 =?us-ascii?Q?F5JCuewP9bx95w+SWSwEvRdHLzTgtJ45eBV/ECcN86TkKti+cPF6/dVEJPbr?=
 =?us-ascii?Q?dLTRiOTnR4RKE65mCOw/1qFoAtEIEkbccSS3p/f9Tfdc0Op3MMgs/qxc1pz6?=
 =?us-ascii?Q?dvZQUK2R83wIRtZkE+GodR+ruJ43i+F5XhDk1N7YsywJwxVvOV09glQnBuQM?=
 =?us-ascii?Q?TxGNdVotSoMg8/5B4aYdO4dP/kTWyW80ayMjnqMPpstDwKwam3fycBDU1cOL?=
 =?us-ascii?Q?rbj8KGhKBqfSIK/onQyaFhIjvAXllyho85iBkpEUE8k+C0zf3KgoBfR0fZsi?=
 =?us-ascii?Q?Sjvngkfut6XdJNMbwPk6XXB2drEiacUk5GF4zzPNdAQ/t46Y97W7aQw1cWi0?=
 =?us-ascii?Q?gJJu3g65KtaCvKij1qWYjv2+0L+9TliuFaPj8oV5LM3WGKOAtxBBlKxsU7qA?=
 =?us-ascii?Q?GDTOZuBSLcSKKqj1wFKgNkH32jss9rQI2zgESOBXX/yXAO6hzu8P8Nz6JfJF?=
 =?us-ascii?Q?k3wOI6vj9RUZJpVZ5HXiEUB88majwcdltowDuRJXXmmh5Hc/567E/jczw2/b?=
 =?us-ascii?Q?9mY8DP4as6Ex4Y/471aHWr1muOexsFpJ/pfmua05owbwpvQcDLjQdJzZgF2C?=
 =?us-ascii?Q?f3iE5ki86xtrOkeYkMEFteqpAn4VhjRR1V9jrDDv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979faecf-6e7d-4482-6d05-08dcb6a19d76
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:27:22.8395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAM6XHaAsUS19uQX4RdoHySAEE69k03aP4R37pu4aE0EN3HEIj/6cQKE7XZ9b+PCuOz/D9jX3dvz+ciUK54eIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6283
X-Proofpoint-ORIG-GUID: Y3Y_y8bCG8eTcjWsDAQ5pl2z7f5wvGx1
X-Proofpoint-GUID: Y3Y_y8bCG8eTcjWsDAQ5pl2z7f5wvGx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_02,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408070034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 05:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203059

From: Chen Qi <Qi.Chen@windriver.com>

Running command 'kexec -p /path/to/crash-kernel --reuse-cmdline' will
give out the following warning:

  kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL set

Add MFD_NOEXEC_SEAL explicitly to avoid such warning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 46 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.29.bb               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
new file mode 100644
index 0000000000..dc52981025
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
@@ -0,0 +1,46 @@
+From a6a9e17dfeb5627f3e6f569b66f243f50f8a3645 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 6 Aug 2024 21:42:43 -0700
+Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
+
+Add MFD_NOEXEC_SEAL to avoid kernel warning like below:
+
+  kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL set
+
+For old kernels, there will be no MFD_NOEXEC_SEAL definition, so fallback
+to define it to 0.
+
+Upstream-Status: Submitted [https://github.com/horms/kexec-tools/pull/7]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ kexec/kexec.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/kexec/kexec.c b/kexec/kexec.c
+index 7c614b0..41d285d 100644
+--- a/kexec/kexec.c
++++ b/kexec/kexec.c
+@@ -60,6 +60,10 @@
+ #define KEXEC_LOADED_PATH "/sys/kernel/kexec_loaded"
+ #define KEXEC_CRASH_LOADED_PATH "/sys/kernel/kexec_crash_loaded"
+ 
++#ifndef MFD_NOEXEC_SEAL
++#define MFD_NOEXEC_SEAL 0
++#endif
++
+ unsigned long long mem_min = 0;
+ unsigned long long mem_max = ULONG_MAX;
+ unsigned long elfcorehdrsz = 0;
+@@ -655,7 +659,7 @@ static int copybuf_memfd(const char *kernel_buf, size_t size)
+ {
+ 	int fd, count;
+ 
+-	fd = memfd_create("kernel", MFD_ALLOW_SEALING);
++	fd = memfd_create("kernel", MFD_ALLOW_SEALING | MFD_NOEXEC_SEAL);
+ 	if (fd == -1)
+ 		return fd;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
index b88db60ee8..2c2901f19e 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
@@ -16,6 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0002-purgatory-Pass-r-directly-to-linker.patch \
            file://0005-Disable-PIE-during-link.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
+           file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            "
 
 SRC_URI[sha256sum] = "0756dd54dab2f2a437e5d4df64b9760c3e6cf6a7d29fb296bdeeeb749f6ea28e"
-- 
2.25.1


