Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465D5C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 06:00:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.624.1784095246001597210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 23:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f5GmceQ/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=165692db3c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3leEK3626613
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 23:00:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=kQdpW0lToFpdOrEv5j9+c7HIuLNLEl3NKLYRu2AZ3Ks=; b=
	f5GmceQ/KnI49oS3baQTxpzUtEjHQ1LHnYDhuUh0tIgwtdaVcR2ioUqJXdq+5vYM
	Hi3UtSSiegVOpnmfS+oz9fSItwolcdNF81Bps5Jy/QvYVwsDUyiSsDOwRlhcaZbj
	ys6yfizgMIcYoOAcwzxBnarFeLZr09pmK8ufSMDepYc0RlTdY37LjFSKrrOXsx5W
	QNiz4c+5Y6LW+eA4julX8sCpUH7EGusqT6qmng1HkT5ukfOq8b1hqa8HacAOZ4QQ
	U0YazAxeD+fBblxbGXh+tGaDfmfjM7egsCDUDYVLwo0ritRlEya5y0HfCl7a0nEC
	6o5JkL2gcTgPYZIygL/HhQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbh40wfvb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 23:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dr3evNT95Kcg7J6GQsVnjeintjdrjClDwk7SttAOAYUWhU1X0F/v+xxGHdYW9QbOEMUtL5ZWuAjMocQ2zRMfAyB50341pikUX8l34ZVF1XeoQBhdy6QF5yptJTNj1P+lHrIilhM5mBBhYt+w3i6mKbiZKotaP/V6t3SUtUNECThsN+FnPxQw8HnO94x05hqoYLBNPKyalQYZCYTbCNImfEYZtPNA91AK0Y6+dRF7BLXAXW5pvO8mhP1m8Q+9xFliHt7f1rmBirmvJlKIsKVvjDTB/p1daww6zE4iBTiI8YBsiMcFsB6/3yZvVGOr1z4KxLgSx1MR3PsZeUDeTTEoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQdpW0lToFpdOrEv5j9+c7HIuLNLEl3NKLYRu2AZ3Ks=;
 b=Fh2pLMusQUamIHA+2vYrrJ/9D5L7t3qJPxXHJ1jpcVFCO9wh4+qOtnZJ2aQfx1XbVb/UxkScgNflb/KVnW+Itg2R3B/VqRrhAfReISnTluieTZsAX33WyJuPAWayebJ9bKIZBjU8srf1REwzrbUpXP/xUEmbj+GYpfBNZVAFXtPla4Ru3uTEL6NEOE0MewFzeyadChJdNhZe4uaibFkxvhSJb+08Flv+frB3kYHEHQZlYgznxlrl5n0C9HiYBCwGxv7h1t9zd/zWrfDtfMtfMBJ2wEILGhndgZkV4wr7IGM8OK+0SWSCuR/wwOuweN2JYgKx/zWwAZ0s4vuJ1is/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 06:00:43 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 06:00:43 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 1/3] clang-tools-extra: disable tests
