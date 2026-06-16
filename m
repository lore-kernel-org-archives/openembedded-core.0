Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234DFCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 18:49:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5133.1781635762921592173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 11:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m8uyis1F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=062783b9fa=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIPoD84156295
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 11:49:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=hAsm6fQkQ
	4gRRrloosz/ekv0EDxpgIWc1RoqYHqvdNU=; b=m8uyis1F4jbF2caOTZU9Z53FN
	8lhEcdl8Zr2Cvkg5YmRL6wU3i+KlaAbFViVYk5RZhOXpje1ZNpsQUVDe8d/lHrWc
	BEF3U/6IMYInHXkEpXUBib8E72E3V63yiJ7SyIma4/5PgchmTQHNwvglBx0uZaqJ
	Yxudpol8X5MzeJUNCqp4RFq5R9Vd9+iwGNT01JmVlKqqIggmCG5r2QVL6e1dHUMM
	oft1JnJyQuk7EVMUu9XuIvOQRayHX5UheMQD6Vi5sUohu7uTXtrzTaVMmPk6zTD5
	A/77wc3PBHMYxJJrI0NK1Q2NTj6Sz4vgMqglzcvPW+TRUHzPokuc89rcD3rYg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es2g0dakr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 11:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8LvWi/Smwmlov8IKWXRxeVX5zb8KUWPiJIX2IDg/bHxFkMgidwI7LG2DUEYgS5kzUkaXFcV9NyY4v5fgAIVanrrWyqxbrXrW/F88n6ph2HMdBwE58rFOnErlAv3TuCvz6jP2UITs5Bzksb5hGfH9aNBQZfRqP+Av+YHZ2Ia8YA3P9r0oVdwrLtkQHArhHY+XUCNzisLjseqC6apE8MTLI7rMZVP0nxAi5ekVH/OVZjeNQiUsuSTVo3TNCfZ5l86VGoqiA+clRcJkwJsutmTn0Np+1K95HWBpxOTlsFg3yI0nLquwedHGM/rpgQRQWPUqJD6s/EZl2mjzLAUiwBvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAsm6fQkQ4gRRrloosz/ekv0EDxpgIWc1RoqYHqvdNU=;
 b=hB/pS+wPUZhEXl519kRm36qJOWce7rz3WUX+Kw/ZcrGEKa6EqPrGYjwHP3eiO0Q9gUMK2bomrnTgdAEKw7HksZutEK9oRUKoD5GeD3cBsxxzSawIgiVKM/9jziSdskjvTvEvgtHfgIAom4xwou0G7vhoE810APXcmMtsaxCUPWF9JRCdqp+/12zAfvnin6vzkTYk5/t1gb38yvstKzCAep+Dw6l1z2zovyqCyT12ONVW8lJkqcY/A875U+7kEi3yKTuMUF3wgpeq8d+oGtwgMzI0+5H4MU7JZJVfaXM7cvOwalM8dBOJmEE4kBiYbO34AOd/SwQei2lcEXVE01Fz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA4PR11MB9232.namprd11.prod.outlook.com (2603:10b6:208:56e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 18:49:18 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 18:49:18 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep Kokkonda <sundeep.kokkonda@windriver.com>,
        Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] clang/llvm: Upgrade to 22.1.8 release
