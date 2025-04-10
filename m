Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4643C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 06:31:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.28290.1744266682623081250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 23:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A3n850030929
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Apr 2025 23:31:22 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m616f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 23:31:21 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53A6S2xu007808
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Apr 2025 23:31:21 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m616e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 23:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/H3wC1xE7+DWse69pXCFZaoR/AyE9GYbllSvqKcbgem4gr+eUGADIldOnWO27hz1+C7tfwyHo4vo3KYvytPq9ilzCg7yOWl8k7r7WPdjnuYRaNVdn39JNL09mk+b4/kSL9mpmi5oP99cfFDHc972K1hyXJxYZp9p8r7OTH/bGD+g67Z3jQHXBgcMXtNQ0ehXHkua5b52QwcrHrz3ddXZJkmCeR9qeK9TKrD0uR4YOU+JNfCvIbi3N64PcBgjNIz1nPoYoLXHcNXITFMw9iG+nYohrY7zAqOmAo8jj3GiuOJ7ZLC1BeLSJAk7WVRoNRizlO9wktU7O8fEvPUjKlOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZZa//soJPrA9grI4O9uBiGZFcRY5qzlndEEvClSCQE=;
 b=sX4oeMK0bXfQI3VzTHZdPzYBVoZ2zjLaPFGy+3Cko5ZdPCax38HKu5O6WUqj7P4RprZpi465u89SD8DIDY6LLttXZaeLX0QGZy5Uxc0pYIkKtexbGHno6Db49aXNGQBaazjC8L3x5GIdIljOpHbd6gSbq3Hi/gbFvonXsO+/8djegZlGwcgTrXCXZdAIa79NPe3ntSjN2XliMyMyz72Fuc2PaIw8hcuPOFQRdTxMmthgQjJuUEjLqRU4LLO6xrmrB8fk8sWcTch9bd7RKH4XAJmzQmbM4OB0bD4m79SMxbusYOTyCD0z2VH7LEFZdJYnXPz8e61DwO0Lz5PNAUsz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 06:31:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 06:31:18 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/2] classes/recipes: remove unnecessary qemu
 inherit and qemu-native dependency
Thread-Topic: [OE-core][PATCH 1/2] classes/recipes: remove unnecessary qemu
 inherit and qemu-native dependency
Thread-Index: AQHbqc45rky9Rg2LXk2m9RhB9M5JKLOcbEIAgAACxKA=
Date: Thu, 10 Apr 2025 06:31:18 +0000
Message-ID: 
 <CO6PR11MB5602D636B4069B499A6EF4D1EDB72@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250410040825.1283228-1-Qi.Chen@windriver.com>
 <35ee8bfe577addc9e6ae978588b5a071be82b478.camel@linuxfoundation.org>
In-Reply-To: 
 <35ee8bfe577addc9e6ae978588b5a071be82b478.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SJ0PR11MB6696:EE_
