Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB58EB491F
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52109.1770919874693155480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oltVuoS0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C6j4wO253357
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=o+wpLU2QRljptvCxgpPOEfhcA6SbaNjbMf9eec1WUpE=; b=
	oltVuoS0QCKiFcblePBLCVJh0BWq9PVIbTFXCGMpPuzR7W9GhYKDV49x+jvGwVcj
	1SPAQOKVI9gXRM+pGkcbzrmgWvZYv4ae43kjbFwLSPT/xgO2H3/IEKWCsMLUhU8e
	Z81lsfw1Af5L/2z3kJmlSXoXSRdfp2HQPJCUW0qU/QvMRKDKTJBYbw1VKERPT6ee
	uzsdZXeY7WOYNm/dL8B+PV+5Vb4QBelMdZm720rK6h3HZaL7RKvWwVZ4db4GfEcz
	Gw6/25XIiqw6Eq1U1OTk+jwLppcIoB4t2bm7Lef+gxDjYbHWdGI+fMXKVylRD7Bp
	18N5GIUXBje4rCGVHKUZbw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5ef04-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:11:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SO4LAs76NhtQs9PESci1zV05Uw6SNbCR/lmnFyNAITcNGFsNZUu/lN66bvpH1BlW9A/9flxwbHpuTGbjTRHqNEHFG0yroeb9hPmPJwuzM4uOPRGm9WgpJ+G+hbOQ/5XfAGQvnzE+ovuo++eop2D9WpfkAIiAxz8dEhrHCAS/1tI4ee4JGQCvnbOWhpT6e7nZkB67ABZDuqA1LISa/t84Tgx2/x+InIixwL8R0DnRJp4riR2fneX1W+qAijKmuoU8ZWUZuuLugOzCPFTKPwo6THJ/xWpUAZfqDnFt53NIDB9/6DDtSFxhtrGWP1qCWwcVK4lXs+/y7GS472uRJvRdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+wpLU2QRljptvCxgpPOEfhcA6SbaNjbMf9eec1WUpE=;
 b=L8pwDrdr9a65/5TdSOAeRTaZ4KYt7ACKI2jN95A2+sV+xKFhS845iwfCBn/Cv/8Yma717eAAHBPZdhzGu3PbRkPtYx/0ftFLIvubXGfVErzFVIY28oj1lpVbNgra76JMaqAUfeUtfxPwFDm30K/bO2KTSnZVCudCNsK9tpRjgtkMMHkgfQrk24Xle7wIXIIEN0QOguB4xCUdWdVkOwj8NXQbhVLMu5KwDHtlI0zzdkFfngCp6/3WOro5wFslzNLjz4YV4b9kZColu3lwegvNOmxq5zs37wT9Iwx15fXxUD8Km+JduX84587xgA/r/JyPS6P0YBrztZfBOvJJy15O8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:11:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:11:08 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 07/14] kernel: Disable ccache when kernel rust support is enabled
