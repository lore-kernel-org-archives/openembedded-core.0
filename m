Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA93ED29DC2
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 02:56:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50652.1768273008735325366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 18:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SYbtnUH+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54739ea024=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1Ijle2535169
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 18:56:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=hE3nuO3LaQ7swng45ymMysLnIPlAxwPOLC0GI6I7OGQ=; b=SYbtnUH+DM3Q
	o0jAJnhG+AtYzYjW2VgLaraSO98rNJQFVdE075LRDRghYqiyu3ZlQ4Jb/q7ynGn1
	pNgHx96BrxiAOsrCblAzRUnjyh2dxFMmJWoEbr5ttUDM/y2Z/6v1zxGq+o/8sqO5
	7QF9Kb8JfgNaCg68a9y9IWa85GLAoTUUetYRt6gsZLSKMa3iX2X4bEB9osFeWoWU
	HIG/uw6+vWwItAq/rjik3T3fm0EyexEw0RjixM3y30TuUWmDefQh9qTIJA2z81K1
	HU4ro433EuVdEyvmflPpaKdpxaqL2HkJSFojfoRrGGeQahQsXE83k7AYJqiBWGak
	KcKMn8/Gbg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5ft9kc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 18:56:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuizR+gK3+EMkQOiegN88Mk7KQjo4oLiVY5EONy3y+LOE8Zte/BQ0xW/xxp6ei79AKCkLpNyEJICtOUiV5b4TK4ugPcxQQ6PWKL+lSj7mY/woaobxAmvNxApsgyFa7Uxr2mPZugjncaJqTnj6Kcr0wudiXkRCQ4BPblWGO8u4nbZWsytk8wTHIyP53bAFWGPM+MO3f8MdxdU+nesw45hUNchag1DkGfwdu8vOHXWKedia2z4ZA5vqhx2tSXIpivHpJKnVWoUac2uXwYFaPWzpZ8FWmUzsiZQq7yarN18aVZ4sHou5ndz7UsqlNif8eDQvGesXynifpu7mRiIlmBD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hE3nuO3LaQ7swng45ymMysLnIPlAxwPOLC0GI6I7OGQ=;
 b=UfH0BSqo1ju4mNaPvE71p8CUPKghiVY9vv4A3y9l8PeMuh70LrQPWfQzcLlpq3CwcSTh417dGlzcVTxLKhHIFzIkFCM7DOY0doig49RvncQ4nIaobtmQshTfJXScIerxWAb6wofybnmB5i4XDsZOBADpQZ30AlWnyGxabjGuI/xUTZKXqT5XZ25WR/olQdZY9ssiv2WKFq3Wa5SOM2gP+yUUN4XCXpwrA/GzBUDXK4Tddw9gJmlxEHMW1dO5lFjagdnVdrQ1wLJvzVOdRtpnrVdagG5hFjch/hIsBXykcgtb5ErkMsp0YRVxzCJZuISJHyz+pR86hv9+Oz4o1tD0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:56:45 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:56:45 +0000
Message-ID: <67f4730d-fd6c-42d6-a6be-267bbd6caa2b@windriver.com>
Date: Tue, 13 Jan 2026 10:56:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] devtool: clean up debug build
To: Antonin Godard <antonin.godard@bootlin.com>,
        openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com, adrian.freihofer@gmail.com
