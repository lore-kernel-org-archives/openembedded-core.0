Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4CBD25042
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 07:40:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28737.1768203604341286966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 23:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Zi7EtrYn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5472788a74=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C702cS4104260
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 07:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=P8cS8iscR735RH+ExkYfEw
	25s5BP3bE8BmS6UYPmefc=; b=Zi7EtrYncg8kXKGOeFGkTOKPKBffmM7ATSfswt
	rSeXB1Qj7Uu6oQoJMA/aczrKpegMJN8XbzD68EARFsHVQ+Sq/wc+eWXmy/ELhStr
	s6hz0cXdfBo43Qzz4keemPTsBPmTsAVjD5jwhfnY9girg1bY7eXe2NC5ChHStHzu
	1Xe32sFCEBSLirN7VXAugiSSRwGBOdbSNwt+jb+SaTShb9o/h+eGOK+LzuKyq62B
	RsO5/YGcdka8h2dBeJSDrlSGFD724Smqjj1ecJ68kQ9PdR7VHrUfGXRX3vXwBY3d
	CKJVwLLCXReXkIV8I3jLhlEoGEUX9Kfah5H4BHwimAaasCKw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbythh2c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 07:40:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsJ6YhNIkabKDV1B3Xlyp0nbCC2sRhorr5fX6aAujJgObQRDGrBviqCgVObBgC36i8dWX0jOahVixqu97gadjVh6paKcTGE3NetCo5oAAQ+b99GYi+Nq2K3D8kgwxW/t5iAJw5CN41+3rytuDBdH0bvSnU1CyKKSX9sau1A8NDg1pDG185XW9tNiFI8mLsAC04/xi2mSIEd18NYILg0L1n3fyM/2viK6nV/sFdqprQTMIK+QvdrQpjXhWkXtbrqkboVlkZaInxq6gniGNTVn66r4PfAm/NrcylpvQTrWZgLxrxNDgOck3L/BXdw71b7Wa2HS4yNWS3Y8SLpRulzPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8cS8iscR735RH+ExkYfEw25s5BP3bE8BmS6UYPmefc=;
 b=U/bM9w8PkBanioGPyUo0n2KiuRyYx2F9RBCS1fPiKDWzFgnZy6EjVHbKsRpNM9nhQMCsEDc7ru084Kp7I6ZOhFo1zOQ9payOyPZ1rqGqFf3GOWZ6xdVhSNFdQRBagW4J1/kdwlFrqDTvf8II2XPNbCIuV+btjteCd7oOY7IpExFJi8AXvmZ/YStYSENb4+yv2hcqYQySEmTNaMzaIKBOWdPJQXegtgQZH9+yFqTGnGfV6AXrlcdo6v7pSoUlJkqC4IRen98mJl2rg3DVd0QyfX4zqMYVHGWeFG98r1pEEPPKtoMcNY1THqIJESbMEUCwgDUDEo9Dw80dDOeZw5gXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH8PR11MB7117.namprd11.prod.outlook.com (2603:10b6:510:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 07:40:00 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 07:40:00 +0000
Content-Type: multipart/alternative;
 boundary="------------v0WZfjtcjaV6BdgbK63Sajmz"
Message-ID: <fc5d529f-0ca3-49e7-a050-62593305b128@windriver.com>
Date: Mon, 12 Jan 2026 15:39:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] go.bbclass: set buildid to empty string to
 improve reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260108060842.3340603-1-changqing.li@windriver.com>
 <CANNYZj9YA+FNmcn4RiwK1CEvK909uDbgZcHYiHd+yZo00ciejQ@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj9YA+FNmcn4RiwK1CEvK909uDbgZcHYiHd+yZo00ciejQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH8PR11MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c36ad20-4f06-4aac-4120-08de51adca49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|13003099007|8096899003|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WXNGa2xvbXZkNGdMV1V0MmdDcEVNak4razRSdk82UzhKNUhJcTVpY0F4MUg3?=
 =?utf-8?B?amlSVElteHE4UDg5NTd2cXdFTkJZTFRsRmNUazRYMFc3VklwRXd4YnRnQlln?=
 =?utf-8?B?dTZMS3ppSXdybldiYmZGV2wzMG9yZ05HY3lMNTk2Zy8wcEsvU3E4Wmt3ajJ1?=
 =?utf-8?B?WVJacjBWZGJaZlJ3cDB2d0pIWkYzK3hIOE5RV29vZXhsS21RalUrRlhJYzJP?=
 =?utf-8?B?ODZlZFlHQmExTXo0RytUYXZFUFo2ZGlueWtPeDd6Nks4VVFKQnkvNDB1UitP?=
 =?utf-8?B?a1g4citWcGZxcHYwUTRPNjdMYjArQU9Xc0ZaNHFGQzdFazFSQXhKQTBHTDBn?=
 =?utf-8?B?TldYeXNxaEE0T1hoUWZKaWNjYUdHYmcveS9nM292Y2UwSTU4RnZ3RWFNYjJ3?=
 =?utf-8?B?dzlYaDRXTGRkZDNCa1pYYk9ZdlFLMXZhZGV2NUUrdnVRQ2RrVmo2MG85UGNZ?=
 =?utf-8?B?dVVyV2ZPcGx3M3FUK3ZqY1g0aGNRc0J4SW52NHZYeHN2WkN6UEwvZjFNdjdO?=
 =?utf-8?B?L0Q4RDhQTENJSy9UQTVBQStYOWU0RHNGK0dHbks2RGRyblpxK0YwWU96V0gr?=
 =?utf-8?B?QnYxd0lZZ29hNUQzNDl2SHZVbC84aTJLY0FvbmhNVC9HQ0F5T3V4UEl4YTZu?=
 =?utf-8?B?aEJSREJqa3Jqdk5BOTZKMmpDOTZwMTBwM0tpSWc3dUxZWWhhRmdWY1cvRVo5?=
 =?utf-8?B?L1RyRzJhUHZIVGVzMXlma2w5T2kxbHovS1R4aTRxM2xScDdSZTVwM3BFU2pD?=
 =?utf-8?B?eTJmSjBBTmVnK0VCUUo4My9XMG5LRTYwbjBpYzM2Qk5aV3BaRGdPT1g5R25r?=
 =?utf-8?B?U2FXQ0pwYkRUUHRCMVVwOGhoNTJvWW1XR1JkVzY5dm9hamcxM012ZzFYUDRG?=
 =?utf-8?B?aEFQMmNqWXlHdkRmNk9leml6L1BYZ3lJeHVNKzR6Tk45OHBKNDhiUVdSTENH?=
 =?utf-8?B?STliRzBHdlN4OEVWOVgxamQ3R254LytvOFh3QW1aRDMxemJEWFRtVERDS2lz?=
 =?utf-8?B?NkR3Mnp3RisvbEFDdzlMZHExendLc0FSdHZ2YVR0RmhFWXRnbmZ1SWtPYldB?=
 =?utf-8?B?L09pQkNEVmtKTWpMNWUreDNVVlVuVEVTcVhUYUV4K1lJaEZsQkE5ZEdWc3c3?=
 =?utf-8?B?eElHRFY4ZFRWdnI2eGhWL2pmdnZEWW9SS01oRnRoQnkwZ3FKQ2tMNCtkTXgv?=
 =?utf-8?B?aFQwcjZJUjFZL2FWVy9TSkdnVmdaRlRpZ3RSSXFTMmNwZG8rdkJmTzNKL1Fy?=
 =?utf-8?B?WVhJQXR3ZWdjQkVYMWJya25mbXh5eW9xeEZncDUwUVJVUG5KODJrVUZLWTJr?=
 =?utf-8?B?TnhhVFNXVk1rWE9pRFFGMEdGQlJKT3dkeER0MXRRT1R1cFNMM09ScnI2NVFO?=
 =?utf-8?B?QUJXUitNVjd2QmF0cU5uSWl0TXhZZ0xCZGtTcGpocUdXaDZoTTNmVDVzVHZD?=
 =?utf-8?B?dFQvRGNkSmdyMi9MVzNrem12NUFDUzhtY3hUY1FtaHBCdzJJKzRnSlZPbGpi?=
 =?utf-8?B?VEpMUFVxZ1ZHMkFmaU92OHQ5N1hheXYrOVZaVzhnUFM5TUNOdXZucFFVWTdu?=
 =?utf-8?B?d3ExVHNabkRWTUxGUVI2V1Y0VDBLOWFBU1RMN0E1U1ZFTCtreWVIZDhwcWcx?=
 =?utf-8?B?N2JCOW5vbm0rRXBDSUsxQUJUTnVEcldZc1dFMWcxRE9RZHVEdmhYVFQwa3ZL?=
 =?utf-8?B?cGNjbEVHbmMrdU85eGNDeHNlSkxMQjdpRHRSS3U5NDJhKzh0VVozMU1tUmti?=
 =?utf-8?B?NmFmUmMwQTRwb1NJNGwxQ0xTMnh2QVliY3ZiMjZ3NnN5T25hZWVyWW9jMlU3?=
 =?utf-8?B?K3liNHZ2R01ERFBGTU05YlZCdllOTVV2SlovdDZSOVQ4K0FoeXNiaU0yYkJ1?=
 =?utf-8?B?d0E1Um9LUXFMZGptbVlTaHphci9KdXVoU0FWSVczTGpRdXFFbGJyQlI3ZU10?=
 =?utf-8?Q?Tv/rceaECQA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(13003099007)(8096899003)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0xKeHNPQnZDMzRBU1dXckgxMVRrM00vVWM4aVV2N2F2YmdQb29JTHNnRDcv?=
 =?utf-8?B?aXd6SlpwK0pYckpBc1QvcmE3amw0dE9lL0dQdlMvb3M5RWlJUmFaT0hFcjds?=
 =?utf-8?B?N29rMWRJT1NPdDFTVGxCelpuaE9GMnFJVmdaMk9HL0VmNW1uVnlEY3BvMnln?=
 =?utf-8?B?ay9tOFR4Q0VmblJ1eWd2TVM3MEFvUkdqalJzdEZuVWR5bzM3YWY4OU1EUGZV?=
 =?utf-8?B?NmNpbUo5UjNxN1NzbkVCaXFqdzBzc3BXTFRZZlZnSUljUDVGck5mQnlTRTlF?=
 =?utf-8?B?V2I1M1ZnTllsK2piTkQwUzJDMDlOMDVOcWlDcDkyMmNUdDc5ZTR2RE1OcUVG?=
 =?utf-8?B?RWc2YjBKd1ErSURRZUZBM2lFYlJrYnIvbXJmSmExU0tSaTI0M2Q2dHY4MkNp?=
 =?utf-8?B?Kzg4cEVlRGQzUitTSHpKODZ4RmtaQnNwUncrUmtrOVFRenFsQVlGK0ZDaHcr?=
 =?utf-8?B?aGpKa3pxUGhoMS9IdytUcHFUekMvQmgxdEFNeUJmelp5cmxaVkd2Y2JDQlIz?=
 =?utf-8?B?bHZmV2ZhdkVWekZWQmdHVURiS3gvUkYwYS9jQW12TTRPcEQ2VjU4NnJsVXEz?=
 =?utf-8?B?QzhTbTJNTGhuVVlYVXA5cUZBWW50SzlrRys5eC9XZ01XYmluS2pJQ25ic3pi?=
 =?utf-8?B?eTRGZ0hsbFB2NGJmVEU5cWo5OGFsTy93ci9zdG5NaHUva0krZlFTck02eXc2?=
 =?utf-8?B?Uy9rbFVNdGhqY0F3ZnBmMTJwZk90RklmcjZUdVFoaUpjdllFV3NYOHRqbWE5?=
 =?utf-8?B?QmZlTlIyTExnMHNpNVVnNWtLckFkdGNVZSsxbzhNSlZmNHdnTlRzdnp4Y0FS?=
 =?utf-8?B?K3BWVmxFeGVSOUlJU2dIbmVKaUtVRWV1bFFpUkd1aTNnQnJGSmMxWEpUZldL?=
 =?utf-8?B?M09HZkVRQjNzYndJb3BkV0xRaWRlT0pGQ3JDSlNudkNaeTFERjBvRHJ3eUsy?=
 =?utf-8?B?Q0dVZWZHbW5MOExEN2xHVjNhU1lOOTFFU0RPdGw0RFlsSTdxKzNCMnNUeVJC?=
 =?utf-8?B?ZytpbDhsL01ERDhWcGlaRnU0b0lMOTg2d3NJUWVGVERkQmlDZUxKbXpnczJP?=
 =?utf-8?B?VWFCMGJUaFoxbzExYkxPMG9KRUNMUSsyRUs4TERoS3Z2NlI4S252cHExVHVh?=
 =?utf-8?B?bXNaM3VMUWR0bFk2UnBvSWpsbm92ckx5cmg5ZEJNMmlCM1ZEVk9BSHlWQ2Uy?=
 =?utf-8?B?dGxZemxQR1lGdTFvbjc1VUhiOFVhaEUvWW5PSTVGU2ZHalpDZllmNDRkbG82?=
 =?utf-8?B?Mnd0dkxyS0xXL2N2OGZrR24vTFhoeXRWS2UvdGtuV3lucDVjWUdteno3d1RX?=
 =?utf-8?B?L3h1R2pqS2NUUFpwcTNhN0ZBZ001ampJTG1HTzZLMHVqOGtlUVN4L242d2Ey?=
 =?utf-8?B?S3JUUU9IQzJrSXFrNG1tcEdKcURvbU13Sm1Za0l6bVoyS0h5MlhiRGNvNDRl?=
 =?utf-8?B?Tm5KbmN6VWwrQjU3RkVFYTg5SHB2aEhrL1h2VHV6aml0WHdyK0tBWFY5c0xC?=
 =?utf-8?B?VWEzTEVLUk00LzlIMmZQUkNPM25kQTkweFNxYzhDY2hYYU92bU9maEsxWDVS?=
 =?utf-8?B?anBqdjlQK29sem51STRSaktPZk1HcmlocjR5UEFNODM4ZXNOOWRTdTY0M2N3?=
 =?utf-8?B?TkFCQ3dkQ0dvN2hsMC9veTFUZmpzdnU0UXdtK2I3TWl4OTBBbVFqZlRGTGZI?=
 =?utf-8?B?WGJoYWNFMUI1Q3Y5a3RhaGxKMGFiNEhLQVlUNGxubmRES3ZRUkhJQnoxK0dt?=
 =?utf-8?B?RXhpZWs5L0REVU1kZyswSDF4MDZsYXlRaFY3MnpWYVlrM29MYUhwSEdweWh5?=
 =?utf-8?B?cHpsWXp5UHJuTTF0Y0lFL0RYQnNpcGxoQ0R2cTNzRHFSQ0FUeUpRSXNBb0RF?=
 =?utf-8?B?SVZmRVhzQUFWNzlwZGE2SDJSM003bDYyaFArTVNEajBFOXd6WkJ1Qnk0SXc1?=
 =?utf-8?B?aitPVTJOTjV4cFIvbkd3WTdEbWVGeGt2NUZpKzFSNFVQRXlSSmpmK2gxazRh?=
 =?utf-8?B?YkJSQjFITGsrUnk0TWpadDN1KzZsZFJjQTV6b3ZEUjhjWHJKbzljc0JBZHdP?=
 =?utf-8?B?ZWJxUFF0SDVsVUhZSWpjYWhtSGFDT1BySWJmRUFFUkxvejRwYTk0NzQ4ZXoy?=
 =?utf-8?B?YzNNTDFjWVY1N1ltVS9HODZ1cW1oNWV1V3pNbnFRSnNWc3BJS0pER2xTdHRJ?=
 =?utf-8?B?amJlR3laMEMxV3dHbEYxV0drQmpGcHVMeGJjV1lYcktYU0NjRnFkMmUzZzZL?=
 =?utf-8?B?K2RxdEJCaVYzVGMvVVB2eWo5bzlkd2QrQUtuYkp4aHovL2JkOXJXUXAwRUhq?=
 =?utf-8?B?WTNySUF5WTV3UHJxMzJjYTVYaWFxV2JEdUh0a2llMXpPZkprcWtvZmplZDhn?=
 =?utf-8?Q?eCV0cGeWtA5GtHnU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c36ad20-4f06-4aac-4120-08de51adca49
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 07:40:00.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5753c4LZ7kTppxGLCXOYT+GHxPl4AU9gpX56egnsVClFpampymoikIpdZPS/bVwqSI3oN3XMm37Xp+iJ5FLSEhg97CoXCJeW6Dr9PDrBeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7117
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: bQiXx4U0qoh7jN5erbOrCbwBz-VPejLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX2o69BMP5gVqw
 C0lANyEN7omKxKC7Hie1897UGyiwkORKghi4b7had17UHo27nwrxhZdAuwrd7NNLZnV6oqJE15v
 P6dfh5jP7K8dGyRc2Sp0BRgoHYCk7jU4W36X83lD3Kl6ks9+KCLvbRHjDY29n881ed7nS9p7+L7
 q3WdI1m7WtaGv3n+JeDgQiVf8MTVCbbUKqKI3FJs7dYejIIZ5Ex2p64JXxpXA5T4tIhljl5Diwl
 qi4ZC3nR3nKIsqNtA0g6VHjN7hfoNJ/wY9awAsGBgkfiQrh0PMjUTQ5WnuB/a3f4BvtZWdqHsM7
 jbladZepZhT+urqybxStKGE7Lkr5PHbkM3rItFVPHF7eRmodbEx1xaYDWmZGKeHO2ibxZn735YE
 i8X+EwMhURfzW4kg3wUWlIBD5CJZGLIZS3JT27ziXXD7mlaKy+HKgo+1z3k89RCQTVKIgAW8Qc3
 Nu1a4rLMPWBvPwz3Pvw==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=6964a553 cx=c_pps
 a=GhmtI3pHzNGJg3++3mR9yA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UGXAvUmdAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=nPq_ZszDvoLywYZ6w3YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=oG8UBI9rXbX5DVGkF8kA:9 a=gLIhdNP7pq0LP9kt:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: D2h25W1WWBi55lPnRpbh-0gc1bcvYKeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 07:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229187

