Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6102BC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 03:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11097.1721359698511692852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 20:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=793023b01e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J2QJfv024404
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 03:28:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc96a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 03:28:17 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46J3SGZH011937;
	Fri, 19 Jul 2024 03:28:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc96a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 03:28:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0hcaEhObbOuhqMpX7HmLu+3tWOfwkztslF1OLVf+G9TmhWa9yOnRK3pZFnbwk3qLBHfXTrCNA6ggw4ERY4o8/3ax3+xG12xNoEize3GoCThhpzlMWlivd41RGx9PiqvqaFpLpe9jlo5cQc6NQHez1K3CLWcsB+mFwG9KipWUkWQqtxvyzO+IwM6Mjix7UPp4CNKOeMML5///16NK3DOt+hT2y7tFyoGLw7TeMm7xPbtE/knAN7N9Z7iRPWy2Tlxp9G6oo6C/7M9+i0r+/xunIY4GYdRMeZ6SxyvwnJAvKEol4XOMKsuOhHJok0HF8r22VMtVXm6bG5PquE0BX0p5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1Is2phXOHifq9Swv1hnhSsmrCi6TkFe+dLoqrN484c=;
 b=qQvcP+LU8RyCc0fAp52x6W2nWx++7NxxCl1QYCZJkk4BpLy+dqFwh843MFw/kJD4ZiAd0XwC7gaRecpbV93xG9mWiDfzXBNQE62S71TMpoKbQNdVyfBauvyfW57pkxbxbWjx/G7q4ajGVRmz07PstEPP8AM3eA/uLH86t8vCnOTXuuz11u9jk8dNG8Tv5ZdRehuitf961XMCVvyXjJDL6EfKTA5dGdEHrodxr9P25Y3OiqAAENfi9yOsDlz0DK+GCbdodVpO6U9LqdHo6M4wA+it7I7hm66yWClKUxQKJZVOQib+3c7As57lYaEQzCfZhWSdBJ2RareaIkBHF6r96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.32; Fri, 19 Jul
 2024 03:28:13 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 03:28:13 +0000
Content-Type: multipart/alternative;
 boundary="------------t9ThL2MqaTRp9PJoMlm0b0Vq"
Message-ID: <0e68394a-ac65-4a69-b646-95217844ad12@windriver.com>
Date: Fri, 19 Jul 2024 11:28:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][PATCH V2] pixman: update patch for fixing
 inline failure with -Og
To: Ross Burton <Ross.Burton@arm.com>
Cc: ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240716094909.3536953-1-changqing.li@windriver.com>
 <135B34F4-47F3-48E5-9AE6-9CE0C7F6DE38@arm.com>
 <17E37CC38EA33E18.22972@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17E37CC38EA33E18.22972@lists.openembedded.org>
