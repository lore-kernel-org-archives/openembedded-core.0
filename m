Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B180CCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:10:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9076.1762348200667897837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zf/FTBcP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34043e1a29=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A55QQov1582991
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 05:10:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=qwabHHKmAgOaPpXu7L8pGT3y2evaFcMQ5C49tLChQZw=; b=
	Zf/FTBcP9taqrvJ//CH6u9ZnRxvbKwZzV1fuN9bLJU//oRgXIucd2qkXEYd5GkaN
	U4NxJ5q+f/YdO94ofNq6g+futeyD0VxkuzxDLlQJnivvlvQDfilAyFGw6Oq/nyGG
	xvoyTWGmqwYupbsFlWdd2l4WWz7z1bDza8TTPqDy6jMwSLPfxodBKxJ3f7DIC1Uo
	/2N/IvKnvqq46jB7QfsfJJdTGIcBc21tWHa9ZvO3oRrdniy24A7Hsvy4jUG9uRbt
	L5Jqm86pb8F/d1QCzlGxTnwFTXxsyK8jWH7Kw3w1pSYismlcDHW5ZR2wu7aIiW4x
	uFJVaz7Hz2poQks5hsGHhw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7gg0g-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 05:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW4eltjGHr4Uc7HMl27SnQGwfsg6CJHBDp7hpFyh1hpcK/1gIluscJGcF611cK6YfVb17FFQ75pOEoLc79n4dUZABjfPQ1dBj00rps38LEeRuoG02JQ8W4YcE9s5dnGLe0sG7ewae+nQBNOjsAgqUZ8muuRZi+DrLVyIXcuxfDeE1+Y2ZPWTZdLpKwKpEtIoFlLIPl8dnaapa0VFT2zM6ydSmnRVwjLTzNYtKxO1hyz4eWPRAzOZdbIV4VdRJyEKBqdTD0RjZChr4UBmaengadOpHZMxegBJ7bhE43BrBvuqRQZAfDyGxAgZqTB7H6GIIn2pCGOmjXX8KfUCFks00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwabHHKmAgOaPpXu7L8pGT3y2evaFcMQ5C49tLChQZw=;
 b=gCNu9ZhnKgDuC0SE2eRFU8N2/j1PPuTTyUXCwaJuehpGVul+ty7FOBTy8RKN+7sdyfhhejVQqfFW33jJn8Z/omnQMQZUzIVao8I+QIG17ETRb/krb2nriFi+C2ahXatMCSSM1exyQWXEV5cFjM0nvmhbfC05Qg3u27UIcV532KcF9r6cMWvVih34JmioIZBLB8tn72eY5bicj+n8p0DxKnUltkqgj2Khyb6hTdYE29XxwNwO8xl+OlUmk1g1UolJYTDsS+zIKRGo6J8pcHEyt6tjjHkgkonQx/spR7/HRzkJPsgK+jorMVFtQ7xMXy48RC/QTr9Nd1vpM+aECOljBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:09:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:09:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Subject: [PATCH RFC v2 5/8] kernel-yocto: add rust support via make rustavailable in do_kernel_configme
