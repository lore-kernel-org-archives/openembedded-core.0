Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D2FC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 11:41:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5335.1749123699070646747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 04:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82513ac62d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55556MVo022906
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 11:41:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q3w59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 11:41:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsXKddryxGxYG5tBYq0GAdiTr1/G5hFvn8BRosH3Rqo8HgH3AU3dhmNYG1bNNG5RvuiE5p8gWcY5QWTor2UIwIs+LXQOHJgllSw/rSOunHLgSsO5dsNUvK0lxDotEMy89Qfz80w1FrC7OMBRnoJBcxx6AlIoxDIEH752PGP84Kc7T55yivduB2WVJ8Qhd+rcoLMLWMaZ62Z/4cg5b9Q3+JrNZP34JCCyuw2edk4HZMt19fa7wr6hffR6IXw/QoKZdp74qGdsSuGzd6/cLApMy1V+n3LPJeX4kIrXnGCcJtCnE+JDL0AQSX586hVCpf9kpLKURmCcbOmbyQmtzDasTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl2TNob9mnw25ktKQZZ8dUf3e9+uNH6EeLcCLLCQbfE=;
 b=pWMSrvExocBFzBaKIsksdj4M7TWqTfmV6amg1rKe/cZtozIkjT9T2Z/SBy7QZiDuCqmUf7wsap/fHNWC+CwFQTcJdmTy48d/2nZ2VtUYRCJt8POtwq54IFPGkMyRJpt7Ercs/J2k5iHIalcztAO7PJo4WtKnX+T/TJkunErsh8cS3jrou4VgegdJMETeXr1+946u1ydvXAfPOaiyDHxILkB+V5HL9lRN6BSUcOTKyYut0gN/x/Tuy3TKBtowkoZZQUBcjyuE9Mzg5HosfZjqRM5o7wdPOX9QGWW3wGNqSBNo1Nm/TUHF/J1MUCKUizhCeAHpd8MoELoNOlxIJwhwsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 11:41:33 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 11:41:33 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2025-5244
