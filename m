Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB572C36005
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 02:56:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13738.1742957765223385943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 19:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51801239b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q2a3mn018331
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 02:56:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1m6uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 02:56:04 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52Q2u3ML014251;
	Wed, 26 Mar 2025 02:56:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1m6uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 02:56:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+77Q4kzfzuJXy/dwhS98AK3uhrmAxE+EglvS2KJZz56OzBcBkFLedZbmrVO4kP3Ob7fj5W20Rntsl+dtbiAzdV/em7xy6Y95BdabhQvRa1iEBXkECl+LO7+ShLyzDZwtYGweyTeMhmnrYnLYPzNb8yK+TUzglOc5G01Wx/4WC1jp6gdoFZtT8KIA19MYu+/GJRUQofcqb2oJ6XtsuDcMXcs4muYHBEXr+qA2GooPSgb2MoKqBCbzhmbNNLntIFesHIytILuYWQfgveO+maEyDdDwKVGHHWYV4iQWtGVfhMUOnfCYFD+SviL7b7k/rxkCL9WnoA4T1G59L3iH4hviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWpWBIWV//JDZ+/XObWff6ZEg4jLFNbvLc1axRav6Vc=;
 b=oSNn7QPhiVpxS0DLaiu0YTh/YOTXbR8F4SkN6i/K1Z9AbtHMDc8d2tMcunf/Yy2Q4BGIGbG/hl9LlZsGFoeP2ZOT0d8wcH/DeVkH3vRFHOWuEJz9PYYMJ8xIqB7djZq0shHpdwQ5++eismjwrttgPDYkEXXgdMnboig40ODv4+NXP6zaQM2CBNrvTrvhcbTeG0fEgxuuJmpn9E6SaibKekV+gGYTwAcD+8FMFhP9axzNL6z8i4kn0x/h6vSfscD2zpmDD8FKJzdrauWwbRfMQoe3qdxK9PxsSJmWiV2/Gb9qDmEJTg31uJ1vePiwkHf7oivQOuNYvo2+6xix8ryZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 02:56:01 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 02:56:00 +0000
