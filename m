Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A8FC5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 04:37:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.78803.1749530235881092571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 21:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=825617642b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A479ak032450
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jun 2025 21:37:15 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq42fsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 21:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDwPwoT2AWwHb1rS9Y1XvnDnk+d9F1jRq/cTEH7w6CYo13SCOOVa3RTjBZ8JR9cbmEn180AEtGsMSTzic2DuEa5C9uS5htgh9sqa82HSzw5OewIsMRUUfOqZWHcew+ZcEVMrFPhEIW4XQeKLK45+X6qfp2EI8VmHj5IKxQcJJab1VZS6LykkMQeb1EaEzj25pdF0wiW3rnNwpYW9OSmWDUjhZY1WqqbVXjfH23RCH4/TuCY9rfkG21QURDSiGBo0sqFYWyNfivgqmFUCasw5aINXYfRQpuIWJ/5eT9Q8vGSQ0E0xDlLiieKYGzpuGWOoAo1BoCf7jtYzasgJhVCGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR2W7iAIuEw1metvxyeWvJ6uFQxn7s3RkQNukfZ9BTw=;
 b=Jv7limuI2+xwxHAHIHDQLNW0rttvskL9MYDYl0KjEwjtwMOdq9qwqyBigcGBFp5YDX98ky8plOSPqtE3j1BRcc+l2uuYoZDnAylu4T7WdZw+uBJAa0PaT5MjyRN5BdYBHEKkgu4ZClDN5VmnsVrNEawc0VgvqzpolqouSnS+L/KWtLeTQyYcTrlIHPGNmNCvuWw75Jj+iqIRV/OHTC0lbSnWQUcaPFP0EGFajflDtDU2i+a2bs7zwLH+gIxxDOUmcO6D/PuPUAn5/reLCXvBamls6iP93Wd6CcIgr4d7xiTrHcGJiGBA37PijqmfC7LI885Uk5oW9E2LIlx9tFy9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 04:37:11 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:37:11 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-5244
