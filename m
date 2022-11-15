Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC6DC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 04:24:42 +0000 (UTC)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com [216.71.158.62])
 by mx.groups.io with SMTP id smtpd.web09.2038.1668486273179316279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 20:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=jz21UHdS;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.62, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1668486273; x=1700022273;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Da8KbwdgCvjhnyZJiAb5rwqzyAJ/xWLpk66syIDBCG8=;
  b=jz21UHdSt6Pn83rxv6Zmm0W5jtUZoXZ+HdDxBqgCrRYVa8+/YLYOBkUl
   RO5De3z4U7p/JuVZjjL3B2duiWTC0fS5h+HEsogY327fJhASE3rgJ6CcD
   mYUEuNaV+DZ+fk15vAo3D038ZWSF0N2oVKkajeJh5D9qa9sUUlMYPg1d9
   q9pUhjGtdOzdoxzJqcJG3iKM90AosbXri+u+FxJBJe7LMQWVMaPUgs2B6
   Uw0CJ+qjbUyUYATygCwfmEcxTd2qoFp91Zy5tgF/7LK8dFnSDImWmkOXZ
   GRWXQZZdd2Mp8NniEasKkkLAS0Z7/ue78sXnrNhfLOv8RP1NvwhCLYG1S
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="69610410"
X-IronPort-AV: E=Sophos;i="5.96,164,1665414000"; 
   d="scan'208";a="69610410"
