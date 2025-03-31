Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1DDC36018
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 07:16:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.46560.1743405411298465776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 00:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61856e1cce=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V5A4ks007193
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 07:16:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8ss7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 07:16:50 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52V7GnW0030344;
	Mon, 31 Mar 2025 07:16:49 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8ss7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:16:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg/4wuWM6RDqP+il/NfRochDefXb5alkKqt3Sz2xiJrnTB/yywmq3fWu75we0plOGDnGZhS10WHWbdVvl8FNNA8ecIZMgH4bPjf2ASLLRaUbkX7KXcHyfwPZISeubqVOeYVgi0aBsg8nqvGjbJWZMUaw20BBXnIGn9b+x/6vWsKYV+6v23Lr1b8guZpporl+J4c9Gi4zYkRdxAlcfd2+RwYaIORlHd3hkTHNQ54j2hqgRZyI8DY5Q6jnNik7oM/fQmzA36SwF8K+mSqrtU6n028yQv9rptPOSvV7eBcnpYhHDQL9rvyM/uVAkV1LWOoA2GQZtAlNjTpQl6+3O9bSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hutL6FYhmvQ/YhaROmdkr5DkOowBvJ3PCYr4H4U1sJI=;
 b=E5BIDoNzVD//x9vEDC4J7fliUSa29TvoH7niJbEhTt37V9FKviFph75lCcHehqA4k1DEfpXY2KgWIdO97HECwjvwyNoM7ou2BkUWCiGsvU7Y9d2O87IhppjP/RDy5BnS3QVHdcATvscq4qokjvN7sO5Y+HTRTPG7b8OAk8nrrL0y1MkDQ/BpfDfP1czJfnq24vR6N1mT0hEsVTpyIvf+azSFHExzGn09/cn4Roeksy2T7h85Ou/XAAG7OlzQdPvPpQPF0aex9UfWvGLi9rIu1dQzPw9I1XdDrlVVFMHiZsy7as7HrJZhJqiyiVpWDy+q1APfCoNBqpKkEHJH80GRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Mon, 31 Mar
 2025 07:16:45 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 07:16:45 +0000
