Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98475C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 11:25:41 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web11.40522.1669893933264243856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 03:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=czFIu5qk;
 spf=pass (domain: arm.com, ip: 40.107.8.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsNJad+zJQ7JadNAF/6jTKDO1nfe87uvQ3K1adxMcMmSNF4C9aNPo0KCNYRuU5H9GBWoDVwEXKRQKXmoobfY4Vpkn3FmyM2IkhMtdmYY+TbYQAcyQ4WWYojpYQlhujBdQ2qg6VcfFg2NhBwcThEZr9gsuRxSj1Ik/+Oj09pcqtU68dmxkodb/IBqT/mPvC100Nygwio0lO8zO6DJgkTkJNnA4YLoljOZydBGKG+nPRVPzQxy1TYwFULmfx6pC1a58LDSBsGt8SfIQylBAd9dLTXwOmpka9XnBu54+38sfmYNodLlabV8o6XTM1Wxb860xaSW2aG93ZSc+V0qtsG+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1gLI62eoIjuLqpiKDucX16DCoE21k12x2MBHVBRaQc=;
 b=IK3/hGJuuCFAs7npQDeoYUFbCB1cjbikw4AbpVIG9aJlveyIXBNqKIrZO2b1+CeQjoR9TJFn4PfPH4atBfMlmheT2qrVZmvcsXAI/DIQcg1EhuO+cCY9t2wY5XEgzNhNe2VYZ5ycFnBVaXCLuTthwUTsAtdner0pF8iWMx/ckDDGUhPeSjTOcIjoY6hBRrW8uesShYvyRtqcqEoGTIIXmOjCvJpJdwYMCslLcTAmvYDZ/P1Bro2TghpXb6e9g+hgkk5HgENf9jNXuGsGDORbmAwD0r7dGToOxlBzfShh8mWucpv2NIy1xvSjkGftjotryxYGDF/5E0UV0wjf9qoaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1gLI62eoIjuLqpiKDucX16DCoE21k12x2MBHVBRaQc=;
 b=czFIu5qkGj7U8Sv16AEHkGPdZsJGXtN+vvQTRWvj1kJbCMNp8Hxa/uym+FiwbxzhiRkfqahmSctDBFgOFYqfyJGDgnaL8kgqxttX/ZpZauSdLf0iEjuTps5iF41P3oeX2/pV7D1FFEOj6Qc7f60wZmfQZ5y3zfXPuwu9fWxs43U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5411.eurprd08.prod.outlook.com (2603:10a6:208:181::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 11:25:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 11:25:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pyih.soft@gmail.com" <pyih.soft@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes: make TOOLCHAIN more permissive for
 kernel
Thread-Topic: [OE-core] [PATCH] classes: make TOOLCHAIN more permissive for
 kernel
Thread-Index: AQHZBNg4VymjSPtyL0K4z+VVAFCF765Y5X+A
Date: Thu, 1 Dec 2022 11:25:29 +0000
Message-ID: <C5C61A1A-4E14-4D7F-97BA-B12C3FB15417@arm.com>
References: <20221130162113.3731385-1-pyih.soft@gmail.com>
In-Reply-To: <20221130162113.3731385-1-pyih.soft@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AM0PR08MB5411:EE_
x-ms-office365-filtering-correlation-id: 013c8620-ec4e-429d-9f5c-08dad38ec08f
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VeZjy/a4EMK4a67sYPMMKr5cyOAaKsJ+24wM9oH8nf3pMetHFTZTP7q49EW32G+u3hDqLH3FKCA7MWu7AfrTot3ucKIRkDVQ2lZLo4WvPazdJZg521DjWU2C2by9P8iniqGq9NPHuy5hgq37htv2SlmfSld/citMUNFgGy2e+vNm8mRXLKPJ3wEN7S4uBaCNCthDLCippBbaIcG9Zb+DrSjVTJIyavBuUHpIGHFVS7sFRx+SLqImJC2EcjRZjkEOczpZVOzR/71gOJySfJFrl6mZnfiyxgdHe5v64R9ickkpOJ+houqyEHcqiu7+QxjjoffvBmlrzubUALwt5a2fiXPcBBaKTpa+FtvwBAoH12c/iuXdV+183Oh6xfyYgoLfv/f9gqu4uhp3Q7ybnj9o/DGSLS62/zXQS6TDYoHiKDHTxWQy4phcpTckxt9WPN5n/9V+OjhDFXXKjm/dLwXG+vmWb/+xiN8NzlO4QgS7eaQ1I+lDo168gWAaYGJ5UmozVqKDHuUU0AOrR4JeNJV9KmfsgiNOVNosPqWjvBBZq5DizLgFoMONRqNcdzhFq3wIwn+myVjb4+PphEYrrBpYG3E/TdyZg0aB24x3SoA0RD6rCWjcJTpg5mFyDNNNrLxxWemy7aCnH9f4IQgixh/CbSIkJ4C7l4TUoQBxIOvfQqjdFT/FdabRblw+4kCzuNsNOt6n882tyny8xE6RwQUpnZcqgQ3AvSMK8B1yyphYYZc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199015)(2906002)(64756008)(6506007)(478600001)(38100700002)(76116006)(66556008)(66446008)(66946007)(66476007)(41300700001)(8676002)(33656002)(36756003)(91956017)(71200400001)(53546011)(26005)(558084003)(8936002)(2616005)(122000001)(6512007)(186003)(6486002)(4326008)(5660300002)(86362001)(316002)(6916009)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eS9wNGFDRWdGMjNDaTJrMVF6UENLU2pLZklNVXZIckx0SGRvVzNiRWdKTnpz?=
 =?utf-8?B?RWdQeExKU1lVTDhwdzhhR0xIRHdxQzF3ZGQxZmpMS2pDU3VZRi9mSXBkZWFw?=
 =?utf-8?B?R0EwdVl2OGlDS3NLckhnMDhRUUJOdzlHZjJ6Q1ZkNzlORXJwRUpoRkZ5eFVU?=
 =?utf-8?B?Z3g4ZlU0eGxRaVVFTkUwVm9kVW5vaURKbmlYc1pGTFh6NHZyZ3B4amZqMG9h?=
 =?utf-8?B?WlV6d0g0TkYzNHBrSDc2QnVudThMeWsvK2pGU09mTUJHWER1NnllRExZVWhv?=
 =?utf-8?B?dTI0WmNhS1BBYjVaaVhiUU1YOTBBc0VhcWxTRW1yTDFtMjlaNVNHNWEvWlMy?=
 =?utf-8?B?MHVsc0JLandjNy95Q1RZalZBeDQ0M0pjaGNBUTlVcmFWUnlRN0s3UjdpWkJv?=
 =?utf-8?B?R1VodlhqaXhSVThKUFh4M3ZQUEF1R1RPcjhlN3U1NFNObzVMU2o1dkI0ZWdV?=
 =?utf-8?B?cXZYbHdaS2pUYVh2bFNiMkpQZTFaVG1OSG9OSENrWldTZDdna092bis0aDRQ?=
 =?utf-8?B?d3lXZGFnNkhReXBvRUxydWJtVVFOQzNJUGpnRDh5bFE4Q1Vmb3c5Q1c0WVJF?=
 =?utf-8?B?NkZ1aGM2M0F0MjladUlMdGxjTFdvU3h6RVIwaWc1WEZCVVdxeWlWUUx0MGtp?=
 =?utf-8?B?ZTFVZ005WGRNQ2JPbWFNMmJqRGdPTTJibVl4b3NycUU2SWxPNDFmZWdXMzBT?=
 =?utf-8?B?K3lGcENmMFFkVDBrL01zOWxxWkJ2c0VmNlZueUVTTXpyOVVtb2pQUVhOWit1?=
 =?utf-8?B?RnVyQk5QNWZISENKVnM0V2xodkhzNUlVYnJTUnE4YzFTRkRWeDJkS3JvamNu?=
 =?utf-8?B?OW9zZmNrWEtDSGV5WEV0NWNSM2UvYTNWWkNDekFPWk1PVUpRK3lDSGN6cjA3?=
 =?utf-8?B?dXJEeDJXN1ZqZHdMbDJzdHN1MnlhbHZIWTFuUTgwVzRXV05JZTYwQS9lMk52?=
 =?utf-8?B?ZUxLMXhSVCtBeWszOUtqVTJiLy9GU3lGMmxidlFRbkNwbzgwOTR1SUF2N202?=
 =?utf-8?B?RmFnWGMvdEMyTzJKTXB5bEVtdVhMNlh4bDVtQkh6b2U1NzRhRHphMG1LYzJj?=
 =?utf-8?B?TjE0Z2Q5cVVyNUdZNEFCTmtFTTdIaXVxaWFRaGFGSmpYTFkvN0dFdEthdzFM?=
 =?utf-8?B?Rk9ub3l1cHo4K3N6eGJnZFMzOXpiVzdtNHBZQUhOSGpacUhJeTV6bUNTbkJm?=
 =?utf-8?B?Y1VpN3VhL0hKcGVkMTMxM0RwKy9xdERad2hMQ1ZxMkdud01RbHBmamxMZkZG?=
 =?utf-8?B?dEtLei85dG1xYnhOc2Y5UGgvVHpVb0xXR2N5T3kvbWZBcEJmV3VnOHoyVkxJ?=
 =?utf-8?B?K3YvM3VwSFp1eTdxMDBrdXFTN2l5aXlORWRMd0RkSDhjSFo1Nk5hRzBTQW1p?=
 =?utf-8?B?MnNpVTduOE0wM2hURUNaSFh5SG42S3dmRWlWSjVqUVJPK1ZqQUxwWmt2dTNX?=
 =?utf-8?B?VEduaGo2ZG1ZK3N0MTM3UllsN3h2cEMvaHdZRDgwSUFTdnNDNnJCT3RDS3Zj?=
 =?utf-8?B?WUVTTitoZStlRUlKVUo4b09jSUZoUFZidndoUFM1K2w2NjlyT1RtcmxZd21w?=
 =?utf-8?B?NUJjQ3ZNald1U1F5MFJLNkE4SktsUmQ1RkQ0R0ZRcGM0RzNvMll1ZE5wVmhk?=
 =?utf-8?B?OEVsK2NUeU04eHYyNm91MzRuQWRmYkRlTXQ0YzJXTm9UaVZsN2I4ZG40bkl3?=
 =?utf-8?B?ZTlnQ0NyUytrdHc0RHI2YjJuZ0ZiZ2pzMjUxZUFDdEdmMmMvbUZQZHlWb1RM?=
 =?utf-8?B?dmg1NnBTSWQ2YllSRHNQMUg4R2tUa3UrWDdZMTNIdnBtWStLRDFTRlN4TXNw?=
 =?utf-8?B?V2pPTHMrV1N4ZURVeWhSeWg2M2JWeW4vSkxFM0JNQ1h1eGg4RExuS0ZHQnQ4?=
 =?utf-8?B?WHVmRFBCSmVKUDNTVlNySS92bmMvcGthQkQvbXFQOTYwRUJtWG1nQ0IvakRB?=
 =?utf-8?B?dGx3V25Mb1graUhGWjd1YWlhZHVmMnU1d29LQ3VLcTVUK0tlRXp2MTdNNnAv?=
 =?utf-8?B?bHJsVDFnT1ZHV3BPWnV2WjliYU5KNlh1dGVGMEE0Ym5EZjdlWGRiZytJM0g4?=
 =?utf-8?B?ZktMdENTN3pXL3hITWRMNDRncWdEazl1cDFlVVFTcUV6WDF1NUtzRWJ2clZi?=
 =?utf-8?Q?wsdh5Gtfm8A1lpnpitsNsDFbk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77D186A39077FC499A9BCF289E7ACE6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013c8620-ec4e-429d-9f5c-08dad38ec08f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:25:29.5176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FH+jDdYrZrBCXSZtSpKjQFTbCQU2qFkAZUtqNezbVcDawUpTbcnmPD4TIBYDSEvDq2YfSaPO66oo92FLZhjglw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5411
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174051

T24gMzAgTm92IDIwMjIsIGF0IDE2OjIxLCBBbGV4ZXkgU21pcm5vdiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cHlpaC5zb2Z0PWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gLVRPT0xDSEFJTiA9ICJnY2MiDQo+ICtUT09MQ0hBSU4gPz0g4oCcZ2NjIg0KDQpJ
ZiB0aGUga2VybmVsIGlzIGJ1aWxkYWJsZSB3aXRoIGNsYW5nIHRoZW4gdGhlIFRPT0xDSEFJTiBz
dGF0ZW1lbnQgc2hvdWxkIGp1c3QgYmUgcmVtb3ZlZC4NCg0KUm9zcw==