References: <18880B4F565039AF.2355985@lists.openembedded.org>
 <20260110075429.2119759-1-hongxu.jia@windriver.com>
 <DFMJM47EDV3L.2NZJ8NWYZQWCF@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DFMJM47EDV3L.2NZJ8NWYZQWCF@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::15) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6ecc77-4363-4723-2eb1-08de524f6326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmNoTHJraDM4OTFGRDlOMzNwc2hITkpzUVF2ZUpxNkl5RllwVUw4eEN4TnZW?=
 =?utf-8?B?TUNGQmZRSnlDVXJMNHZjT1NreS9kNXdsdGVsd2d0dUc4TVRqVUdURkgvdDFa?=
 =?utf-8?B?dm10T3VCTDViVmpSOVh2OFRLNGx0d2dwbENnV0M3SHgzN2dtWFlBeGExOFp6?=
 =?utf-8?B?Tmd3WWNTTXZKb2Ric3JHQ3BaemJ4Y1pKU0tnbWtnTFRiZXZGVnE0OTdEQlFN?=
 =?utf-8?B?NE9QcldqZGMyaS9TakdlQTc5MlA0N2dzbDdNNmpyKytyS25MbHdmU3N1RUdn?=
 =?utf-8?B?UDFtVmVZbnpIQ21ma090RjBWSEdEZktYRmVKUzdwK1hhLzhqd2xzdlRZODFt?=
 =?utf-8?B?d0RoNDBMYVV0TjFIVFFUWGFTak96Yy9oTU5QYVlYeHI2S0o3dkMyUXNMTU9N?=
 =?utf-8?B?b2hsM05JK0lJUnBJNk1BNDZrT0NycWZWOWh4SFRXN0hTOVQvWlRmWFdEWFdC?=
 =?utf-8?B?NjIvbmVHOUVkb3pabjhDMzFnMURXbEt1cFludlVDaEc1M21UUXY1ZUEzY0FX?=
 =?utf-8?B?V3padzBtWFNUb3I5MXFLNmVuZGYxcjBZTm41dkc2c3RtUDZENXhSRUk3V1kr?=
 =?utf-8?B?cXdsSE5vbkZPQzQvWTV0YVk3dWRrTnNQUVFwcExzc3pZRmZEendnWHZhWW1R?=
 =?utf-8?B?b3J0SVU0Ymx6TDBYTXA1bWN0akg3QmtOTC9rMjJ5RlBKRnRRbUtISmFjZ0s2?=
 =?utf-8?B?a2owL2ZMTnp5dnpZdXlpOXRsdm5HWjlwVXpjSGRpV0dqTUxBL1FSM3BHaCtm?=
 =?utf-8?B?UFN5d2dpTVhJekJZaTlQOWNneVk3RDY0VW1Hc2ZEZWdIZVhndVRjRXZMSHRn?=
 =?utf-8?B?U2NaTnI4aW0vMUF0RmgxK2JSZTBGRVRpb011ajFxVkU5emdkWVhRbk96U3A4?=
 =?utf-8?B?VlltaTFEckRWK1dkaG5HbHozQ3poellzYXZpd283Y00wYWtYMWoxUWNneVZ0?=
 =?utf-8?B?MzFReEVMNWNuVnZNdWhvWU1QNzZWNmw2dWpvd1FKM1I1TUhUUGo3bGlERE8z?=
 =?utf-8?B?MU9SYXJPZW14emdnekpFRXVMTzVPMGFMa3dTZmw3bThkTjd3UHNzcnlFVm5K?=
 =?utf-8?B?UEFLamE1Q0RWMTQyVzZKUUVmN28zdWZRQzlHQWo0aWNnQ1JFTjN5aVNFc3l6?=
 =?utf-8?B?bUdkbkRGdGZxYlNpM29oQWxURDFzNXNicTVCcXk5c2NzcFExMS9TM1VvWTZP?=
 =?utf-8?B?Z040dEx2NitTNmxHUFFwc2EwN0dubDBhUUF0VlI5azRaaUtVckFuY0tkeVV3?=
 =?utf-8?B?NVpEWEwwZTZWUFFMcDB0M3drN0R5T01MWmRpcmkyY0h1WnpUWXNtZUZ5Skh2?=
 =?utf-8?B?N2hzRko5R2pOUU9OdWhneFNnN2V2M28vNEZLeTBQWGNRM1NhVjZxcWtzcjVj?=
 =?utf-8?B?bzZOYkNUL05oVkdpM0x1NmlIdjU2ZCt6Rkk5b2tCd3dkbGFMNDFsai9CaWFX?=
 =?utf-8?B?NThkNnkvV3hpdW9pQWFFbVZzdGUwUGxvOUE4ODQvQjZ5cWMrdXBQQnpWSUVq?=
 =?utf-8?B?aVVpNmNEVEVQLzJobTFhWVQ5NGlkUCsyUTVNSUJ1eS9PNktPU0ZJOHFRMjg0?=
 =?utf-8?B?SjBaVTl3bENLMTcwbXRmR0lnMks0WkU0dHNmb1pSRmlJZGRWQUFmUkJRSG5C?=
 =?utf-8?B?U3hmdjFiV1JWVlZxUlBrSlF4azZvaGYxN010QlMxN0NMSXFsRjdORTN0VDJ0?=
 =?utf-8?B?TDlwT1hHZm5aUHBLY1FoYlgyUmtjM3UxVkRwTjBCTFQ3UlU1N3ZGeDE1R1ZB?=
 =?utf-8?B?RXYrNU1IZGg0NC9ha2Q3Ui8vcWJCQjlDdlhiL0E0Q0k4S3lmTEJybmx0UVk3?=
 =?utf-8?B?M0VsOGtKZEVWYmNUeThiTWdBWWVFK3BpTHoyckwzbGZXUGJYTDBubEZKRU5z?=
 =?utf-8?B?dzBLeEViTXhyZUlCQlA0N3lYL0xqWmxxdzRxbDNuNmVESGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVIyN09zdUVZRlNLR0pYTCtQRjhzS0JVUDJPRUs2Y0NXZTJHR21KSTErWU9L?=
 =?utf-8?B?bnhDTC9MM25FRkl1c0lPYXI1d0pwUnZSRFkzVmIyeitUNlM4dWVkY21seStU?=
 =?utf-8?B?VWF1Zlhkai9NZ3puZUhLUUtHeklHNVBMSFlUT1ZaSlFqNmpSUzVaSnI5a284?=
 =?utf-8?B?b2doSnZDVTlqQU9SMk10eGllbFF3Q21CUUc3Y2I0bngrZTNnK0wrRVppVGtp?=
 =?utf-8?B?MFpxaDZVZ2pYbnp5eHhBbXY4YWJ6RkRadjJBdUJjNEIwd1YrREo1cDJqaW15?=
 =?utf-8?B?cldQYVpZUGhXbVJmVmpzcG5ranhhdkZUd3ZYRHkraThZS1Z0SEJGblRCaHdO?=
 =?utf-8?B?N1pFYnVtZnUxa3lYalhnVFkyMjVqcGRKa3BoenI1VEo2bGxSK2xSMUdrMXNQ?=
 =?utf-8?B?YUNVS2pkSjcvaXpCOWVzSzFPZ2l3cEM5QjcybmQ1V05IZzEvbzVKRnRJamZF?=
 =?utf-8?B?RnlldjBXdXM5bnZqRTJJMmRZMzhOMzVLUm8vdWNIcEFRcWxNcVIwMFlGS0M4?=
 =?utf-8?B?NWJrM1FVeEV4UVloQm9XZEgvSk42c0c2enBMbjRsc3ZaWVNSdFJQbjlka21v?=
 =?utf-8?B?a2dvR3FkUGFYblF0eTYyQ3AxN0JRWURvd3Z1L0lWQ0s3RGtDZXgzaVBOS1NR?=
 =?utf-8?B?NmlMMGVNenk5ZkFMZ1pMMS9Hb1lWY21Ea1VFSXpGdGtLVk0xMXhseDhqdDRZ?=
 =?utf-8?B?N3RxOThzYm5oTm1YRGRET3pzWnk4Z2NnZk5sRVRueWplSm9mSU1JR09YVmk3?=
 =?utf-8?B?WlMwTHlSS0tuazUyaGFyQ1d1VzBBNDZMTmpTTzRVY0RvWitlRjZrQ2pEK0Y1?=
 =?utf-8?B?VDBpQ1phUS82S3ljTTZxakVEaUtqWFBncGZCNXVqdm1nRDFnOGw5ZmNIbCtO?=
 =?utf-8?B?YnNTNWYwb3NCSjVSeWtmbkMzb3VrZFdSaExTQXZwLy84ZXFmazVPZDlkWEFX?=
 =?utf-8?B?dm9lR09MU3BZNjBvZDJzRFE1SFdZM1pYbjJQWUtaZWhacXZOOGFyd1I1VUNj?=
 =?utf-8?B?djdlQXoydjdCNGhybllPd2VuT3lIY09JVmpFdmpha0UvTjhObFBrTVM4S1Jr?=
 =?utf-8?B?aWVjZFlEc2E0WDJDaVVibUMwR3pLbkdCeHE1WVcwK3djYWN0U1hHeloza3FV?=
 =?utf-8?B?bkVVeDd0djMwVG5tT3ZBNHdVT28rbWZ1bG9JQzFnaU5UYnRZYzNkYnBKZ0pS?=
 =?utf-8?B?Wjl2ZUwreXRJVkxORkV6YkdzVCtWTHN2RHB0TWxUbTNZYjhiUXQwRXlZRmVJ?=
 =?utf-8?B?SDVpN2lDZTI3OWtDTVJsbG1qQm5ETUlneUp2ZmFsMDJCS0IyUlNSVldZVWlR?=
 =?utf-8?B?bGJyOXU2WmNyYzFoanRSQ0RxbE9qZnE3dmtSa3VlZW1zK0lZVStqMWJjQjZF?=
 =?utf-8?B?RXZocjRtYmpyekJNMnhKQkVLRE8yUklPVnhURDU5V0dPdHF4VUpwa2MxS0xj?=
 =?utf-8?B?QW81azdoeHZRbHJ4aFNyY2w0U3J5YjEyb0Fkdnk2QW4rT3ZLcFNIY2hpczVB?=
 =?utf-8?B?ZnQ0aGR2VUN2VGZRdDlRNnliUkJ1VTEwZmZ5b0x6MTE5UCtCU2xqVTFzWXJh?=
 =?utf-8?B?MDlsMUxxY21zQzFjaXIwM1N0T2NpaCtKUGQwdS82SzBJVWRQdTFkUTRkNWFv?=
 =?utf-8?B?RERZVW5Mc2s2cVpoamU1Y28xWlFBR0xiUXUzVVZkcFBlRlkzeWJ3NFdiNGt2?=
 =?utf-8?B?Z3M2TG55TTNTRjJZQ0Y4aFkycE1BeWZsMFYzYlNVdWtDUS9LeTgrOXBIdWFy?=
 =?utf-8?B?STU1TmpYbE9oN0NnRWNvWUFaalEyYkFUV0R1eEthdjNzb3VSVGgySis2d3l5?=
 =?utf-8?B?OTFUZHpub2hhR240d2JQUGNlS01zMDJ1NXBudTRRTlUxbG5PNzNLVVh4TFRt?=
 =?utf-8?B?SFNtZjBZcUVxd3luU1hmVE80RzJLQ2JFZ0xEWFVaRkJkZ1ljSVNwVy92ekRV?=
 =?utf-8?B?QmcvNSt5RHdNUEFtd0l3MmxBZ3FOMVluSFVDRHo1eDVDV1VTV1AzT1Q1Y1FN?=
 =?utf-8?B?bFV3NnpFYmFnclJEMTVibEdoa2JqMjIxNmZoVVQzblJLR1dzdXU3RXBrTmxt?=
 =?utf-8?B?Y3ZDNk5EMmc2dG9VRUF3cGdnTnJCOHFjZjhzU0FhYWR0UTVWaE03MVBhc2RH?=
 =?utf-8?B?eHVyNnpKd3pHeE9zOWNPU3Iyb1pYME1VMFh6OHNVdG5JMWhia1FHTkNRV0kz?=
 =?utf-8?B?WFBJR1dZMERQOUxqRmxnYnhtMll0WnN6U2MxQWtaUjVHMmxzTmdXem55VlQv?=
 =?utf-8?B?MDlucytWRHh3ZGhhazVrOVBnWE15U3ZFSUFEVVh4REF4aENFN2ZUZWtkQkNS?=
 =?utf-8?B?dGRVSkhad3hIcm5vTzM3MXQvTGVIZWxRdVNNQXJETVdMdTVGcjhHQT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6ecc77-4363-4723-2eb1-08de524f6326
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:56:45.4296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omHvx7fe4KCIkBGKVI7hjlFQ32LPJ+lMDBQxK4g6NIf6+bZ0qKdlpKn2MMuaI5j7VxmoWnFVM8br7+sfDo2sTjXHAnHvCmqCFIJsZl+LthM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=6965b470 cx=c_pps
 a=3NFNipLq04N0pvkhkOyhzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=Nmzq8w5Q0EEA6csqL20A:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAyMyBTYWx0ZWRfX50aC/DWYU/+K
 6pmMhBhfLhH/M6RiKiJI+X5l+0QufXwLMK8fzfWgXFCHX50W9hcjuvSn+jk3WwLewURu3a2jsp6
 ehnqWsMKX0ACwtFws9i31oOEpxx5NUI5gDXdrfec6+OiskFBY2G3qYYdjbsH2DDa5u2uIAZ0g1+
 SNQMloQ60DUBTgMQTpslVfFpD9bpY2VuCmDPDHWpHi8U5q7f7PXE8Aau7ilwvao9ArhZRPiVHgE
 BDPBgR6T8X+e9PRWp4ooBHUDtIg4aI3YFVmcouSZm3Vf3KhshiQlIA3Ew/hQF0Jxqo20GELWZNu
 xUnTegRV35Xls/dD2vWneNCP8Qg6CQKanrapmr7vjwiXHZ9bNQ4vctpjXJfwfLKoV0SHFFyQZ0d
 0Mcd6VUbmG3eo/agXiYxxu049DCzLxkyt8JCug5DjHsq3xEFN9ilEALN1XuBnc4dEeMjkVDWUR1
 qWD+AMpiAEP25mHLn6w==