Message-ID: <9730a4ae-9c02-43ba-a241-f7cc60ebef70@windriver.com>
Date: Mon, 31 Mar 2025 12:46:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
 <20250331055424.1978243-2-Yash.Shinde@windriver.com>
 <6a0be636d9c44b3166ac50e42c34aedf13a1be28.camel@linuxfoundation.org>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <6a0be636d9c44b3166ac50e42c34aedf13a1be28.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXP220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::7) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 2055e993-2e67-40c7-8336-08dd7023fe7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZVRsdXlncWtLTndWNlA5dDAxL2x2VnJDa2xrZ2pFVnhySTM2TE1zSlZCM3Ja?=
 =?utf-8?B?RWluV3hBNGtFT0I0M3A2ZXFEVFBEY2cwS1p0NytLUVByQ2Rhb3hQdVlOZTcz?=
 =?utf-8?B?b1NhTHg2dlhRVzBHbFdLNTFweTFEODFqbXdRWURxWUMzd3hZZmdJRjhHM2hQ?=
 =?utf-8?B?S0M3cG16cy9hU29lMTR6cmVEcndGUjJ3Qkh5cnlSRzFLMVdRR2pRTytkcWZ5?=
 =?utf-8?B?ejhNRWdXYzF5ZmJXV0UyL0pzVXZPRnpHdEQ5ZGI0MGJsTWNzUlFEWjFrdE9N?=
 =?utf-8?B?aktuaXNGTXV3TTVQcUs2d3BmQWhmNEJjTnlGWFY1MnlaWFJiNzdKVWtLcW53?=
 =?utf-8?B?cUpPelZRQjdmTU8vc1YvZzJhMWNQK0ZzMm9UNnVDcUhESDJlRU5ubkIxWU4z?=
 =?utf-8?B?UmpUaWtmK0R0aGVZczZRUi82K2pmNEliVThycGl3cjZoTHZOSEFIRERRZkhu?=
 =?utf-8?B?UXk2Z2pIdDMvSllvMUQvY0puUUl1dHpDUmlVMUZndTRUM2w4dllNcWhRckp4?=
 =?utf-8?B?Mks4VFBhZDRGUGM2ay8rdDgwY0UrRzErcDdWcEdtc3I5bG42UkVrRVN3UTAz?=
 =?utf-8?B?TWJvU3B5b25lRGJMdkV4R3NnYmVrckxRdisrb2JRR1hiVUZ3eURDZHBjN0g2?=
 =?utf-8?B?UGJzUDJjSW0yaXpWOHB3ei9GcXFKenl4bjg5SGZBNXJJVUptOEdUaU1tdjV4?=
 =?utf-8?B?K2o3NlFSQm5aTzVBNmhMdnpZR2E1UDlRNWphdm5idHhiZkdSUTUyYzhDVnFy?=
 =?utf-8?B?T3RBYXNHazl6YjdGMlNDVU1iMUVDUm1VVWpLSHNiNFRwbDBKVHBkb2RBRkkx?=
 =?utf-8?B?a3M2QzI1b2pyMldDaXVudTZYenIva0F5TEVMQUg5ZjdRUTJweTc5UnkzMklw?=
 =?utf-8?B?M0t2NDBSMmZMcHhCTnI3U2x5aEdaSDRxRlNjcE5BQkFPcUp5WXlxOHYyb3lS?=
 =?utf-8?B?N1E1NXVIUzA1N0RMZDd2NFhLZVdtZklJY2labVhrVXJVTDNxSE9Jb0pPT3FI?=
 =?utf-8?B?VlRub29tZFkzQW9SUStpekhta2d2WDNreGhBWm1WVkhoWDNCcExkU3pQa2kx?=
 =?utf-8?B?RmZoRW5OSnNqMFdSTFlKT0xPdTUwM3pad3NUSmhPNERHMXp3TUNOUnZrckpx?=
 =?utf-8?B?b3lDdTdrMnhQTE1yZXBrMkJDbC81WkcrZXFRRDNpcFVQS3dwM2t3Nm9ad0Z3?=
 =?utf-8?B?SCtHcXBjaDhhYXU0UTBENE9xTmhLLzY5cTU0YlN3bTZVbFVxYUxBNElsMDk3?=
 =?utf-8?B?WXhsVnNBMHFUaEZhNlZhM251dWw3Y0pRbWlUd29KQWx6RzI1U1RDa0ZtTWU0?=
 =?utf-8?B?aURBcE93Yk9TRWloRGdYdWF5Z0hCQkozcVRpMEVXY0RJWjgrOWYrUVdXTVl5?=
 =?utf-8?B?cGVpcjQ4SzRFellIdW9Jb2hhM2dqVjF1NzM4RXNNMVMxOUV4bVZucE05N0ht?=
 =?utf-8?B?N3RJM2I2eXBXNVRyZnU4Qk9KUXhlMDI3eUZ6R2VDcmFEK0EzVlRyU2FueXpp?=
 =?utf-8?B?Q1oyMzZJZUpZY2ZtaFhUdnpaTnNHc3I4WE0vM0IvaEVPR1huaDRoTUJPZGVI?=
 =?utf-8?B?NExLT2lTRWltSFlTbEdaaG9ENCthQVJSdW8xc2hJQzJGaDAxZ1VXTEpyanJS?=
 =?utf-8?B?eEs0SFlIMnRXNGtwRFRVeVZvMTk2NHBCY3g3ZXdUTFJueU5nMUVUNmZSc2d3?=
 =?utf-8?B?T0w2bnNtQS9vV2pTclJhVkx5dkVEc0dvb0hoNDBQK1E1bDlENW1hZWtleHFy?=
 =?utf-8?B?QnVTQlNCRFBHb3FMYVBISEJmNmY2bjlrbEJpNVJKVHVSOFp2UTBQUlRNL3kw?=
 =?utf-8?B?ZVVTVER0RlIrNXdFeG1jS1dnbEpmUFZ4Vlc2cEF1MUladm56dnRrY2gxTEdK?=
 =?utf-8?Q?Ms3V9O+JrFKbr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aktNaGFYZVFrVm9rbXp1ZUNwT2lMcVU4N1hzSGFxdXN6WmhzNXlxelgyOHFN?=
 =?utf-8?B?aGlaNjFFR2g5MzFLcjZRcEdiZmlKWUVLNktjMlNZYjROeGpUMEZML0tRUkZ1?=
 =?utf-8?B?ZG5PLzhGdVVaMzJ6RHA2endXT29UTmpJaUR3K0trQ3NNRVhtS3J4VHhsUm5y?=
 =?utf-8?B?dFR1NGhXRi9oUERBbEdKcTV1dFFqdEg2cVdDbEdEY1M4MEZ4eVU3ZHdKUjJt?=
 =?utf-8?B?RE9ZdS9jNnNDbithcnU1OHdoRFFOT3A3RWJMKzRFbjY2Q3U2a1VuQUg4WXRq?=
 =?utf-8?B?eTRqYlhKM0NCQ2FkTVlXVVE3b3JyOVpGdlZnMUpiZkViZVFrVXByZUhsVmZ2?=
 =?utf-8?B?cDY0alRpQk9YL1haRGZvT0ExUUtxUG1GVXFuNnJXdER3M2JrYlJScEVBeFFZ?=
 =?utf-8?B?eCtsbDB2bThxQ0tyTzB0aTdyaGNSeWdOZjhCS2pxVDlHVDBkV2hmbGd6cTh0?=
 =?utf-8?B?bnRwZFhNZlJpUU4zUU1XeHMybXNjQUc1RnByUGxKR3E5S1VVU2ZUbmQ4QVpJ?=
 =?utf-8?B?WkRINkdrQk53MXF6cWoweENJUHptWG9zbUJpN1d6UExlQjJQWnJ5c3BOb0xW?=
 =?utf-8?B?Um5BZ3V3ZytzWU93UUxKYy84am04cDhYOUI5c3h6Zmg5Z0E0UWRMUS9qc2tq?=
 =?utf-8?B?Q3draVBwQ0FNUiswd1dveDlJcStQa1RGa2xxQlpIc1pyc1BMUDJoeVh5d0VS?=
 =?utf-8?B?YVN0ZHJCeGJmTzFoUmlCVmZKcW5STUxUUHIwdndiRHhBLzd5ZjNoSzVYZDdq?=
 =?utf-8?B?d3JRWU5mTXhReXF3eDBacEtlWVNtbk9nWHp1YysvYVJEYzJLaE5jZWVEYmE3?=
 =?utf-8?B?emZMcUNLZHAxYXVyZnJydVY4R0FVZE44QXZ0dEI3bEVwbEtHYUNCRzNxY01H?=
 =?utf-8?B?Rk0rcGdKZHdJV09OcEVVS3JNUmpIa1Z1SStnVE1idXVUQitXb0VYeDNrdzA4?=
 =?utf-8?B?WkpCNmQ2bDd1ZU5VUjlyOEVqMzdjc1lsRGc0WnpvZW5neTdhZmZEMnN5bENC?=
 =?utf-8?B?OVpQOFozVGNaT0luTmJCYXU0REJIZDV1b3cvVERRU1pwZy85bDEwQjlZejJE?=
 =?utf-8?B?TVhwQ1hnRXFCN0FqT0tmWmkrcEtrODdBTjN3dTFnaFAwM2RKSmZuTFFpRFZS?=
 =?utf-8?B?RStYU09SdThKZUFiRkVpamFYSDhXK1YwaTk4QlVjMjV0MDhUVWFmZzJPVjRO?=
 =?utf-8?B?ZEM4UG1KODlubDVXU3BIR1o1dWZNM2hvUzMxMmRVKzZ4Ny8zVk9ONTYrL1p0?=
 =?utf-8?B?Z3JTNU0wdzE0RFV6dlBwemtEUncxZ1pzSkZBcGZiZjQzRXJ5RXkzQXpPaTFP?=
 =?utf-8?B?WHE3UzVqL2FxYXpMYjVvM0FMSjhsckxSbUg0a2srK3ovR2tqYnZKL2pBMTc2?=
 =?utf-8?B?MUFicm5laXRCWFZFNUNvTm9SR3JCQkdvVUVLQTdYYU8zTnY5UHkrLzAvdXNV?=
 =?utf-8?B?cXBmdXNJcGdRUndMcE5yaXk1eDRRVThTODFkWnFJZk1ITWFPSWN4UGtoL3cz?=
 =?utf-8?B?NWRWNnNZeitES2pVdUQvdEZnT2U5UlJBRWI5ZmIrWDJnc1JwUk5mWWJPZmtr?=
 =?utf-8?B?Y1V4RjdkYSs2bmNjRVBDb3piMzFETEZmMHpmRmp6c3pOU1B0WWRZMTZlMld4?=
 =?utf-8?B?eGs3RHhIN1dPcW5TOHF3MXIxeGlvT3lPdWk0WFRnN1pGcS9NS1pTbWVIQTNW?=
 =?utf-8?B?VVNsVWNpR09DNjQ0aGZkd1V4VHFPOTJYbURFcThuclVaQ1VSSnRRb3RLbWNM?=
 =?utf-8?B?UmpZVkhaUm8rMnJFQzhRUllOQS9kSUZjaHNuRTVTYlc3U2VxNzFvLzlYdWwy?=
 =?utf-8?B?czJqRnpMME1Ga1NQMnBPU3NrUWJoQmhwQjE3SHNjall6aUhpTzFxVHZoeG9p?=
 =?utf-8?B?YUhZLzVWV2VwdFhXdUQ5UEZiUzZoa3hscWJzNk1mVG12MnJRS29CK3BhVHpt?=
 =?utf-8?B?eURwcVR6dmIzNHB2UEJGMjBTQzJvRGlQd1hxMjVYYng0SGpFUXdqV25rU1pj?=
 =?utf-8?B?R1JRTXRBcEhxRDRtbVkvVkRwa3FGMHRzTzZnNXgwc29XcC80SHRJZnF1OXli?=
 =?utf-8?B?TXYrSlJvQ0pLcnUwWWpFelJxRDFLbERMQndBVVFWT3pOa3F3MDRvd3B0MnhJ?=
 =?utf-8?B?eWQrTDVrMG9rcVJ4dnhaNk9LdWpWcWFzVlA5K3Y3dlowUzVwdlBZbDQxbjNT?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2055e993-2e67-40c7-8336-08dd7023fe7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 07:16:45.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfaiIENCTE4QqmOZGmdcTIAnzSl05U+IFs0iJIdha2C4NOPF3ihqvGdtzdm/c2wn0yJilg9XaNP1tGz1ssaVugfOE33G6vGqn4lYBYMI9K4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
