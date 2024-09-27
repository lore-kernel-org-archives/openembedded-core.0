Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC392CEBF96
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 11:03:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.66530.1727435016005263224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 04:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9000cad0eb=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R9KNHr006827
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 11:03:35 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hmm9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 11:03:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXjXbXGRgVLVDfiFlc9n4sRGlv6PPfqUJQBAcYa9JWqiXQGOpcYJcPRoa5YBI+uPsBj6ZDEi2KxeNYYxiAIlk6ynN5/bbvKTgjy5SBaN4qjd959znxWFOuRjqlTSAScIXFW1VsCr41eMsb7ZiTixwyUoJ/KY736dH23A3uLzlj/eF2cpAQeGmPnU+OXR7bc40VJj8Ea9Wq1u88v8PSgqT3E4Ik0rmru/j345N6t0XTD/bQMxNCJdVJXNfz8KqtptVVagP9enML88p9hXasYHWOG5NX8RKS6alolp1VDd4m3abiPtxu5BM88iGq93i1eXfPyvFyauMN4kCAdiCxRJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrYIafR9RZXGz21biEyIn8JfX6ve/QdLxRfdJG8WgCo=;
 b=QKjEikCz3mRp5VZhzQ05WtCBshAHmTC7FueV1yTxzAWZ1EMw6CvMhnDg3ts9IsfmuKnCVfV0bx4JB4R6sO5KRbo0b77D0J1lCqm6E8WRIFLSds5TKpKrDTAKYkvjEEr3mN3uSvBkWPCRwqktOzd7Ds6uuaqZ2VKlwc5+MqLah5NP0eOnKWix6acXP2l6lu6GsEzYiL1I8gHiBRTZr3WXdwP2JOHnB7Pfzqyqswr3zpTX8t/BKrwKRCyPBja6Mtcm5Lg+xA7TGQO2fuU0gY0SdFZmbYPncWE1wC7/f+yRON0KjpHrMROpucuOnWNIOXl+/9J7aIvD1QdVw8S9nKj8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by IA1PR11MB7944.namprd11.prod.outlook.com (2603:10b6:208:3d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 11:03:29 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%6]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 11:03:29 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] gcc: upgrade to v11.5
Date: Fri, 27 Sep 2024 04:03:10 -0700
Message-ID: <20240927110310.2580951-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|IA1PR11MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c1fe8d-be5f-4b81-b835-08dcdee4046f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGo2QXdsNUJwcjAzdVo1R0ZKdG9NUlhyUHl2UTZQNFNaNVNoK1h5UXY4K2pq?=
 =?utf-8?B?aHR0d1Y3K3V6SjRQdUlld0N5WXJ2T1IrczBnc0F0OEh5ZE80K3ZQcS9vOWRk?=
 =?utf-8?B?TnVXa2xsSVJhcWZ3c1ZZNnRsSXhuYWNOSEVGdXNxQVJsVkxuYlJtd3ZvYk5H?=
 =?utf-8?B?cUJRNnRXK1J6a25wMTNpcHBlV2FoeHgxc0JIRnF3YmEvbW01NkRXR2Y1MFlv?=
 =?utf-8?B?NjRDTnlYQkZJZjBKY2ZSTzJjUVVBTXowUXhVSHo4ZVlFYU5ETEFqUW1JRjhz?=
 =?utf-8?B?MzBlWmFqb2pUL3h3NnRRTnI3WVJMd2N0cUhXYzlxbkZZa054cUwvaERXMlFL?=
 =?utf-8?B?ZFVVUml0anNxTlBGWFBPSVduWDNURmVvNmYzUmwrb3lwaTdraUdvSmxZT2pM?=
 =?utf-8?B?U2J4WE10RW80ZUFGYWM1ZzI4MEJnR2NGVXpkNlgxUmF1SEpsVW9JeVduRUk3?=
 =?utf-8?B?anpwdTRaMTY3TXh0ckVoeUhRMEN3T2tVVm9wUStKNkZTRVpRb2xRY1h3L0d2?=
 =?utf-8?B?a3ovUUlJSGhqQ1Q0UWdoZjN0L2pQWVFxU0VsZ05UODFOM2xsQUZza3JIQi9a?=
 =?utf-8?B?TFNmdlV1TW1FMDFxWmgxYmJlUGxNY2JHNGRaTExSTU4wSDJla1dnalJSV1pS?=
 =?utf-8?B?b0Y1QjVmdWFXVXk2WGdVUkYvYzdkQnJIUkdKZi8wSlBCdExML1FWZHUzT0dn?=
 =?utf-8?B?QStBblE5eS9NYXdUTHp3RFBORkFwc245ZHhjS0t3YlYvVFcwS1FqaDFKVFpN?=
 =?utf-8?B?U2pQbTcxOU9Pd1p6RVpWc0tiN2RodytnUm4zTmVaWjFNWGxkNHo2a2pmSWlL?=
 =?utf-8?B?TjZNb0t1YlJKY1huMHA2L29XaVpBZlJXRUVEUFB0QWVKYlRkS2MwY1hHR1h3?=
 =?utf-8?B?eHd4NGVKOHY0TWdzc2JTSzZUVFdVTk5YNXpEOENIajRobnFxcDVNK3hhbDlE?=
 =?utf-8?B?bDVQTWZhN1lzZDBKanRZWFplMVFNUzBUWm9pY2tOaUJnNXRrU1c5SkZIN0oz?=
 =?utf-8?B?enFTOFZDS2hjSWhXMVViUjVVN0FuSm90cytVZUNhUkZSUnVZcy9BMVkvQllU?=
 =?utf-8?B?Y0s2RWF0UVNscVBYalhUQ1JzOHg3YlBGQXhHSWFzVTI3MDVqbTNiM3owcm1O?=
 =?utf-8?B?LzNEYVljbkJzb3lEMlZuN0FoR3d5NzhxQ3JGT2VsUUpyQ0ZSZS8yZ3UvVmRh?=
 =?utf-8?B?ZEsyZFMwUUpUSHFROGtqT290ODBSakVIWUdNUGFObjJNY0lHWDFiSjRORzJ2?=
 =?utf-8?B?VlltMVJ2RUZLYlBKL0FmWmQ1Y1dFa2doQ2RLT2FsQkpwVlkzRjlWMEQvQzAr?=
 =?utf-8?B?SFkwSHpiNytFRTJ6bnJwRUViTVJUUmdZTkZQbWhtWmp1QkJIVFlQSi9HZTVM?=
 =?utf-8?B?bm1DWnFndjJNa1BJSTl4dnMvYmpPY1V3Z3ZhSi9za3ZLd3pGZXJ6WG96Y2Er?=
 =?utf-8?B?MGhYN21iSE1GQlVkWEhNbEZ3ejNubGRKcVRpMXFEdnI3dFdPeElQT3dWVEpQ?=
 =?utf-8?B?REk5T25zaE1uZHJ3VVNwczFNT0JrbGhTZW1LTDFJUEpnbVhsYTd5R0Z1U3V1?=
 =?utf-8?B?cC9IMDFhaVFJVEl3blBIMGV6NW0yYi9uRW05NzVOYVI0bHFlNnN4YXFMYUNi?=
 =?utf-8?B?U0tRSDR6bkdwSXprWGc1RnkwSVpoNE54cWJVb2JqNmxrcFBBNzBEYVVZdHFU?=
 =?utf-8?B?WGlpSXkxRjlhNUtSZ3Yxdng1UisvWkx6RDkveVVoekdqUUhBZkwyamNJZVpU?=
 =?utf-8?B?eEYyOEdRMXFkYUJzUWlJMGRLNTJjbTg2QkdUWkk5Smw2bWNkelBndHpqdkpM?=
 =?utf-8?Q?nvLW8RaqSXZn/6rpe5llyv30AkTtVa4umtBfE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUdMenZHcGs1OEcrQnowSitsRGZ5dHpqNHJPNTVSY1hMSE4wZklzRWF5aUFr?=
 =?utf-8?B?QzVaRlF5MXN1ci9NWXFrVkMzcnluQkVtY29tWWVBVElJMm5uR2w3ekJSS0Nt?=
 =?utf-8?B?VkRzMCtWY3hWczBUTEZzdnl5TXpjTWoydW1iYktYN2NndCtwamZGT3pIMERF?=
 =?utf-8?B?ZGxDM3hFbWllei93c1owWlhwSUFRSXZpTVcwWTJWMWhqOE1tTG9uVVdhcTRY?=
 =?utf-8?B?NFBJdFE0KzBuOE1CTVZuL1htdDgySGM1UnNMdUljeEhlN2N5YU5vSVo5Mk1l?=
 =?utf-8?B?R0ZrWEtzaFNQQUtaWTFaYkFmNzhhNlVIQ2RUYjRrQXBNd0FOZnN5ZXE0cHRR?=
 =?utf-8?B?Z3Z0MEl1VXdGMXlQL0JhRnp1b0JjUlZEbytVQXRJQ2N1RDRId3orcGZKdHVm?=
 =?utf-8?B?Tll0VEZ0TWNmbSt2WFNIUlF6OE5QRmZCdnJ0Umc3b3hxZ0tMNi9ISDNkREJo?=
 =?utf-8?B?NGJ2YThOTjA4ZU9mRmdEVjNLY3BIZGVYMmpPZk1HWnJjV1JwNlBvK3g1VElv?=
 =?utf-8?B?d3BNaHRtUitWVkhOWmRGSHp6Q0l2OEo5ajBjbVVoRUVmN1BSM1o3NVdRVEdw?=
 =?utf-8?B?aDFwSWh0a0M1SVdNT09rMTh2L3o2c0RRSzlRWDRhREVIUVpuQXFKalUyYk1H?=
 =?utf-8?B?anlRQ2t2L09QK2N5cU1SdDVoL0p4RVdIQ2k1MkZsV2hEWlo3MUROWGZ1TjJV?=
 =?utf-8?B?UE5QVW5rLytGSXUxSFVzanBTQlp6bW83dWEzd3VzOCtkZUxxZlZQTTZBNGk1?=
 =?utf-8?B?Qk5Oa01ULzdQYzRESW1TM3VsTytDOWxkZG1TMEJ4U2dGNXl2TU5JWWJ0c0s5?=
 =?utf-8?B?UTMxZnFTNkdtbXVQZ3ZMbUxhOXI3OFhrQTJneFcwQmM5N3Q1djZtTHlkRFhp?=
 =?utf-8?B?dXR1dEo3S3RkYUZLSWF4Y1lHZ3ltOWJBa0txTW95WElxSlJHcS9PaGQvMjJ3?=
 =?utf-8?B?Z1RXUnhPWDdtRWRzWFJmdGkxbWhJMkJtU1JsekxwcHIwdWpJYThRU1RIdU1V?=
 =?utf-8?B?YnIzRm5nSmZRRzRCdGl5YzNGOFpvTGpOTDJsQ0FhbGQvYXlpYi83elU4a01o?=
 =?utf-8?B?c1JkaDNoUFpiZGRoY09YNHRQeDlJT2YvSFZUaGZoWU9LRzRDQ0VCZ3V3M0Z5?=
 =?utf-8?B?ZTdFckpWNnFRZExYTDg1TEJRaXJOQ0pqdnpXUHJCTTE5elhzTkcvOXR3bGdz?=
 =?utf-8?B?d1dqSys4ZW1tTk1NY0FtTmNhTmtuWWlEOW1iM3F3dWpmWWw1UXV5Y0hOUUpT?=
 =?utf-8?B?c2ZVUi9oU1h2bW43TDdoM3N3Y09xTE1oRUdTNmJOK25yYkhwNDVINHFBbklL?=
 =?utf-8?B?V1BuaHhyZnpDOWNwNDdnTFBjOHF5R0xEZElPVXd4T3E4b25heTBJQVpNTkNw?=
 =?utf-8?B?cnN2ZytIMEZOa2ZiVG1ORzBNdWFCcmpvdFZNY3pydVpNVHRoQkR4VmUwNVd4?=
 =?utf-8?B?RVR0bEV0Q2VqQzJ4dnRHV2RsYmU1R3hraXp5blErRFhyeCsycHBQWDZJYXpR?=
 =?utf-8?B?QkcrQ3I3eTJXVVhpQkMrclJnczBzanVPSEJmNWR4Mml3bHo4aUpQUFIxejFu?=
 =?utf-8?B?eCt1RUMyT2Fzbnk5dHljQ0dhcm5QWG9TUFdCTGxCV3d3ZXVXRWVqSjlVdEpS?=
 =?utf-8?B?MEdCVWhKbTBxck95Nkd3SWZNSmxtdGlFUVlrTmN5bkFGNHNoOTlMNFNyUU5F?=
 =?utf-8?B?UXpRd1JkT1M5eHcvcVB2SmhBZGRvbVhQOC9ZblY2TUpGVlNDSXVackFtZzlZ?=
 =?utf-8?B?TGpaR0R6OGtSRk5XcmlYODdDUnRVR2xiTjh0QXpTVW5NbllkQVgvTUFnVzVl?=
 =?utf-8?B?NVdseUp1RFFyNG9jejVmL3ZOWitKVFlMSmxXVm9VekhGcTBXdEhvRjlTZStq?=
 =?utf-8?B?K1U2U1c3TDhsWDRNeUtJL3kxTmxLdmtDNXFzL1VjRVVRMFNWUW53OGhqZkEz?=
 =?utf-8?B?NXBCYkZCV0QxNGpOU3lpRXFYYWk1eGl4RmNtY0Fad0VMb1RZTFpnVHFnS2JZ?=
 =?utf-8?B?OE91UkdtbnBRYzA1bmdGZXpzSkM2cXlScDdISDdST1kyODlRTVpTLy80K2V0?=
 =?utf-8?B?cktrZDQwSnpoZzlmQnZaUlZOQkNaT3ZkSkk5UXJwQk5zTVg5ZVl4QTJReDNr?=
 =?utf-8?B?TXJ2N0VmVjEyZm16Q1JwOUpNM1BwSW5ldDJZUVROK25pdU1Sczl3V2V4RmRa?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c1fe8d-be5f-4b81-b835-08dcdee4046f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 11:03:29.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DttEB0Oqq1meZwfO6IHUs+RvL1W/87j377jk/KGO+OSSMyQzMLqV1d6garVoVDdd9OqaSmhCME26hGeR67AjvgwwLwlgBec7aBp0f423V1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7944
X-Proofpoint-ORIG-GUID: XUuHJRolVw1aC4qeN0m-SC_fQcmU0rm2
X-Authority-Analysis: v=2.4 cv=bas5U/PB c=1 sm=1 tr=0 ts=66f69105 cx=c_pps a=XlWNgFwcAB8XWrBhwjv7Vg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8
 a=7CQSdrXTAAAA:8 a=NEAV23lmAAAA:8 a=EYOlQq3ilWny-mwUZiUA:9 a=xHPcUc6DLI4wm71m:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rJJ2XIrOfN0A:10 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: XUuHJRolVw1aC4qeN0m-SC_fQcmU0rm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_06,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409270079
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48R9KNHr006827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 11:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205014

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

gcc stable version upgraded from v11.4 to v11.5

Dropped CVE-2023-4039.patch and 0001-aarch64-Update-Neoverse-N2-core-defi=
ni.patch
because its been taken to gcc-11.5 with below commits 75c37e0314 and 50d9=
db203bc

For changes in v11.5 see: https://gcc.gnu.org/gcc-11/changes.html

Below is the bug fix list for v11.5:
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&list_id=3D=
444046&resolution=3DFIXED&target_milestone=3D11.5

There are a total 164 bugs are fixed in this release, below is the list o=
f bugs fixed excluding the regression fixes.
ID      Product  Comp       Assignee=E2=96=B2       Summary

112672	gcc	target	     ubizjak	[14 Regression] wrong code with __builtin_=
parityl() at -O and above on x86_64
111736	gcc	sanitize    unassigned	Address sanitizer is not compatible wit=
h named address spaces
80899	gcc	ipa	     hubicka	[11/12/13/14 Regression] Devirtualization caus=
es incorrect code generation with placement new in some cases
105301	gcc	c++          iains	[11 Regression] ICE: tree check: expected t=
ree that contains 'decl minimal' structure, have 'overload' in coro_promi=
se_type_found_p, at cp/coroutines.cc:516
110027	gcc	middle-e     jakub	[11 regression] Stack objects with extended=
 alignments (vectors etc) misaligned on detect_stack_use_after_return
110079	gcc	rtl-opt	     jakub	[11 Regression] ICE with -freorder-blocks-a=
nd-partition and inline-asm goto
110731	gcc	tree-opt     jakub	[11/12 Regression] Wrong-code because of wi=
de-int division since r5-424
111015	gcc	tree-opt     jakub	[11/12/13/14 Regression] __int128 bitfields=
 optimized incorrectly to the 64 bit operations
112727	gcc	sanitizer    jakub	[11/12/13 Regression] UBSAN creates GIMPLE =
path with uninitialized variable
113674	gcc	c++	     jakub	[11 Regression] [[____attr____]] causes interna=
l compiler error: in decl_attributes, at attribs.cc:776
114310	gcc	target	     jakub	[11 Regression] [aarch64] __sync_val_compare=
_and_swap fails on __int128_t with newval =3D 0
114493	gcc	c	     jakub	[11 Regression] internal compiler error: in fld_i=
ncomplete_type_of with may_alias
114566	gcc	tree-opt     jakub	[11 Regression] Misaligned vmovaps when com=
piling with stack-protector-strong for znver4
114634	gcc	c++	     jakub	[11 Regression] Crash Issue Encountered in GCC =
Compilation of Template Code with Aligned Attribute since r9-1745
114691	gcc	c++	     jakub	[11 Regression] Bogus ignoring loop annotation =
warning
114825	gcc	fortran      Jakub	[11 Regression] Compiler error using gfortr=
an and OpenMP since r5-1190
114876	gcc	tree-opt     jakub	[11 Regression] -fprintf-return-value misha=
ndles %lc with a '\0' argument.
114956	gcc	sanitizer    jakub	[11 Regression] Segmentation fault with -fs=
anitize=3Daddress -fsanitize=3Dnull -O2 when attribute no_sanitize_addres=
s is enabled since r9-5742
106890	gcc	c++	     jason	[11 Regression] virtual inheritance triggers co=
mpiler error when instatiating derived class with in-class initialization=
 since r8-2709-g12659e10c7820071
111529	gcc	c++	     jason	[11/12/13 Regression] ICE on bool conversion in=
 an unrolled loop condition inside template lambda nested in another temp=
late scope
113598	gcc	c++	     jason	[11/12/13 Regression] GCC internal compiler err=
or since r0-124275
114561	gcc	c++	     jason	[11/12 Regression] Comma operator with forwardi=
ng reference to pointer raises invalid lvalue required error since r10-74=
10
114562	gcc	c++          jason	[11/12 Regression] ICE when trying to bind =
rvalue reference to lvalue with comma operator and forwarding reference t=
o pointer since r10-7410
115565	gcc	rtl-opti     macro	[11/12/13/14/15 Regression] CSE: Comparison=
 incorrectly evaluated as constant causing optimization to produce wrong =
code
109876	gcc	c++        mpolacek	[11/12 Regression] initializer_list not us=
able in constant expressions in a template
110106	gcc	c++        mpolacek	[11/12 Regression] ICE on noexcept(noexcep=
t(...)) with optional
89224	gcc	c++	   pinskia	[11/12/13/14/15 Regression] subscript of const v=
ector has the wrong type
110386	gcc	tree-opt   pinskia	[11/12 Regression] ICE with ABSU in backpro=
p
111331	gcc	tree-opt   pinskia	[11/12 Regression] Wrong code at -O1 on x86=
_64-linux-gnu since
108120	gcc	target	   rearnsha	[11/12 Regression] ICE: in extract_insn, at=
 recog.cc:2791 (on ARM with -mfpu=3Dneon -freciprocal-math -O3)
95048	gcc	libstdc+   redi	[11 Regression] wstring-constructor of std::fil=
esystem::path throws for non-ASCII characters
104606	gcc	libstdc+   redi	[11 Regression] comparison operator resolution=
 with std::optional and -std=3Dc++20