X-Proofpoint-ORIG-GUID: WMnMr9gTryGSOrniT8mIn8VMb8bbRNk3
X-Proofpoint-GUID: yS1YmV_ga2zbMBHWU3PfUGz1oOn4GaGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 02:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229222

On 1/12/26 18:36, Antonin Godard wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi,
>
> On Sat Jan 10, 2026 at 8:54 AM CET, hongxu via lists.openembedded.org wrote:
>> Due to we rework debug friendly optimization, rename DEBUG_BUILD
>> to DEBUG_OPTIMIZE. Then:
>>
>> - s/DEBUG_BUILD/DEBUG_OPTIMIZE/g
>>
>> - s/debug-build/debug-optimize/g
>>
>> - s/debug_build/debug_optimize/g
>>
>> Note, for specific recipe, we do not use
>>    OE_FRAGMENTS += "core/yocto/debug-optimize"
>> in recipe
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/conf/fragments/yocto/devtool-ide-sdk.conf |  2 +-
>>   meta/lib/oeqa/selftest/cases/devtool.py        |  2 +-
>>   scripts/lib/devtool/ide_sdk.py                 | 10 +++++-----
>>   scripts/lib/devtool/standard.py                |  6 +++---
>>   4 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/conf/fragments/yocto/devtool-ide-sdk.conf b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
>> index ca0269543b..f451b47713 100644
>> --- a/meta/conf/fragments/yocto/devtool-ide-sdk.conf
>> +++ b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
> I can't apply this patch as this file does not exist on master. Does your patch
> depend on another one?

Based on master-next

//Hongxu

>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


