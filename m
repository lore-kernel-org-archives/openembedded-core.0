Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD90D32D94
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 11:21:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.84810.1731410488577665808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 03:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10463b4f15=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC6c6fs006849
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 11:21:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtu8du3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 11:21:27 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ACBLRPN001658;
	Tue, 12 Nov 2024 11:21:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtu8du0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:21:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+sJI1AGGMac3PScRwSkn3QFrpTB2DZKcAJgw/kq5K0RV86dCTGCrnMHE+Xuwbr7NMXXZ0RPmCz5Tx3ji5NaY7D2G3llhKAoS+1mdEcYactgqlxP8I18VJI9vv42HcoqCUtidtkDA+t22SDgI9zbcIEGq04Ly8Nh0yOAfWNVnTlx7pSoAE0h0YoGwCPAkQwrqnY0Nabs2NI1Sn3csBaOrlv3ymgXAW9ioxSR3W9kQ/Xbp3I8RLYR7R20j7oc+1tpIm1+GW/783RP/UZiCUmzd1oOgjinwv81tBrdMWktIibeIDRcDyN+CIhkzfD4QzxFLxiNFDD5f8IsXFDnTOZ+qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmPwUBTw9MR8wcfXkigbicb/pj+T5RgDS67ozhmYmxs=;
 b=BT6SXW8SZ03RpBqr7vfVwqR0u3Nca/3yD0AZx0lcYsMTlRhsvoak4a60i/DqfDOUfBuoNUVYPgr+U1WMjwsSirH2x3kfHzomecnnt5io5PWgRAw/zUSiG3qsOApDc/E/brumM6az/FwC3xwyUff5JURlkTu3QEqJxYz8Nx3cP5UEUzx0dnQfNG8J25B0khLT+SZw45svPGwIHcsyQLW5rcNYy0SMBQLrLtjpc8xJ9ARr5+cyVGd/2TDoCE75v063XoLEbcjrmLo2ka96xN5G9XJ5gkr+KorOH0dPiSv+azk0CGKx0x7jiJYGM0jh7ihfeFTsre1Kd3GX7PBh9onWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 12 Nov
 2024 11:21:23 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 11:21:23 +0000
