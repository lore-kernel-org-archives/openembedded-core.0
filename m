Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC947E92704
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:34:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6597.1766835238849427897
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qNWEG2Al;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBV3uL3818973
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=; b=
	qNWEG2AlWej4xCVacBvxsDsewMtkCXqGJrw2atrlt3uSJkKQS2agJv0MpWHksiTN
	DkjiGGMTswg4GVDeSG/7IMPmv5LPHbKE/d4p4HEjoPLWhPM8mL6u0uNPjsUt1MvJ
	SoTW/jCdJpv71A7hMlxL0JFWka42wFmcbKk2nVB/vtklqtHk1+JyqI0wFdBAkZ7p
	z9M3M1ATshq+BuCTBhf/QBb63hGetqmyFQtEeXQCfh7ibI1OqjYbfupwpfvjv2Sb
	4U3NAtipj8uL/bG95p+3j1PPORD1RTrlYmnNk+2AIs1A+MULkiW8cgyrrh00sC9w
	fV1ZiHoiRfjkomNi5K6ZGg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011031.outbound.protection.outlook.com [40.93.194.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxr8mk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/kWafn8m89zx7tLrwYJ/VqPdTW6ssMqUOw9N0B6PsD9MPmGQzZmqCGi4mePVu9/1MrEQLh30n7g+8pyk6okIiX2MJubCHwfvOqyteVdvXzGxdQTsKdSFc++gB60/s18+b/F6oBmcNd8W8zoubZlQk6eZiFe0+vMSWkPQvFfy/VD4hOXsNw+t8e6+r4QX7033rT9TaOvmgotFbHuU0pAXWmtpt+Tc6PiOCoWZ9KLAWQRhp5SxB+CgptC9u1BbNvlAAU+dKQAT6UZ7lSzDFQ0jYKfWwErzchE7cHeiijmcu7g327Bm9qKHVOBw7CNxbxviD9ie2DTV7Sm6GitKpk9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=;
 b=L9rbjR3IX7nh+K26uCbWWeFs1whiCJesmgKwYEqF8SIV/FL0MyzQudN6zWbWWyOPDSg9yA+Bao//6BUT6vdV5kDf9+FQIVwriOeY3AQ1LhOJ8Xscy80PsL13V+8E22pUixcGmA5mTJfkVxtnoceWQyys09hHesOP5atsgflM9Oo5yph5GMBuYGitP5QuqrZ4aiSozT6TGXSriUZpFf/41FCsPDF2PqOhMT66b45lSiirm95j2TAoTRBugjvN40CanF0c5o3Ztf94ct4odZSZ2EQpeRkxay0c/QnEmHFifXel1z8hdjNJA/QID+jP7jQstXGfv2QuCHF19ieM4NhT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:56 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 14/16] module.bbclass: Prepare out-of-tree rust module compilation
Date: Sat, 27 Dec 2025 03:32:49 -0800
Message-ID: <20251227113251.773795-15-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: bc96d583-3fd3-4391-7254-08de453bd1d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SWYOjrwVE/OnBPZn9lrE/eMxXdDoJ62H8xC+yL7f5hZEKuW9/BPFttbu6a1B?=
 =?us-ascii?Q?ae7Ntl10wbTUzkJDLGxohwFq2XLyp3gyKZ7HzekmY3xYzm6oM2pha1Jdcw6i?=
 =?us-ascii?Q?K1lyBdcMV8s7k+jwAVgT+diitaNa9+Uh2xlkBuIuiDsIfgXBVYcK4pXdCVBQ?=
 =?us-ascii?Q?vMl6XndNNrXPqIrococ1xN+l+6NF4QikpVLsyLRrmelTySFStMZ6FxUMu6go?=
 =?us-ascii?Q?VQSUtR+k7tDcskKlsUlIXeON4EGr74XHpJ8UWjns21QOx+yVdKs0TVlY6guO?=
 =?us-ascii?Q?evNBuczN4KmDULxxP7Pp14l7WlyHHHND5vH4gvC8YKhL2JBRFiBdyVtNxqM9?=
 =?us-ascii?Q?3ziojXouQeRhZT1f/fM5+qfmifBQNER11ynlT+u0H3C9ORMLCAyLjHvrrHDo?=
 =?us-ascii?Q?/UJ2hniW4CZBkz9WqDQ+jLeYWyPmQlFJc8SM5Io/62mgjeTKNbkhE14O5V/v?=
 =?us-ascii?Q?fOMiIC2qoFQDEUKxLhv2RM7boG6jTwbpqSB6z4URjhklmF4ghWWp9iWkxACJ?=
 =?us-ascii?Q?HlG97B++TgM0UFAxqPgPjSvTJKSSHWc5kYRp5ajCNLy8Af8PV3FbH7mFYj6u?=
 =?us-ascii?Q?OIShjYAedCc/W59nXpBVCH7WXeXxLEvSw0e4UpAyIR6yBPs5j1xuExfDZZKS?=
 =?us-ascii?Q?h+SyZ2SdRldOL0E8TqxojFMitc+v6An6F2YyI0V5xhwr+Fmk7XUD7cSzVxwr?=
 =?us-ascii?Q?j4xpnLhe1XJbBCAIx+yGxCVrFmqdTiMREfGVl4JQLygocR37+HKs7JDA9Ctg?=
 =?us-ascii?Q?n4oKW70lyktE1/E7zopYY/FGbu3E+DW3YLNFt+NzJ4MxXJ9V0QxpcvXjfjlj?=
 =?us-ascii?Q?CwjYEmepPQarNK+yuKv45vVQmRoC8Y6/1oSkp5Uy4c1Mox33xqI5O2J/di3B?=
 =?us-ascii?Q?D1iyaclxptDXf2hFpiNvXrj8Z3hVNeENAryNYIRqNTdNT6Z4fGLExgysgOpK?=
 =?us-ascii?Q?w2pXZ33T63WqVec7mSdOjKkwGK26BJQVFQt6hiAPLSMkbK8CHzgEd01yoKRm?=
 =?us-ascii?Q?Gs3O+Bc1oDS+AHCQry760Wo90lIhfMtbUhfZTyr6xlFITqNkQhtEzoFChqRb?=
 =?us-ascii?Q?M269LxhL8gutIgYI6sxbanD3nyecyQLJ5h3MGetDyazrrSpE6OO1fb2Nk3Og?=
 =?us-ascii?Q?4o2qFA6hvIFl49hV7X3xNttQ/ZDs74KCa5w5uz1CO2VsWAhKKVXa8prKvV6n?=
 =?us-ascii?Q?hDaPRAD3SSw9t8puwpbYIAdMjqC4t5ObUZuLpENG9S6I8sdAM4l9v+g7CVAK?=
 =?us-ascii?Q?ttjcUOgmRtmuRH9FjleDl9JxKOD2rJvMKZxetDYlFgUiZ1NrWBTlAV8cjuod?=
 =?us-ascii?Q?hp3QKnh9dOVkDVmf/E1qZ3B8uK4kX2IHEJMA0FymsUl2MA3qtnP1OC8g0l6P?=
 =?us-ascii?Q?oAOI3OpJ2QAVkCaJOSM5K8Ob7KabaIq6VRiLLf+fJ5cS0KyCpNuH8CaKC8l3?=
 =?us-ascii?Q?GRN9mhO8YGq+AsEnP51xkRTbmUasS3+XcMAxF32EyHl3eX9RJZgtNh2gkcJi?=
 =?us-ascii?Q?7m9tEuKYKEoDZBfMv91dLapYXRdq1gDk1O22?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ssXRKyef+fDCgt/U/a1DBuj2qjjWtsyfi513kLYrjiYzdKAV/27aCCZGUN/O?=
 =?us-ascii?Q?GAeMsZIJ+eN33tI0n+nWfqj3Q/jfZZ9sDzdGyK/Ku87HJc8L7K5/F+iTzjHm?=
 =?us-ascii?Q?M9tnLgiFlsGS10Bw3INe7R0bwzMSxoqQlBt7c/8e41EJCd+H2ynsC8EqQtM7?=
 =?us-ascii?Q?I0RgJyU4K71/H0ziTJ9E21g793Pxl1wbqnT9QOOYF/krbQJ6QY/wYw7Cww4b?=
 =?us-ascii?Q?Y/tdi2vtU0bWMZDDENkd/nr/4V3YQ5NtY8JukjhrPwVbfvEM4BpDJQ7+ZLtH?=
 =?us-ascii?Q?hIYi3WBSzTSX7dW/au+oA0Z6gB6MAFqa/pq/dNqlEjHpkHhTK59wLS49q94p?=
 =?us-ascii?Q?9FiHIZ2c5SWQElxgNmyGBE6p9Hvq/Fcl8H0UiXHLUwB+Tpzy8XxcUxdKLF12?=
 =?us-ascii?Q?6F2fr+Bh7jqd+h1B3CLZtXdtJPb0BtoOZE1lwDgmMetva5yV8f5lyLK4KHnZ?=
 =?us-ascii?Q?Ogrd7F2jVK+5ChmFgC4xU30QmYe0IbX0WKsHUua6aknJsaJKZ7L+zApwSJQQ?=
 =?us-ascii?Q?/S9CjvamjvCZsRuay+kXpuk6S9wyo2DM5vsCYETwMHmH1yT/mAdzTXrba3LP?=
 =?us-ascii?Q?VIHKZfSpZfBbp2wdz8oeaPnon8eLcGn0cNZEaoI54uRvGQhEOr8V/JtOrD4k?=
 =?us-ascii?Q?Ew1lRxRYfN7pByg4uKYcLvFVf0GF2g0sQMg8Qr1lMnzxi/8sGyr1RwCHp6+O?=
 =?us-ascii?Q?kKCegXSXXYtAWQU5AkDzpuXk/th/l1xlEgzZRp5OYmx6ENp6hRsu5Ewi7m3x?=
 =?us-ascii?Q?EHH0YCv7vSYOIGIei6wQIyWS6wW03eY/M5OswWVhoagPvP8EebmLCzQmJebk?=
 =?us-ascii?Q?Q6birNcvAM/LSAJCjJmbeGDWRhN0qy9fUuCbLQtQhZ+XyPlUy5t+sM8v1UYG?=
 =?us-ascii?Q?lNpCpVOruURLlvofXrgNb5FBPeofXDSsYQ4dSrcEcpowZCUZTV+9SaVHsKFo?=
 =?us-ascii?Q?vx1grNaospkOxkT1EOHB1ZzEkba9n+g/Qx40XZlEljNfehMYvislWKQfZEhX?=
 =?us-ascii?Q?WTRE0LPk+8rCWtjGzrEyeJ7yyCK2IHZPRrVmQG5Ej6qrDLgGbNpUkfMfkLJ3?=
 =?us-ascii?Q?0e9vvohnM3UePWxxvQ1BArYmqKyjlRGDCdpUHbgf0EbNagB+MkpiOdM21FZo?=
 =?us-ascii?Q?bQ+Vg1eu6QHNrdbw3duBnPUZTY6IFPmPj0kdN/dRLtdRWNaEDCcJZf/NAhxK?=
 =?us-ascii?Q?IHGKBGjz+xLrMsaaLuz9/ig+209yCpolZ4WT13gtClt3B+4vg6YXmxs2AWef?=
 =?us-ascii?Q?TaqNPKb970OVzt8mdXc/N1xDfHgB/BrstE44Zcrz1oDjJCxrM1Rcd3AIwZR3?=
 =?us-ascii?Q?NOGdPFcOLqq14ZMKjMSHbuppJtqF7qe357k4rYOAVNcNdG/pJwhyCn3tW5Zn?=
 =?us-ascii?Q?lLskrb90VH8yc/JLTmbWHA8cTA+9V+OSvUVnx2eEvA54zBqZ5KfgMxPFO2e2?=
 =?us-ascii?Q?owKKGxrpX0hGfaKuU84UzJdYOeonqW36BVHbFtRUxm+EcaCLQWvsZf1YcgrZ?=
 =?us-ascii?Q?a+hrX98fxJIQ/IgNWI+oCPduZTESUJ0rm17klDJvEDj+8lHKdNM+9aZbVaad?=
 =?us-ascii?Q?mmAJDF8ayDYbv5ERLWKJT3OKSP2fEG0+oPHgoWN/qZBSQgQ5WrFX0RhonfxH?=
 =?us-ascii?Q?1LUe+aL1kyLUpjWrgc08BXX8Vorpsm7EPVgYcn3lrapNB6U53jkfULNgIWaf?=
 =?us-ascii?Q?1mI0hREr1l+lOnsjZsI/fBa8i/hGRC4rMUklp/f84Q6z2vaKpIVyzbJb7E2z?=
 =?us-ascii?Q?gFBtUJ9txHkg7AmP62ywPlJ7+UZ/Tp0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc96d583-3fd3-4391-7254-08de453bd1d0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:56.1438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yoIeNzVXv5vI9B3kuvv4itCCaZwzQp2DaEpiNYyMLjr5fEQmyGW+Ozzwj6CXdMVNIHhrSJg1TjQxMPW58KvpMaIGNaz5Xb4qfFv0/A3SYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX/bVwHG8tngaK
 BENr7O2qH0AG4sXWGk/aAii4Pfs1WvyYdsc8K405+kvaoIasi3UN5bQynP5HCtkuaJO/UY9Wpnx
 3MyYWMHi304xxGo/EdmngtjygCgqviuA0HAw7hZgM8wMw0Vha9iOmErePRbIeczMiogWAL0H8+t
 pixc7brC1LHa8pxHH7b+ec7c0p/A5Pxx0mGAWqnPvvcWKQwrHgFfYx3RKxrxAfjLfU7OrknNTfO
 tZlwBn0QAq1u5WdyNLAgNPzv6NLZUBM3p0Hno32zrhOfcFIz2jtbwPWwq6T+mtjpJBT14TW3h8I
 iwu/2KiC8BMifa2NLypTi653Bi6i8ZfNQug8Zdm3sS1vJH0Ueoj3A3bUJhAu7qNyqpove2nzJ3w
 0/ltbnTu9GWTIhnuPzzh3Sisa0pPoB9/WHLuRoOeR3VsMI3r/C+vFCA/4yZ+/+FMneVMenblKnZ
 DKEi6ZawEoslgtALFGQ==
X-Proofpoint-GUID: hpx6RlyhIvaYn0AzWTFveaRD5ISJPFDZ
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=694fc425 cx=c_pps
 a=Kwamffe9LshCGz4O85X6AQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=7FkU8PZzVy809Xrk7IwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4btYzCI96gNwQ2lZY5QyEnhcjBxIwrwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228568

From: Yoann Congal <yoann.congal@smile.fr>

Conditioned to the "rust-linux" DISTRO_FEATURES:
* Add dependency to rust-native
* Remap ${S} in compiled output to avoid buildpath errors

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/module.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 4948e995c5..7dbd4194d1 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -87,3 +87,11 @@ EXPORT_FUNCTIONS do_compile do_install
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES:${PN} = ""
 ALLOW_EMPTY:${PN} = "1"
+
+# Rust module support
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'rust-native', '', d)}"
+
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                             ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
-- 
2.49.0


