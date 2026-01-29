Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E6DD6B09D
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19183.1769704776375162806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YDdALnlt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T6pZVJ1463519
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:39:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aTPzpAtD8gMN5c1P/7/eHtwOEvJOM1wZwCoygOkWTZ0=; b=
	YDdALnltDSt3v9WbAWBUTF+vUJ5TVjjmgQC52LJ7oNuF+tSIYOMiRWVKL9L0X4RD
	DpCIs6o8O63TGt+BSOAqZgIAQ2EvypwRvgSs50N5I+SLKGPWqQieQ5DIqeReybPR
	NRi/QzaslTHKyiwoLFLn2UEA1C4TlIogw5LWDeZSD+sHyxE1gpPaNVDNRZ7Rab4p
	Vzn5HSjlU1QDX/1cEquPpgIkaDGuPDuZQJ7KTvbJ3spfAnblSQeqINiKj66voMyS
	aGCsOD4W3rD2jqulgGuO8W1Teb6u1FiRB0UHDAG+W5/bTIbpFUVvZ5/lE25t7DEq
	voW7pI9m0iyx4RpWfHgvZA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwrgsrc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 08:39:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtvtsDQ0z8OWaBpCLhYBvBjiT4Nxv0rHF1SOISkXw+11UBHpfSFjNG700NmQtVL0Fl9I9lWexWHWqihZgpGNgUwMU0aajJrh66Ot6mvK80vaM/f+Tp2Qw1itc+fs0ZHaAdPHGpcsrgHwCz/ajeWTDXqOgoqhL4rXyH/pE+UEsm+iepSIPIphrJ5tcsKkUL9kCxkeM9vdMqAFCc4QdgUXnb9aKTNTLuI8wfoKmpNegCggUwQCVKzUJz2PHnrwI5pxe43yxd4dTOSKJcP9ESzfKFhN//AP1uQfta+tvC2FmVjumw9LnZusdnxhj6ZZdiLIwMpGs8CmolHTJWeJ2Y9hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTPzpAtD8gMN5c1P/7/eHtwOEvJOM1wZwCoygOkWTZ0=;
 b=l2ShfFPiOXU5xpcdEn0RmLQ0iNA7fZ4U7+/kJ9HLbFAQ1rSeDZkY+mFZkOwSF3RphRA86d+wPRAgRo9zq8IufZhysOpRXUqqozgKIA57ut7lqU+oWMV4hzqipwnvOCqzTJ+adRRVPGDyLFCd3uWGR5ZbsLV5YctxUwTvNAG2uBAVG27BvNjNiztcYYPXc2zFDEqSJyMQ2MdNWMSIOBpY92wMvVehTl0tXi8dtc3dwLI93WC3RnoObEOvZ+NtKEkdbKnVPPPjkjg5YsLVLgXAmymJPWD05DgSHZmb+2M2LYy1Zy1dI91STVLksXDygn4gLiQi73NImhXRWr1ZS33ztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:39:33 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:33 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 05/15] kernel-yocto: Fix for buildpaths errors when rust is enabled for kernel
