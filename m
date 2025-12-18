Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736D8D68BE7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 07:19:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36278.1766042342648134478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 23:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Kuy5IJrG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44479b5b93=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI6udQm3997628
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 23:19:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=C094ctomJ8Lyur+UfwWQ4ZI2XBHw/97GFkvirAHWSOo=; b=Kuy5IJrGwQyh
	+ZFNz0JCAxFnQ8h6C2sgbkwuVYgN8T7XXaALQ/HfzSqOgBVbQsAGy9ztSFrdlu5I
	7P3QWKkpmuEcrC+Z95Lu8tUg/gWVFRAEYMcZrfHxSPyEXzaetV4KXfe6UKJrPcpb
	Jf1HEf86ALM2HXnyuXA1X/VL8CrPxsTEaEEf2ugL0eRY7HWBB4CTXfUagFD1tlbL
	5OS6mu2UbTK1QOMM/44MT9WBYD1x33s/khmN2+jZggaNXYX2jeyFZSC83+msLW5T
	uRgm+NVSdCvCooqyLAj4pK3psSE8oTnEjyUIj/NXcksS3I8lYQfcVBQDlqZa6bx5
	6Zs3unCZcw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010037.outbound.protection.outlook.com [52.101.193.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j1m8b-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 23:19:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3yfGylw76knWElr/bSJflTRvworQeJ2LpEOFoIY3Ct86FlXKhriiMqk8yKLWoI75q+cVJNykmKNMWFdb+kWxDD66Kyv4332KbRfK9pFyL+oVCs8AAqLTtFz3xf4e3EM54bLaK40953d+eApbHEiGa4jXWffBhQm9qRHviCd8d+Y7w22stFZjhX5UA4DenftIMvZlwTpcJI+cEeGSL9+9hnJNK4XVL1qFg5rmVCz1LpeTVng2KbGjE7ub8OX3VS2NolFym4gkluMVR+5dqK0wGJyb5VcOKDH3916SERBFRIGYMmuLIdaJ+ITKz9xUuitbkX75SDRjfz76Qw3800yOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C094ctomJ8Lyur+UfwWQ4ZI2XBHw/97GFkvirAHWSOo=;
 b=FJ07F4nFOAQ8Gr1HlFmPdg3WmuMsW3fHRLYSJYdHChBTvAco/2AtsmDj9RewyStu/TEuXTPSpWAr5sfOS7wN128tWvCVRS1n+lP4J+q70gEfJZrFdeGGhKcfVfy6ncuLEnW/r5q3h5LNR7nXcgW44LU/47J9yvmP9zIRYLBbFgAjFeMfRliR1RC24pmclwklm2ai6Yj57nfk2Aok/nZQQyfWXI0OgIpqMWGHeX4SIHChLnGj8H5LriJs9vus5Ox9sNz5tVOw/6AcTzxs87GWWY+KvrLqPxswg4t/ZTmF1oXQsh/AbYB+UpNEzHB5E6z7+7PSJPbJCVOWDZuENtEAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 07:19:00 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 07:19:00 +0000
From: libo.chen.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 1/1] go: Fix CVE-2023-39323
Date: Thu, 18 Dec 2025 15:18:18 +0800
Message-Id: <20251218071818.4106098-2-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218071818.4106098-1-libo.chen.cn@windriver.com>
References: <20251218071818.4106098-1-libo.chen.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0231.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::9) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|LV3PR11MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aec7e88-5d31-4ea3-b0b3-08de3e05b734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qGa+flauwMehqm8LLz1EDdPL0BoGZHIOGYf5MfR97dbjNlPtYA2HyWJCGUOf?=
 =?us-ascii?Q?Gg4cjUeeeJb52WYxWB2E1nv6IGhdEmtUoLbKsYqyIDu7SqjbygotzbOVSRVK?=
 =?us-ascii?Q?/n8w3hIqHj5ugHkltvgAdOJCfwW8GH2B/JKdUQto8KvJDgKCTPtX7cM5hn7G?=
 =?us-ascii?Q?rKGbjvc2fRVHQfzKb8emxOInZDNYt6wjQSr7EGwJfvjfx6yhiS852N4htLgX?=
 =?us-ascii?Q?QH39oI6Fqv6i3jsTyxkM6OsEDb47i+Gc4RpSejqeqxXgW4O1fJe+27dSMdpE?=
 =?us-ascii?Q?zgebtS1VepYfGUHxQYKZPwn7wD/eO9Z8Y2mYaeA5lDxfa3NWWGUG+JuV15nT?=
 =?us-ascii?Q?bMsm5Ky10y9l+KlDIOsEGoNCsbDN/ASrwCjVb1EhymCkd2s9Y4BEJFcKW1qF?=
 =?us-ascii?Q?lkZgJQJjhlBxxDc2zKPjVSBPsbOpt4XfjKcmaj2S2EvLf6YEyjKBcGvZm+s/?=
 =?us-ascii?Q?iCCQ1BGuNP+56GjIjFAsHbzN4X0ZtgE2TcOELviuhzS6AkeMloMGPFI/6rGY?=
 =?us-ascii?Q?v97+nh8mczcCEdyi6hLsdcbiFc1lxciaUiaHvETQrQLNxUmeG76GywQNLTlS?=
 =?us-ascii?Q?OpkNgl+MpjzwvJVsj0YJIpcBj3ixAR7H23sKvun9JroHIQX9hS1FLsnSHZCf?=
 =?us-ascii?Q?SpGnAdHYeakxj7dzhY6mb1QMm+yuvwZsqTnKb4BYKpbxgOZTCRwIpTCgKdOa?=
 =?us-ascii?Q?dCBf4r7TaHnzM0gVQi80SHvDkq80/COTqaxJNNKov5P5kQSjk4f9HPlElQwc?=
 =?us-ascii?Q?HRYMGrxKkpDLSB+AEJrRgzmpOUtUwrxv2+hcduiCvI47b0jf5CDoR9xAUeXq?=
 =?us-ascii?Q?1ZWiDgvdifjBdae4PR3IqjT0pvlcFTA3OPfC0H1KbL+9bdMClXjO2768F6Xz?=
 =?us-ascii?Q?020n4OMc37idlIg7CtwDzkvNZ35Hyt8usPtnLu1K/UmEGtnkM47c5wtI8Bae?=
 =?us-ascii?Q?b5M0OSVOBuk4sfX1C6HIrVMOG88D59qhxss0fKScm3TVMwzuDEKFTvnRLdN7?=
 =?us-ascii?Q?iAEASXtEMkN5RTr8CqJHEA6ZzbtXJa7o6A0NIAY3dg7jOc6sY4iEUZGdIYhr?=
 =?us-ascii?Q?b5cdtY/npElijv0rr3WTSWePBpCRqJ63/06cvtc+IHC3WAcOW0mYmfdgVdek?=
 =?us-ascii?Q?avJfoXiNTrWwJvWx3TN0HOzvMVmyfWdYhilueMIf1EMcmit/pMlc7fuPRZlD?=
 =?us-ascii?Q?0mDqQJh5Y0dTf8OgJmnFWw8HFEvl1N9bfwTmhddr/lpGlEqJzLDVRT4W6Ek2?=
 =?us-ascii?Q?QhGW+G65wjXvfq33CBMf/COlAXBXJ0mYB7zVMxWPdpBxHNh6mww7FS5b2FCG?=
 =?us-ascii?Q?dL2+IZJXFuDIOt8xx2rKv0HLEOoxFktXFKuBGOxnFstLJHTGycA/HpACRfMw?=
 =?us-ascii?Q?PLPeAb1hVojk1Xqnc6VYxmaW7nb98byHyHlyujiRhqQ+2cy0CHvbFdbrX3GS?=
 =?us-ascii?Q?OdfKPLm4YueMLU+RaR0a1x4Ws2mCwI21kPAVjHUzaGWdi70n1LiIxg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RWY0I2FdVpsmshbvpaTMOB+2lzn/EwpFP6dbY4DfoYtik4wz6hIGryTlARTn?=
 =?us-ascii?Q?s3ouXCmHge/n3pExmtJvXWlm1zNrwZhbpTQmrrUkVRQAeEznrCTYneKf/fb4?=
 =?us-ascii?Q?MqAQrEwsmmkvQ84Mft1cklKS95sA/yWP09tFJTfJV7t0Fz5WZ9G28519dcsq?=
 =?us-ascii?Q?9JT6CkiejQd84Y6dNfbSd/PDksA0ShewSbt+3vg171EcfDu2LcKo+F/YX++o?=
 =?us-ascii?Q?uaW1j5h/8YiU2a9AS3bJoJNPNsUtm3UIr+SheEvFGjfXiab2VCfW9SyC+3HD?=
 =?us-ascii?Q?Zpa4e+QPJePcd5f/psZQ46KAb8uzGRIZ4wfqDkarBG+x1LhGAmknEGeugpvn?=
 =?us-ascii?Q?DNdQfG+4uTfjOXXe7jJlAy4t/VlCRT7zC6YDkczx58KDJ6MlYDgU1wI+zY7b?=
 =?us-ascii?Q?FhAO9dgWH+YxL4RxyPhY4wMoOPvv3Z5Ibx3tHyniMMQKhyGNknGmkKwxFpkX?=
 =?us-ascii?Q?1+7TD/ReX5yHU8q06P1TPxN0NjsxsqlwmjeUam3wx3ylMjkRKFh8Wsc6UCIw?=
 =?us-ascii?Q?/GkgtPPEOD6AeGokXv5iEn/lDW0U+RDnjlFzyDiS7Edbs5GC7FEri1FJZMZ6?=
 =?us-ascii?Q?f2UQuWYESxya0FQpVxQqNvioWOCFRSXOFhZO1nYfx1e2IJHw7kcwLpK4iWPK?=
 =?us-ascii?Q?ytUPHZ6Jo69IeSwLjHPTO9+WTg998TubE02JcK04E2CC+KnqRwfKPfAI9WLy?=
 =?us-ascii?Q?y7eIqj0+eR5N6HbUjGc8I3eKavMlriAJG+8QESWB6hHNDxj6F16WCgBDXRZ1?=
 =?us-ascii?Q?maDIFmUsv3Q+6ufe5TiJKeeW3/LCwcWdgFJfkHMlCpgafk/FSuKkXeRzTVFF?=
 =?us-ascii?Q?CVfEReoqQBPzZRCucISW9GQZcb9Q78NyVv+AZGsGxTIjUFrjxYRJfHcXak2B?=
 =?us-ascii?Q?PA2cHh3X2GFGO0TgffYbs9aSiwxmjYV7XZ9RRvn2F8xV2EeINSV1+owGCxQG?=
 =?us-ascii?Q?gvX+LPwkHgcn26H0kgQo/BS+Lo/oE8T0CUr81XZeOfqRprj7UPa62fc/rfKp?=
 =?us-ascii?Q?VWNjWR7GbGKp5Abf9oWftxpv3VQ14zdnBh/O7ArkuT+HuwyMJ0dTBqfuUQdC?=
 =?us-ascii?Q?J5hpw9rQzq+8VAHNwIz5ACqb4LNya0x1zFCRvJ0l9Qd4W8PfgYmS58ekrflB?=
 =?us-ascii?Q?TYvFgqu6a2fdLpTMInfr2ezu91J8JN/HsE/ws7w95+w3/wW4OMedtgnybdE/?=
 =?us-ascii?Q?H2oQxpBbrL1QpXhnZ37o0tlhjoolFMx6krsnbZ+Q9fav4qdaiy8lBplQXSMZ?=
 =?us-ascii?Q?3lrot+KgMayrzwYNO8wL/gs9b+vcqqVVyf8EIMGtcsIRgBkkvGqg4YNIn3ja?=
 =?us-ascii?Q?JncaCFJxM/O/pbDBpNs5lakmuzixSvf2tzo81993zJ8fyBDmzizvlL4H+V/E?=
 =?us-ascii?Q?WbYitSeuoQ4iKKeN5RtRB68Nla3ot2/nDMZPEum00iEd3j4qvLSCP68T2f5n?=
 =?us-ascii?Q?r1uleDIbCXRbedNogcUI0F+AhjHhtJXL8zmUxBgKh++y0YO1mjFezSka+pln?=
 =?us-ascii?Q?xgWALsxP3oxhT4hkYou4WpJdzb2H/3h5l2Sp5aKkFboGB0zPxqDJgA+0XcLx?=
 =?us-ascii?Q?ut/h5X4B5p5ZolZTl5W3U0LZ9V1V4mIZnjVCQj0gElvkRNiWsOObQx8WuULE?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aec7e88-5d31-4ea3-b0b3-08de3e05b734
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 07:19:00.7693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jGDYay2mmmnKMt1+Q2S+xzQ/MtUc+EO/rgV7TavGXW2EqxuS7JsHgfpU8VNUCdmI0FnAjMycjne06+yd3C4uAEkgygJtCGfw4SHZrY/d1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=6943aae6 cx=c_pps
 a=BZqtFTcsvC7LidonbSP6GA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=pM9yUfARAAAA:8 a=1XWaLZrsAAAA:8
 a=Oh2cFVv5AAAA:8 a=t7CeM3EgAAAA:8 a=yhUri8FnAAAA:8 a=pPTJ_Ht9Oaz7vfaKx1gA:9
 a=YH-7kEGJnRg4CV3apUU-:22 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=8nbOMqh3J4Vhtx036jbE:22