90348	gcc	middle-e   rguenth	[11 Regression] Partition of char arrays is =
incorrect in some cases
96881	gcc	tree-opt   rguenth	[11 Regression] Clobbers on NULL vs. DCE sin=
ce r8-1519
97990	gcc	c++	   rguenth	[11 Regression] ICE: =E2=80=98verify_type=E2=80=99=
 failed with vector types and non-PODs since r6-5222-gba6a6a1d44c17f25
103006	gcc	middle-e   rguenth	[12/13/14/15 Regression] wrong code at -O1 =
or -O2 on x86_64-linux-gnu by r7-7101
110176	gcc	tree-opt   rguenth	[11 Regression] wrong code at -Os and above=
 on x86_64-linux-gnu since r11-2446
110295	gcc	c++	   rguenth	[11 Regression] ICE in dwarf2out_finish with lo=
cal class with inherited operator delete in a templated function and -g
110298	gcc	tree-opt   rguenth	[11 Regression] ICE at -Os on x86_64-linux-=
gnu since r10-840
111039	gcc	tree-opt   rguenth	[11 Regression] Unable to coalesce ssa_name=
s
111080	gcc	debug	   rguenth	[11 Regression] restrict qualifier causes ext=
ra debug info to happen
111472	gcc	tree-opt   rguenth	[11 Regression] Wrong code at -Os on x86_64=
-linux-gnu since r11-4563-gd0d8b5d836
111614	gcc	tree-opt   rguenth	[11 Regression] ICE at -O2: verify_gimple f=
ailed since r14-2282-gf703d2fd3f0
111764	gcc	tree-opt   rguenth	[11 Regression] Wrong code at -O3 on x86_64=
-linux-gnu
111818	gcc	middle-e   rguenth	[11 Regression] ICE with __builtin_memcpy w=
ith volatile and constants
111917	gcc	tree-opt   rguenth	[11 Regression] ICE in as_a, at is-a.h:255 =
since GCC-7
112495	gcc	tree-opt   rguenth	[11 Regression] ICE: verify_gimple failed (=
after vectorizer) with named address space (__seg_gs )
112505	gcc	tree-opt   rguenth	[11 Regression] internal compiler error: in=
 build_vector_from_val, at tree.cc:2104 since r10-4076
112718	gcc	debug	   rguenth	[11 Regression] ICE: in add_dwarf_attr, at dw=
arf2out.cc:4501 with -g -fdebug-types-section -flto -ffat-lto-objects
112793	gcc	tree-opt   rguenth	[11 regression] ICE when building stellariu=
m (internal compiler error: in vect_schedule_slp_node, at tree-vect-slp.c=
c:9062)
114027	gcc	tree-opt   rguenth	[11 Regression] miscompile at `-O3 -fno-vec=
t-cost-model -msse4.2`
114734	gcc	target	   rguenth	[11 regression] RISC-V rv64gcv_zvl256b misco=
mpile with -flto -O3 -mrvv-vector-bits=3Dzvl since r8-6047-g65dd1346027bb=
5
108086	gcc	rtl-opti   rsandifo	[11 Regression] internal compiler error: i=
n set_accesses, at rtl-ssa/internals.inl:449
113281	gcc	tree-opt   rsandifo	[11 Regression] Latent wrong code due to v=
ectorization of shift reduction and missing promotions since r9-1590
113552	gcc	tree-opt   tnfchris	[11/12/13 Regression] vectorizer generates=
 calls to vector math routines with 1 simd lane.
29256	gcc	target	  unassigned	[11/12/13/14 regression] loop performance r=
egression
82446	gcc	tree-opt  unassigned	[11/12/13/14 Regression] Missed equalities=
 in dr_group_sort_cmp
93631	gcc	c         unassigned	[11/12/13/14 Regression] ICE on an invalid=
 strcmp call in gimple_call_arg, at gimple.h:3258
93930	gcc	target	  unassigned	[11/12/13/14 Regression] Unnecessary broadc=
ast instructions for AVX512
94335	gcc	tree-opt  unassigned	[11/12/13/14 Regression] False positive -W=
stringop-overflow warning with -O2
97140	gcc	target	  unassigned	[11/12/13/14 Regression] ICE in error: unab=
le to generate reloads for since r10-400-gecfdb16c54ad06ac
100623	gcc	target    unassigned	[11 Regression] wrong code with -Os -fno-=
dce -fno-defer-pop -fno-forward-propagate -flive-range-shrinkage -fno-rer=
un-cse-after-loop -mno-push-args since r10-7515-g2c0fa3ecf70d199a
100667	gcc	libstdc+  unassigned	[11/12 Regression] std::tuple<A&&> cannot=
 be constructed from A&&, if A not defined (only forward declared)
103497	gcc	c++	  unassigned	[11/12/13/14 Regression] ICE when decltype(au=
to)... as parameters
105034	gcc	target	  unassigned	[11/12/13/14 regression]Suboptimal codegen=
 for min/max with -Os
107057	gcc	rtl-opti  unassigned	[11/12 Regression] ICE in extract_constra=
in_insn, at recog.cc:2692
109800	gcc	target	  acoplan	[11 Regression] arm: ICE (segfault) loading d=
ouble with -mpure-code -mbig-endian
110288	gcc	fortran	  anlauf	[11/12/13/14] Regression: segfault in findloc=
 with allocatable array of allocatable characters
110585	gcc	fortran	  anlauf	ICE in gfc_compare_expr for findloc with comp=
lex literal array
110658	gcc	fortran	  anlauf	MINVAL/MAXVAL and deferred-length character a=
rrays
115611	gcc	target	  avieira	mve: vsetq_lane for 64-bits has wrong codegen=
 when setting lane 1
113893	gcc	ada       ebotcazou	finalization of object allocated by anonym=
ous access type designating local type
111050	gcc	libstdc+  fdumont	[11/12/13/14 Regression] ABI break in _Hash_=
node_value_base since GCC 11
110624	gcc	target	  iains	Xcode 15 ld warns about -macosx_version_min
114171	gcc	d	  ibuclaw	[13/14 Regression] gdc -O2 -mavx generates misalig=
ned vmovdqa instruction
108789	gcc	middle-e  jakub	__builtin_(add|mul|sub)_overflow methods gener=
ate duplicate operations if both operands are const which in turn causes =
wrong code due to overlapping arguments
110115	gcc	middle-e  jakub	[11 Regression] Wrong code at -O1 on x86_64-li=
nux-gnu
110914	gcc	tree-opt  jakub	[11/12/13/14 Regression] Optimization eliminat=
ing necessary assignment before 0-byte memcpy since r10-5451
111422	gcc	middle-e  jakub	Wrong code at -O3 on x86_64-linux-gnu
112816	gcc	target	  jakub	[11/12 Regression] ICE unrecognizable_insn with=
 __builtin_signbit and returning struct with int[4]
