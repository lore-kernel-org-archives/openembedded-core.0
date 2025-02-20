Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79954C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 12:46:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.48171.1740055546456262452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 04:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4146f1a53a=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KAFkVT006055
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 12:45:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00jabb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 12:45:45 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51KCji0p030629;
	Thu, 20 Feb 2025 12:45:44 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00jabb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 12:45:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMCjVVhb6MUGaU4Hh+8mbuqAowZW4Z5tiW6P9jR9+zrSYd5rvGKkX0gjbfVxpAjy2a08AOnFpfUt/prumdzgh2W07QhuyS849LnzjLBFWV+hEAJk8lvKAd2hboS6eLYxYYb9M5FOJunNvXJDUsQaHJ2YpjC4E8kVC1zHp59J2bmhSfYUB4O9iKcQjXoKeqWd9KVzrOAynrtJAQBzazwRLCln6pYNTCUU0lDax/ChkX2oVq91cSafDpxX4N+e2+ORb5VZ9jbk+NcIWljXLxUWOcRlY5VuMriynmoYN3F6l1yavfNujaic6ooOrDvOQnJrlBFHencrUMWC28n+JPg4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArBr/8Ye80Rivp1na1nJfXe8ZQFcMJymHZMufOekB4s=;
 b=pp77wPyS2uIQneBTkaYkguVGzAft/nDZpG5ANxhfbFHiSASmgKGkqCN5XiU4vZ1wSK3m/yoBd/2HcW//iYqnsI1nXSXDpgfhxXQX7AR81+wcKYf85pvETTte5p7pmMMuTMUJI0vgSts1Gr9NBsxyZlc80w3nCg8susK/OIBlYLg0kdW/nqewCW7WZduZHiVc+Cyhz+u4tTOGCb0f3aOL9DJGsqb/eYUl7QPdFCyCcDH1wPVQgSS2bLDal7yyeENNlpQhccKKhnglJde6qK4fYMKV6RfktbSDtq6aDseUFU+CNXY6MOaD4+rNzLyIXj3fcFLm+hhT3bSeEoyifO68xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 12:45:41 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 12:45:41 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2] debugedit: fix build failure when enabling
 DEBUG_BUILD
Thread-Topic: [OE-core][PATCH V2] debugedit: fix build failure when enabling
 DEBUG_BUILD
Thread-Index: AQHbg1BR31m/JRukA06tBafBlzftbbNP/bOAgAAmT7A=
Date: Thu, 20 Feb 2025 12:45:40 +0000
Message-ID: 
 <PH0PR11MB5611191E4D34126BB264C9BEEDC42@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250220043120.2347746-1-Qi.Chen@windriver.com>
 <CANNYZj8+28Hc-=kUMarP9V+xJ9RJfrL1kZj4stH5At=gB9xgvg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8+28Hc-=kUMarP9V+xJ9RJfrL1kZj4stH5At=gB9xgvg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|SA3PR11MB7556:EE_
