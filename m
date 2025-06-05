Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC68C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 06:13:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.910.1749104027946672698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 23:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82513ac62d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555409Cf022277
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 06:13:47 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q3jgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 06:13:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7LbJwrx3wffk1QL39Uu3sJ3RXRPWluVq8Flor5HX6o72oysrYMYTHzSdgEbAsUfFMKHyGtcKPOj2dVOc3Zhu+7dodNcKk3R++kBM/XzxYLUSZSmKM8Jh/+oNrQBfbQ/N1KMAsLVStPNALdHlJJjypyYN2IQKIe5E/2WmRJ0UWaihk5TKTpCZQ/SiDaZQMuhijwGiY7YFZWq3imhWODWm2qzKVEZmOVhr542/ceoGD489W+UjxlvLE5om9D5GX6UB7hq1T402RdJJ3WfkDeCwcE5vaPGM1k39h8dRTtsG8iAzqsEuY/m+y+kYAFG/5e8kBYdmUoM7T/OCsTyg2tkYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjE0hpwtkyqlGbttOhGWEHRVYGB0X332jRoPVrd3P9I=;
 b=CGx/aL+ankYobsASgU36N9sf9jFeD5PXpqGCnBMjTcP8q12/EdZ4ztGzfipJlc6/xUuEiMHaOcgR+sLWT+kIUbU09depkba1Tk0Xw6hR/dI57cmbdhTNAioR76fvqPaMmvAVa6FG7PkWQ5igv10FrVP75EKPv/p6jlKR2yfZiANLGAZAsNxyz7T27mtZ3+xHmlss5lNgFsdORMBYKjpa16tfj8IHoHd5vDcwPEr+6XrfpRj0aAPrP2CMR5d7VWFOBp40I3DV66JUkiUPqeYTKnkJC3MOewbbJpj7IUF2kRVvlomuLuBYDk6XYQ63QZxUbXducslFZ2rRPp6h5PxQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 06:13:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 06:13:43 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2025-5245
