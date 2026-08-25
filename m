Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9020FC5DF9C
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12592.1787621620235925275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UWdAU45n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P1Ce7X074660
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RkSxOyy/AURg8uiuZKDCuyTOlxYRVgYEwhaIDrpa6j8=; b=
	UWdAU45nJA+14rL2+xkirqsSv1TeRL1iDAsHe8Y9G6uRJ5IH55v0hBhJJZitZwv3
	gOJS+MskvpXVEAJpgtqT4lOR913TNBnuvj+LSoQ1OxzvQZxUXzNmu15rMJj8n8Pi
	XDY91S+jRE/QC+oujY8H+9HgNT+j2ppSLwVvLTHzHbdu/HRvGPXeH3Ah+uaAb38c
	B4tdX5GUC/WGI1S7/hilEJAYXcUdOwQiSgc8VHhX3FAYYIBSksyrSy29LwzvVcuc
	w8c1m/cA5WimpCTeqM/D4l3jL+UmT5s47guYy79XDtHQTq0MrrAja6rbS3Am4FA2
	GGTCAv8dg2xYkXJkK9wI+Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022139.outbound.protection.outlook.com [40.107.209.139])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721kme9-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZnQ7ufXof5CmjbYQFuednCbOo9tFVWqFVslyBc4HADcdfbc6SlmA3YxhjI4DWINoVXeeVAbyeyvzlA48WLrPkmkdIhZ8vaYZB3HNhFYkv0+9VcXT8bWIhlEpnCRPWtJA2FOMLN9hZEo799ZjFa0mbsEMhQEPlvTIC14d4pnqG6M0gjzgzRpbYjEydNXldww9AeMHgkAgr07nDJmUDYXhoW2o0PkdXM5sqHMee5qYZ/zyIDFvZqfJ/whg0AvYwTboqaQqCqeRenabe4CI30KCnffBhgK4qugVOgKCsJWa6w00hZAk6kXDUTz0bxsyRhI8PLVY1oQbvwSpwbKqoycSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkSxOyy/AURg8uiuZKDCuyTOlxYRVgYEwhaIDrpa6j8=;
 b=j0wmKOXdYmlfJrNFlEQNB2y8Je5fuhoQzodQ3SoGSltRKJCW3dkGsMlHjZPaQSWvyR+7iLgiJqxDgxV2TTm7jR4monzES10Be1n1fuh3zXocPd0ibonseXe1odUg1Sz7Si83zge0qkSJVkNN9QRbRJwdJzbhl3+Ohjz42N7k3jDvKi5g54LKKcyDJP11qHo88tKJ9JxII+kNTHOZDomoDA5h45hGpgxG62j6y27qwMUHx2x41TKl3SdvPptT98XChxxbkrO+q/p4qsrB0nbo6bzHBk4Ot5dFCKpfiSvDeMZeDOVvt52YWvEqvBtkL/P2v65V0UulAIq+luX5Be3W6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:36 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:36 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 12/14] lib/oe/package_manager/rpm: Enable DNF filelists to resolve file deps