Date: Tue, 16 Jun 2026 11:49:00 -0700
Message-ID: <20260616184900.4173394-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA4PR11MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eaccbd5-ea2d-419c-fe23-08decbd7f8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|38350700014|3023799007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	1HB8Gauik5uZ7Hx7Hcp8M8ZAUgDnQXCBC63w7lSFRuuCF4fmXb7N9yt2mv2CMWzIq9CAcXkY+7k1Q7w8jv5oO3uPy2WE2F11pI//VM9101lG164yn/ywvBOssl7AgId/yaLCHKILmsXPKG8EM4GI39Mg5Pi20dk13zfiOmmbh5wAIC6YBhvoiao1xjL1Xu2FevG37i59bfsNGMif0iXAyuTbn7KmK2epwWEkDZAI56/UCvLMOU8B/GIIi6IzKeZoDGnUfrhLNxY3Vafql1XTgDpoytTAEkW4cmuXIUftdjPki1s336Qpz8OpaiFvXpTFlFocggLKLT8i2TqvC8zsigQsToFplGJiagoBF+3MxB1pva9PiYUP+IfancQNzCYiNKAxdxDmkt+fMvH8qlCJiPURBmVyCbdqgiljeYru2jp5ZNyUvalhj+1GhP3yV7tV12tb99vmFoPtOm1BAevffT3K2guSjC5vDFcwXmta8w0W+1XQuhVZCe88rzB3f9s46+4tfxV1ghw+0hRWaBg8+kTDvUrApXErCQGC4bfYEvIlFTtPa4RJeznCqk8jlDhh5Qx+JeOoz3zg9uUynzLBlAKqe0M4jzs//VD5kxOMsY4M2OBXIIvUY40Z+HD2qUEjah8jm7Wt3uqTtbU4i2tiuQLOa8xQYa16AhoPeCOjxB8gOw5s4A05nh4R60PTEAb/in50wf0poeARL9c31IB/jGI4807DZjouFofZMO+lwuO8dD/7rTqnzqqIAS5gsvHM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(38350700014)(3023799007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?elKuXm9VCN2Yh71XHMxZoCxS5xVK+QHyCQRwvBUz0DQRW05TYVgSJezsW9YC?=
 =?us-ascii?Q?AsrPppAGVip+sAmKR8G6Ega1Jfxq49AwQWVJ/3r3TSFiuhbiNmyRdtlXAjNx?=
 =?us-ascii?Q?cFsLWh4/d1svGXeqDfKXf15Z+8+/rfhhaJqFhwY/tbgTm0rUYOE+v/z+dZ2V?=
 =?us-ascii?Q?nQOp/kCAiu9kwQg2rBwk7Ytv42QPnRsgQYQ2M+4p4CxkjY5jKbJuNBD//Lem?=
 =?us-ascii?Q?vNnxQkCRdijsWfIV9JWRPRXpSahbPcVFJbk+MLecqwQAX6IU8QPaRUaSL4aQ?=
 =?us-ascii?Q?G9OycP012FmQSXgf6telQ04In5v3vaCgikpHYfaz1zB0X8VaSxC/9ES6aVjB?=
 =?us-ascii?Q?jwbF0TvEmT0GgQP49Z3Qmt2K5CJE4N7+K/+Zo9HJ3rD0nGtO4zaZDlbA9ikC?=
 =?us-ascii?Q?i3s07P7tKlqg+hTLI5OMfGNPa4sv5E5++4G07EN4vJs3RsRDcX275TeAGjp3?=
 =?us-ascii?Q?HrkzN8wumXpw4s9ieEAasBIS4S+ZAk7CpmC/0Ek6J8GcQGW4Z8Pw8bn8LmAg?=
 =?us-ascii?Q?lMGT+RyvGLCtv5sctIYJiKzE+oA609pUmQIwXrTp6ItrmrMDyic6Wj0b2wHz?=
 =?us-ascii?Q?HU89OCIsw62t33N5I9KYl/ywtJC9T0s9veBPVeaYGPAlhX0IiCRSAQRHE1zd?=
 =?us-ascii?Q?ZfRoq6Ch1QGGj4X04dsWldZVS84irk0002DrgjxQ3fzouEAIUVNjhLNEYa2A?=
 =?us-ascii?Q?1wlOAfR3vSjxiy2nZ38rpnSEZZwGbTcMzpYtiMqusx0ZCukgWb6QqLi3iKW/?=
 =?us-ascii?Q?op7h10ZyxIAoYR4wlid/khIfb+WLeBXWJWllcED26/6+mZ23EsZK6/g2qWcd?=
 =?us-ascii?Q?44cDifRwtNPmPi/JRkHP7G7J4IcnONJZ3OHQkMHJZNe/WWli9DECm0qA8E3r?=
 =?us-ascii?Q?pyZLZAoTXaoMHdLh26iBASIWnntOAZq5S49H8VbtYzUc15VYLL7wIbnA7Cbt?=
 =?us-ascii?Q?vpXZmCeleIxAqOrdPHg5DIR7XDCtfQTvKpXPa/qgK+YkZZPrBb1iVdtHaGiM?=
 =?us-ascii?Q?q7IX6dRnuI7ufQa4vlv3dT7pFA/rvFwtC4BckaAia6RojNLXj5Xdi4ZUMyYI?=
 =?us-ascii?Q?3+fIN8aKpowonA6hndZSSf6Q18bk19e+McBeVOd7bHZplF1W+3KDTy8uxEGD?=
 =?us-ascii?Q?eDIP0hGUzkwgiY94pm6HSN+LSL96tf9p/9l7Kpm3d7u6xzc4DNEMEDhFoNTm?=
 =?us-ascii?Q?FPXbwFUG8MhCj3GzVRJQi+G2HAVgNX6ZejX5onA89L2A/s9wO0fnOOdv25w1?=
 =?us-ascii?Q?e6Qis5QIPkDZDiHZwuyu5CxcWqbDIcWFO+G9zVHipmu7tALxyTRqNhRgO4uI?=
 =?us-ascii?Q?Z5firYzxxU8Z46YyTuy2UtpCJt3LejS4Z7gcZl+kAwSGaqMnRA7lw/LtkhR1?=
 =?us-ascii?Q?HnNt0WNuQuKZ6dHy8h7NX9NnNdJwAYR0BFHPQhKLAnHJR6sR8qMJ3EHHGHjw?=
 =?us-ascii?Q?0gySdU1kbwzCKY91HtHAaOns4aROSJ9e/hprQ9ZitYN9+a79vOFbUUTTbh99?=
 =?us-ascii?Q?vi+20iF1nrAid+hvRSr/6WLT51k2UBitZWQkvyMson3aLlhiGN/DUkMRBjgb?=
 =?us-ascii?Q?KgcvHeu7lcSpIoIPkJuTF9CzkUz9R0elf4RgDY3k3m+kixx5/uT3MRf3y6Pu?=
 =?us-ascii?Q?lGkuvHj1yT2cJoKMCG+QtwUMiiv9wkD+A8pPUfDVjvCna0k06PJrjJ6dJAN5?=
 =?us-ascii?Q?0/thlity0w33NPyAw/ht1s0OmppEdDkFKIHtSWQED4HLy+9Y8Kgx5QA5mMB5?=
 =?us-ascii?Q?k91YPxA7ZScPcEpJlEerEYwl4JCjdVU=3D?=
