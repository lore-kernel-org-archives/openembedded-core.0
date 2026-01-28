Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AB5D3F073
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:36:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14722.1769610966714644586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 06:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YYThqdEN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6488b4f5f7=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SB1mAf3275623
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 06:36:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=/Cl3G8UvxZs+1KJzC9Ua
	L1DQH0XtH8J2RqefPJvRMx8=; b=YYThqdEN30Yjcjs53N+d8AQK4wDxWi2JSBsb
	tJsoJlCkOt0bNqx7su6NwO3UqcgQVKrFi8jDCgFJL0SGsIJw2oRGD8YkszdDdkqU
	a8tjtriJmAI8UGNln54ZfpQ65nbaf2LmqNOkvi4ysXD9iYm73n5T1eBsPowod8/r
	CtY8jCBCRm+Kr4uM6hGrWW0bUH4zJbo3qzTjVLviosqqV2zeXwUpag2ejyRmI7Ci
	5WutaI8LgeO0hsfuronhXQHMpyLtjV+OQBBQC04/v/O2hDBGzgg2Ou5SJkvLZz/q
	tOVsiW/2QoR2ONRZwKR750QBuf0w/iCfGxZTf6Amj4x46nuyrA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010032.outbound.protection.outlook.com [40.93.198.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvxfm4x5r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 06:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePGWFH9TAPLyt4D/8UhzC3Bmxy4/lubPJ+jbHFZxHlEKZrwFsmAiTCzS7Ayyeg4Wohn/yGFI/VADkhybMNZwFPoMoqnlPXIWGsN3khcB46cSctt2//peCZEiULFrbFO9V3e6g6ggTm1TvCHXytYUw/CgSmQsJwZRhhbHyikiv/YeQ+z3xe++UK0KmFYqJk2xKXhl3XfeznbjTozh8J2rl1ZY6W1z9ArX1EOQk7HWHSSPs5tCZtRQiBDocuQzpDNgB5BdahuoUmjnS2K3v1JFBVg0nFXO1+hwv6bFfSDovjAMOUdHfT3lXKNw8luPIRU6uHU0exnPgtvk5cyeadHomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Cl3G8UvxZs+1KJzC9UaL1DQH0XtH8J2RqefPJvRMx8=;
 b=qFnDQiAPk4MJ5YflnerG41QjJ4+jUdHDzvsAeH0WikgTl/yoj4rJJtK3LuD4oAGYtM4nlZJPCd4H+OQq1hZkemN9swrIC6PeMs9mi8COxJDmbSeNdq7z0Nf6/zVemdVIbcC+M8fP+f04hAzCjcvbMrgNyqNGbA8UdeoJRwCU5BprPrGV3944C4MrfZ2PVfoXaQ1heqRqfo0pyRc+HM7uCkIw2BtvfvYxgxzYqWZDS/NJV6yqN1iEQFmpYOGVxLiPjFlVfkZiILu+vXIs6LkepazT5EofMTHilFR0mEuv+twrsAmisLlTRI7domAY2VeIJ/UERB/Qd7Ik4SbD0lfq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 by DM4PR11MB6406.namprd11.prod.outlook.com (2603:10b6:8:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:36:04 +0000
Received: from PH8PR11MB7968.namprd11.prod.outlook.com
 ([fe80::bd3a:5dfd:4a5b:223f]) by PH8PR11MB7968.namprd11.prod.outlook.com
 ([fe80::bd3a:5dfd:4a5b:223f%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 14:36:04 +0000
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] wic/engine: fix copying directories into wic image with ext* partition
Date: Wed, 28 Jan 2026 16:35:46 +0200
Message-Id: <20260128143547.1239286-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0185.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::42) To PH8PR11MB7968.namprd11.prod.outlook.com
 (2603:10b6:510:25f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB7968:EE_|DM4PR11MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e08112b-c4d5-4ac8-7cb4-08de5e7a9092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rblj/CsF9TrFD7j8YcOGpUxfNJOL3xtFEd5rtaN2aYNGmWeCXyhk4AeGJbGY?=
 =?us-ascii?Q?8KebUErw831Ac7FNxARG0s8+vol0CeFyh17tff2BACs1sxAVqHjlJNyVZoR9?=
 =?us-ascii?Q?g4FuOyTLjBtPpwSHbOnbvtir2ka7i86Ipz4GyAMjfrd4fssFtu5DYBXNIjt8?=
 =?us-ascii?Q?t8aIujOyLiyg9Xu3shLgdoKa6C1P3pAqYwYZPnSXxMjA/8nfNOSnL2so+ZPp?=
 =?us-ascii?Q?uCKty5WwZh0VBN1L3Jw8kwEsYn3Hry/DyBK6qvhQVmOzY7xlxLWN0V+kw9sL?=
 =?us-ascii?Q?dUskfAiwXdnzcwpYPvLAb21YRVoDff1JIS6XT//kbeeb3Fm3c2by/Y7S9p4U?=
 =?us-ascii?Q?frAXjQjfPmji7A6+n5T0TJoy7QNUSwzB8aEuDfO+SnnPGeHLKOR/77N1Xv7L?=
 =?us-ascii?Q?2xcDb3dS4G4IBs1UcWTsuOgN7yiB1LOjzm9qRGYGWBmmmVdHOqyuMgxG1d2Q?=
 =?us-ascii?Q?vp2e60kB5+6ReytnucygmD2JHFqnzOA8jTxPDl2vIWjc9nvmYyiG1CW1bLFJ?=
 =?us-ascii?Q?wP6ZkptlU3yLYh1Otyb8hk9aVFXonDMqcS+4eAbKjOLMT4JSs3dhvQE0wVgC?=
 =?us-ascii?Q?deVciJoSCLYuOTOanIPFTrvJoEEnaGrpktuAUibDi+BOdwPevooeiUZMbiTO?=
 =?us-ascii?Q?00XX0POAYk9b3HJU7OPK5SJgxJ0Mb8i7ucwgzo0R+G1R7IbXgxrEru5qhcw4?=
 =?us-ascii?Q?BPGHeX6737uecviAxDUU7821pnSz2dIRLqHwvUErEr21i77OJMEKT8859qfI?=
 =?us-ascii?Q?QKXg9LMI3R0PZEGe6hLDSYsD7M6ReQaDnBeU550zLwXeNcKYePCAp+Ldyyun?=
 =?us-ascii?Q?a8HOqOt2YKXEgxSNlWfA0TkVZ1Vz6STSHU5sC/rjvZm2V5mOOfnqOiJuucRD?=
 =?us-ascii?Q?8xoPwi61aaPjW9k2YeShKanCu5wIrYFSHyO2RSrBpGmPpLh5oYu0qSHq/z2o?=
 =?us-ascii?Q?lNs+0aWCn6vakfIUcf7+8NpDMCEyLvjQNHiIRJ5TlcFze6dXkq5xTXL/jIkm?=
 =?us-ascii?Q?sD/9yAG98gw2la0+mgeCqvmJB03liQ0NX8YLjWzhSDj0DpZcHUnRw0g6a6FS?=
 =?us-ascii?Q?nvits7cQQbYXxBcKpJSCGpy/QJO91BM9UjWrIAVaP/xVG/bivatvHKkgGZ59?=
 =?us-ascii?Q?2UslENSjePx38waxNgHT+4Gnm+H4g6vhGoeHzEJZrqQSEphpzsDNrG278yuK?=
 =?us-ascii?Q?UOumEe9cAle7sdjdLUFb2dIEjq1zzm6eXHObnAFw8hMiKrTDj6yo6aLccxFb?=
 =?us-ascii?Q?plYL9DMkZH+fEz/fmQUqLRe8I0His6J2zrL/WIXvh6pRpi9i6MSgmgeYRfV+?=
 =?us-ascii?Q?AVDlUjspo14+JxvdaTUxOK+y6+i6OL2uSDGWpJVA4P0AWuxDH7TPOqWS0PpS?=
 =?us-ascii?Q?eLWDiVKOgE2+U/6qe7xm/9fxXHB1sbw2thR7p2aFJS3nKG9ewl+Fe+PuVcoz?=
 =?us-ascii?Q?qd/ihSX97A8zBqgHmpAQYpR690Akm79fKR4seld4N5Oh1qKeEH8SWvf04HJR?=
 =?us-ascii?Q?/YVgBM7aJW/lH9ZY90uzA3r6tbyMVwlG1ux3MhLQP/aDzmJ6RXwEQHo9+2XE?=
 =?us-ascii?Q?Zq2YdTX62/lpB2QQYbqxxLdzcZet5VDP9uNoAJw34nITGadrFSNNKj0ODxSh?=
 =?us-ascii?Q?8+V5Mij0CBgjWAliL638SAY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7968.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ehhN5Eh8fKOf4zZdgzt5gkt3R0KEOdDx5rx06xpQNt3ryq8C1NaziS3hbS0B?=
 =?us-ascii?Q?1/Y7iq1kSh7z2gX6KMUWovFBhDdIDNWTQsDTTJxpknE+P413LFb+UOY2rfq0?=
 =?us-ascii?Q?0QzJOD/wiWQ29RKkxEgMVBNgxHdOyAUTQDDtoQMTrTAJFxQt5uZ8XcgrEeft?=
 =?us-ascii?Q?7N4S/okb9HmvC+Bf77v6qRfROt+eDOsCHJL7sPa1GQH6XtuuouuS2cuAQrdS?=
 =?us-ascii?Q?9yDAl0hCtZS5Ohq1sWTNCA8ojlYcoD4B9FGdUzFcMphEGP5P6P+0NdTZOFPo?=
 =?us-ascii?Q?3bHKNZsigbVgGJgpjFQnNvkn6LsBW9LFMuDYn1dtrMsZWKog7DlUxB2hN6hn?=
 =?us-ascii?Q?X4nVoefLq0/6yzStNHSegJ/y1DQFnTVgHrQTHvk/EGVWXV10BKPWZhhBjETc?=
 =?us-ascii?Q?eDk2EQT+h47Ztsru9Sa/7/CzJrcf35zjnZFfyQWUk4DPrbWGrlvjDNo4gVdK?=
 =?us-ascii?Q?i5aFs+fv3qjTYqLf6D+3KzQbS2jdJeL/Oj6R1hcDZebiNpxH1s+hT14RhOtR?=
 =?us-ascii?Q?XYyCuvvFkz6JN6NIenYusP0ED1Yke+2+BsRLrE6+u/RsDwuJT5459kHA6Vls?=
 =?us-ascii?Q?SFD+YnoZkewBl5vAb1esBMDMB5A8VbNPiPuaLEIXMFSUGAvesSnLeadgGk7P?=
 =?us-ascii?Q?skBXBqAfr/2INSSZzyc1mR1WooO1/4HGfcsfutKrVVy0/K/Jy0rglpsQk3AZ?=
 =?us-ascii?Q?YSml5Z2+VaV3rQ85W0puHmdyTupLp672W3A2pFifryhK0e/kmGUNEvNj0vGQ?=
 =?us-ascii?Q?Aatahdm1MMSR8nBdvDoq+DAmycBQtB53TQBk/FHY+ZOx3/mpWvkl8L3k7JyX?=
 =?us-ascii?Q?PZKsWFA6LRi5W6W9ZALLIo5TwGA3L6gFNp7Mb49xTshkgaIjcCRIQZJC4ypR?=
 =?us-ascii?Q?rRopbEdfkphVonLtNPBY7sd+zUhKg99Hl8H+LbaC9hxPbvh6GqGkpI4BV6e1?=
 =?us-ascii?Q?BSFapiU9B/1DkfJWxhtg6QVP5D3kTkx/v9VndgwJcfFK0Ju+S4SjtcTKYhN2?=
 =?us-ascii?Q?qcS/jB7cKJW+EBMevHvRe2NXqT/Zg5l3RIDco7UqoWTqJLGMbWUaIE71LKl2?=
 =?us-ascii?Q?gRuhEciMOjlMF5OJD4kWOraiLyyOBgxhZYw1DykgT08021c7zt4MIEGxvZKv?=
 =?us-ascii?Q?JzsYOyNVQp2TqMVHIUwO58aTAA8ksaXHKhjMwjjaAtG8Ay1jPNKSS9LvCYxh?=
 =?us-ascii?Q?8xnyb5TzqEFiabtK+jlIapO3p3hmjtA4L9LcpWLWIbRUQMJdmWgn5qSNbYOo?=
 =?us-ascii?Q?amQ6vcnphqiGng1y31h2B/7o9aj6oHaYnD2zQ4+hp9g3SrLGpYFyRyS9IW52?=
 =?us-ascii?Q?5SFoAZJP3iz+0FIWPpQHZPRA5WkfQlcsafX+5+7ZoVULS8SrFEJ49eSimiE4?=
 =?us-ascii?Q?qvA14KWfmZUT+O6vcupCb0F43FK1lvgFXp2GiwR/pprRaPG8pEbgaFveORcj?=
 =?us-ascii?Q?WH9O4YvJB+rIYQz4OF/86ectHCfSzCr2acfeL5GQI6Dt0QJYXS5H8H3uRuIR?=
 =?us-ascii?Q?LhIkzaV6wmnmE3Cm9A/syMkFtdvBgto4QRSYqq9y5/1mEjVu7ecg+NoNKlSR?=
 =?us-ascii?Q?NQUrIFCudwvQBzOzPdhgFllqdpLVPUHTW+nlInWlXzLXMWx1ofHJTMXgmKPM?=
 =?us-ascii?Q?ZMzov7X7SWaUaZs6j7g43eZwx1xt2sCzIQyudEo78AFBwNdmaIFobRNsfbuy?=
 =?us-ascii?Q?BM42bIz+zoSubXo01OzihDAxugdv22L1Uftut/BKbXqEhOIPmr7vCc9rhaIF?=
 =?us-ascii?Q?wA9K5OzAuGf6eI2sBO6WYO9x3nltxxM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e08112b-c4d5-4ac8-7cb4-08de5e7a9092
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7968.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:36:04.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYc7OoR7S+Rz6AJHEpg2XrAVy9kRa+FpUJ5TbuG1EloVvHY3XsXXjhajNJ0333IlORX830jj3cHdWHIfo9IPQw45nEqwdJi2t01L0k1WNAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6406
X-Proofpoint-ORIG-GUID: 1eR4iib088WfYno9cayMzxYaoSLaEg21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExOCBTYWx0ZWRfX5W2iVWqM5eEA
 aRe32uLP/WEEqgfLDmJSWAz+2dkdIypdaJoqBzCL7AfZhSBflsr0+t3hr2XDa9blFBrk/g8/ezS
 czoys/sMmhMOinAZ/kANN/bODEhYYl3pZj91OEL8RGZLRXD5j+G7ncSlAGVP7oULj630fAkovYZ
 qQsnjKtxdphQurx3yHn9awbxaGrme5H+4aLUdWrRfBUHZFWRW9eYbYhleGu+54bOZcxIrW/U/f+
 qNxSa3PoKy5u+JbGUErJP8P/wkxFodQKsuESrYCfmbNn7B3QwM9WB/1wf/It9jlLu39JHuiMEoh
 z9MnQcJmSXkNXHiHfus/tALjAlDfRM3PLeWN8dCdNNs6adkjn+8QHw6woigPp3/bB2NElXak2M4
 M0wqmAkxulYSDH9bHMMR+v15qyYDCYZgtu6OQjDhymDrKo+XVumt0NX4Hk6yqBc3NguLor6xCnm
 GiwYMFrz4/M+tW5P9kw==
X-Authority-Analysis: v=2.4 cv=Lo+fC3dc c=1 sm=1 tr=0 ts=697a1ed6 cx=c_pps
 a=A8yAwjBYovhlCeyetBcGtw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=3xY07a9VU1Mei7BdaDQA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: 1eR4iib088WfYno9cayMzxYaoSLaEg21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 14:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230099

From: "Dragomir, Daniel" <daniel.dragomir@windriver.com>

wic uses debugfs to write on ext* partitions, but debugfs can only
write to the current working directory and it cannot copy complete
directory trees. Running 'wic ls' on a copied directory show this:
    -l: Ext2 inode is not a directory

Fix this by creating a command list for debugfs (-f parameter) when
recursive parsing the host directory in order to create a similar
directory structure (mkdir) and copy files (write) on each level
into the destination directory from the wic's ext* partition.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/engine.py | 63 ++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index ce7e6c5d75..565a0db38a 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -327,29 +327,64 @@ class Disk:
                                                    path))
 
     def copy(self, src, dest):
-        """Copy partition image into wic image."""
-        pnum =  dest.part if isinstance(src, str) else src.part
+        """Copy files or directories to/from the vfat or ext* partition."""
+        pnum = dest.part if isinstance(src, str) else src.part
+        partimg = self._get_part_image(pnum)
 
         if self.partitions[pnum].fstype.startswith('ext'):
-            if isinstance(src, str):
-                cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
-                      format(os.path.dirname(dest.path), src, os.path.basename(src),
-                             self.debugfs, self._get_part_image(pnum))
-            else: # copy from wic
-                # run both dump and rdump to support both files and directory
+            if isinstance(src, str): # host to image case
+                if os.path.isdir(src):
+                    base = os.path.abspath(src)
+                    base_parent = os.path.dirname(base)
+                    cmds = []
+                    made = set()
+
+                    for root, dirs, files in os.walk(base):
+                        for fname in files:
+                            host_file = os.path.join(root, fname)
+                            rel = os.path.relpath(host_file, base_parent)
+                            dest_file = os.path.join(dest.path, rel)
+                            dest_dir = os.path.dirname(dest_file)
+
+                            # create dir structure (mkdir -p)
+                            parts = dest_dir.strip('/').split('/')
+                            cur = ''
+                            for p in parts:
+                                cur = cur + '/' + p
+                                if cur not in made:
+                                    cmds.append(f'mkdir "{cur}"')
+                                    made.add(cur)
+
+                            cmds.append(f'write "{host_file}" "{dest_file}"')
+
+                    # write script to a temp file
+                    with tempfile.NamedTemporaryFile(mode='w', delete=False,
+                                                     prefix='wic-debugfs-') as tf:
+                        for line in cmds:
+                            tf.write(line + '\n')
+                        scriptname = tf.name
+
+                    cmd = f"{self.debugfs} -w -f {scriptname} {partimg}"
+
+                else: # single file
+                    cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
+                          format(os.path.dirname(dest.path), src,
+                                 os.path.basename(src), self.debugfs, partimg)
+
+            else: # image to host case
                 cmd = "printf 'cd {}\ndump /{} {}\nrdump /{} {}\n' | {} {}".\
                       format(os.path.dirname(src.path), src.path,
-                             dest, src.path, dest, self.debugfs,
-                             self._get_part_image(pnum))
+                             dest, src.path, dest, self.debugfs, partimg)
+
         else: # fat
             if isinstance(src, str):
                 cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
-                                                  self._get_part_image(pnum),
-                                                  src, dest.path)
+                                                      partimg,
+                                                      src, dest.path)
             else:
                 cmd = "{} -i {} -snop ::{} {}".format(self.mcopy,
-                                                  self._get_part_image(pnum),
-                                                  src.path, dest)
+                                                      partimg,
+                                                      src.path, dest)
 
         exec_cmd(cmd, as_shell=True)
         self._put_part_image(pnum)
-- 
2.25.1


