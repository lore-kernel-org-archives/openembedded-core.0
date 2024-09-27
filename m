Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAE5CDE02F
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 12:28:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.67840.1727440092330509361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 05:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=90002633a0=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RBpo7x013099
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 05:28:12 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um554pvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 05:28:10 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48RCSAew000542
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 05:28:10 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um554pvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 05:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHjA5oJr013nMIbq7y5fQ+7CGxUQKxQddIEqvocXdvPW+/mjWMhaTTdOa8TReBovZDq0MDJ7IH8fi/+mdsVa9MQnyuJwanR7YOJTyos0Jdif31Y7csT2CO67asCUBacKv8aRTFaeu1MFpgTL2suzGSP0oJJSh4ehMW989jL48lPZrH/F8eunNVROjaRL9dLwcI9keJ4IS+cD0e9Nuaq1peYyDEoQlnzlNNJsJ88wIgEMnfQssLdV3IN9bzZhUJoDo8FRWVrdbTUNkCw0AATzE2jqKN0qp6aLAH/FCtvGht5G6Y6njGgKsBH4FydyGOmJgpLaaraEJm6XCwfvowFbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K0YjxsayBWrv+UXNOBF6Eq4OxBn1GEg0M+XlHqDsUI=;
 b=sBW8znE8AH27FStWwAtcshCMnlT3GiEVzgA7PgOWEdp35DQ4RNOWF3ImKQx32rSFW17kEMNB9jApa2QyLQlZOQDbBzqLuCLZp6Btl0z97UKOjdAyfm5g2MTET3zpd7zbPjIZR8lSPdazgWSA5u9ncedZula/Rwtnl08wmqP1HHvFh5FDfUYu6b0rKgrIe3ZDaU4RGo1ysOAy2TxQemYI2PSQCaf40behaF6JHqqO5aDz+DtDiLzt6deAxdSozjy/W3zfs1/EHLaJ0yL7tIH44nQATQ+6AenRu9Neb6Uo8K6z1C/Ml2yjsNH2LREY6xdhFu8m8XzP9MNLXDSnWcjpQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 12:27:57 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 12:27:56 +0000
Content-Type: multipart/alternative;
 boundary="------------UmCbEU7v2GyRidbvc7yAFc8e"
Message-ID: <e40e58d8-bc15-4c39-be8c-37e8d78e3214@windriver.com>
Date: Fri, 27 Sep 2024 08:27:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] gcc: upgrade to v11.5
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20240927110310.2580951-1-Deepthi.Hemraj@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240927110310.2580951-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: YQBPR0101CA0270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::7) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef77c05-1eeb-4311-26c7-08dcdeefd0ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YTR6cUhGdXE1QmlEdExWejQrdUxmaktKL3RPUnZJL2Y3RHlNV05tOXAvMjJ4?=
 =?utf-8?B?VXJreTZjd2R6NmE5WE9ES1VFanhxNWR2VEVFUHhkbGh3SFlERVFkdlpHTVJq?=
 =?utf-8?B?QzJkekdETzBFVnlHcDA5L2NaUHZDQ0hwYlJNVlZpYkhlckN6NjZoL0VGSDc3?=
 =?utf-8?B?WHFVbHV6WVhjOVpuSllPQnE4eFBWSnVCZHhvU1NONDFzbFkvdWRSamJaWm1N?=
 =?utf-8?B?ZzUvZi81ZXZQS0cxVFEzTks2dlNnT1B4NlZpbnUwSU00cmZEajdQZnJ2djdx?=
 =?utf-8?B?RjNvWSt5Zys0NW1TcWRUV29NU3F2RkVYUFkySEFya1ZPV3FGcHdlQU1FSmh0?=
 =?utf-8?B?dkVoZ2FheFA2L0hUdVVlaUc0bytzNm1wQ284UlVYazg2R29zY0JCNGhoMjF4?=
 =?utf-8?B?UXY1WU1Wc3RmRnZiQUQwZFlSb3ZzdEp0NUhPRXNVWHh0dXNENVNQeXRqM1lr?=
 =?utf-8?B?Mk5ZeGFHWEpyd2pVM25SVTZHbHFDaWJneUZDM3cyQWhzY3RoQWdMcEV6ZVJ0?=
 =?utf-8?B?VGx1cDVqdXI0eDdTRHJBV2Vsc0I1NjAzYmIyUEMyeUNZYzVRQ1NoelNmeENG?=
 =?utf-8?B?bWtpaytRbDBNT3hoSkFzMUNLWkx2NGlCb1J0UVV2WDNwOWQvUXMrMDlwMDAv?=
 =?utf-8?B?MUJwb25OOFRRMHJ1bjZ0V1V5R2Zac04ySjZtUjgzYmh4MjdETjJCeStJbEk2?=
 =?utf-8?B?NzZ4MUpmbExvZ2FMamNXU3ZleGdrOTF6bitkY3NUZ3RvNldoS2t1TGxxZUo3?=
 =?utf-8?B?cVJ1K2g3RTJsMkhCUytmczdFbUF0dTliK3dUbDFaTktHUWFuTHhjTDlIQ3JO?=
 =?utf-8?B?NW93TnRkNVIxanE0SlUwZnFxN0xxZWlrd1REb1JmVXN5RFR6bU9pdm53SGdn?=
 =?utf-8?B?eHZsME1vT3MyR1M0c3RHTmtWVnFjdFgvOXphQnhrcFZrbmMydDZGRC95dzY0?=
 =?utf-8?B?eDhVTkhaSkkyYUphdnZpZmdsV3FaVThJQmlMLzI3ZVhDNlhOQ01wMTFiZzlC?=
 =?utf-8?B?UGhKcTVQd1p5TFVZZzlnWC9SUkdkdkEwOThWUG96dXNRUXM2OCtjLytKeEtH?=
 =?utf-8?B?VzFYb3ZZbE1JcVJYWGpmTnRLTFVQMW4yRncyOFJrSXVNSkx3VjJkQkxPVUpY?=
 =?utf-8?B?UEVSaVhWR2xCME9wYjNHajhWM3RkSFFzdHk2V2hNWGFQUldNSzNHU2dMcThE?=
 =?utf-8?B?SS94TzdHQ0hWbkRBVTVvTnluN1hjTnh3dENvd1RlQ3pBakdxbmF6c2tkY2Vr?=
 =?utf-8?B?bjVjeG1vYWlKd3lzMllJVkJuWk93SEN0WDRPbnZVVVl6YXVlTUdkcUMxYTVR?=
 =?utf-8?B?ZGFSMmZXV2VvZXlDdEkvT2dlejZMdUZjVmJTU3BPOEVvbVlzQWtNaVJFS0di?=
 =?utf-8?B?SlpBWE5tKzhPMmFOUzRsNjBlangzUWNObjB3Q0IyS0hpUGFLYkdsbjIvY05L?=
 =?utf-8?B?SncrRTVQT1pzNzdMWmkwQW1Pek5vNTR4TXVBd0lYOG82azJTaU0rRGxUQlhv?=
 =?utf-8?B?cXZ4cGc0M0NKaTNrc05UYVN1Vm9Femh2N0tzTUVhOGJkSTJmV1Q5c056bG9C?=
 =?utf-8?B?ZUhpSFFlR1IvZXhMK0ZWNG43bzZSaVhMNDlRdkdLN3JsenIyaCs2djZEQ1dz?=
 =?utf-8?Q?dur2Jb9tjPpvjc5iypDdx0bAzkm3c6/3L8mM3jhSUOFw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YU5MV09lSTRFU2ZyNUJ0VlRHbmVpYnE4TEZXcUcwVU1DWEFLc1BtS1RrRGFJ?=
 =?utf-8?B?eGpFL3p5MGlLZnV2OWx6YzNidVJHTVkxTnBzUW9xbUNFZ1hPYjhUdzNZVkZw?=
 =?utf-8?B?ZGo5cVRVVnpQdDAyN2FXRW5mZ2VWK3BBbERuK3dJL0l2V1NYQXpTcUN6UHFB?=
 =?utf-8?B?RFlzNXdQWkRYdHYzdXkyT3pyVU1PbXV6R3B0VVpyTGlpSkFiZU4rbUU2b3dV?=
 =?utf-8?B?WWJhcHJWSk5JaFBxektWYUV0QWVaUlp5blg0V3NBVGhadWN3bUhhYTVER2Js?=
 =?utf-8?B?N3JtN25BOFpUMEhDakptMlA0TStGTmd1bU5XbEVQcHN4NEsyMVltUmdmRkIy?=
 =?utf-8?B?dkRrK3BIbzRCaUhlczNlakEzeUk3K0dRVVI4WTFIQjNuU0xLbGdZcVk0S0RB?=
 =?utf-8?B?UUVCRks0M3lneDg5UExSUUdLbVZzMThYeTF1eFVXMUJmRzRZLzY3eXdNYTZF?=
 =?utf-8?B?ZkZWTjNyVVZORTFzaTdaZGhCWm9jdXRiaW93YzNoQ3EveXFBWHRzbHJVMjhN?=
 =?utf-8?B?QzhjZDRNKzZIWGtneU5KSUlyRU5jNGRIbHZqNW4vdVBTeDYxVVRLb21pVTVC?=
 =?utf-8?B?cFg0V3YrRDloT0NzN08vMkg5RzFZeHQ0cXl5NGpCKzNWcUxjaE1hdVpXQVVq?=
 =?utf-8?B?NXpMRjZRQkpPN0pBbWRPRVhOZ1JIOFVkMDErMGV3VFd5c1lpREdWb0Z1WE14?=
 =?utf-8?B?Q3h4YzdYa2NlN0dkSGJwU0s2aHQxMG1ualFGdXYveW1iWEpKTjE0YkJPUS9l?=
 =?utf-8?B?UlhmdmlBSDZjSk5scm5PRXF5dGtkVG1HV3lkUFdGb0pUMlZWN1ZIbVdGZzZO?=
 =?utf-8?B?blppYzFISHluNUdiMFRxZVBpZkNGd251dWFVNWtLVm9ONXlNZFNGN1EvY0s3?=
 =?utf-8?B?aGdQb1NsOHZidkNQbGV4NGhUd3czWFNIYW4wL2dBWHU1ZFVwNHVrU3RadUdi?=
 =?utf-8?B?OHAwSTF1dU8rSDdPeGs3aGZiWFJ5clFIVnZNTVQ3NjcyNmsrSkxnWW5pdEZD?=
 =?utf-8?B?aTcxczF5VVhkckNQK0tKK3MvdjNDN1RyNVhhaWVweVNqbzJDSXNMNkhraUNr?=
 =?utf-8?B?dzVEY01OR3J6OUpQdzcycDNUaExWV3doRGlhYXRMQ0VweVpMZXQ4bmt6Qlkr?=
 =?utf-8?B?cFg4RmhoWGZhbDZjSllxcm8rZVhOQ0FOZm5oeHZIV2RZczFUZDFVYzdwckRX?=
 =?utf-8?B?djJqSWVvUXJhb0tIUHRWR0tWMldYZ1d2YVdjbTE1dzR3eGxMeHRkNWlyZWdh?=
 =?utf-8?B?M3N3cG9pamRWa2tiZ0IrbmZBb1VITExEbFBBU3c4WjR0Rm1yeWl1MnJLY2Yx?=
 =?utf-8?B?b1BHb0pSeldCbnR6RnRDcmJza3JJVWxEQmlkTlN2clU4aDh0M3lzS1hOMVRS?=
 =?utf-8?B?b1BpTWxpMExRckUrQUhtbnRuSnQxN2ZleG51bjdHU0NxMytJLzJsNkZwblBF?=
 =?utf-8?B?ODRxQlZPTEt0dTZGZThMYWFXNG80N2Y3Q0NaNitzTmNZalRDK0M1aWpWbURx?=
 =?utf-8?B?K0VMcG1LQ1d1NVdveG1tWCtER2V2c2FqYjlXZG1YRURndUJhaXVvYi9NRHFT?=
 =?utf-8?B?ZUtLUXd5bXRGd2o2ZEZwcWk4alJ0SzlUWm5PZWRRYXh4cFpvOTJpVDl1VDdv?=
 =?utf-8?B?Nk0yZ1AxMWcrVXhUOTVENVVBQnpnaUs4RERtdG5sRVdCanpyTDFzWFBHR2Fz?=
 =?utf-8?B?VDdXR21BRlU5VDkwMlZvVTBwdzR3Q3R2amQyUUNvbFRERjNRUDUyWXEyUC95?=
 =?utf-8?B?bEtiOWcwaXMyOFhUVmZscGE2WWF5NnpYV0ZtckRhT3lRR0o5Q2VYYkJTVUor?=
 =?utf-8?B?M0R4TEQ0dVg4Nm91UXl2UUtLRkJLeXBYT1pyV1VOQmZ2eTd6SkdGMmhGTHFG?=
 =?utf-8?B?S1JFN3JqS3FVZ2w4ME5WS2x6WFhTNTZzQkRRY1BmQVpMbVg5Zlk4cG5MMmxY?=
 =?utf-8?B?VldWWjR6aW04UGhNcFoybWpTUHZUR2VRQmRBTHhjNEd6OUY5TWRSSnFTN0Qv?=
 =?utf-8?B?TFpiQnRDU1hrR2w3STJCcWIyYWkzVGhNYTYzMk11MzB6ckkzMFZIRm1RbWVn?=
 =?utf-8?B?L1JpWUF2dmNVUXJXSENiMHhuYmt0MkM5YUc3clNYVW5rb09HNU91aFRlYmxZ?=
 =?utf-8?B?Y2tYWkhqaTdFVVFRWkpEdzloSVdsUW9OenRoZ0lCTzgvNHRxRVVpUENuSGhF?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef77c05-1eeb-4311-26c7-08dcdeefd0ff
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 12:27:56.7278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaQBDBIxkqaBzqb76S0sntfyRwuYU8V5cqsAICmPWbVS6jq82hD/ekd8FaE/MFzZbpI/juH/KK4Fs53mgnQDFnY4CNE98bktYSPSraxJMqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
X-Authority-Analysis: v=2.4 cv=Z/q+H2RA c=1 sm=1 tr=0 ts=66f6a4da cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=iysP0mFVxqFZi8GODKMA:9 a=xHPcUc6DLI4wm71m:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rJJ2XIrOfN0A:10 a=5Es2Aalp1NQBGb4-EBUA:9 a=MmDWAzb8ge2Znp57:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: jb49VXPrznYGOzA76Tq64ErEifR6uWhs
X-Proofpoint-GUID: xlIPXrdZpgAJ3psSfUR3Xqm_OLwfLn3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_06,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409270090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 12:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205018

--------------UmCbEU7v2GyRidbvc7yAFc8e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48RBpo7x013099

On 2024-09-27 7:03 a.m., Deepthi.Hemraj@windriver.com wrote:
> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>
> gcc stable version upgraded from v11.4 to v11.5
>
> Dropped CVE-2023-4039.patch and 0001-aarch64-Update-Neoverse-N2-core-de=
fini.patch
> because its been taken to gcc-11.5 with below commits 75c37e0314 and 50=
d9db203bc
>
> For changes in v11.5 see:https://gcc.gnu.org/gcc-11/changes.html
>
> Below is the bug fix list for v11.5:
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&list_id=3D=
444046&resolution=3DFIXED&target_milestone=3D11.5
>
> There are a total 164 bugs are fixed in this release, below is the list=
 of bugs fixed excluding the regression fixes.
> ID      Product  Comp       Assignee=E2=96=B2       Summary
>
> 112672	gcc	target	     ubizjak	[14 Regression] wrong code with __builti=
n_parityl() at -O and above on x86_64
> 111736	gcc	sanitize    unassigned	Address sanitizer is not compatible w=
ith named address spaces
> 80899	gcc	ipa	     hubicka	[11/12/13/14 Regression] Devirtualization ca=
uses incorrect code generation with placement new in some cases
> 105301	gcc	c++          iains	[11 Regression] ICE: tree check: expected=
 tree that contains 'decl minimal' structure, have 'overload' in coro_pro=
mise_type_found_p, at cp/coroutines.cc:516
> 110027	gcc	middle-e     jakub	[11 regression] Stack objects with extend=
ed alignments (vectors etc) misaligned on detect_stack_use_after_return
> 110079	gcc	rtl-opt	     jakub	[11 Regression] ICE with -freorder-blocks=
-and-partition and inline-asm goto
> 110731	gcc	tree-opt     jakub	[11/12 Regression] Wrong-code because of =
wide-int division since r5-424
> 111015	gcc	tree-opt     jakub	[11/12/13/14 Regression] __int128 bitfiel=
ds optimized incorrectly to the 64 bit operations
> 112727	gcc	sanitizer    jakub	[11/12/13 Regression] UBSAN creates GIMPL=
E path with uninitialized variable
> 113674	gcc	c++	     jakub	[11 Regression] [[____attr____]] causes inter=
nal compiler error: in decl_attributes, at attribs.cc:776
> 114310	gcc	target	     jakub	[11 Regression] [aarch64] __sync_val_compa=
re_and_swap fails on __int128_t with newval =3D 0
> 114493	gcc	c	     jakub	[11 Regression] internal compiler error: in fld=
_incomplete_type_of with may_alias
> 114566	gcc	tree-opt     jakub	[11 Regression] Misaligned vmovaps when c=
ompiling with stack-protector-strong for znver4
> 114634	gcc	c++	     jakub	[11 Regression] Crash Issue Encountered in GC=
C Compilation of Template Code with Aligned Attribute since r9-1745
> 114691	gcc	c++	     jakub	[11 Regression] Bogus ignoring loop annotatio=
n warning
> 114825	gcc	fortran      Jakub	[11 Regression] Compiler error using gfor=
tran and OpenMP since r5-1190
> 114876	gcc	tree-opt     jakub	[11 Regression] -fprintf-return-value mis=
handles %lc with a '\0' argument.
> 114956	gcc	sanitizer    jakub	[11 Regression] Segmentation fault with -=
fsanitize=3Daddress -fsanitize=3Dnull -O2 when attribute no_sanitize_addr=
ess is enabled since r9-5742
> 106890	gcc	c++	     jason	[11 Regression] virtual inheritance triggers =
compiler error when instatiating derived class with in-class initializati=
on since r8-2709-g12659e10c7820071
> 111529	gcc	c++	     jason	[11/12/13 Regression] ICE on bool conversion =
in an unrolled loop condition inside template lambda nested in another te=
mplate scope
> 113598	gcc	c++	     jason	[11/12/13 Regression] GCC internal compiler e=
rror since r0-124275
> 114561	gcc	c++	     jason	[11/12 Regression] Comma operator with forwar=
ding reference to pointer raises invalid lvalue required error since r10-=
7410
> 114562	gcc	c++          jason	[11/12 Regression] ICE when trying to bin=
d rvalue reference to lvalue with comma operator and forwarding reference=
 to pointer since r10-7410
> 115565	gcc	rtl-opti     macro	[11/12/13/14/15 Regression] CSE: Comparis=
on incorrectly evaluated as constant causing optimization to produce wron=
g code
> 109876	gcc	c++        mpolacek	[11/12 Regression] initializer_list not =
usable in constant expressions in a template
> 110106	gcc	c++        mpolacek	[11/12 Regression] ICE on noexcept(noexc=
ept(...)) with optional
> 89224	gcc	c++	   pinskia	[11/12/13/14/15 Regression] subscript of const=
 vector has the wrong type
> 110386	gcc	tree-opt   pinskia	[11/12 Regression] ICE with ABSU in backp=
rop
> 111331	gcc	tree-opt   pinskia	[11/12 Regression] Wrong code at -O1 on x=
86_64-linux-gnu since
> 108120	gcc	target	   rearnsha	[11/12 Regression] ICE: in extract_insn, =
at recog.cc:2791 (on ARM with -mfpu=3Dneon -freciprocal-math -O3)
> 95048	gcc	libstdc+   redi	[11 Regression] wstring-constructor of std::f=
ilesystem::path throws for non-ASCII characters
> 104606	gcc	libstdc+   redi	[11 Regression] comparison operator resoluti=
on with std::optional and -std=3Dc++20
> 90348	gcc	middle-e   rguenth	[11 Regression] Partition of char arrays i=
s incorrect in some cases
> 96881	gcc	tree-opt   rguenth	[11 Regression] Clobbers on NULL vs. DCE s=
ince r8-1519
> 97990	gcc	c++	   rguenth	[11 Regression] ICE: =E2=80=98verify_type=E2=80=
=99 failed with vector types and non-PODs since r6-5222-gba6a6a1d44c17f25
> 103006	gcc	middle-e   rguenth	[12/13/14/15 Regression] wrong code at -O=
1 or -O2 on x86_64-linux-gnu by r7-7101
> 110176	gcc	tree-opt   rguenth	[11 Regression] wrong code at -Os and abo=
ve on x86_64-linux-gnu since r11-2446
> 110295	gcc	c++	   rguenth	[11 Regression] ICE in dwarf2out_finish with =
local class with inherited operator delete in a templated function and -g
> 110298	gcc	tree-opt   rguenth	[11 Regression] ICE at -Os on x86_64-linu=
x-gnu since r10-840
> 111039	gcc	tree-opt   rguenth	[11 Regression] Unable to coalesce ssa_na=
mes
> 111080	gcc	debug	   rguenth	[11 Regression] restrict qualifier causes e=
xtra debug info to happen
> 111472	gcc	tree-opt   rguenth	[11 Regression] Wrong code at -Os on x86_=
64-linux-gnu since r11-4563-gd0d8b5d836
> 111614	gcc	tree-opt   rguenth	[11 Regression] ICE at -O2: verify_gimple=
 failed since r14-2282-gf703d2fd3f0
> 111764	gcc	tree-opt   rguenth	[11 Regression] Wrong code at -O3 on x86_=
64-linux-gnu
> 111818	gcc	middle-e   rguenth	[11 Regression] ICE with __builtin_memcpy=
 with volatile and constants
> 111917	gcc	tree-opt   rguenth	[11 Regression] ICE in as_a, at is-a.h:25=
5 since GCC-7
> 112495	gcc	tree-opt   rguenth	[11 Regression] ICE: verify_gimple failed=
 (after vectorizer) with named address space (__seg_gs )
> 112505	gcc	tree-opt   rguenth	[11 Regression] internal compiler error: =
in build_vector_from_val, at tree.cc:2104 since r10-4076
> 112718	gcc	debug	   rguenth	[11 Regression] ICE: in add_dwarf_attr, at =
dwarf2out.cc:4501 with -g -fdebug-types-section -flto -ffat-lto-objects
> 112793	gcc	tree-opt   rguenth	[11 regression] ICE when building stellar=
ium (internal compiler error: in vect_schedule_slp_node, at tree-vect-slp=
.cc:9062)
> 114027	gcc	tree-opt   rguenth	[11 Regression] miscompile at `-O3 -fno-v=
ect-cost-model -msse4.2`
> 114734	gcc	target	   rguenth	[11 regression] RISC-V rv64gcv_zvl256b mis=
compile with -flto -O3 -mrvv-vector-bits=3Dzvl since r8-6047-g65dd1346027=
bb5
> 108086	gcc	rtl-opti   rsandifo	[11 Regression] internal compiler error:=
 in set_accesses, at rtl-ssa/internals.inl:449
> 113281	gcc	tree-opt   rsandifo	[11 Regression] Latent wrong code due to=
 vectorization of shift reduction and missing promotions since r9-1590
> 113552	gcc	tree-opt   tnfchris	[11/12/13 Regression] vectorizer generat=
es calls to vector math routines with 1 simd lane.
> 29256	gcc	target	  unassigned	[11/12/13/14 regression] loop performance=
 regression
> 82446	gcc	tree-opt  unassigned	[11/12/13/14 Regression] Missed equaliti=
es in dr_group_sort_cmp
> 93631	gcc	c         unassigned	[11/12/13/14 Regression] ICE on an inval=
id strcmp call in gimple_call_arg, at gimple.h:3258
> 93930	gcc	target	  unassigned	[11/12/13/14 Regression] Unnecessary broa=
dcast instructions for AVX512
> 94335	gcc	tree-opt  unassigned	[11/12/13/14 Regression] False positive =
-Wstringop-overflow warning with -O2
> 97140	gcc	target	  unassigned	[11/12/13/14 Regression] ICE in error: un=
able to generate reloads for since r10-400-gecfdb16c54ad06ac
> 100623	gcc	target    unassigned	[11 Regression] wrong code with -Os -fn=
o-dce -fno-defer-pop -fno-forward-propagate -flive-range-shrinkage -fno-r=
erun-cse-after-loop -mno-push-args since r10-7515-g2c0fa3ecf70d199a
> 100667	gcc	libstdc+  unassigned	[11/12 Regression] std::tuple<A&&> cann=
ot be constructed from A&&, if A not defined (only forward declared)
> 103497	gcc	c++	  unassigned	[11/12/13/14 Regression] ICE when decltype(=
auto)... as parameters
> 105034	gcc	target	  unassigned	[11/12/13/14 regression]Suboptimal codeg=
en for min/max with -Os
> 107057	gcc	rtl-opti  unassigned	[11/12 Regression] ICE in extract_const=
rain_insn, at recog.cc:2692
> 109800	gcc	target	  acoplan	[11 Regression] arm: ICE (segfault) loading=
 double with -mpure-code -mbig-endian
> 110288	gcc	fortran	  anlauf	[11/12/13/14] Regression: segfault in findl=
oc with allocatable array of allocatable characters
> 110585	gcc	fortran	  anlauf	ICE in gfc_compare_expr for findloc with co=
mplex literal array
> 110658	gcc	fortran	  anlauf	MINVAL/MAXVAL and deferred-length character=
 arrays