Date: Mon, 24 Aug 2026 18:33:10 -0700
Message-ID: <20260825013312.2695028-13-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 967282bf-9715-4c83-8b4d-08df0248e23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|23010399003|366016|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	bcNwBnOOImm7NCrCZrqljZsW2brecUaM9Ys2gpLwauc4dH2KSgkJbe/WoTcOdGpjid6Kg78fIb3JwPjUyJnEIjXOYiw/Jg0pMVCBbJHsOXCpYmKb6ll2MOx8UOX5dID9G+6Rj8IORa/AM2f+ScR759o1zZ8/yID4h5yrCd80mqA49L0cPacaU/Y/Kxxj5q7Qx+1CiXK54/t8goks7a90GENAwP+OPLq/mIsTxKRbBuPBiCP63DNYjQ9ZU1Ge0ZtzXmpQMeSuaYiC+qZUGOAq4IxPQho/V0bFoEX7a87ys0iaQRQ+gcqbIA7LkfQKKfnEmA31hrGkQ/JLvlh2BSxdlogWwyum7e6MgmMUZvLW3UNPFdsdFZyGsIStpao4vElUlP1yn6XJTA2p6OCH3R/p0OY/IsHc7C4+OhcIDuyg7akQFpTNsyq0RxR1GcUPCG8qP7CbpoCGgEKjYvNZ/gf1UjudMHhI/KeGynmizepecEwY+mn61Qi33RMVgrKmb963kCK99a4GmYduZesQx8xuFBNxBk8Jz7vqnbccQtFmIsEs9bkk49EbVSSqvDLTn6HI9P8NEjKb3xtXHowdiCiIhVTUevowslALr+fdLUCnu0Ardex+z7oHCv1x3uu5mg4TbcW1xlDzFw0evTWEGm48SZSjTpLSW3rw2Np42SY3gaIhAyqUKNbDXJK7ygJR48WoK2eu9XpqCCwZLKA+TE2IkDOPTuhOQFMuI5zrewSQSdU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(23010399003)(366016)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Iwb5g0G/R3giLeg8NnbcZLRFIXNTcjh7REDzZEw10NdnJ5PEsLAl18/n2kTx?=
 =?us-ascii?Q?Kn0ahDjTsAG6EpUCK3nHbXz+GkJz5ihRnHCDutkndK+Y8pWgqaV31IkbXCpX?=
 =?us-ascii?Q?3JPN/AgHHXcqDQFu8gd9aFls0RtUSWxAkN/N1awkz6czzv9B7zEx8VC/s+C/?=
 =?us-ascii?Q?6N2v/DLQvfdir0tQGHyY4xQfJKH3VvsRpvtdaHJs7z7KAIir++I8xNagZVs6?=
 =?us-ascii?Q?q96Pv9r8yNA+95WkP9S6m6Rm5DMdEUpr6djAQCi8migJGPpkGJ/vAN1BVmbJ?=
 =?us-ascii?Q?P/ciUqJvNzgdCO8cK0k8XQMV5qFzVHQzDHg+Dv6KcHTwk0K+pGJhfIbkWEb7?=
 =?us-ascii?Q?5XP60STSDzOQpHd37l5ap3KJ8IPLTvTcGcmGWAjugF4H16wUf3LtLAsSR9jd?=
 =?us-ascii?Q?gjz8jAqc2++I9PjR/rYKL8bge82oYYa+B2TiJ1cZMh5uVrKfsFgFc/B6KbaE?=
 =?us-ascii?Q?BxZ5EAblyVurPFAHsn3znc2HzU5JjNKvJpJ/mKcpo4YjNqbax2DoNzP3cXXt?=
 =?us-ascii?Q?YeLBkm0FJ60WWlqknzRLLTA4bkL4chdfeTBHOeIhPXB7P545OjhMlsOySmod?=
 =?us-ascii?Q?L86eZ16brjo+iiYLPw8jz8QrmoPVS9+UxXXYLSl8ffpc5DuxJcmyqPJDA3vA?=
 =?us-ascii?Q?oY1mzwN5MUk/A7zrxa5UcBi0M6cFymJC7kPcqPrntayO28kZeJQDTiWj6me0?=
 =?us-ascii?Q?t6vtj9pKI0kx/0vTt4SmBjqQL8gAYOrG4Wuynj1JfFwqLgBfJlC6WITmOB8f?=
 =?us-ascii?Q?j1r5nQPyXSRhkDoOkADrnvkJMOIF/ibbUT4mow8PGw5oGBDW/an5a1Z8R81S?=
 =?us-ascii?Q?eF+N42omLzYFNAgLb6sN2/3B37UTefjMTE5K4Rn0vbfEDbpOf2pO71glXsyy?=
 =?us-ascii?Q?BO2eN/1HPWulpckQrdmPRaagOs5FtOoKTiY+0Ntn/4Kh3gBcbd2R9FS3gDO7?=
 =?us-ascii?Q?NizdZu4WHFsw5dZaYYAGN82AU6rZy3hgXYzQV+jkX3lHs3O5rI8yFy4lQZYD?=
 =?us-ascii?Q?QuYLQbmYrducVLSt7SldUsI7oaF+bjOELLiwwIU3oTreOxrTxXqLrNseBO+d?=
 =?us-ascii?Q?Pfp099wp5QMOKr5H59+XWvTEtf/4P4rzjRc/vuVkF3V3Zcs2tUYrBv2JPCjP?=
 =?us-ascii?Q?sYSpdBMbJREW9p5zaetA0BvBFvVP+WkcJDJd9CQLXogxdnH7Nk0pMy/CXU0/?=
 =?us-ascii?Q?Awcm3t5EOlZYsDbwMpW4P456rm7ms/r2xJ7FEki09rGoXTRC5KATfJzsXw2Q?=
 =?us-ascii?Q?3P7ROQxWQ0GZ2/zIUgQG3A4u8cD2qJBIu8l3rWigTEcFX+E7wh2g5/o+3JC9?=
 =?us-ascii?Q?J1tlvPOhETgm3Sx3clLEJNQAAqJZofSZfXzOs+y7vZccf2bNnF+zV59KtNhC?=
 =?us-ascii?Q?fGXGKuj2tG75u/5JoORlKuDw1EOPmVYzKITYUnz/A8Lx3rwpjV1pfIRvKEio?=
 =?us-ascii?Q?bOdSxDa6CSzQj123+GwP+jUpkPCvYlKNvpINkdrC+6PcZ3Jo730Em+EuWDEQ?=
 =?us-ascii?Q?GMUCCV4iRsDJb1A1KIa+0pFB+381U16ywz9DxG8LY9K/Nji6Pz3AuSnk9xkX?=
 =?us-ascii?Q?0elPJsWl9fRiTWnGmmSYT4GuhyAp8OrWpN79qbqYwwSv4uaKcH72F2mWKz0Q?=
 =?us-ascii?Q?45J2Ul2zREe+TUvgvplmyiJDS2ximOP+OMyCYee3oNcvuD+wrEgNgsWUrHi3?=
 =?us-ascii?Q?3DyoE2SMoqfHPukE1w0Z5vk80vfkIsSxakDVAMdKST3EHdKtrkzn2N3ol+Yu?=
 =?us-ascii?Q?JnUOqNppxn68E9jIZ70ozN6gnmXhfDU=3D?=
