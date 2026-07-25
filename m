Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E21C53209
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 03:52:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33829.1784951516426368773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 20:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oiezaH00;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=166643924b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66P3ptcQ3192368;
	Sat, 25 Jul 2026 03:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=CGHBc6KlLNZGIZLhU2FY
	l8XVcpCxwrtkgF/h7eGWswk=; b=oiezaH00+kPDdU3cgI7q4dzwedD06Lk52oTg
	SrlmgHGj0CR1SJQTjzpbOwFaWnggwV5HHmBqaNzQZnBwtePy4EzjrvMfCl9YPRIO
	XhhBcantcigVrQkOyCFaPqcvbZt3oRr17FqaMyG8hWHgNI7QDTxvGiUGLFpbp/vj
	ORNaxBItSbpxTHD30kYo/pRCOYywhC5FuRmPta/9X5LxUBbODmHrSGY+wq+pNUTh
	qIyLttNj9ihZ2BvNKtn2YMd7eXduxxwB1xFEN2LYN7D2Jy+9tkMZ9Jdb9XqklC6W
	wufK0OXK95kqLDfxasBZ1JaQdUG2L9dNmeKJRjcNZLpTu+H5aA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012057.outbound.protection.outlook.com [52.101.43.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmm43r1pt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 03:51:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J79jqSMmhdGMVLyKBjHwqiELl48rPGgftPzz4gPxTWgGYbet+NcRYx2nFQ6H1MZAUDyP69FDe4t/RrmgSrvFytY6/h1/si0Yx3P8Xpofzx+peooW/5OiEWpk0Bxy7vf1w0piD9wB2doaGV9uAN5X4w/d7q8c16SyRi4rggLD9i0FeUVwuYiq2tLrYsQ41xXqwTxe7gMdEKEsJQTnHHyNfAxz8XlJ8zHrCTEFA3nj2hk4gVWvULtLosjb4oUqMhxBJobm1fdu+j44iMH5xnVPHHsMKxYUJr7DM/wOfP3tYpx88oBrmXBkY9p7grA3xfTmCaL4HlwpYZ9l/1E4ok7wgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGHBc6KlLNZGIZLhU2FYl8XVcpCxwrtkgF/h7eGWswk=;
 b=TUDtUG+UQZnrraDqDXMK8UMSzLnvAIz9uqOTijuWXvvS0L1MuUaalqzcx77qj1lQPuxRqkBYUOvqCF5caw0Hou32OvTTu7V+jIJiCG1uVvCwEUK3RWf11IpjhPosWcbv/chpwSJ0c583DlRF8FfRuWAOcvQWgdWXkeHn+ji5qD5/5PjQqJbryo6wzynP6yQR7pxSri6s3rBmqjUfVNIoS6tp7IMMcbI8tE+7LvLxEGBu+huy56DDUR0C+g/wnU/9xR+KcKCTNGQCSrk4vTPdZe9dwHpV/+1AqHWMaxZR6u2m7tSJUVp1B6TuQBa4QDlZ5feOnjD/MlTXF0QdXsP/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sat, 25 Jul
 2026 03:51:51 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 03:51:51 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/3] rust: Fix reproducibility with shared source trees