Date: Thu, 29 Jan 2026 08:39:00 -0800
Message-ID: <20260129163910.2612040-6-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: da03dc91-7e40-4f76-1dab-08de5f54fb3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19052099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SX93kK11UqnTwSGsUoUBtLDHku6Ajce4FRrrSRT4QSO1rkT/+wSM0ADWdSCK?=
 =?us-ascii?Q?DNl1lyNRQN9vvDvsk9iAU4nYq/mJXqEqp3O0GDt6l9uGSE90kqZCr906VfF1?=
 =?us-ascii?Q?sqDABTdFch7lIQn4ZoJuiDKt7Bv8J/9jbTLrSnyM1HTQGZUvdepbLE25/vxJ?=
 =?us-ascii?Q?UlHmi+AeKE3qXkrZnO+wxdS5N3prF8qRACuviSusZFSD3c8cEoTFXJGGgrMT?=
 =?us-ascii?Q?eNTi0QnnBuxey5FIbak72d2IRNpixxF/PbYpjJwZV0INAJ5VwIHf0lRdnAKV?=
 =?us-ascii?Q?EZsrfsOH3yixkaKwz9PSbpADbMmkfS+6soMg6iToWYFsE2d9spvb9tBdsZpW?=
 =?us-ascii?Q?DI3iWwq2mPXQ4KG8TuwibaVrarVD6IBmv3cJ5NI2gU5FN/3v7Bg7wehn1ac+?=
 =?us-ascii?Q?Tibe2V854hjd1PHMv3ZwIp2ANdJNdEXptrNeV6mCOc/g/qrhDGM9mI7uKzaG?=
 =?us-ascii?Q?EnXx68XtWUzsl/D4yO6bqltM7u175c2AjORQUsnMW1tmuT/drVUnuJMBT8o5?=
 =?us-ascii?Q?WAeSZEwUVpX1+ekDe3gei+/4xzTGAsNnBUMnj5pm2B8W9VgHBzrOtbq2nQk7?=
 =?us-ascii?Q?j1DeDdL9C5N1bDyN5rSyiQ7Mnj2az/iJY/dVgVSQiPy5c6iDMjcZkMDFNWq/?=
 =?us-ascii?Q?vsgm8D3KTmtpjZ4Lc2mDerXJAa6DM/ulcro5XeyickVqrR4F9uX5skNJY73x?=
 =?us-ascii?Q?yrL+z+cLMs1Scs07oFyscMnEguuAKj9k71boKKvwBul68apioBQnkRfPccSt?=
 =?us-ascii?Q?Mp9I/7C8rNCl/bPSKTxxEKWi6d7A+A7a22bEtIy0qqqNhDRH4M41lBXkwI42?=
 =?us-ascii?Q?zNN/9oqUDco5KNDIztozQ6gnr0UGr4TivJXMVs/o1DojYvHIbAIRoW9JxHwY?=
 =?us-ascii?Q?eFgCK+ubm7WRbQlS4gB2XR0IFg6UsYC6z7kcSRyH+GM63ka5Fiz/buaVVtyc?=
 =?us-ascii?Q?hmkK3sGzCRmN5jxMzd3iDN4lcqrni0N4i77Jdc7iUi2Mtb3Pmo1Cj6uk9hbS?=
 =?us-ascii?Q?o4jru9p3v96zGJVnnjaNRCx2UuXmMpjK2wvww0leWHTAKNUBfwElGNmhO6Vp?=
 =?us-ascii?Q?DJ/5c5dH+hfupkqmhmdtkcr+Kcg2RHkS6YY2Bg6MvNIHi0ibaa0lWSoxY851?=
 =?us-ascii?Q?2Ek+i/bqJqLlAOsqVSwpOBvY9LOry5p24GnlbWldvXGS9QlYqDkEoqTywu0S?=
 =?us-ascii?Q?fq2qzYIhkkpsLRPqpm7ROPWo/YMjY0uJzkUM73T7bl1r467VycglmeNBhOI3?=
 =?us-ascii?Q?jpi1Tmj7FY3MhgIkyf2n2nz53Ur3J+CxOuqQemJUj6jPFPnnianfPPbEzOvR?=
 =?us-ascii?Q?p/Ij/jTclacTVZOYJWl6JfvUt4tMQatysvHcJmEtntHfUr2OpD+F19BsmIIJ?=
 =?us-ascii?Q?BUHvOWe7d5qvieffRDP4CmGsPuoUYk2UJe/aa6uGKqDlTwHBPl1xlOsPDhBF?=
 =?us-ascii?Q?IkpIa7snZglpQW2ln2FInrRAzr2GYWj6Ur+Yaqx0NqsBjrte15cSEhE5WxTL?=
 =?us-ascii?Q?m8dpemGARn185a/NIt61BX+JgbFZBqpcV68IZ4pWqyaVfmZyZwypMI+RQuQt?=
 =?us-ascii?Q?m3LKu01/69j+ADBXUOBD59LJhBPiJJ6q4eZp6ek9bUwwKRdG1VsrJgKse8I1?=
 =?us-ascii?Q?edTYhmZRBF3TigSFRZd12sM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19052099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wtOGHVj7rEsnqRGc6qhJ6/C2y5zncb6ZRkJLsF61UZ/oQoNag7oafHjZDEVj?=
 =?us-ascii?Q?061F9CIFg0u2CMI/54VbSlwf5LK66NUkekog9zyxqQ/zsxNA9zTmyb+BMdE+?=
 =?us-ascii?Q?VFY5t62/mE6p/8qsmjUniltrkEZsnyfNSDWaY8ATPpDbNU8vBIn0EPvB/jdT?=
 =?us-ascii?Q?fMABvam1BjZ981DqvbVGMbfUTnWj04ajv9lDB1ENbhG/gXESYYYRK2ElOHhk?=
 =?us-ascii?Q?eCwQeKVjPf4h/i68chmN1x4dLbKiHrtcsbJgmATNbbtQQM6EDtf2s35jCX1o?=
 =?us-ascii?Q?BP0j4scKTtO+tAysZ6HfhgjLsKKK+MtWA3qnPNNuSycIoymRWwIurpdajt61?=
 =?us-ascii?Q?wMgTECOZQs//PqDE5poRIuygXal8LLPgV9TUNU8kHN1Y47EfxY6gbAVyrgDL?=
 =?us-ascii?Q?7bVdltDjT+jWguuHGEWRk6gfI1R8n8LzLZEgiibWcNV87bI5qzfJgf99TNWz?=
 =?us-ascii?Q?5aHehP9ZgyPKL+PmmJRLLA4INRlbMja4WQORDtn6y7kBuS0hJV7IRAfaYSJy?=
 =?us-ascii?Q?e/3AaoUKLRk0R4RiWMDxwg3N4O4OsyiNjxUxaBQLXLBtNVYa44jf7ctPf8u3?=
 =?us-ascii?Q?WUVVgSMNj2gDmOM1yyUXdK6crJcw+fxmCBa80eb9Eb5FErFEO7oBGRDJV0Pb?=
 =?us-ascii?Q?wdeM2jkS/4/Ahj/zTEglmBDv8N52JQYbULofek76aeKAXZ6TEmIMZzIWmNDf?=
 =?us-ascii?Q?I/7XrsoIlibdroITDox0BknaI2f/CimyCtGEPo2BMytvEK2o4KzjgCd2IAoY?=
 =?us-ascii?Q?KThKqilsFxpr6JHzAxdurJZY3eON0dXIJwXDh6KX1gRYkZq2jQzcLMswi8dv?=
 =?us-ascii?Q?RHD2G/Q+8x2Sh9RW70p7aqcfPlrmxn0VmGk4UhZVxDzc2x931S1NE7bhPYus?=
 =?us-ascii?Q?mDx7MuwQwEPVo4jM7742j0H9DJJN7vIZrW3fnh3VqMb2gEfMakXLXl0aUNo3?=
 =?us-ascii?Q?B/dgOWeOkjKku6W2ZuwUBidpdBVhCa8+vQNCt6FxESMbkITBIlKVoEQvvIzL?=
 =?us-ascii?Q?ut2CK4XjACLujRdo3LhGJup94J8B7iOmL6BTsL2w7W9R/jmT27YKBpKyyOy0?=
 =?us-ascii?Q?xomR6SgddbfRKgWzzOgmXfxrskhXhyi89mcFoySP/8SC+XMi89JCa7yW+oEs?=
 =?us-ascii?Q?ji9PmSj+dmM6kc9UWvVVyl4Eisk8N3uDI1Pw+vWaJWsPQ6quKHf8xn1/wm8n?=
 =?us-ascii?Q?muDzh0af0P4TMMqvEy1MtbqvODr1CFF2QaLCWG/Ullxn/HUH2P8Ipmew24O3?=
 =?us-ascii?Q?Y5JTZNUmx4AC5fF8vw/CQvUm5BmSk8t7dy0KciGKhkgcNIsgOBkftNxCF8rj?=
 =?us-ascii?Q?BdU5HQXmd8iPaxcP+P0unvK3xEBElPZmbpZFurHWtE5DWV6t3cvTVZX853D+?=
 =?us-ascii?Q?bIyfSvhObUQ9NZm8wDDpQGPwx7XYCPouz/jVMKwVUvY7HaOWnFwa6HOfTmKg?=
 =?us-ascii?Q?VQRz77KMusCjt0qXqc0dD99gliPJrouixs6gj0Se22dqAFd+PGcxJOZFFxkN?=
 =?us-ascii?Q?g2kUUsEyxEg7S2pst9nSdEyp5enaGeAgt0CTD1x3otZ/WMZtJ72ntsI5yLUd?=
 =?us-ascii?Q?Kq4NmU1J/Z0dlxPnx/dEygMO7XXPjycZc4TZ5FMpt95dto1pyNYj+BWZxqtJ?=
 =?us-ascii?Q?eL3tf3UuZ+zvwRLk0BsKE2gb/S+Qnjv9xz2zICVLkf2WTBQdSsoXvqEiSNK9?=
 =?us-ascii?Q?lg7+Kk4yLCRpfvgiDepuz9UyQrs1Qkcc1ZAvILWhzYWFJGoyCNe+4gv9bj7z?=
 =?us-ascii?Q?cFNp2hT+qVj4dvXNjZOLP8QXsTaXn9g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da03dc91-7e40-4f76-1dab-08de5f54fb3b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:33.0758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Yt5G6TsmniKDWkPhQ17juKGrAUS36GHL11xkjkzKIrraidXB0uUfxVtfhLY9N9K82MIQxC+eoZxZr9nrL1K6FelHk1Dq2dMhx+45UFu+8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Aez3Keb7FLSNqcLd7oiUh6-CId2iZweT