> 115611	gcc	target	  avieira	mve: vsetq_lane for 64-bits has wrong codeg=
en when setting lane 1
> 113893	gcc	ada       ebotcazou	finalization of object allocated by anon=
ymous access type designating local type
> 111050	gcc	libstdc+  fdumont	[11/12/13/14 Regression] ABI break in _Has=
h_node_value_base since GCC 11
> 110624	gcc	target	  iains	Xcode 15 ld warns about -macosx_version_min
> 114171	gcc	d	  ibuclaw	[13/14 Regression] gdc -O2 -mavx generates misal=
igned vmovdqa instruction
> 108789	gcc	middle-e  jakub	__builtin_(add|mul|sub)_overflow methods gen=
erate duplicate operations if both operands are const which in turn cause=
s wrong code due to overlapping arguments
> 110115	gcc	middle-e  jakub	[11 Regression] Wrong code at -O1 on x86_64-=
linux-gnu
> 110914	gcc	tree-opt  jakub	[11/12/13/14 Regression] Optimization elimin=
ating necessary assignment before 0-byte memcpy since r10-5451
> 111422	gcc	middle-e  jakub	Wrong code at -O3 on x86_64-linux-gnu
> 112816	gcc	target	  jakub	[11/12 Regression] ICE unrecognizable_insn wi=
th __builtin_signbit and returning struct with int[4]
> 113122	gcc	target	  jakub	Assembler messages: Error: operand type misma=
tch for `movabs' / bad expression / invalid use of register with -fprofil=
e -mcmodel=3Dlarge -masm=3Dintel
> 113192	gcc	libgomp	  jakub	[11 Regression] ERROR: couldn't execute "../=
../../gcc/libgomp/testsuite/flock": no such file or directory
> 113262	gcc	c	  jakub	[11 Regression] ICE when using [[gnu::copy("")]] a=
ttribute
> 114533	gcc	libquadm  jakub	libquadmath: printf: fix misaligned access o=
n args
> 114537	gcc	c++	  jakub	bit_cast does not work NSDMI of bitfields
> 114572	gcc	c++	  jakub	[OpenMP] "internal compiler error: in assign_tem=
p" with assignment operator and lastprivate clause
> 115172	gcc	sanitize  jakub	Invalid -fsanitize=3Dbool sanitization of va=
riable from named address space
> 115440	gcc	driver	  jakub	unrecognized command-line option '--c++17'; d=
id you mean '--stdc++17'?
> 110422	gcc	tree-opt  jamborm	asm goto vs SRA
> 92145	gcc	c++	  jason	-Wdeprecated-copy false-positive when inheriting =
base assignment operators
> 92407	gcc	c++	  jason	Destruction of objects returned from functions sk=
ipped by goto
> 103185	gcc	c++	  jason	[11/12/13 Regression] ind[arr] is rejected when =
arr is an array prvalue
> 106310	gcc	c++	  jason	[11 Regression] lookup after this-> seems wrong =
for dependent lookup since r12-6754-g30f2c22def739211
> 111357	gcc	c++	  jason	[11/12/13/14 Regression] __integer_pack fails to=
 work with values of dependent type convertible to integers in noexcept c=
ontext
> 114130	gcc	target	  kito	[11 Regression] RISC-V: `__atomic_compare_exch=
ange` does not use sign-extended value for RV64
> 113250	gcc	libstdc+  kmatsui	std::filesystem::equivalent("", "/") shoul=
d throw
> 115457	gcc	target	  ktkachov	AArch64 should define __ARM_FEATURE_BF16
> 115475	gcc	target	  ktkachov	AArch64 should define __ARM_FEATURE_SVE_BF=
16 when appropriate
> 88309	gcc	target    linkw	[11/12/13/14 Regression] ICE: Floating point =
exception (in is_miss_rate_acceptable), target assigning alignent of 4 bi=
ts(!) to vector
> 104259	gcc	libstdc+  marxin	libstdc++ fails for epiphany-elf
> 109822	gcc	libstdc+  mkretz	Converting std::experimental::simd masks yi=
elds an error
> 59465	gcc	c++	  mpolacek	[11/12/13 Regression] g++ allows direct-initia=
lization of an array of class type from another array in a mem-initialize=
r
> 100557	gcc	c++	  mpolacek	[11/12/13/14 Regression] Internal compiler er=
ror: Error reporting routines re-entered.
> 115642	gcc	c	  mpolacek	[11/12/13/14/15 Regression] internal compiler e=
rror: tree check: expected class 'type', have 'exceptional' (error_mark) =
in c_expr_sizeof_expr
> 95351	gcc	middle-e  pinskia	[11/12 Regression] Comparison with NAN opti=
mizes incorrectly with -ffast-math disabled
> 111699	gcc	middle-e  pinskia	[11/12/13 Regression] ICE: SIGSEGV: infini=
te recursion in fold_build3_loc/fold_ternary_loc/generic_simplify_VEC_CON=
D_EXPR
> 109761	gcc	c++	  ppalka	[11/12 Regression] Nested class destructor's no=
except specification incorrectly considered as too loose compared to the =
outer class
> 111485	gcc	c++	  ppalka	[11/12 Regression] Constraint mismatch on templ=
ate template parameter
> 113175	gcc	testsuit  ppalka	[11/12/13/14 Regression] testsuite/std/rang=
es/iota/max_size_type.cc 5x times slower
> 111407	gcc	tree-opt  qinzhao	[11/12/13 Regression] ICE: SSA corruption =
due to widening_mul opt on conflict across an abnormal edge
> 99327	gcc	libstdc+  redi	ENOTSUP macro does not exist on djgpp crt
> 104161	gcc	libstdc+  red	Potential Security Vulnerability: remove_all a=
nd symbolic link
> 105178	gcc	libstdc+  redi	[11 Regression] g++ incorrectly reports inval=
id use of incomplete type
> 108178	gcc	libstdc+  redi	Filesystem::copy_file can't copy from /proc o=
n Linux machines
> 112491	gcc	libstdc+  redi	std::deque<T,Allocator>::size xmethod output =
is wrong
> 114147	gcc	libstdc+  redi	[11 Regression] tuple allocator-extended cons=
tructor requires non-explicit default constructor
> 114401	gcc	libstdc+  redi	libstdc++ allocator destructor omitted when r=
einserting node_handle into tree- and hashtable-based containers
> 96109	gcc	testsuit  rguenth	[11 Regression] gcc.dg/vect/slp-47.c etc. F=
AIL
> 110182	gcc	tree-opt  rguenth	[11 Regression] Vector(2) cast from double=
 to float and back and subtraction seems to produce incorrect results
> 110200	gcc	middle-e  rguenth	genmatch generating questionable code with=
 convert and !
> 98237	gcc	ipa	  ro            gcc-dg-lto-modref-3-01.exe etc. FAIL when=
 LTO plugin is not enabled
> 97696	gcc	sanitize  rsandifo	ICE since ASAN_MARK does not handle poly_i=
nt sized varibales
> 100303	gcc	debug	  rsandifo	[11 Regression] -fcompare-debug failure (le=
ngth) with -O -fno-dce -ftracer
> 111340	gcc	target	  ubizjak	gcc.dg/bitint-12.c fails on x86_64-apple-da=
rwin or fails on x86_64-linux-gnu with -fPIE
> 115297	gcc	rtl-opti  ubizjak	[14/15 regression] alpha: ICE in simplify_=
subreg, at simplify-rtx.cc:7554 with -O1
> 115836	gcc	middle-e  ubizjak	ICE when building Firefox with-march=3Dpen=
tium-mmx -mtune=3Dpentium-m
> 91085	gcc	other	unassigned	[11 only] fixincludes breaks <bits/statx.h>
> 103183	gcc	c++	unassigned	[11/12/13/14 Regression] ind[arr] produces an=
 lvalue when arr is an array xvalue
> 105417	gcc	libstdc+unassigned	[11 Regression] powerpc64le-linux abilist=
 changes based on --with-long-double-format=3D
> 110309	gcc	target	unassigned	Wrong code for masked load expansion
> 111922	gcc	ipa	unassigned	[11/12/13/14 Regression] ICE in cp with -O2 -=
fno-tree-fre
> 112823	gcc	other	unassigned	[11 only] -Wincompatible-pointer-types erro=
rs in libiberty/simple-object-mach-o.c (missing backport for gcc-11)
> 112891	gcc	target	unassigned	[11/12/13/14 Regression] Missing vzerouppe=
r insert
> 114049	gcc	target	unassigned	gcc.dg/framework-1.c FAILs with Xcode 15.3=
 beta 3
> 114098	gcc	target	unassigned	_tile_loadconfig doesn't work
> 114521	gcc	target	unassigned	[11 only] aarch64: wrong code with Neon ld=
1/st1x4 intrinsics gcc-11 and earlier
> 115261	gcc	rtl-opti unassigned	[11/12/13/14/15 regression] FAIL: gcc.ta=
rget/s390/vector/vec-abi-vararg-1.c
> 115269	gcc	libstdc+ unassigned	Hardcoded links in 14.1 docs to pages fr=
om release 4.3.2
> 115870	gcc	tree-opt unassigned	Inlining of different template instances=
 wrongly produces infinite loop
> 103715	gcc	fortran	anlauf	[11/12/13/14 Regression] ICE in gfc_find_gsym=
bol, at fortran/symbol.c:4301 since r9-3803-ga5fbc2f36a291cbe
> 111837	gcc	fortran	anlauf	[11/12/13/14 Regression] Out of bounds access=
 with optimization inside io-implied-do-control
> 114474	gcc	fortran	anlauf	[11/12/13/14 Regression] DATA statement with =
derived type, pointer component rejected
> 113979	gcc	ada	ebotcazou	[11/12/13/14 regression] bogus error on alloca=
tor for array type with Dynamic_Predicate
> 103506	gcc	fortran	jvdelisle	[11 Regression] ICE in gfc_free_namespace,=
 at fortran/symbol.c:4039 since r10-2798-ge68a35ae4a65d2b3
> 107397	gcc	fortran	jvdelisle	[11/12 Regression] ICE in gfc_arith_plus, =
at fortran/arith.cc:654
> 91035	gcc	target	krebbel	[11/12/13/14 Regression] gotools fails to buil=
d on s390x-linux-gnu
> 84006	gcc	fortran	pault	[11/12 Regression] ICE in storage_size() with C=
LASS entity
> 89462	gcc	fortran	pault	[11/12/13 Regression] gfortran loops in code ge=
neration
> 93678	gcc	fortran	pault	[11/12/13 Regression] ICE with TRANSFER and typ=
ebound procedures
> 103312	gcc	fortran	pault	[11/12 Regression] ICE in gfc_find_component s=
ince r9-1098-g3cf89a7b992d483e
> 103368	gcc	fortran	pault	[11/12/13 Regression] ICE in gimplify_expr, at=
 gimplify.c:15668 since r12-4464-g017665f63047ce47
> 103716	gcc	fortran	pault	[11/12/13 Regression] ICE in gimplify_expr, at=
 gimplify.c:15964 since r9-3803-ga5fbc2f36a291cbe
> 106999	gcc	fortran	pault	[11/12/13 Regression] ICE tree check: expected=
 record_type or union_type or qual_union_type, have function_type in gfc_=
class_data_get, at fortran/trans-expr.cc:233
> 71703	gcc	fortran	unassigned	[11 Regression] [OOP] ICE in wide_int_to_t=
ree, at tree.c:1488
> 89925	gcc	fortran	unassigned	[11 Regression] Wrong array bounds from AL=
LOCATE with SOURCE or MOLD
> 99183	gcc	fortran	unassigned	[11 Regression] Incompatible Runtime types
> 99757	gcc	c++	unassigned	[11/12/13/14 Regression] ICE: in cp_finish_dec=
l, at cp/decl.c:7736
> 104391	gcc	fortran	unassigned	[11 Regression] bind(C) and allocatable o=
r pointer attribute don't work
> 104908	gcc	fortran	unassigned	[11/12/13/14 Regression] incorrect Fortra=
n out-of-bound runtime error.
> 113179	gcc	middle-e unassigned	[11/12/13/14/15 Regression] MIPS: INS is=
 used for long long, before SLL
> 80774	gcc	fortran	vehre	[11/12/13/14/15 Regression][Coarray] ICE in gfc=
_conv_descriptor_data_get, at fortran/trans-array.c
> 82904	gcc	fortran	vehre	[11/12/13/14/15 Regression][Coarray] ICE in mak=
e_ssa_name_fn, at tree-ssanames.c:261
> 111880	gcc	fortran	anlauf	[11/12/13/14] False positive warning of obsol=
escent COMMON block with Fortran submodule
> 61527	gcc	fortran	unassigned	[11/12/13/14 Regression] [OOP] class/exten=
ds, multiple generic assignment, accept invalid


Hi Deepthi,

I'm not ecstatic to see so many gcc bugs listed but
they are fixes so cool.

What testing have you done so far?
Can you show us the before, after and diff for our gcc tests?

Steve
Do you want to just run this through the YP AB or should Deepthi do
 =C2=A0- a world build for qemuarm64
 =C2=A0- more qemu targets
 =C2=A0- something else?

Thanks!

../Randy

>
> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> ---
>   .../gcc/{gcc-11.4.inc =3D> gcc-11.5.inc}        |    8 +-
>   ...ian_11.4.bb =3D> gcc-cross-canadian_11.5.bb} |    0
>   .../{gcc-cross_11.4.bb =3D> gcc-cross_11.5.bb}  |    0
>   ...-crosssdk_11.4.bb =3D> gcc-crosssdk_11.5.bb} |    0
>   ...cc-runtime_11.4.bb =3D> gcc-runtime_11.5.bb} |    0
>   ...itizers_11.4.bb =3D> gcc-sanitizers_11.5.bb} |    0
>   ...{gcc-source_11.4.bb =3D> gcc-source_11.5.bb} |    0
>   ...rch64-Update-Neoverse-N2-core-defini.patch |   38 -
>   .../gcc/gcc/CVE-2023-4039.patch               | 2893 ----------------=
-
>   .../gcc/{gcc_11.4.bb =3D> gcc_11.5.bb}          |    0
>   ...initial_11.4.bb =3D> libgcc-initial_11.5.bb} |    0
>   .../gcc/{libgcc_11.4.bb =3D> libgcc_11.5.bb}    |    0
>   ...ibgfortran_11.4.bb =3D> libgfortran_11.5.bb} |    0
>   13 files changed, 3 insertions(+), 2936 deletions(-)
>   rename meta/recipes-devtools/gcc/{gcc-11.4.inc =3D> gcc-11.5.inc} (95=
%)
>   rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.4.bb =3D> gcc=
-cross-canadian_11.5.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-cross_11.4.bb =3D> gcc-cross_11=
.5.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.4.bb =3D> gcc-cross=
sdk_11.5.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-runtime_11.4.bb =3D> gcc-runtim=
e_11.5.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.4.bb =3D> gcc-san=
itizers_11.5.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-source_11.4.bb =3D> gcc-source_=
11.5.bb} (100%)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-=
Neoverse-N2-core-defini.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
>   rename meta/recipes-devtools/gcc/{gcc_11.4.bb =3D> gcc_11.5.bb} (100%=
)
>   rename meta/recipes-devtools/gcc/{libgcc-initial_11.4.bb =3D> libgcc-=
initial_11.5.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc_11.4.bb =3D> libgcc_11.5.bb}=
 (100%)
>   rename meta/recipes-devtools/gcc/{libgfortran_11.4.bb =3D> libgfortra=
n_11.5.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.4.inc b/meta/recipes-devt=
ools/gcc/gcc-11.5.inc
> similarity index 95%
> rename from meta/recipes-devtools/gcc/gcc-11.4.inc
> rename to meta/recipes-devtools/gcc/gcc-11.5.inc
> index fd6a3e92e3..c316d2a9a0 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.4.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
> @@ -2,11 +2,11 @@ require gcc-common.inc
>  =20
>   # Third digit in PV should be incremented after a minor release
>  =20
> -PV =3D "11.4.0"
> +PV =3D "11.5.0"
>  =20
>   # BINV should be incremented to a revision after a minor gcc release
>  =20
> -BINV =3D "11.4.0"
> +BINV =3D "11.5.0"
>  =20
>   FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backpor=
t:"
>  =20
> @@ -65,14 +65,12 @@ SRC_URI =3D "\
>              file://0003-CVE-2021-42574.patch \
>              file://0004-CVE-2021-42574.patch \
>              file://0001-CVE-2021-46195.patch \
> -	file://0001-aarch64-Update-Neoverse-N2-core-defini.patch \
>   	file://0002-aarch64-add-armv9-a-to-march.patch \
>   	file://0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch \
>   	file://0004-arm-add-armv9-a-architecture-to-march.patch \
> -	file://CVE-2023-4039.patch \
>   "
>  =20
> -SRC_URI[sha256sum] =3D "3f2db222b007e8a4a23cd5ba56726ef08e8b1f1eb2055e=
e72c1402cea73a8dd9"
> +SRC_URI[sha256sum] =3D "a6e21868ead545cf87f0c01f84276e4b5281d672098591=
c1c896241f09363478"
>  =20
>   S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>  =20
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.4.bb b/met=
a/recipes-devtools/gcc/gcc-cross-canadian_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.4.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.5.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.4.bb b/meta/recipes=
-devtools/gcc/gcc-cross_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_11.4.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_11.5.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.4.bb b/meta/reci=
pes-devtools/gcc/gcc-crosssdk_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.4.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.5.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.4.bb b/meta/recip=
es-devtools/gcc/gcc-runtime_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_11.4.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_11.5.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.4.bb b/meta/re=
cipes-devtools/gcc/gcc-sanitizers_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.4.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.5.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_11.4.bb b/meta/recipe=
s-devtools/gcc/gcc-source_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_11.4.bb
> rename to meta/recipes-devtools/gcc/gcc-source_11.5.bb
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse=
-N2-core-defini.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update=
-Neoverse-N2-core-defini.patch
> deleted file mode 100644
> index a0c9db72e1..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-cor=
e-defini.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 9f37d31324f89d0b7b2abac988a976d121ae29c6 Mon Sep 17 00:00:00 2001
> -From: Andre Vieira<andre.simoesdiasvieira@arm.com>
> -Date: Thu, 8 Sep 2022 06:02:18 +0000
> -Subject: [PATCH 1/4] aarch64: Update Neoverse N2 core definition
> -
> -commit 9f37d31324f89d0b7b2abac988a976d121ae29c6 from upstream.
> -
> -gcc/ChangeLog:
> -
> -        * config/aarch64/aarch64-cores.def: Update Neoverse N2 core en=
try.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Ruiqiang Hao<Ruiqiang.Hao@windriver.com>
> ----
> - gcc/config/aarch64/aarch64-cores.def | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64=
/aarch64-cores.def
> -index 4643e0e27..3478e567a 100644
> ---- a/gcc/config/aarch64/aarch64-cores.def
> -+++ b/gcc/config/aarch64/aarch64-cores.def
> -@@ -147,7 +147,6 @@
> - AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL=
_FOR_ARCH8_4 | AARCH64_FL_CRYPTO, saphira,   0x51, 0xC01, -1)
> -
> - /* Armv8.5-A Architecture Processors.  */
> --AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_F=
OR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64=
_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AA=
RCH64_FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
> - AARCH64_CORE("neoverse-v2", neoversev2, cortexa57, 8_5A, AARCH64_FL_F=
OR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64=
_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AA=
RCH64_FL_MEMTAG, neoverse512tvb, 0x41, 0xd4f, -1)
> -
> - /* ARMv8-A big.LITTLE implementations.  */
> -@@ -165,4 +164,7 @@
> - /* Armv8-R Architecture Processors.  */
> - AARCH64_CORE("cortex-r82", cortexr82, cortexa53, 8R, AARCH64_FL_FOR_A=
RCH8_R, cortexa53, 0x41, 0xd15, -1)
> -
> -+/* Armv9-A Architecture Processors. */
> -+AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 9A, AARCH64_FL_FOR=
_ARCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_SVE2_BITPERM | AA=
RCH64_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2, 0x41, =
0xd49, -1)
> -+
> - #undef AARCH64_CORE
> -
> diff --git a/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch b/meta/r=
ecipes-devtools/gcc/gcc/CVE-2023-4039.patch
> deleted file mode 100644
> index 41684fe7dd..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
> +++ /dev/null
> @@ -1,2893 +0,0 @@
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Subject: [PATCH 00/19] aarch64: Fix -fstack-protector issue
> -Date: Tue, 12 Sep 2023 16:25:10 +0100
> -
> -This series of patches fixes deficiencies in GCC's -fstack-protector
> -implementation for AArch64 when using dynamically allocated stack spac=
e.
> -This is CVE-2023-4039.  See:
> -
> -https://developer.arm.com/Arm%20Security%20Center/GCC%20Stack%20Protec=
tor%20Vulnerability%20AArch64
> -https://github.com/metaredteam/external-disclosures/security/advisorie=
s/GHSA-x7ch-h5rf-w2mf
> -
> -for more details.
> -
> -The fix is to put the saved registers above the locals area when
> --fstack-protector is used.
> -
> -The series also fixes a stack-clash problem that I found while working
> -on the CVE.  In unpatched sources, the stack-clash problem would only
> -trigger for unrealistic numbers of arguments (8K 64-bit arguments, or =
an
> -equivalent).  But it would be a more significant issue with the new
> --fstack-protector frame layout.  It's therefore important that both
> -problems are fixed together.
> -
> -Some reorganisation of the code seemed necessary to fix the problems i=
n a
> -cleanish way.  The series is therefore quite long, but only a handful =
of
> -patches should have any effect on code generation.
> -
> -See the individual patches for a detailed description.
> -
> -Tested on aarch64-linux-gnu. Pushed to trunk and to all active branche=
s.
> -I've also pushed backports to GCC 7+ to vendors/ARM/heads/CVE-2023-403=
9.
> -
> -CVE: CVE-2023-4039
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton<ross.burton@arm.com>
> -
> -
> -From 52816ab48f97968f3fbfb5656250f3de7c00166d Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:43 +0100
> -Subject: [PATCH 01/19] aarch64: Use local frame vars in shrink-wrappin=
g code
> -
> -aarch64_layout_frame uses a shorthand for referring to
> -cfun->machine->frame:
> -
> -  aarch64_frame &frame =3D cfun->machine->frame;
> -
> -This patch does the same for some other heavy users of the structure.
> -No functional change intended.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_save_callee_saves): Use
> -	a local shorthand for cfun->machine->frame.
> -	(aarch64_restore_callee_saves, aarch64_get_separate_components):
> -	(aarch64_process_components): Likewise.
> -	(aarch64_allocate_and_probe_stack_space): Likewise.
> -	(aarch64_expand_prologue, aarch64_expand_epilogue): Likewise.
> -	(aarch64_layout_frame): Use existing shorthand for one more case.
> ----
> - gcc/config/aarch64/aarch64.c | 115 ++++++++++++++++++----------------=
-
> - 1 file changed, 60 insertions(+), 55 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 391a93f3018..77c1d1300a5 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7994,6 +7994,7 @@ aarch64_save_callee_saves (poly_int64 start_offs=
et,
> - 			   unsigned start, unsigned limit, bool skip_wb,
> - 			   bool hard_fp_valid_p)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   rtx_insn *insn;
> -   unsigned regno;
> -   unsigned regno2;
> -@@ -8008,8 +8009,8 @@ aarch64_save_callee_saves (poly_int64 start_offs=
et,
> -       bool frame_related_p =3D aarch64_emit_cfi_for_reg_p (regno);
> -
> -       if (skip_wb
> --	  && (regno =3D=3D cfun->machine->frame.wb_candidate1
> --	      || regno =3D=3D cfun->machine->frame.wb_candidate2))
> -+	  && (regno =3D=3D frame.wb_candidate1
> -+	      || regno =3D=3D frame.wb_candidate2))
> - 	continue;
> -
> -       if (cfun->machine->reg_is_wrapped_separately[regno])
> -@@ -8017,7 +8018,7 @@ aarch64_save_callee_saves (poly_int64 start_offs=
et,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D start_offset + cfun->machine->frame.reg_offset[regno=
];
> -+      offset =3D start_offset + frame.reg_offset[regno];
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       poly_int64 sp_offset =3D offset;
> -
> -@@ -8030,7 +8031,7 @@ aarch64_save_callee_saves (poly_int64 start_offs=
et,
> - 	{
> - 	  gcc_assert (known_eq (start_offset, 0));
> - 	  poly_int64 fp_offset
> --	    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> -+	    =3D frame.below_hard_fp_saved_regs_size;
> - 	  if (hard_fp_valid_p)
> - 	    base_rtx =3D hard_frame_pointer_rtx;
> - 	  else
> -@@ -8052,8 +8053,7 @@ aarch64_save_callee_saves (poly_int64 start_offs=
et,
> - 	  && (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) <=3D l=
imit
> - 	  && !cfun->machine->reg_is_wrapped_separately[regno2]
> - 	  && known_eq (GET_MODE_SIZE (mode),
> --		       cfun->machine->frame.reg_offset[regno2]
> --		       - cfun->machine->frame.reg_offset[regno]))
> -+		       frame.reg_offset[regno2] - frame.reg_offset[regno]))
> - 	{
> - 	  rtx reg2 =3D gen_rtx_REG (mode, regno2);
> - 	  rtx mem2;
> -@@ -8103,6 +8103,7 @@ static void
> - aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start=
,
> - 			      unsigned limit, bool skip_wb, rtx *cfi_ops)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   unsigned regno;
> -   unsigned regno2;
> -   poly_int64 offset;
> -@@ -8119,13 +8120,13 @@ aarch64_restore_callee_saves (poly_int64 start=
_offset, unsigned start,
> -       rtx reg, mem;
> -
> -       if (skip_wb
> --	  && (regno =3D=3D cfun->machine->frame.wb_candidate1
> --	      || regno =3D=3D cfun->machine->frame.wb_candidate2))
> -+	  && (regno =3D=3D frame.wb_candidate1
> -+	      || regno =3D=3D frame.wb_candidate2))
> - 	continue;
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D start_offset + cfun->machine->frame.reg_offset[regno=
];
> -+      offset =3D start_offset + frame.reg_offset[regno];
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> - 	aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
> -@@ -8136,8 +8137,7 @@ aarch64_restore_callee_saves (poly_int64 start_o=
ffset, unsigned start,
> - 	  && (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) <=3D l=
imit
> - 	  && !cfun->machine->reg_is_wrapped_separately[regno2]
> - 	  && known_eq (GET_MODE_SIZE (mode),
> --		       cfun->machine->frame.reg_offset[regno2]
> --		       - cfun->machine->frame.reg_offset[regno]))
> -+		       frame.reg_offset[regno2] - frame.reg_offset[regno]))
> - 	{
> - 	  rtx reg2 =3D gen_rtx_REG (mode, regno2);
> - 	  rtx mem2;
> -@@ -8242,6 +8242,7 @@ offset_12bit_unsigned_scaled_p (machine_mode mod=
e, poly_int64 offset)
> - static sbitmap
> - aarch64_get_separate_components (void)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   sbitmap components =3D sbitmap_alloc (LAST_SAVED_REGNUM + 1);
> -   bitmap_clear (components);
> -
> -@@ -8258,18 +8259,18 @@ aarch64_get_separate_components (void)
> - 	if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> - 	  continue;
> -
> --	poly_int64 offset =3D cfun->machine->frame.reg_offset[regno];
> -+	poly_int64 offset =3D frame.reg_offset[regno];
> -
> - 	/* If the register is saved in the first SVE save slot, we use
> - 	   it as a stack probe for -fstack-clash-protection.  */
> - 	if (flag_stack_clash_protection
> --	    && maybe_ne (cfun->machine->frame.below_hard_fp_saved_regs_size,=
 0)
> -+	    && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
> - 	    && known_eq (offset, 0))
> - 	  continue;
> -
> - 	/* Get the offset relative to the register we'll use.  */
> - 	if (frame_pointer_needed)
> --	  offset -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> -+	  offset -=3D frame.below_hard_fp_saved_regs_size;
> - 	else
> - 	  offset +=3D crtl->outgoing_args_size;
> -
> -@@ -8288,11 +8289,11 @@ aarch64_get_separate_components (void)
> -   /* If the spare predicate register used by big-endian SVE code
> -      is call-preserved, it must be saved in the main prologue
> -      before any saves that use it.  */
> --  if (cfun->machine->frame.spare_pred_reg !=3D INVALID_REGNUM)
> --    bitmap_clear_bit (components, cfun->machine->frame.spare_pred_reg=
);
> -+  if (frame.spare_pred_reg !=3D INVALID_REGNUM)
> -+    bitmap_clear_bit (components, frame.spare_pred_reg);
> -
> --  unsigned reg1 =3D cfun->machine->frame.wb_candidate1;
> --  unsigned reg2 =3D cfun->machine->frame.wb_candidate2;
> -+  unsigned reg1 =3D frame.wb_candidate1;
> -+  unsigned reg2 =3D frame.wb_candidate2;
> -   /* If registers have been chosen to be stored/restored with
> -      writeback don't interfere with them to avoid having to output ex=
plicit
> -      stack adjustment instructions.  */
> -@@ -8401,6 +8402,7 @@ aarch64_get_next_set_bit (sbitmap bmp, unsigned =
int start)
> - static void
> - aarch64_process_components (sbitmap components, bool prologue_p)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   rtx ptr_reg =3D gen_rtx_REG (Pmode, frame_pointer_needed
> - 			     ? HARD_FRAME_POINTER_REGNUM
> - 			     : STACK_POINTER_REGNUM);
> -@@ -8415,9 +8417,9 @@ aarch64_process_components (sbitmap components, =
bool prologue_p)
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -
> -       rtx reg =3D gen_rtx_REG (mode, regno);
> --      poly_int64 offset =3D cfun->machine->frame.reg_offset[regno];
> -+      poly_int64 offset =3D frame.reg_offset[regno];
> -       if (frame_pointer_needed)
> --	offset -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> -+	offset -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> - 	offset +=3D crtl->outgoing_args_size;
> -
> -@@ -8442,14 +8444,14 @@ aarch64_process_components (sbitmap components=
, bool prologue_p)
> - 	  break;
> - 	}
> -
> --      poly_int64 offset2 =3D cfun->machine->frame.reg_offset[regno2];
> -+      poly_int64 offset2 =3D frame.reg_offset[regno2];
> -       /* The next register is not of the same class or its offset is =
not
> - 	 mergeable with the current one into a pair.  */
> -       if (aarch64_sve_mode_p (mode)
> - 	  || !satisfies_constraint_Ump (mem)
> - 	  || GP_REGNUM_P (regno) !=3D GP_REGNUM_P (regno2)
> - 	  || (crtl->abi->id () =3D=3D ARM_PCS_SIMD && FP_REGNUM_P (regno))
> --	  || maybe_ne ((offset2 - cfun->machine->frame.reg_offset[regno]),
> -+	  || maybe_ne ((offset2 - frame.reg_offset[regno]),
> - 		       GET_MODE_SIZE (mode)))
> - 	{
> - 	  insn =3D emit_insn (set);
> -@@ -8471,7 +8473,7 @@ aarch64_process_components (sbitmap components, =
bool prologue_p)
> -       /* REGNO2 can be saved/restored in a pair with REGNO.  */
> -       rtx reg2 =3D gen_rtx_REG (mode, regno2);
> -       if (frame_pointer_needed)
> --	offset2 -=3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> -+	offset2 -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> - 	offset2 +=3D crtl->outgoing_args_size;
> -       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
> -@@ -8566,6 +8568,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
> - 					bool frame_related_p,
> - 					bool final_adjustment_p)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -   HOST_WIDE_INT guard_size
> -     =3D 1 << param_stack_clash_protection_guard_size;
> -   HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUARD;
> -@@ -8586,25 +8589,25 @@ aarch64_allocate_and_probe_stack_space (rtx te=
mp1, rtx temp2,
> -        register as a probe.  We can't assume that LR was saved at pos=
ition 0
> -        though, so treat any space below it as unprobed.  */
> -   if (final_adjustment_p
> --      && known_eq (cfun->machine->frame.below_hard_fp_saved_regs_size=
, 0))
> -+      && known_eq (frame.below_hard_fp_saved_regs_size, 0))
> -     {
> --      poly_int64 lr_offset =3D cfun->machine->frame.reg_offset[LR_REG=
NUM];
> -+      poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM];
> -       if (known_ge (lr_offset, 0))
> - 	min_probe_threshold -=3D lr_offset.to_constant ();
> -       else
> - 	gcc_assert (!flag_stack_clash_protection || known_eq (poly_size, 0))=
;
> -     }
> -
> --  poly_int64 frame_size =3D cfun->machine->frame.frame_size;
> -+  poly_int64 frame_size =3D frame.frame_size;
> -
> -   /* We should always have a positive probe threshold.  */
> -   gcc_assert (min_probe_threshold > 0);
> -
> -   if (flag_stack_clash_protection && !final_adjustment_p)
> -     {
> --      poly_int64 initial_adjust =3D cfun->machine->frame.initial_adju=
st;
> --      poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_calle=
e_adjust;
> --      poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
> -+      poly_int64 initial_adjust =3D frame.initial_adjust;
> -+      poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -+      poly_int64 final_adjust =3D frame.final_adjust;
> -
> -       if (known_eq (frame_size, 0))
> - 	{
> -@@ -8893,17 +8896,18 @@ aarch64_epilogue_uses (int regno)
> - void
> - aarch64_expand_prologue (void)
> - {
> --  poly_int64 frame_size =3D cfun->machine->frame.frame_size;
> --  poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust;
> --  HOST_WIDE_INT callee_adjust =3D cfun->machine->frame.callee_adjust;
> --  poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
> --  poly_int64 callee_offset =3D cfun->machine->frame.callee_offset;
> --  poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_ad=
just;
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -+  poly_int64 frame_size =3D frame.frame_size;
> -+  poly_int64 initial_adjust =3D frame.initial_adjust;
> -+  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -+  poly_int64 final_adjust =3D frame.final_adjust;
> -+  poly_int64 callee_offset =3D frame.callee_offset;
> -+  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -   poly_int64 below_hard_fp_saved_regs_size
> --    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> --  unsigned reg1 =3D cfun->machine->frame.wb_candidate1;
> --  unsigned reg2 =3D cfun->machine->frame.wb_candidate2;
> --  bool emit_frame_chain =3D cfun->machine->frame.emit_frame_chain;
> -+    =3D frame.below_hard_fp_saved_regs_size;
> -+  unsigned reg1 =3D frame.wb_candidate1;
> -+  unsigned reg2 =3D frame.wb_candidate2;
> -+  bool emit_frame_chain =3D frame.emit_frame_chain;
> -   rtx_insn *insn;
> -
> -   if (flag_stack_clash_protection && known_eq (callee_adjust, 0))
> -@@ -8969,7 +8973,7 @@ aarch64_expand_prologue (void)
> -
> -   /* The offset of the frame chain record (if any) from the current S=
P.  */
> -   poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> --			     - cfun->machine->frame.hard_fp_offset);
> -+			     - frame.hard_fp_offset);
> -   gcc_assert (known_ge (chain_offset, 0));
> -
> -   /* The offset of the bottom of the save area from the current SP.  =
*/
> -@@ -9072,15 +9076,16 @@ aarch64_use_return_insn_p (void)
> - void
> - aarch64_expand_epilogue (bool for_sibcall)
> - {
> --  poly_int64 initial_adjust =3D cfun->machine->frame.initial_adjust;
> --  HOST_WIDE_INT callee_adjust =3D cfun->machine->frame.callee_adjust;
> --  poly_int64 final_adjust =3D cfun->machine->frame.final_adjust;
> --  poly_int64 callee_offset =3D cfun->machine->frame.callee_offset;
> --  poly_int64 sve_callee_adjust =3D cfun->machine->frame.sve_callee_ad=
just;
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -+  poly_int64 initial_adjust =3D frame.initial_adjust;
> -+  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -+  poly_int64 final_adjust =3D frame.final_adjust;
> -+  poly_int64 callee_offset =3D frame.callee_offset;
> -+  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -   poly_int64 below_hard_fp_saved_regs_size
> --    =3D cfun->machine->frame.below_hard_fp_saved_regs_size;
> --  unsigned reg1 =3D cfun->machine->frame.wb_candidate1;
> --  unsigned reg2 =3D cfun->machine->frame.wb_candidate2;
> -+    =3D frame.below_hard_fp_saved_regs_size;
> -+  unsigned reg1 =3D frame.wb_candidate1;
> -+  unsigned reg2 =3D frame.wb_candidate2;
> -   rtx cfi_ops =3D NULL;
> -   rtx_insn *insn;
> -   /* A stack clash protection prologue may not have left EP0_REGNUM o=
r
> -@@ -9113,7 +9118,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> -   /* We need to add memory barrier to prevent read from deallocated s=
tack.  */
> -   bool need_barrier_p
> -     =3D maybe_ne (get_frame_size ()
> --		+ cfun->machine->frame.saved_varargs_size, 0);
> -+		+ frame.saved_varargs_size, 0);
> -
> -   /* Emit a barrier to prevent loads from a deallocated stack.  */
> -   if (maybe_gt (final_adjust, crtl->outgoing_args_size)
> -@@ -11744,24 +11749,24 @@ aarch64_can_eliminate (const int from ATTRIB=
UTE_UNUSED, const int to)
> - poly_int64
> - aarch64_initial_elimination_offset (unsigned from, unsigned to)
> - {
> -+  aarch64_frame &frame =3D cfun->machine->frame;
> -+
> -   if (to =3D=3D HARD_FRAME_POINTER_REGNUM)
> -     {
> -       if (from =3D=3D ARG_POINTER_REGNUM)
> --	return cfun->machine->frame.hard_fp_offset;
> -+	return frame.hard_fp_offset;
> -
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --	return cfun->machine->frame.hard_fp_offset
> --	       - cfun->machine->frame.locals_offset;
> -+	return frame.hard_fp_offset - frame.locals_offset;
> -     }
> -
> -   if (to =3D=3D STACK_POINTER_REGNUM)
> -     {
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --	  return cfun->machine->frame.frame_size
> --		 - cfun->machine->frame.locals_offset;
> -+	return frame.frame_size - frame.locals_offset;
> -     }
> -
> --  return cfun->machine->frame.frame_size;
> -+  return frame.frame_size;
> - }
> -
> -
> ---
> -2.34.1
> -
> -
> -From a2a57f7ec7912e77eb26919545807d90065584ff Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:44 +0100
> -Subject: [PATCH 02/19] aarch64: Avoid a use of callee_offset
> -
> -When we emit the frame chain, i.e. when we reach Here in this statemen=
t
> -of aarch64_expand_prologue:
> -
> -  if (emit_frame_chain)
> -    {
> -      // Here
> -      ...
> -    }
> -
> -the stack is in one of two states:
> -
> -- We've allocated up to the frame chain, but no more.
> -
> -- We've allocated the whole frame, and the frame chain is within easy
> -  reach of the new SP.
> -
> -The offset of the frame chain from the current SP is available
> -in aarch64_frame as callee_offset.  It is also available as the
> -chain_offset local variable, where the latter is calculated from other
> -data.  (However, chain_offset is not always equal to callee_offset whe=
n
> -!emit_frame_chain, so chain_offset isn't redundant.)
> -
> -In c600df9a4060da3c6121ff4d0b93f179eafd69d1 I switched to using
> -chain_offset for the initialisation of the hard frame pointer:
> -
> -       aarch64_add_offset (Pmode, hard_frame_pointer_rtx,
> --                         stack_pointer_rtx, callee_offset,
> -+                         stack_pointer_rtx, chain_offset,
> -                          tmp1_rtx, tmp0_rtx, frame_pointer_needed);
> -
> -But the later REG_CFA_ADJUST_CFA handling still used callee_offset.
> -
> -I think the difference is harmless, but it's more logical for the
> -CFA note to be in sync, and it's more convenient for later patches
> -if it uses chain_offset.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_expand_prologue): Use
> -	chain_offset rather than callee_offset.
> ----
> - gcc/config/aarch64/aarch64.c | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 77c1d1300a5..6bc026bd08f 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -8901,7 +8901,6 @@ aarch64_expand_prologue (void)
> -   poly_int64 initial_adjust =3D frame.initial_adjust;
> -   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -   poly_int64 final_adjust =3D frame.final_adjust;
> --  poly_int64 callee_offset =3D frame.callee_offset;
> -   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -   poly_int64 below_hard_fp_saved_regs_size
> -     =3D frame.below_hard_fp_saved_regs_size;
> -@@ -9010,8 +9009,7 @@ aarch64_expand_prologue (void)
> - 	     implicit.  */
> - 	  if (!find_reg_note (insn, REG_CFA_ADJUST_CFA, NULL_RTX))
> - 	    {
> --	      rtx src =3D plus_constant (Pmode, stack_pointer_rtx,
> --				       callee_offset);
> -+	      rtx src =3D plus_constant (Pmode, stack_pointer_rtx, chain_off=
set);
> - 	      add_reg_note (insn, REG_CFA_ADJUST_CFA,
> - 			    gen_rtx_SET (hard_frame_pointer_rtx, src));
> - 	    }
> ---
> -2.34.1
> -
> -
> -From 5efdcc8ed19d9d9e708a001f5dc695560411496d Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:44 +0100
> -Subject: [PATCH 03/19] aarch64: Explicitly handle frames with no saved
> - registers
> -
> -If a frame has no saved registers, it can be allocated in one go.
> -There is no need to treat the areas below and above the saved
> -registers as separate.
> -
> -And if we allocate the frame in one go, it should be allocated
> -as the initial_adjust rather than the final_adjust.  This allows the
> -frame size to grow to guard_size - guard_used_by_caller before a stack
> -probe is needed.  (A frame with no register saves is necessarily a
> -leaf frame.)
> -
> -This is a no-op as thing stand, since a leaf function will have
> -no outgoing arguments, and so all the frame will be above where
> -the saved registers normally go.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Explicitly
> -	allocate the frame in one go if there are no saved registers.
> ----
> - gcc/config/aarch64/aarch64.c | 8 +++++---
> - 1 file changed, 5 insertions(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 6bc026bd08f..05e6ae8c0c9 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7609,9 +7609,11 @@ aarch64_layout_frame (void)
> -
> -   HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_offset=
;
> -   HOST_WIDE_INT const_saved_regs_size;
> --  if (frame.frame_size.is_constant (&const_size)
> --      && const_size < max_push_offset
> --      && known_eq (frame.hard_fp_offset, const_size))
> -+  if (known_eq (frame.saved_regs_size, 0))
> -+    frame.initial_adjust =3D frame.frame_size;
> -+  else if (frame.frame_size.is_constant (&const_size)
> -+	   && const_size < max_push_offset
> -+	   && known_eq (frame.hard_fp_offset, const_size))
> -     {
> -       /* Simple, small frame with no outgoing arguments:
> -
> ---
> -2.34.1
> -
> -
> -From a8385d14318634f2e3a08a75bd2d6e2810f8cec9 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:45 +0100
> -Subject: [PATCH 04/19] aarch64: Add bytes_below_saved_regs to frame in=
fo
> -
> -The frame layout code currently hard-codes the assumption that
> -the number of bytes below the saved registers is equal to the
> -size of the outgoing arguments.  This patch abstracts that
> -value into a new field of aarch64_frame.
> -
> -gcc/
> -	* config/aarch64/aarch64.h (aarch64_frame::bytes_below_saved_regs): N=
ew
> -	field.
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Initialize it,
> -	and use it instead of crtl->outgoing_args_size.
> -	(aarch64_get_separate_components): Use bytes_below_saved_regs instead
> -	of outgoing_args_size.
> -	(aarch64_process_components): Likewise.
> ----
> - gcc/config/aarch64/aarch64.c | 71 ++++++++++++++++++-----------------=
-
> - gcc/config/aarch64/aarch64.h |  5 +++
> - 2 files changed, 41 insertions(+), 35 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 05e6ae8c0c9..8fa5a0b2545 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7476,6 +7476,8 @@ aarch64_layout_frame (void)
> -   gcc_assert (crtl->is_leaf
> - 	      || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRED))=
;
> -
> -+  frame.bytes_below_saved_regs =3D crtl->outgoing_args_size;
> -+
> -   /* Now assign stack slots for the registers.  Start with the predic=
ate
> -      registers, since predicate LDR and STR have a relatively small
> -      offset range.  These saves happen below the hard frame pointer. =
 */
> -@@ -7580,18 +7582,18 @@ aarch64_layout_frame (void)
> -
> -   poly_int64 varargs_and_saved_regs_size =3D offset + frame.saved_var=
args_size;
> -
> --  poly_int64 above_outgoing_args
> -+  poly_int64 saved_regs_and_above
> -     =3D aligned_upper_bound (varargs_and_saved_regs_size
> - 			   + get_frame_size (),
> - 			   STACK_BOUNDARY / BITS_PER_UNIT);
> -
> -   frame.hard_fp_offset
> --    =3D above_outgoing_args - frame.below_hard_fp_saved_regs_size;
> -+    =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
> -
> -   /* Both these values are already aligned.  */
> --  gcc_assert (multiple_p (crtl->outgoing_args_size,
> -+  gcc_assert (multiple_p (frame.bytes_below_saved_regs,
> - 			  STACK_BOUNDARY / BITS_PER_UNIT));
> --  frame.frame_size =3D above_outgoing_args + crtl->outgoing_args_size=
;
> -+  frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved=
_regs;
> -
> -   frame.locals_offset =3D frame.saved_varargs_size;
> -
> -@@ -7607,7 +7609,7 @@ aarch64_layout_frame (void)
> -   else if (frame.wb_candidate1 !=3D INVALID_REGNUM)
> -     max_push_offset =3D 256;
> -
> --  HOST_WIDE_INT const_size, const_outgoing_args_size, const_fp_offset=
;
> -+  HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;
> -   HOST_WIDE_INT const_saved_regs_size;
> -   if (known_eq (frame.saved_regs_size, 0))
> -     frame.initial_adjust =3D frame.frame_size;
> -@@ -7615,31 +7617,31 @@ aarch64_layout_frame (void)
> - 	   && const_size < max_push_offset
> - 	   && known_eq (frame.hard_fp_offset, const_size))
> -     {
> --      /* Simple, small frame with no outgoing arguments:
> -+      /* Simple, small frame with no data below the saved registers.
> -
> - 	 stp reg1, reg2, [sp, -frame_size]!
> - 	 stp reg3, reg4, [sp, 16]  */
> -       frame.callee_adjust =3D const_size;
> -     }
> --  else if (crtl->outgoing_args_size.is_constant (&const_outgoing_args=
_size)
> -+  else if (frame.bytes_below_saved_regs.is_constant (&const_below_sav=
ed_regs)
> - 	   && frame.saved_regs_size.is_constant (&const_saved_regs_size)
> --	   && const_outgoing_args_size + const_saved_regs_size < 512
> --	   /* We could handle this case even with outgoing args, provided
> --	      that the number of args left us with valid offsets for all
> --	      predicate and vector save slots.  It's such a rare case that
> --	      it hardly seems worth the effort though.  */
> --	   && (!saves_below_hard_fp_p || const_outgoing_args_size =3D=3D 0)
> -+	   && const_below_saved_regs + const_saved_regs_size < 512
> -+	   /* We could handle this case even with data below the saved
> -+	      registers, provided that that data left us with valid offsets
> -+	      for all predicate and vector save slots.  It's such a rare
> -+	      case that it hardly seems worth the effort though.  */
> -+	   && (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D 0)
> - 	   && !(cfun->calls_alloca
> - 		&& frame.hard_fp_offset.is_constant (&const_fp_offset)
> - 		&& const_fp_offset < max_push_offset))
> -     {
> --      /* Frame with small outgoing arguments:
> -+      /* Frame with small area below the saved registers:
> -
> - 	 sub sp, sp, frame_size
> --	 stp reg1, reg2, [sp, outgoing_args_size]
> --	 stp reg3, reg4, [sp, outgoing_args_size + 16]  */
> -+	 stp reg1, reg2, [sp, bytes_below_saved_regs]
> -+	 stp reg3, reg4, [sp, bytes_below_saved_regs + 16]  */
> -       frame.initial_adjust =3D frame.frame_size;
> --      frame.callee_offset =3D const_outgoing_args_size;
> -+      frame.callee_offset =3D const_below_saved_regs;
> -     }
> -   else if (saves_below_hard_fp_p
> - 	   && known_eq (frame.saved_regs_size,
> -@@ -7649,30 +7651,29 @@ aarch64_layout_frame (void)
> -
> - 	 sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
> - 	 save SVE registers relative to SP
> --	 sub sp, sp, outgoing_args_size  */
> -+	 sub sp, sp, bytes_below_saved_regs  */
> -       frame.initial_adjust =3D (frame.hard_fp_offset
> - 			      + frame.below_hard_fp_saved_regs_size);
> --      frame.final_adjust =3D crtl->outgoing_args_size;
> -+      frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -   else if (frame.hard_fp_offset.is_constant (&const_fp_offset)
> - 	   && const_fp_offset < max_push_offset)
> -     {
> --      /* Frame with large outgoing arguments or SVE saves, but with
> --	 a small local area:
> -+      /* Frame with large area below the saved registers, or with SVE=
 saves,
> -+	 but with a small area above:
> -
> - 	 stp reg1, reg2, [sp, -hard_fp_offset]!
> - 	 stp reg3, reg4, [sp, 16]
> - 	 [sub sp, sp, below_hard_fp_saved_regs_size]
> - 	 [save SVE registers relative to SP]
> --	 sub sp, sp, outgoing_args_size  */
> -+	 sub sp, sp, bytes_below_saved_regs  */
> -       frame.callee_adjust =3D const_fp_offset;
> -       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size=
;
> --      frame.final_adjust =3D crtl->outgoing_args_size;
> -+      frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -   else
> -     {
> --      /* Frame with large local area and outgoing arguments or SVE sa=
ves,
> --	 using frame pointer:
> -+      /* General case:
> -
> - 	 sub sp, sp, hard_fp_offset
> - 	 stp x29, x30, [sp, 0]
> -@@ -7680,10 +7681,10 @@ aarch64_layout_frame (void)
> - 	 stp reg3, reg4, [sp, 16]
> - 	 [sub sp, sp, below_hard_fp_saved_regs_size]
> - 	 [save SVE registers relative to SP]
> --	 sub sp, sp, outgoing_args_size  */
> -+	 sub sp, sp, bytes_below_saved_regs  */
> -       frame.initial_adjust =3D frame.hard_fp_offset;
> -       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size=
;
> --      frame.final_adjust =3D crtl->outgoing_args_size;
> -+      frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -
> -   /* Make sure the individual adjustments add up to the full frame si=
ze.  */
> -@@ -8274,7 +8275,7 @@ aarch64_get_separate_components (void)
> - 	if (frame_pointer_needed)
> - 	  offset -=3D frame.below_hard_fp_saved_regs_size;
> - 	else
> --	  offset +=3D crtl->outgoing_args_size;
> -+	  offset +=3D frame.bytes_below_saved_regs;
> -
> - 	/* Check that we can access the stack slot of the register with one
> - 	   direct load with no adjustments needed.  */
> -@@ -8423,7 +8424,7 @@ aarch64_process_components (sbitmap components, =
bool prologue_p)
> -       if (frame_pointer_needed)
> - 	offset -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> --	offset +=3D crtl->outgoing_args_size;
> -+	offset +=3D frame.bytes_below_saved_regs;
> -
> -       rtx addr =3D plus_constant (Pmode, ptr_reg, offset);
> -       rtx mem =3D gen_frame_mem (mode, addr);
> -@@ -8477,7 +8478,7 @@ aarch64_process_components (sbitmap components, =
bool prologue_p)
> -       if (frame_pointer_needed)
> - 	offset2 -=3D frame.below_hard_fp_saved_regs_size;
> -       else
> --	offset2 +=3D crtl->outgoing_args_size;
> -+	offset2 +=3D frame.bytes_below_saved_regs;
> -       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
> -       rtx mem2 =3D gen_frame_mem (mode, addr2);
> -       rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, reg2)
> -@@ -8551,10 +8552,10 @@ aarch64_stack_clash_protection_alloca_probe_ra=
nge (void)
> -    registers.  If POLY_SIZE is not large enough to require a probe th=
is function
> -    will only adjust the stack.  When allocating the stack space
> -    FRAME_RELATED_P is then used to indicate if the allocation is fram=
e related.
> --   FINAL_ADJUSTMENT_P indicates whether we are allocating the outgoin=
g
> --   arguments.  If we are then we ensure that any allocation larger th=
an the ABI
> --   defined buffer needs a probe so that the invariant of having a 1KB=
 buffer is
> --   maintained.
> -+   FINAL_ADJUSTMENT_P indicates whether we are allocating the area be=
low
> -+   the saved registers.  If we are then we ensure that any allocation
> -+   larger than the ABI defined buffer needs a probe so that the
> -+   invariant of having a 1KB buffer is maintained.
> -
> -    We emit barriers after each stack adjustment to prevent optimizati=
ons from
> -    breaking the invariant that we never drop the stack more than a pa=
ge.  This
> -@@ -8763,7 +8764,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
> -   /* Handle any residuals.  Residuals of at least MIN_PROBE_THRESHOLD=
 have to
> -      be probed.  This maintains the requirement that each page is pro=
bed at
> -      least once.  For initial probing we probe only if the allocation=
 is
> --     more than GUARD_SIZE - buffer, and for the outgoing arguments we=
 probe
> -+     more than GUARD_SIZE - buffer, and below the saved registers we =
probe
> -      if the amount is larger than buffer.  GUARD_SIZE - buffer + buff=
er =3D=3D
> -      GUARD_SIZE.  This works that for any allocation that is large en=
ough to
> -      trigger a probe here, we'll have at least one, and if they're no=
t large
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64=
.h
> -index bb383acfae8..6f0b8c7107e 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -837,6 +837,11 @@ struct GTY (()) aarch64_frame
> -   /* The size of the callee-save registers with a slot in REG_OFFSET.=
  */
> -   poly_int64 saved_regs_size;
> -
> -+  /* The number of bytes between the bottom of the static frame (the =
bottom
> -+     of the outgoing arguments) and the bottom of the register save a=
rea.
> -+     This value is always a multiple of STACK_BOUNDARY.  */
> -+  poly_int64 bytes_below_saved_regs;
> -+
> -   /* The size of the callee-save registers with a slot in REG_OFFSET =
that
> -      are saved below the hard frame pointer.  */
> -   poly_int64 below_hard_fp_saved_regs_size;
> ---
> -2.34.1
> -
> -
> -From d3f6ceecc8a7f128a9e6cb7d8aecf0de81ed9705 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:45 +0100
> -Subject: [PATCH 05/19] aarch64: Add bytes_below_hard_fp to frame info
> -
> -Following on from the previous bytes_below_saved_regs patch, this one
> -records the number of bytes that are below the hard frame pointer.
> -This eventually replaces below_hard_fp_saved_regs_size.
> -
> -If a frame pointer is not needed, the epilogue adds final_adjust
> -to the stack pointer before restoring registers:
> -
> -     aarch64_add_sp (tmp1_rtx, tmp0_rtx, final_adjust, true);
> -
> -Therefore, if the epilogue needs to restore the stack pointer from
> -the hard frame pointer, the directly corresponding offset is:
> -
> -     -bytes_below_hard_fp + final_adjust
> -
> -i.e. go from the hard frame pointer to the bottom of the frame,
> -then add the same amount as if we were using the stack pointer
> -from the outset.
> -
> -gcc/
> -	* config/aarch64/aarch64.h (aarch64_frame::bytes_below_hard_fp): New
> -	field.
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Initialize it.
> -	(aarch64_expand_epilogue): Use it instead of
> -	below_hard_fp_saved_regs_size.
> ----
> - gcc/config/aarch64/aarch64.c | 6 +++---
> - gcc/config/aarch64/aarch64.h | 5 +++++
> - 2 files changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 8fa5a0b2545..e03adf57226 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7528,6 +7528,7 @@ aarch64_layout_frame (void)
> -      of the callee save area.  */
> -   bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);
> -   frame.below_hard_fp_saved_regs_size =3D offset;
> -+  frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_regs=
;
> -   if (frame.emit_frame_chain)
> -     {
> -       /* FP and LR are placed in the linkage record.  */
> -@@ -9083,8 +9084,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> -   poly_int64 final_adjust =3D frame.final_adjust;
> -   poly_int64 callee_offset =3D frame.callee_offset;
> -   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> --  poly_int64 below_hard_fp_saved_regs_size
> --    =3D frame.below_hard_fp_saved_regs_size;
> -+  poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;
> -   unsigned reg1 =3D frame.wb_candidate1;
> -   unsigned reg2 =3D frame.wb_candidate2;
> -   rtx cfi_ops =3D NULL;
> -@@ -9140,7 +9140,7 @@ aarch64_expand_epilogue (bool for_sibcall)
> -        is restored on the instruction doing the writeback.  */
> -     aarch64_add_offset (Pmode, stack_pointer_rtx,
> - 			hard_frame_pointer_rtx,
> --			-callee_offset - below_hard_fp_saved_regs_size,
> -+			-bytes_below_hard_fp + final_adjust,
> - 			tmp1_rtx, tmp0_rtx, callee_adjust =3D=3D 0);
> -   else
> -      /* The case where we need to re-use the register here is very ra=
re, so
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64=
.h
> -index 6f0b8c7107e..21ac920a3fe 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -846,6 +846,11 @@ struct GTY (()) aarch64_frame
> -      are saved below the hard frame pointer.  */
> -   poly_int64 below_hard_fp_saved_regs_size;
> -
> -+  /* The number of bytes between the bottom of the static frame (the =
bottom
> -+     of the outgoing arguments) and the hard frame pointer.  This val=
ue is
> -+     always a multiple of STACK_BOUNDARY.  */
> -+  poly_int64 bytes_below_hard_fp;
> -+
> -   /* Offset from the base of the frame (incomming SP) to the
> -      top of the locals area.  This value is always a multiple of
> -      STACK_BOUNDARY.  */
> ---
> -2.34.1
> -
> -
> -From e8a7ec87fcdbaa5f7c7bd499aebe5cefacbf8687 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:46 +0100
> -Subject: [PATCH 06/19] aarch64: Tweak aarch64_save/restore_callee_save=
s
> -
> -aarch64_save_callee_saves and aarch64_restore_callee_saves took
> -a parameter called start_offset that gives the offset of the
> -bottom of the saved register area from the current stack pointer.
> -However, it's more convenient for later patches if we use the
> -bottom of the entire frame as the reference point, rather than
> -the bottom of the saved registers.
> -
> -Doing that removes the need for the callee_offset field.
> -Other than that, this is not a win on its own.  It only really
> -makes sense in combination with the follow-on patches.
> -
> -gcc/
> -	* config/aarch64/aarch64.h (aarch64_frame::callee_offset): Delete.
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Remove
> -	callee_offset handling.
> -	(aarch64_save_callee_saves): Replace the start_offset parameter
> -	with a bytes_below_sp parameter.
> -	(aarch64_restore_callee_saves): Likewise.
> -	(aarch64_expand_prologue): Update accordingly.
> -	(aarch64_expand_epilogue): Likewise.
> ----
> - gcc/config/aarch64/aarch64.c | 56 ++++++++++++++++++-----------------=
-
> - gcc/config/aarch64/aarch64.h |  4 ---
> - 2 files changed, 28 insertions(+), 32 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index e03adf57226..96e99f6c17a 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7602,7 +7602,6 @@ aarch64_layout_frame (void)
> -   frame.final_adjust =3D 0;
> -   frame.callee_adjust =3D 0;
> -   frame.sve_callee_adjust =3D 0;
> --  frame.callee_offset =3D 0;
> -
> -   HOST_WIDE_INT max_push_offset =3D 0;
> -   if (frame.wb_candidate2 !=3D INVALID_REGNUM)
> -@@ -7642,7 +7641,6 @@ aarch64_layout_frame (void)
> - 	 stp reg1, reg2, [sp, bytes_below_saved_regs]
> - 	 stp reg3, reg4, [sp, bytes_below_saved_regs + 16]  */
> -       frame.initial_adjust =3D frame.frame_size;
> --      frame.callee_offset =3D const_below_saved_regs;
> -     }
> -   else if (saves_below_hard_fp_p
> - 	   && known_eq (frame.saved_regs_size,
> -@@ -7989,12 +7987,13 @@ aarch64_add_cfa_expression (rtx_insn *insn, rt=
x reg,
> - }
> -
> - /* Emit code to save the callee-saved registers from register number =
START
> --   to LIMIT to the stack at the location starting at offset START_OFF=
SET,
> --   skipping any write-back candidates if SKIP_WB is true.  HARD_FP_VA=
LID_P
> --   is true if the hard frame pointer has been set up.  */
> -+   to LIMIT to the stack.  The stack pointer is currently BYTES_BELOW=
_SP
> -+   bytes above the bottom of the static frame.  Skip any write-back
> -+   candidates if SKIP_WB is true.  HARD_FP_VALID_P is true if the har=
d
> -+   frame pointer has been set up.  */
> -
> - static void
> --aarch64_save_callee_saves (poly_int64 start_offset,
> -+aarch64_save_callee_saves (poly_int64 bytes_below_sp,
> - 			   unsigned start, unsigned limit, bool skip_wb,
> - 			   bool hard_fp_valid_p)
> - {
> -@@ -8022,7 +8021,9 @@ aarch64_save_callee_saves (poly_int64 start_offs=
et,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D start_offset + frame.reg_offset[regno];
> -+      offset =3D (frame.reg_offset[regno]
> -+		+ frame.bytes_below_saved_regs
> -+		- bytes_below_sp);
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       poly_int64 sp_offset =3D offset;
> -
> -@@ -8033,9 +8034,7 @@ aarch64_save_callee_saves (poly_int64 start_offs=
et,
> -       else if (GP_REGNUM_P (regno)
> - 	       && (!offset.is_constant (&const_offset) || const_offset >=3D =
512))
> - 	{
> --	  gcc_assert (known_eq (start_offset, 0));
> --	  poly_int64 fp_offset
> --	    =3D frame.below_hard_fp_saved_regs_size;
> -+	  poly_int64 fp_offset =3D frame.bytes_below_hard_fp - bytes_below_s=
p;
> - 	  if (hard_fp_valid_p)
> - 	    base_rtx =3D hard_frame_pointer_rtx;
> - 	  else
> -@@ -8099,12 +8098,13 @@ aarch64_save_callee_saves (poly_int64 start_of=
fset,
> - }
> -
> - /* Emit code to restore the callee registers from register number STA=
RT
> --   up to and including LIMIT.  Restore from the stack offset START_OF=
FSET,
> --   skipping any write-back candidates if SKIP_WB is true.  Write the
> --   appropriate REG_CFA_RESTORE notes into CFI_OPS.  */
> -+   up to and including LIMIT.  The stack pointer is currently BYTES_B=
ELOW_SP
> -+   bytes above the bottom of the static frame.  Skip any write-back
> -+   candidates if SKIP_WB is true.  Write the appropriate REG_CFA_REST=
ORE
> -+   notes into CFI_OPS.  */
> -
> - static void
> --aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start=
,
> -+aarch64_restore_callee_saves (poly_int64 bytes_below_sp, unsigned sta=
rt,
> - 			      unsigned limit, bool skip_wb, rtx *cfi_ops)
> - {
> -   aarch64_frame &frame =3D cfun->machine->frame;
> -@@ -8130,7 +8130,9 @@ aarch64_restore_callee_saves (poly_int64 start_o=
ffset, unsigned start,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D start_offset + frame.reg_offset[regno];
> -+      offset =3D (frame.reg_offset[regno]
> -+		+ frame.bytes_below_saved_regs
> -+		- bytes_below_sp);
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> - 	aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
> -@@ -8906,8 +8908,6 @@ aarch64_expand_prologue (void)
> -   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -   poly_int64 final_adjust =3D frame.final_adjust;
> -   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> --  poly_int64 below_hard_fp_saved_regs_size
> --    =3D frame.below_hard_fp_saved_regs_size;
> -   unsigned reg1 =3D frame.wb_candidate1;
> -   unsigned reg2 =3D frame.wb_candidate2;
> -   bool emit_frame_chain =3D frame.emit_frame_chain;
> -@@ -8979,8 +8979,8 @@ aarch64_expand_prologue (void)
> - 			     - frame.hard_fp_offset);
> -   gcc_assert (known_ge (chain_offset, 0));
> -
> --  /* The offset of the bottom of the save area from the current SP.  =
*/
> --  poly_int64 saved_regs_offset =3D chain_offset - below_hard_fp_saved=
_regs_size;
> -+  /* The offset of the current SP from the bottom of the static frame=
.  */
> -+  poly_int64 bytes_below_sp =3D frame_size - initial_adjust - callee_=
adjust;
> -
> -   if (emit_frame_chain)
> -     {
> -@@ -8988,7 +8988,7 @@ aarch64_expand_prologue (void)
> - 	{
> - 	  reg1 =3D R29_REGNUM;
> - 	  reg2 =3D R30_REGNUM;
> --	  aarch64_save_callee_saves (saved_regs_offset, reg1, reg2,
> -+	  aarch64_save_callee_saves (bytes_below_sp, reg1, reg2,
> - 				     false, false);
> - 	}
> -       else
> -@@ -9028,7 +9028,7 @@ aarch64_expand_prologue (void)
> -       emit_insn (gen_stack_tie (stack_pointer_rtx, hard_frame_pointer=
_rtx));
> -     }
> -
> --  aarch64_save_callee_saves (saved_regs_offset, R0_REGNUM, R30_REGNUM=
,
> -+  aarch64_save_callee_saves (bytes_below_sp, R0_REGNUM, R30_REGNUM,
> - 			     callee_adjust !=3D 0 || emit_frame_chain,
> - 			     emit_frame_chain);
> -   if (maybe_ne (sve_callee_adjust, 0))
> -@@ -9038,16 +9038,17 @@ aarch64_expand_prologue (void)
> -       aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx,
> - 					      sve_callee_adjust,
> - 					      !frame_pointer_needed, false);
> --      saved_regs_offset +=3D sve_callee_adjust;
> -+      bytes_below_sp -=3D sve_callee_adjust;
> -     }
> --  aarch64_save_callee_saves (saved_regs_offset, P0_REGNUM, P15_REGNUM=
,
> -+  aarch64_save_callee_saves (bytes_below_sp, P0_REGNUM, P15_REGNUM,
> - 			     false, emit_frame_chain);
> --  aarch64_save_callee_saves (saved_regs_offset, V0_REGNUM, V31_REGNUM=
,
> -+  aarch64_save_callee_saves (bytes_below_sp, V0_REGNUM, V31_REGNUM,
> - 			     callee_adjust !=3D 0 || emit_frame_chain,
> - 			     emit_frame_chain);
> -
> -   /* We may need to probe the final adjustment if it is larger than t=
he guard
> -      that is assumed by the called.  */
> -+  gcc_assert (known_eq (bytes_below_sp, final_adjust));
> -   aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx, final_a=
djust,
> - 					  !frame_pointer_needed, true);
> - }
> -@@ -9082,7 +9083,6 @@ aarch64_expand_epilogue (bool for_sibcall)
> -   poly_int64 initial_adjust =3D frame.initial_adjust;
> -   HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
> -   poly_int64 final_adjust =3D frame.final_adjust;
> --  poly_int64 callee_offset =3D frame.callee_offset;
> -   poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
> -   poly_int64 bytes_below_hard_fp =3D frame.bytes_below_hard_fp;
> -   unsigned reg1 =3D frame.wb_candidate1;
> -@@ -9150,13 +9150,13 @@ aarch64_expand_epilogue (bool for_sibcall)
> -
> -   /* Restore the vector registers before the predicate registers,
> -      so that we can use P4 as a temporary for big-endian SVE frames. =
 */
> --  aarch64_restore_callee_saves (callee_offset, V0_REGNUM, V31_REGNUM,
> -+  aarch64_restore_callee_saves (final_adjust, V0_REGNUM, V31_REGNUM,
> - 				callee_adjust !=3D 0, &cfi_ops);
> --  aarch64_restore_callee_saves (callee_offset, P0_REGNUM, P15_REGNUM,
> -+  aarch64_restore_callee_saves (final_adjust, P0_REGNUM, P15_REGNUM,
> - 				false, &cfi_ops);
> -   if (maybe_ne (sve_callee_adjust, 0))
> -     aarch64_add_sp (NULL_RTX, NULL_RTX, sve_callee_adjust, true);
> --  aarch64_restore_callee_saves (callee_offset - sve_callee_adjust,
> -+  aarch64_restore_callee_saves (final_adjust + sve_callee_adjust,
> - 				R0_REGNUM, R30_REGNUM,
> - 				callee_adjust !=3D 0, &cfi_ops);
> -
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64=
.h
> -index 21ac920a3fe..57e67217745 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -873,10 +873,6 @@ struct GTY (()) aarch64_frame
> -      It is zero when no push is used.  */
> -   HOST_WIDE_INT callee_adjust;
> -
> --  /* The offset from SP to the callee-save registers after initial_ad=
just.
> --     It may be non-zero if no push is used (ie. callee_adjust =3D=3D =
0).  */
> --  poly_int64 callee_offset;
> --
> -   /* The size of the stack adjustment before saving or after restorin=
g
> -      SVE registers.  */
> -   poly_int64 sve_callee_adjust;
> ---
> -2.34.1
> -
> -
> -From 7356df0319aefe4c68ef57ec4c6bd18c72188a34 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:46 +0100
> -Subject: [PATCH 07/19] aarch64: Only calculate chain_offset if there i=
s a
> - chain
> -
> -After previous patches, it is no longer necessary to calculate
> -a chain_offset in cases where there is no chain record.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_expand_prologue): Move the
> -	calculation of chain_offset into the emit_frame_chain block.
> ----
> - gcc/config/aarch64/aarch64.c | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 96e99f6c17a..cf5244b7ec0 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -8974,16 +8974,16 @@ aarch64_expand_prologue (void)
> -   if (callee_adjust !=3D 0)
> -     aarch64_push_regs (reg1, reg2, callee_adjust);
> -
> --  /* The offset of the frame chain record (if any) from the current S=
P.  */
> --  poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> --			     - frame.hard_fp_offset);
> --  gcc_assert (known_ge (chain_offset, 0));
> --
> -   /* The offset of the current SP from the bottom of the static frame=
.  */
> -   poly_int64 bytes_below_sp =3D frame_size - initial_adjust - callee_=
adjust;
> -
> -   if (emit_frame_chain)
> -     {
> -+      /* The offset of the frame chain record (if any) from the curre=
nt SP.  */
> -+      poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> -+				 - frame.hard_fp_offset);
> -+      gcc_assert (known_ge (chain_offset, 0));
> -+
> -       if (callee_adjust =3D=3D 0)
> - 	{
> - 	  reg1 =3D R29_REGNUM;
> ---
> -2.34.1
> -
> -
> -From 82fb69e75c21010f7afc72bb842751164fe8fc72 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:46 +0100
> -Subject: [PATCH 08/19] aarch64: Rename locals_offset to bytes_above_lo=
cals
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -locals_offset was described as:
> -
> -  /* Offset from the base of the frame (incomming SP) to the
> -     top of the locals area.  This value is always a multiple of
> -     STACK_BOUNDARY.  */
> -
> -This is implicitly an =E2=80=9Cupside down=E2=80=9D view of the frame:=
 the incoming
> -SP is at offset 0, and anything N bytes below the incoming SP is at
> -offset N (rather than -N).
> -
> -However, reg_offset instead uses a =E2=80=9Cright way up=E2=80=9D view=
; that is,
> -it views offsets in address terms.  Something above X is at a
> -positive offset from X and something below X is at a negative
> -offset from X.
> -
> -Also, even on FRAME_GROWS_DOWNWARD targets like AArch64,
> -target-independent code views offsets in address terms too:
> -locals are allocated at negative offsets to virtual_stack_vars.
> -
> -It seems confusing to have *_offset fields of the same structure
> -using different polarities like this.  This patch tries to avoid
> -that by renaming locals_offset to bytes_above_locals.
> -
> -gcc/
> -	* config/aarch64/aarch64.h (aarch64_frame::locals_offset): Rename to.=
..
> -	(aarch64_frame::bytes_above_locals): ...this.
> -	* config/aarch64/aarch64.c (aarch64_layout_frame)
> -	(aarch64_initial_elimination_offset): Update accordingly.
> ----
> - gcc/config/aarch64/aarch64.c | 6 +++---
> - gcc/config/aarch64/aarch64.h | 6 +++---
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index cf5244b7ec0..d54f7a89306 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7596,7 +7596,7 @@ aarch64_layout_frame (void)
> - 			  STACK_BOUNDARY / BITS_PER_UNIT));
> -   frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved=
_regs;
> -
> --  frame.locals_offset =3D frame.saved_varargs_size;
> -+  frame.bytes_above_locals =3D frame.saved_varargs_size;
> -
> -   frame.initial_adjust =3D 0;
> -   frame.final_adjust =3D 0;
> -@@ -11758,13 +11758,13 @@ aarch64_initial_elimination_offset (unsigned=
 from, unsigned to)
> - 	return frame.hard_fp_offset;
> -
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --	return frame.hard_fp_offset - frame.locals_offset;
> -+	return frame.hard_fp_offset - frame.bytes_above_locals;
> -     }
> -
> -   if (to =3D=3D STACK_POINTER_REGNUM)
> -     {
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --	return frame.frame_size - frame.locals_offset;
> -+	return frame.frame_size - frame.bytes_above_locals;
> -     }
> -
> -   return frame.frame_size;
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64=
.h
> -index 57e67217745..3c5e3dd429d 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -851,10 +851,10 @@ struct GTY (()) aarch64_frame
> -      always a multiple of STACK_BOUNDARY.  */
> -   poly_int64 bytes_below_hard_fp;
> -
> --  /* Offset from the base of the frame (incomming SP) to the
> --     top of the locals area.  This value is always a multiple of
> -+  /* The number of bytes between the top of the locals area and the t=
op
> -+     of the frame (the incomming SP).  This value is always a multipl=
e of
> -      STACK_BOUNDARY.  */
> --  poly_int64 locals_offset;
> -+  poly_int64 bytes_above_locals;
> -
> -   /* Offset from the base of the frame (incomming SP) to the
> -      hard_frame_pointer.  This value is always a multiple of
> ---
> -2.34.1
> -
> -
> -From fa6600b55b49ee14d8288f13719ceea2a75eea60 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:47 +0100
> -Subject: [PATCH 09/19] aarch64: Rename hard_fp_offset to bytes_above_h=
ard_fp
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Similarly to the previous locals_offset patch, hard_fp_offset
> -was described as:
> -
> -  /* Offset from the base of the frame (incomming SP) to the
> -     hard_frame_pointer.  This value is always a multiple of
> -     STACK_BOUNDARY.  */
> -  poly_int64 hard_fp_offset;
> -
> -which again took an =E2=80=9Cupside-down=E2=80=9D view: higher offsets=
 meant lower
> -addresses.  This patch renames the field to bytes_above_hard_fp instea=
d.
> -
> -gcc/
> -	* config/aarch64/aarch64.h (aarch64_frame::hard_fp_offset): Rename
> -	to...
> -	(aarch64_frame::bytes_above_hard_fp): ...this.
> -	* config/aarch64/aarch64.c (aarch64_layout_frame)
> -	(aarch64_expand_prologue): Update accordingly.
> -	(aarch64_initial_elimination_offset): Likewise.
> ----
> - gcc/config/aarch64/aarch64.c | 26 +++++++++++++-------------
> - gcc/config/aarch64/aarch64.h |  6 +++---
> - 2 files changed, 16 insertions(+), 16 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index d54f7a89306..23cb084e5a7 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7588,7 +7588,7 @@ aarch64_layout_frame (void)
> - 			   + get_frame_size (),
> - 			   STACK_BOUNDARY / BITS_PER_UNIT);
> -
> --  frame.hard_fp_offset
> -+  frame.bytes_above_hard_fp
> -     =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
> -
> -   /* Both these values are already aligned.  */
> -@@ -7609,13 +7609,13 @@ aarch64_layout_frame (void)
> -   else if (frame.wb_candidate1 !=3D INVALID_REGNUM)
> -     max_push_offset =3D 256;
> -
> --  HOST_WIDE_INT const_size, const_below_saved_regs, const_fp_offset;
> -+  HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
> -   HOST_WIDE_INT const_saved_regs_size;
> -   if (known_eq (frame.saved_regs_size, 0))
> -     frame.initial_adjust =3D frame.frame_size;
> -   else if (frame.frame_size.is_constant (&const_size)
> - 	   && const_size < max_push_offset
> --	   && known_eq (frame.hard_fp_offset, const_size))
> -+	   && known_eq (frame.bytes_above_hard_fp, const_size))
> -     {
> -       /* Simple, small frame with no data below the saved registers.
> -
> -@@ -7632,8 +7632,8 @@ aarch64_layout_frame (void)
> - 	      case that it hardly seems worth the effort though.  */
> - 	   && (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D 0)
> - 	   && !(cfun->calls_alloca
> --		&& frame.hard_fp_offset.is_constant (&const_fp_offset)
> --		&& const_fp_offset < max_push_offset))
> -+		&& frame.bytes_above_hard_fp.is_constant (&const_above_fp)
> -+		&& const_above_fp < max_push_offset))
> -     {
> -       /* Frame with small area below the saved registers:
> -
> -@@ -7651,12 +7651,12 @@ aarch64_layout_frame (void)
> - 	 sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
> - 	 save SVE registers relative to SP
> - 	 sub sp, sp, bytes_below_saved_regs  */
> --      frame.initial_adjust =3D (frame.hard_fp_offset
> -+      frame.initial_adjust =3D (frame.bytes_above_hard_fp
> - 			      + frame.below_hard_fp_saved_regs_size);
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> --  else if (frame.hard_fp_offset.is_constant (&const_fp_offset)
> --	   && const_fp_offset < max_push_offset)
> -+  else if (frame.bytes_above_hard_fp.is_constant (&const_above_fp)
> -+	   && const_above_fp < max_push_offset)
> -     {
> -       /* Frame with large area below the saved registers, or with SVE=
 saves,
> - 	 but with a small area above:
> -@@ -7666,7 +7666,7 @@ aarch64_layout_frame (void)
> - 	 [sub sp, sp, below_hard_fp_saved_regs_size]
> - 	 [save SVE registers relative to SP]
> - 	 sub sp, sp, bytes_below_saved_regs  */
> --      frame.callee_adjust =3D const_fp_offset;
> -+      frame.callee_adjust =3D const_above_fp;
> -       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size=
;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -@@ -7681,7 +7681,7 @@ aarch64_layout_frame (void)
> - 	 [sub sp, sp, below_hard_fp_saved_regs_size]
> - 	 [save SVE registers relative to SP]
> - 	 sub sp, sp, bytes_below_saved_regs  */
> --      frame.initial_adjust =3D frame.hard_fp_offset;
> -+      frame.initial_adjust =3D frame.bytes_above_hard_fp;
> -       frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size=
;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -@@ -8981,7 +8981,7 @@ aarch64_expand_prologue (void)
> -     {
> -       /* The offset of the frame chain record (if any) from the curre=
nt SP.  */
> -       poly_int64 chain_offset =3D (initial_adjust + callee_adjust
> --				 - frame.hard_fp_offset);
> -+				 - frame.bytes_above_hard_fp);
> -       gcc_assert (known_ge (chain_offset, 0));
> -
> -       if (callee_adjust =3D=3D 0)
> -@@ -11755,10 +11755,10 @@ aarch64_initial_elimination_offset (unsigned=
 from, unsigned to)
> -   if (to =3D=3D HARD_FRAME_POINTER_REGNUM)
> -     {
> -       if (from =3D=3D ARG_POINTER_REGNUM)
> --	return frame.hard_fp_offset;
> -+	return frame.bytes_above_hard_fp;
> -
> -       if (from =3D=3D FRAME_POINTER_REGNUM)
> --	return frame.hard_fp_offset - frame.bytes_above_locals;
> -+	return frame.bytes_above_hard_fp - frame.bytes_above_locals;
> -     }
> -
> -   if (to =3D=3D STACK_POINTER_REGNUM)
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64=
.h
> -index 3c5e3dd429d..9291cfd3ec8 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -856,10 +856,10 @@ struct GTY (()) aarch64_frame
> -      STACK_BOUNDARY.  */
> -   poly_int64 bytes_above_locals;
> -
> --  /* Offset from the base of the frame (incomming SP) to the
> --     hard_frame_pointer.  This value is always a multiple of
> -+  /* The number of bytes between the hard_frame_pointer and the top o=
f
> -+     the frame (the incomming SP).  This value is always a multiple o=
f
> -      STACK_BOUNDARY.  */
> --  poly_int64 hard_fp_offset;
> -+  poly_int64 bytes_above_hard_fp;
> -
> -   /* The size of the frame.  This value is the offset from base of th=
e
> -      frame (incomming SP) to the stack_pointer.  This value is always
> ---
> -2.34.1
> -
> -
> -From b8cd5a0229da78c2d1289d54731fbef0126617d5 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:47 +0100
> -Subject: [PATCH 10/19] aarch64: Tweak frame_size comment
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -This patch fixes another case in which a value was described with
> -an =E2=80=9Cupside-down=E2=80=9D view.
> -
> -gcc/
> -	* config/aarch64/aarch64.h (aarch64_frame::frame_size): Tweak comment.
> ----
> - gcc/config/aarch64/aarch64.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64=
.h
> -index 9291cfd3ec8..82883ad5a0d 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -861,8 +861,8 @@ struct GTY (()) aarch64_frame
> -      STACK_BOUNDARY.  */
> -   poly_int64 bytes_above_hard_fp;
> -
> --  /* The size of the frame.  This value is the offset from base of th=
e
> --     frame (incomming SP) to the stack_pointer.  This value is always
> -+  /* The size of the frame, i.e. the number of bytes between the bott=
om
> -+     of the outgoing arguments and the incoming SP.  This value is al=
ways
> -      a multiple of STACK_BOUNDARY.  */
> -   poly_int64 frame_size;
> -
> ---
> -2.34.1
> -
> -
> -From 999c4a81cffddb850d6ab0f6d3a8de3e704d2f7a Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:48 +0100
> -Subject: [PATCH 11/19] aarch64: Measure reg_offset from the bottom of =
the
> - frame
> -
> -reg_offset was measured from the bottom of the saved register area.
> -This made perfect sense with the original layout, since the bottom
> -of the saved register area was also the hard frame pointer address.
> -It became slightly less obvious with SVE, since we save SVE
> -registers below the hard frame pointer, but it still made sense.
> -
> -However, if we want to allow different frame layouts, it's more
> -convenient and obvious to measure reg_offset from the bottom of
> -the frame.  After previous patches, it's also a slight simplification
> -in its own right.
> -
> -gcc/
> -	* config/aarch64/aarch64.h (aarch64_frame): Add comment above
> -	reg_offset.
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Walk offsets
> -	from the bottom of the frame, rather than the bottom of the saved
> -	register area.  Measure reg_offset from the bottom of the frame
> -	rather than the bottom of the saved register area.
> -	(aarch64_save_callee_saves): Update accordingly.
> -	(aarch64_restore_callee_saves): Likewise.
> -	(aarch64_get_separate_components): Likewise.
> -	(aarch64_process_components): Likewise.
> ----
> - gcc/config/aarch64/aarch64.c | 53 ++++++++++++++++-------------------=
-
> - gcc/config/aarch64/aarch64.h |  3 ++
> - 2 files changed, 27 insertions(+), 29 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 23cb084e5a7..45ff664cba6 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7398,7 +7398,6 @@ aarch64_needs_frame_chain (void)
> - static void
> - aarch64_layout_frame (void)
> - {
> --  poly_int64 offset =3D 0;
> -   int regno, last_fp_reg =3D INVALID_REGNUM;
> -   machine_mode vector_save_mode =3D aarch64_reg_save_mode (V8_REGNUM)=
;
> -   poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mode);
> -@@ -7476,7 +7475,9 @@ aarch64_layout_frame (void)
> -   gcc_assert (crtl->is_leaf
> - 	      || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRED))=
;
> -
> --  frame.bytes_below_saved_regs =3D crtl->outgoing_args_size;
> -+  poly_int64 offset =3D crtl->outgoing_args_size;
> -+  gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -+  frame.bytes_below_saved_regs =3D offset;
> -
> -   /* Now assign stack slots for the registers.  Start with the predic=
ate
> -      registers, since predicate LDR and STR have a relatively small
> -@@ -7488,7 +7489,8 @@ aarch64_layout_frame (void)
> - 	offset +=3D BYTES_PER_SVE_PRED;
> -       }
> -
> --  if (maybe_ne (offset, 0))
> -+  poly_int64 saved_prs_size =3D offset - frame.bytes_below_saved_regs=
;
> -+  if (maybe_ne (saved_prs_size, 0))
> -     {
> -       /* If we have any vector registers to save above the predicate =
registers,
> - 	 the offset of the vector register save slots need to be a multiple
> -@@ -7506,10 +7508,10 @@ aarch64_layout_frame (void)
> - 	offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_UN=
IT);
> -       else
> - 	{
> --	  if (known_le (offset, vector_save_size))
> --	    offset =3D vector_save_size;
> --	  else if (known_le (offset, vector_save_size * 2))
> --	    offset =3D vector_save_size * 2;
> -+	  if (known_le (saved_prs_size, vector_save_size))
> -+	    offset =3D frame.bytes_below_saved_regs + vector_save_size;
> -+	  else if (known_le (saved_prs_size, vector_save_size * 2))
> -+	    offset =3D frame.bytes_below_saved_regs + vector_save_size * 2;
> - 	  else
> - 	    gcc_unreachable ();
> - 	}
> -@@ -7526,9 +7528,10 @@ aarch64_layout_frame (void)
> -
> -   /* OFFSET is now the offset of the hard frame pointer from the bott=
om
> -      of the callee save area.  */
> --  bool saves_below_hard_fp_p =3D maybe_ne (offset, 0);
> --  frame.below_hard_fp_saved_regs_size =3D offset;
> --  frame.bytes_below_hard_fp =3D offset + frame.bytes_below_saved_regs=
;
> -+  frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_=
saved_regs;
> -+  bool saves_below_hard_fp_p
> -+    =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> -+  frame.bytes_below_hard_fp =3D offset;
> -   if (frame.emit_frame_chain)
> -     {
> -       /* FP and LR are placed in the linkage record.  */
> -@@ -7579,9 +7582,10 @@ aarch64_layout_frame (void)
> -
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_U=
NIT);
> -
> --  frame.saved_regs_size =3D offset;
> -+  frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> -
> --  poly_int64 varargs_and_saved_regs_size =3D offset + frame.saved_var=
args_size;
> -+  poly_int64 varargs_and_saved_regs_size
> -+    =3D frame.saved_regs_size + frame.saved_varargs_size;
> -
> -   poly_int64 saved_regs_and_above
> -     =3D aligned_upper_bound (varargs_and_saved_regs_size
> -@@ -8021,9 +8025,7 @@ aarch64_save_callee_saves (poly_int64 bytes_belo=
w_sp,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D (frame.reg_offset[regno]
> --		+ frame.bytes_below_saved_regs
> --		- bytes_below_sp);
> -+      offset =3D frame.reg_offset[regno] - bytes_below_sp;
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       poly_int64 sp_offset =3D offset;
> -
> -@@ -8130,9 +8132,7 @@ aarch64_restore_callee_saves (poly_int64 bytes_b=
elow_sp, unsigned start,
> -
> -       machine_mode mode =3D aarch64_reg_save_mode (regno);
> -       reg =3D gen_rtx_REG (mode, regno);
> --      offset =3D (frame.reg_offset[regno]
> --		+ frame.bytes_below_saved_regs
> --		- bytes_below_sp);
> -+      offset =3D frame.reg_offset[regno] - bytes_below_sp;
> -       rtx base_rtx =3D stack_pointer_rtx;
> -       if (mode =3D=3D VNx2DImode && BYTES_BIG_ENDIAN)
> - 	aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
> -@@ -8271,14 +8271,12 @@ aarch64_get_separate_components (void)
> - 	   it as a stack probe for -fstack-clash-protection.  */
> - 	if (flag_stack_clash_protection
> - 	    && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
> --	    && known_eq (offset, 0))
> -+	    && known_eq (offset, frame.bytes_below_saved_regs))
> - 	  continue;
> -
> - 	/* Get the offset relative to the register we'll use.  */
> - 	if (frame_pointer_needed)
> --	  offset -=3D frame.below_hard_fp_saved_regs_size;
> --	else
> --	  offset +=3D frame.bytes_below_saved_regs;
> -+	  offset -=3D frame.bytes_below_hard_fp;
> -
> - 	/* Check that we can access the stack slot of the register with one
> - 	   direct load with no adjustments needed.  */
> -@@ -8425,9 +8423,7 @@ aarch64_process_components (sbitmap components, =
bool prologue_p)
> -       rtx reg =3D gen_rtx_REG (mode, regno);
> -       poly_int64 offset =3D frame.reg_offset[regno];
> -       if (frame_pointer_needed)
> --	offset -=3D frame.below_hard_fp_saved_regs_size;
> --      else
> --	offset +=3D frame.bytes_below_saved_regs;
> -+	offset -=3D frame.bytes_below_hard_fp;
> -
> -       rtx addr =3D plus_constant (Pmode, ptr_reg, offset);
> -       rtx mem =3D gen_frame_mem (mode, addr);
> -@@ -8479,9 +8475,7 @@ aarch64_process_components (sbitmap components, =
bool prologue_p)
> -       /* REGNO2 can be saved/restored in a pair with REGNO.  */
> -       rtx reg2 =3D gen_rtx_REG (mode, regno2);
> -       if (frame_pointer_needed)
> --	offset2 -=3D frame.below_hard_fp_saved_regs_size;
> --      else
> --	offset2 +=3D frame.bytes_below_saved_regs;
> -+	offset2 -=3D frame.bytes_below_hard_fp;
> -       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
> -       rtx mem2 =3D gen_frame_mem (mode, addr2);
> -       rtx set2 =3D prologue_p ? gen_rtx_SET (mem2, reg2)
> -@@ -8597,7 +8591,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
> -   if (final_adjustment_p
> -       && known_eq (frame.below_hard_fp_saved_regs_size, 0))
> -     {
> --      poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM];
> -+      poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM]
> -+			      - frame.bytes_below_saved_regs);
> -       if (known_ge (lr_offset, 0))
> - 	min_probe_threshold -=3D lr_offset.to_constant ();
> -       else
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64=
.h
> -index 82883ad5a0d..c8ec3d58495 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -826,6 +826,9 @@ extern enum aarch64_processor aarch64_tune;
> - #ifdef HAVE_POLY_INT_H
> - struct GTY (()) aarch64_frame
> - {
> -+  /* The offset from the bottom of the static frame (the bottom of th=
e
> -+     outgoing arguments) of each register save slot, or -2 if no save=
 is
> -+     needed.  */
> -   poly_int64 reg_offset[LAST_SAVED_REGNUM + 1];
> -
> -   /* The number of extra stack bytes taken up by register varargs.
> ---
> -2.34.1
> -
> -
> -From 8b664cc8f05c8130e8ca73a59ae2751cdef8a0ea Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:48 +0100
> -Subject: [PATCH 12/19] aarch64: Simplify top of frame allocation
> -
> -After previous patches, it no longer really makes sense to allocate
> -the top of the frame in terms of varargs_and_saved_regs_size and
> -saved_regs_and_above.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Simplify
> -	the allocation of the top of the frame.
> ----
> - gcc/config/aarch64/aarch64.c | 23 ++++++++---------------
> - 1 file changed, 8 insertions(+), 15 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 45ff664cba6..779547d0344 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7584,23 +7584,16 @@ aarch64_layout_frame (void)
> -
> -   frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> -
> --  poly_int64 varargs_and_saved_regs_size
> --    =3D frame.saved_regs_size + frame.saved_varargs_size;
> --
> --  poly_int64 saved_regs_and_above
> --    =3D aligned_upper_bound (varargs_and_saved_regs_size
> --			   + get_frame_size (),
> --			   STACK_BOUNDARY / BITS_PER_UNIT);
> --
> --  frame.bytes_above_hard_fp
> --    =3D saved_regs_and_above - frame.below_hard_fp_saved_regs_size;
> -+  offset +=3D get_frame_size ();
> -+  offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_U=
NIT);
> -+  auto top_of_locals =3D offset;
> -
> --  /* Both these values are already aligned.  */
> --  gcc_assert (multiple_p (frame.bytes_below_saved_regs,
> --			  STACK_BOUNDARY / BITS_PER_UNIT));
> --  frame.frame_size =3D saved_regs_and_above + frame.bytes_below_saved=
_regs;
> -+  offset +=3D frame.saved_varargs_size;
> -+  gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -+  frame.frame_size =3D offset;
> -
> --  frame.bytes_above_locals =3D frame.saved_varargs_size;
> -+  frame.bytes_above_hard_fp =3D frame.frame_size - frame.bytes_below_=
hard_fp;
> -+  frame.bytes_above_locals =3D frame.frame_size - top_of_locals;
> -
> -   frame.initial_adjust =3D 0;
> -   frame.final_adjust =3D 0;
> ---
> -2.34.1
> -
> -
> -From bb4600071acc3a02db4f37ffb95c8495ad76a140 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:49 +0100
> -Subject: [PATCH 13/19] aarch64: Minor initial adjustment tweak
> -
> -This patch just changes a calculation of initial_adjust
> -to one that makes it slightly more obvious that the total
> -adjustment is frame.frame_size.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Tweak
> -	calculation of initial_adjust for frames in which all saves
> -	are SVE saves.
> ----
> - gcc/config/aarch64/aarch64.c | 5 ++---
> - 1 file changed, 2 insertions(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 779547d0344..0b8992ada74 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7645,11 +7645,10 @@ aarch64_layout_frame (void)
> -     {
> -       /* Frame in which all saves are SVE saves:
> -
> --	 sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
> -+	 sub sp, sp, frame_size - bytes_below_saved_regs
> - 	 save SVE registers relative to SP
> - 	 sub sp, sp, bytes_below_saved_regs  */
> --      frame.initial_adjust =3D (frame.bytes_above_hard_fp
> --			      + frame.below_hard_fp_saved_regs_size);
> -+      frame.initial_adjust =3D frame.frame_size - frame.bytes_below_s=
aved_regs;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -   else if (frame.bytes_above_hard_fp.is_constant (&const_above_fp)
> ---
> -2.34.1
> -
> -
> -From f22329d5efbacf80edf4a2d45ebadd93f283252c Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:49 +0100
> -Subject: [PATCH 14/19] aarch64: Tweak stack clash boundary condition
> -
> -The AArch64 ABI says that, when stack clash protection is used,
> -there can be a maximum of 1KiB of unprobed space at sp on entry
> -to a function.  Therefore, we need to probe when allocating
> ->=3D guard_size - 1KiB of data (>=3D rather than >).  This is what
> -GCC does.
> -
> -If an allocation is exactly guard_size bytes, it is enough to allocate
> -those bytes and probe once at offset 1024.  It isn't possible to use a
> -single probe at any other offset: higher would conmplicate later code,
> -by leaving more unprobed space than usual, while lower would risk
> -leaving an entire page unprobed.  For simplicity, the code probes all
> -allocations at offset 1024.
> -
> -Some register saves also act as probes.  If we need to allocate
> -more space below the last such register save probe, we need to
> -probe the allocation if it is > 1KiB.  Again, this allocation is
> -then sometimes (but not always) probed at offset 1024.  This sort of
> -allocation is currently only used for outgoing arguments, which are
> -rarely this big.
> -
> -However, the code also probed if this final outgoing-arguments
> -allocation was =3D=3D 1KiB, rather than just > 1KiB.  This isn't
> -necessary, since the register save then probes at offset 1024
> -as required.  Continuing to probe allocations of exactly 1KiB
> -would complicate later patches.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_allocate_and_probe_stack_space):
> -	Don't probe final allocations that are exactly 1KiB in size (after
> -	unprobed space above the final allocation has been deducted).
> -
> -gcc/testsuite/
> -	* gcc.target/aarch64/stack-check-prologue-17.c: New test.
> ----
> - gcc/config/aarch64/aarch64.c                  |  4 +-
> - .../aarch64/stack-check-prologue-17.c         | 55 ++++++++++++++++++=
+
> - 2 files changed, 58 insertions(+), 1 deletion(-)
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prolo=
gue-17.c
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 0b8992ada74..bfd24876195 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -8564,9 +8564,11 @@ aarch64_allocate_and_probe_stack_space (rtx tem=
p1, rtx temp2,
> -   HOST_WIDE_INT guard_size
> -     =3D 1 << param_stack_clash_protection_guard_size;
> -   HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUARD;
> -+  HOST_WIDE_INT byte_sp_alignment =3D STACK_BOUNDARY / BITS_PER_UNIT;
> -+  gcc_assert (multiple_p (poly_size, byte_sp_alignment));
> -   HOST_WIDE_INT min_probe_threshold
> -     =3D (final_adjustment_p
> --       ? guard_used_by_caller
> -+       ? guard_used_by_caller + byte_sp_alignment
> -        : guard_size - guard_used_by_caller);
> -   /* When doing the final adjustment for the outgoing arguments, take=
 into
> -      account any unprobed space there is above the current SP.  There=
 are
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.=
c b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -new file mode 100644
> -index 00000000000..0d8a25d73a2
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -@@ -0,0 +1,55 @@
> -+/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer --=
param stack-clash-protection-guard-size=3D12" } */
> -+/* { dg-final { check-function-bodies "**" "" } } */
> -+
> -+void f(int, ...);
> -+void g();
> -+
> -+/*
> -+** test1:
> -+**	...
> -+**	str	x30, \[sp\]
> -+**	sub	sp, sp, #1024
> -+**	cbnz	w0, .*
> -+**	bl	g
> -+**	...
> -+*/
> -+int test1(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test2:
> -+**	...
> -+**	str	x30, \[sp\]
> -+**	sub	sp, sp, #1040
> -+**	str	xzr, \[sp\]
> -+**	cbnz	w0, .*
> -+**	bl	g
> -+**	...
> -+*/
> -+int test2(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> ---
> -2.34.1
> -
> -
> -From 174a9747491e591ef2abb3e20a0332303f11003a Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:49 +0100
> -Subject: [PATCH 15/19] aarch64: Put LR save probe in first 16 bytes
> -
> --fstack-clash-protection uses the save of LR as a probe for the next
> -allocation.  The next allocation could be:
> -
> -* another part of the static frame, e.g. when allocating SVE save slot=
s
> -  or outgoing arguments
> -
> -* an alloca in the same function
> -
> -* an allocation made by a callee function
> -
> -However, when -fomit-frame-pointer is used, the LR save slot is placed
> -above the other GPR save slots.  It could therefore be up to 80 bytes
> -above the base of the GPR save area (which is also the hard fp address=
).
> -
> -aarch64_allocate_and_probe_stack_space took this into account when
> -deciding how much subsequent space could be allocated without needing
> -a probe.  However, it interacted badly with:
> -
> -      /* If doing a small final adjustment, we always probe at offset =
0.
> -	 This is done to avoid issues when LR is not at position 0 or when
> -	 the final adjustment is smaller than the probing offset.  */
> -      else if (final_adjustment_p && rounded_size =3D=3D 0)
> -	residual_probe_offset =3D 0;
> -
> -which forces any allocation that is smaller than the guard page size
> -to be probed at offset 0 rather than the usual offset 1024.  It was
> -therefore possible to construct cases in which we had:
> -
> -* a probe using LR at SP + 80 bytes (or some other value >=3D 16)
> -* an allocation of the guard page size - 16 bytes
> -* a probe at SP + 0
> -
> -which allocates guard page size + 64 consecutive unprobed bytes.
> -
> -This patch requires the LR probe to be in the first 16 bytes of the
> -save area when stack clash protection is active.  Doing it
> -unconditionally would cause code-quality regressions, but a later
> -patch deals with that.
> -
> -The new comment doesn't say that the probe register is required
> -to be LR, since a later patch removes that restriction.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Ensure that
> -	the LR save slot is in the first 16 bytes of the register save area.
> -	(aarch64_allocate_and_probe_stack_space): Remove workaround for
> -	when LR was not in the first 16 bytes.
> -
> -gcc/testsuite/
> -	* gcc.target/aarch64/stack-check-prologue-18.c: New test.
> ----
> - gcc/config/aarch64/aarch64.c                  |  61 ++++-------
> - .../aarch64/stack-check-prologue-18.c         | 100 +++++++++++++++++=
+
> - 2 files changed, 123 insertions(+), 38 deletions(-)
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-check-prolo=
gue-18.c
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index bfd24876195..3f2b10de987 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7532,26 +7532,34 @@ aarch64_layout_frame (void)
> -   bool saves_below_hard_fp_p
> -     =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> -   frame.bytes_below_hard_fp =3D offset;
> -+
> -+  auto allocate_gpr_slot =3D [&](unsigned int regno)
> -+    {
> -+      frame.reg_offset[regno] =3D offset;
> -+      if (frame.wb_candidate1 =3D=3D INVALID_REGNUM)
> -+	frame.wb_candidate1 =3D regno;
> -+      else if (frame.wb_candidate2 =3D=3D INVALID_REGNUM)
> -+	frame.wb_candidate2 =3D regno;
> -+      offset +=3D UNITS_PER_WORD;
> -+    };
> -+
> -   if (frame.emit_frame_chain)
> -     {
> -       /* FP and LR are placed in the linkage record.  */
> --      frame.reg_offset[R29_REGNUM] =3D offset;
> --      frame.wb_candidate1 =3D R29_REGNUM;
> --      frame.reg_offset[R30_REGNUM] =3D offset + UNITS_PER_WORD;
> --      frame.wb_candidate2 =3D R30_REGNUM;
> --      offset +=3D 2 * UNITS_PER_WORD;
> -+      allocate_gpr_slot (R29_REGNUM);
> -+      allocate_gpr_slot (R30_REGNUM);
> -     }
> -+  else if (flag_stack_clash_protection
> -+	   && known_eq (frame.reg_offset[R30_REGNUM], SLOT_REQUIRED))
> -+    /* Put the LR save slot first, since it makes a good choice of pr=
obe
> -+       for stack clash purposes.  The idea is that the link register =
usually
> -+       has to be saved before a call anyway, and so we lose little by
> -+       stopping it from being individually shrink-wrapped.  */
> -+    allocate_gpr_slot (R30_REGNUM);
> -
> -   for (regno =3D R0_REGNUM; regno <=3D R30_REGNUM; regno++)
> -     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> --      {
> --	frame.reg_offset[regno] =3D offset;
> --	if (frame.wb_candidate1 =3D=3D INVALID_REGNUM)
> --	  frame.wb_candidate1 =3D regno;
> --	else if (frame.wb_candidate2 =3D=3D INVALID_REGNUM)
> --	  frame.wb_candidate2 =3D regno;
> --	offset +=3D UNITS_PER_WORD;
> --      }
> -+      allocate_gpr_slot (regno);
> -
> -   poly_int64 max_int_offset =3D offset;
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_U=
NIT);
> -@@ -8570,29 +8578,6 @@ aarch64_allocate_and_probe_stack_space (rtx tem=
p1, rtx temp2,
> -     =3D (final_adjustment_p
> -        ? guard_used_by_caller + byte_sp_alignment
> -        : guard_size - guard_used_by_caller);
> --  /* When doing the final adjustment for the outgoing arguments, take=
 into
> --     account any unprobed space there is above the current SP.  There=
 are
> --     two cases:
> --
> --     - When saving SVE registers below the hard frame pointer, we for=
ce
> --       the lowest save to take place in the prologue before doing the=
 final
> --       adjustment (i.e. we don't allow the save to be shrink-wrapped).
> --       This acts as a probe at SP, so there is no unprobed space.
> --
> --     - When there are no SVE register saves, we use the store of the =
link
> --       register as a probe.  We can't assume that LR was saved at pos=
ition 0
> --       though, so treat any space below it as unprobed.  */
> --  if (final_adjustment_p
> --      && known_eq (frame.below_hard_fp_saved_regs_size, 0))
> --    {
> --      poly_int64 lr_offset =3D (frame.reg_offset[LR_REGNUM]
> --			      - frame.bytes_below_saved_regs);
> --      if (known_ge (lr_offset, 0))
> --	min_probe_threshold -=3D lr_offset.to_constant ();
> --      else
> --	gcc_assert (!flag_stack_clash_protection || known_eq (poly_size, 0))=
;
> --    }
> --
> -   poly_int64 frame_size =3D frame.frame_size;
> -
> -   /* We should always have a positive probe threshold.  */
> -@@ -8772,8 +8757,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
> -       if (final_adjustment_p && rounded_size !=3D 0)
> - 	min_probe_threshold =3D 0;
> -       /* If doing a small final adjustment, we always probe at offset=
 0.
> --	 This is done to avoid issues when LR is not at position 0 or when
> --	 the final adjustment is smaller than the probing offset.  */
> -+	 This is done to avoid issues when the final adjustment is smaller
> -+	 than the probing offset.  */
> -       else if (final_adjustment_p && rounded_size =3D=3D 0)
> - 	residual_probe_offset =3D 0;
> -
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.=
c b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -new file mode 100644
> -index 00000000000..82447d20fff
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -@@ -0,0 +1,100 @@
> -+/* { dg-options "-O2 -fstack-clash-protection -fomit-frame-pointer --=
param stack-clash-protection-guard-size=3D12" } */
> -+/* { dg-final { check-function-bodies "**" "" } } */
> -+
> -+void f(int, ...);
> -+void g();
> -+
> -+/*
> -+** test1:
> -+**	...
> -+**	str	x30, \[sp\]
> -+**	sub	sp, sp, #4064
> -+**	str	xzr, \[sp\]
> -+**	cbnz	w0, .*
> -+**	bl	g
> -+**	...
> -+**	str	x26, \[sp, #?4128\]
> -+**	...
> -+*/
> -+int test1(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      asm volatile ("" :::
> -+		    "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26");
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test2:
> -+**	...
> -+**	str	x30, \[sp\]
> -+**	sub	sp, sp, #1040
> -+**	str	xzr, \[sp\]
> -+**	cbnz	w0, .*
> -+**	bl	g
> -+**	...
> -+*/
> -+int test2(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      asm volatile ("" :::
> -+		    "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26");
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test3:
> -+**	...
> -+**	str	x30, \[sp\]
> -+**	sub	sp, sp, #1024
> -+**	cbnz	w0, .*
> -+**	bl	g
> -+**	...
> -+*/
> -+int test3(int z) {
> -+  __uint128_t x =3D 0;
> -+  int y[0x400];
> -+  if (z)
> -+    {
> -+      asm volatile ("" :::
> -+		    "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26");
> -+      f(0, 0, 0, 0, 0, 0, 0, &y,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
> -+	x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x);
> -+    }
> -+  g();
> -+  return 1;
> -+}
> ---
> -2.34.1
> -
> -
> -From e932e11c353be52256dd30d30d924f4e834e3ca3 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:51 +0100
> -Subject: [PATCH 16/19] aarch64: Simplify probe of final frame allocati=
on
> -
> -Previous patches ensured that the final frame allocation only needs
> -a probe when the size is strictly greater than 1KiB.  It's therefore
> -safe to use the normal 1024 probe offset in all cases.
> -
> -The main motivation for doing this is to simplify the code and
> -remove the number of special cases.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_allocate_and_probe_stack_space):
> -	Always probe the residual allocation at offset 1024, asserting
> -	that that is in range.
> -
> -gcc/testsuite/
> -	* gcc.target/aarch64/stack-check-prologue-17.c: Expect the probe
> -	to be at offset 1024 rather than offset 0.
> -	* gcc.target/aarch64/stack-check-prologue-18.c: Likewise.
> ----
> - gcc/config/aarch64/aarch64.c                         | 12 ++++-------=
-
> - .../gcc.target/aarch64/stack-check-prologue-17.c     |  2 +-
> - .../gcc.target/aarch64/stack-check-prologue-18.c     |  4 ++--
> - 3 files changed, 7 insertions(+), 11 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 3f2b10de987..4b9cd687525 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -8751,16 +8751,12 @@ aarch64_allocate_and_probe_stack_space (rtx te=
mp1, rtx temp2,
> -      are still safe.  */
> -   if (residual)
> -     {
> --      HOST_WIDE_INT residual_probe_offset =3D guard_used_by_caller;
> -+      gcc_assert (guard_used_by_caller + byte_sp_alignment <=3D size)=
;
> -+
> -       /* If we're doing final adjustments, and we've done any full pa=
ge
> - 	 allocations then any residual needs to be probed.  */
> -       if (final_adjustment_p && rounded_size !=3D 0)
> - 	min_probe_threshold =3D 0;
> --      /* If doing a small final adjustment, we always probe at offset=
 0.
> --	 This is done to avoid issues when the final adjustment is smaller
> --	 than the probing offset.  */
> --      else if (final_adjustment_p && rounded_size =3D=3D 0)
> --	residual_probe_offset =3D 0;
> -
> -       aarch64_sub_sp (temp1, temp2, residual, frame_related_p);
> -       if (residual >=3D min_probe_threshold)
> -@@ -8771,8 +8767,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
> - 		     HOST_WIDE_INT_PRINT_DEC " bytes, probing will be required."
> - 		     "\n", residual);
> -
> --	    emit_stack_probe (plus_constant (Pmode, stack_pointer_rtx,
> --					     residual_probe_offset));
> -+	  emit_stack_probe (plus_constant (Pmode, stack_pointer_rtx,
> -+					   guard_used_by_caller));
> - 	  emit_insn (gen_blockage ());
> - 	}
> -     }
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.=
c b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -index 0d8a25d73a2..f0ec1389771 100644
> ---- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-17.c
> -@@ -33,7 +33,7 @@ int test1(int z) {
> - **	...
> - **	str	x30, \[sp\]
> - **	sub	sp, sp, #1040
> --**	str	xzr, \[sp\]
> -+**	str	xzr, \[sp, #?1024\]
> - **	cbnz	w0, .*
> - **	bl	g
> - **	...
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.=
c b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -index 82447d20fff..6383bec5ebc 100644
> ---- a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
> -@@ -9,7 +9,7 @@ void g();
> - **	...
> - **	str	x30, \[sp\]
> - **	sub	sp, sp, #4064
> --**	str	xzr, \[sp\]
> -+**	str	xzr, \[sp, #?1024\]
> - **	cbnz	w0, .*
> - **	bl	g
> - **	...
> -@@ -50,7 +50,7 @@ int test1(int z) {
> - **	...
> - **	str	x30, \[sp\]
> - **	sub	sp, sp, #1040
> --**	str	xzr, \[sp\]
> -+**	str	xzr, \[sp, #?1024\]
> - **	cbnz	w0, .*
> - **	bl	g
> - **	...
> ---
> -2.34.1
> -
> -
> -From 9ed9fd54b2b471745c9489e83496c091a7b64904 Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:52 +0100
> -Subject: [PATCH 17/19] aarch64: Explicitly record probe registers in f=
rame
> - info
> -
> -The stack frame is currently divided into three areas:
> -
> -A: the area above the hard frame pointer
> -B: the SVE saves below the hard frame pointer
> -C: the outgoing arguments
> -
> -If the stack frame is allocated in one chunk, the allocation needs a
> -probe if the frame size is >=3D guard_size - 1KiB.  In addition, if th=
e
> -function is not a leaf function, it must probe an address no more than
> -1KiB above the outgoing SP.  We ensured the second condition by
> -
> -(1) using single-chunk allocations for non-leaf functions only if
> -    the link register save slot is within 512 bytes of the bottom
> -    of the frame; and
> -
> -(2) using the link register save as a probe (meaning, for instance,
> -    that it can't be individually shrink wrapped)
> -
> -If instead the stack is allocated in multiple chunks, then:
> -
> -* an allocation involving only the outgoing arguments (C above) requir=
es
> -  a probe if the allocation size is > 1KiB
> -
> -* any other allocation requires a probe if the allocation size
> -  is >=3D guard_size - 1KiB
> -
> -* second and subsequent allocations require the previous allocation
> -  to probe at the bottom of the allocated area, regardless of the size
> -  of that previous allocation
> -
> -The final point means that, unlike for single allocations,
> -it can be necessary to have both a non-SVE register probe and
> -an SVE register probe.  For example:
> -
> -* allocate A, probe using a non-SVE register save
> -* allocate B, probe using an SVE register save
> -* allocate C
> -
> -The non-SVE register used in this case was again the link register.
> -It was previously used even if the link register save slot was some
> -bytes above the bottom of the non-SVE register saves, but an earlier
> -patch avoided that by putting the link register save slot first.
> -
> -As a belt-and-braces fix, this patch explicitly records which
> -probe registers we're using and allows the non-SVE probe to be
> -whichever register comes first (as for SVE).
> -
> -The patch also avoids unnecessary probes in sve/pcs/stack_clash_3.c.
> -
> -gcc/
> -	* config/aarch64/aarch64.h (aarch64_frame::sve_save_and_probe)
> -	(aarch64_frame::hard_fp_save_and_probe): New fields.
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Initialize them.
> -	Rather than asserting that a leaf function saves LR, instead assert
> -	that a leaf function saves something.
> -	(aarch64_get_separate_components): Prevent the chosen probe
> -	registers from being individually shrink-wrapped.
> -	(aarch64_allocate_and_probe_stack_space): Remove workaround for
> -	probe registers that aren't at the bottom of the previous allocation.
> -
> -gcc/testsuite/
> -	* gcc.target/aarch64/sve/pcs/stack_clash_3.c: Avoid redundant probes.
> ----
> - gcc/config/aarch64/aarch64.c                  | 68 +++++++++++++++---=
-
> - gcc/config/aarch64/aarch64.h                  |  8 +++
> - .../aarch64/sve/pcs/stack_clash_3.c           |  6 +-
> - 3 files changed, 64 insertions(+), 18 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 4b9cd687525..ef4b3b671ba 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7469,15 +7469,11 @@ aarch64_layout_frame (void)
> - 	&& !crtl->abi->clobbers_full_reg_p (regno))
> -       frame.reg_offset[regno] =3D SLOT_REQUIRED;
> -
> --  /* With stack-clash, LR must be saved in non-leaf functions.  The s=
aving of
> --     LR counts as an implicit probe which allows us to maintain the i=
nvariant
> --     described in the comment at expand_prologue.  */
> --  gcc_assert (crtl->is_leaf
> --	      || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRED))=
;
> -
> -   poly_int64 offset =3D crtl->outgoing_args_size;
> -   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -   frame.bytes_below_saved_regs =3D offset;
> -+  frame.sve_save_and_probe =3D INVALID_REGNUM;
> -
> -   /* Now assign stack slots for the registers.  Start with the predic=
ate
> -      registers, since predicate LDR and STR have a relatively small
> -@@ -7485,6 +7481,8 @@ aarch64_layout_frame (void)
> -   for (regno =3D P0_REGNUM; regno <=3D P15_REGNUM; regno++)
> -     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> -       {
> -+	if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)
> -+	  frame.sve_save_and_probe =3D regno;
> - 	frame.reg_offset[regno] =3D offset;
> - 	offset +=3D BYTES_PER_SVE_PRED;
> -       }
> -@@ -7522,6 +7520,8 @@ aarch64_layout_frame (void)
> -     for (regno =3D V0_REGNUM; regno <=3D V31_REGNUM; regno++)
> -       if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> - 	{
> -+	  if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)
> -+	    frame.sve_save_and_probe =3D regno;
> - 	  frame.reg_offset[regno] =3D offset;
> - 	  offset +=3D vector_save_size;
> - 	}
> -@@ -7531,10 +7531,18 @@ aarch64_layout_frame (void)
> -   frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_=
saved_regs;
> -   bool saves_below_hard_fp_p
> -     =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> -+  gcc_assert (!saves_below_hard_fp_p
> -+	      || (frame.sve_save_and_probe !=3D INVALID_REGNUM
> -+		  && known_eq (frame.reg_offset[frame.sve_save_and_probe],
> -+			       frame.bytes_below_saved_regs)));
> -+
> -   frame.bytes_below_hard_fp =3D offset;
> -+  frame.hard_fp_save_and_probe =3D INVALID_REGNUM;
> -
> -   auto allocate_gpr_slot =3D [&](unsigned int regno)
> -     {
> -+      if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGNUM)
> -+	frame.hard_fp_save_and_probe =3D regno;
> -       frame.reg_offset[regno] =3D offset;
> -       if (frame.wb_candidate1 =3D=3D INVALID_REGNUM)
> - 	frame.wb_candidate1 =3D regno;
> -@@ -7568,6 +7576,8 @@ aarch64_layout_frame (void)
> -   for (regno =3D V0_REGNUM; regno <=3D V31_REGNUM; regno++)
> -     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
> -       {
> -+	if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGNUM)
> -+	  frame.hard_fp_save_and_probe =3D regno;
> - 	/* If there is an alignment gap between integer and fp callee-saves,
> - 	   allocate the last fp register to it if possible.  */
> - 	if (regno =3D=3D last_fp_reg
> -@@ -7591,6 +7601,17 @@ aarch64_layout_frame (void)
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_U=
NIT);
> -
> -   frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> -+  gcc_assert (known_eq (frame.saved_regs_size,
> -+			frame.below_hard_fp_saved_regs_size)
> -+	      || (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM
> -+		  && known_eq (frame.reg_offset[frame.hard_fp_save_and_probe],
> -+			       frame.bytes_below_hard_fp)));
> -+
> -+  /* With stack-clash, a register must be saved in non-leaf functions.
> -+     The saving of the bottommost register counts as an implicit prob=
e,
> -+     which allows us to maintain the invariant described in the comme=
nt
> -+     at expand_prologue.  */
> -+  gcc_assert (crtl->is_leaf || maybe_ne (frame.saved_regs_size, 0));
> -
> -   offset +=3D get_frame_size ();
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_U=
NIT);
> -@@ -7690,6 +7711,25 @@ aarch64_layout_frame (void)
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -
> -+  /* The frame is allocated in pieces, with each non-final piece
> -+     including a register save at offset 0 that acts as a probe for
> -+     the following piece.  In addition, the save of the bottommost re=
gister
> -+     acts as a probe for callees and allocas.  Roll back any probes t=
hat
> -+     aren't needed.
> -+
> -+     A probe isn't needed if it is associated with the final allocati=
on
> -+     (including callees and allocas) that happens before the epilogue=
 is
> -+     executed.  */
> -+  if (crtl->is_leaf
> -+      && !cfun->calls_alloca
> -+      && known_eq (frame.final_adjust, 0))
> -+    {
> -+      if (maybe_ne (frame.sve_callee_adjust, 0))
> -+	frame.sve_save_and_probe =3D INVALID_REGNUM;
> -+      else
> -+	frame.hard_fp_save_and_probe =3D INVALID_REGNUM;
> -+    }
> -+
> -   /* Make sure the individual adjustments add up to the full frame si=
ze.  */
> -   gcc_assert (known_eq (frame.initial_adjust
> - 			+ frame.callee_adjust
> -@@ -8267,13 +8307,6 @@ aarch64_get_separate_components (void)
> -
> - 	poly_int64 offset =3D frame.reg_offset[regno];
> -
> --	/* If the register is saved in the first SVE save slot, we use
> --	   it as a stack probe for -fstack-clash-protection.  */
> --	if (flag_stack_clash_protection
> --	    && maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
> --	    && known_eq (offset, frame.bytes_below_saved_regs))
> --	  continue;
> --
> - 	/* Get the offset relative to the register we'll use.  */
> - 	if (frame_pointer_needed)
> - 	  offset -=3D frame.bytes_below_hard_fp;
> -@@ -8308,6 +8341,13 @@ aarch64_get_separate_components (void)
> -
> -   bitmap_clear_bit (components, LR_REGNUM);
> -   bitmap_clear_bit (components, SP_REGNUM);
> -+  if (flag_stack_clash_protection)
> -+    {
> -+      if (frame.sve_save_and_probe !=3D INVALID_REGNUM)
> -+	bitmap_clear_bit (components, frame.sve_save_and_probe);
> -+      if (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM)
> -+	bitmap_clear_bit (components, frame.hard_fp_save_and_probe);
> -+    }
> -
> -   return components;
> - }
> -@@ -8844,8 +8884,8 @@ aarch64_epilogue_uses (int regno)
> -    When probing is needed, we emit a probe at the start of the prolog=
ue
> -    and every PARAM_STACK_CLASH_PROTECTION_GUARD_SIZE bytes thereafter.
> -
> --   We have to track how much space has been allocated and the only st=
ores
> --   to the stack we track as implicit probes are the FP/LR stores.
> -+   We can also use register saves as probes.  These are stored in
> -+   sve_save_and_probe and hard_fp_save_and_probe.
> -
> -    For outgoing arguments we probe if the size is larger than 1KB, su=
ch that
> -    the ABI specified buffer is maintained for the next callee.
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64=
.h
> -index c8ec3d58495..97173e48598 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -911,6 +911,14 @@ struct GTY (()) aarch64_frame
> -      This is the register they should use.  */
> -   unsigned spare_pred_reg;
> -
> -+  /* An SVE register that is saved below the hard frame pointer and t=
hat acts
> -+     as a probe for later allocations, or INVALID_REGNUM if none.  */
> -+  unsigned sve_save_and_probe;
> -+
> -+  /* A register that is saved at the hard frame pointer and that acts
> -+     as a probe for later allocations, or INVALID_REGNUM if none.  */
> -+  unsigned hard_fp_save_and_probe;
> -+
> -   bool laid_out;
> - };
> -
> -diff --git a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c =
b/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> -index 3e01ec36c3a..3530a0d504b 100644
> ---- a/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> -+++ b/gcc/testsuite/gcc.target/aarch64/sve/pcs/stack_clash_3.c
> -@@ -11,11 +11,10 @@
> - **	mov	x11, sp
> - **	...
> - **	sub	sp, sp, x13
> --**	str	p4, \[sp\]
> - **	cbz	w0, [^\n]*
> -+**	str	p4, \[sp\]
> - **	...
> - **	ptrue	p0\.b, all
> --**	ldr	p4, \[sp\]
> - **	addvl	sp, sp, #1
> - **	ldr	x24, \[sp\], 32
> - **	ret
> -@@ -39,13 +38,12 @@ test_1 (int n)
> - **	mov	x11, sp
> - **	...
> - **	sub	sp, sp, x13
> --**	str	p4, \[sp\]
> - **	cbz	w0, [^\n]*
> -+**	str	p4, \[sp\]
> - **	str	p5, \[sp, #1, mul vl\]
> - **	str	p6, \[sp, #2, mul vl\]
> - **	...
> - **	ptrue	p0\.b, all
> --**	ldr	p4, \[sp\]
> - **	addvl	sp, sp, #1
> - **	ldr	x24, \[sp\], 32
> - **	ret
> ---
> -2.34.1
> -
> -
> -From 4bbf7b6cdd02b0d547ddd6a630f2065680bf2f6b Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:52 +0100
> -Subject: [PATCH 18/19] aarch64: Remove below_hard_fp_saved_regs_size
> -
> -After previous patches, it's no longer necessary to store
> -saved_regs_size and below_hard_fp_saved_regs_size in the frame info.
> -All measurements instead use the top or bottom of the frame as
> -reference points.
> -
> -gcc/
> -	* config/aarch64/aarch64.h (aarch64_frame::saved_regs_size)
> -	(aarch64_frame::below_hard_fp_saved_regs_size): Delete.
> -	* config/aarch64/aarch64.c (aarch64_layout_frame): Update accordingly.
> ----
> - gcc/config/aarch64/aarch64.c | 45 +++++++++++++++++------------------=
-
> - gcc/config/aarch64/aarch64.h |  7 ------
> - 2 files changed, 21 insertions(+), 31 deletions(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index ef4b3b671ba..385718a475b 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7528,9 +7528,8 @@ aarch64_layout_frame (void)
> -
> -   /* OFFSET is now the offset of the hard frame pointer from the bott=
om
> -      of the callee save area.  */
> --  frame.below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_=
saved_regs;
> --  bool saves_below_hard_fp_p
> --    =3D maybe_ne (frame.below_hard_fp_saved_regs_size, 0);
> -+  auto below_hard_fp_saved_regs_size =3D offset - frame.bytes_below_s=
aved_regs;
> -+  bool saves_below_hard_fp_p =3D maybe_ne (below_hard_fp_saved_regs_s=
ize, 0);
> -   gcc_assert (!saves_below_hard_fp_p
> - 	      || (frame.sve_save_and_probe !=3D INVALID_REGNUM
> - 		  && known_eq (frame.reg_offset[frame.sve_save_and_probe],
> -@@ -7600,9 +7599,8 @@ aarch64_layout_frame (void)
> -
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_U=
NIT);
> -
> --  frame.saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> --  gcc_assert (known_eq (frame.saved_regs_size,
> --			frame.below_hard_fp_saved_regs_size)
> -+  auto saved_regs_size =3D offset - frame.bytes_below_saved_regs;
> -+  gcc_assert (known_eq (saved_regs_size, below_hard_fp_saved_regs_siz=
e)
> - 	      || (frame.hard_fp_save_and_probe !=3D INVALID_REGNUM
> - 		  && known_eq (frame.reg_offset[frame.hard_fp_save_and_probe],
> - 			       frame.bytes_below_hard_fp)));
> -@@ -7611,7 +7609,7 @@ aarch64_layout_frame (void)
> -      The saving of the bottommost register counts as an implicit prob=
e,
> -      which allows us to maintain the invariant described in the comme=
nt
> -      at expand_prologue.  */
> --  gcc_assert (crtl->is_leaf || maybe_ne (frame.saved_regs_size, 0));
> -+  gcc_assert (crtl->is_leaf || maybe_ne (saved_regs_size, 0));
> -
> -   offset +=3D get_frame_size ();
> -   offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_U=
NIT);
> -@@ -7637,7 +7635,7 @@ aarch64_layout_frame (void)
> -
> -   HOST_WIDE_INT const_size, const_below_saved_regs, const_above_fp;
> -   HOST_WIDE_INT const_saved_regs_size;
> --  if (known_eq (frame.saved_regs_size, 0))
> -+  if (known_eq (saved_regs_size, 0))
> -     frame.initial_adjust =3D frame.frame_size;
> -   else if (frame.frame_size.is_constant (&const_size)
> - 	   && const_size < max_push_offset
> -@@ -7650,7 +7648,7 @@ aarch64_layout_frame (void)
> -       frame.callee_adjust =3D const_size;
> -     }
> -   else if (frame.bytes_below_saved_regs.is_constant (&const_below_sav=
ed_regs)
> --	   && frame.saved_regs_size.is_constant (&const_saved_regs_size)
> -+	   && saved_regs_size.is_constant (&const_saved_regs_size)
> - 	   && const_below_saved_regs + const_saved_regs_size < 512
> - 	   /* We could handle this case even with data below the saved
> - 	      registers, provided that that data left us with valid offsets
> -@@ -7669,8 +7667,7 @@ aarch64_layout_frame (void)
> -       frame.initial_adjust =3D frame.frame_size;
> -     }
> -   else if (saves_below_hard_fp_p
> --	   && known_eq (frame.saved_regs_size,
> --			frame.below_hard_fp_saved_regs_size))
> -+	   && known_eq (saved_regs_size, below_hard_fp_saved_regs_size))
> -     {
> -       /* Frame in which all saves are SVE saves:
> -
> -@@ -7692,7 +7689,7 @@ aarch64_layout_frame (void)
> - 	 [save SVE registers relative to SP]
> - 	 sub sp, sp, bytes_below_saved_regs  */
> -       frame.callee_adjust =3D const_above_fp;
> --      frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size=
;
> -+      frame.sve_callee_adjust =3D below_hard_fp_saved_regs_size;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -   else
> -@@ -7707,7 +7704,7 @@ aarch64_layout_frame (void)
> - 	 [save SVE registers relative to SP]
> - 	 sub sp, sp, bytes_below_saved_regs  */
> -       frame.initial_adjust =3D frame.bytes_above_hard_fp;
> --      frame.sve_callee_adjust =3D frame.below_hard_fp_saved_regs_size=
;
> -+      frame.sve_callee_adjust =3D below_hard_fp_saved_regs_size;
> -       frame.final_adjust =3D frame.bytes_below_saved_regs;
> -     }
> -
> -@@ -8849,17 +8846,17 @@ aarch64_epilogue_uses (int regno)
> - 	|  local variables              | <-- frame_pointer_rtx
> - 	|                               |
> - 	+-------------------------------+
> --	|  padding                      | \
> --	+-------------------------------+  |
> --	|  callee-saved registers       |  | frame.saved_regs_size
> --	+-------------------------------+  |
> --	|  LR'                          |  |
> --	+-------------------------------+  |
> --	|  FP'                          |  |
> --	+-------------------------------+  |<- hard_frame_pointer_rtx (align=
ed)
> --	|  SVE vector registers         |  | \
> --	+-------------------------------+  |  | below_hard_fp_saved_regs_siz=
e
> --	|  SVE predicate registers      | /  /
> -+	|  padding                      |
> -+	+-------------------------------+
> -+	|  callee-saved registers       |
> -+	+-------------------------------+
> -+	|  LR'                          |
> -+	+-------------------------------+
> -+	|  FP'                          |
> -+	+-------------------------------+ <-- hard_frame_pointer_rtx (aligne=
d)
> -+	|  SVE vector registers         |
> -+	+-------------------------------+
> -+	|  SVE predicate registers      |
> - 	+-------------------------------+
> - 	|  dynamic allocation           |
> - 	+-------------------------------+
> -diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64=
.h
> -index 97173e48598..9084b1cfb9d 100644
> ---- a/gcc/config/aarch64/aarch64.h
> -+++ b/gcc/config/aarch64/aarch64.h
> -@@ -837,18 +837,11 @@ struct GTY (()) aarch64_frame
> -      STACK_BOUNDARY.  */
> -   HOST_WIDE_INT saved_varargs_size;
> -
> --  /* The size of the callee-save registers with a slot in REG_OFFSET.=
  */
> --  poly_int64 saved_regs_size;
> --
> -   /* The number of bytes between the bottom of the static frame (the =
bottom
> -      of the outgoing arguments) and the bottom of the register save a=
rea.
> -      This value is always a multiple of STACK_BOUNDARY.  */
> -   poly_int64 bytes_below_saved_regs;
> -
> --  /* The size of the callee-save registers with a slot in REG_OFFSET =
that
> --     are saved below the hard frame pointer.  */
> --  poly_int64 below_hard_fp_saved_regs_size;
> --
> -   /* The number of bytes between the bottom of the static frame (the =
bottom
> -      of the outgoing arguments) and the hard frame pointer.  This val=
ue is
> -      always a multiple of STACK_BOUNDARY.  */
> ---
> -2.34.1
> -
> -
> -From bea0985749c12fcc264710586addb7838cc61e6d Mon Sep 17 00:00:00 2001
> -From: Richard Sandiford<richard.sandiford@arm.com>
> -Date: Tue, 12 Sep 2023 16:19:52 +0100
> -Subject: [PATCH 19/19] aarch64: Make stack smash canary protect saved
> - registers
> -
> -AArch64 normally puts the saved registers near the bottom of the frame=
,
> -immediately above any dynamic allocations.  But this means that a
> -stack-smash attack on those dynamic allocations could overwrite the
> -saved registers without needing to reach as far as the stack smash
> -canary.
> -
> -The same thing could also happen for variable-sized arguments that are
> -passed by value, since those are allocated before a call and popped on
> -return.
> -
> -This patch avoids that by putting the locals (and thus the canary) bel=
ow
> -the saved registers when stack smash protection is active.
> -
> -The patch fixes CVE-2023-4039.
> -
> -gcc/
> -	* config/aarch64/aarch64.c (aarch64_save_regs_above_locals_p):
> -	New function.
> -	(aarch64_layout_frame): Use it to decide whether locals should
> -	go above or below the saved registers.
> -	(aarch64_expand_prologue): Update stack layout comment.
> -	Emit a stack tie after the final adjustment.
> -
> -gcc/testsuite/
> -	* gcc.target/aarch64/stack-protector-8.c: New test.
> -	* gcc.target/aarch64/stack-protector-9.c: Likewise.
> ----
> - gcc/config/aarch64/aarch64.c                  | 46 +++++++--
> - .../gcc.target/aarch64/stack-protector-8.c    | 95 ++++++++++++++++++=
+
> - .../gcc.target/aarch64/stack-protector-9.c    | 33 +++++++
> - 3 files changed, 168 insertions(+), 6 deletions(-)
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-8=
.c
> - create mode 100644 gcc/testsuite/gcc.target/aarch64/stack-protector-9=
.c
> -
> -diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64=
.c
> -index 385718a475b..3ccfd3c30fc 100644
> ---- a/gcc/config/aarch64/aarch64.c
> -+++ b/gcc/config/aarch64/aarch64.c
> -@@ -7392,6 +7392,20 @@ aarch64_needs_frame_chain (void)
> -   return aarch64_use_frame_pointer;
> - }
> -
> -+/* Return true if the current function should save registers above
> -+   the locals area, rather than below it.  */
> -+
> -+static bool
> -+aarch64_save_regs_above_locals_p ()
> -+{
> -+  /* When using stack smash protection, make sure that the canary slo=
t
> -+     comes between the locals and the saved registers.  Otherwise,
> -+     it would be possible for a carefully sized smash attack to chang=
e
> -+     the saved registers (particularly LR and FP) without reaching th=
e
> -+     canary.  */
> -+  return crtl->stack_protect_guard;
> -+}
> -+
> - /* Mark the registers that need to be saved by the callee and calcula=
te
> -    the size of the callee-saved registers area and frame record (both=
 FP
> -    and LR may be omitted).  */
> -@@ -7403,6 +7417,7 @@ aarch64_layout_frame (void)
> -   poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mode);
> -   bool frame_related_fp_reg_p =3D false;
> -   aarch64_frame &frame =3D cfun->machine->frame;
> -+  poly_int64 top_of_locals =3D -1;
> -
> -   frame.emit_frame_chain =3D aarch64_needs_frame_chain ();
> -
> -@@ -7469,9 +7484,16 @@ aarch64_layout_frame (void)
> - 	&& !crtl->abi->clobbers_full_reg_p (regno))
> -       frame.reg_offset[regno] =3D SLOT_REQUIRED;
> -
> -+  bool regs_at_top_p =3D aarch64_save_regs_above_locals_p ();
> -
> -   poly_int64 offset =3D crtl->outgoing_args_size;
> -   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -+  if (regs_at_top_p)
> -+    {
> -+      offset +=3D get_frame_size ();
> -+      offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_P=
ER_UNIT);
> -+      top_of_locals =3D offset;
> -+    }
> -   frame.bytes_below_saved_regs =3D offset;
> -   frame.sve_save_and_probe =3D INVALID_REGNUM;
> -
> -@@ -7611,15 +7633,18 @@ aarch64_layout_frame (void)
> -      at expand_prologue.  */
> -   gcc_assert (crtl->is_leaf || maybe_ne (saved_regs_size, 0));
> -
> --  offset +=3D get_frame_size ();
> --  offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_PER_U=
NIT);
> --  auto top_of_locals =3D offset;
> --
> -+  if (!regs_at_top_p)
> -+    {
> -+      offset +=3D get_frame_size ();
> -+      offset =3D aligned_upper_bound (offset, STACK_BOUNDARY / BITS_P=
ER_UNIT);
> -+      top_of_locals =3D offset;
> -+    }
> -   offset +=3D frame.saved_varargs_size;
> -   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
> -   frame.frame_size =3D offset;
> -
> -   frame.bytes_above_hard_fp =3D frame.frame_size - frame.bytes_below_=
hard_fp;
> -+  gcc_assert (known_ge (top_of_locals, 0));
> -   frame.bytes_above_locals =3D frame.frame_size - top_of_locals;
> -
> -   frame.initial_adjust =3D 0;
> -@@ -8843,10 +8868,10 @@ aarch64_epilogue_uses (int regno)
> - 	|  for register varargs         |
> - 	|                               |
> - 	+-------------------------------+
> --	|  local variables              | <-- frame_pointer_rtx
> -+	|  local variables (1)          | <-- frame_pointer_rtx
> - 	|                               |
> - 	+-------------------------------+
> --	|  padding                      |
> -+	|  padding (1)                  |
> - 	+-------------------------------+
> - 	|  callee-saved registers       |
> - 	+-------------------------------+
> -@@ -8858,6 +8883,10 @@ aarch64_epilogue_uses (int regno)
> - 	+-------------------------------+
> - 	|  SVE predicate registers      |
> - 	+-------------------------------+
> -+	|  local variables (2)          |
> -+	+-------------------------------+
> -+	|  padding (2)                  |
> -+	+-------------------------------+
> - 	|  dynamic allocation           |
> - 	+-------------------------------+
> - 	|  padding                      |
> -@@ -8867,6 +8896,9 @@ aarch64_epilogue_uses (int regno)
> - 	+-------------------------------+
> - 	|                               | <-- stack_pointer_rtx (aligned)
> -
> -+   The regions marked (1) and (2) are mutually exclusive.  (2) is use=
d
> -+   when aarch64_save_regs_above_locals_p is true.
> -+
> -    Dynamic stack allocations via alloca() decrease stack_pointer_rtx
> -    but leave frame_pointer_rtx and hard_frame_pointer_rtx
> -    unchanged.
> -@@ -9058,6 +9090,8 @@ aarch64_expand_prologue (void)
> -   gcc_assert (known_eq (bytes_below_sp, final_adjust));
> -   aarch64_allocate_and_probe_stack_space (tmp1_rtx, tmp0_rtx, final_a=
djust,
> - 					  !frame_pointer_needed, true);
> -+  if (emit_frame_chain && maybe_ne (final_adjust, 0))
> -+    emit_insn (gen_stack_tie (stack_pointer_rtx, hard_frame_pointer_r=
tx));
> - }
> -
> - /* Return TRUE if we can use a simple_return insn.
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c b/gc=
c/testsuite/gcc.target/aarch64/stack-protector-8.c
> -new file mode 100644
> -index 00000000000..e71d820e365
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-8.c
> -@@ -0,0 +1,95 @@
> -+/* { dg-options " -O -fstack-protector-strong -mstack-protector-guard=
=3Dsysreg -mstack-protector-guard-reg=3Dtpidr2_el0 -mstack-protector-guar=
d-offset=3D16" } */
> -+/* { dg-final { check-function-bodies "**" "" } } */
> -+
> -+void g(void *);
> -+__SVBool_t *h(void *);
> -+
> -+/*
> -+** test1:
> -+**	sub	sp, sp, #288
> -+**	stp	x29, x30, \[sp, #?272\]
> -+**	add	x29, sp, #?272
> -+**	mrs	(x[0-9]+), tpidr2_el0
> -+**	ldr	(x[0-9]+), \[\1, #?16\]
> -+**	str	\2, \[sp, #?264\]
> -+**	mov	\2, #?0
> -+**	add	x0, sp, #?8
> -+**	bl	g
> -+**	...
> -+**	mrs	.*
> -+**	...
> -+**	bne	.*
> -+**	...
> -+**	ldp	x29, x30, \[sp, #?272\]
> -+**	add	sp, sp, #?288
> -+**	ret
> -+**	bl	__stack_chk_fail
> -+*/
> -+int test1() {
> -+  int y[0x40];
> -+  g(y);
> -+  return 1;
> -+}
> -+
> -+/*
> -+** test2:
> -+**	stp	x29, x30, \[sp, #?-16\]!
> -+**	mov	x29, sp
> -+**	sub	sp, sp, #1040
> -+**	mrs	(x[0-9]+), tpidr2_el0
> -+**	ldr	(x[0-9]+), \[\1, #?16\]
> -+**	str	\2, \[sp, #?1032\]
> -+**	mov	\2, #?0
> -+**	add	x0, sp, #?8
> -+**	bl	g
> -+**	...
> -+**	mrs	.*
> -+**	...
> -+**	bne	.*
> -+**	...
> -+**	add	sp, sp, #?1040
> -+**	ldp	x29, x30, \[sp\], #?16
> -+**	ret
> -+**	bl	__stack_chk_fail
> -+*/
> -+int test2() {
> -+  int y[0x100];
> -+  g(y);
> -+  return 1;
> -+}
> -+
> -+#pragma GCC target "+sve"
> -+
> -+/*
> -+** test3:
> -+**	stp	x29, x30, \[sp, #?-16\]!
> -+**	mov	x29, sp
> -+**	addvl	sp, sp, #-18
> -+**	...
> -+**	str	p4, \[sp\]
> -+**	...
> -+**	sub	sp, sp, #272
> -+**	mrs	(x[0-9]+), tpidr2_el0
> -+**	ldr	(x[0-9]+), \[\1, #?16\]
> -+**	str	\2, \[sp, #?264\]
> -+**	mov	\2, #?0
> -+**	add	x0, sp, #?8
> -+**	bl	h
> -+**	...
> -+**	mrs	.*
> -+**	...
> -+**	bne	.*
> -+**	...
> -+**	add	sp, sp, #?272
> -+**	...
> -+**	ldr	p4, \[sp\]
> -+**	...
> -+**	addvl	sp, sp, #18
> -+**	ldp	x29, x30, \[sp\], #?16
> -+**	ret
> -+**	bl	__stack_chk_fail
> -+*/
> -+__SVBool_t test3() {
> -+  int y[0x40];
> -+  return *h(y);
> -+}
> -diff --git a/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c b/gc=
c/testsuite/gcc.target/aarch64/stack-protector-9.c
> -new file mode 100644
> -index 00000000000..58f322aa480
> ---- /dev/null
> -+++ b/gcc/testsuite/gcc.target/aarch64/stack-protector-9.c
> -@@ -0,0 +1,33 @@
> -+/* { dg-options "-O2 -mcpu=3Dneoverse-v1 -fstack-protector-all" } */
> -+/* { dg-final { check-function-bodies "**" "" } } */
> -+
> -+/*
> -+** main:
> -+**	...
> -+**	stp	x29, x30, \[sp, #?-[0-9]+\]!
> -+**	...
> -+**	sub	sp, sp, #[0-9]+
> -+**	...
> -+**	str	x[0-9]+, \[x29, #?-8\]
> -+**	...
> -+*/
> -+int f(const char *);
> -+void g(void *);
> -+int main(int argc, char* argv[])
> -+{
> -+  int a;
> -+  int b;
> -+  char c[2+f(argv[1])];
> -+  int d[0x100];
> -+  char y;
> -+
> -+  y=3D42; a=3D4; b=3D10;
> -+  c[0] =3D 'h'; c[1] =3D '\0';
> -+
> -+  c[f(argv[2])] =3D '\0';
> -+
> -+  __builtin_printf("%d %d\n%s\n", a, b, c);
> -+  g(d);
> -+
> -+  return 0;
> -+}
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc_11.4.bb b/meta/recipes-devto=
ols/gcc/gcc_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_11.4.bb
> rename to meta/recipes-devtools/gcc/gcc_11.5.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.4.bb b/meta/re=
cipes-devtools/gcc/libgcc-initial_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_11.4.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_11.5.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_11.4.bb b/meta/recipes-de=
vtools/gcc/libgcc_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_11.4.bb
> rename to meta/recipes-devtools/gcc/libgcc_11.5.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_11.4.bb b/meta/recip=
es-devtools/gcc/libgfortran_11.5.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_11.4.bb
> rename to meta/recipes-devtools/gcc/libgfortran_11.5.bb


--=20
# Randy MacLeod
# Wind River Linux

--------------UmCbEU7v2GyRidbvc7yAFc8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48RBpo7x013099

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-09-27 7:03 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Deepthi.Hemraj=
@windriver.com">Deepthi.Hemraj@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240927110310.2580951-1-Deepth=
i.Hemraj@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Deepthi Hemraj <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@windriver.com">=
&lt;Deepthi.Hemraj@windriver.com&gt;</a>

gcc stable version upgraded from v11.4 to v11.5

Dropped CVE-2023-4039.patch and 0001-aarch64-Update-Neoverse-N2-core-defi=
ni.patch
because its been taken to gcc-11.5 with below commits 75c37e0314 and 50d9=
db203bc

For changes in v11.5 see: <a class=3D"moz-txt-link-freetext" href=3D"http=
s://gcc.gnu.org/gcc-11/changes.html">https://gcc.gnu.org/gcc-11/changes.h=
tml</a>

Below is the bug fix list for v11.5:
<a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzilla/b=
uglist.cgi?bug_status=3DRESOLVED&amp;list_id=3D444046&amp;resolution=3DFI=
XED&amp;target_milestone=3D11.5">https://gcc.gnu.org/bugzilla/buglist.cgi=
?bug_status=3DRESOLVED&amp;list_id=3D444046&amp;resolution=3DFIXED&amp;ta=
rget_milestone=3D11.5</a>

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
100667	gcc	libstdc+  unassigned	[11/12 Regression] std::tuple&lt;A&amp;&a=
mp;&gt; cannot be constructed from A&amp;&amp;, if A not defined (only fo=
rward declared)
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
113192	gcc	libgomp	  jakub	[11 Regression] ERROR: couldn't execute &quot;=
../../../gcc/libgomp/testsuite/flock&quot;: no such file or directory
113262	gcc	c	  jakub	[11 Regression] ICE when using [[gnu::copy(&quot;&qu=
ot;)]] attribute
114533	gcc	libquadm  jakub	libquadmath: printf: fix misaligned access on =
args
114537	gcc	c++	  jakub	bit_cast does not work NSDMI of bitfields
114572	gcc	c++	  jakub	[OpenMP] &quot;internal compiler error: in assign_=
temp&quot; with assignment operator and lastprivate clause
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
106310	gcc	c++	  jason	[11 Regression] lookup after this-&gt; seems wrong=
 for dependent lookup since r12-6754-g30f2c22def739211
111357	gcc	c++	  jason	[11/12/13/14 Regression] __integer_pack fails to w=
ork with values of dependent type convertible to integers in noexcept con=
text
114130	gcc	target	  kito	[11 Regression] RISC-V: `__atomic_compare_exchan=
ge` does not use sign-extended value for RV64
113250	gcc	libstdc+  kmatsui	std::filesystem::equivalent(&quot;&quot;, &q=
uot;/&quot;) should throw
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
112491	gcc	libstdc+  redi	std::deque&lt;T,Allocator&gt;::size xmethod out=
put is wrong
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
91085	gcc	other	unassigned	[11 only] fixincludes breaks &lt;bits/statx.h&=
gt;
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
, multiple generic assignment, accept invalid</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Deepthi,<br>
    </p>
    <p>I'm not ecstatic to see so many gcc bugs listed but <br>
      they are fixes so cool.</p>
    <p>What testing have you done so far?<br>
      Can you show us the before, after and diff for our gcc tests?<br>
    </p>
    <p>Steve&nbsp; <br>
      Do you want to just run this through the YP AB or should Deepthi
      do <br>
      &nbsp;- a world build for qemuarm64 <br>
      &nbsp;- more qemu targets<br>
      &nbsp;- something else?</p>
    <p>Thanks!<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240927110310.2580951-1-Deepth=
i.Hemraj@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;=
</a>
---
 .../gcc/{gcc-11.4.inc =3D&gt; gcc-11.5.inc}        |    8 +-
 ...ian_11.4.bb =3D&gt; gcc-cross-canadian_11.5.bb} |    0
 .../{gcc-cross_11.4.bb =3D&gt; gcc-cross_11.5.bb}  |    0
 ...-crosssdk_11.4.bb =3D&gt; gcc-crosssdk_11.5.bb} |    0
 ...cc-runtime_11.4.bb =3D&gt; gcc-runtime_11.5.bb} |    0
 ...itizers_11.4.bb =3D&gt; gcc-sanitizers_11.5.bb} |    0
 ...{gcc-source_11.4.bb =3D&gt; gcc-source_11.5.bb} |    0
 ...rch64-Update-Neoverse-N2-core-defini.patch |   38 -
 .../gcc/gcc/CVE-2023-4039.patch               | 2893 -----------------
 .../gcc/{gcc_11.4.bb =3D&gt; gcc_11.5.bb}          |    0
 ...initial_11.4.bb =3D&gt; libgcc-initial_11.5.bb} |    0
 .../gcc/{libgcc_11.4.bb =3D&gt; libgcc_11.5.bb}    |    0
 ...ibgfortran_11.4.bb =3D&gt; libgfortran_11.5.bb} |    0
 13 files changed, 3 insertions(+), 2936 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-11.4.inc =3D&gt; gcc-11.5.inc} (95=
%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.4.bb =3D&gt; gcc=
-cross-canadian_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.4.bb =3D&gt; gcc-cross_11=
.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.4.bb =3D&gt; gcc-cross=
sdk_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.4.bb =3D&gt; gcc-runtim=
e_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.4.bb =3D&gt; gcc-san=
itizers_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.4.bb =3D&gt; gcc-source_=
11.5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neo=
verse-N2-core-defini.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
 rename meta/recipes-devtools/gcc/{gcc_11.4.bb =3D&gt; gcc_11.5.bb} (100%=
)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.4.bb =3D&gt; libgcc-=
initial_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.4.bb =3D&gt; libgcc_11.5.bb}=
 (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.4.bb =3D&gt; libgfortra=
n_11.5.bb} (100%)

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
-PV =3D &quot;11.4.0&quot;
+PV =3D &quot;11.5.0&quot;
=20
 # BINV should be incremented to a revision after a minor gcc release
=20
-BINV =3D &quot;11.4.0&quot;
+BINV =3D &quot;11.5.0&quot;
=20
 FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backp=
ort:&quot;
=20
@@ -65,14 +65,12 @@ SRC_URI =3D &quot;\
            <a class=3D"moz-txt-link-freetext" href=3D"file://0003-CVE-20=
21-42574.patch">file://0003-CVE-2021-42574.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0004-CVE-20=
21-42574.patch">file://0004-CVE-2021-42574.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-CVE-20=
21-46195.patch">file://0001-CVE-2021-46195.patch</a> \
-	   <a class=3D"moz-txt-link-freetext" href=3D"file://0001-aarch64-Updat=
e-Neoverse-N2-core-defini.patch">file://0001-aarch64-Update-Neoverse-N2-c=
ore-defini.patch</a> \
 	   <a class=3D"moz-txt-link-freetext" href=3D"file://0002-aarch64-add-a=
rmv9-a-to-march.patch">file://0002-aarch64-add-armv9-a-to-march.patch</a>=
 \
 	   <a class=3D"moz-txt-link-freetext" href=3D"file://0003-aarch64-Enabl=
e-FP16-feature-by-default-for-Armv9.patch">file://0003-aarch64-Enable-FP1=
6-feature-by-default-for-Armv9.patch</a> \
 	   <a class=3D"moz-txt-link-freetext" href=3D"file://0004-arm-add-armv9=
-a-architecture-to-march.patch">file://0004-arm-add-armv9-a-architecture-=
to-march.patch</a> \
-	   <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2023-4039.patc=
h">file://CVE-2023-4039.patch</a> \
 &quot;
=20
-SRC_URI[sha256sum] =3D &quot;3f2db222b007e8a4a23cd5ba56726ef08e8b1f1eb20=
55ee72c1402cea73a8dd9&quot;
+SRC_URI[sha256sum] =3D &quot;a6e21868ead545cf87f0c01f84276e4b5281d672098=
591c1c896241f09363478&quot;
=20
 S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}&quot;
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
-From: Andre Vieira <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:and=
re.simoesdiasvieira@arm.com">&lt;andre.simoesdiasvieira@arm.com&gt;</a>
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
-Signed-off-by: Ruiqiang Hao <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Ruiqiang.Hao@windriver.com">&lt;Ruiqiang.Hao@windriver.com&gt;</a>
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
- AARCH64_CORE(&quot;saphira&quot;,     saphira,    saphira,    8_4A,  AA=
RCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO, saphira,   0x51, 0xC01, -1)
-
- /* Armv8.5-A Architecture Processors.  */
--AARCH64_CORE(&quot;neoverse-n2&quot;, neoversen2, cortexa57, 8_5A, AARC=
H64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 |=
 AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_=
RNG | AARCH64_FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
- AARCH64_CORE(&quot;neoverse-v2&quot;, neoversev2, cortexa57, 8_5A, AARC=
H64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 |=
 AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_=
RNG | AARCH64_FL_MEMTAG, neoverse512tvb, 0x41, 0xd4f, -1)
-
- /* ARMv8-A big.LITTLE implementations.  */
-@@ -165,4 +164,7 @@
- /* Armv8-R Architecture Processors.  */
- AARCH64_CORE(&quot;cortex-r82&quot;, cortexr82, cortexa53, 8R, AARCH64_=
FL_FOR_ARCH8_R, cortexa53, 0x41, 0xd15, -1)
-
-+/* Armv9-A Architecture Processors. */
-+AARCH64_CORE(&quot;neoverse-n2&quot;, neoversen2, cortexa57, 9A, AARCH6=
4_FL_FOR_ARCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_SVE2_BITP=
ERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2=
, 0x41, 0xd49, -1)
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-Signed-off-by: Ross Burton <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
- =20
- =20
-From 52816ab48f97968f3fbfb5656250f3de7c00166d Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
-Date: Tue, 12 Sep 2023 16:19:43 +0100
-Subject: [PATCH 01/19] aarch64: Use local frame vars in shrink-wrapping =
code
-
-aarch64_layout_frame uses a shorthand for referring to
-cfun-&gt;machine-&gt;frame:
-
-  aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-
-This patch does the same for some other heavy users of the structure.
-No functional change intended.
-
-gcc/
-	* config/aarch64/aarch64.c (aarch64_save_callee_saves): Use
-	a local shorthand for cfun-&gt;machine-&gt;frame.
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
-+  aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-   rtx_insn *insn;
-   unsigned regno;
-   unsigned regno2;
-@@ -8008,8 +8009,8 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
-       bool frame_related_p =3D aarch64_emit_cfi_for_reg_p (regno);
-=20
-       if (skip_wb
--	  &amp;&amp; (regno =3D=3D cfun-&gt;machine-&gt;frame.wb_candidate1
--	      || regno =3D=3D cfun-&gt;machine-&gt;frame.wb_candidate2))
-+	  &amp;&amp; (regno =3D=3D frame.wb_candidate1
-+	      || regno =3D=3D frame.wb_candidate2))
- 	continue;
-=20
-       if (cfun-&gt;machine-&gt;reg_is_wrapped_separately[regno])
-@@ -8017,7 +8018,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
-=20
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-       reg =3D gen_rtx_REG (mode, regno);
--      offset =3D start_offset + cfun-&gt;machine-&gt;frame.reg_offset[r=
egno];
-+      offset =3D start_offset + frame.reg_offset[regno];
-       rtx base_rtx =3D stack_pointer_rtx;
-       poly_int64 sp_offset =3D offset;
-=20
-@@ -8030,7 +8031,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
- 	{
- 	  gcc_assert (known_eq (start_offset, 0));
- 	  poly_int64 fp_offset
--	    =3D cfun-&gt;machine-&gt;frame.below_hard_fp_saved_regs_size;
-+	    =3D frame.below_hard_fp_saved_regs_size;
- 	  if (hard_fp_valid_p)
- 	    base_rtx =3D hard_frame_pointer_rtx;
- 	  else
-@@ -8052,8 +8053,7 @@ aarch64_save_callee_saves (poly_int64 start_offset=
,
- 	  &amp;&amp; (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) =
&lt;=3D limit
- 	  &amp;&amp; !cfun-&gt;machine-&gt;reg_is_wrapped_separately[regno2]
- 	  &amp;&amp; known_eq (GET_MODE_SIZE (mode),
--		       cfun-&gt;machine-&gt;frame.reg_offset[regno2]
--		       - cfun-&gt;machine-&gt;frame.reg_offset[regno]))
-+		       frame.reg_offset[regno2] - frame.reg_offset[regno]))
- 	{
- 	  rtx reg2 =3D gen_rtx_REG (mode, regno2);
- 	  rtx mem2;
-@@ -8103,6 +8103,7 @@ static void
- aarch64_restore_callee_saves (poly_int64 start_offset, unsigned start,
- 			      unsigned limit, bool skip_wb, rtx *cfi_ops)
- {
-+  aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-   unsigned regno;
-   unsigned regno2;
-   poly_int64 offset;
-@@ -8119,13 +8120,13 @@ aarch64_restore_callee_saves (poly_int64 start_o=
ffset, unsigned start,
-       rtx reg, mem;
-=20
-       if (skip_wb
--	  &amp;&amp; (regno =3D=3D cfun-&gt;machine-&gt;frame.wb_candidate1
--	      || regno =3D=3D cfun-&gt;machine-&gt;frame.wb_candidate2))
-+	  &amp;&amp; (regno =3D=3D frame.wb_candidate1
-+	      || regno =3D=3D frame.wb_candidate2))
- 	continue;
-=20
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-       reg =3D gen_rtx_REG (mode, regno);
--      offset =3D start_offset + cfun-&gt;machine-&gt;frame.reg_offset[r=
egno];
-+      offset =3D start_offset + frame.reg_offset[regno];
-       rtx base_rtx =3D stack_pointer_rtx;
-       if (mode =3D=3D VNx2DImode &amp;&amp; BYTES_BIG_ENDIAN)
- 	aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
-@@ -8136,8 +8137,7 @@ aarch64_restore_callee_saves (poly_int64 start_off=
set, unsigned start,
- 	  &amp;&amp; (regno2 =3D aarch64_next_callee_save (regno + 1, limit)) =
&lt;=3D limit
- 	  &amp;&amp; !cfun-&gt;machine-&gt;reg_is_wrapped_separately[regno2]
- 	  &amp;&amp; known_eq (GET_MODE_SIZE (mode),
--		       cfun-&gt;machine-&gt;frame.reg_offset[regno2]
--		       - cfun-&gt;machine-&gt;frame.reg_offset[regno]))
-+		       frame.reg_offset[regno2] - frame.reg_offset[regno]))
- 	{
- 	  rtx reg2 =3D gen_rtx_REG (mode, regno2);
- 	  rtx mem2;
-@@ -8242,6 +8242,7 @@ offset_12bit_unsigned_scaled_p (machine_mode mode,=
 poly_int64 offset)
- static sbitmap
- aarch64_get_separate_components (void)
- {
-+  aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-   sbitmap components =3D sbitmap_alloc (LAST_SAVED_REGNUM + 1);
-   bitmap_clear (components);
-=20
-@@ -8258,18 +8259,18 @@ aarch64_get_separate_components (void)
- 	if (mode =3D=3D VNx2DImode &amp;&amp; BYTES_BIG_ENDIAN)
- 	  continue;
-=20
--	poly_int64 offset =3D cfun-&gt;machine-&gt;frame.reg_offset[regno];
-+	poly_int64 offset =3D frame.reg_offset[regno];
-=20
- 	/* If the register is saved in the first SVE save slot, we use
- 	   it as a stack probe for -fstack-clash-protection.  */
- 	if (flag_stack_clash_protection
--	    &amp;&amp; maybe_ne (cfun-&gt;machine-&gt;frame.below_hard_fp_save=
d_regs_size, 0)
-+	    &amp;&amp; maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
- 	    &amp;&amp; known_eq (offset, 0))
- 	  continue;
-=20
- 	/* Get the offset relative to the register we'll use.  */
- 	if (frame_pointer_needed)
--	  offset -=3D cfun-&gt;machine-&gt;frame.below_hard_fp_saved_regs_size=
;
-+	  offset -=3D frame.below_hard_fp_saved_regs_size;
- 	else
- 	  offset +=3D crtl-&gt;outgoing_args_size;
-=20
-@@ -8288,11 +8289,11 @@ aarch64_get_separate_components (void)
-   /* If the spare predicate register used by big-endian SVE code
-      is call-preserved, it must be saved in the main prologue
-      before any saves that use it.  */
--  if (cfun-&gt;machine-&gt;frame.spare_pred_reg !=3D INVALID_REGNUM)
--    bitmap_clear_bit (components, cfun-&gt;machine-&gt;frame.spare_pred=
_reg);
-+  if (frame.spare_pred_reg !=3D INVALID_REGNUM)
-+    bitmap_clear_bit (components, frame.spare_pred_reg);
-=20
--  unsigned reg1 =3D cfun-&gt;machine-&gt;frame.wb_candidate1;
--  unsigned reg2 =3D cfun-&gt;machine-&gt;frame.wb_candidate2;
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
-+  aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-   rtx ptr_reg =3D gen_rtx_REG (Pmode, frame_pointer_needed
- 			     ? HARD_FRAME_POINTER_REGNUM
- 			     : STACK_POINTER_REGNUM);
-@@ -8415,9 +8417,9 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       machine_mode mode =3D aarch64_reg_save_mode (regno);
-      =20
-       rtx reg =3D gen_rtx_REG (mode, regno);
--      poly_int64 offset =3D cfun-&gt;machine-&gt;frame.reg_offset[regno=
];
-+      poly_int64 offset =3D frame.reg_offset[regno];
-       if (frame_pointer_needed)
--	offset -=3D cfun-&gt;machine-&gt;frame.below_hard_fp_saved_regs_size;
-+	offset -=3D frame.below_hard_fp_saved_regs_size;
-       else
- 	offset +=3D crtl-&gt;outgoing_args_size;
-=20
-@@ -8442,14 +8444,14 @@ aarch64_process_components (sbitmap components, =
bool prologue_p)
- 	  break;
- 	}
-=20
--      poly_int64 offset2 =3D cfun-&gt;machine-&gt;frame.reg_offset[regn=
o2];
-+      poly_int64 offset2 =3D frame.reg_offset[regno2];
-       /* The next register is not of the same class or its offset is no=
t
- 	 mergeable with the current one into a pair.  */
-       if (aarch64_sve_mode_p (mode)
- 	  || !satisfies_constraint_Ump (mem)
- 	  || GP_REGNUM_P (regno) !=3D GP_REGNUM_P (regno2)
- 	  || (crtl-&gt;abi-&gt;id () =3D=3D ARM_PCS_SIMD &amp;&amp; FP_REGNUM_=
P (regno))
--	  || maybe_ne ((offset2 - cfun-&gt;machine-&gt;frame.reg_offset[regno]=
),
-+	  || maybe_ne ((offset2 - frame.reg_offset[regno]),
- 		       GET_MODE_SIZE (mode)))
- 	{
- 	  insn =3D emit_insn (set);
-@@ -8471,7 +8473,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       /* REGNO2 can be saved/restored in a pair with REGNO.  */
-       rtx reg2 =3D gen_rtx_REG (mode, regno2);
-       if (frame_pointer_needed)
--	offset2 -=3D cfun-&gt;machine-&gt;frame.below_hard_fp_saved_regs_size;
-+	offset2 -=3D frame.below_hard_fp_saved_regs_size;
-       else
- 	offset2 +=3D crtl-&gt;outgoing_args_size;
-       rtx addr2 =3D plus_constant (Pmode, ptr_reg, offset2);
-@@ -8566,6 +8568,7 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
- 					bool frame_related_p,
- 					bool final_adjustment_p)
- {
-+  aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-   HOST_WIDE_INT guard_size
-     =3D 1 &lt;&lt; param_stack_clash_protection_guard_size;
-   HOST_WIDE_INT guard_used_by_caller =3D STACK_CLASH_CALLER_GUARD;
-@@ -8586,25 +8589,25 @@ aarch64_allocate_and_probe_stack_space (rtx temp=
1, rtx temp2,
-        register as a probe.  We can't assume that LR was saved at posit=
ion 0
-        though, so treat any space below it as unprobed.  */
-   if (final_adjustment_p
--      &amp;&amp; known_eq (cfun-&gt;machine-&gt;frame.below_hard_fp_sav=
ed_regs_size, 0))
-+      &amp;&amp; known_eq (frame.below_hard_fp_saved_regs_size, 0))
-     {
--      poly_int64 lr_offset =3D cfun-&gt;machine-&gt;frame.reg_offset[LR=
_REGNUM];
-+      poly_int64 lr_offset =3D frame.reg_offset[LR_REGNUM];
-       if (known_ge (lr_offset, 0))
- 	min_probe_threshold -=3D lr_offset.to_constant ();
-       else
- 	gcc_assert (!flag_stack_clash_protection || known_eq (poly_size, 0));
-     }
-=20
--  poly_int64 frame_size =3D cfun-&gt;machine-&gt;frame.frame_size;
-+  poly_int64 frame_size =3D frame.frame_size;
-=20
-   /* We should always have a positive probe threshold.  */
-   gcc_assert (min_probe_threshold &gt; 0);
-=20
-   if (flag_stack_clash_protection &amp;&amp; !final_adjustment_p)
-     {
--      poly_int64 initial_adjust =3D cfun-&gt;machine-&gt;frame.initial_=
adjust;
--      poly_int64 sve_callee_adjust =3D cfun-&gt;machine-&gt;frame.sve_c=
allee_adjust;
--      poly_int64 final_adjust =3D cfun-&gt;machine-&gt;frame.final_adju=
st;
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
--  poly_int64 frame_size =3D cfun-&gt;machine-&gt;frame.frame_size;
--  poly_int64 initial_adjust =3D cfun-&gt;machine-&gt;frame.initial_adju=
st;
--  HOST_WIDE_INT callee_adjust =3D cfun-&gt;machine-&gt;frame.callee_adj=
ust;
--  poly_int64 final_adjust =3D cfun-&gt;machine-&gt;frame.final_adjust;
--  poly_int64 callee_offset =3D cfun-&gt;machine-&gt;frame.callee_offset=
;
--  poly_int64 sve_callee_adjust =3D cfun-&gt;machine-&gt;frame.sve_calle=
e_adjust;
-+  aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-+  poly_int64 frame_size =3D frame.frame_size;
-+  poly_int64 initial_adjust =3D frame.initial_adjust;
-+  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
-+  poly_int64 final_adjust =3D frame.final_adjust;
-+  poly_int64 callee_offset =3D frame.callee_offset;
-+  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
-   poly_int64 below_hard_fp_saved_regs_size
--    =3D cfun-&gt;machine-&gt;frame.below_hard_fp_saved_regs_size;
--  unsigned reg1 =3D cfun-&gt;machine-&gt;frame.wb_candidate1;
--  unsigned reg2 =3D cfun-&gt;machine-&gt;frame.wb_candidate2;
--  bool emit_frame_chain =3D cfun-&gt;machine-&gt;frame.emit_frame_chain=
;
-+    =3D frame.below_hard_fp_saved_regs_size;
-+  unsigned reg1 =3D frame.wb_candidate1;
-+  unsigned reg2 =3D frame.wb_candidate2;
-+  bool emit_frame_chain =3D frame.emit_frame_chain;
-   rtx_insn *insn;
-=20
-   if (flag_stack_clash_protection &amp;&amp; known_eq (callee_adjust, 0=
))
-@@ -8969,7 +8973,7 @@ aarch64_expand_prologue (void)
-=20
-   /* The offset of the frame chain record (if any) from the current SP.=
  */
-   poly_int64 chain_offset =3D (initial_adjust + callee_adjust
--			     - cfun-&gt;machine-&gt;frame.hard_fp_offset);
-+			     - frame.hard_fp_offset);
-   gcc_assert (known_ge (chain_offset, 0));
-=20
-   /* The offset of the bottom of the save area from the current SP.  */
-@@ -9072,15 +9076,16 @@ aarch64_use_return_insn_p (void)
- void
- aarch64_expand_epilogue (bool for_sibcall)
- {
--  poly_int64 initial_adjust =3D cfun-&gt;machine-&gt;frame.initial_adju=
st;
--  HOST_WIDE_INT callee_adjust =3D cfun-&gt;machine-&gt;frame.callee_adj=
ust;
--  poly_int64 final_adjust =3D cfun-&gt;machine-&gt;frame.final_adjust;
--  poly_int64 callee_offset =3D cfun-&gt;machine-&gt;frame.callee_offset=
;
--  poly_int64 sve_callee_adjust =3D cfun-&gt;machine-&gt;frame.sve_calle=
e_adjust;
-+  aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-+  poly_int64 initial_adjust =3D frame.initial_adjust;
-+  HOST_WIDE_INT callee_adjust =3D frame.callee_adjust;
-+  poly_int64 final_adjust =3D frame.final_adjust;
-+  poly_int64 callee_offset =3D frame.callee_offset;
-+  poly_int64 sve_callee_adjust =3D frame.sve_callee_adjust;
-   poly_int64 below_hard_fp_saved_regs_size
--    =3D cfun-&gt;machine-&gt;frame.below_hard_fp_saved_regs_size;
--  unsigned reg1 =3D cfun-&gt;machine-&gt;frame.wb_candidate1;
--  unsigned reg2 =3D cfun-&gt;machine-&gt;frame.wb_candidate2;
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
--		+ cfun-&gt;machine-&gt;frame.saved_varargs_size, 0);
-+		+ frame.saved_varargs_size, 0);
-=20
-   /* Emit a barrier to prevent loads from a deallocated stack.  */
-   if (maybe_gt (final_adjust, crtl-&gt;outgoing_args_size)
-@@ -11744,24 +11749,24 @@ aarch64_can_eliminate (const int from ATTRIBUT=
E_UNUSED, const int to)
- poly_int64
- aarch64_initial_elimination_offset (unsigned from, unsigned to)
- {
-+  aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-+
-   if (to =3D=3D HARD_FRAME_POINTER_REGNUM)
-     {
-       if (from =3D=3D ARG_POINTER_REGNUM)
--	return cfun-&gt;machine-&gt;frame.hard_fp_offset;
-+	return frame.hard_fp_offset;
-=20
-       if (from =3D=3D FRAME_POINTER_REGNUM)
--	return cfun-&gt;machine-&gt;frame.hard_fp_offset
--	       - cfun-&gt;machine-&gt;frame.locals_offset;
-+	return frame.hard_fp_offset - frame.locals_offset;
-     }
-=20
-   if (to =3D=3D STACK_POINTER_REGNUM)
-     {
-       if (from =3D=3D FRAME_POINTER_REGNUM)
--	  return cfun-&gt;machine-&gt;frame.frame_size
--		 - cfun-&gt;machine-&gt;frame.locals_offset;
-+	return frame.frame_size - frame.locals_offset;
-     }
-=20
--  return cfun-&gt;machine-&gt;frame.frame_size;
-+  return frame.frame_size;
- }
-=20
-=20
---=20
-2.34.1
-
-
-From a2a57f7ec7912e77eb26919545807d90065584ff Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
--  if (frame.frame_size.is_constant (&amp;const_size)
--      &amp;&amp; const_size &lt; max_push_offset
--      &amp;&amp; known_eq (frame.hard_fp_offset, const_size))
-+  if (known_eq (frame.saved_regs_size, 0))
-+    frame.initial_adjust =3D frame.frame_size;
-+  else if (frame.frame_size.is_constant (&amp;const_size)
-+	   &amp;&amp; const_size &lt; max_push_offset
-+	   &amp;&amp; known_eq (frame.hard_fp_offset, const_size))
-     {
-       /* Simple, small frame with no outgoing arguments:
-=20
---=20
-2.34.1
-
-
-From a8385d14318634f2e3a08a75bd2d6e2810f8cec9 Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-	and use it instead of crtl-&gt;outgoing_args_size.
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
-   gcc_assert (crtl-&gt;is_leaf
- 	      || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRED));
-=20
-+  frame.bytes_below_saved_regs =3D crtl-&gt;outgoing_args_size;
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
--  gcc_assert (multiple_p (crtl-&gt;outgoing_args_size,
-+  gcc_assert (multiple_p (frame.bytes_below_saved_regs,
- 			  STACK_BOUNDARY / BITS_PER_UNIT));
--  frame.frame_size =3D above_outgoing_args + crtl-&gt;outgoing_args_siz=
e;
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
- 	   &amp;&amp; const_size &lt; max_push_offset
- 	   &amp;&amp; known_eq (frame.hard_fp_offset, const_size))
-     {
--      /* Simple, small frame with no outgoing arguments:
-+      /* Simple, small frame with no data below the saved registers.
-=20
- 	 stp reg1, reg2, [sp, -frame_size]!
- 	 stp reg3, reg4, [sp, 16]  */
-       frame.callee_adjust =3D const_size;
-     }
--  else if (crtl-&gt;outgoing_args_size.is_constant (&amp;const_outgoing=
_args_size)
-+  else if (frame.bytes_below_saved_regs.is_constant (&amp;const_below_s=
aved_regs)
- 	   &amp;&amp; frame.saved_regs_size.is_constant (&amp;const_saved_regs=
_size)
--	   &amp;&amp; const_outgoing_args_size + const_saved_regs_size &lt; 51=
2
--	   /* We could handle this case even with outgoing args, provided
--	      that the number of args left us with valid offsets for all
--	      predicate and vector save slots.  It's such a rare case that
--	      it hardly seems worth the effort though.  */
--	   &amp;&amp; (!saves_below_hard_fp_p || const_outgoing_args_size =3D=3D=
 0)
-+	   &amp;&amp; const_below_saved_regs + const_saved_regs_size &lt; 512
-+	   /* We could handle this case even with data below the saved
-+	      registers, provided that that data left us with valid offsets
-+	      for all predicate and vector save slots.  It's such a rare
-+	      case that it hardly seems worth the effort though.  */
-+	   &amp;&amp; (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D=
 0)
- 	   &amp;&amp; !(cfun-&gt;calls_alloca
- 		&amp;&amp; frame.hard_fp_offset.is_constant (&amp;const_fp_offset)
- 		&amp;&amp; const_fp_offset &lt; max_push_offset))
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
- 	   &amp;&amp; known_eq (frame.saved_regs_size,
-@@ -7649,30 +7651,29 @@ aarch64_layout_frame (void)
-=20
- 	 sub sp, sp, hard_fp_offset + below_hard_fp_saved_regs_size
- 	 save SVE registers relative to SP
--	 sub sp, sp, outgoing_args_size  */
-+	 sub sp, sp, bytes_below_saved_regs  */
-       frame.initial_adjust =3D (frame.hard_fp_offset
- 			      + frame.below_hard_fp_saved_regs_size);
--      frame.final_adjust =3D crtl-&gt;outgoing_args_size;
-+      frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-   else if (frame.hard_fp_offset.is_constant (&amp;const_fp_offset)
- 	   &amp;&amp; const_fp_offset &lt; max_push_offset)
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
--      frame.final_adjust =3D crtl-&gt;outgoing_args_size;
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
--      frame.final_adjust =3D crtl-&gt;outgoing_args_size;
-+      frame.final_adjust =3D frame.bytes_below_saved_regs;
-     }
-=20
-   /* Make sure the individual adjustments add up to the full frame size=
.  */
-@@ -8274,7 +8275,7 @@ aarch64_get_separate_components (void)
- 	if (frame_pointer_needed)
- 	  offset -=3D frame.below_hard_fp_saved_regs_size;
- 	else
--	  offset +=3D crtl-&gt;outgoing_args_size;
-+	  offset +=3D frame.bytes_below_saved_regs;
-=20
- 	/* Check that we can access the stack slot of the register with one
- 	   direct load with no adjustments needed.  */
-@@ -8423,7 +8424,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       if (frame_pointer_needed)
- 	offset -=3D frame.below_hard_fp_saved_regs_size;
-       else
--	offset +=3D crtl-&gt;outgoing_args_size;
-+	offset +=3D frame.bytes_below_saved_regs;
-=20
-       rtx addr =3D plus_constant (Pmode, ptr_reg, offset);
-       rtx mem =3D gen_frame_mem (mode, addr);
-@@ -8477,7 +8478,7 @@ aarch64_process_components (sbitmap components, bo=
ol prologue_p)
-       if (frame_pointer_needed)
- 	offset2 -=3D frame.below_hard_fp_saved_regs_size;
-       else
--	offset2 +=3D crtl-&gt;outgoing_args_size;
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
- 	   &amp;&amp; known_eq (frame.saved_regs_size,
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
- 	       &amp;&amp; (!offset.is_constant (&amp;const_offset) || const_of=
fset &gt;=3D 512))
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
-   aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
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
-       if (mode =3D=3D VNx2DImode &amp;&amp; BYTES_BIG_ENDIAN)
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
- 				callee_adjust !=3D 0, &amp;cfi_ops);
--  aarch64_restore_callee_saves (callee_offset, P0_REGNUM, P15_REGNUM,
-+  aarch64_restore_callee_saves (final_adjust, P0_REGNUM, P15_REGNUM,
- 				false, &amp;cfi_ops);
-   if (maybe_ne (sve_callee_adjust, 0))
-     aarch64_add_sp (NULL_RTX, NULL_RTX, sve_callee_adjust, true);
--  aarch64_restore_callee_saves (callee_offset - sve_callee_adjust,
-+  aarch64_restore_callee_saves (final_adjust + sve_callee_adjust,
- 				R0_REGNUM, R30_REGNUM,
- 				callee_adjust !=3D 0, &amp;cfi_ops);
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-   else if (frame.frame_size.is_constant (&amp;const_size)
- 	   &amp;&amp; const_size &lt; max_push_offset
--	   &amp;&amp; known_eq (frame.hard_fp_offset, const_size))
-+	   &amp;&amp; known_eq (frame.bytes_above_hard_fp, const_size))
-     {
-       /* Simple, small frame with no data below the saved registers.
-=20
-@@ -7632,8 +7632,8 @@ aarch64_layout_frame (void)
- 	      case that it hardly seems worth the effort though.  */
- 	   &amp;&amp; (!saves_below_hard_fp_p || const_below_saved_regs =3D=3D=
 0)
- 	   &amp;&amp; !(cfun-&gt;calls_alloca
--		&amp;&amp; frame.hard_fp_offset.is_constant (&amp;const_fp_offset)
--		&amp;&amp; const_fp_offset &lt; max_push_offset))
-+		&amp;&amp; frame.bytes_above_hard_fp.is_constant (&amp;const_above_fp=
)
-+		&amp;&amp; const_above_fp &lt; max_push_offset))
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
--  else if (frame.hard_fp_offset.is_constant (&amp;const_fp_offset)
--	   &amp;&amp; const_fp_offset &lt; max_push_offset)
-+  else if (frame.bytes_above_hard_fp.is_constant (&amp;const_above_fp)
-+	   &amp;&amp; const_above_fp &lt; max_push_offset)
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-   gcc_assert (crtl-&gt;is_leaf
- 	      || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRED));
-=20
--  frame.bytes_below_saved_regs =3D crtl-&gt;outgoing_args_size;
-+  poly_int64 offset =3D crtl-&gt;outgoing_args_size;
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
-       if (mode =3D=3D VNx2DImode &amp;&amp; BYTES_BIG_ENDIAN)
- 	aarch64_adjust_sve_callee_save_base (mode, base_rtx, anchor_reg,
-@@ -8271,14 +8271,12 @@ aarch64_get_separate_components (void)
- 	   it as a stack probe for -fstack-clash-protection.  */
- 	if (flag_stack_clash_protection
- 	    &amp;&amp; maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
--	    &amp;&amp; known_eq (offset, 0))
-+	    &amp;&amp; known_eq (offset, frame.bytes_below_saved_regs))
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
-       &amp;&amp; known_eq (frame.below_hard_fp_saved_regs_size, 0))
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-   else if (frame.bytes_above_hard_fp.is_constant (&amp;const_above_fp)
---=20
-2.34.1
-
-
-From f22329d5efbacf80edf4a2d45ebadd93f283252c Mon Sep 17 00:00:00 2001
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
-Date: Tue, 12 Sep 2023 16:19:49 +0100
-Subject: [PATCH 14/19] aarch64: Tweak stack clash boundary condition
-
-The AArch64 ABI says that, when stack clash protection is used,
-there can be a maximum of 1KiB of unprobed space at sp on entry
-to a function.  Therefore, we need to probe when allocating
-&gt;=3D guard_size - 1KiB of data (&gt;=3D rather than &gt;).  This is w=
hat
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
-probe the allocation if it is &gt; 1KiB.  Again, this allocation is
-then sometimes (but not always) probed at offset 1024.  This sort of
-allocation is currently only used for outgoing arguments, which are
-rarely this big.
-
-However, the code also probed if this final outgoing-arguments
-allocation was =3D=3D 1KiB, rather than just &gt; 1KiB.  This isn't
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
-     =3D 1 &lt;&lt; param_stack_clash_protection_guard_size;
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
-+/* { dg-options &quot;-O2 -fstack-clash-protection -fomit-frame-pointer=
 --param stack-clash-protection-guard-size=3D12&quot; } */
-+/* { dg-final { check-function-bodies &quot;**&quot; &quot;&quot; } } *=
/
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
-+      f(0, 0, 0, 0, 0, 0, 0, &amp;y,
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
-+      f(0, 0, 0, 0, 0, 0, 0, &amp;y,
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-      else if (final_adjustment_p &amp;&amp; rounded_size =3D=3D 0)
-	residual_probe_offset =3D 0;
-
-which forces any allocation that is smaller than the guard page size
-to be probed at offset 0 rather than the usual offset 1024.  It was
-therefore possible to construct cases in which we had:
-
-* a probe using LR at SP + 80 bytes (or some other value &gt;=3D 16)
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
-+  auto allocate_gpr_slot =3D [&amp;](unsigned int regno)
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
-+	   &amp;&amp; known_eq (frame.reg_offset[R30_REGNUM], SLOT_REQUIRED))
-+    /* Put the LR save slot first, since it makes a good choice of prob=
e
-+       for stack clash purposes.  The idea is that the link register us=
ually
-+       has to be saved before a call anyway, and so we lose little by
-+       stopping it from being individually shrink-wrapped.  */
-+    allocate_gpr_slot (R30_REGNUM);
-=20
-   for (regno =3D R0_REGNUM; regno &lt;=3D R30_REGNUM; regno++)
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
--      &amp;&amp; known_eq (frame.below_hard_fp_saved_regs_size, 0))
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
-       if (final_adjustment_p &amp;&amp; rounded_size !=3D 0)
- 	min_probe_threshold =3D 0;
-       /* If doing a small final adjustment, we always probe at offset 0.
--	 This is done to avoid issues when LR is not at position 0 or when
--	 the final adjustment is smaller than the probing offset.  */
-+	 This is done to avoid issues when the final adjustment is smaller
-+	 than the probing offset.  */
-       else if (final_adjustment_p &amp;&amp; rounded_size =3D=3D 0)
- 	residual_probe_offset =3D 0;
-=20
-diff --git a/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c =
b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
-new file mode 100644
-index 00000000000..82447d20fff
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/stack-check-prologue-18.c
-@@ -0,0 +1,100 @@
-+/* { dg-options &quot;-O2 -fstack-clash-protection -fomit-frame-pointer=
 --param stack-clash-protection-guard-size=3D12&quot; } */
-+/* { dg-final { check-function-bodies &quot;**&quot; &quot;&quot; } } *=
/
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
-+      asm volatile (&quot;&quot; :::
-+		    &quot;x19&quot;, &quot;x20&quot;, &quot;x21&quot;, &quot;x22&quot=
;, &quot;x23&quot;, &quot;x24&quot;, &quot;x25&quot;, &quot;x26&quot;);
-+      f(0, 0, 0, 0, 0, 0, 0, &amp;y,
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
-+      asm volatile (&quot;&quot; :::
-+		    &quot;x19&quot;, &quot;x20&quot;, &quot;x21&quot;, &quot;x22&quot=
;, &quot;x23&quot;, &quot;x24&quot;, &quot;x25&quot;, &quot;x26&quot;);
-+      f(0, 0, 0, 0, 0, 0, 0, &amp;y,
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
-+      asm volatile (&quot;&quot; :::
-+		    &quot;x19&quot;, &quot;x20&quot;, &quot;x21&quot;, &quot;x22&quot=
;, &quot;x23&quot;, &quot;x24&quot;, &quot;x25&quot;, &quot;x26&quot;);
-+      f(0, 0, 0, 0, 0, 0, 0, &amp;y,
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-+      gcc_assert (guard_used_by_caller + byte_sp_alignment &lt;=3D size=
);
-+
-       /* If we're doing final adjustments, and we've done any full page
- 	 allocations then any residual needs to be probed.  */
-       if (final_adjustment_p &amp;&amp; rounded_size !=3D 0)
- 	min_probe_threshold =3D 0;
--      /* If doing a small final adjustment, we always probe at offset 0.
--	 This is done to avoid issues when the final adjustment is smaller
--	 than the probing offset.  */
--      else if (final_adjustment_p &amp;&amp; rounded_size =3D=3D 0)
--	residual_probe_offset =3D 0;
-=20
-       aarch64_sub_sp (temp1, temp2, residual, frame_related_p);
-       if (residual &gt;=3D min_probe_threshold)
-@@ -8771,8 +8767,8 @@ aarch64_allocate_and_probe_stack_space (rtx temp1,=
 rtx temp2,
- 		     HOST_WIDE_INT_PRINT_DEC &quot; bytes, probing will be required.&=
quot;
- 		     &quot;\n&quot;, residual);
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-probe if the frame size is &gt;=3D guard_size - 1KiB.  In addition, if t=
he
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
-  a probe if the allocation size is &gt; 1KiB
-
-* any other allocation requires a probe if the allocation size
-  is &gt;=3D guard_size - 1KiB
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
- 	&amp;&amp; !crtl-&gt;abi-&gt;clobbers_full_reg_p (regno))
-       frame.reg_offset[regno] =3D SLOT_REQUIRED;
-=20
--  /* With stack-clash, LR must be saved in non-leaf functions.  The sav=
ing of
--     LR counts as an implicit probe which allows us to maintain the inv=
ariant
--     described in the comment at expand_prologue.  */
--  gcc_assert (crtl-&gt;is_leaf
--	      || maybe_ne (frame.reg_offset[R30_REGNUM], SLOT_NOT_REQUIRED));
-=20
-   poly_int64 offset =3D crtl-&gt;outgoing_args_size;
-   gcc_assert (multiple_p (offset, STACK_BOUNDARY / BITS_PER_UNIT));
-   frame.bytes_below_saved_regs =3D offset;
-+  frame.sve_save_and_probe =3D INVALID_REGNUM;
-=20
-   /* Now assign stack slots for the registers.  Start with the predicat=
e
-      registers, since predicate LDR and STR have a relatively small
-@@ -7485,6 +7481,8 @@ aarch64_layout_frame (void)
-   for (regno =3D P0_REGNUM; regno &lt;=3D P15_REGNUM; regno++)
-     if (known_eq (frame.reg_offset[regno], SLOT_REQUIRED))
-       {
-+	if (frame.sve_save_and_probe =3D=3D INVALID_REGNUM)
-+	  frame.sve_save_and_probe =3D regno;
- 	frame.reg_offset[regno] =3D offset;
- 	offset +=3D BYTES_PER_SVE_PRED;
-       }
-@@ -7522,6 +7520,8 @@ aarch64_layout_frame (void)
-     for (regno =3D V0_REGNUM; regno &lt;=3D V31_REGNUM; regno++)
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
-+		  &amp;&amp; known_eq (frame.reg_offset[frame.sve_save_and_probe],
-+			       frame.bytes_below_saved_regs)));
-+
-   frame.bytes_below_hard_fp =3D offset;
-+  frame.hard_fp_save_and_probe =3D INVALID_REGNUM;
-=20
-   auto allocate_gpr_slot =3D [&amp;](unsigned int regno)
-     {
-+      if (frame.hard_fp_save_and_probe =3D=3D INVALID_REGNUM)
-+	frame.hard_fp_save_and_probe =3D regno;
-       frame.reg_offset[regno] =3D offset;
-       if (frame.wb_candidate1 =3D=3D INVALID_REGNUM)
- 	frame.wb_candidate1 =3D regno;
-@@ -7568,6 +7576,8 @@ aarch64_layout_frame (void)
-   for (regno =3D V0_REGNUM; regno &lt;=3D V31_REGNUM; regno++)
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
-+		  &amp;&amp; known_eq (frame.reg_offset[frame.hard_fp_save_and_probe]=
,
-+			       frame.bytes_below_hard_fp)));
-+
-+  /* With stack-clash, a register must be saved in non-leaf functions.
-+     The saving of the bottommost register counts as an implicit probe,
-+     which allows us to maintain the invariant described in the comment
-+     at expand_prologue.  */
-+  gcc_assert (crtl-&gt;is_leaf || maybe_ne (frame.saved_regs_size, 0));
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
-+  if (crtl-&gt;is_leaf
-+      &amp;&amp; !cfun-&gt;calls_alloca
-+      &amp;&amp; known_eq (frame.final_adjust, 0))
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
--	    &amp;&amp; maybe_ne (frame.below_hard_fp_saved_regs_size, 0)
--	    &amp;&amp; known_eq (offset, frame.bytes_below_saved_regs))
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
- 		  &amp;&amp; known_eq (frame.reg_offset[frame.sve_save_and_probe],
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
- 		  &amp;&amp; known_eq (frame.reg_offset[frame.hard_fp_save_and_probe]=
,
- 			       frame.bytes_below_hard_fp)));
-@@ -7611,7 +7609,7 @@ aarch64_layout_frame (void)
-      The saving of the bottommost register counts as an implicit probe,
-      which allows us to maintain the invariant described in the comment
-      at expand_prologue.  */
--  gcc_assert (crtl-&gt;is_leaf || maybe_ne (frame.saved_regs_size, 0));
-+  gcc_assert (crtl-&gt;is_leaf || maybe_ne (saved_regs_size, 0));
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
-   else if (frame.frame_size.is_constant (&amp;const_size)
- 	   &amp;&amp; const_size &lt; max_push_offset
-@@ -7650,7 +7648,7 @@ aarch64_layout_frame (void)
-       frame.callee_adjust =3D const_size;
-     }
-   else if (frame.bytes_below_saved_regs.is_constant (&amp;const_below_s=
aved_regs)
--	   &amp;&amp; frame.saved_regs_size.is_constant (&amp;const_saved_regs=
_size)
-+	   &amp;&amp; saved_regs_size.is_constant (&amp;const_saved_regs_size)
- 	   &amp;&amp; const_below_saved_regs + const_saved_regs_size &lt; 512
- 	   /* We could handle this case even with data below the saved
- 	      registers, provided that that data left us with valid offsets
-@@ -7669,8 +7667,7 @@ aarch64_layout_frame (void)
-       frame.initial_adjust =3D frame.frame_size;
-     }
-   else if (saves_below_hard_fp_p
--	   &amp;&amp; known_eq (frame.saved_regs_size,
--			frame.below_hard_fp_saved_regs_size))
-+	   &amp;&amp; known_eq (saved_regs_size, below_hard_fp_saved_regs_size=
))
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
- 	|  local variables              | &lt;-- frame_pointer_rtx
- 	|                               |
- 	+-------------------------------+
--	|  padding                      | \
--	+-------------------------------+  |
--	|  callee-saved registers       |  | frame.saved_regs_size
--	+-------------------------------+  |
--	|  LR'                          |  |
--	+-------------------------------+  |
--	|  FP'                          |  |
--	+-------------------------------+  |&lt;- hard_frame_pointer_rtx (alig=
ned)
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
-+	+-------------------------------+ &lt;-- hard_frame_pointer_rtx (align=
ed)
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
-From: Richard Sandiford <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:richard.sandiford@arm.com">&lt;richard.sandiford@arm.com&gt;</a>
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
-+  return crtl-&gt;stack_protect_guard;
-+}
-+
- /* Mark the registers that need to be saved by the callee and calculate
-    the size of the callee-saved registers area and frame record (both F=
P
-    and LR may be omitted).  */
-@@ -7403,6 +7417,7 @@ aarch64_layout_frame (void)
-   poly_int64 vector_save_size =3D GET_MODE_SIZE (vector_save_mode);
-   bool frame_related_fp_reg_p =3D false;
-   aarch64_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;
-+  poly_int64 top_of_locals =3D -1;
-=20
-   frame.emit_frame_chain =3D aarch64_needs_frame_chain ();
-=20
-@@ -7469,9 +7484,16 @@ aarch64_layout_frame (void)
- 	&amp;&amp; !crtl-&gt;abi-&gt;clobbers_full_reg_p (regno))
-       frame.reg_offset[regno] =3D SLOT_REQUIRED;
-=20
-+  bool regs_at_top_p =3D aarch64_save_regs_above_locals_p ();
-=20
-   poly_int64 offset =3D crtl-&gt;outgoing_args_size;
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
-   gcc_assert (crtl-&gt;is_leaf || maybe_ne (saved_regs_size, 0));
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
--	|  local variables              | &lt;-- frame_pointer_rtx
-+	|  local variables (1)          | &lt;-- frame_pointer_rtx
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
- 	|                               | &lt;-- stack_pointer_rtx (aligned)
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
-+  if (emit_frame_chain &amp;&amp; maybe_ne (final_adjust, 0))
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
-+/* { dg-options &quot; -O -fstack-protector-strong -mstack-protector-gu=
ard=3Dsysreg -mstack-protector-guard-reg=3Dtpidr2_el0 -mstack-protector-g=
uard-offset=3D16&quot; } */
-+/* { dg-final { check-function-bodies &quot;**&quot; &quot;&quot; } } *=
/
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
-+#pragma GCC target &quot;+sve&quot;
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
-+/* { dg-options &quot;-O2 -mcpu=3Dneoverse-v1 -fstack-protector-all&quo=
t; } */
-+/* { dg-final { check-function-bodies &quot;**&quot; &quot;&quot; } } *=
/
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
-+  __builtin_printf(&quot;%d %d\n%s\n&quot;, a, b, c);
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
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------UmCbEU7v2GyRidbvc7yAFc8e--

