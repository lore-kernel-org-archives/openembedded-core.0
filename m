Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFB4C88E7B
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:19:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24321.1789481941828137901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W6+nv1VX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=371803a4be=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0GVj3537089
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:19:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=LWN43iG0gpZL6tFeC8ZaofSoacOdulL2ksdiHk0aRiI=; b=
	W6+nv1VXrbMDuA52tWRPMx1L5wfhB9lUE6wdLze1SiTz4/HswCV33Gg8U703hD5g
	8R+bs9H41cGpnicPx2LklZO4qxAGaXJbEhifJRIf1dh9Wm/MubURd7JGA1yzDTJY
	g4aSbfuS4LSpkKwr+16RGHL9v7SqgDlq6O/N5vjZTiTsNBSe0qu5j/ZUj4ASstqT
	qPFp76iiK1ts8lGk7pxH1KecJUiRfsylALK6MASCjBYNX/aUuxZ+DwQZLdRQBv0d
	VsPmev/dLLSuyXUtoqpOKYcdyiiTx5ZBKsaMsTS8oHkTOKwavWVPoslIwJWgCsTe
	fNJRlZAtE66/OAzHNTvbyg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022121.outbound.protection.outlook.com [52.101.48.121])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn68g5a6b-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 07:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jf+TEONcVdaBG70XlrSHi5AxrrO/XgUDMQy0vLk/Y4PfsRZVrOmCslNY8NmKJvJnNPGc/aD5I4NSNe13gaMA3EKc7E7WvZ96FC8/eFOjJvCFWdPitzjr4aLNzJguXJQGuQ4aYhCNPntS0wNLeL/jljSY0oSCtmIc7A+vKfuaQ726v4/F+lV8Yn/xDIXhmGDporvKiH83rhvRrZdxfx0I+wVN884O7AHKAE4EzwblXd6UkXTZVKN0PWy4Y64zQmmBJz/RVK8rvGmueYFAfkW4PrG4rjw3UYnE2/Vdk10IH1p4mJeRYOrmQr+pcvDOwiM7XyZpFWOscC+c+5EK8WCrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWN43iG0gpZL6tFeC8ZaofSoacOdulL2ksdiHk0aRiI=;
 b=jtP6tZ0P26B5s27hexqQAdRNFYd11e/h69yf306J2Blapdn4rjIx244OP+Wj1Ql/0qcJZTwiCpBafVxEdn7eykBJHYpCq/SNMh4+L+OxTxaBeIotQ7ZVbrA9xzKlmNNlk2O3yO4Jpt48fE9OXqMgK9iqkRERolCToImjt7+5iohGVcDUrRx3yPx0SNnXwjXDwHJcK3oE2+C8/lm5jm56wTA3q07hD7Yr+RlAULGATK6vP7nROHZWUWYla+NN3yHd+W0L/yh8pOVXCfGQhWtGxsOg57txTzM5zsIxLJ7dphZipuKOkzvbkquDiHdZvaDBlWudpt5ttL2v4QmxKQADFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 14:18:59 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 14:18:59 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Randy.Macleod@windriver.com,
        alejandro@enedino.org
