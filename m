Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED7BE9B278
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:41:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24633.1771951311959100943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GEk7yqnb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65157b7930=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OC0Wik1497801
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=TM+/YKdPIoxn/xUoNOjQa2
	lrln/F9Je0Jvlgy2YC+0c=; b=GEk7yqnbPwgs491I5sKRtE90a9Xv60GumkPWtC
	1tdVSfW3GP5WpkTmwSnu0M/hC1K4AWh0Xdn4ZEQSxnzK9+jUhYuVazIiFcnfyLK/
	X5H78tbkEmFair2z/v0ASfwefVC6cwAHzBM4FgIDnGZhzlcchapJPUK8TcjfFEo1
	RnRmbF9tbX9oTcgwxY8+eBW/Y+eqUvqgMEuHG93CqjnNY1Rga3kEgtYHvIWLRn1f
	PYasSSdXwDKNPSYt5ZYf/2PfH6QbBLfMLk4stdczBAjdnCVHe1hLnkvGIfNcXRuD
	QPjMMG1ddyUp/WMojWOK1p3vohBy6r5RauO3xJgT/Lu6Y4Fg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf3p4bjqk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 16:41:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2KJDVgM+0GDft20GIfb+Agyy+iL6xWOTE1+r9wOlpwjibFibQXO3pRC74C5RmtwTZMNqKcZqcUJfV/a7ffCpAwUN73aRyboS9+bB5ekgzyV2/rC98m4ms0AWkw0h5kIaDwKUyAU8hNef4EKoP1QrBhB1xUB7gh9/u/pF1FmNCXXHvdfffMplL/BAjdH9QlXmoSTbvKorw5+3blz7HMlE3S8a6fhC8UtZ72vf+C1hp0eJyjdntg6wwk3kikumV/a4bjLXOJ1dKhyw6mELWa1B24BNLoe5AZawnBCnPnVlGGb/q+u8LAW8EcxFrxHhzAp3dpb7MMZALKxAsbqE8NK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM+/YKdPIoxn/xUoNOjQa2lrln/F9Je0Jvlgy2YC+0c=;
 b=kGrI+Hz1BFuUXwEv3yOdK8FaUmvFsaGwoLkRdUFootXowJ5h0eatiB+R84tHMQUsDTqRwfMw1sl/bJ0XgWaExJwVUotfb9K2f24mk6K1m3++YQCQVREg1MdNx9Blp8s406NFh74mOK0uDhzMCtWSbfTXXLDqvE/x9jymQwfGEXrq3S5vaZteT0tQCtfbhkbwCGehvB4JlpSRBdNyvqKnLuKcwRroAKFcqiM4pJLEcejGSpSERD/hzGMNSj0iD/jMdX07aQAZrW5dMVhozeh42O+ZPO2eHrRzAo7K8lThSA1/uNE8MKhhrlqPmIyCcEN5pm16QSFNOVHtrmxjnalWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:41:47 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:41:47 +0000
Content-Type: multipart/alternative;
 boundary="------------052xGlfE7mSrypMj0dQTL8yK"
