Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0033D61028
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19161.1769704787705849279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dp5hNT/X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T4dUFB1237558
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:39:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=; b=
	dp5hNT/XP4GausumQ3C1TofC1qzpN7i4i5TUFap7miTRBoa3KJJpiyYpF4kvxVOy
	gIYHzyzu3vmLZucEgYGWw1Mq90j2VcBLOiGVxiVIpqJs3Pu8mZDnxbzkiwY1PzYH
	+wnheqyOcsR4obOYOA/51YmXEf8/k+T2cw9eW/PyMqb5DLu6mdVcr2YKmZSZIG3X
	cLni7Rcq8jvF2+Two2YkfBoB4numVbIcy14a62vuxxFtn/rVJX0gjj8/x6tKjzQ5
	hAjK2z28m6okOuGz0Rbb3kKXFNWH2aEE0kc8jVWudbmfH1kbnDlyYGcAug3ORM9v
	E6mOy9NQskmelR4xsaz3gg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwrgssd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 08:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdic3cZOraRv59SnImo9gAArvbDpqxE1v0Z7jW5e6av9zdYpvsKk+RNiRtWuCJXsdxd6nu+acz8TX//MTfPVcimZeYgk3KbRDfRQ9s9wB3dCPj/4It0KOQm/fKsQfoP6UGfOg2UKzF1yltMLjj9aQl6EfM8UNnwWyEik4KZ08dg0MUQyUsUhX4qlyUdM7eRpoGpnqmwI9mDk5TDMDCLjsxNZ/H5743a6rxN3MysU8MZphePM4rxq+DBWVo0DdqDmZjfDIoG3jL1iIWXk1LATbpWzeVT/B/B9/vW0ZeQREosH47fkBe5iX8Hn8zCTzn06wt9PHkIVBwVqdVJLrZ7/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=;
 b=rpLaZksC2vhXnIZdUJn+TA3qe9965+07K8Kd+fVyb14J+wqixoACGYuKgiFM3/Tf5qYyvUjZqH+S/x65erK4HyGEhi9YRY7YuOO4uRTCTrjzzl/hj+qooPRkWnnRrQgSbyW3BMmc6NvvqyuHrWrK9T7Ab1qM4zCWbLwR3hdlL5J06A3T3kEVaYOrEQe+ARmShtwZLy3suvSkQXvYnZBVQd0AqbWqCAXRbAJVsKmrFENdugyZZM20/IvHFyvK3Gt6DseLAYYW1z7/QrkQuzCsxyULWBQd9KJ/sUbbPL97NNYD4mEPGuNg9V9ZX6ohjnPn/ATojVBeCskQOmKdAZFWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 16:39:45 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:45 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 13/15] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Thu, 29 Jan 2026 08:39:08 -0800
