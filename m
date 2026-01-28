Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B7DD35670
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 03:19:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5327.1769570370579583031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 19:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EysPYmhm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54881801b1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S0oJHd1661830
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 03:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=; b=
	EysPYmhmrUatJezCutkuQbsHARb2fapuqAae29+jbylxzVWYRW5oNihCeRjuAG8U
	tlaMaZQfSO5ZMiLMD+v2g3aGGoOES6ZAepclo8Y1e96sI0QaSOg4mao4bHiBQ9vi
	e/8NxbgVOc486uO6hu21PBYj6vDe5unOVvN/GAg4GhYxqzO3s3U/7hliasNrXxFg
	zNEJpD0TkNKfRUg0A37h5Bg6RQImQu8T7A1BGvhjJNo3Y5hJCCj2UfEqNskiQZTM
	CZv2FcGoMigmGeRv/khugrGlpCB1vRtrr9aqE4RNIpBsiiiGE7dSEbmELqwWLflW
	PwQmoGd3AXu1oQqsy77Qtw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvka04ec5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 03:19:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W//L9aiIohtTV25tBoTogT+sMh9QgqKsEOx9q+tgNQ9CRwhlb0WUtt2z2wzR1qQUPvJUR+I2Gn/g30By1ranAD8OJdPq8/9WGIV6sISKRHKCmUXiZvCplvQZYTYfMgzp7menDGdxwW5EWRVNaP94aG3j4oCkVqF+L1+z8cWAKrjp+AuXh0BzDKQp0jBx42Qiyf1hheeErQ2KQEiiNdNQhxFRZSc9dAPKFpviDFZD4xuIjXBZFkYWvc0VmLsfCpiEGJip2wHodp2kaIFT9mDChzO+kb3Vm6ameq4DzktKDgMN40D4fcJwxxQHfGHphVYBY9vmaY4udAWOxXhghM9aOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=;
 b=sTkSBS3Br4nd50f83WE42ebBr2CCYhmorajlxu/Uu5lYR4g39VHZ0Oic9Wzi5TAN02U+aY1xTv+z/Siiw6MSFJOR8nKhmuHRAE/O81qZWseviksjBl/c6eHHyvB0SjzDIEJS+eqS6BoX+lsQqGyOmK6FZQ8fqDExdQLBobYdWWRN9NDJnPo0CCQ7pjUCA1nUQ1DBjpfvrUzI0xxWJ/bi/5azN2BahMx239SLxbkkptr13yKKKkgvvULUWkUlUI+tq6FUsKKRqkk7kFX/D238KjyvfHFok6Ry0ZpmMaj0cC2dH5D66LI7M5SFWQudFnJ0cNg+vxL+2QPQUjzv6us3dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 03:19:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 03:19:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: liuyd.fnst@fujitsu.com