Date: Tue, 14 Jul 2026 23:00:19 -0700
Message-ID: <20260715060021.579656-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
References: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c82ed31-75fb-4a75-e87f-08dee23667f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|18002099003|22082099003|38350700014|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	5FP2EOJwp0ph1c7li3jeo8+rwDDZHxfbMjXIN/4n/MXiULRan/9B3znPDklww3urTSXRBndPCrhJ+tKBSZ8JDyD3kGbqw96D2FtighIyCq96l0zzmH5OPp6CCtLWxQbQV8qAiOaUSDg4ANAR/15dxNE2QMfnjSYe3pFGTdXuu9gWfPMbK8RV3ogZKVXEPfxQAECbRN9M2JhR7Q3UaIVuyZF4GEXh2VNLdBVc98ky6n/ejFKN3s7lOCuATIABnWHWVk0z5nztOzeH0tUo0weVqsuAclON1+iM03Isko6f/KGe4JvEWWc3HD1qY9G33HLYxuenLxUq9I5UGVnCZnRc3X88Z42boJURdPCtPpJwj2+ZgBhtS+c+DoxNve54oBK8+eupcHOfwnBpINbHJDLJY7596TdLOYeYjA5OJG5wi52kUKNAfEd3mN2x5Mf5uvbK2K8e9m3ImIjvKOe+WPLVWC7ua3efR8pB/n3qC+PCbISwPDaGG9s54AGpEt4+9qRwNdxGc92ai3xkjJbtlQ/pHn6jQLVPkE72tYOv2nz1ThTz7htyQYaH2zKXNhFMcvFa5rNZ9z5TLs6K/H2r30I9JaL87XEG5SxlroYdzo0RHBPM5ZXrB/8EhLPBIdix4Eg76KpuvJ56XcyV+iNcO5qKSD+7R9syzsJj88N64S+EAet8d3E/e2HK1i3Znoj3A30GSC0thIXn8VazWL8lXqCqvCdbM7RemJuNL9q88JIzLY0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(18002099003)(22082099003)(38350700014)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5TMo90z8i9ET6dOI4QDi5PF95IQLMrEOHgRW14qIc3wFCZiGRadY+GHgAFg+?=
 =?us-ascii?Q?3P/Kv5WEzjV0tfWLdrjclDmypWMnjUFtfuHFWpP7Jsc4vcCXToxrJz0+Ksw2?=
 =?us-ascii?Q?reUb45M9hQWGPQ4VUDG47ym67IVhrqTFbsh3Zh5IiwyWwY0yfFgjKdfBPVkm?=
 =?us-ascii?Q?RBPmczzrwzEcSrwwIsYqK9NqcYDawjbMWOKYa/1moMuShb0f0ncQLiHXtmAh?=
 =?us-ascii?Q?wXQLvUYCOvF+H5JMG+2v6IEuHValyodCK094c4KEwgW49plB5KIeSRz+nzrI?=
 =?us-ascii?Q?yxCrjt79w4yfbzMP75SQ6N13wf+BISrzcUOSHWCWXrvzQVbfRkrjKX2CSUXZ?=
 =?us-ascii?Q?3zqsz0kMy7NF5DXtOmROFJKRBnIGpPcZYldFNNCmZAF2ihhj3wx/oZOOxQEV?=
 =?us-ascii?Q?8j2k2FjVbxCHqWNjCY7uh/e0lMLAZ9wtVE6Le4Tc0UNCnXB0P+sDaB7WUs+z?=
 =?us-ascii?Q?uEaBJ0liMktlm63h1kr+t5CuM55fT2EkHApNPdDNmYxZDR3fhUlh5m0L/2yW?=
 =?us-ascii?Q?IttgOFqQfhMR0CfbBn7s8Hh2xjh9TjKyjVTDXeMGm4nT21TKUFXpcMtHzmVH?=
 =?us-ascii?Q?e/U9Qom3317UH10TLBxuzFmFF63mLiMmvEpEgt6gQR0Cb7dOQ1GIYqvkl6U0?=
 =?us-ascii?Q?cOb6tmdeuw4BJsLtXYvhdBM2eDEuZdzwuJ/Xsk6VLVOvitD5QKnbJSwDGfBd?=
 =?us-ascii?Q?16KcLjZF/CmBmeu1+i0NNTCxyo98wMbv3RfGodCmi0B6doJXhfSl6o1ganib?=
 =?us-ascii?Q?yY1eNBZkgO56ir6ywo2vN9qtrsSptj6Y6GQO4eRKmDxbX422PGdZhV6f4BDf?=
 =?us-ascii?Q?D2YxiHHoHnPwvPX9cDmOUaRf2o/U/IV9z0m0mFfG7awvennES1IOv9cWSFhQ?=
 =?us-ascii?Q?qth1J1vE0vl9+IhXxXxZssnzlapMVzreFupq74gYJft2jiDbw1ENv9ayX5z3?=
 =?us-ascii?Q?tfa32xQWWyUJNgxovVt0KnLRLPwlCoBTm68nVm8phGm5pFyPW6Qc3O4yenwR?=
 =?us-ascii?Q?gBxCJhex/urDG74SaOJacnEgr7APzFrt+sKNd7hqBP1ML4gDqsfZWgZ07vlS?=
 =?us-ascii?Q?fGmbM+rvh36OAjzzupVAdd48h6HG1aFeTX3TRNlrTi1eTdea0ZLSJoATt7zk?=
 =?us-ascii?Q?Ajj50i2td6XwHfOL3MLjEvhe8ubUNbCWNO5gCShXw63YaCta9iyOJsSqNUOz?=
 =?us-ascii?Q?bQQAwG7Hst622VJpN7ebIQRynej7ZQFrKuG8q9j+KFr2Looup58agssJBE5X?=
 =?us-ascii?Q?mkVinK95DTkmU2JxU0GkdcS21WZDc9Hhw56UeszJYIyN+orXTRZe3gvCWmak?=
 =?us-ascii?Q?Oy3lk250xsdm6+PBAzMkPDzyRXU3JkF2jn+61cqv/hU27ZtUx0QWkCVREdls?=
 =?us-ascii?Q?Z3fvSzoM+7gSfsmiJbuUsnKD/mPYib08UvztVq2ix5kYFcZvns/8pXnfMXRf?=
 =?us-ascii?Q?SlKC6jmM80e+9RAmLvY+51jAZn/QmRtgzLQBiXNn+1YOOiuGTpB8YbGEHmPB?=
 =?us-ascii?Q?zFtLcFZM6jPLHCtv3iu2lCF3tZ99JLh+Zyfm08b8GBfTgVdBMKs9zwN0BgV5?=
 =?us-ascii?Q?xoN11d1fE4qFKj5wjNV3TKC86sXbBsoByTlFLMpT/RLKMRMVOu0vRTPFh11K?=
 =?us-ascii?Q?azmZMnHtmdA5T41mXwES432/OMrW/j2ohppW2HE0WtPoWFD03HICxrKFLYYv?=
 =?us-ascii?Q?bjLmEhQxEEN7x59JC1LfwxpQqy5RlQVTjKgqX+5fqJCmi18axQereX81jepM?=
 =?us-ascii?Q?PaSexoc2lOIWDYuQ6GQ0eI2UMMCJjNZxIyVtkmTrgds1PJRUtC6v?=