Message-ID: <28081747-e0d8-4913-9b52-01a0b02aec74@windriver.com>
Date: Wed, 26 Mar 2025 10:55:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V2] systemd: do not delete
 systemd-getty-generator
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250319064016.1119702-1-Qi.Chen@windriver.com>
 <D766D201-766B-42FE-9474-9D09522C00D5@arm.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <D766D201-766B-42FE-9474-9D09522C00D5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYBP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::20) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS0PR11MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: 814d4c3f-1fa9-4b1a-5992-08dd6c11bce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmk0MXhMTzJnOTRTbzNpbHUyTEF2aS93M1FlcnJYdHExaU9RTGN0Y0NPSlda?=
 =?utf-8?B?bnJxaFRpUi9tOEhRY2N0Uk94K0pydWpiVUNvZ0lXMG9nczNUTUtoWmVJNnMz?=
 =?utf-8?B?SWpCZHFCaFQvajRlWm5hVm9GTzBsTnBhWHlwWGl0Q3FqTFNBYW81bkVQL0gw?=
 =?utf-8?B?ZG03dHlwc2xpWXhSUDl6a25reXRoV1NKREh1VTFuMndQOFREVTZnSEx2Ujdn?=
 =?utf-8?B?RWU1d1g5RERPaUIyWitKR2JRdFFGdkMzUXRyajhTRmd4a2JqaTJoUjloTXFV?=
 =?utf-8?B?WEN4MVdKQVIyM2FZUmVaVmNtS3J1R2loa0w3VDRDU2ExMUJjSXlPNGoxZHU4?=
 =?utf-8?B?ZHRsSVpyYWoyZ29yRkFrYVFKdzlGdU1BQXU1YXVQS2dOQS9DTHdCcGh0TmxI?=
 =?utf-8?B?T01WUUVpdlEwQytuV0pwNUY4NzA1M0NsTlFMYk56V1JveW52OVdKS3J2Y1Jh?=
 =?utf-8?B?c3JJVzJLU3FKRHNJNm9UUHIvRk5vTlE0QStQcFoxbGhicnFubHdnM1FvVG9i?=
 =?utf-8?B?a2RqbVZsWHBkMklLeWlFanBxQkhBR3NTZEl0dzM1eXdvZTJPWjlSOGxYaWx0?=
 =?utf-8?B?NmE1cTY3aldDb1lGc2lDUUdzV2c5eFFUQUo1VW5SNFhEVkxnWHpDbG05a0pL?=
 =?utf-8?B?UUcvY05qYXh5LzV1VTJDcmFHak1UdzVvZlZ2TXdZd2pWRm1jQjkvaXQzVWtM?=
 =?utf-8?B?YStyNG5HTW43K0ROZFd3NHdKL2U0OGVmdDUrTzNKVGV5UUR6Q3JQNmZIWGpG?=
 =?utf-8?B?a3pWejNiRGNvZWhaYUc3QWwzdjk5czdrbVcrTGlCbEtGQkRpNFpvV28rMXlH?=
 =?utf-8?B?c21pUjVrdnNmamNpcVVHb2lNTFM1NjBwdEpIWEg1aWV1eUR4MCt5NzRSRUZ5?=
 =?utf-8?B?NVlVYisvQ2xsVWk5QVQwbmhYd3BvajIwbXFBMW1pWnN0d2Fsd29mRU1XaWd5?=
 =?utf-8?B?VFlidzl3V0pKSjUxWWpLblljNFhBSlVsNWVPOFFuTDg4dTdQVC90UlhJWW9v?=
 =?utf-8?B?aG9DYlRXVWZhYk43M21tdk8vRDh4KzA2Y25PeDRIb2ZOejhMM2FPUUtaR1BU?=
 =?utf-8?B?TnhoRWhjUWlzSGQvN1ZLQ09aei9JNm95UkdZWlNXakc3R1FIbVhES2tGNDkz?=
 =?utf-8?B?TnFleWtvOXFkYVZ4aFF2RzVxaWQ0ZktZUG5EM3FuQWlmUXNxMjVlbVdJYk9j?=
 =?utf-8?B?cjBaU3dmVnhEaHZEMXVBWFNIOUlvTUwxOHFxc2h6L20rdWltbmc4ajdLNGhX?=
 =?utf-8?B?cTBVRHZ2eEZiRm04N3VqdERyQm1sUU5VRGRKMGxUU2xqQ1hVWGZxSkRVaFB5?=
 =?utf-8?B?ZnZXbHlVYmZVVm1oc3duMjI2SUprL3hKd2ZPOG82R3VaZkptTndieTJLOUVD?=
 =?utf-8?B?bDh4QUZIYXR5cFcraU8xYWVMRjBLcXRocUVua2ZJVUNOSkxabnRiZkN3d0pP?=
 =?utf-8?B?c0Zhdi9mREdKNEJJdjlkQkdPNEVneXJSRGU5NkhBVGR5NjJTbVFzYnUyd3Ur?=
 =?utf-8?B?VVkzUjJMMVIzMEdwdjlvYitCM09zVmNqelAwb3JYYmdXVnUrNzBQUjBtaThz?=
 =?utf-8?B?MnlpUEVzcExWNk94TDdJUDhlNmcvTFBnYy9EQTVSVjBQakxoQjYwdjREK2NE?=
 =?utf-8?B?cDVaVFpXQ2wrNGRqTUt3Zkh6dmdrcEZBdFhKUTNXeDd0QmExVWJxUWdsbnBL?=
 =?utf-8?B?NnpUV0p0VTNHVkxxeGh0ZEpYS0VlZWp5OFFTdWcyclVlSHhET1pSUWpJODZY?=
 =?utf-8?B?MEVYVUVwMFFMS1QwcURLTGdCdmlMR3Z1ZUNjUzkrK3NxU3pCV3U1WjRqNFpa?=
 =?utf-8?B?TEt4UnNvT2paWUtuN1o1ZExwWmwrQnU0SWowTHhrY1ljeWZFN3VuU0tWWlRk?=
 =?utf-8?Q?O48j1hIxqoRlC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDBSSGl2UFJMSUh4cmtXK3BVazVaL1Ixdm1jazJYRUtESTVjSGFORCtrQ2sy?=
 =?utf-8?B?bERjZ0x2NnZOVFNJbk1yOEhpSWRrYldsTjh2R1ZXR28wUXdrUVFrdnhaUkND?=
 =?utf-8?B?WnA3VXdxTC85dTg4b0VXOTRPUm9Nc0huRHVCRVllb1FtMFF4RU5oWjhHemMz?=
 =?utf-8?B?MmRadUk0bWNQWnNuK0IydTNEM0ZXT29TNXk1b0h4VE0xdHI1S21wUUFxOGFl?=
 =?utf-8?B?Z3NTaXZFMGVnMzVaZk4wd1NhY2tBRVdjL2V3TVp1Z0tyQkJGbG5SNXdNbTgr?=
 =?utf-8?B?ekNEUEZoNzZ0Vi9RZG9tZ1UzOVJlN2ZIc1ErVHJwTjFsa0Z0KzMwbVd6dGVJ?=
 =?utf-8?B?SHVIWXhQSlZGQUIxb0NpU1pPZURCSEJzVlBhUkcya3cvYXdGaUxHTFl6RmJh?=
 =?utf-8?B?cjhaNWJXRVVtVGtsWElKQjZJWDJkSy8rN251d1FUVXFTaXk1QkVtWFBkT2dn?=
 =?utf-8?B?bU1tajRoNElqMDQvVnJGZG8vaWMvNnlqdW5ZcU5aVkRseUo2R091cjJJNmZy?=
 =?utf-8?B?aEc5a2VVQ050TUtVcWFjWW9KWjFxenNjeVpSb09mZU95WW9Dc0JNdmp0V3Nq?=
 =?utf-8?B?c1N3eGhrQi9uaUVpMnlSenFqRkU1Tk5MYkozZHJUTFBtYmhkeUZUSDl1N00w?=
 =?utf-8?B?cWxjVXcvOUZQcldEdGFVTHBZYkk0TTlsZDEwVDU3cVVaL2h5UUx1TDloNEVO?=
 =?utf-8?B?L1BVMDVFNExaYWNOTFF5OFBualNtcXdaak5YeTAyK0IxbmErMWlsdGFZOEJj?=
 =?utf-8?B?dWN6VjZDSTBQc1JwNHF2UWxHamFYVnh4MHV0d2RweHZYUTdUbHVmOXVwcXVo?=
 =?utf-8?B?Ni9DVGtVQkp4alEzb2tDTTZTcUI5VnVsQ3lsYXFWY2Y5c0FmMGx4aUdjQ3M4?=
 =?utf-8?B?QUhDenN2bk1JZGg0RjQxVnYxZ051WmtIZ2N0YUMydThseXZodnlpand0VFpN?=
 =?utf-8?B?MkF2TU1EbVI4aVhOYTFZTGtDcHh5UVgxSWVZY08wRFh2S3RqYWtoZU4xWVgw?=
 =?utf-8?B?NDlwZkI3bHJMbDRMZFkwRVdHUHdkSDJvTjFJNUJHOGxmcHZvTEcremlaTlo1?=
 =?utf-8?B?a0lwRzdTRXdpcHo2dTE2WmErUWt3VUhINCt3SnQxWDZveEJQcEZ1aDlmcUIr?=
 =?utf-8?B?emduUFRMWVJlbjM4NU5tYUgvQ0E2OUtVeXhkMDVrYVlPaGpUamp6eUo3RGUw?=
 =?utf-8?B?VG1LNTRsVWYveUdoUzNKK3ppU0ZBVHFzM2xzd1NUai9UWVlQMmo0Rjc3L2Qz?=
 =?utf-8?B?aHVEQ1B1SUw4dnlyYzdMQzk2UUM0TmxpY3E2a1RvN005R1JvV0ZDakMzQXFm?=
 =?utf-8?B?MGsxckJMYlQwWHFNQ1BLQ0dOWHZWRGNMUGRwaExjaTEybTliOGd0RFhybEtr?=
 =?utf-8?B?TTBnQW5wSk5reVVWRjBaR2FmdU42VjFIc1gvQmI0V1p0WVNZMVhjMENKdE5I?=
 =?utf-8?B?M0dqRFlqRUQ3Q1lmWTkrbkREQUxHcnN1cEtDVW00K2NVWDFsWHQrb3dOcTU2?=
 =?utf-8?B?V1kwZ2ZCRUMvcnhQNzA2MTZ2T0VCUktPZXR1cW1TVnAzcjc2ZFd4OU9DSjhZ?=
 =?utf-8?B?MUE4MFhMbVE0VnhlaS9aSUxNMzhnT01Nck5YVm0zbXJteUpKTGxCeUIrQ2RQ?=
 =?utf-8?B?c09UQndzeDBEcHJ1dHFzQkJtdXhHOTdMbmNiU2VtOWF6UTZDZUUramw1R1Yw?=
 =?utf-8?B?MUNuSGd3T09OQTJQUEF5Z1RHWitiQi9iUTRCcEk1M2JCbFZsR2plOERvWHJZ?=
 =?utf-8?B?bitRMVlPMHA5SVIvcHRBQTFPamw4eDUycnJaTmtHN1lWV2pEQUFNK1hUZVVO?=
 =?utf-8?B?QUsxeE1ETC9TV0xnYzJuVlBkekgwTTMwdGticDllRHcwa2RPbVpwNWZRUWoz?=
 =?utf-8?B?Z2xvQ1NGRG54QWJHWEZwcHFsZGZVSm51ZFhvS2xudFIzU0lXa2FMMlJCU1Vo?=
 =?utf-8?B?aExiZUZaSWV3NExoYS9TMGtYR0hTVlo2QnNjTDlhR2ZFRXlnUUp5di9mYWpK?=
 =?utf-8?B?RHQrOFBCbjM0eUVsM3B6Q3dsNTFSMjRzb1o0enBVRUdtZWZFVW1EejRhbXJs?=
 =?utf-8?B?Y2N1VS9Na2N3N0d3WHhPOWdRSUorcmJCR016d2Y4RFYxWFNkYVNVaUJ2MHJJ?=
 =?utf-8?Q?KXO2uTFy/pxZjcXBqvvtlZ1uN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814d4c3f-1fa9-4b1a-5992-08dd6c11bce4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 02:56:00.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHoJWCFIwADyJTaEBslDcdV2df8QVAQVA56v5QL6JjgNv0dMeN4C2yXu2rcx/OHz72LvV2MJiEczFDBpxXsDRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7578
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e36cc4 cx=c_pps a=+tN8zt48bv3aY6W8EltW8A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=jCRUznOLe6POywolwuwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: U7xi5VzSCxg2ZSiqmAt-bdNyAiq2mXG2
X-Proofpoint-ORIG-GUID: n44G-2JBxOTxHlA0777EPVSeTOCH-CtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=886 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503260016
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52Q2a3mn018331
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 02:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213624

