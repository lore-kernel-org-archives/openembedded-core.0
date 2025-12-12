Return-Path: <erik.schumacher@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1682ED49221
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 12:18:25 +0000 (UTC)
Received: from FR6P281CU001.outbound.protection.outlook.com (FR6P281CU001.outbound.protection.outlook.com [52.101.171.87])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11444.1765541900958590496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 04:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=kO09HFLL;
 spf=pass (domain: iris-sensing.com, ip: 52.101.171.87, mailfrom: erik.schumacher@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHr1BmYv9gVJ4HQTpgtRAYX8CwXHwFZ4N+sePyuhfb/CXe5GYkuX996ou+VQhpQ69jNqB89zzd1+4dpWCSEOAXekaktP7j7sqAU28Y3ZV1MFE1pmABPmGocJMgAZ5fK4HdAHdhIeSmHGIPRjw3J4YmW8gBnAz4PNaTgmJp0pN72kgQlm2K2i+VzLMW6ixYmUfMW/xHn43I1DOFes2K7r6KJ5gNKD3X0nYOyadXlk5GxKeoMDA63z3+FxUcoCXbSNXVQVDfjj2d3SjvFtapbkeuJeCbKfWDdH7bkEvnOegM5dcv3eN9j+T3DU8egl41QY+IGNTXJNj/PXyRGc0KXP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhL/YhgfS+VtCAK3yZ79UoDt40LJLp5SM0e+5E5qSTg=;
 b=fJ0VltyTFCXpjon0MuOtsUzw592lbb0U0Y2r/Tuq4kh6wdTX5HHyIgutuLY3/QpOtpv2DSBDhugX3qpfieOpp9GYhycbZ0M4zAmHa+51ALM27ZJ7hPieerLIJ0WJsftjwaOqYgLbi9JH57PImYZhXUNBBbySXUcXZyr2bON62MbOvLQCA+DCAy8dtu6PLyP5LL1/Jpi+5auhBaJU4RR30gU4eG/SAADpC67jPgBaTniA61/9DaLLtWmTwpIlatqz6sXhMVsCHYjkqf6jdwEMSYB9SBN4RU3Yg2OLcfixQOT+si0/Oi7hGdosxsOjoeEd9eJtUF7BTEWwFmmr3+lG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhL/YhgfS+VtCAK3yZ79UoDt40LJLp5SM0e+5E5qSTg=;
 b=kO09HFLLWHNcepYMVSP5yBVHOg8EiMBZd3qSFdYCHU434l52NLqz7s/NqS8ST6CDeT0mJFdEVXEjBYX+wlAqICTN3Ipk4mPwtOIqvlW79/nfZc5rQWmGAI5QrKO6pRUSUnDT5LEjT68JwHRQ/gUQM9Y9E/y16OcfpvUEE/EPSejhH0RaCmV+Tco0gjrsM75+4y6e2qFtCm+Va6x8V6U9TdOBt4fvxXxsXTyCkWhzo+FokQJQtzG7TP7gd92bPLN+sw22mqkc2DQ8Q1NHDQXHYYSNxTUx+6A5ZH5BocpsB+3TwySZ19Eq4XlF2b5vjrzwgBRkQIVgBSxJpIsbK3wS4w==
Received: from FRVP281MB5832.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c6::11)
 by BEVP281MB3597.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 12:18:15 +0000
