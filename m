Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6292A106ACDC
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 18:52:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.289.1773341567107426966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 11:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Li2nOtSl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7531442a75=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAZ29M3563852
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 18:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Z+BwQrsZuPYYRDLoknMCGP
	dtnRVMHtTYPN2lY7SikuE=; b=Li2nOtSlvpj2I0rknCM7forfaHODytKQPn2XXP
	UjhO7imbh+XCptUtf/i1a63P2jPKISLLUzcwZabCLnR/BMyBqr4R3WYezGbmW6U7
	Qtv9FjLXXLux35OnOgPLgiGCh8EVd+dfCQuclqfmOiyCAvAcKUnHReK1qKulFmyv
	YVGd0N4Ao3wJ2q0mtDxaw+eMQGQHx7bK3yXasJHEA3o6EmRDDN1es4j5orGfTEfp
	FxvF3qo7nIs9rGpY+hNiy30CvihHu/rDq4gSugS1SuUtPJLJ3hRgSTzO0nx3HtsK
	FBO6Vj7xdGGe9lx4iK83mTDT1AWcP+IQJkXDUnmPIncaFXVA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78h5tm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 18:52:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PY53WYyExFVDQGtu4W7L2XzYeSR6cbF0rL4VeywX3kPhNFWYwMA7q1FcVgb9Avuh8QzLhlCbSUh7rP9G5t2KBoBcq5SwntzhI4MYe+J7O5a3iY8qDuSDGqUGcUnQXcqcDMOdqEXf4W87mDoQkMGu3prNvjByTvwzy7oUsoclieoBDP/HOs9PD/ADYbIwJQV6YrIp27EhZB500rtjjVK+quP0kVZYtvNI3RXaZJVgrJIDuuyAXSI2EcNYoZV5QIAdmk+mvExn5qhxjxYCp6H+x3Z3Spmtgrm9cOiCIZ8IQutTu+DFRtk0ILmRcbC7idlqgORlJ+3PUjmykSViYIBtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+BwQrsZuPYYRDLoknMCGPdtnRVMHtTYPN2lY7SikuE=;
 b=UXx2WuCiKut9owfvfH8nRwJ5PwCnHBwtZsXu2NWXX/nbCk20LNHsUkscWcVWYwmXdcvGfF/rR/NGGHr0FaYpHB1OdyZJlcRTaLQlOG0GKphnxNgoUcuZFQhxIa+rZV7wV/xCC+9ztzIjolt7l14ipWpP/8JEglkVusAPmc2Wo2DbiKv6neawOJ2tSVMmi3shwKoc1b3YvcmZ7QrXCAVVFHKvxe57kq1sElWu9aRmt8aDIyuJt2w2n8CB8qHcn8r4JA/daiMx73vz06PjLZdHQqe3Cm8NZuIF38kuYm4UMtxdKLRxrgd7RjER+Exnc+PT0KLxZaB7gio+Nz0hceEILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by LV3PR11MB8553.namprd11.prod.outlook.com (2603:10b6:408:1b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.14; Thu, 12 Mar
 2026 18:52:42 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 18:52:42 +0000
Content-Type: multipart/alternative;
 boundary="------------rr0D04eggyQxjhYNsrlaPupv"
Message-ID: <026e2eed-609c-4689-b593-a33333957bdc@windriver.com>
Date: Thu, 12 Mar 2026 14:52:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 8/8] busybox: fix printf ptest failure with
 glibc 2.43
