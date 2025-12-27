Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58A7E8FDDB
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6446.1766835235703479834
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WCv3xtzg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBKw5w2151904
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=; b=
	WCv3xtzg1dkRDLKJ3FSO4+5eE7Qd7IhM6soJwnNyI/nqH+Rqvi0TzaLCZ8X2jvj4
	QNhI6NnzagoUCJA8iiucxCmXPRaqEKjXU6cuc8tCsRJ77vCWwYjFN/qp4gLk1s/U
	a7czGGwLmzFaUS46fBefzTkI1C5P5hQVYZbD5Kdena3MJSASSgxF+YnQNNEHIXQb
	F+6wRb0FQVfEutqGfjP0rX6eK7DKrxoorlStXfaGY5mzfl9dZ16eaReDKg4U4kaE
	XSYcTs9Mc1Kn8erfh2Iccv1+K0UX34HCJIjutJwO1ctIP7clivIzRYL9+ThGglLj
	MXNcJnFXDVkH7xfEz4T6AQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4r6v8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbFc5SCOHkTOH1v2z0TvNyR5qsdZ8ESG6L+9w1mZdoE0Vx5tFSNGpVKaMCm8IPlA5uMCiIeiHDYkHkuxdYUcwjkkJ90ooPHAxprjGv3uKdbTt8thfjPfF6eZ5cuMEDnpEuOI2NsqxuonR7EdYZS+cB6vOiwzFVcwnfp4tYeuFnS8ib4XdOeNFAN5nWj0o6Cmv3WGJmCpRyBcOAF5pxZw3eJoXUJDw9CyD+8VO5+BoSIYk+C9JWEyltlVYJ5MucEPNvBlKyiZoXFb/Bk77BsiHZDN1GGnhXlX6HQ+gRk8brw5MUeJtz872Y5zyMlTOqcTsXKLx2apKotrCJNydPfcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=;
 b=hArxZvDos6+vQazYjVDaAdaQPQ1g5IpekNbnAYsRDb5erhVRiRcGcXloPD/rgIyzC+7nxMCqjJ9mNK3bno0fZ7tj30226U3gB+cTRVUvt5DO0QDqyV7SUUPl1Jg0pLd7/eSnM1Lvtrkcv/P0VI/D/lNSRRpTYtLi932tqJHRY8Tm4E7qyDrQLPQwkouBirUgZT/sVsN/0d+gZW/5UPMzT2RcKd19g7yYJhOnI/WWcQQFC/kKKS8oT92DQGZGpqDqJx9bJ+NKiZRc8+aEhXfTzZWY9sBO6DrYdsDEk9xN7gF3nuHgLiMgrs241s8WAtgcxuMfBvmW8vHmsm1zEzoBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:52 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:52 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 12/16] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Sat, 27 Dec 2025 03:32:47 -0800
