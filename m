Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865B5EEA847
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51762.1770919900700136291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O419Omuf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5k8IS3146673
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:11:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DgByyMMAIcaV+6ev0IFT96cFaQdhrJ/9dAYxrVnPgxQ=; b=
	O419Omuf5z3QINdLECPBgXAeb8Fp8Po7T1nYgy6txTmOUsSC9ChoQ/bPWnvk7iWL
	VBl4pPghOeqrK9hL8Biv+FxHG+FKaNtwRgiLvocLSroVXFWAinx13OO8cGguPdka
	Qo4LWNFdDfM1VP825+DL6jG0UbnQT30O0KqP4NONnCgjl8wS+ikUAu8TOqHdN2N3
	gG/4clMdUCJZZyTqmEqT2/9J9+RzoTKLCZivChPRYDXinbzfmcsSlfIdk7OGJm3V
	5Bd9gkJPdBjNM/uDiz0d//xJSDr2N8q5vnuh69QWijezyPLumRamw8Tjnoqb0Sx8
	eP9nMG13FrfI+NzZy6tWRQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4xavf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 10:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNpgZJ7l/rC7eROd5j1Yme2wx5qRjiLJAEHXU/BXiMoiMkPUK/LzcPk+we+6BR9iLAwmtDl5I3eZidj9ylbEkQdL7IgTGxZ/4n30f7VEci+Yjlg8QfLPjzmvuVZm/r9BvOP28PIgguRkBsgTPvCyPKgAqjDd7mdvX5OJ6gIAgayznBDwKYUwYtuiGQYAp7HS3B1Cd7r2vybLj2R2Z8F1VUzZUD8hDOtj3Jwfr/AYrJaqHbDR0zf/1wBKBZau4CIvng/oc/8smNk9px1DmRo/Iq7/2EhKl5/3XZOQdqrwX0gHuALriaDmUU4o1USyDbKK9m5GAQvg2oAZp6IL7h6/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgByyMMAIcaV+6ev0IFT96cFaQdhrJ/9dAYxrVnPgxQ=;
 b=QqxweP2INfsx7/50Rl2Uu21gSLn/W7sVNr4DhFZ0Ee8xzxnuF61BYD/38qCAMxDPU7+9HOTi5sATYSEMeJk0kAYurygzRWG2in+faEQ5lhZGG03O8kEwsGcxiCx/7o8+sWLAs+qXy3ULIde0IAYN6X+ixo5nBTr1J2wC2dztBZnHOIaj2aZtB7192foMHFCj+146GBIWY/TQ+67ktAn0RmifHM1miMWUB8owsVoV//Dj0FGWrpN2e6fU+03RjhwZ9ihG4T/8jxYXyupH4y/9NFqa4e4navD83qnRPGhfr2SBXnYUhPSMsH7Nb3kP8k4BFPz5aVGSy5RSsTjncQs1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:11:37 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:11:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 13/14] make-mod-scripts: fix for buildpath issues with rust-out-of-tree compilation