113122	gcc	target	  jakub	Assembler messages: Error: operand type mismatc=
h for `movabs' / bad expression / invalid use of register with -fprofile =
-mcmodel=3Dlarge -masm=3Dintel
113192	gcc	libgomp	  jakub	[11 Regression] ERROR: couldn't execute "../..=
/../gcc/libgomp/testsuite/flock": no such file or directory
113262	gcc	c	  jakub	[11 Regression] ICE when using [[gnu::copy("")]] att=
ribute
114533	gcc	libquadm  jakub	libquadmath: printf: fix misaligned access on =
args
114537	gcc	c++	  jakub	bit_cast does not work NSDMI of bitfields
114572	gcc	c++	  jakub	[OpenMP] "internal compiler error: in assign_temp"=
 with assignment operator and lastprivate clause
115172	gcc	sanitize  jakub	Invalid -fsanitize=3Dbool sanitization of vari=
able from named address space
115440	gcc	driver	  jakub	unrecognized command-line option '--c++17'; did=
 you mean '--stdc++17'?
110422	gcc	tree-opt  jamborm	asm goto vs SRA
92145	gcc	c++	  jason	-Wdeprecated-copy false-positive when inheriting ba=
se assignment operators
92407	gcc	c++	  jason	Destruction of objects returned from functions skip=
ped by goto
103185	gcc	c++	  jason	[11/12/13 Regression] ind[arr] is rejected when ar=
r is an array prvalue
106310	gcc	c++	  jason	[11 Regression] lookup after this-> seems wrong fo=
r dependent lookup since r12-6754-g30f2c22def739211
111357	gcc	c++	  jason	[11/12/13/14 Regression] __integer_pack fails to w=
ork with values of dependent type convertible to integers in noexcept con=
text
114130	gcc	target	  kito	[11 Regression] RISC-V: `__atomic_compare_exchan=
ge` does not use sign-extended value for RV64
113250	gcc	libstdc+  kmatsui	std::filesystem::equivalent("", "/") should =
throw
115457	gcc	target	  ktkachov	AArch64 should define __ARM_FEATURE_BF16
115475	gcc	target	  ktkachov	AArch64 should define __ARM_FEATURE_SVE_BF16=
 when appropriate
88309	gcc	target    linkw	[11/12/13/14 Regression] ICE: Floating point ex=
ception (in is_miss_rate_acceptable), target assigning alignent of 4 bits=
(!) to vector
104259	gcc	libstdc+  marxin	libstdc++ fails for epiphany-elf
109822	gcc	libstdc+  mkretz	Converting std::experimental::simd masks yiel=
ds an error
59465	gcc	c++	  mpolacek	[11/12/13 Regression] g++ allows direct-initiali=
zation of an array of class type from another array in a mem-initializer
100557	gcc	c++	  mpolacek	[11/12/13/14 Regression] Internal compiler erro=
r: Error reporting routines re-entered.
115642	gcc	c	  mpolacek	[11/12/13/14/15 Regression] internal compiler err=
or: tree check: expected class 'type', have 'exceptional' (error_mark) in=
 c_expr_sizeof_expr
95351	gcc	middle-e  pinskia	[11/12 Regression] Comparison with NAN optimi=
zes incorrectly with -ffast-math disabled
111699	gcc	middle-e  pinskia	[11/12/13 Regression] ICE: SIGSEGV: infinite=
 recursion in fold_build3_loc/fold_ternary_loc/generic_simplify_VEC_COND_=
EXPR
109761	gcc	c++	  ppalka	[11/12 Regression] Nested class destructor's noex=
cept specification incorrectly considered as too loose compared to the ou=
ter class
111485	gcc	c++	  ppalka	[11/12 Regression] Constraint mismatch on templat=
e template parameter
113175	gcc	testsuit  ppalka	[11/12/13/14 Regression] testsuite/std/ranges=
/iota/max_size_type.cc 5x times slower
111407	gcc	tree-opt  qinzhao	[11/12/13 Regression] ICE: SSA corruption du=
e to widening_mul opt on conflict across an abnormal edge
99327	gcc	libstdc+  redi	ENOTSUP macro does not exist on djgpp crt
104161	gcc	libstdc+  red	Potential Security Vulnerability: remove_all and=
 symbolic link
105178	gcc	libstdc+  redi	[11 Regression] g++ incorrectly reports invalid=
 use of incomplete type
108178	gcc	libstdc+  redi	Filesystem::copy_file can't copy from /proc on =
Linux machines
112491	gcc	libstdc+  redi	std::deque<T,Allocator>::size xmethod output is=
 wrong
114147	gcc	libstdc+  redi	[11 Regression] tuple allocator-extended constr=
uctor requires non-explicit default constructor
114401	gcc	libstdc+  redi	libstdc++ allocator destructor omitted when rei=
nserting node_handle into tree- and hashtable-based containers
96109	gcc	testsuit  rguenth	[11 Regression] gcc.dg/vect/slp-47.c etc. FAI=
L
110182	gcc	tree-opt  rguenth	[11 Regression] Vector(2) cast from double t=
o float and back and subtraction seems to produce incorrect results
110200	gcc	middle-e  rguenth	genmatch generating questionable code with c=
onvert and !
98237	gcc	ipa	  ro            gcc-dg-lto-modref-3-01.exe etc. FAIL when L=
TO plugin is not enabled
97696	gcc	sanitize  rsandifo	ICE since ASAN_MARK does not handle poly_int=
 sized varibales
100303	gcc	debug	  rsandifo	[11 Regression] -fcompare-debug failure (leng=
th) with -O -fno-dce -ftracer
111340	gcc	target	  ubizjak	gcc.dg/bitint-12.c fails on x86_64-apple-darw=
in or fails on x86_64-linux-gnu with -fPIE
115297	gcc	rtl-opti  ubizjak	[14/15 regression] alpha: ICE in simplify_su=
breg, at simplify-rtx.cc:7554 with -O1
115836	gcc	middle-e  ubizjak	ICE when building Firefox with-march=3Dpenti=
um-mmx -mtune=3Dpentium-m
91085	gcc	other	unassigned	[11 only] fixincludes breaks <bits/statx.h>
103183	gcc	c++	unassigned	[11/12/13/14 Regression] ind[arr] produces an l=
value when arr is an array xvalue
105417	gcc	libstdc+unassigned	[11 Regression] powerpc64le-linux abilist c=
hanges based on --with-long-double-format=3D
110309	gcc	target	unassigned	Wrong code for masked load expansion
111922	gcc	ipa	unassigned	[11/12/13/14 Regression] ICE in cp with -O2 -fn=
o-tree-fre
112823	gcc	other	unassigned	[11 only] -Wincompatible-pointer-types errors=
 in libiberty/simple-object-mach-o.c (missing backport for gcc-11)
112891	gcc	target	unassigned	[11/12/13/14 Regression] Missing vzeroupper =
insert
114049	gcc	target	unassigned	gcc.dg/framework-1.c FAILs with Xcode 15.3 b=
eta 3
114098	gcc	target	unassigned	_tile_loadconfig doesn't work
114521	gcc	target	unassigned	[11 only] aarch64: wrong code with Neon ld1/=
st1x4 intrinsics gcc-11 and earlier
115261	gcc	rtl-opti unassigned	[11/12/13/14/15 regression] FAIL: gcc.targ=
et/s390/vector/vec-abi-vararg-1.c
115269	gcc	libstdc+ unassigned	Hardcoded links in 14.1 docs to pages from=
 release 4.3.2
115870	gcc	tree-opt unassigned	Inlining of different template instances w=
rongly produces infinite loop
103715	gcc	fortran	anlauf	[11/12/13/14 Regression] ICE in gfc_find_gsymbo=
l, at fortran/symbol.c:4301 since r9-3803-ga5fbc2f36a291cbe
111837	gcc	fortran	anlauf	[11/12/13/14 Regression] Out of bounds access w=
ith optimization inside io-implied-do-control
114474	gcc	fortran	anlauf	[11/12/13/14 Regression] DATA statement with de=
rived type, pointer component rejected
113979	gcc	ada	ebotcazou	[11/12/13/14 regression] bogus error on allocato=
r for array type with Dynamic_Predicate
103506	gcc	fortran	jvdelisle	[11 Regression] ICE in gfc_free_namespace, a=
t fortran/symbol.c:4039 since r10-2798-ge68a35ae4a65d2b3
107397	gcc	fortran	jvdelisle	[11/12 Regression] ICE in gfc_arith_plus, at=
 fortran/arith.cc:654
91035	gcc	target	krebbel	[11/12/13/14 Regression] gotools fails to build =
on s390x-linux-gnu
84006	gcc	fortran	pault	[11/12 Regression] ICE in storage_size() with CLA=
SS entity
89462	gcc	fortran	pault	[11/12/13 Regression] gfortran loops in code gene=
ration
93678	gcc	fortran	pault	[11/12/13 Regression] ICE with TRANSFER and typeb=
ound procedures
103312	gcc	fortran	pault	[11/12 Regression] ICE in gfc_find_component sin=
ce r9-1098-g3cf89a7b992d483e
103368	gcc	fortran	pault	[11/12/13 Regression] ICE in gimplify_expr, at g=
implify.c:15668 since r12-4464-g017665f63047ce47
103716	gcc	fortran	pault	[11/12/13 Regression] ICE in gimplify_expr, at g=
implify.c:15964 since r9-3803-ga5fbc2f36a291cbe
106999	gcc	fortran	pault	[11/12/13 Regression] ICE tree check: expected r=
ecord_type or union_type or qual_union_type, have function_type in gfc_cl=
ass_data_get, at fortran/trans-expr.cc:233
71703	gcc	fortran	unassigned	[11 Regression] [OOP] ICE in wide_int_to_tre=
e, at tree.c:1488
89925	gcc	fortran	unassigned	[11 Regression] Wrong array bounds from ALLO=
CATE with SOURCE or MOLD
99183	gcc	fortran	unassigned	[11 Regression] Incompatible Runtime types
99757	gcc	c++	unassigned	[11/12/13/14 Regression] ICE: in cp_finish_decl,=
 at cp/decl.c:7736
104391	gcc	fortran	unassigned	[11 Regression] bind(C) and allocatable or =
pointer attribute don't work
104908	gcc	fortran	unassigned	[11/12/13/14 Regression] incorrect Fortran =
out-of-bound runtime error.
113179	gcc	middle-e unassigned	[11/12/13/14/15 Regression] MIPS: INS is u=
sed for long long, before SLL
80774	gcc	fortran	vehre	[11/12/13/14/15 Regression][Coarray] ICE in gfc_c=
onv_descriptor_data_get, at fortran/trans-array.c
82904	gcc	fortran	vehre	[11/12/13/14/15 Regression][Coarray] ICE in make_=
ssa_name_fn, at tree-ssanames.c:261
111880	gcc	fortran	anlauf	[11/12/13/14] False positive warning of obsoles=
cent COMMON block with Fortran submodule
61527	gcc	fortran	unassigned	[11/12/13/14 Regression] [OOP] class/extends=
, multiple generic assignment, accept invalid

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../gcc/{gcc-11.4.inc =3D> gcc-11.5.inc}        |    8 +-
 ...ian_11.4.bb =3D> gcc-cross-canadian_11.5.bb} |    0
 .../{gcc-cross_11.4.bb =3D> gcc-cross_11.5.bb}  |    0
 ...-crosssdk_11.4.bb =3D> gcc-crosssdk_11.5.bb} |    0
 ...cc-runtime_11.4.bb =3D> gcc-runtime_11.5.bb} |    0
 ...itizers_11.4.bb =3D> gcc-sanitizers_11.5.bb} |    0
 ...{gcc-source_11.4.bb =3D> gcc-source_11.5.bb} |    0
 ...rch64-Update-Neoverse-N2-core-defini.patch |   38 -
 .../gcc/gcc/CVE-2023-4039.patch               | 2893 -----------------
 .../gcc/{gcc_11.4.bb =3D> gcc_11.5.bb}          |    0
 ...initial_11.4.bb =3D> libgcc-initial_11.5.bb} |    0
 .../gcc/{libgcc_11.4.bb =3D> libgcc_11.5.bb}    |    0
 ...ibgfortran_11.4.bb =3D> libgfortran_11.5.bb} |    0
 13 files changed, 3 insertions(+), 2936 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-11.4.inc =3D> gcc-11.5.inc} (95%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.4.bb =3D> gcc-cr=
oss-canadian_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.4.bb =3D> gcc-cross_11.5.=
bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.4.bb =3D> gcc-crosssdk=
_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.4.bb =3D> gcc-runtime_1=
1.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.4.bb =3D> gcc-saniti=
zers_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.4.bb =3D> gcc-source_11.=
5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neo=
verse-N2-core-defini.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
 rename meta/recipes-devtools/gcc/{gcc_11.4.bb =3D> gcc_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.4.bb =3D> libgcc-ini=
tial_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.4.bb =3D> libgcc_11.5.bb} (1=
00%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.4.bb =3D> libgfortran_1=
1.5.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-11.4.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.5.inc
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-11.4.inc
rename to meta/recipes-devtools/gcc/gcc-11.5.inc
index fd6a3e92e3..c316d2a9a0 100644
--- a/meta/recipes-devtools/gcc/gcc-11.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
=20
 # Third digit in PV should be incremented after a minor release
=20
-PV =3D "11.4.0"
+PV =3D "11.5.0"
=20
 # BINV should be incremented to a revision after a minor gcc release
=20
-BINV =3D "11.4.0"
+BINV =3D "11.5.0"
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
=20
@@ -65,14 +65,12 @@ SRC_URI =3D "\
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
-	   file://0001-aarch64-Update-Neoverse-N2-core-defini.patch \
 	   file://0002-aarch64-add-armv9-a-to-march.patch \
 	   file://0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch \
 	   file://0004-arm-add-armv9-a-architecture-to-march.patch \
-	   file://CVE-2023-4039.patch \
 "
=20
-SRC_URI[sha256sum] =3D "3f2db222b007e8a4a23cd5ba56726ef08e8b1f1eb2055ee7=
2c1402cea73a8dd9"
+SRC_URI[sha256sum] =3D "a6e21868ead545cf87f0c01f84276e4b5281d672098591c1=
c896241f09363478"
=20
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
=20
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.4.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.4.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.4.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_11.4.bb
rename to meta/recipes-devtools/gcc/gcc-cross_11.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.4.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.4.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.4.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_11.4.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_11.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.4.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.4.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_11.4.bb b/meta/recipes-=
devtools/gcc/gcc-source_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_11.4.bb
rename to meta/recipes-devtools/gcc/gcc-source_11.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N=
2-core-defini.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-N=
eoverse-N2-core-defini.patch
deleted file mode 100644
index a0c9db72e1..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-=
defini.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9f37d31324f89d0b7b2abac988a976d121ae29c6 Mon Sep 17 00:00:00 2001
-From: Andre Vieira <andre.simoesdiasvieira@arm.com>
-Date: Thu, 8 Sep 2022 06:02:18 +0000
-Subject: [PATCH 1/4] aarch64: Update Neoverse N2 core definition
-
-commit 9f37d31324f89d0b7b2abac988a976d121ae29c6 from upstream.
-
-gcc/ChangeLog:
-
-        * config/aarch64/aarch64-cores.def: Update Neoverse N2 core entr=
y.
-
-Upstream-Status: Backport
-Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
----
- gcc/config/aarch64/aarch64-cores.def | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/a=
arch64-cores.def
-index 4643e0e27..3478e567a 100644
---- a/gcc/config/aarch64/aarch64-cores.def
-+++ b/gcc/config/aarch64/aarch64-cores.def
-@@ -147,7 +147,6 @@
- AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_F=
OR_ARCH8_4 | AARCH64_FL_CRYPTO, saphira,   0x51, 0xC01, -1)
-
- /* Armv8.5-A Architecture Processors.  */
--AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR=
_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_F=
L_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARC=
H64_FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
- AARCH64_CORE("neoverse-v2", neoversev2, cortexa57, 8_5A, AARCH64_FL_FOR=
_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_F=
L_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARC=
H64_FL_MEMTAG, neoverse512tvb, 0x41, 0xd4f, -1)
-
- /* ARMv8-A big.LITTLE implementations.  */
-@@ -165,4 +164,7 @@
- /* Armv8-R Architecture Processors.  */
- AARCH64_CORE("cortex-r82", cortexr82, cortexa53, 8R, AARCH64_FL_FOR_ARC=
H8_R, cortexa53, 0x41, 0xd15, -1)
-
-+/* Armv9-A Architecture Processors. */
-+AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 9A, AARCH64_FL_FOR_A=
RCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_SVE2_BITPERM | AARC=
H64_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2, 0x41, 0x=
d49, -1)
-+
- #undef AARCH64_CORE
-
diff --git a/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch b/meta/rec=
ipes-devtools/gcc/gcc/CVE-2023-4039.patch
deleted file mode 100644
index 41684fe7dd..0000000000
--- a/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
+++ /dev/null
@@ -1,2893 +0,0 @@
-From: Richard Sandiford <richard.sandiford@arm.com>
-Subject: [PATCH 00/19] aarch64: Fix -fstack-protector issue
-Date: Tue, 12 Sep 2023 16:25:10 +0100
-
-This series of patches fixes deficiencies in GCC's -fstack-protector
-implementation for AArch64 when using dynamically allocated stack space.
-This is CVE-2023-4039.  See:
-
-https://developer.arm.com/Arm%20Security%20Center/GCC%20Stack%20Protecto=
r%20Vulnerability%20AArch64
-https://github.com/metaredteam/external-disclosures/security/advisories/=
GHSA-x7ch-h5rf-w2mf
-
-for more details.
-
-The fix is to put the saved registers above the locals area when
--fstack-protector is used.
-
-The series also fixes a stack-clash problem that I found while working
-on the CVE.  In unpatched sources, the stack-clash problem would only
-trigger for unrealistic numbers of arguments (8K 64-bit arguments, or an
-equivalent).  But it would be a more significant issue with the new
--fstack-protector frame layout.  It's therefore important that both
-problems are fixed together.
-
-Some reorganisation of the code seemed necessary to fix the problems in =
a
-cleanish way.  The series is therefore quite long, but only a handful of
-patches should have any effect on code generation.
-
-See the individual patches for a detailed description.
-
-Tested on aarch64-linux-gnu. Pushed to trunk and to all active branches.
-I've also pushed backports to GCC 7+ to vendors/ARM/heads/CVE-2023-4039.
-
-CVE: CVE-2023-4039
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
- =20
- =20
-From 52816ab48f97968f3fbfb5656250f3de7c00166d Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:43 +0100
-Subject: [PATCH 01/19] aarch64: Use local frame vars in shrink-wrapping =
code
-
-aarch64_layout_frame uses a shorthand for referring to
-cfun->machine->frame:
-
-  aarch64_frame &frame =3D cfun->machine->frame;
-
-This patch does the same for some other heavy users of the structure.
-No functional change intended.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_save_callee_saves): Use
-	a local shorthand for cfun->machine->frame.
-	(aarch64_restore_callee_saves, aarch64_get_separate_components):
-	(aarch64_process_components): Likewise.
-	(aarch64_allocate_and_probe_stack_space): Likewise.
-	(aarch64_expand_prologue, aarch64_expand_epilogue): Likewise.
-	(aarch64_layout_frame): Use existing shorthand for one more case.
----
- gcc/config/aarch64/aarch64.c | 115 ++++++++++++++++++-----------------
- 1 file changed, 60 insertions(+), 55 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 391a93f3018..77c1d1300a5 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7994,6 +7994,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
- 			   unsigned start, unsigned limit, bool skip_wb,
- 			   bool hard_fp_valid_p)
- {
-+  aarch64_frame &frame =3D cfun->machine->frame;
-   rtx_insn *insn;
-   unsigned regno;
-   unsigned regno2;
-@@ -8008,8 +8009,8 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
-       bool frame_related_p =3D aarch64_emit_cfi_for_reg_p (regno);
-=20
-       if (skip_wb
--	  && (regno =3D=3D cfun->machine->frame.wb_candidate1
--	      || regno =3D=3D cfun->machine->frame.wb_candidate2))
-+	  && (regno =3D=3D frame.wb_candidate1
-+	      || regno =3D=3D frame.wb_candidate2))
- 	continue;
-=20
-       if (cfun->machine->reg_is_wrapped_separately[regno])
-@@ -8017,7 +8018,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
-=20
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-       reg =3D gen_rtx_REG (mode, regno);
--      offset =3D start_offset + cfun->machine->frame.reg_offset[regno];
-+      offset =3D start_offset + frame.reg_offset[regno];
-       rtx base_rtx =3D stack_pointer_rtx;
-       poly_int64 sp_offset =3D offset;
-=20
-@@ -8030,7 +8031,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
- 	{
- 	  gcc_assert (known_eq (start_offset, 0));
- 	  poly_int64 fp_offset
--	    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
-+	    =3D frame.below_hard_fp_saved_regs_size;
- 	  if (hard_fp_valid_p)
- 	    base_rtx =3D hard_frame_pointer_rtx;
- 	  else
-@@ -8052,8 +8053,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
- 	  && (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) <=3D lim=
it
- 	  && !cfun->machine->reg_is_wrapped_separately[regno2]
- 	  && known_eq (GET_MODE_SIZE (mode),
--		       cfun->machine->frame.reg_offset[regno2]
--		       - cfun->machine->frame.reg_offset[regno]))
-+		       frame.reg_offset[regno2] - frame.reg_offset[regno]))
- 	{
- 	  rtx reg2 =3D gen_rtx_REG (mode, regno2);
- 	  rtx mem2;
-@@ -8103,6 +8103,7 @@ static void
- aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start,
- 			      unsigned limit, bool skip_wb, rtx *cfi_ops)
- {
-+  aarch64_frame &frame =3D cfun->machine->frame;
-   unsigned regno;
-   unsigned regno2;
-   poly_int64 offset;
-@@ -8119,13 +8120,13 @@ aarch64_restore_callee_saves (poly_int64 start_o=
ffset, unsigned start,
-       rtx reg, mem;
-=20
-       if (skip_wb
--	  && (regno =3D=3D cfun->machine->frame.wb_candidate1
--	      || regno =3D=3D cfun->machine->frame.wb_candidate2))
-+	  && (regno =3D=3D frame.wb_candidate1
-+	      || regno =3D=3D frame.wb_candidate2))
- 	continue;
-=20
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-       reg =3D gen_rtx_REG (mode, regno);
--      offset =3D start_offset + cfun->machine->frame.reg_offset[regno];
-+      offset =3D start_offset + frame.reg_offset[regno];
-       rtx base_rtx =3D stack_pointer_rtx;
-       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
- 	aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
-@@ -8136,8 +8137,7 @@ aarch64_restore_callee_saves (poly_int64 start_off=
set, unsigned start,
- 	  && (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) <=3D lim=
it
- 	  && !cfun->machine->reg_is_wrapped_separately[regno2]
- 	  && known_eq (GET_MODE_SIZE (mode),
--		       cfun->machine->frame.reg_offset[regno2]
--		       - cfun->machine->frame.reg_offset[regno]))
-+		       frame.reg_offset[regno2] - frame.reg_offset[regno]))
- 	{
- 	  rtx reg2 =3D gen_rtx_REG (mode, regno2);
- 	  rtx mem2;
-@@ -8242,6 +8242,7 @@ offset_12bit_unsigned_scaled_p (machine_mode mode,=
 poly_int64 offset)
- static sbitmap
- aarch64_get_separate_components (void)
- {
-+  aarch64_frame &frame =3D cfun->machine->frame;
-   sbitmap components =3D sbitmap_alloc (LAST_SAVED_REGNUM + 1);
-   bitmap_clear (components);
-=20
-@@ -8258,18 +8259,18 @@ aarch64_get_separate_components (void)
- 	if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
- 	  continue;
-=20
--	poly_int64 offset =3D cfun->machine->frame.reg_offset[regno];
-+	poly_int64 offset =3D frame.reg_offset[regno];
-=20
- 	/* If the register is saved in the first SVE save slot, we use
- 	   it as a stack probe for -fstack-clash-protection.  */
- 	if (flag_stack_clash_protection
--	    && maybe_ne (cfun->machine->frame.below_hard_fp_saved_regs_size, 0=
)
-+	    && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
- 	    && known_eq (offset, 0))
- 	  continue;
-=20
- 	/* Get the offset relative to the register we'll use.  */
- 	if (frame_pointer_needed)
--	  offset -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
-+	  offset -=3D frame.below_hard_fp_saved_regs_size;
- 	else
- 	  offset +=3D crtl->outgoing_args_size;
-=20
-@@ -8288,11 +8289,11 @@ aarch64_get_separate_components (void)
-   /* If the spare predicate register used by big-endian SVE code
-      is call-preserved, it must be saved in the main prologue
-      before any saves that use it.  */
--  if (cfun->machine->frame.spare_pred_reg !=3D INVALID_REGNUM)
--    bitmap_clear_bit (components, cfun->machine->frame.spare_pred_reg);
-+  if (frame.spare_pred_reg !=3D INVALID_REGNUM)
-+    bitmap_clear_bit (components, frame.spare_pred_reg);
-=20
--  unsigned reg1 =3D cfun->machine->frame.wb_candidate1;
--  unsigned reg2 =3D cfun->machine->frame.wb_candidate2;
-+  unsigned reg1 =3D frame.wb_candidate1;
-+  unsigned reg2 =3D frame.wb_candidate2;
-   /* If registers have been chosen to be stored/restored with
-      writeback don't interfere with them to avoid having to output expl=
icit
-      stack adjustment instructions.  */
-@@ -8401,6 +8402,7 @@ aarch64_get_next_set_bit (sbitmap bmp, unsigned in=
t start)
- static void
- aarch64_process_components (sbitmap components, bool prologue_p)
- {
-+  aarch64_frame &frame =3D cfun->machine->frame;
-   rtx ptr_reg =3D gen_rtx_REG (Pmode, frame_pointer_needed
- 			     ? HARD_FRAME_POINTER_REGNUM
- 			     : STACK_POINTER_REGNUM);
-@@ -8415,9 +8417,9 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-      =20
-       rtx reg =3D gen_rtx_REG (mode, regno);
--      poly_int64 offset =3D cfun->machine->frame.reg_offset[regno];
-+      poly_int64 offset =3D frame.reg_offset[regno];
-       if (frame_pointer_needed)
--	offset -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
-+	offset -=3D frame.below_hard_fp_saved_regs_size;
-       else
- 	offset +=3D crtl->outgoing_args_size;
-=20
-@@ -8442,14 +8444,14 @@ aarch64_process_components (sbitmap components, =
bool prologue_p)
- 	  break;
- 	}
-=20
--      poly_int64 offset2 =3D cfun->machine->frame.reg_offset[regno2];
-+      poly_int64 offset2 =3D frame.reg_offset[regno2];
-       /* The next register is not of the same class or its offset is no=
t
- 	 mergeable with the current one into a pair.  */
-       if (aarch64_sve_mode_p (mode)
- 	  || !satisfies_constraint_Ump (mem)
- 	  || GP_REGNUM_P (regno) !=3D GP_REGNUM_P (regno2)
- 	  || (crtl->abi->id () =3D=3D ARM_PCS_SIMD && FP_REGNUM_P (regno))
--	  || maybe_ne ((offset2 - cfun->machine->frame.reg_offset[regno]),
-+	  || maybe_ne ((offset2 - frame.reg_offset[regno]),
- 		       GET_MODE_SIZE (mode)))
- 	{
- 	  insn =3D emit_insn (set);
-@@ -8471,7 +8473,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       /* REGNO2 can be saved/restored in a pair with REGNO.  */
-       rtx reg2 =3D gen_rtx_REG (mode, regno2);
-       if (frame_pointer_needed)
--	offset2 -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
-+	offset2 -=3D frame.below_hard_fp_saved_regs_size;
-       else
- 	offset2 +=3D crtl->outgoing_args_size;
-       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
-@@ -8566,6 +8568,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
- 					bool frame_related_p,
- 					bool final_adjustment_p)
- {
-+  aarch64_frame &frame =3D cfun->machine->frame;
-   HOST_WIDE_INT guard_size
-     =3D 1 << param_stack_clash_protection_guard_size;
-   HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUARD;
-@@ -8586,25 +8589,25 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
-        register as a probe.  We can't assume that LR was saved at posit=
ion 0
-        though, so treat any space below it as unprobed.  */
-   if (final_adjustment_p
--      && known_eq (cfun->machine->frame.below_hard_fp_saved_regs_size, =
0))
-+      && known_eq (frame.below_hard_fp_saved_regs_size, 0))
-     {
--      poly_int64 lr_offset =3D cfun->machine->frame.reg_offset[LR_REGNU=
M];
-+      poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM];
-       if (known_ge (lr_offset, 0))
- 	min_probe_threshold -=3D lr_offset.to_constant ();
-       else
- 	gcc_assert (!flag_stack_clash_protection || known_eq (poly_size, 0));
-     }
-=20
--  poly_int64 frame_size =3D cfun->machine->frame.frame_size;
-+  poly_int64 frame_size =3D frame.frame_size;
-=20
-   /* We should always have a positive probe threshold.  */
-   gcc_assert (min_probe_threshold > 0);
-=20
-   if (flag_stack_clash_protection && !final_adjustment_p)
-     {
--      poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust=
;
--      poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_=
adjust;
--      poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
-+      poly_int64 initial_adjust =3D frame.initial_adjust;
-+      poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
-+      poly_int64 final_adjust =3D frame.final_adjust;
-=20
-       if (known_eq (frame_size, 0))
- 	{
-@@ -8893,17 +8896,18 @@ aarch64_epilogue_uses (int regno)
- void
- aarch64_expand_prologue (void)
- {
--  poly_int64 frame_size =3D cfun->machine->frame.frame_size;
--  poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust;
--  HOST_WIDE_INT callee_adjust =3D cfun->machine->frame.callee_adjust;
--  poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
--  poly_int64 callee_offset =3D cfun->machine->frame.callee_offset;
--  poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_adju=
st;
-+  aarch64_frame &frame =3D cfun->machine->frame;
-+  poly_int64 frame_size =3D frame.frame_size;
-+  poly_int64 initial_adjust =3D frame.initial_adjust;
-+  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
-+  poly_int64 final_adjust =3D frame.final_adjust;
-+  poly_int64 callee_offset =3D frame.callee_offset;
-+  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
-   poly_int64 below_hard_fp_saved_regs_size
--    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
--  unsigned reg1 =3D cfun->machine->frame.wb_candidate1;
--  unsigned reg2 =3D cfun->machine->frame.wb_candidate2;
--  bool emit_frame_chain =3D cfun->machine->frame.emit_frame_chain;
-+    =3D frame.below_hard_fp_saved_regs_size;
-+  unsigned reg1 =3D frame.wb_candidate1;
-+  unsigned reg2 =3D frame.wb_candidate2;
-+  bool emit_frame_chain =3D frame.emit_frame_chain;
-   rtx_insn *insn;
-=20
-   if (flag_stack_clash_protection && known_eq (callee_adjust, 0))
-@@ -8969,7 +8973,7 @@ aarch64_expand_prologue (void)
-=20
-   /* The offset of the frame chain record (if any) from the current SP.=
  */
-   poly_int64 chain_offset =3D (initial_adjust + callee_adjust
--			     - cfun->machine->frame.hard_fp_offset);
-+			     - frame.hard_fp_offset);
-   gcc_assert (known_ge (chain_offset, 0));
-=20
-   /* The offset of the bottom of the save area from the current SP.  */
-@@ -9072,15 +9076,16 @@ aarch64_use_return_insn_p (void)
- void
- aarch64_expand_epilogue (bool for_sibcall)
- {
--  poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust;
--  HOST_WIDE_INT callee_adjust =3D cfun->machine->frame.callee_adjust;
--  poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
--  poly_int64 callee_offset =3D cfun->machine->frame.callee_offset;
--  poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_adju=
st;
-+  aarch64_frame &frame =3D cfun->machine->frame;
-+  poly_int64 initial_adjust =3D frame.initial_adjust;
-+  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
-+  poly_int64 final_adjust =3D frame.final_adjust;
-+  poly_int64 callee_offset =3D frame.callee_offset;
-+  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
-   poly_int64 below_hard_fp_saved_regs_size
--    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
--  unsigned reg1 =3D cfun->machine->frame.wb_candidate1;
--  unsigned reg2 =3D cfun->machine->frame.wb_candidate2;
-+    =3D frame.below_hard_fp_saved_regs_size;
-+  unsigned reg1 =3D frame.wb_candidate1;
-+  unsigned reg2 =3D frame.wb_candidate2;
-   rtx cfi_ops =3D NULL;
-   rtx_insn *insn;
-   /* A stack clash protection prologue may not have left EP0_REGNUM or
-@@ -9113,7 +9118,7 @@ aarch64_expand_epilogue (bool for_sibcall)
-   /* We need to add memory barrier to prevent read from deallocated sta=
ck.  */
-   bool need_barrier_p
-     =3D maybe_ne (get_frame_size ()
--		+ cfun->machine->frame.saved_varargs_size, 0);
-+		+ frame.saved_varargs_size, 0);
-=20
-   /* Emit a barrier to prevent loads from a deallocated stack.  */
-   if (maybe_gt (final_adjust, crtl->outgoing_args_size)
-@@ -11744,24 +11749,24 @@ aarch64_can_eliminate (const int from ATTRIBUT=
E_UNUSED, const int to)
- poly_int64
- aarch64_initial_elimination_offset (unsigned from, unsigned to)
- {
-+  aarch64_frame &frame =3D cfun->machine->frame;
-+
-   if (to =3D=3D HARD_FRAME_POINTER_REGNUM)
-     {
-       if (from =3D=3D ARG_POINTER_REGNUM)
--	return cfun->machine->frame.hard_fp_offset;
-+	return frame.hard_fp_offset;
-=20
-       if (from =3D=3D FRAME_POINTER_REGNUM)
--	return cfun->machine->frame.hard_fp_offset
--	       - cfun->machine->frame.locals_offset;
-+	return frame.hard_fp_offset - frame.locals_offset;
-     }
-=20
-   if (to =3D=3D STACK_POINTER_REGNUM)
-     {
-       if (from =3D=3D FRAME_POINTER_REGNUM)
--	  return cfun->machine->frame.frame_size
--		 - cfun->machine->frame.locals_offset;
-+	return frame.frame_size - frame.locals_offset;
-     }
-=20
--  return cfun->machine->frame.frame_size;
-+  return frame.frame_size;
- }
-=20
-=20
---=20
-2.34.1
-
-
-From a2a57f7ec7912e77eb26919545807d90065584ff Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:44 +0100
-Subject: [PATCH 02/19] aarch64: Avoid a use of callee_offset
-
-When we emit the frame chain, i.e. when we reach Here in this statement
-of aarch64_expand_prologue:
-
-  if (emit_frame_chain)
-    {
-      // Here
-      ...
-    }
-
-the stack is in one of two states:
-
-- We've allocated up to the frame chain, but no more.
-
-- We've allocated the whole frame, and the frame chain is within easy
-  reach of the new SP.
-
-The offset of the frame chain from the current SP is available
-in aarch64_frame as callee_offset.  It is also available as the
-chain_offset local variable, where the latter is calculated from other
-data.  (However, chain_offset is not always equal to callee_offset when
-!emit_frame_chain, so chain_offset isn't redundant.)
-
-In c600df9a4060da3c6121ff4d0b93f179eafd69d1 I switched to using
-chain_offset for the initialisation of the hard frame pointer:
-
-       aarch64_add_offset (Pmode, hard_frame_pointer_rtx,
--                         stack_pointer_rtx, callee_offset,
-+                         stack_pointer_rtx, chain_offset,
-                          tmp1_rtx, tmp0_rtx, frame_pointer_needed);
-
-But the later REG_CFA_ADJUST_CFA handling still used callee_offset.
-
-I think the difference is harmless, but it's more logical for the
-CFA note to be in sync, and it's more convenient for later patches
-if it uses chain_offset.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_expand_prologue): Use
-	chain_offset rather than callee_offset.
----
- gcc/config/aarch64/aarch64.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 77c1d1300a5..6bc026bd08f 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -8901,7 +8901,6 @@ aarch64_expand_prologue (void)
-   poly_int64 initial_adjust =3D frame.initial_adjust;
-   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
-   poly_int64 final_adjust =3D frame.final_adjust;
--  poly_int64 callee_offset =3D frame.callee_offset;
-   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
-   poly_int64 below_hard_fp_saved_regs_size
-     =3D frame.below_hard_fp_saved_regs_size;
-@@ -9010,8 +9009,7 @@ aarch64_expand_prologue (void)
- 	     implicit.  */
- 	  if (!find_reg_note (insn, REG_CFA_ADJUST_CFA, NULL_RTX))
- 	    {
--	      rtx src =3D plus_constant (Pmode, stack_pointer_rtx,
--				       callee_offset);
-+	      rtx src =3D plus_constant (Pmode, stack_pointer_rtx, chain_offse=
t);
- 	      add_reg_note (insn, REG_CFA_ADJUST_CFA,
- 			    gen_rtx_SET (hard_frame_pointer_rtx, src));
- 	    }
---=20
-2.34.1
-
-
-From 5efdcc8ed19d9d9e708a001f5dc695560411496d Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:44 +0100
-Subject: [PATCH 03/19] aarch64: Explicitly handle frames with no saved
- registers
-
-If a frame has no saved registers, it can be allocated in one go.
-There is no need to treat the areas below and above the saved
-registers as separate.
-
-And if we allocate the frame in one go, it should be allocated
-as the initial_adjust rather than the final_adjust.  This allows the
-frame size to grow to guard_size - guard_used_by_caller before a stack
-probe is needed.  (A frame with no register saves is necessarily a
-leaf frame.)
-
-This is a no-op as thing stand, since a leaf function will have
-no outgoing arguments, and so all the frame will be above where
-the saved registers normally go.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Explicitly
-	allocate the frame in one go if there are no saved registers.
----
- gcc/config/aarch64/aarch64.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 6bc026bd08f..05e6ae8c0c9 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7609,9 +7609,11 @@ aarch64_layout_frame (void)
-=20
-   HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_offset;
-   HOST_WIDE_INT const_saved_regs_size;
--  if (frame.frame_size.is_constant (&const_size)
--      && const_size < max_push_offset
--      && known_eq (frame.hard_fp_offset, const_size))
-+  if (known_eq (frame.saved_regs_size, 0))
-+    frame.initial_adjust =3D frame.frame_size;
-+  else if (frame.frame_size.is_constant (&const_size)
-+	   && const_size < max_push_offset
-+	   && known_eq (frame.hard_fp_offset, const_size))
-     {
-       /* Simple, small frame with no outgoing arguments:
-=20
---=20
-2.34.1
-
-
-From a8385d14318634f2e3a08a75bd2d6e2810f8cec9 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:45 +0100
-Subject: [PATCH 04/19] aarch64: Add bytes_below_saved_regs to frame info
-
-The frame layout code currently hard-codes the assumption that
-the number of bytes below the saved registers is equal to the
-size of the outgoing arguments.  This patch abstracts that
-value into a new field of aarch64_frame.
-
-gcc/
-	* config/aarch64/aarch64.h (aarch64_frame::bytes_below_saved_regs): New
-	field.
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Initialize it,
-	and use it instead of crtl->outgoing_args_size.
-	(aarch64_get_separate_components): Use bytes_below_saved_regs instead
-	of outgoing_args_size.
-	(aarch64_process_components): Likewise.
----
- gcc/config/aarch64/aarch64.c | 71 ++++++++++++++++++------------------
- gcc/config/aarch64/aarch64.h |  5 +++
- 2 files changed, 41 insertions(+), 35 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 05e6ae8c0c9..8fa5a0b2545 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7476,6 +7476,8 @@ aarch64_layout_frame (void)
-   gcc_assert (crtl->is_leaf
- 	      || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRED));
-=20
-+  frame.bytes_below_saved_regs =3D crtl->outgoing_args_size;
-+
-   /* Now assign stack slots for the registers.  Start with the predicat=
e
-      registers, since predicate LDR and STR have a relatively small
-      offset range.  These saves happen below the hard frame pointer.  *=
/
-@@ -7580,18 +7582,18 @@ aarch64_layout_frame (void)
-=20
-   poly_int64 varargs_and_saved_regs_size =3D offset + frame.saved_varar=
gs_size;
-=20
--  poly_int64 above_outgoing_args
-+  poly_int64 saved_regs_and_above
-     =3D aligned_upper_bound (varargs_and_saved_regs_size
- 			   + get_frame_size (),
- 			   STACK_BOUNDARY / BITS_PER_UNIT);
-=20
-   frame.hard_fp_offset
--    =3D above_outgoing_args - frame.below_hard_fp_saved_regs_size;
-+    =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
-=20
-   /* Both these values are already aligned.  */
--  gcc_assert (multiple_p (crtl->outgoing_args_size,
-+  gcc_assert (multiple_p (frame.bytes_below_saved_regs,
- 			  STACK_BOUNDARY / BITS_PER_UNIT));
--  frame.frame_size =3D above_outgoing_args + crtl->outgoing_args_size;
-+  frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved_r=
egs;
-=20
-   frame.locals_offset =3D frame.saved_varargs_size;
-=20
-@@ -7607,7 +7609,7 @@ aarch64_layout_frame (void)
-   else if (frame.wb_candidate1 !=3D INVALID_REGNUM)
-     max_push_offset =3D 256;
-=20
--  HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_offset;
-+  HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;
-   HOST_WIDE_INT const_saved_regs_size;
-   if (known_eq (frame.saved_regs_size, 0))
-     frame.initial_adjust =3D frame.frame_size;
-@@ -7615,31 +7617,31 @@ aarch64_layout_frame (void)
- 	   && const_size < max_push_offset
- 	   && known_eq (frame.hard_fp_offset, const_size))
-     {
--      /* Simple, small frame with no outgoing arguments:
-+      /* Simple, small frame with no data below the saved registers.
-=20
- 	 stp reg1, reg2, [sp, -frame_size]!
- 	 stp reg3, reg4, [sp, 16]  */
-       frame.callee_adjust =3D const_size;
-     }
--  else if (crtl->outgoing_args_size.is_constant (&const_outgoing_args_s=
ize)
-+  else if (frame.bytes_below_saved_regs.is_constant (&const_below_saved=
_regs)
- 	   && frame.saved_regs_size.is_constant (&const_saved_regs_size)
--	   && const_outgoing_args_size + const_saved_regs_size < 512
--	   /* We could handle this case even with outgoing args, provided
--	      that the number of args left us with valid offsets for all
--	      predicate and vector save slots.  It's such a rare case that
--	      it hardly seems worth the effort though.  */
--	   && (!saves_below_hard_fp_p || const_outgoing_args_size =3D=3D 0)
-+	   && const_below_saved_regs + const_saved_regs_size < 512
-+	   /* We could handle this case even with data below the saved
-+	      registers, provided that that data left us with valid offsets
-+	      for all predicate and vector save slots.  It's such a rare
-+	      case that it hardly seems worth the effort though.  */
-+	   && (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D 0)
- 	   && !(cfun->calls_alloca
- 		&& frame.hard_fp_offset.is_constant (&const_fp_offset)
- 		&& const_fp_offset < max_push_offset))
-     {
--      /* Frame with small outgoing arguments:
-+      /* Frame with small area below the saved registers:
-=20
- 	 sub sp, sp, frame_size
--	 stp reg1, reg2, [sp, outgoing_args_size]
--	 stp reg3, reg4, [sp, outgoing_args_size + 16]  */
-+	 stp reg1, reg2, [sp, bytes_below_saved_regs]
-+	 stp reg3, reg4, [sp, bytes_below_saved_regs + 16]  */
-       frame.initial_adjust =3D frame.frame_size;
--      frame.callee_offset =3D const_outgoing_args_size;
-+      frame.callee_offset =3D const_below_saved_regs;
-     }
-   else if (saves_below_hard_fp_p
- 	   && known_eq (frame.saved_regs_size,
-@@ -7649,30 +7651,29 @@ aarch64_layout_frame (void)
-=20
- 	 sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
- 	 save SVE registers relative to SP
--	 sub sp, sp, outgoing_args_size  */
-+	 sub sp, sp, bytes_below_saved_regs  */
-       frame.initial_adjust =3D (frame.hard_fp_offset
- 			      + frame.below_hard_fp_saved_regs_size);
--      frame.final_adjust =3D crtl->outgoing_args_size;
-+      frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-   else if (frame.hard_fp_offset.is_constant (&const_fp_offset)
- 	   && const_fp_offset < max_push_offset)
-     {
--      /* Frame with large outgoing arguments or SVE saves, but with
--	 a small local area:
-+      /* Frame with large area below the saved registers, or with SVE s=
aves,
-+	 but with a small area above:
-=20
- 	 stp reg1, reg2, [sp, -hard_fp_offset]!
- 	 stp reg3, reg4, [sp, 16]
- 	 [sub sp, sp, below_hard_fp_saved_regs_size]
- 	 [save SVE registers relative to SP]
--	 sub sp, sp, outgoing_args_size  */
-+	 sub sp, sp, bytes_below_saved_regs  */
-       frame.callee_adjust =3D const_fp_offset;
-       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
--      frame.final_adjust =3D crtl->outgoing_args_size;
-+      frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-   else
-     {
--      /* Frame with large local area and outgoing arguments or SVE save=
s,
--	 using frame pointer:
-+      /* General case:
-=20
- 	 sub sp, sp, hard_fp_offset
- 	 stp x29, x30, [sp, 0]
-@@ -7680,10 +7681,10 @@ aarch64_layout_frame (void)
- 	 stp reg3, reg4, [sp, 16]
- 	 [sub sp, sp, below_hard_fp_saved_regs_size]
- 	 [save SVE registers relative to SP]
--	 sub sp, sp, outgoing_args_size  */
-+	 sub sp, sp, bytes_below_saved_regs  */
-       frame.initial_adjust =3D frame.hard_fp_offset;
-       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
--      frame.final_adjust =3D crtl->outgoing_args_size;
-+      frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-=20
-   /* Make sure the individual adjustments add up to the full frame size=
.  */
-@@ -8274,7 +8275,7 @@ aarch64_get_separate_components (void)
- 	if (frame_pointer_needed)
- 	  offset -=3D frame.below_hard_fp_saved_regs_size;
- 	else
--	  offset +=3D crtl->outgoing_args_size;
-+	  offset +=3D frame.bytes_below_saved_regs;
-=20
- 	/* Check that we can access the stack slot of the register with one
- 	   direct load with no adjustments needed.  */
-@@ -8423,7 +8424,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       if (frame_pointer_needed)
- 	offset -=3D frame.below_hard_fp_saved_regs_size;
-       else
--	offset +=3D crtl->outgoing_args_size;
-+	offset +=3D frame.bytes_below_saved_regs;
-=20
-       rtx addr =3D plus_constant (Pmode, ptr_reg, offset);
-       rtx mem =3D gen_frame_mem (mode, addr);
-@@ -8477,7 +8478,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       if (frame_pointer_needed)
- 	offset2 -=3D frame.below_hard_fp_saved_regs_size;
-       else
--	offset2 +=3D crtl->outgoing_args_size;
-+	offset2 +=3D frame.bytes_below_saved_regs;
-       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
-       rtx mem2 =3D gen_frame_mem (mode, addr2);
-       rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, reg2)
-@@ -8551,10 +8552,10 @@ aarch64_stack_clash_protection_alloca_probe_rang=
e (void)
-    registers.  If POLY_SIZE is not large enough to require a probe this=
 function
-    will only adjust the stack.  When allocating the stack space
-    FRAME_RELATED_P is then used to indicate if the allocation is frame =
related.
--   FINAL_ADJUSTMENT_P indicates whether we are allocating the outgoing
--   arguments.  If we are then we ensure that any allocation larger than=
 the ABI
--   defined buffer needs a probe so that the invariant of having a 1KB b=
uffer is
--   maintained.
-+   FINAL_ADJUSTMENT_P indicates whether we are allocating the area belo=
w
-+   the saved registers.  If we are then we ensure that any allocation
-+   larger than the ABI defined buffer needs a probe so that the
-+   invariant of having a 1KB buffer is maintained.
-=20
-    We emit barriers after each stack adjustment to prevent optimization=
s from
-    breaking the invariant that we never drop the stack more than a page=
.  This
-@@ -8763,7 +8764,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
-   /* Handle any residuals.  Residuals of at least MIN_PROBE_THRESHOLD h=
ave to
-      be probed.  This maintains the requirement that each page is probe=
d at
-      least once.  For initial probing we probe only if the allocation i=
s
--     more than GUARD_SIZE - buffer, and for the outgoing arguments we p=
robe
-+     more than GUARD_SIZE - buffer, and below the saved registers we pr=
obe
-      if the amount is larger than buffer.  GUARD_SIZE - buffer + buffer=
 =3D=3D
-      GUARD_SIZE.  This works that for any allocation that is large enou=
gh to
-      trigger a probe here, we'll have at least one, and if they're not =
large
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index bb383acfae8..6f0b8c7107e 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -837,6 +837,11 @@ struct GTY (()) aarch64_frame
-   /* The size of the callee-save registers with a slot in REG_OFFSET.  =
*/
-   poly_int64 saved_regs_size;
-=20
-+  /* The number of bytes between the bottom of the static frame (the bo=
ttom
-+     of the outgoing arguments) and the bottom of the register save are=
a.
-+     This value is always a multiple of STACK_BOUNDARY.  */
-+  poly_int64 bytes_below_saved_regs;
-+
-   /* The size of the callee-save registers with a slot in REG_OFFSET th=
at
-      are saved below the hard frame pointer.  */
-   poly_int64 below_hard_fp_saved_regs_size;
---=20
-2.34.1
-
-
-From d3f6ceecc8a7f128a9e6cb7d8aecf0de81ed9705 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:45 +0100
-Subject: [PATCH 05/19] aarch64: Add bytes_below_hard_fp to frame info
-
-Following on from the previous bytes_below_saved_regs patch, this one
-records the number of bytes that are below the hard frame pointer.
-This eventually replaces below_hard_fp_saved_regs_size.
-
-If a frame pointer is not needed, the epilogue adds final_adjust
-to the stack pointer before restoring registers:
-
-     aarch64_add_sp (tmp1_rtx, tmp0_rtx, final_adjust, true);
-
-Therefore, if the epilogue needs to restore the stack pointer from
-the hard frame pointer, the directly corresponding offset is:
-
-     -bytes_below_hard_fp + final_adjust
-
-i.e. go from the hard frame pointer to the bottom of the frame,
-then add the same amount as if we were using the stack pointer
-from the outset.
-
-gcc/
-	* config/aarch64/aarch64.h (aarch64_frame::bytes_below_hard_fp): New
-	field.
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Initialize it.
-	(aarch64_expand_epilogue): Use it instead of
-	below_hard_fp_saved_regs_size.
----
- gcc/config/aarch64/aarch64.c | 6 +++---
- gcc/config/aarch64/aarch64.h | 5 +++++
- 2 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 8fa5a0b2545..e03adf57226 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7528,6 +7528,7 @@ aarch64_layout_frame (void)
-      of the callee save area.  */
-   bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);
-   frame.below_hard_fp_saved_regs_size =3D offset;
-+  frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_regs;
-   if (frame.emit_frame_chain)
-     {
-       /* FP and LR are placed in the linkage record.  */
-@@ -9083,8 +9084,7 @@ aarch64_expand_epilogue (bool for_sibcall)
-   poly_int64 final_adjust =3D frame.final_adjust;
-   poly_int64 callee_offset =3D frame.callee_offset;
-   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
--  poly_int64 below_hard_fp_saved_regs_size
--    =3D frame.below_hard_fp_saved_regs_size;
-+  poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;
-   unsigned reg1 =3D frame.wb_candidate1;
-   unsigned reg2 =3D frame.wb_candidate2;
-   rtx cfi_ops =3D NULL;
-@@ -9140,7 +9140,7 @@ aarch64_expand_epilogue (bool for_sibcall)
-        is restored on the instruction doing the writeback.  */
-     aarch64_add_offset (Pmode, stack_pointer_rtx,
- 			hard_frame_pointer_rtx,
--			-callee_offset - below_hard_fp_saved_regs_size,
-+			-bytes_below_hard_fp + final_adjust,
- 			tmp1_rtx, tmp0_rtx, callee_adjust =3D=3D 0);
-   else
-      /* The case where we need to re-use the register here is very rare=
, so
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 6f0b8c7107e..21ac920a3fe 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -846,6 +846,11 @@ struct GTY (()) aarch64_frame
-      are saved below the hard frame pointer.  */
-   poly_int64 below_hard_fp_saved_regs_size;
-=20
-+  /* The number of bytes between the bottom of the static frame (the bo=
ttom
-+     of the outgoing arguments) and the hard frame pointer.  This value=
 is
-+     always a multiple of STACK_BOUNDARY.  */
-+  poly_int64 bytes_below_hard_fp;
-+
-   /* Offset from the base of the frame (incomming SP) to the
-      top of the locals area.  This value is always a multiple of
-      STACK_BOUNDARY.  */
---=20
-2.34.1
-
-
-From e8a7ec87fcdbaa5f7c7bd499aebe5cefacbf8687 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:46 +0100
-Subject: [PATCH 06/19] aarch64: Tweak aarch64_save/restore_callee_saves
-
-aarch64_save_callee_saves and aarch64_restore_callee_saves took
-a parameter called start_offset that gives the offset of the
-bottom of the saved register area from the current stack pointer.
-However, it's more convenient for later patches if we use the
-bottom of the entire frame as the reference point, rather than
-the bottom of the saved registers.
-
-Doing that removes the need for the callee_offset field.
-Other than that, this is not a win on its own.  It only really
-makes sense in combination with the follow-on patches.
-
-gcc/
-	* config/aarch64/aarch64.h (aarch64_frame::callee_offset): Delete.
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Remove
-	callee_offset handling.
-	(aarch64_save_callee_saves): Replace the start_offset parameter
-	with a bytes_below_sp parameter.
-	(aarch64_restore_callee_saves): Likewise.
-	(aarch64_expand_prologue): Update accordingly.
-	(aarch64_expand_epilogue): Likewise.
----
- gcc/config/aarch64/aarch64.c | 56 ++++++++++++++++++------------------
- gcc/config/aarch64/aarch64.h |  4 ---
- 2 files changed, 28 insertions(+), 32 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index e03adf57226..96e99f6c17a 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7602,7 +7602,6 @@ aarch64_layout_frame (void)
-   frame.final_adjust =3D 0;
-   frame.callee_adjust =3D 0;
-   frame.sve_callee_adjust =3D 0;
--  frame.callee_offset =3D 0;
-=20
-   HOST_WIDE_INT max_push_offset =3D 0;
-   if (frame.wb_candidate2 !=3D INVALID_REGNUM)
-@@ -7642,7 +7641,6 @@ aarch64_layout_frame (void)
- 	 stp reg1, reg2, [sp, bytes_below_saved_regs]
- 	 stp reg3, reg4, [sp, bytes_below_saved_regs + 16]  */
-       frame.initial_adjust =3D frame.frame_size;
--      frame.callee_offset =3D const_below_saved_regs;
-     }
-   else if (saves_below_hard_fp_p
- 	   && known_eq (frame.saved_regs_size,
-@@ -7989,12 +7987,13 @@ aarch64_add_cfa_expression (rtx_insn *insn, rtx =
reg,
- }
-=20
- /* Emit code to save the callee-saved registers from register number ST=
ART
--   to LIMIT to the stack at the location starting at offset START_OFFSE=
T,
--   skipping any write-back candidates if SKIP_WB is true.  HARD_FP_VALI=
D_P
--   is true if the hard frame pointer has been set up.  */
-+   to LIMIT to the stack.  The stack pointer is currently BYTES_BELOW_S=
P
-+   bytes above the bottom of the static frame.  Skip any write-back
-+   candidates if SKIP_WB is true.  HARD_FP_VALID_P is true if the hard
-+   frame pointer has been set up.  */
-=20
- static void
--aarch64_save_callee_saves (poly_int64 start_offset,
-+aarch64_save_callee_saves (poly_int64 bytes_below_sp,
- 			   unsigned start, unsigned limit, bool skip_wb,
- 			   bool hard_fp_valid_p)
- {
-@@ -8022,7 +8021,9 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
-=20
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-       reg =3D gen_rtx_REG (mode, regno);
--      offset =3D start_offset + frame.reg_offset[regno];
-+      offset =3D (frame.reg_offset[regno]
-+		+ frame.bytes_below_saved_regs
-+		- bytes_below_sp);
-       rtx base_rtx =3D stack_pointer_rtx;
-       poly_int64 sp_offset =3D offset;
-=20
-@@ -8033,9 +8034,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
-       else if (GP_REGNUM_P (regno)
- 	       && (!offset.is_constant (&const_offset) || const_offset >=3D 51=
2))
- 	{
--	  gcc_assert (known_eq (start_offset, 0));
--	  poly_int64 fp_offset
--	    =3D frame.below_hard_fp_saved_regs_size;
-+	  poly_int64 fp_offset =3D frame.bytes_below_hard_fp - bytes_below_sp;
- 	  if (hard_fp_valid_p)
- 	    base_rtx =3D hard_frame_pointer_rtx;
- 	  else
-@@ -8099,12 +8098,13 @@ aarch64_save_callee_saves (poly_int64 start_offs=
et,
- }
-=20
- /* Emit code to restore the callee registers from register number START
--   up to and including LIMIT.  Restore from the stack offset START_OFFS=
ET,
--   skipping any write-back candidates if SKIP_WB is true.  Write the
--   appropriate REG_CFA_RESTORE notes into CFI_OPS.  */
-+   up to and including LIMIT.  The stack pointer is currently BYTES_BEL=
OW_SP
-+   bytes above the bottom of the static frame.  Skip any write-back
-+   candidates if SKIP_WB is true.  Write the appropriate REG_CFA_RESTOR=
E
-+   notes into CFI_OPS.  */
-=20
- static void
--aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start,
-+aarch64_restore_callee_saves (poly_int64 bytes_below_sp, unsigned start=
,
- 			      unsigned limit, bool skip_wb, rtx *cfi_ops)
- {
-   aarch64_frame &frame =3D cfun->machine->frame;
-@@ -8130,7 +8130,9 @@ aarch64_restore_callee_saves (poly_int64 start_off=
set, unsigned start,
-=20
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-       reg =3D gen_rtx_REG (mode, regno);
--      offset =3D start_offset + frame.reg_offset[regno];
-+      offset =3D (frame.reg_offset[regno]
-+		+ frame.bytes_below_saved_regs
-+		- bytes_below_sp);
-       rtx base_rtx =3D stack_pointer_rtx;
-       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
- 	aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
-@@ -8906,8 +8908,6 @@ aarch64_expand_prologue (void)
-   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
-   poly_int64 final_adjust =3D frame.final_adjust;
-   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
--  poly_int64 below_hard_fp_saved_regs_size
--    =3D frame.below_hard_fp_saved_regs_size;
-   unsigned reg1 =3D frame.wb_candidate1;
-   unsigned reg2 =3D frame.wb_candidate2;
-   bool emit_frame_chain =3D frame.emit_frame_chain;
-@@ -8979,8 +8979,8 @@ aarch64_expand_prologue (void)
- 			     - frame.hard_fp_offset);
-   gcc_assert (known_ge (chain_offset, 0));
-=20
--  /* The offset of the bottom of the save area from the current SP.  */
--  poly_int64 saved_regs_offset =3D chain_offset - below_hard_fp_saved_r=
egs_size;
-+  /* The offset of the current SP from the bottom of the static frame. =
 */
-+  poly_int64 bytes_below_sp =3D frame_size - initial_adjust - callee_ad=
just;
-=20
-   if (emit_frame_chain)
-     {
-@@ -8988,7 +8988,7 @@ aarch64_expand_prologue (void)
- 	{
- 	  reg1 =3D R29_REGNUM;
- 	  reg2 =3D R30_REGNUM;
--	  aarch64_save_callee_saves (saved_regs_offset, reg1, reg2,
-+	  aarch64_save_callee_saves (bytes_below_sp, reg1, reg2,
- 				     false, false);
- 	}
-       else
-@@ -9028,7 +9028,7 @@ aarch64_expand_prologue (void)
-       emit_insn (gen_stack_tie (stack_pointer_rtx, hard_frame_pointer_r=
tx));
-     }
-=20
--  aarch64_save_callee_saves (saved_regs_offset, R0_REGNUM, R30_REGNUM,
-+  aarch64_save_callee_saves (bytes_below_sp, R0_REGNUM, R30_REGNUM,
- 			     callee_adjust !=3D 0 || emit_frame_chain,
- 			     emit_frame_chain);
-   if (maybe_ne (sve_callee_adjust, 0))
-@@ -9038,16 +9038,17 @@ aarch64_expand_prologue (void)
-       aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx,
- 					      sve_callee_adjust,
- 					      !frame_pointer_needed, false);
--      saved_regs_offset +=3D sve_callee_adjust;
-+      bytes_below_sp -=3D sve_callee_adjust;
-     }
--  aarch64_save_callee_saves (saved_regs_offset, P0_REGNUM, P15_REGNUM,
-+  aarch64_save_callee_saves (bytes_below_sp, P0_REGNUM, P15_REGNUM,
- 			     false, emit_frame_chain);
--  aarch64_save_callee_saves (saved_regs_offset, V0_REGNUM, V31_REGNUM,
-+  aarch64_save_callee_saves (bytes_below_sp, V0_REGNUM, V31_REGNUM,
- 			     callee_adjust !=3D 0 || emit_frame_chain,
- 			     emit_frame_chain);
-=20
-   /* We may need to probe the final adjustment if it is larger than the=
 guard
-      that is assumed by the called.  */
-+  gcc_assert (known_eq (bytes_below_sp, final_adjust));
-   aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx, final_adj=
ust,
- 					  !frame_pointer_needed, true);
- }
-@@ -9082,7 +9083,6 @@ aarch64_expand_epilogue (bool for_sibcall)
-   poly_int64 initial_adjust =3D frame.initial_adjust;
-   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
-   poly_int64 final_adjust =3D frame.final_adjust;
--  poly_int64 callee_offset =3D frame.callee_offset;
-   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
-   poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;
-   unsigned reg1 =3D frame.wb_candidate1;
-@@ -9150,13 +9150,13 @@ aarch64_expand_epilogue (bool for_sibcall)
-=20
-   /* Restore the vector registers before the predicate registers,
-      so that we can use P4 as a temporary for big-endian SVE frames.  *=
/
--  aarch64_restore_callee_saves (callee_offset, V0_REGNUM, V31_REGNUM,
-+  aarch64_restore_callee_saves (final_adjust, V0_REGNUM, V31_REGNUM,
- 				callee_adjust !=3D 0, &cfi_ops);
--  aarch64_restore_callee_saves (callee_offset, P0_REGNUM, P15_REGNUM,
-+  aarch64_restore_callee_saves (final_adjust, P0_REGNUM, P15_REGNUM,
- 				false, &cfi_ops);
-   if (maybe_ne (sve_callee_adjust, 0))
-     aarch64_add_sp (NULL_RTX, NULL_RTX, sve_callee_adjust, true);
--  aarch64_restore_callee_saves (callee_offset - sve_callee_adjust,
-+  aarch64_restore_callee_saves (final_adjust + sve_callee_adjust,
- 				R0_REGNUM, R30_REGNUM,
- 				callee_adjust !=3D 0, &cfi_ops);
-=20
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 21ac920a3fe..57e67217745 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -873,10 +873,6 @@ struct GTY (()) aarch64_frame
-      It is zero when no push is used.  */
-   HOST_WIDE_INT callee_adjust;
-=20
--  /* The offset from SP to the callee-save registers after initial_adju=
st.
--     It may be non-zero if no push is used (ie. callee_adjust =3D=3D 0)=
.  */
--  poly_int64 callee_offset;
--
-   /* The size of the stack adjustment before saving or after restoring
-      SVE registers.  */
-   poly_int64 sve_callee_adjust;
---=20
-2.34.1
-
-
-From 7356df0319aefe4c68ef57ec4c6bd18c72188a34 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:46 +0100
-Subject: [PATCH 07/19] aarch64: Only calculate chain_offset if there is =
a
- chain
-
-After previous patches, it is no longer necessary to calculate
-a chain_offset in cases where there is no chain record.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_expand_prologue): Move the
-	calculation of chain_offset into the emit_frame_chain block.
----
- gcc/config/aarch64/aarch64.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 96e99f6c17a..cf5244b7ec0 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -8974,16 +8974,16 @@ aarch64_expand_prologue (void)
-   if (callee_adjust !=3D 0)
-     aarch64_push_regs (reg1, reg2, callee_adjust);
-=20
--  /* The offset of the frame chain record (if any) from the current SP.=
  */
--  poly_int64 chain_offset =3D (initial_adjust + callee_adjust
--			     - frame.hard_fp_offset);
--  gcc_assert (known_ge (chain_offset, 0));
--
-   /* The offset of the current SP from the bottom of the static frame. =
 */
-   poly_int64 bytes_below_sp =3D frame_size - initial_adjust - callee_ad=
just;
-=20
-   if (emit_frame_chain)
-     {
-+      /* The offset of the frame chain record (if any) from the current=
 SP.  */
-+      poly_int64 chain_offset =3D (initial_adjust + callee_adjust
-+				 - frame.hard_fp_offset);
-+      gcc_assert (known_ge (chain_offset, 0));
-+
-       if (callee_adjust =3D=3D 0)
- 	{
- 	  reg1 =3D R29_REGNUM;
---=20
-2.34.1
-
-
-From 82fb69e75c21010f7afc72bb842751164fe8fc72 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:46 +0100
-Subject: [PATCH 08/19] aarch64: Rename locals_offset to bytes_above_loca=
ls
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-locals_offset was described as:
-
-  /* Offset from the base of the frame (incomming SP) to the
-     top of the locals area.  This value is always a multiple of
-     STACK_BOUNDARY.  */
-
-This is implicitly an =E2=80=9Cupside down=E2=80=9D view of the frame: t=
he incoming
-SP is at offset 0, and anything N bytes below the incoming SP is at
-offset N (rather than -N).
-
-However, reg_offset instead uses a =E2=80=9Cright way up=E2=80=9D view; =
that is,
-it views offsets in address terms.  Something above X is at a
-positive offset from X and something below X is at a negative
-offset from X.
-
-Also, even on FRAME_GROWS_DOWNWARD targets like AArch64,
-target-independent code views offsets in address terms too:
-locals are allocated at negative offsets to virtual_stack_vars.
-
-It seems confusing to have *_offset fields of the same structure
-using different polarities like this.  This patch tries to avoid
-that by renaming locals_offset to bytes_above_locals.
-
-gcc/
-	* config/aarch64/aarch64.h (aarch64_frame::locals_offset): Rename to...
-	(aarch64_frame::bytes_above_locals): ...this.
-	* config/aarch64/aarch64.c (aarch64_layout_frame)
-	(aarch64_initial_elimination_offset): Update accordingly.
----
- gcc/config/aarch64/aarch64.c | 6 +++---
- gcc/config/aarch64/aarch64.h | 6 +++---
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index cf5244b7ec0..d54f7a89306 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7596,7 +7596,7 @@ aarch64_layout_frame (void)
- 			  STACK_BOUNDARY / BITS_PER_UNIT));
-   frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved_r=
egs;
-=20
--  frame.locals_offset =3D frame.saved_varargs_size;
-+  frame.bytes_above_locals =3D frame.saved_varargs_size;
-=20
-   frame.initial_adjust =3D 0;
-   frame.final_adjust =3D 0;
-@@ -11758,13 +11758,13 @@ aarch64_initial_elimination_offset (unsigned f=
rom, unsigned to)
- 	return frame.hard_fp_offset;
-=20
-       if (from =3D=3D FRAME_POINTER_REGNUM)
--	return frame.hard_fp_offset - frame.locals_offset;
-+	return frame.hard_fp_offset - frame.bytes_above_locals;
-     }
-=20
-   if (to =3D=3D STACK_POINTER_REGNUM)
-     {
-       if (from =3D=3D FRAME_POINTER_REGNUM)
--	return frame.frame_size - frame.locals_offset;
-+	return frame.frame_size - frame.bytes_above_locals;
-     }
-=20
-   return frame.frame_size;
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 57e67217745..3c5e3dd429d 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -851,10 +851,10 @@ struct GTY (()) aarch64_frame
-      always a multiple of STACK_BOUNDARY.  */
-   poly_int64 bytes_below_hard_fp;
-=20
--  /* Offset from the base of the frame (incomming SP) to the
--     top of the locals area.  This value is always a multiple of
-+  /* The number of bytes between the top of the locals area and the top
-+     of the frame (the incomming SP).  This value is always a multiple =
of
-      STACK_BOUNDARY.  */
--  poly_int64 locals_offset;
-+  poly_int64 bytes_above_locals;
-=20
-   /* Offset from the base of the frame (incomming SP) to the
-      hard_frame_pointer.  This value is always a multiple of
---=20
-2.34.1
-
-
-From fa6600b55b49ee14d8288f13719ceea2a75eea60 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:47 +0100
-Subject: [PATCH 09/19] aarch64: Rename hard_fp_offset to bytes_above_har=
d_fp
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Similarly to the previous locals_offset patch, hard_fp_offset
-was described as:
-
-  /* Offset from the base of the frame (incomming SP) to the
-     hard_frame_pointer.  This value is always a multiple of
-     STACK_BOUNDARY.  */
-  poly_int64 hard_fp_offset;
-
-which again took an =E2=80=9Cupside-down=E2=80=9D view: higher offsets m=
eant lower
-addresses.  This patch renames the field to bytes_above_hard_fp instead.
-
-gcc/
-	* config/aarch64/aarch64.h (aarch64_frame::hard_fp_offset): Rename
-	to...
-	(aarch64_frame::bytes_above_hard_fp): ...this.
-	* config/aarch64/aarch64.c (aarch64_layout_frame)
-	(aarch64_expand_prologue): Update accordingly.
-	(aarch64_initial_elimination_offset): Likewise.
----
- gcc/config/aarch64/aarch64.c | 26 +++++++++++++-------------
- gcc/config/aarch64/aarch64.h |  6 +++---
- 2 files changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index d54f7a89306..23cb084e5a7 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7588,7 +7588,7 @@ aarch64_layout_frame (void)
- 			   + get_frame_size (),
- 			   STACK_BOUNDARY / BITS_PER_UNIT);
-=20
--  frame.hard_fp_offset
-+  frame.bytes_above_hard_fp
-     =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
-=20
-   /* Both these values are already aligned.  */
-@@ -7609,13 +7609,13 @@ aarch64_layout_frame (void)
-   else if (frame.wb_candidate1 !=3D INVALID_REGNUM)
-     max_push_offset =3D 256;
-=20
--  HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;
-+  HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
-   HOST_WIDE_INT const_saved_regs_size;
-   if (known_eq (frame.saved_regs_size, 0))
-     frame.initial_adjust =3D frame.frame_size;
-   else if (frame.frame_size.is_constant (&const_size)
- 	   && const_size < max_push_offset
--	   && known_eq (frame.hard_fp_offset, const_size))
-+	   && known_eq (frame.bytes_above_hard_fp, const_size))
-     {
-       /* Simple, small frame with no data below the saved registers.
-=20
-@@ -7632,8 +7632,8 @@ aarch64_layout_frame (void)
- 	      case that it hardly seems worth the effort though.  */
- 	   && (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D 0)
- 	   && !(cfun->calls_alloca
--		&& frame.hard_fp_offset.is_constant (&const_fp_offset)
--		&& const_fp_offset < max_push_offset))
-+		&& frame.bytes_above_hard_fp.is_constant (&const_above_fp)
-+		&& const_above_fp < max_push_offset))
-     {
-       /* Frame with small area below the saved registers:
-=20
-@@ -7651,12 +7651,12 @@ aarch64_layout_frame (void)
- 	 sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
- 	 save SVE registers relative to SP
- 	 sub sp, sp, bytes_below_saved_regs  */
--      frame.initial_adjust =3D (frame.hard_fp_offset
-+      frame.initial_adjust =3D (frame.bytes_above_hard_fp
- 			      + frame.below_hard_fp_saved_regs_size);
-       frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
--  else if (frame.hard_fp_offset.is_constant (&const_fp_offset)
--	   && const_fp_offset < max_push_offset)
-+  else if (frame.bytes_above_hard_fp.is_constant (&const_above_fp)
-+	   && const_above_fp < max_push_offset)
-     {
-       /* Frame with large area below the saved registers, or with SVE s=
aves,
- 	 but with a small area above:
-@@ -7666,7 +7666,7 @@ aarch64_layout_frame (void)
- 	 [sub sp, sp, below_hard_fp_saved_regs_size]
- 	 [save SVE registers relative to SP]
- 	 sub sp, sp, bytes_below_saved_regs  */
--      frame.callee_adjust =3D const_fp_offset;
-+      frame.callee_adjust =3D const_above_fp;
-       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
-       frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-@@ -7681,7 +7681,7 @@ aarch64_layout_frame (void)
- 	 [sub sp, sp, below_hard_fp_saved_regs_size]
- 	 [save SVE registers relative to SP]
- 	 sub sp, sp, bytes_below_saved_regs  */
--      frame.initial_adjust =3D frame.hard_fp_offset;
-+      frame.initial_adjust =3D frame.bytes_above_hard_fp;
-       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
-       frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-@@ -8981,7 +8981,7 @@ aarch64_expand_prologue (void)
-     {
-       /* The offset of the frame chain record (if any) from the current=
 SP.  */
-       poly_int64 chain_offset =3D (initial_adjust + callee_adjust
--				 - frame.hard_fp_offset);
-+				 - frame.bytes_above_hard_fp);
-       gcc_assert (known_ge (chain_offset, 0));
-=20
-       if (callee_adjust =3D=3D 0)
-@@ -11755,10 +11755,10 @@ aarch64_initial_elimination_offset (unsigned f=
rom, unsigned to)
-   if (to =3D=3D HARD_FRAME_POINTER_REGNUM)
-     {
-       if (from =3D=3D ARG_POINTER_REGNUM)
--	return frame.hard_fp_offset;
-+	return frame.bytes_above_hard_fp;
-=20
-       if (from =3D=3D FRAME_POINTER_REGNUM)
--	return frame.hard_fp_offset - frame.bytes_above_locals;
-+	return frame.bytes_above_hard_fp - frame.bytes_above_locals;
-     }
-=20
-   if (to =3D=3D STACK_POINTER_REGNUM)
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 3c5e3dd429d..9291cfd3ec8 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -856,10 +856,10 @@ struct GTY (()) aarch64_frame
-      STACK_BOUNDARY.  */
-   poly_int64 bytes_above_locals;
-=20
--  /* Offset from the base of the frame (incomming SP) to the
--     hard_frame_pointer.  This value is always a multiple of
-+  /* The number of bytes between the hard_frame_pointer and the top of
-+     the frame (the incomming SP).  This value is always a multiple of
-      STACK_BOUNDARY.  */
--  poly_int64 hard_fp_offset;
-+  poly_int64 bytes_above_hard_fp;
-=20
-   /* The size of the frame.  This value is the offset from base of the
-      frame (incomming SP) to the stack_pointer.  This value is always
---=20
-2.34.1
-
-
-From b8cd5a0229da78c2d1289d54731fbef0126617d5 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:47 +0100
-Subject: [PATCH 10/19] aarch64: Tweak frame_size comment
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch fixes another case in which a value was described with
-an =E2=80=9Cupside-down=E2=80=9D view.
-
-gcc/
-	* config/aarch64/aarch64.h (aarch64_frame::frame_size): Tweak comment.
----
- gcc/config/aarch64/aarch64.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 9291cfd3ec8..82883ad5a0d 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -861,8 +861,8 @@ struct GTY (()) aarch64_frame
-      STACK_BOUNDARY.  */
-   poly_int64 bytes_above_hard_fp;
-=20
--  /* The size of the frame.  This value is the offset from base of the
--     frame (incomming SP) to the stack_pointer.  This value is always
-+  /* The size of the frame, i.e. the number of bytes between the bottom
-+     of the outgoing arguments and the incoming SP.  This value is alwa=
ys
-      a multiple of STACK_BOUNDARY.  */
-   poly_int64 frame_size;
-=20
---=20
-2.34.1
-
-
-From 999c4a81cffddb850d6ab0f6d3a8de3e704d2f7a Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:48 +0100
-Subject: [PATCH 11/19] aarch64: Measure reg_offset from the bottom of th=
e
- frame
-
-reg_offset was measured from the bottom of the saved register area.
-This made perfect sense with the original layout, since the bottom
-of the saved register area was also the hard frame pointer address.
-It became slightly less obvious with SVE, since we save SVE
-registers below the hard frame pointer, but it still made sense.
-
-However, if we want to allow different frame layouts, it's more
-convenient and obvious to measure reg_offset from the bottom of
-the frame.  After previous patches, it's also a slight simplification
-in its own right.
-
-gcc/
-	* config/aarch64/aarch64.h (aarch64_frame): Add comment above
-	reg_offset.
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Walk offsets
-	from the bottom of the frame, rather than the bottom of the saved
-	register area.  Measure reg_offset from the bottom of the frame
-	rather than the bottom of the saved register area.
-	(aarch64_save_callee_saves): Update accordingly.
-	(aarch64_restore_callee_saves): Likewise.
-	(aarch64_get_separate_components): Likewise.
-	(aarch64_process_components): Likewise.
----
- gcc/config/aarch64/aarch64.c | 53 ++++++++++++++++--------------------
- gcc/config/aarch64/aarch64.h |  3 ++
- 2 files changed, 27 insertions(+), 29 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 23cb084e5a7..45ff664cba6 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7398,7 +7398,6 @@ aarch64_needs_frame_chain (void)
- static void
- aarch64_layout_frame (void)
- {
--  poly_int64 offset =3D 0;
-   int regno, last_fp_reg =3D INVALID_REGNUM;
-   machine_mode vector_save_mode =3D aarch64_reg_save_mode (V8_REGNUM);
-   poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mode);
-@@ -7476,7 +7475,9 @@ aarch64_layout_frame (void)
-   gcc_assert (crtl->is_leaf
- 	      || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRED));
-=20
--  frame.bytes_below_saved_regs =3D crtl->outgoing_args_size;
-+  poly_int64 offset =3D crtl->outgoing_args_size;
-+  gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
-+  frame.bytes_below_saved_regs =3D offset;
-=20
-   /* Now assign stack slots for the registers.  Start with the predicat=
e
-      registers, since predicate LDR and STR have a relatively small
-@@ -7488,7 +7489,8 @@ aarch64_layout_frame (void)
- 	offset +=3D BYTES_PER_SVE_PRED;
-       }
-=20
--  if (maybe_ne (offset, 0))
-+  poly_int64 saved_prs_size =3D offset - frame.bytes_below_saved_regs;
-+  if (maybe_ne (saved_prs_size, 0))
-     {
-       /* If we have any vector registers to save above the predicate re=
gisters,
- 	 the offset of the vector register save slots need to be a multiple
-@@ -7506,10 +7508,10 @@ aarch64_layout_frame (void)
- 	offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNIT=
);
-       else
- 	{
--	  if (known_le (offset, vector_save_size))
--	    offset =3D vector_save_size;
--	  else if (known_le (offset, vector_save_size * 2))
--	    offset =3D vector_save_size * 2;
-+	  if (known_le (saved_prs_size, vector_save_size))
-+	    offset =3D frame.bytes_below_saved_regs + vector_save_size;
-+	  else if (known_le (saved_prs_size, vector_save_size * 2))
-+	    offset =3D frame.bytes_below_saved_regs + vector_save_size * 2;
- 	  else
- 	    gcc_unreachable ();
- 	}
-@@ -7526,9 +7528,10 @@ aarch64_layout_frame (void)
-=20
-   /* OFFSET is now the offset of the hard frame pointer from the bottom
-      of the callee save area.  */
--  bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);
--  frame.below_hard_fp_saved_regs_size =3D offset;
--  frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_regs;
-+  frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_sa=
ved_regs;
-+  bool saves_below_hard_fp_p
-+    =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
-+  frame.bytes_below_hard_fp =3D offset;
-   if (frame.emit_frame_chain)
-     {
-       /* FP and LR are placed in the linkage record.  */
-@@ -7579,9 +7582,10 @@ aarch64_layout_frame (void)
-=20
-   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
-=20
--  frame.saved_regs_size =3D offset;
-+  frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
-=20
--  poly_int64 varargs_and_saved_regs_size =3D offset + frame.saved_varar=
gs_size;
-+  poly_int64 varargs_and_saved_regs_size
-+    =3D frame.saved_regs_size + frame.saved_varargs_size;
-=20
-   poly_int64 saved_regs_and_above
-     =3D aligned_upper_bound (varargs_and_saved_regs_size
-@@ -8021,9 +8025,7 @@ aarch64_save_callee_saves (poly_int64 bytes_below_=
sp,
-=20
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-       reg =3D gen_rtx_REG (mode, regno);
--      offset =3D (frame.reg_offset[regno]
--		+ frame.bytes_below_saved_regs
--		- bytes_below_sp);
-+      offset =3D frame.reg_offset[regno] - bytes_below_sp;
-       rtx base_rtx =3D stack_pointer_rtx;
-       poly_int64 sp_offset =3D offset;
-=20
-@@ -8130,9 +8132,7 @@ aarch64_restore_callee_saves (poly_int64 bytes_bel=
ow_sp, unsigned start,
-=20
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-       reg =3D gen_rtx_REG (mode, regno);
--      offset =3D (frame.reg_offset[regno]
--		+ frame.bytes_below_saved_regs
--		- bytes_below_sp);
-+      offset =3D frame.reg_offset[regno] - bytes_below_sp;
-       rtx base_rtx =3D stack_pointer_rtx;
-       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
- 	aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
-@@ -8271,14 +8271,12 @@ aarch64_get_separate_components (void)
- 	   it as a stack probe for -fstack-clash-protection.  */
- 	if (flag_stack_clash_protection
- 	    && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
--	    && known_eq (offset, 0))
-+	    && known_eq (offset, frame.bytes_below_saved_regs))
- 	  continue;
-=20
- 	/* Get the offset relative to the register we'll use.  */
- 	if (frame_pointer_needed)
--	  offset -=3D frame.below_hard_fp_saved_regs_size;
--	else
--	  offset +=3D frame.bytes_below_saved_regs;
-+	  offset -=3D frame.bytes_below_hard_fp;
-=20
- 	/* Check that we can access the stack slot of the register with one
- 	   direct load with no adjustments needed.  */
-@@ -8425,9 +8423,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       rtx reg =3D gen_rtx_REG (mode, regno);
-       poly_int64 offset =3D frame.reg_offset[regno];
-       if (frame_pointer_needed)
--	offset -=3D frame.below_hard_fp_saved_regs_size;
--      else
--	offset +=3D frame.bytes_below_saved_regs;
-+	offset -=3D frame.bytes_below_hard_fp;
-=20
-       rtx addr =3D plus_constant (Pmode, ptr_reg, offset);
-       rtx mem =3D gen_frame_mem (mode, addr);
-@@ -8479,9 +8475,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       /* REGNO2 can be saved/restored in a pair with REGNO.  */
-       rtx reg2 =3D gen_rtx_REG (mode, regno2);
-       if (frame_pointer_needed)
--	offset2 -=3D frame.below_hard_fp_saved_regs_size;
--      else
--	offset2 +=3D frame.bytes_below_saved_regs;
-+	offset2 -=3D frame.bytes_below_hard_fp;
-       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
-       rtx mem2 =3D gen_frame_mem (mode, addr2);
-       rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, reg2)
-@@ -8597,7 +8591,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
-   if (final_adjustment_p
-       && known_eq (frame.below_hard_fp_saved_regs_size, 0))
-     {
--      poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM];
-+      poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM]
-+			      - frame.bytes_below_saved_regs);
-       if (known_ge (lr_offset, 0))
- 	min_probe_threshold -=3D lr_offset.to_constant ();
-       else
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 82883ad5a0d..c8ec3d58495 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -826,6 +826,9 @@ extern enum aarch64_processor aarch64_tune;
- #ifdef HAVE_POLY_INT_H
- struct GTY (()) aarch64_frame
- {
-+  /* The offset from the bottom of the static frame (the bottom of the
-+     outgoing arguments) of each register save slot, or -2 if no save i=
s
-+     needed.  */
-   poly_int64 reg_offset[LAST_SAVED_REGNUM + 1];
-=20
-   /* The number of extra stack bytes taken up by register varargs.
---=20
-2.34.1
-
-
-From 8b664cc8f05c8130e8ca73a59ae2751cdef8a0ea Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:48 +0100
-Subject: [PATCH 12/19] aarch64: Simplify top of frame allocation
-
-After previous patches, it no longer really makes sense to allocate
-the top of the frame in terms of varargs_and_saved_regs_size and
-saved_regs_and_above.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Simplify
-	the allocation of the top of the frame.
----
- gcc/config/aarch64/aarch64.c | 23 ++++++++---------------
- 1 file changed, 8 insertions(+), 15 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 45ff664cba6..779547d0344 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7584,23 +7584,16 @@ aarch64_layout_frame (void)
-=20
-   frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
-=20
--  poly_int64 varargs_and_saved_regs_size
--    =3D frame.saved_regs_size + frame.saved_varargs_size;
--
--  poly_int64 saved_regs_and_above
--    =3D aligned_upper_bound (varargs_and_saved_regs_size
--			   + get_frame_size (),
--			   STACK_BOUNDARY / BITS_PER_UNIT);
--
--  frame.bytes_above_hard_fp
--    =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
-+  offset +=3D get_frame_size ();
-+  offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
-+  auto top_of_locals =3D offset;
-=20
--  /* Both these values are already aligned.  */
--  gcc_assert (multiple_p (frame.bytes_below_saved_regs,
--			  STACK_BOUNDARY / BITS_PER_UNIT));
--  frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved_r=
egs;
-+  offset +=3D frame.saved_varargs_size;
-+  gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
-+  frame.frame_size =3D offset;
-=20
--  frame.bytes_above_locals =3D frame.saved_varargs_size;
-+  frame.bytes_above_hard_fp =3D frame.frame_size - frame.bytes_below_ha=
rd_fp;
-+  frame.bytes_above_locals =3D frame.frame_size - top_of_locals;
-=20
-   frame.initial_adjust =3D 0;
-   frame.final_adjust =3D 0;
---=20
-2.34.1
-
-
-From bb4600071acc3a02db4f37ffb95c8495ad76a140 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:49 +0100
-Subject: [PATCH 13/19] aarch64: Minor initial adjustment tweak
-
-This patch just changes a calculation of initial_adjust
-to one that makes it slightly more obvious that the total
-adjustment is frame.frame_size.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Tweak
-	calculation of initial_adjust for frames in which all saves
-	are SVE saves.
----
- gcc/config/aarch64/aarch64.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 779547d0344..0b8992ada74 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7645,11 +7645,10 @@ aarch64_layout_frame (void)
-     {
-       /* Frame in which all saves are SVE saves:
-=20
--	 sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
-+	 sub sp, sp, frame_size - bytes_below_saved_regs
- 	 save SVE registers relative to SP
- 	 sub sp, sp, bytes_below_saved_regs  */
--      frame.initial_adjust =3D (frame.bytes_above_hard_fp
--			      + frame.below_hard_fp_saved_regs_size);
-+      frame.initial_adjust =3D frame.frame_size - frame.bytes_below_sav=
ed_regs;
-       frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-   else if (frame.bytes_above_hard_fp.is_constant (&const_above_fp)
---=20
-2.34.1
-
-
-From f22329d5efbacf80edf4a2d45ebadd93f283252c Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:49 +0100
-Subject: [PATCH 14/19] aarch64: Tweak stack clash boundary condition
-
-The AArch64 ABI says that, when stack clash protection is used,
-there can be a maximum of 1KiB of unprobed space at sp on entry
-to a function.  Therefore, we need to probe when allocating
->=3D guard_size - 1KiB of data (>=3D rather than >).  This is what
-GCC does.
-
-If an allocation is exactly guard_size bytes, it is enough to allocate
-those bytes and probe once at offset 1024.  It isn't possible to use a
-single probe at any other offset: higher would conmplicate later code,
-by leaving more unprobed space than usual, while lower would risk
-leaving an entire page unprobed.  For simplicity, the code probes all
-allocations at offset 1024.
-
-Some register saves also act as probes.  If we need to allocate
-more space below the last such register save probe, we need to
-probe the allocation if it is > 1KiB.  Again, this allocation is
-then sometimes (but not always) probed at offset 1024.  This sort of
-allocation is currently only used for outgoing arguments, which are
-rarely this big.
-
-However, the code also probed if this final outgoing-arguments
-allocation was =3D=3D 1KiB, rather than just > 1KiB.  This isn't
-necessary, since the register save then probes at offset 1024
-as required.  Continuing to probe allocations of exactly 1KiB
-would complicate later patches.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_allocate_and_probe_stack_space):
-	Don't probe final allocations that are exactly 1KiB in size (after
-	unprobed space above the final allocation has been deducted).
-
-gcc/testsuite/
-	* gcc.target/aarch64/stack-check-prologue-17.c: New test.
----
- gcc/config/aarch64/aarch64.c                  |  4 +-
- .../aarch64/stack-check-prologue-17.c         | 55 +++++++++++++++++++
- 2 files changed, 58 insertions(+), 1 deletion(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologu=
e-17.c
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 0b8992ada74..bfd24876195 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -8564,9 +8564,11 @@ aarch64_allocate_and_probe_stack_space (rtx temp1=
, rtx temp2,
-   HOST_WIDE_INT guard_size
-     =3D 1 << param_stack_clash_protection_guard_size;
-   HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUARD;
-+  HOST_WIDE_INT byte_sp_alignment =3D STACK_BOUNDARY / BITS_PER_UNIT;
-+  gcc_assert (multiple_p (poly_size, byte_sp_alignment));
-   HOST_WIDE_INT min_probe_threshold
-     =3D (final_adjustment_p
--       ? guard_used_by_caller
-+       ? guard_used_by_caller + byte_sp_alignment
-        : guard_size - guard_used_by_caller);
-   /* When doing the final adjustment for the outgoing arguments, take i=
nto
-      account any unprobed space there is above the current SP.  There a=
re
-diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
-new file mode 100644
-index 00000000000..0d8a25d73a2
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
-@@ -0,0 +1,55 @@
-+/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer --pa=
ram stack-clash-protection-guard-size=3D12" } */
-+/* { dg-final { check-function-bodies "**" "" } } */
-+
-+void f(int, ...);
-+void g();
-+
-+/*
-+** test1:
-+**	...
-+**	str	x30, \[sp\]
-+**	sub	sp, sp, #1024
-+**	cbnz	w0, .*
-+**	bl	g
-+**	...
-+*/
-+int test1(int z) {
-+  __uint128_t x =3D 0;
-+  int y[0x400];
-+  if (z)
-+    {
-+      f(0, 0, 0, 0, 0, 0, 0, &y,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
-+    }
-+  g();
-+  return 1;
-+}
-+
-+/*
-+** test2:
-+**	...
-+**	str	x30, \[sp\]
-+**	sub	sp, sp, #1040
-+**	str	xzr, \[sp\]
-+**	cbnz	w0, .*
-+**	bl	g
-+**	...
-+*/
-+int test2(int z) {
-+  __uint128_t x =3D 0;
-+  int y[0x400];
-+  if (z)
-+    {
-+      f(0, 0, 0, 0, 0, 0, 0, &y,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x);
-+    }
-+  g();
-+  return 1;
-+}
---=20
-2.34.1
-
-
-From 174a9747491e591ef2abb3e20a0332303f11003a Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:49 +0100
-Subject: [PATCH 15/19] aarch64: Put LR save probe in first 16 bytes
-
--fstack-clash-protection uses the save of LR as a probe for the next
-allocation.  The next allocation could be:
-
-* another part of the static frame, e.g. when allocating SVE save slots
-  or outgoing arguments
-
-* an alloca in the same function
-
-* an allocation made by a callee function
-
-However, when -fomit-frame-pointer is used, the LR save slot is placed
-above the other GPR save slots.  It could therefore be up to 80 bytes
-above the base of the GPR save area (which is also the hard fp address).
-
-aarch64_allocate_and_probe_stack_space took this into account when
-deciding how much subsequent space could be allocated without needing
-a probe.  However, it interacted badly with:
-
-      /* If doing a small final adjustment, we always probe at offset 0.
-	 This is done to avoid issues when LR is not at position 0 or when
-	 the final adjustment is smaller than the probing offset.  */
-      else if (final_adjustment_p && rounded_size =3D=3D 0)
-	residual_probe_offset =3D 0;
-
-which forces any allocation that is smaller than the guard page size
-to be probed at offset 0 rather than the usual offset 1024.  It was
-therefore possible to construct cases in which we had:
-
-* a probe using LR at SP + 80 bytes (or some other value >=3D 16)
-* an allocation of the guard page size - 16 bytes
-* a probe at SP + 0
-
-which allocates guard page size + 64 consecutive unprobed bytes.
-
-This patch requires the LR probe to be in the first 16 bytes of the
-save area when stack clash protection is active.  Doing it
-unconditionally would cause code-quality regressions, but a later
-patch deals with that.
-
-The new comment doesn't say that the probe register is required
-to be LR, since a later patch removes that restriction.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Ensure that
-	the LR save slot is in the first 16 bytes of the register save area.
-	(aarch64_allocate_and_probe_stack_space): Remove workaround for
-	when LR was not in the first 16 bytes.
-
-gcc/testsuite/
-	* gcc.target/aarch64/stack-check-prologue-18.c: New test.
----
- gcc/config/aarch64/aarch64.c                  |  61 ++++-------
- .../aarch64/stack-check-prologue-18.c         | 100 ++++++++++++++++++
- 2 files changed, 123 insertions(+), 38 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prologu=
e-18.c
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index bfd24876195..3f2b10de987 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7532,26 +7532,34 @@ aarch64_layout_frame (void)
-   bool saves_below_hard_fp_p
-     =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
-   frame.bytes_below_hard_fp =3D offset;
-+
-+  auto allocate_gpr_slot =3D [&](unsigned int regno)
-+    {
-+      frame.reg_offset[regno] =3D offset;
-+      if (frame.wb_candidate1 =3D=3D INVALID_REGNUM)
-+	frame.wb_candidate1 =3D regno;
-+      else if (frame.wb_candidate2 =3D=3D INVALID_REGNUM)
-+	frame.wb_candidate2 =3D regno;
-+      offset +=3D UNITS_PER_WORD;
-+    };
-+
-   if (frame.emit_frame_chain)
-     {
-       /* FP and LR are placed in the linkage record.  */
--      frame.reg_offset[R29_REGNUM] =3D offset;
--      frame.wb_candidate1 =3D R29_REGNUM;
--      frame.reg_offset[R30_REGNUM] =3D offset + UNITS_PER_WORD;
--      frame.wb_candidate2 =3D R30_REGNUM;
--      offset +=3D 2 * UNITS_PER_WORD;
-+      allocate_gpr_slot (R29_REGNUM);
-+      allocate_gpr_slot (R30_REGNUM);
-     }
-+  else if (flag_stack_clash_protection
-+	   && known_eq (frame.reg_offset[R30_REGNUM], SLOT_REQUIRED))
-+    /* Put the LR save slot first, since it makes a good choice of prob=
e
-+       for stack clash purposes.  The idea is that the link register us=
ually
-+       has to be saved before a call anyway, and so we lose little by
-+       stopping it from being individually shrink-wrapped.  */
-+    allocate_gpr_slot (R30_REGNUM);
-=20
-   for (regno =3D R0_REGNUM; regno <=3D R30_REGNUM; regno++)
-     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
--      {
--	frame.reg_offset[regno] =3D offset;
--	if (frame.wb_candidate1 =3D=3D INVALID_REGNUM)
--	  frame.wb_candidate1 =3D regno;
--	else if (frame.wb_candidate2 =3D=3D INVALID_REGNUM)
--	  frame.wb_candidate2 =3D regno;
--	offset +=3D UNITS_PER_WORD;
--      }
-+      allocate_gpr_slot (regno);
-=20
-   poly_int64 max_int_offset =3D offset;
-   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
-@@ -8570,29 +8578,6 @@ aarch64_allocate_and_probe_stack_space (rtx temp1=
, rtx temp2,
-     =3D (final_adjustment_p
-        ? guard_used_by_caller + byte_sp_alignment
-        : guard_size - guard_used_by_caller);
--  /* When doing the final adjustment for the outgoing arguments, take i=
nto
--     account any unprobed space there is above the current SP.  There a=
re
--     two cases:
--
--     - When saving SVE registers below the hard frame pointer, we force
--       the lowest save to take place in the prologue before doing the f=
inal
--       adjustment (i.e. we don't allow the save to be shrink-wrapped).
--       This acts as a probe at SP, so there is no unprobed space.
--
--     - When there are no SVE register saves, we use the store of the li=
nk
--       register as a probe.  We can't assume that LR was saved at posit=
ion 0
--       though, so treat any space below it as unprobed.  */
--  if (final_adjustment_p
--      && known_eq (frame.below_hard_fp_saved_regs_size, 0))
--    {
--      poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM]
--			      - frame.bytes_below_saved_regs);
--      if (known_ge (lr_offset, 0))
--	min_probe_threshold -=3D lr_offset.to_constant ();
--      else
--	gcc_assert (!flag_stack_clash_protection || known_eq (poly_size, 0));
--    }
--
-   poly_int64 frame_size =3D frame.frame_size;
-=20
-   /* We should always have a positive probe threshold.  */
-@@ -8772,8 +8757,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
-       if (final_adjustment_p && rounded_size !=3D 0)
- 	min_probe_threshold =3D 0;
-       /* If doing a small final adjustment, we always probe at offset 0.
--	 This is done to avoid issues when LR is not at position 0 or when
--	 the final adjustment is smaller than the probing offset.  */
-+	 This is done to avoid issues when the final adjustment is smaller
-+	 than the probing offset.  */
-       else if (final_adjustment_p && rounded_size =3D=3D 0)
- 	residual_probe_offset =3D 0;
-=20
-diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
-new file mode 100644
-index 00000000000..82447d20fff
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
-@@ -0,0 +1,100 @@
-+/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer --pa=
ram stack-clash-protection-guard-size=3D12" } */
-+/* { dg-final { check-function-bodies "**" "" } } */
-+
-+void f(int, ...);
-+void g();
-+
-+/*
-+** test1:
-+**	...
-+**	str	x30, \[sp\]
-+**	sub	sp, sp, #4064
-+**	str	xzr, \[sp\]
-+**	cbnz	w0, .*
-+**	bl	g
-+**	...
-+**	str	x26, \[sp, #?4128\]
-+**	...
-+*/
-+int test1(int z) {
-+  __uint128_t x =3D 0;
-+  int y[0x400];
-+  if (z)
-+    {
-+      asm volatile ("" :::
-+		    "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26");
-+      f(0, 0, 0, 0, 0, 0, 0, &y,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x);
-+    }
-+  g();
-+  return 1;
-+}
-+
-+/*
-+** test2:
-+**	...
-+**	str	x30, \[sp\]
-+**	sub	sp, sp, #1040
-+**	str	xzr, \[sp\]
-+**	cbnz	w0, .*
-+**	bl	g
-+**	...
-+*/
-+int test2(int z) {
-+  __uint128_t x =3D 0;
-+  int y[0x400];
-+  if (z)
-+    {
-+      asm volatile ("" :::
-+		    "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26");
-+      f(0, 0, 0, 0, 0, 0, 0, &y,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x);
-+    }
-+  g();
-+  return 1;
-+}
-+
-+/*
-+** test3:
-+**	...
-+**	str	x30, \[sp\]
-+**	sub	sp, sp, #1024
-+**	cbnz	w0, .*
-+**	bl	g
-+**	...
-+*/
-+int test3(int z) {
-+  __uint128_t x =3D 0;
-+  int y[0x400];
-+  if (z)
-+    {
-+      asm volatile ("" :::
-+		    "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26");
-+      f(0, 0, 0, 0, 0, 0, 0, &y,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
-+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
-+    }
-+  g();
-+  return 1;
-+}
---=20
-2.34.1
-
-
-From e932e11c353be52256dd30d30d924f4e834e3ca3 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:51 +0100
-Subject: [PATCH 16/19] aarch64: Simplify probe of final frame allocation
-
-Previous patches ensured that the final frame allocation only needs
-a probe when the size is strictly greater than 1KiB.  It's therefore
-safe to use the normal 1024 probe offset in all cases.
-
-The main motivation for doing this is to simplify the code and
-remove the number of special cases.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_allocate_and_probe_stack_space):
-	Always probe the residual allocation at offset 1024, asserting
-	that that is in range.
-
-gcc/testsuite/
-	* gcc.target/aarch64/stack-check-prologue-17.c: Expect the probe
-	to be at offset 1024 rather than offset 0.
-	* gcc.target/aarch64/stack-check-prologue-18.c: Likewise.
----
- gcc/config/aarch64/aarch64.c                         | 12 ++++--------
- .../gcc.target/aarch64/stack-check-prologue-17.c     |  2 +-
- .../gcc.target/aarch64/stack-check-prologue-18.c     |  4 ++--
- 3 files changed, 7 insertions(+), 11 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 3f2b10de987..4b9cd687525 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -8751,16 +8751,12 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
-      are still safe.  */
-   if (residual)
-     {
--      HOST_WIDE_INT residual_probe_offset =3D guard_used_by_caller;
-+      gcc_assert (guard_used_by_caller + byte_sp_alignment <=3D size);
-+
-       /* If we're doing final adjustments, and we've done any full page
- 	 allocations then any residual needs to be probed.  */
-       if (final_adjustment_p && rounded_size !=3D 0)
- 	min_probe_threshold =3D 0;
--      /* If doing a small final adjustment, we always probe at offset 0.
--	 This is done to avoid issues when the final adjustment is smaller
--	 than the probing offset.  */
--      else if (final_adjustment_p && rounded_size =3D=3D 0)
--	residual_probe_offset =3D 0;
-=20
-       aarch64_sub_sp (temp1, temp2, residual, frame_related_p);
-       if (residual >=3D min_probe_threshold)
-@@ -8771,8 +8767,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
- 		     HOST_WIDE_INT_PRINT_DEC " bytes, probing will be required."
- 		     "\n", residual);
-=20
--	    emit_stack_probe (plus_constant (Pmode, stack_pointer_rtx,
--					     residual_probe_offset));
-+	  emit_stack_probe (plus_constant (Pmode, stack_pointer_rtx,
-+					   guard_used_by_caller));
- 	  emit_insn (gen_blockage ());
- 	}
-     }
-diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
-index 0d8a25d73a2..f0ec1389771 100644
---- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
-+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
-@@ -33,7 +33,7 @@ int test1(int z) {
- **	...
- **	str	x30, \[sp\]
- **	sub	sp, sp, #1040
--**	str	xzr, \[sp\]
-+**	str	xzr, \[sp, #?1024\]
- **	cbnz	w0, .*
- **	bl	g
- **	...
-diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
-index 82447d20fff..6383bec5ebc 100644
---- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
-+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
-@@ -9,7 +9,7 @@ void g();
- **	...
- **	str	x30, \[sp\]
- **	sub	sp, sp, #4064
--**	str	xzr, \[sp\]
-+**	str	xzr, \[sp, #?1024\]
- **	cbnz	w0, .*
- **	bl	g
- **	...
-@@ -50,7 +50,7 @@ int test1(int z) {
- **	...
- **	str	x30, \[sp\]
- **	sub	sp, sp, #1040
--**	str	xzr, \[sp\]
-+**	str	xzr, \[sp, #?1024\]
- **	cbnz	w0, .*
- **	bl	g
- **	...
---=20
-2.34.1
-
-
-From 9ed9fd54b2b471745c9489e83496c091a7b64904 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:52 +0100
-Subject: [PATCH 17/19] aarch64: Explicitly record probe registers in fra=
me
- info
-
-The stack frame is currently divided into three areas:
-
-A: the area above the hard frame pointer
-B: the SVE saves below the hard frame pointer
-C: the outgoing arguments
-
-If the stack frame is allocated in one chunk, the allocation needs a
-probe if the frame size is >=3D guard_size - 1KiB.  In addition, if the
-function is not a leaf function, it must probe an address no more than
-1KiB above the outgoing SP.  We ensured the second condition by
-
-(1) using single-chunk allocations for non-leaf functions only if
-    the link register save slot is within 512 bytes of the bottom
-    of the frame; and
-
-(2) using the link register save as a probe (meaning, for instance,
-    that it can't be individually shrink wrapped)
-
-If instead the stack is allocated in multiple chunks, then:
-
-* an allocation involving only the outgoing arguments (C above) requires
-  a probe if the allocation size is > 1KiB
-
-* any other allocation requires a probe if the allocation size
-  is >=3D guard_size - 1KiB
-
-* second and subsequent allocations require the previous allocation
-  to probe at the bottom of the allocated area, regardless of the size
-  of that previous allocation
-
-The final point means that, unlike for single allocations,
-it can be necessary to have both a non-SVE register probe and
-an SVE register probe.  For example:
-
-* allocate A, probe using a non-SVE register save
-* allocate B, probe using an SVE register save
-* allocate C
-
-The non-SVE register used in this case was again the link register.
-It was previously used even if the link register save slot was some
-bytes above the bottom of the non-SVE register saves, but an earlier
-patch avoided that by putting the link register save slot first.
-
-As a belt-and-braces fix, this patch explicitly records which
-probe registers we're using and allows the non-SVE probe to be
-whichever register comes first (as for SVE).
-
-The patch also avoids unnecessary probes in sve/pcs/stack_clash_3.c.
-
-gcc/
-	* config/aarch64/aarch64.h (aarch64_frame::sve_save_and_probe)
-	(aarch64_frame::hard_fp_save_and_probe): New fields.
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Initialize them.
-	Rather than asserting that a leaf function saves LR, instead assert
-	that a leaf function saves something.
-	(aarch64_get_separate_components): Prevent the chosen probe
-	registers from being individually shrink-wrapped.
-	(aarch64_allocate_and_probe_stack_space): Remove workaround for
-	probe registers that aren't at the bottom of the previous allocation.
-
-gcc/testsuite/
-	* gcc.target/aarch64/sve/pcs/stack_clash_3.c: Avoid redundant probes.
----
- gcc/config/aarch64/aarch64.c                  | 68 +++++++++++++++----
- gcc/config/aarch64/aarch64.h                  |  8 +++
- .../aarch64/sve/pcs/stack_clash_3.c           |  6 +-
- 3 files changed, 64 insertions(+), 18 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 4b9cd687525..ef4b3b671ba 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7469,15 +7469,11 @@ aarch64_layout_frame (void)
- 	&& !crtl->abi->clobbers_full_reg_p (regno))
-       frame.reg_offset[regno] =3D SLOT_REQUIRED;
-=20
--  /* With stack-clash, LR must be saved in non-leaf functions.  The sav=
ing of
--     LR counts as an implicit probe which allows us to maintain the inv=
ariant
--     described in the comment at expand_prologue.  */
--  gcc_assert (crtl->is_leaf
--	      || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRED));
-=20
-   poly_int64 offset =3D crtl->outgoing_args_size;
-   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
-   frame.bytes_below_saved_regs =3D offset;
-+  frame.sve_save_and_probe =3D INVALID_REGNUM;
-=20
-   /* Now assign stack slots for the registers.  Start with the predicat=
e
-      registers, since predicate LDR and STR have a relatively small
-@@ -7485,6 +7481,8 @@ aarch64_layout_frame (void)
-   for (regno =3D P0_REGNUM; regno <=3D P15_REGNUM; regno++)
-     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
-       {
-+	if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)
-+	  frame.sve_save_and_probe =3D regno;
- 	frame.reg_offset[regno] =3D offset;
- 	offset +=3D BYTES_PER_SVE_PRED;
-       }
-@@ -7522,6 +7520,8 @@ aarch64_layout_frame (void)
-     for (regno =3D V0_REGNUM; regno <=3D V31_REGNUM; regno++)
-       if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
- 	{
-+	  if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)
-+	    frame.sve_save_and_probe =3D regno;
- 	  frame.reg_offset[regno] =3D offset;
- 	  offset +=3D vector_save_size;
- 	}
-@@ -7531,10 +7531,18 @@ aarch64_layout_frame (void)
-   frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_sa=
ved_regs;
-   bool saves_below_hard_fp_p
-     =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
-+  gcc_assert (!saves_below_hard_fp_p
-+	      || (frame.sve_save_and_probe !=3D INVALID_REGNUM
-+		  && known_eq (frame.reg_offset[frame.sve_save_and_probe],
-+			       frame.bytes_below_saved_regs)));
-+
-   frame.bytes_below_hard_fp =3D offset;
-+  frame.hard_fp_save_and_probe =3D INVALID_REGNUM;
-=20
-   auto allocate_gpr_slot =3D [&](unsigned int regno)
-     {
-+      if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGNUM)
-+	frame.hard_fp_save_and_probe =3D regno;
-       frame.reg_offset[regno] =3D offset;
-       if (frame.wb_candidate1 =3D=3D INVALID_REGNUM)
- 	frame.wb_candidate1 =3D regno;
-@@ -7568,6 +7576,8 @@ aarch64_layout_frame (void)
-   for (regno =3D V0_REGNUM; regno <=3D V31_REGNUM; regno++)
-     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
-       {
-+	if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGNUM)
-+	  frame.hard_fp_save_and_probe =3D regno;
- 	/* If there is an alignment gap between integer and fp callee-saves,
- 	   allocate the last fp register to it if possible.  */
- 	if (regno =3D=3D last_fp_reg
-@@ -7591,6 +7601,17 @@ aarch64_layout_frame (void)
-   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
-=20
-   frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
-+  gcc_assert (known_eq (frame.saved_regs_size,
-+			frame.below_hard_fp_saved_regs_size)
-+	      || (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM
-+		  && known_eq (frame.reg_offset[frame.hard_fp_save_and_probe],
-+			       frame.bytes_below_hard_fp)));
-+
-+  /* With stack-clash, a register must be saved in non-leaf functions.
-+     The saving of the bottommost register counts as an implicit probe,
-+     which allows us to maintain the invariant described in the comment
-+     at expand_prologue.  */
-+  gcc_assert (crtl->is_leaf || maybe_ne (frame.saved_regs_size, 0));
-=20
-   offset +=3D get_frame_size ();
-   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
-@@ -7690,6 +7711,25 @@ aarch64_layout_frame (void)
-       frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-=20
-+  /* The frame is allocated in pieces, with each non-final piece
-+     including a register save at offset 0 that acts as a probe for
-+     the following piece.  In addition, the save of the bottommost regi=
ster
-+     acts as a probe for callees and allocas.  Roll back any probes tha=
t
-+     aren't needed.
-+
-+     A probe isn't needed if it is associated with the final allocation
-+     (including callees and allocas) that happens before the epilogue i=
s
-+     executed.  */
-+  if (crtl->is_leaf
-+      && !cfun->calls_alloca
-+      && known_eq (frame.final_adjust, 0))
-+    {
-+      if (maybe_ne (frame.sve_callee_adjust, 0))
-+	frame.sve_save_and_probe =3D INVALID_REGNUM;
-+      else
-+	frame.hard_fp_save_and_probe =3D INVALID_REGNUM;
-+    }
-+
-   /* Make sure the individual adjustments add up to the full frame size=
.  */
-   gcc_assert (known_eq (frame.initial_adjust
- 			+ frame.callee_adjust
-@@ -8267,13 +8307,6 @@ aarch64_get_separate_components (void)
-=20
- 	poly_int64 offset =3D frame.reg_offset[regno];
-=20
--	/* If the register is saved in the first SVE save slot, we use
--	   it as a stack probe for -fstack-clash-protection.  */
--	if (flag_stack_clash_protection
--	    && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
--	    && known_eq (offset, frame.bytes_below_saved_regs))
--	  continue;
--
- 	/* Get the offset relative to the register we'll use.  */
- 	if (frame_pointer_needed)
- 	  offset -=3D frame.bytes_below_hard_fp;
-@@ -8308,6 +8341,13 @@ aarch64_get_separate_components (void)
-=20
-   bitmap_clear_bit (components, LR_REGNUM);
-   bitmap_clear_bit (components, SP_REGNUM);
-+  if (flag_stack_clash_protection)
-+    {
-+      if (frame.sve_save_and_probe !=3D INVALID_REGNUM)
-+	bitmap_clear_bit (components, frame.sve_save_and_probe);
-+      if (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM)
-+	bitmap_clear_bit (components, frame.hard_fp_save_and_probe);
-+    }
-=20
-   return components;
- }
-@@ -8844,8 +8884,8 @@ aarch64_epilogue_uses (int regno)
-    When probing is needed, we emit a probe at the start of the prologue
-    and every PARAM_STACK_CLASH_PROTECTION_GUARD_SIZE bytes thereafter.
-=20
--   We have to track how much space has been allocated and the only stor=
es
--   to the stack we track as implicit probes are the FP/LR stores.
-+   We can also use register saves as probes.  These are stored in
-+   sve_save_and_probe and hard_fp_save_and_probe.
-=20
-    For outgoing arguments we probe if the size is larger than 1KB, such=
 that
-    the ABI specified buffer is maintained for the next callee.
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index c8ec3d58495..97173e48598 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -911,6 +911,14 @@ struct GTY (()) aarch64_frame
-      This is the register they should use.  */
-   unsigned spare_pred_reg;
-=20
-+  /* An SVE register that is saved below the hard frame pointer and tha=
t acts
-+     as a probe for later allocations, or INVALID_REGNUM if none.  */
-+  unsigned sve_save_and_probe;
-+
-+  /* A register that is saved at the hard frame pointer and that acts
-+     as a probe for later allocations, or INVALID_REGNUM if none.  */
-+  unsigned hard_fp_save_and_probe;
-+
-   bool laid_out;
- };
-=20
-diff --git a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c b/=
gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
-index 3e01ec36c3a..3530a0d504b 100644
---- a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
-+++ b/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
-@@ -11,11 +11,10 @@
- **	mov	x11, sp
- **	...
- **	sub	sp, sp, x13
--**	str	p4, \[sp\]
- **	cbz	w0, [^\n]*
-+**	str	p4, \[sp\]
- **	...
- **	ptrue	p0\.b, all
--**	ldr	p4, \[sp\]
- **	addvl	sp, sp, #1
- **	ldr	x24, \[sp\], 32
- **	ret
-@@ -39,13 +38,12 @@ test_1 (int n)
- **	mov	x11, sp
- **	...
- **	sub	sp, sp, x13
--**	str	p4, \[sp\]
- **	cbz	w0, [^\n]*
-+**	str	p4, \[sp\]
- **	str	p5, \[sp, #1, mul vl\]
- **	str	p6, \[sp, #2, mul vl\]
- **	...
- **	ptrue	p0\.b, all
--**	ldr	p4, \[sp\]
- **	addvl	sp, sp, #1
- **	ldr	x24, \[sp\], 32
- **	ret
---=20
-2.34.1
-
-
-From 4bbf7b6cdd02b0d547ddd6a630f2065680bf2f6b Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:52 +0100
-Subject: [PATCH 18/19] aarch64: Remove below_hard_fp_saved_regs_size
-
-After previous patches, it's no longer necessary to store
-saved_regs_size and below_hard_fp_saved_regs_size in the frame info.
-All measurements instead use the top or bottom of the frame as
-reference points.
-
-gcc/
-	* config/aarch64/aarch64.h (aarch64_frame::saved_regs_size)
-	(aarch64_frame::below_hard_fp_saved_regs_size): Delete.
-	* config/aarch64/aarch64.c (aarch64_layout_frame): Update accordingly.
----
- gcc/config/aarch64/aarch64.c | 45 +++++++++++++++++-------------------
- gcc/config/aarch64/aarch64.h |  7 ------
- 2 files changed, 21 insertions(+), 31 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index ef4b3b671ba..385718a475b 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7528,9 +7528,8 @@ aarch64_layout_frame (void)
-=20
-   /* OFFSET is now the offset of the hard frame pointer from the bottom
-      of the callee save area.  */
--  frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_sa=
ved_regs;
--  bool saves_below_hard_fp_p
--    =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
-+  auto below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_sav=
ed_regs;
-+  bool saves_below_hard_fp_p =3D maybe_ne (below_hard_fp_saved_regs_siz=
e, 0);
-   gcc_assert (!saves_below_hard_fp_p
- 	      || (frame.sve_save_and_probe !=3D INVALID_REGNUM
- 		  && known_eq (frame.reg_offset[frame.sve_save_and_probe],
-@@ -7600,9 +7599,8 @@ aarch64_layout_frame (void)
-=20
-   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
-=20
--  frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
--  gcc_assert (known_eq (frame.saved_regs_size,
--			frame.below_hard_fp_saved_regs_size)
-+  auto saved_regs_size =3D offset - frame.bytes_below_saved_regs;
-+  gcc_assert (known_eq (saved_regs_size, below_hard_fp_saved_regs_size)
- 	      || (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM
- 		  && known_eq (frame.reg_offset[frame.hard_fp_save_and_probe],
- 			       frame.bytes_below_hard_fp)));
-@@ -7611,7 +7609,7 @@ aarch64_layout_frame (void)
-      The saving of the bottommost register counts as an implicit probe,
-      which allows us to maintain the invariant described in the comment
-      at expand_prologue.  */
--  gcc_assert (crtl->is_leaf || maybe_ne (frame.saved_regs_size, 0));
-+  gcc_assert (crtl->is_leaf || maybe_ne (saved_regs_size, 0));
-=20
-   offset +=3D get_frame_size ();
-   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
-@@ -7637,7 +7635,7 @@ aarch64_layout_frame (void)
-=20
-   HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
-   HOST_WIDE_INT const_saved_regs_size;
--  if (known_eq (frame.saved_regs_size, 0))
-+  if (known_eq (saved_regs_size, 0))
-     frame.initial_adjust =3D frame.frame_size;
-   else if (frame.frame_size.is_constant (&const_size)
- 	   && const_size < max_push_offset
-@@ -7650,7 +7648,7 @@ aarch64_layout_frame (void)
-       frame.callee_adjust =3D const_size;
-     }
-   else if (frame.bytes_below_saved_regs.is_constant (&const_below_saved=
_regs)
--	   && frame.saved_regs_size.is_constant (&const_saved_regs_size)
-+	   && saved_regs_size.is_constant (&const_saved_regs_size)
- 	   && const_below_saved_regs + const_saved_regs_size < 512
- 	   /* We could handle this case even with data below the saved
- 	      registers, provided that that data left us with valid offsets
-@@ -7669,8 +7667,7 @@ aarch64_layout_frame (void)
-       frame.initial_adjust =3D frame.frame_size;
-     }
-   else if (saves_below_hard_fp_p
--	   && known_eq (frame.saved_regs_size,
--			frame.below_hard_fp_saved_regs_size))
-+	   && known_eq (saved_regs_size, below_hard_fp_saved_regs_size))
-     {
-       /* Frame in which all saves are SVE saves:
-=20
-@@ -7692,7 +7689,7 @@ aarch64_layout_frame (void)
- 	 [save SVE registers relative to SP]
- 	 sub sp, sp, bytes_below_saved_regs  */
-       frame.callee_adjust =3D const_above_fp;
--      frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
-+      frame.sve_callee_adjust =3D below_hard_fp_saved_regs_size;
-       frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-   else
-@@ -7707,7 +7704,7 @@ aarch64_layout_frame (void)
- 	 [save SVE registers relative to SP]
- 	 sub sp, sp, bytes_below_saved_regs  */
-       frame.initial_adjust =3D frame.bytes_above_hard_fp;
--      frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size;
-+      frame.sve_callee_adjust =3D below_hard_fp_saved_regs_size;
-       frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-=20
-@@ -8849,17 +8846,17 @@ aarch64_epilogue_uses (int regno)
- 	|  local variables              | <-- frame_pointer_rtx
- 	|                               |
- 	+-------------------------------+
--	|  padding                      | \
--	+-------------------------------+  |
--	|  callee-saved registers       |  | frame.saved_regs_size
--	+-------------------------------+  |
--	|  LR'                          |  |
--	+-------------------------------+  |
--	|  FP'                          |  |
--	+-------------------------------+  |<- hard_frame_pointer_rtx (aligned=
)
--	|  SVE vector registers         |  | \
--	+-------------------------------+  |  | below_hard_fp_saved_regs_size
--	|  SVE predicate registers      | /  /
-+	|  padding                      |
-+	+-------------------------------+
-+	|  callee-saved registers       |
-+	+-------------------------------+
-+	|  LR'                          |
-+	+-------------------------------+
-+	|  FP'                          |
-+	+-------------------------------+ <-- hard_frame_pointer_rtx (aligned)
-+	|  SVE vector registers         |
-+	+-------------------------------+
-+	|  SVE predicate registers      |
- 	+-------------------------------+
- 	|  dynamic allocation           |
- 	+-------------------------------+
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 97173e48598..9084b1cfb9d 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -837,18 +837,11 @@ struct GTY (()) aarch64_frame
-      STACK_BOUNDARY.  */
-   HOST_WIDE_INT saved_varargs_size;
-=20
--  /* The size of the callee-save registers with a slot in REG_OFFSET.  =
*/
--  poly_int64 saved_regs_size;
--
-   /* The number of bytes between the bottom of the static frame (the bo=
ttom
-      of the outgoing arguments) and the bottom of the register save are=
a.
-      This value is always a multiple of STACK_BOUNDARY.  */
-   poly_int64 bytes_below_saved_regs;
-=20
--  /* The size of the callee-save registers with a slot in REG_OFFSET th=
at
--     are saved below the hard frame pointer.  */
--  poly_int64 below_hard_fp_saved_regs_size;
--
-   /* The number of bytes between the bottom of the static frame (the bo=
ttom
-      of the outgoing arguments) and the hard frame pointer.  This value=
 is
-      always a multiple of STACK_BOUNDARY.  */
---=20
-2.34.1
-
-
-From bea0985749c12fcc264710586addb7838cc61e6d Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <richard.sandiford@arm.com>
-Date: Tue, 12 Sep 2023 16:19:52 +0100
-Subject: [PATCH 19/19] aarch64: Make stack smash canary protect saved
- registers
-
-AArch64 normally puts the saved registers near the bottom of the frame,
-immediately above any dynamic allocations.  But this means that a
-stack-smash attack on those dynamic allocations could overwrite the
-saved registers without needing to reach as far as the stack smash
-canary.
-
-The same thing could also happen for variable-sized arguments that are
-passed by value, since those are allocated before a call and popped on
-return.
-
-This patch avoids that by putting the locals (and thus the canary) below
-the saved registers when stack smash protection is active.
-
-The patch fixes CVE-2023-4039.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_save_regs_above_locals_p):
-	New function.
-	(aarch64_layout_frame): Use it to decide whether locals should
-	go above or below the saved registers.
-	(aarch64_expand_prologue): Update stack layout comment.
-	Emit a stack tie after the final adjustment.
-
-gcc/testsuite/
-	* gcc.target/aarch64/stack-protector-8.c: New test.
-	* gcc.target/aarch64/stack-protector-9.c: Likewise.
----
- gcc/config/aarch64/aarch64.c                  | 46 +++++++--
- .../gcc.target/aarch64/stack-protector-8.c    | 95 +++++++++++++++++++
- .../gcc.target/aarch64/stack-protector-9.c    | 33 +++++++
- 3 files changed, 168 insertions(+), 6 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-8.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-9.c
-
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 385718a475b..3ccfd3c30fc 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -7392,6 +7392,20 @@ aarch64_needs_frame_chain (void)
-   return aarch64_use_frame_pointer;
- }
-=20
-+/* Return true if the current function should save registers above
-+   the locals area, rather than below it.  */
-+
-+static bool
-+aarch64_save_regs_above_locals_p ()
-+{
-+  /* When using stack smash protection, make sure that the canary slot
-+     comes between the locals and the saved registers.  Otherwise,
-+     it would be possible for a carefully sized smash attack to change
-+     the saved registers (particularly LR and FP) without reaching the
-+     canary.  */
-+  return crtl->stack_protect_guard;
-+}
-+
- /* Mark the registers that need to be saved by the callee and calculate
-    the size of the callee-saved registers area and frame record (both F=
P
-    and LR may be omitted).  */
-@@ -7403,6 +7417,7 @@ aarch64_layout_frame (void)
-   poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mode);
-   bool frame_related_fp_reg_p =3D false;
-   aarch64_frame &frame =3D cfun->machine->frame;
-+  poly_int64 top_of_locals =3D -1;
-=20
-   frame.emit_frame_chain =3D aarch64_needs_frame_chain ();
-=20
-@@ -7469,9 +7484,16 @@ aarch64_layout_frame (void)
- 	&& !crtl->abi->clobbers_full_reg_p (regno))
-       frame.reg_offset[regno] =3D SLOT_REQUIRED;
-=20
-+  bool regs_at_top_p =3D aarch64_save_regs_above_locals_p ();
-=20
-   poly_int64 offset =3D crtl->outgoing_args_size;
-   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
-+  if (regs_at_top_p)
-+    {
-+      offset +=3D get_frame_size ();
-+      offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER=
_UNIT);
-+      top_of_locals =3D offset;
-+    }
-   frame.bytes_below_saved_regs =3D offset;
-   frame.sve_save_and_probe =3D INVALID_REGNUM;
-=20
-@@ -7611,15 +7633,18 @@ aarch64_layout_frame (void)
-      at expand_prologue.  */
-   gcc_assert (crtl->is_leaf || maybe_ne (saved_regs_size, 0));
-=20
--  offset +=3D get_frame_size ();
--  offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UNI=
T);
--  auto top_of_locals =3D offset;
--
-+  if (!regs_at_top_p)
-+    {
-+      offset +=3D get_frame_size ();
-+      offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER=
_UNIT);
-+      top_of_locals =3D offset;
-+    }
-   offset +=3D frame.saved_varargs_size;
-   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
-   frame.frame_size =3D offset;
-=20
-   frame.bytes_above_hard_fp =3D frame.frame_size - frame.bytes_below_ha=
rd_fp;
-+  gcc_assert (known_ge (top_of_locals, 0));
-   frame.bytes_above_locals =3D frame.frame_size - top_of_locals;
-=20
-   frame.initial_adjust =3D 0;
-@@ -8843,10 +8868,10 @@ aarch64_epilogue_uses (int regno)
- 	|  for register varargs         |
- 	|                               |
- 	+-------------------------------+
--	|  local variables              | <-- frame_pointer_rtx
-+	|  local variables (1)          | <-- frame_pointer_rtx
- 	|                               |
- 	+-------------------------------+
--	|  padding                      |
-+	|  padding (1)                  |
- 	+-------------------------------+
- 	|  callee-saved registers       |
- 	+-------------------------------+
-@@ -8858,6 +8883,10 @@ aarch64_epilogue_uses (int regno)
- 	+-------------------------------+
- 	|  SVE predicate registers      |
- 	+-------------------------------+
-+	|  local variables (2)          |
-+	+-------------------------------+
-+	|  padding (2)                  |
-+	+-------------------------------+
- 	|  dynamic allocation           |
- 	+-------------------------------+
- 	|  padding                      |
-@@ -8867,6 +8896,9 @@ aarch64_epilogue_uses (int regno)
- 	+-------------------------------+
- 	|                               | <-- stack_pointer_rtx (aligned)
-=20
-+   The regions marked (1) and (2) are mutually exclusive.  (2) is used
-+   when aarch64_save_regs_above_locals_p is true.
-+
-    Dynamic stack allocations via alloca() decrease stack_pointer_rtx
-    but leave frame_pointer_rtx and hard_frame_pointer_rtx
-    unchanged.
-@@ -9058,6 +9090,8 @@ aarch64_expand_prologue (void)
-   gcc_assert (known_eq (bytes_below_sp, final_adjust));
-   aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx, final_adj=
ust,
- 					  !frame_pointer_needed, true);
-+  if (emit_frame_chain && maybe_ne (final_adjust, 0))
-+    emit_insn (gen_stack_tie (stack_pointer_rtx, hard_frame_pointer_rtx=
));
- }
-=20
- /* Return TRUE if we can use a simple_return insn.
-diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c b/gcc/=
testsuite/gcc.target/aarch64/stack-protector-8.c
-new file mode 100644
-index 00000000000..e71d820e365
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c
-@@ -0,0 +1,95 @@
-+/* { dg-options " -O -fstack-protector-strong -mstack-protector-guard=3D=
sysreg -mstack-protector-guard-reg=3Dtpidr2_el0 -mstack-protector-guard-o=
ffset=3D16" } */
-+/* { dg-final { check-function-bodies "**" "" } } */
-+
-+void g(void *);
-+__SVBool_t *h(void *);
-+
-+/*
-+** test1:
-+**	sub	sp, sp, #288
-+**	stp	x29, x30, \[sp, #?272\]
-+**	add	x29, sp, #?272
-+**	mrs	(x[0-9]+), tpidr2_el0
-+**	ldr	(x[0-9]+), \[\1, #?16\]
-+**	str	\2, \[sp, #?264\]
-+**	mov	\2, #?0
-+**	add	x0, sp, #?8
-+**	bl	g
-+**	...
-+**	mrs	.*
-+**	...
-+**	bne	.*
-+**	...
-+**	ldp	x29, x30, \[sp, #?272\]
-+**	add	sp, sp, #?288
-+**	ret
-+**	bl	__stack_chk_fail
-+*/
-+int test1() {
-+  int y[0x40];
-+  g(y);
-+  return 1;
-+}
-+
-+/*
-+** test2:
-+**	stp	x29, x30, \[sp, #?-16\]!
-+**	mov	x29, sp
-+**	sub	sp, sp, #1040
-+**	mrs	(x[0-9]+), tpidr2_el0
-+**	ldr	(x[0-9]+), \[\1, #?16\]
-+**	str	\2, \[sp, #?1032\]
-+**	mov	\2, #?0
-+**	add	x0, sp, #?8
-+**	bl	g
-+**	...
-+**	mrs	.*
-+**	...
-+**	bne	.*
-+**	...
-+**	add	sp, sp, #?1040
-+**	ldp	x29, x30, \[sp\], #?16
-+**	ret
-+**	bl	__stack_chk_fail
-+*/
-+int test2() {
-+  int y[0x100];
-+  g(y);
-+  return 1;
-+}
-+
-+#pragma GCC target "+sve"
-+
-+/*
-+** test3:
-+**	stp	x29, x30, \[sp, #?-16\]!
-+**	mov	x29, sp
-+**	addvl	sp, sp, #-18
-+**	...
-+**	str	p4, \[sp\]
-+**	...
-+**	sub	sp, sp, #272
-+**	mrs	(x[0-9]+), tpidr2_el0
-+**	ldr	(x[0-9]+), \[\1, #?16\]
-+**	str	\2, \[sp, #?264\]
-+**	mov	\2, #?0
-+**	add	x0, sp, #?8
-+**	bl	h
-+**	...
-+**	mrs	.*
-+**	...
-+**	bne	.*
-+**	...
-+**	add	sp, sp, #?272
-+**	...
-+**	ldr	p4, \[sp\]
-+**	...
-+**	addvl	sp, sp, #18
-+**	ldp	x29, x30, \[sp\], #?16
-+**	ret
-+**	bl	__stack_chk_fail
-+*/
-+__SVBool_t test3() {
-+  int y[0x40];
-+  return *h(y);
-+}
-diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c b/gcc/=
testsuite/gcc.target/aarch64/stack-protector-9.c
-new file mode 100644
-index 00000000000..58f322aa480
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c
-@@ -0,0 +1,33 @@
-+/* { dg-options "-O2 -mcpu=3Dneoverse-v1 -fstack-protector-all" } */
-+/* { dg-final { check-function-bodies "**" "" } } */
-+
-+/*
-+** main:
-+**	...
-+**	stp	x29, x30, \[sp, #?-[0-9]+\]!
-+**	...
-+**	sub	sp, sp, #[0-9]+
-+**	...
-+**	str	x[0-9]+, \[x29, #?-8\]
-+**	...
-+*/
-+int f(const char *);
-+void g(void *);
-+int main(int argc, char* argv[])
-+{
-+  int a;
-+  int b;
-+  char c[2+f(argv[1])];
-+  int d[0x100];
-+  char y;
-+
-+  y=3D42; a=3D4; b=3D10;
-+  c[0] =3D 'h'; c[1] =3D '\0';
-+
-+  c[f(argv[2])] =3D '\0';
-+
-+  __builtin_printf("%d %d\n%s\n", a, b, c);
-+  g(d);
-+
-+  return 0;
-+}
---=20
-2.34.1
-
diff --git a/meta/recipes-devtools/gcc/gcc_11.4.bb b/meta/recipes-devtool=
s/gcc/gcc_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_11.4.bb
rename to meta/recipes-devtools/gcc/gcc_11.5.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.4.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_11.4.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_11.5.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_11.4.bb b/meta/recipes-devt=
ools/gcc/libgcc_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_11.4.bb
rename to meta/recipes-devtools/gcc/libgcc_11.5.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_11.4.bb b/meta/recipes=
-devtools/gcc/libgfortran_11.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_11.4.bb
rename to meta/recipes-devtools/gcc/libgfortran_11.5.bb
--=20
2.43.0