X-ClientProxiedBy: TY1PR01CA0188.jpnprd01.prod.outlook.com (2603:1096:403::18)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA1PR11MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 66460732-a90e-4b18-791d-08dca7a2d223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejV4YTV2VUs3ZnI2dlJ6MzZ2bFZERUloZmhacjIwTllmZjFVdzNMdWszWUpE?=
 =?utf-8?B?NmE2Smx2TWFJOTVZeEZWek93RU1RdzZmcEliOEs2RGpiUjJNU0JaRGpsby9G?=
 =?utf-8?B?UUR0VEZhc1ZjakczQnl0ZVRTa0U3UmZzeDNxZXQzdVI0czIwb29lVWs0WHJo?=
 =?utf-8?B?eUVRMTh6OUNqTStHR2lmdVV4dTZqREZ3UkVHeXRmc3UzdFJUckM3ME5ibHIz?=
 =?utf-8?B?N0VQckpQd3A2SkYyUHdITUxCdG10d0FjVHU5Mlg5ZmllR2hYTExuUlY1VDhJ?=
 =?utf-8?B?clJGVXg3bm9mOGEvL3JQTTZEMUdvbHdRYkd0NC9kQWplemZFL0FPd0dBOTJh?=
 =?utf-8?B?cGx2aVkrb05Ld3c2Ty81NGszeFlIMnhCSURadE9BR2lwR3BPeWdScXdscUs3?=
 =?utf-8?B?MTBSMlphVmZTdGx5QzE5UVpaSWpiR2wraVpkT1pDWTg4WU5FMHRLWGY5ejJT?=
 =?utf-8?B?YVZlRnhTcXgwTkpLVTNGQ3lPVTRhVU9kdzJIc0ttZkFPODRDMWE0K21Dc0Jk?=
 =?utf-8?B?WDBjNEFlcnF2UnFDMU9kZW9wa2lNaHZ0MDhFdUxwWGVodmVVaUVRWVVxbzUv?=
 =?utf-8?B?M1gvdHJLeVIrTFdPQWI3QnBVc2V6dzVPNmN0S0YzOGtsanhUM1FLL3VONWhD?=
 =?utf-8?B?dDF4YUI4SFRpaDh6Ylh4THdOMDBJY2VMREZwbVZqeVRydURyUldEWFVwNFA2?=
 =?utf-8?B?V1hoKy93OTArVlp1eWZCdzJjelFFUGFDUkY2YndRQzNFV2RJenA3ak1uK2JI?=
 =?utf-8?B?VWNKVTFZUHo1VkJzVkdneWQxZWtzRGdZSHlKOEdLSittdDRrcE4zWU4vNDZM?=
 =?utf-8?B?dDZMZ0NXeXFsckNhU0xHNnBteE5vdDlqeDJ3VWtabktub2F3ZkJMQUVaNE5F?=
 =?utf-8?B?aU9VSVowZ3htQlZXNC9tYW1OVmlCeGppdjJhcnR4bWpmMzV1M0JEU0xvREFp?=
 =?utf-8?B?ZnorOEI5ZGlVMC85b1l3T1crSUVRcjVETFUzWG8rRHJva1VZMFZSTCtEU01J?=
 =?utf-8?B?T0swNTRkdVhZVDFZT0RqMnBXdHJwVzJuaVNJNEdzQTU5Zmwrc0VaZUZZTkRJ?=
 =?utf-8?B?UjZWaGViaWcvV0dnMkxjdWk0aDNRZ2IremFEWWd2aEVUanVEWUlMT2IxUjQ2?=
 =?utf-8?B?NzgzS3ZyUDhlODBhR09zdnFuUE9PSmdWQzZSZXNveGd0M09XY1gzRWoxdmpN?=
 =?utf-8?B?Q0xrOVRCV01td1pFY1pLYiswdDV5VnJDUlhuTlAzNVBEcXVnVXoxTGU5M1RX?=
 =?utf-8?B?UmpLNHVVc1lBUklPV1ZSSzBuZ2hWQTdRZjlSU0ZPTDUydk0weXlzcGE4MUEx?=
 =?utf-8?B?Q1ZLZXA1K1UzbXRPK01wTUJRWHQ0dTdseXE3YkxyaXdTZDRrNEx0Z1pCeDlP?=
 =?utf-8?B?dndFUGptYkYxNVp4blN0aTFBaUxYQk8yYzJVU3VoaStSeXlMN0dYMjlTMHBo?=
 =?utf-8?B?NXlpVmJteDRUQ283SDRYMUE1NUFIa05keVBnQnY1MGZzN1dHRVBDYjcrcnJV?=
 =?utf-8?B?bFE3bEc1OG0yeGhOdWp3YmF3WDVNOUNnb1FEbVdiUjhFR0szTWRETlhkemp2?=
 =?utf-8?B?eUJPZlNTbDU5eS96VzdGS2padUMzVE9sbWZIWmJKdk9rMXU4VGFadEZkQUVX?=
 =?utf-8?B?ZFNsSmFSVnh1RnJlbmtIY1NMb3hid0JYdm13SzJldXJBTjgwaHYzdmpnU2dR?=
 =?utf-8?B?a3gwZkRML3ZLY0lxVzRaTThVV0o0dEt6dS9HeHdKM0tLdHNZWmpGa1ZEWkVM?=
 =?utf-8?Q?3mZOhxUq2gRibnQFNI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWFBTlUvVy95L1I5ajIwV0l5czR5ZzBGYUJuSXVCaFF6NlBTSjVXZTk3a2cv?=
 =?utf-8?B?c3NPQmFoZHdQdG5RSkNLRkhyZFJFRmZISTgwVTloRFV1STBiRTVZeDQ2TDdj?=
 =?utf-8?B?UWRxL1FtbXdzemdNQ1krU01iMEtsMzJrWHlGNEpITEl5d0p4VmR6aTNJaXI5?=
 =?utf-8?B?QnpQeEhVTmhId2VTK3lhdDl6TlAwL24vZGpGM0RjYWVDT0tITkNlc2hvelFR?=
 =?utf-8?B?Q1JGNVhucGJOUXhGTHhNalF5dDJHSEFZR3RSRTR5S0IwSnZ3SnBzV2Z2Z01U?=
 =?utf-8?B?bjB3WUlwRXJIaFZBYnlELzM3VkpmT3FBbm05amFBeEs0eUlObU5Id3RrMFUy?=
 =?utf-8?B?RzZJWHM4T1RXU3hBaGVDMnlpdi9yZDhBTU9ROG41YVhwdjk4N2dxQ05RRkpX?=
 =?utf-8?B?bHhRWXpqWnFuMSt2Uk0zMG5VTzRMZEpDUjFEZ0xadEZjUnl0akhNcE5hL24w?=
 =?utf-8?B?V0xHS0o1RHg2ZHpwWk83dVpjemw3R3pIYlRjeGs1MGRXNTl1cVNwaXdwYVlY?=
 =?utf-8?B?RTE2TFVLYXM3SHpydGk2N1BtY0M2Q2pCYldhaDJmaDY2YkFEa2dlY0tGdXpv?=
 =?utf-8?B?T0UxSVNCN3hUeUdwcUZjVTRQaDIvMEgvL2NVMm4wNjRaclVkNmN2WnpqR3ZY?=
 =?utf-8?B?c1JxM2pIUU5JbnZ2ZitNQ0pNZzFBeXc1R3R4WDBKYmw2Z1VIS2YyNGlUdG1i?=
 =?utf-8?B?bzhZQjBWV1hZeGtKcTY1UU9IbS9GK0p3TnYxNGJocEJjbjhycTBVbU41SmJa?=
 =?utf-8?B?OC9ZelpuRVBxSTE3MnBHOEg4Nyt5MHo4THhVYkkvMXZ3SU1sOHNCYlZlOWdP?=
 =?utf-8?B?R29INW5CblQzeEw5Tk0wR1BqTUJFTG5HdXZBRFFUTFJZS2ZFWnVTTTgwczRI?=
 =?utf-8?B?bllVZTdXYUNpK1JqNGdqUTczVlpoZnFzZWNxR0llM1RkcExGVjFtd1ZaN2Y0?=
 =?utf-8?B?YWtwWXZxOU5GWXZhY3NNN3QvSkVJVHNuQ2lQTEFrNS9ybWpSNTJ1N0NESkwy?=
 =?utf-8?B?WFdFT3FNWFNvOUJqNDc2QVRVdkswcjJMZ3g1bVJEamt2dEZ1RXZYOENDNHpq?=
 =?utf-8?B?SW4rSVZnUHhwbTNSbnBNaUJTYTk0MEViS1JCcm90M0k5Q0pkcVpZODl1US8y?=
 =?utf-8?B?ekN3Q3VTYVZHek1GTHliVVZoeklMUGc1cWlHblNPRUdJQVFNYWtPbVJ6TjRJ?=
 =?utf-8?B?MzVWV2tFU3RiRFRDVWtpSzdXNlJhaU80MW5rdmowS04zcEFzTEk0MGY2S3F1?=
 =?utf-8?B?MEVZRmYyN3UyNWxTQTNoSGV5ekxqY2RUVlFvTmJIV2RlNmxXc3Z6amVwbGQz?=
 =?utf-8?B?UXpKRG1FcTd3RmViZUo2NVlGejU5SVo0Ui8rLzJYZjRnWWNtcnR6SThhbUhG?=
 =?utf-8?B?YkU3ZmFoUFA1VjQyNTdHeFB2eFBwTmcyVHZaYnVkWUU3M3BybEFpdTlLczRv?=
 =?utf-8?B?b0FqT2lsQXNZaWhCS0gydWFjSktNc3pJTCtzY1ZHKzI4K1RrY095ZWV6ekp1?=
 =?utf-8?B?TVczQlVZc01oL0E1MWtpY003T2xDdUN3dCs4TUpsYzZJUmQ0bmtlRW9RWjBY?=
 =?utf-8?B?dlR2a0FCbmtFVVY3anl3SSt1eVJqdEdHR1FjTjFKYmhNVGg2RTZmd2xneUVu?=
 =?utf-8?B?a1VwYVg5WUsrMU53TDRYRTh3dTkxK08wbzhJQXVVaWxaV0s4ZHJ1ZmJOekRO?=
 =?utf-8?B?dTl0bHdkYVI2emJjMFIzbTN4d2V6aTROakUxNEV5WTZpR0ZMY2daTjgyUVNV?=
 =?utf-8?B?SFVHN1VTYXZwTDVWV3hMZkR1RE82VWtJRVRhbjBybnNLOVl6alRsZHBHM0tR?=
 =?utf-8?B?YUViTHhBTENUZG5TWERpYU1tb2phMkh1NnFXVzYvNXBlMG1sVWlwVnIvaC95?=
 =?utf-8?B?OFYxMEtFSTQ3RnZGbDhiVXBMdEZ5MGx3bXpudHA0OHN0QkNJaVRPQXExbWNU?=
 =?utf-8?B?NC9VTFhINFpQV0NISEFQRVBzNkZBM2VCc1pzSlRIKy9pYW5VR2pKdWtqU0J6?=
 =?utf-8?B?aVViS2JoY0IwUDJmVWR6WEMyRDd0U1ZMbGVEMVdlRmI5T09uQlArVVdFV3lz?=
 =?utf-8?B?T0I2aTdGN1ZSMG9UQ3AwWlhTZStrcWdDTEdLUWEzRmUrcE8yRXVTbTlKWDIy?=
 =?utf-8?B?eVVjQk8vcFNFaGpyTGFNWlNQeUd3dEd5NHVqQnNrRHhNZkZOMWh2eTl4cW00?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66460732-a90e-4b18-791d-08dca7a2d223
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 03:28:13.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPQxfF+d1DUqGL9GfnhOqTRrNmgGjWzqXfP0zmrscqBAuDMFarvJ+NC+YsRr58M7gLI8qt+5znQYsQKxHKYfydB6r5WRD08vMbI2L6PrX0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
X-Proofpoint-GUID: MrBjjEzproT-mIBF87Neh7k0LCuuzT1L
X-Proofpoint-ORIG-GUID: Dlpn5B4IgsV8tnvU2nDaVmX8-QZ5h8_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_18,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407190026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 03:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202247