X-Authority-Analysis: v=2.4 cv=KMVXzVFo c=1 sm=1 tr=0 ts=697b8d47 cx=c_pps
 a=+/t0CT+QaJpOasvqRK9qOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=hOBxLMctpgrGYW2eJecA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX8KMABadEmAYE
 1R7hpXlJUcDTRxbF0N7Uq+tUP4PY75XyUpIfsboeX9bIzai2qkbU3KeX5C7+0E7SysbPMTt6YKG
 rhVyF84EGKA7VoY3ih+CQQDkJ001T2mBWYHga6CTw06+Bh5CspHdt5M10gzHOHpUIT3/TjgDo4d
 TTGsqgAnnAPgT0KRTwzU/0nHRu7wgrldQrftLmy5UqBiHIpQ84EJ7r8bGF/VSYm1nZ84pJw8V3x
 GOzdhNEmLoHPzebrAqe5TLICTFRD+mPPFjZzsHoD9bOvR/s27nSI7MC7RFeYIn4nte6yB4ZyBxE
 qKbjJ09Ya9J7fcMG6+jYOPsLrvsrsREt9oAQg7uywoFXk/0N1a6Yc2TizyClJNKnhPeKr9zZ5nn
 2U+BxbuTrx3Jen+iyJcBUb26oavKoDrMAXyJQFPVg7D7pq1ssyz8/yBJ1ovfKuz1WM91LXDqiuf
 c4Iyb3cPgkE2D7AQ2mw==
X-Proofpoint-GUID: IdaRa01KOxcQ2Tah9bm5HnosSnN5CBl_
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
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230146

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


