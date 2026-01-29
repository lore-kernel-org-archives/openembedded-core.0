Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53DED3F09D
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19160.1769704786331236100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nBXNm4Db;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9P26Y1728865
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:39:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=; b=
	nBXNm4DbdEuOu6hkeHQA6JZ9sEUHR+N/o+4TtPRbcV1Zi/uZQrKDVER1hfz5UW+X
	iDps7KswIhvQ01ZC6VWvn6Fz/CnStaEMZmj9T9wN1YmO4I9sG/z1RXbAFd9xkq67
	1TMhssyQ9DJNlnET+X5iwBYt4+aM3F72Qt/Zw0waAPRg6edI7zFlQjQcAyHL6wNX
	v1xbMbLhrw/WBLbTODBbROxPZAXrb0d2t1APCfp9kPcFpKHB/3GQDugizt+zaxFL
	SlKHjB46H/Co17ParUrn1fy6q5woaOMbuV4yGj89Uf71cjEUm+qB2DWrSv0sgvem
	iAmButa4mHA08ZlUNC9WUg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013025.outbound.protection.outlook.com [40.93.201.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwrgss7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 08:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAkS93VV5i7n9Mb5rqkt8cASjP6uMoHFjPlz0XgrsQWvWmkFkDqxzi+jNudxliyvb5KnQrdrqZGRD9Wr55nRC54VwtOGfRj7hFvFf40LCwKjFz/cDH9N8lFa16Vhnj91iIzpWeVR8hfqLUai2EneVwUDuaax6THJSJ9Kk5mKU6WMaeiDL48HVI8KzdqqpfDLxENaxFHIxZD2pG64NveAkqzThKX6hJaktly3BIMyeaW4zD5eYQVxuDCx0V2rSSbfkrErZi+MFYakm3IFX+uTmCS9jeDWN/TN5mho54lY7AMZpd8kSn2eo7AvDyITsuASVqwbv+tZjn8t9NlCOlFZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=;
 b=RRCPrchL/MFl2k9VEd1yUTxRQxEUbWZstnpefeEbLfImwQB3D3hW9zufsbwC4Vkmd5cs2+8sVf/EUgwy7sQ3TGzmfmvQ5FI3IJU3sbryBgcL/sv0BnWMkWetgZmJiG7n6Yl6VZzuHNSfDznSLn2MdgNfSiJGTriQcS9ykqBbLn3n3jIMeggKCFGckZa6NcYAWHvej+He7DJ6L8HO2ELYdIfmQBqNiEq5efT7ZUxRxk1z0JUWH32Z9Dqr4VSN6B5bHwYHqeDfr/veCNih8th/kweSxfrzp9Efco1qvuKJ7cIR2/xnk7Cswof8zFML3WkqohNykZjdv9P6IIXFWNBcYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 16:39:44 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:44 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 12/15] module.bbclass: Prepare out-of-tree rust module compilation
