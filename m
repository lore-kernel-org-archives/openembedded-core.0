Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264C6D5E392
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:09:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.54700.1731312566165757792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1045b46b39=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB5x83c018512
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 00:09:25 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t3w79f4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 00:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDg2mTC3pCJPq/3or6GSCIaq35ttaKjQkMWsXK4oh8gqzQccLm/YykbnmwYFRUZK+epHlAIhCOenoZp2ZhkGOzbGQz8SCVHbDkSAdrqtHlCr66kXkGbGpafj3yXr3OLiBP4sRN+gVBZxzIH8dNwKQpzd1Vh0AruL1KMvnq/pZMeK1H5yAYVkqEv7LitnwDxy9DUWmwUyJeS8frJKpt52e9WxAH340EtkRegDMm+5ZOLbxgaO3WRu80s4BxxpJYLHGYxJw1IhAYuBRyea3qHqxfzWdxdIKTEGGwIS52sesx6BIHVAZ2UePc7wa54ySkbFDoXEFe/72RBZx3nAnHS9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=im36sLwaL3aQcCsLN0nlasQeB+awvldRg3t8/jHyOo8=;
 b=swsWaZ6rimrobbnoj3vuP8b4JU+wVv2XKz3WCf6uQmIqRx41m/ZvVRhGcf96xDCCHJ3ZZlwsWx17v9ceYd36zlOxwjcjGs1eCCKu1dRYGmyGHV1WVyJ6W9sG9DaUBAIrSBwgxcte3Sz12tj2r+hEc3U/Fau8QxXnPElKmneYB4DLMBd+eehFxSjKgyGrKoU/01uTCvM90G3HV9uVCLuCgfQywoW+D41j2RLZerhfYDsSFKj0UouEXicfYpUfyLnIk41NPr+wGLXtzME1XFY91KGIZoRNMJPQSjjyGOjDsdPhClY15B53C4dbwtXDFAzeHJUA79vB9h4Ld9eiqphPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS7PR11MB6293.namprd11.prod.outlook.com (2603:10b6:8:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 08:09:23 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%2]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 08:09:23 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust: Remove passing test case from the exclude list in the Rust OE self-test.
