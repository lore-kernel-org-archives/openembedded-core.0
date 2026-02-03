Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E81E87833
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 14:04:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17159.1770127440119683179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 06:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hDkCutmo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6494b3a7c5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Adw2I1547446
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Feb 2026 06:03:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=B4Z8xzuVmZGXrE1/xXKNPY6dYsfvIfhj9TdiatpZKN0=; b=
	hDkCutmov5KaY/tZBk4BEwKETCNO87InC9FOPPgupbfdBgDtiGP8QmFkzWSfdCRi
	QpNipy+934kyIhtdwQZzyPvnCvE/MC1Gkxh9y46NmEI1BvD9Pw6HX/VucLuYRs8E
	eXF2xiTfW21QMKBx3VvyT8l85eh0gAVU+3VifUZA6KrQ0wF/3F5jLB3EbU4Ujfs/
	hoNucJ2ceShvx7uqhL/C95zaL1DGBilD9SYmmEpVLcPOhbO4T3opxS+8CFlJUA76
	V2zrj74gIAr+pC2FKhXuQmh+A6auoCiq9KH3kL2QuteHWNXbQTpZLvTkIEa6RiT1
	hFBwihiq+C4xqBOkGRk72w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012054.outbound.protection.outlook.com [40.107.200.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c1j4gu1q5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 06:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7aljUBWD0bmQWUEvYZ1CneaKRUy3hcZ5EPmfcmSF2niTegF/bSxnyHHiZ2i1zkfVFLb6yQxGxQbWEstnJCBeJlNuRTGxJSyFtoas4CjaYFkfL/7sw47Q9QKoc0RxsM1j+cwGYjcf6t2/s14Wee5B0mQ/tgXFK0LzkSRfObnTMPRjzzI9SU21FfGx/hzW5dRwSNrJO/XWv5/BHcFZqr8DnnSjBAY6jMM7qGkZdEaI/gtiP3fpKxCoNZo7GG6tYgQiSOEiHowu1lT8niKRv2mcgGrJHWEiXbV+Pe/M9yzdkvQOf7XH4jJq8cNQ2jnyfQDEHU0G3AqnN/DyTaV1Y+Emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4Z8xzuVmZGXrE1/xXKNPY6dYsfvIfhj9TdiatpZKN0=;
 b=ja4otyhlcCqeyCaZEN6cQ1tmsN5DenGhqsONb6lNiK40oxJvgnzG7IpLDPvGq1n08HU7bDZ/IoUuifCNnq9ThZzXI2W16wtqd8cl0nmxujlteubfcIB3QKf6usxrxfHXBpg8OUjwprdtmaZKWkzPNlXuyj43ECOgDPUjMOsMWh5PCoN02tVT9Vp264lRJMzo/r6cLHL7dZDyyYngrrWyMk9SB0dszaKnrDCvFQ4gEWlPxyb6wfRzneuNiEH+Y/4mKyB3dVoWRoMfkJ/FcW7wdsvA5RAdGesLFJiAgxvNCDjNnv5iSq2y1+vWJzSgZZBeU1Q4PHomOTDwdQUIsz2qZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:03:57 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.9564.010; Tue, 3 Feb 2026
 14:03:57 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [RFC 1/4] clang-tools-extra: disable tests
Date: Tue,  3 Feb 2026 06:03:25 -0800
Message-ID: <20260203140337.1971735-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
References: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: bc43dae1-2054-4d9f-2520-08de632d12d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b83UwtIUospKQDv0J/gDiYLTQ+3JsRpwIctZCjh5OpD7P5UhDScHMjqKiS4U?=
 =?us-ascii?Q?fxNJ+Kiu3sx/YU0YYEqvFqYmU7bbtQ8w68jd0POZwNl2v9Qxi3TknMwNxFNL?=
 =?us-ascii?Q?m2uLPxU7LLtLK5YyMWvSu9gcPlt3TQyd5eZbKCYocE5klBBWBs1rjHFLqc3E?=
 =?us-ascii?Q?jlJF3rimIVJjG5GPAaB+R/sNhndcA769/pN0bO18c6mkODmTVqNLePFqSdbO?=
 =?us-ascii?Q?sqUvyvvcz8Ixe3YUQ2JwKgJmdVrgxXlhJQMdALfnjawGPqu+rRQY98V/cI47?=
 =?us-ascii?Q?znsQny1n33TVb51oIDCDMjH7mu52GVGs4abKpsnMYBMlNhhVBQ/24bQI2nw8?=
 =?us-ascii?Q?FFpDPBaW4ejD5cuDWunJm2CrxCkHQPpnd7z1bzVnVuA2J3GKE31gf5H6NmZo?=
 =?us-ascii?Q?0eShcCStvRccvxDflDb1jvAz49NY5Kx4tQQAlx6s6SGOXH5OyhvbZXqzR4Fk?=
 =?us-ascii?Q?/WK954rXhhSiUR111LpUTpwJHd2MXFiZwBfNgu52hN97w5iND6Juz1R9P9tL?=
 =?us-ascii?Q?HhVLpOEnMd1x/fiRF33wJot7C/G4f+xG+1Zg0HXLjlV3WbVZnSpuiNiZMQ6I?=
 =?us-ascii?Q?yvyocfZkORS7qnoxd990B+60rQifkdoo3zBQK7PH/3LRlhzx1ld5sBf3zPBT?=
 =?us-ascii?Q?WK4Up5bvfGSUQchMRxUr+vl4MIqHW+h+nghkz+nQyhvxnm2gvGWWiKCMIV2B?=
 =?us-ascii?Q?0lLFhV2OIPtERuqzdXr3lRhlZwMkqy1INBYgVQ1xl+vHgvSfNK8HAPJT1zqS?=
 =?us-ascii?Q?VroF162kRJngeLWcXBSwpnxvWl8MS3Gs+6Pg2gG3syzE9SxOJFr/F2g1XIx+?=
 =?us-ascii?Q?g3EOnA/gFKEnZ5rNkeYuXFlbpcs2mNSfrcwoB8MzVGxzxhs6UEfJZGOvKAI9?=
 =?us-ascii?Q?gIA+azcr+wWF4wCsrINOPMa6XshwIUzh/99iVxoEtcVrPaGAK4cBr6O3/Lhh?=
 =?us-ascii?Q?eldEoy3tc45+f0fmia5occhyl9NTeOBmKqYBMU3FPid9ctQXfb1hgiUC4AG2?=
 =?us-ascii?Q?sJ4oGgydJ5k+kVT/TFqIqRzJzezXTUni50jqp84CQDqTeSNS75y7eigbCVMU?=
 =?us-ascii?Q?ZWtSiAe6a17hvLNtlGxKbXT/qXB1Tmt/aNA3bDBo0p4zG88kTuA/bcXgmLyP?=
 =?us-ascii?Q?ZTGa99Q1u1SdUmwlDi5HkBse7GYarBp81pfMJVFBFiQShi2/mFWTuY5XkpuL?=
 =?us-ascii?Q?NlF+lPhd5CupnrbIx/Cn4DxadBBp1T3v2vMOwXvPluEGAqLgaUjIgkia0jvv?=
 =?us-ascii?Q?T8VDD52ZgiePVMML5YGdaw8dcCp+lyrnNk1v+3ZuZAanpcRY5TemQUejLHeU?=
 =?us-ascii?Q?NLdgE/kDaNAKfWD5A2qAwbPUhs9rZW1J1zAiqCdUEMM/ke0hSbYzcoBb/Xhi?=
 =?us-ascii?Q?4gq0q1bwl5Zg8X/qeKi8Ztgs+S15wMGYMRoL+/82mQRGiNIewPxfSnF6knVa?=
 =?us-ascii?Q?wjd8BSHLpo+QQrT7WdoLyGXrqFMsor8nU/WBxupjC2zWXzXmKHNo9hVsHPyK?=
 =?us-ascii?Q?G01V83Mq1TnkJALBUpK1BvYz3TFr107j+p+ZUbIOxCFpPddkR16Z6t/Il3sj?=
 =?us-ascii?Q?deVSyaIr35eBx0xyuZ12U7BzUSIJN2a0CKzLmogYR4As1VjchayLVVbqLhg5?=
 =?us-ascii?Q?tDMmMNOHAGmSDgoafTODyZ4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZCQMgTOmqSN5x6gLq/n3TDJQpzOgKEQtyIZYbehf6m+v4ZQaljFmBKuLW4ap?=
 =?us-ascii?Q?pg5dHz66yVNWCKsDzTyFFBF05Vz9JexgwjYD4iuzlYtvHu5J903Wgt5wWKv+?=
 =?us-ascii?Q?AAqI7ES1qtStsxNFQCb5+2t1rNwtU7r29F2HBMMnhZTAb9bZ1Wh7pQV8jFcU?=
 =?us-ascii?Q?InyA0JEdomDZQHAcCL9DblVZvQ1fZ9KbGhVJOvQ3fByHXGiXIdoYz6paguO7?=
 =?us-ascii?Q?JO5vKUx/2btd7J6CRoLITFEMZpmxQ4pNaVsGsUn0q/AVbCosOfZlmxgcB5H/?=
 =?us-ascii?Q?1b4cPtVu+YyJkGqxTpvPaMIsjtaRYJyAe15oX1TbdIaa23XKmDU9de2geoA2?=
 =?us-ascii?Q?2YTgMTZ4huzyaRsYSWFXgckiR58qQJenDTgF9+GfdZYE4EpbLeLj+rCsIJKI?=
 =?us-ascii?Q?EqchCi6Q1f9Thi3PXEL+ndB0Cz6VaTzuL61INtqJkvpVvRh+QezU7GBuQpti?=
 =?us-ascii?Q?NFV9JbBxyJgq+R6K952hjrq/oYPQzh8vx5StpB9j5ocuO3JsJSmD9p/frueJ?=
 =?us-ascii?Q?9Ui+MzqzSKr4f9i57YZUkIXzf2OLBSqskgGfCcRNpPHcHVcgojupQeOXhwEr?=
 =?us-ascii?Q?D01eEoOofEmHJyOy+otFdZu3+2opfMt4QJGknT6C1vViMh74Y+VyOE/5XHkC?=
 =?us-ascii?Q?hEk5NKGwWZwlpKEAfaJOm3iJ+oAvq8r9EZb4P8h2MXHQ9H+y9DMEQu0vWnMQ?=
 =?us-ascii?Q?XqUBDcwKcYTTwvzfnT1QpOVY/caaEE9Er8Vs1u0EdLajtycoZGoy6AHcnXX5?=
 =?us-ascii?Q?vUOGOnnGsstDoCx8JZnMIa4us6OiXchVDoj9yTBFvAjflkiUO5G717XC8A0Y?=
 =?us-ascii?Q?ldoPpm88dwbMDlX/U5/i96J0HFeGRRxtlsYM3KbdbAZpU8BLzxzo/gzVkq18?=
 =?us-ascii?Q?qRm62GvWP5NdgsvDjZQbLZAeBkwLK2VsfQPuPh9d72vRVzIoFbN52GIy92Ns?=
 =?us-ascii?Q?OM1xSR9JX/OBbeGHUwv/W9budQXnmGIlr7MFKGXy2PnsHXe6N1CjEepnDfrn?=
 =?us-ascii?Q?++QfSsIhI2BiC8oHzYj5tGL5zJPQq041ey39cV7vf36+zfyYEkthNy+fcv/C?=
 =?us-ascii?Q?9GYwcH+wacWLMnu81cLUte9bACvasY3/Yif0NPeN7Ql6y896GNIiX2TP/p6w?=
 =?us-ascii?Q?FZYxzlQn6adnL0F05t3UjQjog0i7YGeCV0ojIxtWZWP8vwvlrsWpBpVkqhEH?=
 =?us-ascii?Q?SHOpwUMVYDUIB7JkENCNX47JeX8PgiYLPV85KVD5B0I8Vf+NvBwmsAJWFXKm?=
 =?us-ascii?Q?kp9lxB6u+XxJD1zqfBhL0DmCCN9GgBcNsxXiLTqg5jfgl8ULROdbbZH6k7la?=
 =?us-ascii?Q?1okiQMPWu+qdVRho9NWs2NVouPkI/bZNmuU22d0XqbxvidK7oTdVEnzUiiD/?=
 =?us-ascii?Q?oPN1FIeXEmMIRNQMNswEqICXWbx/LmEVvhQX/ZLGHfBQgptA8Iw54fySyFFt?=
 =?us-ascii?Q?yh8R4Q4CwFxG0XN/SifK9VGjxsTiQ/wBSlykbySDts5MmvfJyXiCIr8ut1dp?=
 =?us-ascii?Q?W98xntGVlRgQsaUojFFfaveMLTN+KxZlr45aKtCv+E6dZnEgo92qb8bcd03H?=
 =?us-ascii?Q?sxG0q/h7w8s9MIXwno6kxoWNhIdgKwHknp9PRlu3TXMN01ybtwq2DmCROXeb?=
 =?us-ascii?Q?Wwczvd4v8/boPy8PpD2fwfd0GRlb5ybAQzcFIiLoK6bQnYJ1OvApf9MAW9dZ?=
 =?us-ascii?Q?xj2uudfYIaFqdJiSRvTp6mW0UPTVbcgranSwbgPktsWFeTmXZGXdK0veKekz?=
 =?us-ascii?Q?zh/OZi/a8uu8OUdZot3ZWmd5vGcaPS7IX9juqIzTcrfJPs/D5N+t?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc43dae1-2054-4d9f-2520-08de632d12d2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:03:57.4798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORmt6XmkecCPKP/sQYrubutjC9Fg36erSp5xR8LMPAmdpM1QI4xPV8j7w8sHCnF7X7JjpdFictXs5FpnjO/RIKAQ144lUmtHidli6ZfY2m8hlZF+KCyZ4zoCoyYSFjmz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
X-Proofpoint-ORIG-GUID: 7jfXGgxQ80dfHnr4jL32792tWeg9O1aw
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6982004f cx=c_pps
 a=tYoGMRiLV1KbapjTPXDBcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=IQOrjEw-PoaY6VFe8koA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7jfXGgxQ80dfHnr4jL32792tWeg9O1aw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDExMiBTYWx0ZWRfX7Xjopn66ibCZ
 Sw569+3ctV8eVk2n+3Lz1Lw7h4f8WvybX1Z2vxr5k58PBoXEfDobrsc2E1iHx4Las5b2EueQDon
 PHwH8bcmq+l4aSKmARVj2EGJ79PRWNwd10aGvVPOaPokMGwrAT39Jw+IbKFrJ82zq58ismmkgSf
 xNeARrFngPMOkI8g10vAaFPSWjQ4gVkVqG7rvuqsdwAjljpuiRvne3+wSJRTnRWNxs5z2khAghB
 QXWn1+mjgzMITrVCtI615G7/9bf/BHEM1dUL0XWOI0eO9yWjDg7GHIb2xrZq0L83qN/RoCzSJMP
 5/tn72NSkQQKPfRhVuiDrjKyLzC0xpTFqwY71hfPWT9g8QAnHlJ9RReFbPupLc0UHcxkkgAJ+5w
 AwAWTGXWYjNa8hYtfvqGgSKXZJBhjySJN0J3GZEadbyTurbB0NZowYRJeasssdJrhzFaa3Olgst
 m4lXoTk7ZhPMyN6SIng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 14:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230454

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
exists in LLVM's CMake project but is not visible when Clang is built
separately. To run clang tests, disable clang-tools-extra tests for now.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../0042-guard-clang-tools-extra-test.patch   | 74 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

diff --git a/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
new file mode 100644
index 0000000000..a37ab65975
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
@@ -0,0 +1,74 @@
+clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
+exists in LLVM's CMake project but is not visible when Clang is built
+separately. To run clang tests, disable clang-tools-extra tests for now.
+
+Without this patch when CLANG_INCLUDE_TESTS is ON got the following error
+
+--------------------------------------------------------------------------------
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-clang-tidy-infrastructure-header-filter-from-config-file-simple"
+|   does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+|
+| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
+|   The dependency target "llvm-bcanalyzer" of target
+|   "check-clang-extra-modularize" does not exist.
+| Call Stack (most recent call first):
+|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
+|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
+-------------------------------------------------------------------------------
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
+index 6b6f2b1..26e4c10 100644
+--- a/clang-tools-extra/CMakeLists.txt
++++ b/clang-tools-extra/CMakeLists.txt
+@@ -6,7 +6,7 @@ include(GNUInstallDirs)
+ option(CLANG_TIDY_ENABLE_STATIC_ANALYZER
+   "Include static analyzer checks in clang-tidy" ON)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   umbrella_lit_testsuite_begin(check-clang-tools)
+
+   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" OFF)
+@@ -43,7 +43,7 @@ if (CLANG_ENABLE_CLANGD)
+ endif()
+
+ # Add the common testsuite after all the tools.
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+   umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tools-extra/include-cleaner/CMakeLists.txt
+index dc147f9..4855577 100644
+--- a/clang-tools-extra/include-cleaner/CMakeLists.txt
++++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ include_directories(include)
+ add_subdirectory(lib)
+ add_subdirectory(tool)
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
+index a1e9da4..94dcb96 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -213,7 +213,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 1e70e9c64b..c5f607aa21 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -65,6 +65,7 @@ SRC_URI = "\
     file://0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
     file://0001-clang-Support-building-native-tools-when-cross-compi.patch \
     file://clang-no-tblgen.patch \
+    file://0042-guard-clang-tools-extra-test.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.49.0


