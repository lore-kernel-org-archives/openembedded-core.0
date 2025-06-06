Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9A8C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:41:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26705.1749184883443616347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5564cdpX000334
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jun 2025 04:41:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t4use-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 04:41:22 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5564fLjx004561
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jun 2025 04:41:21 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t4usc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 04:41:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sz1PBr6yBmGdXNcepOefdQv9wLvhlsUjHq3MD2Uc2TNj3yGE41dJiTsYlJ2+G6Mo52RlCSE7RmDr683XUqjc9gWb3vr9oFyltzr1EBbDTAW9KmT1YhzRM6jVVARqccm8KxFNX0OBa/6t4xogdSFMfXSDqCQY0lhO5+QBor0gz4eaKp55cjANi+oNwMZ4MGAeM7APl1zT02OPAy2aegOAuJSda5YMpIOZ1y3Vxpd9vW0XA3GFWI3sFcFEmU6lDkUw627Ob27N6HHBHlCNG8gfPYK2pqsf1mJKkshEI21xixJL49+APyB9KeA1SBKsnsRAuZaas8MncxvUEpEOrun/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6abs3mlvWPmLQ8w5voHPRQqmTo9HUWWi076mwpYl+I=;
 b=MmS436gJryYaLgp5tfDhYeX6lyLrReaXRtrCT/EAF0eUK8NIpcTafR/w6PYNVl2Sm6ceWMsaAmak8iOoQOhzJrQ8fSZbqLUKAx8LrIqDY2/q6E+UhDDdjtUhc014Fpqt3Ed/4v2vpWxAWpMAqzP5NltWlK87vieLbC/2ROwtxHC+EQWI4CB7iclJG1A3iEPhgS1EPefLn2WBlm/Cj52lT0TZjZ03T8wyJ6FBv0kAG7B5UlVszHIhcQckWSlFVTQBFaa+kr94jROUNu4sDvVsmBTVf03Sl6aZRqCDfWfmYTKNJfYYZGMxj0uh0mW1H65v/SwSrLOo2+Bg+Q7c1y1afg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 04:41:17 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.8813.021; Fri, 6 Jun 2025
 04:41:17 +0000
Content-Type: multipart/alternative;
 boundary="------------0z0LeIBdfELy0wqpQ3kY45NL"
Message-ID: <c51a0efc-a6c8-40d9-a44d-3acf0fd1cd4f@windriver.com>
Date: Fri, 6 Jun 2025 12:41:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [walnascar][PATCH V2] libsoup-2.4: fix CVE-2025-46421
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
References: <202505300721.54U5A3PG003997@mx0a-0064b401.pphosted.com>
 <1846596E2232452B.2470@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1846596E2232452B.2470@lists.openembedded.org>