X-Exchange-RoutingPolicyChecked: 
	Dsdxd62N08UswsaRlDze/e+yWmU0017yQy4nBHSCVp+85/hPrqBUgy0OPAJ3cDYD7qNAzhRqWI+BtMJKIQZOxG6ToENFWDj/UkZnG9oOsLLZTTmp++yl2AnQIbBNxqCtnNiRb6WZdPO0zqS5Mc9fk5DOFRRS8mhduPY7cPvBtQL1q0mmGP5a/eHMh6R1aLpoL8i5hfBf0e5BJieTxJ0SL4Uci8Q9Vr5UjeLuDAll+jl/yW5jfnJ5AgMbSE98030z/0vrw0Q65QurJPpg2QWjuiB+OjkLWk/lxvDhG20rrOCP4/BNJPQ0mAaJeEzH+LCsw21HRqFpKyvKJK76zYKpuA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967282bf-9715-4c83-8b4d-08df0248e23a
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:36.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bwEExpN7Cjz77pbNsLoQ/dsE/nkzdvYsYKskTkZiuJNMHtNlntSl8lwDuS7jxHWAIS0s0luoW203aWqvDF8LIVcXOM+tiaFBI0jvGWZVwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8cf0f2 cx=c_pps
 a=A91p8pFdSY8iZOlwlHItIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=p0aGjYm6jqd3QCOFG8EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: kUXzNiUPiQG41KScZHlMXnmfP_dWvsOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfXy/6FrDCHUNDF
 HuHrJLjo5V58fjqjLSFZuC1OQTlUZoTOCNVOzKKcgQEb3/czgjcDOEnrO2PSzB85sN9TFNyHC3S
 ZNgCvDlb0lWNbGsJLKcg7aF/0FPiHam5V1NBjOYXCd4BxTR8CfQZFba39xe5zzLzQ/xbkgyTVj/
 T9+ToaNz51OUgDGRPxJhHXxi19W1V71qgB/htX3mhIUjszOsauECFHBjtkx2Vu6wwZr58C5Zzlu
 O39FoSLJkx3b0YeNyCt6gOJgVXH73fHX+sg77Y1Q0FEZRq+9c+dFuXjfQgc2Y450HJduNT57srE
 XbPoGngflEc8HZuQGmHcibjQe0eNlemK2g2NIzdeTlTnyVUKjBsECy8dCCYtlKX00Y2+UQAAlQ1
 2jSKPBOKkAY/+T2s+MqXap8FqBOeVLXC9STKv5iarNDjml+tuZoSi0NpJVQCJKNk7LwhsN5EoRl
 sCeI46uTZ+JSBqpV0Sg==
X-Proofpoint-GUID: nlyvucgJ4SjzgORDjs8Mwb7bNrozli4T
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfXx9HspBYzOVWk
 rDexGfj7a46II1uY/ycV40ynflK8KhSOBT39o2DogXl8B2GZTlbnQbRFPkyiEeMguWsjPfvkRgH
 E/jL8aNYqaqJNsMupJQhUyHyIRqnxNsz8u/HqidIDvLeaCFh7wQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244185

With rpm 6's internal dependency generator now active in OE builds,
pkgconfigdeps.sh --requires always emits "Requires: /usr/bin/pkg-config"
for any package that ships .pc files.  This line is emitted before
pkg-config is even called, so packages built during the early rpm 6
migration (before the PKG_CONFIG_SYSROOT_DIR fix) carry this requirement
even though they have no pkgconfig() Provides.

DNF only reads primary.xml by default, which holds explicit Provides
declarations.  pkgconf now has RPROVIDES += "/usr/bin/pkg-config", but
pkgconf packages fetched from the hash-equivalence sstate server were
built before that change and have no explicit Provides in primary.xml.

createrepo_c already generates filelists.xml by default.  Enabling
optional_metadata_types=filelists tells DNF to also load it, so DNF
can match "Requires: /usr/bin/pkg-config" against pkgconf's actual
installed file list regardless of when pkgconf was built.  This covers
the sstate transition period without requiring a full rebuild of
pkgconf.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 1d831745ff..cd6efe3d3b 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -318,7 +318,8 @@ class RpmPM(PackageManager):
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
                              "--installroot=%s" % (self.target_rootfs),
-                             "--setopt=logdir=%s" % (self.d.getVar('T'))
+                             "--setopt=logdir=%s" % (self.d.getVar('T')),
+                             "--setopt=optional_metadata_types=filelists",
                             ]
         if hasattr(self, "rpm_repo_dir"):
             standard_dnf_args.append("--repofrompath=oe-repo,%s" % (self.rpm_repo_dir))

