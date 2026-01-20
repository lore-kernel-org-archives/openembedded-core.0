Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC870FC619B
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13452.1768933895930526250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KIgadQ6+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5Y6kf3683153
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:31:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=; b=
	KIgadQ6+EtkWg7RWRGRnmoraxNga62Nq7uQiRT+oQIMr3BRMET/OZ/Oxdunwbc/u
	bpqDVXVyXMH+A5C+lTW1E+Zvv4amN3bkPbrit4oJAfhvhgEVLi+SEEikunwDBvdK
	HEZmhbspCojYpMH3nLXw2bNS/v6gLlWf6c2HBlNgG/sn9TLbZVdlOV6mA8oqLgB3
	qJ2W+Mcs6GSgMbJt63/eoc7t0HbjFRGPGXf2Tnay8qA6kx1n75bw82AgG186mlWF
	Haw8k67qLJlESTJdXshlM+jVkLy1apNsE31yZLU+3GPsKO+ynrCHPElZ+YlcDTwR
	iwLksTsRjNjVZVy9svX1bg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu4k1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 10:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJ3KvzzwIG5DHNMD3zLuMgH1gk0mcvPC+Y1gVzK3ynu68pUAANDlweXxGpXPp7h3R0PJiFU2Q5BKlNiMNUHRnqnzgA0/Vl9CB1w14+xTBHM+ttQWItvyU9oAS4SMGs1bFfYngt2OuAnmnC+yzVMTxkUO8f/73AyDxhFrYzjhFNHV3lK9uv/9LCKwqxDwDfomTKX5iz/aA5OeCfvUvhT5zoUEwuPgYN2SZbjbv8w7zNh88OvD62M2SZrRoGJvgwAFoUeN0IoDNCC9O45VFp1CFDWYxr5DnoHwM9Ox5JF4pcqwHvtLCKhKzrAxFV7Od2qGejpoW5iT8yMAsAFTgSSeyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUXONzz4P67x5nLEqTEWIiU6UVB9l/81Cl93tXcdHLc=;
 b=syaIWfw3WbnDMWSj63L2OCn/lRtDBLDjZYjijii1JswE6q/A+laafod4GAY+MSMbfHbyHEagBjZhrTHxEGRK0OB5UyMW0cOy1UKjlpbFslF949RhIlVNMp/tmkclisKvjNnY4+hMXU0xmn6lEHXklps0dVva3M0oxOPZ6uevndrqQAPxAKu/Z/rLk5Dw5E660ewlkwvTo+0tJtBrqfkeTAf6QN8G0OskSIEdL39kJLEMie7TGG7g8SsXCL9RNvbcOy6A4bch4572xjHUg06jA2ljNdrl4AipyXE3H2FStCJX4DaPyFKvZ+oGxdyvH4fkYzWI2Y/q1AY7L691JrW8AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:33 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:33 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 10/16] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Tue, 20 Jan 2026 10:29:41 -0800
