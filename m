Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CA1D26280
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13444.1768933890297311508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WKPjqQ4D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5l4vQ2987979
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aTPzpAtD8gMN5c1P/7/eHtwOEvJOM1wZwCoygOkWTZ0=; b=
	WKPjqQ4DiLzqjj9VLmQP/n+IFCosTX1E9xiwblDViCnuse4eSL2HX+PYYbt/B0Ol
	z/d0QVhZjU7R2J/DvH5MwDMfzjfUuRZJj0+V7ym8sfrdLFCw2r6eRD+KK6vmV1ai
	uCaIL4waCDByK+JnqSjTYwijemxWCEaUJe4EpzAT3iiJ2GjtmdiBKZWg4sfFmfDb
	stme6G/3LZAQGjNyGM0eX492RB7qUgIcabMEOB7ozJR4dA3P9dU9Vi7FGlsjy0lB
	8qawMIC2B7CCWPo7Pj969CVEIX9OwvUORI9qNk2ZVPAdZhU7+sbKsBBrgNct2w+X
	O4ccVjmUGl6CEn6n38PIGQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukgy7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jwj1mwsMFyCby+qj1ONLPjO+3WaQ/+F+huhYmqEQZ01W/Wem67MUWuzGYV93XSFeI4NWhx7ith48A+ea2cRcBFJc05ZAii7xUmo1RG/GiQXzeZaBAxAKSvJ0df7kTsuPC/ViKIG5QKXFiS8qQxsEZgwtPe5aKFSOdxFBrxJGduHMarnJuH7Wg38OuOGhRtq13nroqJqETp1HhLwD//wAyi7AhhZaFNBt7W3I3yXemi9mdV3n6O3IntLPjmLaEjg9n7Ag2i/6BBdifAcnLkiGEspaLnWSF2m7y4ItpU2KNiyN6jNTjDsjM3V25vq+jAD9/Qa6vEmOx2TZ1i78e+0SJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTPzpAtD8gMN5c1P/7/eHtwOEvJOM1wZwCoygOkWTZ0=;
 b=yUtUgTqGRBCoWOJJXhczO9fERWn/eSPoSgATCtXrNRvxBS7MSdrGbIETZBzp8NxuSORRGEIyRPlBqB67qsHG43Gs7TM4B4Zy1U1DKQyA0c9u4cuX6O+F7nsD1VGjopDJuANK2FGnbLcAq1XkD6BQILvqgSb8f9dw4D+yXn0UEgKg/lcZtEYwAwhgu8Hk32Y+rr9HEWHUIpfvg4e44nTDQG0MksbnGoqXvtRlhFtl6bXlUEcjoH02/M/hYmDW3XJkfqDCoiQElT51aMUlOpFfOt5fVo2UnD53o0Y9SchU3utzjqcxm2li5vjPmHciwevOiY+n808C5UjL4K+Umz7DGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:27 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 06/16] kernel-yocto: Fix for buildpaths errors when rust is enabled for kernel
