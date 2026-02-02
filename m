Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4971EE7DEFA
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 15:51:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55804.1770047506999278584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 07:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AVWDH6ej;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6493c9f9b1=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6129vDWr3189312
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Feb 2026 07:51:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=wNxjse/xDGLmJRro2s+/Hr
	+VEKUODpDDE17dnmphjB8=; b=AVWDH6ejTtrADu7+82obC0g48r45Ljz/2CRNjf
	27WpPKsjWc/L9KcTv/5yuZud0+o59a3WO3omY+d2FvVY+fpW/Qli3YUr3ls63l79
	cjOQXmORKY2C16b91t0PdfrUJXN5X1eWzINaq7HTLojKbbH777y52C8Iud8gTHmP
	mYXl8HH9KcnAyT0/7ShhaG1snLrLp2GuqMBAT4YmTKhdLutGFP7+qFPNe4uaTawO
	VQtITXKDO85DVYizdJS23tWwN27dE87lD6WTq3n1ySBFAIqexABWQNib4oTcmf9d
	haVc/eRjOXW8fGNSsveO2gJI/E9g8lqZf1atygOSxya/+Nrg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c1j4gsudy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 07:51:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oimPL4oOHvsKtXduy/3pOk9rmyKLqwvpAnjjsrm6B1QJlUu53XHYLAgGK7kkB2gYgDXqFflwJ4KZBpYIYPXhs10JT9G1XKJV7TWy6NYG8T0u2EmQrrTuHM2s0mhnYLtQzWEB7TndaBk8jtn6TsY7UUcaqHhpfS2Wsl/AM8ZTF+oBWlQs1237pO2FEa1yXME8kA8yJz9pon0nEgZ1Tyw3Pe/87Jh6cURdPp7HF+0/Ej8xap6ipJITTjh/2hgwMD/EplCz+M/rCA3PayTz2JXFmU/U3VL2dp6XngTtX7xGh4rm0goHmGEHMLzsVM5ws28XWxjwHEswQexZtWshFPAImg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNxjse/xDGLmJRro2s+/Hr+VEKUODpDDE17dnmphjB8=;
 b=DwWntWtcam2bw46PsdSfp9nxxFKxhjvG3A7P9YteDfcYqWURvstVsIA1+EUpZKPK0wi0W2KkC7DA8epW4P2Zx0RCWwGBv5L2XDfz1wJ52A8g3/sdWI1fos7h6snX6p7BocQeqN7odSYAIIkyVLbSsko2NmTe7vXSVvS57n7tXLoZj1pp+uN4PPt7YJdcbabABAAUlKQkbpAVYV4jnNcZw4Nu2U3FtELAOs6EQ0AKlpVVPvuip+ZgimZcHB+rrUuDDeJI/D6iJjGw5njWjjEt8d7qGxYVgTlrRihwLAJb7p57NiUwiryO9N0O1T1WvQTtEHZdUVLOFWPbXfWV3QRX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Mon, 2 Feb
 2026 15:51:41 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:51:41 +0000
Content-Type: multipart/alternative;
 boundary="------------h7mgXFSEsINxZ807OvfYQh0g"
Message-ID: <89c2464f-8fa3-4be4-83e6-c14b9b310990@windriver.com>
Date: Mon, 2 Feb 2026 21:21:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.92.0 -> 1.93.0
To: yoann.congal@smile.fr, mathieu.dubois-briand@bootlin.com
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org,
        Sundeep.Kokkonda@windriver.com,
        "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>