Date: Mon,  9 Jun 2025 21:36:54 -0700
Message-ID: <20250610043654.857123-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::12) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CO1PR11MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa99a2f-785e-4afb-039c-08dda7d8770e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4bRdBqRNBZdRNUNP0FJBJw0PzY1fO9kl4I0THdf2p8hno2AA9q7x0aK+EfCr?=
 =?us-ascii?Q?j1k4oLNnFZISXFrGjr+hnTm4PpGyHAvU3KlZuQXtOoKEowqLnxwErUYrLZPq?=
 =?us-ascii?Q?5bbvSdezR28g1jtPRGV40ruJULbSnrvNgBWaJDAmCqK9+PcsfvwV3hBLZQts?=
 =?us-ascii?Q?5ubyr1RMotdZYQ3s9oW+YnfKXMfYxUdH9SdP/51vUJ5DUHji+ourtPx6G230?=
 =?us-ascii?Q?DOSOkahydC2E6BRlaHDyrPXKFwrgcuKFVg6Z1Fv4quaP+Bu5zismAlBD8h5f?=
 =?us-ascii?Q?pAgUoM9YM0g2xeOpgClmG2EH/R7zVah+UIYKOUZAGuOCH8BOjkeB4qEDOC6W?=
 =?us-ascii?Q?WTXnHmH6kheQ3uheHL8XMIWa/502uXcP11rvXiMDqZAQYrVUOy3TVRi072Vz?=
 =?us-ascii?Q?yNfOrgw7RCNlJDewKMmMyp0sn0+HwHQE3koBYy2W+YCqZqoqI75n6apQjR8n?=
 =?us-ascii?Q?3d5pZtrLN/1rkqiAZYYeeiMUcEMn+k7Rp67nMEwouiQsds3QC0uopokZysM4?=
 =?us-ascii?Q?PHROs/kGTb55mwPpzy5esxlU2gqgBFGmhfvTAPTL0jPScwWwCzbOfQGf4m+8?=
 =?us-ascii?Q?M7xk0cY5UP+fXwJpYz8q6Nfh44ioSq6kZdzOZ/TPj2Vi3rUpM/g+4AebKEd2?=
 =?us-ascii?Q?J1x5mj0i2S7oLX2RxUjdZki2rl1sfmxipdTAGo4HMV69U7XAXmN8F5Ic/PhQ?=
 =?us-ascii?Q?42vmEFhIzxtAoDDeESn+37/E9XzHO2Q67C5QLfnMUwkMh/9jPQFzuFXmb2Yg?=
 =?us-ascii?Q?yNAWXzRtvqU7sNz/vC3V16yHbRSdo/Qj8FLyyBo6W7lvGMWDuiDTQaZpTxqW?=
 =?us-ascii?Q?bHeq4+BoaiVPHfC52hyBrWo03GZje+SsSu3vvFgeyZGmBOH5HLg13LahLm2l?=
 =?us-ascii?Q?MBVKCWZV30AeqkN/uPpzEHKXWzai7TUx6DD82t9HwDBZo642kJ6zskUAL8sg?=
 =?us-ascii?Q?KhBUZrsTt6h8l9eyvMs63fEPS6JsLXGtLgfW2ICrb/XOU4Fs/sSDXS1CUOcb?=
 =?us-ascii?Q?OxMP8SWIvpZ5HKHCN+0pLUcexcB7pOIlcDrPredRE9LQyd7gkgt8xyEVaz+v?=
 =?us-ascii?Q?Oq80SfCyKURbjn2yvYEvDwsu45HwdHrcKR3r/xp8IraGBgw1VaQ0gDLXcQH4?=
 =?us-ascii?Q?vpSz83uZxlkWhR5U/+DM0hGPSqlFNGwyzQxPkqkIhk2V/T65LkMhiG0E8lcw?=
 =?us-ascii?Q?mWTzooRimr/1nqxIdjeGN3Iue5XcPM6Vpanogi0xMlUXiISRLuXQ4ZTXgnlq?=
 =?us-ascii?Q?Y4OwE7Ppovlawg677GzQ1s70SSBvN6exmBeGHMoEPxZaJ8o6C7YxyYTZCPlU?=
 =?us-ascii?Q?bvdK9xJDNb179vdaoEyGevrczvpdivqv1pOwXppllbI8AbgtgXvL0A+85+Zf?=
 =?us-ascii?Q?iHW2z3ED/RUkDKEbhrVCrOW8gjfFCaiP1hS4h25eH60wN+7dQGLO4pwvhf9F?=
 =?us-ascii?Q?pidTnGl/pSY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rfjBKHCj/dLAcj84t5HE/GXvkYvd7LfgaTeTihrcxUZYiYEJ0oCkmIMAFb5E?=
 =?us-ascii?Q?GGz16tB7xOHHyDmfwAq2KV8aG18g3T5AwXT9UQS7IzrJsCnpwFfgDNsJHHIZ?=
 =?us-ascii?Q?64nhEiV/zMOhUC5zYgVnuM7Bad8HbJQTQk/SJ+bUTJpoh2GrPNAxcKiG40kP?=
 =?us-ascii?Q?+8HGASrNFXVoVpom+dW1FsfjWBwkVRS/bV3hOn4rqZGzXuJgtAmYLjeXvuAC?=
 =?us-ascii?Q?oDQ4z0XkM02DKN1IFeM5kpOyVQCoRZWwJOKzCWgc39It31JhuSVB1KyEK47u?=
 =?us-ascii?Q?PPvBNcE2UrWXyB/JGlb2f2hhHkCoRQZjUgYZyneJyYVEvL40DDLWUjZOup8q?=
 =?us-ascii?Q?XQh5061kKDPlgUvoF0MWpplcX7hfUn8vXKfCiS/1f0io7p7aRS5DoFPpKWt/?=
 =?us-ascii?Q?vT90aFnxqosg7PS14sxoN0oM+V7Ix8QGC5cOiWL38LTMwqnn4VMEjBQ/ofg8?=
 =?us-ascii?Q?19fHVEq4edHkZf33yVetBWaE7kujcbF/eIwsb/iYPnv5Yz91cFeNXw9V9kN5?=
 =?us-ascii?Q?WqzCxh54RU0L0d9JxN8mfAT5Qb0/FTotHllG0rK6NlWNRFa/38vTWktqfhCi?=
 =?us-ascii?Q?p0UXKI7ewp7DnsYyNNXQe/3eYhFWiPwYjgaDQ/Yq+8pASTW4Gqm8G2OgPeP+?=
 =?us-ascii?Q?fGKo/MJn92DwGM6x51SIZmPLc2EtpdNtH58DKSxScM7AG9oNgThSTKmrFfyC?=
 =?us-ascii?Q?O+CwMp8SQmJzXZRntcASqEwf6TWcmowxwtUzjZJE0ujkOtPIZkJx1Mjq/wJQ?=
 =?us-ascii?Q?jvFLs3/3G2p4JBjgmGASpR7WWCIBj8UO+sLrd4ak+L4pPzzrmg/+omT16791?=
 =?us-ascii?Q?13Sl0DH7c6z1ua3Lr5IPgPBklbdgnuO9MdI//oK0K49z7gtgnZPY4UfOxb94?=
 =?us-ascii?Q?8FPHWuXD1l+T7EfC/pBKdugNNNVCHshXFKJPdFUI3QfWcHzvtvAplJHisu7y?=
 =?us-ascii?Q?vgdnzCu185nPhb+rbEPHG6TgXY8pOCeqJROiOpINEwvfn7gstkYhV2sPL6ck?=
 =?us-ascii?Q?yb402QDkFBrd1FTLHdSoJGO627pfa6qerUB7DDmhyZ+ZYyKVGJsg4LiGCq49?=
 =?us-ascii?Q?qOb6h+SRaByK5WuWIeBinutoSyXu7sxRDYZAvKBmAkY+A/g7vLCnJuc/GLg8?=
 =?us-ascii?Q?VuEm+9kn0sNnV9gP9C4g19DdtwAigdgZAUaiDWw5dzPnbPIlNS3L6dSwr/wL?=
 =?us-ascii?Q?AjF6dI3E+qO/oUw+cC3HFpB1EiBsUTTwfNRBIm5oetPtkubdomsdS9pAcoel?=
 =?us-ascii?Q?wk0R8zo8+PDqvWL6tlyo8ho9AAJdose4X1Gg01Fx9QQV0G6UxvHIOC5j8jyb?=
 =?us-ascii?Q?WW9rFtjTia6QIxfdXA9Ka3EgI64Ys6cOBLzT+NJztUjBoQm0BB+K9nGMmcVM?=
 =?us-ascii?Q?Izmh4BMddTY3XFe0teKNxods7Zc0C7nVDdOHYTMoEtup0wk8pZ/kM++VKxQk?=
 =?us-ascii?Q?B4O3zWWxf56CDmNqX+tYP3+sa55tvcatHA97NxHSMpoAStEPu7WsCO0ksZz2?=
 =?us-ascii?Q?6nO5OnGNt3id2mBw7l0WaCQtbYKDnIdup3t9oBL1nGNslkoIervA1Vjn/Yc1?=
 =?us-ascii?Q?Z7WK9T8CXtlnt28UvYpKa//UoosBvufiq7nann54o6fO6EDHRhgGQUBcymGP?=
 =?us-ascii?Q?prCJxWMVRGajSt8wjGshw/U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa99a2f-785e-4afb-039c-08dda7d8770e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:37:11.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpqAGRpPQIdaGoPKhLrUA+RDCDAWaLQChOSKIXxdaeddYlFggmtMZLWXe9xE+64dP8/tY4d0cGf5cKf+we49oS8SC1/f8roN/yKf8CB2AAbvEjRcYjh+AwYHZBhWb7E1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6847b67b cx=c_pps a=S+bK3CcnjRkaVKfFm0nHhg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=SF8dohJSsYIBP11I8NgA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8DCSPzkYWPL42UZU9u82f1rJO2ZPRqsq