Subject: [PATCH 2/2 v5] epiphany: upgrade 48.5 -> 49.2
Date: Wed, 28 Jan 2026 11:19:12 +0800
Message-Id: <20260128031912.227891-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128031912.227891-1-yi.zhao@windriver.com>
References: <20260128031912.227891-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f074d04-d983-43ad-d687-08de5e1c0b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18082099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LiYWfjWCj7zao6t8YUr7taUD8NXq4liy/pQKneLCI9SL+m+TMGuhBbPq3if8?=
 =?us-ascii?Q?znoSUNclNUf4LZAfjFpCG8gpOi+03jhVsstUH5msOutedZpnNiJn4Rd7d/CD?=
 =?us-ascii?Q?3c/gex678XJNWa2tAcJvm2jFdWKzaBNPkWNJEczQrb8mZ5gvHnTDuJBOIJ1d?=
 =?us-ascii?Q?IQNlNxaIexLPMbD75doEPjvloNe3q7cSnLIAnWTIcOCHXeerMpIhoDqv34Ov?=
 =?us-ascii?Q?Ybf+hj3Hy9PJ1ShvH1jcY5e/pfrGpmDO83NZX/mlPkJdrsiqT9zuF3dG78ts?=
 =?us-ascii?Q?myy1whZKe0+HdCZo79xCVwPfZoVSEmuV4frpaUdIaa8qfpdcU/emlCeOyfi+?=
 =?us-ascii?Q?V0+A0iglnu3FEm5/zV/aru83n3KPFWOH23S5AST3MqMLIijQy5JsrZ6v0wIJ?=
 =?us-ascii?Q?yVJMRX446NgPKwJ0yFbAcDYid9jMSrgLej86nr/DEX2qt9ZRy/1ozvoZNFHH?=
 =?us-ascii?Q?z3eqFsu38ERL68JNe+ldfmbYpAnQ1glpPoXLAkbTTNOVjSrtJemdW4GmWPwO?=
 =?us-ascii?Q?b+mrS3I11dkXUIARhMxJ0lF95G78yDh4HpBm5EEOTK0E8dCHBf1t8n4inRjX?=
 =?us-ascii?Q?Hm+DuRVK3alraSCW3UrgdVlpOl5RCnyYbN3I0y3uY2QvMCR5Npyqx+H6fAQ4?=
 =?us-ascii?Q?a5V1d67s5b5Y7XXuJ+pUHVLF/+/GGoxwVEif5JPDTeixsEBP8Byx6aC6A0Ad?=
 =?us-ascii?Q?4+RNWfsc7uE4AiWIz74LjAeI4uoMA+KPZIHFd7+yNBI4Phrff9LueYNYGXFe?=
 =?us-ascii?Q?G9GtNMtCH2Nutrg8llpL9YS1P0Nj5f7LV4SgrIMDUlETWLu+LgvvL8bGOlIc?=
 =?us-ascii?Q?jQcWuIEft1Mojcjf/c8YIs0FmohuhKiRU+RBS1iIv6+uQYtagBbgWPIyqXDv?=
 =?us-ascii?Q?h9RZCpH5glpn4WMTST4T/u+Ighcf474hcm0u/wpyOVptPskGdY9BxX0PcG2e?=
 =?us-ascii?Q?CXS6KbN+yf1EBUGd7CnLT/Fglqi1/HN+CwEUdse3ZntDrcpqpoXVPPuzZu02?=
 =?us-ascii?Q?kdQH8pJkiJV2M/IH/suHXkgMX650UjT/snu+uRGJKzA9IkbHgLOFM7u5ptI0?=
 =?us-ascii?Q?Dll7B2Pwtrti9+84lOhVsF8lPr9De9q9ivN0nUCyDBjxkvxJEbolHQlj+DZa?=
 =?us-ascii?Q?wg6H6EFMcAOcEXg4XEQtSODbRkByIJO6cM5TZJk27ZohCHTv3QaeWnb0L57n?=
 =?us-ascii?Q?+Uu3t8yaWHpHYNt9AJ8t9BiRG7of9DLtyfFJbxr/D2rZ+h2yCAdmEZj6i8/6?=
 =?us-ascii?Q?zhoXrveXJjcdRyJGGQQqsrDbfNcgch4QQTCJilHADYL8ysgar9XzbUvXSQO/?=
 =?us-ascii?Q?NbGnB54GBu+Ip0HLfb10K3TVNrk2D1d88j+YBFfPyarvW7jNhSuWCatEDKEt?=
 =?us-ascii?Q?kVxMVsPL+RfeywbpVpwNul5e/F6847ouywKauGJPBvaPehsZK6LAcf0qx3Vb?=
 =?us-ascii?Q?8FO5kLHJax8yiExM5HNB+cPs39Mu7oR/J3z4/Nj9nGTMWpuRWEreK8B5I9fk?=
 =?us-ascii?Q?VegPfoIX9f6oViAct2KaM3UYHxJJgm/iFgts6updhaBB6j292lGcC0a/Swhn?=
 =?us-ascii?Q?iiXH37U8uhNKCRL2pt7Tv8n8Lwwv79oKdY6417lDJoVaCR1cJfrLe+5LQHLF?=
 =?us-ascii?Q?E2WAJdzbwJRYf4d1763x7c0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UbpCBWJX+DqCpsCzIV/hI0nVVFDFjzWfjBrUD4LanFO3QtD3BzQSEOzuz5wy?=
 =?us-ascii?Q?i34fh14aMiStLoPSi2cM0O41SP+EA678E1ASx2tq6DrXpLNcY6Bz8pjQePW3?=
 =?us-ascii?Q?4PqmNwAF0XLMI62AMQ+92N5WYNFsG+ZIFcWcyAI8TmfmQy1ZkcwQEKwxHcqm?=
 =?us-ascii?Q?r64YenTVYl2RwHxAozdyYOq0qf5P+Hbl8JaMfA+jWsHhaAWGJG1X1gRO4ZKN?=
 =?us-ascii?Q?1YeV6sNcB/h/qayeoiL/cOioNJ2SWf2GOIE+Uxv4AdDJLhqdBJRx+neMhMpv?=
 =?us-ascii?Q?bwgcI9iyJoWkMaMRjrPFe30F1ClpN5fKBTTmozDs2Bp+CJQqQcR3PVtLg3dp?=
 =?us-ascii?Q?+NT2L/7vDIPJ0bqmCebmUJxrS9fG/PpObVHt0aGJ7SoDZkt44H4yZyPA2yU3?=
 =?us-ascii?Q?TeXklW3xfyn656j4mccwRmL/N2dYkdSvbZbWzPfNe3YMrhVRJS3kBTQ6otdJ?=
 =?us-ascii?Q?o5mLNcY/csPPVl4gSyXLzKOfGJy1fR9GGBS0jkTEmLhNaEGMg4UMypJ1B6Zc?=
 =?us-ascii?Q?fHYTTButnFcudMjx2+1KRKw6/UAlB1hWFzmC6J96EIfvxD9dxAMxQLWrUKOE?=
 =?us-ascii?Q?So/UJCFD9Y4XY+EnqGy1D+4/ONuTn8iGGd2Vn2vmMdaJjLy1WyILyrYrdFWu?=
 =?us-ascii?Q?tTB7B1TxsAKv39BrV9hLqUZkAIuCRkheQC6G4nDtE0n0SYPDnN1vNK0LryKo?=
 =?us-ascii?Q?cJLTgMqZKcxAB0v99E1vzIE9pYr0WCs+cJYVx4VUbgalbFzhxKhrcmicSNfB?=
 =?us-ascii?Q?sgR7dJpYbrzKmUqY9uXlqueTTs5Qp18oKPMUSpKSbb0m4sxk9ikUjoJKYlXC?=
 =?us-ascii?Q?ssInp4y0+U+nUHdstIb+rpDHyNTWlGDGJM4QC2txERyLU1frThN6bWkFb4Mr?=
 =?us-ascii?Q?ZlbZyZVpBnUO2cn8GVWDBBJZOjPiTw8Ac+Gtv1gf6yyZWGc7LsI51J6OOcgn?=
 =?us-ascii?Q?y/Oe4tBHjlhEBNu04HZkOEg3i5UEIqHayL4UV/uQxQbLzFNCi5xdDT1+/Ozw?=
 =?us-ascii?Q?sPO09/1BcDaJoFbGg47j8Dvqyp0HGnqlQaHbrD8Iqa4mjV3ggs6vXUqnRJJJ?=
 =?us-ascii?Q?lyif3eyz6qZ44MlXL08aZt0xa2f32paamXiaZQ4MjC2wQVN4pbPllrMmgpks?=
 =?us-ascii?Q?rQbB+E3OKr3pYjGMLL8hyBUPiEAgRiOOZNh8LJQl2BAzQADpc7FnHRIGOFXA?=
 =?us-ascii?Q?FxHhSM6H0T2MPToqv6sQdR5JFtUYMtRt955DOgLAdflbfakWWA9qA3RgpAiq?=
 =?us-ascii?Q?klqXrWH7YfzN0y3q9CNBRXIXun5AuwixWe65c8GfXnzl/2xBa9k5DIG+rP8R?=
 =?us-ascii?Q?WbjS6f/ZDVEV30rDURMYSmnm2NGPhfKadnacGEzvNyGGdzd7hkFRKwoDe4iZ?=
 =?us-ascii?Q?hL8ZZjmBoi71yn5kJsMoH2b4eOJ/QvF8bcsInKPBUTRMD9KYNIXPyFQ8vfNj?=
 =?us-ascii?Q?qfT3glnxn4NCqRoBoKF2ftkdgqwij0IenFvqWaGRaay9MJZdWZfSBdGYIyFn?=
 =?us-ascii?Q?kIKCoGMcVoGiR/yaoXMuXE4s0ktfv9X5K0l2yUygW22NnaEok1QM3dom8mmp?=
 =?us-ascii?Q?mQuCTd8fs/bRARnLB/A3bwil87WuZB5Rokfj3yz4ilcAApXdLWRjhcYurW3m?=
 =?us-ascii?Q?gxmf/0AN/Bo8QdtEg+9K4U3hTQ4IkxUU4E3i5EVBXXPbZEsxYBDFdkLd1X6W?=
 =?us-ascii?Q?k1I3Uj79oBwAz4WPngUFUECROqw0KYrblNs4rEfJ5ukx8UxGckZw/gsviicf?=
 =?us-ascii?Q?qV4Y5ZWH2w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f074d04-d983-43ad-d687-08de5e1c0b40
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 03:19:27.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrEEIiQNYmFqRaMSAZ5dfd8ofWW8dDSJv0O9nDqC1jEw8Kh2MZ/gCFIUGFN1lghd2gNikcPHNwzAcxQ66a9WRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I+hohdgg c=1 sm=1 tr=0 ts=69798041 cx=c_pps
 a=u7dnV0yUwpVRNDUrCOcuvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=ACvvd1FpC_yVDdpOqSUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAyMyBTYWx0ZWRfX33Fa6jIGCBqk
 6y3Zq0DPU8PRQv/WgrfYfmk8XOAQaVix+K5pV6SzvDJJnEE2D87YJAylagi9fy35EfZxByMboGi
 EaJXfssPi+Cv4xsfbWvIml0ServqkCf5DjpjlK5DrW/nNXSynHbcvz9uQUld2PsZjjrIcF0QL66
 lqmbVFBYViqFI9sYN7F+EQrgknin9wxDq7M9/VsLHAXaFUUc6V1hLPWonv6pVvj1c6Lb97qtjXC
 d0z/f2Fr07e3FN2Bo0kZ113WQ+3FIvYBXz7On3OyfBpUKiO9ICgJLLEHVSTZGVWOanhDxBG293x
 fhgRlJHJnLIYFm193HsaHHDYe/+ZatWeN1RgadbrRKKaIrvNbYgIg+69I5hwGFqWUJBg23ArzIo
 UxpEg2sTHR/EkAGSlHbvk6ZdOOiQBcgZiKl48hBMiKl/n/35kyKXxYsDwueX8qT4Yh6f/QBi6IL
 R1skIV7KpbL9RUgoJ6w==
X-Proofpoint-GUID: aG7KK2eGJc6Nl5W4CpJR-15YqdYb_Xbo
X-Proofpoint-ORIG-GUID: i3x4A-LhrXvW7u8iPQNYGRud_tM0sOLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 03:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230072

ChangeLog:
https://gitlab.gnome.org/GNOME/epiphany/-/blob/49.2/NEWS

Add a dependency on blueprint-compiler-native.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../epiphany/{epiphany_48.5.bb => epiphany_49.2.bb}          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.5.bb => epiphany_49.2.bb} (88%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.5.bb b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
similarity index 88%
rename from meta/recipes-gnome/epiphany/epiphany_48.5.bb
rename to meta/recipes-gnome/epiphany/epiphany_49.2.bb
index 6a1abdc553..4c27a6b6c7 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
@@ -21,6 +21,7 @@ DEPENDS = " \
           glib-2.0-native \
           coreutils-native \
           desktop-file-utils-native \
+          blueprint-compiler-native \
           "
 
 inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cache
@@ -31,7 +32,9 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
+SRC_URI[archive.sha256sum] = "b3ba3d68213e87f81f1733e85500c37b82b5938f9009e4fe89994963d5fb2b8e"
+
+export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.34.1