X-Proofpoint-GUID: MxJl9-2riXyyLVCZAC9XPxFbbVtZk6T7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1OCBTYWx0ZWRfX5IhCafHFYEFG
 PA0Uvm4CXu7Fhl12UunYgw+CYJJlnU2ha8zWtQGFeLhDRUqoOdww94pOTNte0itqtlG1jvK/kxU
 akS5cAstA2d29vuCy3Bkj1Nzp+13uU8Wn4itEpP2XSCKBVwwhFVe6ptZDJoG9kXppCeUijBZXfI
 rJe091c6+rK1+W3Jp5e7C1oK/+lPeFjY9UN8Ux+l2uWj+x/wPq3pUtfMLw1DoZ16Wc65cmUF7ZH
 mSzv3soWY0lvzvfgnNJ1RNpEC40gH3wOtjEpszXl7x/EdY3K5DOikOUqg/D+BYQcJqIvZmqevMC
 ds6JVQx4TZFnd64mzXu4tlE0cU57OxYGWszJ7nwzMf6HmRaSalr9Uc1OWAAmselA0AXe3j4XXe8
 Xj90sDPl7R8P5vAJ8E8ayqfThwcilQ==
X-Proofpoint-ORIG-GUID: MxJl9-2riXyyLVCZAC9XPxFbbVtZk6T7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 07:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228091