Message-ID: <20260120182947.857242-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 076d2a0d-066f-4764-c602-08de58522340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2OYVm5LiCGf3Nk0pUe+EhLzOuiiZL5l2zUAldRCTRHX+eauMPlVMVdt5Rc+Z?=
 =?us-ascii?Q?PVhXlLXXJAajHilyw12X2TFlIiFg55cKXm92LXaNQFPHlzIvgfyymdazdJID?=
 =?us-ascii?Q?HbmnsobW5t8uIJo8NTG8tYf4RmhIIpQaEpgdXkTd+G1TLOhIzp0u1HyYuUux?=
 =?us-ascii?Q?CM/f/9rMAqTo1fM609WSDbLSstmpGHQrhqDsvSgMUe9EOZbDLRUEkH0N0lGl?=
 =?us-ascii?Q?0GpNsRD8utKQnBvQ1XDX2djsyRa+MIBu5bfAOkii14AiNRJ5st4paMDUJhjA?=
 =?us-ascii?Q?TK+qiahpbkxmF2WgwwqLAq5jMn3ouK9ewmMRriOHcKYFKk6L0vCw1fAzb3lF?=
 =?us-ascii?Q?ie1YTDvoDX4v1sKqcnfSkzQ9cK6+PAK8IleConDLseDvVI+bAWLKgayVqFJQ?=
 =?us-ascii?Q?sLUfUVazsNRmi39sr0Vxy4laL+pBWCHJ6QxlLsLelBBiWQTUVrST9rA72cjY?=
 =?us-ascii?Q?qZd15kr1rnhectLfLdrO0lcEYziw8lzsC674DQLTiKOf09wios923vrDDmbA?=
 =?us-ascii?Q?RU3ojcsMmdaEN1NsRQAbQ5N3xZNg3CIi2ZQTVIpK4lL6R4Ma9iyfh+2gMatN?=
 =?us-ascii?Q?cVCRDFC7rmkdVDpbZKyJRiNL0hhrmrLKhsmnPaIDijLIzT+38qNpCab+BHXJ?=
 =?us-ascii?Q?bSE2ItgjpuzyhwpVVteV9o1l7pNKoGnAqZRIo/lJrATcLYYptjIbNK7rzcFc?=
 =?us-ascii?Q?gwyjpiu/MYHJw/vwxgxsunSsB0LXiXTJ5nw2phjA4BvMHxMzTMThtBl45dDu?=
 =?us-ascii?Q?Gr6608xXBPXQNTUt9/WE6cfofbRz21ZEJlS4DkWP66OK2YLHQEylmCZ/0bcg?=
 =?us-ascii?Q?2H7vh+c/jwzZ3oNEF52/B8kLXiDMslA/6y1PjXDbb/Xi23lNvL8Qj5f3gj87?=
 =?us-ascii?Q?XexJKvanYeU+RB7n69cK2vuJt+0MsqPLDRp2drsVhu4kFbWmg4Xi7MGhVlc0?=
 =?us-ascii?Q?xlkoYJjYJVOpj34CKZnU5f8cfgJGAIgViDZGAwdcUVnVvQ0Uz9Fie0/Ek1WD?=
 =?us-ascii?Q?la0V3ZOkF4Eva6K+S/RYaqqNt6J3guUE6nptKvS7GP7PUpdq9XUUu2syeGAw?=
 =?us-ascii?Q?jEMyCQCUyVm4HwjhW7njLTbtA0dlTaawpkPUOknYGU4q5Bw+CLSNcaeiCCnw?=
 =?us-ascii?Q?BOHh93cFOAxszzUo+VBbwV7bNbKs/uRiQ1+1eh7vD9EJkm5pj78OkeWNiVJJ?=
 =?us-ascii?Q?EQ5Kl96ypSUUYav7UYfAZEoybyMDD/HbYq6MlXGVnlPdP5h+0TKDYZ5WAPEn?=
 =?us-ascii?Q?tZm88tXK2QMo2TQW3a24ZdgA+osBlO0XSRFm8+aGywR77X0aUnUMBYbkWXOU?=
 =?us-ascii?Q?c4N/J8MsFfs/swwXYWNBrmR+icVxKENZTEs/zINxcnZBWDfzJ5vtr1ixpyu8?=
 =?us-ascii?Q?Px2SPt+la81dE8nwuQuivG+aUoglaVRMcMqs1I2SZbUSd3QhusQX/plljhmt?=
 =?us-ascii?Q?+OfGvcXXA9XPSbw/C4EIXO+xrl1QE/4xiZ26+jBTmLte9/nbPJy/Wt2y7+Lc?=
 =?us-ascii?Q?i8lQ3qH4RBS7eYrxPQFNJyE2XHIhuk9I6mnXuWdSqvGg65GNavpj95EaS5dl?=
 =?us-ascii?Q?qjxndG6BTs0XY41jE6U91KoTABkn1oBT7PnRf/l90DtQrqt2DnSgg0FYo+ik?=
 =?us-ascii?Q?0QUM6emwYcWcnqNI/kllkzM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RjKo1/2Y4cILsoG7ac2xZnVu+aiWSle4FWXXVMqWp1g1EjOHDtBDGGnHRE90?=
 =?us-ascii?Q?R4H0tRDZpkoUFgoZ4wHL05hpPHu0mzuRg1PThkp+M5djjxrrQn8fZtB0By1B?=
 =?us-ascii?Q?Tf9miyWA+r5dx9P4FbN5icYeeh7zbJ1HLE/ipBfb7SfxxV8xkkkPOz824Eov?=
 =?us-ascii?Q?cRqm6KEfj5RvXVAGWTXq3bP5ZBY3oUJ3GrzAj929xQ6vgu83oz/ZSiS6TQEu?=
 =?us-ascii?Q?XeWJjVjpjiDwzLOiJa/bBq2mj6sQhGgG6vDfpe1n5Zasyp4RoVp8ehqIxkW6?=
 =?us-ascii?Q?SbF1RhuK1V9za8qekqEz4+xvbrO6zb8tyrtF7f5Sm00MwzhZPOkYK1NpXyVv?=
 =?us-ascii?Q?6mDx0tLNvSoh9lOnZbLntVbyaZa2B4NOXyWA7LR5j5Erdb8MRVl0ICALkFTk?=
 =?us-ascii?Q?oJRIP5Ik35iTrA3/7lxkARWUxB/jQ9MqHlq5pdp1G1bspWbkFlStqR7X39Ie?=
 =?us-ascii?Q?Dxp8D8fcni021im1r59Yr0+T8oHlPc8jw0D7ViImBCccXGIQXwrMsbGjkwkb?=
 =?us-ascii?Q?oPyFyKiP3MDhLGEnwxlJ3rAme/qJeqD2Dq4cFoPnKI0jLYDFyfi/NpH3ZDTl?=
 =?us-ascii?Q?Ue/eckbrBjTXkoc4j59pE63Qzu2xBh118ZMilrDOI2aoXQODdsvEfKKHbfRl?=
 =?us-ascii?Q?cuJiFTAmVFExMkq7WBG/OMyO47qUD4dLbdnFbwcpflu6UdaeMP5sxvwvNeE/?=
 =?us-ascii?Q?83tChgy4etXMhA1CtBZGfkg7SiuW057fKWLz2MjANYZj1MSD4Px4As9TlToo?=
 =?us-ascii?Q?kC0LEuQtrimEgRILp/l1Tyf0YE7tzlh7oRqXPR9aU3romQRppyD6AhhOo83+?=
 =?us-ascii?Q?rcfr3WucfW952v6VO/pWcoiIGtsZCtNZLLlS9nB9swD66FuVRRcO3wbU2q7C?=
 =?us-ascii?Q?bLdiFbmE5W2snQFg9QEMSZdJ7N5U1Vj8shc9PZOjUGMPqQoPMfuCUCpRO8+H?=
 =?us-ascii?Q?QO+hiGQ73tCfCkqOGa4tRFT6PJiMwB8w7dI5HHLdERkfccJ454ShuJC7iBQp?=
 =?us-ascii?Q?rSIdH3TBhrCTnZg3IwKzsNMkUlw7yzaiweEi7AEOrQqDMrChDVqYwo1PyBXU?=
 =?us-ascii?Q?IpsG36GJTZ6QaEEkAyTMvzpeGx3XW5ysIAg+DGTmXFtWbysh7w+fzOpL7A4W?=
 =?us-ascii?Q?TYeDceJFe6Nxn/lT4m4perXYxpWxXb5bibBCZAMpcR+eCIBacv172GKUeXL1?=
 =?us-ascii?Q?GOfJNekJXwjR1vjBNh5ftEhJWtATNW+0bZQDFs0pu7T6qPwuEEA7/X36e1QU?=
 =?us-ascii?Q?3JjfwetDWIWT9ZyGHZEP+OxAshyrA20HHhD/0ostitpfJxSsJRs09otpteoB?=
 =?us-ascii?Q?1DpOjK7W2A4t6Cm5rT7YDgOhDeHItGmTYkokFqIexprTwD1/y45B074ml9/L?=
 =?us-ascii?Q?jmx/dMzMnevQl3cqUNP83V0CJUt72+L42FUb702TzTm7bxiQTlfztudx1xLp?=
 =?us-ascii?Q?SRGF9ZRpZ78Lep7Y0khuNo807VjCFWUTN+a8r11saOeXrHmgu7NRomsfvzdK?=
 =?us-ascii?Q?nDLmA4hTBos6I21PdTyYCS3Oc/qE0s9TVDOAD6nc8eGiyv/dTOAYtUc7KD9M?=
 =?us-ascii?Q?a1W3eDhEta5J1Vcg+MM7Qx7KY0U0dsNbB5EDlG90Iz/FaIM7BiAsyJvUXwV9?=
 =?us-ascii?Q?DtUmELUbTlT8+CAfff1DNMHcdn/lSgiyVwzJ/JPLu5IIY7mewIDHkApfwHe4?=
 =?us-ascii?Q?4/R17K/qZkPRZs5v+5xH+9LPYAy4DQcdDmROXJhrWkchmGPsqa6WrmRsg7aE?=
 =?us-ascii?Q?iYr0NqFUge7PT4O9qtGZBa4UhNC7pJ8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076d2a0d-066f-4764-c602-08de58522340
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:33.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zw5tThqPKhhDP8eN+rItKanXtW9d8jb/4JW+uGwPZfWiKtJiDZWN4I60D67o8t+PYfdFWUEUl+aj6X0d/xZBqfC11S5UbOe7lu99M5u5rS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 7N4jsU7SNQvWlweJsy1G6A4PWTqHuNF0
X-Proofpoint-ORIG-GUID: m_RPe6rYEfngYMHs3SqYwT3xpsrf1nrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NSBTYWx0ZWRfX0wEZcBZtDh9S
 K9hALxPcj3aCk6/iWCETY9JALXjP92S8K1NlmYLFLaGDQf+IswlM+cwDvJRCgw5ZU/zFqi1QvRg
 lBYT0NJb1NQcjzhg95Ev3F+wRMHQBJBfg3kdrJK1epu+tDAEkfp1iPFxHGFzGFZRhM6jvvqPSCh
 7cs2F9im0WUtg8vk6rnTGkF6P3608t8tzkbXx5EqFbDJDydEBYetlupphfuS+4cYkqeqxxA6QaA
 j0ofvXVUoTn9zjbQOh1oftwi4qVChCAuKqC0xdgVDrQE6UGi8U/eF5khRnUN4ED9txPeIVjzjl3
 Kf/+i1nJwyiN+mL5XqZDevD7vZ2uPG8RSXjvcx6ynsqX1eKs9Q9FiS6seqe0p7dppTGrDLcQDCd
 Cfa/ycZvf/RnwJ8bezndoS0xqcfTQqmY2wXU06VUxJmrpdakCuwxcIKwKPbBbHgDB4p6Fh5OBvV
 SXgR2kfXc0Bz4yv76Zw==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fca07 cx=c_pps
 a=uej8S9duoQdrJ4czObxKNw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229777

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..e8374606a4 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,28 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                DISTRO_FEATURES:append = ' rust-kernel'
+                KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
-- 
2.49.0


