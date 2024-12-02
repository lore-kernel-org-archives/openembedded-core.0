Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8408BE69E91
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 20:25:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3002.1733171141064642230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 12:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=206647608a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2Cf2dE003894
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Dec 2024 12:25:40 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7t7ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 12:25:39 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B2KPdTk005501;
	Mon, 2 Dec 2024 12:25:39 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7t7sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 12:25:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUIo6jdJAv/shWczavovQmYoRShEhRROD8jeM/LjyCuO9vmRlJP2nqvhCYn0wJpH7K0MFsqYokCi2pitcS3zeutb/I2z1cz620QvQVUp01jwymbzP1Czmz9KrmzE93xTcVp/W9AGMXMA3GEY0XbcYn6Xi+KQrRTcypuSxJT4/fj2zSWvTIWUzVXXDsDmQs+fl1BeoYw+7x7uWDZXwOeAJqGMCUXwELol9FG9IsGCoWwJOBdT0t1j9jdILKvldkvCtR4OpQpgtdWf0X5Xf9Qr503mpcmCOwJdt6IwiyciGcT/1REZNXLKrBAYX+qMmWaLzy9xmR6AGJ0xe+xzpDGofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTh+IzaEtgoOGfliSCHk0/3vNnX/QpxSlOtoPlm3+IE=;
 b=XK09YkpJHnEJp1Evk85BOr3rbENcL3U07esCzlJrKChn4i+3iMvdeL6TMsXcGpjWevtIOrpb8Cm+HwdfDs56YRDsov4v5zIKCYGszpZSyZa3vLUMk5kW3/9uYGn8sPMPV2CvNH69xQBki6EBEe7LmwdXVVM+IBu0BXR2jus3/dULSdnMjq03tcdXmM5WICg9dLQjEc9IHqdnMM+Kx5TIze1zo2kyibYx58ueHYy/vSYagKhGnIInDS9PwfRxt9/XawystpwumIzIEnBQZ+2JYTP9K67f94Q3fcWBoMDFgy2Zt6bsyM1FycEp176DBmmTAfF2So+0jcGYCeL+yP9BPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 20:25:21 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 20:25:21 +0000
Content-Type: multipart/alternative;
 boundary="------------3aWhkprZwr0GgTQGoFL3IJef"