X-Proofpoint-ORIG-GUID: 8DCSPzkYWPL42UZU9u82f1rJO2ZPRqsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAzMyBTYWx0ZWRfXzQi+i4/XeLjJ /71c6fTZiq0iRHmBCmexmYD+0UtcDTrpItQ5pz7ZMmjAcL/BAlZRRMB1wWJAKbesrSUmhq6CMve fDY44ZnAz6Fnvh/sMQ9G4ExEqDPsvZJYPZaNOaY3V3iiviv1ILdijoxK7xTwA1krRcyVgXfXDT3
 /mLeUiLZ3QKrWt8GWXroFveFTS6MzJvaVvOp5Q9xvoHwREgZskwBjkZVAs1EP12KU7h7WiQhmDg aRioklyCTTB1qzX+wjlfxHV7f4DALY6OR3OajfCHt1Q7kbFSIanlC+Cl97tAbUfmwSTcoWhjSRq fK0bWneooGmzVuHXzhSDFIDzCicuUAc2UQcOILKSWzInPbXIGT5NY7W5a/K79Y/YZB8s4xjkArX
 ZB13wU5SlO5mlVxTPBpEX8yMS/RGW/KhgXkDygjrfLr8IjHiti1AzyBugKJz68zHbZu1wAhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 04:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218309

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32858 ld segfault on fuzzed object
We missed one place where it is necessary to check for empty groups.

Backport a patch from upstream to fix CVE-2025-5244
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0019-CVE-2025-5244.patch         | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-5244.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index c3a597cd7b..5f4da14f6a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -41,5 +41,6 @@ SRC_URI = "\
      file://0016-CVE-2025-1181-1.patch \
      file://0017-CVE-2025-1181-2.patch \
      file://0018-CVE-2025-5245.patch \
+     file://0019-CVE-2025-5244.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-5244.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-5244.patch
new file mode 100644
index 0000000000..e8855a4b4b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-5244.patch
@@ -0,0 +1,25 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 10 Apr 2025 19:41:49 +0930
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
+CVE: CVE-2025-5244
+
+PR32858 ld segfault on fuzzed object
+We missed one place where it is necessary to check for empty groups.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index a76e8e38da7..549b7b7dd92 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14408,7 +14408,8 @@ elf_gc_sweep (bfd *abfd, struct bfd_link_info *info)
+ 	  if (o->flags & SEC_GROUP)
+ 	    {
+ 	      asection *first = elf_next_in_group (o);
+-	      o->gc_mark = first->gc_mark;
++	      if (first != NULL)
++		o->gc_mark = first->gc_mark;
+ 	    }
+ 
+ 	  if (o->gc_mark)
-- 
2.49.0


