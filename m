Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86ACCA0ED1
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 16:47:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.52813.1754930842315522706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 09:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03185df827=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 57B5v7CF2231535
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 09:47:21 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48e5uhshfx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 09:47:21 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57BGlLgj3308604;
	Mon, 11 Aug 2025 09:47:21 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48e5uhshfw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 09:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJ+xHU4TICdrd6/PLwxgUvAHAtaouJyOQIfn6CrA6je2sCS9zhXpYhxk3CEITFIhEVaV+M41dFIBrccdScbQxDUJypoqXKhg1vitx9PWWO0GrEfl0N32eLpPnEIZ78ByxP8rw7VAyTUAGr2jiZR9NV0pEAFac7cAiAxshk08IVTUtsXITU8dscypc7RHrlR86QAuxBXF0iOvVJ9H8YvYYlcED9NVuENJxYuZ10LIU83zBi09Tug6lhK3aQokG7+qgAxcIRZqRP1aervCf40EgzW/dURuhBxFm8IeLdxNkvlg3KpYe1AYzrJ1isdSLmbsDhqAY3R2KF79hlOBp0UVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sGpjCxvG7b4zsL4C2XDAMd1ijF3UMM3AAlZx/QzPqg=;
 b=qrb0RLiWldZ52STDw4mMduw1a4U5uueTgr93gDGs3NuEBvuJDMChy+sFsgbRmijBgKHHEmJfjWFCRI1RLJX2hONPx1x8q0+hCFJU+WhGex6Gszm81GwIYODWGP3Z97nHxZh7DZYtj6ygwKIJNaVQnNNMA5zDaFtjls/Dxcv2LSDbrNEfwKZUW/0+zmPce/UcFF+C+4TdXT69Pijq5xYHAqgdKNGqPLr8j+yVGelsqk1p4dV45MzLVHOjm2CyWXMHOgICaX+iiuak1tSCbhr39Em+pDIBcZRHPrwMFytOKSK/1Sja7G+z4oV8YU5wP8bCPSslcyxUC4CkBjrGOv4v8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 16:47:18 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 16:47:18 +0000
Content-Type: multipart/alternative;
 boundary="------------sVz9LrpeJMfHs7PQGYEgdoKP"
Message-ID: <2a57534b-77e0-421b-803c-241f5f40686a@windriver.com>
Date: Mon, 11 Aug 2025 12:47:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 5/7] gzip: Always use GNU ld for linking
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20250801042242.3076232-1-raj.khem@gmail.com>
 <20250801042242.3076232-5-raj.khem@gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250801042242.3076232-5-raj.khem@gmail.com>