Date: Wed,  4 Jun 2025 23:13:44 -0700
Message-ID: <20250605061344.2792436-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::21) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: b780c370-ff99-4c0d-ada2-08dda3f81fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Xk4L1pd0sDCa/+3nTuV6uEkUrp2A2j5f+FGPIIKNzkeFsk8Vnrs7zUFTIqBP?=
 =?us-ascii?Q?iEBx+IEewAA8lQjP/tWUuCZgIv1cmdIukXEHSKj93GfeBVlKZqVMmbNGDFjf?=
 =?us-ascii?Q?O0cciuwKuU36Fj83t7/K2TaSQPkge2QZEdufdnXXhBmJF2TUWW0uZxSzYtmN?=
 =?us-ascii?Q?PiRpEjKkF5QbVX51LWvstGYPST4Px7x9qiwUzNZhioM0CLbiDl/6GsWDL+lu?=
 =?us-ascii?Q?pgGoKQSZ9rrsRSvoECcV2zfw4gWkGYmVKA457TLg6aVP0zhidLzo6wNERYsF?=
 =?us-ascii?Q?GxdDKGnuJmo8+PxqtyoMbmOuPoA1MDRG1eRVca7zgAS3cdS2GU6RY7Z6N9MM?=
 =?us-ascii?Q?a/PhuTGmdKqQY6ztnTx1Aflfl/6DOpibO3xonNiJtiAP9jcmva2/X3dNAzeV?=
 =?us-ascii?Q?HW/DKS+SiQ8GveMwwx+MyIjqj6XleDZG4sjIC0yOp466HA9TJxxiQzLhm5B4?=
 =?us-ascii?Q?shpaFmFWkaRt9kcSD3lRzqai39usVD6DFcRLKVRhI7CWnfwAtPbAO+5hhfb6?=
 =?us-ascii?Q?EjNqPpC93wJMBGbi2uM2xPtFWDMb/Tl486kEFGRw22xk+SRyWYXb9R0/cvii?=
 =?us-ascii?Q?7xugYuqidDjgmOcM2v9+FBXj7UkTs7HdYFIsLnUrH+QvvGfsTNtqtsqahVCZ?=
 =?us-ascii?Q?I9xbmQZCLyhB2AlbvJneRE+QaKxia6BPjr+rqmtLAJdjEKB5zIsqKACUG1o3?=
 =?us-ascii?Q?o++zbK/LhHdR986fJp9BBvRs+L4DyH6ewdMeI1OQG331n+d4JUO4qeRnVTL/?=
 =?us-ascii?Q?sELFYpNx14N/pdmQzj/aBhFMFUcDpNE3LfW+bSqQbJhCpBBhm+nUnCm5sWWd?=
 =?us-ascii?Q?iYaGAsXh50fKEhGN1koFZ8/fwL81sJOi23WFePT+xeofDu7pd0+vBx5LgrI/?=
 =?us-ascii?Q?/yoTaJae5zUixDggLtNOs+x4TGQpZXmgOM3qo1v3DORFMJWl7jTYg7u+wgGh?=
 =?us-ascii?Q?dHYoMKSRrl7La2U+RN5ehh4yHH3PUHNybgf7UZWSoudwKt76sQHCQqv76xe/?=
 =?us-ascii?Q?wyv5/EwJJqWKRDvz9pzCNdy4wWo0l7cal1ajiVl2nt3aZMSDd4jVUpB7pWEX?=
 =?us-ascii?Q?XMYu5Cm40v9e7Gsc7Kbnkxe15ULNusckNYIwpsW9JsYgNsb2WE9R703tdcMI?=
 =?us-ascii?Q?PLz6JgS78gcxDpRP3hdnz5iV0VDBy9K2D18hISNF0MaHqX0PN3dNfQGNiuUZ?=
 =?us-ascii?Q?SyhIrYQimj1qGq/N4Z8NeEJPfeQvj7heXOmOb8F9VRWu6j79d111tyse5F7T?=
 =?us-ascii?Q?yqqrRhMAZh7MjbWbT/g446XESjfBiGhzfrq31SRUCkj+SUXjZquuaJpSSyG/?=
 =?us-ascii?Q?+g7PzvZOsJbETdRRiQnxIYpR1t0ttAoU2YVb8hHYS0INXeIhv9nTrUcsDgIG?=
 =?us-ascii?Q?iySVclVW6ugMHn7b/ZpytBaxEMlRfRSKE3TekjvEGtihPo/RMTyRFncQooOa?=
 =?us-ascii?Q?RjbyhK2IwWDDsdSZC7mfK3kJhngQDOKb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h1qGCckF90FjVnz6rA0/UDDl4amVCGiw7SrClAS03GgG7dlrrUQ3uL+R4fks?=
 =?us-ascii?Q?ah/VMqRh+hrw71QdxV4sLl+MUJ+jsngsOu1l8kucACJi2sf+mor8afc09uWe?=
 =?us-ascii?Q?6mFtrHRlkYgOd7/vqUmPSZn7qg5MRvTjEF4alPytuzcNIF9VQiBP+rE7gOJ9?=
 =?us-ascii?Q?8APnJpqcrhZUINad0nM8PJswkMZNkZ7IRwiiBADm80ppXQMOAotzFv5CjPlM?=
 =?us-ascii?Q?I3GRnhFhtO+ybleB73bOpyKLfTxGkPAMOjRtc+Ay/rnd1ayuS5ulUVaO09uK?=
 =?us-ascii?Q?rjWRnz+m3u7mqqXPtrksHlZCWEFAm9Qw2nUjEkmGUcbNGPpbgoZQ+wSRB3Dr?=
 =?us-ascii?Q?Atz9NEh2x1LfiW0j67uohERVr1C5i58dAqGrGSiabrSPpImqadeKfA7vXlwR?=
 =?us-ascii?Q?bKTw+1aJb2CvfIE/r1ldvU9P1WBIR3/7PPxG9IJdh1tPmuuNbQ0gRBZGhttx?=
 =?us-ascii?Q?/0WA670KKviODYTUDWBdfE3YGl/PlR8MclqQCmqMIgzc1v6PbXYpOiYaTgeG?=
 =?us-ascii?Q?4f4tUIofieDrHzgeJLz8FjlnLgtg26N9h2zme3pNImodtv6DmVXToLI7i945?=
 =?us-ascii?Q?SLIcGSsclQ6N/9m15J+z2Iw8lcaAytO0llieMnB0HUWgLcd8nOZduNtHAkVd?=
 =?us-ascii?Q?cUpBcEQ5plHV8p7zsugKWeRMtRcVyQJ8kpupQB2mBuvDDdwjWaPdYn33Bu8d?=
 =?us-ascii?Q?55gj7W5NYbefUMRtjW/xiAU3AMjbqvfR24NEeRjH18kZRPBihEd0aftXjaxC?=
 =?us-ascii?Q?D/oo9LCjl70wEyF0DeX4lzl4Z+PMID+pPuS4iYqxq+dDBhUwIlsI+TyUlV9V?=
 =?us-ascii?Q?e5nmhjmNvWnJ217AQD2ZSF2Jh8e+I1cIpX7B4AhNuGS7YLM7jiaMLjiE2gCx?=
 =?us-ascii?Q?UV3L+C1RSNOYIQmRWxr5uQAVSJkSuihj5m98n0cZX9Zw0SVVTmmwUcj+p7hi?=
 =?us-ascii?Q?B/yNIwmH7bUYEGOt25wPDi0w6cb1oGF73kT0yThMLYw2hsJrc7xVSjo3DkYB?=
 =?us-ascii?Q?WBXXQug5AT/WRcobzwHEoge4GBZK2jtxmLPNBLGzlDU0kSNmwtGUzwsJ/KUP?=
 =?us-ascii?Q?RnRhr57BgCTwiTcCJAjJmwvgh42EuSI9bFcqpgJKkBVmLVCEoQBQ8TjkpNgi?=
 =?us-ascii?Q?hukIl8BJs00Flt8o1mqTCZ6WakVuOznA9niuCUCLXXWbampCJ9kwzXMJ7rdN?=
 =?us-ascii?Q?dv8u/BZObn7ds6hTfay3P7/iOaPbmOSpG0H6Cg/L9iUxEftZEVti6vAoqGab?=
 =?us-ascii?Q?RsjRBP+1Z7hkNvvuWPafwyMneJx2pHKhNctkEGzU/6/NaPQcybkadREkLdy6?=
 =?us-ascii?Q?IT6zs7YQW/rMmOjdikxRL3PE/c4BuLp2ntFS0Z7waWQZQ7VVcs9yvUNnJQe5?=
 =?us-ascii?Q?+ECe48T2haLIX3scyDW6YIX9ed8ozDPS5Q/5OyVAYRlY6bmpg1OkEvPyiHhF?=
 =?us-ascii?Q?O3k/EtOD2H+QEufSVXJGSELKCDSc1zeYPJK3WIs8PsuYBEV1Fcbo4d7UbKox?=
 =?us-ascii?Q?ygbgzXdjPl1MdNK4bw5CE7tRMH6RUMRDT9wr6g4tDD1eKmYSvbmruUsyHNZc?=
 =?us-ascii?Q?3MJE31NEnQ/WAnVMO6IIw4UcpK8+19eoFm7/PcjOo+98ElHqojKZhOWGjk/o?=
 =?us-ascii?Q?KSAazJ4mR/0ugZsYQhKPQxA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b780c370-ff99-4c0d-ada2-08dda3f81fb2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 06:13:43.6500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz4+MtKt6LXtxdQg6pHFxzPN9mXIHeXt9J8/YVmmIxSYKYZMh6fpqf96NGnB8tlQrXlHdDYVahe5Z8CPDWmfgd3Pj6rHcThvjc14fOx22IsnXdVt7Y7f7cFtyoPN0Nze
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
X-Proofpoint-GUID: AI8C8TYeJMmMNnIeM4WetiVZE1E1Rb0P
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=6841359a cx=c_pps a=oWf8pMUGSF6ymmcrJseIdg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=G7adr3sDebAgiyP3PKIA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA1MyBTYWx0ZWRfXz2qk3s0vH3IT vmm9fU1FguQQoplU/w5TNn6ZaktRwTg5GrVgPcZ5qp3+99UJC1HrT05sHtVIpp1WhKpoiQ10cOS AejMIe8h41Zyj1bbo/01TQWfmE+PDUVMBcVCf1ldbpKuUN5TTwXOBSKpBaPHDKOKn2aMtiNPr0n
 tfo5U6lCcOeHTz0rMeHKVkaI7NImzA9ww03omJ1HtTBfU78VTmyprvh8xYiWC0fOMzaDvgcBIQh cAcuzNHukhJclhoikzOQ6zxQ8Sb867EcT3T/ByFo/ZX1XqmUklu/Sdtwck1iRAwS6Hq8bXPjN5n V6TNPuxcYUHQaPdxHTev/DG2IeBfu+XXtaNSSYjoGXRN/wgtos5Mm1mlcZewbWdpzgnf0tRXjoE
 6hvZm/l6dyI0a1aJVc8BA8ZIj0FQYPl0smygfgkaYKns7AO2GcSEiTj6Ibh0zYSM+Ge7EdsF
