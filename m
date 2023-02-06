Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8662AC636CD
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 02:57:51 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web11.45254.1675652263376313928
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Feb 2023 18:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=DXxFgdjt;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.246, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1675652263; x=1707188263;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SrnS2y+4Hs24UBfe8J4aWmFyL3ci8kxTRIab++4m3Ws=;
  b=DXxFgdjtOEnlek5R98BJqIkLKcmZa5kMdoysiVlgQxEybXTwcoZOpI/r
   fJizdA3gY3aHWnvFb7bGcibF9ROTQfI+oF0W7azwSK018+A0fuXUkI2+m
   mG3UtU8zTv0c8hgukkRyqEOO1sjehfxLfNwSuUc3Qdh7DhFV+AaQ+uoif
   inrhp4PII4EOXiHW3vEuNx4mxyzh4RWV47wDPVIYs8Q23wIytHOVTJWcQ
   p9nbVjg45mt2/im+pnkI7XCQ9x/4LGj78A9+j2jUixxwWimiUpZEaV7Vo
   LGJypazf4PIStKV3NvLFWk+3NDKoEEr33XSISCc5BnP+unYX63ySzODnl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="84490203"
X-IronPort-AV: E=Sophos;i="5.97,263,1669042800"; 
   d="scan'208";a="84490203"
