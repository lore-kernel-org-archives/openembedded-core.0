Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE64DD358D6
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19184.1769704780234696381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iW6IbFzq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAGnoY1959071
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:39:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q03ENCxJr2evbQg/Y6d7h08ksp9CU0M847CXD18e2Gc=; b=
	iW6IbFzq4Xt7I6E2QCWThpqq5C52GrmV8uCYgwPNVkQgTIflL2Uudz8PzQYbpPK3
	NRAo6z9fctqYaCiruEopI5W2ZPT+1EYgEZZ8sD7T7tIoUJNnNh55krYTe8TPntin
	qLB3Y7iXnLsfRtb4X2OoVpuFUXl+xmg5IvmjF3+bDHSj25pfBc11iMOp+GQx/JrV
	ffj26NJQ8QlY6IDVvOkL+xHH/rIFQMZr2vET9iCqJixU7R8XWhzsHZoXGYakgMdj
	kOuz2UTRjf/EVZsFTW/tKL/LU8I1eJlf1vdms6ZKwJR/q0p/RmDwxn7a84aNe44M
	aAAqlScwUPXVZtOnfN8wXg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4byx2t8smn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 08:39:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eno5NcVRcbOSCmRcdBBocJKiV5U/c7/mQ8m0SlT38T+njyK5sFgWetmR5hI+II3ciqmKYjE1ycwTLAayUv0w+q8QqOp/NozbYFKytKD9+mK6ZgU1y/YWVZMGpU6fIl36WeuXI7dUWlHQLFEeMlXNwNZlDMgJ6UQtn/2GlPSCKHLF+Qx3WeSUkd091XRvb+lAOnxQh962C3b21i8RFBrGAgNxT8f6G4Tve0aYySXj5uqMUFgyBJs7Kz8fjX6Y9XsWYl0ENbtf28YAQ+dqWZvZ9sQQtHdZBSmbLv4hJ6EkJqHps/0LKY9nRPBI/a4LYQvFDxomHStBwMkYuEaqUJmD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q03ENCxJr2evbQg/Y6d7h08ksp9CU0M847CXD18e2Gc=;
 b=RTsQ5mAhxTq/ZbotQkkk4n5SpStZ3KYhjmZryNvd5mv/2klEBQ1S6niAviDEXQqN1nj1ianEYw0Nz280tSLhVVSF2VY5Hxh88ai6XdmGY8WB0YLFmZpGmpOC00iiFo0qjraTABrEvHgng9gRU0fmvZ36wwksPw4OP6wN+iLnY6d4bz3lNWV+9eS7DF/tY2Ie/ctVfRiHhK5WeP+gQEIQso7hzLbxfLU3Cy7946AB+odfD/+qfwmoopG/5BpLFFFQepgthicX44S45Tbknl49OerSjuShuJjzZde/3hRm+nL2z0w96MGfxRtRPRnLgJBUes4q+lhsPXJNFW4Ljf7wOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:39:36 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:36 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 07/15] kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
