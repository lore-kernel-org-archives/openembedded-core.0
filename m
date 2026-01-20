Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2D9CA5FD1
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12570.1768931682129344240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kIZikDmn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KCxPNw1857110
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MhALN2IRhVF/5FALzKdEDWTecbkpXaxwt3emM/ZEF6o=; b=
	kIZikDmnY9QPurgbUZoHVrdZhLdDqQ9Sqi/7/6KB+rtyCU1U5b/GmFzTm8o3o4dr
	RoiIdEgRwKlUobJ5BvjVGilBzT3XYQ+BaUnOUIcXpc3EyWqdh8NdVkTCm34Fl+km
	YKljhDvCF0W88e6SZ3RdweCkOdb3dw2stxEEX5ya/v6g9QolLmCD3TbiGhGpF+F3
	/HSp90RT4aRZDQa+45CLzij54JzeB3jPS3Ipw5ge0MqamWq4nnJVhmj1rNWu5XXm
	T4ThkS6zSrYmgblS28Wqw2BbZ9ZyCNHfqrl/iqClywNA+XaFcm6eCQMzU9E6YOom
	Dzc0Pfn1rJ7e4uPGDA4iow==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br1d4bcr1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 17:54:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abEjZUb8U87RF5pRj/ImCpeMYJ3A0tzOuDBGPl5gGdc+Ha12Jq9HQtJjfj+/BQGlyeZ7g2sTDkV3M97J0T6jD49BKIkR/FnQtHbgv4/mP1N6j4b+/qU4yf1pzzWFq1eqouAzhRlH6Ey0nJhUNrs+xauUfz9huM0Bm0o9pPp4kf7aCRIu+IEsf00gOkiWBx8cWkP1RnjSXhVCZ2xVSpXvzSrn1ewCTJT2ihC0c2hj6VII9ska2TgVwtJ3jNIYQbH8yU5w4meanpKrww9J4zkcSrInmd3HksqcPhCr8SDiz9IEddE7IZ7PXbDbaWCDJQZ3IrDq57LuBjlvXE+pdwMaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhALN2IRhVF/5FALzKdEDWTecbkpXaxwt3emM/ZEF6o=;
 b=R14/I82nKEd9LygPl/H9V+GKrxVEJsoATZbdPTdN+HhcEfkH6qgWl25oTrEMeIs3AtW6V5aR55J9sdO9Z+yxPMDq+tki5XGPvTNDzBUZczq1qVHURzO5nI0hS7AYmd3IYdzArNw3VLfON9oZE8fQZTSxYCssFuFF+hG6Ff1RaCQpUF7/+W1yW2NVOCNq/HfY3FQ6XLbz7pu8jD2hPj6x8ZRzXwIqQ1ubE2iWPr7dUwOAJuDUhswFBc37tR3O9sDdLUQkbo1fRHnW/6y9hGgOlGOtWiFQUTRUgVamYZh+6F/rILuXjlh3ZRoCPEDCF0tUybjzCjwZJYsO6c0riMJ9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:38 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:38 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 15/16] make-mod-scripts: fix for buildpath issues with rust-out-of-tree compilation