Received: from FRVP281MB5832.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1a5d:c8:69c:77e8]) by FRVP281MB5832.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1a5d:c8:69c:77e8%5]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 12:18:15 +0000
From: Erik Schumacher <erik.schumacher@iris-sensing.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] initramfs-framework: rdepend on mountpoint command
Thread-Topic: [PATCH] initramfs-framework: rdepend on mountpoint command
Thread-Index: AQHca2FkifyBep+CdkGpNcp/DMf/NA==
Date: Fri, 12 Dec 2025 12:18:15 +0000
Message-ID: <d3c53664d86c0cc854a92f9b5dc17059ef7e3596.camel@iris-sensing.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRVP281MB5832:EE_|BEVP281MB3597:EE_
x-ms-office365-filtering-correlation-id: cc6cff8e-c99d-48da-52a7-08de397886ab
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ckVibzFpLzdjaDkyR3Jya01iR20zVkVPeDlCSi9JOTdUVy9zZXg0YmhhUnlT?=
 =?utf-8?B?YStYNVQ4M3VmcjhlNHVBOWtmMS9Ianc2VzlJT2dvN2NiWnVQQzNMYlk2Tnpt?=
 =?utf-8?B?VENyTkNhQzlwaUJnYzAwYzZROUVnNWtlek5DVVgzOGRSaHFSSWxTTklFdWtv?=
 =?utf-8?B?MGNKTDhvS21MWDd6ZVJSK1pPeWJqVzRGaFBGbDRmdnBsZFI5Y1g0UXd1VWRM?=
 =?utf-8?B?OUFoVkNhQ0JWemtiaXFzeElsTk5qaXRVbFdZcWJSTEkxQ2tkSm5TZ0xGb0dT?=
 =?utf-8?B?YlRkWCs3VjBmajFHRmtNSTY0aFpweUNqRFhCTWtMcUZkdDM3b04xdlIraURL?=
 =?utf-8?B?UVg5TmFYb3VLSEVKN1NwTTBoYjFycGYyNHBjNm52WGZocngrZ0JFcCt6Mmh0?=
 =?utf-8?B?YTFVbVFBTXZ2SUlwd216QlJZMHJKSm0yQUpoMitEUFRpdVlrci9lZXlaQmxy?=
 =?utf-8?B?cTViV3NjYWlUY0VoN3QyV0JMcFZqL2kwQ2pqOFFlRE5BSGdoc1h2bHJzaFY3?=
 =?utf-8?B?WUpobXF6Sm9hd1RPR0trSko0cWVTOVB0TjlERGRWWjVncVRVQ3BZdXJFcm56?=
 =?utf-8?B?c3lRM054Rk1tRERZSHJLUmh0YTRjYnZCTUVGdFpvOXdVU2RZNWNwbGduUTRZ?=
 =?utf-8?B?MjhpVGJQRFhKLzA2Tk9jN0VGc2pxK2hNTkNTUGtPYktWWjBua2svSGZVMkZq?=
 =?utf-8?B?TTVRcXhBZk5RWGNxOFFRSVJzUFlwUTdoQitOc21uaDQxUTdDNEJWdmlnTXZr?=
 =?utf-8?B?QUpaUVNlcjcwT0Y0ZW9lU1NXTXBqbWJlN25HNmZZeEV6OUNVQjNWNkxrRHdV?=
 =?utf-8?B?emE4N043eGg2eGVNSGhwZzU0SzdJUlZ4ZkJXZkdhYStDVTJ5alRzbmhRZUpN?=
 =?utf-8?B?ZmZMYk5rdytJZG1mQTFoTkg2aVUvVUs1aDY2em1LZTRUWERsMVdKOVF2dC9q?=
 =?utf-8?B?TVBOdEFrZCtaYng0ZCs4ZTVQMFdlLzBTckhkaXdCK0xsY21YdWxTdnpKalBj?=
 =?utf-8?B?SXdTTjgzUWlyQVJkNTYyNWRLVUxOT1d1U3h3WXRYek1Nd3E1ODVXMXVEWWFo?=
 =?utf-8?B?ZThibU5ieVJzaEdVS1JDbU1uVVoxYUo0NFJQUDlaOWtFNVNNclJaU1R2aDly?=
 =?utf-8?B?WFhKZmVWUUxYZGFnaTRmNzkwSDVxWUV4V3hFeldzajlHcVFvZ1lsK0tueElM?=
 =?utf-8?B?Y29SRU1pYmtiL3BRWktQN21uUG1pZUo0M3QxOVFtMmd6Rk5JeWFlcTA1c0hM?=
 =?utf-8?B?TWVXR3BhM25UQk5hRFBMNVo2WGdEM3dXcjVpYnZzS1hhaWZNQlVmbDkzaDdD?=
 =?utf-8?B?RWpsRE04VjNxbE56bGQvZUwzTHE3OGFTcTFOd2pnVUJhMnhHMFNCMDdpVGEx?=
 =?utf-8?B?K2gxTTc5K3BtaVNNRDRacGloMHFUNFRvRVR2b1p3SHBnRkUyNTNlK2RtYnFx?=
 =?utf-8?B?cW04SlA3bHhLeFpRWGN2MUk4VGw4SUQxdjA0TVFQTkhPUEhZSXkxbXVzNnUv?=
 =?utf-8?B?aG5NUmRzQ2Izc0FKaWROOXlOL2ZhcDRTOEc5YVNpSmUwdHFqM3JycGJ6R29t?=
 =?utf-8?B?NUM3WkZEY0F6akZxUzROWHpoeThVa3NFWndJM1R6MXlCeXB1Lzk4MWdqVUIw?=
 =?utf-8?B?djluZTg5ZHI2TmNTQjZJZ3loaUVCTWJUMzM0L3BQR0F1MlFrRzBlR2NjL3l6?=
 =?utf-8?B?M3EwcGExUkV5NkJqK0crdmVyUkhYQk1vWTJQR2NJc1dHZzV4dHVxQzJBaDB5?=
 =?utf-8?B?NXB0ZHRlT2Z4WURmUEV2SWVodlkrVm01R2c0RXFrT1lpdjBIajV3M2ZKRFhT?=
 =?utf-8?B?ME9BZmhnUzJiZW00QUVOSmFkdnV0VjBYdS8zRlJ4NElCTEdBS2xkTUh1enIv?=
 =?utf-8?B?dTRJL3RUUVI0M1RQSTdaRXhWeDV0MHdhcFhpVWtwa1VyOWdhTXR5MjRqcGVi?=
 =?utf-8?B?Y2ZOYWo1MDZmWUVtZm9JNzVLR2IxVkhObWVvbDFZUEtQamI1NmxQbkFueGZ1?=
 =?utf-8?B?VWZBT2I5cUtDVnBCRG5QUG5Fclc0Y1VsS0U1NVRZMlRTY3pIRTFQR01IWWZm?=
 =?utf-8?Q?J1cZJP?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRVP281MB5832.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TXEzdEd5TkIzdDdadjNhdUF6djRhV3ZqZnpCY3BGVnRTRGZmUzdDRlE5VmdL?=
 =?utf-8?B?M1lBM2lLdkFpK0szY3k3c09OL2pUaWpiUFVJeDNWWG5YWnFmK1FTVkFDSVdR?=
 =?utf-8?B?cVpxYUVXZ3VOU3BwRnhJODJFUVZRREdVQ1ZzSEFVYjN5cEQ0R2VPMUs5NHhM?=
 =?utf-8?B?VVN3emZ0dzg2NXBkMUpGakdjR3orVytDbEZ3TVYxM1E0VDFVS2IzanlVbHBP?=
 =?utf-8?B?OURFNG9GcnUwV1hlSXk2L0h2TnBBUnkzV0NzbDdaRXBoU3NvZUt6RnJNYklw?=
 =?utf-8?B?Q1NwakhJbXQzSS9kTmxzUFN4WFR2NkxTWUxYeExsSndlNy9waGxXYlQ0dDNm?=
 =?utf-8?B?NmNvR0g5c21NZnlpUC9zeTExTVFFV1htWlJTUElRY2hkNW5oSWVmeVc5amx6?=
 =?utf-8?B?TTJXRzgyY25WQ0o2bXY5c01vZENsN1dwRFlxNkk3MVhjYUtOdVFNTWUzVHVy?=
 =?utf-8?B?V0lrSU1DSnRwbDE3a01qcDArS1RiSmNFRWVRTXp3SnpuTmNnV3R5ZlQ5bjRp?=
 =?utf-8?B?ZlRjT2NZb1h2MmdQSXIzdVZoRHJUdm1WcmlSK0M0UWlLU2FHaEt5b0EwWEZo?=
 =?utf-8?B?MGc4U09ZdC9tS1F0dWJ3Vitmell5dFBnUUlScFowdUxnWjQyWTVKT1F1QkZt?=
 =?utf-8?B?d2dZZFQrNjlHZGhpUlVCemk5RVFSeXlFUzk1cEd3Ulp6Yi9yd0JVa1F1aEVs?=
 =?utf-8?B?MlN6NHJqV3RhNk1YM0QzUnQzU3JoWHpjNEpkaEJ6R2hoeitVSUsxS0E1LzR0?=
 =?utf-8?B?ZVZyOVV5bCtaalBVbzI5NmlGSWRxY1Fmd0VubkJNV2dVS0FYQk1YaWt6VjN5?=
 =?utf-8?B?aFR3TTZIanVBdHFxRlNGdDhSa1UxejBnanhuMzhVZkEyQTJEZmdDWGZNTjUr?=
 =?utf-8?B?RUVqR0xqMXkzSUIxNmJOMkl1R240ZFRKdHRkV0pkWnFLbjBqTzE5RXQzUEVk?=
 =?utf-8?B?cGMyTWpWenBLSW0xZ3FBc1lETVc5bWFnZmkwZDlsOE84cmpqYkp2Y2JQT0k2?=
 =?utf-8?B?b2h5UVNBQjBuVVNJcXZBS3Q4NTVNVFQ2MVN6cS82L0NGNjNOK3hJcFNOUS9S?=
 =?utf-8?B?Smk3d2sxZXFjaXc2d2pMdS9Lek8ra2VNL2cvaGdKaytOUWlTWmVmNGRDQ3hl?=
 =?utf-8?B?b21CK3V3cEo4K04zeWNCOVUycFV4Z0tGR0hGS3psWXdoanNXRkppdjZ6Z0Rw?=
 =?utf-8?B?ZytaZHRwTkdHTldkQS9pdWkybmVVbGpEVWdjTmtZNGdBWGRrQTJkbG01TkM3?=
 =?utf-8?B?TEtMMkRwaWpiMWoxakRwWlF2TmhhaEMrSitGK3pKdGhiQjF6VWVSMkc4aDNu?=
 =?utf-8?B?YU15ODlhYndidmEra3pVWFp5UXpkYmI2MzVCRTB6RVNwb09ZclZjTlFWSndm?=
 =?utf-8?B?bmtGRW5nbWpXSjhZMEVGUXppYmpUWlc0U3FCTzJEMWxMcnAvK3VwNWVubHZK?=
 =?utf-8?B?b1JLRjdmaEZsK3VLa3FReDlUMXBRaTcxbGwzUEJGVmdzbHh5bnVxbkgyakFy?=
 =?utf-8?B?Z3hGNmxkaEMyTU8yTE5IT1dMMVk2azJXQWRid2xZc1F6c01PRW9TbjRwR3RI?=
 =?utf-8?B?NWMxZC9PV3B0Y0xQeWhFbVRpWUI2NUlGQXk3Mms2eVFGRlViSnRLTnVxVG4x?=
 =?utf-8?B?Z1NseDd0Tms3d2lEMVhXVzZVNHRlMWYxWmxETWdxWkdqOWN0ZGxRdXdQMHdV?=
 =?utf-8?B?eGpoRzBPNmZVemdzc09pY0NTWHN2eFdrcTFvVHVjNkxsd3lQamk4NUh6b2o1?=
 =?utf-8?B?RjRoeDNqNDNyUE96eVl2ZmNJZHQyd0RxYnd3MlFZU0xYU1pSMUw0U1FPOFAz?=
 =?utf-8?B?S0VEamZGMUg0SUxZTlNqck9maURHNjFuNmZQUDZqYU5KWVpvL0lpT0QvV215?=
 =?utf-8?B?Ky9YRE1wd2VDY2R0QnUrQ1VCTEpWdm4rL1lIR3phaFdnaURQd3N6eGViVExU?=
 =?utf-8?B?Q2ozQXZNdnBlSE5RRG9DazVKK2hPcEFrd3FBRDdVbDI1aTV4MTR3NThnOWNF?=
 =?utf-8?B?b0dub1ExVXI2dXArTlVUd081RlB3aTN6dUsya2FyRHJFdENNOXZqUnd1cFN3?=
 =?utf-8?B?V1Zram1NOXpNZndCMWF2QVk4aHVRakEyY0tJK2QyYm1ERDRKaXJJaVVZRVRj?=
 =?utf-8?B?VHkxVDc1NGNYWXkvVW9aUmpYRTE4ZFZrUHFtZXpKY0VIL1V3MjN6YmZmOTF3?=
 =?utf-8?B?TFRDMDhHUFJHc29IMHFVRDB0V1BNNXFTa2xLNHpHbStNWGNGd2VweHh1cnd6?=
 =?utf-8?Q?K7VG/l1LCxEyuxIaG1MhEae0k1PHC4LPBdHDaQJ1vI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B469BB2B34EE2C468F6735C9C562EA5B@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRVP281MB5832.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6cff8e-c99d-48da-52a7-08de397886ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 12:18:15.0981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tC85zEKe1LgdCOgjGWZdhyPoRqwFejkBS1Qqu11vr7tJjwrpXpXs+jhopB/+gLLkrgsYrAoFNqDXYAA4NI2ae0cS5Q9YVvmf/0X0a8xDAp34u8vK5ElVaKYiGcVHsdaV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEVP281MB3597
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 12:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227587

