Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D73C02181
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 01:42:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1927.1737596530972653119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 17:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31187c3c42=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N1M6AP007892
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 01:42:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3h7tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 01:42:09 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50N1g9o0004800;
	Thu, 23 Jan 2025 01:42:09 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3h7tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 01:42:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfIiJK9MyR49c2JOJKZyA4Q6eLcSjf+3iieDMwin3WxXnJnZqRlwJcS7KKwQHpHfPHNPmKW9N0BdN+ogiwUR8aghAac7Q5yoorOP6eHW+L+n1MrXCD7lELfEEgBiY6kDLW1UJoij2ZjjwiOZMd2Wg9riSSyk1I3f/jo1MOM/lL0sPUdO7NBguL1WTHvA1+E5BMg+A+7C3o5nJZpzOyGltrV39lDkythU7rZbxslj5gGPf3lv6d82jyNC8zT0XN18l3pVuUyXHNO1qKGy2GTVCTy9ui/I3OUWtxSXvme95S4+jQtYx8M6PXmfl3UxNciqGppet9KAN3s/4M92ZerHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTQCxVpjdweHOSusbxg0I3oVB3QqJWJPx8TQKR33THU=;
 b=b7QhE+pp34kM2CgqDJzwEiwi7FKPir16cN30ptPZZDyUEIOM0M8gjP2bOWiluHK1+484n/XStdQbh0253Iwk1Hk3FLLCqd+MnQtwZUrmJrkRyOaP2tWUuvKmQGCvfKI7WimBuJ3pgwZf0/yTdXb12grq0wOG0/lH24G/qLwZ/OlkpsU7nRhCLVXHbDgPgEwZ3lyXXnKmyfE7PeLIXnuyxulZ8WrYORwRbmIhEXq0rVgnBRoMz0aX+el7LhFwV/J0fusReoUlR5UPJcZcMxthOpdl1G+ByTR6lA8Bt/vKt7gbX71QCcH+ux7jz1PulMNFqq0jo6fUruf7z06/FH4AVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 01:42:06 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%2]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 01:42:06 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>, Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Li, Changqing"
	<Changqing.Li@windriver.com>
Subject: RE: [OE-core] [scarthgap][PATCH v2] boost: fix do_fetch error
Thread-Topic: [OE-core] [scarthgap][PATCH v2] boost: fix do_fetch error
Thread-Index: AQHbXY5W2nKiPMhdiESqUfJGtEoq4LMUHRfwgA8LNACAAIwmUA==
Date: Thu, 23 Jan 2025 01:42:06 +0000
Message-ID: 
 <PH8PR11MB69288AB2D3D80B25FA6F0189B8E02@PH8PR11MB6928.namprd11.prod.outlook.com>
References: <18171087FD41F9DB.21892@lists.openembedded.org>
 <PH8PR11MB692814CBFE4AA3DA53E554A4B81F2@PH8PR11MB6928.namprd11.prod.outlook.com>
 <CA+chaQerqQ1tszNDTDGJ4T5qR4cDDw46evFhPYawWpYggPq1aw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQerqQ1tszNDTDGJ4T5qR4cDDw46evFhPYawWpYggPq1aw@mail.gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|MW3PR11MB4698:EE_