--------------t9ThL2MqaTRp9PJoMlm0b0Vq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46J2QJfv024404


On 7/19/24 10:37, Changqing Li via lists.openembedded.org wrote:
>
>
> On 7/18/24 21:16, Ross Burton wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> Can you submit this to pixman=E2=80=99s gitlab repository as a MR?
>>
>> https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests
>
> Sure, I will send out the link after done.
>
https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/103

Regards

Changqing

> Thanks
>
> Ross
>
>> Thanks,
>> Ross
>>
>>> On 16 Jul 2024, at 10:49, Changqing Li via lists.openembedded.org<cha=
ngqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>>>
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> Previous patch works on fedora40 with gcc-14, but not works
>>> on ubuntu2004 with gcc-9. Update the patch to fix the do_compile
>>> failure:
>>>     In function =E2=80=98combine_inner=E2=80=99,
>>>         inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at=
 ../pixman-0.42.2/pixman/pixman-combine-float.c:655:1:
>>>     ../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inli=
ning failed in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_s=
oft_light_c=E2=80=99: function not
>>> considered for inlining
>>>       370 |     combine_ ## name ## _c (float sa, float s, float da, =
float d)
>>>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>>> ...loat.c-fix-inlining-failed-in-call-t.patch | 56 ++++++++++++++++++=
+
>>> ...float.c-replace-force_inline-with-__.patch | 36 ------------
>>> .../xorg-lib/pixman_0.42.2.bb                 |  2 +-
>>> 3 files changed, 57 insertions(+), 37 deletions(-)
>>> create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-=
combine-float.c-fix-inlining-failed-in-call-t.patch
>>> delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-=
combine-float.c-replace-force_inline-with-__.patch
>>>
>>> diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combin=
e-float.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xor=
g-lib/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.pa=
tch
>>> new file mode 100644
>>> index 0000000000..5c79754e50
>>> --- /dev/null
>>> +++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float=
.c-fix-inlining-failed-in-call-t.patch
>>> @@ -0,0 +1,56 @@
>>> +From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 20=
01
>>> +From: Changqing Li<changqing.li@windriver.com>
>>> +Date: Tue, 16 Jul 2024 15:31:16 +0800
>>> +Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call=
 to