Message-ID: <dd5d6c68-613a-4ea3-96a1-162bd6b73cdd@windriver.com>
Date: Tue, 12 Nov 2024 19:21:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] bootchart2: Fix native build
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1731341964.git.liezhi.yang@windriver.com>
 <6890ffe7090972af68b585b0a130b29bbc700548.1731341964.git.liezhi.yang@windriver.com>
 <6591CDFE-6ACD-4BD8-9C3D-D8F59C009D17@arm.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <6591CDFE-6ACD-4BD8-9C3D-D8F59C009D17@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::7) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 2481378c-4972-409b-21ee-08dd030c23bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d1paaHdkZm1GOFJsd2dGZ0V1aERsUlk5WW1hR29hSVdNSGJxL0UzNjhQdkdB?=
 =?utf-8?B?amY0ZnJ1eXU2L0NNb3pvSlFFd25kQ0J5S1d6NmNXMG9pejVrVGloN0lUSmMx?=
 =?utf-8?B?QjIzS0dEZ2sxQ3FTZk9SdkVIQjEvdFlWMDRQNE5STXNPMFVrU1J0ZlRWbm5t?=
 =?utf-8?B?ZW1lYnlRK1dPRmNHOCtLYmRIWUo5cUdQQlhwT2UvcVVGL2EvbFRtSDk1RGJu?=
 =?utf-8?B?TFR4b2hZcW45MDZkU0tzVG8rWGxQVllsRUZUa3VhTC83VWN0N1FrNExNekdU?=
 =?utf-8?B?WTBjNHdDWGk5aEVTcXd6M2JJRERENHQrVWVWc3Q2ZUVCVER4aW9xVUR5SzJ0?=
 =?utf-8?B?MFBnMDVIRXV6T2FlTGp2b3dJQlZhOEpLYUJLbXlmcDM3TEswYURFV2RZcWtU?=
 =?utf-8?B?YVMrelgzblg1MFpKdnBlMkVQNkcxSDlvZGdjcFprVzFteUY1bDNxUnVhejNB?=
 =?utf-8?B?ZHplbWwydThTYzA0MjJtOFZzbUNnS3BHYmxhVVJwRVZTYTB1NzRkYVYvUjMw?=
 =?utf-8?B?Rmhic3FCRWhDRDROMXlxb1RvOW5RajFiMUR5ODUxczlma0puQzNSTHhUbm9M?=
 =?utf-8?B?ZnpESE54UUYrVzZSMjFzLzl5YUtWbFlHV2VLRUMvVDJobjN5eHdZSzY0MWVm?=
 =?utf-8?B?d1h4MkZPMWUxeGtWTWlUeFpkTStnT3pPUWhYVDdsSXZUVWpZWmtNQlUvZHhL?=
 =?utf-8?B?TTIza1JpSFFoVGpGeUg4RXRZaUtFcFVIZ1FXNkFLNUpMS1VNYlpDMHFFaE55?=
 =?utf-8?B?U25hWWlNWmg3NFpBY2Z0MTJpbUVnd2p3UUNmcjB1QkhESms5RXQxK29GWStt?=
 =?utf-8?B?VEZ1Qng3VSs5MWlRQ2J3b1JLSUJpZWpqeGNwbStXYlpwc2ZzdWczK1RZYlla?=
 =?utf-8?B?WFpBaW81Vm9LV0lURThzYmY1L29JSUJlRGtRWXVEVXIyYURkUmNISVJpQzZY?=
 =?utf-8?B?YUl5K3JxUUlicGRRSGlabmo4T1M5aFFUN1VyUHNRZDBwcDNzRjRrcHlkaTVW?=
 =?utf-8?B?Si9qMW5SNjZnZ1AyY2JEL0V3eHpucFExRzA1ZWJNeVNPWlI0bUZIN0kxV1lP?=
 =?utf-8?B?OHIwSm13ZjRsMWlkOTJkcS82SDVMeU5NWExFNDRUeTlvMlhkRE1RSldBbDlQ?=
 =?utf-8?B?cEJnSmdHN1BJQVVrdytGMUM0YkV6L2wrSHh4R2hKNk03Rk5Qbk5aTXlaQTZS?=
 =?utf-8?B?NDVGK2lxdU51QWFyUUQrdkl0SkZTZit2S2duRjI3SitqaHRyR3pLSUZxaEo5?=
 =?utf-8?B?ZmxnV2xTNWlyd2VkWjZEejN1OHdvUFN1eW9VZUM2K1ZoT3RycjkvaWNFa24w?=
 =?utf-8?B?Rnhzc1NOeVNnaWhWUkVYUnU4enZFdFhnY212ZnJIZzBHSmxOd1hLUjFKZm9D?=
 =?utf-8?B?aFZjbzBYajVLQzZxNVNZOWN6bVN4V2l4NVlXdXk5R0lYcE1RcTdUWE8xR2d5?=
 =?utf-8?B?cFlFcTBCS0pTL3JJd0Z2K1NjeHBvc1VJYmN4SzJqc3duZHBmTmxWbE5SdEE4?=
 =?utf-8?B?QXMybGc4R3FsdStCYzR1SGpjQ3JHMUR1MGNONVl1RG5QanlHenhzMHF2NkNG?=
 =?utf-8?B?eDdoRDlHdkRFL29MSEdvWFZLSncrb0RaT1ZWUkZzaUN4ZjVRSHE3WEdpTVg0?=
 =?utf-8?B?eXZCRHVwQmoxbVFCZHQ5U1JWek5EU0hPSE12U3FRRnBOcnRXaFpJdXhiWjBB?=
 =?utf-8?Q?LaWZzpfHjeHR8/P2km86?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YldUMElpeEdUeDA4eVA5SHhObklyZUJzVFdMeE80UW9mV1BHQ0E5ZGd3Mjd3?=
 =?utf-8?B?ODdIWllsQm1nb2xRL2cwNnR4VEl1dlVPRVBKZWl6d09XbXhUcGRzTUUybFRr?=
 =?utf-8?B?OG5UY3V1dHBCOTE2eFYxWnhOWkJNdUNQdnpVamJLMGJjZGdZdXpFVWV5Ukp2?=
 =?utf-8?B?U0pLRlZKQWV5cEppZUd0aHBrVmpMWEUvbTR4cFQxUXZYcTBiVUJmVjBFM0pY?=
 =?utf-8?B?Vy9JaG1JZWRqL3dZVUhJbGF5Y1g4Uk1rWmFobHpnUXdrRFBMSTVBMGd6NXBV?=
 =?utf-8?B?S3AzRGpZSU1QRXdwTTU0NnJ2SzJWQmZzRlRmM093LzIvaERTblNlSmxxQjNp?=
 =?utf-8?B?VmtVT3F6YXQ1amtQc1krZUFCMHNMZ0doajNHVjJpdVdZNXU4WkRyUjVad09D?=
 =?utf-8?B?OS8wL2gyWjNHc2hFQW1KUmpMa1hOaGgrdW40Q2ppWjhSc2RiUUQyQS9Dem94?=
 =?utf-8?B?d2RRaGJjaERWaEVhUmtCWmxsclFOQ1JUcGJ2Z2NoZm0zM3lpSHRtNlF5MEJi?=
 =?utf-8?B?WGZCR0pUTEg5Z2Y0S1ZTTys3Ykh1VGFsbEdVdmt4YkR1ZVh0NDltbEVPQ2NC?=
 =?utf-8?B?bDdlZlk0NjJYY2tpQTdhTXIrekczSFdCSUo5ZXlKQlVuRnJsWWcwd1NPRG0z?=
 =?utf-8?B?WE9uMGNteUNxTlczY0ZPQ1JPWHRheWd2OGFKWlhCK0loR0NWSzkrVFRVWWJZ?=
 =?utf-8?B?dU1XSVFTSDhSRG9DcEdYdW1oY0QyTGpkczU5VFZTV0FNU1k5cEhBQUpqODM3?=
 =?utf-8?B?UnNiQWwxei9QY3FaMEJtc29jKzZKcFhDV3ppOENkaGp5cE80bk9DSVVscWFC?=
 =?utf-8?B?Yk5GOEs3MEpSWHJwRzZFMGhKVHIyTEZYckNFWTN5VExCQy9RL2xvcVB0OXhK?=
 =?utf-8?B?ZDcyNnVnUkp1dGxuTkZwMm96MGxYTll1YW5qNUY4L1k3UG9kbml4M0NEdWp0?=
 =?utf-8?B?OU9pMTRQV0xjRnZ0RTNURGdvSzNuWXh3UWt3bzdRUWhaQnc0ZSt6aHZKSXVR?=
 =?utf-8?B?VHdMSFpLcDA3RlZKVEVVOENXUXV4bGFYMlcyN0lwNFpjTVFieUI4L3FPOG8w?=
 =?utf-8?B?eEZHTzQ1d1orYXR3MDdIT0lBY3gwWEdwb25BdEhWWjluN1JoWEpIckZodTUy?=
 =?utf-8?B?NVZLZTRFYnF2OTdUZjU0ajZzazdQWk1zKzM0L2JobURsOU51OWhYV0Q2T1VC?=
 =?utf-8?B?WjJ1UHRzald2WTFuNFRaMUd3K29vZjFyUzZGYTNJOEs3SVZYLzVBdHdlTlFF?=
 =?utf-8?B?aFRNKy9rSUdDWURGK3hWMW51OGd1R2VzSXVvWFN6RnoyRzAyL3BHV3p2WFVR?=
 =?utf-8?B?RFZXUWxScVdmanJXbXZhYzZoWTlGUGh3dGg3OGYzN2tEM3o5QVRvT3c4aXNP?=
 =?utf-8?B?cmhiOWJicE9PYXArR242ZUNwSEFnMmdJZzdZaXNGY3drSzJrRHF1eXhMZDJt?=
 =?utf-8?B?Y2lIODBnQm1jdWorSCtqZmRXUmpKZHcwNzZCK1BRV3pMai82eW03ZkUwbTRZ?=
 =?utf-8?B?cDRBclB4Y1pKaXRkaEhzYlJVcWtScGRJNGgvbkNXUnpZNnRWWUwxMk9DSDZY?=
 =?utf-8?B?dEFCNzNzTGFzN2JITWxvQkdzZEd0TzZVYU1mZVFuS2djbHRHT0QvYjIvdEpH?=
 =?utf-8?B?d04yMG5TZTJBWDgxOFpGYXVEUzIwZzZWQ25GYlEzR3pjVUViL2d4dVNGSFBV?=
 =?utf-8?B?ODU1aGs3RmEzdHdIVXhGYWxIbzd5N2RoT2dER3JFbGQ2Q2MvRm55a1RZcVo5?=
 =?utf-8?B?Z2tId0NYazRUclR0OEd5bHlINjdJdnEwTWJxVElYYzgxNVQ2dEh4dXhvSmY4?=
 =?utf-8?B?eDl4MzJvdTM1R0Q0U0x6d1pOT1dwREJGcFN4UlNDVW5JTnBmc1VPMWt0R0Y3?=
 =?utf-8?B?YWZoQkZEQzM0aFFRUWVGWGF1cEhBck93L3ExQ2RPWXkvKy9aWC9SaTZROHhK?=
 =?utf-8?B?OWJ4UXN3UW9JdDNqOE1obEFDaGhaSzJaSjJ1blFtbHdwd2gzeSt1RHJuM29t?=
 =?utf-8?B?VVlzTHNsS09JTGJBTXk3NWNmcFArS3BhU2gwRjNnRzkrS2VGbnNZbEpIZjJ1?=
 =?utf-8?B?YjJBZmE2QVREYkJLNUNha2gzRUo5TUo2Z3hrMmNLeENud2FGMHJMSjlhc1J2?=
 =?utf-8?B?OG1RYlpqVXRWWWFvM0NaRDNYNkZQS0pYbjlLY1RXc05GTlU5bFdxLzdUdVdF?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2481378c-4972-409b-21ee-08dd030c23bb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 11:21:23.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BS7qJr79xK5IB40iOZURQc6xzuHpsIdPLcCmoi4UrfBw3kD/toMu7lSFSqjL6V8764fVpHNtUfzPEwNlV6OPpwdyeVpcESYufosQMo6tXSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
