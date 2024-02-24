Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4740EC48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 14:29:03 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web11.19809.1708784941072250611
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 06:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=g/9wCIZ3;
 spf=pass (domain: siemens.com, ip: 40.107.8.58, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtSv8/EFXnRPbV/el3lw7E5MIoifn1hkO6gE6aa522nL2xHd0opiyAjXIXqSWFmngIIHXj836e7nCJ+MeiHohp3NuffirgO5GOgxcT65+pUZg2Hc47o8NokaBMnujC3dsiq0KjelwtZetX8SHUJpjSVUUSW8NlhqxEMT5GPdvV/i9ym3WbfWx5BsVxfL3TRlIRssaCOttlFO0y7vZEz/N89f2H5qZlq3w9ONLNDYO7LMXfsosjg2881NMQyJ3/UqSfpqIhwRXlNyPB95EnLRBJAykcjdV4ylEnW+Z7qYXpLi0O8p40Sqr/BTgZE+i1jLnjdbzPFKhj/ix0uOZS//lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uz9eFLNtXsiL+YjkuQ2XeM0O20W2+JIFIwa/CT8mnls=;
 b=P3GZJYGnVkSngZJzDp5+SFRe+TRyG3XpJN8U8gyMggFEf1XZzoNCFzSwXzv+MdlO0HvVm7K55zJbQMAalgxeZVI3a4ZSxWC1z6UARMn8YNdKRyWMX6Y34BVTquUWfYbCzMNXuxJAeJ3P61QRdZeTlJbTetr79iD2hsYzU+8BPigrPp5SxY3ERI1cddL0s+EspsKWvjWUerpOgSOSjT5l67hRmvFAXpczemsUkR8pZDeCt6zAuOPwv9HvyXyJZG9uOU2bqapqGdO9bjwC5htTIy+s+jLBaULAZyqMB9MpHH41k6Lo5sWegg0LjkYXl1DMi5wbzZ206CEdbJLQDqeKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz9eFLNtXsiL+YjkuQ2XeM0O20W2+JIFIwa/CT8mnls=;
 b=g/9wCIZ36JY5jW8ofTMdbQ8e2633M5Qvg+BFqqC2ZJkKK7TDDFdkdqLNh8Q7DUQci5XDvF79NttHd6mR9kUlVRYc7Jge9L0BPA7tRNimVmzF2qTRFEd6vB0TaVKTJECt4IdZS8sfF2SS6O9NdGiWnVRCD3KHheJog3t2ybg96tR1KQVkgNz5HDkZlzxpIfSGa46rSwMLakva1jGvlXV1SdCNYZCBcL6uQMvq4MjEFsd6BoVHGD/pSCeYmF0/GrdSRqWd4q122D2E6/wO2rx0S0zg7+VbRMiBvfVdBsXx3r5eb1tkqaUqnzTGnqn1XvbfkV230EhhogCzyoLtVH2Pfw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5637.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:243::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.31; Sat, 24 Feb
 2024 14:28:57 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7316.018; Sat, 24 Feb 2024
 14:28:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "simone.p.weiss@posteo.com" <simone.p.weiss@posteo.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] cve-check: Log if CVE_STATUS set but not
 reported for component
Thread-Topic: [OE-core] [PATCH] cve-check: Log if CVE_STATUS set but not
 reported for component
Thread-Index: AQHaZpyaj6c6Q5Fr3EqeVFdzingttLEZjE/Q
Date: Sat, 24 Feb 2024 14:28:57 +0000
Message-ID: 
 <AS1PR10MB56977B0654F86221C1B4A70AFD542@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240223210848.21731-1-simone.p.weiss@posteo.com>
