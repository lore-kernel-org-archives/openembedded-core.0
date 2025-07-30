Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BBFC87FCA
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 02:33:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26068.1753842785991672240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 19:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0306b5c689=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56U2OTcS1766165
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 02:33:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484m7xkgnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 02:33:04 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56U2X4mw1781005;
	Wed, 30 Jul 2025 02:33:04 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2051.outbound.protection.outlook.com [40.107.96.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484m7xkgns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 02:33:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SI5wemQ5hgu0JHjYG63iNQbDBnkPRG7Wq7M7MQQn6SZJGEwEX5wUjlHQcR582odv3OCm0/KgzyLfNZXUXBx9F9R+S3phyNj/Lpjv8iWn1gb72o8/FSLkoA9xUIT1FJkYjIeCWZEQnJI7T+iy9kupK97oUiU7jED6Wdc+1CUDV2gvZcoaDnKOZ7KJusgrox4JGHOQI+DMp6GY5rpycKNW/pYL6zqtmgi9+VMkXxnWOI0Gq/OPfylguyvrJ12thxZO0kVewyzUPMmAho70HvR38uvCRMYONSQ7SIU+gS2q0iSF5sJuocsRUIeoutI8U6L8G7R95FyKhC0hv6sANTl72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8UU2twcZXjm8qIWaZHpkyUFBqkNlplPyfKvMEgaguk=;
 b=zBA/FmvbN9AfThUqzISJC0hQwkHObJ1OfD6qCu1G69wDJQz4/NbfiQ7EVmbjOFZAb3n46wLJZwfO1EWgC2vpzOUJlJSOngrnkcIaZuZFRx6sZt8BXUKGK0TLdrDEJturLmafT6vIh25Fx+hWLXBRHR9J9L2MBjeJ5qKhqEUWDjdT/nqh9a1P8MVKR+YOxqjN8cf23Pv5Fm9p3nmBrgAXCqYFCQpi6dDHkKWy9Y1693NJ4HAo5pnQGmXZQKS3Dm3Uqa+Mm7pyk9ruWd+5nyE27vjNzC2HthDWDkzwdL1/UCn1SQrTkHmrisOXqvq4zqPv4n5WcUbOVGVflZRRJ9Xoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA1PR11MB8198.namprd11.prod.outlook.com (2603:10b6:208:453::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 02:33:00 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 02:33:00 +0000
Message-ID: <19ed1b0a-77bf-40ed-add8-65e22da0b0e0@windriver.com>
Date: Wed, 30 Jul 2025 10:32:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/4] bash: upgrade 5.2.37 -> 5.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250721082103.2262095-1-hongxu.jia@windriver.com>
 <20250721082103.2262095-2-hongxu.jia@windriver.com>
 <DBJ6VQ8HNDNA.2QA8PHPZYPCE3@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DBJ6VQ8HNDNA.2QA8PHPZYPCE3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0206.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::14) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA1PR11MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb52cac-a552-45c9-0afa-08ddcf116706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YitsZnloZEgrQitOcUR2b2NzQ1FwYzl6WHZjOUVYUll3Z3VTdXhWS3lpckZV?=
 =?utf-8?B?UmxZai9CSW52R3NKSjRMSTZGb3pzSmZhYkJKRXVZSjd4RElXN3JsSlRLaEJ5?=
 =?utf-8?B?Y0JZenpiVFVXUWdnRldoUEYxM0Y1VmR2UWxuOHZCUzhSUlpGYWxtU09CSFpY?=
 =?utf-8?B?OUVhM0s2TGJjMjhKenVUT2NYNllNVVJ6anMvTVV1Y1IyRHZWUnc2SUFuR0wy?=
 =?utf-8?B?bjdFWDRlcFlnR3FRTHJkOUlHeG45WmhOUnQxSHF6eHN4TGFFUWUrMnJXamxR?=
 =?utf-8?B?cmIyQWZDQzJwNzMxZ2tLSlZnSWU5U1ZJditNSWhPWEpEYWVZZTcvbWdsNVNt?=
 =?utf-8?B?a0p4WkRDSWxieEFpOURDWVpLc1pMcG5rOGxFMmpmWFluOHM2M29XYnpLVC9q?=
 =?utf-8?B?bHFnanVmNEc0MmpFeldjUGwzemJ5cDFMSmc1MUV1SWRPbjMvZFpJUDhXTnZi?=
 =?utf-8?B?R1pNeEtLNTF4QlViUklkYnAxMG9IQmsvMm1RNWxIOFluazVpK2V2WDFwYnpI?=
 =?utf-8?B?OHgwek9NMmxXSVJ4Y2lrL3NxTjRid2M4Q2k5NjI0QXdNQnhBYUJGeUJ1YW85?=
 =?utf-8?B?VGJhQ0VKZ3RwWEpNaXlwUmc1eFVFS1lxV09rMzlWb3VPcmhUelF6UFJhc2Nl?=
 =?utf-8?B?dk5TejN3dDZWZGpVN1czVmxHZ2JPU1dtQ1ZrQjBoQk13YjlESERCNDltMDZI?=
 =?utf-8?B?eDBoR1REWlBzT2J2N3RBSFdKN1JhNUQrWmVQZDdFU0t4UTJlWTJrZnhSMkY4?=
 =?utf-8?B?V1dtMEw4RVJ6K2RqM0VaNGcvaHlpMmFhcVB0ZmJ5dmpwUGdTSmpvUDcwUGMw?=
 =?utf-8?B?anh1ZXNtekQvczROTnhRRWh4MXg3eTJSbDcyUFZKRDRHMkM4MDdYdEZ4VWU5?=
 =?utf-8?B?L0JrZlZvZXJ0a2tGZzF6OExMdnZzc284S0xNY2w5ZCtzWk9oR0ppSzhjZEor?=
 =?utf-8?B?a2t3K3FYcGYyLzg3NjVFOXRIdWJoUzRhcFhLd25qQVcvWW1NZkhKbzU0Tkp5?=
 =?utf-8?B?WkMzeFp0RVhQaWNiSVpuNHV1VnVVTUIra2F6cThtUHBEUWhOckRIWFNoU2xt?=
 =?utf-8?B?aWsyc1BEekExcnhncmZoUkRHd3lnZ0NvNlBNTjMvT2UwZFJ2bjkxd2ZWcFVC?=
 =?utf-8?B?NkJmVm9ic3Q3NDFKbHhvdFhNNGdzekJXaVpBeVNBL3BMMVVrbDZ0K0pHaG9q?=
 =?utf-8?B?RDFDdXFNZlBibTZyeEl0ZzNLNm41WGxhbElRZXh3ZUszQk1OUFVFdm5sMXJX?=
 =?utf-8?B?K0drSkdtWjFpNWF0U0k4WnUrbXdsaUt6NDBCQzVOUjdZejljMWtMeHR0d3Vp?=
 =?utf-8?B?S1ZTZFI1NFU3UXNTenVWU1BYVktuY1hVK0dLZnd6c3MzWUgwM09rLzE2Qmdn?=
 =?utf-8?B?TWl0OXh2T1cxVjV4bEtJdGZOb1d3UCtteGQ1Y2pZMi9HemdQUDRRcWxINDcv?=
 =?utf-8?B?YXF3UDFvemE5YlNxMHh6OUh5bjhkbnBvelJoZXhRRitFWDZPKzBUR1Y0MEFO?=
 =?utf-8?B?WE92UXRXM252TjdOcXJyeG4zam9JWTlQZVNidEtvRElhMU9kd3Urd0RmaEEr?=
 =?utf-8?B?aDM1MEpnS0k3S21Ca2JyRkc4THV1cVhqUStLRFFHdWU5cnlaS1F5b3psbHBM?=
 =?utf-8?B?THlrNEtvMWk2anB5QjMva3JVSGRXWmVyWFNTMHVmSkZySk04dmtOaURpMTN6?=
 =?utf-8?B?d25oUk9rNVZ4RkxBTEZIbEZFTFRzVUo3VFp5Zjl5K1NMNlh2TlVNbG5JRDFL?=
 =?utf-8?B?YXA2STd1UGkxazV5OG85UVJ0U2g1OW5YSE9TT29mYzFmWEh0Q3dUbGdkNC9l?=
 =?utf-8?Q?zshxlHea/8XJLvfvlLMhPOk0TfIuF5GlhAJW0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEF1WUhOaUU4Ty9COXBydHVWYzl4ZVFabzRMZUlRQkZrZGVrbjByNWRtUFVa?=
 =?utf-8?B?K3hHeVVNL0JjY1ZIQ2xRK1pjUndmY3poK2dEdHM2d1FXUVpiVDFHZUc5dUJZ?=
 =?utf-8?B?TXF4Uld1QzVzVmtwSnhESzRhNUI0YWFqZ3RCZ29IR0dqTmprRDRYSnROTlV0?=
 =?utf-8?B?RllQMHZJUFo4RGhLTVZ6ZWNuSTlObGF1SU9CM1J3TmI1ZXFjVFR6RkFJN0kr?=
 =?utf-8?B?aFUzQ3QvWk43dUtQZWM5RmU1aGl3dXRpd1JFdk5xRUlsWUc3QmtpNGZhOWE5?=
 =?utf-8?B?b1d1ZEZNaFhjZDJ4TEZraE5HY29TYk90WWRTSFNWT3VCeXgvVU5aVGJ3dm04?=
 =?utf-8?B?VGttSzRSTGpRcmNlVVIwRFE0eFBoNlhEQk1maGx1S0E0ZUNWMnZLY0VtSERp?=
 =?utf-8?B?aUk4VkNZQXd1eWs3ak9XQ2xudWFsWWsrSE9ETVdMN0lpcUNzNkRqWkU1N3Vi?=
 =?utf-8?B?YVJhc2w3dWpjazFhMFFXdnVUeDBsTTdmVU83N0E2RGNmTktqdlZvRGxHZ0Nh?=
 =?utf-8?B?L3hPNy9Dek96UTNUS2trbUIrNGErZ284RWRjMUpwMU9zbTZsNXBEM3hrcUor?=
 =?utf-8?B?ZnBDNGROai94Z3RKS05mNTVrUGYyT2dCNTV1V2kyaEo2NmZxK096RFlrQjZR?=
 =?utf-8?B?QlVnM1BGM2NyQ2VtdE0vVjdBMTdMeHVvVEF0dFJYYkpWTi9Jdkk0eFZzMXAr?=
 =?utf-8?B?SFJjSzI5YXluTSsrWVU3UEU0SlRXT0tHMEM4bmZpVlluTHRaMDBIS3hpZFd1?=
 =?utf-8?B?WTlXZWx5ZVhJTUVuNkNrTlVpM3Z5a3lEMUlKN2l4aTBsejJQQnh2bUwxVTZG?=
 =?utf-8?B?V3IxeVdBUXYrUi9pUTlQVVFxUlJ4dWEzRkZaZ2pVaDNNWDYwbU5QYjZPS09D?=
 =?utf-8?B?YmhETmp4Y09nVXJJT3ZndkFWV2k4ZysxSkJGWkQxR1hNUmxrZStCR2twYllu?=
 =?utf-8?B?MXkzLzNzY2FvZ3N1MVNJVmFjTm9OMHBFa1RtNCs5WTdYVWQzL3Y1Wk1PTkpM?=
 =?utf-8?B?VVNZUDNzOEJTM2J3S3lNTzNsTTRSV3N2RFhFcFhTNkVqYnd0QzZFSEtranVz?=
 =?utf-8?B?c0FGWTBLMEVBUTVyM2tZd1duQkRPb3ZaQlVXZWVmYjIxRnBwZU5CSUl6NS9Z?=
 =?utf-8?B?SG1KMkRFbEJpOEdNS1dacG0xT3RjMzlHR3FFcFBZcThEUXJYUnM5clVFRkph?=
 =?utf-8?B?K1ZXbHFmdXgzQ1Q1cEJGU2E3RlBVb3FyY0pTOUhHdFJtTkJQR2pmNy9rVHJk?=
 =?utf-8?B?enZpZE5acGh1Z0V0NmthenFtN01QL2VITXJMKzVkWU56bVgzWEh6QTlGRkJv?=
 =?utf-8?B?RVhaTGlQN3ZkRWpNRlFmekFYbVRLZGtmVm5GWHhNY0pqTE4raUloQ3FSQ1ho?=
 =?utf-8?B?R1VIeU56YXg2eFN4Z25lQVpGdDBoR3FiYTdyUzByMjZNNlVxamVGYVNsN0dj?=
 =?utf-8?B?VFdhNWJaL2p6bVZJOUQ1SlBJMDFORXV5WTVWTXgwK2RwdFl5eGxNWE80ZjNk?=
 =?utf-8?B?cWdJN0tUT21sWnQvSXNtSkEvM0tSVG5ROGpDL3lmTVNXemdrdGtTUGUySzQy?=
 =?utf-8?B?ZytQa1I2ZlczNFVPbXBPZlcxdWlwYlF6RTg3azkrR2ZLZ0JtNUpKT2FYNFRj?=
 =?utf-8?B?WmRoVWYzdy8vUHUrM3BaVjlOYXJTUU9BNUNrdmF3MWZ6cXRubWRTSitWUVBO?=
 =?utf-8?B?Vm84aHNsUE4yUUEwTTUwc2RXK3dtcWp1WkRZS2ppcHRZek5Ma1dxU3lmeVU1?=
 =?utf-8?B?cXI0MXRZTTV4d25iVzE5cWk2WWVnaFlLVGhzNEdYZE9rSmxSZ0V3NWd2NzRO?=
 =?utf-8?B?dloxaGY2YWxsY3NhTWNScUFnZnV2cDlzWFdqcm01L2d1NWo5WWNjbUU5OHJT?=
 =?utf-8?B?bHd5OWtGVXY0Tzh6T3hYV3A1WGRjeHVYcE92eG1FQWk0aXViT3dLekxiQWxF?=
 =?utf-8?B?bDlPZTdDMW5aSzNTbzhzUU1TVmZiWlpDRTdJU01ZOVJ2dURZWjYxMEFiM2RP?=
 =?utf-8?B?VE1ydUFQUDZsM0wyVU1hWm11dG9vc00xUHNoQis0MFVEaWRSaUdUTm5xYkht?=
 =?utf-8?B?S1hGRk5mUnlkOWlCVEhpN0JDeEZJRlhub0VxcFV1aHJ6anFoY3pBNS8rSFlC?=
 =?utf-8?B?b0tRcmRxUWZLRTdDeHdwcXdvMCtQd3lUaU5ydHhvdVVpTis1aWl2aWpjSjdW?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb52cac-a552-45c9-0afa-08ddcf116706
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 02:33:00.8174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FihVgRfNjxgSDDW92G80HF5qLi9B3B8XIY+9bC5QeaLnfGDkyrhty59/SAg5eD06GraGb0yFvrTcZ9gXW5V4mXEfVCbBBGOmmLtu+Ss9o/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDAxNiBTYWx0ZWRfX2fhdAf4EPjvs
 26QhqGTfkhUlbbwwJOh2xbLPAGgKcila3KrUczwe6AUS5RJfsc1HEC3tHNRirKwYbDSQrVkId6+
 TTsSYKnvUgS6Gm0hI673at1JFStawaWaZ0S5C+TV55Oz+Xrfz8rDLhRWAJnV8DIilQ3obLISZS/
 QKDZ0HtwLPyh0GlXMHIbp7l0ZBdV3uDL0O5Oe5T653iqGhgJJ2KKdum5ktTmORy7Qj2PIluErUM
 RLRpbsstdDs+rfvoJEN6iG/uuWWPeI9oXAjEIl7rXAcOFbB49ME0oXhfr9A8OZvCjJIBQtEaiQy
 LHiS7RntkcMUrilLtM/qfKC84Rf2Ww1j30mWDJbjgbYJ6C/rOD0coyxWmF/CqalJsaUdDz0o0g6
 7qyzk0po