>>> + always_inline
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=3DUTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +Refer [1], always-inline is not suggested to be used if you have ind=
irect
>>> +calls. so replace force_inline with inline to fix error:
>>> +In function =E2=80=98combine_inner=E2=80=99,
>>> +    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ..=
/pixman/pixman-combine-float.c:655:511:
>>> +../pixman/pixman-combine-float.c:655:211: error: inlining failed in =
call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=
=99: function not considered for inlining
>>> +
>>> +[1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115679
>>> +
>>> +Upstream-Status: Submitted [https://www.mail-archive.com/pixman@list=
s.freedesktop.org/msg04812.html]
>>> +
>>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> +---
>>> + pixman/pixman-combine-float.c | 6 +++---
>>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-f=
loat.c
>>> +index f5145bc..f65eb5f 100644
>>> +--- a/pixman/pixman-combine-float.c
>>> ++++ b/pixman/pixman-combine-float.c
>>> +@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, f=
loat da)
>>> + }
>>> +
>>> + #define MAKE_PD_COMBINERS(name, a, b) \
>>> +-    static float force_inline \
>>> ++    static float inline \
>>> +     pd_combine_ ## name (float sa, float s, float da, float d) \
>>> +     { \
>>> + const float fa =3D get_factor (a, sa, da); \
>>> +@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor, ONE_MINUS_DA_=
OVER_SA, ONE_MINUS_SA_OVER_DA)
>>> +  */
>>> +
>>> + #define MAKE_SEPARABLE_PDF_COMBINERS(name) \
>>> +-    static force_inline float \
>>> ++    static inline float \
>>> +     combine_ ## name ## _a (float sa, float s, float da, float d) \
>>> +     { \
>>> + return da + sa - da * sa; \
>>> +     } \
>>> +      \
>>> +-    static force_inline float \
>>> ++    static inline float \
>>> +     combine_ ## name ## _c (float sa, float s, float da, float d) \
>>> +     { \
>>> + float f =3D (1 - sa) * d + (1 - da) * s; \
>>> +--
>>> +2.25.1
>>> +
>>> diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combin=
e-float.c-replace-force_inline-with-__.patch b/meta/recipes-graphics/xorg=
-lib/pixman/0001-pixman-combine-float.c-replace-force_inline-with-__.patc=
h
>>> deleted file mode 100644
>>> index cae201629f..0000000000
>>> --- a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float=
.c-replace-force_inline-with-__.patch
>>> +++ /dev/null
>>> @@ -1,36 +0,0 @@
>>> -From 49a1644015d073829c17dcd977aab6fdda1ebdee Mon Sep 17 00:00:00 20=
01
>>> -From: Changqing Li<changqing.li@windriver.com>
>>> -Date: Fri, 5 Jul 2024 07:33:44 +0000
>>> -Subject: [PATCH] pixman-combine-float.c: replace force_inline with _=
_inline__
>>> -
>>> -Refer [1], always-inline is not suggested to be used if you have ind=
irect
>>> -calls. so replace force_inline with __inline__ to fix error:
>>> -In function =E2=80=98combine_inner=E2=80=99,
>>> -    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ..=
/pixman/pixman-combine-float.c:655:511:
>>> -../pixman/pixman-combine-float.c:655:211: error: inlining failed in =
call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=
=99: function not considered for inlining
>>> -
>>> -[1]https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D115679
>>> -
>>> -Upstream-Status: Submitted [https://www.mail-archive.com/pixman@list=
s.freedesktop.org/msg04812.html]
>>> -
>>> -Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ----
>>> - pixman/pixman-combine-float.c | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-f=
loat.c
>>> -index f5145bc..52400f4 100644
>>> ---- a/pixman/pixman-combine-float.c
>>> -+++ b/pixman/pixman-combine-float.c
>>> -@@ -44,7 +44,7 @@
>>> -
>>> - typedef float (* combine_channel_t) (float sa, float s, float da, f=
loat d);
>>> -
>>> --static force_inline void
>>> -+static __inline__ void
>>> - combine_inner (pixman_bool_t component,
>>> -       float *dest, const float *src, const float *mask, int n_pixel=
s,
>>> -       combine_channel_t combine_a, combine_channel_t combine_c)
>>> ---
>>> -2.44.0
>>> -
>>> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/r=
ecipes-graphics/xorg-lib/pixman_0.42.2.bb
>>> index 88eef50f7b..3c55c1705a 100644
>>> --- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
>>> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
>>> @@ -9,7 +9,7 @@ DEPENDS =3D "zlib"
>>>
>>> SRC_URI =3D"https://www.cairographics.org/releases/${BP}.tar.gz \=20
>>> file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patc=
h=20
>>> \ -=20
>>> file://0001-pixman-combine-float.c-replace-force_inline-with-__.patch=
=20
>>> \ +=20
>>> file://0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patc=
h=20
>>> \ "
>>> SRC_URI[sha256sum] =3D "ea1480efada2fd948bc75366f7c349e1c96d3297d09a3=
fe62626e38e234a625e"
>>>
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202246):https://lists.openembedded.org/g/openembedd=
ed-core/message/202246
> Mute This Topic:https://lists.openembedded.org/mt/107249106/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------t9ThL2MqaTRp9PJoMlm0b0Vq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46J2QJfv024404

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 7/19/24 10:37, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:17E37CC38EA33E18.22972@lists.op=
enembedded.org">
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 7/18/24 21:16, Ross Burton wrote:=
<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:135B34F4-47F3-48E5-9AE6-9CE0C=
7F6DE38@arm.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes =
from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Can you submit this to pixman=E2=80=99s gitlab repository as a MR?