X-ClientProxiedBy: YT3PR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::28) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 607dbebb-5bbc-4cac-8e5b-08ddd8f6bb92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|13003099007|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDhzUndNTUFUN2FIQjRydEIxTkpSbFFlZm1qSXkwbkszVVQ1ek9rZ0hBMTIv?=
 =?utf-8?B?bEZIVHdEUVpVUkdYM3pZT1ZUeG9ubEk3NkRDcHZGYUNDUllEbUwrbUVTbUxx?=
 =?utf-8?B?QVkwNUR5akxRN09YYnBLSXBXL0JBTmVJVCtOUzRUeGtUYlNrY2QvOHF5dFNQ?=
 =?utf-8?B?STVhY3MrejBmbHRyRmppcG85SzdDL1cxU3paUERwUEZyMncySlFQUUJHbkM0?=
 =?utf-8?B?Qk1FK1RQOWQ0OTFUQ1IxblpkV2ptbGRPdW1GbmtncDhsTTcydjFOMjZkZkpO?=
 =?utf-8?B?YkJtNTErZDZuTHR1SWkxOWN0UWovdFJuK2c1bXBzcVBhQVpqK2ZrUHJ3dFF3?=
 =?utf-8?B?ZnZMSTZxZFg0RlNISjRTeXBiQnlPbG9ZczNzVjNMSXZrYTlmeUpBR01lVE5G?=
 =?utf-8?B?L2Nka0dobEpPbW5TR2hYSUdvMlBXZHVVWVpISGVUaGt3MTI3MWVhbU1XZWdj?=
 =?utf-8?B?UjgyZEtJUklSSU1oMlJFM2xFZkd5L2JhZ0VqQ3BCdWIwVHRiaC9zYlZDZ2ov?=
 =?utf-8?B?QlZPZUprbWcxQ1VjQ3BSL1QzRzRQdmdJZXRtS09mU3M5RjVqNkFkUmN5aStK?=
 =?utf-8?B?M0VvdFpaTlFFVU8yY2pQaTdSaWFMR1VuWXR4a2d2bmd1N3pVY2hnYjU1VFNs?=
 =?utf-8?B?ZmRqNVllZmEvQSs0Zjd4aFVxZGpzR212N0FqL1FXbjBjSHVoOG5paFFoM3pZ?=
 =?utf-8?B?emMxU01PMGZiNCtVOUY2THY3dndXRFdaekdWSmtYQU5nYVorTnQzNmRnU3Va?=
 =?utf-8?B?K3pWSWJ2c3VXUGJUNGx6cDN6Q3BGU3RxeGNsankyaWFwa1JRelBKWkhscnhq?=
 =?utf-8?B?YzJMU2lJVCtEKzljSEZGTXByNjJhbWZBN3hia0l1YzdKSTJmM1lGdjgzRGV4?=
 =?utf-8?B?N2hselFqVXF0OHlLUlBrOXdsdHlqS2R4SjlMOEdScDZiMzFwZUt5QXl2OFN1?=
 =?utf-8?B?QVBpYnd5ek1yNEJqSDAzOHFtcU1NM0psM0lDSmJuR2cvTGlBVnZnUWtvV1VQ?=
 =?utf-8?B?SERsU3FEK1Y4TExRcEJRazVzMDkvclZLZE5ycW1qRzd1UzVteDZocTJBSmFn?=
 =?utf-8?B?VzdTWTJqSUFOQU8vYTltSHZlRUFIVlIzZkVBVlJHUUpEa2tVSFVZdzFPTzB5?=
 =?utf-8?B?NlhKRm16b0xNaytqUFNXQU5QejZYMlFJOHhoUnJqZGtadmZkd3VRVk9yL2R6?=
 =?utf-8?B?NGdXTHg4dXQ1QnNDamVwSXVuWmRubkdNTkJuNnFMemNZU0FLKzk1bTBEbkZD?=
 =?utf-8?B?aUlJL0xKekVZR3EvMzRrVXg5ODFrcDMwUFlMVGNZTmpkVEsrcEFPa1ZlZTJO?=
 =?utf-8?B?WVRIYXhueHAxWWtpRXFEMllUbjFIWjdzOHN5YlBJQkx1Y29qMEVuZk9CL051?=
 =?utf-8?B?eXgvM2lzN1BGMXc1SEM0dnJPS0pPLzJPOGRidStvMjIzbk9qbHVhTkhxUGFH?=
 =?utf-8?B?UFRzLzlzVHcyTmNEYlhLL3RRdXUwSk9uQU9WNEJOZWNHcVQ4RWRPVkdQYnRH?=
 =?utf-8?B?ZmRVZWN0SWM2Szd3dWc1WGltaXptYTNhaytHL0lKY0pTWEFnbTNqSXhSVVlx?=
 =?utf-8?B?bDYxK2Z6Ykc4NUtvdlloRU54NnA5bGJEdVg2ditPK1NFMmE4bVVrak1rMHR5?=
 =?utf-8?B?R0MySTlHYUszYlZwMnRLaEtIQ1UxK1lTdkxwN3o5MVF4REU2cDhGcmxaN1Ev?=
 =?utf-8?B?RzA5NW44QTd1SGpWbVBTM3QybUJkUit3Y3FheGhUWmIrVFFGNHlSL2VmbGI5?=
 =?utf-8?B?U2hOTDR0cUx1bWY4NDdoeE9nZ2VGY2owSWZIb25PVUh1QzMxRFpZZE5DVzh1?=
 =?utf-8?B?akhnUHBrbFFydVltT05keS9FQXU5SEVBVGdsakY2Z1JNdFFkUW1uN0tRVG9h?=
 =?utf-8?Q?nxwEO0zLYEs/K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzNONTBSU2pucFA3NUxZSWlDSDBxQlRGMzBkOFZxNzdITTBuK2s4SzZ1SkVh?=
 =?utf-8?B?bEg4Q3gyZjhNSG0ycXBDZ3FWOGNmdkR4U1ZSUm9VdklXRXExS0FsR1cwdmdZ?=
 =?utf-8?B?OWtNVWRmYS8rRWF2Rm5rWWFoYUI2bWlSMFBjdFg0TVZpUVFROWhwdmVtYlpZ?=
 =?utf-8?B?UUNkUDlWR3pYdmc2ZUJrUnFNRU0yc21VZ0dnWHFVandiZ1Y3ell0dzhuSENZ?=
 =?utf-8?B?SE1TaFdKWkloYTVRQi9xTklJMk93MitoNGNoblJQZmY0K2FrTWRFQ281dzhK?=
 =?utf-8?B?SDVXOEprdWdLcnltaCtVNFIrRFJnSTE3b1VmUGxyWTRzNDZXTTlrSld2dHJm?=
 =?utf-8?B?dkwvZWdYZ2dSUm9JaWE3MW53L3N0SnpzSUEzSHU4M0w5R0Y0N3A0VWViWWpm?=
 =?utf-8?B?YWpWdk1IWVVyVjFYcUhtU0pvOHl4VDdjNXA0Uis4eTZMSnNJcnYxeWxBMlkv?=
 =?utf-8?B?SnEvOFF0Y3JNbXlSYzRuem5UbEhiTStWZVlHdWlmRkJRN2JNZWxFdGZYcXFy?=
 =?utf-8?B?TTNURkNISjhFUXpsUWpzNXpwT0k3OG1SejZrc3Vmc1VlWEp2RnJoVW85cEgw?=
 =?utf-8?B?V1czRU9TRzQyTjhPdnI3Ly8vY0IrN2ZaekFMSkg2K2k3UGRTeXpTd2ZVMWd4?=
 =?utf-8?B?V2VnaFFVRGFDS3RodUlWVXJmT1pxUThKcVpYWnNCY0tKMndKV1ZuZktLV0FM?=
 =?utf-8?B?TnRqUWFtR0QvNk82NkpKdGJQUjR1dlBxbTRXbVpTOHpjaXF3U3RwVStTZ3JF?=
 =?utf-8?B?MCtyQjE1VjhxY0Q5TUt3TDZVUUNzRmFmOHJKVGxnYWpiQ1BTd21rSGdvSVlj?=
 =?utf-8?B?RWE1WDQ3TTRFZDF6aGw4QzBoV1d5SE8xVFczUWZFblhkcDhLM1FpV1plMkdO?=
 =?utf-8?B?VEFqUC84MjJLNGxJeU5qSy8zSllrVlE0c1NmNHMzNjlINUppRlEwRWNHREd1?=
 =?utf-8?B?N0pUdUxyVkFKc0l0Y0VBY012dDBBYWxrOHQ3ZUtKUmpPck1sWGR4cTdZeEUw?=
 =?utf-8?B?dGFqMnVxcElLZlpFMHNkSVdNVDVrRmxLblo5WHovUlZsOGRjekFDcE1yVFlQ?=
 =?utf-8?B?SjJsd1lCM29ZY0NyZnNuaG5WRlV2THFEQWRRenRhcExBU2pUVkV4WHVZYkxX?=
 =?utf-8?B?REErclQrbUF2UlIyYXljVXdWandrZmpDNjZhMHNQQkVSMmgyOFJqWjg2VE13?=
 =?utf-8?B?bzRDdXVGbjQxV3BUVHBtSVZhbkNZdEM1TDVJTExINGZ6N2Q4Z0Mrdk91MEVx?=
 =?utf-8?B?UWJvRHZxN2VTd2ZPTEFZUGVHN05MdFU4WDR3MGgyZEJDOERMYXhxVk9yWFp6?=
 =?utf-8?B?aUxQSTMrbzgyY25zd3dUYmhzcEprUUZSL1BTUlpmYXJTdzEvdERiU1phQnJn?=
 =?utf-8?B?cHh6YWlYbndsYzNvYUZHb1dxWFp0Q3UvYmVrRWlVakE1WlczRldjTFVaNkZl?=
 =?utf-8?B?YnVmN2lib1p6WVdJeTBnenhKSktYcmxjbXZuWHZoTHRoSmI5dHllL2dTSFF1?=
 =?utf-8?B?aTlwRGVhZDFiODU1YkVwYlJwa1NyTVU2Z1hRMUpaQWRlUStvVURIT1h4d0ZE?=
 =?utf-8?B?S2xGV1JNWGwzUWZQZkt1ZXNaYUtFMXdRZUIvc0J5ZUZTZmtIM3E1K3M0SndG?=
 =?utf-8?B?L3RNc1RzYTQ2dDIwaVFnSGxkeWwvMG9vUFhKTzNLRVBtUTF0RENFZmFGWjB5?=
 =?utf-8?B?ek9iMFhZV05JR3IzNWlwQTk3RXAzVzk2bEczcnRZMDh5YWdWNWZFd3djUHo1?=
 =?utf-8?B?R083MmJhSU9zWlQwVUZPbmpBUGRuNjh4VmpHVStqQUM1RG41Uks4VE9GRTlT?=
 =?utf-8?B?d2ZRbDIrMytmT3VwTGlQSkV3dEo2dk5TYUhhN3gzME81U1o1aGFSVjNiTmlZ?=
 =?utf-8?B?cUlGVjczOS9ocDZJaDFZaUVCMHh2dzNKcjl6Z0pDNzlGSzJSMFJtWTgrWHVo?=
 =?utf-8?B?M0RZT2haeGpRbWtnUHR1cXUrdGN2TW40WEdZMEQ5SnFDbUppY21ZaDNyUVFO?=
 =?utf-8?B?SGt4WXNOMVdWYnlsWDAralo4RnM2UjdJYVNrN3dicVIzMkd5K0h1YytCY1Ux?=
 =?utf-8?B?Sk91NmhKbzUvZWtqYVhmR25uKytLZDhZTHBuTmlQc2R0OWtlUGNvcVhjcDBl?=
 =?utf-8?B?bnE1OWpVMTErVzgvV3d4djFDVWdLdnZPSytFR3AvSXgzSUd2OFFkRTY1TmxZ?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607dbebb-5bbc-4cac-8e5b-08ddd8f6bb92
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 16:47:17.9470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2d+5lLjAbutUuFpL7ikqR0S0aj/NRWtEfaGpaeKAd4BnU4+urx31NLfV1D0f9d09kLORrdZ3lGsS2SzCah3dxQm4zUsqnORltVczF4Qya8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwOSBTYWx0ZWRfX+8PfrucagryY
 HrXSfZZE+5j4L2f2Cbsb5HO0Ttqi3krMl0Fk/enJH8upEytdbPap6R76Ks+dYdwvh41aQfWRIqw
 i+EvvrW/kUxK8Evrb2DC320txaOIlF7jkiJwUgg4E/TCsfSPMeHtaubuW6dl2+3RV0dWMkO1jun
 qh4xawmu0jqE+zVZoXm9zhXicJYVWLWeGiS7LpMJbG2w4VvGqd4/b7fAwd6id1ewyhjJRo5n5d3
 RwVxqFICYpoNvm5vDcknC2/KVOmKvKjA1s7zxqDk4Xh6gmmUQvEkYyhRQHk1Z4A4RkNjmEFGSgx
 UVL50YYAIiNYTGCk9Xj9ll565HtSqKz3OZkV36zrenJ1uFYTDeaOlW4QVyS9XE=
