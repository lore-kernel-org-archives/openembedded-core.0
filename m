Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A995C44521
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 07:26:21 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3818.1784532371277562771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 00:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=nmVXZJZr;
 spf=pass (domain: ericsson.com, ip: 52.101.72.2, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IB65I56u53ZVqgrFsL60ramsP/LG+L4ZReenY/vFGAh1+IzGCbdez6xDMlw7bKtoVqKjxOzJ6QzpuhAIvMtC0iK2v269xU1f3buG6MCriYyndkSBigVUfNi+TZOK7W0mpyyjNwOteyvkzvnl02dv4Bxb2mTxyx3wCfo/boCbnP6kGLTsUZCURsteSVF/zvtdNYlwU4D1kI3oeltX0lEVWhnCW54vkG8yMQ+in+1FFTGiJtWBozXVmS9++vrNdV2m2Z2UTlhZeI77I2xFsUy4Mw/0TQFBozE9caHCkq6upUZEh3842HSrC7qLw2vHfcPHTiV7kY3FsCHRHijtwcjKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8elBtpUt8vCB3C7LlJIDoPIJHOoFOMp5Z+/ZvIdr+Q=;
 b=NL4SvIoQCsRRupug0O1sGtmvwtSG/xyiqMeQbnZ+mXZUpX1fPXl4NrroymFGiaYa2IuYnfTMVRpbC1nIehp1O0GLnATw+cXSgEtzrQYXCvOL88r5GSIq2I744b0s3bEeRe770BUSuz0jrvCjirzRzG2JPVR/0phjIk/ZpX10pRbJlHREFoHBMwSfE/ZFIqVHA3kGAxJhEgLqf2RJagjJ094f7u0H7t4ann2rXXu2smUGe828CzqUMb+4qDcOZfLwm3eTOgNTws+5HFwQ3iBj6JTQMpLocgQn0juYPdFJJA3Bf7IejO9CQZQs0QsdrlHmYSwtmxRezlw2G8hc2SyyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8elBtpUt8vCB3C7LlJIDoPIJHOoFOMp5Z+/ZvIdr+Q=;
 b=nmVXZJZrqezzpgUPGCfdtfF55zVw6gDJDkvZuI78Aa0bwVqcNNFXrMdqBvpT2CP83Ntf1zFmSJrDTmkV7mHBWk6fGbL1GZgvWAOjub0Jgk9FJe7vPqTy/LampImKYutLdsJhxth1kSu8aqqeSb9bID6/UAtbKJvqpfOp5FQzT7KxCBkmZ8z07ECm3VbYB/5XN0lj/6+YOsAqGWgZFd0+BmQdrFye6UBafZ0hc/OgzRbn3gzUXnT5+jEbWg7jEnTWxd8MNfd5EZtF1J3Wlrz0mqjodb3InJPlwZwNAGnTsGTL5A7kQ3gRrkB/M2fVq0bTWb58TiLJbD0cAzxY/hnA6Q==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by PAXPR07MB9642.eurprd07.prod.outlook.com (2603:10a6:102:249::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 20 Jul
 2026 07:26:06 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 07:26:06 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v4 2/2] systemd: add native hwdb generator via merged
 systemd-tools-native
Thread-Topic: [PATCH v4 2/2] systemd: add native hwdb generator via merged
 systemd-tools-native
Thread-Index: AQHdCr3cAE5KByRuwkW5yUlQea74XrZyFnYAgAQGHAA=
Date: Mon, 20 Jul 2026 07:26:06 +0000
Message-ID: <0b406994f714c1d3659dd054ceea97e95b7f8090.camel@ericsson.com>
References: <20260703072948.2939128-1-daniel.turull@ericsson.com>
	 <20260703072948.2939128-3-daniel.turull@ericsson.com>
	 <791CE8D7-F761-490C-9922-4A71F96614DC@arm.com>
In-Reply-To: <791CE8D7-F761-490C-9922-4A71F96614DC@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|PAXPR07MB9642:EE_
x-ms-office365-filtering-correlation-id: fc725e5f-7298-4509-af8b-08dee63029ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|10070799003|366016|1800799024|38070700021|6133799003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 
 NK0vTEh6ZOM8Cr76Jh44qnsJQhS5Qbns7sNtLyaisK1ndlusplWAJeSuvL5iV3/jATwjR2DQLlY/h5AF7T2Vf+CySWN+BlpUm0zGo8c1sXQ629T7KvYlthZ721omtQsW03kkUDdl7nvfb8aIcbsBWa3ciLUFZ+7MQuWiBOyQYirVgWuca46I7IyMZ2XIMjQpevvMLHw3b60Sjo8pZK0KdUvRmz8xn2XQt5r97bbNZt2EjfoD069Mdtuj5oYbXk+RuyVXi4T8eb/sh/PVtxZmVxN6zpthUIqFBlNeXWjoiiweSMfbt6tp6HDzdObb4gg9NZJCL3vcd1iIng0MZLFeK4KeXweumR4SETOu3JM6mWtIS4VkJBlFy3PF5r8RnrT7IhhRED0TyCE29oVIblG79DSzbUGtvfnFyMy0PtYJUyFeijvwQkHXHsD/mAuweeZ1ABT9v2SDo6/NNXHyn1VsktluEqkggDcyvDNI4Xl4s+BhGDc4X7051Jpoy+CKSkyo9CSzTwNnmtLa5PmEiQ+XIbAKRlHeEAIppMmAGdPF3IDSGUpygzJoAt+JXHcMPGFXG/vREb5KDzhgdc4xcfvFbg2emr4xFLVsk1CkMxyseUCbJlw8fkiD+2YuCfqXzsHoOraG2NVJcYnJlUqT4d+Qa/17Q1U1wA2zap/F6DceDixpkLOma6Ir3pYIyGWCRbSRO56QYPqy380kkN3UMuGlW+agjCWPDtNMXC6DmjrDhPU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(366016)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Wm10ZW42UE9vY2loTVJoV29rYUh6bm5naXR3RUVNa3E2aVF2d2NId2diR1Bh?=
 =?utf-8?B?bmc0c1YvaGZtcGpONzUzNlc5b3I2blR4MnJUazZUd0VUd0xUNVlYKzdvWFBn?=
 =?utf-8?B?MTh5ancvdXZiNGtncU8yZVpjV0dxdEMwQXdXb2dkN1hwL3RQUFgrZUVqRHoz?=
 =?utf-8?B?aTZTSGVFQU5yZFZYRGdaNjlUSW42R1lKSEw4cXdtSGFDSGdYZnhOSU5rclIz?=
 =?utf-8?B?ZGZBN3krN05LZ2VzS2lTYjVxVjJuOVdwcjc4TkJ3eUVPRjZ5QW5hakhuaUNH?=
 =?utf-8?B?TVRZeWRrWTNpcVgySHE4emRQVWxCVUNzbWsvT2VBT2c3bkdZVVJVZGJoU1lJ?=
 =?utf-8?B?d05MYkUvRW9vK09Ua2xBV1c3bzBGNnE5Z3A5Y2tRVDkyV2NkRkNVb0JMcGNv?=
 =?utf-8?B?RGpWVmt0eUlCSXhpMkswK0RLY2hZdWlTSE5YeldCZ3YxdExaK2JIU1JWc0o5?=
 =?utf-8?B?L3diMStqOHRmTERHckhJaHRTVWZRZndmelZ0SXVuUDk0NkZzdmhWckZDMDQw?=
 =?utf-8?B?OXpJanA0Y2krcVk1c29Jd1NjRmx0THB0UkEyQmV5dld3K054UEpIZFNCU3pJ?=
 =?utf-8?B?RUVlQjdiYXZWTVdzWHR6b1RUTnQ2TjJIMmo4aGxhbmZ2cW4xdGFpQUNQc01F?=
 =?utf-8?B?RzM2R1BJTmlVSDhVWWMwcWRsTmpDOHNOTXhIRDlYdUk0bkxXS0ZwZFBTSDJ0?=
 =?utf-8?B?QlcvOXNOUmJlUWY2Wjg4TGhpclBQVFA1ZUJUREJTdThyNmRFL2VmQnAyZlVX?=
 =?utf-8?B?a1YxeHB6RTYyUzJaWXVHVFpiVy93R3RkYThZV294eVJhdzJhanhsTWFSMElS?=
 =?utf-8?B?eElSYXlNL1pVZGthUnAvWWxEb214VFlLaGRjSWwrSjhTdUJYZFY0UzNjbU9B?=
 =?utf-8?B?OVBKN0gxQ2U3MFdPajFhT3lOVitOUklMQlliY084S25YYktOb3lpbzFFMHBD?=
 =?utf-8?B?ZkMxTGxyRzBMMmRGOWF3QjVLSy8wbzVXUGt0aXpRejJhNEFOUEdLYkU3N1Ar?=
 =?utf-8?B?c0JZY2JyZXl0R3pnMEUybGU1bmZ3aUZwNW9UZ0hRTUdzOVlBNFBid1pwR1FM?=
 =?utf-8?B?cEN0T2RVaFI2MlQvcnFHRjFpSDlndFUzdndlUjRxZTVzZjg5MGRuTEhVeTNa?=
 =?utf-8?B?Ymt1UkRjSjNtdU81Y2JOVW0yekY1NkJkY0ZFYjdYNTQ1VmJPQmlqVDNCOERM?=
 =?utf-8?B?OUNaSytCenhNNWpoRmVhYXVkTThORld5bFN4T2YwTkJ6dFNBM3l4UG1QblRC?=
 =?utf-8?B?bzh0OW1Rb3lFd2Z0NUtvODFjdHVOVWwvZXBCMDdGYXF6K3V4ZjE4ODJhRWow?=
 =?utf-8?B?dHg1UXRMVGdTQWd4R3RrTzVoK3F5M3hhNThCYWRwQjBwQzdxNi9BTFJKSW5S?=
 =?utf-8?B?dC9vZ3dIa3Z3ZUFaYWN3eVllU0xONUkrcE9aMmUvM1ROV3hzMTFHWjZwV3FF?=
 =?utf-8?B?ZWtKVjZ4Qi9rR0U0aWpRam5MOHN4STA1N0RpdFpJaHloMFlGZW5lTENtektx?=
 =?utf-8?B?YXBaTGVWUTBWaWwxWDZGaTFJL0YrVzAvOVBRUVIvQ2pzN0JEZ0VxdGU2UUhw?=
 =?utf-8?B?VHczMEVtdi83RGoxQklDamVROXptYnJIaHdlMjU0SmZ5R0RzcDd1VWNCVTRj?=
 =?utf-8?B?QjNOYkUxZGc1bzNSKzhHRFBuNkUvQkl4VnpmV1NxOXBaZERNcG43Ym8vbnZj?=
 =?utf-8?B?cWNRMlBHUWN3ZnluYTNhaUJJckkrOGFrUE9HbFNKckFoaWR4d3FtY0FleU5s?=
 =?utf-8?B?b2ViZGJReEZNcjRtSlFWT1Q1dlphQXVnMC8wVmFHTWtJNTBCMHlNQmNOYzlE?=
 =?utf-8?B?Qml0dGVQQXUzWjdxa2VrNHpvUE90eTZjdTF2R1NZbDQzU21KWG1KZ3hjd1ZG?=
 =?utf-8?B?T2dFaUE3djk5b01UTUtJNW5aZjQxYTdTRk1nSmNmRkNwREY2aWhCUlhhcGRm?=
 =?utf-8?B?ODBYWGVSbkdQNU1uMTBNU2dBWkROWldFdVB5Y1Y0S0x6MGFsUGtMSUZRczhL?=
 =?utf-8?B?YzF5TElTQ0s2YkNDdUZPS1JrSGFQbzU5WE1PRytqeWxUeEJtanF6cEtiK0RV?=
 =?utf-8?B?ZmhIZmg0aGVqTFBtZW9lelN0V2wvNzJzZzFZK0FpTnNRRWQ2K2FGcEU4Y3NP?=
 =?utf-8?B?aEhrTk1VcHgvSzhYc2VQYldERU5aaGRPV0ZKMlJtd04zM3Z1c2FCajhoOE1u?=
 =?utf-8?B?bC9vTDlLSWRXL1F1MWRVaVE2MmZ3ZE9CNTBXeml5QVlUL0E5c1dWVm03elZ5?=
 =?utf-8?B?TEM1OVFDVytTbmNUZ1dZVTdRS0crNDFNcTI0Zkk1OEh2NkUxRERMRUtDbGtj?=
 =?utf-8?B?RU1XczBabUFYTUF6QityUy9tTTR6dFVRM3YzTW9zcmdsSzBIZkN6VVB5QmhQ?=
 =?utf-8?Q?sph8p/vBrRPjTUmLsRG5nJcINDO1+iWZqUjxHHSTUvcIn?=
x-ms-exchange-antispam-messagedata-1: wmXNYZpcIqzNBE9wQ9amRusOUMqbWUmSaXo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BFC805887DB384895B35BBB5147BE02@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc725e5f-7298-4509-af8b-08dee63029ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 07:26:06.9237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b7Zjb3zi18DQEix7zf5hPy7ccR1GP+a4ghP2LzkfyQ2uW3y2n5T4vvBYg4QxXYBGX3nbhs53hWPNfcttd22EWNOwrkVBIl5EJil901qu5oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB9642
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 07:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241329

T24gRnJpLCAyMDI2LTA3LTE3IGF0IDE3OjU5ICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
SGkgRGFuaWVsLA0KPiANCj4gPiBPbiAzIEp1bCAyMDI2LCBhdCAwODoyOSwgZGFuaWVsLnR1cnVs
bEBlcmljc3Nvbi5jb23CoHdyb3RlOg0KPiA+IA0KPiA+IEJ1aWxkIHN5c3RlbWQtaHdkYiBuYXRp
dmVseSBzbyBpbWFnZSBjb25zdHJ1Y3Rpb24gbm8gbG9uZ2VyIGRlcGVuZHMNCj4gPiBvbg0KPiA+
IFFFTVUtZW11bGF0ZWQgdWRldmFkbSBvbiBzdWNoIGhvc3RzLCB3aXRoOg0KPiA+IC0gQSBwYXRj
aCByZXN0b3JpbmcgL3Byb2Mvc2VsZi9mZGluZm8gbW91bnQtSUQgZmFsbGJhY2sgZm9yIGtlcm5l
bHMNCj4gPiDCoCBsYWNraW5nIFNUQVRYX01OVF9JRCAoYXBwbGllZCBvbmx5IHRvIHRoZSBuYXRp
dmUgdG9vbHMgcmVjaXBlKQ0KPiA+IC0gQSBwYXRjaCBmb3JjaW5nIGNvbXBhdCBtb2RlIGluIGh3
ZGIgZ2VuZXJhdGlvbiB0byBhdm9pZCBlbWJlZGRpbmcNCj4gPiDCoCBidWlsZC1ob3N0IHBhdGhz
IGluIGh3ZGIuYmluIChyZXByb2R1Y2liaWxpdHkpDQo+ID4gDQo+ID4gVXBkYXRlIHRoZSB1cGRh
dGVfdWRldl9od2RiIGludGVyY2VwdCB0byBwcmVmZXIgdGhlIG5hdGl2ZQ0KPiA+IHN5c3RlbWQt
aHdkYiBvdmVyIFFFTVUgZW11bGF0aW9uLCB3aXRoIGEgdGVzdCAtcyBjaGVjayB0byBjYXRjaA0K
PiA+IHNpbGVudCBmYWlsdXJlcyBmcm9tIGVpdGhlciBwYXRoLg0KPiANCj4gU3RhcmluZyBhdCB0
aGVzZSBwYXRjaGVzIG1hZGUgbWUgaGF2ZSB0aG91Z2h0cyBhbmQgaWRlYXMsIEnigJl2ZSBqdXN0
DQo+IHNlbnQgc29tZSBwYXRjaGVzIHRoYXQgZG8gc29tZSBjbGVhbnVwcyB0byB0aGUgc3lzdGVt
Y3RsIGNvZGUgKGFuZA0KPiBjb25mbGljdCB3aXRoIHlvdXIgc2VyaWVzKSB0aGF0IGFsc28gdGhl
biByZW5hbWVzIHN5c3RlbWQtc3lzdGVtY3RsLQ0KPiBuYXRpdmUgdG8gLXRvb2xzLSwgc28gdGhh
dCB0aGUgdXBncmFkZSB3b3JrIGlzIHRpZGllciBhcyBpdCBkb2VzbuKAmXQNCj4gYWxzbyBuZWVk
IHRvIHJlbmFtZSBsb3RzIG9mIHRoaW5ncy7CoCBUaGlzIG1ha2VzIHBhdGNoZXMgZWFzaWVyIHRv
DQo+IHJldmlldy9yZXZlcnQvYmFja3BvcnQvZXRjLg0KPiANCj4gVGhlbiBzb21lIHJlc2VhcmNo
IHJldmVhbGVkIHRoYXQgd2UgZG9u4oCZdCBuZWVkIHRvIHJ1biB1cGRhdGUtaHdkYiBpbg0KPiBh
IHFlbXUgYXQgYWxsLCB3ZSB3ZXJlIGxpa2VseSBkb2luZyB0aGF0IG9yaWdpbmFsbHkgYmVjYXVz
ZSB3ZSBkaWRu4oCZdA0KPiBoYXZlIGEgbmF0aXZlIHJlY2lwZSBhbmQgdGhlIGdlbmVyYXRlZCBm
aWxlIGhhcyBleHBsaWNpdA0KPiBieXRlc2l6ZS93b3JkIG9yZGVyOiB0aGUgZmlsZXMgZ2VuZXJh
dGVkIGJ5IHBwYzMyIHZzIGFhcmNoNjQgaW4gcWVtdQ0KPiBhcmUgaWRlbnRpY2FsLCBzbyB3ZSBj
YW4ganVzdCBkZWxldGUgdGhlIHFlbXUgY29kZXBhdGhzIGVudGlyZWx5Lg0KPiANCj4gVGhpcyBk
aWQgaW52b2x2ZSBkaXNjb3ZlcmluZyB0aGF0IHRoZXJl4oCZcyBhIGJ1ZyBpbiBwc2V1ZG8gYW5k
IHdyaXRpbmcNCj4gYW4gdXBzdHJlYW1hYmxlIHBhdGNoIGZvciBzeXN0ZW1kLWh3ZGIgdG8gc3Ry
aXAgYnVpbGQgcGF0aHMsIGJ1dCBJDQo+IHRoaW5rIHdl4oCZcmUgZ2V0dGluZyB0aGVyZS7CoCBU
aGUgbGFzdCBiaXQgb2YgdGhlIHNlcmllcyBuZWVkcyBhIGJpdA0KPiBtb3JlIGxvdmUsIGJ1dCBJ
4oCZbGwgYmUgc2VuZGluZyB0aGF0IG9uIE1vbmRheS4NCj4gDQo+IFRoZW4gd2UgY2FuIHJlYmFz
ZSB0aGUgMjYxIHVwZ3JhZGUsIHdoaWNoIHNob3VsZCBiZSBhIGxvdCBzbWFsbGVyIQ0KPiANCg0K
VGhhbmtzIFJvc3MsIHRoZW4gSSdsbCByZWJhc2UgdGhlIHVwZ3JhZGUgb24gdG9wIG9mIHlvdSBu
ZXcgcGF0Y2hlcy4gSQ0Kd2lsbCBhbHNvIHRha2UgdGhlIGxhdGVzdCBzeXN0ZW1kIHZlcnNpb24N
Cg0Kd2hhdCBhYm91dCB0aGUgZGViaWFuIDExIGNvbXBhdGliaWxpdHksIGhhcyBiZWVuIHNldHRs
ZSB0byB1c2UNCmJ1aWxkdG9vbHMgd2l0aGluIGRlYmlhbiAxMSBzaW5jZSBpdCBpcyBvbGQgYW5k
IHJlYWNoaW5nIEVPTCBvciBzaG91bGQNCkkgcHV0IGVmZm9ydCB0byBtYWtlIGl0IGJ1aWxkIG5h
dGl2ZWx5Pw0KDQpEYW5pZWwNCg0K