On 3/26/25 01:50, Ross Burton wrote:
> On 19 Mar 2025, at 06:40, Qi.Chen@windriver.com wrote:
>> Some BSPs don't set SERIAL_CONSOLES. They need systemd-getty-generator=
[1]
>> be there to work. This generator has been there for a few previous
>> releases, we don't see any problem it brings up. So let's keep it.
> This is a wonderfully convoluted and not-by-design situation.  Looking =
at eg, styhead.  The getty generator isn=E2=80=99t enabled by default:
>
> $ bitbake-getvar --value -r systemd PACKAGECONFIG|grep getty || echo no=
t found
> not found
>
> In styhead if the getty generator isn=E2=80=99t enabled then we delete =
the serial-getty units that the generator would create symlinks to, so th=
e generator can=E2=80=99t work.
>
> if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'fal=
se', 'true', d)}; then
>      # Provided by a separate recipe
>      rm ${D}${systemd_system_unitdir}/serial-getty* -f
> fi
>
> If the generator is disabled then systemd depends on the systemd-serial=
getty recipe which creates explicit links for the consoles in SERIAL_CONS=
OLES.  This recipe in styhead also ships a serial-getty@.service unit tem=
plate, but the package should be empty if SERIAL_CONSOLES isn=E2=80=99t s=
et.  However, the recipe itself has a default value (SERIAL_CONSOLES ?=3D=
 "115200;ttyS0=E2=80=9D) which provides a value if the BSP doesn=E2=80=99=
t set it, so the unit files do get installed after all.
>
> I think that your setup potentially doesn=E2=80=99t actually use the ge=
tty generator at all, but the bad default of ttyS0 from the systemd-seria=
lgetty recipe.  This no longer exists as the recipe doesn=E2=80=99t set i=
ts own default anymore (as, I believe, is correct).
>
> Can you have a look at your actual use case?  I wouldn=E2=80=99t be sur=
prised if it=E2=80=99s actually just using ttyS0 from the configuration, =
and the BSP could just set that.

The BSP is using the generator. See output below:

root@xilinx-zynqmp:~# ls -l /run/systemd/generator/getty.target.wants/*
lrwxrwxrwx 1 root root 41 Mar 28 01:00=20
/run/systemd/generator/getty.target.wants/serial-getty@ttyPS0.service ->=20
/lib/systemd/system/serial-getty@.service
root@xilinx-zynqmp:~#

I think the generator took effect for previous releases because, as you=20
said, the systemd-serialgetty@.service template was always installed (by=20
a lucky mistake that you've now fixed) and the systemd-getty-generator=20
was always installed.

Now, in master branch, this template is always installed too. But we'll=20
also need the systemd-getty-generator to be there to do autodetection=20
for some BSPs.

Regards,
Qi

>
> In the medium term I really do want to propose switching from SERIAL_CO=
NSOLES to auto-detection by default, but this involves making the same th=
ing idea on sysvinit which is more involved.  I _almost_ have it working,=
 but it didn=E2=80=99t get working in time for M3.
>
> Ross



