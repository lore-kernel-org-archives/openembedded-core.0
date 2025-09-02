Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33856CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 04:19:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.69772.1756786782773816548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 21:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dLPAOaD2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1340a52698=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5824Jf7p965842;
	Tue, 2 Sep 2025 04:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=EYcP9HSa1
	v4jRD2y7cvftTexOazodi+uzpiJHjnDy9s=; b=dLPAOaD2xF/8U674UhmpDaKQi
	YSv7LydhsSfw6J9NYHxPgNEArTAhiuVugSttVHydGTYzSBSIR1WX93XU+AvdlVyK
	ilWWc77M/G5aHPaWsSfHPkciKC+FOkfxkZihk60sd6MgVETQGKg3f3wTz8GGrEdO
	zNP2pxEmFcmi0NVVXNL0a0cVPA/MGeysEqz9t1p/WW644Q2XrAnui6a3MhJBlqXD
	bJjdTHNyoYXVoP1GUo/TXNfo28gBO53eIvrL19kWe4PiUxahVjehKRwyO9FiADny
	JvGanXjnDHRFn2DcB9KetUUD1aMDzoKPXAAJnZ0/ZQYbxe7x8/Q7n0JEKKXqQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ur99t85t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 04:19:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cs3jujERAxypv114wF50p1iVw2dAd642zRSwEkniXoBNqPc/3QhZXx08AQl4KMB/SQBEksHSqiBCbz5HcJJiIeOr0etwtmYiqHbBwU1Vo+wHk4TSTY3oCwgAhuofFZOVY+zT5Pra54/wAnTEQp0rBWGYVKPmyB/Nz0E1qlAlhGL3RSK0znKnSuyia26V1ZaqBimpiiStLLRSuBX74atMVGG/6/Em4p3wjx3WCb7N3Xtpz81tBQFpH0DXbocXi5feRtX6qimYKX3qdhB7poub9EsOi5U1vMpd7l1BqQWT1BVMMhFsb9hn+Ar530UKkhojIVLHCIC3LMs7GGm041mMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYcP9HSa1v4jRD2y7cvftTexOazodi+uzpiJHjnDy9s=;
 b=QVyz6QHaXk+XwdgYZWSu3Pap3aG5i5BPPpzBjs5CPUyA4I3BCgo9Si3kzbebw5NM4elvYjE3rA17LjsAsyE/YcGhgrU2/Sr+jO4MoHjN1O5VBmTDudiVt+9YRNystsCVJVkiBqPqw5nM+Tq/47voQc79QD40yh4VrAWKoSTZThw89TT7xmy9uEJXglv6e5ABR0sIWz5Ckf9THt96tNj1qcNonYqNSCsMrJ1IzWfAnkcIHWdZkHplRq7DBWgW+f2eaeBg472ljX/Mernxm55vHo5le/ccPnC89ukbES197cFv2jA49hM9qxxWW22mFWacZ1kLkG9hVF2i4mcpino5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Tue, 2 Sep
 2025 04:19:38 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 04:19:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] oeqa/selftest/cases/gcc.py: add libitm to default installed packages.