X-Exchange-RoutingPolicyChecked: 
	tI9h6PrtwHg43rFgGqKtWlRWyFVsevfDEOrrFEKuQGszay3q7K/Oc2liSXB+iIo0/YoUlMgIl8hord2WZgoLJ0GzuzaDt2DaK57k19hRtCgxdo+ku3S2lWjvvj6aQOE4Ih2k35ji03X2WG7BAuumu0IQrFnk/E2izqpGI9aVzaSMME/BWk8Sx4K9sZWVJjrSymKVorScoQMOimmu1y3VQNP3RFxORStxAXmoxKcP1qtgah/UHyXv/Jnk+oZbiDy22BQyFVBUWStWMa51Lzz6Xw/ayQGyY4n9uwqyNO7w694x+saoQ5pPbTUU0tXrevNKmAQpbutWAkpgHH8GPddROA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eaccbd5-ea2d-419c-fe23-08decbd7f8ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 18:49:18.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCSwZFVJBfaEdAn2FYCUQPhngVpM7RJAE43i4gO/Rtrz0n/Do/huO+GUwuJADrD+E6v8FPNiHZJD7+ZN0tCn6mfcSObRtPOEMMU5R8qvMQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9232
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ZJ/nX37b c=1 sm=1 tr=0 ts=6a319ab2 cx=c_pps
 a=wsTBi80DslKxnI1CMYi+3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Twlkf-z8AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=aEUX_xsEGcrXPexDdrcA:9 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE5MSBTYWx0ZWRfXzW935D3sVrqw
 EkAGtd9Jxv0VTAv7Hp24Rk4m37oz5zaMDGbzrjQZyd8ehrgom9Kn1HVcP0CwA5rNiaV9Jz5+LC4
 476zMo0pasOIorWySk/UXV78rj5f/xxWCVjWWh/QXH29iPPbCkvey7VzVB9otqO/xliWZacVeIu
 GoxO4YuNm4Oj5wC+F6NDVlTdHww2md0mV0x8D0uacIAYPg/ymOSTJte6FxW+J0UaKy3Ali4j8AY
 xDxK9qcfd1/DMmWK63Jd2IvMTwuP32bxyc+jspuc0z/JwH3bYvlwKun1Lc/SQd7+9fdwudfmmCC
 wv21EDNBm9hO8yxlcqkfTXEtvfe5TwVjLif42HtIyjjXmVULsQH0zjCgEw1XFGCpGmcZj4ZXCXi
 ZVylijsdUyPxpnIl4+dosrl0w+Nj5Dnw32UaT9ZaMY7cP6g5urCZG8mCLi0TpuhkJq/KR/l8b/P
 sr/NZ9LwjAhdxl10yXQ==