x-ms-office365-filtering-correlation-id: bdaf809a-fdcb-4fd3-3fe5-08dd3b4f24ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|10070799003|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RFJCeEIrZHh0QzJ0Q3IwS0R2K21PUWhHRStsSFBBcjY5S3kyZHFKeWx5eGZ0?=
 =?utf-8?B?Tzk1eUxrK3E4UHBzRUFzdUk3WE9IaHp0S0c3WXcxKyt0RnRRaGNVWFBsWHhr?=
 =?utf-8?B?SlRRTkQ4c0VFYytSQUU4cDUwLy8wQUtDTmdRMnNHaDMxd1NLZ2VnV2dmSmVK?=
 =?utf-8?B?Wmx6UWkyREVqWTdRS2Y2UWZ0NG02Z2lHVjVuS1R3YWVKeFhac3BvVjQrcU4z?=
 =?utf-8?B?bHB3SDhMVXFPSW9JUzdxUUxZQlFNcW9IMzRzRk5DZThHTnVMR2pJYlpEOWhj?=
 =?utf-8?B?aExDalkwa09BUmNZVndjbGJ0K0tNbHBSTzBleFQzUnZuMlRtQXVMNWozQ0ZP?=
 =?utf-8?B?UVlEUlB4VkFTSnhrblVhaE5qR1Bsd3kyN2dWVFZEK3pnT1FQTmhmSjVKVGhC?=
 =?utf-8?B?eHlGc3UzTWJka2U1aEJsQ2tIMktleUJDTlRSQ1dodDloRTJMenVNN0NJbXFS?=
 =?utf-8?B?TGVHbFA1L2NZV0ZZQjZad2J1eTBRVFZpTDhXd092OERZZjQvSTJ6YWdZYVRQ?=
 =?utf-8?B?QjBXN2pUdENSSXdFMWQxWjBFZ0V5TXRLcHJSLzY5V0VpM1J0bVpYN0lncWxv?=
 =?utf-8?B?Vmw0ZzhIbksrek1HUTdRWFF3d1Rqa2lPYnZJeXpiYk9ObStOeEFvWVlyeXNu?=
 =?utf-8?B?NldUMkwyTjNXdW1qN3E2aTdNNEhXSUpjV0RjQ3E4S3pIbU9uWXJDZkZmTDc0?=
 =?utf-8?B?em5zL2pmTkNML3hQaUFTTTZqU085a2RsT2hhMDJiMk9UN1JqNjk3Z1BKcHhC?=
 =?utf-8?B?TUdzTXVIWnFaeU14cDZxSzArNk9ubEg1LzNqY0tPTWFZS1kzWXNjamhJTTVT?=
 =?utf-8?B?MWx3NXI1NE9VZ0dKZmErM1JWc0lqNVlPYzhFdlBNVU5XNGxMVTF1NUh6eHcy?=
 =?utf-8?B?WllYNTg2YTZnTEZZQk9lZ283MHVPM2FSTlVHb25uTGVxSnd4SnNNNjJrTFlw?=
 =?utf-8?B?R05INFcvakFBd0FvaU8wVHRmbyswY2dsTHFPbHJJcEhLVHJWUmFxdzl0UGJO?=
 =?utf-8?B?bUNCWWpXem5zQmt3TXVRZ0YyWG5aelF5UG03MERwbElCL041MjZiY3JwVlky?=
 =?utf-8?B?clJRcEFVT1BwNksrWGd2RXFrZDg3Z2RkM2dGY0dPeVRhNXR2bUxpOUdSS2U1?=
 =?utf-8?B?WVZibEY3Wjg0ZVJaWDd0UXNIMm5pYi8yQkROWTFTZnduZ0Fta1VMSGhZOHpT?=
 =?utf-8?B?LzMyQ2RVVzgzL0lIOVNyN2xTVVBHaElWRzVVNUNhSHpKZnBLYTBlQXB6anFW?=
 =?utf-8?B?ZDdWVHJCb0ZpVE05MG5XQzRndFdVKzh3cTI3cVhxcHdkdExwMmJldVZSMnMz?=
 =?utf-8?B?MDU0WjBjRVVYa2h6Z1RxelhJa2tGV3BhYy9ibzcxSGpWeUxRRktxa2NzVUxL?=
 =?utf-8?B?LzFxUGlwMVFnekFva2VMM2t5SFhaR3lRV2xxN3Y0VnhBZnlmcER1Z3RycmdM?=
 =?utf-8?B?NFFWWWhSRHlkLzdjOGE4ZjNhMjY1M1RjUWh1K1NGWEM5RlNyYTBZY2hpa3FM?=
 =?utf-8?B?akErRDZ3WjFTWWhpeXBHendObGFiSW1kcGgwcTRHa05vamRxVnNKTFVHSmMv?=
 =?utf-8?B?UVVoaFFXclZHa0E5Wi9PeFV6S1FiSmN6cTFVK004WjZlT1ViZm8rbldqdGI3?=
 =?utf-8?B?NGhIMlVRRm95b1hjUVo5OUdYZmhYaEh5dituejF4OFdSelZlRWJ5UGt5OXJj?=
 =?utf-8?B?aXFpNkw5Z2drM0Fqa29FK3NORktjODl2LzB4eXFjMktEWE5HQkZTZ1MwaE8z?=
 =?utf-8?B?UkQwTVFrSWVvK0xiRUwyeTlkajdaV25YdCtjaHl5RmtvU1R2bmF2cGtqQyt3?=
 =?utf-8?B?WXY4cFUzTlBGbHV1aFpHemhlTC9LUE1nYnBJMjFKcGc2MTRoOHE5TWVGVm1I?=
 =?utf-8?B?TlpDYzJ2T2dVRVQvS0NFc0I2Z3hDY25wQjJYVCtFTW1QUUE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(10070799003)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MHYyNWx4RGRXMUowV0FjQldncjBjNUI5cWZ0TjhxYjFWbno1Z2dpWlB5Ym54?=
 =?utf-8?B?NXhueklkSmNIa3hrWnhUaVVrOGoxYmN5b0hDWjBoTlEwdURmWVJFTFE5ZThp?=
 =?utf-8?B?WThJeHZkSUNoWmNYY0hiZUZyaWNBV0E0cExZNCt6VUhEbXpyV1JKL0dLVGNH?=
 =?utf-8?B?dGp3bFNMa1I0eDFseXVxbytEeko3aW5iY2R0bFk1TUU5Z2lSVGNUZkw1RjBG?=
 =?utf-8?B?ZzlSdlZEcm9VTUUxOUFhVFZCT1NuaDhsQ1lqeVBuaGZMM1ZOOFVKSWYwM3NP?=
 =?utf-8?B?T1F0ZWFJdlcwRkJuZlgwQnNNclROcERlY3VvRml1ZDFBTkZzUGFFaE5YZ21E?=
 =?utf-8?B?ODM5L0RKV1M3clN5di9lRW1hWW9TQzZxdEJMZVJvd2FvZXVQUlh5S3hiYXJz?=
 =?utf-8?B?bU5mQzZBS2xiQXJpNXgxMDZ4T0hpbERnNnJKd2l0RGRtTzFHakZITUFEOXNu?=
 =?utf-8?B?YS90N2l4azU5MFBvekp0YzdKalJJZlhnc1F5MjVTeVhoMFczcmF6WTdtTGI1?=
 =?utf-8?B?d2ZFRzNsTlY2VWlMdC9KTFpvUjl0WGpLNGhiSzZzY3ExWXA2WmVmcEhmOVpj?=
 =?utf-8?B?R1lTb3JKTFpkRWxsZmk0T3d1UFB2VkVwZXYwNG5EdzQ2dklLTG9mYVlGQXFy?=
 =?utf-8?B?c1poaXM4Qm85bUpOa0tTcG9hTTRtazJDQytYeDBHZEEvaENFTWwrUXBJd0Rs?=
 =?utf-8?B?UlV3YndRNExVWWcyRUt2b0x2cjluQ1VBWGtVTk1tWnYvaENzWnVuSEtUN0RU?=
 =?utf-8?B?Qk52dCttUk1qaUlCYnhFWFpiR3JSVXVBdnpkczN0WmJtVFZWRVRHU2wrOEVv?=
 =?utf-8?B?NUhzWlhUa3N4Wi8zK2dJMU5nUEVVekVWTktRN0Jwa0tsbnhXbTd3N2ozUm9S?=
 =?utf-8?B?OE5Kb0lZditRQ2hlbzBBRXFWVVk2THpha2s1RDdxYUJDek1DTzcvMXBGd3U4?=
 =?utf-8?B?Z29TVVFHWGtVenY3N09zY2RHUzhickVnZTFxTWRTckxYdDNiK1U2eTYwaFpj?=
 =?utf-8?B?a3BkZHFxN3dMUlpsTWk4K0p4aGo1MkdBRllPMjlhaDJiZTRnM3cyOU4xU3JH?=
 =?utf-8?B?anhHQjJxUnBCU2I2bFZ3OC9vNTlnYk5wUzBVc2V6T3BLMUFoNlZlTXpGbndV?=
 =?utf-8?B?a1FST3QyMGI2clJUSEkrVXRJYkZKK1pRb0lHdUtpVldFb3ovSVlGdVllZGta?=
 =?utf-8?B?c1o1OTBCRDJiWHllQnU4OEdTYU9QQUlsVDA2Qm9CdWtuVHY2OUROa3J0OW5x?=
 =?utf-8?B?bStIZDVlZGg2WmxGVXQ2WTE3YWE4N0FlY1dkTlhpd1doZWFBSWh3SXFWVERC?=
 =?utf-8?B?bEpobWt0NHI2MnVKMVQyTVRRSlA1d2hWY1NVTktwWHdyNElaZ1BvYTlIMVhK?=
 =?utf-8?B?dHpyOHFwTGg4VmdudjhzSWhHOU9GU0FzUnNYeDVXbkZHUlNNcm0za1pCdkJW?=
 =?utf-8?B?a0xWQ24xWldRd0MyQnNQT1VvVEhUdlAzdGV4Rks0QTZkZ0VkNkV3Rjc2ZkNN?=
 =?utf-8?B?M0hpb2NmU2RqRFJCZHJ5UndHRVN4MU52bzBmdGoxZVFFcTNRQ3lFNnRZa21i?=
 =?utf-8?B?U2RwcHV3NHNZYjZmdm5kVkZhK2hpeDVWYThPSllmRUZEaVVjZ1BrUHdlNnQy?=
 =?utf-8?B?NnhOWXluNGtYazRza1AxbEp6QmZrMmY0TUYxeThXWTZndUpmYVM2enkvTlk4?=
 =?utf-8?B?eU1rY1YwYWk3T3psNHlBY3dob2x5enRXZWNMYkw1Rm81Qlh4Q1NPalo5Z1di?=
 =?utf-8?B?aUlLQVpib3k5SVBNU2JwYkVTc09ROHpJdlRvTmFWUjZOaEtXeDZtR3ozVnVG?=
 =?utf-8?B?RTcrMzQxalVDREN1eEo0VnlYeXF5NjNpc0JFMDJadGdrNFlhclNCWTRKMHJZ?=
 =?utf-8?B?MU1RVmo1MldzWjVrK21qU2NkSWh3eFNlVklpSXlwUi9nKzR6MTlJam40VlJD?=
 =?utf-8?B?Z2RpWGhaMmpzTXFKUkRuSjN4d0RzeUdFZk1LTzhuMnRZQzdaWXIzc1kzY3Jr?=
 =?utf-8?B?OTRCQ2U5bVVOTVc3cWJZU05YMzJYRUVQdk1MYzVoQUIvMWhNT1E3WkNFYkQz?=
 =?utf-8?B?VjU1cU5TZm9uN0FjNlhiZnZHT2Z2S2NGTzF2Y0RaN05Fc0h0NG1yY3pDZWR4?=
 =?utf-8?B?Rko5amhDN3hzbVJZay9EK2xBbk84Sm94WUVIUWNVM0lQV2x2WjRDNTVla2lZ?=
 =?utf-8?B?UFV4MFZVN2R3ZjZ1dlJmZzRFeWhHMGdhZ2VVUkVUVlhQUDJHWk8rUEN2OG5M?=
 =?utf-8?B?YkUrMDYrbFJzaUJGb0kxSkFJZmVnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdaf809a-fdcb-4fd3-3fe5-08dd3b4f24ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 01:42:06.1617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmjCZNmbpQPEcfolqCiR3/Bkyc42iCJa+VY+vkJ68NzlbopB4iFsIDr+d1S0ckAm8NtmwUnRvK3lEJOTOAYwkXu7V1KXtOQS5w5qMIjPrM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Proofpoint-GUID: 83Ra4vAYd94MBgElUyCoOnaGkcMzZs-_