X-Proofpoint-GUID: vIJ92sYeM_5wSiLxb_7oBnskwoLyOlxW
X-Proofpoint-ORIG-GUID: Vq8FgLaW-GE1D5YPxe-JwYFyG5eEgjm_
X-Authority-Analysis: v=2.4 cv=cZzSrmDM c=1 sm=1 tr=0 ts=689a1e99 cx=c_pps
 a=iTJPoBOga9syqOaoZFk+hA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=fXms6y0vAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=u5FJdz6KG93YDVjGQssA:9 a=QEXdDO2ut3YA:10
 a=gwVi6MqQpnvgUahK7NkA:9 a=eM5LYSlyCQ8ipxiV:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=c6Zb8eaUoX5VaqycxFvw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 16:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221746

--------------sVz9LrpeJMfHs7PQGYEgdoKP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-01 12:22 a.m., Khem Raj via lists.openembedded.org wrote:
> Linking does not yet work with LLD
>
> Fixes
> aarch64-yoesdk-linux-ld.lld: error: undefined symbol: gzopen
>>>> referenced by minigzip.c
>>>>                minigzip.o:(main)
Do we need minigzip?
Does upstream know about the bug?
../Randy
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-core/zlib/zlib_1.3.1.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
> index e62c50c5df7..96b7a5821ff 100644
> --- a/meta/recipes-core/zlib/zlib_1.3.1.bb
> +++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
> @@ -20,6 +20,7 @@ SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b
>   PREMIRRORS:append =" https://zlib.net/ https://zlib.net/fossils/"
>   
>   CFLAGS += "-D_REENTRANT -fPIE"
> +LDFLAGS:append = " -fuse-ld=bfd"
>   
>   RDEPENDS:${PN}-ptest += "make"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221217):https://lists.openembedded.org/g/openembedded-core/message/221217
> Mute This Topic:https://lists.openembedded.org/mt/114479323/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------sVz9LrpeJMfHs7PQGYEgdoKP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-08-01 12:22 a.m., Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250801042242.3076232-5-raj.khem@gmail.com">
      <pre wrap="" class="moz-quote-pre">Linking does not yet work with LLD

Fixes
aarch64-yoesdk-linux-ld.lld: error: undefined symbol: gzopen
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">referenced by minigzip.c
              minigzip.o:(main)</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    Do we need minigzip?<br>
    Does upstream know about the bug?<br>
    ../Randy<br>
    <blockquote type="cite" cite="mid:20250801042242.3076232-5-raj.khem@gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index e62c50c5df7..96b7a5821ff 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -20,6 +20,7 @@ SRC_URI[sha256sum] = &quot;9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b
 PREMIRRORS:append = <a class="moz-txt-link-rfc2396E" href="https://zlib.net/https://zlib.net/fossils/">&quot; https://zlib.net/ https://zlib.net/fossils/&quot;</a>
 
 CFLAGS += &quot;-D_REENTRANT -fPIE&quot;
+LDFLAGS:append = &quot; -fuse-ld=bfd&quot;
 
 RDEPENDS:${PN}-ptest += &quot;make&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#221217): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/221217">https://lists.openembedded.org/g/openembedded-core/message/221217</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/114479323/3616765">https://lists.openembedded.org/mt/114479323/3616765</a>
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

--------------sVz9LrpeJMfHs7PQGYEgdoKP--