Date: Thu, 12 Feb 2026 10:10:32 -0800
Message-ID: <20260212181039.1826154-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f872ae-c001-4339-4e41-08de6a621863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2SjSikhQ02Br+qmBsqdW1Vkb6weRs4NqUo0OIDk0RXsbGVKSCepyAQ4FsAYg?=
 =?us-ascii?Q?NOBOkzkIUiZ8YgyEOrPsQwYns3tJHCi0PME74cmNerP6qCc1H4xBHhXtJXbN?=
 =?us-ascii?Q?kkphfr8HpSEtw4RtTLZ8XD7Kv/jcrZQuSU9npnQdth2MdRFvsRiea1fv/+w6?=
 =?us-ascii?Q?RrcDS5qmRssTYoTEJyGspyTH1nFZgJUQ2bACifZt66he9lcM0vDXuj6e21m5?=
 =?us-ascii?Q?sQl5jG+5JGsRw64FZGLe1AgUgswzZU7Ryyg6AaFxKs8Iuo+cCCZaaSeEwOMf?=
 =?us-ascii?Q?Ie1ImTGPshUBPWM7T/dTfSj5dRRuJcdDVFW8RGE1quXdQEDUpHbgX9AEtNyD?=
 =?us-ascii?Q?o7D4rsOPL65n2bp/8ICJl10m5i86gB5671L6jx0px5+0AUvMvaxgv/tc2DpN?=
 =?us-ascii?Q?lBUQI2OnTo7wJfFEUU16Abuie4f1D1xsX2MsZtkNm0BsFq24tTQASqfScp7C?=
 =?us-ascii?Q?/0mEhSCEfN/iCsEspnMj/TC8yPHd48wruxNwGfcuW/Pp0JHqOmHRBHQtv3gT?=
 =?us-ascii?Q?GFNcc5mQ6mzMeyCeKC5DMtwxI9XaPZdsaUTmJ7iA5Ty1uSc1gZazeQS4ulrR?=
 =?us-ascii?Q?9iB3GURutuYW+dZM3NLh8hCljkvApMIAIxBHO7yhUupiDUQgfWYzsjN+Mp0g?=
 =?us-ascii?Q?LE5hrFx5Yrl8i8DCnOXlTgpkmO+YH6fzDLiD+3dCahUCpa6eT5aAVLd3nem5?=
 =?us-ascii?Q?id3YxBvbgXfDUUtBhq1ilQ8QtsvHHeK1fW3LRYKzBPRxfJWjb5wpoLIna95J?=
 =?us-ascii?Q?J9GJXeLe1cevOKTt64/nLMVMSCVybu349yWkipcPqUdTEWM8P/5tpMV1n1di?=
 =?us-ascii?Q?Va1Nq0bWSQWoGlTAxuPDUHPGpJrifQeGUQ6QiqhaKh4m3ZXNkN995TpCbEHK?=
 =?us-ascii?Q?fZJ33ee25KGaGkC63h40irbxCRxvvyc55MpipfSlBL8O5EimfGU0kABwDZIg?=
 =?us-ascii?Q?y8YnHPe3KiydGFIsEVscEkrTb7oJk/5Ns7fmjgFLxm8qg7i7jhUWq4ErljgO?=
 =?us-ascii?Q?Wn6lgwRnf96kJLVSVf+C+A54CeSOov3tDkPAjwhoA9nuNm4GHHszIufSgPlg?=
 =?us-ascii?Q?hxmuIl5UKU+K5NeNHyM34HnXFzPAxD2XWCB6/0XFX/c+FUGosSTeKkWWQHrC?=
 =?us-ascii?Q?xncFP8HOUqjAh4gKKT8PSPXGw+1HmIPdA5bbktasxpmKkzuyKQQX7c3/vvqZ?=
 =?us-ascii?Q?iQGdExuRnM8F9CBlgX1wxZIjbRgIdSx+Di+9xv3iEbTf6Q1Lt1hnLIgPVXqD?=
 =?us-ascii?Q?0UOqX2r9i4BqTdnTOPp+H+SnDWuEWSZ4r9gZVISlBL13p6CagtB+qUIZyc9T?=
 =?us-ascii?Q?isGM+y8ijWAmSuEP8NVJX+BqA2mDPPLkFbFcFafKMKMksTAQoOq7cKEyPutm?=
 =?us-ascii?Q?QFFHaubQphadvIzd7YI+8y5copbCQbEtGBat2wDwRlEkq+XOcztqJMJn7Jhn?=
 =?us-ascii?Q?XQArEmz8uvJgahBNm5AO1u/Q8SgzNfcQ96/sYTgAkFvZ0qcFvOA0/wpID1yu?=
 =?us-ascii?Q?A3ZziEzp6+e30JPTbNM/IoxG83pRlm5A+u0z+4A0KiyPwCq+S/l1rMc1RNRG?=
 =?us-ascii?Q?B0vGYmMGqlSxvkxASgHPpx2D2txllAK0Q6wNeDAgFjEXBBa3etGujbCP2Sk5?=
 =?us-ascii?Q?OmWEzH3/gwxtXCbzvNACQkQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jc7vWGioXNJjnkdsby+gDaMuJvG9olJgLC6kTxIWGxl3BTYCZd5kokNhP2zH?=
 =?us-ascii?Q?WLdqq+8w3T48ra+x2uJSmZdr8w+ve5I8+XIqBGS5tOUCcbt4EGhfxyksWDUe?=
 =?us-ascii?Q?RL+s1KsW6ycAPFVf+gLAIaiN3KSk3C7Jww3qhH2Eu1KwFrWDoRiqryhOEfq9?=
 =?us-ascii?Q?TaqBtpT/a3uKD80GpgKOTS+ScUjCHsVAQKc37QGQDEsf3XHjRKFZZzzSk+LS?=
 =?us-ascii?Q?fePO8efbuJYtAlGPcb5AYxa3ZcEsNxIe0BpAYFIgk2/jhcUAHSMYewOY9mSp?=
 =?us-ascii?Q?CHzONrPhG7OGOK0zZO++/2EY0JL3/YzapCDfD6Xiz0huAmrn6vBVN9lrC5bl?=
 =?us-ascii?Q?41UvVLdgmq6cTlONhrfWL8fqYZN39Z47N4h+et/oaQg0uI3rk4WkAuM5oZeR?=
 =?us-ascii?Q?zLyZgYUFmUg4FdwRgDxIT/VHUfZe4BHdu88Eu4wfTAVquJG3jppnDTf1VGX4?=
 =?us-ascii?Q?QsGLMaJQisBvCva+9X71BN1VlQnUTcJ6mFkb9EVhE2ymQe6E3n55AdJMlJxN?=
 =?us-ascii?Q?CkqcS2KwAsbXg2Hn8bPBg9VWdJB3pflaRPFuaO6yMLN7DkkFePA3qZOLRfVx?=
 =?us-ascii?Q?vQXjEPZsDON5JkmNWldIjZBUAeHzFD4pYGDJ9wPUB1kJDGa2uW+lYzxVp/rO?=
 =?us-ascii?Q?YiM3G0pKgWfUwknnN4lvcr/0ObIaTUITHYxPQmW9hI4f8uwxc/eGyXiwW/Tt?=
 =?us-ascii?Q?g7CCXlzV4CdTFXh4u/KVuSpWMUODd+qTkW9kJoNcmO8HK9jcQ2acwqrnzOSm?=
 =?us-ascii?Q?jhmjuN+xWKvgsHRpP3lpjRJ0wQqaTggoc6vNyMY+o//TYTxgsTZawiw6CPxY?=
 =?us-ascii?Q?+3/SVQkC0dkn5EoSqeT6iuW3iXJCtqvyNm83R4X9McvUkbWaGCvP46kLATim?=
 =?us-ascii?Q?O7ksfJ19rbsWk09Pd6kIHBkHaX2Pxnhrgt7UmDHZT89Zu4JCulFWxKHoOVZO?=
 =?us-ascii?Q?H4dIB2fiQe5m2Fg7rwsWiIFIjoBdPhpcB1t+yxWpTRKk6/JIZROxpzg7PwrX?=
 =?us-ascii?Q?KzrCQXfEx8mIQG/89t3SzuW+D/Z7kwZf64BBL7qGKT8NJmEm0MO45kVXaiZW?=
 =?us-ascii?Q?QNxp4dnR0HyaqcYb5MndgQzJ0+xJmtBJ682mRWyRn15VPADd6hG2Ma2VVid2?=
 =?us-ascii?Q?sld6a3eFraTzH/03EsUi10aFjOU7J2N188AeIueHfqEQ91vVGLVayK1Wgvt4?=
 =?us-ascii?Q?qq4nbuloNPvG+GqFJf92sCScfA/mtVUYnbtNlhXWas+WeidWwTiMSl16t7JO?=
 =?us-ascii?Q?fLhCGX6RFGsGN/O/nY0DGRWZCNUYT+A6mbBITEPKH94fzdQimNmOVxShgU9u?=
 =?us-ascii?Q?PdNS43UF6RFvpLjMcpuucIBUMMx2CQX/z0/xiy0SMSxZD/9VsHW8ILjbJPEO?=
 =?us-ascii?Q?l8bho3Nmq/Yqd9y23lu4EGZs1HSqMu8O3ZOWxhjGThGnzndbiaHST02FxTFU?=
 =?us-ascii?Q?xvZhVSpQkNyi981DgNFvyCa32XrlYkobNFmYdP1ypdv5SQD+GZwZ8KTLk9+T?=
 =?us-ascii?Q?OfnQxPRuxXknzGC/XrZmcrkSp3HEDz+bKO028adXLog2kSnNL1GpLVjKyu5w?=
 =?us-ascii?Q?T31O+OKON20tHUtV7v71Z5ASb//mHv2BnORwB4ZJ3Gd2sjUD5QHHLERFx8/3?=
 =?us-ascii?Q?WnSS0D/iAtjyLpv9hu5HhRTdmd5JSF7HgrxeK8xOZHLrB3zNKV1B4oBHhpF6?=
 =?us-ascii?Q?zyVFXBJoDK8FYvJcDaJabnxLVUAgVH4opMCbJyemTXuJDZn53214CVbQH77Y?=
 =?us-ascii?Q?K1FsOyDiCN6e0YD3e4ZjQx7/kDAbqjA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f872ae-c001-4339-4e41-08de6a621863
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:11:08.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Vduem2nPNcYcX6/55HkUCstyayioL9VYLKJmxnaW5MPvQ+R/TkNxfjEyDtStsH54XUv9pmDvL/eVfUj4NUGPHqOl71AoQeAnMJX6Sl78fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698e17c1 cx=c_pps
 a=oUdh5d0wO9iyjQqwpg+wBw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=iUso3aUBSlOXKDWHM7YA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfXw2sC7Fz+MwE6
 iVOflP7YYqskwchXHLRtE8nu3xNeK3MN/kCXB/T+71hi72MENLyvDB7P50xW8tI0X0yf0gGiTD9
 XLxk00khnqIUFEaMMStf7tMLaNyVF3nxY3FsT2mKB6aRQTWwkN/06ZXYSahAa65yKay7P1dKeye
 6peH7YZRl1artVVYnqaUfEQhO3KeJdlYBIefvu161OZlql7pRs70CW1VvuzxYOJEtuUtzG1N7rK
 e3DGu+WzLYSdVeKS1V63W5OCBdUr9+DOUvQH2G+ZqivRnAuSB6CSIoiUSwZPw5KA6tyi1FIjssP
 7Qm8IrDvlH0SPtS/d3tVMGMZ8UUi4c3ThYdIDnz5+2QreD0vy5jpeNWWUHtdECptI9FiayyShUW
 He5YzjwXXQmJ/3XasarIqIRFqLBFKm72lWOgwYfcVgJTz4bDI//vruo+itz0DAvT9b2VkuQTqlk
 0vGS2lDLHM2A62FE5sA==
