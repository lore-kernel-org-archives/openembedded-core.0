Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93730E92702
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6592.1766835218810199959
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jEdNtWep;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBUvar2168659
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=; b=
	jEdNtWep2siUypNEH5UZ4VpT6PtuA1mwn66WkkpKl6z/luBEduw/BjX+FtWqbNG4
	FuBdlotmmNkejpu/2fwt6vK7uSvhJ9+YVLqPZQns0bwhjawxP/UTNyj5iXZe9QLv
	6V2bzWkkuszHvv0exuAexh4Ssmhayx7fO2ThdqUM/Q5L5w2Aik0CuoEH+86Hsu65
	5CZ5WY7aeFAXkEkJxp1dFFq1QEN/0LczFTjTZTJH2Ljf3glp6HrHPHv1wkpMjFNP
	anAc2m+3yL1JvgHUmDXkGqSJWNxnNo3EOLHirpDursRX7iKrrrIPzNyGqBhvcQg7
	ov/gzM+YJADthiQPH2NMkQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4r6uu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+ARfDgmwNgaZCuPMOu+VP+mV/GrWGkFXfg7emITN6RyHz6LSMrsNzehrLKIIvIahp8uAVow2GTXNLnvTI79C+He7Wn6f2SPXHDqDmE2r5J3qrWtZK1nrDNY1J5LTpCKCKcWngiYAr4VBHRus6O8UUb4SZEqFgmc+ghGR3FMNob+rLSldOcJ+VV2BAEDSwdOug3STVld/IAnWcFZaujfMFkt/CSfnur/CFnpgfiEStMeluZBgwIy59nVxtT2zuWNsKofe4Ar/vuNSYvnXzDNluT5zR+SyHG593U45VEZOmmG6cw7WyeRNDDMSANOF7rhs/c3DKrWSIzEeqZ2dwUSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=;
 b=O84LVjJvpwqsq/DN4T75P4XQOTeMSKDJ+0p9AX3aYeo1LqDi5rltavEQDCBDPF+vGeSfl/nFCBMp+oftaIL5lG7AWiamNnQ7m9kOfC+aSnGOtZWxVyI22kuJT6ky8vqL2Mkf15NKgyJ3jZlQxpXUV7fpp+GloTyWf1CSuyii45xiJDhppiS7vOi2/gGVhm6W9qcCJoVXt8YJbWnm9i1+Lx7CiR0fNxm0Pe2rgbBds8O8pQkV3UArqklJvKag+eJK5zWQUypSw0N7E347+w7UUGfMhoU4JaJSgfH6vYWVcTvVmMEAA0f22ZENjgQgkIGESAeAEWBU2PNOzy6GwbxBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:35 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:35 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 02/16] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Sat, 27 Dec 2025 03:32:37 -0800