Date: Thu, 12 Feb 2026 10:10:38 -0800
Message-ID: <20260212181039.1826154-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 3019fd4e-28c7-4a5c-3512-08de6a622973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?feXR1V+mjNa4R5BnDjXGH+RMB0hdatrmaR7pyURqqTsYXD4l47qnC6kGSmmJ?=
 =?us-ascii?Q?uhJwpiMewZyOBCgLDLR2NHmDK6L3dfIx0st9o5Kr+9Y6doagbBdXe9jS7c9l?=
 =?us-ascii?Q?y2sNZaSEyVmFhcLcAPvp3QITj3zJOimLjPyQtFHHtFmzz+erA6lkXNxeq/B/?=
 =?us-ascii?Q?pyAzaXvJ6zERURPYJtmdYtYIgTPea+wnkfUPNPMCCYVuB9TkF0BOa6Abenfz?=
 =?us-ascii?Q?k7rpQduLKgvPbJv6dYu2Vr3SOoHMm4eGM8QHTU0EytKQLBYTRQLNCR/j2H5P?=
 =?us-ascii?Q?jnO5FN7Yx1un7PqQoGmYiAf/NQ2rgE3DXnZWQoa9v3i2ftj8ooUUVMahX6Yr?=
 =?us-ascii?Q?dyzntWImdCNynnb0Rt1Pgrkuw9DA4hvxZZibg0u7pdTv3i9fPyL5z/w8GK2w?=
 =?us-ascii?Q?Qzj37DIW3oqcqrebqfzMIZ0mho/bhS9xYrvmJe3xjXIgc0R6HwRwTMMS6B6x?=
 =?us-ascii?Q?fgdzudUzgnj4tCBNLimK05FD6vJCFmqEckOn60CNjTLIKKeO/rBkyRCsqZPE?=
 =?us-ascii?Q?NtgUwE6oOo+2L7JGTNqk4Sv1gw/zMldEW0ZztVEZL2t9jyH4CQael2SWYwsh?=
 =?us-ascii?Q?bzFGA+EmyFTi5z23VsXKBMAclTonHs0D6mI6GycWgPiOUx9QQaaGWPk4TXGp?=
 =?us-ascii?Q?ViRpJ4NFJLcAixQ6rAjc/mRXGYyhyHOSl/A/VtYyrqL3JD+QExGzC64bs8b9?=
 =?us-ascii?Q?xmsGroqleECrIGmvv1GLPZZ3wFFWqWkVFXztLniUcOJJLI5W3log1NAuN1pi?=
 =?us-ascii?Q?S90mB4flLiQAJ+W/FouIU2bhEAO9Y5crXkc1LgV/PnFb4RL3YeHSKnKhBVq+?=
 =?us-ascii?Q?7IJU1VlBcx6K2YoEPNAY2xRfrsEZL8xVEyyDpm8GtMFvfDSzUju1q8y20wYl?=
 =?us-ascii?Q?3n/Y4CUM6T6BJjxz4Ixav/vboegWo5hXzexiw1agZjtuz1rkVEnCcLJmkIPz?=
 =?us-ascii?Q?orgnvXWtAD8SYkalwM8iafVxTzb4KKcg4xrXHvr4ooFGpOoqS0eaGiQoAaqd?=
 =?us-ascii?Q?nFWKvGpUXWCU+MnXtRFLqOK6GS7vLmnCi1XhP2RdEuBd/h0VIFjlEzBhs4Pn?=
 =?us-ascii?Q?7wvOCvGiLvcnBDZ92Wrp4w7pIOk35recetAWaXGW0evYQU6WWrUlqE8Z+ZB6?=
 =?us-ascii?Q?paCYeHDuSFRangZ64/OSKi8tkx2bN9m0xKByxIenfGqFtMmVk51INlS9MKFv?=
 =?us-ascii?Q?nrOBKmWqeWdXlDOHDSNBFMA/n82MrbDwvZmE4TvXNFCxrVzLYieFT0zZwztC?=
 =?us-ascii?Q?x+BTGhzT+SCSzmMlr9nA4gEcwdMesCXgjYmi9Pzqs0nHaoXGN6dw0VUzF7nk?=
 =?us-ascii?Q?Etxq5KsbneStZRWKC8ucWmGULyTwYetqQ28cpzvt1KpoutJ8Wmhvq/wGLJ/K?=
 =?us-ascii?Q?tvPFv1ZniXZL3tajHf66r1aXpqtBalKIoFJS2rdzwaBTFYW3kggH9p1G/mbh?=
 =?us-ascii?Q?3qnSJHBBXN/9JrEPxgM6iMql+1Fqi32Uj6X76dYqMOunm6F2EIvGVXk95113?=
 =?us-ascii?Q?Kv/O7nFMGXSqik2cnaLw27oLbMLdLydRTFJyib+IHgWLqXF9RA0OQlzUuanw?=
 =?us-ascii?Q?ZlIPs63biSANCMFvrNOFrwR0iB1uSIF7CA8GPvfJOioY/4gGs4v9r2sW3qm/?=
 =?us-ascii?Q?Y27t+/apvk7RaYGMpaADODI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p30BMq5ODpqAKo9RMveYjZxUkz5F7l/HQM2/9mMNRFkXgX9DoJLPGXhaM4GU?=
 =?us-ascii?Q?ozHE4/0VYXrC+zHGnzimWgHNXqtQxWJivqHhaVrR33b6ERQYhm5h5weqfJUz?=
 =?us-ascii?Q?Zv5RlnmftQczBz1nWXHmE8LGHAQ2mSCBYRS2atQ1qQXQTUOBSkBGFQRuP2Ha?=
 =?us-ascii?Q?rEHD7jOz29ORI2lOuLLeSMsNS0tBKHF9AjBSfkkMTfPnVq3Hre/DU0IOBr9B?=
 =?us-ascii?Q?OK3XHcLl596IPYjhvoohzNK5lM9Qi2Q1dr2gmtAyR4IxLh3qgdshsdiAsH6u?=
 =?us-ascii?Q?rHtmqEitP/GtQLFO8JQeiiwocDS8gvF6TCzgopwCMN+30GqgUWDqIoQoLw/H?=
 =?us-ascii?Q?np+YsYVPRzdzSts3k6KStQEaCCK5jkrvJXDclisyicZWVSWp2Wlo4Dlq/0m3?=
 =?us-ascii?Q?aO5iDAH4xVwvOIQ4O5pSrt2CXyfdJuQYfnbDrjB7eixpIJ7nGj/FEwa9InhW?=
 =?us-ascii?Q?hOGerXcMzQbk1U5YGhzlC/NvGYGYWBVBshXAgUrRRizFxgud+2ldnt0iYQjJ?=
 =?us-ascii?Q?T9nAS0/6P6deNoDL5Hdl3QBV3xFtCN590wtpI6iPvSVBYDWZtliIi7RdgvCl?=
 =?us-ascii?Q?WRcNwm5m5xyF3v6Otczju1aeaFOlBc8jW0ZUMuPjSm5gezd6Wxk8HS8nsm2z?=
 =?us-ascii?Q?EC7wZ0ZkOC4V8DSR5LUkPDVodYf8T4+4R9h/4fIK+m6psDTPNXCIa4X9tiDe?=
 =?us-ascii?Q?8D9WupUCnCx4QebKWu6uNzogHl2pqSmZYftwyi4AeXTbmLKKNEpBellZNctM?=
 =?us-ascii?Q?Dr51O7FJRsKoAFGY6EyuZECegjWkr+Q/Fy2GfrF8OoHHPJLYbw7hg7wBVV0B?=
 =?us-ascii?Q?u1jj/dVPUrfbMWefQP6ul6ZHwUVElBe/MFE3gX2MbO3UkCzvsKte1lb6zZ2F?=
 =?us-ascii?Q?h5tHKzeo8c86JVP7F3FKUx6edirxPc+nxn9rJF/g0rSE1JWVsr48SIyQPPsT?=
 =?us-ascii?Q?/52hpbFT66Hdx3I9jJC6ARVeJ/opQZPSpYK5oLXoZUBiL5HIlCmamrqe8V4s?=
 =?us-ascii?Q?qQItlmYCTyHMql5EGEprJY1XgVKkUfVg501RkFSdd8W9R6E7pDCZnVS77zZh?=
 =?us-ascii?Q?tQIEXWmWZeh2nmvP/tJTBdlEarIght+ERVBep4pxMHqu3+JImpGNvQgkK6ew?=
 =?us-ascii?Q?DV3ESIpu6UnHKs5oqfIvAgSS9NsaPUSRIwCdmMz4wysyW2vRAEgUIcq9btJm?=
 =?us-ascii?Q?D2pBPtpEVV/VB9bEWmT52S7Wnlbp7skNpVYEL+zONTUitLSUyQSQWQWPSIGE?=
 =?us-ascii?Q?yx9sW6rPSHMvkq/bxMg1jcMioNaEwz8KaO4CsCcbUSBKXiC0ED8+TXWoGib4?=
 =?us-ascii?Q?4xejSN0ilgFju4FVob+dzDr67PeqQwZgQZKe9dUHmJ6oqH0DtffBuvEXUBg5?=
 =?us-ascii?Q?pl3sC1YP3jX96HvcQRtzVgjPd56fDY+K5KEWbLzM9OnSaNIuWNNp0uA4PF8s?=
 =?us-ascii?Q?PU50PiMHx5J0IUkv+bphUh4Hi7/4Em7Xt+Rsnmgq2/K1zOP2WyHoJhkr6sAl?=
 =?us-ascii?Q?1ANUE01vyXcaZaHIerhGIkPuoGh7pYij3pV1ofqUQvHvswoX+feQvC7H75Ii?=
 =?us-ascii?Q?iOMffkED9zlwpTuOFYDd6nKAqqBFSYDyhRdshdd02HqaTCxsqueWBPnAR6me?=
 =?us-ascii?Q?77aHSDkH+IrLztFPJ0d2r82+3YDEchBkCGU0UEULetr2v3NOGQbiOiy61F8i?=
 =?us-ascii?Q?ZdHBVXhKrcwYaJiuTLUwiMluXZf4Q7ZxkrJwqdEdzv7X86m7Rwnt5jUzqYpZ?=
 =?us-ascii?Q?50G+F7inWeK42xwm80jY2Qs2KE+o/L0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3019fd4e-28c7-4a5c-3512-08de6a622973
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:11:36.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKPwIsb1aZJ+LSVqloyi70PKQXQJ3anV7UwPL6T9bYbxj31i239mPjPgZbDiGlEyQxf25N+DXHTkjhK5YhBmx2NQ4B8EKKF+/7uO6eeLRFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698e17dc cx=c_pps
 a=h6NrD5D8j3GnK3ckJnoRDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=UhGsRKG8cyjctxJ2D5cA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: UyD7HIvnqZ5tIROQWZwZSx0B6u2JlreT
