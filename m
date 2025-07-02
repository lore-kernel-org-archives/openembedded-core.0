Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E93C83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 08:45:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18862.1751445896614447287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 01:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92788b4251=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56256Rku026624
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 08:44:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1c60d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 08:44:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpfsPoRcSPNW5SI2XQfdknjepCdNOmn80626BnwCCHiQV2pHPQE/PzvwCKx9KM7sfXUUJA4+ZbbR9zGlf1hGPEc4N1IlXkofxS3+GbhR0ov2/2gbNPMLxa9aOFS/qT7AdoEA4UHymaeDUMbA7DaEY9VFNEqcDIbgy9DfD4ZZ9PDKz+T2DYXHzrXz8rihK/F8DNhun0N8K2g4FYIAWYp6JmQjizcaRJQaxWEFGtRVAIF6yNzBsjf69AYCanHEC8Obhc1D8XIfQWOBCzI/jVSO3iIFD7ieij2f9Slq56BLq6AAVSKUdHveNqSPHj+7uHQ9tB8ZNtCk9foiAHx2FvnCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z1S2PxJWZiRHZ3Y330R4/h/X98NNFFlt2KiLOphAIg=;
 b=uQZ8h+9qIKMRnTTSK+5HB/IWsZbBNWCoWz3s5yk7Ud1AbIAQsAaMNaoWoW3rj8ZOCETpB0cIRXp41YqlosG4R9fSW9fFjkw1sgotHPFtvlYkXcOM5MIJqap1bLj7jASyryeNHcYyJm5/BEiuwv2BnCOGM+XyGD5U+9NiNOUxUgqGK+JWUSqNolQi03qDIH0uuHVguODFBJYEu3YfPZr8GRIgIZQUvYxL4V3OpwHaar6wFRwqRxja+7qzTz5ug4R/XljZvZQqI8nHAe+zrs+LptQIfycO+SRZrTSDzn3fPAv9pwmFuh6IA7LDxSfg5gKTz+riBkbcE3IoWqY24LlbEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 08:44:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 08:44:35 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] shadow: upgrade from 4.17.4 to 4.18.0
