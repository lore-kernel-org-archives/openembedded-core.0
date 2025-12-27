Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AF7E8FDDB
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6591.1766835217478041169
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g4RB3KSO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBUgDJ3818619
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=; b=
	g4RB3KSOp7FXsC+QbA8OslKJbaz/utChwzyU+jPfPyjU4nMk9N4BrcMb6sGj2CGi
	bV1geSmCxYJic1Lb2fR6KRi3lMmo83vVQyPRcvYK+C9c+OJKQphCm53/ZbkzaB4Z
	255v+a9Tuk9pynpMRx2cdvT8Zioj8R1x+cFCHcCYrMdd+4welzDK+9nratK2Xzv5
	y5rMDYNE8CKzP2KeYoqdPn5EzhNBZJG5msj/Ny4yDOOH8kPcFoWCZEYGeb++a+dY
	4DzFT+iDW/vOZyZk1mVRqQP5Xdnh6LLR3UHTk/fh8ZaZGt75mZLAdTgwRwoy6T/j
	P8pQ/iUxt126jlcXN6xOqw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxr8m1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkGKqPTF1rhB7UZ8KR8ottNEzerKk+buROKrdPhojkgWzU1WEijq0GNtTrWba6hCypUP5ehYDwmAvS3JKaJuCbwr3B5Jduez/wkuNSHFEXF3R+4n9TJhj5VExJNWqpCe/xaJro/0wD0NJ3G/r9zGEGmSz9wLEYxcnH0v+UQeXbxu3yXabvozFkYijK+u5nV4t2ySjBGFfp5meTuRr5av3/7GQfCX9y+QNV/izKe1QpcY/WBIXdPBxfFLd/GkWDW3CvF7ufQx3bHZvkqRyOUCIZG8FVT0t9MjbSeqP7u1++hE/hFfD4Y801lzzVlJS2GhBu7vLn2jeBfuLEgnScgSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=;
 b=nVT4dByGCj5t4PD8jkAA4hvFnoi0MxwwnhW2hyn51/TBDdv+CxNmSB2T1L5G2yVEf1m6fX0Dy3dX4k56vgbUad6vPMgnYm3nFRRpK89yA09gpZhEIX3Fvzdn9B9FdpcyVrfa9FgmLcn8Nwq+iBbcYwWWeeg51aRXZh6IUXP16xHeX99YWhk8hGrjg2PyIbOYws9o9x7UfV904gKb2+1rnelo1NL1e9SYtSR14ffMZxCPxYuCjUeZ1HUkpsSVmwE/ViXHgP6JFpcnLVIse7+w2rTSeaP33ebh15DwX853fwNB1xazLSQjMxNPxk1Gw+SW2oyw8sAVga+Vyq8uM8jnbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:34 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:34 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 01/16] bindgen-cli: extend BBCLASSEXTEND to include nativesdk