Date: Tue, 20 Jan 2026 10:29:37 -0800
Message-ID: <20260120182947.857242-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 150d06ab-55c8-4421-618c-08de58521f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19052099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OExZFGxSA8EgSJZAITprpoJBCEXRbKDrPwZB1EYXfZ3EvPhwOiMc7+RJt68h?=
 =?us-ascii?Q?7ZrWo4xhfwTZ8CufLEbnnJRoB2+bUeEpLk81CRcK8ItpxTFyp0m7HE/1jGuQ?=
 =?us-ascii?Q?Y1UWmXjHcV8abKBiPulkv8x96HPzN+vEFKVShf9fHN3jNQ2uXTyVEKOssoTs?=
 =?us-ascii?Q?VB22R+ObbraeCqZG5Q/GVIkeuT8vhGywkxKBBPMGMU0KQOI3JakUBdx435CD?=
 =?us-ascii?Q?Dgp8KB4Al3ceYabusAqor8CvyGxGVBOSOAGeJZ0A1YxeVeFSxiJ1c94Fw/wN?=
 =?us-ascii?Q?2OUxgY3Ury3mKhmGhfDNM1x/PtCp2QDkLVq/DDwNyFUWAPXJb9pSXCW8PZg8?=
 =?us-ascii?Q?HFmSuVoNMxA/4S8vUadXFlUHLCBEfdY2yzXKNb7/EHiNqm2QvnwGQACqeH//?=
 =?us-ascii?Q?HQpazj1tEs8Y8UUH6/nmcr4gSDkVSm0Ol7ZEmnBp7Y9+Oy8YN0OMevqAu6GC?=
 =?us-ascii?Q?NqiVCkUrZ5pXkBLXU7nVx2FcJIID0KN4DWKdvoXIocF4de6oDQ8ZOMzA/YQ1?=
 =?us-ascii?Q?SBbqMxypkQT3P4JbuZNRyOs35fX0XY7pqwFFWjpFTQTNhmJm/x95FQ5dyWOk?=
 =?us-ascii?Q?C+8AOy1FB5PDad+vK760TVdNZ8VwIp3lT87wjfYB4881s7iUjSz/CQJLZxnM?=
 =?us-ascii?Q?VBtLz+t2/M0mZi+CVwEsiLM0P7qMafCPYoV/cgpZIx9kuKszrQjVxeEM8snj?=
 =?us-ascii?Q?wMtr68LIvHrAIT0iQurYLQzw7O/A+5vMWNtAgZWhE3hqVkc1OMT8FolI5COz?=
 =?us-ascii?Q?rR2sYKnFc/OoR1Ln2omJaCEuVSANPzKnI+njorPaV0qAHDbLDC28epDO7P9f?=
 =?us-ascii?Q?PmYVEdZCHxG8CSmnBxepaKbCpZn66w7GQBcNmvQJ/WSQdHCxXx1y1R42LHsj?=
 =?us-ascii?Q?S8M0BwbRuzmzKlDLLcR+gCLXfVVTYHCDk316kvD8fCmJkbtIimyfwVWNL5Qm?=
 =?us-ascii?Q?rZOzeTCD994yTp57TIP1ST6xe4bOXgOQKYV3w+FXrAy6qdTk0gCGwTPzmV8m?=
 =?us-ascii?Q?W7qwqwFnsogc3FDZtVfrrwCaGF3s+LuZLfNuQbnZfXN9f+Pn8p8j7lhhpFGZ?=
 =?us-ascii?Q?GI+8TfolxpvLrwzt27x7j2c2xLsDYw1bnarBiegn5EZqILbixqrjXc0m4jWZ?=
 =?us-ascii?Q?gZc5M2158zjbhcALMOyaX4LMHctO/f92tX6fqdJvjmp7CBizRmVRW5zRUSYM?=
 =?us-ascii?Q?qWqjefEscSWjza5gW45bFU82fzPD58MgLyUs+7Z0BfCo/otojq0h36zyQGFe?=
 =?us-ascii?Q?mQDbcaA9FzQoNu8wt7uTDP2mC2vzLnuF5lw/szIO8YebUp3WLBtnwlQWdEYj?=
 =?us-ascii?Q?fy2wrrvwBZF54JuQB8J31RAwBHuQqQdkw/pT6x1y/tFvSEm3b70M0KfKKc7C?=
 =?us-ascii?Q?bNVbUr3XfU9NBd+PvJc/dgWErpF6qodEjQa9XyWPeil6n3uABLnv/Cmyy44N?=
 =?us-ascii?Q?HictTAUIm6xxz0/QJ5tayy5+rs8JG8G37BnTuXiPB93FTgEL/CwWsty9DXsO?=
 =?us-ascii?Q?PeUfzgfRvQLzEACG/Xr3FlOLEL5zRk7ES8HEGDY5ZU/E6567AIDt5RtuFU4n?=
 =?us-ascii?Q?pdzQh2LzU0nb34xHusgXy0OI6wyg8QlHzZtAKju8OKds57sxmdTCf7YV6ZhE?=
 =?us-ascii?Q?NjPLlx9vGGqWE2qSTesrW10=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19052099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g26urcA+78ZCnD1cGCeaQvOEZGVDzDzY0t0vhqjosLpFJFr4TOKEo6tRu7aS?=
 =?us-ascii?Q?GePBPSUZpX+VeXZ+k4LHaq9GAHg9YxZerCC0WvCgFOIGOQmtjRwGvlDoqPGf?=
 =?us-ascii?Q?5+wBux7qvuJmeshGxZZpQDd/VN+oyaRbF7yNqlZQbZXpQmLQIbUc5xdyg0Mn?=
 =?us-ascii?Q?SAX75j4ACcRNh1ZNn69rMEAFvCncU+tGA+wDUX7oRdIbxK6io/x8MMTc2guh?=
 =?us-ascii?Q?pikcfv4ippe2+hyLUhqCTEDbcET+w0c1wJrh5/eiP7etYPNqx7lvlIZRQAEe?=
 =?us-ascii?Q?NDvIM2w/YLBJTVYNFNNP1GcGlvHz7UvjGZQpIhHZvGBAf6jY0lXak3s5idke?=
 =?us-ascii?Q?onbFA2s6WOf7z4H5/FENE8QBqQBYSoilimWg/12vUBjko27RjN/+lONHua0C?=
 =?us-ascii?Q?Cc757khRrlE6bNLQ8Suf9KU/0K07iAF/HF8mjp7c90QzVnkPdnhSDB1hzPMX?=
 =?us-ascii?Q?6n8dMC87N9siC0xeFGmoRMmIqBa5HbJAHN3bQzIkoUIb0YYma8493Z+CIc/3?=
 =?us-ascii?Q?a483RBp5jKc2aurkJEkKDCWDb626FTMg/35u927+w6XweVIazV0x0NPLwg0a?=
 =?us-ascii?Q?XsrHhftfHgsZyCHNfY1NouBQ3A92NSAxst0ggk/uM5LJ3ypDlCKtfcuoXsd8?=
 =?us-ascii?Q?TVTHdSxoqonMoDxpwAilBJBPNkBX+T9CAtMIIR72urJ/qBTcfjLOBQ+1yPQy?=
 =?us-ascii?Q?g7JJGqqBSaJHDb5FEoDGHgyio+WKUUGCtIgcjyIEkpV8KNvuBv/b1rImCjZW?=
 =?us-ascii?Q?+PpOXPrNUO5PeFnN69u2gLLuRCPDSZHqOsu7BlbGFLJdqN6OsEMoqXzPkExk?=
 =?us-ascii?Q?ZL4ULDdyhvoh5Agj1bgRjp5m5SVlUwsTDnQktWqt9pqmaR9N9l3kOjYuXMkE?=
 =?us-ascii?Q?9sko6X4RSR/5uynCFZHiAhxFj/ttgwHAcaiHD95d1/1Z0JceqXZnWq6AvjL1?=
 =?us-ascii?Q?U089l5wZW8iID5/pUA9fwXxQtlDAidgwY1I1hIbjWfp7cq2wUm9Yodbc1Bew?=
 =?us-ascii?Q?kzMnFCHGONq1h/ak+PyXgjsvKwq9ouQLsVcW4VfsSD09c1WVAwr2m3h1yU1I?=
 =?us-ascii?Q?IRqx2hbGVLTlsDxcXStpi5dUh7Bkq2QxRJFjhc3uuQaiEn0ilvtnflUbhWjZ?=
 =?us-ascii?Q?gXE9jWEGFQBbLP6KW2ji9LMQglALtwLNjE+ezpoDWPNQ3G+8G3/6JOdwjVFi?=
 =?us-ascii?Q?aF+smoZXkz+G7r81Ih3nW94mV5WXa71cEn7DVHHKphNpSNzcZvkJRgIGJ1Ql?=
 =?us-ascii?Q?Tcvmncqx6FYbG44Qg7fxaayHTeC4pBCJEVh9bolD1urtcOPtQmz6f03x+nEk?=
 =?us-ascii?Q?nYE30MZA9bDrZNfxwyxwt5l2DqUvM21WDiFmRAEiB1GsXFAmObHtVyfGu17d?=
 =?us-ascii?Q?dFlR+LVF0ZCWsw7tqHhCsnnzrpbTSBsJ7SyYi85ZPUoKqiQbgEdbAlKbzlc4?=
 =?us-ascii?Q?T3dYfR7LK0xQrn7jZXU03QYUjV2BrgO2i1prty/lv4fFxHaxc93gk6ghBzUA?=
 =?us-ascii?Q?pukogZKk0uTxlcYYBnZwq3uePSPDZuOBwSRjOm2omXWABv7W7kUp9P8FnWO2?=
 =?us-ascii?Q?XSHrwuyM/heK+BmUV1MLrRq1o9wC1YkRoM3bVA5gpjuX1iCBX8jU7/h0FvyP?=
 =?us-ascii?Q?c5Kko4QQjI1KwFoRQEUdqe7ptOvco8vpXx7xR1RH1HltUI3WvbzW8ozCltf1?=
 =?us-ascii?Q?RYcjp1OAcqvsDCjtGHt9T0FwZsN3KmFrY7l1Dop8sSLlH5sbxS/9jIm4vF/a?=
 =?us-ascii?Q?Y3eIR1PFBWlKq+GqK4zP9UfTL9tbYA0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150d06ab-55c8-4421-618c-08de58521f5b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:27.1056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj7pFjluiT3jXqQbMhASXTVMCF7vG9dGut7tkMzrhi8Ys34XCAMioOcGeGM+Ns+G0nPbV1FX4reZvSWitv/LCnMRsjcTVovzo64vCtk6ADc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fca01 cx=c_pps
 a=9wPeeuiWglyMylSd9qupQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=hOBxLMctpgrGYW2eJecA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: acBSBa22GX5UNDUDQmnuEwwnaSW5AWGY
