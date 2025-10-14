Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B624CCCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:45:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18544.1760453121792093888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ib2mDxIo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59EArZG92578317
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:45:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=K/z7SSuxcIQuBfEmEo7NiAVkOCLMfFiBsOqcQoYBuPo=; b=
	Ib2mDxIodffNUJZAJYqvMYtf9ZUPCCj6FewYPiRtXmNKVPPB3RShTiPJDh/zwEXf
	hr9vnUVy4alZUwzYsvb4Vm79t9kAbN5mX8a/puzh2tdLmplCWDnXl3D4rKVNKWJR
	VhhyUlAI/clp3KRex/8aFtlKYpFXTiM0Wywcn+Ka1Hz3TOsCBfSBaGOAvk1C4djN
	NCeCizaCGi57GkCYrAW6BgpB8xPxRDKW2tSvXWAykJzLLOkVof3h1PIIgLZqplrX
	ktA0Me/TSyJPygGf0mF7eld+D4OsQlsW5cJ9FPA1SZLxXhZrTUaAlP8KNa6XIlgh
	tqEqLqRnLibPB93/3rLYhA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdty28-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUUbiHeHoDtRFlZTgWi1gatveiqcshzvk7G9FIphtTYSiH9RkLM+YoH8t+cFT/yb9VPYnQtFVC13pLTC/WZBtOMEoRDWXrJSHAG8Sd+eNBvJyWi+NHiSuP7exbN44Y15v8m7qehzGjsfrk7nMIDXJnpsVG6a6u4IslxE/x9BTiHkswZeW9rg9d3MgZSttknwkUVEfBZTeeVuGC5CngnBTePcN6CIC7SVhNwmtkIQtGlWjgsz5NTOQiRHPGMzES32PQTIfCX00IEAnTyAMXiWB1QCSdUQ2NJ1eeAy+OcyVkgXqjjSz7LRY/2tZ7uIuzkZ3ltU6yKTtXAFZ3cf7xYckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/z7SSuxcIQuBfEmEo7NiAVkOCLMfFiBsOqcQoYBuPo=;
 b=xZMFqAi+GYu7agjURB4GgTW8QFk8w2tfxuia+Llfsvq5+b27dbaqayB9CojAUYaFuhV3jnZ9GBe83UawIiBarC4jsxkJlfQclGhyQWz8Gv7KLu/TnqpxSyBhXaBLm+rXQeaTXuhwr41BS7iXVnzAyZmJ1qx4j6pDX7gVA1Km/RF9kczyjVEwDL05XFJUQnPX6YzX5qTutjXeCtZX4QBPTFuYd0NkSi1+mI4SYnAGSJgu66GQeJC9MKHp1yMY07qfHQggjaw2WXrHDMaWOPoTYhT/oye+9VHnL2X8gt9yDWPt9wFCULzx5fphttTCQy8KJ0cPoG/Sy2T/mPuMiHjcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 14:44:50 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:50 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 11/11] glibc: : PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions (bug 32786)