Message-ID: <9844556f-5016-47fa-a3ac-ceaaca1e7d57@windriver.com>
Date: Mon, 2 Dec 2024 15:25:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 3/5] ninja: build modified version with GNU
 Make jobserver support -> (jobserver, loadfactor, pressure and all that!)
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        Khem Raj <raj.khem@gmail.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Ferry Toth <fntoth@gmail.com>
References: <20240404111613.2574424-1-martin@geanix.com>
 <20240404111613.2574424-4-martin@geanix.com>
 <202404251130553913ebd5@mail.local>
 <f47e5c53e97b190852dc5578e0c3f0fe140803da.camel@geanix.com>
 <2024080210413291c61aec@mail.local>
 <8074f29e-89ee-4806-8011-21fe53f66e3f@windriver.com>
 <532902e09fce0abc0800ae193b56adc4339e2d21.camel@geanix.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <532902e09fce0abc0800ae193b56adc4339e2d21.camel@geanix.com>
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: 44815a63-fe4c-46a5-fa16-08dd130f71cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RU1tK1dpS3RmRHhlR2c2cUd3ZEI3QWQ3SlB3ZXY1SzhNc2xjSUtoMENFNUhV?=
 =?utf-8?B?TzR5TnZralFWU1RRUXUrMC82Zi8rcXpEdEY4L3Y2aEE5cnZrbHBmcE5nditt?=
 =?utf-8?B?ZEx6T21jNVdkSnp3L2h6cU5wVWwxZ3Z1QjRsM2w2YTJ2c0YzNVE1OUcvbUln?=
 =?utf-8?B?Wjc0ajZ6SHRwaVZrZDVwK1BkUFpmWnB3cDJaWXRuQkp3d3hKUmRUSzd1M2RC?=
 =?utf-8?B?eVN5K3lLaE5VL1FOc1kvTWNROXFoR2RFbEc2WklvMUpmQ3JnN0xYeXV2UTAv?=
 =?utf-8?B?L2lXOWZwT1UxYVEzRjI5dW9hL3RlMFY0R2NQS0F3bmJna2I1dVBRZm1Rd1Bl?=
 =?utf-8?B?NVh1SVJodi9LaC8xVWxoZ3l5ZVVORWErQm11MlRhR2x6NUZoNmM0SzNtYWpS?=
 =?utf-8?B?VVNkL0VNVnYyMG5FdVFqL2EwRmU5Nkd4ZVVoMFhQdUZJdDR6TzNRNHY2VFFS?=
 =?utf-8?B?aVRmRy9ESkFISnZ5aGtTUTRXY0VrYmluZXRYcE42WHBqZHNLOVFQVHlTcGNM?=
 =?utf-8?B?T3J6Y05oa2VOSkx1dTFpNGF3RU1BdnViTFRmY3ppSU5idGtmNmJvOXhFd0NQ?=
 =?utf-8?B?dW8wTmJmdGh6SlYxc05PbU5ld3RJazN2QTMrT2k5SHhRS0FLanV2QzhsZkZZ?=
 =?utf-8?B?ZGlXWkFjUXJteHdxcnU2aW9xSzNxUXJ4YytxS3AvU2REck1MVWRMMGw0TXZ2?=
 =?utf-8?B?TGx2TU9uaWJhbDZ0cGNPd21rQXFtamhhUGZ0OHc4UmdQM2h0UlQwS3B2cUNu?=
 =?utf-8?B?OS9kTmppd1VUTk0vNTBlcFNyWGk0TUNrMWVoY2NTampUL2dqeUNSSWd3eU1v?=
 =?utf-8?B?dDhxdG5oNTNKb3RyaU5hT2RFMWthTnNoU2szTGlPSGFza2NxeENQSHVsUzNG?=
 =?utf-8?B?T2lSMU9PdG5rYy91dXBRTTFUWlVQT0VNTGdLZzhRbTRmRVQ2M0dzLzl6ZzYv?=
 =?utf-8?B?dUQzTVVIRDJZdEMrSTZBclVoWVYxMjR6ZnRsaXFzNHJUNm9KUnZteERnSDBm?=
 =?utf-8?B?R1VvclhLUVg5K2xDLzRSdFp3ZHR4T1pDREtVRHEwMm5tYjVQZVFBVzA3bitp?=
 =?utf-8?B?TTc5WWJyM04vcys3MkJmV2g3eGtseXpsWG1FSGZ3WDVlTGxSL09nWmpac2NV?=
 =?utf-8?B?TzJFYTRlUjdaVnNNMi8yUXBOcEYvWDdrbGoyWGdMWGxTZWJ1OHN2T1JhclhV?=
 =?utf-8?B?ZWFRVjFIYkFmYnYwM0FLVlFUSUJqNFdhbE1kU3dHT1FvWWVyVWJ0S0NvcytB?=
 =?utf-8?B?NnQ4cmduVEswUHhqWnFzZEZhYjhJdHd6TDVqeU5oN1ZuU05zV2h5c29GZFF6?=
 =?utf-8?B?TE9sOHlGVmFkWmZLbDdrbDY0cUdDZXhLb1BoMjJzNWNGOFhFTnQ1TUoyekk0?=
 =?utf-8?B?NUpNd2ZJUW1URUNnT0trK09ZRkJQL2N3VUFkd3lsL1pNRURjcWJlYlZCa0hj?=
 =?utf-8?B?bUlIdlZnTEYrWjdxdHBGZ3pPc0x2K0g2bXkzaDNGT3FRZnZLUEsrNUpYOFVq?=
 =?utf-8?B?V2dacFdZNFo3MG00ZklTbExuQlRjNHI5U0hxdGpNOFlROW5FKzYxdEVLVE9W?=
 =?utf-8?B?eTVEejZTemJTcm55OUE0V3RhMFFCY1RtN0RVQmFXRzhoenZpL2RueG5qNEdl?=
 =?utf-8?B?MCtBQVR3TUkreE5XVGNZK3daelpkV3ZkaGdpcmF2Mk0vNExiMXJnRDQ3Um8x?=
 =?utf-8?B?Ykc4UC9YRnRXWXVwMnhMNGhMYVRBUHBPZExmZlYyYmJwMTluRjREN3BQc1U1?=
 =?utf-8?Q?olgaBj1WMUxYOZLbWxqdtUtrfUj4RgF/F2CK/92?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UFVReFAwMkRjaHBHYkt4Mm84cUkzdHBVTkRWK2dYYmdPKzc3WVFWbXd1cHUy?=
 =?utf-8?B?K2xsNmV1ZDc1OXU5aXlCTys1MDZaWmY2ZEVCaXVCN3hYZWpjdUZKczMvNzJr?=
 =?utf-8?B?SC9uaEhka00vN1Y0Vyt1TzhLZmp3MzUxQnlUZ3h1bzBBMTJWUWtIRXNoY3J1?=
 =?utf-8?B?VlFGaWtzZHd0bXRySjZXbEUxZXZaN1U5T3BCcWRRRFFPZlREeXdiTmlLTHZT?=
 =?utf-8?B?dElxMEplVEJiT2NEeFFTeGlNeUJBdVgvQkxCQ0R6emgyOUVPdVUxb0pHUjFm?=
 =?utf-8?B?bWkzU0dCbCtpSFZHYlVqeENmalhPV0VCd3J2VXYwbzBDazhtYk55YzI0eXVC?=
 =?utf-8?B?cmU5QUtaZmQ1Sk1IQUxzSVNJcnIycVhLbGZEaVdzdHU3MllPL1pDMklPL0VF?=
 =?utf-8?B?UFFLV1VTUUUwSHRERWFzUlZtL05zTmZBa1ErTzVIZVpqU2FjZml6bXNEbW1H?=
 =?utf-8?B?ZTd3eVFabStKR3I0ZTRPTXRueWZqS1V1eXowQWtLQVpSbGkralNpWEtkbXFS?=
 =?utf-8?B?aEY1SStCZ2xYdyt6eE9CYVM4MEhLdkJZbnFFR2tkUWVoNkdBcVExcnBZUFk4?=
 =?utf-8?B?RSsvbUQ4bjRzSmsvZXdERHhtbCtCSXkvUjRXL0ZSMStRYlFyK3RTUzhMT2t5?=
 =?utf-8?B?MTFNMlBIQ1pHWkYyTkJZV3BYTHN2R2l5T3ZnR0kwUkZEQXQrWjEyMG5nbDdI?=
 =?utf-8?B?a0pMVVZUaEZsRVg3VEJSczBON2ZIRGJNN3NCNnlOOE9sMi9XUjllODdYenRa?=
 =?utf-8?B?UlUzY1VOVTNCYjU1amxlQmwvL1RHUEtJYitEVStZWEQzb0NTSkZGeDFvK3g5?=
 =?utf-8?B?T0F2YWgxSDFvaE5ITTQzNXIyY1JqcnRVa0Z1SlJjUW5SU1ZNMERaRFpQY28r?=
 =?utf-8?B?TnJldExTZVpPOGgwVE1QRUVQbm9OUGczbUJEMmlWYXJsM2V5Uk9hSFkzNEc0?=
 =?utf-8?B?czdzSDczYnRscUdjaS8rcG82Vis4bjR1Z3NYOCttTzllWnBsUVFpYlpJYUxF?=
 =?utf-8?B?YmQ2cWs0OEhFMnJHTWYyOGpvVHhBV3JHZWR0dFFFWCtnMlorbjJxb2VIcDNF?=
 =?utf-8?B?MXI1cnEyOUl5dkl3S0JLNnd0dnUrZnpXWnZ2UzBmczNNclJsTEpGRlA0WkxY?=
 =?utf-8?B?bUpkQ0xpcU5DdUpkVDF1ZTRTclhEVzJha2YwcThkZ2JCc055RWE2QlNNN0NO?=
 =?utf-8?B?eVBGZGl1Ylg2Wkoxb2RxQVkzNFdrT3E0WUE1dSthKzRFN0Y4SkxNQVRtZjRL?=
 =?utf-8?B?WTFVdm90U2pvZzF6UENNL0MwR1cyRldxYmZ6cmJXWEFBcWJURU0yV2FBaG5M?=
 =?utf-8?B?b0tzc01tZWJLYTJSVWtkejZWTHpuMFhJNS9NOGtlN0gxalZXWWtYTWp0QUF0?=
 =?utf-8?B?aW41UURVN1lZcytZZGRTbVh4Sm9OUG9hamZXcS9IaTB4WDFFVVpjZTZqQnZC?=
 =?utf-8?B?RkwzTW83UFhhSlBNYitDY0pKQkUwV05EN3cvQm1Pa202SEhsUitLVzRvMS91?=
 =?utf-8?B?cnJNYWQrZitLMGpCS3hkMlVRL1BMNklIVVJ1cHhNUnR5RldiWFp3V3BuZ3dY?=
 =?utf-8?B?OC84MzJTQ200Q1dPU0I0bXVMSFdCd0p3R2xuTXppY2VZT0lleXp2K09vQmFp?=
 =?utf-8?B?VDRwSTc5bGF3ZVZhZm0xK290ZmVNRTN0dGZxWjlwUW1BdUExSUJGS3dFZ21r?=
 =?utf-8?B?Z2UxQVc0ZEk2LzZpeVdjS0FRR2lNQjdhOGtXYTU5eGRxUCtEU2c3anJSa3hE?=
 =?utf-8?B?d3VRQitkWlBWb0d1KzZETVFrMnoyVEVIQnA5RkNXMTRrbGl0OXJseURjNkor?=
 =?utf-8?B?T2VmQmlqNGlDek8yazB6M2krbWZ6dWl3bFY0amNFZGtTWnB2bUxydTYrVEtV?=
 =?utf-8?B?RkNjWXJ6Zk5oN0Q4aEdxSUNpWFNCUUJubk8wRWN2VmVaaWpwQTZBMjQvS29J?=
 =?utf-8?B?c0RGdENoZHQ2dmNHZ2NyRW1URjhWa0dIKzc5bG1sR05CZDRoQXRqM0drRWZC?=
 =?utf-8?B?Q29ZN1h0cmRrcFNqL2xlSU1ad3Jhb3ZxMVdBZjA4Z2JreThTRHJpbVhTVTVQ?=
 =?utf-8?B?Z1VNZGxpVmNCcW82djRSMk50Y09GNzBjNlgveXhqRG1UdzdSMTI4V1hLV1NQ?=
 =?utf-8?B?R3Y4cnpvYjV1Sy9Sb1dURS9rVlowSVBQWWRhbHNEMHg1NEdkdHRTbzVZSDlY?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44815a63-fe4c-46a5-fa16-08dd130f71cd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 20:25:21.3034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCXU1HrNbS1ZeVuh3CUuUfbNqy8+VRZIoB3iLOsEu/7IPDA7/WOXe9rcJPvZV8VQKAMr8liQr1R7ok9hFGHwq7zFhVdgtkIhI6j6s+9isu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