X-Proofpoint-GUID: zp4eZVrdMx98aoMJst4XjGCXgi3oTom3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfX3dVaPg3mNSO1
 /QxQwKQjGLG/C32W9U/ytAMRyL8BQrF/aGkoLydqw4ksofL8584pdHcRCH7rSZ62mGySdWKvpcq
 noMwyBl/bQ2CHv0oMiKuRA5gmtTCBhJcBjAbZvikrSdTpqx6WXvNCyGm5zn269gTuZcFJxaKVXK
 6p7cirqOl/CJSMXPejEj7OyNtFstgAoplGk5iAgACVkB7sYCL/KxGbd1JYYwdVpJm9CxekKsM/x
 o5cwXOk23G3ZBcYYrJDdyvDtqehRCimx5x85OeoMary16hZpUy+Hz2DqovyJjZfhn0nCbJNCHZF
 IAK6F/mwGSLFhk7unc0DvHaxqxOWR6IB+k/M4mV6WeHf+xyU7PyI1M8SGX+HR575iN5/riFHl0+
 wI2ge4EGTvZSA8zgR20b6JjHUb5fByrEnW+/ejPH5vhhu7K3wdDCpWU3Hw3oET0Q4Fj4QmJe/s/
 pqa0zfwxvgdU6Oh2JWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231069

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes buildpath issues when compiling rust-out-of-tree recipe.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 6226382001..2de7d4976b 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -43,3 +43,10 @@ do_configure() {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this
 CCACHE_DISABLE ?= "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', '1', '0', d)}"
+
+#Fixes buildpath issues when compiling rust-out-of-tree module
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+                     --remap-path-prefix=${TMPDIR}/work=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = ' KRUSTFLAGS="${KRUSTFLAGS}"'
-- 
2.49.0


