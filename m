Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8258C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 06:46:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.28457.1744267561550256556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 23:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5IIh1020168
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Apr 2025 23:46:01 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4e8q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 23:46:00 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53A6k00M017999;
	Wed, 9 Apr 2025 23:46:00 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4e8px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 23:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDvxM6dj9bB5ZWEmtTa6f9Fyr3hbTJ/92oLegDRNX7TUG2/b1mLDPGGCwM3QwIK1CjZQtxxwhc2jHhjqam4fbsm2nUY/hzTy6Eg3aYUPtFtVdrVYCua/sABg+rpxX64NIjVSV7ovTPVcxbBvPjmcWFOy62Q702nflwqAcyK5u++//nS1KIk8ImhMIEFLPZj0872My1OnV55oqe0KqbeA9lEBsTsmzCDGdRPasD0hb//QCq/UW8Gt0krdiJ8yNooTJmiuRC3+rV4zI7tGZwyC4FfHVEymebp0vWZf8ZyNhNe8XrnPuF9+8baZgo/afLBfj1EuyLa3f5r9y2p7OxfhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pfve+fh2VWHOBFtp1N37QXQeRyFrK+fAbxyMMzE7/xk=;
 b=Tq84d4+ZFKEI/1vRntJJd9lZ6GmR0p8gMcPAeka9AauJlh5UzDUzw8AgLrUyXA2DWnDkNappOEAAkxZpV7befGLhTFhjXXLuNO05AFo0tsq2CfQHeArkhl+LcF3fNcerJC2A4fvVuFs0Yr9kf7ehUM5ICldnAxflGU6sVxUIof7IFH/iGPz0m2HN3MdgEGquE/m/eZc9RYexiqIjhY93nyKHIUoXA95U0x0sW5pcTQTUHcWfXOYOzyfqIwSm14nM/dg9ziKmDrFqFZZLvquCC02ikisbZCP1jz1BC2G0EiSrzyHQ0cUn+C2zSyFPc5PlVwfE9edf/So0PuG5/YIGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 06:45:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 06:45:57 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/2] classes/recipes: remove unnecessary qemu
 inherit and qemu-native dependency
Thread-Topic: [OE-core][PATCH 1/2] classes/recipes: remove unnecessary qemu
 inherit and qemu-native dependency
Thread-Index: AQHbqc45rky9Rg2LXk2m9RhB9M5JKLOcbEIAgAACxKCAAAS4gIAAANFA
Date: Thu, 10 Apr 2025 06:45:57 +0000
Message-ID: 
 <CO6PR11MB5602C8418A51BEDE75A5A9A3EDB72@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250410040825.1283228-1-Qi.Chen@windriver.com>
	 <35ee8bfe577addc9e6ae978588b5a071be82b478.camel@linuxfoundation.org>
	 <CO6PR11MB5602D636B4069B499A6EF4D1EDB72@CO6PR11MB5602.namprd11.prod.outlook.com>
 <5e07f80db60ee353f2acd1ed0d8d7bdb00544337.camel@linuxfoundation.org>
In-Reply-To: 
 <5e07f80db60ee353f2acd1ed0d8d7bdb00544337.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DS0PR11MB7831:EE_