X-Proofpoint-ORIG-GUID: AI8C8TYeJMmMNnIeM4WetiVZE1E1Rb0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=839 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 06:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217987

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32829, SEGV on objdump function debug_type_samep
u.kenum is always non-NULL, see debug_make_enum_type.

Backport a patch from upstream to fix CVE-2025-5245
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0041-CVE-2025-4245.patch         | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0041-CVE-2025-4245.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 01fd03d2f4..d89d3eef19 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -75,5 +75,6 @@ SRC_URI = "\
      file://0038-CVE-2025-0840.patch \
      file://0039-CVE-2025-1178.patch \
      file://0040-CVE-2025-1180.patch \
+     file://0041-CVE-2025-4245.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-4245.patch b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-4245.patch
new file mode 100644
index 0000000000..2de6abbe93
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-4245.patch
@@ -0,0 +1,38 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 1 Apr 2025 22:36:54 +1030
+
+PR32829, SEGV on objdump function debug_type_samep
+u.kenum is always non-NULL, see debug_make_enum_type.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
+CVE: CVE-2025-5245
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/debug.c b/binutils/debug.c
+index dcc8ccde..465b18e7 100644
+--- a/binutils/debug.c
++++ b/binutils/debug.c
+@@ -2554,9 +2554,6 @@ debug_write_type (struct debug_handle *info,
+     case DEBUG_KIND_UNION_CLASS:
+       return debug_write_class_type (info, fns, fhandle, type, tag);
+     case DEBUG_KIND_ENUM:
+-      if (type->u.kenum == NULL)
+-	return (*fns->enum_type) (fhandle, tag, (const char **) NULL,
+-				  (bfd_signed_vma *) NULL);
+       return (*fns->enum_type) (fhandle, tag, type->u.kenum->names,
+ 				type->u.kenum->values);
+     case DEBUG_KIND_POINTER:
+@@ -3098,9 +3095,9 @@ debug_type_samep (struct debug_handle *info, struct debug_type_s *t1,
+       break;
+ 
+     case DEBUG_KIND_ENUM:
+-      if (t1->u.kenum == NULL)
+-	ret = t2->u.kenum == NULL;
+-      else if (t2->u.kenum == NULL)
++      if (t1->u.kenum->names == NULL)
++	ret = t2->u.kenum->names == NULL;
++      else if (t2->u.kenum->names == NULL)
+ 	ret = false;
+       else
+ 	{
-- 
2.49.0