Message-ID: <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com>
Date: Tue, 24 Feb 2026 11:41:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED
To: Wang Mingyu <wangmy@fujitsu.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY5PR11MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3aaa15-1ba9-4fab-0e70-08de73c399e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MlJreXRFeitWdUpuR1U1UXY1NGJrK2ZqUklCODVSWmFUNkNzb1FUazRSdkZJ?=
 =?utf-8?B?Tm42dzUzcUR5bjl2UzZQNktIcndDWHBDRmVBZjdRWmZ3bmJ4TlFjbCtjMC9Q?=
 =?utf-8?B?ZHlvZGhBUzJRL3R5Nyt0eGJUR0lob2M3eDdtOUJhSnpEaFl2SHFLemdKZS9l?=
 =?utf-8?B?MWU5SzZFWU9DV0ZueDFKSHE0TUViMlJlSmlPSHFOdlMyU0xJNDg1SXRDTzZP?=
 =?utf-8?B?QkdldldDTHAramprYkNRd2ZKR05nSk5GbysrbFROM0Q0cURnWmJpWFF0S3hr?=
 =?utf-8?B?MEJ4NXhRSENBb1pBSFhIc1RCRlByenRHdEV6VDF5WE9kUHg4M1QxeVlnNUF4?=
 =?utf-8?B?US9WcVMrTWVCanZSdlNnenRZdk1SRmtRa0xVL0dvNURlOVUzQU1CNzJrcFJQ?=
 =?utf-8?B?R21zQWYrWTN0RnIwQWtZMUtJQUc5enBaSml6dDZtSktDU0hud1I3eGRTUGlu?=
 =?utf-8?B?ZDJLbmlYQVlxbDArSTBPZFdjQmJ6YmU1SlZKQ0l4VVpnbXlVVlRXZkcwY2Ny?=
 =?utf-8?B?TkgxWkhIUkF2eDlxV3Mxd1VONTNFMXdLbzRjZkZCZTduS0JkaDkrdjl0WXcz?=
 =?utf-8?B?dDVRYWIrMzdwVDhnclN1a0h1SVR1SEN4djA3czBNRVJxclByRlRrV0FEdkZE?=
 =?utf-8?B?ZHJqckxEaVhFcHJGTHVQS0RFWDlOUWwzNzVXVWMyRUpnL0JGdFJkSEhSNk5v?=
 =?utf-8?B?VU4vaEdlb1B2ZTVVQWwwU3RFWmRhdmpnb1ZFSk42a3pqMlM5UTZkZ1ZpRXR1?=
 =?utf-8?B?S1JCd3RlbWJvdSs1WmNUYjVCMkNNbDcrWGcxbDRpQmF1YjA1alZXbnBkZmow?=
 =?utf-8?B?Z3JuZ0l1dmpuaFowODNXRkdtVGJkWGlNZStCVFdRWXc2YnhYRTIyYVNBdkRa?=
 =?utf-8?B?SEozWDN3UHdnb2lUK2JuMzB6K04yMTlEdkJnVW1sSEpkdTlmRWxCRk1RUW9F?=
 =?utf-8?B?bTBYYlh2T2JQQjdwYUNDcDI1MnJNOHZwcVBEdXRZbDRZL2RiZUNhWHR2ZXFw?=
 =?utf-8?B?RXNCWCtYS3dCYlluSzViUlRkQWxGV2VZc1VIRFB5MkNwajNHMCtmZS9aa3pM?=
 =?utf-8?B?bkpVNTBTOTRlbDRNWkxCOHlyUDZkR29QZFBwbFVvbkhVLzloMGVFdXlRVjdK?=
 =?utf-8?B?ejd4YWpIN09OV2tubFFEa3JpOFZRbDVNeUx4cVhxb285OTRwLzJxbXZEbjZt?=
 =?utf-8?B?V0lDai80T3psT2lqSUhCOG1hL1NYTzErWi9Qc3h2dEdQSTFSaE53QndEZ0xo?=
 =?utf-8?B?aDB6NTh6ejFKOE1oMWQzNGY4T1BvUkZJSjlaZGZmdXlwbmtSaHRmK3lUdW9L?=
 =?utf-8?B?Y2llYXk5SnljUzZ2dDM4OWF5bFg2cUlIVE5Lc2pOK0FKN2FzSjEvTTcxamhP?=
 =?utf-8?B?YVJ2dkNjcHNSa0I2U1B4eHhZaU9zQkxzdGtCMU5xQzVCdVJSSVcwU0NMQW9T?=
 =?utf-8?B?Z3NHdEJJMzBaZ2ZZU1RiQURieEJNN244YjRZcktIWm9mbVAyT3dMUlB5N2hp?=
 =?utf-8?B?eFdyblVuVVVHa0FvZWpWS0JJZXM0aTljSEpNOENKMHNuUmtEVENiZVFoeFpZ?=
 =?utf-8?B?OUxjcE9qUzhJVG9rWTFNczM0dnZidHlReCtiL2pQNGpnMFFlVG1pU2hrWk5q?=
 =?utf-8?B?cmVDemhxTmgzamZzWXpJYkVvNGhENGlSNmpXTXBHV2VlQmdYSm53NDJQRklT?=
 =?utf-8?B?T3dFOFBPZXN5MWQ5dU5hUlMybm45VUsxUnozbk5CWUtjT1RkZjBWM1lVUHox?=
 =?utf-8?B?cWRJVy9Hc1dSUGJySDlsaithUUdPRHNnUWt5LzA3dUVFSllKTDJPdlJqUERm?=
 =?utf-8?B?Z00zSUR1bTJhZHBLbGI1Qmh1NjBUMlhINjFOdk9VeHFmNnN4S1lTQm16byty?=
 =?utf-8?B?YWRNamUwS0E5MUd6VUNmaVRldFlLYXlzUW5HeW1ZdDNIUlNhRTN1R090V1V6?=
 =?utf-8?B?WElqSldYK3N4TGs2MTdUcXc1cDQ4S094Wk1QNzAxd0QyMngyVUhnSGRmYWF6?=
 =?utf-8?B?Zi9JR285QXRXeXA0eSs4bnJaQVJ3a1NueGtDekZDVHFScjdyL05ZV0Njd0M1?=
 =?utf-8?Q?wDqRKU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTZnZ2Y1U0tpWDl6UnlMcEFIUDFGZXh2NDBVWE9ueVcwelZEUWl0SkhJQk55?=
 =?utf-8?B?dFpIcGt0dUhlYzFzYS9XS00ydUphY1pmZUZuWHZ6bjZBRk5LUER4aHkzMUdw?=
 =?utf-8?B?R0lmZ0NyNmwzN1BCZHNxWGNUN2lNWTYyeExlNDB5M1Q4QVdyd1NiVHZpNVEz?=
 =?utf-8?B?TThlVjFiYmQzdDdjMG5tVnloRlFuUVlqbGFXZ3pldXJZVi83UDZhRWltdXdz?=
 =?utf-8?B?aXB3WkgvSGlGcVZXV2dFbk5MTGZ0YWVYTVBQOGx4cHQyUVQ1ZUZmL2Rucmha?=
 =?utf-8?B?WENQSzdIRnF4eFZPcWppSkdGbElBSVM5Z054b2s3WmVkQi9ndUszYm1VUG5Z?=
 =?utf-8?B?MWVQdkl1eVZnN1ROelU3NExDeWZ0aVVCT3dDR0Q1UTljM1Noalkyd09mMWFV?=
 =?utf-8?B?ZjhQUk9sMVg0YjVNbWlNVEo5cDFkTG96eDN3cDkzNVB6S3dtOEdYY3QxdVBW?=
 =?utf-8?B?T3Z3Sm9PcmVKT0JZcERJR2JyWFNmRlRrclBFb1hkeFd2RTN5RTMwZ0JGYjVZ?=
 =?utf-8?B?RkNyQmxWOXhBblZnTlA5N2F0dFNRTzgrWWt0cThBTkxjUTkzeWIzVUxKNGFa?=
 =?utf-8?B?c29JZTIwSFIxUFB3VWR2R0ZhNnV2SHZZNFgzRmtPbnlzcnFwOUlWNmtrS3RG?=
 =?utf-8?B?Z283KzM3czRCMHBTNVZMYy90L0liQ1UvblplU1hTY0t1MHlUM0ZRMkxNTUUx?=
 =?utf-8?B?S1Q0aytOUEhkak1rWDhZOUdna1grZGdHTFhIK1AvV0hLZUNRUkJwOUtxTlVk?=
 =?utf-8?B?VlRSbXhoS1c4b0MrdjFaN0dualVka1NyeTVmY2VsR3pIM0xQSWN5YW0rVEMw?=
 =?utf-8?B?bnFyeStiTTdINmV0KzNIY0RhckZ6VHg2VHhhWk04dDFBZ1lSQXZXZnFFT3ll?=
 =?utf-8?B?SjJoL2dFWkNqdk00dXlhbG4yVE5aLzhYTFREWTl2VHVmdk5UUm9ickVkNlZj?=
 =?utf-8?B?Z3Nxd1FmcEYxK2dEaFhlZS95NEVPY3M3OUJsNzkzRVpTQXNRRFBtNkZMd0Za?=
 =?utf-8?B?bzRJSmlycEh6NXRqUElxOS81aXZBUTRWbU8yNlZCZU5zZjNkZi9va2k3TTRB?=
 =?utf-8?B?TWhucnpISWl5RHpxVzVDdWtzTlpScEVYU0dVTVp4NzY0QVkrV2JDN0s3d042?=
 =?utf-8?B?ZXVJMUxNT2t4UHNKelJDaGE4cnI3bStYZ0E4V0JkNXQzTEdLOEsrOTJjT2NW?=
 =?utf-8?B?WTFFZHh5d2NGNUR5WlhvcVJjdDZyTnZ2WXZvZFF3WUp2bmpldGh5ckc0TXFK?=
 =?utf-8?B?bDdrbzZSZ3pZVysyMUJCWllyS3VOLzdpWWthVlg1N01CL0lQN1RNMGhnNkt0?=
 =?utf-8?B?L0l0eWk1OFJpQ1VFdTBpd3owTHg5aklzZElOdFU1YVhUSDNFdXVVcG5VLytm?=
 =?utf-8?B?N3VnM2xWdGFmK3A3MEI4YmhEKy95NmF3Z3VvR3NKcjlBNFdKcUcrcGhDUmNU?=
 =?utf-8?B?eHBudUhwQnhsa3FpTk1BOFQ3SWtaZFJjc3pPZVFjL3BzMjRwbXU4MCtVY0tC?=
 =?utf-8?B?ZkhlUHMweGx2YksxV2EybU5nSjV0WWlUQXNKYlB6T2Y5bm1ubjlkVy95Rlpv?=
 =?utf-8?B?S0M5dU41VVBPNzd1Y2hwd0JQaS8zVjVZS0hneFpxZUpYVE9CeTN2UFpCT2FH?=
 =?utf-8?B?ZktCYVVkTkJFQTEweTAzbnVwTkNyZkdFQW5xVmtTZUkwWW5QOGh0QWV5bldQ?=
 =?utf-8?B?RDNFOGNMZUZXSXBEeXBCWjgza0JKZVVoSWxOQ21POVFLeEVJc0lKMkZ5ZE14?=
 =?utf-8?B?RUhaY1gyNGZBdkJTbjdMVTZwRzVDZlpnS2hqenRFM2dKQWZ2ZU5UcTc3Und1?=
 =?utf-8?B?Wm9uTHovaDhPcXdHVjk0bmNmdDJrK3JzMG12bHBTZktTSTBYeWVLaTFxYkVD?=
 =?utf-8?B?ZHd4YVB6ZXhlTGEvWkpSTlhoeWNHVWxvMmtWZWI5aDFoSUhhaFN6cVdCNWZ1?=
 =?utf-8?B?WDJKRlpzU2xMWnVRaFFRNFY1SmVvVEUyNGowV2NpTlJRMmNQUlJLNm8zZ2xj?=
 =?utf-8?B?SWRWZEovR3ZpVytEWkd1VFFPYlFMdmx3OXpHTTl5eWp2bGNtTSsyZ0ZiMXlz?=
 =?utf-8?B?cjJjQ2IzcWs3L1UreWR1MjRUZGk0amF3VlVWQmo0UFQ5Q0tJRmpoMDlTNmdq?=
 =?utf-8?B?UWVrcnJJYWd6M0VYNWtUSGRCcThNeXgweksyTkl1ZkVlcXNxa0NkS21LS0pR?=
 =?utf-8?B?ZEZpRUt0T2lva2J1eE41WkhYTFlnQkpjTE9wV2Z4aGpQTm5kT3JmNytGc20v?=
 =?utf-8?B?MUtSTk9OYzd3Tk4zY2Y0SGlWcm9HYmFkQk0yMHF4MmI2S1lqZnBVM0dSbkgv?=
 =?utf-8?B?cVdRYm8rKy9URFpQb3VVak9MN1JqQllEb21UZUxabDduNXVCOUg2blZ3WVpk?=
 =?utf-8?Q?amwHKPfugNYZxowU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3aaa15-1ba9-4fab-0e70-08de73c399e7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:41:47.3936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0qNuYy0vVPjh9bB0vBdRuAkDasQkak3zheKpZObOXn8JkM+fi6sEu45BdKiV7tvg2TRw5NX1OsKfbMgt/SNQc7p/UrDTGE6wsfQqshU4hQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6137
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=V4xwEOni c=1 sm=1 tr=0 ts=699dd4ce cx=c_pps
 a=2EcEh/UKxA6NVIT+L3iE4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=bh8TNNHQAt37JUTHP48A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=B8ibFTVmAAAA:8 a=U4bJL0bbH-c7lZKoj6QA:9
 a=8IjnMm3XMbdidFvT:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=xvSgdcfEVHFitugM1GHH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEzOSBTYWx0ZWRfX0WkQWHpUCV3S
 6p343iEmk4ilZ2G9hw5k1b6VwwCsSnbrEan8yGoIzlamgY78Rnq2x70c9dm6Uj9Dx45h4vP/iq3
 ugjM/3MCGNH+XsVSirQVpZGBJlPYEeUs7YhwwBB/sF6zg4JWPU57aFrkXBaK3aLerYRnyLkc0tL
 o67xut9FLCKDaPb0Buu5ElJ+xKvvm4hRu5p2khZr2jV+ETLoJ1j1Gau32b7znklvKrXzJ4yx23n
 R5OYz/lkfRQ3Orbx33WKfqryvugYaGzYxCV/nUd2BvhiG3o9Lut3EzkoB76Y32JYOcUHA/iAusF
 cGWlkgdaKNybiuBo31kyb0nCMjTPyx4IgGkNZOKBbijmcb2VuYkPlOr6Ux71RRFyymVVTtvmGq2
 zQxNthoSX8pibq3EWBFcKCCbYEhGVOuNI/ymiGfV04pHaS3jFGI1W6hmLGlboKgWo8W6S1hBUIB
 vAFjIvtN4ExNbokiiUQ==
