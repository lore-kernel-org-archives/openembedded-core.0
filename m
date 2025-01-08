Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785C1E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 12:24:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web11.18204.1736339031825054386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 04:23:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DPHN6b5t;
 spf=pass (domain: arm.com, ip: 40.107.22.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7ldhrfhj3MxafZWFT2mR7sSP5uJrVGwS8h1GeuSTSutn/gAvVWfezbH5Sas9t3CYfHzHxG1MewtQTBCVm0GE4yryhl7OBo2/CqWqphE/51y45/TIBovpgEzTi4uAVL4GWiuB91r6ajsw6KK5yVJeELFN3SrxtE6oV6FPUP4bRfphlqLkzbMiQewcV9V9VCn6TmXoMVZERn539Ye/ufk5d561e8Ne4acCa+wByZ24+XyfHRy+kYIphbZWaWpd9AUao3PBvcKXk4pnbyyPxNabe3Qfj8nVR3lSO8Lyuq/2lt9pvUjXMv3FOtB6K8kkujlkzSe0n7lzY+GTvan1J62jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45PFn/Y6yDzNqSF1u7Tw1+Qb7kdmHs84L7H3m+8+neI=;
 b=q97WlJyK3iqLH30Y2GLc8dYWsYMr+h2WiYyc2IVTS2N9HlP6sd9gWpLDM8wws1c/DuRSDF1H4WKXx3jdc1q1OsC3QSer6spQbkXXSnvdvGJk1Yfv5HgNI7LnJMxoWvdZ/odr5ZByQ8sy3RPo3sQC1QWfhrLlOQgfH20NGT55kiF8zZ8cJ5OsywOkLxVVmuUCy5qfEgUiBHNe2gyJXpNZNBHdIIV5F2+wPo+7o9GCh6ZAKqvA+eKc3AUIESRP3fn1yfhpAXgaJAPLItz77NBkXDxNtWCIagaJ4LdOVvyV6QIIxpFPg0rpGxsafxKz75SnrLzNFr1mQyYM8uUOCS5G9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45PFn/Y6yDzNqSF1u7Tw1+Qb7kdmHs84L7H3m+8+neI=;
 b=DPHN6b5te4OATWEmyNfSt8JlE+oFWs2IP0xpsq+nFKJbl9E7B4R2wXmk/5f4hWt/MnVU725mW0EvKzGRT62iKST6m/zJ++4MdAiouR0msB7k27dIcxxhOP4n/a4fxC1htDtNv3Pktfc2oxwG+R4/tRWBZYdP2pBDN2X4hvwESn0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7339.eurprd08.prod.outlook.com (2603:10a6:20b:446::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 12:23:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 12:23:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] oe-pkgdata-util: avoid glibc-locale being mapped
 out by glibc packages
Thread-Topic: [OE-core][PATCH] oe-pkgdata-util: avoid glibc-locale being
 mapped out by glibc packages
Thread-Index: AQHbUfe5B69jY5vRWkOPRwGo3Z75u7MM7FoA
Date: Wed, 8 Jan 2025 12:23:48 +0000
Message-ID: <BF492DEF-AC1E-4E49-AAE7-3C3D7E9E142F@arm.com>
References: <20241219092319.3800319-1-Qi.Chen@windriver.com>
In-Reply-To: <20241219092319.3800319-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AS8PR08MB7339:EE_
x-ms-office365-filtering-correlation-id: b24b54be-a427-4ad1-145a-08dd2fdf4df8
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?LzhST1BrS2RXanh2SThMdStCZUY2L0ppVGRxc2NRNHlMVmtRNXR1NVorenkx?=
 =?utf-8?B?N0RJdmFtZGJ0L2tzcnRNZndlUGQ5ZnRjdUQxclVPaGpDd2dLdkp1anl0NXN4?=
 =?utf-8?B?aUw1UktSbWF3Ti85UEZmaFhMaU5iK1hnMmgzakRFTkhmWWgxZ1ovY0VkS1Q0?=
 =?utf-8?B?MHJhUEIweTNRMUlYQUtuTTdZMjlLc0R6MjhnZzdBQnV0S3c1c1FLdkI0eUFj?=
 =?utf-8?B?OUIvVFRaTWRyQVA4bkVQOXFibk8vVWJuZkFrc1VqY3JtZlJwemxhVFhlaXFo?=
 =?utf-8?B?Q2xFUDRrbWYxUUU5WlpwY0o2cTBTNVRyTVdEUXg2OVFqbUZvUG5seGRYOHJk?=
 =?utf-8?B?L0RCSEtxeGtvTDFyVGkrdmFxQU5jVGdiVlE1OStVaHMrYm93TUI3NUpRTDBP?=
 =?utf-8?B?ZVd6MHM5bVQ0ak9aWlh6MkUvdWhWOGpmTDMrOVlQSzFXNXUwN0xRVnBodHhM?=
 =?utf-8?B?Yy9FZWlxdEg4UEJTd2ZjZTJFMWxHa3VmdU55WFRBdkJhSDdRNmorR2tuT2xt?=
 =?utf-8?B?WHJ3RTNPNldjZmFNczdNbVRwS2orekhqb0xxSkZuNXpVSHRmZ3hrckJhSEJP?=
 =?utf-8?B?M2h5L2drYXRPV0hORmx2MHpnNVJxZEtZejhkVlVicWR2RTRiak1nRTdGcjA4?=
 =?utf-8?B?bjlCejFmWVh1M0JmTHRWOXZLdXJmUmI3OXBTdlBDc0sweVVZWTVUeEh3dDh2?=
 =?utf-8?B?OHFKdFhpU1gvSE1aUWE4NTI3ZVNoMGJqWUJFN2cxNTJhTzF2TlJ0WUMvS0xL?=
 =?utf-8?B?TEhoSlR5OHpRSGJjeG9lUjd0OWJDY1owN2tZZnlpYis1WlF5cS9CQ1MvRXhq?=
 =?utf-8?B?bzRNWjRDakR6Zm45ZkoyeVNaNnZ2cnFuSmF2SVAwVEQxNXk4MVVmemljUnJP?=
 =?utf-8?B?aHBmNTd2S0MzVjZjMHdpcmYyZVZOMVFGVERXQ1RDV0R3S1gvTVREQ0UwK1Zo?=
 =?utf-8?B?MlNXMytOdUxTU3FTSURTQ0JndFMyNEtjcGt6ZlhOUWZSUExvQmtpM0hSWXpZ?=
 =?utf-8?B?ejQxSi94bXhVU0Z1czVETkZ4c2RYK2NRbEM4NnB2L2h2YVFpeXp0QVVwTGhH?=
 =?utf-8?B?SjhIMmlXdkwrRlE3cnEzZU1nYVVtbWprME5VWFpGOGJnTENxZzhkSzlQWUhk?=
 =?utf-8?B?UWo2ZHZDZlhQUUFPTlJPcWJiNXB3YWxHQVBvZFEvak1NR0tTeXNIZ25Hemx0?=
 =?utf-8?B?NkVpbnVNWWlNMlZGM0xRL1lXTFl6SHdVOHJWQTVTbWxSRnNxbHN4ajBWM3l2?=
 =?utf-8?B?azhtUXNvT0VKakJ1ZWh1MUN1Y3RJRDJqYlJxbTBzZTExaFRpdEhnc0gyUE8r?=
 =?utf-8?B?eUhKY3NxNW1lMWkrc0RhemtpM1N5c3RtSmxKOEpkdDdtUktNT014bXZCSEhL?=
 =?utf-8?B?KzdSWndSSmhxcWZOUzNKTU95d3B5Z0pBSUtFSjNUcHJaRTZ0dk1TeFVYR0dE?=
 =?utf-8?B?andmWGxMbCs2Qy92Vkc2cHAwdFhNZGhGSDVGZzJHY0NBdHh5cStVUjdwTlF6?=
 =?utf-8?B?YkxDUndSZk9TTTVBeFBRNDRJV0IveWdpbmo0ZVZMdklEdGhyeHdtNkkreHFa?=
 =?utf-8?B?ZE1HRWNId0xjeGFEeHh2Y1p2QkNhOFhTeXFyZUtDNEswT29pRVRMbGd1TWli?=
 =?utf-8?B?YlZrMU1vWGJ4Vm91bEJkL1JUOFNTRE5lUFYvVDd0QTRhTDlmYXovZk1MY2hM?=
 =?utf-8?B?a0kyQU90bklUYzFrODZCbWZFOXJnMmVUcnVVa3lFNXI1SDc1WVQvdGZPL1JQ?=
 =?utf-8?B?amQ0ZTlhcENvSWJ4UWRnRmpBek0ybDhPZXVDNWx2N0lXUjhYa0pOMEh3RlJi?=
 =?utf-8?B?TUF1akJDallUZlRubzJwYnpyTStyVDZLSURkMlFSQllzZ2sybWk3Ly9ZRmRD?=
 =?utf-8?B?SHNidjljVlFsemZpdThOT1R1WFdlN2JZUDBlTXJqU21KN0IzWHJhNXBUWng2?=
 =?utf-8?Q?dPr9+NiWcKMsLu0YEMdMuDl+4DKlu/Dg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QVBCTzI3NlhIcWdkN2xOb3RrVHk5TVc0Z29ISENUazN5TG9zc0dRY2F1a3N3?=
 =?utf-8?B?Z1hCSm5KcmtvZ1IzaWx2RDN6OEZDOUVtU1dvMmhrNytBUlNTbEdZNVg2WmVW?=
 =?utf-8?B?M2J5UkJsL0paaU5XQVplb0JCWFQxWjBDWUUzSC9Jam9zVDR2K2ptUGFHTVdX?=
 =?utf-8?B?ems0TmlHVytLa2RFY3J0eWFYTWtIU0JFcEdPNG1qUGRoa1lVK3ROSFdEejdG?=
 =?utf-8?B?ZktiMnpva3hzc2lhRkpsTXVlbFNwekN2TkM0Q21KalNKK3k3Tmk0VzAxdXJt?=
 =?utf-8?B?TUQ5UjhLMTBoTUduTXlnSlVocUFqRUw0U1JiS1hTanFUeWtLVHBsSXN1aTJJ?=
 =?utf-8?B?VWVMRnVLSHQ0NFNWUmYzVHJyRzNHbFMrZVNhYURHMHgrVmN0dUplWjJXSjJN?=
 =?utf-8?B?VnliVis4dkJ1WEIzZFZyejRXL21pd04zVXduTEFxbkFwUkpCT0lIYVN5N1dk?=
 =?utf-8?B?bjhZWHZ2YTQxZVE4QWlTZmk0UFlnNlJmeENBWkJ5TEorc0toZ3p0Qm4wZTI5?=
 =?utf-8?B?SGtWM0pycGFva21qVEZZOEZOaW8zU2NNdTZ1cUhpM0I0bU9iN09KOHhrNDhY?=
 =?utf-8?B?ckJtTUcxWjU3K1hYdTI2Z1lYSmR0d0NSVThEWE5SRFdkclFuOFBrV1Noclg2?=
 =?utf-8?B?TzFEeWgzZ3JXZnN6bkJMeU1iS0YrT1BaV2xYZTM2cjBleU04dXVTTFFyK2F4?=
 =?utf-8?B?Ty9HNi9pS0o2TDFBMlJEbmd1aGFFak9IRHRxRlZtYXVWQkJsSWc0ZVZ1ZWpZ?=
 =?utf-8?B?QlRmOWV0UDcwNGtmeWYrMW00a2piZTN4T1VCSGR0MjExVWlpZitZdHpsRnpE?=
 =?utf-8?B?VGRLY1FLUWZxUzJjYmRTUjdZK1ExRWNrWWdYUGlXam1sTXRRYUt0MDh4VFN1?=
 =?utf-8?B?cDdEVkVhcDgydTgrRGkrQWVlMDVmUEpub2R5U2lJQVhSNGpScW9vNFJndGcr?=
 =?utf-8?B?UEZrdUZaNTlsWGljOW5HTXB6R1o5UG15Y1I2bDliQVVwU0crRUVGeG5yYi9n?=
 =?utf-8?B?YVdZRTFHM1U3cmhWM09kZUdFdnZQd2hpRDZqZmppL3ZFeGFmQm9MdXpFT0M5?=
 =?utf-8?B?OElSTHhmYTVxZmJWVXRmK0tkQ2wxeHQ1Y2lETlUyVWhFRFhwb3JZMmFsU3Jv?=
 =?utf-8?B?cS8xN1RDNVpuMHFja2FOcy8wS2tCRnhiUjVBRDZmbTdvUmhkRENwd0U1Uk5K?=
 =?utf-8?B?elo3bnpXU1FLS1NxWEt3Z0lFdjF5aWdscEZELzdFK25jN0M5bElScHNXZ0Qr?=
 =?utf-8?B?eTVWU0VKR0dDdVdVVGV1S1lrUU5EdlhJK25PbG5JaHBuaFpsWG9Jbk1wUG0w?=
 =?utf-8?B?VEEzSlFWWGUxWUZ6Ri9vY05xZkdnT3c0WVI0L3J2dXpSZWZtSW1aYkF0bVdj?=
 =?utf-8?B?cG4rZ3BrQlNxYUQzMFpJRG1xS01uc1lZR3YzaXNLcHlmcHlwaDcrQmRNdmNF?=
 =?utf-8?B?RmhKcTBFa3FUOTlTekxiU01jY3V0ZCt6bTIyQlBJaEV0QTZRVWVNK2ptdkdI?=
 =?utf-8?B?WjlUSUZVRmRNcWlyclBHazVVNHV3bWkwZnBHT0czTDRjeDYyYlNDdnZZN2l3?=
 =?utf-8?B?Zis3ZERwSWNhUnZ1OENUMkNhdVRTenp3RUFveWM0SExXWlFXRllpaFVoM2RN?=
 =?utf-8?B?TUNkZitMR0IxUnVEb3F1MWZpVnZUNTMxUmJBYTBOaUpaRWpmZ0hnRXdUYnhl?=
 =?utf-8?B?M2xPRmZwT3RrK00vbzVVQ25oSHRSeDdML1JvWWtqNlJ3bnJsNHRpVVpkNGJx?=
 =?utf-8?B?YzFSMlZmaGpKY296cFUzS0d1aXgrL0lYblBLeTd0N3BRSnhTaXRPZEUrSmcy?=
 =?utf-8?B?Nk16NWRaWWZxbGZDQnlheEE1NWdaNE1jNy9XWFoyWUlYWUhGcnhiVVBBMVdv?=
 =?utf-8?B?VTlodG51K3JzYXFYcFFXVFh4RHhXb2hHM2plNVJidVBENnlTdEs5V05yb2I2?=
 =?utf-8?B?RHdGK3BFTitjcU5ReW1WOUM5cXpwQW1JK2lGRkpuRmxOWnczbXdZcEF1dllU?=
 =?utf-8?B?QXNtekdsQzBlZWhOZnIxaDVZc3pxYXJETXVIY2dEckN0dHVuZ0pNT3FiVE1F?=
 =?utf-8?B?TjN3bldCMWRPUVVndTZwdXQrVk8wMDFnYzJWWVQyVGJNMmZ4Y1RPc1lSbTFp?=
 =?utf-8?Q?BE6dkXIONYUHHZN4Ayc93X10N?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FEEF24D97D24540B97421F9DC57C1F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24b54be-a427-4ad1-145a-08dd2fdf4df8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 12:23:48.8272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBz8+w6TdwG8T3eaWGV7rpzndC2sJIQZYuv3FO/ZMTEVNa39hjBeh5f2A6gks/btXPfq5Eyz0+cA03ry6ugyEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7339
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 12:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209555

T24gMTkgRGVjIDIwMjQsIGF0IDA5OjIzLCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IA0KPiBvZS1w
a2dkYXRhLXV0aWwncyBnbG9iIGNvbW1hbmQgd2lsbCBvdXRwdXQgZGlmZmVyZW50IHJlc3VsdHMg
ZGVwZW5kaW5nDQo+IG9uIHdoZXRoZXIgZ2xpYmMtbG9jYWxlIGlzIGJ1aWx0IG9yIG5vdC4gVGhp
cyBpbiB0dXJuIHJlc3VsdHMgaW4gZG9fcm9vdGZzDQo+IGVycm9yIHdoZW4gbXVsdGlsaWIgaXMg
ZW5hYmxlZC4NCg0KVGhlIGdsb2IgY29tbWFuZCBpcyBnZW5lcmljYWxseSB1c2VmdWwgYW5kIG5v
dCBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb2YgdGhlIHJvb3RmcyBnZW5lcmF0aW9uLCBzbyBp
dCBzaG91bGRu4oCZdCBiZSBmaWx0ZXJpbmcgdGhlIGxpc3Qgb2YgcGFja2FnZXMuICBJ4oCZZCBh
YnNvbHV0ZWx5IGV4cGVjdCB0aGUgb3V0cHV0IHRvIGNoYW5nZSBkZXBlbmRpbmcgb24gd2hhdCBw
YWNrYWdlcyB3ZXJlIGJ1aWx0LCBhbmQgaWYgdGhpcyBpcyBicmVha2luZyByb290ZnMgZ2VuZXJh
dGlvbiB0aGVuIHRoZSByb290ZnMgZ2VuZXJhdGlvbiBsb2dpYyBuZWVkcyB0byBoYW5kbGUgdGhp
cyBjYXNlLg0KDQpSb3NzIA==

