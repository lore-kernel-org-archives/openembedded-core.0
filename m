Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06100CD343F
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 05:31:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6878.1778304661335208760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 22:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U8lTGHx5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95895a8adf=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6495U3uJ433184
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 22:31:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=sHaH2WyIbgHGWFYrY5B2hI50gWT8H596iIn1BFNiOTo=; b=
	U8lTGHx5eYHDeeaR4ughUfqM+SLOCfUNJ6jILMfitykQ/SOk/Wu/ER8Jzyh5KTFB
	JgI6INmSuls5l6eeaHFVvcmO5e0qjMOTYRsMQdM8PUl5wlTyzDWu22vjLoMj3Hg4
	P5CkmVR8co/1RJ63g/DpkYPrtp1lhFgrZ+2HLMVZw8h8Q/4wiFjfVx5+50x0PsKi
	FlRcCuorQFM1I8YQbVLyU04JSL6EUGfzrlrVG9NePCylNfGtDfciCZEy/3p7RPzd
	lMSBCBCccsM3bTRg6ICqIcFZmDURzvBIi61O0fRB3Ld2IDfT07O+BDt31MckVlat
	yIFhJoQHRLsB4kaVTjHuzw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1hkmgteh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 22:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NX6JdjQXbmMIL20e5J/N7KzJvCe9sDF+OcR8p3FZ2y/f9DNWtjqKsr+teAd7Zr74WhAH4v0vV3wLobJBIfpR1peHwO7vJp5u4upUZXVY8XOeVrRWPS0QIj9kjeU8nHTqpVIyZEOWPxqiYXo2Wsu7T4iSr3NQB0WXR7l8On9k3At7xPUlJXDKY+ULORhf3H8KUvyb/Jus6oPELfY3Sp1BL35Fwkk2RqOIgUEk86KxB1VaI2Vpot9PSpp+vuFYPJfOU7t08+1001NiVKT77k6j/i2t0bl0fhNwfEUcKsawuFLaajTGRylGkzu2JwLOKSjQQOOWFDc7bonDtg+tlIKtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHaH2WyIbgHGWFYrY5B2hI50gWT8H596iIn1BFNiOTo=;
 b=HRfnnzgy1tKc5F5vTIcTWeMzS7XWRCcs1/e86TpsbLcN6jTktVpo1FyffCHLC8bmdLZwwZ+QabtHMWegNL0ou+C36Tu+R6XDKxCfw/7anml6G+a1oDJGKgK1i/FaPhOnqvZYGyfTUMZ7Gyj1Q2zP7sxHQKGa/7D+090W3xRxFJYFk88H4S2RTtG2RBvDjtVuMgNf1T98X6DOq6LQTkRX4P93uWfHYAcVtEPEIV+QhV5VuEF3hgXfAjyEmjnm3//6/eCWxUke7oH4Vshlmc1Jeoq2Y6/5/znfG1SeJYi6su8PzHxahfbl2Cvq8prL1I6Lmtn4wMGSlByqDE/YzAT8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 05:30:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 05:30:58 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V3 5/6] kmod: inherit upstream-stable-release-point