X-Proofpoint-GUID: amYuT2aie7bvd9WHFo-hT-upFdY2CsQV
X-Proofpoint-ORIG-GUID: I_XoZc9JVDD73lOmoJE9ggef-CWPkNBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231890

--------------052xGlfE7mSrypMj0dQTL8yK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61OC0Wik1497801

Hello Wang, and everyone,

Alex mentioned in the YP tech call today that he's on vacation starting=20
tomorrow, iirc.

Alex,
 =C2=A0 =C2=A0 I assume that you won't be sending a patch series for the=20
succeeding AUH upgrades.

Wang,
 =C2=A0 =C2=A0Have you or do you plan to work on that?

If not, Hongxu and maybe others at WR will work on that.
I'm going to focus on the failed AUH upgrade set of recipes.

../Randy


On 2026-02-18 1:41 p.m., Auto Upgrade Helper via lists.openembedded.org=20
wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *python3-rdflib* to=
 *7.6.0* has Succeeded.
>
> Next steps:
>      - apply the patch: git am 0001-python3-rdflib-upgrade-7.5.0-7.6.0.=
patch
>      - check the changes to upstream patches and summarize them in the =
commit message,
>      - compile an image that contains the package
>      - perform some basic sanity tests
>      - amend the patch and sign it off: git commit -s --reset-author --=
amend
>      - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this=
 time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/upda=