Date: Tue, 20 Jan 2026 09:52:45 -0800
Message-ID: <20260120175246.2052341-16-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: c6100692-8938-417f-b58c-08de584cfaa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q0n6AbWjNF6xmzphYSQZoMTsHvAIB71SCABCaa/dx0Ue34RQTaXVoOOtnk7+?=
 =?us-ascii?Q?cHlfKDH7P+sfpxIlyJmfSTMhkeSNPDbm38cz9JtZXYIDDPCnzordjIMrvqkC?=
 =?us-ascii?Q?btQWURI8luPZ+xnvA+3smuv+voE8/6Lya5mCE0wd2Q45Nz4KlUYsbczBTH5J?=
 =?us-ascii?Q?Vk7E6yBHU0VGlWPxfg3PXytqTm+0RwLgMXBIEw/3lkwhauXFa1AD4oeY4VX+?=
 =?us-ascii?Q?fIx0XdGMjTFIxAGjkmHkRBtNkQ8gg+Nzv5ic7H2g7Y7XxXhCPz0+dmgcXqPl?=
 =?us-ascii?Q?ei1R/RUbcB2/7jqTn660UGkAHr3Q6ROvbGaWNIEqPzPazQ25Y9hcVIXBlMw6?=
 =?us-ascii?Q?2beYVsrnFZ6YDLvoSR01B+OY7dvNFb6vckfU3QFVqT8fOGnNgIYpyS7oTdMq?=
 =?us-ascii?Q?PQQkVKiCxvmrT6GSfFoYLy5DX0yn4UH6hZEn+bnv0U/n0gTNL1Pf3Ce6PoZa?=
 =?us-ascii?Q?ojy0Y3P54DgwdpOTZD4OsRMlAXcm6wEAnj+IZJA+2VB5EJ5zGEO5nPwLoYnA?=
 =?us-ascii?Q?dDCF90f4KDPjbl+i+TNoSV+HpfOkdRXPTtWAc0QK3J5Mb6zbY/1OkJShrhEL?=
 =?us-ascii?Q?cGg4KmKiUcuZF/vrbq5RD6ckPHIvyAApcQaeqyVgOTtAHa9I3ejQxTUIdmmx?=
 =?us-ascii?Q?ZJv/C6J0oE3hnSOCOrxn7LFv5CNikoEulUA8aS3DaFAynA44dGADN7wspjba?=
 =?us-ascii?Q?dMZNNS2G7pSXads9LalmCwK8I/dVP5ZGxfsvoBfcn+tbk3F9MlPqksvZyJRp?=
 =?us-ascii?Q?GhRu+IsD3WUSk6yCaHJy1NE+rQnSoqfyVreYam+A/182oymcvmo4OVkhcHGB?=
 =?us-ascii?Q?7ZvkfjKV2ggC7dzjs6u/fdFLTQ26VmBLreGWmkN1Vux8DwRXW7md487u2uDS?=
 =?us-ascii?Q?0Jv0HoFrQmQOCBnncm7LM3KzcrugGtaA4WsZI9VN4taG9r/vpGPfk8uBS6k9?=
 =?us-ascii?Q?pcZi56g4EQW9BSuBIrIfc6bykCf4LSVj5hShqDO0zoHc4EuU7kpU2zL+Guod?=
 =?us-ascii?Q?4t5FqTjB78de7cJ/KxefAYT54xpP+xe3J2WNpxwGfq+IXSfnrOMamDZSHgyh?=
 =?us-ascii?Q?Az9a39oen/epz8zR7zk26fvV0BOTtbNzs5TpAjxpHryatIbH4Z/uzKt64QD9?=
 =?us-ascii?Q?GV1fbEGOd3EPN8MSOGBJP8EBfQHnni3W00etl5DurYJB8JyAivTAEZJekcXj?=
 =?us-ascii?Q?6ABRPAIfYvoXZ+i7hc0yk8qbcMSztd9SOLe26IazGAD6vQgpY822WMMZ95L/?=
 =?us-ascii?Q?LoqdGhdg7XeFYbv0EUiN+TxwLEb01VoWDiFeaYplxeC/4wHrR9w91lPxDXFF?=
 =?us-ascii?Q?Le5mJTDSsyIDB3ot/RZQfmeVrx1yug2BLI3T5wrmERHcD4eg/xZ/ZcSPirFR?=
 =?us-ascii?Q?4iQvLBt0y8IRRZAnxOO34P7SAbRObNIdJ9O9aArjzp3R2NLWoA0d65jVMxh+?=
 =?us-ascii?Q?3ZbotbEoLHKkzel1i2r+d03jxwDiSd9UyqeAGZWhlLbEVClteXnhYvk9KySn?=
 =?us-ascii?Q?z0ZIJdUIapyYpnWGT9V1cGXb314x+8c+lFcnWbc7akYxbfg3+HfoC97BKWtR?=
 =?us-ascii?Q?0PP7mTddAKBahyIt6TfChE0BQo8Flpk1bXQ9iKhwQ323KlXKoPDCmlZXOQqt?=
 =?us-ascii?Q?SN6bgTWZyy69BOv2+8cHazg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D2cnYrS0e7qvA5yOJxYOzsjeTrYn1Z/to6Wan6LBE+yzzwv/a1F1+fNvs9CJ?=
 =?us-ascii?Q?G6/oE/oAsMeWgPhiakgDuD6/MzUefkBm+FnlXWUrRCHOavaVgnEYHZ8hV1x8?=
 =?us-ascii?Q?LizYUzWubm+uuztw7aOK3NHM2mzu5sVfzGaI1eAm5aYBqQlj20l9ClE6+dVH?=
 =?us-ascii?Q?wlYH1f5RQRtmDzA56y+Ykwlc+CEslz9wGXAFmJtAw+XKqaAC93NfpJl+0+PI?=
 =?us-ascii?Q?U5Pk3MsIJY9B2jujiJI1C6+9QzMRMOfcr//OIH/PjbfFUOyjXTV0UBc4DVZN?=
 =?us-ascii?Q?7lhPe1/nt20F+X1+euoPWD5+az0Q8UmL5XuQLFA/RToq/8d0IK/+Uqi7AyRP?=
 =?us-ascii?Q?3Ei8GFhdZLdZmNA6xkFCZDvZZvWiF1XjlQnO9GRZiU3SWraxUAz8vdv8Hq5k?=
 =?us-ascii?Q?lDnXM8nWeRN1RhbrkLeJxFrdI1dgBCM5S70HTZNb5SYQnX+2zyT0dbk26/9H?=
 =?us-ascii?Q?8HqStXRQqZP39QfENzJD80lN4UYOXnslUTBhzkt/4lxLzGQ6WUx1SacWsi1M?=
 =?us-ascii?Q?a6UWl7btUTyFD8C9X7vIZaRuKaisUl+EbN2ztMUoy0TJB0boCBu+oxD/6aks?=
 =?us-ascii?Q?ypAQu8zJqswIlmbFKHOIL0NDcK460o2TFON2S2Vtc51thRLuseJCLcrjBb9D?=
 =?us-ascii?Q?TMZKXUxQTY5WgPPYGrt70xFPUra/o5ge6GA9EgI2ncj0ywhdpyDn5glu1tAB?=
 =?us-ascii?Q?Dt4/n1uH6bVT0rT4jDv9SL5KiTInH38JGt/irA4qQbTqmk10354k70kUvpxg?=
 =?us-ascii?Q?wHr0mda4jvSZfjF0RUmRpCBanynpT7HhJNUW/6qVA8Hst/Fk8DDrfheyW2Qu?=
 =?us-ascii?Q?CtrRUFjJnPlhT9L88U6Q/c6NvNsQEzpamorGxlfYaEchb0YrqDtXXdQtSDax?=
 =?us-ascii?Q?/iSEAwLIcOM1NMMmtlnby3dGG4zEEdzC9W6s2q9hCMgddRGBO3dUZXPQyJ3o?=
 =?us-ascii?Q?WHGGQYt9CXAWJdPRlAXYNrgHujbTcDdR0PJbU8NTwzbyLXzl3DaEGe55r7W1?=
 =?us-ascii?Q?QHN+r5ckJsNUzWeL1OO1qw5JiBN/u1/apZU8poUTGwZsx1zhPO/cezmwysRe?=
 =?us-ascii?Q?KsftXGewapCcrxjgYw2WO597qzYs7CdWu2Rfv3kIdsWH28rCipZqsGAneeor?=
 =?us-ascii?Q?cEHFt1xn5wegniOGvGsKtfdjl0oC/tE02A59ydykSlRUBnncseEgRlHkEEUp?=
 =?us-ascii?Q?I8YvSJhHULjOwCW80OJYawnXpXVqdHk4Lb2uP6D9jnI9wjw4HvQM+IfY0VQa?=
 =?us-ascii?Q?KaehurRt0eP+S29wk6ntxzYbUgNHeRR0LBpoVJInYSFu2f/EMfRgeu1/IZgI?=
 =?us-ascii?Q?n1UdLZCcdi3y46CacoPLcwvcaGZpv5qZnQ8xgH8/N/cdMdHiIePlx8JFyY80?=
 =?us-ascii?Q?RGXrR5woOn8Vg2Xvr8h85YX50xyppFRQFo/rXJ5GpY42ZQkfPb3ClPvPitRd?=
 =?us-ascii?Q?4ClgpKPM7T9enOHnPLS5zTc0PZ6HGHryiJ1XBNwiq34sIOHEpb1i7QaEXazh?=
 =?us-ascii?Q?Fus/pLg0oMJE76jqqh1bHn8+vibs1shkjaeY2BcWJeQiqj3xH6EL2iWFw9pi?=
 =?us-ascii?Q?GYsjhcVGvPYp/rYxeGmkJCbyikU/x79ByXfTZWeDEaq5mts3G2T+vT3QIylH?=
 =?us-ascii?Q?oUJX84wiHgHxZWGNMFl4wuJRcdUS8vH+FLpcJzoXy41nh9jYjr3xSai92hry?=
 =?us-ascii?Q?DubPPF+Z6vtPNHk3NUedkrU6npF52L2VA1qqV6a9neGFJH5uiNEqXsSJMhkm?=
 =?us-ascii?Q?iX+/gLecgjoqalVBjIKHqdZWun190Rg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6100692-8938-417f-b58c-08de584cfaa7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:38.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzKaG0QIf6UHo7WKZDqr9ON0k1pVqG2U1efQG0b648tj3SkCqfP9nrL/xQvSzxmSAJvoZEuPPC38PEJKsI/N7joGI22Ww5506ELobGbhy2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: KZON5gKpOY25PZ898Wjy7ZX1pXwygXey