Date: Thu, 29 Jan 2026 08:39:02 -0800
Message-ID: <20260129163910.2612040-8-Harish.Sadineni@windriver.com>
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 883b0848-3462-405f-69b8-08de5f54fd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B+b9w+0D5S0QtkvagHRBJwVfKMzSQNO7/B1jMFMW4Tl80xJiDas2fJk9mMtb?=
 =?us-ascii?Q?8z24cLmIXn+HQFZRI359szzoNYNIFkLUNTmmNdvPqVi5s4yJ7cKXp5CLhQiY?=
 =?us-ascii?Q?gqUxrdnXVK7G08lMhC9eWGsnLW/RkesML52B67vFJmOyUszgDBpE6dN+Wf/f?=
 =?us-ascii?Q?dS1OWWZQBvC9ZQdnijWaoEpH693vLfClHiMlHbquuk6k0wazqAa2bNnVeeRw?=
 =?us-ascii?Q?N7lcsV4is0CfqqV788dEVYlL67irjydiGDFAtjhKH3rej8u8622FX2QTccCP?=
 =?us-ascii?Q?ZfneaDmbGTQ9+q5cVbVW37wN27tlJ9ekUSqCsnPVLUqrbSwoS9m9RoAf9ojx?=
 =?us-ascii?Q?VB5j+M9Wua1pO+ggW4zVAMsrpXp21xKiTWmIYlDNTdgxite5tQLxIHoiTh+F?=
 =?us-ascii?Q?UgJESIWwcbeXSUd7/GpROejcwOcY9T2nCnLyLc0fmtpLxus/kZModbXKlJRW?=
 =?us-ascii?Q?7N/ekhiMq0tKpaCmkBnTJXRcJ/49IEW+e+jEaaBVkZE3v8m9wdC7xmyZ3HkU?=
 =?us-ascii?Q?vser1GNArDyLc5By2ZayewZfGi2US346yXKsdpAD91V8Ya2BBrdhL9+5W9yp?=
 =?us-ascii?Q?X9mtK/NYDtWImFtQSM3A2Pg+6RONdD8HT3jmY/jr1PfZa+8f774vko4GJnZp?=
 =?us-ascii?Q?jzh5fEyo28v6QwJ6+AD1eYc1VmKLiPwFHEYZ3TnEft8yCvSGo/JbvR20QdLE?=
 =?us-ascii?Q?tBp8beMQ/RI3co1HHzWZOAFPhxP9ixwc3UjkbOXKQwrsXWxh6A2kq3bzceXi?=
 =?us-ascii?Q?FeM/lL4sW4Iav8J23eIrx0iEsxAPwFsyZHH0Gb3UdE0rnsbY2cL4rUcpXuWg?=
 =?us-ascii?Q?6S9V7o9qSeMOf25hx6py/jwznI7r+ZUwVqMNw+nIw4MCtC78RUcp+C+2KiBW?=
 =?us-ascii?Q?Vr1iruolD+PSuggKtbWuEkhenVWOMqKjISCF8X/d3VdF1OI05+qdEpDDcV6N?=
 =?us-ascii?Q?9RbY2Fkp81Dm8bL2THM5PD+s50BPiYnt1UZLNV8C3kRb1IUpLFho0q+37a2R?=
 =?us-ascii?Q?MWxfJmj/gqsBs2gp63nxKJV0Imt6oBFF8w8uHNaD6PR+D+5WDEzMZvOWFbN6?=
 =?us-ascii?Q?X+vA/VmFPM2DEzYGe+P1Ys79TStVYdDJHIO8NPYsNbernwt/oq078L6RCXF8?=
 =?us-ascii?Q?rVz0S3tAPX5N2VQaK86/xsxmrncqh3lxc+mRROFcwMzbUVNdzGMNoLGkzKBe?=
 =?us-ascii?Q?gJztSSs447bH3qZwgHTMZ+IfPF1XSqWh+ZRepoTv+VNa9eTu/Sw0cblNO7TJ?=
 =?us-ascii?Q?MC2CEIHyjzlR47YSYz1ZGEfnNTqGp3BvVnlI5tNxH8LGULgkam8iWWxY1uLq?=
 =?us-ascii?Q?iCjQLTp5MeL+G50qnfrzV5umsiaH/kF9GvzCcgrFo5WsRyaiGX8DK/g1tefg?=
 =?us-ascii?Q?klm+wiqucWVIfs89E0cA4G1ZtIbOcjE0NLzCM0cENQOmIAwnTOe9nr/DC+WU?=
 =?us-ascii?Q?5QUerbaU9uf0LD1/B1UZu5SEfosK3Nu0o4LGAJCGQFGrKP3PvQv0SjTTxR1i?=
 =?us-ascii?Q?AxxS/oz1kj72p31geTdl5WBWsm5oinfk6B2U5hIYuk5iKejmV4dRCUgwAPvd?=
 =?us-ascii?Q?J0mqZwQg36hwreMUTbDXEK0kJZb9VwUL01XgX8ob/C+3T/ImsS+WhdsCG6OO?=
 =?us-ascii?Q?x+AOxqEaS9y6DDyXose3aVQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jtfwoHomLADKcnlieINk0fYvybQsAcxupUtrYQgh8slqfyCZudz4tfHWMN2/?=
 =?us-ascii?Q?AmvrA+RguWM7Gi//LddBz72i+a3FAhi9soRyGiBgRxlcUEbbIaZRs9RR1y+x?=
 =?us-ascii?Q?8wsWw16UuUPKcQtY0Em775pbkygk9Mmb0f69yrJb8jy2i5FXtBdLxtLrmaL4?=
 =?us-ascii?Q?4lIBjhPfGKx52ZqcX/+U0X9DbcTm0p5MP0ES/hI7D3p3SQh8KOl1036B8WR9?=
 =?us-ascii?Q?BsoMoROO1UP9NKkAc8va+pkE/81e4x5kL2CRZbJECqF5jGTD5NS5t+hfdNwm?=
 =?us-ascii?Q?y9o6RsxiYnnO70VxrHS1eViF4QGZTu7EJbLTvqMkiMxpXX4p5j1We2Svw7Fq?=
 =?us-ascii?Q?kuX5SuS9RYKy5tjWtn/WzuocjElB6AdqYqdF5jONrY2ZijM72QNot2ePhMXj?=
 =?us-ascii?Q?Rkxuo8HHWt1ZlGduA3vp6duFHhokz53JZS+4BHs6umjxp8mYK8dC4+u7NwE+?=
 =?us-ascii?Q?pJl+5KBkCKOFivrNaZdNcyBhAu4orE/oMoOsCE6VdJJMQ2pl1crjYsGgip7G?=
 =?us-ascii?Q?kMrcmbe8WBLM7EdzLmJ28f8dOilGLrPzukVogSsgXjvGQ2qcj799jZsLU6ub?=
 =?us-ascii?Q?2R+PlWkpPQRfB8Q+Vj43xutoEHNdD0Rxi/mAIDLOBwJMbuQOxAOTwJ378jRI?=
 =?us-ascii?Q?Q9aJpfgnYVdV9vb7lGtJqeE4VxEKfeVJ7kOfo3FoJTGSMhX0sh9CQSlyPSLH?=
 =?us-ascii?Q?kCFRNu5l790563ZeggWBFuB9vVQ3E8AOeX/e8PIK8Ys7XY+cCrNE/oDBnW+C?=
 =?us-ascii?Q?qc1cKW1eeBzBhQ42x6BEsEG7CFeNERw6DkCldtfiZtoaChvqhSMNbO057BPm?=
 =?us-ascii?Q?EXJhVtc6sRBfyxv5Ozu8CMrBT79mzyQv1Oe6ILBwaTl9bwt75x69270oTj3z?=
 =?us-ascii?Q?TjxLPkVEkpwN4tpBbR/canR2SrMLLe6/DVE+a2cCNPzY6/PVj7fZ9kRhAAHG?=
 =?us-ascii?Q?QJk7VY3LmEie427QDXZAHmH3qa1v8XqDWPohsrKrTqgvG8eg57CTIfwQVd76?=
 =?us-ascii?Q?mgE0fNFWAosdp4TnbEzAZe1UCCrZb/He5ajIJu9vOSwZtlhSTuvTVa0vnbCa?=
 =?us-ascii?Q?WC+jh21X7IGP0bv8w9ti7QuRtTl76tAwpC3XypMeNGmzfJuukbksNNOL9Aau?=
 =?us-ascii?Q?b8pO9nWEyX27SuPnWEPtYm9vIYsBAX5Y8G5BuZ9aNNj7H/MBnRGs/35BTDB9?=
 =?us-ascii?Q?F7ZNhMXcky1JdQJ8US5+Xs2PydTTdwJYyFm9LehP13zRjpxm46pwQF0ogTrP?=
 =?us-ascii?Q?CuRg39W3vrl9qRrB7GyV5CvSehOy5jLKxjcz43dQ23UfrdiDPIrv+F+yd7Jz?=
 =?us-ascii?Q?EdrdqcBttKCkoJAlKsjNescZuxPKMRD9nzhyBjPGc1rhMyU6EBt5GiaB6y/D?=
 =?us-ascii?Q?hkYxZATGo7cQE9gUPDJVf423mT57z51JQi/EIeY4IXZJTD8FI/SLdkH0P37M?=
 =?us-ascii?Q?PThbegijcLm+gtiOtzIFeC2qavzkNuHeIBAKluylxhejxrpWUOhOdPdio60Z?=
 =?us-ascii?Q?VSn9M42XMJDLymyetOhuWIbUTbXDaqycVLRSmsgizkrNrXu7GWBHeeaO3xwx?=
 =?us-ascii?Q?VAbm07bEiL9evK50ThgdE4oCXMwWW7tFKnOfxXSS1LhYG/9c1fbqQAYt/YSc?=
 =?us-ascii?Q?oJmqdl2XxMrFlhdD6lLQ1IT+B5Jiry4VvBeu4nc+0FOEaa//vzNmdNNlU3aa?=
 =?us-ascii?Q?sAnB3JSpDEresZiP1xF9vx8z1qlnmlpllza2FIw/dTIWXam3riWFIafCtpXk?=
 =?us-ascii?Q?Il2xodC3wezwoKvhjCAG7WbKVxb4Wgo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883b0848-3462-405f-69b8-08de5f54fd21
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:36.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rw9O63gvr+SAxzunYfq2YREtz3tyKKr9gk5m95MzlDMG6WuD2VFTbrOKaN89V27igu0Pf3CrzEx6EH0CMuWyKNfy1mWbzYOHhZnubW2BXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: UhKMhe9mdqlyXlM0Zz-61RY2yNnsTN0-
X-Proofpoint-GUID: Ya_ONvUCuHGiqc0eyGM8CFK52iYyd4Z9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX2L0rZpx3oD5M
 gu0L8QFwdlRO+s/V/8ZpuaAQpdvI17zY/S2jH9Tfxvj0GIqqvrO98iVLkuEP8gav94N24gCToyo
 cxbEOo3NMHI6urFL2bRyDb9pkWknPt3MuX2EyamGpmflC2PoMezaU3aayEI6B3xwxYs83tUbIaf
 EAPJOJ5CNUU3U10opQiwT9VUhZhI8C3DG00UFed1YsiqEcwsSIAQfhE0dmzB18pmnKa/3Vcj50r
 DefN9NiUh74K4jC31fmqjGMbqTNpOmLfLk7rMX4oz/TKO/YSRXx+nmr3NplGkE367AyGVARUtuL
 gOOZ6xlPrQWF4oZwWYOurEeXZNxP5BfzAToXhGd3IPtzBqkufpNdkWaaA43Owu5gzn9B0Kdu9qK
 sdxEHiAfXYv2fqGz9v9AIQDONKeBrFLXH5x0C6OU3IBTU9yHi3+2xQF+toQGE6fwjSvS3yXV9J4
 0jwxwjNRWY7nT98K3Rw==
X-Authority-Analysis: v=2.4 cv=NcDrFmD4 c=1 sm=1 tr=0 ts=697b8d4b cx=c_pps
 a=DYD6gEfmkstUuBQ4PvrWrw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=1kRfWWIhwYc51yMvilMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230148

From: Yoann Congal <yoann.congal@smile.fr>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

when using ccache, value of "HOSTCC=cache gcc" when this value is passing
to rustc, It is thinking gcc is a input file. when ccache is not used "HOSTCC=gcc" is passed.

Disable ccache for kernel build if rust-kernel is enabled to workaround
this.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index cd5daaf33b..bfdafbee8c 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -34,6 +34,11 @@ RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--re
 KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
 EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
 
+# TODO: rust-kernel enabled kernel fails to build with:
+#  | error: multiple input filenames provided (first two filenames are gcc and .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)
+# Disable ccache for kernel build if rust-kernel is enabled to workaround this.
+CCACHE_DISABLE ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '1', '0', d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