X-Proofpoint-ORIG-GUID: ZficU3c3QyKys4qXyzYV8qXz2hrRxzFz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX0RqTAzfmiNd1
 mTZc+HRv2ws6G7/F2vjxyFzrTnvNcFXMTPJdrX+F032FF+uoa26Y7IeLRBcoIZvhlq2t2HWtRYa
 pOfEBQFMbPOQQOInnHSx8+M+ckqFAEMTaLJakDfZ3MqhnWcYeTqmGAYiFr/ilYgbr7TOTsUc0BH
 fKaaBTamz7JIJ0OcIHTqQmank/+YWhaigu2z7V0LfW6GTaDzIwe0WlF47Kceprxtgk8UyDVMzxy
 q0olhw3UVpqp7xlxKqtGQ/cv4nmkwtyi4/JSqUYe11RJmbhaz1/EsGw13U0fCm45FynWrmocBwW
 7M/uFTl+v2vkXUVp8wSasvnGXpp19hLUx8wfOuYTMJwAYpXKYMidtar8KtLmWkWCLWZcYwwEmz5
 OfzLFi2Rdpzlg4po3w1IwA2Cr9O6dvu/fAnpAKe4JOiTnwXU4bNnPfrwYJNT/t14xOf4e+2aJnY
 j4OZfWjwlPNeoY6+RVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229773

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after enabling rust for linux-kernel

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 4323c4c80a..cd5daaf33b 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+INHERIT:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust-common', '', d)}"
+
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
@@ -27,6 +29,11 @@ KMETA_AUDIT ?= "yes"
 KMETA_AUDIT_WERROR ?= ""
 KMETA_CONFIG_FEATURES ?= ""
 
+RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                      --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR}', '',d)}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