From: Libo Chen <libo.chen.cn@windriver.com>

Line directives ("//line") can be used to bypass the restrictions on
"//go:cgo_" directives, allowing blocked linker and compiler flags to
be passed during compilation. This can result in unexpected execution
of arbitrary code when running "go build". The line directive requires
the absolute path of the file in which the directive lives, which makes
exploiting this issue significantly more complex.

Made below changes for Go 1.17 backport:
- drop the modifications of test codes

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-39323

Upstream-patch:
https://github.com/golang/go/commit/e7c142a19d8b3944c2f1b9ab7fd94c63d8d0c555

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2023-39323.patch           | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index bb5e839950..47ef84c35a 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -73,6 +73,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-58189.patch \
            file://CVE-2025-61723.patch \
            file://CVE-2025-61724.patch \
+           file://CVE-2023-39323.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch b/meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch
new file mode 100644
index 0000000000..613c91706b
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch
@@ -0,0 +1,55 @@
+From 5e0a62c44fbaff6443bffe67911370bc0ea25f6d Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Wed, 20 Sep 2023 16:16:29 -0700
+Subject: [PATCH] cmd/compile: use absolute file name in isCgo check
+
+For #23672
+Fixes #63211
+Fixes CVE-2023-39323
+
+Change-Id: I4586a69e1b2560036afec29d53e53cf25e6c7352
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2032884
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/534158
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Ian Lance Taylor <iant@google.com>
+
+Upstream-Status: Backport
+CVE: CVE-2023-39323
+
+Reference to upstream patch:
+https://github.com/golang/go/commit/e7c142a19d8b3944c2f1b9ab7fd94c63d8d0c555
+
+Backport patch to fix CVE-2023-39323 and drop the modifications of test codes.
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/cmd/compile/internal/noder/noder.go | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/compile/internal/noder/noder.go b/src/cmd/compile/internal/noder/noder.go
+index 5fcad096c2..f35e065a31 100644
+--- a/src/cmd/compile/internal/noder/noder.go
++++ b/src/cmd/compile/internal/noder/noder.go
+@@ -1690,8 +1690,14 @@ func (p *noder) pragma(pos syntax.Pos, blankLine bool, text string, old syntax.P
+ // contain cgo directives, and for security reasons
+ // (primarily misuse of linker flags), other files are not.
+ // See golang.org/issue/23672.
++// Note that cmd/go ignores files whose names start with underscore,
++// so the only _cgo_ files we will see from cmd/go are generated by cgo.
++// It's easy to bypass this check by calling the compiler directly;
++// we only protect against uses by cmd/go.
+ func isCgoGeneratedFile(pos syntax.Pos) bool {
+-	return strings.HasPrefix(filepath.Base(filepath.Clean(fileh(pos.Base().Filename()))), "_cgo_")
++	// We need the absolute file, independent of //line directives,
++	// so we call pos.Base().Pos().Base().
++	return strings.HasPrefix(filepath.Base(filepath.Clean(fileh(pos.Base().Pos().Base().Filename()))), "_cgo_")
+ }
+ 
+ // safeArg reports whether arg is a "safe" command-line argument,
+-- 
+2.34.1
+
-- 
2.34.1


