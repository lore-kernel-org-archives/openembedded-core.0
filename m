Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835B6CF3963
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11809.1763570912212699364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qzbZDs5x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ970IZ2987763
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ATCm+w1tJKogFk7F1LqQe/vGPEUzMerr4oUbrofMYy8=; b=
	qzbZDs5xDgD8bQXJvjkxsYf6IWIz3s+N0tZp+jd2C7hsw51HMnZNMRwq++SBJKTU
	15En0hirIgrnIefah7DC9J2mUFb/JR5YZ7C8ZmVTmx+66D1MA45Xt65yODJhNdff
	rySchN7RfG44NzxBc/2/zMHbhhua5hkOIJlDfr7Kpy96hpVUIOvP3+Q6j7DzP3XZ
	O/zLz37iEazKVLa/P6/0qBxu6BWJz6VFPDn6RITqMZQHzuNRlThCl9ZQf2BkRj3J
	KqS8idZsD+Wu8N5q33krrKc7eySa1OdiVzZdjd+YNehaiYfuaqgZjuk2+B2fguvz
	JnlAuBPH+3bdP9GGG6I6IA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahayrrh8b-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVDP0iQCLVGmrIbItyfHqVahdbA7mAC1PNsi3ER3P6k6TsSpWDcXi/UPFfWffclAo19ji4fptmFzJdhMeBM7vnhTdDS4TxSNRpaD/R40aOgfkO9C5bTbQ0QMowDGaHjj3Sjy+BBs07rdHCXPpGlSNqJ43vFxKlWcXS5DAolpbmDyM2CNSMHuBbF5WbOQDcMhkIQx0Rrvviuuzn3bJ6kAdsRYR6MZ9OkiZk9SW0XdNcOdqDvuQ/QFjKk+VhYzH3d3d29uF06/SFg0G9W12Hglu+OtoRcR/FZ/PvvspIXuwVLuf03GphrVr1dd4LWkwhJ19RxeyWkuSf7apReagkipOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATCm+w1tJKogFk7F1LqQe/vGPEUzMerr4oUbrofMYy8=;
 b=oxaiaiF2R/SLImGMebvUgiiQmXtym5KMe6e1nCQOwiqgU376RQjKRpdCks+Qpy9bZbWTB8P14HZbZx1xsWANjODu1Yflzo7FMcgm9/6FqguJE763dZzczTxWFPX6X2FMAMyeH9dR+vOzTkB0ckDiRJAMEx/7kiJttR36yxpvP+TPO+FGlJC6pXBFyEqKwqmwLY+3aaYAI7OZjbJivspTXD7ZUVPMKS/Y//U+LNCzgoj3r2yqI/DO231HYCYXq8XY2xN4SGRpDFhdqWXR67HMdPzFzGIjQZ8wnzFEaT/AENJZEQYeHwZvuw5BJQ3AiQF3cqTOxRaJy4kzl0um3EkkFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:29 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:29 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 11/11] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Wed, 19 Nov 2025 08:48:03 -0800