Date: Thu, 29 Jan 2026 08:39:07 -0800
Message-ID: <20260129163910.2612040-13-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f897a2-1b27-4164-c443-08de5f5501b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S7A+mZhb6EmC4g82mpgnaard3/dCieZkhv9ik4CCrG0iGX9xQPHUGB2pkUjr?=
 =?us-ascii?Q?NrH5f/Jpme0d6voP0RfcRjqvgtknnj8+/olpttbiLYGJ3ZtL+Pg/LQDn8cmK?=
 =?us-ascii?Q?mhLBqURJuELzl2hUlZkiS2/znXOGI99WLhxj5snVA0HkccNSX0N2Y43Z4MlB?=
 =?us-ascii?Q?x3zElZnYRXQf0FVi+uJo/85X8RZUHkLQ2vzysADzhzxNBgIyEpvs7zJGzCyB?=
 =?us-ascii?Q?G9wl5YKdLt3yoaLsgVQYpfdY2VBsLZZ6WD0MVAj995kiYOmXza877od783Kd?=
 =?us-ascii?Q?UpdWOA8N1FgwmQGHbAIHXWWVUI8d+SCRR+lx6U5mnQlmaePRiR+WLCTvvKmj?=
 =?us-ascii?Q?VQQptAzcQt65UoF+DFw9yKTie/TA+SxYmfgHFgrfilL4YYsPABnmancQ5gjt?=
 =?us-ascii?Q?sOsDvUWrlIQCDESJQhbQT3+Uv7JssBE7MM7eEL0QPN+EG6+KdjlDcECxq1zU?=
 =?us-ascii?Q?g14TfphKGS2ybD2WGIe1r8DlZ+RN18NnOs2LrT/POUVp3GaZU1wP1Kwbeswr?=
 =?us-ascii?Q?NSwZL8waLYJ0rtO/yQwnvtxTx+4EymZq57SXcjvC9l6mRG5/N5N3v221YhV6?=
 =?us-ascii?Q?jlPld7uslrdIUkJZnyTjskTQYFN7n7CV2OR+XyPFyPrWTVZa1nHtSCgXt/Hl?=
 =?us-ascii?Q?uawMmzIiElHy86GKShTc+/ovfYdomAtW6Ifoz6e/yyTZXhlpuiHMZfXrWP2K?=
 =?us-ascii?Q?0dFpNUm4zUSOL/RJkk5WfcCOIU3UFaXur7DWR6iUXMPJMwuxfmzpsy7utqk0?=
 =?us-ascii?Q?zT8BcRx9Hr+I+9KBAYqemGsvl5k3O0UbBwZ1dOy3yBvRbqunes7X9gz+1PEL?=
 =?us-ascii?Q?y/WpVba9L8plb8YXBXCgKn71LBMY7a+WVP2uC0OmFN43RHMGmRqhxQndFWGB?=
 =?us-ascii?Q?mrCzGkU8WugYoxkN5MDisYEIuX+GqnJigrHTfQRcl76/xp33eYmJPQJ+9V/6?=
 =?us-ascii?Q?M3gufmXS2IwY1wC6phua/KqXY6zTWRRgQqFUuxh4/ZkOc4KR9e1jPNdCiFf7?=
 =?us-ascii?Q?LwFzSKgjfStcLAn7uTA86Y/na5Ov9bfuTtNcAiVBkaZNxYQHC77wCCLpTi+o?=
 =?us-ascii?Q?UmMgxlot8ZdznlRIpAqgFQKX3PNQlbyZcHCgnTOVh9xr4KFcchgVa+CIOxH/?=
 =?us-ascii?Q?ZqEVpXeo9yAYf79R9M/OEL+U3tB26tcsf2pp8I3bv6ZyqE9ADpc32oFkAWOL?=
 =?us-ascii?Q?hTablaMHrBRhe8zwXqxdWhhAwm59xZPf6Knib62dkOxiaBjUSoAFPyujGzuK?=
 =?us-ascii?Q?UVv4JAjMfc3k8tPM9FV/DyfH6ZWiFzGKELhEUbCTL/RXspfroccBPnp4er4k?=
 =?us-ascii?Q?z5rGlL6RiJM+/vmLJ+QVtDJRqHmOitVsavIWGVRbXsi/dr/Bx6OfzNbhzx+B?=
 =?us-ascii?Q?wT97I2BDCFTVZM1JfdPh0TWQ8ioxDbMwRp0qxpENuj3Nw48VZKVW7cjtwMxl?=
 =?us-ascii?Q?M29jooW8uyP/HNL8SNxG5gCrvkABTEVBVYwAKvHQbtwj+cx8cmZOMrmG65pn?=
 =?us-ascii?Q?ftNCM93/IMp5KCSGf6UyNXYBUk3pnjdMqHw5v9D07pNBsIpNBX6UDIJM8om8?=
 =?us-ascii?Q?jdW1p3ryvGP38qfUJyZ2Ily2iyYeR3qCwqHu9FFUUMvCWK+jXnL/FdZ/ubrn?=
 =?us-ascii?Q?WVy0oG+HYR9ymJdfUOWo8+Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hEDGa/L3s5zZu1ayVmvMI0sTQBx5CpuNc/9o2Dn3IpMHheaYmbUrHWcPd/YE?=
 =?us-ascii?Q?kssKRbq9vnXr780Rb1ZnZQ98rDcyMTu12uZGnVOhNvlz0pzLNgOnLHbH8UDq?=
 =?us-ascii?Q?6dnpvU2t08ghM5JZtSS5Yf4KWrtINofPl6EK4K5nho+CREKrFRUrBCV3GZ5I?=
 =?us-ascii?Q?3B8WQsZA5FI87iUQkOnb8U6yWJy6FD2iJo32q4vOHbND46WlUHqqT5UHlPxR?=
 =?us-ascii?Q?/wC3XzaqaZJmD+LtVhFpdJ9GwZ8fCfwrssDNw4W8H5xaqX3nXbpAC+UmKJp2?=
 =?us-ascii?Q?3x8gLTSUxSyX0+R1wpm63jwFbTVsFJjsQG//2n/ttFUaai4zXs+5uztLMzaJ?=
 =?us-ascii?Q?2HhPl7NZCHUuGUmU+ELn59D7fdE2t0VDDVUnOVdnAi/I+gD61dsoOGjkjdV2?=
 =?us-ascii?Q?QYLMVpYC8pntbM0CmpYVK9srY4uZbQVpTtmSF51M9d35tfpy11vyjxaOrrNM?=
 =?us-ascii?Q?zMmH0MS1K+Xacx0FTqyf9+3COcL548ax518O3rW2ILtXusCmVFQrIDjzONx9?=
 =?us-ascii?Q?kU8BAOgxKNtmRqgCyOMi1vipYIG9d3Scy+DSBo6NhiN7M5mLqAdMV3ACOQWJ?=
 =?us-ascii?Q?4ce2gDP4KzgiLKRz/yRQ0gPCGlLOEVLMm9dgBm/v0VSm6uGw2K/gAZN6R6YQ?=
 =?us-ascii?Q?NBmzKBc86JS6V9jvnk3wNbaeiVx2srMoV3N/YyJhAztpoanyGX9c2jz6wkDp?=
 =?us-ascii?Q?8zFLRRM02UTpXA+pLF3PBrlsxvTdLmAjw91PnUVdEx2ajceWT9xg+rEXWE9Q?=
 =?us-ascii?Q?p79u7aTEtu4L2pG89GHf0yOD4EC97rg45Zfx2jgU4UJozNy3TPvvXM3DJGpi?=
 =?us-ascii?Q?jUgEY/obspQvrEn9fucYAF1VLT6nr8hvGzr9fiMupAQ4qHQOJRYTKbhZeqjH?=
 =?us-ascii?Q?RVQZAs964CRwIs+U1APJZhPivQwBpaMxGjV4FN8hl34zcjN0k0P20rGM3S/R?=
 =?us-ascii?Q?koCktyP5YIvJJCc8xk5B7MKzQ3kfWiJoduvk34A5f2htQvmFvd3VrciJmjHS?=
 =?us-ascii?Q?rG/0SnyQQdVglnrBusCZeYrt0qFaNEiEOG0FKjTZzJme4k9QwO3hMIKN2k9n?=
 =?us-ascii?Q?aw4QTCljdfIct0+sWXpJj5GH4j5EyDF8hPuGMVD+jlcozEwiFI4xpZhibtb1?=
 =?us-ascii?Q?pKSvzpYCFQwW6qloyYpHCB0TcGJ4wS3QMNZngC6W5T27MStQm0JjNiuapCE8?=
 =?us-ascii?Q?Gem4KFBHlLM6f+VXgH+ax+cuYG+vvKWhyR7/gN4z124Vys1ql9jx/dUCOUXe?=
 =?us-ascii?Q?UXeeS3l3z6xMU6JfONgvaJq6DcXn8t8vmILP6hCYpzEN0FZaWJfWDdYWvOjp?=
 =?us-ascii?Q?votOPlgDrozRdKDZPJ19Mq6UfkdM+4skwScjuvl92KmKJUCLbq8sgWZ+qc/K?=
 =?us-ascii?Q?8yvsw4tO/AGG7qH3eE+1toh4SSxizuERP5r7JGzBB81+91WORpQ32J7DV237?=
 =?us-ascii?Q?ilnLtdhOKytC2TUgKXxIxf4c6guJIugKpMymAUV1zrIEQEQGWcfwj/fbaFtm?=
 =?us-ascii?Q?lpQ8FQOcWG8WLzLCccMH5lOyszEsu6hViIZaL5YJRZLonSp1EdKTaS+x2qx4?=
 =?us-ascii?Q?BPndUP/4/4H/So16JqE5TNeb9otdu1rONe9WyvmygGmq8flJLGWF682cycFH?=
 =?us-ascii?Q?yFNR4StlQE6vvZbIEN/hRIOYtc95edLrlUHhXFriaQYO5r7IZ/ldHPBo+4X1?=
 =?us-ascii?Q?KufcSFGNXzlt0WppBXzw+qFgcwBTeoFSMqk3qyrNYJL+qpXnPy7TFFI8O57j?=
 =?us-ascii?Q?SXT/PLK+4WihRkUaPK4dA5rHLr+2GuM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f897a2-1b27-4164-c443-08de5f5501b0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:43.9855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5Hl+e7J9AphjXS5T+Aw60mXZsh5vLRDIaJTUQvgm5IxkMZ65Lj7FT05RTxht8sNQSxzigs64R/utc3EAMOGvcEJMy+LrYID7xnSZT6z2DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: PJkvcG4sZwUAXLtovvEjzJR1JoYNkg3L
