Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B61E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 18:10:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web10.26183.1736532613433289724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 10:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=p5nOjtel;
 spf=pass (domain: arm.com, ip: 40.107.21.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoXB13DDTIJsrloAFxojO4LQoxxLsyHLdmqLrnRo5icxfSNWGWpZdJNaxlsbHxMxJgCgEhoMFCbBjBuf6I0xwLS14UwKk4G3UJA8QrIDINXybJPrBKcC9hjQnhEyyG2TzD+fYS+/KvuYwWliGzwRUdBGAsWLLWo9/jLzj5slJWtGku+eBCZJ/wh546n4hQCpIeV1Dkln+AH/uHeIdBe/d9NinvT3vxkgbG4lJsFLea627RULdIwBw+D2vBvEGZFUEItty1cZndyw79Sgz5LYUIVcBgaAMIJrW+haV7DNsdt/wO3HuBCBGqZH/m1VDNsB+XStdudZn7HsJ3I8qjyQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qC8Gdpdc4/sOxNNbFcXqNxKe/PxWvdukmhW/titw8mA=;
 b=H//j7Ecu79Ymgn5qJ2fFe9cncEZZ5XSQSIuzd8DPOCCUOS4vfp6/ExOPRkvLFUN0oraoY8ZOBB+NnHUEvMX+qxziWS3j4RgNJSh2IhTrc6jtrd+HdJ6ZIuUhYVi0Y+F3d7772JweHEJF1dbjD1DiZlDsF7Zc5hDjzYj+HElyOOP5j8oStUAKRiRJayXsgM8B3YZO45WLswVyX0SuGiaStaqTD+ZdtcykhsNcaYI45HGWcwVYYhlLhbv+B2wrUEhU62BQjWJRveP6Vvob9S08tsrQX6JT57QMkGq65xFcMjF2w9O+P6c63iJwIRg1OBiushkE0aYnb9BmdBO0E7ji4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC8Gdpdc4/sOxNNbFcXqNxKe/PxWvdukmhW/titw8mA=;
 b=p5nOjtelG+sXJbYEdSsvmeTZJX2JXWfS0CWoWjVCOQ+tyelOYKtZPWi3ef5Yj12srFtyiCOsz0nW+qWZW9TsrXHYEkCKdI32gDhb/mUEbL2c7dlPHywH41Pm3EkGNTT5h+dBb1tJMU7ZxriqONd55UXKR5bPPHU+IoSqupRbw0s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8978.eurprd08.prod.outlook.com (2603:10a6:10:466::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 18:10:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 18:10:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Martin Jansa <martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] classes/qemu: use tune to select
 QEMU_EXTRAOPTIONS, not package architecture
Thread-Topic: [OE-core] [PATCH 1/3] classes/qemu: use tune to select
 QEMU_EXTRAOPTIONS, not package architecture
Thread-Index: AQHbY1/6faVkiZOy20qKIOHyVu9MlLMQRa2AgAAESICAAAUCAA==
Date: Fri, 10 Jan 2025 18:10:09 +0000
Message-ID: <8D7499C6-D8B3-406D-B241-1026BEAB7188@arm.com>
References: <20250110130116.894607-1-ross.burton@arm.com>
 <29D20DF1-96A7-4A24-B3EA-8252C23D15AC@arm.com>
 <CA+chaQckoaDTGVik=PW4FtnK1_qjdVLJhd+2AR6_az3vphAtEw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQckoaDTGVik=PW4FtnK1_qjdVLJhd+2AR6_az3vphAtEw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|DU0PR08MB8978:EE_
x-ms-office365-filtering-correlation-id: 796f4cc6-b88f-4e03-b0a8-08dd31a204c1
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cDhURDNUUEdOQ2JWQ2xsa2NTMXZSdUdJdmMwVk9oQVVoajUzSHlyNHJWbG9V?=
 =?utf-8?B?Sm13c0JkYzB5aDBWM041eUpjaGwvbFlnTjVGQ0tiYVlyTW5hWlI0SWdUcjhy?=
 =?utf-8?B?WUlIR2RuQ1R0VS9Wb000U3g1cnRnSHBDcWhMMjU5OTl2d3VDbTBSTFloRHlh?=
 =?utf-8?B?UVl0R1V4Vk5wcXBiSGRGYmxMVXpscmk3c3lLSXA2cGNtdFRjVlVWYlFXVFdM?=
 =?utf-8?B?UTZNaUVISjBlVDVRWnNsTU9Ud0c1Yzh6eDltYmVMczQ2S1UzUm9JNGpnbjNN?=
 =?utf-8?B?QktRRUpUbVVwcmJWb2RmYTRmY2lMdjFLUVdLcFN5bDNJMEVBdWlyUURQR0tr?=
 =?utf-8?B?aG9zZXJVZE9LdExwc1gyajFEellySFBRQzVzSXhNUW8wY0h5b1gzbHFHM0k5?=
 =?utf-8?B?SG1hcUZiUHJZSmdOM3VYU1R3UDNiWjZQV1hqdWU2ZEdNb2xjSXdLMHdJUVg1?=
 =?utf-8?B?OHd2UUthVjRza25vUnZLVGtqWXV6TEJ5eDhoQnhUWGxRbzAxOU1VR1czUjJF?=
 =?utf-8?B?K0w3US9BbDltTGpsNXkvMWlXc0ptdWhSckpiVURESVFNQjJXQUYrZHJudno4?=
 =?utf-8?B?ZEp2cTFzd2RvOXlUZjBHSGdPLzIwTXl3NDhINXRpOGJiL3M0dlMwbXBSZ1pK?=
 =?utf-8?B?V21tTG9RZmRua1U0UGRWL1JsZ2xhTmMyMDR0a0VWWTRJeS9ZTmtXTVlLek1L?=
 =?utf-8?B?M2hpcVRzamJBcHVWU3laRDB4K0RZc2xLcEtVc09UMFJrc3pMN1pSTGlQN2xp?=
 =?utf-8?B?Q0pycTRCRGQzRWs2SzJtSWExdm5CUzB0NGRyaisrQm50QTU5d2p6ZUppMERn?=
 =?utf-8?B?OVZ4eFhNTElUTTV3NE9mMENLUkNXWDFzV3RoWG5EbThnYzdiL2ZOKy9RSitO?=
 =?utf-8?B?RlJIK29JVVF0QTdZbitwWHk2UlVTNlh3UlhMemU4OUxpT1FoTnBPcjBXSXAw?=
 =?utf-8?B?dnNOamtldm1Hem1yOEg2Tk9EOFRMMDZiSnRFWXNZL2g1RlhTS1hDeDdXVzN4?=
 =?utf-8?B?UmhOTkdMc2tsT2k0di9aWFNMR3g4MVQ3djYxL2RyZTVPTUIydVpPdmpSVjNU?=
 =?utf-8?B?YVYzd0d6YnVGZ2J0ZzFuNXluTktKaWtsR3VkZTAxSFcwS0pDTEl1WVBRaXpL?=
 =?utf-8?B?bjVRbkxmNUU3UWZ2dUZvbXhIZUM4UUhxSFEzOE94NnF2a1VJbS9ILzkrYS9Y?=
 =?utf-8?B?YjlrblJ3QnVUOHRRZXlIZE1NYzEyTjFOOG1Hc3Y2Wnl6OGwxZ1VxUC9GR01Z?=
 =?utf-8?B?QlZ0RDE0TnRzMlBuanNIY2cyQi9LUEhVMFgzSzJXMHN6ajNpWFpaUHV1UHMy?=
 =?utf-8?B?ZzRZQlg4TWJreXVmdDZpUEV4a2l4Y0RwbjVpaTVPc0RzMm91SFo0eEpaQWU0?=
 =?utf-8?B?eWtLK3NtdXp0MUNKRW4wamtmaHlWRXlRbjdWcEpGTURoZTNUWmE5ei9heFVl?=
 =?utf-8?B?b0lkRTBSMjBpRjY3cVBIQW5vQjZka0EzY0xTQUlKT0NvSXpacXZCZlJkOXBj?=
 =?utf-8?B?Z056ZXQ3c09lbWVRQy8vdkdjaXdzT3R0VVFyUzYxNUlUWWRPbExaVStCRmlu?=
 =?utf-8?B?TlhOVnFYOWhTOGpUd2FDb3lrekltc1BjMkwrQ3ZXcFNVcDlqaUNacmpzcTBE?=
 =?utf-8?B?c093alVHY1p4WXNoWjF4YUF2RmZrSncwMDNTSm10WXBHZTRUUWRWMWRCZUh0?=
 =?utf-8?B?eHY5SGxLR3p5eERGcS9sdnZlOUQ0cVZ3aTl4Um5ZWG1KenZweDI2bC9iVlc3?=
 =?utf-8?B?Z3RPTWZkUWFuWFcrcDVLdWsyZnlGa1A3bmtqWWwyazN6dnRDaWpucUhlU216?=
 =?utf-8?B?UnJndjJ3Vms0aUEyRHhRc29ubUh5RW1DdGF0blNvNzR6MUMzNDM5OTJWaUVk?=
 =?utf-8?Q?iB3VcPC8+YQt9?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VXd0aXYyOVdzbXdPVUVTSTZZckl0Q3o3QkZLM1ZrNVZIbXE1bUNzMEluTUE5?=
 =?utf-8?B?aWFlcFdjbG9WVU5ZRWIrSFEwbUlRSEsyRTRQVytOdkpMS3RYRDJ1RTMzWEQ2?=
 =?utf-8?B?WTUwb1ZqbklHL1F5MTd1TnFPbER2RjZsWFlKU3AzZDRCbzJpMTNGcU1hUVh4?=
 =?utf-8?B?SEpTdFgydTNrMkdISFNyRGIzYkwzdEF3NEMrSkVqdUlIcEI4eFN5ellrWStT?=
 =?utf-8?B?QlFxQ3hQWmJaaXduYU1PaitBUFQrQW1xNTFyRlB4SUVMQzluNzVUaVQxT0dS?=
 =?utf-8?B?UDFHNVRnbjhEa0dUejFVRFdWVStCc0ZWSmQ1Ni9DUGRDMVRJczNXNGNhdHRT?=
 =?utf-8?B?bjZXU2d5b3RLZThaTVVqYjU2SWFYVWxyRlhpRUtRMHRsNjV5UkkvL3FIdVUv?=
 =?utf-8?B?d21VNWYrVWlJbXdjQ3REdE1lbmI1bVJSazRad2xhdWU3UkNDU25oU2N6anp2?=
 =?utf-8?B?ZjF0V20rU0w2cWtVTjAwejVvZEdLeURpRC9UVkdLQTlrOXlxUVUyZ0J5T3Ex?=
 =?utf-8?B?eUt4eFVsWUU1a2IwbndnWVZiTjVHQ1lncXlET0V5TDRsamRRQzJjL21BOW5n?=
 =?utf-8?B?T04vQmoydHZvVkxRaFNKRENmNXd5aHBMRzc1eGoxL20raytNN2MrWFpQdFRU?=
 =?utf-8?B?eXB5UUFOdlMvS0E0R3Ftb0FqT096T0lvNTcrb2UyUEpEVkh4a2x6T1lnY281?=
 =?utf-8?B?RUM3NDV5TFRjQ0FPQjNuVm1mZmFMdTlvRml5NXhJUGEvTmlxUm45RnliTE96?=
 =?utf-8?B?T1FJOUsxam1BYXJTOUZNUWZvaVFJL1pJS2FzSW1BMGZpcUluRmNzekd2NG1B?=
 =?utf-8?B?UDZiQnJuaG9pQUFwOVNhTVpyaGJ4RmJZdFprWjNRZGFuOEwvZGJhWWp0eWpa?=
 =?utf-8?B?NDRZc054Qno3NVQxVXU3N2NGNzBUaFpoODBKSjlidEl0SWFNQnRyK2p2dzFr?=
 =?utf-8?B?ZzZlWkwxMHJhMkVBakxsSlBPbHpiaStocUMraUR1TEFNY29nUjVpeHVycHZS?=
 =?utf-8?B?K29zNE1QWGhrN1dzNS9EcHA5dlJaay8yR3JNVEt1bDNjbkRhNWtUMzhTZzNs?=
 =?utf-8?B?dDZSa2dZYnFIUGhBMGNqSlBIWGVKWlp2eitHYTM1ajdNcEN6WGtmSkR3R1NG?=
 =?utf-8?B?SVBFVHQ1M1NhakhaVEQwTWdEb2ZLMFZCL29PbnFiWXVDSURjb1NTREJ0MHZC?=
 =?utf-8?B?OGR0NktwMEpVQzVwSTkwU2I1Z1R3bksydnZDVzZ5R1FndHBxSWpWYy82N2JF?=
 =?utf-8?B?RHNhSFM0Uk9YWG9VQkZaUDR1RE4wWWxSdFVnV1lMSy85bEk5YVI0NHRZalJO?=
 =?utf-8?B?UDFSMWo5b2RRMWU3T1VtaFplNCtuemV5ZXYrcm9BNSsvSFo0TGRqUUtlVWcy?=
 =?utf-8?B?K0Q5SDZUK2UyYmcxWCtZWTRKVlZ1MWlqWGY4T1BiWC9CVzVMY1BmSTRBcDVX?=
 =?utf-8?B?cm9CalhOdkJnc0kreEZxUWt6YWZtNEhBOVZEbEZRbVFMY2Rnc2FuWW13N3pL?=
 =?utf-8?B?YzlLdUNSZTFkSzJCcWx3dy9LMWIxQXdrODFMNnA0dUt0UDBVVEcvMDBGTjhh?=
 =?utf-8?B?YXJnd0U5SHg1c21XRlNHTW9aKytSTUJqbjFzbDJQdDVOQTVKM29IR3hrSldx?=
 =?utf-8?B?Q1dwM2VVRUdsWmlUSU1XWjBJTFQvaURVV1BFUjVzUXRaRTEvZUEwTkdNUzQ3?=
 =?utf-8?B?eDUyY0pyTi9jemlWZWw0M3N6czBnazNReVhKaW01NG13T1FTcmV2cVhYN1Fu?=
 =?utf-8?B?SHJaMTZhWjFvUUpOdld4VWc2ajJPWEpTcis3UDRHSEpyYkdCV1gvMm04dGhx?=
 =?utf-8?B?QjdjT3o1SE9US2lJUVF4NXhnMEw4aDJwSVc2Y0ViWkV3RDlIeno4THpHc1J0?=
 =?utf-8?B?V1JNZndJSThIRDU2ZmUzQ2txTjBwMHJIQ1JqM3ZNcWhsaHMzZWo5L0NqNW42?=
 =?utf-8?B?OFpNckZNS1dQWm01eTMvanppZHRDZVppWEhwdUJ1blRvWGd4dEJaaEhOQWtx?=
 =?utf-8?B?bzNsRURsVDBKZGNyU0Y4ek9GelpMaEJZNnR0bktiR1FUMjYybUZqalpXalR5?=
 =?utf-8?B?V1BqY3ZtMzJEb2lxS2tuUzlTenFuK1hIbG5xcWVFaEV5QUJibVR4Y1dyQ053?=
 =?utf-8?Q?1Yu9Y9uU7ehzbSMZW6ACaO8Vg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81C15BE197D17445B429A9219F879C69@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796f4cc6-b88f-4e03-b0a8-08dd31a204c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 18:10:09.0195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82RpO6gFGpcE4TDhj7kXAE5HwMkCPSfaw0tu9TyBIjp+eJ2FlXJAb3FkhzKuQot/6EUyynyFRxgG5SSxXLI24Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8978
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 18:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209664

T24gMTAgSmFuIDIwMjUsIGF0IDE3OjUyLCBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFp
bC5jb20+IHdyb3RlOg0KPiANCj4gVG9vIGxhdGUgdG8gZWFzaWx5IGlnbm9yZSBhcyBpdCBzZWVt
cyBhbHJlYWR5IGluIG1hc3RlciwgZS5nLjoNCj4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9y
Zy9vcGVuZW1iZWRkZWQtY29yZS9jb21taXQvP2lkPTVlMTRhMWIyNmNjNzdiMzVjM2UzNjg2OTAy
MWFmYWU5NDU1YmIxYTgNCj4gb3IgZG8geW91IG1lYW4gc29tZSBvdGhlciBjaGFuZ2VzPw0KDQpF
ZWsuDQoNClRoZXnigJlyZSBub3QgaW4gcG9reS9tYXN0ZXIgc28gSSB3b25kZXIgaWYgUlAgaGFz
IGZhaWxlZCB0byBzeW5jIHBva3ksIG9yIHRoZSBwdXNoIHRvIG9lIHdhcyBhY2NpZGVudGFsLg0K
DQpJIGRpZCBqdXN0IHNlbmQgYSB2MiB3aGljaCBhcHBlYXJzIHRvIGJlaGF2ZSBpbiBteSB0ZXN0
aW5nIHNvIGlmIHRoYXQgcGFzc2VzIHRoZSBBQiB0aGVuIHdlIGNhbiBmaXggZmFpcmx5IHF1aWNr
bHkuDQoNClJvc3M=

