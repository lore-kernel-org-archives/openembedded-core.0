Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A833CD3420
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 18:51:23 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.67])
 by mx.groups.io with SMTP id smtpd.web10.22313.1725216677819318225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 11:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=sH1ehspw;
 spf=pass (domain: axis.com, ip: 52.101.65.67, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp4vGJc3DWL1rKXw2dSiSrA0+pGKb0XrOo20m0kodLSxRe36oySkqxMohx3lLCwMrPEOGAkV+bUpVPBdEV/6cjbfXpMH9Rkv0xhMGpoJnVwNSH7xGrrgPW3fTX5bjIe9Ahtbc/o9p9VcupjCVYVYh6VL6vJtiU9KZCDP85/hwtNnLnjWFErndmBrQaAoobs0sfMK85BhQidYFVsFFDe9WzWQcd9AkTFn2X68tVFrpCnxorQGpRRnWyNpeigCds8n/B1qzcdLeo0DAZ7c8WajdH57TXbtZJI+tI6+POOW+IUKw8V7zO/0IH5MHVW9JVrhiZKm04jzxIJjG1ZOv6rOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdlYLI52krP2siiBkmjymMvgZCn7jEbiZ1LHWzqt0U0=;
 b=UgZnvDueXtWvGQYHp8kddXmk38hWElWxHVso7tLQSX3vowEo6f1tDK6eFrENnJ7NX8befNovL99gqEnHOgjvkXAlTqldYRrvH+VUp1aS1mwsYfXTZovvZK7AbYlVDDY6iGZjvN0/1NjihCFnxvUvz6CIj5SvlzCXUiU+Lt7bC1H+/bR8y+poRzIj4CyG4jBVvzWKfzByPTv37j77xV5Cii2+1GerqGX8HkZuTG736ch0405D/cRy5P1vDCDv3T9FvNYEp0OO9KVkPyxkfTkxy47HVZ+QWlzRbb1osyX7X/emzNk4MtevnQsup40OXEbPUfa6mcltA4NcpZ8WaXP8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdlYLI52krP2siiBkmjymMvgZCn7jEbiZ1LHWzqt0U0=;
 b=sH1ehspw58lAxU7e1Ef/LVGrU9yw4CZkFDKgYuoFfQ5616GK3+1Nn+d7f3H7KpN775KOgVbjAz/oW6RfgqSyFFZtPRM8h4ZKfUuo5ZWR8PUan/4v2CSPBbqz/3blrOHXPJ2Fwc+r2F7k04phsdAGJP4LZCSp9NVkolbo6eXlihc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GVXPR02MB10736.eurprd02.prod.outlook.com (2603:10a6:150:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sun, 1 Sep
 2024 18:51:05 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7918.020; Sun, 1 Sep 2024
 18:51:05 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] insane: Drop oe.qa.add_message usage
Thread-Topic: [OE-core] [PATCH] insane: Drop oe.qa.add_message usage
Thread-Index: AQHa+WV2vHvngUGaqU+iUKuQtrNAvbJCyzOggAAG5oCAAHiTIA==
Date: Sun, 1 Sep 2024 18:51:05 +0000
Message-ID: 
 <DB5PR02MB10213834C9B3FA52ED293CA4BEF912@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240828161450.1488792-1-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB1021325EB5E087023B3C12C78EF912@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <8e3db3ca88fa5d5911a5b7d76b4703ab9ccd1dfd.camel@linuxfoundation.org>
In-Reply-To: 
 <8e3db3ca88fa5d5911a5b7d76b4703ab9ccd1dfd.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GVXPR02MB10736:EE_
x-ms-office365-filtering-correlation-id: 16bcbe3b-f879-41cd-267e-08dccab708a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YXlMa1BuRE8vS3V4aHliclZUdTFuQlQyMUtlSDVZUkdxWUs5aThQWDVqQmdW?=
 =?utf-8?B?Z2RMYi9HNURVTjZEaWo3amc4ZENmdnBBTDBpMlNISDZHYXdVVmx5dFJaUlMw?=
 =?utf-8?B?SlpJNnNXN0Qrb01UTGg5c3ZpenkzWk1aOHlKRnJHUjdPTVN4LzJCbnJkYUUr?=
 =?utf-8?B?ZjlOUzVEcWpIRXlyN2F6UFVxZ2tWSStFdm5EOUFERXlSRFVQdUdzeFVCRnBV?=
 =?utf-8?B?OHFpaGs5MjUxN3FHNVBEMTNTeDdnUVlscGNkcGtiRWY4YzQxNVpTelQxZDlo?=
 =?utf-8?B?R1NwTTlRdndJbERnNlpPOHI5R0dMN0NEbnhGQjBmT0tuL1JQbW9DT3Q0aWhl?=
 =?utf-8?B?SEltemR5cEVwblRGTGorR2k0SXFKVWN5S3p1cmVwVDJUcFNLZnFZRXNMcXFB?=
 =?utf-8?B?OXluUHlzY3pRZUZ3aTlHb1l0a3hhL2F3THl0citqRWpKOUI0TXNMd3Y2aDhQ?=
 =?utf-8?B?cFFQRHFFUmdSWUtiUk1ZSUFGOVVzbFJIRjJNby9jem5hV09Tc0R1RWFDTDU2?=
 =?utf-8?B?Z28xVVdtQ3B0aEpOVDg4YzN5WnBlZ0FMRWJyOTRESVRkVFJCSGFHZGJRVWdG?=
 =?utf-8?B?VHhaaGgrbmNDQkhUQ0V6ZVBhNGs3S3JOMW5ZMUVIczNRMmkwOE4rNGk4SHZh?=
 =?utf-8?B?WThBamhDZlpNelRDSlVaTlptb0dBSEViL3owaUF4dS9IMHdNOHNEcUpHc3Ex?=
 =?utf-8?B?YXhaVGFhK1BQSmJVbThsVVJNMEFWbVEwKzliV0MzME9ndmpuSXNleEYrSGgr?=
 =?utf-8?B?VmcxMjNrbEtzR0RFbkNCemtiNmJ6NWcyR1cwZG9tTWRaYkg2dENSZ2RtaTlp?=
 =?utf-8?B?RHg4MURnT01MeXNvOHdJVGMvWlRZMy92eFIrYlAxNTZSdWNpUkZuME9HYUNv?=
 =?utf-8?B?UFVXeE1yV3BKYWxYQWl0TFRpUnZRNzA1Y1YrNjZvQ0dRRjVid2pqV3BHWkFE?=
 =?utf-8?B?b0czT05lV2hHelNCYUpXekd2eGh5K1M4S1dybDMxZ2NYYWtWNFNxQUZTT0Rr?=
 =?utf-8?B?UmluSEE0L1lSZXFFbkpNclRJNnlJS3ltNGY1ZHNMMVlzMzZHZGpNRXNWT3pa?=
 =?utf-8?B?MXV3OTMybjk5dG9WZFduNklQYWdZeHlRalVjYm9aTFpia0xOc3FQOFRIYVhp?=
 =?utf-8?B?QlA2RHE0ODBDM3FIV0w1V2VQNlBFZXduQkg4eHZRK1kyNVdKOWwyM3hOS3Fm?=
 =?utf-8?B?OTNVdC90L2htVDljQ2E0YllGSkRoOE96UU9Yb0o4RTBRMGlGK2JjMjJtTHpX?=
 =?utf-8?B?SjNESmR2Vi9NSGdHcGZoa1JwZExORDczTzNEN2V0WVBQNVZiaURHS2NZc0FH?=
 =?utf-8?B?V01vNjVXNVNDdzRUK2VhaDFEUzRGOTBnb1VyV0FZdHVEMGVBMHp6Yk81QmtG?=
 =?utf-8?B?bE0rNkhkd0VxQi94RjFpRjlJNzdDQ056NHIrVUZ1V3ZkMTI5Qy8rNnVvNGRU?=
 =?utf-8?B?Q3REVnJScHExdjJQUTJ0SVJNZWhOSFRxRzFkVHRsSVpNb0lBVkU2NExXUWpI?=
 =?utf-8?B?a3ZGUnkySWVmcXNvUjV4djc4Y3djaTlKdE4zUlpUR2RuR1hNcGtEZkt5K0k1?=
 =?utf-8?B?QlRBZDJWN05PbzBvZlg1Q1B3QzJ2aVRSWlp2MEFvQUtEcldkdUh2Qm44N2Rv?=
 =?utf-8?B?MnpRcU94N3lNVVJDRWErQkZ2RzRuSzMraVVUdW96dEpzYXVUN2JCZzducE0r?=
 =?utf-8?B?YjJuTXRSOThsbFc5dGlROFNTQWh4cFRTMlV0bEtqMzUwd0JVY1RWZzJLVklZ?=
 =?utf-8?B?eFg5Wi9Vd0FpcEh5THUxRU8zUTFBczlrZGdvWC9tVjQ0dHdLWDE1M0JUWjNQ?=
 =?utf-8?B?WmNMaE1ndjZRSWE0UlhtTVRvN2tYdU16QktYVlpEK0FKNUo2NDlSV1NyQ3NI?=
 =?utf-8?B?YzdjMVFzbmpsbzZJelUwek9FbWRCcG5OYXU0Rjkyd1JONEE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tlh5YW5McW9pazRSYXlGeVNNaEZqNWcyV2JrejBtbDlmNTdXZTJBZDlhcFBQ?=
 =?utf-8?B?QVZHeVAxeXZUdE44cVh1eitUYWUyamdOeHVUazRibDRyMDVRSCtyNHRDSTFO?=
 =?utf-8?B?ZVF3WnYwT0lFS3NZS1htcDVtQ09JVjNqOFVGYTJOOUM3RitiU2p4ck9xTitR?=
 =?utf-8?B?OVFYY3lrYzdMMnhqazAycGlWVFIyajdBNFNLZU1VMklsU0NxRlFjNVoxNnpk?=
 =?utf-8?B?SnVXNEl2TGdzT3hIK3hCdFBab0F3R1ZPdEp2MnpscWxHTEtpaVRRL2MzVmZp?=
 =?utf-8?B?MXJkOS96QlpERXdZMUVJMlg1TkU0N2VwSGtEZ1dueS93TkJkUEpaMkdoaEV5?=
 =?utf-8?B?R0JzaVY2QjhySnhuOXMwSUZQTHYwSE5sdDQ1YXBoSklWMGZhWUk4WUpYNVd1?=
 =?utf-8?B?U3dzblVRblJKZ3I1UndFSWpvK0tySThjNDRSZXpjSVZrYW9mRUFKUm4vR2dP?=
 =?utf-8?B?ckk4Nkp0M0Zxb0xsVWd0SnR4UWxFN3VQTUpsVmZMbmFPK2pTVi9Id3FMenkw?=
 =?utf-8?B?UDlXbjVqOXlXNVhheklIdzlZWDI1K2dERlo3ZnZQaGJqcVBOZmttQVZaUS9U?=
 =?utf-8?B?RG1LekRuN0NpTGRCV0FCNCt2UTRFZmxuSm9PODFQNm1XaUMxaE9jaGdheURB?=
 =?utf-8?B?cWtHQ1FxWTBaQVNOZWN2aWJSVGtNOFQwV1ZnRWJGd3JsczJqWksyUFFpb2Vh?=
 =?utf-8?B?ajRiTk43MW5tVGZSZDZ3RlhSRXJuTEM5UUE3VldPc2NJVXBONlY5NFhCK1kx?=
 =?utf-8?B?S3BLd2NkUXFyNEdxZHkvMzlPR1dLSGV0SFNmT2FycWs0V0dUM1JFSTJaQmkv?=
 =?utf-8?B?UHhRemtJU2RXNFBTbGZLZXFWdXRHR3N0R2NPQy9ISS94ZjBTeFdkSkhEZXZ1?=
 =?utf-8?B?ZlNVM2lPQm5VVGpoQ0hIQ2gyb3ZsVStBamZEYm1LaXVlMkFrSzk0RTYxVmM1?=
 =?utf-8?B?ZzkrS2dGT2Y1czQ5ODdnR1FESTljb25QN24vVnBqT3lwSlVwVUN0ZnFUSUNO?=
 =?utf-8?B?OVpxOGNMMHlmM1ZHdCtlZlJwbUVSWUR0WlRMSlBtNXQ1L0tPbEZrZDFKUFFt?=
 =?utf-8?B?MXM3ZlF1RnZWbWxYUm0rOGQ4cS9xbFFMSnduQWFzNUlCWFFsN3pEaGM1ZlN6?=
 =?utf-8?B?UEdVZFNsKzJBMFh5VHdlckVRclFYZVdXY244aW56eVI4M1dmQ3JWVGU5dHFI?=
 =?utf-8?B?ZVRiell3UThxTW9tNXYrWU5rQTAvV0dUVmx0eFdBRHVsQStGMTFneGdQOWR6?=
 =?utf-8?B?dHM0R1VJaklxeEhMSENFUXFNaUFuZVc5S09GbnlIaDE1OGpaVG8wNytEa0xx?=
 =?utf-8?B?YkNORjVWZ1NCeVd4Ym10d1R4c053NWtBa0hhTVV1eit3Y1RSU3lrVmlTb0d1?=
 =?utf-8?B?R1dyWDN2ZXI2NCtGS0Q2Mi93TzBxbi9UMlBjeTZ3RTBXNHBJelVwK3UyYVNj?=
 =?utf-8?B?WTh4VnJRRW92M3lyd2NDK2YwZGsySVRZNU4xdmE4RkVCc0NBTWM1MHhnSmQy?=
 =?utf-8?B?Y3BDeitIdmtVckMwRjJzSjljc0NleHZHeUpOVVVDalM5Nk1zWHh5VVVKRzNZ?=
 =?utf-8?B?Nyt1c0dEcy9WRXBlNUhyc0RIZ3ZBQ1Myd0F5Z25pclJ0QXNqeHlDZFFOVUVZ?=
 =?utf-8?B?WkJ6aHhoTjdTaklwSXIrOXN1VWVaZnNnL0VOcFVxYTdOV2RZOW1KT0JWOU9t?=
 =?utf-8?B?cEpSUkVGZzBqemNnWnl0d0VCM3FYYnJndk5rNlJEZTdQelB2VW9UMURoOStu?=
 =?utf-8?B?cHVQYXJPYmFhVU4zbXN5QWVhZ0h4eXcwa1B5Wm5raXY1cnlCSThGM2N6UVBx?=
 =?utf-8?B?cGszcnpyWnhFb2VEekpCTXk2WWFrWlY1V2hHNCtGUWdKbHVNTzVlSEp5U1c0?=
 =?utf-8?B?UGNJQjBWYjFGcXBHM1IwK3luVzhRb0Z5TnV3TUNMazE1aUlVUktPVW0vTWtu?=
 =?utf-8?B?d2NxSmNyd2tvalliWW5FYWlxcUJlYUpqeFpaY0ltR1R0ZFpkNm10Ull6MXhD?=
 =?utf-8?B?ZzBhZ0dXV1FKN0wzZ2NCdDhpU1dhTW9CS1J0RmxrZ3hON2t3SVk2ZVhLMk9s?=
 =?utf-8?B?eTdaT3VkRnBIdGVpUUtuK2o4NUZxZytaYmJDa05obndRR1c5WW9sRXpZMFJk?=
 =?utf-8?Q?xtBs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bcbe3b-f879-41cd-267e-08dccab708a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2024 18:51:05.2085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6wdKdY0Ct+BYJRtKuDzO8+SXRbsCAw6vYTzB0Shp6bZ4yEbYBuYUId/mArhDNH2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10736
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 18:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204052

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDEgc2VwdGVtYmVy
IDIwMjQgMTM6MzENCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0
QGF4aXMuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gaW5zYW5lOiBEcm9wIG9lLnFhLmFkZF9tZXNz
YWdlIHVzYWdlDQo+IA0KPiBPbiBTdW4sIDIwMjQtMDktMDEgYXQgMTE6MjEgKzAwMDAsIFBldGVy
IEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnwqA8b3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hh
cmQgUHVyZGllDQo+ID4gPiBTZW50OiBkZW4gMjggYXVndXN0aSAyMDI0IDE4OjE1DQo+ID4gPiBU
bzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gU3ViamVj
dDogW09FLWNvcmVdIFtQQVRDSF0gaW5zYW5lOiBEcm9wIG9lLnFhLmFkZF9tZXNzYWdlIHVzYWdl
DQo+ID4gPg0KPiA+ID4gRHJvcCB0aGUgb2UucWEuYWRkX21lc3NhZ2UoKSB1c2FnZSBpbiBmYXZv
dXIgb2Ygb2UucWEuaGFuZGxlX2Vycm9yKCkgd2hpY2ggaGFzDQo+ID4gPiBjb2RlIGFsbG93aW5n
IGl0IHRvIGJlIG9wdGltaXNlZCB3aXRoIGNvbnRhaW5zIHVzYWdlLg0KPiA+ID4NCj4gPiA+IFRo
ZSBwYXRjaCBhbHNvIGRyb3BzIHVudXNlZCByZXR1cm4gdmFsdWVzIHdoaWNoIHdlIHN0b3BwZWQg
dXNpbmcgYSB3aGlsZSBhZ28NCj4gPiA+IGFuZCBkcm9wcyB0aGUgbm93IHVubmVlZGVkIGZ1bmN0
aW9uIHBhcmFtZXRlcnMsIGdlbmVyYWxseSBsZWFkaW5nIHRvIGNsZWFuZXINCj4gPiA+IGNvZGUu
DQo+ID4gPg0KPiA+ID4gVGhlIGNvZGUgc2hvdWxkIGJlIGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50
Lg0KPiA+DQo+ID4gVGhlcmUgaXMgYXQgbGVhc3Qgb25lIGRpZmZlcmVuY2UuIFdlIGhhdmUgdGhl
IGZvbGxvd2luZyBpbiBvdXIgZGlzdHJvOg0KPiA+DQo+ID4gV0FSTl9RQTpyZW1vdmUgPSAidmly
dHVhbC1zbGFzaCINCj4gPiBFUlJPUl9RQTpyZW1vdmUgPSAidmlydHVhbC1zbGFzaCINCj4gPg0K
PiA+IHNpbmNlIHdlIGRvIG5vdCBidWlsZCBhbnkgcGFja2FnZSBmZWVkcyBhbmQgdGh1cyB0aGlz
IFFBIGVycm9yIGlzIG5vdCBhDQo+ID4gcHJvYmxlbSBmb3IgdXMuDQo+ID4NCj4gPiBBZnRlciB0
aGUgY2hhbmdlIGZyb20gYWRkX21lc3NhZ2UoKSB0byBoYW5kbGVfZXJyb3IoKSwgSSBub3cgZ2V0
IGEgbG90DQo+ID4gb2Y6DQo+ID4NCj4gPiBOT1RFOiAvcGF0aC90by9yZWNpcGVfMS4yLjMuYmI6
IFFBIElzc3VlOiBSREVQRU5EUyBpcyBzZXQgdG8NCj4gPiB2aXJ0dWFsL2Zvb2JhciBidXQgdGhl
IHN1YnN0cmluZyAndmlydHVhbC8nIGhvbGRzIG5vIG1lYW5pbmcgaW4gdGhpcw0KPiA+IGNvbnRl
eHQuIEl0IG9ubHkgd29ya3MgZm9yIGJ1aWxkIHRpbWUgZGVwZW5kZW5jaWVzLCBub3QgcnVudGlt
ZSBvbmVzLiBJdA0KPiA+IGlzIHN1Z2dlc3RlZCB0byB1c2UgJ1ZJUlRVQUwtUlVOVElNRV8nIHZh
cmlhYmxlcyBpbnN0ZWFkLiBbdmlydHVhbC1zbGFzaF0NCj4gPg0KPiA+IGR1cmluZyByZWNpcGUg
cGFyc2luZywgd2hpY2ggZGVmZWF0cyB0aGUgcHVycG9zZSBvZiB0dXJuaW5nIG9mIHRoZSBRQQ0K
PiA+IGVycm9yLg0KPiA+DQo+ID4gTm93LCB3ZSBjYW4gb2YgY291cnNlIGZpeCBvdXIgcmVjaXBl
cyB0byBhdm9pZCB0aGUgdXNlIG9mIHJ1bnRpbWUNCj4gPiBkZXBlbmRlbmNpZXMgb24gdmlydHVh
bC8uIEkganVzdCB3YW50ZWQgdG8gcG9pbnQgb3V0IHRoYXQgdGhlcmUgaXMgDQo+ID4gYSBkaWZm
ZXJlbmNlIGluIGZ1bmN0aW9uYWxpdHksIGFuZCBvbmUgdGhhdCBpcyBoYXJkIHRvIGRvIGFueXRo
aW5nIA0KPiA+IGFib3V0IGluIGxheWVycyBvbiB0b3Agb2YgT0UtQ29yZS4NCj4gDQo+IFlvdSdy
ZSByaWdodCwgdGhhdCBpcyBhbiB1bmludGVuZGVkIHNpZGUgZWZmZWN0LiBUaGF0IHNhaWQsIEkg
dGhpbmsgdGhlDQo+IG5vdGUgbG9nIGxldmVsIGlzIHZlcnkgbm9pc3kgYW55d2F5Pw0KPiANCj4g
SXMgdGhlIGlzc3VlIHRoYXQgbm90ZXMgYXQgcGFyc2UgdGltZSBnZXQgaGFuZGxlZCBkaWZmZXJl
bnRseSB0byB0aG9zZQ0KPiBkdXJpbmcgdGFzayBleGVjdXRpb24/DQoNCkkgd291bGQgc2F5IHNv
LiBOb3RlcyBkdXJpbmcgdGFzayBleGVjdXRpb24gYXJlIG9ubHkgc2VlbiBpbiB0aGUgbG9nLCB3
aGlsZSANCm5vdGVzIGJlZm9yZSB0YXNrIGV4ZWN1dGlvbiBhcmUgc2hvd24gaW4gdGhlIFVJLiBI
b3dldmVyLCBJIHdvdWxkIG5vdCBsaWtlIA0KdG8gbG9vc2UgYWxsIG5vdGVzIHNob3duIGJlZm9y
ZSB0YXNrIGV4ZWN1dGlvbiBiZWdpbnMsIGUuZy4sIHRob3NlIHRoYXQgDQpzaG93IGhvdyBiaXRi
YWtlIGlzIHByb2dyZXNzaW5nIHRob3VnaCBpdHMgaW5pdGlhbCB3b3JrIGFyZSBoZWxwZnVsIHRv
IGtub3cgDQp3aGF0IGlzIGdvaW5nIG9uLiBCdXQgdGhlIG9uZXMgZnJvbSBvZS5xYS5oYW5kbGVf
ZXJyb3IoKSBJIGNhbiBkbyB3aXRob3V0Li4uDQoNCkFsc28gbm90ZXMgc3VjaCBhczoNCg0KTk9U
RTogTXVsdGlwbGUgcHJvdmlkZXJzIGFyZSBhdmFpbGFibGUgZm9yIGZvb2JhciAoZm9vYmFyLCBi
YXJmb28pDQpDb25zaWRlciBkZWZpbmluZyBhIFBSRUZFUlJFRF9QUk9WSURFUiBlbnRyeSB0byBt
YXRjaCBmb29iYXINCg0KbWlnaHQgYWN0dWFsbHkgbWFrZSBtb3JlIHNlbnNlIGFzIGEgd2Fybmlu
Zz8NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==