x-ms-office365-filtering-correlation-id: 98584373-00d9-4740-b5e5-08dd77f94d62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aG5xeEdNMmdOYkVibVY4YWJzL1BTRzBBY0xHQjBwM2pscHgrcnN1VFZzK0pu?=
 =?utf-8?B?N01XWHFST1hsc0FtNjNtdFFSK3hiQXMwcWpndkdVUVowUW9nQXpmSTVSUmRl?=
 =?utf-8?B?UXFZbkdvVldHZEV1ckFFRUhGempveVl3WEo1QUhuY0N3Uy9qbDRpekd6VFpl?=
 =?utf-8?B?L1Q4UnVxWWdBWkpXZjA1SXRWNjVmeVhDaTJQVUJPUnZoUldJNExJZTFTbVQy?=
 =?utf-8?B?Q0xXWkxoT2ErRzdkUnVnTys3U2NXSk1KOW5uMlNGaFoyaDhEZzluNGZ4OTl3?=
 =?utf-8?B?QlhZYkJML3lpK2lRZDRURy9xc3FUWGtXSS9uQW1jSnBhaVJ0cDdJdkJXRE13?=
 =?utf-8?B?TXAweFZ4VzJRUGZ4Nmlld0NpWnA2b2tjUDMyTlVqbmJ1Z0dQaXJWdURvblVU?=
 =?utf-8?B?OXorMXRFb0p6Y1VnYUVXZ3BJT21sUmRFSWZHTVBHUml1anRIZ1R5aE0xaU9k?=
 =?utf-8?B?bkRsT0FtUWVZb01oSWhReXcwbXdXYlpTK2JDVDdKbk1OZnBEUVc0MENIcmhJ?=
 =?utf-8?B?MnZnUDZxNFhGdUl6Mm9xYWVybktxZEFleEtGU3hzM1F5eVFkL1JiRjF4azRW?=
 =?utf-8?B?OGUxUXVMWjN6Z3JHTWpHd0MxS1d1cm43SmVPNUNabUxLcWtkSjBUeGF0MmUy?=
 =?utf-8?B?UnNKVVNiY1VOYmRwYlBqNDRjWlN0TEdTeFRSTVpORTl6ZXBaY1YxZjZya2lv?=
 =?utf-8?B?OGlhWVlXOVBQSkVqSU40NFR6SjFkbmJLYTZRbUFuRGc2ZTU0NHJ2SFFEeWo0?=
 =?utf-8?B?WTJnUHhBeTAvaE90YnIwMlhlM3d3cUZVTmZCVEo5ckxwTWZSM3JNdmV0RXFw?=
 =?utf-8?B?VTFCUzVSTzk0ZEVya04xZXpadTdEWWlDUU9xbEFab0FYK0NzNFVyWGZzb1RT?=
 =?utf-8?B?TnQ0RlBTV2dQUjB2NUZWQWJ5dXgvUWlBcWpyVm8reERHbkhUZ1hpUnRlWlhS?=
 =?utf-8?B?bGg1akx1UUhFTjlRVG5aQ2JndjZQQTlkOU0vZzhjbWhwcEk1d1dsOU1rRW9r?=
 =?utf-8?B?WUlxK0U4eVJGYzhJRXpEckZvenc2NGJkY2dFZXQ3enJUaXJ3YlM2VHlGbVUx?=
 =?utf-8?B?bXE1WG5OZUtOR1REUzEvYlR1bDlKMVg3bDA2UnJPOVp0Qk5Bb0VFVUVVUE9F?=
 =?utf-8?B?MmhiaUhCUE15QzRCazRMQTlDaFp1cmViV2VVTDRFb2dmdlQ3alZTSUdHWC9t?=
 =?utf-8?B?TmFITHZuYUV3ek02dDA0emFSSWF3QzVoaEgvcU5WTityL2g3endBOEx3Qktj?=
 =?utf-8?B?VTRBZlVZcms0MENheElVakhoazhoN1pLZHN0dHY1dkxna3dRTEtlZHRIUWZI?=
 =?utf-8?B?bFkxcmZaL3JXcWJmWXVQakVOYWNob3dSaHdCT1k2R1JsdVdnUDcrbUNsRm5m?=
 =?utf-8?B?WThTblJPUUt3NkVvMGFCUkg4MUJwWk9Ld1ZQeHVZMGZWcGcwT1NqTEgrVURV?=
 =?utf-8?B?ek9TOGg3RjdSdFhjcE5Nd2E5dG5ZSHo0cmhDOUM5L2xzcHpjMGRWanlya0dU?=
 =?utf-8?B?OEhZZmppQVFOK2xyQ1dBRjVUUW0yYzdXb0NRMThJRVdIc2tpZ1FkVDV3ckI2?=
 =?utf-8?B?OWlXTTlqQXNKa3FWZTdTUzFkKyt4WTVIVzFWWU9FVVZJd0lLUlVpaGpUalpw?=
 =?utf-8?B?UVZjSTJqQk1nZjlsN1h4SExYekk2M2E5bi9xTmZIWjJHek5CYndkV29yOEgy?=
 =?utf-8?B?VEJhOUZNMWhlWGwvSm11OHlrZUNKc1g3T1pGbityMEg0N1BxVUlKa2RRNVgw?=
 =?utf-8?B?NktnVVREOWxBbjR6TVB3ZnVyaWdjekVhZTBpa3VqREluV0dtckZXTndnaGgv?=
 =?utf-8?B?ME9QUmpicklYejAzYkh5bUwyZ0phVU5rRDRvYVovYlJqL3ozZUMzaEdmcmxs?=
 =?utf-8?B?OXg4clRrZWRCNVB3Zk1NSlVyTExYeGVzSDR5bU1Rek5LMVNjVWc0SDcxUXRz?=
 =?utf-8?B?SWV5UkdzV3lTaEVoZy8vV29BY0lzUURLVkZxUXg3dkFQbERIek9mN0dVZUc3?=
 =?utf-8?B?dHlieHk5R1dRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WGlwZ3lxMWQ5aVp5TlN5c0wrNFUyQW9ITEt4OUdyVnFYSnBpeXRNck5zQmVQ?=
 =?utf-8?B?NEZTSDlydWE3T3J1VVlXWXo4RUxYblEwdTI4L0Z0Z00rNEYwUVFZU2V0QW56?=
 =?utf-8?B?K1paam8yY0pReVFsTEdaT2J1YnJvcWVUQlRUN0lLQUtVekwraTZSU2lCelV1?=
 =?utf-8?B?Zkp2dkFlSFRtMDB1eGdScSs4OVl0c09KaE11MTJiZFoyYTIzZHVDc0pQcEFX?=
 =?utf-8?B?Qkk2cVFVUmRxamdVcmRvbFVLQWowQ0pVdjJqQ0szV0VyM09NWnd4RHczeDI1?=
 =?utf-8?B?K01xRys4YjJCd0k4cXBpemtuVFJVNlRBWm5seWJXSU1BeTBiUGlTVXVja0FJ?=
 =?utf-8?B?LzVyYzF1bEpESmVRbmNIUWhYaVVtVVpPSHpTbmdLZlNnYUFOUjlONFUxTnhQ?=
 =?utf-8?B?NlRTVjFUb2R0TTd1N1NIQnkyT1RzMElJejJteG1KQ1N5WUZqTTVQdnZxUTRy?=
 =?utf-8?B?S3d0M2NDTjI5cy9MWSsxelBTbGFGandIWGFQYlE4L0hGRk9CL0g3cnZ3NXdz?=
 =?utf-8?B?VzBRUTVRN1Q5dHA1YUVNayszTWtHNjRMQUZRQ2NqWWdVL3lQTFVWbEYwZVFh?=
 =?utf-8?B?d3BObE5iaENGc3FLL2Q3aitoTHdaV0ZIc2NvaGFYVE13OWlOY21MN3VObkh4?=
 =?utf-8?B?cmlqRVJxck9kaSs3QTY1YWl2WkFXdFpZZkNWT2hZWFd6Q3RQVVJ4Nm85Nmtx?=
 =?utf-8?B?ZkdqV2VHWUJNRXJBSHhvek01VEtCbGVTOGJpc3ZVQXF5RWI5cVhPZmkrSjJn?=
 =?utf-8?B?S1g3emprV3h4UUoycjNDTmpod3Z6MmVZcG1DUTdzV3FBZnZjaGx2M1J3NlNZ?=
 =?utf-8?B?OFd0bzFPWjY0eWdNWW1SL3VLRXhwc0J0SGFYNlFtNFZ4MjJRVitUdmFuU2kv?=
 =?utf-8?B?ck92ZkVLaG40YzJXQ2hiN1J3N1NIR3Q0TU5MOEhYcDdOajlZdGd0aEhlWUJo?=
 =?utf-8?B?aTJCRit5akxZeW9qN3VnK1ljNlVLODBWMDlaWHAzdUJIOXNSYTVVbGU2bVhV?=
 =?utf-8?B?S0FFQXd6V1dSYldHRHdIdm9YcDNoUkwyZUhGdXJBQzRwdkFlYVg0RDNHdG5a?=
 =?utf-8?B?OGEvRDBuZlZFQUlHb1hIMjVtcVpSL0dDU0dORmhMMU9kdFVuS0VJSFVQQ2Yz?=
 =?utf-8?B?Sms3ZXRxd2lSY3hSZWJlb1Ewa1FqS1BvVitpSlB3K0N3WWlYdDNwbm9vaXFa?=
 =?utf-8?B?SE4xNnJ4a1Z2Qjdrbi9mYStRQ3NKbzFSR2tTUnN6YTc2Y1h5TW9TOWhLNHFZ?=
 =?utf-8?B?dW9KZHZvQ0RGOThmYlAvMUIwVmVraENzMDVVR0c2UzFmdGhWN0J1OWtjODBk?=
 =?utf-8?B?a1RHOGxZS1V3OXBGVGJUOGtHRlBRZHJVa0xNdG82LzBqaTVEeWxxR3NudXhu?=
 =?utf-8?B?TzlidjEzV01OcytjZ2gyL2x4Sm5lV1Z6UmZ6cEF0MFpTeDhRcG5VWFRSMEVT?=
 =?utf-8?B?OC9ZOUhGMnBrdWVTTWd2L3B4Tm0rS1R6ajlrbWNsa1ZYczdPUFJMenAxY3Rn?=
 =?utf-8?B?MEJpTzJFdjh6aWliOHVjSkRhbWMvMFRoTXNvUFY1S0tndWY5T2o2VXdXRnZI?=
 =?utf-8?B?eUt3R1NoUVNUTU1vaHEzYlZOa0w5MnpDSFNRMjdkMi94Nk9ZN21GRmNIZUlX?=
 =?utf-8?B?Y05RYk8wZVlvUVFrd3NQY2hNTDA0b1JhaDdKZHlxdG9rRkFpZVpxSk5yaEIz?=
 =?utf-8?B?YVVBaUdINjFkTThYOCtDR0l5SE5pOGR0K1lzNlZoYUhQeEVpWnhBZWlpaFBy?=
 =?utf-8?B?WnI2emRjRDg5RW5obnhFcUpZMXE1NDhSOUYybUo3QjRRbjJrd2dNQXZiYTFy?=
 =?utf-8?B?UWJWejROVEdsT1NHNDFyOGxjNGw4NFZFTkRBL0Z4a1UwZlVlWFNhSGlDVHpi?=
 =?utf-8?B?YUFrZ3pwR1lrdFhmZ0VhbVNuVGdwK0FOVnFzK3luTTM0STdNUTNXZWRUaGZh?=
 =?utf-8?B?V3ZZQUo5VTZPcGQwS0NNSEpuMUk2YzhkT001ZFNEZTRLT0tDNktCU0RZcUFs?=
 =?utf-8?B?bGRDbVpZUGhWbWxreGRCb2NVdURrT2pIbmcvOG1CTXVINXZvL3gvR1FtRURJ?=
 =?utf-8?B?MjI3d3F6WlJLWlhpdzNVYzFRcXFFVCtYSWUvY2d4b21tYUF3ZkVYbklZQm43?=
 =?utf-8?Q?fb9Tng0BfO2ibuKFyjyX1gjAt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98584373-00d9-4740-b5e5-08dd77f94d62
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 06:31:18.5165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtrhB59sYXosQGngrLnx7GWYYTMu1hJ1uo/jNDCPrtRrEL5W7xHE0Ux7vUf/LJG6NPfqM1KGQ7W46A7rD0Q8yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
X-Proofpoint-GUID: n7pV9zNv24NUUmyWtdBFmXznwh-r0PDD
X-Proofpoint-ORIG-GUID: I82FTBZAYAy7ZLmh791nWliupG81Ut1w
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f765b9 cx=c_pps a=IJ1r+pqWkCYy+K3OX67zYw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=SX0_DCrbduap8XM1zDMA:9 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=870 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214620