Received: from mail-os0jpn01lp2106.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.106])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 13:24:30 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecwLvIBiyQAz1pnGHvtrXxx8Zgo3Kwul7dBcA/Vr7Ldkl7Cw8sZUPsTiRsI2qmR9xd7GRuzIpCkh6+pDMUfBQasl2G4HePGzh4a9eIvj+MVpNTiuVvjCKkvpJ/kloytrCXeTak/sUBwQSgV8/WqhOgGkTXs3Fv+x2P8NGtZxHOQ0BJpR/c0PBQS0ywOxvDdR3QPtypsk2IkGhQczsZ3T/e24c4mfYygMXFrRg8dQDSfMui+UiiVQBQBP0ibTaErCxjm7WRd8NG8FMYaxjdMAKlF4vyKlEslI2SdVgCcl97FsKl/t5dAUjNm/aCCb21oSLElPf/+VJg4eJDX3v4tnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Da8KbwdgCvjhnyZJiAb5rwqzyAJ/xWLpk66syIDBCG8=;
 b=A93I962joD53j8RkJf9fRi5yuGM1b0YfLj0JTATLe7G5z7GZWau6F5H+2BadreWxOI2B4ehcSxlpY3fwQ4zn5F1H6czTupmeoCye8RiWUowuR2oxqCC+hTs6Psvy0mH7sgQcg4rLNh2d+OWrZlO7Y4aKhny33TQpCk+99kr25I9gZs/AF+0lWzsnUUCSz+6BCCbkQLQyXfKwioXRhfHTPl0g9y5tZ1mKKsexYkOztiijsBwzoH6CNjz9zZmRb/KEa8FloWYgRsJKcnsfOJYMuEB0TggeWLKGrAOyTvBI/rFofIHsmcPcfge10WvSCk9GBgasYwIO2FF/buYfZc/C/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY1PR01MB1852.jpnprd01.prod.outlook.com (2603:1096:403:8::12)
 by TYWPR01MB10838.jpnprd01.prod.outlook.com (2603:1096:400:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 04:24:27 +0000
Received: from TY1PR01MB1852.jpnprd01.prod.outlook.com
 ([fe80::89a7:3bc5:12f8:d1ee]) by TY1PR01MB1852.jpnprd01.prod.outlook.com
 ([fe80::89a7:3bc5:12f8:d1ee%7]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 04:24:27 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
Thread-Topic: [OE-core] [PATCH] Add nativesdk of systemd-systemctl
Thread-Index: AQHY7QFIBQMsVp+k1UKO0El4Doc6zK4orwEAgBbK4yA=
Date: Tue, 15 Nov 2022 04:24:27 +0000
Message-ID: 
 <TY1PR01MB185285872196B8449BAB2378DC049@TY1PR01MB1852.jpnprd01.prod.outlook.com>
References: <1667204240-3627-1-git-send-email-wangmy@fujitsu.com>
 <62CE5E7E-3A59-4845-99BE-8672974E2822@arm.com>
In-Reply-To: <62CE5E7E-3A59-4845-99BE-8672974E2822@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NmZjZjFmMDktMzczOC00M2E0LThjOTEtOTI3OWIyOTU1?=
 =?utf-8?B?MmRhO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0xMS0xNVQwNDoyMzowMlo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY1PR01MB1852:EE_|TYWPR01MB10838:EE_
x-ms-office365-filtering-correlation-id: c5d1222c-8bfa-4b0a-e2ad-08dac6c14869
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9ZqjZKxb2RD0UeFM0UNpZUntFkbH7yrmS6t3v3IE07T/9K/El2xrk45BAygn0fCVcQt7I8W/lE2hiMlT3p8qgzz66LU9/9JhElv5ZRbzoKN17R+bLeySrwflTdKKDs10SFn8x/Vl/kbMdqDCfGDXai7VeIWcwh/dBtuQ/ZT6rbr5zBTxlW218kkEK7pNpz6IwNiIaK7dPLlv/Tdw5aEBLQLG0r3eWkkGXYYR87jFM4Ax7AURt3Z8NmWpT+8dbQdl76v2tBZCFAY3rhYrwTQmjeaUyhFf2cr5FwL/ENFk2HYtQykUHQpsAQmFjjEpSvwN5fYnyWZD8+filsWwPe/Ah1kMFKPmMI2EIK2py07MUMjigNTHQa5nh4vLrgkH7FIr+gEKSveplUQAc1SiUQDFvTudOGyOtnno6ODCEdynqnc1y51+dadTeHAa9fyS+jPPAnyaSLsRh/H34Fvh6SCN8UgvZ+Cqbj91haSVAjDkdSGV8uhN0w/UoWd6RTLT43OUQsayaYez9aLdNg1m7Bvef45nDF6VZE5VT1XChBUgejdm8z0NSgAeHWFxwe521wsEh9s6Me5e5a8XeIdmIOiwy3dE/Ijx+2JFyW6CckS0i0LJ6nCYAw50Jo1NsidjqidoeRepvVACIPOz/Qz0Kyt4L92wn8B3WQxac83zdozTlxYoMwYKPZ8TslrCUBwYRqrSeKM/UXbecovO9OSLCo9dI76jvqNI7BGPQtR0cxJGPgqHR91sUKBuWGk0NmI9czpOBLMP0IS6NYGl0yvrOefhaFw2c0ZJ9BKJB+09b0wsKyOT05+e624BbkmS98AIxZiED4FU9//li37lM1jSkvPo0A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY1PR01MB1852.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(1590799012)(38070700005)(52536014)(8936002)(478600001)(966005)(1580799009)(7696005)(316002)(33656002)(6506007)(55016003)(6916009)(2906002)(83380400001)(71200400001)(85182001)(122000001)(41300700001)(86362001)(4326008)(66476007)(66946007)(82960400001)(5660300002)(186003)(66556008)(26005)(64756008)(9686003)(76116006)(8676002)(66446008)(38100700002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N2c5MXVKT3lOSFJxbk5MN1IyaEdTRXFyMWFDSmhGeVc3dkJYVjRPc1ZuVncr?=
 =?utf-8?B?enJ2ZDRNZWJSVGdOaHArMnJ5WEZ4NnpIWmt4K21jTUIrNWQ1Wjg4b1FlOXhM?=
 =?utf-8?B?Q1BQUXpOc1FzYTh0bzRxaXIyb3JPN3dBK0dlUDNmV1BuTlhIUmZBYis5aWE0?=
 =?utf-8?B?V1ZXclRybUorZWxDenFDOVRpUlFIaXVDT1EzQjZtTTRtNkJFRG9oaUluckJY?=
 =?utf-8?B?a2YxbjNIRHdZNmFEdGNZUWxyRVVpK3JaNHBBME84R1hWUnJXWUkwV2hOcWRV?=
 =?utf-8?B?Rk9YeTdIYUx6QncvUEZZNVpqN3FGbjFWMHFqNjRwR3ZPSUkvVXVwMDU0MGk5?=
 =?utf-8?B?dkMyZFNWSHdCK1F4cHFOOWlBbEpBZHRKSkpNeGg3ZFlzVmhFaCt5cXdHSmE5?=
 =?utf-8?B?NkpvYktxWmdrTzNpQWIwRXl3b0VsRWFONXNyWHZMUnZhdjhITitWMlJTWjdD?=
 =?utf-8?B?MXBvNHo4b1NZRVJwMkdDNXlKeUZkTndSOTVhd1Z2eUtyK2Q0ZEgvRWc0RDBo?=
 =?utf-8?B?VWRZSWc3WXNBaWxuMFZ6VzN3MUM1WU9tY1pYWGw1d3FvN2xHN25PWkxCZUxy?=
 =?utf-8?B?aVVqQ1dwd0lMNmZpaU9YU1hoeDIzQnlPUzhRbzBIeW4rTzI5RkpuVFgwd1Nt?=
 =?utf-8?B?SG50RWR4ejdHVUNLdUhmSFdwNG5YUkVGdkI3ZUQzRlk4aEVkYSt3QkxNTFhN?=
 =?utf-8?B?MktqbjMycmNjY1A1Zk9LNTE1cTUzRXNJS0xPSjg3VGRyeWlHTTBhZUV3M0t3?=
 =?utf-8?B?R1hBNXl6UVEySVVyanBTUFNZZ3hma3FlTlpHYmVGMWVmZHJmYjFjNnBzQ3po?=
 =?utf-8?B?T1RvakhWVldJemJlT25EeGNyZmYxRnl1NEFzWjNzdmxaNlp1SlRTbm1nSEEy?=
 =?utf-8?B?RTJpZGpPenY3UTVSMEJuenNDa0M4a2NMTEZEMW9RL2NhK2FrMDRzMG5Kc2VE?=
 =?utf-8?B?dk01b0dNQzNRaHRPSGcyOWhhcW5JSlZMSENJaHFkb0EwTzE4eFR0a1A1UGZ3?=
 =?utf-8?B?bEpsY3hZamN6S1k4ZE12bVFVMmhFY0JwVDh6MGd1YW1MQldoTlFXL2dieDRV?=
 =?utf-8?B?L2NhNnUxTy9RVlQ3eTk1V2x4TDVjQjEvcDc1TGpOeHNmZDIrVTR1b2dibk9m?=
 =?utf-8?B?bkNXVUdYdjk3R3ZzZUJzcmxGUy94TjZNM1N6N3FUNi9vbTgwMEdvWkRCeUl0?=
 =?utf-8?B?T3RLS1NER1poV3Rnek14YmkzWG5laitWeXNBeXJBeUVYWm0zVFkxeGkrY25C?=
 =?utf-8?B?dUpod0g0OEJwb2NoWVllQS9WM3R2QzlKaXFvMDZyUWQzWXRxeVdCYlVOVzBY?=
 =?utf-8?B?dWJoMFJVSEhRbktCbU9XWHR0VmFuNlRXUlhNTjRhQnhyNGRXMU40ZzYrWU51?=
 =?utf-8?B?K1ZQb05UVnp2ZGhFWUpIQ2lnNWRrR3V6VTY0OUFnK3NVOFl1ajhWUmxObVpT?=
 =?utf-8?B?d2N1aTdtbUlEbXFha1RZTHJLUW9XWHBIU3pPQ3N0OFVUQi9XVm9HZzdsN0s0?=
 =?utf-8?B?YnB6WHdEYmR5UGdIVzJQOWpSbmZNeFBTZmYrUnhBWTg3K1J6V2RMSHlGWlZj?=
 =?utf-8?B?QUJjdGFKSTB3akpROHJGSTVLRGdtM01QNGlMS05kc2c2STdzYy9HMlBwMFlM?=
 =?utf-8?B?K2ZWM2h1aHRvZzlPVTRrL3pwQ2ZISC8yL0tIbjFjT210UjVQUmZUVjBWOHVC?=
 =?utf-8?B?M1RSV0MybjUyRllneE1OZ1ZlQllwb3BTUVZCRW9nT2VDbjNXbHoxRzU5SHV2?=
 =?utf-8?B?dnJleXJ6dkF5K01QcWg2V0RzNnNHV3NGTGdZUWpWV2lWWER0SDVNSHRITVdL?=
 =?utf-8?B?VE80TkdSNk1tTHJoaXlHR2J6b2g1MjU3aXV5dlBrWHQ2RWl2SnA5M09xSDJE?=
 =?utf-8?B?K2FETnpXSzQ5NkZrekFYZEhVeTZ4OHZqa2pKUnRBUlNpVk40OXQrYnBZbCtI?=
 =?utf-8?B?ZVNqMVdPOUNuQkU4eHQ2cFBKNkZsaEc3dWZZMGIrM2hobWFvQkQrTUJ6WS9y?=
 =?utf-8?B?QTZPck05MFhXS3BoakRjOVhaQkVTc01SVzBlWVNJeXk0MGlBdVo2RncwajV0?=
 =?utf-8?B?b0dvTDVMdTI5RGYxQ3JxMitObTNOVGUvdmFPZzNIK0hqZTF4TjVyY3JPZEI0?=
 =?utf-8?Q?3TR1tjtngFHO95b3d1MQ4idiN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	w4d4jOVTuqoZUA+q/ciwNemi/nlg1ME2tsnv7MRTGJ+byeibIXt9IGWabOS+dkPBK2RDQjihO0irmJ7KNOsvHOI8mutyDFXJrF2Lf8AfrtMimGGrhT/GloTsKrM6DilYi/6IXIV7UkiouqJ9WtCxAX11CMkeZs4dkqVTluwJK8BCEQV8ZZzoFd0GBtYexphk7rhj3i28UwqVI1caL01piG0xnChjfMkEByPzFaDUa2+KydBgXdFce2/R0Hqy8YYJx8yqJyrv6BtjGaq+Fssody2jtyq1tYY19gMObLD9yw2/MDWnoxy4Xs8pBnNmHSGI2EqUR6DKF/l5o+mbtsUvIDhYQeWMoad2pOIe9eYUbTMXmCbCcRykxCJXlCQJkmLWrEJUuleDh8uO18c39T4/F/VmCVYikE1XzdbYbAZJCjs2XA1lkN0IofYVwIxwGwh288dYmqyGTNUUDJ8lg073bEtxMeBM2KOyNgRmizlfuYMM+8rpbmSFp0uQO9j3AYm/fZ68ti5yE8nGQ1N6BE7OQ2uEdXY0VVxOPyQLH4obSoLy06pf3pdwC6UQDu0AchTEiT33+KHc9ZXzAVuzdbuaNhyexB6DiDNR8Upw2ZiN8oMR5HbR0rxyKNuaaSS/s9caOtTrKgJ1FxppauawN+StMVxxSrFHs8D32eIqOIbq8Bq9F8U9QpjZCFZOv+q08ImWOHcS8yl8bLssaI0X+w9WiFrtUWiUh6GjeNLQOq2YDQQmAI4SIaVkXrx9oR2DJb8UBlAJ1KsIP/pYRYJztoPbGukC6vT24e+k3kFwgvk92mMtTBKakLtgovavC86i4lp4
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY1PR01MB1852.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d1222c-8bfa-4b0a-e2ad-08dac6c14869
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 04:24:27.1764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSBDK+zX+k+BZ9j5mk1cqfMwx9/0rnKG9op5FXUPOhXhRWOcUyPva4uM2KrBrkDXR76NXDxXYEqjiC3mvBaCfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 04:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173265

U29ycnksIEkgbWlzc2VkIHlvdXIgZW1haWwuIFRoYW5rcyBmb3IgdGVsbGluZyBtZSBob3cgdG8g
bW9kaWZ5IGl0DQoNCkkgYWxyZWFkeSBrbm93IGFib3V0IHRoaXMgbW9kaWZpY2F0aW9uLCBhbmQg
SSB3aWxsIHN1Ym1pdCB0aGUgcGF0Y2ggYWdhaW4gYWZ0ZXIgdGhlIHRlc3QgaXMgT0suDQoNCsKg
IC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVsb3BtZW50IERlcHQuSQ0KTmFuamluZyBG
dWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKSBOby4gNiBXZW56aHUg
Um9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMOiArODYrMjUtODY2MzA1NjYtODU2OA0K
Q09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0
c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2NuL2Zuc3QvDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+
DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDEsIDIwMjIgMTI6MTkgQU0NCj4gVG86IFdhbmcs
IE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IENjOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W1BBVENIXSBBZGQgbmF0aXZlc2RrIG9mIHN5c3RlbWQtc3lzdGVtY3RsDQo+IA0KPiBPbiAzMSBP
Y3QgMjAyMiwgYXQgMDg6MTcsIHdhbmdteSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8
d2FuZ215PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+DQo+
ID4gRnJvbTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4g
Li4uL3N5c3RlbWQvbmF0aXZlc2RrLXN5c3RlbWQtc3lzdGVtY3RsLmJiICAgICAgfCAxNyArKysr
KysrKysrKysrKysrKw0KPiA+IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+ID4g
Y3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9uYXRpdmVz
ZGstc3lzdGVtZC1zeXN0ZW1jdGwuYmINCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL25hdGl2ZXNkay1zeXN0ZW1kLXN5c3RlbWN0bC5iYg0KPiA+IGIvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9uYXRpdmVzZGstc3lzdGVtZC1zeXN0ZW1jdGwuYmINCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLjY2YjVlYzVlNmUN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9u
YXRpdmVzZGstc3lzdGVtZC1zeXN0ZW1jdGwuYmINCj4gPiBAQCAtMCwwICsxLDE3IEBADQo+ID4g
K1NVTU1BUlkgPSAiV3JhcHBlciBmb3IgZW5hYmxpbmcgc3lzdGVtZCBzZXJ2aWNlcyINCj4gPiAr
DQo+ID4gK0xJQ0VOU0UgPSAiTUlUIg0KPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6
Ly8ke0NPUkVCQVNFfS9tZXRhL0NPUFlJTkcuTUlUO21kNT0zZGE5Y2ZiY2I3ODhjODBhMDM4NDM2
MWI0ZGUNCj4gMjA0MjAiDQo+ID4gKw0KPiA+ICtQUiA9ICJyMCINCj4gPiArDQo+ID4gK2luaGVy
aXQgbmF0aXZlc2RrDQo+ID4gKw0KPiA+ICtTUkNfVVJJID0gImZpbGU6Ly9zeXN0ZW1jdGwiDQo+
ID4gKw0KPiA+ICtTID0gIiR7V09SS0RJUn0iDQo+ID4gKw0KPiA+ICtkb19pbnN0YWxsKCkgew0K
PiA+ICsgaW5zdGFsbCAtZCAke0R9JHtiaW5kaXJ9DQo+ID4gKyBpbnN0YWxsIC1tIDA3NTUgJHtX
T1JLRElSfS9zeXN0ZW1jdGwgJHtEfSR7YmluZGlyfSB9DQo+IA0KPiBBcyB0aGUgbmF0aXZlIGFu
ZCBuYXRpdmVzZGsgcmVjaXBlcyBhcmUgYWxtb3N0IGlkZW50aWNhbCwgd3JpdGUgYSBzaW5nbGUg
cmVjaXBlDQo+IGNhbGxlZCBzeXN0ZW1kLXN5c3RlbWN0bCB3aGljaCB1c2VzIEJCQ0xBU1NFWFRF
TkQgd2hpY2ggcmVwbGFjZXMgdGhpcyByZWNpcGUNCj4gYW5kIHRoZSBleGlzdGluZyBuYXRpdmUg
Zm9ybS4NCj4gDQo+IFlvdSBjYW4gdGhlbiBmaXggdGhlIG93bmVyc2hpcCBpbiBtYWludGFpbmVy
cyB0byByZWZlciB0byB0aGUgYmFzZSByZWNpcGUsIGFuZA0KPiBzb2x2ZSB0aGUgb2Utc2VsZnRl
c3QgZmFpbHVyZSB0b28uDQo+IA0KPiBSb3NzDQo=