te failures.
> Any problem please file a bug athttps://bugzilla.yoctoproject.org/enter=
_bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
>  From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Sep 17 00:00:00 2001
> From: Upgrade Helper<auh@yoctoproject.org>
> Date: Wed, 18 Feb 2026 13:46:27 +0000
> Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -> 7.6.0
>
> ---
>   ...dflib_7.5.0.bb =3D> python3-rdflib_7.6.0.bb} | 25 ++++++++++++++++=
+--
>   1 file changed, 23 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/python/{python3-rdflib_7.5.0.bb =3D> pyt=
hon3-rdflib_7.6.0.bb} (34%)
>
> diff --git a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb b/met=
a/recipes-devtools/python/python3-rdflib_7.6.0.bb
> similarity index 34%
> rename from meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
> rename to meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
> index e421aa2bac..1b830e8aa9 100644
> --- a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
> +++ b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
> @@ -1,10 +1,31 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upg=
rade'.
> +# The following is the difference between the old and the new license =
text.
> +# Please update the LICENSE value if needed, and summarize the changes=
 in
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- LICENSE
> +# +++ LICENSE
> +# @@ -1,6 +1,6 @@
> +#  BSD 3-Clause License
> +#
> +# -Copyright (c) 2002-2025, RDFLib Team
> +# +Copyright (c) 2002-2026, RDFLib Team
> +#  All rights reserved.
> +#
> +#  Redistribution and use in source and binary forms, with or without
> +#
> +#
> +
>   SUMMARY =3D "RDFLib is a pure Python package for working with RDF"
>   HOMEPAGE =3D"https://github.com/RDFLib/rdflib"
>   SECTION =3D "devel/python"
>   LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D7006e973486c4700556f6d58cba0=
ab6c"
> +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae5=
3a3e"
>  =20
> -SRC_URI[sha256sum] =3D "663083443908b1830e567350d72e74d9948b310f827966=
358d76eebdc92bf592"
> +SRC_URI[sha256sum] =3D "6c831288d5e4a5a7ece85d0ccde9877d512a3d0f02d7c0=
6455d00d6d0ea379df"
>  =20
>   inherit pypi python_poetry_core
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231360):https://lists.openembedded.org/g/openembedd=
ed-core/message/231360
> Mute This Topic:https://lists.openembedded.org/mt/117879875/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------052xGlfE7mSrypMj0dQTL8yK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hello Wang, and everyone,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Alex mentioned in the YP tech call
      today that he's on vacation starting tomorrow, iirc.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Alex,&nbsp;<br>
      &nbsp; &nbsp; I assume that you won't be sending a patch series for the
      succeeding AUH upgrades.<br>
      <br>
      Wang,&nbsp;<br>
      &nbsp; &nbsp;Have you or do you plan to work on that?<br>
      <br>
      If not, Hongxu and maybe others at WR will work on that.<br>
      I'm going to focus on the failed AUH upgrade set of recipes.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2026-02-18 1:41 p.m., Auto Upgrade
      Helper via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com">
      <pre wrap="" class="moz-quote-pre">Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rdflib* to *7.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rdflib-upgrade-7.5.0-7.6.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler</a>