X-Proofpoint-GUID: A-oSO8K6WpvjRnlSB9gX77MbdlLBI6mg
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674e17c4 cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=kTakKMPAAAAA:8 a=lpX-XU-W1ycC3iMduuYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ilKATfAMAAAA:8 a=8GAqU6H46cJ0cRaoVbgA:9 a=wDGBEVC0LLgqkMEJ:21 a=_W_S_7VecoQA:10 a=uLSFYZeSjgb_eomtY0KL:22 a=73awMTU50e6eLoBjGbzZ:22
X-Proofpoint-ORIG-GUID: gFqBnID6YtsSFfr9G7JS5iAL8WAWFXRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412020172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 20:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208158

--------------3aWhkprZwr0GgTQGoFL3IJef
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B2Cf2dE003894

On 2024-12-02 3:07 p.m., Martin Hundeb=C3=B8ll wrote:
> Hi Randy,
>
> On Sun, 2024-11-17 at 21:29 -0500, Randy MacLeod wrote:
>> On 2024-08-02 6:41 a.m., Alexandre Belloni wrote:
>>> On 02/08/2024 12:24:06+0200, Martin Hundeb?ll wrote:
>>>> Hi Alexandre,
>>>>
>>>> I see you keep carrying these patches. I'm still working with
>>>> ninja
>>>> upstream to add jobserver support there[1]. I was planning to
>>>> redo
>>>> these patches once ninja merges that. But I can do a respin with
>>>> my
>>>> patches added to ninja if you like?
>>>>
>>>> [1]https://github.com/ninja-build/ninja/pull/2450
>>> I carry them so they get some testing, I can drop until you submit
>>> the new version.
>>>   =20
>> Hi Martin, et. al.
>>  =20
>> I'm going to do some experimenting with the job server patches for a
>>  =C2=A0talk that somehow got approved for the 2024.12 YP summit!
>>     https://pretalx.com/yocto-project-summit-2024-12/talk/WGPUTX/
>>
> Thanks for picking this up. I got assigned to other projects, so this
> was put on hold for now.