x-ms-office365-filtering-correlation-id: 2be983e3-f814-4133-92db-08dd51ac7b48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cFNtTmxvUXRxSFpPcWxvaW9aSEF3M1daWWkvSlNVN0lzc0xSZUZEQTZpeER4?=
 =?utf-8?B?N1g5Y2p6eDc0WmQ2Mnh6Q1dUKzY5RTFxRlZPM1NqMW1oV20wK05hRDNEaDdS?=
 =?utf-8?B?aFhmNGtndXg5Vk5USU9XUmpjZnZlTnpVVW94RnovWElxT3FQNVdtSFZyM1Rl?=
 =?utf-8?B?a0NybVRGK2RqNkZnVEdYWUkzVW9GRURNdG1wajZkd3JBUG40ckdnT2R5VUxa?=
 =?utf-8?B?d0pMb2xRUTNRZENmc3pWcElPOU9WNFpLYlQwZXJ6WmtyMDZrSzFmVk50elVr?=
 =?utf-8?B?QllETE9XeThWYmRYM0hLMlZBaUVzWTNBSEF0WS9YYTdaclQ0ZkVUbTJBZTNC?=
 =?utf-8?B?WXpzSm1LTVhDMEE1M2NxV2VhOHpUUTJLQk1LV3ZVQUFGcVBjdEo1Z1VEUk1E?=
 =?utf-8?B?UGQrY3BZQlYxeFRBVXE4aWlFTm1xaHNQamgyd0VyS0J2akpEYW9iazczNHZU?=
 =?utf-8?B?QzB0OUJqQXZ1TFJPb0xUdVExU0pxNldYeCtIZUY2VjZLMWV2dmF2UUpwdDBZ?=
 =?utf-8?B?Sm9LVVFBbnFveGlZbGhlYStwUU1aeitRK0QyVHU5NFhlMXAyUjlkWmw4dDlr?=
 =?utf-8?B?WGU4R0JyVXl0dnI1WFdWQmEwV2JmUFpYd1IxRzRRYUh3ZlFaU24xSFcrVlI4?=
 =?utf-8?B?RWtFbnBCZTF0aWd5WkJPaTNLcHkwcGZmNHkzL2RxdEtDYzUzSC9XSjQyY3dD?=
 =?utf-8?B?RU9NT1h0bWZYWTVwcENiamkyanZjTzhDWGVjeGVkUkxxbXk4a0E2NnJHK291?=
 =?utf-8?B?VVV6SkZ4NVVCa1hnTTJwVU9VT2FEeFQrdnNFbHRSTmtqYXE1WGtwWlhGdStP?=
 =?utf-8?B?YnNranEzemp4bmZBb0Y1MVhhZFZPU0lHQkVNZ1dOK2tRRVBNT014M1h6MjZj?=
 =?utf-8?B?LzFyV1FwSGxVTXFJQk5DNlc3aWg5ODU5RHdoVWE5RDdtKzJXQTR4OEM2enZ3?=
 =?utf-8?B?cVVEWDMyQXBhSm1rTjA2bDVGYlZQRlpXTTl0WFE3TWRhQURqVm9tRGpaWTBl?=
 =?utf-8?B?SWEyaUpvNU5jSE91eHovVVcwWGNHWkgvV3JzVUV5MDNpK2s4c0JFalJFRkZt?=
 =?utf-8?B?aGFXMnhUV09MY0FUYmg4NnpadkpaVnhqLzQxbXdURVFqK2psNzY2SFlPajdv?=
 =?utf-8?B?WUxwWHVjZjl4aldBU2x3ek9PdzZQazluOThwdS84OEV5SUNyNnZyYXBoT3NR?=
 =?utf-8?B?aUxNeTgyQmpWamc2RUh6bHkybmVkSEQzMGwxZWlqTGh6NzhoWndsVHlta0ZW?=
 =?utf-8?B?V2l0eDBZQVBGK014RER2NWgxWWlFRCtsMzJ6b2NPZUFHdE1VYVJodTJGbEJS?=
 =?utf-8?B?MUU4M0JXa1lKQ2hHYS9hSVQ0VkFxUTNhbFp1aXNJYVRjMzlUNnpRYnMxRW1P?=
 =?utf-8?B?Uk5Wa1FyMlhnZ05reldEeDNidEljcytFakEwcWl0RlJIb1M1b1JhcE56WkJl?=
 =?utf-8?B?c1FjcW94dmtBY1lGTVFUTHV2Rjh5RUIvVVFsTGpvMm5JWmE5cHFLcFZqcUFM?=
 =?utf-8?B?TExsUUJuSWthZHprR3NtVG96NzJzYTl1MkMyVGgyTE1paWl1L3ZkZFpIZ2JG?=
 =?utf-8?B?ajRmR2NQaVNKdEhEZnMvQ3NuUUhkaGNFcGZRckRIbWRRaVd4WEVzYmp2b2Vw?=
 =?utf-8?B?dUI3UUJNTExqdlNlZThUamhaQjVkai92V0VzK1NhNjVwQU5BSDNEYVJSU1JW?=
 =?utf-8?B?OHkzWHB4ZEFIb0tDMWs4NnBqUnNrbFVOT2hFbnpKZUI0NUlCUUplQ0h2VWVL?=
 =?utf-8?B?d2gwL1dnVTlMWXRDaGRFZFVnYlArdmVrS28wYzV4NUlkZ3lhZEhLeFZ4cjZV?=
 =?utf-8?B?RTNpNGhxL29OeGNxUTU5U0dtRDBzZDlTakFac01wT1FhMjMrK2R0dGZkNkEw?=
 =?utf-8?Q?a1ACv4ZynVzyE?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MUg4TlE3QjNabkl1NUZybGRFRzV6aGFKd2tDYVl1ekZQREY0UWRXTkg5ZWM5?=
 =?utf-8?B?ejRHeHdMN2NzZDgyV3dlMU13YmJpMHBHQnZzYm9tRGtjbHJLMWkxb0U4cnFw?=
 =?utf-8?B?NXdLY0dRM2ZnaTVzaktCSnFEaWVlTEpWelhQMWdxYjRsNDFPSXR0aW1RK3JO?=
 =?utf-8?B?MXFBWHdSanNWNmU3ZDNPWklid3U5ZGYzNW92ZHdUeVMyaUZqYUNwWGo1V0VP?=
 =?utf-8?B?akExOEVlMHpYWWphUVZ4RTlFd3NYdE4xR2hOSU9nZ2ZlblFyb3Y3TWNzbHpl?=
 =?utf-8?B?UzA5czdDVTc1aTFON2h4aWhTcVBPLzBUaG4yWTVYeXo4N3VUcXI1SlJyZHlT?=
 =?utf-8?B?UWdyRzlKYWJOOGE4aE1EUE1jU2g3M2NJUFNLaVYxUnVNU2U5Z3BRcWcwaitQ?=
 =?utf-8?B?b21XcitMVlBHVFkvdWUwa3ZJVnhIazdISlFMT3VQWkFyRXNYVE5GbU85WDZ6?=
 =?utf-8?B?ZTBOb25TN0s3RDA1YjRUdCtHUThXWldIUTl3QTdLMUJRWHVqSHkwMWttelNR?=
 =?utf-8?B?cFpGaHg5ZnNReVZNdkh1UG1QQmtvUkdpT0hHZ3dIZnlTQzhzL1oxeEIvQWtZ?=
 =?utf-8?B?YUpZMDRiWks0NnJnMnc1bW9qeDk0UFZJTXB3a21IcXhnYUdoTzhtRlN0VTlo?=
 =?utf-8?B?NUI1VEtjY1phMnpxRWxkZmYrZkE1dHJselpVVVlQQktNWm5HQUdYL0o1MEpV?=
 =?utf-8?B?bVY3UXhOblBPN2ZSa3J6OENqUU8rS0hQR3EyKzRRUThzcm5aMDRuZ3B5KzhO?=
 =?utf-8?B?dlFNZThIVGNTQTd5dENnZ0hSZDBZaWxXWkxqcXMwVEdCUVUrNG5kWER1anBC?=
 =?utf-8?B?VjNmNjkwMWJTMCtVTDlVZS8wQyt1cnNuKzc3QkpmVE1uRjY1TWNMRkJmQ3BV?=
 =?utf-8?B?TEhuNlRLM2YvSDZWUkVvY0VqbTByeXZCcHNXYmlkYUVmUlV3b3ZWVFcxRWJH?=
 =?utf-8?B?ajUxU0dyQS9lMWUxZG1JNHc3cCtva1h6aGtwU1FRYWJQYXZ2ZHpuVUFjMzZr?=
 =?utf-8?B?VHY1RDFNclg5d3JOempGOVE2RUk5Y3pTSmZqYWkrMW5ic2NyWFZHOUs2TENn?=
 =?utf-8?B?SWQ5aGkyZWpFUmJLSm1lM0dCekVUcVpERXp5SkNUenNuS3cyNlRKRk1BenZo?=
 =?utf-8?B?WlUwek1VUGFRR3BJZVNBaHlmWUg5bFhnZXZpTGdtcXhxVGc2QWQ4ejRqTEJX?=
 =?utf-8?B?L1oxSzh1eWZiY2ZTWEdJYzlBcS8vSHdvRHQ0NmY4eEFrRlhxcGhxRU5UOGFl?=
 =?utf-8?B?eHBlcHdRZzRoZmluOGxXV0syM3hDQTZkYXMrSEU0cUdFa1FyY1ZGVmY3VFJv?=
 =?utf-8?B?aWIySUxxMU1ja0pEZTUrUjNpci9LeWJacUpOWGVVMXc3Si8vd2V2ejJ3SlQ0?=
 =?utf-8?B?dmV0YlMxN0FRWThtdGJncE12YitmYXhUd3UyYlNhUmU4MVZQY2twYjZydmtQ?=
 =?utf-8?B?VWZRQ2I3TVJDdTZ3dFlycnp6NmxDNHZ5dVYzVEh4SnYxSVNCdm1jREpLbjVT?=
 =?utf-8?B?UXpHTWtZRWhPcHROWGEvUGtuWGlEZU5tMEMwNlkvUmpTQ0MvS1pabUhjaE52?=
 =?utf-8?B?KzliVGVhVEpxVWIxVDhRaU5GVDFoVmFyMjZoeTV3aVZ0a1MwM0ZJODd6b2xt?=
 =?utf-8?B?OCtia1ZJZ1lsUjhKbWxoTkN0UG9aWW1GSGtPU0pBV1hNdFgvVlZLaWMvUGFE?=
 =?utf-8?B?Y1h4NVkvVG5BOU5LUkttWi9DeXZPZDcrSEFITlZjSGo0VTBsNGpuckdGb0I4?=
 =?utf-8?B?MnEvbkVXVjBnUG5RMkhTVXVxbCtHKzRxalBRTFdxV2JBOXJOemhaTk11YlVw?=
 =?utf-8?B?UU5uRXZmVndGZElzN0hrS2ZJTi8zSHV4TWNxdTF5c3VrSld1alpyY0dTMEdT?=
 =?utf-8?B?ZFlRNTI5ZS8vcTU2TTRNUGxmcTdoclBnbnFicUN4blJXZXdzVVpCY2QzMWpC?=
 =?utf-8?B?aTM1L1NVcFlBUkJ3NTQrc1EvR2p2UGJPeFdVdlJudFh0cThZdDJaQmorMXhO?=
 =?utf-8?B?OGc0ME96bWZyL01WcVdIMXBrZTdvK0JVVEZpLzM3WExzVG1EUXdUUWp3dE9Y?=
 =?utf-8?B?eWhWRmlhaGpiTURsNjc3MFZQL3dYcldkeW1UL0xHeVl3TEpkczl2Q1FFYlYz?=
 =?utf-8?Q?gJmGqR6k/FEMyuxqlRcO8A7DI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be983e3-f814-4133-92db-08dd51ac7b48
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 12:45:40.0698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+ULt10+ildh/Y+iWSt4XNcbKBY5g0mIQgaYD7/oPqQaAOIFzfkzkG20bCdCPzNGS4YzKmKIorlHYZ/I07JsYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7556
X-Proofpoint-GUID: 85R_QmavrCxUhRkjqHvMxt6f-xC-1jxd
X-Authority-Analysis: v=2.4 cv=I4GfRMgg c=1 sm=1 tr=0 ts=67b723f9 cx=c_pps a=FmV7mXqD6UovpQmy5PTGeA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=CCpqsmhAAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=I6vsWDltTlGE4RNDji4A:9 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: WVvtZzjUJIABRNqi0KTD2bhSETiIlPyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=836 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 12:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211756