X-Proofpoint-GUID: 1-eogMu44-Fn_-HZauzQz6G7gTXs5wg3
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=67333a37 cx=c_pps a=AHWEOuZXH7ukEk4XErmcRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=aQSSbTCLAK8KtIWhtM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: O15cJIUPYNmmDAFidysufFqHN3gKf1fS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_05,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 spamscore=1 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=1 mlxlogscore=218 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411120092
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AC6c6fs006849
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 11:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207043



On 11/12/24 19:02, Ross Burton via lists.openembedded.org wrote:
> On 11 Nov 2024, at 16:20, Robert Yang via lists.openembedded.org <liezh=
i.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Fixed:
>> $ bitbake bootchart2-native
>> gzip: /path/to/bootchart2-native/0.14.9/recipe-sysroot-native/usr/shar=
e/man/man1/*.gz: No such file or directory
>=20
> The question is why does the manpage not exist in native builds, when t=
here=E2=80=99s nothing in the makefile or recipe to disable the manpage.
>=20
> /work/ross/build/tmp/work/aarch64-linux/bootchart2-native/0.14.9
> $ find image/ -type f
> image/etc/bootchartd.conf
> image/work/ross/build/tmp/work/aarch64-linux/bootchart2-native/0.14.9/r=
ecipe-sysroot-native/etc/bootchartd.conf
> image/work/ross/build/tmp/work/aarch64-linux/bootchart2-native/0.14.9/r=
ecipe-sysroot-native/etc/init.d/bootchartd_stop.sh
> image/work/ross/build/tmp/work/aarch64-linux/bootchart2-native/0.14.9/r=
ecipe-sysroot-native/sbin/bootchartd
> =E2=80=A6
> image/work/ross/build/tmp/work/aarch64-linux/bootchart2-native/0.14.9/r=
ecipe-sysroot-native/usr/lib/python3.13/site-packages/pybootchartgui/__in=
it__.py
> image/work/ross/build/tmp/work/aarch64-linux/bootchart2-native/0.14.9/r=
ecipe-sysroot-native/usr/lib/python3.13/site-packages/pybootchartgui/gui.=
py
> image/usr/share/docs/bootchart/README
> image/usr/share/docs/bootchart/README.pybootchart
> image/usr/share/man/man1/bootchart2.1.gz
> image/usr/share/man/man1/bootchartd.1.gz
> image/usr/share/man/man1/pybootchartgui.1.gz
>=20
> It=E2=80=99s because the install is broken, more paths need to be given=
 to the makefile.  Fix the cause, don=E2=80=99t work around the symptoms.

You're right, I just fixed it by hand. I will send a V2 for it.

// Robert

>=20
> Also adding -n to the gzip calls in the Makefile would make the resulti=
ng files reproducible, so we don=E2=80=99t need to decompress them.
>=20
> Ross
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207042): https://lists.openembedded.org/g/openembed=
ded-core/message/207042
> Mute This Topic: https://lists.openembedded.org/mt/109517754/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
liezhi.yang@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