x-ms-office365-filtering-correlation-id: f2d1c262-dde3-403d-41a4-08dd77fb595c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cVZEVStFd3FkSzlvT29Bd2pGS2lEdi82M2U5QlBjN0d4R1JYQm5HVWx0b1Bv?=
 =?utf-8?B?a0JYY0xHcUd2ZnZOV1Q0WHlraUViRHZTajRxZGptU1MzUThsQm1qVkVLaGVN?=
 =?utf-8?B?WFdwdzRob1hrMlJjanh4aWJvS25OZFFtUW00WS9rTTk0TUNJZllCaUNrNEJL?=
 =?utf-8?B?N3UwWS85cWpqSTZ1VTNiM1RDS3BqelJ4RFdSUzJlWkIwNG9WY2k0d0Y2YmJS?=
 =?utf-8?B?RFJTOE1CZW5vQXIydWs5VU0rUHJmZGNWTFRJMXZqMFVDVHhjdU1xY3FHd2lC?=
 =?utf-8?B?OFBCUm9YZVd2djZtcUhSdi82dkxPNExpNkt5WmlMUjZIVCtpTyt3ZDRhWnlE?=
 =?utf-8?B?c2RZVm5sMHFLTHZmaTVIZDNtVEN0RE0vdk5CLytlbURZOGNFMnJTNFhnRlNx?=
 =?utf-8?B?bUxpTWN3QkU5SFlXZUJPSjFBQmE0MjU2bzVXWmJweURPUWlCNmRZdHF4SCtr?=
 =?utf-8?B?UERkeGVzV0QwRFltZHJ4a29zNnpHa0x1cGR1US8waFJMY0g2Q1VBdXV0N05E?=
 =?utf-8?B?MUdseUhUY3EvYzh0b0txSlRVY3RmQWNyV0ZWOHhkUnJteDBPOFd6NVhSOE12?=
 =?utf-8?B?U1J1OEJneklXYWlpSElPTGZxY3NLMjhpNDRvRVJackJsZXVzaGhDYXIram0z?=
 =?utf-8?B?RjQ5c2phWmZWZGE0RytQY2hnUE9TNHV3MEFTYVNjS2tBVThjei90MWI3bVM3?=
 =?utf-8?B?QURPSUNDUm44dVZOc2dQK1JTK3VsZ2lxTTFvTlNBTDVqMkZsaGswWXZYN0Fk?=
 =?utf-8?B?TVRqbW1HUVlWekM2QnRHcmkyNVlsUnVXRGZIV1h0RXFHQ1E1Y2ljb2xGUzZn?=
 =?utf-8?B?eldhY0FramdVeFVpSy9ObndhTUdLQ1h2SVlEUVEvaXR1enpXQWpBK21MWlJS?=
 =?utf-8?B?N2JUbEZhQlppL1AvZDFWSXQzdGRnbkM5dmVIeU42cU1Od0hkQ0dYYnRBV3Fx?=
 =?utf-8?B?cG5VSUpJb3l5bjNGeUhJR2JZQVZBejNwYThFYTl1ZzJuT2oveTF3b282bWtz?=
 =?utf-8?B?cEZyeDZjdTlpdUdMVlMwODlUZjM2b0NqTXZRaUlETlVvWVY4RXlHYlduM0k3?=
 =?utf-8?B?NW04K0VSTnVKdFJiVlAwamhlMVVQQmI0TktkTEIyUHN6OWFjekhSb25ESDJY?=
 =?utf-8?B?dXNvcG1haXJDRmJqMTNEU1NVdHZvSFlJTk9IZ2syT254ekY3YVNITGUvOVFM?=
 =?utf-8?B?U3RDc0dFemUzcFJRd0RMWDhKOGVNanJoOUhEelNlY2FubnlSUVdCTnZoVnl1?=
 =?utf-8?B?dmhrNFJFSVYrd3RSL016SDJvTmdOdmRHWFVYR0NHZTZJazN6ZXJXZkV6THgz?=
 =?utf-8?B?T05XVlBXTWdxODJUZ21RQW1Ham0xSjVjZHROL2p3NGl2NkdOYkVYbUlaZDNT?=
 =?utf-8?B?NWUxVnljWitEYmNaU1ArWDRyenZPUEdWc092ODFuRVNmMUxkYWZ5YU1jQjRx?=
 =?utf-8?B?UDBiR0JDTkZDK3ZwOHJ3TXhLVHVzT2l0WndZYm5wcGZSdUdqakJTeHp1UzZj?=
 =?utf-8?B?RVlTWXN1dSsvUDRmVUlZTnVqLzE0Kys4MlI5YnNpTXFSTGh1N3BtRGFxSTAz?=
 =?utf-8?B?dnRIMGpDUnRZMWxTN3JNblNkdEJodTZSZk56NUJ0YkhqSW4zVHY0eDNqbXBx?=
 =?utf-8?B?RzAyT0tMUFNXL1NHOUxSL2MzNW1NNXBBZzd3UE5HU05OZXFUSXRXK2toMTBW?=
 =?utf-8?B?aFZMN3diemVjMmJkczFjZUxsS3loVktCeUhlZjVEMTAwaU9nUTVKcUZ4bFlK?=
 =?utf-8?B?M2dSc3NFRkFiSkpyUmxUbVZVR0czeSt3dE9uZlVsT3Q2T1FCWFpJaTZlRHVi?=
 =?utf-8?B?YlpseEQyUkNYdFRWWTJVZGc4QUtjVXBmUkZ1VWdpem83Q01Vb1VRVkFSZXJM?=
 =?utf-8?B?OHJINk5obzVZcUtuUkZ4Qy81cVpaNXJTUGR0VkpyaDZKYWFNcDhacWpHK0g1?=
 =?utf-8?B?YXNtRGpGQTNZUzgyZjNEdmhDN0Q1cFRsU05icjNEL0lQZ3ZRTnMvNkZBTnow?=
 =?utf-8?B?ckU0MDZwZERnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M1JNY0NwYVFQMTQvRWZ2b0QrUUFXT0FGUWVOb1ZIN0tVOVlNTGlFaGJzWlVl?=
 =?utf-8?B?TXNJbDdQSlp2MHQvRFM2c0lQTlZSdjJvbnhPbW8wUHlzUVNFd0wxR3JncmZZ?=
 =?utf-8?B?Ukszc0xObVRaUEl0NkVrS25JRlBIM0JrUUhjQ2V6eUt3NVE0eHJoVFA4Mi85?=
 =?utf-8?B?V3FJemJhV0VqdkNpbGc3ZjlMNklVTWZMdXlxb0tMbWdYWlNWL3F2VzhBNmdU?=
 =?utf-8?B?THFXamlndjN6N2cyVmpRbFA2WThQZWlHUnZ0RzlJc0RWTzlUUk85UmRmUVRH?=
 =?utf-8?B?ZUNCc2tGRG1ZMy8rWGlIVFEyVDduc1VQM3dyOW51VGdJSmhFSEllN0pWWmxH?=
 =?utf-8?B?N25MSThXVm1KblVhdStjWGNpZDVON1dUd2pYY0JQcEIxL0RnVTdhUGN4dHlY?=
 =?utf-8?B?blRpaENJZHJTUVFYUzNPMENrcExOcnJYWjBQaVlxOHFsdXY3S0NOTmNCcEVF?=
 =?utf-8?B?TjRFU1BQQS8zRlVjQ2pLS25UUmc3VytES29LbHV5THUrMTU2UkFJREF2UU5p?=
 =?utf-8?B?MzFKdHliK3AwbVNGb1RPRHpwbXBpcVJ6TjhlcWJtR0gvTDFpZjNFYVRoQTZt?=
 =?utf-8?B?TFVhc0UzY3dnKzVNbzBTMUlhUHVmdjFpOW5MRXJhOWwxK0dRV0E4WnJlbmpj?=
 =?utf-8?B?RXBPUEI4UFhKTXJsOVVrTUxYaGhwdFRHenlyNmt0VkNjL1lhMTZsUGZCc3Nv?=
 =?utf-8?B?TmZiS0Rkd0E1UHZDN2JNZjRCREREaVJ1YnBETnE3NEFDK05OQStpVlZ5c1Zn?=
 =?utf-8?B?YUJRUkVJWDlxbXdIRUxWUHptbTRpVTZiZGZ3dkFhZTB6WG9KdndFOTI4ci9U?=
 =?utf-8?B?VUlkVkNZTzVpTTQxcEExQmU1VWRuN2JYeFlDbkl0RGpmOTkvR2RwcDZaKzhG?=
 =?utf-8?B?Z2dXcS9aUE4zaCtpQmxlSUtDUHIyb0hKSThMUEpULzgxUUg2ZG4vWU5NWjJs?=
 =?utf-8?B?a0tzUVViNVNpQndMWThQUTZBTVJIMDdiMkVxQkNqS09hQ3VRN05UL0I2R0Fi?=
 =?utf-8?B?cHpJRFFHNFpHL0gvdlMyVDFzLy9TMmdGcVZYKzQ0Wk0rNi9SQmplRzZVM2xm?=
 =?utf-8?B?c0tDLzZuT3dVd3p1SExkTU96MXA5bTNiMUhUc1ZwTGpvZUMyb2RzV3FPVVlJ?=
 =?utf-8?B?cEFXQXNIWmNpdzdaWFlxNUFHVmdvUDBSc1RHUVRqSEkvVXFCZzFKZS9uRE9v?=
 =?utf-8?B?T1Q0MkhlVTI3UCtVMS9WU0FLU0pmc0hMVE5mWmxxa3BkSHBKaWozQ0pSam5P?=
 =?utf-8?B?VUFVWEtpZlI2NGc2MURhcUxoY2ZYUHRGTXNwMlBqQUZDYm5rZkpwaXhNWGw3?=
 =?utf-8?B?V3RIUStNL3puWEZoODd6NU90REozdFJwUUNXUk8vaU9jOFNZSkwvMXVQSWl5?=
 =?utf-8?B?a2hnUUp2NHEzRk1QOEw3TThXRk9hak9mZGlYQlB6MVZnWnRxd3ZiOGo2dmIr?=
 =?utf-8?B?OWk0V1d2NGEwMnROTDJWeUt6ZzZlZzBVVWJEZU1VMnpVdVRrVlcrMVNNT1BN?=
 =?utf-8?B?cmNtYVJFYUhIUkorYVhlcU9WWmV2QXJna2djSmh2ZGwzSHZWaEhsUW9Ba0FI?=
 =?utf-8?B?YUwrMTNtSWFPVFY5WjgyRFp3cnRobEw3YW1UV3BKYmtReUg4NnorUWpFZUFZ?=
 =?utf-8?B?NW9pTTR3ekVvb0NkUmtzSkJZYmxzNVAyZURSbmplZkY3ekxXVkJGbXJrS3JQ?=
 =?utf-8?B?cFFXN0NxbWs4NEZucHNqemJUTER3UFVwdFBobmpIa0tnU24rYU9NenJrb0hH?=
 =?utf-8?B?LzlZVjlPRjhnOVUyZWtoQUFwbU1YQzM3TWt4aGtTOVZDWFlPSHd6cTNZTVF1?=
 =?utf-8?B?TCt0MmJ3aThXdWs2c24ycnZyZXRJblMxV2o2RWk0RWZpaHY0cE9ybVU0TE1D?=
 =?utf-8?B?NjgxbUJSRko5My9SWWVrd01adzFlTmZwWWFaMWVDTWxqOU40UWJrNDFrTUhO?=
 =?utf-8?B?QWkycnBMb2ZiazBkSlBuakd0TmJTdmVueEVaeUtpUmlybHlweUhLRFUzUUQ0?=
 =?utf-8?B?S1ZIdWlSNnJZajFEMWFKZ3VJeGdIY3ZTTVFaQlhKbUIwWEp2dHdCN0QwdmRO?=
 =?utf-8?B?d2N4WFZPQkNOd01PaEV1akxwamwxRGRsL0hTOFlqajZtNksxQm1DZE1PNlBk?=
 =?utf-8?Q?SwamiKFgnzdcoa0+gakqWgH/o?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d1c262-dde3-403d-41a4-08dd77fb595c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 06:45:57.5786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxP/y8uDZg7bfuhBTMT0oNTfjuwztd1caeM+twr9IPHAzdPi64ZSLc+theBa+BEVxHryfLOjHGM0XlJb2NvREQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7831