X-Proofpoint-ORIG-GUID: pXRTdO0Dldj0j1qP1Jl7_i_u0h7UvFCC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE5MSBTYWx0ZWRfX8s7P1ghQveHM
 QuzkBWblsD70/XAUUC8FXB8OvZ8nbAYftm/IczM4dWnc8CeKzY3PofHg4sZ2y86JPwm4RnZbamo
 lfpe/aimwJtpGhTWzDzuG3MmfmNO/ti1hYM1O5p9ZVjitD5FGLkj
X-Proofpoint-GUID: 4FieVD31MmD1FUOWcg-5-pyBtC7gE8CY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 18:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238925

From: Sunil Dora <sunilkumar.dora@windriver.com>

https://discourse.llvm.org/t/llvm-22-1-8-released/91084

Brings following fixes:
ca7933e47d3a [libc++] Disable mistakenly enabled `optional<T&>` constructors for `optional<T>` (#194446)
208ef916cf20 [WebAssembly] narrow instructions use signed saturation (#201798)
e80beda6e255 [VPlan] Account for any-of costs in legacy cost model
3397c37d5d31 Inline stack probes immediately after `allocateStack` in `eliminateCallFramePseudoInstr` (#195456)
1f5aee55a3fc [DAG] Narrow vselect mask to vXi1 in foldToMaskedStore (#201609)
070e505ce21d [LLD][ELF] Add missing initialization of Symbol `used` member.
761b9134dd9b [BPF] treat compiler fence as codegen no-op (#196734)
724301d98c6e Fix "Cannot select" crash on bitcast between f64 and int vector types (#201509)
60c18c6aeaed [CMake][Release] Use llvm-bitcode-strip on Darwin for build with -ffat-lto-objects (#200764)
b65aa9b5ea8d [Clang] Profile the NNS of UnresolvedUsingType and CXXThisType correctly in concept hashing (#199617)
b4fe3880d09b Bump version to 22.1.8

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 86048e791c..1458af3681 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.7 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.8 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 1dd7903f32..ed628008e0 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "7"
+PATCH_VER = "8"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 3e171624e1..441ea099a9 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c3902fc13267fb93562e"
+SRC_URI[sha256sum] = "922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