Message-ID: <20251119164804.256364-12-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 525083b8-b5cb-4785-557c-08de278b7658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XCIHPLOCtKS7XK4y2flpDTXGsCZxGEFnD6OSwCBKoSgDsYNCpFighH8hfja9?=
 =?us-ascii?Q?1YZMoqZHG/mGvarE0845q4apx44S3AxPChEw6wAAOrAZ0zRgyvU9Y4qsx63p?=
 =?us-ascii?Q?Z0ilWWM+tKSgKr8L4bjGQb/x8d1f5nhz/p0tG175euvOYuMGSonQk35Ch7+B?=
 =?us-ascii?Q?IHQr+n+PNXXhhfKOHRVeufMlAx1kcFmy79gQh9M7dqdRhuPEr8Ca7hCFkL1I?=
 =?us-ascii?Q?OeHhUVlYVT4jSSVE3/OMyMqkJOcxN3PDskOCijL66t8Lkw4xa5Ln/vh5Y3na?=
 =?us-ascii?Q?BtIx9x94OGn9CZHLoaE2x+vTmg/n1EPwfi0tym/Lfh5Qc7jOplrJk5kwVZ3F?=
 =?us-ascii?Q?ng2ct6Dr4waCFc2KtLYr2Ln5Wmi7JkuD3tWyzbU2veAmz8THl32Qrwoe+rdb?=
 =?us-ascii?Q?g9FuX8JzwE8jL2Y65+of4K2awFTBdCP7iorrfDDPInaT5LSIPzcboSLiuk/e?=
 =?us-ascii?Q?iva8pAvKvNIWNUfIMcekwwJbl6ekZV6kwvJlV2PFfxBwu5Qc7z2rLiT9C363?=
 =?us-ascii?Q?HIrvA768fygCPd7RK91Gw3ytjcKuXcytNbbUTRdqWBXCGF12JQJx5UdokqsX?=
 =?us-ascii?Q?+BpjJsC0YCt67wplZ7uDWJZd5d1DQanA3mysR4kJSNh5IgUMUT4oby6a2/8F?=
 =?us-ascii?Q?XBObDZ70FOZV/F/oX5Ub9LoHv+zzFV+V50zM3QUXvJtKYg8q2b94uD7zKbXP?=
 =?us-ascii?Q?EM0D6779xxSEaCNKv7IHRsW0I9IizeddmkQtDKzxSV8thmWaIbxHsl/MoEqD?=
 =?us-ascii?Q?qoyiyLAW8y5vDmapjzAdj0Pog1kCAk2lX88PCbWNQVSECwhSN6NPysn4SxZg?=
 =?us-ascii?Q?kjTvIWrgSYFSZWiMi7Yq7PMnsflQU+cK1mKEuVVVNtUa6jU1dam1FtFxAkez?=
 =?us-ascii?Q?iyEvpH/3oed8n7hbW46f5ZY04kLFs9wffNUIy5YqIKpe1uvZpviBbvm54CY7?=
 =?us-ascii?Q?BDtr31FLrTBtOnjMY+bIfVhCOwuE/5Zyl5PmVhzvEyCo/HxTV0DSzVwJgEZx?=
 =?us-ascii?Q?fYdn7bDZ2F3otZEFmrST2Cpj5AFH1w46s5KwNtKQ2tnnOG1JNC8xwUUBrDqo?=
 =?us-ascii?Q?j4ts0QKzV7wxehdlakz2BAx85eH5iFfchXHsQdyQu11lxXYDTw/3IWG0I7TL?=
 =?us-ascii?Q?fLSB6bAbU+E/HFLs0m0ResXSQzbELC+sLoekTTIffmhKDKh6n7QYWnim+8oO?=
 =?us-ascii?Q?EaYP7qK8uB1DoxyO98B7DH5k6xX3PyQyM5HQ4CAe5L270OSfZC4bnktoPsnq?=
 =?us-ascii?Q?o9FGxsj5aq5UY1Il75VYNy4aH1WhPmM8mNizfbb/4c/+YrZsxCAvmybozmBz?=
 =?us-ascii?Q?bXLZgAtVeTJh+OsXJDGwSO/nGAC5HvplwoSb77RuuSB4w/LYWWQzi0vrHTxT?=
 =?us-ascii?Q?/L37PUz0uXjbNaNGTwxeGMpNXJOQlHZK4OQG6ZrnTEMmj8OJIA1A3hlay8H8?=
 =?us-ascii?Q?UboA5aEgZCXbNRSqFrS6Ih/foN1hgh8nm4xZb8WDS23X0/xEmGB2TuADuHOp?=
 =?us-ascii?Q?LHyp1zBpwKLA+VlpBl3dpS6Hopu3j8Fr2heP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?btZAiLRt6y59193PTmeIrLb8ql6XvSDoZ/sZCoVbGHzHdYnRiUljCw/JVltB?=
 =?us-ascii?Q?Y/aEJragdi/ItPsXGnB0HnVHREMCtC15ihOrQd3jCWdnl7TFO0O4CElvjQbO?=
 =?us-ascii?Q?3D0DzGKV47xq+0i/SXa5ZUyf9OWX6Nt2embu7zSxyYw0N1wWBJsP0Y6oQZBJ?=
 =?us-ascii?Q?+8ozM2td8DN3QjkBFPsx16YYrvixMwfHQ/M1N5xQLvzBiHjLHWsIdBzH9ns2?=
 =?us-ascii?Q?uXYzqkmzDatrpiGRfaZu/Ihif3BqGGEBYDGnaZcSkrgeMSygPkHl8SFGuRcY?=
 =?us-ascii?Q?PhuzcuMyz0OAK/L2J92CxvUzKN7I69777vV9reyzL5USjfrVQdxXYGbl41Ec?=
 =?us-ascii?Q?7xN2x/R3i2sBw2jl7Wqgshb7refyBWNUtONjtIlDQVQSPzCzilXaunZ8FAgj?=
 =?us-ascii?Q?zvOx524z1ZRhP1chWcd79lqZWpWraZrllOKfO8rPOlhcuV/XGLy+Voov0FFe?=
 =?us-ascii?Q?S7q4o3S7Ti6HMK95Wq4uToUPcuQxXWD2axx307x/rZmZmG8MTtYiuVh1q2mn?=
 =?us-ascii?Q?UvnZLuknYQiNjhU0gm4/RVGJl/J8EwMIexWsIqr/Fk6BBV8YTG/U5FWjSP9l?=
 =?us-ascii?Q?+wdVFT2Xn9BAvrFwGXOwoHLw1Dfg6Pv4jHvblmk2pO/gqzV+oTwotfvef0Cn?=
 =?us-ascii?Q?zXyvyYXMC7SdYGaAPQiufv4AhV9RNYZONtbGJ4EKxUr95j9UFcnoyphIqSoy?=
 =?us-ascii?Q?bSFpdOHIw7keieJoe4ux9GDQR1ocJ1nSPzOK5+PaNInq6H05m+W0QZVuIIuX?=
 =?us-ascii?Q?KpQokNiTL+ddhl0rMCM8N+BD/5/jtjMQYSMuCkkH5vj/YonEOU50EcnHaQz8?=
 =?us-ascii?Q?CVFGy02qKn/p03QBbST/AqXf2bNaOcgVBUp0ZTEsZEHoxqegHHra9MjPG1nu?=
 =?us-ascii?Q?jwCpG4NwrzA/rRiISPIOXiIGAAxD2pTozndM2EvYOynjxf1fzWCVJtsgFyCr?=
 =?us-ascii?Q?EBzP574iCDLrE+5fe/uyI+MWExzVTcJVBU04+X0LFBFzNHZwrSeKlvOziadV?=
 =?us-ascii?Q?79oHus1dDaMlkHsft4zzsoiMp5PPv++06B6/nJOVl0ulv5DruyfpjUQy/Cz1?=
 =?us-ascii?Q?aqYrjLWJwg1hLxkscNmfOXZVMMTaXf6GzkRLWA8StDLhPtfjrdiUa9j93xGX?=
 =?us-ascii?Q?llHaFm7zscJp1uOSVyvMNiQwZ0m2/j8oxL32Mut1Fm4psn0pgOl5rzRKU1tv?=
 =?us-ascii?Q?x7+eIWlxWJx//KTs2/VXGw3xIoa6ouCFELC4YEqlqhLJeffK6J5PwzW8BVkA?=
 =?us-ascii?Q?HOWc1CLl8X8ibegvN6QblCOedoLyPYOmoWnTctMc35G3g/FEpyGpiJ/8TPmv?=
 =?us-ascii?Q?pFMXAu7xxrlcZmAhux3viYZOG+rmov4pOgp3ffWEHy9HKoBb3ijdaPA3PEnU?=
 =?us-ascii?Q?wXNuCJ0Icn0LmtcGsmOOJH2UzxwtWe5whLMyUuVQWWT+C2Nw/PPl6XjusPmC?=
 =?us-ascii?Q?E+qi0MWo+Fz7JXhld1Ir8D+pO3/KByWBt2N0RzhV8sAD0M8QuEmqM+4GLb1D?=
 =?us-ascii?Q?jrBw3OsK7LMfzgMdxq1f8l7iYFDj++9oNAnR/U6M7mfarOJNxaQd0mHUJ2Ah?=
 =?us-ascii?Q?XiTwZkvNJ6pmcTVCiXS82rN/xNhA2oT7bzGai9lilwy+LMAnXc+EF19dpxPj?=
 =?us-ascii?Q?baq6AfkuVGgXpa4icQa9xTA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525083b8-b5cb-4785-557c-08de278b7658
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:27.4159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7o7tMFtnXAX0yUU61paEtesdvqwQkPx0Lfay/ofRQ3ngVK89rT6z0HAMqsMuFU2Dn26gkQyOpu7ca3uYjearRloOB7dhgqPjcw3grcSE4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Rr4UMauxj4srWNOG4lYCI4KIWZgN5XG2
X-Authority-Analysis: v=2.4 cv=EdXFgfmC c=1 sm=1 tr=0 ts=691df4df cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: x1QjAgkDClXPkkiJ-bWEcfLjjkNNq4ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfX1+wwp4rCi2dl
 Neo2cvK55AWc4pKqNc4N50h9j2aqLWBRbeIFGnhVQEYdYD+Bdur/evepihVXs2R0kIx3MYoBazd
 1uvKiAk45BV3VSJJDYi6Jq07nuVTqX9CMPJY+ON5fap1Y3IhtFCYQKPPQzyG1lQ707aHcJMt9tQ
 ZKHWb8NFqeUoe+RZ4ws1Y1ZKm+QVkSA94MSbSv57GEo72AXsfK2x4Dd6BoraaIiEpQJ3sf1URdT
 1MaJtyrT65xir/mk8QqmcD1dri5sfPBrSBQfCe8niczkChP2taA6vIdysfmIqJsNigih6iNvWbp
 zpK8LuLQiJn5PapQxY2pvMl1GOm78sJvvBAOeqD3J4EHI8ZmZywbpriQgDrSHwmvF6YwglPrXKt
 0C4weVOT9ccP6/ZmK4KngVaqSa0cHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226571

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..66cb112a7c 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -481,3 +481,27 @@ IMAGE_INSTALL:append = " systemtap-runtime"
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


