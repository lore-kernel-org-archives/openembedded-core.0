Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C1BEE0202
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:17:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64850.1767104213612670778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pCPq2/ip;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUD02gX2545569
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=; b=
	pCPq2/ipjngnLVbPKBGWipDymce4YVdiR7tAecWgaNf3CydjteZfCh2uvNrjpQcC
	YQ6uuP2Mm+IhMmzFDVjE0PK8i8OnwLBHr+JjjAIYPacIFm6MoOrgZe1RZfjc7SSE
	CkcYxSVCgkkU5v3oH2gOENO3aVMLrox1dGJEZvMRzPYC+gfE2RL7zkWuTlrznX4U
	zXKuG+yYqndokckpfz2MY6+rL+nnhXARwp2yFTUgkPtzRe5kiVYmNmisSaF070vx
	KXtC06hlXXWW9Nsrs1BDskDva2WFR9rLJBFFI0NFhA/OYZIvRafbo/3smOm6Y/wM
	f8TFUHjjULXb+T8vSm4jbw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012058.outbound.protection.outlook.com [40.107.209.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxtxtb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:16:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1Xob0KKGR1/xvg8FPgDTANh3ywsj+aLHRHmxG/J3XG1oYPING/mpoPlmtQf++UdmVDt8llOQLzmyHYtl40MIm8Nls4+yVvs5Jx+nMrousJIYDZHXZEcIRr9rRIaGDQ2q9lxBvFWdyFVECX1sTwr9wUOzkD+I2Qvk4SMbBq8qImA/VCWJwAz+C9QuMM8zbwWTRrIt9tgIyccim5VF4rt8BDlCp86jIUkSrf96PQkPTmpMwa/w3Hn+dSMciMnNpo9pwb4bGC9bneDEABq0yoa41jaRTKv60DAJyTdJz6h2Ju6EfCJz5N1CS+fWBy7WRHzrqKplunX5mlXEw63FlqQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=;
 b=cBbbUwaUD64dy1Z1japIr9KDKU2nDdEBuzC7ZM+xOAf2x5hBzK2Q5ZJ4U70e8rd/tg0v7IFNLBh7siEMSV8vaindbbxbphhXnnu39HL08N6c1ptBzRQXIALTbeyf72rhHVMzq3208x42I2Jvc8p5jGYFgNnByBfJvXnERXLbSUvMHLTmc2j8fGX6sb6EPOSFiLSR2nuOBbuEGqYQfS97XmIFdjOUXpO6pJwYfX8ix9JoWZk5CTgq7pVqR2TzxnB54qQCn3wcu954spsYixhylbZML6rv9EIq7KENsVaDsNg1A6NUMUycEmYwHImO46I1J7LFdVdoSTwG9n2o7eehgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:44 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:44 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 14/15] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Tue, 30 Dec 2025 06:15:39 -0800