Date: Wed,  2 Jul 2025 16:44:18 +0800
Message-Id: <20250702084418.2886458-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0049.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4683:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a15580-8384-4fed-e5f5-08ddb944abab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WkqTsBURJ4vyz0XMCEcOdHPxMjRduY4erPJYlLtYExOK/3+RIgK6HAHEAcGi?=
 =?us-ascii?Q?WvrFBu22JhpX2ZKDssdvxEdsA+hHex8TZN2TSqrPkFFOKw2f99SnpoVBxx1D?=
 =?us-ascii?Q?qHZpvVQ2aAwmyyngFusemTXcOai10Wye0d1eom7YfyxSnXI/lBH+YKBob2IE?=
 =?us-ascii?Q?UYIMr/u2Bm3BpwM/oJYJplVeVc+psfEpoFcjHSS2rLddgvoRehAMrQrvVX05?=
 =?us-ascii?Q?44GdWvH+hJ+a9CUP0omSd/Bd5nJrB1L5kzHycVA9taWr1zH7Uy7+sfbMrJj9?=
 =?us-ascii?Q?/5qdH13/3QK8wb9tlj07MQPotjD/zWWK1pmzsISksSOCipxo15rRCxSwQoZB?=
 =?us-ascii?Q?07WycFHb/Nw/uztsU9XbyQ9zmu7yepi/tJnr7EEkQITx3ITjUAkZcu5g8SFn?=
 =?us-ascii?Q?YCs1dQ5G2kiF83Ha/HHFnovqHDEKAiw99pdbwG1+JG4uwUjs+ATzsqcgdJHI?=
 =?us-ascii?Q?1EaW9YTzMLt6O8bhGp8bmCXnrUDJJffP2s7n8kv/xcyVO+qDlX5wPLguHlVN?=
 =?us-ascii?Q?CZTJNg9RLZsQmBD5QUT7woT1KdfxvUET4vpKJbq4sOMiPWVw2rV01qlSChLI?=
 =?us-ascii?Q?OETdznqZV32LRfA38CSwhwesYnecPyH/8F8zJd5wKpxPKuNceIG5h+uiq1lY?=
 =?us-ascii?Q?8d4g+pxpD/qXUMTogbN1e06s8OdHU3dU3eAoKhoQA6mCbidtBoBfcYcwXEDu?=
 =?us-ascii?Q?IJy8NAfnYxiA4bYS15EMiFAy4kdpQdZC2bp7Zj3qhpGIdlAZqL/BXK5PXNg0?=
 =?us-ascii?Q?t0L88bbNxN1jsfoUU0s8ddLht7RhZJK/tzl3rmaIIFVuNBulqv1cQpEnrq5e?=
 =?us-ascii?Q?pBEP8DFWFmNJ1OsJzEkhXKg+hHAgY35kIN6eZFkyQvLcnlfv+FA7+/JQrBPQ?=
 =?us-ascii?Q?doYXOR2d/mb8xY2k9fd3jpvXuXnXkr2j/tc8EJfVNbwnDlAlDrOc7FoFDifM?=
 =?us-ascii?Q?Pc/Oispl8ESLH0eAr2yWQY+WkxA5Z+WqToOZJjJA6xSOz3yJVOXppdfQBdqU?=
 =?us-ascii?Q?w6rRqbDhTFrhYrouHnHh1WKkJ4wycn5pxNaJfwkkTNrz0Y0KyXYP/2zyBze/?=
 =?us-ascii?Q?mifmZTTDAwj5HuSCL9nXw/1RegJHSyLT9AeLHhfOOEAvw1b6CQXcCnxog9TA?=
 =?us-ascii?Q?YFCohbFEu7vfwxemgEyRW8RD6k4hBvgnukiErxgqpGp1zptPLLYofDfk3P6J?=
 =?us-ascii?Q?71Mi9+8VF9K6cL517b5umDtUKqFN3cAXOwewcjps0JWf2ryJQ95I08H5O6Ix?=
 =?us-ascii?Q?BpOeLChEMls2u/jMipjhfJmu4+FECSKMRA1iVdTvWWVD9A4DE083SPmevEzX?=
 =?us-ascii?Q?D/2ToHKhX8czhSd+u4gOKgtAaPwe2yTdE3rUclF0MbkTFhBZstBl8tBkEbPf?=
 =?us-ascii?Q?9sU2WEg7GBKBD7aEwQ/g56KbgbkoMf3WNFImFKrKCQwNf2wQ/WHJvXRWB2sX?=
 =?us-ascii?Q?EYUWws8zwpGsLOc7LtUhEgEiGrnw5CN95s6XNY1/DXDM6mvx2I2XSA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fWZP99cL8iNzOhM+8ddFvVv/OcB9KVgIDlsnJYAH8wQfCaHu3bSrART1BH5o?=
 =?us-ascii?Q?OgZworxsP5PpSoeg20qpdviH9FbqVMvXCbACXXsP41GyBt1dtixvs4gTMSGq?=
 =?us-ascii?Q?AqmpHcfUzixL8CtMUOj7hKLJwIoGx1EOvaUbWARxhdLBwqtH3ozjCxZBcXJX?=
 =?us-ascii?Q?dUdDHdgeQ5pcqnHYfY6Ty4pdyogDN6L6AUHQZ3Fl8Rb5QLb/aIVAUztkqzdj?=
 =?us-ascii?Q?lqdCjqmN106lZsIF1xvDy8jrSEixIYArfRmHfUAv/dfFckti5Fk5C8EK3SrF?=
 =?us-ascii?Q?WzYDyyxXfrdE9xxqi2wdcLxEOtzq0X6y1JXUEkHOSGrxkWQNFMIkAB20tpfr?=
 =?us-ascii?Q?hDeInvP0UcnMsP3iiFhYracjgpXQ+zXJoCJR8DiPyKmzREb0QAex+50wjley?=
 =?us-ascii?Q?WbjIMHzSCfOVAkTU1TH+HKZUwNesIGyY5VlduDbGKWs6QM/6VQ9euemcuVEc?=
 =?us-ascii?Q?wq6H4WD06ufECwrvvXmp7yF6EQCFsJiPDAhW36eFIPDfP623Qg3Ff2ZI2df/?=
 =?us-ascii?Q?8iMPqZ57ObCYpB+aoIgSVUJoz/isLbNJVDk9+x3mgKhANtpq7AFyFwFwP5nP?=
 =?us-ascii?Q?OS/o3jNNKXX6yDRHFd/PAikBdZW/fsN1E7U78HqTpCVyF6eyJDeULtjjYZfJ?=
 =?us-ascii?Q?BskO69alboJi1xV61bQnoWlqW0MDJ2pEAsJ0NZu8Rk4gaOKkqteRDlshKbOI?=
 =?us-ascii?Q?GSjvQ1YucEADB2vzkClST9U8pEOpmuIrKF33UfoD6j8ajVYaiRTmq8U7VHIj?=
 =?us-ascii?Q?oyTs/Um97EHkmIaT69AvcJuL61iww/2Rau8qA9d794OanZTUNqVQGGzYWQpz?=
 =?us-ascii?Q?qIq4EcCrDdekw0vMFi4r0dWMWaqx+FWUqm6N2A0KPr3543sjcNt0fWmjyH4l?=
 =?us-ascii?Q?kPQtI0ENoGjx8pEuFZaDP+QAcNyN2UT8nUMZZcJfcFj3Y986eoLyEp2/RnAQ?=
 =?us-ascii?Q?STWWf/xFteVr2FmO9+IovzFhFaf/i0RPtEiIFrtBrkF8SByxAajPMhpcIo9q?=
 =?us-ascii?Q?SvfvCoMS9h0M0nkl6aaS3hqpxeorOxEJp3HvDyYgf4Bext270lVqAE6gv0YB?=
 =?us-ascii?Q?yqoyU7G3lZhwz/Pau+b1eIchbTE4MtRHTvjJFKvKE2d5lngCTcPwg5pP5HKH?=
 =?us-ascii?Q?P9ksXLzuwAW2fgMdB/awPB9CYxnbm4JXO3FGV7HiWWhxhU6b1yD/Ne6xVp80?=
 =?us-ascii?Q?cJ895NeUdZAUlaTWRVBEARmonSHtYX7uvaA97BCWlKGMAIhv4lJ9MWsYsuWU?=
 =?us-ascii?Q?3nt18OomXI/aW8g23SCng7fvqV9E5ZnsVg7qAdkOJwJ90xnCw2lfYgDZXIyr?=
 =?us-ascii?Q?CU2+vgL+1O8lB02k7ExaJQqLxkOrHE0DBHh8vqendYzb/XqfeL192gRA+0H7?=
 =?us-ascii?Q?aJznNJJObRwHEBDn3f2TvAXrQuJ+5XzyrBWJTLzh4YIWJun9loIr+4svCsZ8?=
 =?us-ascii?Q?dWhvJOxfmnn7QvRSBFCBt5lZhgRrAMUn1VC4QtLgRgKWoi/iFyptYBrE7KWR?=
 =?us-ascii?Q?+WIlsQ5W5dspIj1uaIp73/Cgs95sMZLbfxSTsu+6BNDkiuPbCzocaq9H+Hdh?=
 =?us-ascii?Q?QcfrQtSIj5sFHFn4kdzVGPVxX42ey5w/dO9/hrZ7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a15580-8384-4fed-e5f5-08ddb944abab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:44:34.9629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8ij2gDLOOFQxlrT/xvstnJIcFBwKr06OaQR2JSHh2/q60SeDFODZ5AY+YmNzwAbbS+lA7Vdprll7Z1i2hynrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2OSBTYWx0ZWRfX78FFwYnFAHfl If5IUGmqXQGuTBYWexhBFXfvxAuLJBKdIqR5z/qFfx6PVXDC7HqFBIgahV5rSs6jLlMoqUlAO6B /6P/UKd6UMm8EJV5km04Dg8OA69IazSuN0vkkh77QfzCDYQRo8eHTz92MS+u/lG4Iw3h9a2Lv/c
 tl4hTs19qRkTM535YsgDM1bVCPSSbcGhMM9YpCr5zZz7Soyk3/VwIVFgjuRQSyu3paJGn3CWsc5 BBBcHDKYRtX6pct0sFkOysuVg/A2RbkTesyGeEJU8mv0anN+eUZ4+Upxjgs1iI4S82VBbs7kJAs yx3q/1yeOxPtMq7glik21dw2vqaFMDkdB7FxfzD+I2CJ21I3EyL+9Y+AvvIaheopOi6rbpwFXmr
 kS6IT4Z8SYMB76v1FB9N5/fGGgXuOBmMeAVk1R9S9S84Bm3HLeJtaK3dP9Bdvi5HJXZdKYMT
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6864f186 cx=c_pps a=g8u///qg7nx/jzAVJVVNyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=G1o6jnBrB-fzLIGY1vgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: l4I0n0kH_h32JU9uMA27RbKiq8Opkkme
X-Proofpoint-ORIG-GUID: l4I0n0kH_h32JU9uMA27RbKiq8Opkkme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 08:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219810

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade shadow from 4.17.4 to 4.18.0.

Full change log:
https://github.com/shadow-maint/shadow/compare/4.17.4...4.18.0

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../shadow/{shadow_4.17.4.bb => shadow_4.18.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/shadow/{shadow_4.17.4.bb => shadow_4.18.0.bb} (99%)

diff --git a/meta/recipes-extended/shadow/shadow_4.17.4.bb b/meta/recipes-extended/shadow/shadow_4.18.0.bb
similarity index 99%
rename from meta/recipes-extended/shadow/shadow_4.17.4.bb
rename to meta/recipes-extended/shadow/shadow_4.18.0.bb
index 73942888b6..6842a46dd7 100644
--- a/meta/recipes-extended/shadow/shadow_4.17.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.18.0.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
            "
-SRC_URI[sha256sum] = "0a288c251f339846af6bdfd4447b196153204deba42407bce5b0917998322e9b"
+SRC_URI[sha256sum] = "ae486ce4c0bce55c42d76d8478e428c41586f1da2f89fbf5228243fb4d849db4"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.34.1