--------------v0WZfjtcjaV6BdgbK63Sajmz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60C702cS4104260


On 1/8/26 17:47, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> There's go-helloworld in oe-core, which is reproducible as it is. How
> can the non-reproducibility that this patch is fixing be observed? Can
> we improve our tests for it?

This moduleindex info only be used when GO111MODULE=3Don,=C2=A0 and=20
thego-helloworld is compiled with

GO111MODULE=3Doff, so it is reproducible as it is. To improve test, we=20
properly need to enable GO111MODULE


This issue can be easily reproduced by "bitbake buildah"=C2=A0 with diffe=
rent=20
path on a host. There are also other

recipes under meta-virtualization have this issue. I have also send a=20
series of patches to meta-virtualization.

Bruce prefer not set to empty,=C2=A0 but to a value like git hash that va=
lues=20
for us.

SRCREV seems like a proper value to use, but maybe not all the recipes=20
set this value SRCREV,=C2=A0 is it possible that

a recipe use a tarball and SRC_URI[sha256sum]?

and some recipes like=C2=A0 nerdctl,=C2=A0 it set multiple SRCREV,=C2=A0 =
set a value in=20
go.bbclass will make the logic here complicated.

SRCREV_nerdcli =3D "497c7cf74d09bf1ddf2678382360ca61e6faebac"