X-Authority-Analysis: v=2.4 cv=Rs3I7SmK c=1 sm=1 tr=0 ts=696fc161 cx=c_pps
 a=lexSm1xfraBw67q2grWtcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=g_9fHU8KsmqnF3n0u6sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HGAY_ywNj7cMKlEli4dAcbO9M3ZT3q51
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX8pIoCPSM9eMv
 9xKaAssFv+AI2M6OmZLM7hwwUJkmonw46dZxz4xpKbf09yNH23QglFCFN4E6oK6QIdMKAMLN1Q1
 Cqn9Ayv5f9M2kf1n4Bg06KfrKNZx8Q13tQinJnth+5ynXZEzVFIL8oTV1F54N7FINqnm9CONF07
 1uhDABMfUqRK543Pt635xLV1UBaBOLiYEb8EmSq7B85+I7JcIvvSl1kQdkQ5kX0x4fJS4KQZDf8
 B2BYm1vZbzBsdjYbkbePYKiktvuQ440+epIwmlBs/tO6uRuCth2xQ+1ZWuYV4MsKKppF0Oo80Tz
 q29WOssocL/oKmHcThoavsQakRsGc3b2eUSntxftJeMTZGUxmDtGgVAffz7P0tSMGR4Gou/ApRh
 wMfu8fMtrW57W0UFEvDtpoYgTu1UcvEV7x6SqhIMj3qsb00StekvKYv6zBWX6y0uoe3NYYjXKIg
 1G86ps68SxL8lk0d+gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229762

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes buildpath issues when compiling rust-out-of-tree recipe.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bb              | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 874e16e642..d6b2178767 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -36,3 +36,11 @@ do_configure() {
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
+
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+                     --remap-path-prefix=${TMPDIR}/work=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                             ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
+
-- 
2.49.0


