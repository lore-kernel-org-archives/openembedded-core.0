Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0749C87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:12:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20111.1754467948358052079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0313fa0978=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5767e5Ll2394011
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Aug 2025 08:12:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyf8nqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:12:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0GutSIVKBM8Ibj0fX5hUDgunbF/RzrUmQCKAoXeX1u0R/7MNHGogXUmylgh5a8iE74aQhPhKPEtqsujjhuWp35bwEKZHlFFK0r2O/BkbrcAAi5sxJ9ofRwvlehRziwYwinFVdmW09c/qE4Qw9obYCUibJwIUD4770AnR2L6k09pw2vEF6HQYX9uYX5CU2SfrRfHf+VXEiW28AEWmqSJ9p8n/WxI9CI7sloEDszwH3dFeCsCV2YJYx9GfWWiE5q7lujJzsmGPXvKwvjIvec720PcrjayCEvX+n3F6srS5hQ2WAjVqnLTf49XrTZBSClDky7S35Igy6FVJKq0ucsWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fW1nGScJIO8fh9LeJSzFKgbPoLUzpAPMJjWUtwWsFhU=;
 b=SSbZRUZNduH7Rad4AP4KhatblHi/mE7kDowqkAIBjxUc9nLjbozC1XCxkXhLspHhBKRvzGlTLuZTueCQKn5coOQcsFHLm99GUEv4X2i+izXP1bUfxdA+xF1mS9T9cf+7XdMMEfmBXwHBD+r6oBOA7vCRMuAwad5stQM7crC9V0YvoQ8TLGtOyPFQvySAt/VO4XWDSvfkpbJVtg4NjHl6mpBlToGuAuiA/3eWYUdH/F+qliAxjlfHat+Nrg6Q0OjCDgxaa7wZgUb6W75rf3A/8D5YL0SrFRiaGyAgasdAleL2Ku5lqJbhJb+bjNTMSDUUyhewLyo3CTttHo1GCEzqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.15; Wed, 6 Aug 2025 08:12:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 08:12:23 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe][meta-oe][walnascar][PATCH 1/2] protobuf: upgrade from 5.29.4 to 5.29.5