Hi Martin et. al.,

Errr, some things came up and I didn't feel that I had enough new to say =
so
I'm not presenting this week.


Hopefully as you say, the ninja patch merges and I can get time to do=20
more evaluation
and comparison and one of us can get a patch merged to master.

If all goes well, there will be a presentation at the next YP Summit!

Thanks,

../Randy



>
>> As expected, the patch doesn't apply with all that has changed since
>> April.
>>
>> Do you have a a branch that you are keeping updated.
>> If so can you same me some time otherwise, I can rebase and fix
>> things up.
> I have no branch, no. But I did try to get jobserver client support
> into ninja. My PR got replaced by two other PRs, and I assume you are
> following the progress on the latest one:
> https://github.com/ninja-build/ninja/pull/2506
>
> It looks like that PR will go into ninja eventually.
>
> The qemu patches are no longer needed, so just the ninja patches, the
> jobserver bbclass, and the python server script that are needed.
>
>> I'll of course give you all the credit for the real work.
>> I plan to mention the performance/behaviour improvements that you
>> mentioned in your cover letter:
>>  =20
>> ---
>> On build machines shared by multiple users, a single jobserver can be
>> shared between multiple builds (using the JOBSERVER_FIFO variable).
>> Running the above build in two different build directories at the
>> same time gives a ~12% improvement (43:17 -> 37:55).
>>
>> Finally, the memory pressure from e.g. compiling multiple c++ based
>> projects is also reduced. In our case, a cloud based build machine
>> (with 32 cores and 32GB RAM) fails to compile llvm-rust-native (in
>> parallel to nodejs) without the jobserver due to a lack of memory.
>> ---
>>  =20
>> Is there anything else you'd like people to know about?
> Feel free to include my comment wherever you see fit. The credit is
> fine, but not important to me. Again, do what you think is appropriate.
>
>> Does anyone else have jobserver, BB_PRESSURE_*, BB_LOADFACTOR_MAX use
>> cases or benchmarks that they'd like to share with the YP communtiy?
>> All input is welcome and appreciated.
> There is a comment on the github PR that mentions yocto / bitbake:
> https://github.com/ninja-build/ninja/pull/2506#issuecomment-2437267474
>
> Good luck :)
>
> // Martin