Regards,
The Upgrade Helper

-- &gt;8 --
From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <a class="moz-txt-link-rfc2396E" href="mailto:auh@yoctoproject.org">&lt;auh@yoctoproject.org&gt;</a>
Date: Wed, 18 Feb 2026 13:46:27 +0000
Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -&gt; 7.6.0

---
 ...dflib_7.5.0.bb =&gt; python3-rdflib_7.6.0.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.5.0.bb =&gt; python3-rdflib_7.6.0.bb} (34%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
similarity index 34%
rename from meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
index e421aa2bac..1b830e8aa9 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
@@ -1,10 +1,31 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  BSD 3-Clause License
+#  
+# -Copyright (c) 2002-2025, RDFLib Team
+# +Copyright (c) 2002-2026, RDFLib Team
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = &quot;RDFLib is a pure Python package for working with RDF&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/RDFLib/rdflib">&quot;https://github.com/RDFLib/rdflib&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7006e973486c4700556f6d58cba0ab6c">&quot;file://LICENSE;md5=7006e973486c4700556f6d58cba0ab6c&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0ac0171cee5250c44d7d49847ae53a3e">&quot;file://LICENSE;md5=0ac0171cee5250c44d7d49847ae53a3e&quot;</a>
 
-SRC_URI[sha256sum] = &quot;663083443908b1830e567350d72e74d9948b310f827966358d76eebdc92bf592&quot;
+SRC_URI[sha256sum] = &quot;6c831288d5e4a5a7ece85d0ccde9877d512a3d0f02d7c06455d00d6d0ea379df&quot;
 
 inherit pypi python_poetry_core
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#231360): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/231360">https://lists.openembedded.org/g/openembedded-core/message/231360</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117879875/3616765">https://lists.openembedded.org/mt/117879875/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------052xGlfE7mSrypMj0dQTL8yK--