Message-ID: <20251227113251.773795-13-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: b0df84d4-40f5-4e75-317e-08de453bcffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8Czm96rrHt4zL5Su99TkDXo2XXtb555qOujFyGA7H4yWbKCNHciD9v9KFFXt?=
 =?us-ascii?Q?vn5ZEmd0e6NGPOxpLS1wiSsSmKx5NI+f+nV/IF2wbxRPaEsy6BDpcyB+2ncm?=
 =?us-ascii?Q?zEeWJrH/Nmz0ZFSwIvJaWDkFjjdQoa/dcBOpfqkWvw4eO0MgvSOawRSzCzia?=
 =?us-ascii?Q?8itcUrVuFwZMtC5m9Dyh5slmAUDJC9kPBNlGjmddlUejPbbKielP2GYVDQOp?=
 =?us-ascii?Q?TXp6hwUt7UTjJBs/RcNAfbMAVV4WpBjMaj6yKyRIOKZFC+IjNFbRSzAYJFKb?=
 =?us-ascii?Q?gTAqCPIIcBNSy2X6FvcqNX0smuOIWv7eI7iNChILqb87RfFOEQ5s/x3cRQxg?=
 =?us-ascii?Q?uAspTNSCvowwWLviZFRLFW02E0wBh6mdscWFFOyRSRsz4pyxNmgcIms2D93A?=
 =?us-ascii?Q?drYHsEUl4Lzb2+fbYo5jEOLFbAhUDc2PEKvFZohSidSKptEmOV/99BIWfnx/?=
 =?us-ascii?Q?/7g5wtf3iLBvplPThHUV9ppCxjMz6f7gCbvNi8vpV+z36yLLanNrSxgwAdo8?=
 =?us-ascii?Q?hTqI/BVHU2FGIYP/Y/ILm8A77KJzZpyrvAAzrPwd6ieuXjt8QhHm//0rPDtp?=
 =?us-ascii?Q?YV5zQDK3Cm53GZ6B0OpSivAX23rq4zRfQ49Nhz6v5hNFaKE1irwu6Z8cXeOb?=
 =?us-ascii?Q?ippIKhrgz3HU/hXM3KEnxjxFCQynJA5cQSyqqKa+5fljqfYfXWORaXncTCvr?=
 =?us-ascii?Q?TeZOgBbgsW4SDrH1pkoHajyUUrviovyjpYbkn0TMeSAop+sUJIzfWMa5kz9t?=
 =?us-ascii?Q?Jlpcq3r3kCzYYs5YUIuDwnFpXPza8rTjR7UfGAiaw/GrSKxxgAlJ0Ifg2HgE?=
 =?us-ascii?Q?GjkScEvrEx/0+dZOG4sVCgFCPmZuIkl6pxH8SgU5j/bvTUe+qkP1AK4EUEN0?=
 =?us-ascii?Q?apd7BVM0rk6z6dFiunoCIY1G+zcSwNgYf2S4Tq4U7MmTxG+3WyWeLoXZ8DF0?=
 =?us-ascii?Q?z/uG8mMKXJUzw9CyzWRNVW+u8ETUQR/UoBrCifbjnHh4hHsCIc4p+2gK+iN9?=
 =?us-ascii?Q?0a24A9PmSsSKFD9d/M7PcHOxNpa1f7wUyH8zU0V/ECcKSynruhxL6n9p8/On?=
 =?us-ascii?Q?rkMIfcDuwzh+jC3q1wQgRyZg+h+VEq82a/g+ekpaC4cjnZPtyu0ElB9njZmx?=
 =?us-ascii?Q?3KB5je60fA8RuL8OTZ6I2ednQvQZZHhnKabAVlIAnmsNhT6GR7MuRCHXokyq?=
 =?us-ascii?Q?clzDsRdIfAYMnnWu1yu5gzGX8PNp9iX3wHOoD7h57O5EB9b2hkVub75vqIjU?=
 =?us-ascii?Q?+2uwRsb4sm77YKPljA3th31ciQZzAPupFUeggbSPkxASAeVDHtqYNNYWsgvA?=
 =?us-ascii?Q?nhtKWaxkUtWQF9FQLDYgqFEvPjGId+V2leU3rkqg+gdveq/837rz73tY2Ku9?=
 =?us-ascii?Q?Sfy970/lXb2kNL3q09Nq91OID8GYv933KUGJJGrIG0h9jPfSe7HO+oMdqJle?=
 =?us-ascii?Q?BNotq0OR69tB+lZ1Kg/5h8X4ZfMcnUThv8tkpuaQzODHnvy9ixH3Ua8+dSJX?=
 =?us-ascii?Q?2Z71CKZGLdTUJNy8zvgHHfGrwvhVh0R3oYKD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e+lUciWRtN8rDHgzLRwsTf/QaOUo+Uv6xM2ZbjyGZOeOAYEuQd2lAsrHUnIO?=
 =?us-ascii?Q?M7pChabyqG4qlMIukScJnepLDffIKY/uum08r7cgJDm5kX/0WH0Jb6iKYUGk?=
 =?us-ascii?Q?HTD5+/evyB1vHrOs7hto0tT7TOsGltpzv2Qp4QEpFC+61HC+Rrs7GLJJBsaj?=
 =?us-ascii?Q?3j3VinaX5JpKQw2kGap3c/o+K8E8GmYMfWIZehhIvhnKhoQKSZRCOYWcsFMv?=
 =?us-ascii?Q?oSttDjuXJPOvNtaWEVOiWBzHhFrnG3X3rdyiS/GSQl0POZg3JJ2EBPF3+Rbp?=
 =?us-ascii?Q?0SEXO2WJO4EuhusioRsvptJ2JbowCr5wosx9PBLXe7Ff4DtbUNqYoby6WXXC?=
 =?us-ascii?Q?/ADqOHOV13khTYHS1TJAwg3uVKTc5hU2vJxLhbCid1BqWasjURMoxJWNDf14?=
 =?us-ascii?Q?JIFQwzmAU0AraflJB9J2U3B/KelRm7BN4+JXAhIs6qExLP/p7iSmKW8t1Eaf?=
 =?us-ascii?Q?FI1ag6j0hwTwis5kZVe3Yl5ppWox6EeAQ9N65MsgPrgVoS9B1Pk8OUHkKZmy?=
 =?us-ascii?Q?vwZpvVlKvKO1IecwT2Qebam2DjA89C6IFIT5GrPXG/dQaJf1oYnshs4hGIkP?=
 =?us-ascii?Q?0lFbKIFN13cImcOC5jeqZiwGQj6YU2A1Nw0iXCyZPV8w+8m4xklb9+ABEKn+?=
 =?us-ascii?Q?A1LOkyIpdz5abUwuHBGdV/UHjbhfmz6+/sOatUDA68T9gWtiIBJX+w64mnDl?=
 =?us-ascii?Q?avORDtfYMmVJiJb46fPGANSDYdL5W2ocqRv9Z/WQQ2FOxBxq9HH0ihvf1l2y?=
 =?us-ascii?Q?Zz67yJ9IQB5Fbn4UukYmpIVjqvtp1h3xrny6PKD1jW0/YFvkFk+YK99zp16k?=
 =?us-ascii?Q?0rHajo3Qy4j2bsZ1MHwdqPcB3ls0Oc0QEqI8PHTRLJM7PvyzLwMRrUQCdXn7?=
 =?us-ascii?Q?Jm3qw8q6iIuogkngaGWJ9gu/sePUPQqYmOI+5lISZ3ddLVUkjyR7QnMXNNm4?=
 =?us-ascii?Q?YOs43WhZGSOzNOCFmJ5HhrK12ngpcaQ0nVmfZPvQ7RSm5UAg1NDyDLmYfEBA?=
 =?us-ascii?Q?9IGJsyQd0Jt+TssYM740eoKcKneBENcXnM3HSuRkQ/7yAvS9N0TCBRAFZ9vX?=
 =?us-ascii?Q?avK0ElXMr89WoYpXu8Z5q3c+/iPjBLRaahuKNj3Dj/1svvlFgIn/6ANFGrcN?=
 =?us-ascii?Q?eFwGa8cbCCrUkoX/vq+JaD3uZ90GGhuNM1ZRCVioDS99Pr/3gOBQdFLLMfxW?=
 =?us-ascii?Q?nV7UWAHv6VnMRLB+m8JVgodvYmmZB5znFYna++kAqk5ibVK2KSdTSxrCeHLe?=
 =?us-ascii?Q?wUNZTWRbJP9+5JDsb2lr/usMKN0w++delcdVO2DaDX+aTuqzxNc6bDjuJrKu?=
 =?us-ascii?Q?5gaXuvcpIw9I9GzIisaVhoglbOh2xbA7OMHLcACIvd2YYLR9ncXCPGtX83u0?=
 =?us-ascii?Q?U6ds+3EeJJofGmlpj9dQELqltTN2inQxGO/90aCg7OmI7gN2rfBA+B7+vkxX?=
 =?us-ascii?Q?YZ3pkLl6FcGnrFdCmuwDOjks2x1BEEVyFje3SDX1EAQW64ocrqovRnDsw72Z?=
 =?us-ascii?Q?HtR2MMOOs87JqW98rioR9FOfJQ7c1lkXD8V5OESGBNg2aMnI/MMgAZ2iUgES?=
 =?us-ascii?Q?Q+vz1mEQHqthnwVOc/ZOZ2zvBvoY4miQFyWXwx8sqjAm5woQ/r5dfdR450kG?=
 =?us-ascii?Q?tD1yq01XboDRQRbLVr+uJNEmkAy/gkNDhSB7AnLmVyXe2V/DSjRNLJmaUj3n?=
 =?us-ascii?Q?sJUPVTkVcT6yDwwNgpPXML0jzGHO2Ipkb8Y7t+0AhU7CC7foLNKzGu+eSA4s?=
 =?us-ascii?Q?G8019AL3CSIzQ7PWLXPqaw3jRCJFthQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0df84d4-40f5-4e75-317e-08de453bcffc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:52.8740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXnQHkj5rzMqprGnVNALrKTRXxdT5DnUvQwy/dYupJNTVfwvpSWbk6851DEd8cx/F9dM9bZTGH/xVkNsYcmZfbhq/snUVjReAjc7SUYRMDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 9QHq0JkHDtW5QNenjwsDQd_D9aJyH1yK
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=694fc422 cx=c_pps
 a=CM6yQ3ajfX3ct242QRRZiw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=TeJiQh7uZb9NdfcNB-sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 47LqfPnPPD6O9JbpBx0UjwxsNHrblQxm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfXzNBKj1zUfzEl
 +ooTXBet3QQf1HmIBr/FJQgFFXwC96U4PDFTQSZQceAeTRX/gzBFIENnwyrTpIG/BuLUazgQ4Yo
 Gt6XNVeRjWv02q2zePzJwo0YkcAEn0K3YCnZ+168YIfh0yJ+KuOjbESpDohuNhoZ+iHGVoxBe1A
 obJXOi9BuCTBRtf7IXO7LlP4pG4/KawQoz2Vhvh5E45FokhD7kCpfA2bk/4Q1Am17ndbfhFICgi
 bSVsTHp3tBZwjea+m9Fuy2xv333pheC2z2K7nTlrzAbh7GSTzinIG/zi/uW6TFzh9fPMeuSY86i
 71ylBGORs+Mv8CUJ3cajXX/k1ElGM03AchUMw49RlMPy21JhZLhZs4mlHVunSAKm3palS3EvZUK
 uNj99Ox59g0U7+gEPPegGEuKozPcRS0HGzDT3YlV1Tv0jstMG35mkk+WbS2fC8kqvkc6gZ4Ap/3
 Ad2qRF+k9FiHj8HxYiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228566

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index f989b31c47..30a10b0801 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -570,6 +570,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
-- 
2.49.0