Date: Tue, 14 Oct 2025 07:43:47 -0700
Message-ID: <20251014144347.536537-12-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
References: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ2PR11MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 275f4f59-498b-4917-837b-08de0b303ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mhzv2YbuYAtQ1aYxZBHScdfv1lng+SoK4WhG9XUbjGvQzcGPugJbgq8wE6wt?=
 =?us-ascii?Q?EpCNH8lxsm2OCMP719zUeLdmwb3B3eAd0k1I7lfa6KAnUdeg242RH9K30Ycs?=
 =?us-ascii?Q?P79D9FD9rjRzt1nG3UbdTggbhW9SskAqPMqUm+3MVs5IyayED9/rLRRju3Wx?=
 =?us-ascii?Q?6Vg/GK+k1P75dnV/spoac7ZzvrwEipKEANEUT9ip/CgvVBdaGG3nTwhPQnS4?=
 =?us-ascii?Q?oXsCOvmu9M3r4lEJY8v1iZyRz/tBhGEHU9sBNn6oPJIw9lF79Z+XktHrb2iF?=
 =?us-ascii?Q?E/BSAjlpaLbN0x/fZ9FPhIVRe+uNqS8raLYMXxZuQQ0EEtzqIUuhey+gJG3K?=
 =?us-ascii?Q?/qGNWU9/OQAaguxTugiOR6U7qt1fEFM0rXiGQ0Ml88A7Pc4VVmEQEsvxec0n?=
 =?us-ascii?Q?sPK3gEMYXarkXm+Hi9/jDsVbITckH92RFDu4NEw5X3dL7N5fyG7jJFTOWVNQ?=
 =?us-ascii?Q?7Fg4iV4q5YXWl9mgWetgSjZsGGnAJYRtCOMuN7PrpDko0SU4Q4/ELFof16Gg?=
 =?us-ascii?Q?zpfR3+Cg2Z2Mjqj7BTGfBKCYHyBBqVsHUohdXm2S2U1F8Zer8bjWngodfvEY?=
 =?us-ascii?Q?qE8DDiXs74XyYMCOVW2KZDGX+cGC5xM85Z78TPnmZkKhJxTQEi10ah8WTua6?=
 =?us-ascii?Q?PZxUVI1Fo7Kylkm80imFZGLbJzn7TgPTpB4CupBzuD4oqtdg4ZNC0O9krIah?=
 =?us-ascii?Q?8ZDbe33xyjHO8F7E3/Zm351cu52Ngbf1ILtWB2O45k9yOM/IEZHrpJndB07U?=
 =?us-ascii?Q?IR0lAswwoQlOC9rGWhJA9SsQnGfS9o6/CIlS/zaSr9HbwsHRo4dzjROR35xg?=
 =?us-ascii?Q?YeJwHaxhL5svJj93TYuaPEuf2RblUMbwI/yTWCJZ0FmotkdmN58Hy5H53YO3?=
 =?us-ascii?Q?YcV5SDgK/NBRKMofASmpGAapOSKZP6aWAtDppT7Ir2D9jIMofrWTa31ZzQRL?=
 =?us-ascii?Q?EIQA/yeeAY9PPZXGY2kxf/XPF+F8H77+uPwtpYdjnGOq+3SRKlngs9bfwUGG?=
 =?us-ascii?Q?58zkMjhfM0qGNf6BDbYqIuYpY0cB19vkpg3FdOBOduWRl8AQ3IKEB4mOT3Tj?=
 =?us-ascii?Q?SKzz8rr/eFRisrF9cBDuyhjghLs8v8hm4J2GTf7hDqqd3GhiYniqNi8nhXOp?=
 =?us-ascii?Q?37kxoOn2dFGWJCREqr2Z7cFhHBhoES406Qf6fM88B6Wo1KWhiWWq2xtVefIl?=
 =?us-ascii?Q?KNr2wRJnWZGq24gzXS0wXpApbgzJ675fJWTTP+ZLY4YiKynb4DkxUBGghyKD?=
 =?us-ascii?Q?/XKUDfTZWS3NHm6ovz8amtnV97v6zd6A243l2zDFAiBCkUNXDTEMHIt0yIgy?=
 =?us-ascii?Q?y/69wdCSpdzpgebR+B2lcdKiDzpkmU4cKR8DkDBzGSUk0JtS27Q0JQWRRKMN?=
 =?us-ascii?Q?7lVeeWwjYJ4lBUXderr31H13U13u72fkYz3NZweNmA9p81GWBQs1MM6SkrmS?=
 =?us-ascii?Q?HbTW0EhKwodP7rhous2Hh5pr3S78H/nFLEt4yC74jy9EID1Vws5q4w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9UsuLgwcDHVJNfATtkUUFd7m16g5wgAFtKFALw8uDcJ9RQ/QunlLE7agXrnw?=
 =?us-ascii?Q?Ds/ggbVx/QJK6t0/Peb1PPL1IaWRYNcE7QOI4zVW/Yq925PHm0GX0iqdPiJf?=
 =?us-ascii?Q?vd9rnoLIz65adZeq2r1lM1P6OWPtljf5O4A+vm50JeivoHgP/2WXqcToj59c?=
 =?us-ascii?Q?5qS8VMWBSaWczksNfF8IlAS5dSc01nFJf7JhrFX9Y19udkb6vvO0+n7QbVTc?=
 =?us-ascii?Q?AVjKS1o1MRoCos+FE47S7Hth/M4nfBWbxuIiAyZYJMdRU5yCXT8fMNzK8GDY?=
 =?us-ascii?Q?klZxcpD+S0QJ2BsF4xoJLzGl0k9LgcYUXQVDiVZmbr9A4V9opH3CXXt03xxB?=
 =?us-ascii?Q?vPm/35hwHL+Ym59QvZx6/lvIpcrFWdybTSnzxIvX8qOdzaozxBj49L+LeStX?=
 =?us-ascii?Q?XmT26o/UdTeBbTpXljuUS+xp1G1CYuhZBER7yMpHyRDWaoljSyMrhB+hz253?=
 =?us-ascii?Q?iJgcPR8ofx5LXY4bhAoqCkcJcew4o+li2NP9bbZ3bq7wZ4/Ehn1fG7Wd1ulT?=
 =?us-ascii?Q?Rgu9+dzYO47kkBYQ2NlF++NfaR8cARuy8MP6d1icm4tFnXBfkoiXjJsLTVXL?=
 =?us-ascii?Q?pWklWle1dftz9aqE6FnECcoYokfYClY8OArzoinR/sLvJK+RfsxI8yqc7UhD?=
 =?us-ascii?Q?tin27JI498XyOPaYoato0XarQFShupKi2ENySlmTjLxK4VUrm6BNofc4mnl/?=
 =?us-ascii?Q?bcq7jcVi0KILLTBENBQu17swVeDmLrB06D7O8QpN0bjMa5i1jDW1nJCBj+rb?=
 =?us-ascii?Q?Trq2DuYdW7XfILDchOzXJ/Ms3NNaHprVpGlqIetlqZrsk/PiDsMtS2ad1Iae?=
 =?us-ascii?Q?+S6RP6IdW5WldGkOwCoE1ztPsomn/AWSWiiWYPVdot3qjXXDK6TWki59b/p7?=
 =?us-ascii?Q?F2My7x0YrEs3RjWblV5xfwJssN1P3+5Zh+vrj9AiQG9vd+RMLrOHhRz0IQuX?=
 =?us-ascii?Q?FTtmX2YUOd1H4xW2wl5O340SQ0EaeOwJyNIsMsI16iMQzxkDRKQhSwvC3yg8?=
 =?us-ascii?Q?dSjZctSZH0XJJWxPbsrHCB4nJ6qKkKasPRfATf3QlQBx3t7Sf4wjK3v6wxTe?=
 =?us-ascii?Q?LtG7sXYYwuoZiQDWIoGvmenEH7Adik0ev9SwxNkUWBHEj3RYnTql9cPKOwsb?=
 =?us-ascii?Q?67/eGtjye/aPlmveYsFwdxz7gCOQBoOU90E6VeX8qbAcmpvbvSobjZNZlvK0?=
 =?us-ascii?Q?zsieQDiX1QcVqZKMgqvm5/ByYe1vWiui66sc5lQ316jo5b3HBROFBEsL6N9O?=
 =?us-ascii?Q?V/2x6XnefYM7rRp3pwajAD/70hUJJqA+XpGbT3P4sDDVxzFINjFE1nZZLJNG?=
 =?us-ascii?Q?g/9istp2OcWvymkgOpYi7vryJs9mzfP3q4gqNz/J9Ikkq6PnXfXkcyU1sB9/?=
 =?us-ascii?Q?ctPlam2/OrXzJGlr9fRyT6xcBCIopiyVsAnqTyh0TKnOhaGyBG731pn3063J?=
 =?us-ascii?Q?63fHR+rxXXIeN8IV2R50GQPW1qlvRWFp4Q7FsNvKUxxHhGfTFBQxxweE5p4o?=
 =?us-ascii?Q?4aqZb/s/utEmxJaNCPbAcXYGRAWu49GzmDuNRvTZ145LImgUTyGHcEpZV18N?=
 =?us-ascii?Q?00z0nwDWdM/Y6eiHDx/Q9joIjxCSiaxBY66zqH/+gEHfaaOwNJNl9wYWfj3S?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275f4f59-498b-4917-837b-08de0b303ab5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:50.7997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7FR7zy9M4j6Lvo/VQB76llGl6cHZb6Ymluys9ZyYv+1EUEImGK0fKeQoVxlDPNTak038Qo9/jXDKnv/vAT+kbMXFu4m9DDzMIJuK5Po188=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfX8Q9ah3+KtAv5
 YCmHY2qQckbQ2Cr6owBrOvwioLeUGW4LxQc3d4xjVkUeKzdhW7W9j9OOCiUH600u/w6pNGLV+6d
 5fIIhAtfsSRsPA9/VoPqSa4F+OF/JB1KOKJqZJYxO7oudkESTyuVaSvsThG9ek3KSxjXJXmInUj
 mnzOHVgi6W496hJ9ZpHEyLNFcvBNn6cbgc0DTblK6T+pMP8+wYW8nPCvNEr4JQWej7CGncPdry5
 URF7Bjyjw1MmztcQ1KMye0S8LcD2QhzEg0V+zk2UrWY6aF3+gXkGn9IbQYcH2mpelCa3dWW1tWH
 6WGWpj9mQlKwl68GGFjwhWXrbS8UeOwdQES5/RfyUFiMQ1RU5FxE6zs2jfIhMFbiodc9lfi/dAX
 v03y5dH7LDSJQKVEchm5YatEI89caA==