X-Exchange-RoutingPolicyChecked: 
	qKJ6BnE+059aIXDwNwGblTXsKPKq5EKNddJkli2pW6lGSEG5yC9d/8L5IwgRACTGiBqP8PwJKQlHY0VMPutd+Y4Xw79AqX0aKy9kJuN8C0mqSwsmeWLXy/yytjTMDmOrpz0I5C0JO2FbYvDbuvEVNrEWpgpPLeXu7kNHuvdeixOEqOIQa/tknlgc2oPFtexUprZM7CE0Rph7NFplal2kONfAyNVJEtGATSxENTLwDf1uaefGglYhd+yGLQT4aYPq4KfhhPvA+5I5512TzPOFd/BeTCfDdwuAJ5L3emb4jjIihtpjrF7H9GqhOYbTVNRxo6id8quA8CJnF6YiTaivDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c82ed31-75fb-4a75-e87f-08dee23667f2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:00:43.4255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBfADmxfkbSjoYG8gSR9IDykDiw2ev1UY5UlZSzcjFUg/qqLLVqAuz1TIOiUWdeCTZZKUo0yP6m+F5od/ThRRmsjzCL0mE+QHW4sIlBZ88IqZrHs3nn3VEScwiODQJQe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfXymQi88DWtQzN
 +IQBYppQxB5LHB6GogfiYsl+cVzJ7eBZLaMZ5P1NBUMf26S+G3FZZuRRTVmvHuKqxp3+2O+Y72T
 y/KCF8ZAOHCMvwXTEd7101sOf/XVdVQV9hJhPxewPWFWj1DlSj+Wfu1eMyMSpDZI0Wir3ddvaCq
 KVBpJozqhrf5QTEt59Kwwx7umVH6FC5oTihrAcdRpW02++gGEGFqWcaG+KgADIGkoVXFFlaJjy+
 cKC6/lbrE3+qskuenQtCFGlgNJHzg5Ose1CsrLM1O0KEsZVXtAw0QDgvZUegr+gVdOvVLa+sm16
 i04opS1qWjmhCDwapLePklWEfUMlFYjckGow0mnsZXg88hifC6j1yz6sGzei7i4B/wfG2JL0hKq
 0si1gaBr27lWwANt6qdK+3RckvD2qyNNKjLxTWEtUW4xDS8qUesrh5Smz3uwtMRltj6Hyo26B+T
 rVQYzmyjizpJRsnYxyQ==