Date: Fri, 24 Jul 2026 20:51:32 -0700
Message-ID: <20260725035136.1260408-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::24) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 48695231-cca3-4782-a00d-08deea000f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|38350700014|6133799003|18002099003|12006099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	WCcnAMpcN5T5w1ro75FkGa8MwUVRal6/7HS+KHjpRkwQvfc5isqPp4ooBMBevECJFetEcCazUtKeOKQzZ+TbTUSlyGi+T2UqkZRTpj7umVvxi7Rcijr9FJ76OA6iCdyzR70QfL2B8TDUVPeKmf0ePDkA7bhefPxQNZa7kdoHyjZoMhLBkNG7Rav1IVqx6nsEMPpNtnB0fe5VqU6xI3/MneMFO2kGuq3nFQmduxWJWnICB3v0IkDwKtfxIg8M04HCOsU8/MlsPwdSM4bqBsyFsiYEois7bDBXohoBWLEJ+TZ6fpewifMFBoCOOPuHifhoFqJc4v7ES68vteQJYJZ1TIpgeVDqU9XdsjC1bn5Mn5D3O3hDm/zFR+rosowJ8ZQOqHVYJ/xu4nqegnwg/wU/nCNFs4iFdTpDH3bZMHaY6pYIzGyKgVbKxRg93BnzdvQKQRMXHd9JeG5dTWlWVxqmFb77CSVaJRJu/b+HxSi8ntwlBaWpMFqNOsE7o2Z4VTNfxnFSTFTyOVH+MGKuwSAcbqi779xeDsTos4qV94jJWheNZ+2u3e9r2dbFnFkCoDnJSvPntKvt2eb0pqxAtEe1IjHMhaS8ejMjkAC+MLFw5X/ruyEvxXRqldJgIpSTuT3jfzTMRXrYeER01o1HYZBz/DrH8bgvFm8kuzpH7/AJ93E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(38350700014)(6133799003)(18002099003)(12006099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PryYa/BgtihgOkV3imSuTcEDQnRV5iMBG/BipxViYgQvwZKu6zGlEdlynOhU?=
 =?us-ascii?Q?x5cb8/OKBX8biiCLYNFOXURVWdTKUcsZ+EFMvHTOCm22sdVillDdpKHHnhsn?=
 =?us-ascii?Q?wfL56DaWnInjQo9+TclwJD6WliDqTKw1e5w6pR1csYSXm2e6+vwAEXOn9dMs?=
 =?us-ascii?Q?oopEkcSWF2hJ8/kBgJDUDrNaG2kxHmtBDQK/RRny+BRRNdNoV9mPy/5HsHuR?=
 =?us-ascii?Q?n4Q51TplTa//tfYWaO4Ivm79vPLCta0SHk9COQNShqADXZ/qnMb2ct+YlJzB?=
 =?us-ascii?Q?Tvk5FPRCcLCwYdkzF4c9IHd8hkpnyCrEnx8HTrDYRlr0Mf8YJsBVbAnHawDw?=
 =?us-ascii?Q?4gsL+sXZtY8729TpVVz05tTui0yBTfyNWIGBc+Efz0qpCjMau6iGPQ3eGR9s?=
 =?us-ascii?Q?asRGbWQM/B/V/OuYKgiuYWAijJJU9tTY0iUw+eto5mOQaRATMYe7y0ITdtTr?=
 =?us-ascii?Q?W8cClnqd765effPcnndHvYdx1cnWAMUaINvSD7DCvnq9W4ZsyO9wTL6RlzDS?=
 =?us-ascii?Q?pLcs+//Alxwgbj1DhZxUeCq1Ay39LtMLLjiiwpjuEHqtk9o8z3PgZcT2lsOD?=
 =?us-ascii?Q?BDkwDIDcfzcewjL58wawpv303coCK2Uxa7/Rh2oNEM8YdHxgpilsypRbCbkM?=
 =?us-ascii?Q?wAPTiy5odjuDT3VqYnfFQPYkpgrFEfO98z9gh5l+SWHlYNEPWbQTgmGOeI5f?=
 =?us-ascii?Q?COKrFN3bEXmz6EtHJGIAZ/g1KwWvBVLClMpfD+aOnB2Iqy315MJ8DgQ7oLUZ?=
 =?us-ascii?Q?xah1bBMTeQe5Id3wJ+ZUQFs9yn1A3hFZ8zF7Yo8uhcMt1YAj4U4dSvemM7vI?=
 =?us-ascii?Q?rkPdpciPhiGWWYYUiW7qWvVEc2b36xJU33AVXdV3fxEkuUNV6l4T7hbi18nl?=
 =?us-ascii?Q?mJMQ3qMN1QCzqUuKgH6BBt5I3EUxbSdzI/A39GQint4JMldrL/JcbZLtcGvB?=
 =?us-ascii?Q?BrzmujoTDZwHuj8xKZv6hEpWp6jJslfsbykftZilEXsp9jq0MdDN7tvyLd4v?=
 =?us-ascii?Q?gjmjeijUXG5QfFA8n5iov793VPTsvatdViLecshAo3q9SeMa0BP4KFoUoEr+?=
 =?us-ascii?Q?Ywta1HyWf9A8df0wqfXgHnUpkf0eSfAzG/W+r4et6OGPhm3OuP0Ai4801Cr8?=
 =?us-ascii?Q?SKcA72uSZkRWyqsF6xQnmOEYB5rhst2ekcCg+fK9YyScY/URqQ8U/Tboqu9/?=
 =?us-ascii?Q?Wp/95Qk6zPi+mK4QfTVcds7Q0pVpycW4OIcdiltltLzLDwKMShqh9VD6lwdZ?=
 =?us-ascii?Q?DX+lFFpOyrNSJKYUeVF5tqyMYEvtE1Yt6vIEPMl5VN6RtJIwIY2OcuzrcwFb?=
 =?us-ascii?Q?rJYlWL869JQshH7DIarJHLfZzU250l8q38FGkSTxxwyPolmsM5QXTgoM3U9a?=
 =?us-ascii?Q?IKrQXuBxvD11ewse2PBubKGJqhAM1Z5EZJeH3umOUTIK59JpU0HADt5r1OI8?=
 =?us-ascii?Q?YV6Zhr1qFErWLeIEGuBgRysXLQ/jLwB+LJ1Cpczu0G+dJ2Tjcy4wmNMRzO+2?=
 =?us-ascii?Q?Ie+21GKgPzPpYOa+qJavhxTDDYEWpLePXPxVPACq8h+tfL3cZex2LG6BpVvm?=
 =?us-ascii?Q?kOyLMxmef7Z1gGoN4etJ4hL8wWA0ZJoe46yasNEuwbkfRRr2iZlo8vB1eqcb?=
 =?us-ascii?Q?ZlVV/xBM52mksO/Bsi7wLGT5C11qMnP64FwMlWZ7eq8KcApr45x95Itxa91G?=
 =?us-ascii?Q?5Lnnz7PwxFfHCjV59pdyBDRT62xhbCWIyT+DmnFLqO5jad6RDGUNrNozWYJk?=
 =?us-ascii?Q?9/V6GohJBysgJ0db1QnZjZEz+W9iWgbvt26BYsBVHxI460yIiv+u?=
X-Exchange-RoutingPolicyChecked: 
	KoZ6wsqBc0xEJj7Db2xZxsEvNwS1Odtkv37ZrhpttbTBg16WRgLr2mv0JIxqaEDx4G+WgwLNUJurOCR5MVOI1Kh69ochJNAFdjFqxeG5+Nh05Q9cBstwPOaUkcaT480udFQ8820QYoJo307Clo7lLZRkxnHc+/YooL4uHQoTTCZDkM+LXg++CmHVeKpeywoyhNkxYu89EXPcp0wjmavPTrJD5f2pTpNC0BpWMpdicUDXdvVtU76Hlu7jMubk/g7eoSx6Jy6O4Vy0DdqxE07TqJG2itST1qCGd+Cq72EbXlyoX4wSuOv/PVQoLxw66HKx2oBFrmBzmDReGkh8qULylw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48695231-cca3-4782-a00d-08deea000f44
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 03:51:51.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYmPpljB5nUdEyhDPkRTZFpYUnRf4ADfHhMj5YwfgjhE1ofcmvAhK/CVIh3lpWnTMrVl8nmSQ0Ep6vIMCUFLHX1YNNZeIm8VWDFchtL2fqsdSjEOBk3CiVoqgC0BPnZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-Authority-Analysis: v=2.4 cv=I/JVgtgg c=1 sm=1 tr=0 ts=6a6432db cx=c_pps
 a=Y/Y9x3HtMOqQL+YbCjVQEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=XTdeb_U8USiAPbms4-gA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2MiunUpbCTaAYXApXJKvO2OVBsmUjNJd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDAzMiBTYWx0ZWRfX0TGXkOw9mLFU
 2C6ififwQf01d+Y8wIB66TI08TFvbyCxAYc/vwWwT/x1J6/AMUId828cKqX+RMYxUv4z7B+MT0S
 lkjlopmutyamX8dOJVaWowuOsXmSoMEPUoR47+4x+NNtAFyB2fJUzURuRjngd3P5W2xSNOEJS5L
 3potXlEvYKd/tmWm+AY5p+LcyHHLbEyVNFbyx8N196bNk+ZCrG+w7hhjPGizK/fX78pVQjJoLCl
 5XUVnmIcNM9LggPcilIbtyYA9vQjT3t8NyoBSZZVJi6rWTKstJlf41paCSYKika0QrKxPHeKL1+
 C1iv1jq6BV83ggRogYYMKYd0Ydmk5GHfOKSKatFXF6zil+ogBCXMlDaYQrJ7yhhqZkLpJVGmNIo
 p+gAb4R+Zj7XfSji6YqGm+g3qvonrt2a0ZK7OEwvzJdmpe+7rM/K3o6dFXV8FU5d+phNyQ0L8xH
 Cu6XOx4esRX8/jJUwwg==
X-Proofpoint-ORIG-GUID: 2MiunUpbCTaAYXApXJKvO2OVBsmUjNJd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDAzMiBTYWx0ZWRfXzyEHeQqrg2LO
 CpL9Mm7MG4oYxdc1PHD6tIzNz3KGObMbKyDlbm8R2V3ihVMO3NFwz+BEMPref9JKZD+kuqLDCE0
 zy0hmsXAAZwlfE3/ejl6A062yJYsYRf5KfYeVfMCexgPrRRjZu93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 03:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241955

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport an upstream Rust commit to fix a reproducibility
issue when Rust family recipes share the same source tree.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...ild-script-path-leakage-in-artifacts.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch

diff --git a/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch b/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch
new file mode 100644
index 0000000000..8c93624df7
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch
@@ -0,0 +1,28 @@
+Backport a commit that remap OUT_DIR paths to fix build script path leakage in artifacts
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/e743a4db62336027dcc1f1a755f4ca35f56b67df]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/src/bootstrap/src/core/builder/cargo.rs b/src/bootstrap/src/core/builder/cargo.rs
+index f785254..0264667 100644
+--- a/src/bootstrap/src/core/builder/cargo.rs
++++ b/src/bootstrap/src/core/builder/cargo.rs
+@@ -1077,6 +1077,8 @@ impl Builder<'_> {
+                         // rustc creates absolute paths (in part bc of the `rust-src` unremap
+                         // and for working directory) so let's remap the build directory as well.
+                         format!("{}={map_to}", self.build.src.display()),
++                        // remap OUT_DIR so they don't leak into artifacts.
++                        format!("{}={map_to}/out", self.build.out.display()),
+                     ]
+                     .join("\t");
+                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
+@@ -1097,6 +1099,8 @@ impl Builder<'_> {
+                         // rustc creates absolute paths (in part bc of the `rust-src` unremap
+                         // and for working directory) so let's remap the build directory as well.
+                         format!("{}={map_to}", self.build.src.display()),
++                        // remap OUT_DIR so they don't leak into artifacts.
++                        format!("{}={map_to}/out", self.build.out.display()),
+                     ]
+                     .join("\t");
+                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a8d8de7165..5678e00671 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
             file://0003-explicit-tail-calls-disable-two-tests.patch;patchdir=${RUSTSRC} \
             file://0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch;patchdir=${RUSTSRC} \
+            file://0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1a1f63818903bfc3fa8b98"
 
-- 
2.49.0


