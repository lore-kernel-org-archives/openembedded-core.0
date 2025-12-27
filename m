Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FD7E92704
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6593.1766835219678185322
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qygldVn3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBK2T71071996
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 03:33:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Ywc68ekzT/geAq2Juo1DaBle/gz+6ClfRpHHvyeJnKw=; b=
	qygldVn3qC5w55VV34skGECJpOWggSecjk0fzJ7ukrtRysTk+xN55cT4nR3PDuNM
	Zn0h6n4+LcEoSZis96idSnEMx+38tu6EfSVcdUY8YfcFcts8obWfJp0sasSpdOvD
	oLV+aRoHmebZ8IyX3r1yC4BfHU8AugLLIARUi4MyixdcVuIVTaLgdbFftwMap5Zg
	ojzyE6XPts4o4/w2DocoWlfLgo7YBFRsrofT4UeON0BW5xxzY+0uI83b9Vbr6FnT
	4WQSxEkXUBNINfrlYOXLyl5wVuSnby6aCk263EQug1Og6/ZsJc78/jhYNiyaoPeA
	+ttW+5iV5MjMYm/BZulX7Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm202m4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 03:33:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNODKhCQdlvGUtNFAtzaEIUf+TqxLYz2Idw1QvOteHymEGNfe5BpIoOATU/UBKrgtWdK369BDHpgktf0MTRYXO8bRtXeNXd+7Ai4a47FTr1+AAtCIWC6jpDYvEj7kU4kG0U62sZXTp7/AXi7fKtwyDFA0RtHnD60964E/QjpB5GbNhctYOCUUOZkRhG8oCEAUmM4g+jFelVPsH6FL4L6Va2Jo8OpFZGFHn17MG0c56RIBXkspDWsxYhB1q0Z7guc/NZqDWbL0RFioOdwD0r54DmNOc2RGXdH/U7skEolIp2pmeOFzSbe0lUjrLx8ugJRCYy8ZQISlS9y41DZBbTF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ywc68ekzT/geAq2Juo1DaBle/gz+6ClfRpHHvyeJnKw=;
 b=AAT74z8E5+WPQ3QwTd1G3kJgQyoWOsDSQzkgnx/GAp9fyUa543cXztnOKhkxGU912VRhV9z1MvtEvgUWRPCGeQ884nxcfVzDA0ajspwX0DkaMuzELbyj75/estHdcvN3bIfKxE2GHDbnH8x7Dzd7OzpEJgD9h/nHPAyVffozvbioR1X3FxJkhCKg6t4Mg7tDw1wuE1tFM6K8dHjhAguPvMnFE8seAqwpucH46d1DaV71nAWtiAs/vQH+l0T0QfmhXw+T4DIjs0/dJr5GTEw/AU4EDkgR8sstrKKKwgLcMO1LqRPfZDPca8i4iw0wqpdQhlzTgeewR0xIQbtU09EU+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:37 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 03/16] rust: install Rust library sources for 'make rustavailable' support