X-Proofpoint-GUID: IuS5M9gtGIn5OvYPD1gZeUcq8ufASe6N
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68ee6201 cx=c_pps
 a=vwzr6GK/qOZR+/kkcyjBFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=p8ygwoizOokfcXNiYjMA:9
 a=ZDAW-G3XH58A:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: IuS5M9gtGIn5OvYPD1gZeUcq8ufASe6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510140111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224830

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=dbc5a50d12eff4cb3f782129029d04b8a76f58e7
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002282.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-10.patch         | 54 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-10.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-10.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-10.patch
new file mode 100644
index 0000000000..99049d468a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-10.patch
@@ -0,0 +1,54 @@
+From 4f78382dd671f381db6d1f452e6f1593d17b177e Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 14 Oct 2025 06:53:40 -0700
+Subject: [PATCH] nptl: PTHREAD_COND_INITIALIZER compatibility with pre-2.41
+ versions (bug 32786)
+
+The new initializer and struct layout does not initialize the
+__g_signals field in the old struct layout before the change in
+commit c36fc50781995e6758cae2b6927839d0157f213c ("nptl: Remove
+g_refs from condition variables").  Bring back fields at the end
+of struct __pthread_cond_s, so that they are again zero-initialized.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: dbc5a50d12eff4cb3f782129029d04b8a76f58e7
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002282.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ sysdeps/nptl/bits/thread-shared-types.h | 2 ++
+ sysdeps/nptl/pthread.h                  | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sysdeps/nptl/bits/thread-shared-types.h b/sysdeps/nptl/bits/thread-shared-types.h
+index 6f17afa4..2354ea21 100644
+--- a/sysdeps/nptl/bits/thread-shared-types.h
++++ b/sysdeps/nptl/bits/thread-shared-types.h
+@@ -99,6 +99,8 @@ struct __pthread_cond_s
+   unsigned int __g1_orig_size;
+   unsigned int __wrefs;
+   unsigned int __g_signals[2];
++  unsigned int __unused_initialized_1;
++  unsigned int __unused_initialized_2;
+ };
+ 
+ typedef unsigned int __tss_t;
+diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
+index bbb36540..8d6d24ff 100644
+--- a/sysdeps/nptl/pthread.h
++++ b/sysdeps/nptl/pthread.h
+@@ -152,7 +152,7 @@ enum
+ 
+ 
+ /* Conditional variable handling.  */
+-#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, 0, 0, {0, 0} } }
++#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, 0, 0, {0, 0}, 0, 0 } }
+ 
+ 
+ /* Cleanup buffers */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 26e8d8c408..1b5830699f 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -71,6 +71,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-7.patch \
            file://0026-PR25847-8.patch \
            file://0026-PR25847-9.patch \
+           file://0026-PR25847-10.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