SGkgUmljaGFyZCwNCg0KVGhlIHBvc3RpbnN0IHVzZXMgcWVtdXdyYXBwZXIgd2hpY2ggaW4gdHVy
bnMgdXNlcyBxZW11LW5hdGl2ZS4gQnV0IHRoZSBwb3N0aW5zdCBydW5zIGF0IGRvX3Jvb3RmcyB0
aW1lLiBBbmQgdGhpcyBkZXBlbmRlbmN5IGlzIGVuc3VyZWQgYnkgdGhlIGZvbGxvd2luZyBsaW5l
Og0KbWV0YS9jbGFzc2VzLXJlY2lwZS9pbWFnZS5iYmNsYXNzOkRFUEVORFMgKz0gIiR7QCcgJy5q
b2luKFsiJXMtcWVtdXdyYXBwZXItY3Jvc3MiICUgbSBmb3IgbSBpbiBkLmdldFZhcigiTVVMVElM
SUJfVkFSSUFOVFMiKS5zcGxpdCgpXSl9IHFlbXV3cmFwcGVyLWNyb3NzIGRlcG1vZHdyYXBwZXIt
Y3Jvc3MgY3Jvc3MtbG9jYWxlZGVmLW5hdGl2ZSINCg0KUEFDS0FHRV9XUklURV9ERVBTICBpcyBm
b3IgZG9fcGFja2FnZV93cml0ZV9ycG0vZGViL2lway4gVGhlc2UgdGFza3MgZG8gbm90IHJ1biBw
b3N0aW5zdCBhbmQgdGh1cyBub3QgdXNpbmcgcWVtdS1uYXRpdmUuIFNvICdxZW11LW5hdGl2ZScg
Y2FuIGJlIHJlbW92ZWQgZnJvbSBQQUNLQUdFX1dSSVRFX0RFUFMgc2FmZWx5Lg0KDQpGb3IgdGhl
IHJlbW92YWwgb2YgcWVtdS5iYmNsYXNzIGluaGVyaXQsIHRoZXNlIGNsYXNzZXMvcmVjaXBlcyBk
byBub3QgcmVhbGx5IHVzZSBhbnkgZnVuY3Rpb24gZnJvbSB0aGlzIHFlbXUuYmJjbGFzcy4gU28g
d2UgY2FuIHNhZmVseSByZW1vdmUgJ2luaGVyaXQgcWVtdScgZm9yIHRoZW0uDQoNCk15IHRlc3Qg
Zm9yIHRoaXMgcGF0Y2ggMS8yIGlzOiBxZW11eDg2LTY0ICsgc3lzdGVtZCArIGJpdGJha2UgY29y
ZS1pbWFnZS1zYXRvLiBUaGVyZSdzIG5vIGVycm9yLg0KDQpSZWdhcmRzLA0KUWkNCg0KDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBUaHVyc2RheSwgQXByaWwgMTAsIDIw
MjUgMjoxNSBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+OyBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVd
W1BBVENIIDEvMl0gY2xhc3Nlcy9yZWNpcGVzOiByZW1vdmUgdW5uZWNlc3NhcnkgcWVtdSBpbmhl
cml0IGFuZCBxZW11LW5hdGl2ZSBkZXBlbmRlbmN5DQoNCk9uIFdlZCwgMjAyNS0wNC0wOSBhdCAy
MTowOCAtMDcwMCwgQ2hlbiBRaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4g
RnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiANCj4gU29tZSBjbGFzc2Vz
L3JlY2lwZXMgaW5oZXJpdCBxZW11LmJiY2xhc3MgYnV0IGRvZXMgbm90IGFjdHVhbGx5IHVzZSAN
Cj4gYW55dGhpbmcgZnJvbSBpdC4gQmVzaWRlcywgcHV0dGluZyBxZW11LW5hdGl2ZSBpbiBQQUNL
QUdFX1dSSVRFX0RFUFMgDQo+IGlzIG5vdCBuZWVkZWQgYmVjYXVzZSB0aGUgcHJvY2VzcyBvZiBn
ZW5lcmF0aW5nIHBhY2thZ2UgZG9lcyBub3QgbmVlZCBxZW11LW5hdGl2ZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+IMKgbWV0
YS9jbGFzc2VzLXJlY2lwZS9mb250Y2FjaGUuYmJjbGFzc8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MyAtLS0NCj4gwqBtZXRhL2NsYXNzZXMtcmVjaXBlL2dpby1tb2R1bGUtY2FjaGUuYmJjbGFzc8Kg
wqDCoCB8IDMgLS0tDQo+IMKgbWV0YS9jbGFzc2VzLXJlY2lwZS9ndGstaW1tb2R1bGVzLWNhY2hl
LmJiY2xhc3MgfCA0IC0tLS0NCj4gwqBtZXRhL2NsYXNzZXMtcmVjaXBlL21hbnBhZ2VzLmJiY2xh
c3PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQ0KPiDCoG1ldGEvY2xhc3Nlcy1yZWNpcGUv
cGl4YnVmY2FjaGUuYmJjbGFzc8KgwqDCoMKgwqDCoMKgwqAgfCA1ICstLS0tDQo+IMKgbWV0YS9y
ZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI1Ny40LmJiwqDCoMKgwqDCoCB8IDMgKy0tDQo+
IMKgbWV0YS9yZWNpcGVzLWNvcmUvdWRldi9ldWRldl8zLjIuMTQuYmLCoMKgwqDCoMKgwqDCoMKg
wqAgfCAyICstDQo+IMKgNyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE5IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvZm9udGNhY2hl
LmJiY2xhc3MgDQo+IGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9mb250Y2FjaGUuYmJjbGFzcw0KPiBp
bmRleCA2ZjQ5NzgzNjlkLi42MDgyYWYwOGYzIDEwMDY0NA0KPiAtLS0gYS9tZXRhL2NsYXNzZXMt
cmVjaXBlL2ZvbnRjYWNoZS5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvZm9u
dGNhY2hlLmJiY2xhc3MNCj4gQEAgLTksOSArOSw2IEBADQo+IMKgIyBwYWNrYWdlcy4NCj4gwqAj
DQo+IMKgDQo+IC1QQUNLQUdFX1dSSVRFX0RFUFMgKz0gInFlbXUtbmF0aXZlIg0KPiAtaW5oZXJp
dCBxZW11DQo+IC0NCj4gwqBGT05UX1BBQ0tBR0VTID8/PSAiJHtQTn0iDQo+IMKgRk9OVF9QQUNL
QUdFUzpjbGFzcy1uYXRpdmUgPSAiIg0KPiDCoEZPTlRfRVhUUkFfUkRFUEVORFMgPz0gIiR7TUxQ
UkVGSVh9Zm9udGNvbmZpZy11dGlscyINCg0KSSBwaWNrZWQgb25lIG9mIHRoZXNlIHRvIHZhbGlk
YXRlIHRoaXMgYXMgSSBkaWRuJ3QgcXVpdGUgYmVsaWV2ZSB3ZSBkaWRuJ3QgdXNlIHFlbXUgdGhl
cmUuDQpmb250Y29uZmlnLmJiY2xhc3MgaGFzOg0KDQpmb250Y2FjaGVfY29tbW9uKCkgew0KaWYg
WyAtbiAiJEQiIF0gOyB0aGVuDQoJJElOVEVSQ0VQVF9ESVIvcG9zdGluc3RfaW50ZXJjZXB0IHVw
ZGF0ZV9mb250X2NhY2hlICR7UEtHfSBtbHByZWZpeD0ke01MUFJFRklYfSBiaW5wcmVmaXg9JHtN
TFBSRUZJWH0gXA0KDQppbiBpdCdzIHBvc3RpbnN0YWxsIHNjcmlwdC4gVGhlbiBpbiBzY3JpcHRz
L3Bvc3RpbnN0LSBpbnRlcmNlcHRzL3VwZGF0ZV9mb250X2NhY2hlIHdlIGhhdmU6DQoNClBTRVVE
T19VTkxPQUQ9MSAke2JpbnByZWZpeH1xZW11d3JhcHBlciAtTCAkRCAtRSAke2ZvbnRjb25maWdj
YWNoZWVudn0gJEQke2xpYmV4ZWNkaXJ9LyR7YmlucHJlZml4fWZjLWNhY2hlIC0tc3lzcm9vdD0k
RCAtLXN5c3RlbS1vbmx5ICR7Zm9udGNvbmZpZ2NhY2hlcGFyYW1zfQ0KDQpzbyBJJ20gYWZyYWlk
IGl0IGRvZXMgdXNlIHFlbXUgYW5kIHlvdSBjYW4ndCBzaW1wbHkgZHJvcCB0aGUgY2xhc3MgaW5o
ZXJpdCBvciBkZXBlbmRlbmN5IGFzIGl0IGlzIHVzZWQuDQoNCkNoZWVycywNCg0KUmljaGFyZA0K
DQo=

