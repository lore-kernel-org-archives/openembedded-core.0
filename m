Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD673EE0AD5
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 11:02:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2962.1770462131009382910
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Feb 2026 03:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UanHIuS3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6498736be4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 617AHjoW3298370
	for <openembedded-core@lists.openembedded.org>; Sat, 7 Feb 2026 03:02:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SmyOBdhiX3DzUdibGuoE
	h34VpEK9OFtJ3RNjOyGTb/w=; b=UanHIuS3NkFgS6uW3asUGT2Ok0PZ2baWJmNy
	gqFOfOIbWeyIlvJ03cqDCnGjT8ltbd9nO6a7LZ5Bar0dhJxtTsGY29ln82XMqAMj
	cpC3YSK0Tm5XZDQB5hgwUUfs7IIF9n/+xDrXKskROmwpwiT8QzPe2mp0W1VVsnjw
	NYXrxS1XmHDU0/u7TwPun/ZhH50l+MDd8qc2SpwUZz0Ls68zGbtfDsJn3KRqTysh
	Eij4/7FAMqIzEYvJRRn9DnfK2T/xw8bR2N0PABOOdm6e15qOqPvzHHQSzRip6NQb
	GrMLOt1wuYCbp7+edPyYsVPAqen4xXMVHfaXCbKN9QpLHrBeWw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013071.outbound.protection.outlook.com [40.107.201.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4r2w7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 03:02:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IshuXRKjwW+L0lQE0OWTv4enanLVa90CnYlMH46ml88LkN2VlYm6s+o8I/voGgGH6VK/VwFkXRvmig/IFDC9ipoKZiX49u9Ic9DgGQ0rFXyjU85EnWO4b3ABVjlOPEuwgT7x/7p0yYLyCG8aBhy9io2vL18Nf4Ro7G7/NIblSVueSbTqughADXEi3MgrYpywUeYd6TXOytfh3CYe8yts4lAqzwPhdYqT3hl8nHc3EF8dgAqWymFxLAJd7XWQOLMYCI9O8utRgka3e/A25NQp74TAUZj9sIRSPYk0x2JWf7f8guFspKpc++xYEcBIOQp4FvDlteKPmxLMUdi8zR4/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmyOBdhiX3DzUdibGuoEh34VpEK9OFtJ3RNjOyGTb/w=;
 b=AUHIzLXzlDFrjAqUBRvtSO+Nm4Q3n0aiiFP/vibdlpyRjxeAL9eJUtSKA4dJQTwCVK2wmIw63K1H7gPgAksBj3F7FVQQBL6IbjwJMAwF+bPmgM989A768WuUP6Ys7RVo4omYmcowCcogUx9pQOlWDtZT+RReR0LlfEpo8u0DJyibM+iE53fBm8oWZtwWnLCDw8lztzsAdTy9C4ujC089R7Y8ZyP8VgpZJdTjSdiOm5L9rydLGMn4QJcnn/ci9oOipLecn5zrbR7cdG5cB03NlLXVejITApoIAHqymtdng8W8ihMAQFbT8gxWHlU1GeuD7gRuroKcIqpLEA5fWWKrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB9525.namprd11.prod.outlook.com (2603:10b6:806:4c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Sat, 7 Feb
 2026 11:02:08 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9587.010; Sat, 7 Feb 2026
 11:02:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: upgrade 20250930 -> 20260130
Date: Sat,  7 Feb 2026 19:01:52 +0800
Message-Id: <20260207110152.461336-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ccb512c-ac94-4a65-cbaa-08de663855d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G25N+7UrcOqHxo2qtBHRgh+YOerudqF151OHuAsTwau08yvbIcAzbldN0ZQj?=
 =?us-ascii?Q?VSbBwvCTGza2vFAVC25Y2H31fBHNFyhjWXBlES3cEhUalZNXJTlMVWYkL+i1?=
 =?us-ascii?Q?LoNMq3IE44rs/xSskcKoKggYVvNwaNaPbS6bbGSccGrTF8CMHwqWKhf21BeI?=
 =?us-ascii?Q?8qiW4TrgNLVBzI7N9D5X0XOveGFv0YzfXxKcynBNgzVf3I/oparx8hdUcZWp?=
 =?us-ascii?Q?WAj4jiMGTBk4MJd71YSL9YYcuHjA7ZcnEUvjAg/BI48YUcFjf9I7JVdRZgzW?=
 =?us-ascii?Q?tvmkWeNDyyGdn0jNkrtz3kY/g5IjxMd25CuSVVL4ERftY0c9VfenhXnuVBva?=
 =?us-ascii?Q?1zDMBp8CSf+2jAOeWwcxMPfBUW9470bpVsAWx4tbopoCZB+mVYgTyJAPWqL9?=
 =?us-ascii?Q?LaAOapQxaXlqmor1pvjvh/ADmotKMWkhYuGdj282Ir4cr+nPCnsReMuyw+BL?=
 =?us-ascii?Q?sUr1KDvGSWxW1G530YQE1/XPk8QQ1OQoerJK/kCKD0JcIcb8wiftiYTpM9CX?=
 =?us-ascii?Q?veP5XcwQbDXK8NffCbZGn/y/Bwaxvk2dzVABiL1I+gvy9diUOrhl2sRgnHHf?=
 =?us-ascii?Q?+gwLzdiNCUl8gtxXBX+W0t6gV+l8+23RTyP3E1edwHKWviByBwa2jy5IlZpT?=
 =?us-ascii?Q?FPSxUT6MgBAK/imbc8XgesNTchNax1v5shRzNzQSyDKDqAcA87yRwDZW1AjO?=
 =?us-ascii?Q?OlyHaVhCNZoslZ4oAWPR2a9FPkdo2IwVppVuKVMVAFLJ2BjLBJKDm59RTPOU?=
 =?us-ascii?Q?wpnq3dtp8GA21hnbjAHwuB34HgD50191vveD2H4hKZDEU4mt19vxs3GWR903?=
 =?us-ascii?Q?RvalPETSbr7Pyid8OdmcqWebOnIjalsi8vO37XItyrKhsQXVUV7+2+WA6AKp?=
 =?us-ascii?Q?aRwHVnrtZcCPTJC2PDUl48fxeg95c3nuWbBRGwbynA9AIujkVAvZdqwo/VCr?=
 =?us-ascii?Q?ns2oxmEifhNNbFImFoAn9ePa8me0LmRBDEDeM8XpKBIIxIPAJJQLnemhaY8y?=
 =?us-ascii?Q?415KHBZebqqajRCI9DtOAv1nQfvHRZGALArntFbB7BL8APj8C53K9jkgePzC?=
 =?us-ascii?Q?D9WnvH5Vx1up3fbV+JtsFZseKsICac1RulcpQa/5JeFXcVQ5+eLDCllImAPU?=
 =?us-ascii?Q?gXjVjxPnk6IqOyvW275aOP+sbvrYK37lZNQZoSn4sb/pxgNPiiUPGJ3d9Upa?=
 =?us-ascii?Q?XP7QJjmrpR9HxooNln81rQyTlFWNItjimEYnMYS+H7nVt7S924jKaKeizzz6?=
 =?us-ascii?Q?T6icIKO/5j9UF6m7stKwUAnpimPb+ZkjlLqqhfKLV5iTYP4uuu0LJyoAj6xm?=
 =?us-ascii?Q?DG2J13iweppOkJzUPXah0tgQhvMyP3Ov1RLJPDYV6qzY/khljXei0tMdtNTK?=
 =?us-ascii?Q?yDBBR/LQbbnueM94Cnjz3B4XKhUPf0uZeOv+2uJ1o7UotC1Vc1+IFEYk0f0r?=
 =?us-ascii?Q?aaioNLQXJqvlHOVRMgD7RkhnI5e4OqDVACfPvyqEgQhmQm8qr5Q6x9QlhF5M?=
 =?us-ascii?Q?hL9dwpG2EPI3QA21+7THafvyffEpgPGE9ACJhnuwnp64aMg931020UGOdl1Z?=
 =?us-ascii?Q?hJmkSrTiG02GrCCtctGW0dCWiFIx91MeNW8tm03i?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XD5R02BepXtBQzqBCnZuv51na6G1qp9WocrPY/O6ndFGhIvUA6m9SqGiv8Po?=
 =?us-ascii?Q?hKd7PxOMmjPVMLHJtGkKRkTiznUhxd5/2QFRajcyd42sAMC66k9y/MYCC0yu?=
 =?us-ascii?Q?dwlCQu3gvA+s01bvaVFz9AObVWsB4KZ4uNRx5cYR2j/oMP2NO3rLxtMubaF/?=
 =?us-ascii?Q?F88RmVaIYyYltSwMO1SQQmoIErXq3DhOMc3mkw+ilAJ1jmsQaiMdNnCh8LtU?=
 =?us-ascii?Q?BAmw6huaJOd50LsOKxk+Qj3T7fuefnOEdtzIfPvQI+7HcoxU8LqccfVGtDKs?=
 =?us-ascii?Q?h4jcfvM9hMV8SV1TS+i+rC7e/R3S7aKtY0cWpzO966B92jw2KNOWI1/Cg8hF?=
 =?us-ascii?Q?KS2XGRIrJwy+mXH1qdLs3mu94a6x0GLeJBRPCCfjvXgzWSGiQMyM6X1JXfZ1?=
 =?us-ascii?Q?XbvdbQ/O2RHJ/IgsPVHWwOUjAIfxfTb9ed393S/IFfAwLUN+PVTnvzo8cWkM?=
 =?us-ascii?Q?EcGWWTs1aElvKDXeL//I/9kql9lQAq4q2mkct/wO1kpLcmCe49JOYRQ0UL1i?=
 =?us-ascii?Q?a5VeB/QswFXvcqvxB9hHshDRSokVHtDyiTOlDvtdGeOKxUmKFOav9dksHYOg?=
 =?us-ascii?Q?xoAfHiAP6F3cgYqj5FBE/vB8vEM52fb2Tdf3l57Ogy23HOEhZKmMDaLOLmU9?=
 =?us-ascii?Q?gI3667czwFZsyeKX80CkZn8yUPKsph+bQ399tXLW+rF14QGWegOdgnMIYUwg?=
 =?us-ascii?Q?bH7Ezvnn3w2EBguimnCLrVp0M7RGXCPufTH6a+MdgJPg6bPjelkkeKZWV2B4?=
 =?us-ascii?Q?Z14HoiJh+hbfg001GyfTdU4EjLhGaepxK8849W2XSrk5nL3wQJMQ9tmYxEfI?=
 =?us-ascii?Q?pFg8QTcPgva1+Qb2pjt3w9myu1s/iWzcW7EH3xRqWuOlfbi1vA+7aI1kRZnk?=
 =?us-ascii?Q?CeFs1AgBy2BehCrZF5foVLUMWiHZ0oJ7uIhtDkz6vlc8QarFtaWh/1enk9jI?=
 =?us-ascii?Q?Oh/0TURempy3+viLyqrL0KWBhWp/qKC3lbhH3r9HJr5DuhPj2r2bdnNSD2q7?=
 =?us-ascii?Q?Nfzti8Hv08Y77Qwng1t4COdml6IHU+o86h51DkQUvRTHIQQGelG1/ybqzXhj?=
 =?us-ascii?Q?hf0Xrmb+FoyMkkgkxRTr9OZKn9jt7ZKE5pjkdcXL0o4ownkb/RDUkyYYFpH9?=
 =?us-ascii?Q?khCRPjZWlnzxB8pZ8mNZ8E/W3Szr8pvIx7XzSVthjN6mU2bLh+OCvTMsU8WE?=
 =?us-ascii?Q?XbiPb/Ert9j8gLJAQx35aBx4IKjrCGeZh7r1OqU/mDMAWFyv4RQBhX4J8dnv?=
 =?us-ascii?Q?FzoAs4KFqEZ17LdVo9us3tjfxrLwfIJeNczHR1vK/QjcBVt0hD/WqOAKYr6l?=
 =?us-ascii?Q?pz5a49tCYPAkDKJFbkFhbqn/gHj0IImLJGEmMSbYchESj86THf3LFVF0uSaO?=
 =?us-ascii?Q?x4GMYxIT7TWHloe/Lqh+pC/muVvOfQZuX9pEgySvFOR8AsfLmr/DPFL2c7Nt?=
 =?us-ascii?Q?6WSWrkqi0q5hsn5bZyKqUjELWTxyr2JiFfn6m++PIXCkO7wf5W1nTenGXT5C?=
 =?us-ascii?Q?b07Rpx13BPPHwJzu05Ym4p/irLLSRdg9RcVsYFO6w0rxpRSsd3UP4774ZRFC?=
 =?us-ascii?Q?+n7A7B0a+Hr83vSevw15jr0CNYD5zh1qfbi1qmRNpZskLnrhGuymuJEDRPvs?=
 =?us-ascii?Q?dgxW/cdWyWuPu/bJAAtAcjg9fotdA0Z0fiq2e2dgSFRw85IDrGj/W+bN1m8e?=
 =?us-ascii?Q?fbcHVDkLHWu36TvPbfeQL/ZaeqISmTY4hfyehWBW1veNLjFrprF0DqOMlr+K?=
 =?us-ascii?Q?uSkEvqrNGw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccb512c-ac94-4a65-cbaa-08de663855d9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 11:02:07.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sl5o3Vk+Viyc991KfazuRuDi9jAUaqoBHNm9AE9z+ramzh6TLTXo6ZCG7hV9ncYfZ7QXQujwZlMHNViCQj0QGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9525
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=69871bb2 cx=c_pps
 a=eHfeAi0ej4loD7KcX6Y+qw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=eUbuN6ncAAAA:20
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=NEAV23lmAAAA:8 a=6CcmULZD9G-s7dGkPD8A:9 a=WzC6qhA0u3u7Ye7llzcV:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: GVBn4b8LxETqYNTOP-WNrz-eBRQKgmTz
X-Proofpoint-GUID: GVBn4b8LxETqYNTOP-WNrz-eBRQKgmTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4NyBTYWx0ZWRfX1mAVrY+llUJq
 ZjObnYlChkeIZTwpLjhS21CG7qv6rotyudKwskPfBB5y12LKZ77Ydu5uk9nyqM1FgLg0Ag0LGp3
 0qBx6JCY/bwyXofcyhOay4alj0Q9F9ctaCbBvFVgMxo6ODacCyazGz+QpYhcWT0xjJ7v7nwWDry
 98SUPuy5Z9Hf3hQ/xjqGwEE6ZNKwUMNSQMnGsRueEPCS+R1fuWkzYvYSqhnwzzZFsksZwkiylnB
 X+llvbILDgFrGEunUpcc4mEGUQY6YovwWKUkrgR0OQVqbukcDoXp4T/PrdenQgXadf+8pVfNMII
 QFhPMHxDBEFzpPPVW1SC71nJkVMqMbtrB4GjcTs/6nu1Z04wGbuwCynLbdvhz3S1tWuc5bH+tg6
 S7BMvkBOsDzjon51Hp8aWX6ziMINcdFuLcC2yoWiz7r93FXC90fimTh15U+jFG4nfKszf5Tkc4B
 5PqqBCsmL9eCVV8/yLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 11:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230669

ChangeLog:
https://github.com/linux-test-project/ltp/releases/tag/20260130

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...6ead3d6ef504c82551b12306e751d23ddb45.patch | 193 ------------------
 .../ltp/{ltp_20250930.bb => ltp_20260130.bb}  |   3 +-
 2 files changed, 1 insertion(+), 195 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/2d066ead3d6ef504c82551b12306e751d23ddb45.patch
 rename meta/recipes-extended/ltp/{ltp_20250930.bb => ltp_20260130.bb} (98%)

diff --git a/meta/recipes-extended/ltp/ltp/2d066ead3d6ef504c82551b12306e751d23ddb45.patch b/meta/recipes-extended/ltp/ltp/2d066ead3d6ef504c82551b12306e751d23ddb45.patch
deleted file mode 100644
index 1c06e25400..0000000000
--- a/meta/recipes-extended/ltp/ltp/2d066ead3d6ef504c82551b12306e751d23ddb45.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From 2d066ead3d6ef504c82551b12306e751d23ddb45 Mon Sep 17 00:00:00 2001
-From: Wei Gao <wegao@suse.com>
-Date: Sun, 14 Dec 2025 02:15:20 +0000
-Subject: [PATCH] listmount04.c: Update struct mnt_id_req support for kernel >= 6.18
-
-Kernel change from v6.18-rc7
-78f0e33cd6c93 ("fs/namespace: correctly handle errors returned by grab_requested_mnt_ns")
-causes the test failure with following error message:
-listmount04.c:128: TFAIL: invalid mnt_id_req.spare expected EINVAL: EBADF (9)
-
-The fix require following changes:
-
-* struct mnt_id_req got new member mnt_ns_fd in v6.18-rc7.  That is
-fixed in a fallback defintion in lapi/. If the fallback is used is now
-done via typedef (that requires also update in statmount.h).
-
-* New kernels (>= 6.18) have also different errno. This is fixed by
-runtime check.
-
-Link: https://lore.kernel.org/ltp/20251214021541.3256-1-wegao@suse.com/
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Reviewed-by: Li Wang <liwang@redhat.com>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-Signed-off-by: Wei Gao <wegao@suse.com>
-[ pvorel: Shorten TCONF, rewrite commit message ]
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
----
- configure.ac                                  |  2 +-
- include/lapi/mount.h                          | 10 +++--
- .../kernel/syscalls/listmount/listmount.h     |  2 +-
- .../kernel/syscalls/listmount/listmount04.c   | 37 +++++++++++++++++--
- .../kernel/syscalls/statmount/statmount.h     |  2 +-
- 5 files changed, 44 insertions(+), 9 deletions(-)
-
-Upstream-Status: Backport
-
-Index: ltp-20250930/configure.ac
-===================================================================
---- ltp-20250930.orig/configure.ac
-+++ ltp-20250930/configure.ac
-@@ -262,7 +262,7 @@ AC_CHECK_TYPES([struct cachestat_range],
- AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
- 
- # Defined in <linux/mount.h>, but include/lapi/mount.h includes <sys/mount.h> */
--AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
-+AC_CHECK_MEMBERS([struct mnt_id_req.mnt_ns_fd],,,[#include <sys/mount.h>])
- AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
- AC_CHECK_MEMBERS([struct statmount.mnt_ns_id],,,[#include <unistd.h>
- #include <linux/mount.h>])
-Index: ltp-20250930/include/lapi/mount.h
-===================================================================
---- ltp-20250930.orig/include/lapi/mount.h
-+++ ltp-20250930/include/lapi/mount.h
-@@ -45,14 +45,18 @@
- # define MS_NOSYMFOLLOW 256
- #endif
- 
--#ifndef HAVE_STRUCT_MNT_ID_REQ
--struct mnt_id_req {
-+struct mnt_id_req_fallback {
- 	uint32_t size;
--	uint32_t spare;
-+	uint32_t mnt_ns_fd;
- 	uint64_t mnt_id;
- 	uint64_t param;
- 	uint64_t mnt_ns_id;
- };
-+
-+#ifndef HAVE_STRUCT_MNT_ID_REQ_MNT_NS_FD
-+typedef struct mnt_id_req_fallback mnt_id_req;
-+#else
-+typedef struct mnt_id_req mnt_id_req;
- #endif
- 
- #ifndef HAVE_STRUCT_STATMOUNT
-Index: ltp-20250930/testcases/kernel/syscalls/listmount/listmount.h
-===================================================================
---- ltp-20250930.orig/testcases/kernel/syscalls/listmount/listmount.h
-+++ ltp-20250930/testcases/kernel/syscalls/listmount/listmount.h
-@@ -15,7 +15,7 @@
- static inline ssize_t listmount(uint64_t mnt_id, uint64_t last_mnt_id,
- 			 uint64_t list[], size_t num, unsigned int flags)
- {
--	struct mnt_id_req req = {
-+	mnt_id_req req = {
- 		.size = MNT_ID_REQ_SIZE_VER0,
- 		.mnt_id = mnt_id,
- 		.param = last_mnt_id,
-Index: ltp-20250930/testcases/kernel/syscalls/listmount/listmount04.c
-===================================================================
---- ltp-20250930.orig/testcases/kernel/syscalls/listmount/listmount04.c
-+++ ltp-20250930/testcases/kernel/syscalls/listmount/listmount04.c
-@@ -14,14 +14,18 @@
- 
- #define _GNU_SOURCE
- 
-+#include "config.h"
- #include "tst_test.h"
- #include "lapi/mount.h"
- #include "lapi/syscalls.h"
- 
- #define MNT_SIZE 32
-+#define BEFORE_6_18 1
-+#define AFTER_6_18 2
- 
--static struct mnt_id_req *request;
-+static mnt_id_req *request;
- static uint64_t mnt_ids[MNT_SIZE];
-+static int kver;
- 
- static struct tcase {
- 	int req_usage;
-@@ -34,6 +38,7 @@ static struct tcase {
- 	uint64_t flags;
- 	int exp_errno;
- 	char *msg;
-+	int kver;
- } tcases[] = {
- 	{
- 		.req_usage = 0,
-@@ -79,6 +84,18 @@ static struct tcase {
- 		.nr_mnt_ids = MNT_SIZE,
- 		.exp_errno = EINVAL,
- 		.msg = "invalid mnt_id_req.spare",
-+		.kver = BEFORE_6_18,
-+	},
-+	{
-+		.req_usage = 1,
-+		.size = MNT_ID_REQ_SIZE_VER0,
-+		.spare = -1,
-+		.mnt_id = LSMT_ROOT,
-+		.mnt_ids = mnt_ids,
-+		.nr_mnt_ids = MNT_SIZE,
-+		.exp_errno = EBADF,
-+		.msg = "invalid mnt_id_req.mnt_ns_fd",
-+		.kver = AFTER_6_18,
- 	},
- 	{
- 		.req_usage = 1,
-@@ -113,7 +130,12 @@ static struct tcase {
- static void run(unsigned int n)
- {
- 	struct tcase *tc = &tcases[n];
--	struct mnt_id_req *req = NULL;
-+	mnt_id_req *req = NULL;
-+
-+	if (tc->kver && tc->kver != kver) {
-+		tst_res(TCONF, "Test not suitable for current kernel version");
-+		return;
-+	}
- 
- 	memset(mnt_ids, 0, sizeof(mnt_ids));
- 
-@@ -122,7 +144,7 @@ static void run(unsigned int n)
- 		req->mnt_id = tc->mnt_id;
- 		req->param = tc->param;
- 		req->size = tc->size;
--		req->spare = tc->spare;
-+		req->mnt_ns_fd = tc->spare;
- 	}
- 
- 	TST_EXP_FAIL(tst_syscall(__NR_listmount, req, tc->mnt_ids,
-@@ -130,8 +152,17 @@ static void run(unsigned int n)
- 		"%s", tc->msg);
- }
- 
-+static void setup(void)
-+{
-+	if (tst_kvercmp(6, 18, 0) >= 0)
-+		kver = AFTER_6_18;
-+	else
-+		kver = BEFORE_6_18;
-+}
-+
- static struct tst_test test = {
- 	.test = run,
-+	.setup = setup,
- 	.tcnt = ARRAY_SIZE(tcases),
- 	.min_kver = "6.8",
- 	.bufs = (struct tst_buffers []) {
-Index: ltp-20250930/testcases/kernel/syscalls/statmount/statmount.h
-===================================================================
---- ltp-20250930.orig/testcases/kernel/syscalls/statmount/statmount.h
-+++ ltp-20250930/testcases/kernel/syscalls/statmount/statmount.h
-@@ -16,7 +16,7 @@
- static inline int statmount(uint64_t mnt_id, uint64_t mask, struct statmount *buf,
- 		     size_t bufsize, unsigned int flags)
- {
--	struct mnt_id_req req = {
-+	mnt_id_req req = {
- 		.size = MNT_ID_REQ_SIZE_VER0,
- 		.mnt_id = mnt_id,
- 		.param = mask,
diff --git a/meta/recipes-extended/ltp/ltp_20250930.bb b/meta/recipes-extended/ltp/ltp_20260130.bb
similarity index 98%
rename from meta/recipes-extended/ltp/ltp_20250930.bb
rename to meta/recipes-extended/ltp/ltp_20260130.bb
index 30897de7ca..bb3b7e9ca3 100644
--- a/meta/recipes-extended/ltp/ltp_20250930.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -24,13 +24,12 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "d2550ffbbcfe163212cd7e9c132db65ae0fa06ed"
+SRCREV = "6a60ae592cd375f004df0694efc7d50ddae9aa5e"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
-           file://2d066ead3d6ef504c82551b12306e751d23ddb45.patch \
           "
 
 inherit autotools-brokensep pkgconfig
-- 
2.34.1