X-Proofpoint-ORIG-GUID: uPxjdXEB19tSWWz1GDoA-LT-ERZTk4eY
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f76928 cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=dyqpW8omoR1gYCf1OTIA:9 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: Nj_A4NMXTMzCIw64NMOv1lL-C4DFSMPy
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=956 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214623

R290IGl0LiBUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBleHBsYW5hdGlvbi4NCkknbGwgY2hlY2sg
YW5kIHNlbmQgb3V0IFYyLg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPiANClNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxMCwgMjAyNSAyOjQyIFBNDQpUbzogQ2hl
biwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggMS8yXSBjbGFzc2Vz
L3JlY2lwZXM6IHJlbW92ZSB1bm5lY2Vzc2FyeSBxZW11IGluaGVyaXQgYW5kIHFlbXUtbmF0aXZl
IGRlcGVuZGVuY3kNCg0KT24gVGh1LCAyMDI1LTA0LTEwIGF0IDA2OjMxICswMDAwLCBDaGVuLCBR
aSB3cm90ZToNCj4gVGhlIHBvc3RpbnN0IHVzZXMgcWVtdXdyYXBwZXIgd2hpY2ggaW4gdHVybnMg
dXNlcyBxZW11LW5hdGl2ZS4gQnV0IHRoZSANCj4gcG9zdGluc3QgcnVucyBhdCBkb19yb290ZnMg
dGltZS4gQW5kIHRoaXMgZGVwZW5kZW5jeSBpcyBlbnN1cmVkIGJ5IHRoZSANCj4gZm9sbG93aW5n
IGxpbmU6DQo+IG1ldGEvY2xhc3Nlcy1yZWNpcGUvaW1hZ2UuYmJjbGFzczpERVBFTkRTICs9ICIk
e0AnICcuam9pbihbIiVzLSANCj4gcWVtdXdyYXBwZXItY3Jvc3MiICUgbSBmb3IgbSBpbiANCj4g
ZC5nZXRWYXIoIk1VTFRJTElCX1ZBUklBTlRTIikuc3BsaXQoKV0pfSBxZW11d3JhcHBlci1jcm9z
cyANCj4gZGVwbW9kd3JhcHBlci1jcm9zcyBjcm9zcy1sb2NhbGVkZWYtbmF0aXZlIg0KPiANCj4g
UEFDS0FHRV9XUklURV9ERVBTwqAgaXMgZm9yIGRvX3BhY2thZ2Vfd3JpdGVfcnBtL2RlYi9pcGsu
IFRoZXNlIHRhc2tzIA0KPiBkbyBub3QgcnVuIHBvc3RpbnN0IGFuZCB0aHVzIG5vdCB1c2luZyBx
ZW11LW5hdGl2ZS4gU28gJ3FlbXUtbmF0aXZlJw0KPiBjYW4gYmUgcmVtb3ZlZCBmcm9tIFBBQ0tB
R0VfV1JJVEVfREVQUyBzYWZlbHkuDQo+IA0KPiBGb3IgdGhlIHJlbW92YWwgb2YgcWVtdS5iYmNs
YXNzIGluaGVyaXQsIHRoZXNlIGNsYXNzZXMvcmVjaXBlcyBkbyBub3QgDQo+IHJlYWxseSB1c2Ug
YW55IGZ1bmN0aW9uIGZyb20gdGhpcyBxZW11LmJiY2xhc3MuIFNvIHdlIGNhbiBzYWZlbHkgDQo+
IHJlbW92ZSAnaW5oZXJpdCBxZW11JyBmb3IgdGhlbS4NCj4gDQo+IE15IHRlc3QgZm9yIHRoaXMg
cGF0Y2ggMS8yIGlzOiBxZW11eDg2LTY0ICsgc3lzdGVtZCArIGJpdGJha2UgY29yZS0gDQo+IGlt
YWdlLXNhdG8uIFRoZXJlJ3Mgbm8gZXJyb3IuDQoNClNvbWV0aGluZyBuZWVkcyB0byB0cmlnZ2Vy
IHRoZSBzeXN0ZW0gdG8gaGF2ZSBxZW11LW5hdGl2ZSBhdmFpbGFibGUgYXQgZG9fcm9vdGZzIHRp
bWUgc2luY2UgdGhlc2UgcmVjaXBlcyB3cml0ZSBhIHBvc3RpbnN0YWxsIHdoaWNoIGNhbiB1c2Ug
cWVtdS4gVGhhdCBpcyB3aGF0IFBBQ0tBR0VfV1JJVEVfREVQUyBpcyBmb3IuIEkgc3VzcGVjdCB5
b3UncmUgcHVsbGluZyBpbiBxZW11IHRocm91Z2ggb3RoZXIgZGVwZW5kZW5jaWVzIGJ1dCB0aGF0
IGRvZXNuJ3QgbWVhbiB0aGlzIG9uZSBpcyB1bm5lZWRlZC4NCg0KcGFja2FnZS5iYmNsYXNzIGhh
cyBhIGNvbW1lbnQgYWJvdXQgdGhpczoNCg0KIyBJZiB5b3VyIHBvc3RpbnN0YWxsIGNhbiBleGVj
dXRlIGF0IHJvb3RmcyBjcmVhdGlvbiB0aW1lIHJhdGhlciB0aGFuIG9uICMgdGFyZ2V0IGJ1dCBk
ZXBlbmRzIG9uIGEgbmF0aXZlL2Nyb3NzIHRvb2wgaW4gb3JkZXIgdG8gZXhlY3V0ZSwgeW91IG5l
ZWQgdG8gIyBsaXN0IHRoYXQgdG9vbCBpbiBQQUNLQUdFX1dSSVRFX0RFUFMuIFRhcmdldCBwYWNr
YWdlIGRlcGVuZGVuY2llcyBiZWxvbmcgIyBpbiB0aGUgcGFja2FnZSBkZXBlbmRlbmNpZXMgYXMg
bm9ybWFsLCB0aGlzIGlzIGp1c3QgZm9yIG5hdGl2ZS9jcm9zcyBzdXBwb3J0ICMgdG9vbHMgYXQg
cm9vdGZzIGJ1aWxkIHRpbWUuDQpQQUNLQUdFX1dSSVRFX0RFUFMgPz89ICIiDQoNCkFzIGZvciB0
aGUgcWVtdSBjbGFzcyBpbmhlcml0LCB0aGUgY29kZSB1c2VkIHRvIHdyaXRlIHRoZSBxZW11IGJp
bmFyeSBjYWxsIGludG8gdGhlIHBvc3RpbnN0IGJ1dCBpdCB1c2VzIHFlbXV3cmFwcGVyIG5vdyB3
aGljaCBjb21lcyBmcm9tIHFlbXV3cmFwcGVyLWNyb3NzLiBJIHN1c3BlY3QgeW91J3JlIHJpZ2h0
IHRoYXQgaXQgbWVhbnMgdGhlIHFlbXUgaW5oZXJpdCBpcyBubyBsb25nZXIgbmVlZGVkIGhvd2V2
ZXIgd2Ugc2hvdWxkIHByb2JhYmx5IGNoYW5nZSB0aGUgaW5oZXJpdCBxZW11IGZvciBhIFBBQ0tB
R0VfV1JJVEVfREVQUyArPSAicWVtdXdyYXBwZXItY3Jvc3MiPw0KDQooYW5kIHNlZSBpZiB3ZSBj
b3VsZCByZW1vdmUgdGhlIGRlcGVuZGVuY3kgaW4gaW1hZ2UuYmJjbGFzcz8pDQoNCkNoZWVycywN
Cg0KUmljaGFyZA0KDQoNCg==

