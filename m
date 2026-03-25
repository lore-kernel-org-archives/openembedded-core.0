Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F18FEA838
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 09:06:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17926.1774429571044431588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 02:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IlNJDn6O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75448586db=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5U7Bd2047301
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 09:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=8iXtUBI5U
	WLRXhasrVZU+oK4kkg5vjiGcMB9OzcH/vs=; b=IlNJDn6OIVSXuQiOgw8l/96GD
	1hqdmtHXnqWE1C6HN052NAmnEyw6m/iclVbyLIYwKnWj8QAFunsGNR+CMu4M4pqI
	6Q0j+rv2eHO3wd+wFFeQSGK/ohQsAfygibDLpVyyuF2yl1a00a2plwvRpd9fifXZ
	45B5MurisNjtWMWDDz0kLCpq/A5oK/0xR3ATW43GX/yiW9QJOveAxSSvXLv2usr3
	1bT8Ec4+xPRWuTuxtV4e7PU9oYM3PrNf15JCjNKl83T/cveWyi+l+LGtH93kj5d3
	ShGUJfB30tF84qiugT38xa4spYZjd85QZ7lzB7ezg4cJPf5KfQoFj4PLF81uA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012063.outbound.protection.outlook.com [40.93.195.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6vqsx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 09:06:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XufugoDMAAYkfbho7KUFleWYmCQUF/l+ZFF49Zk1CClQqErrH+kcHucgS6vL4efkhf6sP34L8UdTKa8dOvYwNnfNwy7RdGj/DStsmWAp8EgFmz8TVmk2/i+IGEVKaogZaafXKsJ78THnIE9VwPZGAL4/T+/d4ompxCUya/Fn9HVXnBlmEvn45vc1wfEAG/HJf0S6+DQ/oedR5v2tfrXeHfNi+X+dd2tjeaduG0gp0HGj3RkD0I7NIUZBkb4V2/FFOVC3ziQukWjkkhQ/Ys+GL7xCAlL/4CIUdC6bbO+Tpz/LbpLSHNYKfhZSWe74BYYt8tI+yAw+jr93tof4GY+w4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iXtUBI5UWLRXhasrVZU+oK4kkg5vjiGcMB9OzcH/vs=;
 b=AU9rjhVda5qGWB6tUWDam/E3mfrGVprK0DBqWY8QEwnfswoyCu/sHpe9ezZ9esiCNkWf7qSrNMKF/P0ykIsbkngy3wK/YfjgSgAWkyL4alRY58VtMKv71KO4lxllfYxIT+7dyzKxJx7hW3RZJcQBOTvvWjf4ybmwKmmmmPgJbKVFrf1PM+wlJvK6DB9TZRbLouxE/JLiW6wPI1ZXWWPujGjeFk1eb1pryU7zQ9oEFshdRIycgtH4pKXybgnuQJyrfAjq3Hr6SoGik2yp70N0YpJEZJ7wjQWEUHAkFCivgH0cgImJzPLk5HS2G/5zNJMwG6Q0Lh5m5UImU5Wh1b7OHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB7028.namprd11.prod.outlook.com (2603:10b6:510:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 25 Mar
 2026 09:06:05 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 09:06:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: Fix flaky assertions in oneshot tests
Date: Wed, 25 Mar 2026 02:05:43 -0700
Message-ID: <20260325090543.3489042-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ad5430-8cf5-4eff-647f-08de8a4dbf0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|13003099007|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	oZvcZMhZli0RQC1EEmdIEfYG0TGM6+4efY5txj+sDoYysj9GHg1wUzj6Ld48omSU+ByQQfOWCICT8cszuSqEa1Rc4seKcVgFa46qg3jofzzIwKiqpeVQKtp/vWwUhlzJtPuN+ivuGxwofWihaSV2y+HCj2e9sMg0yRHIZEUGDHAWIFeZq2MBv/kQ/tzw/lpRI0UG0wtQ4TrCeO2ONZbWQbwgItPuF9uiNQ7J8/TM8Qox1CcJt1g9eH1iDTMZTTe7zv98UvXL0z4tDy6CRM9tOmx/ZQ+MJCSAbrlnhY+iBi1aDqqTjkDnExdy9+VBA8q+zCJoxbXcc1ql5KXC/6M9F5KI612oYVBToW0osr+xcBpSq7JwR7QQ4upDHBS2WE8DrOPRYn125zvTuDoPVqZw7er5okr9wYsrQDcCYaNjYwrOGisx5UK5i/g5cD9E8isrMG5XKJuqQa7mo+j+/jw0QTinuxOYrnftEWZtyZ3xLisDTpjYSD5ij8kbVhhu3a6lBD2oYmNBl99H+VjN05yEKInrrGJ8di7HpkGxKZzprfCVNcLT2U7F4utRFXezp5buebf2w7J5lczFmcZ6Mhqhcfl0dv+zEQFD0RamIEvg5BLhmLqMHXmrjBTPgP62BAFBge0od/rEjMUZTcPyIZANz/BcOwxA1RrCf3c8SyqSkZW+CUf2rJroMsmlnEWQAucTQOKUYJr9j/UKS7J3CEkFwBRhCZA7Qgqw4GUaqch3JoRSYV88MP1xZ2R4th1tCRaw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(13003099007)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cLJIYy2Mq9Dk+tKtV82x1dKB49IHgbHAbjla4fAiuAd8Ibe/xC4CKc0OQ1lG?=
 =?us-ascii?Q?RrhifBRerwOgmgNZYodIsDnWbN5PxlgX5tTHcfkEagnwCuMIzWC+9V+bOA0J?=
 =?us-ascii?Q?DJBQpKgYiPeffnAtCo1viaM7cKXchBHkJEJMZlHddekae40gCQrtQcYkXxE0?=
 =?us-ascii?Q?D81ooiLBhisVxxCS/qmKjgQPkz+SSuGGfeFVtiq4mIfBut+UzYZjZ80KjxZ0?=
 =?us-ascii?Q?sLrhektmTnKJf+82xa5fn1rD66EHjV/D+RuU3d99b1pjDfQpkAXNHVwUNqi4?=
 =?us-ascii?Q?KAJ5TzZ8FPVrqkvehCdaFrQ+cgv175vo5oVA4dovnn3ElHrVS5+4MQ9l9AoH?=
 =?us-ascii?Q?Oy7z6pgL8bdndmCN6hZB/UEbzPIblU5Iy7lSCSWu0JByZnMluH6P4RzN19ON?=
 =?us-ascii?Q?nitEDqWmJUtPnijso1Ei0NaS5dmjfYUs0qg3nFcfNC0+87pCsRLo5cZkMl48?=
 =?us-ascii?Q?WtvquYREWlvDLEl7u8ESi0dbkTIzQisDwXwJ7jgNkoVT0FcWF3PsIH0EHrr/?=
 =?us-ascii?Q?3NxpxGwPH3wjLoxeEVugJO44eS+fHKg/4Sr+QORknSkMYU4g4Hmo0UcsE71r?=
 =?us-ascii?Q?2Ncz3SkKItouZxTi/QdfZpgP7ZkfcmbzTZYoz/96oeUd0Ae0oZQta/xi+ijC?=
 =?us-ascii?Q?srqjPO3DMUF4nDsGbByxo9eJJhwjKaGlqB6Nqz9hOeIzgxNQpVqCSKhkg6Zw?=
 =?us-ascii?Q?Jbav/n1Xmcn+/VuP+O1a1mysf36GaAVeD4B1JxEC2Z9kJv25hMFVyQpTgpfY?=
 =?us-ascii?Q?2Wp6Xr091l3wMeerj7MMz9WBSpWncexLjPbxkd2Eh4XP6adsamnZ8FauXRuR?=
 =?us-ascii?Q?qI2oLXX4tr3FO+G3hvVuTC0IkWXS9z3nRUYSrVuV1xhbB/DNahSBbjSs4LrL?=
 =?us-ascii?Q?1U4ejLs61H/BxklrxMOs6wZQzVJsrCGecN7ylEPf8RRGetaJALzlfLdJusFG?=
 =?us-ascii?Q?2iDEECm5R4eQ79RaU/QBi1UfsjH+fIUaUlJqRsyK1ERa9MvhwQm58ZSqP+ON?=
 =?us-ascii?Q?H1xiwAVuo5cKnw1G2GJAV3EN0/9iP3RWwxHg4a9o8NJitNaru3064VwqZxJ3?=
 =?us-ascii?Q?gTdgyAXY18D5qcIUZRlXPnpfEBvzrrFc/xJfc3gBfPrZgwWHfPmHYYqArOFI?=
 =?us-ascii?Q?1WudlcWXPpSg+BGcezQeMJ6dKiPPjv3RWBj9vBwTOqf/RE1z3A6WEJwLWe9E?=
 =?us-ascii?Q?712YnqEzFTOLOkbBvdddRX8IClL2/JnsV0nN36skVpFPlulTAI9ISRP/P/bp?=
 =?us-ascii?Q?HzOJJuRpl7tzkYeKHNFD9NxqCuOSr0j0XGLj9FrKwAIcB2Lk77hHVWglutJE?=
 =?us-ascii?Q?lEl4M47a5Q+AJS1xZkxS0I/us/lxaXpI1hetm7gNHExCTpcmPlKr7EcD+8Mp?=
 =?us-ascii?Q?9BSpFZKvWpiqlQqSdHrEfew6numbM7DxeDp4jtDkGu2nz5fzN0N/BgAJCvbH?=
 =?us-ascii?Q?8gSrK04JYr5PnF5TcjHCQaYKjF9XlkYMJrjkaeHg548xcoYviqgnEK+N3771?=
 =?us-ascii?Q?v4ujHEH6Jmjrg3WEKZanMu0AegKea7jAK2AFaMsxVU+tyyUkb4QT+fenS5vF?=
 =?us-ascii?Q?GWltIQSQMdYVpgNZoqb7xP9GKKzXU7Zvid1ZT3lmyli0wYj75u4EOI2JCT35?=
 =?us-ascii?Q?60/U4jnhRPaQdt90ylln0bg0Y6xN0mImglPqXGobo9OI20hzTl8N2oUMZA/S?=
 =?us-ascii?Q?zj2ik/64rmp55ss4e2TUO19r4FQpt0W9tND7Zn6C667A5ag8507ofbbZT5gR?=
 =?us-ascii?Q?am7YC7FWXEBfg1qsWAIFnaeAIoMVqE5gUnMIjaEMNYoC+hGj6I7F?=
X-Exchange-RoutingPolicyChecked: 
	V/zmfK4WyjU0UllkdPuj1+c/sbwCnEECuDfb22OlYt2VJL3O9L1Lw/TwzmRbsctYeyVnXXkru8noTORRHKAQy8u69+t0SJYp/Vx8yoX8iRZeoyC/+vVGtAjTGr+TxgegtOliULW+W+RnoqrZq+VLeSKIRi1YClt8UjrxJzS1IR458W3q0q0Q8BTlT9IK06l4r/GFoPa1sqhBAGr8GTduK+ynvcW1Y/M0oJLGcCRgRzi/K9e8I6CxGXZqto5i3DThnD6t3BdKzWUoOZxEv8quST4GfNn1izqFyD+GeUeU/y93tpoj0++ZCTYQ7j3ug9JemjPa40IJlMWHL9QSKJa3VQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ad5430-8cf5-4eff-647f-08de8a4dbf0b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 09:06:05.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COBTQf06jY/sW5n8U2VnwSH1OEVimfTP9sGkcrHf9vshVRU3yb2QGVWhiTIGYVWeoXfWHzSc/+KiAb2rBhAiT/Jq7Z4Dv2ACpOViSQor1z0VQMJ9aHkFMleVUl0aV+wc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7028
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NCBTYWx0ZWRfXy9/botPEHHBr
 NQD0duyvF7TJvp2ddA2/IQ0Kw9rIlVkyChvPgyifs/KUNcUory1Cn3sAD7paE+RJfRN7RgOvR2y
 OoXQdZ9FabIr0ER2cI9Krk4+ALPaC5OZIfVKzZ90vulobVq0bOltSsxo5VZpe1xXUHufW7QR/Lr
 BFvYXTcsap10UO/9z5VFQ5mmIUJjZCn/vzdg4gOwZ6Pn++QvrCQA3blpo9OG9bMAhtkfDrzdDNT
 AnmOFORjVKiY16HKiXjbSIB2R2JaZrvV9nIVEEBCMkBnTf45p744yg72FRyQ2M5eJvoX6LoInoG
 IMXBlMkuNJsRseUu15VpfO4hQan9kfU11D/MdbQlL4ncHi/AuehPGmh1utMqz0VZUJ8Mv+dibo2
 d7U3quy2YGKM2F4TqQylYDBNGjqluXTsqEj0evCbivs8VSVP0MHtDaMqrhiykK+c+xNW2m/nAH+
 L+zAev9qAG6+/Sg+/nQ==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c3a581 cx=c_pps
 a=LrO9QPEl2oM1zDNvT4V0vg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=6GOuV6ve8mv778zDKlIA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XZZic5AbP4IDlfmtYOE21Q7cYWyab3FJ
X-Proofpoint-GUID: XZZic5AbP4IDlfmtYOE21Q7cYWyab3FJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 09:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233865

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Fixes [YOCTO #16199]

Backport three commits from upstream to fix flaky assertions in oneshot tests

https://github.com/rust-lang/rust/commit/6970849fee93900b6eb28a64cf957157a9fb51b3
https://github.com/rust-lang/rust/commit/dab350a3ed7691201f6752c4375e8e6ab40b58b9
https://github.com/rust-lang/rust/commit/d02743e2fd7433ba2320fc85421a8a5927235b65

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...ix-flaky-assertions-in-oneshot-tests.patch | 72 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-Fix-flaky-assertions-in-oneshot-tests.patch

diff --git a/meta/recipes-devtools/rust/files/0001-Fix-flaky-assertions-in-oneshot-tests.patch b/meta/recipes-devtools/rust/files/0001-Fix-flaky-assertions-in-oneshot-tests.patch
new file mode 100644
index 0000000000..be0e85dfbb
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-Fix-flaky-assertions-in-oneshot-tests.patch
@@ -0,0 +1,72 @@
+Backport three commits from upstream to fix flaky assertions in oneshot tests
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/6970849fee93900b6eb28a64cf957157a9fb51b3]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/dab350a3ed7691201f6752c4375e8e6ab40b58b9]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/d02743e2fd7433ba2320fc85421a8a5927235b65]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/library/std/tests/sync/oneshot.rs b/library/std/tests/sync/oneshot.rs
+index 6a87c72..d8f3cd7 100644
+--- a/library/std/tests/sync/oneshot.rs
++++ b/library/std/tests/sync/oneshot.rs
+@@ -89,15 +89,15 @@ fn send_before_recv_timeout() {
+ 
+     assert!(sender.send(22i128).is_ok());
+ 
+-    let start = Instant::now();
+-
+     let timeout = Duration::from_secs(1);
+     match receiver.recv_timeout(timeout) {
+         Ok(22) => {}
+         _ => panic!("expected Ok(22)"),
+     }
+ 
+-    assert!(start.elapsed() < timeout);
++    // FIXME(#152648): There previously was a timing assertion here.
++    // This was removed, because under load there's no guarantee that the main thread is
++    // scheduled and run before `timeout` expires
+ }
+ 
+ #[test]
+@@ -127,6 +127,7 @@ fn recv_before_send() {
+ }
+ 
+ #[test]
++#[ignore = "Inherently flaky and has caused several CI failures"]
+ fn recv_timeout_before_send() {
+     let (sender, receiver) = oneshot::channel();
+ 
+@@ -135,6 +136,8 @@ fn recv_timeout_before_send() {
+         sender.send(99u128).unwrap();
+     });
+ 
++    // FIXME(#152145): Under load, there's no guarantee that thread `t` has
++    // ever been scheduled and run before this timeout expires.
+     match receiver.recv_timeout(Duration::from_secs(1)) {
+         Ok(99) => {}
+         _ => panic!("expected Ok(99)"),
+@@ -240,7 +243,9 @@ fn recv_deadline_passed() {
+     }
+ 
+     assert!(start.elapsed() >= timeout);
+-    assert!(start.elapsed() < timeout * 3);
++    // FIXME(#152878): An upper-bound assertion on the elapsed time was removed,
++    // because CI runners can starve individual threads for a surprisingly long
++    // time, leading to flaky failures.
+ }
+ 
+ #[test]
+@@ -253,8 +258,11 @@ fn recv_time_passed() {
+         Err(RecvTimeoutError::Timeout(_)) => {}
+         _ => panic!("expected timeout error"),
+     }
++
+     assert!(start.elapsed() >= timeout);
+-    assert!(start.elapsed() < timeout * 3);
++    // FIXME(#152878): An upper-bound assertion on the elapsed time was removed,
++    // because CI runners can starve individual threads for a surprisingly long
++    // time, leading to flaky failures.
+ }
+ 
+ #[test]
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 47a0154cdc..4579b6bf6a 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
             file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=${RUSTSRC} \
+            file://0001-Fix-flaky-assertions-in-oneshot-tests.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "0b53ae34f5c0c3612cfe1de139f9167a018cd5737bc2205664fd69ba9b25f600"
 
-- 
2.49.0