References: <20260130134137.2463745-1-Hemanth.KumarMD@windriver.com>
 <DG3GN4VGMAU4.OOYLJKHV2X2B@bootlin.com>
 <CAMSfU+5-gHPYDLsxKjSK-BRVqhZ+dis+b1hE+82LAL0pAQL7CA@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CAMSfU+5-gHPYDLsxKjSK-BRVqhZ+dis+b1hE+82LAL0pAQL7CA@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::8) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1a9edf-3d81-4b65-1fe0-08de6272f55c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|4022899009|8096899003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OEFEZXY4K2dWUHlWSFF1TFdhVFJ6Y1c3bEFuMG0zS0toZTBtSUpyS003ZlZR?=
 =?utf-8?B?T3RCZjFVdmFrVVpudmx5Z2cxc05RVGpBeFpjcHE1UjVxZGxDZ1E4VS9iL0Vw?=
 =?utf-8?B?OWN3ZEFvQXZmdERKSkdFbWxhOUk1Ukt5M0NNZWdqcnRGVVJ5L0c1cHFOclVz?=
 =?utf-8?B?eUhJSWF6aFJzZGwwc05lUkFXNUgxNFQ5Z0hJaXRKZ0RUL01ZZGU2cHpVRlBp?=
 =?utf-8?B?dUczQzZQT1R3T1VWU3pSakE1dThZMXM0MnpqMVNFUXJoa25BUWhjdUhBKzV3?=
 =?utf-8?B?eXRSYm91STViY2lzbk5sVnhVSnFMcGdMVkpBZkhXaHhGamZGSzlPLzRzYjVH?=
 =?utf-8?B?SjlzbTlhOWFMdElTM3FmVVhxdDVzK0tEakZXYkU2eGx5WitaT2ZtRDNPem5U?=
 =?utf-8?B?dXdqL0xZeHRlaS9HZEltTEJCTXliTDhzV09hTFR5SHh4VURWS1NSa1l0Qjgx?=
 =?utf-8?B?ZU9ldVV1WG5RanQ4UlJsTmluOFBvcy8rNjZFdXB2TGdBbDRGOWdNcEYyOXJV?=
 =?utf-8?B?MFl0MFM5MUhnVmwwQUt0aDV4eFJScHlnZ1FoK25JMDdFK2U0R0o4dHUzRWQw?=
 =?utf-8?B?bVNYTThHRTZqT01mUU53Nm5PQXg3cHZWZTNzNkptTzEwbnk4THkyejBWL2RY?=
 =?utf-8?B?cUxWa2VlczczVFo4SDVDZFhtL1Fzd2J0UDZWNzltOU9XbERNZ29xRGQzSUxH?=
 =?utf-8?B?UEROS2NSOE93SFFjdE1BRkYwQjZNTnQ5bit1VjNVK0Z4cjZSZ0l0d1NjMWVn?=
 =?utf-8?B?cTFHNW5WMTRpWmhHRk03ZHlEdlZZN1o0ZHVSUDJ5RUZ5bEhnWlRYSFZvQVVM?=
 =?utf-8?B?NHVuTk5aZWRZSHRXTXdPRUlJYkVBVDQ2R2M3Vko4bFluWHN0N2hCcEFURERB?=
 =?utf-8?B?bHNZN2IzeXlQNHphTHdzQ2F5bFBvS3YzU0lhOWp5YytOM1dPTHU5TmdYLzBL?=
 =?utf-8?B?QytpUVA5K1JmN0NmQmtzZzRyL2I1VWpTUC9kVmpONFhCcEROcWliVmFrTlds?=
 =?utf-8?B?RS9uaEhESVg5WHJDY3IwNHhZSXRWRkJjeExDek5naEtTTWgrc3hrUFZRZGlU?=
 =?utf-8?B?ak9RVjRaVlNzZlU2T2FYVTB4YjB2T281RTFXZ2tLdEhjRGY1QUhoeTlQbWxl?=
 =?utf-8?B?aUFLTUhReHNiSWpSZGpnSklyeWFqV284NFViU1JSQXlmZnMvN0VHNW42WG5J?=
 =?utf-8?B?N1IvWmc5TlBJeEVIOGFHSlA4V2toUXZBTldHUFdMVmwvejQ1YmVyaUZyV0Zv?=
 =?utf-8?B?aTRTeVk1Uk8xa0RFOTdzWml5dkxzaWt0bDJKT2lHRzl6aTJRRFBOVjlZYUxr?=
 =?utf-8?B?L3U5QlphWk5lUkRWU2Q1dzVRcmFZTWJkWHprS21HZzV3TmUvL1BnS2FHQ1c5?=
 =?utf-8?B?UFcweStVZFUrM1Z2cXdBOTg1VWhCbXVnUE9RM3N0cVhHc0xuU09Cbjh0UG9H?=
 =?utf-8?B?cUtiRFR0V1M5Z2RCdWFzRi9zdXlyNGowQTVPcFBubnQwcHRvKy8xNWxxTVUw?=
 =?utf-8?B?Undkcmh2WnluM0VXQVRNYzh2eld2ZlE1TDFwbTRiZ1lqL3NJb1UwSFhaRFUy?=
 =?utf-8?B?U3pmTEVmZ245SmV5a0tyb1FyRjFtdDVmVHBFRHAydlliYkVXbnFwRktiSGQv?=
 =?utf-8?B?K3NlKzRTV1Zibi85SjJoTm5xK2JiTC9vQ05Ya0NxdFBSWjJRT2dyVE1RUjVY?=
 =?utf-8?B?K2dQcXJheDIvUDFyT00yRWc5ZTAwUnVma0JLTXlUMldwWlVBTWh4akdIOCtu?=
 =?utf-8?B?Q1dwUjFzL3c5TlBOZzY1aGx4Zld0cDh5Yy9RYVovektvNEJxdVN2SnpuTnND?=
 =?utf-8?B?eWp0ZmJmay9OQm16YWlObDVQVVVaOGZBOHlTMlVldVp2YWVDZXU4YzlNUW5X?=
 =?utf-8?B?VDI5R0F5djJzczFKMHlPK2FSVzBSNnVTY0xCNzdlMkgzN2t6RWZpUnArc29I?=
 =?utf-8?B?MzloQmVQTFVKRllaSnA5dzJvM3NieVFFV2hya1NHYjdaNmV6WDEvaEdDQWVr?=
 =?utf-8?B?OUhwMEZza3JLa3cxc25wZ1lVTldta1g2MWQrTVJwTm5rZ0JOUlB4RXhGeExJ?=
 =?utf-8?B?STN1OUQvUmNaZmIwc3BzY3hUdFk4WG1UWFF1VTVseTU1UkwzdHVYV0hhU0Fz?=
 =?utf-8?Q?Y20gi9xmhb75Nig3IDS0mbont?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(4022899009)(8096899003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0dkMkk5SWQzeHBqR0RlbTJ4bmhITzd2NmovMGtHVU84czhYRlUrNDdCcUJY?=
 =?utf-8?B?cnBDTkNMeXlndy91cSt0TmcrSVJ4dWRHZ0JNK2d4dktrVlloeXYxOVQ0b3dU?=
 =?utf-8?B?NGovcmZsell4Z1poN2JyOWdQcGZGcUVTNmd3dHN2MURYUHFZZDZHeWtqWkU0?=
 =?utf-8?B?em95djlIRHJ0VWpObUtSbkV6enhILy83V2VReDl4MDZnMEliaFpqby9HWCtk?=
 =?utf-8?B?VkVUSlplOUNqYkVkbGlXS05KQ3dYdlBTTUdNQTg5Tk5uUlB3UXJtSENjc1Ji?=
 =?utf-8?B?TzVqWFc5Mkhsa2JtQkV6V1VENGJTdFZRTmttZFIxNjcyUUFjODdmMUF3WTkx?=
 =?utf-8?B?amtldENCazJKc0VPWGNaOXFoU3JsajZ1QlFvYnF5cGR6ODJTbkdaa0hFWGJ5?=
 =?utf-8?B?V2ZOZmVBR0tId2x3N3BoaUlyRjlGeUtHU0RGeWRKaXNEK2ZuQWlKYXZ1WW9s?=
 =?utf-8?B?VytBNWUwNTVUaDVOSENzZEdvc2luQ0tydUNSSDRpVWZ5aDFxSXlZNlozNzhB?=
 =?utf-8?B?TEZCbmI0eDJCa0FSSGR3OG1raEFWc0x2Q2Jxb1NCQUhOTkVIZ3ppb1UrZ1o0?=
 =?utf-8?B?SnRqWlFtTGdCK1NWVTgwVm9KQ0h2YjhReWhtYlZDMzM0eWNOMEpPRkVsYWxY?=
 =?utf-8?B?cWxBLzJ6a3VEUDY1em8vdkJ0aW01TUo2dk5oeklJR0ZSTmtFd1hjS0w2OWZj?=
 =?utf-8?B?OFY5aWhGUk12ZTZObHJZd2RjNlFxamJMZW9yVkZPcE1kUXFZWlN2K3ArR1JN?=
 =?utf-8?B?NXdrUU54RU5adWJiWWtrTEVxUGhEeStDS0FIYU1wL3o3SUN6RWhEcjBjVGFn?=
 =?utf-8?B?ZmYzaWJPYzdGQnNoWFV1OGtHUlc5T0twWktxUGw3Q050dmExZDJLQlFyR0dL?=
 =?utf-8?B?Smo0TWNZQW83aVlqN0FXUUNva0E0bGtkZERJUUcvS3FjWmFFRk1SMTYrWS8w?=
 =?utf-8?B?RGhRelFPdDB4VkhsVWI1aXNoRXFEWlRHaDg0djZwWGFPRkg0RzI2VjRXWDBU?=
 =?utf-8?B?WEFhUXJtckZzRFRVWGN4aVVZVnJ3ZkNjbHIxa3REby9BT0xBYWorSHdRQ3B1?=
 =?utf-8?B?SlRFRkY1aDk5TWNGQVlkRDZHOFVxY0RKM3Body9Oa2VLQkxRM2s5dGV0UmJh?=
 =?utf-8?B?UkFIUEorTmVVdmhQMlpOK0loUTlkVjFiYWVnZkRxUU1GSUhvaVBJbEhqSFVa?=
 =?utf-8?B?Vk9RZTU1QTdzRmRKbnplUFBFSUFEUVJESFR0WjJDb0szVkJmK2JkNjF4RVpr?=
 =?utf-8?B?NmdzTWk0eHpxQ1dVbzNFbVNrbzE1Q0h1WndTVW9aNlE4c045OWVFK0RwcGxi?=
 =?utf-8?B?dGVOdjE5N3FmNC92MDU0WXljcEhldDBCdUVlZzdyaTA0bDdEaWR6eFRsbzk4?=
 =?utf-8?B?cDJIdWVSblVJMHREQ0pmWmVySHdCaXk5dFh0cjhFTWM3M0ZqallBeUUvUTZM?=
 =?utf-8?B?SVhRUFozTHNQNmJib3FEMGplQ0pCbGRndk5mampJNkVKeFNQT3Z1R0g4ZWxm?=
 =?utf-8?B?ZUlkWHh2YVdWNXZLNmdRaUMrZDJ2c082MFBFRStvS3FxcW5zT1B2NDdoaDlq?=
 =?utf-8?B?RWVIWXhVdHY5Mjh5akM2UEpOckpveDdDYjgvc2J5NlRqM0FYOG00UzlwbHAr?=
 =?utf-8?B?NUhRanJxSHVUS1JPRE5TeUxsNkh0OFZnb1BKV1g0RlNSSjBlb1J5c3FETGlz?=
 =?utf-8?B?QWxOdVI3UUtEMERFbWVISDl3czlqd1JsZlhlaWhzUTNrOVRoQnBaWnA4Z0VM?=
 =?utf-8?B?YVdEQ2pPRzRtWEYxK21IRUV4RVhoM3Z0M2NNMis3U05RcGJYaXV2MS9BQzFu?=
 =?utf-8?B?SmR6K1hqYzR4QmtGc2RnMk5lcU82U0FqWXB6bGRKWkVLT3FkemV6c1dIOHZW?=
 =?utf-8?B?T0JWblNuVG0vUjZYQnFIMzRXWHFlZ0p1enQ1K0hEeXpXc3oyaS9wUTlpcEFM?=
 =?utf-8?B?Nml1MzdmcFZlTVhEWlBEbHhUUHh4Y2V1RW1DMnIzSmVXNzU2MFo0MGgvN3FS?=
 =?utf-8?B?T3IreDZKMkZtLy9BZC80YlNoUDVaN25RRmVtWDRFeTRoWnpDOXY1UmlzbGZl?=
 =?utf-8?B?T3QrTUU5dHdvTmxQOGg4N080L01CTjhtdUFIanhMUmFDblAxQmo4V2hFRlZT?=
 =?utf-8?B?MTd2ZytSak4yeCtGRExJT3RCaE5pdk1ncS9lK1ZMTEhnWG8xWCtsakpNSjVO?=
 =?utf-8?B?RUE1ajJqcHdST290bHpnMTR5cWhMSXBmU0NUZ05vUG5hWFpmalRzc1RERWda?=
 =?utf-8?B?QTN5d1dEOGx3SjRYK3VocElqcThyVTA4ZUptMGQrRi9CSmRtdnpPa0VoVGZH?=
 =?utf-8?B?QmJPTWR1eWJFVlFkaUVORVRJblg4bGV3R201TWdaMWIvaXgveFl6VzdFbk5Q?=
 =?utf-8?Q?aqivFk0imdbEvw9Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1a9edf-3d81-4b65-1fe0-08de6272f55c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:51:41.6590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUvFuZlNDcmp6fHVdTZk8xz0L+LO+dEeEXg/C+bZfCRgmgqUW1YOQV+wTMiC4Y0LG2huMH/vqiPMunimWflTeblVbxgnKrIuBwM4EPKKe8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: cDS7ojGWpmxE4Mcnf-gKSvAIZIt0mGfr
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6980c812 cx=c_pps
 a=QHQ/c+VJRs0sJIezHEQ2hg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=jaTWMCnSeion_f9vsx8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ocp33sKsEv4A:10 a=pGLkceISAAAA:8
 a=ik0LV61jonFMAZ-Y8uwA:9 a=FV_YTk77n_SfnXWg:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=8zIOOLb7Ym0NljyPXbuS:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 0uvBa8j9lY3RMA_XCF9iysd1jueowUbf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyNSBTYWx0ZWRfX+DsKt+Tnz2Bu
 CZ6CtfFvfC/4pt9xgsbKS3QS2VG3oQasUxdn1begU4nZZJF/G+xs09TgEmQhH8TcDT3fejZWkT6
 Bk+deioIdn/bGzk6Ug2gC3JBCvt5UxyEQ75L+05cZnWA4D0clphVPzwVKrLvVKvdrc9sPkMRNqQ
 WJ4b1eWF7KLfKDWM8NuciwIowOg/I+ZesC4eL/q1lFWlq6TiBVDl8Qya3+7951fl1L5jNfzuJuI
 RGi+7jn/htJNCCePHaZS3lbqTf4fvllrZfxbjcNDiq/kPBUwP3f4wWsRL2HuKTkQev6RUWX7YSp
 PCGRlrH9v0eyi0o1I8p5zGZDfhRAc9caN0cWale3k2yw+XfwIJdK9egfaL3/5lm9ckGRZYkYd+P
 Qy0wtjU0eJLrdJ7uEROekwGHl0iec8hzlu5b20vZytOmabYwFEqwonyX79JgZSqnU11hK3aK+Uw
 wff1F9D9nt9SAfyoGCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 15:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230376

--------------h7mgXFSEsINxZ807OvfYQh0g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6129vDWr3189312


On 2/2/2026 8:45 PM, Yoann Congal via lists.openembedded.org wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> Le=C2=A0dim. 1 f=C3=A9vr. 2026 =C3=A0=C2=A008:52, Mathieu Dubois-Briand=
 via=20
> lists.openembedded.org <http://lists.openembedded.org>=20
> <mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> a =C3=A9cr=
it=C2=A0:
>
>     On Fri Jan 30, 2026 at 2:41 PM CET, Hemanth.KumarMD via
>     lists.openembedded.org <http://lists.openembedded.org> wrote:
>     > From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>     >
>     > https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/
>     > Rust changes: https://github.com/rust-lang/rust/releases/tag/1.93=
.0
>     > Cargo changes:
>     https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-193-20=
26-01-22
>     >
>     > * rust-oe-selftest.patch updated for 1.93:
>     >=C2=A0 =C2=A0Renamed UI test directive from add-core-stubs to add-=
minicore
>     as in
>     >
>     https://github.com/rust-lang/rust/commit/3796f7de57f5d4cf4325d1f13a=
eb07fdaa57983b
>     >
>     > * OE-selftests:
>     >=C2=A0 =C2=A0- Exclude src/tools/remote-test-client from test suit=
e.
>     >=C2=A0 =C2=A0 =C2=A0This unit test modifies the TEST_DEVICE_ADDR e=
nvironment
>     variable,
>     >=C2=A0 =C2=A0 =C2=A0which breaks the OE test harness that uses the=
 same variable for
>     >=C2=A0 =C2=A0 =C2=A0QEMU remote testing. Filed a bug with upstream=
:
>     > https://github.com/rust-lang/rust/issues/151823
>     >
>     >=C2=A0 =C2=A0- Enable +v8a feature for cortexa57.
>     >=C2=A0 =C2=A0 =C2=A0Rust 1.93.0 added a regression test (PR #14954=
9) to verify
>     that the
>     >=C2=A0 =C2=A0 =C2=A0ARMv8-A system register ttbr0_el2 is recognize=
d in inline
>     assembly.
>     >=C2=A0 =C2=A0 =C2=A0This addresses issue #97724 where LLVM wasn't =
recognizing
>     ttbr0_el2
>     >=C2=A0 =C2=A0 =C2=A0as a valid register. Upstream Rust enables +v8=
a by default
>     for all
>     >=C2=A0 =C2=A0 =C2=A0AArch64 targets (PR #105026), but Yocto's cust=
om target
>     specification
>     >=C2=A0 =C2=A0 =C2=A0doesn't inherit this. Adding +v8a ensures LLVM=
 recognizes
>     ARMv8-A
>     >=C2=A0 =C2=A0 =C2=A0system registers, fixing the test failure.
>     >
>     >=C2=A0 =C2=A0 =C2=A0Related upstream links:
>     >=C2=A0 =C2=A0 =C2=A0- PR #149549: https://github.com/rust-lang/rus=
t/pull/149549
>     >=C2=A0 =C2=A0 =C2=A0- Issue #97724: https://github.com/rust-lang/r=
ust/issues/97724
>     >=C2=A0 =C2=A0 =C2=A0- PR #105026: https://github.com/rust-lang/rus=
t/pull/105026
>     >
>     > Test results:
>     >
>     > rust v1.93.0
>     > +-------------+--------+---------+
>     > | Machine=C2=A0 =C2=A0 =C2=A0| Passed | Skipped |
>     > +-------------+--------+---------+
>     > | qemux86-64=C2=A0 | 21,689 |=C2=A0 =C2=A0646=C2=A0 =C2=A0|
>     > | qemux86=C2=A0 =C2=A0 =C2=A0| 21,439 |=C2=A0 =C2=A0896=C2=A0 =C2=
=A0|
>     > | qemuarm64=C2=A0 =C2=A0| 21,495 |=C2=A0 =C2=A0840=C2=A0 =C2=A0|
>     > | qemuarm=C2=A0 =C2=A0 =C2=A0| 21,421 |=C2=A0 =C2=A0914=C2=A0 =C2=
=A0|
>     > | qemuriscv64 | 21,466 |=C2=A0 =C2=A0869=C2=A0 =C2=A0|
>     > +-------------+--------+---------+
>     >
>     > Test results difference (1.93.0 - 1.92.0):
>     >
>     > +-------------+--------+---------+
>     > | Machine=C2=A0 =C2=A0 =C2=A0| Passed | Skipped |
>     > +-------------+--------+---------+
>     > | qemux86-64=C2=A0 |=C2=A0 +205=C2=A0 |=C2=A0 =C2=A0+33=C2=A0 =C2=
=A0|
>     > | qemux86=C2=A0 =C2=A0 =C2=A0|=C2=A0 +205=C2=A0 |=C2=A0 =C2=A0+33=
=C2=A0 =C2=A0|
>     > | qemuarm64=C2=A0 =C2=A0|=C2=A0 +206=C2=A0 |=C2=A0 =C2=A0+32=C2=A0=
 =C2=A0|
>     > | qemuarm=C2=A0 =C2=A0 =C2=A0|=C2=A0 +205=C2=A0 |=C2=A0 =C2=A0+33=
=C2=A0 =C2=A0|
>     > | qemuriscv64 |=C2=A0 +205=C2=A0 |=C2=A0 =C2=A0+33=C2=A0 =C2=A0|
>     > +-------------+--------+---------+
>     >
>     > Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>     > ---
>
>     Hi Hemanth,
>
>     Thanks for the upgrade.
>
>     I suspect this is responsible of the
>     runtime_test.RustKernel.test_kernel_rust_sample selftest failure:
>
>     2026-01-31 16:20:41,991 - oe-selftest - INFO -
>     runtime_test.RustKernel.test_kernel_rust_sample
>     (subunit.RemotedTestCase)
>     2026-01-31 16:20:41,994 - oe-selftest - INFO -=C2=A0 ... FAIL
>     ...
>     ERROR: linux-yocto-6.16.11+git-r0 do_compile: Execution of
>     '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-7661=
38/tmp/work/qemux86_64-poky-linux/linux-yocto/6.16.11+git/temp/run.do_com=
pile.189616'
>     failed with exit code 1
>     ...
>     | error: unknown unstable option: `no-jump-tables`
>
>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/=
3127
>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/=
3022
>
>     Can you have a look at what is going wrong here?
>
>
> Hello,
>
> To clarify because this is not totally obvious:
> This test is defined in the "[PATCH v5 00/15] Enable rust support for=20
> linux kernel" from Harish.Sadineni (also at Windriver)
> https://lore.kernel.org/openembedded-core/20260129163910.2612040-10-Har=
ish.Sadineni@windriver.com/
> So, the test is not present on master (or even master-next).
Hi all,

"[PATCH v5 00/15] Enable rust support for linux kernel" this series is=20
taken to mathieu/msater-next, on top of this series when testing with=20
rust-1.93.0 patch
has caused this build failure.

This failure is already identified in upstream and has a fix in=20
linux-kernel 6.18/master, so i will send a backport fix to linux-yocto=20
v6.16.
https://github.com/torvalds/linux/commit/789521b4717fd6bd85164ba5c131f621=
a79c9736

Can the rust 1.93.0 patch be tested/merged , By the time above mentioned=20
backported patch taken to linux-yocto v6.16?.
>
>
>     Thanks,
>     Mathieu
>
>     --=20
>     Mathieu Dubois-Briand, Bootlin
>     Embedded Linux and Kernel engineering
>     https://bootlin.com
>
>
>
>
>
>
> --=20
> Yoann Congal
> Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230373):https://lists.openembedded.org/g/openembedd=
ed-core/message/230373
> Mute This Topic:https://lists.openembedded.org/mt/117544255/8054390
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
Harish.Sadineni@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------h7mgXFSEsINxZ807OvfYQh0g
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6129vDWr3189312

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/2/2026 8:45 PM, Yoann Congal via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+5-gHPYDLsxKjSK-BRVqhZ+di=
s+b1hE+82LAL0pAQL7CA@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">Le&nbsp;dim. 1 f=C3=A9v=
r. 2026
              =C3=A0&nbsp;08:52, Mathieu Dubois-Briand via
              <a href=3D"http://lists.openembedded.org" moz-do-not-send=3D=
"true">lists.openembedded.org</a>
              &lt;mathieu.dubois-briand=3D<a href=3D"mailto:bootlin.com@l=
ists.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-fre=
etext">bootlin.com@lists.openembedded.org</a>&gt;
              a =C3=A9crit&nbsp;:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              On Fri Jan 30, 2026 at 2:41 PM CET, Hemanth.KumarMD via <a =
href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">
                lists.openembedded.org</a> wrote:<br>
              &gt; From: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.=
KumarMD@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">Hemanth.KumarMD@windriver.com</a>&gt;<br>
              &gt;<br>
              &gt; <a href=3D"https://blog.rust-lang.org/2026/01/22/Rust-=
1.93.0/" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">
                https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/</a><br=
>
              &gt; Rust changes: <a href=3D"https://github.com/rust-lang/=
rust/releases/tag/1.93.0" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true" class=3D"moz-txt-link-freetext">
                https://github.com/rust-lang/rust/releases/tag/1.93.0</a>=
<br>
              &gt; Cargo changes: <a href=3D"https://doc.rust-lang.org/ni=
ghtly/cargo/CHANGELOG.html#cargo-193-2026-01-22" rel=3D"noreferrer" targe=
t=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">
https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-193-2026-01-=
22</a><br>
              &gt;<br>
              &gt; * rust-oe-selftest.patch updated for 1.93:<br>
              &gt;&nbsp; &nbsp;Renamed UI test directive from add-core-st=
ubs to
              add-minicore as in<br>
              &gt;&nbsp; &nbsp;<a href=3D"https://github.com/rust-lang/ru=
st/commit/3796f7de57f5d4cf4325d1f13aeb07fdaa57983b" rel=3D"noreferrer" ta=
rget=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://github.com/rust-lang/rust/commit/3796f7de57f5d4cf4325d1f13aeb07fd=
aa57983b</a><br>
              &gt;<br>
              &gt; * OE-selftests:<br>
              &gt;&nbsp; &nbsp;- Exclude src/tools/remote-test-client fro=
m test
              suite.<br>
              &gt;&nbsp; &nbsp; &nbsp;This unit test modifies the TEST_DE=
VICE_ADDR
              environment variable,<br>
              &gt;&nbsp; &nbsp; &nbsp;which breaks the OE test harness th=
at uses the
              same variable for<br>
              &gt;&nbsp; &nbsp; &nbsp;QEMU remote testing. Filed a bug wi=
th upstream:<br>
              &gt;&nbsp; &nbsp; &nbsp;<a href=3D"https://github.com/rust-=
lang/rust/issues/151823" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true" class=3D"moz-txt-link-freetext">https://github.com/rust-lan=
g/rust/issues/151823</a><br>
              &gt;<br>
              &gt;&nbsp; &nbsp;- Enable +v8a feature for cortexa57.<br>
              &gt;&nbsp; &nbsp; &nbsp;Rust 1.93.0 added a regression test=
 (PR #149549)
              to verify that the<br>
              &gt;&nbsp; &nbsp; &nbsp;ARMv8-A system register ttbr0_el2 i=
s recognized
              in inline assembly.<br>
              &gt;&nbsp; &nbsp; &nbsp;This addresses issue #97724 where L=
LVM wasn't
              recognizing ttbr0_el2<br>
              &gt;&nbsp; &nbsp; &nbsp;as a valid register. Upstream Rust =
enables +v8a
              by default for all<br>
              &gt;&nbsp; &nbsp; &nbsp;AArch64 targets (PR #105026), but Y=
octo's custom
              target specification<br>
              &gt;&nbsp; &nbsp; &nbsp;doesn't inherit this. Adding +v8a e=
nsures LLVM
              recognizes ARMv8-A<br>
              &gt;&nbsp; &nbsp; &nbsp;system registers, fixing the test f=
ailure.<br>
              &gt;<br>
              &gt;&nbsp; &nbsp; &nbsp;Related upstream links:<br>
              &gt;&nbsp; &nbsp; &nbsp;- PR #149549: <a href=3D"https://gi=
thub.com/rust-lang/rust/pull/149549" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">
                https://github.com/rust-lang/rust/pull/149549</a><br>
              &gt;&nbsp; &nbsp; &nbsp;- Issue #97724: <a href=3D"https://=
github.com/rust-lang/rust/issues/97724" rel=3D"noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">
                https://github.com/rust-lang/rust/issues/97724</a><br>
              &gt;&nbsp; &nbsp; &nbsp;- PR #105026: <a href=3D"https://gi=
thub.com/rust-lang/rust/pull/105026" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">
                https://github.com/rust-lang/rust/pull/105026</a><br>
              &gt;<br>
              &gt; Test results:<br>
              &gt;<br>
              &gt; rust v1.93.0<br>
              &gt; +-------------+--------+---------+<br>
              &gt; | Machine&nbsp; &nbsp; &nbsp;| Passed | Skipped |<br>
              &gt; +-------------+--------+---------+<br>
              &gt; | qemux86-64&nbsp; | 21,689 |&nbsp; &nbsp;646&nbsp; &n=
bsp;|<br>
              &gt; | qemux86&nbsp; &nbsp; &nbsp;| 21,439 |&nbsp; &nbsp;89=
6&nbsp; &nbsp;|<br>
              &gt; | qemuarm64&nbsp; &nbsp;| 21,495 |&nbsp; &nbsp;840&nbs=
p; &nbsp;|<br>
              &gt; | qemuarm&nbsp; &nbsp; &nbsp;| 21,421 |&nbsp; &nbsp;91=
4&nbsp; &nbsp;|<br>
              &gt; | qemuriscv64 | 21,466 |&nbsp; &nbsp;869&nbsp; &nbsp;|=
<br>
              &gt; +-------------+--------+---------+<br>
              &gt;<br>
              &gt; Test results difference (1.93.0 - 1.92.0):<br>
              &gt;<br>
              &gt; +-------------+--------+---------+<br>
              &gt; | Machine&nbsp; &nbsp; &nbsp;| Passed | Skipped |<br>
              &gt; +-------------+--------+---------+<br>
              &gt; | qemux86-64&nbsp; |&nbsp; +205&nbsp; |&nbsp; &nbsp;+3=
3&nbsp; &nbsp;|<br>
              &gt; | qemux86&nbsp; &nbsp; &nbsp;|&nbsp; +205&nbsp; |&nbsp=
; &nbsp;+33&nbsp; &nbsp;|<br>
              &gt; | qemuarm64&nbsp; &nbsp;|&nbsp; +206&nbsp; |&nbsp; &nb=
sp;+32&nbsp; &nbsp;|<br>
              &gt; | qemuarm&nbsp; &nbsp; &nbsp;|&nbsp; +205&nbsp; |&nbsp=
; &nbsp;+33&nbsp; &nbsp;|<br>
              &gt; | qemuriscv64 |&nbsp; +205&nbsp; |&nbsp; &nbsp;+33&nbs=
p; &nbsp;|<br>
              &gt; +-------------+--------+---------+<br>
              &gt;<br>
              &gt; Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto=
:Hemanth.KumarMD@windriver.com" target=3D"_blank" moz-do-not-send=3D"true=
" class=3D"moz-txt-link-freetext">Hemanth.KumarMD@windriver.com</a>&gt;<b=
r>
              &gt; ---<br>
              <br>
              Hi Hemanth,<br>
              <br>
              Thanks for the upgrade.<br>
              <br>
              I suspect this is responsible of the<br>
              runtime_test.RustKernel.test_kernel_rust_sample selftest
              failure:<br>
              <br>
              2026-01-31 16:20:41,991 - oe-selftest - INFO -
              runtime_test.RustKernel.test_kernel_rust_sample
              (subunit.RemotedTestCase)<br>
              2026-01-31 16:20:41,994 - oe-selftest - INFO -&nbsp; ... FA=
IL<br>
              ...<br>
              ERROR: linux-yocto-6.16.11+git-r0 do_compile: Execution of
'/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-766138/tmp=
/work/qemux86_64-poky-linux/linux-yocto/6.16.11+git/temp/run.do_compile.1=
89616'
              failed with exit code 1<br>
              ...<br>
              | error: unknown unstable option: `no-jump-tables`<br>
              <br>
              <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/=
builders/35/builds/3127" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true" class=3D"moz-txt-link-freetext">https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/35/builds/3127</a><br>
              <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/=
builders/48/builds/3022" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true" class=3D"moz-txt-link-freetext">https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/48/builds/3022</a><br>
              <br>
              Can you have a look at what is going wrong here?<br>
            </blockquote>
            <div><br>
            </div>
            <div>Hello,</div>
            <div><br>
            </div>
            <div>To clarify because this is not totally obvious:</div>
            <div>This test is defined in the &quot;[PATCH v5 00/15] Enabl=
e
              rust support for linux kernel&quot; from Harish.Sadineni (a=
lso
              at Windriver)</div>
            <div><a href=3D"https://lore.kernel.org/openembedded-core/202=
60129163910.2612040-10-Harish.Sadineni@windriver.com/" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">https://lore.kernel.org/openembedd=
ed-core/20260129163910.2612040-10-Harish.Sadineni@windriver.com/</a></div=
>
            <div>So, the test is not present on master (or even
              master-next).<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Hi all,<br>
    <br>
    &quot;[PATCH v5 00/15] Enable rust support for linux kernel&quot; thi=
s series
    is taken to mathieu/msater-next, on top of this series when testing
    with rust-1.93.0 patch<br>
    has caused this build failure.<br>
    <br>
    This failure is already identified in upstream and has a fix in
    linux-kernel 6.18/master, so i will send a backport fix to
    linux-yocto v6.16. <br>
    <a href=3D"https://github.com/torvalds/linux/commit/789521b4717fd6bd8=
5164ba5c131f621a79c9736" class=3D"moz-txt-link-freetext">https://github.c=
om/torvalds/linux/commit/789521b4717fd6bd85164ba5c131f621a79c9736</a><br>
    <br>
    Can the rust 1.93.0 patch be tested/merged , By the time above
    mentioned backported patch taken to linux-yocto v6.16?. &nbsp; <br>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+5-gHPYDLsxKjSK-BRVqhZ+di=
s+b1hE+82LAL0pAQL7CA@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              Thanks,<br>
              Mathieu<br>
              <br>
              -- <br>
              Mathieu Dubois-Briand, Bootlin<br>
              Embedded Linux and Kernel engineering<br>
              <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https:/=
/bootlin.com</a><br>
              <br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <br>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal=
</font>
              <div><font face=3D"Raleway, regular">Smile ECS</font></div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#230373): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/230373">https:/=
/lists.openembedded.org/g/openembedded-core/message/230373</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/117544255/8054390">https://lists.openembedded.org/mt=
/117544255/8054390</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:Harish.Sadineni@windriver.com">Harish.Sadineni@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------h7mgXFSEsINxZ807OvfYQh0g--