R290IGl0LiBJJ2xsIHNlbmQgb3V0IFYzLg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyMCwgMjAyNSA2OjI4IFBNDQpUbzog
Q2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIFYyXSBk
ZWJ1Z2VkaXQ6IGZpeCBidWlsZCBmYWlsdXJlIHdoZW4gZW5hYmxpbmcgREVCVUdfQlVJTEQNCg0K
T24gVGh1LCAyMCBGZWIgMjAyNSBhdCAwNTozMSwgQ2hlbiBRaSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8UWkuQ2hlbj13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbODIwNDk4ZTg4MTQwMWE2ZjRiMTcx
NWRjNjgzMWRhOTY1ZjZlMWQ2OV0NCg0KVGhpcyBkb2Vzbid0IHNheSB3aGVyZSB0aGUgY29tbWl0
IGNhbiBiZSBmb3VuZC4gSXQncyBiZXR0ZXIgdG8gcG9pbnQgdG8gdGhlIGdpdCB3ZWIgdWk6DQoN
Cmh0dHBzOi8vc291cmNld2FyZS5vcmcvY2dpdC9kZWJ1Z2VkaXQvY29tbWl0Lz9pZD04MjA0OThl
ODgxNDAxYTZmNGIxNzE1ZGM2ODMxZGE5NjVmNmUxZDY5DQoNCkFsZXgNCg==

