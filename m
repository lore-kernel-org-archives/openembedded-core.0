Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4117E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 17:02:32 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.8])
 by mx.groups.io with SMTP id smtpd.web11.25551.1736355751280547926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 09:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rQ+gU3hu;
 spf=pass (domain: arm.com, ip: 52.101.67.8, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eooy7uf6vkP8LnV/ClXFaYpgNSwAqkeXHSckde2NcmclodF5IfEoIOmhVg97kbUYyfqCsnw1SZAgTGWTz3cCBLqs0b9jJs+mHUZmhkcPr/vR3v2xsOq0LuaxaxffIiQ65xVLbf5cRA3myJtu0VcAod1fdiiKH8P4D/OZq+otm+ZICQO7H3OaBXJZINIbla3t6h5rRuWZ/rUgMFAW+bchw94u7Ti5HxvN49tXPEdK6KH2wlus3U6+Yb7U5hWxDjdQWueoau6WyT9TdYSBpaI0JlNkhlNmUDs6nK1zC9hSxdaVj1QC0VHychSNflEs740bQv+zKfttCXJipKxUPV210Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay042rAhwpAkhVk2DjWgVLYM3MrWQOHgaCLvHSxiKj8=;
 b=yhXod+ffSqU5v8Gu0VsUR10XkO6WE1OsHrzrRs6RmHFGTxZfJ1NPg4uWwEl+NI4yC9ghZlkfWtACofraBMbry+inoEY/2r3HUnFikTQrlQ7Wr582Ws3E9d8oXxJBZA5ayjr50k8bnxoFUvNOxFSvQbGJxrfn/CEas4K6yWANrjd2GQNUINhnVtiK58Il6lfiFjzR9I/IE8a7JSmXFH/lpQ+Cs1r4aiv8rN2cheBnHApTrbqET3xeZUcmEcQp4oX19Io9oe5dAZBxpcLS96yeV5ePhjU+MiqGxFYn/37a4NgW3UiP3Ne1iILjOC4yAk/haE+pUKZPKzE3Q3vch2VdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay042rAhwpAkhVk2DjWgVLYM3MrWQOHgaCLvHSxiKj8=;
 b=rQ+gU3huytSodHKnvxALl8BIZlzQRHc4RASP6DIL/DLCzxX7ipgWcbZ2DNATvZN9QGYte/oj4CTgaa1RVG9b0bRCxASvUl/FbQTDJSnVsUqIU3p4YrzkBMv0mxWBWnw4XZZ3piEyog67uXlTCQ3tKj2fmj992Ed47Nu5I/BgmvQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7834.eurprd08.prod.outlook.com (2603:10a6:10:3b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 17:02:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 17:02:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for building
 32bit binary with 64K alignment
Thread-Topic: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for
 building 32bit binary with 64K alignment
Thread-Index: AQHbVnnNBVgYwD30fEmuUzj7sRz5XrMNMS8A
Date: Wed, 8 Jan 2025 17:02:26 +0000
Message-ID: <7008933E-1611-4683-86A2-083772D4CE71@arm.com>
References: <20241225030437.972359-1-Qi.Chen@windriver.com>
In-Reply-To: <20241225030437.972359-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|DU0PR08MB7834:EE_
x-ms-office365-filtering-correlation-id: 79155b4a-36a9-42ed-09d0-08dd30063aab
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SkFQSExnWVl1YUFqQWVyT2NOY3VtdHFyR1pGOXdUN0JnRGtmRnJzSGxkaUx6?=
 =?utf-8?B?S2FRaFdiejZPbmFrcmxDcVpFQU1WTXN0dTRjcWRzbmx4K3VwME14LzRTR3VL?=
 =?utf-8?B?eGtMR1ovSkhPc3RtUXNvbEh2U3dNNUt4OVdleDd3RFZiclIwOW5sYkpVNm0r?=
 =?utf-8?B?V0t1STY4NXhEYXoyTklUM2U2UURGZFhmSzhZMTRtYmw5S2Q4TTNmZjlub29T?=
 =?utf-8?B?RnBFb1E1eE9QQUdQVkV1dkJWc3VzSTZDUGdlRnhHYnhPYTBQRllqbnI4NWZT?=
 =?utf-8?B?Szc0Z3dQRjV5cnhsbTZoandXVWR2ZXVPZ0RBR0xnYTJDOW4vQVJYaFNtUnVk?=
 =?utf-8?B?S256c29PcXZRWEZ2bjhVQ3FiQjJSWExtbHlweHE1b0RkbnRKS3JlYzZTUWNi?=
 =?utf-8?B?SWRhdjZ2ZlV2cThuS1ZYWmNVbUQydlBZNy8rTXFBdFlscEozZ2FvYlFJejBl?=
 =?utf-8?B?U3creTRlNmRMK0diNjU2YVZVWkRjZkRPMHpqVDUzeDZuUlN1VDQ5MmpzUlBU?=
 =?utf-8?B?WUlaNmlXVDV5UkFhNXJpZTZVWlpZUCt2SDBMMUpDOVhlcEZTdnQrbjlxOC9t?=
 =?utf-8?B?OXYvekUwaXlrbC9YRzVGSm9RZURlOXp1NXpTMzVJbTlTelVxMWF0Z0RjbWlp?=
 =?utf-8?B?WjVYYmFXNzdySTFkOVBFdmNwMHdteTB0bTVsNzQvMlJXSlJ0OFkybnJnZXdU?=
 =?utf-8?B?djcycVBMQUNPQlFidmpQQ0NZMnNROTlkWEVkL29BV1crcEQxaFE2NmxweXg4?=
 =?utf-8?B?M1NwTTRVbG9NcUE0ZGlhVFp2ZDRwdzJVZGxQSW8vNkhQN2ZvVCsrRENieC9s?=
 =?utf-8?B?cWt3Zys5MFpiMzdaODU5NndLeUozaytTd3ZURU1hdDBJYnVzNXVFUG9jWGgv?=
 =?utf-8?B?b01iYm92VWVzaDNSaFVhUmtDL2RlZzZTQklFaWJXUkVMSDJEaTJOMmNPSStX?=
 =?utf-8?B?RHhmb01BY1lrN1ErSzNEMWJHVVRHSHhMNnBaL0hUbmdWQ3Q3RjRia1Y4dFln?=
 =?utf-8?B?THZJWElLcTdSWDk4dnVSUkxEOGVSdlNza044cWVRT2VlWnZXaDVNOU1ldi9T?=
 =?utf-8?B?cW1uUmFrSGhHNkgyVXdpLzF0L3ZvNlBGVFRoUTFScU0xK0lvYU9UTkwxUis5?=
 =?utf-8?B?TUE5bnpSdDhLY2h3ZE5GK0hvaERQUkMvMDhHcjRzMG9yajBGRVlKMTlZenVZ?=
 =?utf-8?B?dGFTM3NLWjBESmVzNlhJMERYMGRycnNzTUdIdy9UNDhaa21hSXpnNlhBRmJH?=
 =?utf-8?B?b2VFdFVoelJ6eUhpd2ErSVppK2NTcUtwaXI0Z3Q4eXlZWDZPU3ZJMXFSRnpF?=
 =?utf-8?B?UjBlMk1UeDduREpuUVB4eklpMEJoc0xFR2dvNGNubzAyNHRXVm5lZkl5Wldx?=
 =?utf-8?B?blV2ZmgvcTUvTjFVVWl3Zy9QRk83YWZNdStaMS8yWCszQnd3Tkkya053MlhY?=
 =?utf-8?B?Z1gwMXozNXlZQ0F4TWNCRFRoSHN1alY4SGgrWnc3UXdwT0xtdDRGT1F5MWI5?=
 =?utf-8?B?M0YyTUl1amNGVEx2alJtekdqVnM5VjBUbjNSYXBtdWsrdkFydmZTRnV6ZXBC?=
 =?utf-8?B?YWlDczNTV3d4ay83QW9kS25mbkdTb0Y0NlZxcjJIMk45dWgwZEFmU2s1aXpx?=
 =?utf-8?B?cElwUVc0d0xCOEY3Nm5Nc0Via3o1T0lwY3FabWZ1RHFhK0k4a1FXR0hwK2Mr?=
 =?utf-8?B?bWRuN05FM1ZJd1pxV0ZSVHRIZXVHTm9LUFlXS0JmWU5vZ0JmcVVjNHFWL3Nr?=
 =?utf-8?B?cGVUU0NSUjErdEdqOUxMNWczNzJPYnJhY25VemhtMHVTOFBsNitncXZLcXFn?=
 =?utf-8?B?NkxaYjdDTkNDdVlHN3c4cmRSSGxlR3ZLaEcveDRJeGhtYlVvQnJobTVUTnBS?=
 =?utf-8?B?ZVE3cW1OYlFaVHA5V0prVjRmOW41MmM4MnduNk9DT2hocmc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bWRwRXlkbTMvbDBnbHpxY3ExOFNvQTU2SkVJRVJVU0tzVzJ0TzBiQ1V0alRy?=
 =?utf-8?B?YzF0aFhuZWdFNk1ZUUpUTEZicW9VSFdzQy9MUFZIN1M5UXY2a2JyQnZzU0dD?=
 =?utf-8?B?RWl2Zk80VUQxSmFzNmlYRm5BZzhUc0pBUVorSGxNRHo5REY4R1F4MEpiMGt4?=
 =?utf-8?B?SmxyWVRISVFMbm55WmFIanR4VjVDemFCZGZrWC8xTGNxMGhqV2locTdQMmgr?=
 =?utf-8?B?c09rcXdJZkVwRDNqREdJdUwrZzBodE56ZGJlOXdVY25zZUVTSWh1VFJYbi9J?=
 =?utf-8?B?UmVOWDFNWWF6akNZTVFYOUNCOEJJUy90aHN0ZUpPb2c3dmpyOVZnL21qSlVm?=
 =?utf-8?B?WHVtMFk3dSsrYzI3UmYrbjd5OFN2Vmo0ajdiRU14Y3FXOGFPcGQ1Zk1XdXBa?=
 =?utf-8?B?TjZUTmtLWEpVZmNxbStZcGpTZ1l4elRHd0RLRmJ0UWVYeFErMFpOMkxZY0ky?=
 =?utf-8?B?bml5RE4zd214OHJuQUhHeGRwSzZXdW1kclVpekdET1FSbFBWWnkwdzI4NGFt?=
 =?utf-8?B?RmNzY0RKL0xZcmlUMDdnS1hBMGoxczdUWlkyd0Z0elQ4MU5pcHFNV3lIdE5l?=
 =?utf-8?B?TXRmL1E0RXJNZkVDa1V4NVNham85WEYzUWZQNFp0Vlo0QzJVRUVYeWlMWVRh?=
 =?utf-8?B?dGd6WWZiUzlXREtxMERZUDBvUjdpODhwUGNCZC9rTSt1cVFML2U4S25BWWp2?=
 =?utf-8?B?dSs3bmR2NGJsTTRzVXpzUEtyZHRidCtKZjJjSDhhN3RSaDYzWXdZQzZJUmhQ?=
 =?utf-8?B?UnFVQlNzMVdvWWdjK2crREMvRmZWMVR5N2VqeTZYTDNEZ0NJR3JBOFlCYXMy?=
 =?utf-8?B?MTNvR2FFa2l6citUbGF1RE1LZGdHS3l2RjJLUTVmdm1RRGFmbHN1MU9TMGI1?=
 =?utf-8?B?M0pwV3VBNmZ5SWlhQStMUzl4YTgvZnhIYXBwYjRiT3FCbTFjYlk1cWlqb2dQ?=
 =?utf-8?B?RzBYNDNCMFRCT21aUEtBQmtGSDJYd28xL0FHLy9RdVNUL3FYeHZ0dGRiRDhX?=
 =?utf-8?B?UFVMdWhhUXArZEpnWUUvZTBIajlscExXdjEzNXFhOGZzb3cvNWtuQVlMNXRE?=
 =?utf-8?B?TXRZaEU0RjViZUlCbGI5TElJc0Y4ZDBZcEZTYi9JWWNKMEVodjhEQmx2Z2lC?=
 =?utf-8?B?Y1dwVERSUUt6UzVxcEQ5SjN4eFlsYXVPZFpMNTVFVzRKaG51dTVRZkFuMzl3?=
 =?utf-8?B?YkFZOTJ1NndMSjZaT0U4WG8vZDNWbmlPUVhvNnE3UHYwZzdPQlVoUDFvV1cv?=
 =?utf-8?B?L0R0djY2Y3dFZVNBQmJwMzJ6bjAvdXVjdVc3c1JHN2JIbHJiTlkzSUk2Q1ZE?=
 =?utf-8?B?Mkp3bGtTLzkvc0dkNWIyRm0vdkh0NnZxRWVVQXBYczNQSkw0cTR6a3dHUVIy?=
 =?utf-8?B?VTBjNTRDeUZmSmFVdGhYUDFPYU1CZnhhaU15TVMxdlV6NG5obVh1amNUVXFR?=
 =?utf-8?B?RGsySEM2WWdUZVAyT0pyY1FZeXlvbENKdUpiRWQvTDR5bnhtajRIMGIvNnMx?=
 =?utf-8?B?enB6eW4zQWI1VDBiRHJjVWFVQ3liOTU3cW9XVXJTQ3JzVGgxTnhZYytVNW1V?=
 =?utf-8?B?OEh6dzRtdkRwbGJTcmxsMVZRQ1BYNWJKSmRRbXVnVEFDaStWcnU1d1pXdHNS?=
 =?utf-8?B?ZklmWWxqTjlEUmdZY1dUYXJIalZxUXNaNjRaZUtxcytpTXJiREZ4Uy9XNkpx?=
 =?utf-8?B?aDBOWGR5QTliZ0Z3Z2pxb3lrU0xzTzRoMy8xQVNibEdpTVRyT0NSVmYzSytN?=
 =?utf-8?B?ays0MnJFa1hESWxWaGVkTGQxMnBEVkdnZXo5RDR0NTVZenR5cFpUNEh6aTdh?=
 =?utf-8?B?VWtkRGE3cjZ2aVhPK2ovdS8rQWlHeFRBUzk4RHRTbHBDUmVwc2ZxQUFadWxp?=
 =?utf-8?B?UW9XLzZtSzJrM2tWQkpKVkVRQTlsQTBlczlPQ0tKTWxObUZnZ2RpbjZkZjNh?=
 =?utf-8?B?QXcyRmVtSEJJUkw2RlYwbU43c051eG9IU1VCV3d2eDR2N2kvOTI0dVZYZGEx?=
 =?utf-8?B?RWtmckdqTytCWC9jaTJsWWZLNEZOT3ZLSThXUkZ0MUh1ekZKRy9wUnlEVVhr?=
 =?utf-8?B?ZG9qd1BuejFpVW5OajFUeDZ6NVk3Z2NlSVU4QXdJSzZkUmphZ1lSR055azgz?=
 =?utf-8?Q?YLxlAvWA2OPoQ+RLn9b5xYQfY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B4BBC8F09D9394AB14AF84D0071AE81@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79155b4a-36a9-42ed-09d0-08dd30063aab
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 17:02:26.8337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5EqLWbKg+o+Xbe2t3HT132C5iz5BPcFCYo9RUuDymab88BI6YHPiofyeiGRodUG1XS+Zf/DQ/ntdAj/aXX2mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7834
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 17:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209585

T24gMjUgRGVjIDIwMjQsIGF0IDAzOjA0LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IFdoZW4gNjRLIHBhZ2Ugc2l6ZSBpcyBlbmFibGVkLCBmb3IgMzJiaXQgbXVsdGlsaWIsIHdl
J2xsIG5lZWQgdG8gYnVpbGQNCj4gYXBwbGljYXRpb25zIHdpdGggNjRLIGFsaWdubWVudCwgb3Ro
ZXJ3aXNlLCB3ZSdsbCBzZWUgZXJyb3JzIGxpa2UgYmVsb3cgYXQgcnVudGltZToNCj4gDQo+ICBy
b290QG1hcnZlbGwtY24xMHh4eDp+IyAvbGliL2xkLWxpbnV4LWFybWhmLnNvLjMNCj4gICAgU2Vn
bWVudGF0aW9uIGZhdWx0DQo+IA0KPiBtYXJ2ZWxsLWNuMTB4eHggaW4geW9jdG8ta2VybmVsLWNh
Y2hlIGVuYWJsZXMgQ09ORklHX0FSTTY0XzRLX1BBR0VTPXkgYnkgZGVmYXVsdC4NCj4gQW5kIHRo
ZSBpc3N1ZSB3YXMgZmlyc3QgZGlzY292ZXJlZCB0aGVyZS4NCg0KRG8geW91IG1lYW4gXzY0S19Q
QUdFUz8gIFdoZXJlIGlzIHRoaXMgbWFydmVsbC1jbjEwMHh4eD8gIEluIHlvY3RvLWtlcm5lbC1j
YWNoZSB0aGVyZSBhcmUgbm8gdXNlcnMgb2YgYXJtNjQtNjRrYi1wYWdlcyBhbmQgbm90aGluZyBj
YWxsZWQgY24xMHh4eC4gIElzIHRoaXMgYSBXaW5kIFJpdmVyLXNwZWNpZmljIGZvcmsgb2YgeW9j
dG8ta2VybmVsLWNhY2hlPw0KDQo+IEhvd2V2ZXIsIHRoZXJlJ3MgYSBrZXJuZWwgY29uZmlnIGZy
YWdtZW50IGluIHlvY3RvLWtlcm5lbC1jYWNoZSB3aGljaCBlbmFibGVkcw0KPiA2NEsgcGFnZSBz
aXplIGZvciBhcm02NDogYXJjaC9hcm0vYXJtNjQtNjRrYi1wYWdlcy5zY2MuIFNvIGl0J3MgZWFz
eSBmb3Igb3RoZXINCj4gYXJtNjQgQlNQcyB0byBlbmFibGUgdGhpcy4gQW5kIHdoZW4gdGhleSBk
byBzbywgdGhleSdsbCBoYXZlIHByb2JsZW0gd2l0aA0KPiBtdWx0aWxpYi4gVGhpcyBwYXRjaCBh
ZGRzIGEgY29uZmlnIGZpbGUgdG8gaGVscCBwZW9wbGUgYSBsaXR0bGUgYml0IGluIHN1Y2gNCj4g
c2l0dWF0aW9uLg0KPiANCj4gVGhlIG1heC1wYWdlLXNpemUgb3B0aW9uIGlzIHVzZWQgdG8gZml4
IHRoaXMgaXNzdWUuIFRoaXMgb3B0aW9uIGlzIGFkZGVkDQo+IHRvIGJvdGggQ0ZMQUdTIGFuZCBM
REZMQUdTIGZvciB0aGUgcHVycG9zZSBvZiBjb3ZlcmluZyBhcyBtYW55IHJlY2lwZXMgYXMNCj4g
cG9zc2libGUuDQoNCkZpcnN0LCBJIHNob3VsZCBwb2ludCBvdXQgdGhhdCBjaGFuZ2luZyB0aGUg
cGFnZSBzaXplIGlzIGFuIEFCSSBicmVhaywgYW5kIHRoZSAzMi1iaXQgQUJJIHdhcyBmb3JtYWxp
c2VkIGxvbmcgYmVmb3JlIDY0a2IgcGFnZXMgd2VyZSBhIHRoaW5nLCBzbyB0aGluZ3MgX3dpbGxf
IGJyZWFrLiAgVGhhdCBzYWlkIHRoZSBsb2FkZXIgc2hvdWxkIHdvcmssIGFzIGEgZGVjYWRlIGFn
byBiaW51dGlscyAyLjI1IGNoYW5nZWQgdGhlIGFsaWdubWVudCB0byA2NGtiIHBhZ2VzIGJ5IGRl
ZmF1bHQ6DQoNCmh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7
YT1ibG9iZGlmZjtmPWxkL2VtdWxwYXJhbXMvYXJtZWxmX2xpbnV4LnNoO2g9MjgwZGI4NDIyMDhl
MDZlMzIzMWVjM2E4MzIyMzY5MTkzNjMwYTA3ZDtocD0zNTg5MWYxZmM5MWJkZGQwMzY3N2FhZWZk
NzE0NmFlNTMzM2U2Y2YwO2hiPTc1NzJjYTg5ODllYWQ0YzM0MjVhMTUwMGJjMjQxZWFhZWZmYTJj
ODk7aHBiPTgzMzVkNmFhMzRiODhjZTMxYjYyZTFiNTc4ZDU0YWI0YWEzNjQ0MzUNCg0KVGhhdCB3
b27igJl0IGhlbHAgc3BlY2lmaWMgcGllY2VzIG9mIHNvZnR3YXJlIHRoYXQgZWcgYXNzdW1lIHRo
ZSBwYWdlIHNpemUgaXMgYSBidWlsdC10aW1lIGNvbnN0YW50IChhbmQgdXNlIHRoZSB3cm9uZyBj
b25zdGFudCksIGJ1dCBoZWxsb3dvcmxkIHNob3VsZCBiZSBnb29kLiAgQ2FuIHlvdSByZXBsaWNh
dGUgd2l0aCBwcmlzdGluZSBwb2t5IG1hc3RlciBhbmQgYSBtaW5pbWFsIGNvbmZpZ3VyYXRpb24g
aW4gYSBxZW11Pw0KDQpSb3Nz

