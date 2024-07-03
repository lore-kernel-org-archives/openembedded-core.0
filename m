Return-Path: <Ruiqiang.Hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26DAC30658
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 02:00:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.40966.1719972042164150839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 19:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7914628a09=ruiqiang.hao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462K8j6Z013717
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jul 2024 02:00:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402986bg54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 02:00:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjNNklHTOGBLpUOyYv9+lJ0Vd9mUefSpeBxXGvfcu9N3GHSLfmm+u9ap18sXdwgyqhGIVbXavPoe7jFTfuVcIkQRNMf+suvl/FVMkV3TxEQMyoFXHFGop5ysyvdkLLHjXvat3o3I4boO7pX7Ds0hLYhCCtocYVeGj87ODzueDtTFR0Ya1rNyi7wEaE8thOtI4un5zsR5Z71nsiE/GhumkXwCMdX3LvjKm6zMWvqaiSD9MdJKFw46gIEJQJ6ojWrNjJqEVUIrQWD14lzscyZpAjG/VHXwd5hR2/fh++Oey5vo4IHuYFemOpfjvojzMlwhL8y2wA1M4bbmzHcB8ArQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWNfbzAxw7FS6aOVTpMDikPVsdjnayVvmHGVWzu6eYY=;
 b=T7NLv3Ak/xQG0IrPAtG7oYlArYH8WYOB92d+6rDRhLJzOncwAv3HSBGPY02mcpT5UcAH5eRI+JsVFrZ9oe4QMNpA1MgSmdH71dNuEqEPTb+VNjQbImjTXDtGd/5qZeGjlfQYEdOppXJhyjpZ+UHUk3OIuxYpiTDf/jUiA+G0ZwclGeV/b37Zys+vDqx9vkELghMYRlKwc911LO06IW8qSmfhPr096od0FP82pU1ayXBS/cWj/pKpDelViOocHJv8++6wpebtfN7tjATKDGgsJ0/gkss2qUPlxfZjj5CbykkRCeS/z2W1ATCrTwOmeBsXbiY3HHB/C28E4SnnAFSreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19)
 by SJ0PR11MB4959.namprd11.prod.outlook.com (2603:10b6:a03:2de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 02:00:38 +0000
Received: from SN7PR11MB8025.namprd11.prod.outlook.com
 ([fe80::a5fe:8f1a:b4b:d00a]) by SN7PR11MB8025.namprd11.prod.outlook.com
 ([fe80::a5fe:8f1a:b4b:d00a%5]) with mapi id 15.20.7719.028; Wed, 3 Jul 2024
 02:00:37 +0000
From: Ruiqiang Hao <ruiqiang.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tune: octeontx2: remove crypto from TUNE_FEATURES
Date: Wed,  3 Jul 2024 10:00:27 +0800
Message-ID: <20240703020027.3434756-1-ruiqiang.hao@windriver.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::9) To SN7PR11MB8025.namprd11.prod.outlook.com
 (2603:10b6:806:2dc::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8025:EE_|SJ0PR11MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6402cb-9750-43b1-ae9a-08dc9b03eee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n7+tFIwgq44NV/24aTSQj+AqZnvDtGqevn5rq7aQGLcer07jOlvulkH+6Xmj?=
 =?us-ascii?Q?FibIaBW8bY+vxPwmMILRxtcjkutckwyP25hSN8fd5EEql+gsk9Y06I3m6Yn9?=
 =?us-ascii?Q?VcmCxeVtdUbc59rtMNVkFj57zdCZNRq083ZbgL5LDk35q9H0sNy0turqQFSK?=
 =?us-ascii?Q?F1hBqfdQ95e42yvgLozsxs8n8U1tcBuKlnJQVAf5u9z41MV7VsWEpa3QAkk6?=
 =?us-ascii?Q?uK4BvBH3NBL2umeK3TeUuVucimuae35WQ1xBedRt0cAMewHoeGmbAN2IJ9si?=
 =?us-ascii?Q?kKXy7jAfnzq2vnIRFhgup/dmBiC7N8frIxA6506Rk1w1CiaZiCt7SKIMW0Nc?=
 =?us-ascii?Q?9VgEixCMwDNpDqpgKc4aTchbKL9u0hQtxpw8kmRNrs8PH7K5UgCgWLrrlisx?=
 =?us-ascii?Q?IFalgmX3z9GC5rvj5h5MdJMiC2CfguOYWirFfxIcGNJc59P+soHydojDuGkf?=
 =?us-ascii?Q?8Bk+fUYzjzjaR7uU+wlC2dAiGi4Us33eTKwmt8Ski0jbSQWbrPs2cu2dLoOy?=
 =?us-ascii?Q?txmNuf2kHqPxrTH98Vc/7RFzW/yapgtk1PqKW9ZCSyI7qIbKG00CesHFNI9O?=
 =?us-ascii?Q?rsa+isvEqC2mf51GBD5pa+7Th9G2n5qk+nFl/4KwCBvy9O3GbAyE4BMu2BCd?=
 =?us-ascii?Q?e/8ODYGtFHTnj1+2bXhuN9ct+4cgNt3kP94nyVwMjxr/NrTbfkqU0uYp9f5q?=
 =?us-ascii?Q?rH0nR87BIvESjDbpeqTyNbsLhpbOBgT0hcFu28IDwKYSQv6HhVxxNXRkeTxH?=
 =?us-ascii?Q?W+rBmqNy5oXO3CwvF7RLbq7LZpb0+39jAh7zXPvmYdQLvxzJclkHxdtIg1EV?=
 =?us-ascii?Q?GFNzWUI2E87ZmIC/gFfCseluHtTMdjPSUTYDd8ssgurgkXaimgxRVPW+A1qX?=
 =?us-ascii?Q?6L1WMwlGjf4hvMaK4l7cqxs8nO1A0aDFeHompgwGvlx4vkVhO9WPpYLtOS+2?=
 =?us-ascii?Q?OyA23o5eVhG4dZNrL0MWPASesm1uG89+YKvP2iBGAiAVTXch8PxP0EDngXk7?=
 =?us-ascii?Q?i/uDrZEmJWqRkiYLVhzJGEwlRQof0EcwYa5fMrvoKS03Zj7+/67NPhhKk/dK?=
 =?us-ascii?Q?d1X60aT1i7RWyBRjrdDs9nZRZ9Ad8efw7LETntD1pi3Wb8QymtyJM0dHc7vT?=
 =?us-ascii?Q?AsDs8beZR3MDrVjTh1cgSv1bEJyhaTjc6cuOaTe00LE2uGpqtWDdKuya3Gpz?=
 =?us-ascii?Q?qBpglwGrK7SU0mRMEhKEfD0Wgs9SiqPzfkLqouSAARBrqlTMiF2TOwVM8ACK?=
 =?us-ascii?Q?HniLdMBTRat1WetL2GXSCZUCMGUllxneEkmuJp+EICB2HScmKylAfinYSnoO?=
 =?us-ascii?Q?i1UC7EJUCbJf4DHWN9ifL4bOFdFpz2zt5kVyZ0MRGxnSTXv0BS675zKYA8ue?=
 =?us-ascii?Q?vCcxOribavmu7N2dmbVO8+igkaQWmULRtYIhqEVG8T9lMFE9Sg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8025.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DaYNTiKIr3LD796PwvuJh6JXGVU6GGinRnpKQmCFkc+Ljli4U8JNxc4/PrE1?=
 =?us-ascii?Q?ANP9Ji+sRUqiFyfVVcOck53//rjZFYmVMWuMZtaDo17Pxz2saoW8yx5ieZpx?=
 =?us-ascii?Q?6rgUdK3IUqEMbKXSjLKtNqX5EfXfRv+lpl6+zoJ6/PZjT5SZXl4dlu1jxG5m?=
 =?us-ascii?Q?s8stH0wF1C5OjLZxh4UIup50T/+9z/nCvJrtX6vLzWfIM1q2J/S7cSfE6xcz?=
 =?us-ascii?Q?+CYVTX88pcSDw3uLQyoMOmngaTmuXY/nN1DGUR5lmC8r76r9v5/NPGzyAA1w?=
 =?us-ascii?Q?wwQ4jiU1E7cVhxnpXD51RfWec5zqnLaR+/vv8d8tg/GFOqTfALyBgnj1uzwA?=
 =?us-ascii?Q?aCOkR7UhdhaAbqqh1lMtoJRhWNeDZSg/cl2rDuwv7e77i/xDcGwUvT+mFwSi?=
 =?us-ascii?Q?gUjz9vecYw+0dyYrH9uFzfRedwSNlhqSSG9aqX8RyUx7Gqig822cNbEb9utM?=
 =?us-ascii?Q?XDEx+xq3GQTBbG0UywKf9+qvAit5q3EXWRLfbVYjrteud9+YOhlkzMXPF/Lp?=
 =?us-ascii?Q?hMGAsbI7XLIofn1P58OW2QNiiQ9xnn5S5GBXJOrbxCiQtSuzVWzm6Nn9QiZh?=
 =?us-ascii?Q?wASDHxCUmgZrLCuXQsdZR6xc7tsUlzGmzFzUDzHnMysEdHnuhZrepOBHmOxl?=
 =?us-ascii?Q?70UI24Q5QTQBvwloJJedQf8Fr5zkcwINjV3955AeypZxShEFryInqjHuQiMM?=
 =?us-ascii?Q?CTvTfVlzJiy1UduHUBoewRaiWwkJgkhLUiVuFt8psrNBo5oBBc04+ykKnFzg?=
 =?us-ascii?Q?GY4zmFyWJrEciuCr2GuAGs3mMy+VEdhoqkVl8zrrxw7mYbt7XyeoZXc4GSup?=
 =?us-ascii?Q?q6liqctftLtqoOg4obDxvdCUcEZhIZPOlVX1GkelC2+5hcu6NDW00Q28jhrQ?=
 =?us-ascii?Q?PDM3nETsiBOK1hiMOZbaP/j8tZ6/MWfmr4d2JvDpvJUOxcFKxcaNyHRkhbOC?=
 =?us-ascii?Q?NpqPbT50VWUvZ4I3LxnePK0AeUwZWxpaBbJfCdJxSX0mkQEHH7SR9WVoCK3p?=
 =?us-ascii?Q?IWud6vz5fF98wx2RHoBareeG/J4fMEctUxfBry0bukJVn4IyST1yWBsmyTe9?=
 =?us-ascii?Q?wdX0z/tUjTgw76BRdw/XBEHrdo7c7vLOe84SyE63shdyo7UEVNUnpkREFBqv?=
 =?us-ascii?Q?6ZzH/SR8tG3L/k7fsmXPrYJhwn5pp0/SeMDwRAUSX+TFQuNK7lBh0a0Xow47?=
 =?us-ascii?Q?HHpjVEzErLIWfUV1W7inmH5SAypMJbdW+sRq6v5XvCv0ibQPTpNbvowGZBHg?=
 =?us-ascii?Q?EpuAIERDDocBY1JkTAAZ2WAEhrnMezot5UrcG73QAEkOTW7TwwmLrSrKOP6h?=
 =?us-ascii?Q?z9b8wWV+MMNXkiPs5QEfW7QaM9HWyLfjP0adYsjKtOczMlbWSHJUiYNGl1Nl?=
 =?us-ascii?Q?AOsVzZJ6X3PN6Ceo1tv9+VyUjpYz4nJbPZupIHtVY3eaPUlfH7q7xp8irevd?=
 =?us-ascii?Q?aiCBXVc74qrNBPIkDp3fgp3tWZjJKCBHASGEOw4WYO8ewOpsiMEybbYno9w6?=
 =?us-ascii?Q?40i3usbVag4GlDxAG07R0xsE3Dih3/Chms8mnJssVF6fP+zYUeAkyGVV1HVO?=
 =?us-ascii?Q?orUm2iJ8W1ceHfwEVsXCPP1RipBIRHgBDEQydG60fVEmymEoMnQWLkRO7CRn?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6402cb-9750-43b1-ae9a-08dc9b03eee6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8025.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 02:00:37.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKdOAIt69Iv0PsG+p6tPx6dCHBvzb6MQSEs7TGclJ89LBJh1CkP9Tn9oIN1gmJyGHTyX344sEIe5KBAQ4HmxtqfjCJbMoS8mHSFpyC+Psqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4959
X-Proofpoint-GUID: uKcyUrp5LymQVZXClKYNa6FddtSJ-XLm
X-Proofpoint-ORIG-GUID: uKcyUrp5LymQVZXClKYNa6FddtSJ-XLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_18,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=670 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407030013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 02:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201448

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

Since GCC's configuration includes the crypto feature when specifying
'-mcpu=octeontx2', there's no need to additionally include this feature
in TUNE_FEATURES. Removing crypto to fix the following error:

aarch64-wrs-linux-clang: error: unsupported argument 'octeontx2+crypto' for option '-mcpu='

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
---
 meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
index e9d7a59c51..d51d19b980 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
@@ -9,6 +9,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 AVAILTUNES += "octeontx2"
 ARMPKGARCH:tune-octeontx2             = "octeontx2"
 # We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-octeontx2          = "aarch64 crypto octeontx2"
+TUNE_FEATURES:tune-octeontx2          = "aarch64 octeontx2"
 PACKAGE_EXTRA_ARCHS:tune-octeontx2    = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} octeontx2"
 BASE_LIB:tune-octeontx2               = "lib64"
-- 
2.45.0


