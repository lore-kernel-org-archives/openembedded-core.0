Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F3D1073CA5
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 12:16:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105023.1775650592731168357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 05:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZvnciEDZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=855830a691=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638AVsir4039692
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 12:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=W2rMNDO4q
	PiP/RLNLTEoAOinGj4uPyQlJ1kMGgI+GhA=; b=ZvnciEDZvwnhjkrHJ6ytmotm3
	6KYAwyagaQyo2RJtj+OvasWqnwyj6XrIRMZaCONOkNnOTtr/VEqkVwuZIhSVRP37
	tg6+3061MXZDQBSdpW/vNLvNSFtOB4ztV2QKMU6yBst7hrLs/I1ggGH0AvlCb5qU
	tdJRwZWB0HsGBrsjE8MZdzHmpF8w2uf5l4gdmTR6fbuwzKw/cUdVrmLioyeEbJ5x
	ECHZdH/6eCO7vsShjqJ4Mr/YwFCzaIWZHtf7xG67H9MDcqb7hrYY8YnNuY5Nh2nH
	xOx4GU+v4kfUgEmO+ziBxIt4UydVIJ/1OqgVQnA0kxC7KOLSpi04w1yWj3RnQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010033.outbound.protection.outlook.com [52.101.61.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryagfs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 12:16:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2HZlb7PGtOTMocqVFJ3Yx5gFCnxEHb6FqhwuWvFLIsKBRSkYW0Nz79gP2NB2bp6eaeBiH9UGLipOAwbK3g9YNQftqSZS8OW6u+dFDaJBtVsxhHRxEmhrLil5TiIMSeEQLjM2gwkJNHyWz2HqV0e+RYfw3KY5ZJF9frf1/izrnKEn1Dr3oH+bE6ZTKWokEODVYEZrWfre/p8c+EU4PEyPQeNTGBqalTBWKb6em641r01/eXb/qPKsyzc4kAufz/p10jBetZqpBNvOuTpkeITPgDKQlxU9dgS+ueVDfGDykcmlurxiK1VzVylFDiqk0x4RajsPQyrAxnJjtQl+s0kiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2rMNDO4qPiP/RLNLTEoAOinGj4uPyQlJ1kMGgI+GhA=;
 b=DU+Bff0GS+npMXAWSWw74KDND5gipHa+CXeZxSSEQ6TVRoJM9VrnR+pmDC1brkwblocB1++hs727PT2CuaO03CuIbOdn34CBbh2z1p6Vt6DDJil5YKu9ayjAscqN4sbsCYQ42GTh2nQyFLJphaa95Q8FlrP8mflSRSoOpZgCF0OvtVP6kL0XBgzmrgsH2n+0AbGp7U959BVLahFYXRyC2r0lRl+c9N0bKuYz2Vlz5tEbJjZZukja9JNMQFNHiCAD2RgUoVGArWM6lpwwJE3uVUzXBN2dgrQPSSQB0YH/F1XW0ZY1sPJY+gssXpe4oOqPPjEKdNwOr28To7pqeDS6CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7791.namprd11.prod.outlook.com (2603:10b6:208:401::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 12:16:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 12:16:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: Set status for CVE-2025-69649
Date: Wed,  8 Apr 2026 05:15:50 -0700
Message-ID: <20260408121550.3474166-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: eee16913-a435-4b5a-7c82-08de9568a8d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CIGUPyqir3oSWM/KVm86F96uzq76tsh8YvsZRVcSkpzdZwQOE41xlJcMyHcih1xsGE4bw3J9mU3eIJB5vVBs23M1eoTpqdsO32qT5zfDwPvO18v/9VxDO5dCUhu/WNUMs4IIqZihpXIf9JSgpGwgXZVG+LJQ2vjbvGlHiRE45q/dVlivoEnwkdupD6e9CnM/Z0U3ehAnmoV2rnEao0XXW4ZIUN8i6R5wTcen/Wwjj2wnSlPC72QlFAV2wGRvKOhj7ouZwioIkrZDADTjRGcQgmA4/VaMUj22bK03jvX8Rv/ayKnz+jqykthYWMkjlnSivYZY0lpgZ1gVajyiHk7R6npU/uOjl9jDN8YKLSRp2fqKAeWs2z97kUqIzzoxxZIN8D3qyVeMbtCymbRY3NSHxPbwk9JwHLcyyxPiqcHR5TDpLWPBnRxoEt4jhxJCrGlSpK0salRk2woRCo/PA31KMX6awTeT/6VqBp0Cg7Ea10Z7jULSKPk9WXDe/50dtqFl5ubYzsK632F84vxUj85ky6mbgbbq5DWxqnXzS5KDgX4V60Z/qNHVTth4UY4NgzIl4h4nCFZbT26u3g+h4UuOZhvA50Qp45UMmdckH3bumUarF/4+cQpM69FpZhLrs7Pw2ee9WK1F7MqnvPPTheTC5vH9oLP6ly9uyM6JG8mjuGa9idWFk7ua+wNsDWjNglzDPsx+e+ofjgwqyyk50mUFR5rZ17u+ceDn5BSb0yT0CH2wVRsVhvEsLGPWKqmZgYjwVvBE8aYXOQVg4piGsGVwkcnzMakudo/x2lKrYQUypKE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b51InZT6lmi1lIllccbSvS+rHOgNjVtanDrabPJGYDHZDXXuu1JzZaNzF/P1?=
 =?us-ascii?Q?/0S62hkKx69F5pP09jsugRU3CcpMvp/+aSI9vaoJfKrCenN4TtIr92Ly2Eaj?=
 =?us-ascii?Q?teNUXCT8ivE+xc9qu1O//gCBbJBohtYNRzQi+UUQLkP1+K6Sm+w9xGAAQ85C?=
 =?us-ascii?Q?ct0+B3c9ck8iLX5sVJdm9g9dtp2Ujp4y2nWpX3Mrgg0abKC3l0wZksHGymgB?=
 =?us-ascii?Q?rPrOgEojmo0Qqnri5LjY6ltw+25LDqOLoy1K6qD+pfS9w46tzpVbQ5cj7fAk?=
 =?us-ascii?Q?21S4EMvJNRo8YsDV+aEqX4aZb/mB3xcMLos1bBPm3wIuPUlpbj51ksg65zxH?=
 =?us-ascii?Q?JkoVvmPzCu8mLmS5FjF1JTssPK7qvo9dGkNUmX7uiH5LRroODAYZHrImHHa3?=
 =?us-ascii?Q?0eK9Na1709xIMV4jXBlouOf838h+uRZTIsG21L8NkOJ/SXFKIMbqUTMumHWV?=
 =?us-ascii?Q?Ov5aaVOsSJ4kUTYUFlWwyCzn9CeHUPafua6WwJ+J5YvsdYlN9WTZg2Rj1qtu?=
 =?us-ascii?Q?mnStc7sYhPPLAPZGe/iCChaHnMso5NVV4gFJzDA97/AUrfS+8Hf6PKkX2ARk?=
 =?us-ascii?Q?RKezdayEsmNQqUmr+c9LyKokGrPuUNNIIuumiGNoLsLEM3owty9AlsonVAew?=
 =?us-ascii?Q?+IZhivi8vMM1CHsUg5D5svU/W+7naLPUREkYzJKfLt41RL5s88X50ahJguYk?=
 =?us-ascii?Q?r2h1fdYfkRYFyrppEOiAq0at0FzLD1cVL2mmF/F7PY2z0enOOoe1Mp9Y/t00?=
 =?us-ascii?Q?nPFQuasRaHLxAbMPCT60lrPs0MkTjhAKpNoNYQvR6Wz6jyEMBe9SFx8xkMZQ?=
 =?us-ascii?Q?NbaJVJv5vC5jqhkNimJ4RqnZZbhBLUxISxO4xNeoBG3RWFSwqKGGhJlhYe8O?=
 =?us-ascii?Q?f7O2rVyddnj4LZalNmi5bsUtSCMSk/wD0803FCPLbDQ795JMfUgT38Am3e7m?=
 =?us-ascii?Q?wgxD9X45Ys1LhcZB2xpUWa2NzcRWZN+bQPzvZ+oXH1ZYX+TiVvFFirwIjEqp?=
 =?us-ascii?Q?KWvqDxXw/Bq08Axa10RZRQC5LMl8y3/RFOS/PNkiI8H1J7UoFGC7dNeVdOBh?=
 =?us-ascii?Q?uMl2PaWGpb2hnNq5prki+Um5PWygKlwBNPyfhC9RTCWWkwv8V/eyuWi55WOq?=
 =?us-ascii?Q?oN0dvcEKM6o7oBT/6ag4aTlQLEUBkxSFiL1DF4zgS1ZkTwLr+6MAOyvilLJK?=
 =?us-ascii?Q?VZx9buVaZ/5PDVrhbKZic+C/ueupgrAoO5mcuhBiM9rO25+zXH/P1K6Ap9q/?=
 =?us-ascii?Q?BcjZiBSgY0wIvNI6gPwrGTUh2wzmhsXeq3Mlw9RTABlsFBysKLEkqZgwOl6W?=
 =?us-ascii?Q?T5IZoq4Z4cajucRLEGuIfQxfQBLqpYC6KTqWzPIIjqgtBMizNThm6H95wqh8?=
 =?us-ascii?Q?ZdyWaz041gj0CMu3RDJtaZikwV+FGbrHEMqyOt9Remk3y2RAmCR8t33F8Xgn?=
 =?us-ascii?Q?95Tq2HwVcEDLLFFmAjl4xVHloeGy3N0MZDFJdBjuqz+z/6iyfwT7ld1tMzGX?=
 =?us-ascii?Q?NHYPbtWxA4t39j9nECZEd/entrsSvdAB8C0ImVbogxeogI/bSeb9+WgGg3G9?=
 =?us-ascii?Q?VffdEn3ZA2vKxmm6DKqwBNhiwmLMiQerCUKhAIBAePv4/MaHqAZIf1kPE78L?=
 =?us-ascii?Q?ObsMxa5rz1RmFYfQZJnpaHd9W44tAHM53wrXYIkjsjtEazeDeKl9WfdP2zH2?=
 =?us-ascii?Q?k0i/kBvnN3sU9MNrnTIY7L1SoYhAmYCO4q6MDZ1zfErPvMoBpe5d0XX4jKiZ?=
 =?us-ascii?Q?j4aelZ+5W4EK1CdDv1fQzzAGgaiFmu8=3D?=
X-Exchange-RoutingPolicyChecked: 
	npZutxJ3lwiJjIDsCd0M4nb91CdBcj6lq1b2uCe+XpktVWC9+AMTR8r2c8+xe+e8uCHam9LTWApC1m0TwCbsNjNpGRC1mWzWAuP2HfKhteqmAGX7OCSu98FUeo5779SkJ0XdfRiDUxplq1I/IzghPr32uTBvEJuv4bdGIw1QgJE+NCcQp9b2LRuCvs8SlmgW/zDMZpCBbVeHvQRBx5tE7Ll5uM30zlLypoGCMSIbSqCNJTacQcw/i+UeyE4bC/oScrgA4TRcw6HyzFlMK6Si3ku3b+RFIYxGdEqVXEwveB7guID7xMVI5LMTIoO5UbJ61vMA+CFKs1Q3hXt2PBDG8Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee16913-a435-4b5a-7c82-08de9568a8d2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 12:16:27.8407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1Qcji0o6h0AEKRMSyd8+e0BE2Vcw9uZc4Vsl9mS+AHiyFFqUDCVDsPGS/Oa/4BvY4+rD2q52CWYyGNQmlHfXClQeZwyZgCwthTU1WLs+tU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7791
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d6471f cx=c_pps
 a=hcnkadelB84e5vzkSSmvUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=MlPO9ohnyPFQdmuMSiMA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: FpiecYyhEAs3sQwEFceSRFWl1saSSCpZ
X-Proofpoint-ORIG-GUID: FpiecYyhEAs3sQwEFceSRFWl1saSSCpZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDExMSBTYWx0ZWRfX+FWRblULzsFN
 nHX4ewRsX/uk5ot0/ty+zJssLeIih/Vz070+4Z8ameP5CawyA/TGYLsvJBzrkxyS3ELI07feOf2
 s/ZUpY4IItEBKXrRY07BKZtaLR209djEJfWZ/fICEZ7LC5e2+M8AzVACmycvCSk3mdHBw1TcBmm
 bC2pAiBlCjpB3pRTAnDzaSsdmfZHWJm9oQZTSN0Coxcle/B3twdPsOcOnVF1vRsEyGNUYa0aBjl
 4c5PLlNHK6inLuXtr+KFiq2rRqWWng12Cel1al+WMQ8p0ElqZAhwU0G3GjzNEBzIUT7izBFgJVv
 a/2FPNB3Yc1fpuCLqBsSYLunNQfRY8IjaORz3udPBApDh6a6+KtlXWBNEVnNLCWCcIyWLe3EAik
 2EHpWnyfDS7htMTOBTbtfjaO77XeSyQcmPk7x04U+yfM1AA62DZBseTRnSnM1GiQP9lrbeHROHM
 yQiIsVPnTEaKWCQV4xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 12:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234835

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Set CVE_STATUS for CVE-2025-69649, as this CVE already fixed
with binutils 2.46 version update.

According to the NVD reference [1], the issue is addressed by the upstream commit:
66a3492ce68e1ae45b2489bd9a815c39ea5d7f66

This fix is included in binutils v2.46

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-69649

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.46.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index cd2867c421..d41a3a3f1a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -20,6 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
 CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
+CVE_STATUS[CVE-2025-69649] = "fixed-version: Fixed from version 2.46"
 
 SRCREV ?= "49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
-- 
2.49.0