X-Authority-Analysis: v=2.4 cv=KMVXzVFo c=1 sm=1 tr=0 ts=697b8d51 cx=c_pps
 a=7LdyZ4/2TJtu80KvlWUjDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=7FkU8PZzVy809Xrk7IwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX15FU30H3Ckq7
 ivhopiseBYwiVZOVdpsQZFj5UuoUUf5nNJ7C/Av+egD9G3+NRJJfcUUIT8I3YSXTemSouwAslkf
 55MZ8NpvvLOlpN4jRwgXFgN7H/ryala62T8F+IhhPmSpWtF5Dg780ZqgnyWi081Zokj2GjFFtsa
 SHU89pnXSQYSLo4C3iwDMn2Uh8iWsSIYZLsCaS3BQcyegwuY5DRk+JzvF5g2+lmVm82fDaHPC1a
 YsTOIIQVAXnKfojvth1perLr7z2+JFkMgau6JoBSkwOrfU9u2DIzTae1JJKId0g5IiN3NDYABNI
 SdlpWoIJ0fdCf3ftDjiU4tygTo4JxM4aDgBnczB/MPB+LDXLP0cIZTEqa5M3Ost4yOLMBdCHpwO
 mtQbcLRHrixF46HmHXjo9uyQOrel1dS0xWzd03+4NXcEjkgSPb7lATBnUtMKuMoAjsjYfKvLM8N
 e4m4Sv0t9V7EU77SF7w==
X-Proofpoint-GUID: lTzqH9C9a8a7f2-vLvTDu92oKvGCGjli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230153

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


