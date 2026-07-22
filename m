Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C127AC44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:01:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43109.1784707296520139540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=arJlkbAl;
 spf=pass (domain: ericsson.com, ip: 40.107.162.1, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xETIzTZL7amF1yVg0nIhf8/E9iQU/k22n0ZQcJ6UGcJuYcYfrlRs3muZpEYdHR+IBVillV8ht0smm+3vpwoXJhUDt5lLGpQuBKou3VLAmMagMTq+En9tqh1f2+AfOBsmHcKfgMkhPLt8M6NTSXzfM2IaxhFu4zO1OMiJJFb/keION8WopzCF5Cz17BE0o+mYbKODM0J5LKNV6n1xDzBzWaI11MSNTJjuzBJ13rj4RZsr1jlWUmbwQe3JzPH0pce0gnIkG4L8FKJ0dh0Iy8HOjd7poPSNCHoid2ZfUUjk2Tflfprk542ni2k4jrkBw8GFbkPqeImEQtirAt5aL0i1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwNPoxZVIfNrZyFCFvaPSVPKQ8x01hCoQYJokccJ8UM=;
 b=IMa2WyLgB86aFyN0zFkn56xkQjCUCFzbEDGiia/b+gMP78I5MmQoYFJpPK0X5qMI4OGfpWWmj0qcva7VvKcbYVEQ8XQA7S6Dbi0u+61cgPgtD2Q2PIiMH1BFajNR7iIag5Wcwk4X1XB9TlcOGeA9AVV6yJWySwrvLWYlC1bEq3PKVUFx5p0tXWhQ1EOwH8gmNCU/4UHmF1mw+xWDETRnSSaDKu7qypTsbce/FodEUUPOwEoHxsoKe9JodS94pYkrDuCZjVQbIc+bJQLeZB7yKfrcM/5c5Te+AT+IDPLH3ow2SWO9d7zfNXuv8K4s7d53W5Tb2+xiSxMAkR+jKvrz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwNPoxZVIfNrZyFCFvaPSVPKQ8x01hCoQYJokccJ8UM=;
 b=arJlkbAl2dQjCDB2dhLFVNOxoLdrXXt8W7uZ5dCnQr6P+sdBNg5izSWtH3CEETFGRD+C0MWiBG7eocU10jy30dlmqlcLPXj7D+hxNPd31nQvN0qpiAiq0JJbeK6WNyLYamsVyfrBgg5iSGT3+UPA1nUI+/W46qtc9T7SBhtuE1q47/+SgqKGQjuZoXCMqsOYduohNG4r6eONhVh0lgP4MMGeU9sYX+qbqVGx543MPmeObmIaq3HqKhqWaUCAg6NngxWfCOxmkdnG9oZDxmvqOvzO5Wy6E5rb/ydUwjQEgJt0qpNJgX2kMkGsKPVkPrM7fC9Vho2IyPYq/aO9QbChAQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS2PR07MB9569.eurprd07.prod.outlook.com (2603:10a6:20b:64f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:01:32 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:01:32 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Patchtest results for [PATCH 2/4] Add tag in SRC_URI in
 multiple recipes
Thread-Topic: [OE-core] Patchtest results for [PATCH 2/4] Add tag in SRC_URI
 in multiple recipes
Thread-Index: AQHdGSAUqI6j/dgSgUinleBko0kAi7Z4EaYAgAENy4CAAA25AIAAATKA
Date: Wed, 22 Jul 2026 08:01:32 +0000
Message-ID: <55debff78cf58a24020eb4f214259f5cacd6dde4.camel@ericsson.com>
References: <20260721144811.323786-3-daniel.turull@ericsson.com>
	 <0101019f85332a41-715bc4eb-5531-4e75-b229-00eb43db757b-000000@us-west-2.amazonses.com>
	 <0d61576c6efee1814a1faabf68d32c6ccdcfcb4e.camel@ericsson.com>
	 <DK4XUCZ5OA0V.3T7IGSRDSI1PO@smile.fr>
In-Reply-To: <DK4XUCZ5OA0V.3T7IGSRDSI1PO@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS2PR07MB9569:EE_
x-ms-office365-filtering-correlation-id: 8239d445-1155-4322-c050-08dee7c771bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|4133799003|10067099003|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 jJGNXJ9ctEnuimnoKv27ioXVGX3rPK0OX65MF3wj5DelmD6sC7va7yL4iGBqilhX7pDqsPCB1ZvO7HJZWXiQdfXRAK4b/ry2DOArau4rbJjnKvBg2JtAmOKpXFJAT5goLWgAXSbanPWwei8DwqUpY6TrMU6R1AaiY8bVHhK8S7X7RgGTnO7QNTsvDie3bwZ7fIdF6c3oTx2lTC/ozNX7WaRMkd0bNPSadlhfN/tqxmCXcUmnhCjEbkClHMUcNi7BU5U0dL5DutqA5yoxh3fqhW7o/b0rKDpzCsd98dxQtB3SG05obf66tqCl0sjNc1tmVvK8xngUAu3j5CmtPAXM/Fqfv2FQjI+eoQ5ZnQSQrA4SEmOlfAWIWw5vI99fWK+gyEjw3TT5vanHdw50ZR2h7ROEurOfoWtsbdNYbVJzyBiNy5q1HwbbH5Izbsu3lcOVCYwQcBHtTh34xzmBLvJrneFvEOnE1bM6Q5Qv37g2apJr6FxkHy6EUct3eIuNkfahrYujH/H7Q2Mpi4nSFDtiJk4C1qZnWAajEYpy5DFok/5HZQaB60I9awpjUjB6h64qovj0hDLgPkaTxpjCfnCAjCCwqpnOJkiDDihT/5WbfXc/EkuPBWkyipzCRbJAk1VZICojosipFqmEN61Ibbv3MvUUmftr6nph91N398Ns7LGSG8rfffZ4WOGQpHS+GDtF+K9i5etEYJI2Gt+6p1iGXiB31RzcTkNBlfWcuMKK9rE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(4133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aFpWdVlUUUpvKzVLWXkzREtRSThyUGlIcWRRa0dhVzV3T0RWNUlxMDhOdkdL?=
 =?utf-8?B?d3E2UFBTbUxSS29oYzZGSFFnNEJrOHNxVDFvbE92OTFuNWVBUmxWaVk2cDdi?=
 =?utf-8?B?emRwdUJnMG52SDFmajA0cTdnMzB3RzRTMXpzdHFKVnd5ajdieWlDVzBSbS8r?=
 =?utf-8?B?L0Mza0k4MENEVi91WW1DWjY3bjYzUG01K3lqK21JOE1XcUhBZGtBYnNZeDMy?=
 =?utf-8?B?aUhha1BOR3Y5SmhJOTZWaFlDYXZQN1JpTjZSSWRQbXhCR3dJaFloQnAyT1dN?=
 =?utf-8?B?OWZXbk5GVEc2blBHdjQ5TThHajYyNkhrWmtFS2Z6cWFlU09SR3pGRjhIMmZC?=
 =?utf-8?B?a2FjK1ZNMFp1Qit5YTNET2ZqYzc5Ym1jaDVVRUxjWnRkOVlORHcxdjFMSXhX?=
 =?utf-8?B?YWdxdnNxZFFhRHJVa1ZkOHRTMlFaV25seXFYdUxXR29maDhKUXRPcTlFeDZp?=
 =?utf-8?B?TVNVWWF1REFQTWRiQkhVSWM4dmN3WFY3cTlJUFZ5d0xsdm5RNCsvVWVHK2xa?=
 =?utf-8?B?eXpESWJaOGtobVhSN3JKeU5Vckx6S1F0cGl4NytxdmhTSEV2d3pSQmtpZm9p?=
 =?utf-8?B?UUcvV1ZXT1ZHek4xOUZ3c3AxcnA2VWJnVFZtY3gyMlFkNGlVQWorWUkwdHY4?=
 =?utf-8?B?aE9naFlSNk41L0l0dnk0bUlPTlhta3o1V092S2gzUDNjdTNOdk5yYVJCU0tu?=
 =?utf-8?B?Qmsza29ma011M2Zqd3ZmUm5ZQ3R3R2lxWGNFN1BQZVdoamIxWlRJWkZaa2d0?=
 =?utf-8?B?YkZKK3dDK05URVZreEJNNC9YVXVMMGRMaHBzZTMrUU8xQWJmdHVPTlhnaGNp?=
 =?utf-8?B?L2xFUVZ5eU1TSjNlZUdkb0hmQXlyM1ZqdHRuTWhocDVHMlcrUVJUaHlEdUZV?=
 =?utf-8?B?UmloUzljWlVkSTU4YlpZMWNoMERySG1Qbm5xYTJWWTUvbnlPeVRPeDRZMS9T?=
 =?utf-8?B?eTBkV0p4ZDhSU2FTdENtai9OYTAzVW5IZWh0WWw4d0YydU9SWTZJdDlKZFNj?=
 =?utf-8?B?VnZJWC9qbUVuV3lDUDUwUXE2c3JHT2VOT1l6d2RNWVJwNC9mOEtFK05IS2JN?=
 =?utf-8?B?VHduOHJKbHpPcVFQclJPMjdzdXcreUdmbytnbURMVlgvM3pvWXpyNVhwWlNo?=
 =?utf-8?B?bkI0dE16WVpjeGdvcVloMUZ5T2JiRGxtcmNrVXl2Rjh2MzVhL2dZdVd4TjFj?=
 =?utf-8?B?dUUrRVBEa3pUZ29CYi9nV3lSTzdVRXhZdGFlRVZyckM1UkpYM1pqS3F0c3Zo?=
 =?utf-8?B?cmVGcXVRZ2xqRFpQK3RPZkpYdzlETENBMUdHck1rWVd1eUE2bU1jRFNTOHdo?=
 =?utf-8?B?VXkxQ2hhYnAyNEVGZVBrOEJIQ1M1dEVIMWsvU2pELzJwb3FVNzc5TUJ5Vlpm?=
 =?utf-8?B?WW14d3hwOU5Jb2p4Z2ZsWnYzTllFN0Y4VEkvcUVzWmU3M1o2ZUFaUVJTMjE3?=
 =?utf-8?B?SlZ5dnU2NndSV1dMVlMza25sYTdST3hCNnkybmU1bG8ydlY4TEM0aUNEZFRp?=
 =?utf-8?B?N3VnM2xWcFhRbWVXQnhGdHphYzNBdTU5d3FzMnRSelR3R1ZPWFRoQ1hyRU42?=
 =?utf-8?B?QUs3ZTEwSGpsdGpHQ1k5a2dtQjhCNklsOWp5KzNGRzZQeEJBVlhkbVhaTW8r?=
 =?utf-8?B?MW53YUV0Z0QxcnViaytTL2wyb3EyZnlrOGhlczhCdytHbzFBWkhpS0ZLUits?=
 =?utf-8?B?MXhJb3BTbzd6WGFqV1lnVmF4QituK3FQcHRoSllJajdzY242Vmh0cTNvb0Zi?=
 =?utf-8?B?WVRvcXo4emE4M2hsRkFCeFM5cG5INWc5eXIzaFpRQ3l6WmZMQWFlRjBlSGN3?=
 =?utf-8?B?b2NvWXp5K21ZY3JFUEhLTmVMS0xURkVhbGxhNnB1bDRiNnJ2dkFjQ1JUNnZO?=
 =?utf-8?B?OTEvMmVqczJOU0Q2bFlQNGZ0ZmNJSmplcXllK0ZPVFpHMk1aT2hHTkhQZXpF?=
 =?utf-8?B?K2lsbWdhOEFoa04wVWVPckFJWlBuVjZuc0RCMDVzamY1RSs0L0h4Qm5Rb21L?=
 =?utf-8?B?WXB2LzBNeHVicWp5RUZ0UWxublBpNTE5V0t5QkxJWjNXRit2TCsxSmladlU2?=
 =?utf-8?B?MGh1aUtJaHQ5bGxnN2lCZ0xpZVltOFdsM1REWGtaQmdFeW8rWFRIeTJrRVJ5?=
 =?utf-8?B?akk0U0pkZmRmdFphSndrMHhaRjZDSEsvSjc3RnpQME9WQ0ZVOE90ZHVPekVt?=
 =?utf-8?B?N3Rlc05EbXYwTHRJUDJNK1p4SHkzeDRiU2I5YXZQaTlnaEF0WDNYQ3F3bS81?=
 =?utf-8?B?VFhDaWRXU1BENnRaMlFPUjJNVUFnR1l6dmlIUkhVbXptWW1wazBXREVOV21I?=
 =?utf-8?B?OC80T3FHZmRzUElCWDBpVDF0RTE5eFZYY2VLQzN6eWtqUTJGN3F4a3pvMTFz?=
 =?utf-8?Q?Q9bypg+d70V2Wqt8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E79A80F02116114DA44470F892C241CD@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8239d445-1155-4322-c050-08dee7c771bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 08:01:32.5357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSGwYPuLXgeC/zvt18VTjqYxLuchVFCRPJEfLl+kn6l9gt901xNHo3hBuXIlIccHpo+n3u4iXto4f43WxhFjQHufI4HZ88RKhcVr3Np+7Pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9569
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241607

T24gV2VkLCAyMDI2LTA3LTIyIGF0IDA5OjU3ICswMjAwLCBZb2FubiBDb25nYWwgd3JvdGU6DQo+
IEhlbGxvLA0KPg0KPiBPbiBXZWQgSnVsIDIyLCAyMDI2IGF0IDk6MDggQU0gQ0VTVCwgRGFuaWVs
IFR1cnVsbCB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBPbiBUdWUs
IDIwMjYtMDctMjEgYXQgMTU6MDIgKzAwMDAsIFBhdGNodGVzdCB2aWENCj4gPiBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+ID4gd3JvdGU6DQo+ID4gPiBUaGFuayB5b3UgZm9yIHlvdXIgc3VibWlz
c2lvbi4gUGF0Y2h0ZXN0IGlkZW50aWZpZWQgb25lDQo+ID4gPiBvciBtb3JlIGlzc3VlcyB3aXRo
IHRoZSBwYXRjaC4gUGxlYXNlIHNlZSB0aGUgbG9nIGJlbG93IGZvcg0KPiA+ID4gbW9yZSBpbmZv
cm1hdGlvbjoNCj4gPiA+DQo+ID4gPiAtLS0NCj4gPiA+IFRlc3RpbmcgcGF0Y2ggL2hvbWUvcGF0
Y2h0ZXN0L3NoYXJlL21ib3hlcy8yLTQtQWRkLXRhZy1pbi0NCj4gPiA+IFNSQ19VUkktaW4tDQo+
ID4gPiBtdWx0aXBsZS1yZWNpcGVzLnBhdGNoDQo+ID4gPg0KPiA+ID4gRkFJTDogdGVzdCBzaG9y
dGxvZyBmb3JtYXQ6IENvbW1pdCBzaG9ydGxvZyAoZmlyc3QgbGluZSBvZiBjb21taXQNCj4gPiA+
IG1lc3NhZ2UpIHNob3VsZCBmb2xsb3cgdGhlIGZvcm1hdCAiPHRhcmdldD46IDxzdW1tYXJ5PiIN
Cj4gPiA+ICh0ZXN0X21ib3guVGVzdE1ib3gudGVzdF9zaG9ydGxvZ19mb3JtYXQpDQo+ID4NCj4g
PiBUaGUgcGF0Y2ggYWZmZWN0cyBtdWx0aXBsZSByZWNpcGVzLCBzbyBJIGRvbid0IGtub3cgd2hp
Y2ggdGFyZ2V0IGl0DQo+ID4gc2hvdWxkIGJlLg0KPg0KPg0KPiBGWUksIHRob3NlIGdsb2JhbCBw
YXRjaGVzIGFyZSBvZnRlbiB0YWdnZWQgIm1ldGE6Ig0KPiBGb3IgZXhhbXBsZTogbWV0YTogU3Vw
cG9ydCBvcHRpbmcgb3V0IG9mIGFueSBtYWNoaW5lIGZlYXR1cmVzDQo+IGh0dHBzOi8vZ2l0Lm9w
ZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0Lz9pZD0zMTk0ZDY4NjhkZDE0
ZTQwYWU2NzBkYjA4OWU1YmY2Zjg2MmQzMDQ0DQo+DQo+IFJlZ2FyZHMsDQoNClRoYW5rcyBZb2Fu
biwgSSdsbCByZXNlbmQgYSB2MiB3aXRoIG1ldGE6DQoNCj4gLS0NCj4gWW9hbm4gQ29uZ2FsDQo+
IFNtaWxlIEVDUw0KDQo=