<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedesktop.org=
/pixman/pixman/-/merge_requests" moz-do-not-send=3D"true">https://gitlab.=
freedesktop.org/pixman/pixman/-/merge_requests</a></pre>
      </blockquote>
      <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><=
span class=3D"ryNqvb">Sure</span></span></span>, I will send out
        the link after done. <br>
      </p>
    </blockquote>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedesk=
top.org/pixman/pixman/-/merge_requests/103">https://gitlab.freedesktop.or=
g/pixman/pixman/-/merge_requests/103</a></p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:17E37CC38EA33E18.22972@lists.op=
enembedded.org">
      <p> </p>
      <p>Thanks</p>
      <p>Ross<br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:135B34F4-47F3-48E5-9AE6-9CE0C=
7F6DE38@arm.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">Thanks,
Ross

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On 16 Jul 2024, at 10:49=
, Changqing Li via lists.openembedded.org <a class=3D"moz-txt-link-rfc239=
6E" href=3D"mailto:changqing.li=3Dwindriver.com@lists.openembedded.org" m=
oz-do-not-send=3D"true">&lt;changqing.li=3Dwindriver.com@lists.openembedd=
ed.org&gt;</a> wrote:

From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.li@windriv=
er.com&gt;</a>

Previous patch works on fedora40 with gcc-14, but not works
on ubuntu2004 with gcc-9. Update the patch to fix the do_compile
failure:
   In function =E2=80=98combine_inner=E2=80=99,
       inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../p=