In-Reply-To: <20240223210848.21731-1-simone.p.weiss@posteo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f42b33c1-5e9c-499d-aa90-1ea8af743680;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-02-24T14:21:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5637:EE_
x-ms-office365-filtering-correlation-id: e6fb935b-f579-4698-6c0d-08dc3544ef6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LGE5RzxBuPDa2oigMg6GkixrBbWZUX3kcLWyGq2FgtCwf//Pqcgz/SJZdqXD0d4t44cZo5B1LUcY8O8rJh/dSmnnW2XlDo2eB3RGQdmV43sD32yV0UXgF/HoJ3CZJ2P81Mm9PLfyyNW8DIyqesRUpIOnI8VCB9y9CRLvmmKhZIOGnR9BjZa7nlwCBVy+wVj5jDz1JCNGurV8sBrL4Fvh4nnOwXLYhIqAOwPgyr8r5zz/S3P6kRUmBkbqykLP78kypaDv3+s2B8Lbxi1Rxb9Ibftf+j0KyJalBg0r43eYwHf5kuyKwR2yEZXi9I+7qIrbLl9u3139ANegAwcIPsMvB64pDxDk+MbMBZ0ghzoRc4X1HPvSLHi+862PjhVVnLqz4d6vxpUfRq/YYk3RgmCxlijEwot0wkXBtqiL1+2b0j7wAypL9w03qH2207hY44NtuUNH4Z1JdWJoGRFTxeociO9vX0f1h4jjlIYMUcsOvADZXSwKJJiuFuS35So1C2u4If6opxt5MWzBQ19yGD1JV/6eVDxpg1PSTpfxjUj87PrsEN2mcYUy8OZHmrFcs8Vue0PJBpowkEKYqDSkdLmEoyLiBuFIYTaN60EYn+bLZhTxaj5NlDujsm8sh+4wRRkZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VzVwdEl6eHB5WVNRVk5jMW1uV0ZKcGZDTjVxSGJwSWYrR3k4cGtub3R5TUNM?=
 =?utf-8?B?QTJQVjQ0bE5Dd0o4cVZxVmtqc3Q0SGZqR1RMbStzZ1hTa2diOGY1Q0F5VW4w?=
 =?utf-8?B?UDhFZGxQUkxGdTZyeG96bWx0TU93RkRsTG9waE9kOFFNYzFsL1dUc2FGUzVZ?=
 =?utf-8?B?RlMwa29Db2lZWS9rUzhuajBBd0tkWi9FNk5TMlpmTHR1L1B2Zi9GWW9aOFZN?=
 =?utf-8?B?ampzSkpUK0dpSzBia1c0RXlDVHRsVm01WEpJcVREUGFBeE1GUG9IblQ1cjFh?=
 =?utf-8?B?SS9BdlhDTHNPcm5vZFJ4MXhXMjF5dEhXakl0eG5pRjBnZHUrM1N2VytqZ0U1?=
 =?utf-8?B?d2ZYcGNHd1dpczh3RHRNY0MyWFRNY3BZWHU5VHRBNnE0Z3VjTDNnWmVzS2hC?=
 =?utf-8?B?VzI5Smk1R0F3N1BzenI1NFkwdXk0eXlPQUtGbm9mQnJmdktPc24yRi9jZUk2?=
 =?utf-8?B?ZUhha2xDK0FGd1p0QldzdzduRUtBTmJabVJFNWJ2aCtRWlltT3k2SnhuZmlM?=
 =?utf-8?B?bXJoTXJ2dlZweThGSDVWd1lBZWN2OVFocGVuSkYxWUUrWER2K2x6Q1Y5THRC?=
 =?utf-8?B?RHRoa0dsUG01Y1BwSzdPcnMrU3NxN3ZuYzdxUU1Vd0FEQWYwQXBLcFpmOWQw?=
 =?utf-8?B?RWhPeSt5N0I5UVpGQ2ZaenJUeTczRWFrdEUwdmNXL0dUdVo1b1hXWVZuNHVQ?=
 =?utf-8?B?RDFDSXR4MWVBek41RHNaT1dybGowWUdlM0pKdTdsNDVIVnVVRDBnNG9Gb1Rr?=
 =?utf-8?B?cW5ZcTgxeG9NdTB6VmRTZ3kwZC9HdHZjYnpJZ3V0b1FjNmhscHFRYWwwZGtV?=
 =?utf-8?B?TndlOFpyNitnaUhKRmhyZVMzSmI0ekkxZlR6ZHN3WmRXQzA1ak93cDAydEdY?=
 =?utf-8?B?c3pTZHVuTXV3dHp1bEdMclRadDBjWGd0dE5mZ1Nmb3VoSk15bDNYN0E2ZjJJ?=
 =?utf-8?B?OVZjMUNNV3c3dHk4bk5JanBNSGM5U0l1ZGp0Rk8wa2xOeFowT3RhWmVZY05v?=
 =?utf-8?B?MjhmUGo0SzFGcHEwTzdrRStuZzlSMkZZNzJlYWFIMkRJc0Z5RExCeXJvUENp?=
 =?utf-8?B?N0FZR0c1Q3BGWXlaN2JZblRvL2xUZHE1RTIrOHA1UWdNRDBrdEk4MysxQ2Yv?=
 =?utf-8?B?d2wyazExbmJrdWFYTHk4K3N0a2ZyemtMNHFvci8wU2xFMnpsd0xpV3dsR3dw?=
 =?utf-8?B?cklpb0hnalJzcjNOQ0hLdmRrTndoNnFvVUY1WU1HSGhKdlVpUjR2QUQweERL?=
 =?utf-8?B?SWdwK1VVWml3djJsNzZJOVQ1dU54NjkxaFBMOWdveXNlR1JlNGVZSExsV29Y?=
 =?utf-8?B?Z3ZpNTkxNk5nNldWaWZ0UHdSekMvbnpaQzg2aGYrTk5ZODBUNjR2SFNmNlhU?=
 =?utf-8?B?ZldETXhGYTM5THcwOGJhcjA3TGNGR0xKYUlic053R3ovbU5TZG9qd0pYbngy?=
 =?utf-8?B?V2VseS9ZVGJZR25CUnJUbURpS2ljZDVvVVM2NjkrWlJmbGRJYkx6a0drWVox?=
 =?utf-8?B?ZzhMZEF0ZURTbXg4ZjhEZ1MyN3Y3WTFEcnFCZGpWUnN5N3FPYnlBQmRNems0?=
 =?utf-8?B?S2lFYUFwK2J4KzRzZjNSa0pEUDFMRy9GSWwzVXk0TWV6YkpvUklnbXhUNFZy?=
 =?utf-8?B?VG1IYjk3SXJqUTJNNWhlN09WMEdaOEE5TW9jWmtTWDlLYWFEVndGRU1ORkhK?=
 =?utf-8?B?TTdqbGJwTUVsbG5DckZROXZRUmJGd25Rd01PQWRxckJYaWxoSm1ndGUzbEhC?=
 =?utf-8?B?SEt3cEM0YWI3VUZ2b2E1T1FjdzRIc1VUZXVIRFRkSUM5L1k2SUcxVFhUREJ4?=
 =?utf-8?B?eWhCbGx4VVU0eEJYME1zOHJFMFYxNm90Y05TTkt4Ym1pSU5ockMxRXhrT0hX?=
 =?utf-8?B?T2piM0RxUjNBdUw0Q1dieS8rdURYc0ozWm5pOFhSWnVLY05pdkZYNHd2Umpj?=
 =?utf-8?B?TzNtQ09vOXRiYXVETjdkcjA0SXBLNnRuU09CaW9sVm9aN2MvZ3YzOUQxaTFD?=
 =?utf-8?B?L3UrV2QrM1hUaTdsOSs5aWZzT1hRekRKWUh0YTFqYnhUckdBdXdISjVPZkdM?=
 =?utf-8?B?MHNlMlhCd1BXWklxNW9KeDlHMkE5emI4RmlKdnk0K2ZSd3FSUEpDQy9TTFJU?=
 =?utf-8?Q?UVGR9CiZGdoLIcHkLfHM6jT8O?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fb935b-f579-4698-6c0d-08dc3544ef6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2024 14:28:57.0769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +vF186APzSRN9vWtoMWyVnxMNSM4OiXGys4J0vYmmRIKHfFyKNPnAcjojL57Ieer15gSNmiuU8uNxDcHZYKt9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 14:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196131

