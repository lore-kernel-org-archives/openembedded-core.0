Return-Path: <Josiah.Metz@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03929CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 11:43:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9800.1790941411550944773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 04:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ictTbS4Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4735868e27=josiah.metz@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929mBt13611601;
	Fri, 2 Oct 2026 04:43:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=1xk7Z1rnY3O42e3OSFX2kVRcPju3GRTHse4qGd28BhA=; b=
	ictTbS4Z3JTGs/SSYMfSoyAMI/YykoWov9i83ti67cdwalrs/L0JQzR4dp57ojx9
	EuT4YhNSVBEIJY09kV6FdfSgNOXdxxuD6hRpknxMWwYDZEidNoPMnmL5l47Do423
	+2sQY8wpfjZrrIimI461Zd9jafW5mfYJvblimV28Orc62QfalsAfueLZsTZM7+2q
	99hez+GhPh2cZBXf87cPxpgwFry0VNDAPp82pDjIeTaO+uOXm9DbJ5kjSL5apxk+
	+X+rDRAzwuBCIV8KmEZCDPMTGmYngAfY29HZiEgVQ7T05E2YEo+wp2/ai5pHNJBr
	cLtcgwlcCYT1wIR+N3fQGA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021077.outbound.protection.outlook.com [40.107.208.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1ku8j6kw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 04:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nizn3IQoFpmQFs+Wfgpzx4qZ6IkwTXNn/4XGjeLlC25WU+fN3YfxA7I0M1FGG9Oz5fRQoiOeiUTuBNHvgaoS3yMPz4GPFRipgTuFNysDrJ5glxQLtzMVz59FHNQYY4lRaFVKZ4MmmsaXIygdhVQR4MWvra5tQ7DVB6cJjrjbVwXLJDksA/IzUFdwaU5iMPw5HQL2eqF74lrXbFj5PiElsB+0wN86mZbYawUq1k36SpAUIgy4aOdp5GdaeegooeP1lFSAyzTKNOiysf1zSArn3nOgzE+UWJZlJ6E3fOEVaY5tgL++dAkgGh25YDEu484wrfpJ/Z7RJ3KPcXVkjHj66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xk7Z1rnY3O42e3OSFX2kVRcPju3GRTHse4qGd28BhA=;
 b=FKW4Ek/1za1W/UR77jHPtEZ5fyxtxIuXbgGCwueuMGk3F8L8FyofsUfj7EaL2PzDpAYSFXdoWHO92rZMJA6TER0xLS5z3EUDbhK5NnGwLuAT5uImdWh3i3d0OKMlaS1HJfVA4GVYloS/sfFEbGzpQggBdOSXK1EXYYwnac4KGiihrqKol/GuuWSPvW8KIIENOMCryc3zKzdzrk4QUDMIIfS8uF242SDCZ6snF+cN9oAQxhIC0it4JrtT11imvFyWBOunhO7W2DAk7KxhQj/NTF9qr1KchA9hDwCLOd8qTtfRaZKpy26N7bLyLg450eDZ9XBi9PYGWY7dbD1cMvm9Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7771.namprd11.prod.outlook.com (2603:10b6:610:125::6)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 11:43:28 +0000
Received: from CH3PR11MB7771.namprd11.prod.outlook.com
 ([fe80::13f7:db4e:55fc:489e]) by CH3PR11MB7771.namprd11.prod.outlook.com
 ([fe80::13f7:db4e:55fc:489e%3]) with mapi id 15.21.0451.026; Fri, 2 Oct 2026
 11:43:27 +0000
From: "Metz, Josiah" <Josiah.Metz@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pbarker.dev@lists.openembedded.org" <pbarker.dev@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] maintainers.inc: Update maintainer for bash and
 libxml2
Thread-Topic: [OE-core] [PATCH] maintainers.inc: Update maintainer for bash
 and libxml2
Thread-Index: AQHdSt0vEue4KtFkbUGf3MKnizcTqrbqML+A
Date: Fri, 2 Oct 2026 11:43:27 +0000
Message-ID: <e9fe138e-ac11-4f1e-a637-4afa5f81b841@windriver.com>
References: <18D7C34ABB5D4136.1120428@lists.openembedded.org>
In-Reply-To: <18D7C34ABB5D4136.1120428@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7771:EE_|SA2PR11MB4907:EE_
x-ms-office365-filtering-correlation-id: bb5df20a-c954-4406-7dd9-08df207a5ff6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|4022899009|366016|38070700021|11063799006|10067099003|6133799003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 xQofF+F4UD81b6ecK4sjkNbr2g9PTWUbQRulaS3/R2+30Ri4uCp3NA5K+Bqnxi58CnhXcfLBJczSen8/GKVywLHM/2mzHXnS9A9rytkRfrvtSqtYeSgJcdDhKikg8z1xcl6iOfBCqCjiIDrOCxZ5BFvgmM5M7OkfmMb6QCHZAfo2oTW1xhwTUZIC2LQS3TFSDjfck+37Rv/eI77LEZqdZaqA9pMQPx/1PIatGQlnYcXiJjwX8QIEAKo3v5rbGh4XLFoGoYeBRaBXBDSdB0/+YqjaNyUnh6dI3sN2wA4uAGElfrLhSI+m2Jx4Iecy//dDau9LEcvlquQrY1DDPsccNKVJUhaXaSTOXxmq60tzwSXWMH/GeAO/j/AoCcRSiVCK7UgxDo/t2dauTqOB6UQRuDjwCOwh0pj2Dh6lp2i2/QqyBDXJN1HcYwrVlBc18r1FbdMcg6ECUQ4lUlPldu8Eh6Crun8kzUdxVeeBJqnjHWEjJV/eyEJAr89YVmBNompmw5iitG1ZGctluTa3DUcnfZxwCpv3nqLbisANaCo3SAdl2YNPEZ9HmMRcQIl3dSZLQ5T6dR8IGR9UobZid00hOt+YBKEyO2APc1hMqaVWmKYZUpt2nKSSC8ffvKXzHDSTMLNv5Zqqgkqwv0X6IFRnn2mcDQNp0w1VpcEYAS03O9c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(4022899009)(366016)(38070700021)(11063799006)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aTRBSW05UTBxOUp4d2RLK3lLNUQ2WDdjY1F1eE1vZWVTYkdIZzBDemI4QWl4?=
 =?utf-8?B?akFjb3N2ejZ3aWN1NWpCV250SXpWbXp2cWpHN2QzcDZQVzBxMEdWRGdGTE1T?=
 =?utf-8?B?c2kwR3BuZ3phR0RaMW9yM0pDcXpJUTBIa1NIUEtpVFByd2xVclZpOUpnL282?=
 =?utf-8?B?L25xbDI2Y1RuNWxzTXM2dEFXcW5qMXdLb3c4SXhUTUVTdTY1TjVxOU54RUti?=
 =?utf-8?B?VEh6Sk1GVFZDamNqMmlYZWtSS0lZM3ltNVRJNk9yU2RsK0NPS2dIajdDajJE?=
 =?utf-8?B?SDFmdXlMNXduVWp1NlNLcFE4WEJ4SEFsSnV1TkUyQXJSK200RytWdXhidGo1?=
 =?utf-8?B?V1RQd2JOd1VDclYySGMzd01jL29RTG42bUZhNDNqMCsveDEwV3ltaGxqcVJS?=
 =?utf-8?B?K0VOc3NCdCtwNGdjbHNLWnhSVmQwdnYybVJnQVBIaURWVlNRRUNrZy9JYjYr?=
 =?utf-8?B?UmNZQVFoZDZRcERCaVVGTUNLQWNBUTI5Tk9lcHh4SkpQRDZUYUYwemNZWmd6?=
 =?utf-8?B?R0F0ZTFaWmZ4UkdQalVqOWU0RUd2K3M3UFhIWVVoenA1Yi9Iem5VaWZUTHk5?=
 =?utf-8?B?dE9Pa0M3VVQrazlJU2k1VW9sSXo3NHdCZnpMNm52R2VoSVF4VUhLTWRnNW1i?=
 =?utf-8?B?TVAyc0YzL3pFc0JiRS91b3ZjZjMzM1hjYWFUV2RvVURhdk9abGZYUk1SUXJn?=
 =?utf-8?B?a3hobEVHb3BDYUx1SXBhSllHN1VoRW1MQ1B1WkxPclVDc0Vpd0Z3ckxDOTVz?=
 =?utf-8?B?aUoyaHZvTllHMlZrWW9FZW4xSTRGZ0I0TFJPU0YrTWRQWWJnaHBjL25HSkJi?=
 =?utf-8?B?Z3NMVFBISE5ZQ1FVdGxUVXg0WGxSWFlGRUtsUkhTZU1IQS9lVVFnVUdMWkIv?=
 =?utf-8?B?ZUloUmlOM1hoSnk0c0JEaGVqakk5d2tQSGM1RUh4TUY4RE9UaW9LdVlNRkFu?=
 =?utf-8?B?WkdtVGxLNDk5U0htcC9ROXFjK3FqU3FZWHByODBuc2UvdmdGSlEyMm1iZWJS?=
 =?utf-8?B?SnliV1A1ZEE3WWNOWVNvVThPZDkwQlFLMG1rOUlJaXdieFladjRnSWg3SkxP?=
 =?utf-8?B?aVJVei9EZ0V1SEJCMFcrQ3hkRk0xZjVtVDRycklYSHhCdnBaeGs4V25HSzdQ?=
 =?utf-8?B?Tnc1MmxEb1dXbXhlNGFJTTJVeEVxMlljL1dPMkc5YWJwdUs3akZMWEtucTVH?=
 =?utf-8?B?NlZ3Vnk0dklHS3oxU3ZjU1puenozRVBWbHBNbVpuaytBOWRCNDUzNlJNTzJz?=
 =?utf-8?B?OTRtZCtQRDRYVjJFSDBlWGk4dTA2cnltdUNUMldlNFNnZWNkdXpLZFdaUG44?=
 =?utf-8?B?N0hhUXVHRXhJd3BYMUtWU0pVcStJdExvcmtqVVpVMVZDbWpVQ0paR0p5YkdR?=
 =?utf-8?B?R29kNEJyN28wWTU2SkdkN3hKZFdBay9LcTBkNXpqTC95TldSSEM1UFhIbFh5?=
 =?utf-8?B?dytubXp2cHkzZWpURWV2Q3ZqZnFmZHA4Y3lwamZwdUp0dW5zWVlabUM3eEI0?=
 =?utf-8?B?VmhzL2wrYkY5OWVRRjljZFVuL2ZTOHRZRnc5K3ZPTjlEWFFaN2FCbGozY2tl?=
 =?utf-8?B?a2lPeDY4V2FGYzQ2bmpqZElvckhKcDRzOFM1OExOQjVWRVBhendMRERVa2Rv?=
 =?utf-8?B?RVNScGxObkYvaisvdEpibXdYMXZxVDVrUnNVNkhiMklVazlrcGNWWjR6R3lH?=
 =?utf-8?B?bWFxSUI4ZFUvOEM3WTNacW0zM3o0dEZ5YVFkY1hKbS9mVFhiWldrVVEzSHY4?=
 =?utf-8?B?MnpCckUrUDFYWWZZWUEvM0l0SFZBREhSdVVodThqa0QrUUt5NDBvMDU4YlZp?=
 =?utf-8?B?WGdHK2ZWQVk3U2F6MVF6SnlpK20yVHNIbWhjTGFlaHdSeFZ0L3h0dUxBeGlm?=
 =?utf-8?B?endtT3lEWFFwamZyQVNTbnJxMHRjbGhhU092K0QwODdwQU51Q0JpR29XM2N0?=
 =?utf-8?B?cTE3bUFqZSs4amtpM1NIbUFBS01TWjErYmNaRVl1OFNOTEVTeStFUkQ1a2Rt?=
 =?utf-8?B?TytSQlFpZXQvU2FJU1dhbVpFWGd4WVVYbUsxWU5id1phajkwajc1R1FPNE9m?=
 =?utf-8?B?K01wSG5seVF4L1ViSWtoSUcwcm5uU3JTbW11NEhMSUF1S1BOQ2sxbUpPd3Jw?=
 =?utf-8?B?Vks1Vk5pVjdoVDNocTI3Z2NpVXI3bVFVcC9ZTWdOY1NGcUNHNktUc05jZGJz?=
 =?utf-8?B?MnBwaWJkNlBLQ2N1eEdSYVkzVmROUTd2M2hJbkFKTy9aUmNMeHpscW80cWpr?=
 =?utf-8?B?dXROM2tWditPd0xuY0dKSlJsRUlCa2J4T2oxblJjSTJUTTBBV2I5eG1qWUpN?=
 =?utf-8?B?VjVVY2pIc3FFZEk5QmxQY3BMOWxUTG5EWmptdUNKU3dkSjdlT1ozb3l1cHRT?=
 =?utf-8?Q?Z7r1Ob0xM5b85lzY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F9E408FFA03A2408077868D5C43F6B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	aw1k6jTJllkGwhPCMQoEQUhtqwkbpZy+oqP2scb2eritV0T0RA+yZUvK6g7oVs7XyvHVXXcQ6ATM2bshyg/wrF+o6x3xYgxVxkVHYUBFOGWw8qgbTOo7hLnjdIozuiVrasNYVC6oWYcaVWxm6vGAK6D7kkGmfPydLlZEFFwBeVX4mqhkw91xi0hlbSyDRyYVxCpqzvr0+C8mRopoHZuRIKzLzZdA9uLq3LC8awRCtFWfl4gOfQCOoPP+HOnrKPMjvUN2WFAM0lJvDV+8jl2T9rGmrr1TEzHzD40SEQYcQdycAhZl3bV755aXH3uRJODteG7p/hUZs1kEzzD71mjPTQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5df20a-c954-4406-7dd9-08df207a5ff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 11:43:27.7718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8olV4fHeFkydlfVnA2OT0KqHKHS6BSzGDp7P9ggULbUnc+zgMIWQC8ftCUXR4eSROVZe2wura35sW6eVQ79HJlbYtxQHNPawnzerh48EwkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6abf98e2 cx=c_pps
 a=56BXxs5GTVekWDSCh43ZEQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=zjtiufAZAAAA:8
 a=iGHA9ds3AAAA:8 a=k-42gJp3AAAA:8 a=IwqgqaB7PzHeKsE5ZNkA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=2tRhtM0yMehlNRDZlsEQ:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0NiBTYWx0ZWRfXy2anK2I1UQv3
 m1GGPK1EiAkuC/UAoquJhRkvNLCb0Zp0PRudE8DDxHjL6cRjBrP4rgOxIGXio0lMCh5l31EBdtS
 +XcuXA21n2sBXR1uBXijXlEceUI3xdpOYaRbiUlR1qg2k7DIqJZ3
X-Proofpoint-ORIG-GUID: Jdw5HxCk_0unIwo3lQYyPWBeP8YXfAy1
X-Proofpoint-GUID: Jdw5HxCk_0unIwo3lQYyPWBeP8YXfAy1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0NiBTYWx0ZWRfXxhgc4DzyV5af
 7b7t75V/ztkWH99IW3Nw/VWWmg48KGkOW5/sStI/w83THI6kHV9JzGzuz4zPnS6jS4HexsXFtRm
 bWcZhGseT/vI157/+PRuo9Ao1tI9yoARdsSvlTaJSgFMaN9586y3nlQcwwuhdLn1EaJ9+OQ4PZm
 gNCwUh2143PKih6h9N3C7jZDcwVOSaYS66EqNhz2SbT5xgfBi8aD1CU85PD8t1EqC1ZYoj/mv7n
 vQDV6HMbCrhwVZxTXZoLVOdVY+lbkBLaRz0MzhBDcW82QwVD/0Zyr3bketRtxZiFcCRzaIbWhCp
 QLmYoOX72oG9dXN5RGibH64d6wMyyB7NLnGLnwsh1i8p5f3z33Gf9Te/h6Awwz35KkWt+xYi1tC
 ECyLdgnfnqY8am9Ek9/lSrLRQkGoFKTWKzkKwDGnsq4G9b736SZ2OADwqgcE8ZTCrfXR6BFpbln
 GwN92riUi3LwD9HLFRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 11:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247109

K1BhdWwNCg0KR2VudGxlIHBpbmcgb24gdGhpcyBtYWludGFpbmVyIGNoYW5nZS4gTGV0IG1lIGtu
b3cgaWYgSSBzaG91bGQgcHJvdmlkZSANCm1vcmUgaW5mby4NCg0KVGhhbmtzLA0KSm9zaWFoDQoN
Ck9uIDkvMjIvMjAyNiA1OjU0IFBNLCBNZXR6LCBKb3NpYWggdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgd3JvdGU6DQo+IFZvbHVudGVlciB0byBtYWludGFpbiB0aGUgZm9sbG93aW5nIHBhY2th
Z2VzOg0KPiAtIGJhc2gNCj4gLSBsaWJ4bWwyDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEpvc2lhaCBN
ZXR6IDxKb3NpYWguTWV0ekB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gICBtZXRhL2NvbmYvZGlz
dHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5jIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEv
Y29uZi9kaXN0cm8vaW5jbHVkZS9tYWludGFpbmVycy5pbmMgYi9tZXRhL2NvbmYvZGlzdHJvL2lu
Y2x1ZGUvbWFpbnRhaW5lcnMuaW5jDQo+IGluZGV4IGMyNzNkMmQ3NTQuLmRhMzliY2NjNjAgMTAw
NjQ0DQo+IC0tLSBhL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS9tYWludGFpbmVycy5pbmMNCj4g
KysrIGIvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmluYw0KPiBAQCAtNjAs
NyArNjAsNyBAQCBSRUNJUEVfTUFJTlRBSU5FUjpwbi1iYXJlYm94LXRvb2xzID0gIkVucmljbyBK
w7ZybnMgPHlvY3RvQHBlbmd1dHJvbml4LmRlPiINCj4gICBSRUNJUEVfTUFJTlRBSU5FUjpwbi1i
YXJlbWV0YWwtaGVsbG93b3JsZCA9ICJBbGVqYW5kcm8gSGVybmFuZGV6IDxhbGVqYW5kcm9AZW5l
ZGluby5vcmc+Ig0KPiAgIFJFQ0lQRV9NQUlOVEFJTkVSOnBuLWJhc2UtZmlsZXMgPSAiVW5hc3Np
Z25lZCA8dW5hc3NpZ25lZEB5b2N0b3Byb2plY3Qub3JnPiINCj4gICBSRUNJUEVfTUFJTlRBSU5F
Ujpwbi1iYXNlLXBhc3N3ZCA9ICJVbmFzc2lnbmVkIDx1bmFzc2lnbmVkQHlvY3RvcHJvamVjdC5v
cmc+Ig0KPiAtUkVDSVBFX01BSU5UQUlORVI6cG4tYmFzaCA9ICJIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+Ig0KPiArUkVDSVBFX01BSU5UQUlORVI6cG4tYmFzaCA9ICJKb3Np
YWggTWV0eiA8am9zaWFoLm1ldHpAd2luZHJpdmVyLmNvbT4iDQo+ICAgUkVDSVBFX01BSU5UQUlO
RVI6cG4tYmFzaC1jb21wbGV0aW9uID0gIlVuYXNzaWduZWQgPHVuYXNzaWduZWRAeW9jdG9wcm9q
ZWN0Lm9yZz4iDQo+ICAgUkVDSVBFX01BSU5UQUlORVI6cG4tYmMgPSAiVW5hc3NpZ25lZCA8dW5h
c3NpZ25lZEB5b2N0b3Byb2plY3Qub3JnPiINCj4gICBSRUNJUEVfTUFJTlRBSU5FUjpwbi1iaW5k
ID0gIlVuYXNzaWduZWQgPHVuYXNzaWduZWRAeW9jdG9wcm9qZWN0Lm9yZz4iDQo+IEBAIC00NTQs
NyArNDU0LDcgQEAgUkVDSVBFX01BSU5UQUlORVI6cG4tbGlieG1sLXBlcmwgPSAiVGltIE9ybGlu
ZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+Ig0KPiAgIFJFQ0lQRV9NQUlOVEFJTkVSOnBuLWxp
YnhtbC1zYXgtYmFzZS1wZXJsID0gIlRpbSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29t
PiINCj4gICBSRUNJUEVfTUFJTlRBSU5FUjpwbi1saWJ4bWwtc2F4LXBlcmwgPSAiVGltIE9ybGlu
ZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+Ig0KPiAgIFJFQ0lQRV9NQUlOVEFJTkVSOnBuLWxp
YnhtbC1zaW1wbGUtcGVybCA9ICJUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4i
DQo+IC1SRUNJUEVfTUFJTlRBSU5FUjpwbi1saWJ4bWwyID0gIkhvbmd4dSBKaWEgPGhvbmd4dS5q
aWFAd2luZHJpdmVyLmNvbT4iDQo+ICtSRUNJUEVfTUFJTlRBSU5FUjpwbi1saWJ4bWwyID0gIkpv
c2lhaCBNZXR6IDxqb3NpYWgubWV0ekB3aW5kcml2ZXIuY29tPiINCj4gICBSRUNJUEVfTUFJTlRB
SU5FUjpwbi1saWJ4bWxiID0gIk1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4iDQo+ICAg
UkVDSVBFX01BSU5UQUlORVI6cG4tbGlieG11ID0gIlVuYXNzaWduZWQgPHVuYXNzaWduZWRAeW9j
dG9wcm9qZWN0Lm9yZz4iDQo+ICAgUkVDSVBFX01BSU5UQUlORVI6cG4tbGlieHBtID0gIlVuYXNz
aWduZWQgPHVuYXNzaWduZWRAeW9jdG9wcm9qZWN0Lm9yZz4iDQo+DQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzI0NjQyOSk6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjQ2NDI5DQo+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEyMTM4MzQyNS8x
MDU0NDI5MA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW0pvc2lhaC5NZXR6QHdpbmRyaXZlci5jb21d
DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg0K