ixman-0.42.2/pixman/pixman-combine-float.c:655:1:
   ../pixman-0.42.2/pixman/pixman-combine-float.c:370:5: error: inlining =
failed in call to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_l=
ight_c=E2=80=99: function not
considered for inlining
     370 |     combine_ ## name ## _c (float sa, float s, float da, float=
 d)

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.l=
i@windriver.com&gt;</a>
---
...loat.c-fix-inlining-failed-in-call-t.patch | 56 +++++++++++++++++++
...float.c-replace-force_inline-with-__.patch | 36 ------------
.../xorg-lib/pixman_0.42.2.bb                 |  2 +-
3 files changed, 57 insertions(+), 37 deletions(-)
create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-comb=
ine-float.c-fix-inlining-failed-in-call-t.patch
delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-pixman-comb=
ine-float.c-replace-force_inline-with-__.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-fl=
oat.c-fix-inlining-failed-in-call-t.patch b/meta/recipes-graphics/xorg-li=
b/pixman/0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch
new file mode 100644
index 0000000000..5c79754e50
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-f=
ix-inlining-failed-in-call-t.patch
@@ -0,0 +1,56 @@
+From 1e32984ccd58da1a66ca918d170a6b1829ef9df2 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.li@windri=
ver.com&gt;</a>
+Date: Tue, 16 Jul 2024 15:31:16 +0800
+Subject: [PATCH] pixman-combine-float.c: fix inlining failed in call to
+ always_inline
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Refer [1], always-inline is not suggested to be used if you have indirec=
t
+calls. so replace force_inline with inline to fix error:
+In function =E2=80=98combine_inner=E2=80=99,
+    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pix=
man/pixman-combine-float.c:655:511:
+../pixman/pixman-combine-float.c:655:211: error: inlining failed in call=
 to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=99=