SRCREV_sys =3D "74cfc93a99be6ca6f193856132e6799065b071af"
...


//Sandy

>
> Alex
>
> On Thu, 8 Jan 2026 at 07:08, Changqing Li via lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Go packages and binaries are stamped with build IDs that record both t=
he
>> action ID, which is a hash of the inputs to the action that produced t=
he
>> packages or binary, and the content ID, which is a hash of the action
>> output, namely the archive or binary itself, Refer [1].
>>
>> And action ID include hash of modroot, which will include build path,
>> so this make go package not reproducible.
>> Refer [2], keying off module path instead of module root directory is =
a TODO.
>>
>> [snip of log]
>> HASH[moduleIndex]: "go1.25.3"
>> HASH[moduleIndex]: "modroot /build-a/tmp/work/x86-64-v3-wrs-linux/buil=
dah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n"
>> HASH[moduleIndex]: "package go1.25.3 go index v2 /build-a/tmp/work/x86=
-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/=
buildid\n"
>> HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC 1704=
\n"
>> HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
>> HASH[moduleIndex]: 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5=
314c0cbf4df7b
>>
>> Report this issue to upstream, refer [3]
>> Workaround the reproducible by setting buildid to empty, refer [4]
>>
>> Refer:
>> [1]https://github.com/golang/go/blob/master/src/cmd/go/internal/work/b=
uildid.go#L26
>> [2]https://github.com/golang/go/blob/master/src/cmd/go/internal/modind=
ex/read.go#L70
>> [1]https://github.com/golang/go/issues/77086
>> [2]https://github.com/golang/go/issues/34186
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/classes-recipe/go.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.b=
bclass
>> index b540471ba2..1c43b36fc0 100644
>> --- a/meta/classes-recipe/go.bbclass
>> +++ b/meta/classes-recipe/go.bbclass
>> @@ -51,11 +51,12 @@ GO_RPATH:class-native =3D "${@'-r ${STAGING_LIBDIR=
_NATIVE}/go/pkg/${TARGET_GOTUPLE
>>   GO_RPATH_LINK:class-native =3D"${@'-Wl,-rpath-link=3D${STAGING_LIBDI=
R_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink'=20
>> if d.getVar('GO_DYNLINK') else ''}"
>>   GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_L=
INK} ${LDFLAGS}"
>>   GO_LINKMODE ?=3D ""
>> +GO_BUILDID ?=3D "-buildid=3D"
>>   GO_EXTRA_LDFLAGS ?=3D ""
>>   GO_LINUXLOADER ?=3D "-I ${@get_linuxloader(d)}"
>>   # Use system loader. If uninative is used, the uninative loader will=
 be patched automatically