--=20
# Randy MacLeod
# Wind River Linux

--------------3aWhkprZwr0GgTQGoFL3IJef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B2Cf2dE003894

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-12-02 3:07 p.m., Martin
      Hundeb=C3=B8ll wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:532902e09fce0abc0800ae193b56adc=
4339e2d21.camel@geanix.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">Hi Randy,

On Sun, 2024-11-17 at 21:29 -0500, Randy MacLeod wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On 2024-08-02 6:41 a.m., A=
lexandre Belloni wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">On 02/08/2024 12:24:06+0=
200, Martin Hundeb?ll wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"" class=3D"moz-quote-pre">Hi Alexandre,

I see you keep carrying these patches. I'm still working with
ninja
upstream to add jobserver support there[1]. I was planning to
redo
these patches once ninja merges that. But I can do a respin with
my
patches added to ninja if you like?

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/ninja-b=
uild/ninja/pull/2450">https://github.com/ninja-build/ninja/pull/2450</a>
</pre>
          </blockquote>
          <pre wrap=3D"" class=3D"moz-quote-pre">I carry them so they get=
 some testing, I can drop until you submit
the new version.
&nbsp;&nbsp;
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">Hi Martin, et. al.
&nbsp;
I'm going to do some experimenting with the job server patches for a=20
&nbsp;talk that somehow got approved for the 2024.12 YP summit!&nbsp;
&nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://pretalx.c=
om/yocto-project-summit-2024-12/talk/WGPUTX/">https://pretalx.com/yocto-p=
roject-summit-2024-12/talk/WGPUTX/</a>

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Thanks for picking this up. I got assigned to other projects, so this
was put on hold for now.</pre>
    </blockquote>
    <p>Hi Martin et. al., <br>
    </p>
    <p>Errr, some things came up and I didn't feel that I had enough new
      to say so <br>
      I'm not presenting this week.&nbsp;</p>
    <p><br>
    </p>
    <p>Hopefully as you say, the ninja patch merges and I can get time
      to do more evaluation<br>
      and comparison and one of us can get a patch merged to master.<br>
      <br>
      If all goes well, there will be a presentation at the next YP
      Summit!</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:532902e09fce0abc0800ae193b56adc=