Message-ID: <20251227113251.773795-3-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 347b0c36-0ebe-4332-34c5-08de453bc5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U0QyM2VyiT9ItHEcMMr9fEKkB9f+dumQVGH6cz0Wjo1J4RTRzj/GWYJ5EE5V?=
 =?us-ascii?Q?dR5gypj1zSmeLP6nt4KSHYc59V4DiMh92cmBd03rYCxA8R8Ar3WiexyF3vQm?=
 =?us-ascii?Q?D6ET2aYXiu4LY6qHFeoSsgS0DJ3dBURDPeI2W2mHYSRottXrOJDjCbdi/sov?=
 =?us-ascii?Q?4K5C2b7t0nPvxkYjWiA7oWcHEydvt5DcP7+ukht2ejyUKaD++H+qZwQzhbHW?=
 =?us-ascii?Q?0kK1WsKJHACGS2InWQ1xPtZv4JLIfoyqt+dofbTZ0U9K6aNQZkasuC9Px+Vu?=
 =?us-ascii?Q?dkicrvq9METXpekttqgzOTSE2i9kvL/3n75vR9giY62tKyjK/RWMIfyE34mX?=
 =?us-ascii?Q?qiY+W1ksyKKBRHGPwY0VNMDUqTL3IPbWtNgGTHNhUgvylX+xywTNppPyLNJw?=
 =?us-ascii?Q?lVVyt5sXpjuFC7y1YCiLLa5JpUEnI/9vRAXfPHIOgPlLjsDXZyFt3k5SItIm?=
 =?us-ascii?Q?WkYhMQ6XWdle5eNH9uEntSiaoCDzTaS5PiWcGKYDNngaYynHWeXFvJ9KtxSs?=
 =?us-ascii?Q?L2bkbjL1nUqhWDvld+Gj/NUdOuybPuvsrHi5xEN89FLfG+BweXjT+s+NKyQ4?=
 =?us-ascii?Q?ApncBbR/f17TKVRC6SHIo0sUvHbvb9CtKvH+59KnVvk88p7xOevZVK5lfZRf?=
 =?us-ascii?Q?pD/DDHXBjWmtTMgXybKnoABiB7Ut7gnPzrBSbfsFKDwDt5IK9F71hf8BH5gX?=
 =?us-ascii?Q?V77AB0ePZCsnqCIUSVqqeYgAeamu3sOz2LRUjLm3gwY7LpDWiIkeFG9IFLU2?=
 =?us-ascii?Q?fEmYbQE2vCH6dd72bvtPpWz2wQkrVwBMis2aqHMVoDWu/jS+ngL+PbpWomkk?=
 =?us-ascii?Q?S0UsVDhn4GzmaZOokSmoi/R0NNEdsHKXL7PCQNC+ASjhUMsAYp+3Kv9Ow9mk?=
 =?us-ascii?Q?UbckD7SF/XUP8wvKWZ+NRu64X6JBdcRxEpE3GzNXYDu5B62z9r1GAh+yvqwz?=
 =?us-ascii?Q?4IwZGRP+PGbdUFaDMkpr/ey4ALF1UnADawKgBElcGNfLADnJ7Ee/HESg6AL5?=
 =?us-ascii?Q?54fAezO0Q1RkvYcDCJJzdMpemql08MW+EbUIS1ncbEUac3l35hlHORuFu7Ir?=
 =?us-ascii?Q?o1ZkPfWL3RBi0MzwMGRxrcA0B0FeoLVZ5jUrBpffSzLZJq0RUCa0S8Olf866?=
 =?us-ascii?Q?XCSG1yh/TVfB3rR/ZTXmoGcHLLFGQz3znF/S8eoKvxTO6bZjpYBQi490l8kN?=
 =?us-ascii?Q?fOYWUdxUlK7wzz/LQFje0ydliFMnHcapIzyHfQxBemAA43ixoQgHOA+57fDr?=
 =?us-ascii?Q?PW0NCBOZFcCA0lcWkABJa5KTcoET93aQvaEF4kulbfbDrhpFdIc3tQ1zUQuj?=
 =?us-ascii?Q?qKZwq4a4Cgx9wtcZPf1K4v42LNjZTm10IC22aitDU3Os2i9e27h8hBhhbx6l?=
 =?us-ascii?Q?LVz9Uy1gmQ376yd3ZeKrdjeHesEpihtz811zzOr6sHgaGKZrT7voRjtZDy11?=
 =?us-ascii?Q?USyAmywOkIvISJvsT0FX9YaGsOA0XyjTjQMLBx203Y/fbISh27wMTE9LpnmW?=
 =?us-ascii?Q?kBdQp9OKTWhF813+bgBSXCm96XJ9oWX3tr96?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IV6jESSoZH+Sx8NzDJ8qMc1L949t5pmZr5Qt8r/S/5in1cFmjCCwMLg6f93Q?=
 =?us-ascii?Q?9tVk4zPSyhAotL4b2CR83rFCDSfNNr/QnYGYWTSKhD3m9S2Ae1bMmkLzYJ7C?=
 =?us-ascii?Q?i/93jUtofRZvoIZ1NipMtXOqA8yVSWbj9N3CoWwJTg65ZESp1Bhh/36quQp9?=
 =?us-ascii?Q?YIO6sOnsVM3oXoE+SiWAPzSwMtAHnvwyBHkRbf1At3Rl6GsZB+WOrcouYZRx?=
 =?us-ascii?Q?cUcgpl3MwKF0+3mhDjdoZ1rSzWbYcC+Tx4+AhixY4mGulfoz0N6zX12QYnT2?=
 =?us-ascii?Q?jbjFt6s2gW5WtLYFQT/LCc118DjdRnucdyx2MBCSAJwDadxON+fLyJ/nZMLM?=
 =?us-ascii?Q?7Z3FyVGRs1QMi61uAdys4zqgLrlupqaAmEY95TVppKxaGMBSiJOxJ6q/A96V?=
 =?us-ascii?Q?wa0SeaX+PKGfoityrab+aBTFyKa74HZRBoCFAO+8FZ8Ri6q6tQuC1hFDRM0g?=
 =?us-ascii?Q?Xjl9i2hMwwxgWbzKsMFjANlTnV8XSuGmLAAXurY/seK01ClvDrRPXQoxeUTj?=
 =?us-ascii?Q?I5qMljE8pGIC9qzYV8s4XD6JnKhQ8K25wVdn34ZYgJGhPangfDGHPPO7WjD1?=
 =?us-ascii?Q?0byyb9bIFxbOV39soTPq3i1cEsEhZ2wOYi1l4KlGwWDk5C/VBzN0doBFhTkA?=
 =?us-ascii?Q?uyzKNCRWDxJm03J/LpDP7piBp4WcMyTRFPAwvHWr1dY40uZZ9RotbLub7R3w?=
 =?us-ascii?Q?zxrNcPSThsaP1p5ubsRowiQCruuct7IEumfp/mFmmAkOky4LoHFtghkvFqV7?=
 =?us-ascii?Q?nSkVfcMtQ+jzk2VasQqE0/I4JYq+rF7YwZQhNd0OIBrLx7ZoXI/shzwwfpaS?=
 =?us-ascii?Q?biMvf/Xw9+LInTJZyTEGoKTlepN3CdnMJ5/TITzB2M1o6Uw5xw5NoCaEcg5v?=
 =?us-ascii?Q?AWJPXdp+xJsSPyibF+NOJHIAsjU9rXhamQzdYrRwyPH9286iOCt3YxqG4J+k?=
 =?us-ascii?Q?g1e516ZHtyvk0NfTdVcvUmr+CBjBL6pqIT8Z5G2RkapyChkca5wv/2hv+gNv?=
 =?us-ascii?Q?sOnWa8tPorVole9VIQkZz+1TILaPydWKKmmkllc+rOHH/Q/fchV8kT4Z8TEu?=
 =?us-ascii?Q?cV+zmB/WWMu+0riKjD4LlJJ/EeVkhEbsnSxn8CVueuNqWqsR6X1HJk2wSKz7?=
 =?us-ascii?Q?U1mEZvy4HI/Y8CSzP7GNrzVVjT6ZYOqh4DV2BuHJTXeJLbrVX/MOG1fXuqRl?=
 =?us-ascii?Q?X26Y7OL0x1jY810fbqg3M+OKoyR1ApvjPWTKl1R0VNyDSTT6kSV767kAClZC?=
 =?us-ascii?Q?1LrUhBMUf4IuEkf/1SThWJNzzYDI6lcZC0xwBNieXHkQoNCLRN12sq/qYfS8?=
 =?us-ascii?Q?8GAmvsKO6neqXNz72y709sNdwTRjf7eVFK+Zlp7vAx3V1aq/ukeaXSfpzrOT?=
 =?us-ascii?Q?a6g40FXVhHdn2cQboaxgktkaGYksjSI/COrhYVB+3YStAIbWFGC4m8JZQvxc?=
 =?us-ascii?Q?QtPS1xHY+8HhNj9XifIgNRq/EKrU7pTHCfZ1pFF+bZaRq2VQki4Lj9fesD0M?=
 =?us-ascii?Q?eoDP7e6etYrbHcw/rIVI9UAsgeskOZtbpk8ntVylENMCV3qtc5Q/rZNUMVoB?=
 =?us-ascii?Q?v8dggDC/rWQnf1Hcn7hpZoBbFzYwHulPGNNL4XRW0cQGgyau4vkntj/7dE6f?=
 =?us-ascii?Q?Y5MO8wepl5lJI6+gJOfUXi2n7ha8SLJrWhTDr97X/Z/LOpJ1b6s47vgEmCOP?=
 =?us-ascii?Q?QcybHePNE37CHcpfkcRZNrnchQSA0lPs9iq6ECxFs0u60IMx8tIueQlW1/Rw?=
 =?us-ascii?Q?uqhth+2g0QgiWUmXDJiXDpHRwNK6oDM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 347b0c36-0ebe-4332-34c5-08de453bc5cd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:35.8537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJVcohsg8xaVEICZpblH6chcsDQKfi48Z1LpvwedMveN1T2wYeGf5EVZT2W9t8joF7iyONdfuCyf454TQkeoZJ5mKMng0FK+fo9D4XMIh0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: CP0mlDGV6HgFpEbiieIf34cxzt4YyAey
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=694fc411 cx=c_pps
 a=v5NpUkBk8u87wj8Ets5Xkg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Rfw2oJpr3f21ZIbSA5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ffQ9LYBCSZHYah8OUkfnSdPSF918w8eI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX85Mujf0ORrLd
 3w34tPa+bDeOQBcvTtsJwyApHSE/cD/vNAium71LB0Gdq+WllNFpiWT6v+67apD7WF3VEtmjzoY
 wEcw2fjPmCNKyzpIJXolSA9Si1LMXJREm3Q5LOlysjWoOJvfNKz4s8UgkesAyn86oQoez8O/IBZ
 KewfD8P+g1YcBqPcc58Ox9rCirXlnVCYTT5MZjO52Uyt1/QgFPEMwLJXjzq3KIEIAQaw98V9iQY
 o50Q+q8q42VkT2js8atAWkxmGfsf3Ayiv+CjHLKB0+wbTmCcW/JFKAAYkjhUiqoVqw4Gj3+XWqx
 aaE2u7iZxlWGED9EPnwMPhCDdpjPcHLSJxKst9Gw4EEiYv14v+vKGBpu/GeMpVUmNMw9cTfCg59
 8A1R1DJc4OYksDjGJmil8RKsVa2nNmZu+pF+W8qGHXH+cKRf/f2nkOeh4OF14R+l65HzCBI6dXq
 TOQY+7PaA+/4hfUqVOg==
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
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228556

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
when rust-kernel distro feature is enabled to support Rust-based kernel modules or
features that require generating Rust FFI bindings using bindgen during the kernel
build process.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..41b12b6f14 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,8 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'clang-native rust-native bindgen-cli-native', '', d)}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