Date: Mon,  1 Sep 2025 21:19:19 -0700
Message-ID: <20250902041919.2133637-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::42) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CY8PR11MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: b388ca76-88e4-4d40-6e09-08dde9d7ede2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LiEmh7Czt5HbIGw8MUqEv7hMiAz0i+pZMmTc5xbfl1erDeqHDuM3/z04MLr3?=
 =?us-ascii?Q?AKrfzkresVJRtsVfvUgUPGaqRyDGz/DKd0r8kS96nesgyQ3FxtpRsK+IMSgw?=
 =?us-ascii?Q?ywIhYaDhFb6wS0N2Cqg1x3gVHxSPIzT8z9mOUicirgOJFd4RnSsDQKoYxupx?=
 =?us-ascii?Q?ODHdYCLtK8u2MM9TFpMaszDStEcwRPb2b/+D9nhaoh4AZrtVQp86bacFvosR?=
 =?us-ascii?Q?vvcqYUaWoi4kdA7CbifUmQ81LbNxucXjdXsrfybrear9f9BWuQhvP2ONcb4g?=
 =?us-ascii?Q?INq4F08iWoTMEB2CGWG/tQrdPGdm4/w7aDPKA/a8YbN6IGXJCJLoJnYzKdrr?=
 =?us-ascii?Q?h8fR+y47ZqRZkNpJ77UWpvyh9IqXTjC/3irgdnopiBsTHO+Wo9jb4/s4c/9e?=
 =?us-ascii?Q?VbgwoeXoxO82uUJ8VyGR52ekiwuRUwbrawNcc6ILQjxW12bst82/TbdP9sNk?=
 =?us-ascii?Q?tFPX4qTRugg01SFvCJW4W8tCJ8I7cuuYusAkSb7rVQqTsg/9XBXQMN9XRJ3l?=
 =?us-ascii?Q?6dNs9+x/hYIzhmV96UHtJqUWxjrK2UL1XjrkmMyzdhkPqJuZLSgnfQbfWwnz?=
 =?us-ascii?Q?/wABCO1Npym0yuVUr2f/VRUBRQMMrNfwSGUOC0DT7GPN1ZFSUrkYEO+ZSlBD?=
 =?us-ascii?Q?HJb2He2WxPbif0AR/cBLT3IIgm7Zvs0Kfm2XsMoqEeWNOE6OxN+yYNv0TcWS?=
 =?us-ascii?Q?dumro7RE5Jy8/OZmldhvFZC9bmTXkXO5OkNoL2PvjJ+x8gxu4PjJe46MWhBY?=
 =?us-ascii?Q?ZmOyqIWsFn7v18uz80bdvGnWOmtRp7VMsHYRoq0IWUAsSNzoAWiVZEMchbrj?=
 =?us-ascii?Q?imdnxgZergarphyTzuKr2/AnrxXGfT8v7U/ZoSDEO9IPqoAsBeP4sMfJnziG?=
 =?us-ascii?Q?5kiYmJAp5Q3f3xyjSNoxxt1wlVlr6xARQ9F4ySx+mnUSgqC6AKUdC9Gabaa+?=
 =?us-ascii?Q?7zJ04FD9jKKQq46sjSDuUWR31eB4yuI42W1Rgzp0OvDGV2vrM56ZeERF2U6D?=
 =?us-ascii?Q?cd4GqHNNVpO865K4QEg6F+09ibXyDh6vH2mYogGCBlfv80xNjWBquRp+tV3J?=
 =?us-ascii?Q?ImQJOQmwwklmFiAt2zLikQ13/7uFrRYHS7yisJ8r6j9o9sXptfEd9NAaytBg?=
 =?us-ascii?Q?3aCjwU/FP0U37PZ3X2BumCSokQ3x0/4rWd0kzqOoumT532P7L+qDZqidy6Co?=
 =?us-ascii?Q?xzmv8WMmkO9UzcJcrKzfWOr6WuRjJdny4keQOiTLOVoHvMGjXlOUAah+lC2V?=
 =?us-ascii?Q?it3ePbLjBiGPoRTTgTwwV9pM7pVEI95RJ7sJ4HFnsYg8IHoxzNkbokSwWMZd?=
 =?us-ascii?Q?C6kjZvXkcn4gSyCI5qk2U7ymyJL+M316/avzwJ8ZEyo5Cjgpjn8hdfIyxTQv?=
 =?us-ascii?Q?VG39me/oDt/2mY+kjQobi6yzRrCrMMMbszrz4GU6F5X7x6R23RQXaprRRpvu?=
 =?us-ascii?Q?yyLaP4ZrE0t6COQ3h942mHjyvY4IZc0pc1WjvEGhKZOyHovGrEYmLw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/pODy3M8xEUi98SdzoYgH3AycnXO/MCk1LfDUjp73kHRNVmiXx9V6qiLMOgc?=
 =?us-ascii?Q?p0KNEc2iOyCFqzXaXOslQ54VwUe5rJDFEAQuOwqOU9hMq+qoxmoXN/GLWw0E?=
 =?us-ascii?Q?Akoby0LPBSMqOuAWx0NgCJLV336ZKsyhpjbucG/OAKj74n5pceMyKw9c1sja?=
 =?us-ascii?Q?Jd3YRcaPnJUSUNS8lrJGjyXuNslYugtsAonpg+BrWwPF9d0W/PJwtOtj6QRn?=
 =?us-ascii?Q?QzD9oXqqZMOb7xiEuqe5glDzK4oMsBrDduwFkJgvsYC8jO22SVGCdOPhEmam?=
 =?us-ascii?Q?ftUqKkWdqOOMvH9rDK9NDQw9qJLTD6IfRcPs6R8ArWYiHuDzmR4c9aGhJ1w8?=
 =?us-ascii?Q?YwGt9MK/mvWwKN6DhCjKfcva6YdaYhbotF8oQl6qi5ZrxspWoyMNKO0hLjW9?=
 =?us-ascii?Q?mLtoALvyNj1wRWFobCfcOgp5RKcYQiGJGRnBn1f0XN3oixbxemFKAZ+wZeRT?=
 =?us-ascii?Q?sm5mjyElDTiQxT7Rt1IhLhfYhyDF2nJoQRWoHL71smxIr22OyIa4Fjy+8C/L?=
 =?us-ascii?Q?4XpOKONFkBeYM0izt+0/kZHG3UPw0eyMY10faxs2p2MHzabR2Jl8Pgl+78om?=
 =?us-ascii?Q?dFHZASMWn2PE07sFlo+HbFs/ZuJknpx+2PAIj5ypd3kFW9sllt/1xkF305H6?=
 =?us-ascii?Q?rlDFj8iivmiP/0DeSuTD7N9PMVvqvHvsSqG6UGo1TjgWYTz9+y87B1SL+Fi8?=
 =?us-ascii?Q?V7U6PSn0Ffdy1Um1kJRj3+Q+/VC0O3rtIyaFh0X15dOVkBWXRMxRa5uoU9VQ?=
 =?us-ascii?Q?6RUAcj5F4ASrd+tJAzr5kdVHW0gmGkRZ3nZU9b5yKPfE4l77pY52yXADoYvZ?=
 =?us-ascii?Q?sVpSoOwbrm0fJK0j8P3fDRq7OJiZRxcuCOu/Iwiok1Mjj8rqM0+Q31geD7eM?=
 =?us-ascii?Q?coU+H4DgbIDw/TnwBb9GgX0CW/HCYH4IzrozcsFXA8C4BpMxwd+TWb2l4v5O?=
 =?us-ascii?Q?CGqAAlaiiKWrv1bzKcVD0BsrumrBvFGlHdX6wHPusVWE5VkpNi4K65rQcFnA?=
 =?us-ascii?Q?+lH+33jbLbLyYYfr+CVrQk12a6MbbWWzjOVJ2QEI1nQxSCsrZedYm707V0u/?=
 =?us-ascii?Q?2IFUqqK0HyMhqPIGQ9rq0jzk2dRk/7jrWCPQeq3+0HNz1LWFtmiWY1vQOfa+?=
 =?us-ascii?Q?213DywXWA3P2v0vR+TznBUU86+K/2IlS1oPJxRhVUK9IaqJpjQFXt1WQkU0w?=
 =?us-ascii?Q?FC2i+CGufKP6WePoy9MFJ47bfa7IXAic0XJf18MX9gNr9LdFkpw3eWvsibe2?=
 =?us-ascii?Q?R7+2uBx9zvZ2OXKtaZBab22nSuSlCAG2f0kzp/s6JfIRYZ7QNF/GHr+Rz9dR?=
 =?us-ascii?Q?mxNpUG+x1sGkoDFzYaJzLdEPTXiEhhzEkohWk5GJYa9jd+z/InSFL5bl+izQ?=
 =?us-ascii?Q?TQnE9Wvy9iQCQ47DaRvCjQUzKBVLXwoH3ba3QC4IyAgv1kdIbxk4cHxHZSd4?=
 =?us-ascii?Q?OEJRBTw+bJjyAtogiM9nWxdImxuUpOjPiBzMS9mvIcViuJzES9paCXlPtaLu?=
 =?us-ascii?Q?uA0ra7MQlOms6SU/jtIreMdhAqQzMYNo9Q80aF8AyqpE8N/EgKQ1I9ABElrb?=
 =?us-ascii?Q?aZ0ixJb0mX+h+mn2tSSXtvPOQ5Kqsqfx99CnVEWO8ns9vdx7KqYGc+2TnIPc?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b388ca76-88e4-4d40-6e09-08dde9d7ede2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 04:19:37.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itRhHrMHP/TLXBATlYm4LDcAaNk8leCFJwhhdbQK2v9WEyRo1bT3CJfWi5uAINOFvRVnaOeXvMWFplwQrGbhVu8tgzRBcHhkguNA1gLc3wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-Authority-Analysis: v=2.4 cv=FqYF/3rq c=1 sm=1 tr=0 ts=68b6705d cx=c_pps
 a=xMIE5RCmi4zid/p+q/zqlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=up4_k8iJzWGayQ8d15wA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1cU4RyALRC_aVC9YZtHPBHoHY-UbdIa6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA0MCBTYWx0ZWRfX+N8rFLXVn5+k
 R2FoyNl1xuARHl5xcKsH2w0hbezrLGl+aOpjnxZp8tMYOjIipE5eXesxaCk2odolIZH9i+0VPsR
 jU3c80N5HQiXjzmzeD7qdN9iSFCdVrIaQpmLpHdu1b/xA5X0mMKObxGMQDAp718is0q4auHQ0cK
 UisTBXg64YRQfnjVUfHzlIYSpssFAPnhLIYlslqAX98utNQqgaV/yYrvUoG7C9IsrK10sfwOVI+
 AodK24YAbBwBxqvq2GckY1kL8ist2WeWVw0hPpIPmzY9liSS8iu2mXtY7SmNggamPEGDQmhq9ta
 sjsRz+D6iGuA0wqBIZNnUDmzC04tkVJcP945Ee5ic/eS16eRTS/fsfacKzZyO8=
X-Proofpoint-ORIG-GUID: 1cU4RyALRC_aVC9YZtHPBHoHY-UbdIa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 04:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222701

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When running oe-selftest few libitm tests were getting failed due
to below error:
/tmp/runtest.923959/alloc-1.exe: error while loading shared libraries:
libitm.so.1: cannot open shared object file: No such file or directory

Adding libitm to default installed packages to fix this issue.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index eb8082db28..d01a791cb5 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -71,7 +71,7 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
 
     def run_check_emulated(self, *args, **kwargs):
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libitm"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-openssh"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
-- 
2.49.0