>>   GO_LINUXLOADER:class-native =3D ""
>> -GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOA=
DER} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
>> +GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOA=
DER} ${GO_EXTRA_LDFLAGS} ${GO_BUILDID} -extldflags '${GO_EXTLDFLAGS}'"'
>>   export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS} -trimpath"
>>   export GOPATH_OMIT_IN_ACTIONID ?=3D "1"
>>   export GOPTESTBUILDFLAGS ?=3D "${GOBUILDFLAGS} -c"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#229038):https://lists.openembedded.org/g/openembed=
ded-core/message/229038
>> Mute This Topic:https://lists.openembedded.org/mt/117148599/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------v0WZfjtcjaV6BdgbK63Sajmz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/8/26 17:47, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9YA+FNmcn4RiwK1CEvK909uDbgZcHYiHd+yZo00ciejQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

There's go-helloworld in oe-core, which is reproducible as it is. How
can the non-reproducibility that this patch is fixing be observed? Can
we improve our tests for it?</pre>
    </blockquote>
    <p>This moduleindex info only be used when GO111MODULE=on,&nbsp; and the<span style="white-space: pre-wrap"> go-helloworld is compiled with</span></p>
    <p>GO111MODULE=off, so it is <span style="white-space: pre-wrap">reproducible as it is. To improve test, we properly need to enable </span>GO111MODULE</p>
    <p><br>
    </p>
    <p>This issue can be easily reproduced by &quot;bitbake buildah&quot;&nbsp; with
      different path on a host. There are also other</p>
    <p>recipes under meta-virtualization have this issue. I have also
      send a series of patches to meta-virtualization.<br>
    </p>
    <p>Bruce prefer not set to empty,&nbsp; but to a value like git hash that
      values for us.&nbsp; <br>
    </p>
    <p>SRCREV seems like a proper value to use, but maybe not all the
      recipes set this value SRCREV,&nbsp; is it possible that <br>
    </p>
    <p>a recipe use a tarball and SRC_URI[sha256sum]?&nbsp; <br>
    </p>
    <p>and some recipes like&nbsp; nerdctl,&nbsp; it set multiple SRCREV,&nbsp; set a
      value in go.bbclass will make the logic here complicated.<br>
    </p>
    <p>SRCREV_nerdcli = &quot;497c7cf74d09bf1ddf2678382360ca61e6faebac&quot;</p>
    <p>SRCREV_sys = &quot;74cfc93a99be6ca6f193856132e6799065b071af&quot;<br>
      ...</p>
    <p><br>
    </p>
    <p>//Sandy<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj9YA+FNmcn4RiwK1CEvK909uDbgZcHYiHd+yZo00ciejQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Alex

