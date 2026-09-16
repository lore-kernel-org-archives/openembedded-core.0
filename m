Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF58C982C5
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 15:24:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17631.1789572233968803464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 08:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nKwlqHiR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3719b62dd9=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFCtjK1406541
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=VJdWPUNCm
	IdFyFSsd3TOd5ofeYf4eyYoq+qxKXEZZOg=; b=nKwlqHiRdmM5FnkSfAw8KUCc0
	ReP1FSL+F0Fha/3tNBQEmLn+9nUTj1jQI/RTtceeqw0jYqNns0BU4yHnhciQ1ajr
	ncWtJH8+xeSslNgIku9kyozreiosD59ep/p7U1RydTQ5vA8Hx1ZpIIBMj7VY2A4g
	mJf3OOCEuX70d6spl8Fodk5KqzQOKkv8+CQ8lksPuHbVDVriE603IMdxVQw6F7+r
	gCx3rXkr9uZQvGwPwt3g+26qWGxYd7ox1Dl0q4fNYFkU4rjVrBSSti5G9xH+S36O
	QhgglsGzXSfuZk3mFcYEUOy6C09lwZlHqzyrGYMbgq3w4z5Kmy5LP2DqIDlug==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021110.outbound.protection.outlook.com [40.107.208.110])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gqvxdr37e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:23:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y12Vo17OU8M4deMdB8C5NIuqhU2P1U6PVsQAryOz0zZ2DsmdIwzVB2Hvn2uUIF3z7jKtwy7olwHxHkSpxhqyCQItEwMtRFPYu/aPmOhKBqBfCyjF1v5VMT1zBdj1HEBCZZeDz7qTo1xetmFq4mC7aiCBQVXN1WUVYcJdVXgFJ7qVPcG4XGTUD/yAIu6EJAbmHyspQs5GaAkzpBjq/pvX7YqG4qH3cLkVf3j9/mBCn5C6PMrl31zbTw+7GfDKWrvBF9AI1h7XoWCEcgsAfAzRF2G4c6ScWWFP6p01swa2mDR+WoTMr/KImS1EmIbQDmk94jJFs1xWAhVjrYgcXRYEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJdWPUNCmIdFyFSsd3TOd5ofeYf4eyYoq+qxKXEZZOg=;
 b=ljoIFAKD1/rMCzDLYcVcdlGVKRn4iE83LPRucB9eOR1i6tl2ewr71kgTUyE5c/iqME9b/Kp0eGKoPMBvD17acwc0zOAgAdFMQddE4y4dGg48vmhMCQMRdDzwPtjsMk3ACvrGobbM3JH7WZVt1Hw53OrwIG6CMs+XyVG3DGYymwKE5uHoFpAokBghjc0Qpx4X/zdeGWCDroE0/eaXQHxVhf45AOYsgMMydOGCOchWWlxCXJc5JbmCdc7Vhlx65aL9hvmm6mmx3mxLuRtckL0xTzf76SLh9W6cZ6nPscede5huH6O5nb384U1IlxNqJGdO5kn9orxVJHKfBMk6OrdviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA3PR11MB9184.namprd11.prod.outlook.com (2603:10b6:208:570::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Wed, 16 Sep 2026 15:23:49 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:23:49 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, alejandro@enedino.org,
        antonin.godard@bootlin.com, sunilkumar.dora@windriver.com
Subject: [PATCH v2 0/5] rust: reproducibility fixes for arm build hosts
Date: Wed, 16 Sep 2026 20:53:21 +0530
Message-ID: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA3PR11MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 594136e6-c3d5-47b3-5d4c-08df140681aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6Umhhdqs48vp/K8lyJ6HEvr4TfjWhsu3ncljpRBYXnQAiH3NgXalYdVDuWr4r4UmVzUsWSeX8eLjNYugNLkTu3dPl7bBe0yfdeFYAm09MNx1cvmKkUzIPj5jRyFGWbic2xg6Asep4BaOJhwFcOpDt7hrU3V1pRwZa+VaVQI2YBTLyMpm/+f9tJh2y2e0LjA3XBKYhIg3gbDxDfK+Ca/OrA6jQSP2qdF8OndbZHyG243jxyg90NU7pCil9YMxRaUEtspJGChredUCfk+3zg7h0y62oncAqiYSYgM36h4SW+QtS8uoW4Pe7s6ULDo9zfg6LLqmg3vQrQSR8ZSNcYdNGWhgzYVCI4IzenhTtX7E8bQrHFNAxdv+QO80+Z7ZVnV+7qxQV/8dmx+Ej2Vsq6EoFc93teIaa/VkXdoWZ49QlEy8sF+b8sys1McBT5Z50pT/ls+j/SEh37k1ZcCAnUiGFRiy5VnkruveXNhtZsY1OXNcAJ52zD2C+fsDMbwjqVMhdS2Vp4D5hk/5JNrZiHixMZmM+XhsddVe7ngkEONAwJHc9vpifhUqwIAggeWErM/b0DR3qlaZwdF/mJ8xuOHQ8+GhQ6RoMYFGbAzxYd+CHzzZBX7W/L+QpBmQMPReDSMe2sgF6vw+qTzWXVj0AQ9/vRsME5eXsW/ofaTqB0HIGKI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vebEsEpCf1ZVT6FZQwumC1dTXSsTvsihdyl2NyVOUDCOevhVZbkBSjULrlUT?=
 =?us-ascii?Q?eXRslhn6KVvzhJw1obRycpSWy6uuKevlRQgJ+srjMdKDgz9deTPxOQY0NtMS?=
 =?us-ascii?Q?oohz0LttwsFQfs/sfupINs/yF6KaRMbWPOGqmmDKgCoJaSa6NnhQ5rfgl4K7?=
 =?us-ascii?Q?4Uxu3xMgzVNQaipWQdf1mavOp5KiDGL26k1sEzfFR/YebM1cb+7fUbYZV06r?=
 =?us-ascii?Q?QGCWBsJ0YTOribXgcPjFhs5A4OauLgLxh90Ma3rdaAwoM6wi6qx/vLhqN8HZ?=
 =?us-ascii?Q?PVx/SfiZA4fGTeuPIza5Sf7wLRvJSAYSi6HTR05tViyM5pySuTxr8eW1zCDe?=
 =?us-ascii?Q?+zGlliLII3QizV7Da2XlFrRsxBZtK8SLBJZGarZwkHQCYCgaDiWhD8eeoxTo?=
 =?us-ascii?Q?k52PinL5Mr8VphW0Kq/rbIGRgEZ3xP6jWnvtfFTsUHB2tLvhP30lbHr8Jqwg?=
 =?us-ascii?Q?SUr52QkfqlvEyCynKv6oV8PUJX9mobP5d1pIroAmukFzEDZzNP2bewt96jVy?=
 =?us-ascii?Q?Ocdi4krKNRvQl0/x+TM/mThL0J2GIPX79ciqapslDrYsHt3AFRRc0orWe8VW?=
 =?us-ascii?Q?0DkYa3fyrwJsNCUBQ6Tfe3NgqulhZQqVK1xQVoz1QzoE4rif2l7xt3HeR2KS?=
 =?us-ascii?Q?kjbwpAm4i/Z8hGPwBdmZ6bjXHum4cWGHevQ5ZF3JsJG4nokfAdEVY387Ibrd?=
 =?us-ascii?Q?J26PAL92x0TTPEPC3N1V8c4sp5W2V0xvioXWV/Z2YFh9i7kTrPVxpdYdVM7W?=
 =?us-ascii?Q?DN80Pjh7jtrcQ6kZ/4ZL+S2Ip/B/CCrhjiEFB5IT+UJFygtTA5bZcIq+xX+z?=
 =?us-ascii?Q?5UEnD81hSCMHaAkg1sSRyTJy8m2FDBBx3XKI1RIXeNGnF3LpW0Of0AIVhjiN?=
 =?us-ascii?Q?uueJ8fflzdx2hF2Uke5iqVMiQVKYA/W19r6Th2Rlqny+UZXrWNOydS0RPQzX?=
 =?us-ascii?Q?9fLfg9px3EkijK5VtOHVWzx5xc4jCtBUvBqOJQV4vXARWYTLlle9L3IrcZeQ?=
 =?us-ascii?Q?ArLnrNcOIFzOFUcrAH42GlHqU24w3wI7U2pPo9EIEnrh9h3+r/xMYGnRwXPF?=
 =?us-ascii?Q?J0y6OUJ5L4oXHhRf56JzMc5jOCNE53oXF+e7wH8QR5/tUfGtdHjkp15CknWt?=
 =?us-ascii?Q?FJUBKN//fzpFt2Xz/hkQcKypPcour6zys/3MzmD1jo6u8ZTmkrBqbXR/6smr?=
 =?us-ascii?Q?AQ1QV5+A3Wa8RQFzvx3bUk9gNLay4Mscf6t9Mh+AyeZV16QWA6TE53hmDjMl?=
 =?us-ascii?Q?g1vfHm3T+NNz9ri6+t+oMSgoga+vaTdHm2M9ODyYjbeygIyNfflAp5/QUi4W?=
 =?us-ascii?Q?TuCvnJ6upw98ffUH2HJbyqSsHu6IkiVqpm4QaDQqf1yB79TFcJZrlLGreXXU?=
 =?us-ascii?Q?NOjuWrxxZatHoBzEf8AtyzZiI6mWrPwo+MqXmed0or31OwDxW62JqaqKvkZs?=
 =?us-ascii?Q?zCyyJYwL0lS97WEcSOI8EGirJJrXKOTwiozhGo6gacqxsDCV0TXXI+qyjwwi?=
 =?us-ascii?Q?CWU2lGKPY5qAZkQDl4fw3O9hVXgDLHdoaYr+AhRxyl1M0ZP8b/62QqNumvI7?=
 =?us-ascii?Q?Smq2MWWlDIVEAsTlcZp/Ji0XtpKOh5s4l2HLpVwtmL+ZiuF/8iNvCjZ+2lX1?=
 =?us-ascii?Q?pVQDjE/Njh4NqxSQ+WOX+mbTV7tpLwGI8zQ5nHstimy4EefhjQYdW7bLpWEU?=
 =?us-ascii?Q?bhvhWutkYbAnwAxdlEP2p3CBDdkrXLE6D1B0RNLVra7I4W9u+hZQwhJPk+nx?=
 =?us-ascii?Q?gTVmQQ8vptVq15Z9l2GcmKQWOGEXG8w=3D?=
X-Exchange-RoutingPolicyChecked: 
	V55EBpRApUvCNXe/Wy5tLgT4e/APcoxB8fYJzccoRPvjClbpFNiHJbTbAD5WDl2n4kdv0oD39XPRAYdkDTPzdLg4VynI3msiNoiiW1kqpialTD9+3hJszTmmXlkRixK1+Ixeoc1pWAf3iqZK+UhlHQ7xN1pjEO8LjnSkxauXeaTqowut9fmh/z7O/FDVpA6bJzyqEbGNiGgvOaWvK0YsgSvJ4mBFOSF9DOg0iqXYNgBz+0ss1kTd9Nx9Au/Ymf6yRcHq68AqgnZ144plgzognQBO9b8QuCa+w22bLBdnQ1slxESehzYBmGJHKCk/FOhLoBbT5DqfWa6Q0eE0InwOZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594136e6-c3d5-47b3-5d4c-08df140681aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:23:48.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Rz39rNu07ggPDmA7dXlCVQY6ZKSKW+t+872paXaWe63p370kWJs667sL9/HNQhlrBqAVMOeRxJqYoHyTBsWFfEUO15aW4OD9Kofgl9ruWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9184
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=OPayTiaB c=1 sm=1 tr=0 ts=6aaab488 cx=c_pps
 a=Ag07q676f2ng1MTlaQzx3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=GBKSVWC7nFjs0hZbfVMA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfXyYTjocTSyaV3
 BouhLxALG3f13XKV/gCWt+FWa7qTHr7XRRXc0u9za9oCP5Vyaowk5gLTvWqBPLhpKnAi3QqNWHa
 oLnNwiGK0kRA6xtxJTDvNXa9ilDWb153UO9fsn9YonXhjBMc1vW0
X-Proofpoint-ORIG-GUID: 7iWXIHcSPtu0uV25EfFUoOWlBYGZrUuz
X-Proofpoint-GUID: nbYgEwtJO4-S4zBN7KCD5Vjxb7rgluCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfXwI/mQ1UGXIFP
 Uyvou50IzOjJGoWoiw3CChRN5D9lXn3tFkVM+5WOC7OGdSnkld1BRDyJ66cCvQlb6snc/R3fshW
 1nXgdWYdT2HvE8usmz9PewDUJqd1F9Ex0FuXJoN5jhuFcH/gwx/y6k+RHzaTH4lvuVlX9GcIw/8
 NvYM0zREBCcYKwAdQsRMExXVtxnkAS6yg0qjIiS0bEa7Wh5Z2psGSWoJ4DHu+I7/Wbiu2ACcOnD
 uRLrBhISHu+0h/sCNJgFv6RdlsW3CUT+M0rM/0M6uYdfzYtV2TUvCT7cIQW+HnMKnl0vdhmXoOE
 TRMxDc0xdKlGFN6TlG/jbKAWXDawQ5+ztuqM/Me/jaVozOPzqH06BP0JyXmXV6Rmx6HjfSAz+5J
 frrG08qYCnTssdCyi5nHdi9UBsxj/VlWf2ArcmneoVdIHDHfVp5er2Qyar2pif+g6bALKEmZ+rG
 q8Yss5Yr/9vnRTTFlBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245981

From: Sunil Dora <sunilkumar.dora@windriver.com>

The reproducible selftest fails for rust on the arm workers
([YOCTO #16376]). This series fixes that.

Changes in v2:
- Alejandro's Signed-off-by added on the two commits based on his
  patches, as he asked on the v1 thread.
- The cc patch's Upstream-Status is now Backport: the OUT_DIR half
  was merged in cc-rs after the v1 posting.
- The hygiene patch note updated: rust-lang/rust PR 161450 was merged
  meanwhile, so the sort carries until a rust upgrade contains it.
No code changes; the patch content is what the autobuilder tested.

rust: drop the cc object-name reproducibility patch
rust: hash cc object names relative to their source roots

  The patch we carried trimmed the build path by matching the string
  "rustc", and the shared-source rework broke that for one of the two
  sets of sources cc compiles. The replacement strips the roots the
  sources actually come from. The OUT_DIR part is merged upstream as
  https://github.com/rust-lang/cc-rs/commit/fe27e7b62629daddccf1bdc9e9a447a37de2cd06
  The RUST_COMPILER_RT_ROOT part is specific to rust's own build
  system, so it is not part of the upstream change.

rust: keep the build host triple out of cargo unit metadata

  From Alejandro Enedino Hernandez Samaniego's strict-version-hash
  series, carried with his sign-off:
  https://lists.openembedded.org/g/openembedded-core/topic/120939810
  cargo mixes the "host:" line of "rustc -vV" into build script and
  proc-macro metadata, and target crates inherit it.
  Upstream report: https://github.com/rust-lang/cargo/issues/8140

rust: backport deterministic DocLinkResMap serialisation

  Upstream commit f9d9939 by jprochazk and mejrs. It is in rust 1.99,
  so this drops out at the next rust upgrade.

rust: sort hygiene data before it is encoded

  Also from Alejandro's series. Upstream has fixed the same problem
  with a different approach in
  https://github.com/rust-lang/rust/pull/161450, merged after 1.99
  branched, so the sort carries until a rust upgrade contains it.

Alejandro's StableCrateId patch is not included: the value it pins is
already host-independent in our builds, and it broke three rust test
suite cases when the autobuilder tested it.

Tested on the autobuilder: the x86 reproducible builder green with
zero differing packages, the rust test suite green, and on both arm
builders rust, rust-dbg, rust-rustdoc and libstd-rs-dev gone from the
failing list.

Sunil Dora (5):
  rust: drop the cc object-name reproducibility patch
  rust: hash cc object names relative to their source roots
  rust: keep the build host triple out of cargo unit metadata
  rust: backport deterministic DocLinkResMap serialisation
  rust: sort hygiene data before it is encoded

 ...-host-triple-from-unit-metadata-hash.patch |  62 +++++++++
 ...oc-link-metadata-order-deterministic.patch |  40 ++++++
 ...hygiene-encoding-order-deterministic.patch |  59 +++++++++
 ...ject-names-relative-to-source-roots.patch} | 118 +++++++++---------
 meta/recipes-devtools/rust/rust-source.inc    |   5 +-
 5 files changed, 227 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
 create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
 create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
 rename meta/recipes-devtools/rust/files/{repro-issue-fix-with-cc-crate-hashmap.patch => cc-hash-object-names-relative-to-source-roots.patch} (68%)

-- 
2.43.0


