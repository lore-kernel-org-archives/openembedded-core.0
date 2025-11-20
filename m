Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D53CCF64BB
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 06:45:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28764.1763621100736356382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 22:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rwPJKBet;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34199b9cbe=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK6eqlo243882
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 22:45:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NYqIZnctQcbvs2yJLzjT
	sNV9Ly/JqRXHlNAZZHrVb1k=; b=rwPJKBet0nLGsFXlMOlemFzvhFacrTSgQN07
	/uSsQEwzGw9LFS0vNbesy+RESlmhIRDZoeY3aa8AEV4q7OuQaC1++DY/C6RRPsVK
	N794OsDfMHyWnSbhHt07YZHjdWy5eWDMQdGhfAb/ryAHpvhpHIH0Fkf5VkC5DKPJ
	OMdZwRRKJDK57snt0zAi2+BYw++w5OAFXYe5u2lzS9AjDD6ifQtsCtkCpO0obH+K
	UexQQTSUdeSURTchIINHFhcEXXOeo/oBwzQvBeBewdYGrCghJDM8A0C5/0a3oOgi
	yp/b0CaV0PbjcTzG1NhhcK6sbnXl0B+Bb+omLCaTpdCMtg4Zbg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013040.outbound.protection.outlook.com [40.107.201.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2x05g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 22:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQiLYJZr28PYE+N7yhYDfqdnCzQfH1OVkAZgvVlDh7VBHJoiKBbBwqCucD8JAsBkmFHCx2c9qjfDeZK7Un5Vr6P5ng74q1i+1+/tCkkp0R6rXRS1Xd7TkE1FOQLDPXpR80B69vOw54SOY/B07ZQPhBtSP+9e9RjAohKdeX6pKsOqss3uum64NNKf8sj9tk8TFXcPLujphkoZtGPt0Rt8HvrTo2np2KgB5q559tQpGchAts37432vM5MgZ+EFxGncB7WkzW1rasAgOqlOJscebXEeBGTTLQ5bQwCBslE3S9ukYP3+XZrtv4GHiM4Bt+m5LS05y8UPXX3qxyPuSIIWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYqIZnctQcbvs2yJLzjTsNV9Ly/JqRXHlNAZZHrVb1k=;
 b=WtbGokOZZfQKPhFqiK8MumNI9LJSSI+k6bm98YfM6QyFZyw+JxfJ1cXyI1cVc1YJVeroCl3Ev369ARo0giAp4YU9D0m/H/R3sQz7lU/UuVJ2bSl/+ARyXLO8++KAnqzvjmMPEVpEH9J/auA2SlYd3swhdb3ZHaytbwICtdaSnODsriG6I16K9WowwjyynPuaYT1nxRYDiOyGBLRxEXDYVgky2Xph1wMK6qFxI7FqaQR9ZSOB1n9ixCFPgQ+xyAzSA2Q5C4fC7W7b5s6UnqGpkVvng5xcoChda5936w6XSwXGjhK1HKVQAe5l4uP9sfLJvk/YZTkG0qXIl80h3pu3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB6400.namprd11.prod.outlook.com (2603:10b6:8:c7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Thu, 20 Nov 2025 06:44:58 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 06:44:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rpcbind: set the owner of /run/rpcbind to rpc
Date: Thu, 20 Nov 2025 14:44:41 +0800
Message-Id: <20251120064441.4106336-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: d82e1758-7328-4645-4a11-08de28005220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n5uUWiLIm7Vmdwkl91Bz+I6klckqK5NCLG3tUNZjeSXOIoG6rnvPrKg4WawD?=
 =?us-ascii?Q?ei96YHw8WJ/NiG60jquDQvUdHDpxVvKTuztGwxt4mXnhUu2dA0Cx/eymiNyV?=
 =?us-ascii?Q?zk258AqpqdgHIeTr8GPVQ+kVHfR5kUqJvXTGK6LOzdbt38IWBqEnERtDdnu8?=
 =?us-ascii?Q?oIusM20phuL1m/wl4Ovzqd37xSx3L/pZqY+BX7dbiBADZIiN/ArdvnHvGvQC?=
 =?us-ascii?Q?ESgtZjO4KWhcl5m+f8S8ViDbimeWJrTMyilryXa1Ij1lEyntXa93afXybo3+?=
 =?us-ascii?Q?ZzvvX2h03u3rXkO2PmMG4spLzCKrFpDm+fReEXt7becbZdkAwEsHnSASp0nX?=
 =?us-ascii?Q?V9Y13uxAYWNqVNWBKD6i7hzL7tzbEobRLMa7X9ggTg0GbEv++e5jbYmQm2u4?=
 =?us-ascii?Q?VNVpkEbwWOjH/syLBhb/9ViG10T0T7CbhsQaz4fwsl1fHT5JlNr55EvHtprT?=
 =?us-ascii?Q?uj0AkY+DmHLqfOErCHvuIdytQpEI0o4iYW4loCBMbVUXl4ycMyem8LCGlKcq?=
 =?us-ascii?Q?D5U8ThleMSLbVVdK231B2QJrCwuY4FoKBerNEw0NOcUvAb9vI6uQuoXsB4h+?=
 =?us-ascii?Q?dM1rVF9o/i7Q/M2r6vMaUBhmg1OFbLkEzGEUzIDkSLl1zmZvphV+n092SP6V?=
 =?us-ascii?Q?+zsy/GodAc0JKAGqxWldnU9OECh1XsaI0YbUGs57V8CFGwrX8ReQjdrDmSY/?=
 =?us-ascii?Q?rGS1GNshrkH1xggzKDQFs8Ctc0MJTNhkbcZ+plHct5gSdVDNbIxC4ncU19Z7?=
 =?us-ascii?Q?bYY2aRI/O5r8sOkhpXedZ8wPqUvAmjMKIXNfWDgRN/OsFKELlvyjGqGxx8Yc?=
 =?us-ascii?Q?yWl33nrrBPtYtyNPAFEA5ZyACegxHJVm6WMqZNf8d/9e02lg2orNji0k4J3T?=
 =?us-ascii?Q?ORRbzLVObUOl9z9ZJUSDd9hv/aWB00kML7Cln5RbpwuwDi9rCFfVwUcmh34B?=
 =?us-ascii?Q?czDHp9nDt0K6SGBEKC+nNkUuhjw2wDhZ0uHwrb2aoHfI2g4dvp/qpu7rmTuh?=
 =?us-ascii?Q?lSo1j9m+sl8OdrlAXMAR+eWVpKXxwG6Q2ng4gHFYZGlBZUZsocYSHgqR58q5?=
 =?us-ascii?Q?2oFYL50lcsL88+qvKBgf9e9wfAC4fPFQ6JrYW7br8w4VuUeifdpAome5RZXR?=
 =?us-ascii?Q?0pKf/6pYKz1hOrqTJip+TLPV+JM+vnN/8rq5pdbaH6terQDf44L/7aR8SPHw?=
 =?us-ascii?Q?o8IyLHrPdO0RZyBNn0Mw+1hGHzdtZmVGp+Vli9aBcXxEFs9dL+iCAyjaCfg4?=
 =?us-ascii?Q?YkA/wi66Y0CNMOYKQP3hHOBWaOw/2dX2KGGbdZ/UwoZ1IaFtBSXF/Kt6JUEC?=
 =?us-ascii?Q?Nk7nK3oo2T5MhSwM+olRGefcb4dMDeOyrZgXsW90BROKFRpU2pGh7/ULnDFH?=
 =?us-ascii?Q?2vP0piHD0zfO21HcuNKdHgMY/RoVsA+hhgg2ky+mq0sBjiHdzkeZVjBycOe3?=
 =?us-ascii?Q?2ltDnJwON8PotAKX/vvpkzO1pkbD6XCa+OGng7AYOVFpEDGvCFd33NKlxOQK?=
 =?us-ascii?Q?LpMLM+G7LZq67Ba9KhoUmsuK8vWL/mfI/c8B?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nuHEbRTDAyYBXOvYDN/8XfWL8fRUoGwGkbhHUptO+3aUfbB6zknf42p5DLKc?=
 =?us-ascii?Q?vszftyRHZpUItKh6BaI1NbmAUJRLneUvmtKvoU6rCZy+t87jimZQJeZd8k4E?=
 =?us-ascii?Q?FWwaz7JDO6OMW4NocjnXwGaF1L3ZMgze7TLlRYRTqWszTBdeJC9SBuo3G5wq?=
 =?us-ascii?Q?qrqF9WfosSylvX0PL3x73Op2UE20RaRiclMaSXBsXbr6pg7+RJ0eWc1lsZF/?=
 =?us-ascii?Q?zySxfOqNZAWmaxE828/3o/TkdYSf+9jhYChX8qKTH0g9UlE9xUBfqkwb38Vt?=
 =?us-ascii?Q?6V3+JQC+oiLi93uAC2Mjt++MGSANEVNWjEM5Njl9AtQ+zeYF7oJWsiDXq3Ws?=
 =?us-ascii?Q?62iBq8DbVNwOeibDCVXetHtLzxpMTBoj8Tw9jns1UiLDRJ/XRy9YjUdqDkVG?=
 =?us-ascii?Q?F7Pw1qmCqLSV75G+I7yMyQ3ib/Jp2mnaoAH39TNY4F4IUPEOITnj8xkKp69F?=
 =?us-ascii?Q?NeD7aeclkeRa6pAsDuGWhO7vooJ0J/ALPkIIzeWXPFlIarsSJI7N3c2fnZSH?=
 =?us-ascii?Q?/I1YAH3nEKaTGIs3s35WUqFqratDw3BhQ4kbpNpGdM25kYD7El34s0W+fW9T?=
 =?us-ascii?Q?80leVpsJQ9dGZwBICg915Z4OueSQwBgOTP53x9zSKET8XkfEmQIau+4VM39A?=
 =?us-ascii?Q?PzxRo9cYSZ8Lmn+xb54mv8XHIt78D+HTssD9JjijSc0ONjcbXHaKl2mR/q11?=
 =?us-ascii?Q?5BNKjlp+AHIu4ti17Fcz6ltTdA9+t8G02jhP07tSqdHadS1/9mazK2h3ii9O?=
 =?us-ascii?Q?gtFNElt/4WdbCz/kFzYS+d/s7pNWa8aikKgwrZQe2ngr9H6kcN654jFYEaN/?=
 =?us-ascii?Q?huA2LQe8lNxgVr+1IW/1BrbggVKI7n0h7s1eQS42qqjcykDibBtsNlxVDfId?=
 =?us-ascii?Q?24IQ0UIJuHGuTpGBIAVUdkoKeaxyQDZEhe11Afp2euKPvMsHnbstOfRj/gDn?=
 =?us-ascii?Q?vbHRQodE9bD4eQlkIsHPDu7TMPGwNz26QlU3XBi5hXX8p1lQTzwtla22f/mZ?=
 =?us-ascii?Q?wOQ01png0rLHR8VRCOggX03btKe9vfCQMlNwPliTVm7Dz17BFmXdcJf6vzhY?=
 =?us-ascii?Q?ahn3BVAlzENTOSkUlkVpqS6UWDXS2LpWqyzIYEimwlJA7edcLRwZp6Tw6jHC?=
 =?us-ascii?Q?DsDfAqBI7uamHuimNIyQgPI0MQWYak81DaLdt9qsjVaJqAJFzelpNZpy6UVv?=
 =?us-ascii?Q?38TGkqw6AhWNyHN76yFWFO70RE+ruBe4RVDKMRwaQ79fr48nmAe237SgsPgs?=
 =?us-ascii?Q?lZXSy0z+JMEO2inUM5eCSAvX4QZ/j4MWfDzP1dAtg+81ALG9VEZqF0lYqie/?=
 =?us-ascii?Q?pSlqUP13ubfZajDStu2o9n8HVoo9mg7RtijDhlYA+mmaZKbiIoPm7PyGG9UN?=
 =?us-ascii?Q?kXehbsiPklfa2KLD2oEKV316iQiwjQAtUGN9ZUivyg2fSOuNBwe2NDh51Mog?=
 =?us-ascii?Q?30Du82uXswsfpPmtfY1fnr/X0ZwmTCOKcHaCKc5k8SKIq1UF1nGlBgNjZ9s7?=
 =?us-ascii?Q?lMAd+W0rJZm5qVEEL+7mw57hyIAu0RVHJvi1fqwTwysU2mERGxXdb96e4olX?=
 =?us-ascii?Q?J81UkAl+nMHuAXcT6XdFWXFu+LaYZTK9anej1JuW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82e1758-7328-4645-4a11-08de28005220
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:44:57.9419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XhjUCkYflEIUb7fLaMkymembntBE9McxP7XM0rOSYXEvuJ1PvM+eNBN/hjwPLL0/GhNl676J6SkBFwsz9F2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAzOCBTYWx0ZWRfX7mSIrmeBmx9l
 IkTjnCgi5RVLWSPKirT6dQlkza9VZPXwoenT3Nd1tWxrIItiZsewloA6ddHFVqwpU56MnjARuMF
 nbOZK+75QPufzkoQkmgvZMCyNy4C5o9TCKomRzTN/59d6PT35hQ23wtKdYR1v8D4ldQ3IlfOdEn
 hqQQ0fgkM/hbmafADOQKj3reu2K5EfxhyfLGCXpA8STHcLcKUGqHitOC+TRTUSxrcP/1GiITf48
 jK57QaUL0zQG1uykBM+5lMvoUkOcRc0k0ed2kHeMHP0jJEViJlkO91/pqxCP7hYAcgWlcNM4dOY
 GFlzCBwE81mIGbkWXIkWVorLuKRm44dfsZ19NHg096KNFhTJBrmjQwyy/CmYE4GscQFkSubGfEh
 mDZN2WVppUSUIWmDIlFZN49r5U4SZQ==
X-Proofpoint-ORIG-GUID: XF4bInaei1pCMdvcE0qN_xammxZwKN-T
X-Proofpoint-GUID: XF4bInaei1pCMdvcE0qN_xammxZwKN-T
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691eb8ec cx=c_pps
 a=dJs83p8YoJtII+u9Eez95A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=RNwPn-hRt4MEGQwDI_sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 06:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226605

The current owner of /run/rpcbind is root, which prevents the rpc user
from creating files in this directory. When the rpcbind service is
stopped, the following errors are logged:

$ systemctl stop rpcbind
 systemd[1]: Stopping RPC Bind...
 rpcbind[270]: cannot open file = /run/rpcbind/rpcbind.xdr for writing
 rpcbind[270]: cannot save any registration
 rpcbind[270]: cannot open file = /run/rpcbind/portmap.xdr for writing
 rpcbind[270]: cannot save any registration
 systemd[1]: rpcbind.service: Deactivated successfully.
 systemd[1]: Stopped RPC Bind.

Set the owner of /run/rpcbind to rpc to fix this issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
index fecee72c09..65805e7263 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
@@ -1 +1 @@
-d /run/rpcbind 0755 root root -
+d /run/rpcbind 0755 rpc rpc -
-- 
2.34.1