X-ClientProxiedBy: TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 80670259-dc3f-44a0-5771-08dda4b4602f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Mkl3bU9xTjdZaCszQ3hpQWp4UXFydm9hU0lTWm0vNmNKbzh2ZytBVHVocEpo?=
 =?utf-8?B?cHhFZkRwOGRsaThIY00yM1lHNUdUSnVocW5XektHelFXU00wM0wzM3hpUTJC?=
 =?utf-8?B?czdFZXNwU0lGWWhPbytxT1BsNW5nQkJ5VjJxcjNQVk8wTjh1WGhncVd1VTR6?=
 =?utf-8?B?dDNhWFNYc1BlKy9sUVBXbEpTZHhMakkvLzFGdEFORUtCdG5ieU16bnh3a05X?=
 =?utf-8?B?UkZlTk5JZnRiVjdIQ0FnR0hoWnlnWnhXUEptRGlxcHJoZVdDaC9aaklFZytw?=
 =?utf-8?B?NDJhSGs2NkJUVU9VK2FjdWY4dytoaklZOXNRVTdmWGdVcUY2WU40cFExWnRo?=
 =?utf-8?B?aGh0VlBMYVJnejY4Z2RnTGNOZ0J2dWRRaDNSSmFIVThqeHIxV3hNNjFTUXdR?=
 =?utf-8?B?UVp2VGlmSUFlK05OMjExelN3N2kxYURTaDZFUE9OWmVURHRoME9ybkkyOXJv?=
 =?utf-8?B?eWFBTkZ6aml3eDFoZHZ4aXUwYm16a2Q4bHJJR1I3YVQwMXp5Y0FVTGRCTW9O?=
 =?utf-8?B?SDFDTUlFUXRjT2gvQkNwbkdEN3FOMCtvU2l0UDRPRFJ2L0lOd0ZYV3lad2FK?=
 =?utf-8?B?OWxlNlZhRWI3cURCQlRWSDZQclA2UjRSTDl2NGJzYzJ0R244OTE4dksvaHJQ?=
 =?utf-8?B?eStva0c0L2FwbU5jNXdkOFdONTZ0NG0ycDBTbWl3alVKLzZUNHdiZGorZ3Zk?=
 =?utf-8?B?cmJDZzQ5Vy9CS0FIdGQ4MjVicnpiVXdMMTA3dExlaFN4dVNzOEo0MFNKbWc3?=
 =?utf-8?B?RWdYT3ZJVlZhUTVJdmUxRnlzT0kvN3Buc1lVOWpOcUhhZTJOMTRkM0NodWdS?=
 =?utf-8?B?YkhRYktrNWt2RVYxc3hmOGdzS1V2OExrN3YwQXpJd2txKzVCU00zUTZjVy9j?=
 =?utf-8?B?ZGFHUDVqSGl6MkJsdlRPbWwzUUhiUXkydlp3SmZKenRIWFNldmFZTjYxc1ds?=
 =?utf-8?B?YjAraGo1QWtvRkRURlpqMHVjVGRPSG1USGtSazdHSkI3OGpSNjFGY25nQVpt?=
 =?utf-8?B?bitOU1ZNcStXUnhoNkhDbzdmKzF0L2dleFhsWlEzZlFVaHBhbWF5S1BKN0Mw?=
 =?utf-8?B?SnZZREJoWDI0SVA3Q2c2SmVCZndrLzlqRjZjWklRVHo2U0ZLekh4S1JBQWdN?=
 =?utf-8?B?N0ZJZklhN2lyTXY0T3FKaWpNdUc2bndnd2lXcm9lM2p3dDJkR2R3YjZzdDFh?=
 =?utf-8?B?US9yU0JSemRjb0Z2MEFIQU9tSndKbU5WbEVhK0VKbXJpbm00bmk4bjZYVTJh?=
 =?utf-8?B?VzdFem4xVXREeWordGRFUkNMU0twS2ZVUzczUXQrWDZ5RmRzOWlmMzNyeFdo?=
 =?utf-8?B?NWM4SUVZUjN6MSs4MUpTZEpvbFdScWpWeU1pSGhGSVNYM0tDQWg4VHphSnpG?=
 =?utf-8?B?eHlvdnQwRGlNV2MrNWdoUkVPYWhpejJZNkRJL2MyL1RWWTljUFphSnYvVWQx?=
 =?utf-8?B?VDNqT2s5Sm1OWEFkbngrVmpuMzZpWitJMWdXTU94L2JiUjhFVVlvSkJZdzBy?=
 =?utf-8?B?SFhvaTE1dk12RzJnbnN2YXJHaHR1WWV0NkM0cEpaenlOMCtSMVlnTWJKcDVh?=
 =?utf-8?B?ZStkMVhiUVFZSVBsTTIxZEp6Rk42d3ZVN3VrWjZwTUpvbEt4ejZtWFIvaWxB?=
 =?utf-8?B?cTRaMkRoVGxYa3hsKzl4bStUUEY5M0o2aW1ySG0xOGh0WWFWaVhjK1VXOFlX?=
 =?utf-8?B?SkhYdjg0TlM4VnEwRkVMZVIxd2xPTzBJV2NFYk1PaUtqLzhONnk0RXJMa1Jt?=
 =?utf-8?B?d3Y3UFZTL2U4dTMzWGVxQi9QSVBuZmRyWmh6SE9QTXdkRkFjWU9UVkJVQWVY?=
 =?utf-8?B?QllmYnVkc2RWcmZhQTdyZHhyZnhvazRrZVp5TXBIU1F0bFFEbWhzOXFxaCt6?=
 =?utf-8?Q?cvDKYvAYvNqhx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZmVlS1NSRWFKMmdWVjRWaTNQbUlmR203UmowdlBRNVRHaUF3N1lPVm1ua2Uy?=
 =?utf-8?B?dWZGWm1xWXNBWlBTL3BNNklJN24zNlBiazJCblR0MUdKajZyQU5WaHl2MHFZ?=
 =?utf-8?B?WmlsSDJUbWY0eXdxTm1iWGcxeURScG1pNytoOEw5bHFnNEg3OGRCam4xV0xX?=
 =?utf-8?B?NjlPQ3FYbWFISFU3UFBmVlhRMkRYMDAyMWM1Umc3bWpWUXVhRWhYQmRpdG9Z?=
 =?utf-8?B?aU03dUVqaEZtaHJpZjhxNDRQSDIrMVg4Y2pSNTlPNjNCYWlJWXBDbnY0SEU4?=
 =?utf-8?B?Y2lUVVFsMUY0d3ZLb3BmTVBOTUFsUTI5TEZTdFpoYWVycGJuZEhnUGlobmVR?=
 =?utf-8?B?M01pdFJ3TExKSjI1RzU2NHV1KzFxQXBWNjZkVWl3SFlaMzU4ZDV2Nm9DSEpn?=
 =?utf-8?B?bzNOcmVqMTFkakxKRU9EVXFWRVNGdXlwUUtyeGwxOEx6cFJoUlpXNXltOGoz?=
 =?utf-8?B?NUpIc1ZnOFlNbmMwNmNwRnptMTBzNVVVRWZlenVHTkRxVG95U01GYWNyUWNO?=
 =?utf-8?B?V2tQSTRaN1VTOXg0Y1I2THJMVHoxQWVxdU1VS0NpQkhXTFNoSFVIZVFndnhX?=
 =?utf-8?B?dXpqeVFlaWFpZ282V0YzNDJ2bTNJK1gwU3lpOUpURjBuTTRLdFQwMk5VM3hu?=
 =?utf-8?B?aFBCQlpkZjJzOHh3TCtSVHp6d1A5ZTVsZTgxM08vT1RjNHBRK2ROV24zeVBH?=
 =?utf-8?B?T2RYK096ZFZueUVmakt3YWdzeTVIUjVzdTBaOHB1MGxQZXVwVzRscEZXb1NS?=
 =?utf-8?B?djZhNUk2U2hhcUdzNmRTYThncEhBSVVRQ1duNTRSOElETHM0OFZhYm4rNXZD?=
 =?utf-8?B?eTdDbUlnS0NiSER6Mno2MDYzVWdPMkIxRVdUR1lLdU9VMEZ2TzF3eTM5T3JN?=
 =?utf-8?B?dmZMZTU3Y2RRcnh6QXlGdHhoTm9YaXFTaXUzdjUvaXdpT3FxTjM5Z09FVUR0?=
 =?utf-8?B?MElNdk56UHJpMjIwSExPQmpzSHIwS3VkWWJXSlIyN3lrb29DNVJ4a3JBZUVw?=
 =?utf-8?B?Wm5ISnJWaWN6eDBQZkh5WkxWV21oWVlWMkRvUWVqdWdmR0F5T1JrOXBLQU8y?=
 =?utf-8?B?SEZ3eTNJUFJWWXlQaW0wUGJVOWgyQkZrN1ZBZG1MeEhWbkpUTDNMOVpGQzF5?=
 =?utf-8?B?cHFHbmpGU1ZjWVp6OFJkcER4N1g3cklGclVhKzVESnZUcTJpSXNRcXNMZ2Nz?=
 =?utf-8?B?VHVYa0VObENDZlRvZE9NNUMzaTJrTWFNUytHMUhPbllLbmlUWDRIVG9USWJv?=
 =?utf-8?B?VE13OTF2WTBXSHdlakNrbGRRYlUvM25jcks3cU5ydVlBcllpZnFJM24wUDZl?=
 =?utf-8?B?VTdmTU9UVmZIWTl2RnRDNGd3a1pKalZpc1pldlBvT1k2UWxWKzVqdWhKcjJ2?=
 =?utf-8?B?TnJ5UzVqNitBT09jeHZBVWV5MDZudXMxeEhQcnU0dEFYZThEbXZXUnl5QjFD?=
 =?utf-8?B?ODR0MXRJYlNmUEZUR2FkTmdvcThRY0lZaUdvbjBQa2hjb1FMZVlUaFQ2SnVt?=
 =?utf-8?B?c2Mydmt4aFl5M2xZQWRpYWF0NzBvc3VBdjZzSnJMeDZ0NUVhdXY0VXkwMnVu?=
 =?utf-8?B?bUw1ME1ZWXRSbE9xdkVkY3hrOVlmUWVpVTcyVmgxd2Z6WEFheWdZVU04VlZO?=
 =?utf-8?B?aXdWREo3SW12dGRheGdxY0NnQ0hEQjFBNFdxRVd5MXZ0bm9wQ1BFUkRScDRX?=
 =?utf-8?B?cTNqSGYrdFQvbHI3N3JQQU4vNmc0cHA3MlBRdmdBbitVc2hNSG94c3A5OTRD?=
 =?utf-8?B?V3VsUFplOElrV0xHZDFkK1NmYkIweE41anZjbHoyWjFXaWlFNW40TlN0QUds?=
 =?utf-8?B?VUh5eG11M0Q1RFpTYWREWTZzajRWeXlXMmlhcFRhTWJvV2QrdElhVzhEUmkr?=
 =?utf-8?B?bDEyVXJmN0FLS1BPajBuL0VKTGZ5VEJ3b21xWEN5cGM5b2VOSmVoZ2Z0cFEy?=
 =?utf-8?B?VlFtSWlPWERCcDEyK1ZFU3BLWlViM0NjZmw2ZElCQXBYUTVuVDl6eFZZSXJI?=
 =?utf-8?B?Njd0dzRzNWZZKzMrVG5zd3NrYUs5MWlyUTBMc1c0SnczcEZOcS9OZUc3Nzl2?=
 =?utf-8?B?QXZublFZbC9SWURjcXMwTWdXTFp4KzlhcVdVaVJRaEgxQnI0dkNZWEN4OTho?=
 =?utf-8?B?dDFsL3BXV1BMOWF2RUdmREgwRTFZdG1wZGd4NW5IekkrUjJSWnBCL01MR3Jl?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80670259-dc3f-44a0-5771-08dda4b4602f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 04:41:17.4200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KE/uOE2o4oyWsAMPzTysz4nuwsnPe4pQkJ0r6DMPUlO41I7B0hlcy1ZTYkGiyO1zKcSBtk2K8Tz07W4LWPy/m/1fD5UbrJpK0+zS8CAbBsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