Subject: [PATCH 1/5] rust: drop the cc object-name reproducibility patch
Date: Tue, 15 Sep 2026 19:48:30 +0530
Message-ID: <20260915141834.1212812-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::17) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: 108484ba-c90c-4847-396b-08df13344899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|29003799003|6133799003|12006099003|25016099003|18002099003|22082099003|3023799007|13003099007|10067099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	B/LgH6GSdMcHUupJQnVgBNes724P0obbk5p47DV6SJK/5e1v+IfRqMsTql338gcWq3v/celAOP+rZJs5kBREmuv8Vq73a2R33ix9JjmPGJU4HuFhYAMDF3MdYV1tcrDW90wG3RpMXlVqr0s50ThojviV5+4DOlysXgJgDj2HfbfDTc0WO3gKT2LF9z+N9nERATzkXIbrwN8kZYN7JYqsIV4z2Tkis2z6UHEAMyeL63cyx/71E9PwMZhXCpOEtZL1bBohMsUf4Qh5I3peVA0+9iVMMaLmHu5Z9pWmix/U2ek66UKo6GiwjKhAX2P2WsjbRd6SNPzZTc5hc8ChkuSaMvBL8+KP/9IOIBSmB1yQ9OYSFnLrdPGaEl/s42zyjcYOHVkOVP8YAuyQXd4T1ULrXhASkJd6eTzAPL0JRDSCEKbKCQiULDcaIkwZQ9KdTyrYyGXjtwqfCn9Y9KcmMygo5JNYX3lZQTz1TFr+b8+nG319aWV2BSIVsyX1Ve3coHgKvcsUeU0HtTLMb/4DsQ3e8yFr/uoLSsgnKphv1+ehqXyhiB5NrBpy29U0qG41ZDAGsInF2t2V20OsBT7xo0keCbNs+kQXrB6tSg6a6HiT5+2MC01dfupDQu1+enboK8ZL7yf36DwnO5NDhjAh/JbUy8aA0wzVuAl4tUXsxFCL98M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(29003799003)(6133799003)(12006099003)(25016099003)(18002099003)(22082099003)(3023799007)(13003099007)(10067099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/7LPOLE11Bs83SLOZoMx4yiP5Ma+8AyNuocsyWhqKUznPggpg5R5F5Dd/+yB?=
 =?us-ascii?Q?TWJoPlpM44x/i034jgaPeLew+2ahEgcUavoTF6L+pU/ITcKDu4znfImxzXLi?=
 =?us-ascii?Q?7Ex5ATFcRRAX8I3/cZJfczdg8WJTBrbezrgkNpfmxdAOj+GoG2Glfdw/yFbd?=
 =?us-ascii?Q?9jkuGRIZbMiuKrJMpE6J41nfwxk3KHrb4nLzMBPSAvCAy8FcGH4RvZqzUW07?=
 =?us-ascii?Q?jpTMSfijZ7RII9u7fzeQzKY3e8vvJjFPJJn4eOF4VMKlUFprvtebJOrtIXAD?=
 =?us-ascii?Q?whM9rbztsTkvBWPVsAcDiTJnbUleJVgzMhxRgTHSgI0yi+ziUqC1M5PFsN0k?=
 =?us-ascii?Q?9CcaM2FCFwQTFPCj8oW6hH0dUDFXRCY7G32D4CHwzhTvsssTVafULYolQDOx?=
 =?us-ascii?Q?rRdO/8JNmj5H058YAlflocdGz6b73docB5xzXCtmDHbmRBTGHzkmunOhA8m7?=
 =?us-ascii?Q?2c3+6SWYMSxmeOGOuIu4xFYhGaQeg+vKMrbRdZK7Cu3ApMcjxWNozrlSjNhA?=
 =?us-ascii?Q?CSGxbxcFDUsNlc3KHlkf3cZSquRRdpL5aA5BRalrTNYWGOMinWyaLEriEmsj?=
 =?us-ascii?Q?aBvYqbSV5XBk+ToG0zx5X72QlrLnR34Q/IVWdzOQjRkdr1m0KQbbyHKDxj3n?=
 =?us-ascii?Q?JBSGLcuTnq/qPBbG37+fbtxPG5eT6W1lYN65os61T138+Oa/X1po9THCmie0?=
 =?us-ascii?Q?pZXYTtutFXSEeFsBXpStKimClP7xXB52QotN9p/prv+dC4n/sPyEcQXaceQt?=
 =?us-ascii?Q?94rFTQTdChemNFz/C2u2vZc60JEiQlCqMpUiDqympUsmiUeiP7GXGBJgK6o+?=
 =?us-ascii?Q?hEWhhQuaGwahoMSP7YVxN4S2vL2+vOzSLyDKDe5JQHoZhC8hle/VtZbN93gS?=
 =?us-ascii?Q?vXB/uUliaBblyqd2L83In29KK/QnyIorRNc9jWsV7q4/YL8j1cfeu0iuTkUp?=
 =?us-ascii?Q?4eQaa5TyARbtuKz3FIbEToehEkcZ5wcKRHubu7IW5GTH4j7HRBXaeNUexBg7?=
 =?us-ascii?Q?zIlITcHEHBNIHmqbiDArsF5rsZBcwq2EtEX762URHwMYNf2Zk5tD+haN7iB4?=
 =?us-ascii?Q?cxJyT9Zke8oTwhao0Dp35XyPSTSHqf/KXc/AR2vOfebV+KFiMohFmxjX13ZZ?=
 =?us-ascii?Q?KSC0GnsIlYj3nXdjCwIheHKw5/tmwqbPDYY1wOhauelF3FKl0CPCDn6RK75N?=
 =?us-ascii?Q?QJQaZD2QPF7ulI7qH/ajmTfLoMIhJ6uHMZnyorMgwc1la5kgkBA9qOy+IzoK?=
 =?us-ascii?Q?c3x4oqlO0Zmaoa4YYBBY96xmUycJD5NaxA3MJHRB4Kx1QPZbLhSF5DAlQd8/?=
 =?us-ascii?Q?ATQBSOMWIfnyuaaH/aM4MIiPPW/VaaVpPQBP3D4rPxw5mgXQPcKJr4eOhEno?=
 =?us-ascii?Q?YYyF1twqIKb/xFP8RSkUtyLOipb8a4RyyU4cshHwHvSanJPPue06834TCsZF?=
 =?us-ascii?Q?W0lpFVSw28ztS1Sq3+UY6Ya5ggy4WhzQGpXKNgHDBS9Q4CCZ9BUvrFUnbZay?=
 =?us-ascii?Q?uC0thLIv0zFOMS4xeHIaJAzZuLrWvlsT2zlq/gQLL/zT1uK0PDJVpLOzlNAZ?=
 =?us-ascii?Q?yKOD2y2c02DIfhEkg5uSueuklyJ5jBpoMzDVjc7WgqyS7aLfRIaQorOrgzV0?=
 =?us-ascii?Q?ky2tiRwtU6oF8wt8Tlvyp8iW3BgTFQXBAxhs2XAPIKng3Xl/daQzyQPEr8VG?=
 =?us-ascii?Q?PW9hCPRwm743fUh8fpCbb0EQBv6yM3jM0P3dK3PyH4NaMdB6wnnjKxNOCC5P?=
 =?us-ascii?Q?ABcvxn6gu9a4wg/D8gBiCsCrUsrWzO4=3D?=
X-Exchange-RoutingPolicyChecked: 
	pFMIMRw6hTGQTdUDf/QrT4lvankjUsUCfBWrz1gvKsTi8T1M1uPXyhOaShGNwr20rkJJIQ9pK/xOvnHrjSI3Icpxjrgbn2ozGspZKBRx/xde3VkniUFrD0Cjn+obO/Wo6h+XHJDm1GnrtogvefAzK/ajJlegwUUtIxuZm+bxX0ESnOutJmzkT+UEcxVs7/V5u5K1Wutm7Iq3ZDyXf9VkTnRDecvd2iIhil1+/WZI438obOVgEgNPHtqETH8gcyjkGHJp/Iu8SPV0IU6q+QA1rIwdm0b/13wJJWApmOVlBBfrUlCaQPyEXyS9EuPZfs32BpqSqIW183DQuxudtvgbUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 108484ba-c90c-4847-396b-08df13344899
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:18:59.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jG5KyRphlbzZmH/ns7O4wUTUXZuKlX+Km+CcmvYw1WfdVlDwHYYUv93xeyIuHPpXC8ShbseVVnVzmg/8LOOUrYAKx+TW3sXeb8XSW1KCdeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: siGJyzWc5NagNuS2pcWAdI7sjrkWstvq
X-Authority-Analysis: v=2.4 cv=cswOAF4i c=1 sm=1 tr=0 ts=6aa953d5 cx=c_pps
 a=jtibSCz00SxEcFhpBRTXcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=xZ-Vo6NjDGti9U_2Ia8A:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Oq4Vy3458gLamwXu4UIl:22
X-Proofpoint-GUID: xdrGStfyLJMEfE-No13N14sxBHeQRHhA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfXzmX5yFKq3PWb
 of1OCOwYNZMUcgvUuVb+5Y+8IsPcPuYfOJV/NG23ujsRRBeACoJzaL9Ed0ITPsK4MNXMWEDDy6Y
 ECadvs3XxrhrakX5cAuFLkIoH7m1E1++fGKOhJr84dHuUQEjuGBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfX+UgNz8v1O6z8
 YhV9+m8ltVVBOS0R3e4Dlpe3zuseLNhYa+ylmZ1fWVhmTE0w24OmIddVuUGOpGPf5MLWZTBu/TD
 5nBqmQa0GXBu6DaVl7tS58ro+E3lb26nUAfKhT7wcqrR3jldM+zVEatTqRGOfbYWkmT3xLxsXEq
 HDqoczVwa0Yw87HEqYlfaudo0uXVknwMm1jpBgGqPR9OpXlbf1fO2RHqjyoo16DviV+RSQPL3Zk
 3tEExQ3kxDuaEyhItN9RmZPz9tyn7uwQVezxLAA+VGX+35ojK8s1jJ8PpApYOMw8sp+y3AzMz7d
 Th3VfEoRk5GntMTyAH2eBXcr+8C0bswYB/YY0ifhg1DDy/YR1EjnDZkxg12YA+DdYuCueTBxVeT
 P21YhJhna4pVkejTQEkOY3CR/e0enbAR9sXYmV247I8ZSXsVpCX/VlrLvHZqijkzNPD7aDu6122
 RWEtMQm5nu58WdCoDIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245842

From: Sunil Dora <sunilkumar.dora@windriver.com>

This patch trims the source directory at the string "rustc" before cc
hashes it into the object file names. After the shared source rework the
build no longer runs under rustc-*-src, so the sources that
compiler-builtins generates into OUT_DIR are not trimmed and the build
path ends up in their names.

Replaced by cc-hash-object-names-relative-to-source-roots.patch.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...epro-issue-fix-with-cc-crate-hashmap.patch | 67 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 2 files changed, 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/repro-issue-fix-with-c=
c-crate-hashmap.patch

diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate=
-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-c=
rate-hashmap.patch
deleted file mode 100644
index efb379acb9..0000000000
--- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hashma=
p.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-rust: reproducibility issue fix with v1.84
-
-A few crates are using the updated version of the 'cc' crate and this is c=
ausing the generated object file names containing a unique hashmap id.
-By the following changes same hash values will be genarted even for diffre=
nt build paths.
-
-Below are the links for detailed bug description & discusssion with upstre=
am rust.
-https://github.com/rust-lang/cc-rs/pull/1277
-
-Upstream-Status: Submitted [https://github.com/rust-lang/cc-rs/pull/1277]
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-diff --git a/vendor/cc-1.2.0/src/command_helpers.rs b/vendor/cc-1.2.0/src/=
command_helpers.rs
-index fe919a5239..2b1f442019 100644
---- a/vendor/cc-1.2.0/src/command_helpers.rs
-+++ b/vendor/cc-1.2.0/src/command_helpers.rs
-@@ -289,6 +289,7 @@
- /// and store them in the output Object.
- pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Resu=
lt<Vec<Object>, Error> {
-     let mut objects =3D Vec::with_capacity(files.len());
-+    let target_substring =3D ["rustc"];
-     for file in files {
-         let basename =3D file
-             .file_name()
-@@ -309,6 +310,26 @@
-             })?
-             .to_string_lossy();
-
-+        // Function to find the position of the first occurrence of the t=
arget substring
-+        fn find_target_position(s: &str, targets: &[&str]) -> Option<usiz=
e> {
-+            let mut pos =3D None;
-+            for target in targets {
-+                if let Some(index) =3D s.rfind(target) {
-+                    //If a target is found and pos is None, set it
-+                        if pos.is_none() || index < pos.unwrap() {
-+                            pos =3D Some(index);
-+                        }
-+                }
-+            }
-+            pos
-+        }
-+
-+        let filtered_dirname =3D if let Some(pos) =3D find_target_positio=
n(&dirname, &target_substring) {
-+            dirname[pos..].to_string()  //Keep everything from the target=
 substring onwards
-+        }  else {
-+            dirname.to_string()  //If target substring is not found, keep=
 the original dirname
-+        };
-+
-         // Hash the dirname. This should prevent conflicts if we have mul=
tiple
-         // object files with the same filename in different subfolders.
-         let mut hasher =3D hash_map::DefaultHasher::new();
-@@ -326,7 +347,7 @@
-             dirname
-         };
-
--        hasher.write(dirname.as_bytes());
-+        hasher.write(filtered_dirname.as_bytes());
-         let obj =3D dst
-             .join(format!("{:016x}-{}", hasher.finish(), basename))
-             .with_extension("o");
-diff --git a/vendor/cc-1.2.0/.cargo-checksum.json b/vendor/cc-1.2.0/.cargo=
-checksum.json
-index b070eeb322..ba768ff86f 100644
---- a/vendor/cc-1.2.0/.cargo-checksum.json
-+++ b/vendor/cc-1.2.0/.cargo-checksum.json
-@@ -1 +1 @@
--{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"b766a70e39b8ea7bb57afd288bcac205a23f6a26ac561=
9cb1d5b10f70c5dfdea","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
-\ No newline at end of file
-+{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"174101852b2633a2478cef20d063fb9c2f1b092eac479=
13a6e708c85663b8404","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 019e2585e2..28c6d0b1dc 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -3,7 +3,6 @@ RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.=
tar.xz;name=3Drust \
             file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux=
-g.patch;patchdir=3D${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
-            file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-ru=
st.patch;patchdir=3D${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.patch=
;patchdir=3D${RUSTSRC} \
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.p=
atch;patchdir=3D${RUSTSRC} \
--=20
2.43.0