Message-ID: <20251230141540.1974380-15-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 86076415-28cd-47b5-7e75-08de47ae0f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ci1wV8tOUBRPWWz7D+Xm3UMpvsMU5uVkAHff8kqppqbK44iM45qR1eAepp+4?=
 =?us-ascii?Q?MRgf4yWNdC2/GCDJiP+2hCr/rYVhq7JsQFwTvFN2kUHKLGthcW3AsIOM5UQM?=
 =?us-ascii?Q?+2OYrWcOyBCNci+FAtp4iu2ZEhq2ElWHS31Rp3pGYgmXHtEsS0Ac02Vfr3qo?=
 =?us-ascii?Q?3Iu5YNbeHahCMxrzstIT/U+WIvmD1nVT6F4aqB1Blx1mD3bRW2UXl3TZM338?=
 =?us-ascii?Q?u6m+rfQdxuDm5KeT8Ucu7Z/e4adpYRmAzitpn/dOTQqbfPlSjXo6oc57uqgw?=
 =?us-ascii?Q?AUNLb5AVHZK9eacqizmM4sGw4nB0o2aaHQ3FdLAQk7RhwlgQLWDiZjSTihO5?=
 =?us-ascii?Q?ot7zX7MraKGVS2hNyG5Pf/T5mQR9778MwLH8UDk3jwoVAli0viYX2yHyelPf?=
 =?us-ascii?Q?OWlrJt5dSpcOLBBMY/IBbniCnkYv974tZwof2GXD93m2R4nZ1gqQBapXC9dq?=
 =?us-ascii?Q?E8Cqu067HZWrslfQB1mlbi9Qu5oDPeSgLUb76/ULMZR80H4SNf0n2sm+uZHy?=
 =?us-ascii?Q?I2Ub5pbaYJcbDv8fuIKM1/i9MDr/vtieJpXSiWJVhv4np1IHNLj1lHU2x5wi?=
 =?us-ascii?Q?0BPa3lAB9RET4W6aaaQo5FDHJ27KwnYcL5AS3JZUUnGHR5qwtsKLLG3PcPfw?=
 =?us-ascii?Q?kkb1pgd47fYt3gekLPQHmWsPadQzJNXa37V32WPI4N0yiyvNUa6V9WDqJ6J6?=
 =?us-ascii?Q?4X6YUSBHhSlqMFNV8Dj7gz568PuYpXKDyyVjcpPKLDJBATZmn7HvgXs5mLk4?=
 =?us-ascii?Q?iUgltM6EkIJAB8AhftHEaOcucVDp3Pd8mXGoLatoJ+X+oEFmNJByYKytRcVN?=
 =?us-ascii?Q?uWKxU756j0VxZIqcvUwG8KNJoCK/4PuV3WXgobRCQxxR26cRrKC2wzjVOxaA?=
 =?us-ascii?Q?qxRKgUus0sJ5g8zjz+niCK65BHAviJ4usw7QMqhH/AcHXaP6hcNB9Sbfws+B?=
 =?us-ascii?Q?WWbEMvs00WP4WD0ejoAxLqvigFe5KMKrGkwwDvGEBygC9fbMG48zi+pPrdsw?=
 =?us-ascii?Q?zO5A3/gIYHA2GTawOq8GpGpD90KCGZVea8pzgBu621Srx5wJDDA8EpY4r3X4?=
 =?us-ascii?Q?sP1ZJFIo4gxQJAb4F87FUlJZqmDd81eJBBUJBSUWH1bsE7+irEs6C7cl2SZR?=
 =?us-ascii?Q?sxdc/q+PMefSATii2f4lnyq0cvfmune/0Z9YUPdzz1PGBNTtpm53k3jqh7+d?=
 =?us-ascii?Q?Zv/Kv0b3UjG61U3OAh7ifWMDz0EvTZpStKNKsqvl5Upifm7DWrMT9anFlP3P?=
 =?us-ascii?Q?YE3RT5HLg9bKfDA12vqE03ZTqE9JkiNvstLHthG3HCm3HhZ+06tsYOqmR2Rf?=
 =?us-ascii?Q?mtn3UzqRTQ6q1SHxMG7MotNbFW+9mP0UYY6YyXM/IiTgeT9VUR5UJ6wZmL/G?=
 =?us-ascii?Q?Gnx8o8vg+BMdnJ3LaVASFd3YBGrIN0TO6c3XB1iiCnZWH2q8t265knu0lw4r?=
 =?us-ascii?Q?sK94kOytNpyykwqy8VL5TnL5O0eh0iJo9aXg9HouQI0FcNn/ntqv0dlLEX0z?=
 =?us-ascii?Q?HiVLcNhc5xYEprsLI4QrDX6vVxjmIu3OhCYA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wpqBKUHPfKNc1Nb9dHb2Gig0+j+4Mk9CXxOuacqsNh0nTDztpz4oVxUivitF?=
 =?us-ascii?Q?G6pJsLqsASM+9WCcOeFCe6Kh/qAY5e5ieKMf+zF/44nyQ6obreOOivfFT9+i?=
 =?us-ascii?Q?0HVBzMoUuLZPYSnxVeMp5u/3bWAZltosrqAI4UQJft9rhNgEUXaTESbSbM8T?=
 =?us-ascii?Q?IxcGMD/bsotsjg2eAHtHblZA6ZtQdiD7M9tHb3A/aLiT22h12rLxco76OsTz?=
 =?us-ascii?Q?RqbVLJhihzM4o4Th0DiYI2sDkC8FNjjdNXyXWJLmwfpDdnJ5qWi3dyDZ321n?=
 =?us-ascii?Q?M3J9g9R+qg/UaG87jffvGQa7L7SLrZ6ia764MfbK0jSvG+KfXeSgLlj4qvpt?=
 =?us-ascii?Q?SgrUUeuToAN/vaadDW7fmR6mil1Y2jeoFr/nIne7StZ0Pks5i6yAil4e5xgN?=
 =?us-ascii?Q?HgDTyHytHvF8pZ5aOHseMDdlLTDICrMUvca9QchAmZgsxrVImMByszlNxlqD?=
 =?us-ascii?Q?npTOYzHh1/iEj5OLLVhQcck4W/2CYdAjuG0LCZgNIMXKSSJe+VW7ILZhDK3e?=
 =?us-ascii?Q?FChL+zCGFUs2aAu0INmTvGmnPrrBCnzov2466mHkDTMW1YDz11sjw9I0gsPv?=
 =?us-ascii?Q?6ZmAlll7fZUi6onPzo+jO3U6reGCTdXDaAAhD98uLXir+QMvvA4dX0wV56v2?=
 =?us-ascii?Q?2oTX/6pQ//XZxmAMbhtiarqg/i0atpAz8lvHY7Vt6UQzY0xBY5MUoj+iJaU0?=
 =?us-ascii?Q?MIv7SU10NYWbmwzIcRPGOdnG4BsJm+I1a0PVixDOUtHFzGGtH7eL31JgWf68?=
 =?us-ascii?Q?9RsnpXHcv8vaKUPAKqYQ9oCGgzv7A3eyHKXa0jMj402iZSFNyxtkztDmnJsr?=
 =?us-ascii?Q?2Ccr2nA7WgyG6CV3lDYHxmQcQbHjPwvjdfixVLdIZ5vxV4VYidzNVUx+yTqe?=
 =?us-ascii?Q?0gJJU2Jpd6tU65FpfvmO0QwJA2rj6ukRhmMF6OQR7WrCwRpc57ycDUDGxev6?=
 =?us-ascii?Q?UxbqYyPStmKmvuGnZ+Y7DgK0DQv2yof8mNaHlf2t1ULmvCWM0Tnp+c/gl4Hz?=
 =?us-ascii?Q?veAcSsOy7J3/jKTBdcmX2IkDnOJSxYoe5CDldZcVzf4yDHMm1hGm5E8SsryI?=
 =?us-ascii?Q?bqUUhJKbyGprgcnDhl7JLarESNot1F2IJV+1uFEkW92ToAUwC61+D2Rqmb+E?=
 =?us-ascii?Q?Bzs3KLgspFbgvB1K1T+hM2Ip7sw+09JmEJMnsRgm0SL878Py9JYdXDLZvqa/?=
 =?us-ascii?Q?ryeHh4DoVyYoDWsoOB7Tx+iR4mmVeXVEaDMCQ3RLcp4rtoOcpuOZI8erV1Zd?=
 =?us-ascii?Q?CHCxmIaqN6yqL2VyUfyNJyDjBUFxU8tVafpiygwKJX436WZFwYnbC6aulYO0?=
 =?us-ascii?Q?3fhY388UnIkLsOnxdS1BPZZUCZPjQjxwehJsnc45EqCuRkplLVV5FOIWI+Qm?=
 =?us-ascii?Q?xVoxQ68HxAnt1M0vjO7j8NPTwuuvnBoE9XO8Gy+Q9ZUfeDSQhVhAYIfqfxNj?=
 =?us-ascii?Q?2u7v3FSpKz+M8m/6kYp00Pdo0vDXaLqGusYaiNQX+jSa0xSm9xXq5jtVgwbA?=
 =?us-ascii?Q?9o3hFZLyGe22UfxtUiWa6bWz2hanwEA6zb3apm+U/Uxhw2CJqgAUrXBTqVAk?=
 =?us-ascii?Q?D3zYOT37vunMl0fYq9zMdjQOAU2AXQk6gsctIVP7VwL74wnhbQdo7ItHX5ll?=
 =?us-ascii?Q?cEcYJQ6KOmwDdtiow3IzaCeVioQu+sYq3s/AEcwn8qdMZIYOASHBh4a7m5Ps?=
 =?us-ascii?Q?ccXaJMRAhLLC5I8G7wRzssN2pojQ/lX+bGXadUP66hsDjg65xQhJHU2Snjty?=
 =?us-ascii?Q?XFwSfTdOM1xWjSDgfNiCJPeQ8EujoPU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86076415-28cd-47b5-7e75-08de47ae0f78
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:44.3417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OA+EfYBzR4/OlxRZWgPC2V8iZe7wK7xSg7p44tDOmb0lcV2pZThs2tPd6lyZUn5q2XS/61zj9MHPL5WCJSHAY+lSym5L4Q6htsKO/NkyR9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX+Jry9xfdPxSp
 QRWswCbpN7mEW6LzxmGxYL1mdA/ZZzEDSdC0CbKM34Uc6eIvgrMYaGSfKKtXyenLgf+4jdVUJiZ
 6chWbTxToZYj/Pk+eDXqVCsibzfpAJn1pABQxmHhZx2x8NUF+AOC9vCmz9NJn/7rihg2zWhDKok
 6LJOEttUFf6dk+vlych39ABvJPdCTkhPxsWRH7s0Xz2daVhEA5CDTMb78X/GFs9+3XRAEfQ6Ole
 CVnizG4f2SNOviSDxH2cotntMgCZLD2lI0SBmbjaz5uZYkRKnkhwZy6GTeXuYZHY3mPzrKprUGn
 8y3++17zRz3dFXBAZoorHcDHJQokqWkP9PRRlyL9/FjfcEu9qMa4tCtf0JHCF/XrhnJBzc7jtdy
 BUXXqShGoZ8TBmCsxsk9RQznRoUFjiL0/YwwzAw19s9LyFBjWIUY4T3G3T3Eb0aNYqTNbmpio1V
 ANec0hwRBrHPuUR7hDA==
X-Proofpoint-GUID: uUqERI86XRbtCkZdde4vZVBDqn0xCm4F
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=6953ded4 cx=c_pps
 a=dnat/ZFdcaejr8kp+uhwWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=dFuh8EWA25_V8OYOZC0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5a4H-Hmlo_uYqy_IjVB0tNluE9nbKI4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228680

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