Date: Mon, 11 Nov 2024 00:09:05 -0800
Message-ID: <20241111080905.3981088-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS7PR11MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a6eae4-6d52-47a9-aee6-08dd022826dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2p62wgnYhJQZQzP5xSd/pahPQrcprN7Ime3XP9m15UFq0etvKNYVqgEJIC5C?=
 =?us-ascii?Q?uSoikEtR30FCsTHzRa/ong9KLGDRtKYv3RboY7IsrO5/oh+yDKlttsC/ydkE?=
 =?us-ascii?Q?VFkQYsdMY5Q1BUyldOXt8nyp9CY4j4KkpPAEwstTdaBf+Y64ehAqKbSKd96f?=
 =?us-ascii?Q?OrKkjgcsh2egaQ7uxmHc0LeawQSPkmJGyYwBrPr9OgEV8zPSIA6OusJM20Tw?=
 =?us-ascii?Q?vRQG6xGCW14gKW1aJ3w3Kryy4Q6Dg3nreBOCSLCpsJ3C1OPO5nC577l8JDDY?=
 =?us-ascii?Q?s+twZQjLbZspAeZOJk22I/gym1F/RNutK3zNNeXbirMDc+clnURy6gwXTA8q?=
 =?us-ascii?Q?2S09R7xaTcrE7OkPqEBPTllQKgUcQHNjhmC4n3x3p0XvH6aE0jj6/JR/m+PV?=
 =?us-ascii?Q?OlJAIO9/QrzqQYySmCpFTMEmahlej0QOXB0TfB9dg0URvsu01uUKNPTqW91y?=
 =?us-ascii?Q?WkzcxD1xjMDQRCQDOCscihFmkNM1Fn+02m7S/DDWRfHKYg8tIgZ39Q1Rmrte?=
 =?us-ascii?Q?8GF1ozV29hhUxgm0fHOFSOKxtnwHUvssVvPQb6SdaQuR5bYXpgtKO3jZX9UZ?=
 =?us-ascii?Q?EFmCqrAxu6X0kvQEv954fmNvVwXbT8OHxqNuU0VEb4+lbisFCXKrmmkwg0vy?=
 =?us-ascii?Q?9IMHIKXCnouSN02JBL4SBqDilT0q+IZ+RgTuHzNLsmrAyd/0/PER4oGyNp2J?=
 =?us-ascii?Q?3prg7cD8i0S96hxiBd3cgVR9nuEPV4sxRq/Mj9HlH6tQn/ufCIZ3xGHqmhzO?=
 =?us-ascii?Q?OYx9q8JKKD/YaWLeCUszYW+CozgF+PmNOi3vTM1CEYajOtKmNiEk0BX3E2M7?=
 =?us-ascii?Q?anhZR3b8v9g0R1iZ9RBo9QrjaDZuY9fyLKFxL9T1NZkrtNvYfGSOQodr4MUg?=
 =?us-ascii?Q?JBXFYCA1vke3LzkRgmTh5sVlaeJltna3GHe6XokoifVvdXLkggoPMwwuRII6?=
 =?us-ascii?Q?E7PXjBMZPBrB9j3Fc2pAEGTEZ5uQFfwOcRIQFQdIVSvEq994RprRo2hOjgEW?=
 =?us-ascii?Q?XDtmV/ywQejXxHg5w9xyxUsdOQ1KRhhaxvs1OHsN+l6QbxzPxSbjpvackiAC?=
 =?us-ascii?Q?g3PmBlvEwNQ1eH8vPraVJ2CyMygGIn++Fo/CWHBE8Dww93BcdPodDmYsPPST?=
 =?us-ascii?Q?UDIPs9x/JmE7unWHXUm8+5zWtz1ezx1ANE9A12hDfH+7l9d3JDe4r+L34Fcz?=
 =?us-ascii?Q?uTYKnXuk7Vt+1jChMImDkjDaoGpSguO3dUA/871OUde1bya6ZmM7G+SQbzlc?=
 =?us-ascii?Q?c9zoc/Kyd9uhRsGqSHc2vNtACdhP0XBozthg5Kd650x72rNqrTyFx8giUK4J?=
 =?us-ascii?Q?Ry9JntsWNVvoEPRhaZE5iAgM/iUmWxF64Itpwhw4deXqyLCbDy0PuOEgyoSx?=
 =?us-ascii?Q?JZe09Tw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vevKOr8D6AD37ZfC3PpgzYLgUT+6ha6lgaRImSyZlKRL1y7KJuk1/VvQwxuO?=
 =?us-ascii?Q?jPe0e/ZhGeXPTFj1cUL+aTHiW3gzpnVWmDcTXpVlsb/OQ1GIoWP6HS/+6Lgh?=
 =?us-ascii?Q?tiZO2daC5+M4zk++Qe5Lc5A5Stl0jzT+yWQW1XD4jpn9QaMsLR0OlckY+uY+?=
 =?us-ascii?Q?bumRemOgHSs4yNODLmT4DkqgXAsotlH+eeCQQjkvCkwUSPSHLZp76jc3bNKj?=
 =?us-ascii?Q?v3JknZ1nkABpJYZna9jSfJ4oUlIF7XZt3a87VO2qxLxqJ8EMKzyHL7fLn9qm?=
 =?us-ascii?Q?6aFzH9jF42v0mh1UPUruKRtsI8S7Lxo8xaMD+RoExx3/aBxnRRgDQDFCi+BR?=
 =?us-ascii?Q?lPdj6JJLdDTSvCN2Me9WdgOdtrs9G3tJ/fmFchXoC4Z62fiQj15D5jo8NEQ8?=
 =?us-ascii?Q?8S3jb7k3hG56RRZmEieszTpjWj7PoOhRnXf+1Karv9Gc8MJQvP7+1LDX27hh?=
 =?us-ascii?Q?7JSrRqzJc+X2LQcDQcf4oap6kaFdZSOSjrBIrIZE2mybLI/prjO0HAjoES/7?=
 =?us-ascii?Q?zaCRHImi0rEp9173zHXsOd8fpFqbXobj7664dkVJYHegOOII33k6AwJBFUxJ?=
 =?us-ascii?Q?P8Y2f7D4bw7BDvCEc4ndcnXWqIGSRY4PyHIqnu3/pG6g0CDHyqGIx7Wd9FpV?=
 =?us-ascii?Q?l9vrxLG7nIyop0dmMS7VoWG15zD9yLYZ3m63wGS+jSajXXi4MB6nFlIsJA6k?=
 =?us-ascii?Q?8FdP3tHI5OMPmqdSJEu3uaVrdfKlFW1AMR2ZgU3lapTyLgG+D4bMAqx3f/nF?=
 =?us-ascii?Q?Ak9VUP+sw8yhKutwJhObQPL/yyrhNgLbNaykbHcOMaf5r2rKCtjQ1LtRrREZ?=
 =?us-ascii?Q?4q+CmwkpJH0TXBDhNvcp+xUdxM+8JNQj+SiX5Brw3b4MxTJWMrcip5YQEVjL?=
 =?us-ascii?Q?3FSokCnjYfnKcwTUoskHCx9o1IiZ+IP3uqx3CJbCNzBrvI5pTAxCoQJn6mDl?=
 =?us-ascii?Q?S30GAEaDDY+jVc8bKATzgir2rS7lrUgTtujk2qaT4L6elCrtFCMXBYwzeO27?=
 =?us-ascii?Q?kHt4zbPWzqKRX50zSHXc3Y2J8XGly7Mh1yWrR+Zp5/zr0QFhi0txgHW7O0wo?=
 =?us-ascii?Q?yve+FgkcPRqzm7o/n0tSlAJrkJB18I1jrHDUgmvFsDGAjqfufaB6korssJyk?=
 =?us-ascii?Q?NDG/C3a6CIowS2jx+DLcqFVNX5kyxp1qgCbOBDL0ws6pc4gZ+gSLq/iAcqTs?=
 =?us-ascii?Q?4fGPwmcix3gWdQNK7BHtk2DgsPPWLydRPg8lACv8+s2TDzondAuCwtBt4BKK?=
 =?us-ascii?Q?fpdpiFGo+Af+ri4DO8yMui+1p+/bTVtHx/6F21E4zfdX1LCD2E+0p2NQKpaY?=
 =?us-ascii?Q?0GQFv47zE1Ip28F+v2ZtoT5y1MuYOzjhFMUdBa/G0VC02NhpkOUjhozWQaFa?=
 =?us-ascii?Q?ZQaNxIOYaFwmtv35J0Wr55ybNLUCVQ/72oIqApTghqr5qJ5vcCHsWI7sHjWA?=
 =?us-ascii?Q?w0SHS/uSb+vkARjbjnh5aGaMgmNU3cqrm5SseiXNww4P90NErZa4mN3V+qcH?=
 =?us-ascii?Q?Oil7rjlCykjWvLnh9olhbxK2l9elRL31SajVb8ghV9zK5cAd7hfdYF5Xh9x6?=
 =?us-ascii?Q?yLykmBK4nbJ6ZpOu/7YWK440HEFsXAMcDA9L8iNbVpeW6DOIRVTPPty1WtJH?=
 =?us-ascii?Q?jkmafc7muw0L/QmoTmSFnvs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a6eae4-6d52-47a9-aee6-08dd022826dd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 08:09:23.2261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqFVltw624hlrMO+nEv/4Xe5LEncBEzYBu6xibTYE1Enb4HSMguDE+1shq+/O+x8KzKOE2gUd9qG9UghzPIPMQbDGRpJzZNlZHk7obhpfjovxKJacqjUCtt/izi/noWD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6293
X-Proofpoint-GUID: fm1egXXXvfPy3LNruJMXj58qtThR6T9_
X-Proofpoint-ORIG-GUID: fm1egXXXvfPy3LNruJMXj58qtThR6T9_
X-Authority-Analysis: v=2.4 cv=WY9eaFhX c=1 sm=1 tr=0 ts=6731bbb5 cx=c_pps a=0XndbtkAAnsFgPxdSZG6GA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=FN37IRSZsb-Eulo68qQA:9 a=-tu3t9Ey6INAYvtyu7WB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_06,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=670 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2411110068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206931

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

We had previously excluded this test case due to failure in earlier versions.
However, with the latest version of Rust, this test case is passing.
As a result, we have removed it from the exclude list and added back into
the test suite for execution.

The rust-1.79 has been successfully tested with the current test inclusion.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 010abefd16..42e0258725 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -66,7 +66,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/doc/unstable-book',
                             'src/librustdoc',
                             'src/rustdoc-json-types',
-                            'src/tools/compiletest/src/common.rs',
                             'src/tools/jsondoclint',
                             'src/tools/lint-docs',
                             'src/tools/replace-version-placeholder',
-- 
2.43.0