VGhlIHNjcmlwdHMgb2YgdGhlIGZyYW1ld29yayBiYXNlIHBhY2thZ2UgYW5kIHRoZSByb290ZnMg
bW9kdWxlIHNjcmlwdCwNCmJvdGggZGVwZW5kIG9uIHRoZSBtb3VudHBvaW50IGNvbW1hbmQgYmVp
bmcgYXZhaWxhYmxlLCB3aGljaCB3YXMNCnByZXZpb3VzbHkgbm90IHRoZSBjYXNlLiBUaGlzIGxl
ZCB0byBib290IGZhaWx1cmVzIHdoZW4gdHJ5aW5nIHRvIGJvb3QNCmFueSByb290ZnMgd2l0aCB0
aGUgY29yZS1pbWFnZS1pbml0cmFtZnMtYm9vdCBpbml0cmQ6DQoNCi9pbml0OiBldmFsOiBsaW5l
IDE2OiBtb3VudHBvaW50OiBub3QgZm91bmQNCg0KVGhpcyBjaGFuZ2UgYWRkcyB0aGUgY29ycmVj
dCBSREVQRU5EUyBmb3IgdGhlIGJhc2UtcGFja2FnZSB3aXRoIGEgbm90ZQ0KdGhhdCB0aGUgcm9v
dGZzLW1vZHVsZSBhbHNvIGRlcGVuZHMgb24gaXQuDQoNClNpZ25lZC1vZmYtYnk6IEVyaWsgU2No
dW1hY2hlciA8ZXJpay5zY2h1bWFjaGVyQGlyaXMtc2Vuc2luZy5jb20+DQotLS0NCiBtZXRhL3Jl
Y2lwZXMtY29yZS9pbml0cmRzY3JpcHRzL2luaXRyYW1mcy1mcmFtZXdvcmtfMS4wLmJiIHwgNCAr
KysrDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9pbml0cmFtZnMtZnJhbWV3b3JrXzEuMC5iYiBi
L21ldGEvcmVjaXBlcy1jb3JlL2luaXRyZHNjcmlwdHMvaW5pdHJhbWZzLWZyYW1ld29ya18xLjAu
YmINCmluZGV4IDJlYzAzYmMzNGMuLjI2MTI1Y2M4YmUgMTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9pbml0cmRzY3JpcHRzL2luaXRyYW1mcy1mcmFtZXdvcmtfMS4wLmJiDQorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9pbml0cmRzY3JpcHRzL2luaXRyYW1mcy1mcmFtZXdvcmtfMS4wLmJi
DQpAQCAtNzksNiArNzksMTAgQEAgRklMRVM6JHtQTn0tYmFzZSA9ICIvaW5pdCAvaW5pdC5kLzk5
LWZpbmlzaCAvZGV2Ig0KICMgYW5kIG1vdW50cyB0aGUgcm9vdGZzLiBUaGVuIDkwLXJvb3RmcyB3
aWxsIHByb2NlZWQgaW1tZWRpYXRlbHkuDQogUlJFQ09NTUVORFM6JHtQTn0tYmFzZSArPSAiaW5p
dHJhbWZzLW1vZHVsZS1yb290ZnMiDQogDQorIyA5OS1maW5pc2ggbmVlZHMgdGhlIG1vdW50cG9p
bnQgdXRpbGl0eSwgdGhlIHJvb3RmcyBtb2R1bGUNCisjIGFsc28gZGVwZW5kcyBvbiBtb3VudHBv
aW50IGJlaW5nIHByZXNldA0KK1JERVBFTkRTOiR7UE59LWJhc2UgKz0gInV0aWwtbGludXgtbW91
bnRwb2ludCINCisNCiBTVU1NQVJZOmluaXRyYW1mcy1tb2R1bGUtZXhlYyA9ICJpbml0cmFtZnMg
c3VwcG9ydCBmb3IgZWFzeSBleGVjdXRpb24gb2YgYXBwbGljYXRpb25zIg0KIFJERVBFTkRTOmlu
aXRyYW1mcy1tb2R1bGUtZXhlYyA9ICIke1BOfS1iYXNlIg0KIEZJTEVTOmluaXRyYW1mcy1tb2R1
bGUtZXhlYyA9ICIvaW5pdC5kLzg5LWV4ZWMiDQotLSANCjIuNTIuMA0K