Date: Thu,  5 Jun 2025 04:41:25 -0700
Message-ID: <20250605114125.1325077-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH2PEPF0000385D.namprd17.prod.outlook.com
 (2603:10b6:518:1::6b) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM4PR11MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 22de3c6a-8fcb-45fe-9912-08dda425eba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aoHCu6Jb5NWd3DqTahjcE3O6rvwOhv9X1T0De1xGTVL3H6EnT1WLfta31ycl?=
 =?us-ascii?Q?Zw2WlvEWV+QHRTrvSzIfIPzt7I+cO2JWnxJHND6uc52xgRyjRMM52ls3q4k1?=
 =?us-ascii?Q?h/6Xm+K+sc6gXqUYwC/28RuPzpMMIukQOvGR9YrtTJsaHG8UK8sjW/iCbvZX?=
 =?us-ascii?Q?VMFAbA1YDkestq9ljOepwui5l3hIteVcBAhhwo7RjC3niUy5FdUGW4BRXp26?=
 =?us-ascii?Q?uHMzD2KHPKQtOPKCm2jKU6iKJwNpIpllv/05YyEJqEY7t/oFM70KZ3fYho3a?=
 =?us-ascii?Q?8mN/wU0DaCHCxoC7cLVdJ7xvnNHcjRmSAoVzQdlSWi2XwH+vLyqcrinsFfws?=
 =?us-ascii?Q?rRyq4KvzPJe2rC48X1Y6YABdIkLOz/S6Y0CNqytXBMfX6DULkQblcy9nDHJK?=
 =?us-ascii?Q?6yBuNY9frUK4v/87WdQmdFeXJe0DhWbR2c6vs6CYRPfJ2jVnOzO/4avgSPED?=
 =?us-ascii?Q?6YzJJ4q1PkK8YUKATdOls9KMs5HTYrKopPVip2iLFz3Z06KlZAjrK3NKsDO8?=
 =?us-ascii?Q?81207SM2KYssYJSS8E6vcbXAdqaK4AnOdQ3hTi5CePZC//gPLDWceJ70efB/?=
 =?us-ascii?Q?4vH7jngtmkkzW8zysnYueXCnIUytDkgD9LeuhC+fQEk1shjo4yvr4FjV0KdY?=
 =?us-ascii?Q?JXUsKwLPMkNbnUjphKSy1HJAAmSNqczIsOCmFkaXP9EfKJ4423s55KHn2f+S?=
 =?us-ascii?Q?D44Yvrhti4H+ja1nnQUWsFxIo94YtwBI97S4KXDpDeJM27CTcZ0DgI6oqQFu?=
 =?us-ascii?Q?f3uYsTZiph/l7PdJ/m5ODTnAglbH8k/aRwxcSzq9cTns7+OhpHZmvrY/dMS8?=
 =?us-ascii?Q?seMAlarCSzMg3X20A0XoBXsIX4HkBHnmfnRWc4aZkDvCmNlHlWN2AMPSZvNo?=
 =?us-ascii?Q?PTVD103msGhG9wDg5JVuk9G988mlB+oOFkGye1rnhudYpnWJjOBkNYDbRA4S?=
 =?us-ascii?Q?QHsrb8roPiU7y9FYNUj6fn94dnz0Sv6Q1Fcdt251G6/IVSJXGIzij1smkdA3?=
 =?us-ascii?Q?OuClAOYKr4EeWmk+wDnlQbgFGjmRbXFdMHHWa1EiPVHYcKVkvTbNcMjOhPwK?=
 =?us-ascii?Q?sU5UvfU2pHtwNhxOluWKmPQY2Iti77w3SisQsJNslAMoXTtCR2h1Z2hOfRM2?=
 =?us-ascii?Q?8YYX8UGzqXGD4Qz658X5247QayeCPT5wp78cYQi4ZcwnZiQqZjQL4BtOVfmr?=
 =?us-ascii?Q?W90Khbi3o11PrRe4zS5bhGppBvzIg6Q+SuJeK77YuyZJgTXgamfhGvJ0t1vw?=
 =?us-ascii?Q?/7QDp30H7F+MC7RNdqUyLERZdDvXUDm9+u7qH5VJMTKgxQoRVLQm8GuV3pk5?=
 =?us-ascii?Q?gZoNZqW/omM2EYPpexn3TymSM8hbom2nKQ8k92oDZg2pHOW+O8NHbflsXM+3?=
 =?us-ascii?Q?dD+4c68yyG4oSya7kZ5RmQbR2HFDv+X6iI4UNTK8tsoSXYvlVy3lersbEe/Y?=
 =?us-ascii?Q?BcVSgREb/ME=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XLTU6UM89g8vHStY5YNwLa37fKobyueHJFp/lYQsuwJog3YQq5RSOkrkHQ3e?=
 =?us-ascii?Q?Bdh4FyIxoxcP9Rpyk4TgrfBTGjhsppUP+ZvRhv5Fw2OFVocyyhXtMfHBhtDy?=
 =?us-ascii?Q?rtJZYexj9Q3YSxkVNLwWq0Zn6yUee4q1MCy561tKuMVKtNtvF4blrPVIA3po?=
 =?us-ascii?Q?0Zs/nHmUiIBdPACR4OmfnOnXwTZRJ+Yb77j7TXvliCVwrilRQ6SoxoCKkWsk?=
 =?us-ascii?Q?jA//GZuNc9qXwpBb3IT5fuyidyOToPUnSTl61O1TjJHjKsFzpLzndsW/qWg1?=
 =?us-ascii?Q?KaCFA7WZZVsYpYjDICzLkpQnZNMJqjB32hh/gnB/n8xpril7djD0ihsY7tcB?=
 =?us-ascii?Q?4xyOwlT9vgPsjgrO/J2wV2nab5xsL+E4mJnaJr+iSfzKQg4a5U+IdhIx6BpZ?=
 =?us-ascii?Q?ZlAw5/TTF575M2utTdprfF//ZQqmYQVEy+/S+q+6ubKyv17S1UmCGlF+GRiN?=
 =?us-ascii?Q?T1Yz1TeFq3YOd8ZK3ClPA3wu7QoeToZjo49WRj/nwdagIIvkO4Mmji5o2/HD?=
 =?us-ascii?Q?Q1WCGfCTFGp94ZBzNy8lRDTw7aOTPCgXeSOig6BzyTXvWFqYkpC5CovLhkoo?=
 =?us-ascii?Q?XH/NaojLzXxeJb0qG7XYKFELsRullJS2MzqFaGCn9mQSXbwQhUQ6lcL8FyoI?=
 =?us-ascii?Q?lr0/Oc/rzoZeb2mMBsro2HTOtEO8/dopBGd8K+3/L7IiyjUjTOS8Nd4RajJH?=
 =?us-ascii?Q?dLFbK1SyHFhtAqLSE3cruON5oAUDUj6wJ2L8mfluVc8fKo2db0mbqfYDlGHv?=
 =?us-ascii?Q?IWgdGDpYKr9CHVnkI8ytJayEtYI+leqJUXazliwiW6a7QH7Mkwe+W286v7u0?=
 =?us-ascii?Q?Puizrpr3xrmvucSQW11LzSeD9g4EpxOAS6lg2PiW+uufrrXOMD/3n9pfHMEM?=
 =?us-ascii?Q?6YOT5P22fr5TxQ1e38RNAmRS+v+qtGc1ON9MpSdGgU661bK1OZ1oVSp6Bize?=
 =?us-ascii?Q?jsoX8y5/Z7BqLPkdmBegX0ioMOOWPFSd7+4gOLtfqdiq1Cda4MflOR09FHai?=
 =?us-ascii?Q?OTmQiBzS5/gApS+1hH2cMz6O10Kkb05BPImga3caPzk0/jTjeKMaS1qIluSC?=
 =?us-ascii?Q?g/EXAlA2F02UoGg2BRDfYTxPUl706HjtK6K5M9bd2CumMfpZaUkd8k/iGDPM?=
 =?us-ascii?Q?oaqMt29L38oNu2dQuveqw6T97gxxXL1J+n4JoQ9uTJzoaYqhDyZmcmsNyh1I?=
 =?us-ascii?Q?WK7YROXg8lhazDQl3x2Blx+aV8UhHFeOJufn+RK/dDhkXMT8fKDAKboF3nMa?=
 =?us-ascii?Q?59WvBVUfir258Qwdx6UyQaihh1k4o+7RFAnCOmUXBV5Tp1G0tkApFAi4yi27?=
 =?us-ascii?Q?2Zr+v64FavSFgr6YCZ9y1fvEMqLR/rxuTZl9QRYxhu6hIEWgLXynDig13KHF?=
 =?us-ascii?Q?d/l6sTP9bQj9Thv5fF09XZNI478/x3y5sjEnhOnU4z4spxBe9T6t50SeSQhK?=
 =?us-ascii?Q?raRoOToXxl6AXFjOUMrzSji/SgcO2JQCVgDoZM1vuzgFFI8nfxnQGoGdDob5?=
 =?us-ascii?Q?B5yNvQ4LxMMGnOrk5SBg7VyOsGz05K53y3zSiqJqX4v6WRhcKXvGRI8n5asI?=
 =?us-ascii?Q?DBJmAlPTFeYEW0Zr16oCKij6+6wszN0Nz+FIVYwp1CFTM/0suAsl+xW/V0dN?=
 =?us-ascii?Q?p+9W20dI19XIq4AoS63YV9s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22de3c6a-8fcb-45fe-9912-08dda425eba9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 11:41:33.2393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsjbkqbLccSsXvbXNoqko6j0Rqj3ox505MDP3u1woAPM9Wp7TcyBgyl34SDH642qioOFq5RQiYZeIhlucmZDacQN6vNeyxUJZX4K6iyNyHXNCXKOdjY6ukp5j8qqDuNo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