On Thu, 8 Jan 2026 at 07:08, Changqing Li via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Go packages and binaries are stamped with build IDs that record both the
action ID, which is a hash of the inputs to the action that produced the
packages or binary, and the content ID, which is a hash of the action
output, namely the archive or binary itself, Refer [1].

And action ID include hash of modroot, which will include build path,
so this make go package not reproducible.
Refer [2], keying off module path instead of module root directory is a TODO.

[snip of log]
HASH[moduleIndex]: &quot;go1.25.3&quot;
HASH[moduleIndex]: &quot;modroot /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n&quot;
HASH[moduleIndex]: &quot;package go1.25.3 go index v2 /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/buildid\n&quot;
HASH[moduleIndex]: &quot;file buildid.go 2025-10-13 16:08:43 +0000 UTC 1704\n&quot;
HASH[moduleIndex]: &quot;file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n&quot;
HASH[moduleIndex]: 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314c0cbf4df7b

Report this issue to upstream, refer [3]
Workaround the reproducible by setting buildid to empty, refer [4]

Refer:
[1] <a class="moz-txt-link-freetext" href="https://github.com/golang/go/blob/master/src/cmd/go/internal/work/buildid.go#L26">https://github.com/golang/go/blob/master/src/cmd/go/internal/work/buildid.go#L26</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/golang/go/blob/master/src/cmd/go/internal/modindex/read.go#L70">https://github.com/golang/go/blob/master/src/cmd/go/internal/modindex/read.go#L70</a>
[1] <a class="moz-txt-link-freetext" href="https://github.com/golang/go/issues/77086">https://github.com/golang/go/issues/77086</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/golang/go/issues/34186">https://github.com/golang/go/issues/34186</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/classes-recipe/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index b540471ba2..1c43b36fc0 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -51,11 +51,12 @@ GO_RPATH:class-native = &quot;${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
 GO_RPATH_LINK:class-native = <a class="moz-txt-link-rfc2396E" href="mailto:${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink'ifd.getVar('GO_DYNLINK')else''}">&quot;${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}&quot;</a>
 GO_EXTLDFLAGS ?= &quot;${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}&quot;
 GO_LINKMODE ?= &quot;&quot;
+GO_BUILDID ?= &quot;-buildid=&quot;
 GO_EXTRA_LDFLAGS ?= &quot;&quot;
 GO_LINUXLOADER ?= &quot;-I ${@get_linuxloader(d)}&quot;
 # Use system loader. If uninative is used, the uninative loader will be patched automatically
 GO_LINUXLOADER:class-native = &quot;&quot;
-GO_LDFLAGS ?= '-ldflags=&quot;${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'&quot;'
+GO_LDFLAGS ?= '-ldflags=&quot;${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} ${GO_BUILDID} -extldflags '${GO_EXTLDFLAGS}'&quot;'
 export GOBUILDFLAGS ?= &quot;-v ${GO_LDFLAGS} -trimpath&quot;
 export GOPATH_OMIT_IN_ACTIONID ?= &quot;1&quot;
 export GOPTESTBUILDFLAGS ?= &quot;${GOBUILDFLAGS} -c&quot;
--
2.34.1


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#229038): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/229038">https://lists.openembedded.org/g/openembedded-core/message/229038</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117148599/1686489">https://lists.openembedded.org/mt/117148599/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------v0WZfjtcjaV6BdgbK63Sajmz--