SGVsbG8sDQoNClRoaXMgY2hhbmdlIGxvb2tzIGxpa2UgdGhlIHJpZ2h0IHdheSBmb3J3YXJkLCBi
dXQgaXQgd2lsbCBuZWVkIHR3byB0aGluZ3MgZmlyc3Q6DQoqIGRpc3NvbHZlIGN2ZS1leHRyYS1l
eGNsdXNpb25zLmluYyBpbnRvIHJlY2lwZXMsIGFzIGV2ZXJ5IGV4Y2x1c2lvbiBpbiB0aGF0IGZp
bGUgd2lsbCBnZW5lcmF0ZSBhIHdhcm5pbmcgaW4gYWxsIGNvbXBvbmVudHMgZXhjZXB0IHRoZSBv
bmUgZm9yIHdoaWNoIHRoZSBleGNsdXNpb24gYWN0dWFsbHkgaXMgbWVhbnQNCiogY3JlYXRlIGEg
KHBlci1yZWNpcGUpIHZhcmlhYmxlIHRvIGRpc2FibGUgaXQsIGVzcGVjaWFsbHkgZm9yIGtlcm5l
bHMgd2hlcmUgd2UgaGF2ZSBhdXRvLWdlbmVyYXRlZCBleGNsdXNpb24gbGlzdHMgd2hpY2ggZG8g
bm90IG1hdGNoIE5WRCBEQiBzdGF0ZQ0KDQpCZXN0IFJlZ2FyZHMsDQogIFBldGVyDQo=