: function not considered for inlining
+
+[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzi=
lla/show_bug.cgi?id=3D115679" moz-do-not-send=3D"true">https://gcc.gnu.or=
g/bugzilla/show_bug.cgi?id=3D115679</a>
+
+Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html" m=
oz-do-not-send=3D"true">https://www.mail-archive.com/pixman@lists.freedes=
ktop.org/msg04812.html</a>]
+
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.=
li@windriver.com&gt;</a>
+---
+ pixman/pixman-combine-float.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float=
.c
+index f5145bc..f65eb5f 100644
+--- a/pixman/pixman-combine-float.c
++++ b/pixman/pixman-combine-float.c
+@@ -261,7 +261,7 @@ get_factor (combine_factor_t factor, float sa, float=
 da)
+ }
+
+ #define MAKE_PD_COMBINERS(name, a, b) \
+-    static float force_inline \
++    static float inline \
+     pd_combine_ ## name (float sa, float s, float da, float d) \
+     { \
+ const float fa =3D get_factor (a, sa, da); \
+@@ -360,13 +360,13 @@ MAKE_PD_COMBINERS (conjoint_xor, ONE_MINUS_DA_OVER=
_SA, ONE_MINUS_SA_OVER_DA)
+  */
+
+ #define MAKE_SEPARABLE_PDF_COMBINERS(name) \
+-    static force_inline float \
++    static inline float \
+     combine_ ## name ## _a (float sa, float s, float da, float d) \
+     { \
+ return da + sa - da * sa; \
+     } \
+      \
+-    static force_inline float \
++    static inline float \
+     combine_ ## name ## _c (float sa, float s, float da, float d) \
+     { \
+ float f =3D (1 - sa) * d + (1 - da) * s; \
+--
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-fl=
oat.c-replace-force_inline-with-__.patch b/meta/recipes-graphics/xorg-lib=
/pixman/0001-pixman-combine-float.c-replace-force_inline-with-__.patch
deleted file mode 100644
index cae201629f..0000000000
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-pixman-combine-float.c-r=
eplace-force_inline-with-__.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 49a1644015d073829c17dcd977aab6fdda1ebdee Mon Sep 17 00:00:00 2001
-From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.li@windri=
ver.com&gt;</a>
-Date: Fri, 5 Jul 2024 07:33:44 +0000
-Subject: [PATCH] pixman-combine-float.c: replace force_inline with __inl=
ine__
-
-Refer [1], always-inline is not suggested to be used if you have indirec=
t
-calls. so replace force_inline with __inline__ to fix error:
-In function =E2=80=98combine_inner=E2=80=99,
-    inlined from =E2=80=98combine_soft_light_ca_float=E2=80=99 at ../pix=
man/pixman-combine-float.c:655:511:
-../pixman/pixman-combine-float.c:655:211: error: inlining failed in call=
 to =E2=80=98always_inline=E2=80=99 =E2=80=98combine_soft_light_c=E2=80=99=
: function not considered for inlining
-
-[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzi=
lla/show_bug.cgi?id=3D115679" moz-do-not-send=3D"true">https://gcc.gnu.or=
g/bugzilla/show_bug.cgi?id=3D115679</a>
-
-Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://www.mail-archive.com/pixman@lists.freedesktop.org/msg04812.html" m=
oz-do-not-send=3D"true">https://www.mail-archive.com/pixman@lists.freedes=
ktop.org/msg04812.html</a>]
-
-Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.=
li@windriver.com&gt;</a>
----
- pixman/pixman-combine-float.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pixman/pixman-combine-float.c b/pixman/pixman-combine-float=
.c
-index f5145bc..52400f4 100644
---- a/pixman/pixman-combine-float.c
-+++ b/pixman/pixman-combine-float.c
-@@ -44,7 +44,7 @@
-
- typedef float (* combine_channel_t) (float sa, float s, float da, float=
 d);
-
--static force_inline void
-+static __inline__ void
- combine_inner (pixman_bool_t component,
-       float *dest, const float *src, const float *mask, int n_pixels,
-       combine_channel_t combine_a, combine_channel_t combine_c)
---
-2.44.0
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.42.2.bb
index 88eef50f7b..3c55c1705a 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -9,7 +9,7 @@ DEPENDS =3D &quot;zlib&quot;

SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://www.cairog=
raphics.org/releases/${BP}.tar.gz\file://0001-ARM-qemu-related-workaround=
s-in-cpu-features-detecti.patch\-file://0001-pixman-combine-float.c-repla=
ce-force_inline-with-__.patch\+file://0001-pixman-combine-float.c-fix-inl=
ining-failed-in-call-t.patch\" moz-do-not-send=3D"true">&quot;https://www=
.cairographics.org/releases/${BP}.tar.gz \
           file://0001-ARM-qemu-related-workarounds-in-cpu-features-detec=
ti.patch \
-           file://0001-pixman-combine-float.c-replace-force_inline-with-=
__.patch \
+           file://0001-pixman-combine-float.c-fix-inlining-failed-in-cal=
l-t.patch \
           &quot;</a>
SRC_URI[sha256sum] =3D &quot;ea1480efada2fd948bc75366f7c349e1c96d3297d09a=
3fe62626e38e234a625e&quot;

--
2.25.1




</pre>
        </blockquote>
      </blockquote>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#202246): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/202246">https:/=
/lists.openembedded.org/g/openembedded-core/message/202246</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107249106/3616873">https://lists.openembedded.org/mt=
/107249106/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------t9ThL2MqaTRp9PJoMlm0b0Vq--