X-Proofpoint-ORIG-GUID: D9fqqKM63mRiR4VVgWSkH8hXY6bS0DsK
X-Authority-Analysis: v=2.4 cv=fZVXy1QF c=1 sm=1 tr=0 ts=67919e71 cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=1XWaLZrsAAAA:8 a=ovJmrJClAAAA:8 a=gvic6WYWAAAA:8 a=AIPdC31oAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=bLZqKDXHAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=QEXdDO2ut3YA:10 a=brTEhlvMp4NY0_u118I2:22 a=PupUpSa0FqD61Tkl4dNl:22
 a=5478VIVnyzLWgM9zoUhq:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22 a=SM0NOtVXJcAQk9PFKD3C:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_11,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 01:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210163

VGhhbmsgeW91IGZvciB0aGUgcmVtaW5kZXIuIEkgaGF2ZSBzZW50IHYzIHdpdGggdGhlIHVwZGF0
ZWQgdmFsaWQgZW1haWwgYWRkcmVzcy4NCg0KUmVnYXJkcywNCkppYXlpbmcuDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFp
bC5jb20+IA0KU2VudDogVGh1cnNkYXksIEphbnVhcnkgMjMsIDIwMjUgMToxOSBBTQ0KVG86IFNv
bmcsIEppYXlpbmcgKENOKSA8SmlheWluZy5Tb25nLkNOQHdpbmRyaXZlci5jb20+OyBTdGV2ZSBT
YWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnOyBMaSwgQ2hhbmdxaW5nIDxDaGFuZ3FpbmcuTGlAd2luZHJpdmVyLmNv
bT4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW3NjYXJ0aGdhcF1bUEFUQ0ggdjJdIGJvb3N0OiBm
aXggZG9fZmV0Y2ggZXJyb3INCg0KQ0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9u
IFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCkRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZS4NCg0KT24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgNDozNuKAr0FNIFNvbmcs
IEppYXlpbmcgKENOKSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8SmlheWluZy5Tb25nLkNO
PXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+DQo+IEtpbmRs
eSBwaW5nIGZvciBzY2FydGhnYXAgYnJhbmNoDQoNCkl0IHdvdWxkIGJlIHVzZWZ1bCB0byBleHBs
aWNpdGx5IENDIFN0ZXZlIFNha29tYW4sIEkndmUgYWRkZWQgaGltIG5vdyAoYW5kIHBpbmdlZCBo
aW0gb24gSVJDKS4NCg0KWW91ciAiSmlheWluZyBTb25nIDxqc29uZy1jbkBhbGEtbHBnZ3A3Lndy
cy5jb20+IiBmcm9tIFNPQiBpcyBub3QgYWNjZXNzaWJsZSBmb3IgdXMsIGNhbiB5b3UgcGxlYXNl
IHVzZSBhY2Nlc3NpYmxlIGUtbWFpbC4NCg0KSSd2ZSBzZW5kIGEgdmVyc2lvbiBvZiB0aGlzIGNo
YW5nZSBmb3Igc3R5aGVhZCBhbmQganVzdCBnb3Q6DQpETlMgRXJyb3I6IEROUyB0eXBlICdteCcg
bG9va3VwIG9mIGFsYS1scGdncDcud3JzLmNvbSByZXNwb25kZWQgd2l0aCBjb2RlIE5YRE9NQUlO
IERvbWFpbiBuYW1lIG5vdCBmb3VuZDogYWxhLWxwZ2dwNy53cnMuY29tIEZvciBtb3JlIGluZm9y
bWF0aW9uLCBnbyB0byBodHRwczovL3N1cHBvcnQuZ29vZ2xlLmNvbS9tYWlsLz9wPUJhZFJjcHRE
b21haW4NCg0KUmVnYXJkcywNCg0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIA0KPiA8b3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFNvbmcsIEpp
YXlpbmcgDQo+IChDTikgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogRnJpZGF5
LCBKYW51YXJ5IDMsIDIwMjUgMTE6MTkgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IExpLCBDaGFuZ3FpbmcgPENoYW5ncWluZy5MaUB3aW5k
cml2ZXIuY29tPg0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW3NjYXJ0aGdhcF1bUEFUQ0ggdjJdIGJv
b3N0OiBmaXggZG9fZmV0Y2ggZXJyb3INCj4NCj4gRnJvbTogSmlheWluZyBTb25nIDxqc29uZy1j
bkBhbGEtbHBnZ3A3Lndycy5jb20+DQo+DQo+IENoYW5nZSB0aGUgU1JDX1VSSSB0byB0aGUgY29y
cmVjdCB2YWx1ZSBkdWUgdG8gdGhlIGZvbGxvd2luZyBlcnJvcjoNCj4gV0FSTklORzogYm9vc3Qt
bmF0aXZlLTEuODQuMC1yMCBkb19mZXRjaDogQ2hlY2tzdW0gZmFpbHVyZSBlbmNvdW50ZXJlZCAN
Cj4gd2l0aCBkb3dubG9hZCBvZiANCj4gaHR0cHM6Ly9ib29zdG9yZy5qZnJvZy5pby9hcnRpZmFj
dG9yeS9tYWluL3JlbGVhc2UvMS44NC4wL3NvdXJjZS9ib29zdA0KPiBfMV84NF8wLnRhci5iejIg
LSB3aWxsIGF0dGVtcHQgb3RoZXIgc291cmNlcyBpZiBhdmFpbGFibGUNCj4NCj4gU2lnbmVkLW9m
Zi1ieTogSmlheWluZyBTb25nIDxqc29uZy1jbkBhbGEtbHBnZ3A3Lndycy5jb20+DQo+IC0tLQ0K
PiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QtMS44NC4wLmluYyB8IDIgKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QtMS44NC4wLmluYyANCj4g
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC0xLjg0LjAuaW5jDQo+IGluZGV4IDVi
YmVhMmJhNWIuLmJlMWFkMjBmNDcgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2Jvb3N0L2Jvb3N0LTEuODQuMC5pbmMNCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9v
c3QvYm9vc3QtMS44NC4wLmluYw0KPiBAQCAtMTEsNyArMTEsNyBAQCBCT09TVF9WRVIgPSAiJHtA
Il8iLmpvaW4oZC5nZXRWYXIoIlBWIikuc3BsaXQoIi4iKSl9Ig0KPiAgQk9PU1RfTUFKID0gIiR7
QCJfIi5qb2luKGQuZ2V0VmFyKCJQViIpLnNwbGl0KCIuIilbMDoyXSl9Ig0KPiAgQk9PU1RfUCA9
ICJib29zdF8ke0JPT1NUX1ZFUn0iDQo+DQo+IC1TUkNfVVJJID0gImh0dHBzOi8vYm9vc3Rvcmcu
amZyb2cuaW8vYXJ0aWZhY3RvcnkvbWFpbi9yZWxlYXNlLyR7UFZ9L3NvdXJjZS8ke0JPT1NUX1B9
LnRhci5iejIiDQo+ICtTUkNfVVJJID0gImh0dHBzOi8vYXJjaGl2ZXMuYm9vc3QuaW8vcmVsZWFz
ZS8ke1BWfS9zb3VyY2UvJHtCT09TVF9QfS50YXIuYnoyIg0KPiAgU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImNjNGI4OTNhY2Y2NDVjOWQ0YjY5OGU5YTBmMDhjYTg4NDZhYTVkNmM2ODI3NWMxNGMzZTc5
NDljMjQxMDk0NTQiDQo+DQo+ICBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3d3dy5ib29z
dC5vcmcvdXNlcnMvZG93bmxvYWQvIg0KPiAtLQ0KPiAyLjI1LjENCj4NCj4NCj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRv
IHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMjA5NzAwKTogDQo+IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjA5NzAw
DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEx
MDQwMTI2OC8zNjE3MTU2DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiANCj4gW21hcnRpbi5qYW5zYUBn
bWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQo=