To: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
 <20260312161038.2578649-8-Hemanth.KumarMD@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260312161038.2578649-8-Hemanth.KumarMD@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::17) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|LV3PR11MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: d468c893-c2b2-4bc0-be7a-08de80688a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|13003099007|8096899003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	UgwssaG62f0ojirBUcL/wrapXbibMjE3rvB1VKfW5qdfqaJtTt08sqnOt1TpybFcnfOBMiyvX++ihf5YgiNVZr1PLrQiz6zFSC69gLoIHNB+PxBtNC0bFONnu27uNMOzzIbmSWXkGE51n0xoZVfikXLaYL/T+ybSXjmm5XnCjmWxD/kBahGwkF14M6W/o0472G4zz+I8A7V2tkq+V2qLFUeBVYGzulBYsbLPNkf2O70usnxqD65HhzoWqiwh8IRWeAKizr6GI65YA6zIK4iPE8dVpR65SLw0WqNhVFPjSf3pqbv5WT3mAYuzgeTnhN3nQx7xDSpI/5luHA/sUlkBTYI+7g/rbfR8D6bUIfDAgKDWk3VTrYuANBiIfIgv/1o2Qp2e3YTRJaN5CDti9iUhq2mKkyDnJOexkUKM8n2+L78L8YwWPAZ3f/DqA5NmwS0R2HXm6zgzzklIEKPnMWbEy/fend3AdRT0AwsoG6SPSuzAR9IYVvKqATIQ+PwIBBORXjmsrkrp1SNmAUzNpBTxeMeleiK1kXrdU8Qdf0SCbSxOa7TbXfU4TXRIA27qTfzMgu9MlUvJ+Metc7p/ojnpFpRqhIvMAHKA5iIzfvqfXCBHw5k/QZTwMp7nmS01rImS33CcA2s0OXFEc4dgvp8hyIuwcLTyNYxEAkFKSAPcfo3+82TnbrbRa9YvdqYQoVjq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(13003099007)(8096899003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1JlMTRSSWVHMHFnQ2pBdkV5OENOOFVSbVNabUdFWDMwTUtsaTA4M0oxR2lQ?=
 =?utf-8?B?M0VVU05JMVErOWZhSGRUeDBlZW5kYktZVW1LL3hGeXpDSk9KVDB0S3RBQTZo?=
 =?utf-8?B?aVhzSHpqcVdieVpXdUxXTXQ0NmlMT0dZM2twT2FhaWIzai8yRStaTmYxUFJY?=
 =?utf-8?B?SjM1eVpqS2tJWm9sNXA5NVdhWG5xNk9rV0ZzZGppZ01IOTQvRVdBRDlVL2Ux?=
 =?utf-8?B?cURmeXE1eEw1MmJISW9yalQxM1Z6Wi8yRUJKSFpSOEIzT1g5d0Rnb3A0cFIr?=
 =?utf-8?B?YktuZlNOZEVOd1hrOEtoVkxER1FJcHFOQ2FCZ3NQUFl0TzFNNEJGa3A1QTFK?=
 =?utf-8?B?M3dGem1ISklrbEZ5S0dZYlc5cG5NTDZlUGFOY3dtU0hYbERLWDVCWWJrOC8r?=
 =?utf-8?B?eWxDVkRaZTBsanN6NFFTSDlKdFVsZW45SEVpQlJXWkhtMy9wWEpuREdScE01?=
 =?utf-8?B?OTNHN0MyUDAxYXA1NTVrTitOU0dlKzg5K3ZpTU5Od0hlbFNFYkNueUJKM1c2?=
 =?utf-8?B?OVE1TlIrMnpMSHRTRm1SRks5b0N5YWxhbDhESmk3VE9ZWUQ5eUtRWTAwaU44?=
 =?utf-8?B?YnI1MGRpRWZYYWVONkp6QlBiZm1GWm5WbG4zakRGVWdlR0NYeHhhRWZiNnhP?=
 =?utf-8?B?VDlSY1o0bjdoSENXRDBNQ1ZEamtCcmhyZTIvWFFNY2pOUjQ3bm9SWU9LeXo5?=
 =?utf-8?B?aytXMFlqcDJIOUJzc0VOT3NOSGhTT2ZNNFFHM2hraU5EeVo3VjNweFU5c0ZS?=
 =?utf-8?B?Nm93TlZCT003TURvN3BjdDY0QTFWNHUvR3E4K1U5UE40T3d2czJ2cXpWRVNJ?=
 =?utf-8?B?NmpGcEttRW1jZFpaRHNwUzdJTjY5TzlMUmh2byt3VlMwTVVKT2NtMEp6aDB4?=
 =?utf-8?B?MitxYnVnaEwvR1hKcFFKTDMxellYQVh4ZFBISXh3dk50MHdJWC9OUmpXb3c4?=
 =?utf-8?B?ekFKVndZRDdzaWFyRDZYaHc1OTZib3pZOUI1cERtMklQVFA5Wjhxd3U3S1Vp?=
 =?utf-8?B?blRQYm13MjZMQW5DeHZxTGFhZHJHNFYvRWFhcTRrVlVxODRXa0tWUVhTOTA0?=
 =?utf-8?B?U1BVVjhSZGJMWkFyY3A2ZnowVFUzUjR6ZWJqQVBOYk5Ua2RtUUlYYk1QbFo4?=
 =?utf-8?B?Q2xpNDVxQkpLdVlEelIzWlp3R0VWVkhjYkk4dndBOFZyVkh4SHZ2THZvWUZa?=
 =?utf-8?B?NStSdmhac252YjF0YmRPaHRsSHZoaEtkZU1zTkFmMEVPUXFLczE1L2p5VnRJ?=
 =?utf-8?B?U3crT25sYUR2dXArTzNHWFU3eUlFejZZMWxVYUhFdDlmazgyZVY0TENDMjZ4?=
 =?utf-8?B?cy9pNDhUN2h6dWkyMHI1dnRIbkZDU091WlVER3A2eUUrT3JjdkhpTXgzeFZl?=
 =?utf-8?B?NW1qcGRzSEtSS1BEc2UvVkZFSEE3Z2ptQTh4NHIxdkxhQmYyS3p5Yk1ubkZl?=
 =?utf-8?B?cHk2UnBoU1Fya1JYazlpSlpZWC9DeHN1d093ZjFzUHNMdFVXUW5ybHVUOXZW?=
 =?utf-8?B?STJ1SnpWcEY3VnFCOWdza29melFlajlYWGozaFNFNnpWVXZUaTBOSXRyZTVI?=
 =?utf-8?B?V1ZMbmFndDY2QzRWeXVPS2w5VVpKWEhpK21xSGRrbFJhcVdaSlozUXg0VzZh?=
 =?utf-8?B?bW9HN1BoYlROL0hoWWxQWlBnQmI2MnAzaEh2aGVGZW9kSm81RVJMMXlJN20v?=
 =?utf-8?B?Wmw2a3BjckJUYjlyZkM2SUJXRG1XdVlWdy9CaXlJaHdoeTBJTEdPWThmQVY4?=
 =?utf-8?B?TEgyWFB6UkZWcjJHZFhIRk8rZ016MHRSNjcxeUtvZTV3bElUU2hXZ0VGaXhM?=
 =?utf-8?B?bm85eDJvbHh4ZDY1WU9aelBuWUt1QVVXbWplSDVHa01FMU1TdS9OcTNjZmJ1?=
 =?utf-8?B?azNQQkZtQWhLRGdLcEFaRjk0Y0lsakUwVEF0Rk1PUDNsWXFGU3ZHNitBVFB5?=
 =?utf-8?B?Rm02L3ZENlhIK0tCTjJnSXpVa1hydUFCRFk1QWk4MlZ4ZmxpU2ZDZHZTNFQv?=
 =?utf-8?B?UW9ZTXZwOXJFTnAxNERGMVVPUlE3VWNHQldMSHlWTEcwL0J2eExCeGlqT09l?=
 =?utf-8?B?dkw2K0FlRFVTckR3TGNLVUp0UEplUmV5U0R2dVpBTk5RY05iV1J6Y3VwQy9U?=
 =?utf-8?B?SWgweWFpcVFOYVZRaVpxK1VLRGEvSTd6UEM1ZHRaU0xRMXVnbDdlai9NY29m?=
 =?utf-8?B?Rk9KMTcxRmFKY0p6SVBBbkwvUEI1TFh3dDllSkNsTWtISWE1amJtMUMzL3pD?=
 =?utf-8?B?T29zR0pLbW1RSisrdnRxMEpZQU4xYlY0SkRsTHl4TE1BbnBYRnBlQWdOTGFJ?=
 =?utf-8?B?TjlYaVhxRE9EeDArUThadDQ4REp1WXlvQXdqY3pPUmhoM0dpK2ZYeXovT1k2?=
 =?utf-8?Q?OaGy3ZWb0k99mpiw=3D?=
X-Exchange-RoutingPolicyChecked: 
	kOB3Utu2KmT5VjJEVUV5h5jYwt68U9rMNEcEDxHW344PfOarVezwJYv2OKDfWR01fR4sBrPPhda3N+gppDVEPT+IZem6YpxnFpkmFrdOt2i+W4v2G9IWKaewWJ1tSCQjz/KO5nyjeVPmlfya2WzNY5/RUG5MMfBvPJgmRM0aqKGmPoJkWc4nujiA7LICbA+7pg/7wnjb9O4e6m6tI9KUVFEUGa0XdQvXx253g4T59Ukpdmw+OlTkaMaDLj82img1V7NClpsau4mjsQMu+xA6y3WFCi+AdRP30PXa0p3pDG1dmsEYAcnZxMNewS3iX0V3UDlDE7rP2abJBfQ/NRYFmw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d468c893-c2b2-4bc0-be7a-08de80688a5f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:52:42.2146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLIQTwFk2p1VKNnkAPHWbbh+FrS85KIBIWq3br+tUyzxnqiuCJ23nD5/0w8Pq+Am0T0uck+/siO9fL1XC7bvAaj9HkTgy6Lo/3xxYxNTlRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8553
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b30b7d cx=c_pps
 a=rV7DuXtNeKhYS0+Ag8nf3Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=xNf9USuDAAAA:8
 a=J0Tn2xNtAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ru-YVbAE5p2h2ykzl5kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=YQSmzvE0HJ30lon9qkIA:9
 a=RWpDliq8ATi-v07Q:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=3w6iy9BqfFbDrj__1GvT:22 a=9ZcRxastL33iXWX1AWsW:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MyBTYWx0ZWRfXzsMJO31IK5aS
 u+r9bcXBECXFeput32EjnXbOmzWsa8Yxtmz8quV0CMuFgAnR7zxdVVAeMD0zFaY5830uZNXywGb
 AR5k0N2K81k7vYnBz1C+Xf/DPN4EwtujgEqBoObEYWI/BCHlknPgQRk3PRqmlN/oy1betaBAfKO
 Kc2t2kdd7wVtxKGATy+l2oA1nXtyePsBegriAhi9lwT6I9l8+WiAoF5I5dit/vja17bLolUD3jN
 NWewR88E2Br5ojIUbfYTjmBBNlEQ0qBtuzANKwlARBzm5iYteRY0oQBcD0tSCAKDHt0zKqTU8Q6
 UT1D+YtbDQktjuI6W30Fkoe6q1lWtaAyXrfxiwdddkSb6v3Qa8AI1vR5nxLSMNZiT5NPP6iUjD3
 5BsTkR/OglX7sHqVhzGVYHUv5qWb8p1XEhpKOoc4BACNtHKkxrl9mMRLLvb5hnWMTmLyuN70ex3
 gQhUs0nOfgzHLtaZOTQ==
X-Proofpoint-ORIG-GUID: ttsWD1QukPZ6Y4vaR84UHbPnULk5z1of
X-Proofpoint-GUID: ttsWD1QukPZ6Y4vaR84UHbPnULk5z1of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 18:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233000

--------------rr0D04eggyQxjhYNsrlaPupv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62CAZ29M3563852

Hi Hemanth,

On 2026-03-12 12:10 p.m., Hemanth Kumar M D via lists.openembedded.org=20
wrote:
> From: Hemanth Kumar M D<Hemanth.KumarMD@windriver.com>
>
> Following ptests were failing on aarch64 after glibc 2.43 upgrade:
>    - printf_understands_%s_'"x'_"'y"_"'zTAIL"
>    - printf_handles_positive_numbers_for_%f
>
> Backport fix from Debian bug #1128825.
>
> References:https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1128825
>
> Signed-off-by: Hemanth Kumar M D<Hemanth.KumarMD@windriver.com>
> ---
>   ...printf-ptest-failure-with-glibc-2.43.patch | 114 +++++++++++++++++=
+
>   meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
>   2 files changed, 115 insertions(+)
>   create mode 100644 meta/recipes-core/busybox/busybox/0001-busybox-fix=
-printf-ptest-failure-with-glibc-2.43.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-=
ptest-failure-with-glibc-2.43.patch b/meta/recipes-core/busybox/busybox/0=
001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch
> new file mode 100644
> index 0000000000..951812532b
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-ptest-f=
ailure-with-glibc-2.43.patch
> @@ -0,0 +1,114 @@
> +busybox: fix printf ptest failure with glibc 2.43
> +
> +Following ptests were failing on aarch64 after glibc 2.43 upgrade:
> +  - printf_understands_%s_'"x'_"'y"_"'zTAIL"
> +  - printf_handles_positive_numbers_for_%f
> +
> +Backport fix from Debian bug #1128825.
> +
> +Upstream-Status: Submitted [https://bugs.debian.org/cgi-bin/bugreport.=
cgi?att=3D1;bug=3D1128825;filename=3Dbusybox_glibc-2.43_thp.patch;msg=3D1=
0]
This status is fine for now but please submit a follow-up commit to=20
change the Upstream-Status
once you have done the work below.

This URL isn't what we usually mean by "upstream" since it's Debian not=20
the busybox folks.
Also there's no evidence that that patch was submitted to the busybox=20
devs so the "Submitted"
status may also be incorrect.

It's good to cite your sources=C2=A0 but please review:
https://lists.busybox.net/pipermail/busybox/
and git upstream busybox git repo:
 =C2=A0 =C2=A0git://busybox.net/busybox.git

to see if the "true" upstream has a submitted or merged fix.

If not, please send them the Debian fix and CC the developer
ensuring that you don't change the folks from:

https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3D1;bug=3D1128825


Thanks,

../Randy


> +
> +Signed-off-by: Hemanth Kumar M D<Hemanth.KumarMD@windriver.com>
> +
> +diff --git a/coreutils/printf.c b/coreutils/printf.c
> +index 3cd48cfcc..a5d995ab5 100644
> +--- a/coreutils/printf.c
> ++++ b/coreutils/printf.c
> +@@ -191,6 +191,7 @@ static void print_direc(char *format, unsigned fmt=
_length,
> + 	double dv;
> + 	char saved;
> + 	char *have_prec, *have_width;
> ++	int saved_errno, ret;
> +
> + 	saved =3D format[fmt_length];
> + 	format[fmt_length] =3D '\0';
> +@@ -205,22 +206,32 @@ static void print_direc(char *format, unsigned f=
mt_length,
> +
> + 	switch (format[fmt_length - 1]) {
> + 	case 'c':
> +-		printf(format, *argument);
> ++		saved_errno =3D errno;
> ++		ret =3D printf(format, *argument);
> ++		/* Restore errno if there was no error */
> ++		if (ret >=3D 0) {
> ++			errno =3D saved_errno;
> ++		}
> + 		break;
> + 	case 'd':
> + 	case 'i':
> + 		llv =3D my_xstrtoll(skip_whitespace(argument));
> +  print_long:
> ++		saved_errno =3D errno;
> + 		if (!have_width) {
> + 			if (!have_prec)
> +-				printf(format, llv);
> ++				ret =3D printf(format, llv);
> + 			else
> +-				printf(format, precision, llv);
> ++				ret =3D printf(format, precision, llv);
> + 		} else {
> + 			if (!have_prec)
> +-				printf(format, field_width, llv);
> ++				ret =3D printf(format, field_width, llv);
> + 			else
> +-				printf(format, field_width, precision, llv);
> ++				ret =3D printf(format, field_width, precision, llv);
> ++		}
> ++		/* Restore errno if there was no error */
> ++		if (ret >=3D 0) {
> ++			errno =3D saved_errno;
> + 		}
> + 		break;
> + 	case 'o':
> +@@ -238,16 +249,21 @@ static void print_direc(char *format, unsigned f=
mt_length,
> + 		} else {
> + 			/* Hope compiler will optimize it out by moving call
> + 			 * instruction after the ifs... */
> ++			saved_errno =3D errno;
> + 			if (!have_width) {
> + 				if (!have_prec)
> +-					printf(format, argument, /*unused:*/ argument, argument);
> ++					ret =3D printf(format, argument, /*unused:*/ argument, argument)=
;
> + 				else
> +-					printf(format, precision, argument, /*unused:*/ argument);
> ++					ret =3D printf(format, precision, argument, /*unused:*/ argument=
);
> + 			} else {
> + 				if (!have_prec)
> +-					printf(format, field_width, argument, /*unused:*/ argument);
> ++					ret =3D printf(format, field_width, argument, /*unused:*/ argume=
nt);
> + 				else
> +-					printf(format, field_width, precision, argument);
> ++					ret =3D printf(format, field_width, precision, argument);
> ++			}
> ++			/* Restore errno if there was no error */
> ++			if (ret >=3D 0) {
> ++				errno =3D saved_errno;
> + 			}
> + 			break;
> + 		}
> +@@ -257,16 +273,21 @@ static void print_direc(char *format, unsigned f=
mt_length,
> + 	case 'g':
> + 	case 'G':
> + 		dv =3D my_xstrtod(argument);
> ++		saved_errno =3D errno;
> + 		if (!have_width) {
> + 			if (!have_prec)
> +-				printf(format, dv);
> ++				ret =3D printf(format, dv);
> + 			else
> +-				printf(format, precision, dv);
> ++				ret =3D printf(format, precision, dv);
> + 		} else {
> + 			if (!have_prec)
> +-				printf(format, field_width, dv);
> ++				ret =3D printf(format, field_width, dv);
> + 			else
> +-				printf(format, field_width, precision, dv);
> ++				ret =3D printf(format, field_width, precision, dv);
> ++		}
> ++		/* Restore errno if there was no error */
> ++		if (ret >=3D 0) {
> ++			errno =3D saved_errno;
> + 		}
> + 		break;
> + 	} /* switch */
> diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes=
-core/busybox/busybox_1.37.0.bb
> index d3851a27b9..2a38372339 100644
> --- a/meta/recipes-core/busybox/busybox_1.37.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
> @@ -59,6 +59,7 @@ SRC_URI =3D"https://busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \=20
> file://CVE-2025-46394-01.patch \ file://CVE-2025-46394-02.patch \=20
> file://CVE-2025-60876.patch \ +=20
> file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \ "
>   SRC_URI:append:libc-musl =3D" file://musl.cfg"
>   SRC_URI:append:x86-64 =3D" file://sha_accel.cfg"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232994):https://lists.openembedded.org/g/openembedd=
ed-core/message/232994
> Mute This Topic:https://lists.openembedded.org/mt/118281850/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------rr0D04eggyQxjhYNsrlaPupv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Hemanth,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2026-03-12 12:10 p.m., Hemanth Kumar
      M D via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260312161038.2578649-8-Hemanth.KumarMD@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Hemanth Kumar M D <a class="moz-txt-link-rfc2396E" href="mailto:Hemanth.KumarMD@windriver.com">&lt;Hemanth.KumarMD@windriver.com&gt;</a>

Following ptests were failing on aarch64 after glibc 2.43 upgrade:
  - printf_understands_%s_'&quot;x'_&quot;'y&quot;_&quot;'zTAIL&quot;
  - printf_handles_positive_numbers_for_%f

Backport fix from Debian bug #1128825.

References: <a class="moz-txt-link-freetext" href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1128825">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1128825</a>

Signed-off-by: Hemanth Kumar M D <a class="moz-txt-link-rfc2396E" href="mailto:Hemanth.KumarMD@windriver.com">&lt;Hemanth.KumarMD@windriver.com&gt;</a>
---
 ...printf-ptest-failure-with-glibc-2.43.patch | 114 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch b/meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch
new file mode 100644
index 0000000000..951812532b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch
@@ -0,0 +1,114 @@
+busybox: fix printf ptest failure with glibc 2.43
+
+Following ptests were failing on aarch64 after glibc 2.43 upgrade:
+  - printf_understands_%s_'&quot;x'_&quot;'y&quot;_&quot;'zTAIL&quot;
+  - printf_handles_positive_numbers_for_%f
+
+Backport fix from Debian bug #1128825.
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=1128825;filename=busybox_glibc-2.43_thp.patch;msg=10">https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=1128825;filename=busybox_glibc-2.43_thp.patch;msg=10</a>]</pre>
    </blockquote>
    This status is fine for now but please submit a follow-up commit to
    change the Upstream-Status<br>
    once you have done the work below.<br>
    <br>
    This URL isn't what we usually mean by &quot;upstream&quot; since it's Debian
    not the busybox folks.<br>
    Also there's no evidence that that patch was submitted to the
    busybox devs so the &quot;Submitted&quot;<br>
    status may also be incorrect.<br>
    <br>
    It's good to cite your sources&nbsp; but please review:<br>
    &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="https://lists.busybox.net/pipermail/busybox/">https://lists.busybox.net/pipermail/busybox/</a><br>
    and git upstream busybox git repo:<br>
    &nbsp; &nbsp;git://busybox.net/busybox.git<br>
    <br>
    to see if the &quot;true&quot; upstream has a submitted or merged fix.<br>
    <br>
    If not, please send them the Debian fix and CC the developer<br>
    ensuring that you don't change the folks from:<br>
    <p>&nbsp;
      &nbsp;<a class="moz-txt-link-freetext" href="https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=1128825">https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=1128825</a></p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20260312161038.2578649-8-Hemanth.KumarMD@windriver.com">
      <pre wrap="" class="moz-quote-pre">
+
+Signed-off-by: Hemanth Kumar M D <a class="moz-txt-link-rfc2396E" href="mailto:Hemanth.KumarMD@windriver.com">&lt;Hemanth.KumarMD@windriver.com&gt;</a>
+
+diff --git a/coreutils/printf.c b/coreutils/printf.c
+index 3cd48cfcc..a5d995ab5 100644
+--- a/coreutils/printf.c
++++ b/coreutils/printf.c
+@@ -191,6 +191,7 @@ static void print_direc(char *format, unsigned fmt_length,
+ 	double dv;
+ 	char saved;
+ 	char *have_prec, *have_width;
++	int saved_errno, ret;
+ 
+ 	saved = format[fmt_length];
+ 	format[fmt_length] = '\0';
+@@ -205,22 +206,32 @@ static void print_direc(char *format, unsigned fmt_length,
+ 
+ 	switch (format[fmt_length - 1]) {
+ 	case 'c':
+-		printf(format, *argument);
++		saved_errno = errno;
++		ret = printf(format, *argument);
++		/* Restore errno if there was no error */
++		if (ret &gt;= 0) {
++			errno = saved_errno;
++		}
+ 		break;
+ 	case 'd':
+ 	case 'i':
+ 		llv = my_xstrtoll(skip_whitespace(argument));
+  print_long:
++		saved_errno = errno;
+ 		if (!have_width) {
+ 			if (!have_prec)
+-				printf(format, llv);
++				ret = printf(format, llv);
+ 			else
+-				printf(format, precision, llv);
++				ret = printf(format, precision, llv);
+ 		} else {
+ 			if (!have_prec)
+-				printf(format, field_width, llv);
++				ret = printf(format, field_width, llv);
+ 			else
+-				printf(format, field_width, precision, llv);
++				ret = printf(format, field_width, precision, llv);
++		}
++		/* Restore errno if there was no error */
++		if (ret &gt;= 0) {
++			errno = saved_errno;
+ 		}
+ 		break;
+ 	case 'o':
+@@ -238,16 +249,21 @@ static void print_direc(char *format, unsigned fmt_length,
+ 		} else {
+ 			/* Hope compiler will optimize it out by moving call
+ 			 * instruction after the ifs... */
++			saved_errno = errno;
+ 			if (!have_width) {
+ 				if (!have_prec)
+-					printf(format, argument, /*unused:*/ argument, argument);
++					ret = printf(format, argument, /*unused:*/ argument, argument);
+ 				else
+-					printf(format, precision, argument, /*unused:*/ argument);
++					ret = printf(format, precision, argument, /*unused:*/ argument);
+ 			} else {
+ 				if (!have_prec)
+-					printf(format, field_width, argument, /*unused:*/ argument);
++					ret = printf(format, field_width, argument, /*unused:*/ argument);
+ 				else
+-					printf(format, field_width, precision, argument);
++					ret = printf(format, field_width, precision, argument);
++			}
++			/* Restore errno if there was no error */
++			if (ret &gt;= 0) {
++				errno = saved_errno;
+ 			}
+ 			break;
+ 		}
+@@ -257,16 +273,21 @@ static void print_direc(char *format, unsigned fmt_length,
+ 	case 'g':
+ 	case 'G':
+ 		dv = my_xstrtod(argument);
++		saved_errno = errno;
+ 		if (!have_width) {
+ 			if (!have_prec)
+-				printf(format, dv);
++				ret = printf(format, dv);
+ 			else
+-				printf(format, precision, dv);
++				ret = printf(format, precision, dv);
+ 		} else {
+ 			if (!have_prec)
+-				printf(format, field_width, dv);
++				ret = printf(format, field_width, dv);
+ 			else
+-				printf(format, field_width, precision, dv);
++				ret = printf(format, field_width, precision, dv);
++		}
++		/* Restore errno if there was no error */
++		if (ret &gt;= 0) {
++			errno = saved_errno;
+ 		}
+ 		break;
+ 	} /* switch */
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index d3851a27b9..2a38372339 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -59,6 +59,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball\file://CVE-2025-46394-01.patch\file://CVE-2025-46394-02.patch\file://CVE-2025-60876.patch\+file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch\">&quot;https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
            file://CVE-2025-60876.patch \
+           file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \ 
            &quot;</a>
 SRC_URI:append:libc-musl = <a class="moz-txt-link-rfc2396E" href="file://musl.cfg">&quot; file://musl.cfg&quot;</a>
 SRC_URI:append:x86-64 = <a class="moz-txt-link-rfc2396E" href="file://sha_accel.cfg">&quot; file://sha_accel.cfg&quot;</a>
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#232994): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/232994">https://lists.openembedded.org/g/openembedded-core/message/232994</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/118281850/3616765">https://lists.openembedded.org/mt/118281850/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------rr0D04eggyQxjhYNsrlaPupv--