Date: Wed,  5 Nov 2025 05:09:39 -0800
Message-ID: <20251105130942.833204-6-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: e7916ccb-7366-46cf-4988-08de1c6c9f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sce8B9qqWmUD8Y+GqsbsNpidFZ410Iu7vxxwtscW52uViXDdGziGRQurmdQ/?=
 =?us-ascii?Q?f0n1tTb84b1HRF1AhYJof97UKiBwmxQ1Y9t+Nihk1CtT5rwlgTDo1PT92m3e?=
 =?us-ascii?Q?Ft/05aGAUaI2kOFgkHeMwU+bhysDKR82pRu5iA1PhpQBbWFA138YOQavWff4?=
 =?us-ascii?Q?Efu2yFF5Wq3mDwE1npZTypD8zqg0unQJZ2UBwxRKPb2x7LPJsKEsbAyIzV/4?=
 =?us-ascii?Q?AmMCRsQYllmXz3wSFuRkfMISXmmsYYJu+eysgAXBYFB/0HbGfOREC7iIKKdH?=
 =?us-ascii?Q?/eXZN0ki0UQNWIuqaVadWLi8GOmg5SUFgfDgRVA9vJqBhPPDLLPvkwA0MpDl?=
 =?us-ascii?Q?MniZrNiTYkJdEyFp+M1TRmoaLEKaYZbt/uRQlN2AxTpNfAKS69m/KaF01KVz?=
 =?us-ascii?Q?Gk4Op6uU0neK8z4hXfdYctsL5nu+sRP9HutRZ5U5IRnqljs9jjBpWpjmZEUO?=
 =?us-ascii?Q?ma5HFfeeP1XKQY6swxbeLvnHDgROFU15VNWmOApQxkeWjbZjyb+l97Le8zjX?=
 =?us-ascii?Q?ObUul8Fu42Ebs0ZSnZ9rZnMwZjc+kwd7hn/YtSC+P1nHZRwXX//Y6Ivw6aVK?=
 =?us-ascii?Q?tUUjkUpWmy44uiaZwmc3CowCAGY1O91KlCwQO9lrOUFm8jaKZ/7voo/QkJb7?=
 =?us-ascii?Q?lYV/5eP3V7UTSlpIQH3B50uWK/gWUo7RZZrTQi3JWS9UDYiAhpIkzHxEmmzF?=
 =?us-ascii?Q?CpjSE7AtMsYluW1+McP+WzgFeXMDyDnj4gwHoUyWpxJPYw86Z5WA6dbwgrMO?=
 =?us-ascii?Q?Mk+rnnG0LYjFBgGWOFUdxxTJ2E4Fxd2BdWLFRUvM+Z0JkLEryjcmRtl2UPev?=
 =?us-ascii?Q?+Occ8fU8IqwGrpiCtXqL2zk8uy6X0rSM9hpwJlfuIZ1zH+JLwLMEAEcUOO53?=
 =?us-ascii?Q?pz7tK1F1NcX/KyFGGiqSOh9ZukzXelvsZqDXhUqL2UWBQ5evX6p5P44Zz1se?=
 =?us-ascii?Q?ryRwaYOuRdX35TfBAZdqxiPUT04rTbsEoNmgZgZvrMretUkzw2sHENYKitSi?=
 =?us-ascii?Q?NCBxe8HP9bb69OZC67ucU4Qn/9+tNrpvBxsQJ5HAS8gq36Yn0vWI8Zyd6o9M?=
 =?us-ascii?Q?AX4qtBwEeujR1p7BOkkaafjidCma97k+k+9s6iBIhbHAeL1YyceF02g6s5ps?=
 =?us-ascii?Q?3ynCILn2gVCC17ihovkI1N+FXTNCCtz6VbHYITKk8i/7HRCbRfCeQum0fSCJ?=
 =?us-ascii?Q?bbHjrpzh+DYkDenlT0JQAe7kiJ7rVJMiVgnBEk8iwDLI7FYS7/yJvVZByq5e?=
 =?us-ascii?Q?WwuSNc5vdqznzLV0fGiANAOZZYc+18uxoLl9H5peTBeKIrYSI+Pv6fpCTeoV?=
 =?us-ascii?Q?u6Lijjl3640Ys4lkdfGR6vIIGiQ7Pd17bIWMHVnaMx/uYtaLI+CPPO14WftN?=
 =?us-ascii?Q?37dYnfNbAb7SnWsrhDLQ/Pq6Dj7+nvcV39pyjMpyuh0fEU5TR0rF9S18nRrs?=
 =?us-ascii?Q?5UKdTLb2L6ICGGHuh3Efm/8ahQoHp2l5gl6JSVriLMjYmjIxYCt+Xtc1TI0F?=
 =?us-ascii?Q?lPOU2nDdbiaK+PwHcslD5g5P/sYbDCPOeOcy?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rWNGeLwjqF1schcjCdzgzJDUGjztLn2HoTC+Y606Q61+I1TBv07e5ygY2wPO?=
 =?us-ascii?Q?URjAH146/lbMRs0vWh5VEetF91cEGFjsdLXQSLU2j3Ouup3RmJZYtQNc62mj?=
 =?us-ascii?Q?FNkjRXuLi23/g2PC4CkHt+Il+3/U9xZTAin/NAZnPCyXLFJR3Z/HheFPuBJj?=
 =?us-ascii?Q?R6f+b9+08IIlEObduy9jWxer/WhlVNDJSmGRzDSDni4zNKS2uq3Q5FVdncu6?=
 =?us-ascii?Q?+szbIt+vIUFBM14KI8VTMQYDzvsr8aPQmSZr/HNIhInqEb5bnocGsn+bc+hA?=
 =?us-ascii?Q?e+4Kko8V2TxOWMOrExJOgDxrEVF3naI5HiItV56nFswDeou98QqAzF9qnA0J?=
 =?us-ascii?Q?VVmcWQoihiwNEZUEhSaDSUr6WS4HGv2wwtrKRsFwJfqLcpyOvBl6jNWjVzDJ?=
 =?us-ascii?Q?2chAmeKE5yz2ctEHMWl+xULFRkiBJCOwT6gxaYFeO7vAJMijIVq3ub1P8Jlu?=
 =?us-ascii?Q?u5djf5NNsxoqyvu3mlr4QqQX9l38/I/Kl2+D0xqvfrAQ4v1mMEA96hI5FDok?=
 =?us-ascii?Q?e2e9YdSV17PpI/fxl9YFaCcmeb317ZCZLBy/kAMwfFZkBtBNj7S0tRYp+8d6?=
 =?us-ascii?Q?Lk3WoDltZ2oRL/pZiLVOyTqCt+B+pv8/R9jLfpr/I1iH6bSfcXyMND+0i83r?=
 =?us-ascii?Q?8OhPjiEbFeV+PQy2wxrCOnXQMV8gq9iz5mz7XaWBHuyITR2JqcGd1Rx8Gll5?=
 =?us-ascii?Q?ll6e7dLsECobla6GmlnZmLxX8Zuq7cZQkz4QmjDlBPK0QfCKsIqexydX0sDc?=
 =?us-ascii?Q?ocqbyPrT40sM3hWzoOvqVc2d3Wxgi+jOed7hbwcTGOBIgv32YScXwxCN/HrJ?=
 =?us-ascii?Q?BQaki62cNpHHGFK/y+QldDVJWsEVlZwhVtkilGygjO5vJumHKB8QQGX63mV5?=
 =?us-ascii?Q?pbgQqDKz8RobL8e+b5pOoGvk33eNyIGeJ4mRJV+sBI5vjXznjzadW+zXiTta?=
 =?us-ascii?Q?1XQnYOpqwTxYInUG5hIJWFjEXR3sX1G/LvRdEhwkT5jb62dQu95GES2q4GzH?=
 =?us-ascii?Q?5VboLJQdn24xLCqvNOctQcKdTcGhhvF26oQ6qdmjymKqa1gOiQUFftSgB1L8?=
 =?us-ascii?Q?zLb4bkFC0vCSJI7z9LN8djXhlU4F5+TpyNTcYVzF0pnsc9jP0atfpkRlb+50?=
 =?us-ascii?Q?h7K2a0RxoDBjf4p1Cq0LEH8GUPK4qsJOO4AoRaP6jt261/E2fDI8WKqhk8rS?=
 =?us-ascii?Q?uB9B2y46H8mHRAlN6ML6u8aNKnZYFotisaP0ILx3o5oGsi63aP3rKoBE+m3P?=
 =?us-ascii?Q?P4qDgkPacuSt+QbB2WqJeTF+Od+O1WoLFdN/694bbdvT8WJvqyGOeoqp+nWb?=
 =?us-ascii?Q?82SLwlGWC2n+Ucb6GwBZ9dXJW9gTA/QA61cSiFEW0NgP2cs2r3RqcT2o9yuG?=
 =?us-ascii?Q?5YZNzdaehgJnIjZUaIk109TZnV6Ghmtw+43T3fcRv+BPBV5qEpgqHALzLG95?=
 =?us-ascii?Q?Msu410Wz+dCmptIVrYuvwjEI3fCq72l71s5HIpggXGLhjFg33ba67NCybeWh?=
 =?us-ascii?Q?WOWd5wTwXB2bSDufnFKMmqSEvDl9p2b5ulEsSCc4kQOxWFs7RwYQH8d1Fk8T?=
 =?us-ascii?Q?Y0Ixm67mH+OVtRjT4QV7BMtiE0udDrvRJcKqt8Z3XTjaQpbFMQr6bHGq0ApD?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7916ccb-7366-46cf-4988-08de1c6c9f3b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:09:58.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9z6DBQNrUmOF8B/kM/raE0VxS5+6Werbdqnvcjpg+oISAalHwx00XKv/y7JPKz2YHoS4pE5vYM4JshvuTj6JS8f0JVBELdYYjuM3D3BIlF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: c1YNZ8yu4KiYWwiKJFJwCpXbQEFLolzy
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690b4ca8 cx=c_pps
 a=wodMs23R9wL6gmOfRTd43Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jcMc0Nsmbg0OvNgs5mYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bLc84sPt9WpheqsJoxsUQvk-N4cef8Na
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfX9nCzAer4bsx9
 AV2ZDURUUh9smlPSwDArdGNaNBRsInyZSvBkfnAWUt/JYL893nbk0rSR6olNuN9s639l/mGE1C3
 vPpy8+kLyCp+ZGh2J62t4Y0MAdrWCRa24Mb6uXc4cWOjTzk6fVdwOWXNupVNAPdiKSiwJ6U+VyB
 hu1iEol8w88LbtUqPJUlH5VP2Fff+yWGdEK9F1ulXbMFXtsBi1Zgipj/WCtiosW0/ZQzb6Oyomy
 uc982iHm2nAa8cgWI9YJnV0aFKkq5lH/ma2fDlZFVorQbsr/7+2fW3iXxjIhqcpg3okJ/EnfiRH
 7aCK7n+ScBFQELpUccjMDmvpDjZ4sBppeko2RjA1FigLCdZd/+wpcr4t7FhdCrI6IbKdmE5MiiX
 iuDVXZgXLGdwIgbF7ZOhwi+oZAnn4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225762

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To enable Rust integration in the Linux kernel build, this patch:

- Adds `rust-native`, `clang-native` and `bindgen-cli-native` to `do_kernel_configme[depends]`
  to ensure required tools are available for Rust support.
- Invokes `make rustavailable` inside `do_kernel_configme()` to prepare
  the kernel for building Rust-based modules or core components.

The `make rustavailable` target requires the Rust standard library sources to be
present under `${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust`, which is handled
in the `rust` recipe via shared staging.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..7a115bdffd 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,6 +463,10 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+do_kernel_configme[depends] += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                'rust-native:do_populate_sysroot \
+                                 clang-native:do_populate_sysroot \
+                                 bindgen-cli-native:do_populate_sysroot', '', d)}"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
 	do_kernel_metadata config
@@ -507,6 +511,11 @@ do_kernel_configme() {
 		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 	fi
 }
+do_kernel_configme:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+        oe_runmake -C ${S} O=${B} rustavailable
+    fi
+}
 
 addtask kernel_configme before do_configure after do_patch
 addtask config_analysis
-- 
2.49.0