X-Proofpoint-ORIG-GUID: 2cY4TlWmqFISrmPgyiqJlj23dIk7DOt6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfXwKsIVT+BLoop
 Egs4qYtnY4U/qGoqTKt+3UgZN34wacdTk8LWSKUIVo/BUbIZ40zAEpg/V/40SGXs4ed1RzUp/KY
 Eumv1glLwgefj0dr4cuhM+SHoFVCUWq0kRU6emPbeXZyJt+Mm/ss
X-Authority-Analysis: v=2.4 cv=JbGMa0KV c=1 sm=1 tr=0 ts=6a57220d cx=c_pps
 a=JgOmb2+ItGzuqF5frRSN9Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=IQOrjEw-PoaY6VFe8koA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2cY4TlWmqFISrmPgyiqJlj23dIk7DOt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 06:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240939

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
exists in LLVM's CMake project but is not visible when Clang is built
separately. To run clang tests, disable clang-tools-extra tests for now.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../0042-guard-clang-tools-extra-test.patch   | 74 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

diff --git a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
new file mode 100644
index 0000000000..9b4e29ff64
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
@@ -0,0 +1,74 @@
+clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
+exists in LLVM's CMake project but is not visible when Clang is built
+separately. To run clang tests, disable clang-tools-extra tests for now.
+
+Without this patch when CLANG_INCLUDE_TESTS is ON got the following error
+
+--------------------------------------------------------------------------------
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-clang-tidy-infrastructure-header-filter-from-config-file-simple"
+|   does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+|
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-modularize" does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+-------------------------------------------------------------------------------
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
+index 6b6f2b1..26e4c10 100644
+--- a/clang-tools-extra/CMakeLists.txt
++++ b/clang-tools-extra/CMakeLists.txt
+@@ -8,7 +8,7 @@ include(GNUInstallDirs)
+ option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS
+   "Enable query-based custom checks in clang-tidy" ON)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   umbrella_lit_testsuite_begin(check-clang-tools)
+
+   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" OFF)
+@@ -45,7 +45,7 @@ if (CLANG_ENABLE_CLANGD)
+ endif()
+
+ # Add the common testsuite after all the tools.
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+   umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tools-extra/include-cleaner/CMakeLists.txt
+index dc147f9..4855577 100644
+--- a/clang-tools-extra/include-cleaner/CMakeLists.txt
++++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ include_directories(include)
+ add_subdirectory(lib)
+ add_subdirectory(tool)
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
+index a1e9da4..94dcb96 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -215,7 +215,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 441ea099a9..d623990eca 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
     file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch \
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
     file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
+    file://0042-guard-clang-tools-extra-test.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.49.0