X-Proofpoint-ORIG-GUID: ltPqxngEq8xUYPRB87sEA7SQ7ybJi-7p
X-Proofpoint-GUID: dUQDHjmM3-PXJiBtCabsaVB5O-9J8SsX
X-Authority-Analysis: v=2.4 cv=Y9v4sgeN c=1 sm=1 tr=0 ts=68898460 cx=c_pps
 a=eELu8oNxtHo1ejlaPT8k4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=iGHA9ds3AAAA:8
 a=1NWNoF9oAAAA:8 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=19hgjuTe6BXBGd9qXpcA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=97APRTa-CG6DvPMFVxHL:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507250208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 02:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221093

On 7/23/25 13:35, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon Jul 21, 2025 at 10:21 AM CEST, hongxu via lists.openembedded.org wrote:
>> Refresh patch to 5.3
>> - mkbuiltins_have_stringize.patch
>>
>> Drop backport patch
>> - 0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
>> - fix-filesubst-errexit.patch
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
> Hi,
>
> Thanks for the update patch.
>
> It looks like this is somehow breaking util-linux ptests:
>
> Failed ptests:
> {'util-linux': ['kill:_decode_functions']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1942
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1934
>
> Ptest logs can be found here:
>
> https://valkyrie.yocto.io/pub/non-release/20250722-88/testresults/qemuarm64-ptest/core-image-ptest-util-linux/
> https://valkyrie.yocto.io/pub/non-release/20250722-88/testresults/qemux86-64-ptest/core-image-ptest-util-linux/
>
> Can you have a look at these failures please?

Hi

Would you please apply this commit with the fix `[OE-core] [PATCH] 
util-linux: correct test case kill/decode for bash 5.3' [1]

[1] 
https://lists.openembedded.org/g/openembedded-core/message/221006?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2Chongxu%2C20%2C2%2C0%2C114413326

//Hongxu

> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