X-Proofpoint-GUID: eY3MMMjnzLVQh36dj0yUOZoX_EYYuO28
X-Proofpoint-ORIG-GUID: obk1VPHMpZzlYf5aO9XBYmBISDtR6r_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231063

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

Linux rust build infrastructure does not currently support ccache (Opened bug[0]).

Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc
expect a path (and not a command)

Disable ccache if KERNEL_RUST_SUPPORT is 'True' for kernel and kernel module builds, including
auxiliary tooling such as make-mod-scripts.

More details in: https://lists.openembedded.org/g/openembedded-core/message/229336

[0]: https://github.com/Rust-for-Linux/linux/issues/1224

Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Alban MOIZAN <alban.moizan@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass              | 7 +++++++
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index fd9ee91c79..608ccc4609 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -16,3 +16,10 @@ do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme:append () {
         oe_runmake -C ${S} O=${B} rustavailable
 }
+
+# Linux rust build infrastructure does not currently support ccache
+# see https://github.com/Rust-for-Linux/linux/issues/1224
+# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc expect a path (and not a command)
+# More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
+# Disable ccache for kernel build if kernel rust support is enabled to workaround this.
+CCACHE_DISABLE ?= "1"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 874e16e642..6226382001 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -36,3 +36,10 @@ do_configure() {
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
+
+# Linux rust build infrastructure does not currently support ccache
+# see https://github.com/Rust-for-Linux/linux/issues/1224
+# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc expect a path (and not a command)
+# More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
+# Disable ccache for kernel build if kernel rust support is enabled to workaround this
+CCACHE_DISABLE ?= "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', '1', '0', d)}"
-- 
2.49.0


