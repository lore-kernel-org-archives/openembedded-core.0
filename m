Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A06CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:24:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.898.1778649837453240089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 22:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eYogThUj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959349fd7a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D1cQIs011013
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:23:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=PQS4ENWqP
	sVL6xNfNx7RuuiRDSQtmNYBYl3+kFy4wYE=; b=eYogThUjOrIG+RKAMGzBoeQ3B
	hG5yYLpx1whkqFl1/qGHaSvjbMbKf4GMmsoPOEj3QWxnLo2YjMbIvT6YO2vyxRDK
	wkswjQsfqHtoAflvMC9Na82KLZwVf85QQbuxOZ7zxWC2FF/cwtBqMLxZnMl5XBbd
	EXYKM3BR8n8+EKDGTzasUFWWFn95Jk3D2V432gpRfdPb4fUsZM77B15ses1a+Rzd
	C0lctQQqTQvv9ig4ZGtH1oVwgvQD5KoJTboXRhQdMyz/xBjuFRv06WmC1CaC7E8h
	0xXE5hCnyhAY83AGcMLSjvAVG0aCWoWLr95EpKh7LLMz7dZaMssh5s60lOBaQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb870b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 22:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJR5qcSiFz9glEVLcZgp9RWkd4+KeVZ37SkbRsmcR4fBJs2nFY+A1LDzXw2ruaq1iTYEaniJaHuDgFcuKFZPhqfqMaIIKyHMaZNU7vAMeuzdkrUsywRMDlJ1Ab5fWyvPniQfEdOU5AvDnTWmxkJ6S8oepJTYQoUdBEzheFPiVMV0ApCSEtswD73ZpGKW3mX0k3mTnFRE3SnAqWCEyuJcUhMmuPwxO9Cm2b1I+p4VBF/4CANQSOwALB5ZX8TIkL3X4ZVxLNr1xyYrSy+sRgFpaAlCNkhBIhOz/HQxfsiSoyuVM4tZ2m8zQHvUdF6h2R+L4IlMh2J+Hwpnp40trOsnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQS4ENWqPsVL6xNfNx7RuuiRDSQtmNYBYl3+kFy4wYE=;
 b=AVN14gc/myROe4jA1jLdXG59Ah+InqL1h1JjRoJk2iYTzw3EPhUsEVthFMGnIuA6FcF2DTwaEqf/tdlMx/3iCLirt1/cq4mZ0GCQnqm7AfaIGPaFVQhVF7+kuj4JQ0MtJvIQozshr62aNN1Sl/jJle2WU/Er4TEfkQNZyoUGQymetxLTTu6Xhlqj1fkDL0uxrHn0jGV8zbKXgDVPHqjkJnnJsa/a0GXmtcI1B0FYcwsvFiVx8a3R3uf5V9cinBBLGMjwjfMhgHlUFcb/GeNjUO4tRkA5ZPKSocqtI1LFv1L19U1yMT138EjcQQYN4RxsvCGqgIRm8NbA0uvTnY8a6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:23:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 05:23:53 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade parameter to get_recipe_upgrade_status