X-Proofpoint-ORIG-GUID: 3A8k8IDLsK2_7oIKyz4quN53akgsTQRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA0MSBTYWx0ZWRfX+QYKxlYeNLGw 1zqUcaR911M0VK4cf2StABkJWuuc0LImgA2kqDzRx5ilszFfFCxLileqw0QWDb8x0AMYCZKmNED iTr2vF0CfT8emtPLL0+IgBFSQQi5p6dv3Xp2I31c3rvukmk8LUAT6IO43AZRdzX+SZFHhlSqyhQ
 EVj6sS7iq1JZ0c8F7mSVHmf/9NKWPDY32C5quKy00WHaMEEhl3wDUyLS5iQEWEbMkDX1pH0YgWZ mJGFdS5bhrJ5T2ZdT+V56RaXR/Op6GNW+YyVG9fsNctI335O9tWo4DAETYorzvPcbJHJKFYTX0X u+JqXKVpClwokU55YS/sJH32IgFNrQC48Tvaj+aP2Dk2aplRur170Uzz64OlFp65UE1R8jz+lfF
 pZAgSfUuL7A+qLiVLQcm90Cooj8ceSeYdYhnfcQhRmddZAmg2cq4D4/nSHerkkFy769By+eu
X-Proofpoint-GUID: V3vabLSKE3xa5BMWD7RGeKjabqkmkHrP
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=68427172 cx=c_pps a=3OeuVL14gDL12TxVPZ2LnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=Zdsv6A-OUxhj3mrB9z4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=VMYcY6RBaRPXj-5NZaoA:9 a=zW1OX0tb346iF9bG:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 04:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218094