X-Proofpoint-GUID: gmRPn40O_rAaRdLNvlzCqYRXzZmBuGX1
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=68418272 cx=c_pps a=ngScqOCEdLrCZ1H4VCpMTA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=SF8dohJSsYIBP11I8NgA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDEwMSBTYWx0ZWRfX4y2+OAk2bMQ/ kEr2CUGXlJSX2K7P4AgnSMCiFwVRWjbsz6kt92Q7KL0ye8STs0gb/d+gIIEeS2hU5/qAl+zeGk6 VmyxNuX1RLilmk2S4GKWlFqpPf+y9sl8nkgrtCdYG1vkIgiQnEHQ6cDIRsuSl5Iwl8ksdxvcGXX
 O6cgL6741jqibtVA7lBDplRVahNT8ViBrtZeIx55qFF9wB5u/W1ZZSOFXi0Yeiyml4o33Au9dpm 5/5PbYCp2YaDaEufQ4OTj6KQHwf7aWL25Wg3KvXFgkZy/u4wg3JtkuZCOgVz1KXSs3D5AzIeF3E gQFrtR5HHaBv2JO01plD56agLKbMuz62CJXpum+K9NC1klz6f2VffFTM2Ag6yzniTvU8zacKCiE
 ruplghOiLXF7SswZ/0+UF7W9bd3WdG+5fGc5NR7/XG/UXcEDP9hJXYQ2lfzptooOi9DQVzeO
X-Proofpoint-ORIG-GUID: gmRPn40O_rAaRdLNvlzCqYRXzZmBuGX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 11:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218009

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32858 ld segfault on fuzzed object
We missed one place where it is necessary to check for empty groups.

Backport a patch from upstream to fix CVE-2025-5244
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0041-CVE-2025-5244.patch         | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 01fd03d2f4..3c7e6259eb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -75,5 +75,6 @@ SRC_URI = "\
      file://0038-CVE-2025-0840.patch \
      file://0039-CVE-2025-1178.patch \
      file://0040-CVE-2025-1180.patch \
+     file://0041-CVE-2025-5244.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch
new file mode 100644
index 0000000000..e8855a4b4b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch
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