Date: Sat, 27 Dec 2025 03:32:38 -0800
Message-ID: <20251227113251.773795-4-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2b5ded90-7019-4105-29f7-08de453bc6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JjZv73s0pMVXP2AJkTeXdniPD+k/35hz189qwiXdTcl+Xzh7r0ObCYltFW0z?=
 =?us-ascii?Q?xePsfwDzGpySy0B5CvncHr//s7pjTwMqyxcDmRA6xRqv9SeVBtmEJKBkSTb/?=
 =?us-ascii?Q?hcxCT4ObUDRjgDxY9wET+mLykT64IsYnJ2PLx+iXUObj6FUiEeGlHu3SCHRK?=
 =?us-ascii?Q?n21viE4CEJ1jFqNvXqkwy+6BPRLScfBWaczzhI1b8VjTa4S4buP+cRqYuqqp?=
 =?us-ascii?Q?wmlXpjBl4sgYB/+sk502Bn/rhQ8tHyORUtDywYElB2Dh1gwMnA//024F7IUv?=
 =?us-ascii?Q?KAjeGP2gE/iZto0uP+poXAioKUcd7V7K1XAt+2QmGkZyfVcbMn4wIRL3+Csw?=
 =?us-ascii?Q?WRVMbsH6bBmr4Wx6Y3chm2lyr86vRXlXeiWs3VFgcfdou6ip4QblQXP4Av/I?=
 =?us-ascii?Q?qa7Cv1bEzV7iDlc3juF2vv84w8qsBAACuDX0pU/A8w6BjolkCdlCHxUJMykK?=
 =?us-ascii?Q?5XiBK5hSge0UQAYlJGuC66ISSQ4pYH4G6+7bm0DXHQq/2oCOBe+89jmKMJi5?=
 =?us-ascii?Q?of0zy9tUsemJyzw++ZmkTe44FFhaOtVghMiYSD3HWn2sDzMjc24tr2u2LdTi?=
 =?us-ascii?Q?DY29/sN1NdA+hR2I1iJQOOkZCWBvHWUzpVl8GJkbwWBVY8hfiw5vhbukF1VN?=
 =?us-ascii?Q?5CyDqHApTkfJw7NuxRJ3J8tKBOhQOEyU/8JEJJkot2MZwomn//7Y5me8bhN8?=
 =?us-ascii?Q?I92heVg0f3bn/WjJths7pzojJYFj/D3ARsn4JLGbQtxT6d0T4+eMEbGSvx+i?=
 =?us-ascii?Q?jArI7vyDUo3ZNO5b6mmjnEYyA2Frtk95Dvw4bjr8d4InZ7DYjNqvlV+Ar9q4?=
 =?us-ascii?Q?AIXJR3hbSrpcLaeu87BvLO+zwqV4ebg/AGzAEQf/eV6LQv3Syx6zZwfVuNwf?=
 =?us-ascii?Q?clxHaX4VLgL8O7ZVTq07N6jNd2sgjjvz44wzuk8qAX1G8FtQGqzCKgbtAREP?=
 =?us-ascii?Q?fdkSJcjC8DR0O7xEJ25jSegAnwzUuUGzsrZ6b5JkRBiUgSHYQUIcYhP8gi9M?=
 =?us-ascii?Q?JQG+G+pS+ybbjSltc8DOG0+6i0Xy6bLvnRjt/+eqnU6CdRtAhc3F3bcd3Y6p?=
 =?us-ascii?Q?9rRJLTsEV4if4Q2GReMQLi57C4WjCUaphmfEDh/1AZR1wUPAG0B/icvIxHNy?=
 =?us-ascii?Q?eUmBv09F5i4ZYq2WkkWH7kAXawqdfMahQgPaNbFZi1n4loyLRZ4+xQpF7c42?=
 =?us-ascii?Q?VSy+NKM4BTeiQEBYyLi8tC2uomGKdOSE8f88/9nzDJUDO9fH/t/Ieif32YrT?=
 =?us-ascii?Q?h+QjMK1zREowU53TzNCbIXOD6yfCKIpCDtsaYOwBP3wdELXuzeaogvTxpsWb?=
 =?us-ascii?Q?lcI3+WFIFmnxYNxHMcraOedaYBxuVruG3oqsg5QSjlYHcZO+Yrx0WFQnSjHl?=
 =?us-ascii?Q?eNFprvas09phzIWDH2QHmywURQkZ7ca4T9xarLMFQhpt/3JJ3WxXO1py1zAT?=
 =?us-ascii?Q?dUkMnNYvpYo5CHUypNt3eFbgNmiXLmw+f8sqa3CH4/H7RSgg13SAUcZFqB2D?=
 =?us-ascii?Q?xPvUHW6lx+SsdFOQcodEJZYUX/Tca0u3dOxd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hQnI7m1v0mzibQUaV/Xq0fQ4cs605Rpytj5/AHHVaLyjoSHSz6QsXS+7o5dX?=
 =?us-ascii?Q?OnAYzfvc6E5D+Z8IvV4PphbV02vzjZdZeNnkhTEcyxklbHwnB9n668Ea7wq5?=
 =?us-ascii?Q?kyrKHa1h78ol3piIB88gdwV8ultbOUTurVOxkq1+e+CIK0fsk5sQJaSkKEnU?=
 =?us-ascii?Q?XYUjBZ2Aj1cWbn+QIOqm9bldGqsQaRo3YpdRb4n69ZiNxVD1RS9UShhdD9o0?=
 =?us-ascii?Q?r2UXPe2ex0G+V5J1RaovghANfmc+4E/U1/jgFiYFwnFBzroXPoJECcG9Uupg?=
 =?us-ascii?Q?PuAnB8lbBdoRzuJCSJRvdKD/STWEIUn/gB9LNd405YHS9+WO68wQCGjp/efY?=
 =?us-ascii?Q?XiPCwPrceKf9DC7BSZalRKgRXohLL0NCqo/5n/TEcaKi3C+jTwSElgxQeEbx?=
 =?us-ascii?Q?zKykCirkmyqkBCX5TwZIIpe9uS4B+0BWFvfgQyYCMjqz+FLGZYdGy6y7NeC1?=
 =?us-ascii?Q?gMF8CUGPW6Vb0FfejMwP1aa/oKkjE6LVIj+b7iOO2AN8Bd8qVcy5JjAO/QvE?=
 =?us-ascii?Q?20yLvUagtjmp+lkWzMiYHWrD2cFT4fKqTX21RIZlT/0Z88jY5hesVeA5kX/x?=
 =?us-ascii?Q?sxy2wEwTrv2i22HmNXpCisGRCjRJbXG/cVqrre6EKBOZ/N5sPbbiMIv+o9wW?=
 =?us-ascii?Q?tOKuW4O0MlfXeqjhxDIbj+BwZUlYpOfppFY0Yys3BdWlwsNFee394zFz/0+P?=
 =?us-ascii?Q?BDOEnAwEwy8doGCF1uSgcJaB5dIgRmb7AC0xFpDAGDJOiHrEqPpN/qYeopnN?=
 =?us-ascii?Q?1bA9u3V5K0FGsmbC/j1Hyatv5zyr/eY0wM8OE3DRY3Ks2uqzvolJHZY7MO02?=
 =?us-ascii?Q?3A9OfLPxAV/MG+nr/d1BFf2JdLq1LxTKwzzH6c2ou3vipNpdZYGAZIiukd77?=
 =?us-ascii?Q?yWDDh+TaCiiDSeINpkDepnB8XGhCZ6G+nUJSLoicoypKt9zl6fO4TH4uC1ki?=
 =?us-ascii?Q?tE9cySQeZ7oc/vYzQjjhzQjKp7/IZEMdO+UNUHavCyLg2PYwDGMJ4hkrS7Nb?=
 =?us-ascii?Q?dxD8VgJdS/BHrhuXnMj6nKanu+RKGaIIfK3gPs3z3bTabxVtvRheAoZRq9k2?=
 =?us-ascii?Q?pIGGKfRd3QRkATD80eLAHvIBCPLGFeN2Gwleh4egFtdZ9anvg2vvngEzsQKw?=
 =?us-ascii?Q?5XJ/EfzlmooxMSL/RPrvTlJOG5ou5sz1l2o+4/4zzLYx5K0FPiWcZgZQ5giT?=
 =?us-ascii?Q?BmSSCIAAEmGLRvruJqUNFachiOb5+DF96xAFELHhKF0bOLKG6/dBwV5aZQj0?=
 =?us-ascii?Q?sucistKTNnuGhBcPkPmc+wbHDub7vmwc3EgajuTmI/YWGDYzi1X/punwSnvL?=
 =?us-ascii?Q?yXGWIG2VUMFLWENmcHPJ/DkOj+jat/17RnqkYY6lfzVhLhqA8uKlSu1UEhnx?=
 =?us-ascii?Q?j4wkzHzwhEjRWbQLpHUPq3kQupmuRXFDxdCXWRfEjb3yRCjxJL0h6WGidRsf?=
 =?us-ascii?Q?VlmrelN+VjRljXghr/JudAJVLP5gR0zvsCA//YDkmWoZaRwqlDsmUC86dG6n?=
 =?us-ascii?Q?VEcGC6nyEvn0T+a7AkFNh3733tDPQ9PP7UbdFFPEEU4YQYQSBSb96JSndYkD?=
 =?us-ascii?Q?SoLs8M5d1AYJoq9g/oNsISgBWbiLfjZXgeEg+JEE1xS1QHFjxNXU3unCGl72?=
 =?us-ascii?Q?W/6TdUYqIulCiELvvM9IWajcm88WQmOhb4IrAQJasR81G/wyf6lnID4zQfSe?=
 =?us-ascii?Q?oeqd8Dl1MMdef3YM9lp+pzIVVuGuZSK7Cfo1s7L5MQWC5OEv9H5jtbZ6g8MW?=
 =?us-ascii?Q?DQz4VGMFxUzkiGs7jQ2QoiEDTUEAyj0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5ded90-7019-4105-29f7-08de453bc6b2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:37.4016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7d0zFuQrzLKHFEsFNbQigvvf2GTaE3yF5BFHnz3NkjuLeqQ49ePRobxn/qkKEhg9kP7+cz8tor/X8WATW2vJ07pC3NLZI91u2oZbhJSLmNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 8jm3N1z8s95JOFfS5LOzgn-4Z1LUmzXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX1dvBqyFqkGdF
 R2qDBSlyAO1p2fczpAIelBCMtjxXTKvsuGpPJnloXxiF40p3OTJFcdUPmyhfOeUV/M7Gt8NX4qS
 qPZPVkfa6J9ta7pqC0gzdaYHndeYBvUZm+kmsnuj1PgSPQkszjicDRi3GHgKBTrMTPTvFw3Aefw
 qr7JPPXOvKJTDBleaeRm2G5xEzodA97jVJOxZ/w516WLupNpB8AYZWBVTw4PNugKIKzlGUApkDT
 Ux1nesH5zIuM3JeXRg9MYc1cwJC1qAvpFje2HJu0tQveyMEtmgIrvd9dKcoNDzxyMGV6kgqrB+a
 lYddAcWg0RaQDKMG1E74z58gOanMxw3iOrW5f/AgKt/XMiRomZ2u/bx7RQmtm99vXdB7nuBkD+B
 McPVhoMhFBreyxejmmB53jMfw4Ckw6bectTehcP2NIkbyC0LNqBQo9g6oiCDz8njFf3I4Os/qFm
 V0aRl8iYoD/XW5QYFdA==
X-Proofpoint-GUID: En0aO6sojvPpZdfNzJkvb35NLC8s0dQG
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=694fc413 cx=c_pps
 a=Lj9o+5Kg1g76LDS8oSCIAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=QeMy5WPdU9dpobuweN8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228557

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
  during the snapshot setup.
- Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
  `nativesdk` class, making them available in them available in sdk

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.91.1.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb b/meta/recipes-devtools/rust/rust_1.91.1.bb
index a25f65f674..7644ecf2d2 100644
--- a/meta/recipes-devtools/rust/rust_1.91.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
@@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
         done
     fi
 }
+
+do_rust_setup_snapshot:append:class-native () {
+   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+         if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
+                mkdir -p ${TMPDIR}/work-shared/rust
+                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
+         fi
+   fi
+}
+
 addtask rust_setup_snapshot after do_unpack before do_configure
 addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
@@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+    
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
+                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+                cp -r --no-preserve=ownership  ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
+           fi
+    fi
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.49.0