Date: Sat, 27 Dec 2025 03:32:36 -0800
Message-ID: <20251227113251.773795-2-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8a96b6fe-3577-40bb-9977-08de453bc4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yOcXSeZbN83d9wNZgLB3EZid3L1s3Zh6FQHIfEfW+yG0/bNTPQ/C5FjExeJV?=
 =?us-ascii?Q?g/KeNzdpPwXvAqJ/eITuDO3rgU+5R4BSIeDcwdNKyVhXmXDmr/uGsfvYd5OB?=
 =?us-ascii?Q?9r0KL2aqMzPLtQhg1S8XiVYKuZHwtGjUToFdA+cLUk9LAICE2IMHxoGGIhPr?=
 =?us-ascii?Q?R4EsPR5si2urtfjpihbX2TgT091/mjBXlwkhlwIJgRa/Dec+jWNcNCUcJ+MY?=
 =?us-ascii?Q?gr/rsynjPT3HXOYBjNJUjULJ2leZyGNEQxIHduOOUeIjUgEm5EeOX66KmNYX?=
 =?us-ascii?Q?6qNfHQ2yMqIjB4Nmug6BG+BJmoHLzbf0ekNrQw5p8kV6wx3a3ejWZLjAEk0m?=
 =?us-ascii?Q?+40xevjtw6PzBc3Bh/gy/zm92SwVa3sHnPTQGQ+Q1aQ4q48/bUt/MqVpdeZS?=
 =?us-ascii?Q?/9AAlbrLhc3+Ot3V0X5XTEbhrAlfOIKTzE8Lj9gaw2d++IP2CxaHyfCFCvYr?=
 =?us-ascii?Q?vf5FjAYABUcBfktY2ZGj7GGTRrjs1HR5mHbSYnPEHUoJOmqTSlrWXTL9gRYW?=
 =?us-ascii?Q?W/F20hVal6D0VSX4cuzDLvBxZs9nCd77lool9gZeYGkSkQzmF94OlkiRuApI?=
 =?us-ascii?Q?CFv+d+LPK/bcasT2P9TDjdwfsjqrMrpK92dOvLC/OPqRbvgRkfwWCDDjELSx?=
 =?us-ascii?Q?6nLKpb+9iq7/atgHUJCEDY/kt643j2XcwyCMaHeW88wnIGl7FHGKFhI0W115?=
 =?us-ascii?Q?3Co4cZWdwyhlZYi5uF4dyFe8mKxnsmwgP9EUe3USpQy8dACsbMB66/7a5WbE?=
 =?us-ascii?Q?q4p+mZaoQCjqPR3MYVGbQOAtKmxHfjmlsOODikvgH1HZ7i0WNbolIx/Zxb1z?=
 =?us-ascii?Q?z6Xjq/N7/aW5PbBrQWdElwWBbh/SqUoeui6BiTGmKivHBZoMF5fIKusZ/0Nu?=
 =?us-ascii?Q?4Z8w3BSyp15zkIJTOYifU6tO1eNX2YL/R+WXviBPTdzfMcGdmzYzdROQF+h7?=
 =?us-ascii?Q?YNaYdDfmxhojuLqmwJxnaT1GBoUvSw/mvD0pawKgdwY6VX5HmrJ7yqx3fyGv?=
 =?us-ascii?Q?OYwWhCkDDNehIUf5EjamCc9ZbX3uVlGRsFsc98AiHqkZu63XeYs/ZIzqPJPd?=
 =?us-ascii?Q?gFvtsEatphtSLI5JWRbDEXU7Ft3gZtYHRsJGvBZCYFxffshnpEKyt8qpQRdV?=
 =?us-ascii?Q?ZLXIy3LZtw0dKy+9AYHWG3J36Smj7BgGB7Js7I/256Dh6HZjF1Opb81GpVcr?=
 =?us-ascii?Q?nqIofwd2X1Fr1562cNSCs5MiVSPXmepOJYlp4pqWlsjX8lvNhu08t0IjUyXB?=
 =?us-ascii?Q?SNLV9OD/lzXBdjy+Ec3nssNCcL/GR2tQmlK+brSUpq1cBD4SQ80RCSzIRfQW?=
 =?us-ascii?Q?SHAVOO4XKMAKX5Vn9Q0VpBU9VQj3nO7Gw1EtDAqVr6QR2QztIR6e3pNaGQ58?=
 =?us-ascii?Q?7cK5uXxV+G2kjuILgTI2NsWHL6/m8Nrp+/MkIpUX5v982FK4IxFGsnFd/KH7?=
 =?us-ascii?Q?z0XzrGenwbD661gMy8TCqNdbhIHROoTBNwmaWE1MZ8/FpYPIphzqC5ddnCg2?=
 =?us-ascii?Q?hKh4Vm4kyeUufvBBNKVPSif71kYYCSmb7XH6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BaOXDWridII002tXypAr6LDsstUKZ9wSOes20bNEqoNwEBPFv5xQxXC7GqJf?=
 =?us-ascii?Q?ACAX66Zcy6F2XHVytgjIBf/vmLpsijmF7Ike/w4wb8BIEdD1ugCEvPOLjxXE?=
 =?us-ascii?Q?xduAmZ5xvzJdwxRhXLtHzbHUfk1YT4JRnRW6az6xHRN6hXk72zv98Lw4P2YM?=
 =?us-ascii?Q?vXwtZGr7YYe0oz9+49Uq2asPINjsnYTxFciXaWGtWsbxMzjAoOzHDQjU7USI?=
 =?us-ascii?Q?B7GEORaFzvZrACi9HPtLK1MrP/nQpNrlxeFAlkajE5dTl4C7HA69/LUtl5Q3?=
 =?us-ascii?Q?BOAAqGqveGt8GJtyLCBS0GSAPLDhnxgUWy/tn93q3nhWQHDBxVEML0+RRYDW?=
 =?us-ascii?Q?GAEaPgehN9y3WZwQpvkQB6ROreMh9caREgv6IzIxrFObZSzOpQHThhgAayaP?=
 =?us-ascii?Q?NSzbllicw61TnJk9jSGwGUeTp7fmtAr08Ty84qs1BgPU0+w8Rwre8R7hxNpE?=
 =?us-ascii?Q?4qhpJtaMzyVQkXpvYjYp/WVxMEvXvXPF+otuxFCoG64jQ8CRol9lVNhbUrRG?=
 =?us-ascii?Q?5NrKq3Xjc3uEYPOHyl/pf4aQ+yTom9a8hkj0UOX3J3zwzDzA+6aZ8Yk2NsOb?=
 =?us-ascii?Q?F9qS2s0w2Y4RcUHk+hdDCUzYXxbrw2s0I6PTxxIVQPDjnA2oGgb1uPc1VIhI?=
 =?us-ascii?Q?zkB9Pglspkhljqt/6gOjLXHya3oP0qcbprL4W4jZgqsLP4DeVddoXFKrlf4x?=
 =?us-ascii?Q?BXM855gU89Feqva2BdR5PZ8NIVJFNKJerEnJgjzwBnne7OBYSpwxyb1rQP2e?=
 =?us-ascii?Q?Q9DsdQepQYD6/qAUMDBPGhBWvH/inCpxbcG+Z7f03XImiLGrfMmoCTJrorHD?=
 =?us-ascii?Q?XVOb2nVTSJ86q23INoD7KPIu5q6tjW127/Xbo//A50IZaLjNe9XTv61h6zHi?=
 =?us-ascii?Q?rhu7GfFh7J7QjmxG5Ad9nbPrPS1t40nJs8wZfQUM2bb/1PSoc0gHU5G+mNOs?=
 =?us-ascii?Q?fVJdl4ObdAx6I1SEY2T3wVoId94DbbuxIl0ivHK5No/UH7QSDZiPgUaiSJTo?=
 =?us-ascii?Q?/qGaRS1X2lien9BjEAlbjXAvDyzOr1Z4ybGaIPeyULA2FRleA6aPvrodtMyF?=
 =?us-ascii?Q?p02+dbwEUpgk7huAk3gT7r74SGgVj9IEbmLnTAK09ZolNIKBF12hL1WBnc6a?=
 =?us-ascii?Q?d5SJPurWWbY8NOrmCXldOdLNAwWe8IMhLOQvZ7wnRmNalsDy+BfrWWBlGnnP?=
 =?us-ascii?Q?Imldr55irJvcems8vIp4fe3rUdk4+rsrdOj+s1gh+KUxM3m4dEjdAMVFqlFW?=
 =?us-ascii?Q?XO8kNqe0WYKYuOuEYnakUh0CpERGxrfcbIs0Qu6APxdtkhyyLfcDhYfH0BnD?=
 =?us-ascii?Q?Z7Wm6uaKqYQbYc1a15+HQgR11trlNueaLOcD7W466Nv2b1C3sMDl70oLEKBG?=
 =?us-ascii?Q?+HBQY5ElgVECiXsANVYscNs3eVMdLx25FRAw/sDqhNiMgOQFUIiwY39jhfDe?=
 =?us-ascii?Q?FIWpfQk2XcLppwY1+ZsplbnN9zwXqyf4Uiz/VGkcu/uOGpYEmQYu+M2qlK7u?=
 =?us-ascii?Q?5JOyoSdRy4DxG6QsphFgFqtOVeGzh5bUvRleqg6i221iLdOESi2QmkGINXNX?=
 =?us-ascii?Q?ebiTtw2EQAM9mjUZUlExehr58p32Bcud28bSkaBfa1ELG9+1bqjC/q9S56Mp?=
 =?us-ascii?Q?NDeQYk59SfJe3i6THqZ/M9heX8tPUF28JtCrb4Ufd0oqub1OZ1+VjXo7LrwV?=
 =?us-ascii?Q?36nmAxmOCt3k7uFy1u7b9U9YOEZlJSNgIzJH6OsWKAyBOM3vE/9CKxI5TOPz?=
 =?us-ascii?Q?MIolSNH/Cir5nqhpjLMlmKfBHnzP09Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a96b6fe-3577-40bb-9977-08de453bc4d6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:34.2460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMIIInYS+fxwp9AFXjUEt3VflGhqz5XvnB1HYdK53raRbjQi+cw94J93BWh/Pp1v0DV1gYwNuB2fHFUJUUJJWbSipeG985+R+Z8dvH2LRDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX8yb/C1AXJ0rg
 a0YUeqUgWaPe+SzSpsACMCNWbJcOv4T4yy3JQoJjZAJ8p5ODwmhh6dM0fzXkzQUUO0c8hF7DV3b
 pFvnGAVuDxNYHvoGuRFb312tJ8h7eGhtNZwA5AASl4nNGcS2HflXlvYiLW826F5VUcd3bsm6tbK
 qKNdoXx0PsvR2n+2f7LWSSRtGpECFrl/tZkYtBsXOJL6Fzqre+CNpAyqgjhPGeTKqCnWJEb3Hdh
 ZFFtJxVqfs1qTwlgh+k1D0OjtEyRscCRCLpvZ4GkNom6BclC490w7gGSxsxezWbTvXbnYUsLoWO
 3EOh5o7eCu5pHw+hqaur08sopm2F+QfswL65sd4K+0VdHYLsqL79lasW3djyNUIneaJ6NI6dAjY
 rcFZzlOjbdevOwyVzeCBjz8KWoJKuvLjtTy6CHAAExEvGBXlU1JEm71uRnmy3CVsVvvQnUDTDOt
 8HPSMOX4V/45eFLhKgw==
X-Proofpoint-GUID: qvIlqua1CS19895uqH4K3qHFUiHVKaUn
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=694fc410 cx=c_pps
 a=L3hcPeoaDr12kb94poMUUQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=giED5mSNaOMbM826fEsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: uqpa2EzKVnCXyPJC-De4Mm2Fty2ukHPU
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
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228555

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To support building Rust bindings in the SDK environment, bindgen needs to
be available for the `nativesdk` class as well.

This is required as part of making Rust available, where bindgen is a common
dependency for generating Rust FFI bindings from C headers during cross-compilation.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 2f3ec04e82..72dadfe52f 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -15,4 +15,4 @@ do_install:append:class-native() {
 	create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}"
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