X-Proofpoint-GUID: z6BQs_sz6a5MNS_j58QKpack9ADFNiNi
X-Proofpoint-ORIG-GUID: vBBAXDbY16u87umoq5-pwndGbLkq4-Bx
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67ea4162 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=24AZYWMyAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=y9xFhnDUZO3kmKl0pmkA:9 a=QEXdDO2ut3YA:10 a=dI7qjkOEfi4A:10 a=29rdLMf0DKYA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=bG88sKzkDEFeXWNnvthB:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 07:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213948


On 31-03-2025 11:54, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sun, 2025-03-30 at 22:54 -0700, Yash Shinde via
> lists.openembedded.org wrote:
>> From: Yash Shinde <Yash.Shinde@windriver.com>
>>
>> Rust stable version updated to 1.85.0
>> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>>
>> Some of the major updates:
>>
>> - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
>> License-Update: Unicode license text is updated to Unicode-3.0
>> License.
>> https://github.com/rust-lang/rust/commit/6d2a3e9786ec43a0e0af20386e7046328296ac86
> Thanks, this one step in the right direction but there is a
> corresponding change missing. The recipe says:
>
> LICENSE = "(MIT | Apache-2.0) & Unicode-TOU"
>
> Does this not need to be updated to include Unicode-3.0?
>
> That commit mentioned that the SPDX identifier exists:
>
> https://spdx.org/licenses/Unicode-3.0.html
>
> so I suspect it should at least be mentioned in LICENSE. I'm not if
> other unicode licenses are present or not any more.
I'm not sure about that either.
Perhaps it should be updated as follows?

LICENSE = "(MIT | Apache-2.0) & Unicode-3.0"

Regards,
Yash.
>
> Cheers,
>
> Richard
>