Date: Sat,  9 May 2026 13:30:32 +0800
Message-Id: <20260509053033.1565462-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509053033.1565462-1-Qi.Chen@windriver.com>
References: <20260509053033.1565462-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a240fa-5a75-4a6f-59fa-08dead8c260c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|18002099003|22082099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	GFnH89oebCMpGYn8c+Bp9sYV7hnDbq6NrvnFeaMFwRJBBUOX8q0LbkBPsVaw0ivekb1PqMFwHVcP8eGNM4UZXO/aVH9qjaLgrL9zVpo0Lq2bCtLqoz+5Tzww1IGP+BWloo+LtlQcqKuG+1YHtMLKQi6jZIyJ3cQ7sytvcVpz262IhAm8cIiFCkuPfPqqWkahO3C0SnZBqCQCb07eDSrnuXuSNkS9QFKczOr6ccLDHr+H/YP8863x/bk79xI+St9/nmZAOSGpNI0vFjOz+PiM46FNYNF/jvZO4F7C8hDAhM9qYzj0+Kfn0ds3U0IZ8vK6buZ8qze5A68jJah/+dsqVRxBjUPoQSMP4+7rIsYwr88oc68hPZ0zaCYcMiJOGQPJN9k7eX1GA8et0YN28Amev7amzZjkFuGZFhsJkwx+nez5fK9hmeZ9+QaAH0QfQrooSLQBhH3g4KgsRKJs1P85WppQc0RgmF1q+S1f1OyO+wW8XVYAcPqCuVmR0VsnMgIlcDNZ4Fr7V4v6NU6D03pE+qOqApLUNQP9/UcvcL9394s6X9AA0+OfgoGkTlVIRYn8LhS4z3o/y76IH0WsuqNzCw6fEwJdkHfcbrYAzY46jiXZVRyfG0de7OK5prOHCycVVybh8kHR6vVA1TzsiLJu+FD0LAR7q7SlOLrQudgppjJjEV5EJxoqtwnaHbk6Uxu7nBrzlFd/avFCpy0HIdtnMwQlPmstG6fnf4bofDspgf5KAxXYmtK3NBcbFd0WpU40
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(18002099003)(22082099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cPTtx4vdKG/6HBSIrjlUZ4/f1J22i9AEDd8Z2cpA6A5wt6tmlPITA3Ex88H4?=
 =?us-ascii?Q?pYmHSX0J3ArmbSWniAxED5zWSdScxSqTID5loMkS4/355J6max0fskyml5k9?=
 =?us-ascii?Q?we1+c6SWhhr/ioPU2T9Jvh0PuKrmrV1qOTbkoQA8Jyvj/iKgSaeWT1s2z0kx?=
 =?us-ascii?Q?yddLP+2HWanWOp52X4ET67NZ9Osdf60AfMRV5CT7L4Z59o3vOfKoUF6rkqCq?=
 =?us-ascii?Q?ImilHo9e23tY10CAxcTZWlGps8tuVk4mPe/cNCb+K8IjaP/gehrWF/rvqRA7?=
 =?us-ascii?Q?ZhThX50NHa+YLV5SJwxM2Tj5le13ci5FDIbh7QqvQeoM/io7hmI5noNgTpVb?=
 =?us-ascii?Q?ag1rDnSt2tZ2eHXm9W89aA79XCgtcdH/+el76DPD2hnj6PSqibeC4dZGl5J+?=
 =?us-ascii?Q?4u4CMLkq6rCJttdAOgVBWBxPYn+V20BeyX+5xrcKgfX/paoD9hxFVL56KaNx?=
 =?us-ascii?Q?3z0cONi9QUM9L6pKY2UPC8aUWIY8BzriV6CYdccKhuAFfBwLqQueyOTKGA8f?=
 =?us-ascii?Q?buDm+CihCZhaDvCMGxyPKErq6VQLUNnlFmVt3rYcfIoMLBrQYCWlrSmf0GGy?=
 =?us-ascii?Q?RZzlrqEtJUmieBGaSLkXcGBNyV2GLZVKhXjc0y5DPVNgyI1uIq7rTFuQFy6a?=
 =?us-ascii?Q?Wgd2uCQEmhHZN2rr5dIqbNCxJ+VW252a/AcE/lJ/NWSjQ8956NjWg5M0xVgn?=
 =?us-ascii?Q?TCIkXlrRPYegtHi+ukJENMszCZQvy8dAPABs4lh4yM7g5Za9Cpv9fIGbHxIf?=
 =?us-ascii?Q?5mhezCAEDwe38oUy3CUjFW9TVBEFeO/yY3EH2/TabXbi8EKsb0tVdpT0pxMQ?=
 =?us-ascii?Q?JVuKj72BJ7BAz0iksOJrTCFk1nQ6YjCUPnnmSFWpgJ69ctmCZZbr8uo05wEN?=
 =?us-ascii?Q?Krx5PwAzMegG+bXhuoM5y0FBanCi0gTdYoiXLZ9R8Ke8t1DiJncUATzKUMfw?=
 =?us-ascii?Q?2jgAIXzTeixLrXkvhE+SbK8T2+hUb0g1xeMbIycQ6vDQj7T2W867QbPTC23p?=
 =?us-ascii?Q?V2wgMGYO9oVi5RGDFNUbJYD22HYDaCMqZ5lIebq20amYty7ZLXfmWN/OrP01?=
 =?us-ascii?Q?8Daph78ziGAw3X0hzpM+7l6q9kWSJZA+fhcLR+12+NFkEJZeDr8BlDrT45A6?=
 =?us-ascii?Q?6VISFUxb/JESJB6naVE9CQNE79dmNk2Cj65A+jlS4J6ft++xbz+qZkRKwo+T?=
 =?us-ascii?Q?H7N2I4lvKfKSlU4eeD/rNXAV9MKRFGfSMxDfrVLz8Dh7R9uY2pRMF69iPh3J?=
 =?us-ascii?Q?Y+x8Hdfd3cRYiFobXoX7Oud0ia6YlXCf7dZKUaNqtIebE0CehhE3blvKRvfa?=
 =?us-ascii?Q?QGq85qfyreOhFfazv5Yl7HRVB3wO+gQ9EAGqaITdkpykyeDmvJT7b/k+TDgJ?=
 =?us-ascii?Q?hnwaUpsimvfqoPzP8MYcA0ZC/mM4uPPntC5mphhyJaI/+4rTCLdkzPcDFdP4?=
 =?us-ascii?Q?Psu9NgvngHL/z9t7fnm4BRNlEgBxOlyhtl7i0hPSyrhPsJKYF9OGiVcTSbvT?=
 =?us-ascii?Q?2Fv7K/qIh4piiuadh57DOug5a4eV7vFpjssR81iSKsa6Wzxqbzl2jL9PhfqJ?=
 =?us-ascii?Q?fQnYQzks6g3o108ACFWrK2BVBqL6ZvqbuuvffYQytKpnZaR/gBGLeVEvlNm5?=
 =?us-ascii?Q?kvlL9ot/J/voupI5oMkhiPBBrVWJRm/qbTqb6SlMAOBTCWdgiIgPk84B1TrC?=
 =?us-ascii?Q?5Jp3u68orhGnG9lPZbBBc49TGgSzi5p6xSq+psjjXLTMsTIqRi+U6vpoHJnY?=
 =?us-ascii?Q?lbrp7SsuIg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	ZjWCyiVfmK7wRYxSkjMqO31qN573GfHJ+DVJZd1/esSzT+ouAxm7tsnaavhup5pQYWpnKsAA/6qBjks70KT4Jx9GL9rBUNrXpYNa34XyNMUXl2ZFv2ygjJ/uqwBwVQSlYgzFRe89NRZNgdcQ52IivYzbdNGJuuNoZk36HNpQn3AIWvdIBr6nLGihYp7PvpEi6DvwsGACRctpzGnQymtdrnhxzK4qJvkQla9BiaxbnWsAJIWHtPhGm0Hia5Timujn7c9riBKeV8ZzLmCzTXy7k6hwt+gw6XcS8ezIiONAmCugEfIny7X+RiwDofzl0P61SjwLN9xK6wBj++hNk/W9mQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a240fa-5a75-4a6f-59fa-08dead8c260c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 05:30:58.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtikZGAXP8J9qzFEf0yqh8u8ueBiEsFJeeEww1VL3HGw/+XXOoOxw2/XflUQeto7ilh1RhPzj2pBBPWUi/8yPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA1NCBTYWx0ZWRfXxtnyQl0FyTSq
 A/xCW2CbZklFghScpJHhs+DWm7ryPWzr+jJgPzJBFI0cv+ie1VreU/JbnVcqqOaDKWBAlufpsaG
 uKd5k30/P6rJg5iQKa+tR+kvyUaGdv/x92wTWS5ZdK5iofkCGecNgUBn0PlwX7SiM46yPELYcHE
 nIXwkj2+sxW6RlNOywvKM/n5aHh58sEDQxpReHzJoFpUS29ePzyBe7RZxv+CvgnL+KCman/4JqM
 v2pJNbhG/1L6CngaGBNWcZYz2WOMy6ew/KKVnzHc/2NSi0u8H6Bw8djYbqxC5LCUlGyr2obYCEW
 +711A6KkDie1q25rHcw18oLx01SP69kRen9owiOWQpfY5W/w7ELhl68YkKvSbGd9w+yvAtBmQyK
 69pb69DpkmEYVVuF026RWB9C7Qqb/FZbLR8jw9M6dHhubtp40+23Fdi4QRXb9sYPTpm6qwGMznq
 EpF8RymZu7tgHRVWmIQ==
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69fec694 cx=c_pps
 a=5LsHMtEjVXEroYtotTqlkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=_aJgn0iUmd-qJxb44P4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MPHXMlf9o7-I5in5Z0axTbDLpSctRT1Z
X-Proofpoint-ORIG-GUID: u7Y-O9Fg8QuBYKjPBSmcNcu00Pb5suUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236758

From: Chen Qi <Qi.Chen@windriver.com>

The last version part bump for vte is a stable upgrade.

* Evidence

  Its repo contains a branch called:
  origin/kmod-34.y

  Its tags are like:
  v32
  v33
  v34
  v34.1

  So we can infer that the maintenance policy for kmod is that
  upgrades such as 33 -> 34 contains features and upgrades such
  as 34 -> 34.1 is a stable upgrade. And such maintenance policy
  is likely to continue.

[1] https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod_34.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod_34.2.bb b/meta/recipes-kernel/kmod/kmod_34.2.bb
index e5923a64cf..9518973c6b 100644
--- a/meta/recipes-kernel/kmod/kmod_34.2.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tools/COPYING;md5=751419260aa954499f7abaabaa882bbe \
                    "
-inherit bash-completion gtk-doc manpages meson pkgconfig update-alternatives
+inherit bash-completion gtk-doc manpages meson pkgconfig update-alternatives upstream-stable-release-point
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/kernel/${BPN}/${BP}.tar.xz \
            file://depmod-search.conf \
-- 
2.34.1