--------------0z0LeIBdfELy0wqpQ3kY45NL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5564cdpX000334

Please ignore this one,=C2=A0 I have resend one in reply to the V1 series.

//Changqing

On 6/6/25 12:23, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/issues/439
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../libsoup/libsoup-2.4/CVE-2025-46421.patch  | 47 ++++++++++++++++++=
+
>   .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
>   2 files changed, 48 insertions(+)
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-=
46421.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.pa=
tch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
> new file mode 100644
> index 0000000000..9c62b85936
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
> @@ -0,0 +1,47 @@
> +From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
> +From: Patrick Griffis<pgriffis@igalia.com>
> +Date: Wed, 5 Feb 2025 16:18:10 -0600
> +Subject: [PATCH] session: Strip authentication credentails on
> + cross-origin redirect
> +
> +This should match the behavior of Firefox and Safari but not of Chromi=
um.
> +
> +CVE: CVE-2025-46421
> +Upstream-Status: Backport
> +[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?com=
mit_id=3D3e5c26415811f19e7737238bb23305ffaf96f66b]
> +
> +Test code not added since it included some headers not in version 2.74=
.3
> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + libsoup/soup-session.c |  6 ++++++
> + 1 files changed, 6 insertions(+)
> +
> +diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
> +index 83421ef..8d6ac61 100644
> +--- a/libsoup/soup-session.c
> ++++ b/libsoup/soup-session.c
> +@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *se=
ssion, SoupMessage *msg)
> + 						   SOUP_ENCODING_NONE);
> + 	}
> +
> ++	/* Strip all credentials on cross-origin redirect. */
> ++	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
> ++		soup_message_headers_remove (msg->request_headers, "Authorization")=
;
> ++		soup_message_set_auth (msg, NULL);
> ++	}
> ++
> + 	soup_message_set_uri (msg, new_uri);
> + 	soup_uri_free (new_uri);
> +
> + 	soup_session_requeue_message (session, msg);
> + 	return TRUE;
> +-}
> ++}
> +
> + static void
> + redirect_handler (SoupMessage *msg, gpointer user_data)
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/=
recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 1ef9303fb8..3b460852f3 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libs=
oup-${PV}.tar.xz \
>              file://CVE-2025-32906.patch  \
>              file://CVE-2025-32914.patch  \
>              file://CVE-2025-46420.patch  \
> +file://CVE-2025-46421.patch  \
>   "
>   SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03=
4153df1413fa1d92f13"
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218092):https://lists.openembedded.org/g/openembedd=
ed-core/message/218092
> Mute This Topic:https://lists.openembedded.org/mt/113498571/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------0z0LeIBdfELy0wqpQ3kY45NL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Please ignore this one,&nbsp; I have resend one in reply to the V1
      series.</p>
    <p>//Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 6/6/25 12:23, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1846596E2232452B.2470@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Refer:
<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/issues/439">https://gitlab.gnome.org/GNOME/libsoup/-/issues/439</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  | 47 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
new file mode 100644
index 0000000000..9c62b85936
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
@@ -0,0 +1,47 @@
+From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <a class="moz-txt-link-rfc2396E" href="mailto:pgriffis@igalia.com">&lt;pgriffis@igalia.com&gt;</a>
+Date: Wed, 5 Feb 2025 16:18:10 -0600
+Subject: [PATCH] session: Strip authentication credentails on
+ cross-origin redirect
+
+This should match the behavior of Firefox and Safari but not of Chromium.
+
+CVE: CVE-2025-46421
+Upstream-Status: Backport
+[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b</a>]
+
+Test code not added since it included some headers not in version 2.74.3
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ libsoup/soup-session.c |  6 ++++++
+ 1 files changed, 6 insertions(+)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 83421ef..8d6ac61 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
+ 						   SOUP_ENCODING_NONE);
+ 	}
+ 
++	/* Strip all credentials on cross-origin redirect. */
++	if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
++		soup_message_headers_remove (msg-&gt;request_headers, &quot;Authorization&quot;);
++		soup_message_set_auth (msg, NULL);
++	}
++
+ 	soup_message_set_uri (msg, new_uri);
+ 	soup_uri_free (new_uri);
+ 
+ 	soup_session_requeue_message (session, msg);
+ 	return TRUE;
+-}
++}
+ 
+ static void
+ redirect_handler (SoupMessage *msg, gpointer user_data)
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 1ef9303fb8..3b460852f3 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -23,6 +23,7 @@ SRC_URI = &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-32906.patch">file://CVE-2025-32906.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-32914.patch">file://CVE-2025-32914.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-46420.patch">file://CVE-2025-46420.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2025-46421.patch">file://CVE-2025-46421.patch</a> \
 &quot;
 SRC_URI[sha256sum] = &quot;e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#218092): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/218092">https://lists.openembedded.org/g/openembedded-core/message/218092</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113498571/3616873">https://lists.openembedded.org/mt/113498571/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------0z0LeIBdfELy0wqpQ3kY45NL--