Date: Wed, 13 May 2026 13:23:28 +0800
Message-Id: <20260513052334.2271800-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0116.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: fd847d56-d1de-4f4f-b1fe-08deb0afd221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|56012099003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 
	gkiRau3aiBCQfPbkKylk/fTbxwQn0+GxJR/BuE09fbl2167shAS25Y5hS2ZqNhkOBBM6VAu8EIWdEoNxvdAK2SdmpMMTXT3fhFFAglkxfX4gF9BmwX9qyZSfAca6xyklboVVmmFGb3M/aRz3LyMKEj4b0u8g81aT1eE7eFDHDdjw5hupkq6UR60eQXIq7JiA2LyVrN1Isc2KV4sH1GvYbsX84bfHi7AogKk9t69F76Y3LAcnPCZrcyCBHzei6QMk4fTSqeSS3WkfALzhz/Xhq/dGiRigdgGDAQoBUwHMOeFMp6UQ70ZQ2LHNqdAHY8efevGVN91uMbuhQ8CmXye57TjFwyGx4Ndr7so9YPMiZElgZJN65+Y56RD8nfTCVdG9yl/e1vwYLUBA5rqs5UAiKqHXJ2LrWaeDDek8MWP+6LpEWicnthdQWVeDVG1UjA6iqQFcIbMj7+TMDUyL/ACJCuXQIBwjen8HyRm5PPOR0tGPgw4Wk1iMrZ1WzGtWKDji/1ooVb5TPQgSMSblIgySuerLPouBK4Ur5CTDOV6+Sh9rd0ebNiLgLRxJSr/OVRRU038HSsFYZB1T1Qm471BX94ErIumMShsrC91fhIJJ5PH3NBR1fwD9JQuepyribzaurhhIYLyKxTQz4S/154WSOVLd8g7Yxgd1xGqnx6SGS0PCkcoAhEvoddY/Kvy6fsIHH9NNoXoMznU3Qs2aj32EJupYunjOOsv2XRACLKFScLYd3bd571PzW09pRQQeAhHq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(56012099003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?al8/7+IrGzMUpV2pVDzXR3zQ31zy8fbkzm4Uw9tt+Ich7HXU7E1S0cpgM3VH?=
 =?us-ascii?Q?dQq2Q53oM7NcXdv8qdJUse7DmEWZB+lFqEhfSVjqtOB7HDtbilCa6AnxJFVT?=
 =?us-ascii?Q?+Is9d7r9dOlLV99pOCeWKm+udaMgDh8OjCz/72PyldisHlO7aCw+iBED55+Z?=
 =?us-ascii?Q?XM4AjShwd+oGdxMH1Ol09nyHjL+UHd2B8MsTc9o6dEgGLq3L17cxSib05d4O?=
 =?us-ascii?Q?wKg2pgPR/Xo1UarqXl/SSLg4k3EWLTt5mjD5ng1Fln9H7toc4KMDJQf7MvUW?=
 =?us-ascii?Q?hCKpYuluPNK6LSrZCAgWUoljFRc8xSSqMyzMItQPyQfVvSJ6O5CsX/BKm7h9?=
 =?us-ascii?Q?Z1vrZXELWQM5o9QqTVPJkzlH/GO8dE19Tbu4rEXfm2XP9LeNHILfgnCPNKgg?=
 =?us-ascii?Q?0nn0mDCPMd736+qUBCJf9vEIwbPlioisdYUTVDNNhSDx2DCqpCYygQ2WfoRy?=
 =?us-ascii?Q?Q03XnZeoYJ0UHane9w28ZeXg4XWZJY8lZfzNe97slzfxTHiAXBibr05H+tRY?=
 =?us-ascii?Q?3tdMGh/fxlNtHeuVmGUJeo2vCnh5B+vwlUPjadgy+VuZ5OqCqQnjtr63ANy0?=
 =?us-ascii?Q?Luh1qTobKr2p86s8+EgTUjqj6PAobakWx27CFTqAk5/HKNC8Q3C/vN0r6F5u?=
 =?us-ascii?Q?Z6x7VdYLIDhTl5s3idJmGPieX8CjZrOiLymI8d6eDYT9zjaukqGG6zqXRd4f?=
 =?us-ascii?Q?eAbUV2cHvEcKJTE3YM+GQcw61tOyad7LZx//m6hqeyX3VYUcMeqJR0VZf/L8?=
 =?us-ascii?Q?UcxTQubHnCeJxzMrCSSfZ2As2EWXOAPfCEDALXyl5IOttVBewxFNZfWBKaXf?=
 =?us-ascii?Q?xoygW4b63lnYZqOSVgnmzKH4Z+e1xXh4U44gU4pFhpaFcLSTkege6KUOGaTL?=
 =?us-ascii?Q?jRQr+srHtSOc9JRLWxB3/RjXwTfm2Gno0Cvt9fg5YjaHwtW83Ww9n+jxAPGX?=
 =?us-ascii?Q?OTzOIzrBtNxjQEiZ3EMxhLoB+QpSd+PNf/GW3hlCvrS55v2zILl6ydXFCfIf?=
 =?us-ascii?Q?s23nxV/B62slYgkcxN55lSVDM3DWZi7mqYqdeuh8yFXFuwZWERHe41ynfRRf?=
 =?us-ascii?Q?5zcpQYJ/hkdLU7kpUHwolGshl2vwoFRom783cKBNaHH0Rk2sVIy0H1pCteHg?=
 =?us-ascii?Q?d68hXR3T5CSrv0o2cNFiPsgABlVP9UVQMVXdiRWs5nPGYJCbKb2/1Rm1FM88?=
 =?us-ascii?Q?/J/fCIX22pUW34BffoMDwUmvVYRoIxulUFE7chz8B+j27M2hdpDgFvFciQND?=
 =?us-ascii?Q?RulmwwC672mpCLGu1TTSjHrLR+7edC+pzvnM061x3CcNrzRd5WhNxuEInqs+?=
 =?us-ascii?Q?wPhpTBjJ6hl+Z3CUgQAfqZ24Q9P4xLkC5Pk4SDSqH3lEpFFa1dVwFgQS7Jjs?=
 =?us-ascii?Q?U47pf8j7FYE1hMyOkAROxZhBJ+PugGWioZACQZ6M7NCTiHfhT+ctt8LjpGEz?=
 =?us-ascii?Q?IGkBPPdJcVl7wcGX6VqfVN4e01w7IaBQgdYDw4S3E17ToHeZUn7SmwaF8frd?=
 =?us-ascii?Q?gxJvA0GNOCSza9fCfF+Fl25wilfbGRXcIk/5CfGGiVLDaft91OMbQBAG2Ws6?=
 =?us-ascii?Q?E8340nJ7d+kmnmEZIQ1NHi26vYRSYwjDgLAoaP5q78rtFhdMmSSC3z0h69HZ?=
 =?us-ascii?Q?RUD9LERL8nCgX321VGPEcxB84nEmXyNhhKCkv01jcyy12o5WHiJaOQ1UDbtd?=
 =?us-ascii?Q?DKbRYxWRWBNF0dN+dzckKNcXKx8OI/Rl5lj1olX9+uR3L2OhZA/BrKdRU/73?=
 =?us-ascii?Q?fvodCSQ3rg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	VfrI2QOalp7AxIgp3PxXrLCqXNXtcQlB1xBY04oQWuhAWusgVvK4k76lrgEA/UIOyOvlgVMeeTptx0gs50WFPcI/Qc4O8butC8BshUZSvxtKmqHKQRYrL49UGmO8KivABl03LS5D6wamm5Y+ZEU/n7MmypHhX3aHV7j+YOLrMYBCimXNV42X0f/L/q8L/mCSZ9HJZc3P+TRi4Irp6B/E7hYlHy0Uc9ci5Zzi8idOBCszf6abu9tBGZquuYLZnFQtLPhbp4F03Xazepy/WegJQyLxAceIK+fJgSUsDj3VO5BfMaA4cOZHngkMIWTBpQd8DjuH8hqTOqXPrXK5kDaQjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd847d56-d1de-4f4f-b1fe-08deb0afd221
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:23:52.9489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auCNfVjWm9q0Hkkt3grR2PR9E+bhIx/UwtS2dOvIrduyx8RjlHzwD4yx9YDujT1oaXTA8RLBpCGPU99uRv2bxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1MSBTYWx0ZWRfX9c9Q/JxbeKQ0
 R9/8K5eC0n8kpmSKNFdWc0iGAHKqEkd2tPF5MzbKsdgGjLpaIlsnryH+blkerSQnHU0iJUm7sMu
 QfvSLycbuUjED85Q8POcqFlrJTu9v1l+md2JrCFRC4ldvaEpcfCA0x09KyqIL8S1hPpPV9SOOA+
 L0j5h2gEV2ovA/rkyNfkXryp+LucO5AJ0DNYs8m1auFEWXUjU7C01puO8w7ZL70QRK9jTdVKmWG
 05baxpMdQDtH0vrJOoSkhFZa5DfeJW4WYmdwZ69FUkFamyyJJdb8RuEL28Ht9wBlKQm3jIzuI5S
 VRrbA4lDzs0AhZxD1kyLar7tHbHRtU6r64TXwYBvLYJ2oOkJP4/WLPenIuKl+z48PboyaICgFra
 fBJyIRYjywDelMmzqXCkCFP9mSxoxd+BccYkMBP6nXI51pFHtSnMq+tdDqtP/xIybPhy+oIFNVq
 DfaqmN5Rq3h52yG8v5Q==
X-Proofpoint-GUID: fA52aWELKirBdre4Wr_MIuz75cAi8_SL
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a040aec cx=c_pps
 a=Av3Y+FYNlx8hu8JbWhmVwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=9yvo8pdFzNs4Kck5P0oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lGHZJhvjOklTmXArAbjzO2p3aAshT0rf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236921

From: Chen Qi <Qi.Chen@windriver.com>

We want the ability to do stable version upgrades for recipes.
To this end, add an optional stable_upgrade parameter to the
get_recipe_upgrade_status function, which defaults to False and
when enabled will try to get the latest stable version of the recipe.

The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
it, it will be used as the filter_regex. If it's not set explicitly,
it means that there's no stable updates or the recipe hasn't been
checked yet.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/recipeutils.py | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c6604f536d..7c1df518a8 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
 
     return (pv, pfx, sfx)
 
-def get_recipe_upstream_version(rd):
+def get_recipe_upstream_version(rd, stable_upgrade):
     """
         Get upstream version of recipe using bb.fetch2 methods with support for
         http, https, ftp and git.
@@ -1080,7 +1080,15 @@ def get_recipe_upstream_version(rd):
             except bb.fetch2.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
-            pupver = ud.method.latest_versionstring(ud, rd)
+            if stable_upgrade:
+                stable_release_regex = rd.getVar("UPSTREAM_STABLE_RELEASE_REGEX")
+                if stable_release_regex:
+                    pupver = ud.method.latest_versionstring(ud, rd, filter_regex=stable_release_regex)
+                else:
+                    # Not explicitly setting "UPSTREAM_STABLE_RELEASE_REGEX" means there's no stable upgrade
+                    pupver = (ru['current_version'], None)
+            else:
+                pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
 
         if upversion:
@@ -1094,8 +1102,8 @@ def get_recipe_upstream_version(rd):
 
     return ru
 
-def _get_recipe_upgrade_status(data):
-    uv = get_recipe_upstream_version(data)
+def _get_recipe_upgrade_status(data, stable_upgrade):
+    uv = get_recipe_upstream_version(data, stable_upgrade)
 
     pn = data.getVar('PN')
     cur_ver = uv['current_version']
@@ -1119,9 +1127,10 @@ def _get_recipe_upgrade_status(data):
 
     return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_ver, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_upgrade_reason}
 
-def get_recipe_upgrade_status(recipes=None):
+def get_recipe_upgrade_status(recipes=None, stable_upgrade=False):
     pkgs_list = []
     data_copy_list = []
+    stable_copy_list = []
     copy_vars = ('SRC_URI',
                  'PV',
                  'DL_DIR',
@@ -1134,6 +1143,7 @@ def get_recipe_upgrade_status(recipes=None):
                  'UPSTREAM_CHECK_REGEX',
                  'UPSTREAM_CHECK_URI',
                  'UPSTREAM_VERSION_UNKNOWN',
+                 'UPSTREAM_STABLE_RELEASE_REGEX',
                  'RECIPE_MAINTAINER',
                  'RECIPE_NO_UPDATE_REASON',
                  'RECIPE_UPSTREAM_VERSION',
@@ -1180,12 +1190,13 @@ def get_recipe_upgrade_status(recipes=None):
                     data_copy.setVar(k, data.getVar(k))
 
             data_copy_list.append(data_copy)
+            stable_copy_list.append(stable_upgrade)
 
             recipeincludes[data.getVar('FILE')] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
 
     from concurrent.futures import ProcessPoolExecutor
     with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
-        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
+        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list, stable_copy_list)
 
     return _group_recipes(pkgs_list, _get_common_include_recipes(recipeincludes))
 
-- 
2.34.1