Date: Wed,  6 Aug 2025 16:12:07 +0800
Message-Id: <20250806081208.2620835-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 64be7b76-7518-4204-96f4-08ddd4c0f914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9qI67LnC/d/uXvpiG/m46kkrlhdFOXlBy6o0vmdnStuADBsL0ODAnqjv/AAB?=
 =?us-ascii?Q?GihI7VxTjd8C1XQYygSqIug10FNycYjFHAgHkIqJK1zbz06IzQMvNKJD0A9Y?=
 =?us-ascii?Q?J4W55MmfQ85mx8Vijz8LnIm5ramVlwpW/R7oSHGxiVLrJmOCbVuhWEsGuM87?=
 =?us-ascii?Q?3nk8pHOd3VPt5I1Zr+AfRIUTITTNMAX/paY4BwszxeUR3kOG+FsSBzJltmoE?=
 =?us-ascii?Q?IoSdWADlg6n5hbfkySK//I9F8U3NwYOkKnpS+c3BJMUSQ2jqYWbGv+toA7Fj?=
 =?us-ascii?Q?BTLW10S3OiWOQpHqTOvFFL0ovdjWWJbBiXsE5wGSpXDmm5Qv2RZ84JHmg+Zd?=
 =?us-ascii?Q?pZZeg5VYgEsxaNESpFm91Wqn92rWRjpQWndKvRAp18YmBj589SFEgPpkTNhN?=
 =?us-ascii?Q?3l4fpvDU1ysMSocyKOSd0hvEgVHddoLowh9A5SbyPcQfsu9mc9s/n193BPGk?=
 =?us-ascii?Q?6uupoHcMyj07zx5xDi7+yT0bvvOt9I6QmnPiLUpRR2jUBHoTMScrMRnEQ+nF?=
 =?us-ascii?Q?A+8yvHw+JQ4QxlIJ/jguBCqvO/fT6ILZPTpMjNwMf4jCExpIDSk4OmDjOZ7m?=
 =?us-ascii?Q?Ni9bwhhqDtE75Dk49JIi7EWTaj12aJaDrP7er1nwrZ5kRYqqBHsa7nnATZ8O?=
 =?us-ascii?Q?L4QcIuk53U9XZQlTKA0DZU6C5ep0kVC3X2jsd4ctyMHR26RfZmTxRi0Xyua/?=
 =?us-ascii?Q?3R8LyvkoU59FjSstdKYdA9+7xvIZ7J3BGhS2SeIYm29TqLsls+9SaXgyMams?=
 =?us-ascii?Q?WnpZsDxJfrhWMO57TqerWbcbwbSbixBNLSEP/j4o8s74x16l84oFh9lNQdek?=
 =?us-ascii?Q?HNclIsGgEi/qunq3+fBulpsRX96Zjd0kXId51oBGdPRw9saYz5c16aKBOijQ?=
 =?us-ascii?Q?tGhwEtBRf4S12lxyj5EXUwBtPwB52xNmqSOhC1d89oZ1DE05NQFzUfxVqj2M?=
 =?us-ascii?Q?tnzh6vepFVy54eTLjmaJygcFq7X9PNE6r1lZHTsNUHcZYdqRq/0DGgn6oj1d?=
 =?us-ascii?Q?bYpaPPk3sX4S3Z2qMV1nvN/WyRBZkhwj99nFRG3puMFJDceic9ZeSfU2xqoe?=
 =?us-ascii?Q?O5qU5n6HS7puyIn+8OQyeduEFmI+gGyGCJ4oCsoYzEgZtzRoFVpcpQV/rPTH?=
 =?us-ascii?Q?sBYPSzMKUcJ3VkJKb6K9mazf1cZYim2fcwHYes63rzheO/FuFm/PYRlCH7sZ?=
 =?us-ascii?Q?kPMElGbXfcQ/58RGeldEm8j5882oGKVYgz7LigoN9BDi2kJH+R6tUIT6KBYe?=
 =?us-ascii?Q?VY9sJ7oIW++N8uI7m7si4NhZ8CwVIw9D9YKY5LchY7INp92gyQlr2PEipsjM?=
 =?us-ascii?Q?TvzWBGKxckdYXDrltYb48UJXPOOhU8pEP1cBeqE0+92NDAC7hQF+FRp6iXWu?=
 =?us-ascii?Q?pYYwhH2XNoH7EGq8q3F7OY5Pa6DlRKICh3z18PDb53sP9JZ40QCZVAd8tkiH?=
 =?us-ascii?Q?Kbh50qUs1xS9wPvKIW3PgcuFqg4dHjeyUMLCvEp0yhYNjJwfW0528Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1hHhOw4/W5A2zp7ASmcOxjWhs98WnwY7G9zXUN6ZziraOVMB8oC/3ezh/LuU?=
 =?us-ascii?Q?yNUvovcI4YBtZSml37gREFwzeoqbgZ1UnsfWjRCEuCATatlZFc/+W7zIlmxy?=
 =?us-ascii?Q?NackSoSNnH18o8oR0nLswTFGgeXCwoiihtQUtcRuZB+R1qesHCXFmlROq5ET?=
 =?us-ascii?Q?qgrA1mJtBgDhiMAUujklODSsSPHQBj+dxHBsmPqicp+CQTTCRtoLTMCZN8Zk?=
 =?us-ascii?Q?VfvoUUuq/8BsrP0oImZI1Q+IstbhVPfhKW8455f6yDXhcccQu4WWfvrZCrIS?=
 =?us-ascii?Q?DpRXXQWFZKstGhClumOAIZGvAipUp9vnTI+tj4TNV3OtEUqAXDoWa3XAUh+T?=
 =?us-ascii?Q?qkUZvwepxGZneT9GnsWBAWPecf5yOcH7qlKqqvkShCCnA0JugsEzh+MZ14Hx?=
 =?us-ascii?Q?4tRsvuZZ9jSLYehy1nPyWk/klr9RNtjvSDSPJxo4K/gDA1Njc4QgAat/AySs?=
 =?us-ascii?Q?DF0txvrrXXG80uXmIRjjN5xkCS6TI+V7jWkMUN4FNszWOaABh75J4OKGttO8?=
 =?us-ascii?Q?rdZTc7Kb9HSC78BdvhJiLassjV8bnAoDHgfKQXrGppQKNR42DwZ6eiN1U1k+?=
 =?us-ascii?Q?p+t6u3t3QmgwLmCpxpvnk5ytSOBb1IP+Cd/JqUh/JZGsK+mloDZyMeVYx6Nu?=
 =?us-ascii?Q?2av1KMO1ZhjtaRu4oJJ1m88I1U/6iJdVZRWDZY/4X62AWroTQO6hvJq8sz+O?=
 =?us-ascii?Q?xWNEuJ+ko0O7CvK81PAsXK1y47hk+8BH4DynVHcpE6sd+gvCWX2xQjDZbUzt?=
 =?us-ascii?Q?TQVICOiZz5UA26O5kHnR0ibI/lq1zNo1Vt4vC1HUxEbzFs70qCxzCRpmL6r2?=
 =?us-ascii?Q?Z2zLA+mv9w2aJP+Eti+pN4VNcCfEpyGVUlGOVhy8PohCn9k8fhBNzjAa7NlK?=
 =?us-ascii?Q?Nss/b5Q5vwd6q/JHoh0ygNi7SFNhx+dQN8z7vE4bivjiBzCD93WOWJmopK9H?=
 =?us-ascii?Q?Yr2ojZU+5fiChbCauyhB4ZKNUO5aNCRgt48aoyM4WS3jLEmL8fPXPXPMnX87?=
 =?us-ascii?Q?oWnaiy1jWLXIWcKSQ+6RLXllFLlM32WxaHhVbdzMmK5PnL/vnAKW9JwSGSoF?=
 =?us-ascii?Q?By/BxzSP86PpF3ECI5UmvV1EBK3+L8uqcV9mYpwrctwXgpVXTse/P7BpvmgS?=
 =?us-ascii?Q?Mf5Iri6VecHlvDj8Va7/99ybps2heC7DHr01KDK9npfPvYpCC2VZuCnliAHl?=
 =?us-ascii?Q?QXvSR/WCM+gclgCsHH7hJjsTK6j2UOk8GTcjgWy4YZXveYTI9W+6uOJUYZyo?=
 =?us-ascii?Q?0KUTE+4sLDOEvP+4KBpmibRoa0RVkF090NwsYk0QLDhAkoo2ntfaGKMzFwjP?=
 =?us-ascii?Q?iD95aAfJwr1vExpDmVY8iEK3NX/B1OrYH8XCu5kzP9IQRsPaPjnuV4uALTG3?=
 =?us-ascii?Q?tLorgqnHF1jrS86hRBla8RwoOrvl2AjDL7Wk1ZAj9ZJFPrXmyU+cVdUVmvgh?=
 =?us-ascii?Q?U3wd/3roCzJ0k23WMe1yofaRAVEFz2WqyHbC+Hi44tqwyEcQy12HjwYpKmqv?=
 =?us-ascii?Q?1t7mJnUhFZuzqHEYY9HkhObbech9b0KMfaJbJCtIPCBPJSH5fkftd95MYMvA?=
 =?us-ascii?Q?bJ65nu0Z8uRPQ2UkNQR+7MQsUjGq477GJB/Y4f1z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64be7b76-7518-4204-96f4-08ddd4c0f914
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:12:23.7744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eC3Af+w/9nQuiG3L9fbMzzZ/fX9SMSQiO8/OB83wyfElcVd6gzPK53x9RbHoVQa+N6kgVt4E184AVXGgcBOdaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
X-Proofpoint-GUID: l_NprRLHCTotRWjK10hF63Ph6vTnvrR9
X-Proofpoint-ORIG-GUID: l_NprRLHCTotRWjK10hF63Ph6vTnvrR9
X-Authority-Analysis: v=2.4 cv=ZpHtK87G c=1 sm=1 tr=0 ts=68930e6b cx=c_pps
 a=Yhwmj+jW27PGnLXsYKQ0lg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=NEAV23lmAAAA:8 a=jjZwBTYg8Yegfxom1SMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA0OSBTYWx0ZWRfX0WGd8FzqfI+M
 qZ90A96RV22Pq0cftrMwZjqEiLX7pJV2aazfo2hE3MSN/7W6nDfDpkQVl8vKrUmdwcBRfM7cSaW
 uUX6uML+5Kes7ONjkRdIj5kfmQv5Y6dCkwvMSUAeWbYeLarzzB+YKh9omqqFRXgFunOcA6qyPzX
 F5u6x72/eRFIzSuFDJXfdHHyvTgtJnx2wHOcXZPpaEzpIam6VC2DpEArb4A6kVZoxXLeYmwOuha
 yHzEu8jjTFXHbJJt9jKScUI5bTaU6IfSESfWsYwhruP+ERr9Ib+mDBM3J5IzCwukVcYkbayIQMB
 lh8wwHJVKMTp3I/2v9Dc8nC9ZgOeyyNOKmMi9go7RA26xvPwENucOWw3WFuL9w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221501

From: Chen Qi <Qi.Chen@windriver.com>

This is a small version bump. It includes to following two
commits to fix CVE-2025-4565.

  05ba1a810 Add recursion depth limits to pure python
  1ef3f01c4 Internal pure python fixes

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
index 30b805e6b1..88a979d0af 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "1be1c9d0ea6efa2a25bd7b76186844d1669be78a"
+SRCREV = "f5de0a0495faa63b4186fc767324f8b9a7bf4fc4"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=29.x;protocol=https \
            file://run-ptest \
-- 
2.34.1