4339e2d21.camel@geanix.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">As expected, the patch doe=
sn't apply with all that has changed since
April.

Do you have a a branch that you are keeping updated.
If so can you same me some time otherwise, I can rebase and fix
things up.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">I have no branch, no. But I =
did try to get jobserver client support
into ninja. My PR got replaced by two other PRs, and I assume you are
following the progress on the latest one:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/ninja-build=
/ninja/pull/2506">https://github.com/ninja-build/ninja/pull/2506</a>

It looks like that PR will go into ninja eventually.

The qemu patches are no longer needed, so just the ninja patches, the
jobserver bbclass, and the python server script that are needed.

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">I'll of course give you al=
l the credit for the real work.
I plan to mention the performance/behaviour improvements that you
mentioned in your cover letter:
&nbsp;
--- &nbsp;=20
On build machines shared by multiple users, a single jobserver can be
shared between multiple builds (using the JOBSERVER_FIFO variable).
Running the above build in two different build directories at the
same time gives a ~12% improvement (43:17 -&gt; 37:55).

Finally, the memory pressure from e.g. compiling multiple c++ based
projects is also reduced. In our case, a cloud based build machine
(with 32 cores and 32GB RAM) fails to compile llvm-rust-native (in
parallel to nodejs) without the jobserver due to a lack of memory.
---
&nbsp;
Is there anything else you'd like people to know about?
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">Feel free to include my comm=
ent wherever you see fit. The credit is
fine, but not important to me. Again, do what you think is appropriate.

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Does anyone else have jobs=
erver, BB_PRESSURE_*, BB_LOADFACTOR_MAX use
cases or benchmarks that they'd like to share with the YP communtiy?
All input is welcome and appreciated.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">There is a comment on the gi=
thub PR that mentions yocto / bitbake:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/ninja-build=
/ninja/pull/2506#issuecomment-2437267474">https://github.com/ninja-build/=
ninja/pull/2506#issuecomment-2437267474</a>

Good luck :)

// Martin
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------3aWhkprZwr0GgTQGoFL3IJef--