Message-ID: <20260129163910.2612040-14-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: e09c495a-29c3-4ddf-7730-08de5f550291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?udc9WLq7TMjq1UQ7Sga8A6hdbyIlNje0eufe9zjyGMrr8bUJJRuFnt5y49Ur?=
 =?us-ascii?Q?q0/dhAzFKYl+HzlFpqnZnHqv2bZuKq0vhmWW8v3VVq3SS7907Ndx/A6XPtkS?=
 =?us-ascii?Q?EEtIPNNe4pUkPZuIYg6h64TXu/PTr1qj7ypI37UwlpvPriz4Bt2Qp447+PPq?=
 =?us-ascii?Q?fpRr0RF3g8UFPJxhNG0EJrzlXiGMT7Pqp1+Mcjdh0pXLuUOV0e3FcEan3TQz?=
 =?us-ascii?Q?vg0iog7mfG3Q4neYC21MFoUIddSXYdJGVYGptyil0+4O8MUuFFrspYdYAR01?=
 =?us-ascii?Q?9EwklwRnMIY6h1iTEpun22qdNgVRM7JZldxAB9ofGEGUzHAHd/znq13VQJtz?=
 =?us-ascii?Q?NDhMKK3LPu9qjtSoCg8rPhcYPJi7ROd7dbv8iP13ulHse+yIF52nIzOkv5lb?=
 =?us-ascii?Q?RkMi5a1Oq4DoTkfbjQXAPL1wCe7f2jCd9uUCQ2TonWpEXhkJNsWYKP+KJ55s?=
 =?us-ascii?Q?5zfwNiLnbIalPQlBlUmONvpK1tdgXcR2i/Mu4QEBMJ3WfXA8lsoTu7DpBFHh?=
 =?us-ascii?Q?EE7FUHUjqP9vPRfBmMvLu5qcsep1RG+HmVy9HV6N6YD8vW0cEoWI0pjT3K5m?=
 =?us-ascii?Q?/Jz0xUeXJJTkm/uCQvKSN/HGh9nKLbnGO5N7itw8jTyVoVwdYGFLzSqkhR0C?=
 =?us-ascii?Q?R19PbAnJozeo7OHqfyoc0ymeuVJ+mJHe5n4WZWUzTN+imT+6kr0ZBFtndG0n?=
 =?us-ascii?Q?+2RGqSbv+jUyNtot9PnBeg4h4t3fb64MN8oIxaV0QStxKeu90LzJewVIZAEP?=
 =?us-ascii?Q?BActY454lA0f6Z0VKlhQgq/sQ8CVxEHWXdB40IdFZsaeUS1D1N94/IBrqxCM?=
 =?us-ascii?Q?LDOnnN+ql4YlR0bPrqrTB/HTvESRWL7klFsvDs+u15K8weRoKCczZB6PMVpb?=
 =?us-ascii?Q?Ofx5/W5wBlgaqrtQo9ijHYvo8owbwuFmHHQJFGrwj2h/iVqVCCX41W8h/0gj?=
 =?us-ascii?Q?0FCgn4QJnRNa9i69lbSJZT8lbHopmlkkqXpm95cp7BTzmhtMHpKaCwt/J+nA?=
 =?us-ascii?Q?3acXkC4tKURUPEYAAYT+PKgOBzzBfscnlNyDVL66gHwCW87mCTa2kX7D1GP4?=
 =?us-ascii?Q?4HrlQcMXr2uvic9iKulK1fadjfe0jLLZIc/BQC9euiye8J+bzSoEY+ihkVmR?=
 =?us-ascii?Q?8N//GxychUG47zONNqR5MfIrcJ1f4RwUL9oUKaYfOfJHwcB5MZVohRb+IZf2?=
 =?us-ascii?Q?aDkJRCPJ+oVQByWdLPXnkZcyzU9pDEz7osczSAHHvjzsXgmejTZpsOqMq1xp?=
 =?us-ascii?Q?j0Ameh09FtuAzGbhmobeC9AGFMcVznFQ5BPMJoW1rW3/qgqhshuJ0ZgqX7et?=
 =?us-ascii?Q?44vyCDK2aZmNpGn2++2Dp4qD1SeJgZuQuuyEKbt/dwOzwabd9j0jAZefcC58?=
 =?us-ascii?Q?ktYm99WUdje3A12q1IruonYt+P54RqY5vSymY0rHisqTiuhDrZ0kOGk5WrVR?=
 =?us-ascii?Q?j38SLspxF1ECWIPEC4v/BNmslp5WGWPYJoBegMtxTZlkD/KUlRdWHU27V4ed?=
 =?us-ascii?Q?mZluQYwL2Vw5QktY2Z/nbbbq+60ljXncWwwK12lCnu0D8MZq1cLOwAVdtBkm?=
 =?us-ascii?Q?tNz1cA8HHT4eZGFCMOLSyB+98woADXJg0w9xMpDjG32omjxLrNKMe98D2ToD?=
 =?us-ascii?Q?DphOIqGr5B24+abN7NarjCc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j3jhx68Y4CfAse42i0IELJNFNPABSKSAamOQayFRScN1XmuLaR3Zqb2PU0ev?=
 =?us-ascii?Q?89C1/SdcVEhIAUpxIcZaAjagWJob/RQBrEnm2KhcB0opQZIV9yTicO7aSZfE?=
 =?us-ascii?Q?c5gfZrr7CfuW6nDa59wJ2DLFeqIiJfEbo1VYQucicW0q2ljpVW2kjsuVr5NJ?=
 =?us-ascii?Q?pWgVli9unkKs20Bw8K2GOWJkqJ578LwfnmcHQ//uWVSBQQQ4DfF1jUS5z0gb?=
 =?us-ascii?Q?Kqum2P51upA41HEk8t5hoztSBFeiiqq/vXL0urTg4maPud/9BZFJlNL9ah6M?=
 =?us-ascii?Q?RCWFEabZ+fzJ0dctSNWK/k8U6UA9syHMky1Chel9RhZMhRZ4HpBwTjH2RbK8?=
 =?us-ascii?Q?Agca6cBeSxLKK3fCWzOV7MYcUZdlQdqJ6J3BZWRWLNPJbnkQbxP80QYhUUET?=
 =?us-ascii?Q?E6zSxJpLaPfNwmbrTlXmn0vVrtWDUpS/jienID2V2hWcyTw65oClwhyT7yIz?=
 =?us-ascii?Q?rbTOKccJdfU9gOYTIuq6c8pf3R0bLdRWiMaIvBEsE53/r6YZfpyebHoc8zs7?=
 =?us-ascii?Q?tGIDHMot4VM255z2gIAHS1kC6HlDelkXfh6dLxtGmFOMLNYiZ8pCWuqFeKPX?=
 =?us-ascii?Q?mGeFZQzOeAFMq/MERRXF524VeyE5nmRQNYmn34wvsbp7kI49/MNcezqmFd4C?=
 =?us-ascii?Q?v6viv8LncyL/IX707y0bGfZ2zXcKi+Fbw33KNzss4k3r/lN1SLn4XQx93scQ?=
 =?us-ascii?Q?4NQL9WPl/TTmU0Y5ByLd3AF/b+DJ33z7s7elAJOCAnodk7MTflstMA9eRxuz?=
 =?us-ascii?Q?xHcBP3UEl3brVKXJBbNsT3jM2TI8t7fza22R3XeiLUgmAZsoYrFfTgepJThq?=
 =?us-ascii?Q?8h/+YA8RLOBPrKq326f4sMPlTYgpgVIsfKWZpL9dQxpaEGFyncXEGQWrdULj?=
 =?us-ascii?Q?YKpn6c0pGBY7KtahqcMagzPFmCeyP9wFs/BoA3mJqrWlWlLvcTApfusFF4KO?=
 =?us-ascii?Q?NJLk03pA8JhG94tC67U4FlwmfBz79FUOKKUmZKF0agCpjUVY+Z3Rw3KQs0Q8?=
 =?us-ascii?Q?tA/pXrTxR8iv16E7KRkRwn8udjkRiPBI9vswrTuCel5pTbwmKZufnxKXhWlo?=
 =?us-ascii?Q?9SBOZu52NE0HxTDXijVDuO99ro5caEYqLJJ5g0wRfyC7L3iLXq5NSsArInG3?=
 =?us-ascii?Q?r1v3bRZppLNLcizNIXKUwdySLCueIW6y62TmDv1JMP49BzH8Ldum0Qlo2EK3?=
 =?us-ascii?Q?N/p0zBM8Fqpj1ABuv7ih/7GwCguSl4ehbF19uVGEvQlt+g+W/03zQKBbSc64?=
 =?us-ascii?Q?L1wH2sdlz6WDjsjt/GeJ1xBnauBDXc3XzJkmDu07U9XVU5fId2nRhFNuxs+X?=
 =?us-ascii?Q?BxCT9mlW74wnBsVlKbg+SJukoqil5n/rNGxPze4wqOpp5eobivLwd2roJ1cm?=
 =?us-ascii?Q?mUC3/hxryrMqXbOhGKk0NsFARsYA4a2VEbm4HESyzJz9x6QO4LXMmhB4g5yK?=
 =?us-ascii?Q?qb6rKDeHSZCKO6dce4+rFXZVHXjg1wgSBsFDzltbn78xMZ9T9D0Xqng0J15g?=
 =?us-ascii?Q?hQc+K3mRj+rALVUeiwC5o9EwnPq1Zug3mxCMsIT0D/8q6r6LHKsvisslWoJj?=
 =?us-ascii?Q?zU5lZ1viNSvy7fVkvcroArkfauDBeul2zBtRXbCr9uDUsn+jlLeFWzrNMBWV?=
 =?us-ascii?Q?PSdlJStGPAJVoZ53A2DVIStFfykENSuGIhtzh7eCiezJDr2g7/pSX3FdynMB?=
 =?us-ascii?Q?oxyOk0/8Qh5wFk7B1gTkyVi2auIakkNhmH8tiGG+4VrzwJb+K8ibF6cznqWQ?=
 =?us-ascii?Q?lhpsen37j9UzssJmMOmGh5z+1wJKel4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09c495a-29c3-4ddf-7730-08de5f550291
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:45.3941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJOgvKnZpzwTbQCwUl79I/MRrBAhBpR2PDV7mJjYFaEVVyxeLpgtp1j3OODwPewpDjSNUBmaQUURZW0R8qmHlsFh7124hL6RFKBAyOgnVPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: C51_2GvmHWn0-3BpHbjmJRSTTMwBWWdO
X-Authority-Analysis: v=2.4 cv=KMVXzVFo c=1 sm=1 tr=0 ts=697b8d53 cx=c_pps
 a=R3Nq4yRH+PcKhTCrdXTq7w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=dFuh8EWA25_V8OYOZC0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX1TfATTJpNLPu
 SyvBj8ZgTjbR8jOr37eds24OLlHWwCN2slIGE6NeSSSyng13jUG5en+iXZoRA4YYZO265fGUb0h
 +LGssTX62O7EDnS1A/vZMnSqeimZ+1c3DVBvrYRbrZAxWi1n/8m9JhEKUq7oNiLJIE9kjfMAIWb
 7WXL4NYiQZdVUbpD19Pl3Xz37zmGNxDo9jIbmGwcv/wMIJX7IS1AoMW8WfusFwRzcojdjOVU0K+
 73zKINaXFYxAYk7tKVkTxfg/vCRYNzv+s9C/77wViMBscw3qdUyE5HeCDepSm3MdMnG/Rt1BfGE
 5ERd+rROjtsuB4srTfdfk5fFnbZ7Q6O49rTnpvRDZQtyU6Qb0vALKdKTJfqrxGq9JJ0Vm2dR5a5
 YY57CHjLMnD2FEgEaYytW3rtqanCX7ONvPciY1hFh8F76LQZImkn9R5U0Ee80zUN7Sj45WpjyeZ
 ysmsAJxSpbnMZNrxPVg==
X-Proofpoint-GUID: -c8y5HmOXTKODMnp1iRLzc9LMG5TOa9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230154

From: Yoann Congal <yoann.congal@smile.fr>

Basic template for an out-of-tree Linux kernel module written in Rust.

Mainly to test Rust integration into the kernel.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../rust-out-of-tree-module_git.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

diff --git a/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
new file mode 100644
index 0000000000..642fa80319
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Basic template for an out-of-tree Linux kernel module written in Rust"
+HOMEPAGE = "https://github.com/Rust-for-Linux/rust-out-of-tree-module"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit module features_check
+REQUIRED_DISTRO_FEATURES = "rust-kernel"
+
+SRC_URI = "git://github.com/Rust-for-Linux/rust-out-of-tree-module.git;protocol=https;branch=main"
+SRCREV = "00b5a8ee2bf53532d115004d7636b61a54f49802" 
+UPSTREAM_CHECK_COMMITS = "1"
+
+EXTRA_OEMAKE += "KDIR=${STAGING_KERNEL_DIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+RPROVIDES:${PN} += "kernel-module-rust-out-of-tree"
-- 
2.49.0