Received: from mail-psaapc01lp2049.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) ([104.47.26.49])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 11:57:40 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD+5xIlhZRsybJWk4phZsujJZKi8d3F98ZHkwNzWUAZHdVxokvATI4ena4v+altykh8L13txgGn91OFffh278xhM3kI+lVN7hqkNS+WNAi2IlGaFOzyOq5BmKHHV8JsY+P/axz0kX14AYDMp5bgb3QlF7N7xyoGZFvAj9noBesW7T89/rFEkbIENuNNjdXZI+yMSrZZBlhAttJOUX+knV40WEApP/m/yuJ7GfjsFXjMg8VLPzjAuDMWaEAFDNFhmaSyy33185xBVkfJa0ifEW2g+aeTv5EizqnOivTVNHrazr3+Vs8PGgiYhAq9vUpVSMUStJSclke9wrgjO9gtiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrnS2y+4Hs24UBfe8J4aWmFyL3ci8kxTRIab++4m3Ws=;
 b=gLf3iZE2IFqXT7hTnU56ci9hoG8ZkFtGDBmIvN6QehivJIl3zg8rkXIy7pFS7kORI03yDuxPPKAPIs2GEvlOdJTyisXkToWRkHWNxCgMPTMl4/Vl8PIDJRdXA3ad7DgFOK7ZIY6/VVijoa7nGvw5MarcvC3GrVw/GY3iFNqxsftFMgjAQ6npZ5qAFxNeKaLc9954O6MMqwo4Yl7A4HtQrWBoWDqmEExal87m1IyyLz3oNTt7EOtueNLA2xXrJp+eTMONcY7g3Il55ty1oETLx1qXg8RIbhuYFcH8YQd/x1yuUzRId63wsOrKc5b4qOttTVhY0SA8uwVYEVAt7hi/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY2PR01MB4155.jpnprd01.prod.outlook.com (2603:1096:404:d8::17)
 by TYCPR01MB11989.jpnprd01.prod.outlook.com (2603:1096:400:37c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 02:57:37 +0000
Received: from TY2PR01MB4155.jpnprd01.prod.outlook.com
 ([fe80::e15c:dc7d:80d4:9ea0]) by TY2PR01MB4155.jpnprd01.prod.outlook.com
 ([fe80::e15c:dc7d:80d4:9ea0%5]) with mapi id 15.20.6064.032; Mon, 6 Feb 2023
 02:57:37 +0000
From: "yanxk.fnst@fujitsu.com" <yanxk.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "fnstml-fujitsuten@fujitsu.com"
	<fnstml-fujitsuten@fujitsu.com>
Subject: 
 =?utf-8?B?5Zue5aSNOiBbT0UtY29yZV0gW21ldGEtb2VdW1BBVENIIFYxXSB0YXI6IGFk?=
 =?utf-8?Q?d_ptest?=
Thread-Topic: [OE-core] [meta-oe][PATCH V1] tar: add ptest
Thread-Index: AQHZN3zQcqlHxo2Ne0KiF4cspr1dd669EVcAgAQsGmA=
Date: Mon, 6 Feb 2023 02:57:37 +0000
Message-ID: 
 <TY2PR01MB4155055F4935596C5221035493DA9@TY2PR01MB4155.jpnprd01.prod.outlook.com>
References: <1667351911-9129-1-git-send-email-yanxk.fnst@fujitsu.com>
 <CANNYZj9dF79rWO22kXswLNT4Z+GumXo1EQBjO250PrG25sfacA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9dF79rWO22kXswLNT4Z+GumXo1EQBjO250PrG25sfacA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YWZhOWVjOWEtYmE2MC00M2Q5LWJlZjgtOTFlNjRhOGVi?=
 =?utf-8?B?MTUxO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMi0wNlQwMjo1MzozN1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR01MB4155:EE_|TYCPR01MB11989:EE_
x-ms-office365-filtering-correlation-id: 02f30e33-49be-4e8f-536c-08db07ede788
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EGByKZd0hWisvjjPQ+NTcWKhCvyojoZH+As7SYgwhupA/5oYahj1GUaeMu1kKi3jtXSIAiw5hJ1AlTglfzHYTKyHCg/KCEuYB3r+TndYXOiGPDxet2QD1Spcc9C7TCXkrkJUc1sp+xaJSpIRcmUTpg1kxEOOHCWBDH6YvVqsZTDn/LJ4DNv60BbbZsv6SwTrBAMW9w9rnTGJsrThGDmZyRS2xRTTtidmPdjU0UUDYZwP0ssXY4hsiqVnkuSDmnSdm48Mm8Z6Gig5waaiZap8psqKbKWy5FNdiO4GgQHBvBj2gcqkJp/SOEVm56oNxNhlTmLMrobC93IRO91+yw92s6TROoc9NXbI6u9xBfCGEpuKswkhh2ScoNaiwfn5eJEb/V1lkpnFIL/VAvoIPiweAKnBoLqywV4fLjukECV3zGZIbIGWauZee4nQLni1MlqOH7y6k/be0bBQNgE8bzDWTvSCdmqLOZo7BwTPbVgGlhilMH9GGFjhG9Ux3iQIdYqknFNpkGRUmJTW6eSnbw5CZeZB3ccER+pJ2dlsHCz3+CrtByDZrs4sYNEPSoZmg6dsn5UzWRPS3Bc9A3cmSZKi1zTwSW9CGVVV1fTu2EqDhv9vBd7B2t2/jAchVa5tgGEKU4DKI392KQtTCVkfmql1l0tSJ+cOD4ZZBr/Be2n8oXOjUHCCnWB2kIMXylhA6HowPkY0XZEvFomTb5bkBZFWikapA0u73EFcutaSAJ5uo+k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB4155.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199018)(1590799015)(86362001)(85182001)(33656002)(224303003)(38100700002)(122000001)(82960400001)(38070700005)(4326008)(66946007)(66556008)(66476007)(64756008)(6916009)(66446008)(76116006)(52536014)(8936002)(41300700001)(54906003)(316002)(55016003)(4744005)(5660300002)(2906002)(478600001)(7696005)(71200400001)(107886003)(9686003)(186003)(26005)(6506007)(1580799012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V1cxWWhQS1NmQU9NQ0pDY0xEUURtaElGMVVOZGQwaktVbEQyRTBrRDdhcmVr?=
 =?utf-8?B?RkNkcUFzZ1I3T3diSWxJU1JYeE11SVBIQy9BMkFMaDNxclRpSDk4RUMrYm5H?=
 =?utf-8?B?NmI3U2l4YXE2dUw3RzRwekJzekhDazViNUxveWJDQ3JYS2kwNSswUVk5dmRK?=
 =?utf-8?B?K1BwM0wxSXZSZC9oeU9yOVRoUXM2ZjRCZEtYQ2VHK3ZOOGd1emJENDg1WnBl?=
 =?utf-8?B?MjBIeUhrdEg2Q0NURG5vKzV3YmRGSEFESWVUMEhucDlKc0V5Zk9GM3lUL0E5?=
 =?utf-8?B?UGMzNVdRUU85R2pwQVVUZ1BRSUR1WjZ2Q2VIYmFBQ0FieFN1MFNNU0E5MVFY?=
 =?utf-8?B?YWxuTGRCV210OEk3UXowTHdFMm5MSytrWnB4dGlwQzBkbS9KNzAyRWhDQjk0?=
 =?utf-8?B?dUcxdmlSZXRjRzZ6djUwOTBDOVF0MHhHMjRzejNLVmF1NWUzR1hHZXA3TkdV?=
 =?utf-8?B?dHE0V3hCM21KMGg0bGpiQTI0TzRMS2dDVnJ2S2t3VCsyTFFsck9sYmlKSmJZ?=
 =?utf-8?B?N09BRVFJbE9pUDBBVFdjbVpQOGllTTZQTkMzQVpRSDZ2dnFIMGRYWEE4bm4y?=
 =?utf-8?B?Q3pURkRINFp3bEl4bHRPRy9RWFBkb1Z1WVNIL2h6cnVRWnVaRE5kNWNiUjJq?=
 =?utf-8?B?WWNmSjRDRmUvSEVpcWdqNXl1cTFOMFRPV2czWnhFcURucmtNTnNVZ3MveTlu?=
 =?utf-8?B?bEYzSDFLZ1B3Rm56YW0wZ1JxSEc1MkZwN2ZET20vWHpDSEpvZlZqajF4T2dL?=
 =?utf-8?B?eWMrWVdpK2JjazlBaHJRWXlnSlJHV0h5eVJMZzVqaEJqczMzaGNnOWxzZklU?=
 =?utf-8?B?ckxIbnhXcEhBbWVQclRtcmJsc0x2V0VBajVYY2ptQXJCMGpLQXhKZWt0VVJN?=
 =?utf-8?B?ejhZcFZXTVYzVzZ1ZFBqcXRzeStuamI3M0E2a1kwaXA1eUwwNEpxUlhuY3VB?=
 =?utf-8?B?d1RGY0JzNUd0RlVxVjd4TTNxTWFiV0hoN0NZNjBGYmNhUlVuc3c5MXhhZE04?=
 =?utf-8?B?QjJhVUovajNOWG9WNEtFUzZidllTNWg1T0taa0d2OGlLMHdkSFd5dFRVNkRx?=
 =?utf-8?B?V2lhSDNWNkQ2ek5BTFcvdDFQZVFPRzVjRGZiT25ldWF1eXZreVdLN3NYTEUy?=
 =?utf-8?B?cng5TnQwek5hem03TXBFZG1ERkRFL3RjOWJwY0N4Tzl6dndBY1F3OERTUlFS?=
 =?utf-8?B?aUJJbnN1aXRmam9kbCtzdmtaWnBvcUhtY3pnOXIzcmc2Ym03YkIzVlNnSVMr?=
 =?utf-8?B?ZCtScFFWeXNZNTRnRHRIN1F3R1JjTEFVeDdtUGhiM3ZIZDVEOHYzc0RiclNV?=
 =?utf-8?B?KzUyZk1uZEV3ck81YXRvRzM5YjFsQzBxT2tIWnN6NVkvSThXZVVhT3dYb1FE?=
 =?utf-8?B?VTRtMmVGWGt3WDIyQ05rKzN3dk1wWWhINVhBZ3YwNVIzdXlRTjZGcFQ3cDN0?=
 =?utf-8?B?b1ZXTHBtRHJBcGxxRUtqNW5MT0VOUk52Q0hsWHJweEN3WmJrbjZuWFA2RDN3?=
 =?utf-8?B?Q0xkeWVKb3NISDArdnJablRlREp1a05vbUNlblJCZElrRWpPMHpOdWdNaTRI?=
 =?utf-8?B?VmcwSGZneFZxM2E1VnZMZmx1Nm9wNFIyVU1zR1ZkamNwSGtUck5QYlRQbEpC?=
 =?utf-8?B?OGdLYkhyb1EyZ0tlMnZKUGZqVmdWbDN0eFN2aVQwbHRHRFVrL3lmTWlpN0p0?=
 =?utf-8?B?ekk3eDk3RFVnTnVvWkhzY3lDRGlIRGdXSWY3cDM0cU82R3V1RUZHeXQ2UWFS?=
 =?utf-8?B?ZFJ5SjA3d0RaQ3AvRGRxVWEzRHVoSkxCTjZaM1Z5MmhUdVRuOVhiTndUVkNm?=
 =?utf-8?B?ZVhpVzV2bVcySlNpemw5SFVrVmYzY3VrL3F4TTRCQzBWekRISGZyN2VLZkd6?=
 =?utf-8?B?Y3FYSEMxSER5ZmZXZkdLdVM3c0dUUkhla25aRTlKZEsrNkpMb1NqM1ZlcEdS?=
 =?utf-8?B?bldyZDhNS2NLVE5DQXJNVnY0MzBPRUNCaVBHNndueU42ZjRDUy9pY3dEV3JL?=
 =?utf-8?B?TnJ1VU50dkg5ZnZneFZJTWc2NnhUaEQ1YWhOZlRLZFBveElUcVU2MWh4RUJG?=
 =?utf-8?B?WTAzKzZub25GV0xrWnZMa2YxMkFaeWpiNmhOeDZNaHE5NTRmYXBjVHp1Uklj?=
 =?utf-8?Q?I8OcW9zM2LDt33m27NUPlel10?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7/Qz8lc4o7BKiHYzdBseT+jz89+5g/nIRSkgrunrgg0Xdifv22pDUUFTp13+EZSSPjlW0rIAeyQa/vsjryUm8AsyJ7Uiuv2idzwqQskkZvsJp9tD7GrpAAY3IpkeyjVv2DztjIQF2bxswGvvU0c5rBJ8J7NWR02NMaxvomjZr+z506kY+F3NW42P25L485O4BA0UbRfGTJqcDXNz0MtVncbZv60VbglhBBZzcC21LSUuxPFqG32R8n7xf7S9suBcSQs6sSMxyjU4p3cC0Rtkz4TItekJcCZvnl20OW544O1TKkMhj6NyC0epdmMgzNNsnZ+i6485e9mMrN5cCOYv+LtlOIix3ny5pgFftnXohATjaOGiggFO/xvxayO7B/DwCLUD4oXl8tTTf4tKWQhc+kzpj8dmxkMNsSE7NL4h6OLVUN0WvhHMTd3lK+6BL5aHaXxYnkNpHw13/QSNQ/5GEBazoixKGW9RZR4kafghOfN/ewm/h/EAKhSqwQRI87HIiKac+vsXrmKjlawp2wcHYeHEI5sn5dGyYZqf2yUbT6yLFpTH3JrlUUoFTgYOXeZaDccQYZ4R3+lNmeKqNHd3Z1pc0KJXLUia/U1qJti6xwG1lwvxy0VDheWAh8JoPVD9OfLaXbnad6/f4+u92Gwg3Bi22UEWKu9u3cbLsdsAy3S9BRIWx41p+FeriJO5k1fgiNnAYi2Vz5Yqo3QP2NHlJgR5ttY2iZpS/WcIBwC9qcJt9hXi41Aofq9o4MwE88Dqf9FJGzgzaSGsXscS8QcO0744ozSh+MzjgMqZbrstMRXFi03Mqd+yUxGS8NWmy6VE
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4155.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f30e33-49be-4e8f-536c-08db07ede788
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 02:57:37.5703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRs3KDi5P+NCWKXKUqMR0hoZCgaNxhk5jtSVnelJN/5vJIrOzah/Z8yKI/suZRCYA/UQa/Eh2rMiSOFLvcEjYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11989
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 02:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176787

SGksDQpXZSBwbGFjZSBpdCBpbiBzbG93IGxpc3QgZm9yIHRhciB0ZXN0IHRha2VzIGF0IGxlYXN0
IDUgbWludXRlcy4NCktWTSBpcyBlbmFibGVkLCBvdXIgUEMgdXNlcyBDb3JlIGk1IDR0aC4NCkJl
c3QsDQpZYW4NCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4gDQrlj5HpgIHml7bpl7Q6IDIwMjPlubQy
5pyIM+aXpSAxOToxMQ0K5pS25Lu25Lq6OiBZYW4sIFhpbmt1YW4v5pmPIOaWsOWuvSA8eWFueGsu
Zm5zdEBmdWppdHN1LmNvbT4NCuaKhOmAgTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZzsgRk5TVCBmbnN0bWwtZnVqaXRzdXRlbiA8Zm5zdG1sLWZ1aml0c3V0ZW5AZnVq
aXRzdS5jb20+DQrkuLvpopg6IFJlOiBbT0UtY29yZV0gW21ldGEtb2VdW1BBVENIIFYxXSB0YXI6
IGFkZCBwdGVzdA0KDQpPbiBGcmksIDMgRmViIDIwMjMgYXQgMDQ6MDgsIFlhbiBYaW4gS3VhbiA8
eWFueGsuZm5zdEBmdWppdHN1LmNvbT4gd3JvdGU6DQo+IEBAIC0xMDAsNiArMTAwLDcgQEAgUFRF
U1RTX1NMT1cgPSAiXA0KPiAgICAgIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXB0ZXN0IFwNCj4gICAg
ICBweXRob24zLXB0ZXN0IFwNCj4gICAgICBzdHJhY2UtcHRlc3QgXA0KPiArICAgIHRhci1wdGVz
dCBcDQo+ICAgICAgdGNsLXB0ZXN0IFwNCj4gICAgICB1dGlsLWxpbnV4LXB0ZXN0IFwNCj4gICAg
ICB2YWxncmluZC1wdGVzdCBcDQoNClBURVNUU19TTE9XIGlzIGZvciB0ZXN0cyBsb25nZXIgdGhh
biAzMCBzZWNvbmRzLiBIb3cgbG9uZyBkb2VzIHRoZSB0YXIgdGVzdCB0YWtlIGluIHlvdXIgbG9j
YWwgdGVzdGluZz8gSXMga3ZtIGluIHVzZT8NCg0KQWxleA0K

