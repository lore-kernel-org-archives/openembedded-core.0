Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855B4FF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 16:51:14 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2134.1777395065522370580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 09:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PWhkjRQw;
 spf=pass (domain: siemens.com, ip: 52.101.83.27, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAnsCVB1kVHQDg6hxY8svJXIKJcnWvdMSiB9BbAwafPMlnMKPvXv+wWk4dRlG72xSr1iGkFqeCCKLNafpnzf12sDj8w2OZdLmkccs5n//CE853M5bGH2cQLfIGkxxlwhU50vbQutLAwf1SHV4W04r59UdJ7yz2lNVyY6n4XrCESitXC0b+deI0qpw4AfjCB6N1Yl/MLsGVonVI0Nvmxu3AiUjgoqNrJwOq02SnHF6sGYnicXaA0T4gSB4Pa5z3Qpe/xv6ZY++1mC4asoUCpcZv7cxGBO+GNOYLce90axo89a00HFqrfTu+hs2NTJC/U44BqecYxojx1M8m+VMOtuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTlv3qAYm78wYtimjDWLCfdaqPXX7iI2cSK9V/xQ8fk=;
 b=GryMc7DqXYXas493FYYXjNaFq6LiXxjTreqT22xsWnNDWc+5Lfqso/dXBOvq/pAQwqKqtt3i0ZqM2Hg3Tgjay4Bl+DOTgWcfFAoTvRgEdNFVMcTjnjIWMXzR55rYX8g71eqZQgXmDNAZnw5WaKWUc+zqz3BfPaMXi29TpDBMCdwmZJo5M2bd8nJ12AZtnMO+nXyvLtW4lru5tf4HX/+eaTMej0DaOXqngwwRQc5zPFXaGgCRZTd9U/kHFMG1yvwgdo4SWJXzgNRimsQZsKEtrpDx+0ObEqtct7Z57Aq99HN86hs1L2a//uFAEezqMhVZb9KfD6edevFnZU4nfyxkpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTlv3qAYm78wYtimjDWLCfdaqPXX7iI2cSK9V/xQ8fk=;
 b=PWhkjRQwBoXXFi8A4WBx2+Mc13RxYAFhTSfDii1bICoExLXkSkvgKpK5FSMQd1NuinzCVaSWt56r8WhKsFnpOqnAhC1Q46dtN9AojyP/fxp9ErCZ9mlQWWJUztJlp3Vu3fM+gRWKQ1KpL4nEP73lMz3OQuUwXo2VFe2obVUBKbGIfDCtB1Q3jMkECtqW9Y+LgygkWrD2sZOkJjE2wvrAgjuKzyV1kDmKsM1ZCydSHg8EjHpjB8OkzlHW7b9HLfGaKw4tB5NgQAL1J2qSSUxUVdYknBB2WIUl3AREy9DF7AyfoJnSsy5KSl/IYUHqRvo+X5ClBBx6pJAOtnHL/bLsMg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8608.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 16:51:01 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.023; Tue, 28 Apr 2026
 16:51:01 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-64517
Thread-Topic: [PATCH 1/6] sudo: set status of CVE-2025-64170 and
 CVE-2025-64517
Thread-Index: AQHc1a2c4nfU2PoDb0Gu4igJzr1G07XxtrJggADIdgCAAjL5kA==
Date: Tue, 28 Apr 2026 16:51:01 +0000
Message-ID: 
 <AS1PR10MB569741551B057DB782B91C58FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260426185025.13217-1-peter.marko@siemens.com>
 <AS1PR10MB56977CF6AB8F681734EAD75DFD292@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <RRV3rhtPRj-XxHaMgbEl5A@bootlin.com>
In-Reply-To: <RRV3rhtPRj-XxHaMgbEl5A@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2a03ba61-d39f-479d-af02-b57e85f94c16;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-28T16:47:47Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8608:EE_
x-ms-office365-filtering-correlation-id: 389d3484-9d28-4a86-31c7-08dea5465435
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|56012099003|22082099003|55112099003;
x-microsoft-antispam-message-info: 
 IOGl5eUfkiydYCaufTU+rrJ7ysWPTUpn5236P+1rUpkUDfzMeSebxd8f64crVyPeqfImRyYoZH3G66ERfcX6kbtDIOQG+Ve7i3mGTyA5Ftba2e9jX5v1Q94LPlvinrVyZWGCk0JJx4/5U7jUq1/Kaw3WkkR6+iI3JZG0BccfxtULc1oAZOB/U8NlAzgrhmHRW+he6g7VaB1DphAmSk3ecQ886ieei5nN0WAAv/RlbG7DKeKPJgBa4v2yDMcMW/zqOObva3hZgW4K6FiB/heTw0ncZqLkeLRIqN8v2rFIeXLCTpcV7WCQcBqdE6GyE0u6Z8xvqKznTUk7cEabK5xMyyC+TAWhaVAM8lvWrXrNyN4Rdhy9mQxcoGYEhHs+aeoYBxa164JoCdr92qUO5BOUgAkPYWIvGwNqzp2PfQnwO6OrZsvtm6KCzzyozEgCRORg9k44AqQOlLfogAgiWFaboaPvOY1LE+PMUHcvFpjdwrmQ8knyon3Wh9RoJPNNlJuElpfKp5kuwtdt/90jVBsvYt0z7mugt1Q2wUH+U887oRf57aV6LeEaChDCsXYg5xdyTxTLQU67tfMHSInAz05OmUsM4RxshwOXV42IHlGFygWtOxJJ2s87PWzxrcTlHKr6HejKqG/MLHIcVw/x4sFenD3VvYxlYYWFzuOJnWKE0iv7Du2Bue/sd7+4w0y42X7gDBkSyl9LFhVPeW68pksABm3c41WXPWN/LQc4IpGyEMY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmJQa0E3ZXJ5dmcrdkpRUkw5bitXdDcyLzU0NzBCT1dTV1NwV1o2YmFTL0lZ?=
 =?utf-8?B?QzU5ZWVPbnlsSThhS1FJZ2JSYnpxc0N1VTNVMGtxZHVXOTFuQlBTTkVBQVFW?=
 =?utf-8?B?aUF5TXcxKzJtSmFPRlV5UXpSVlRibUlrVUQ3S081TzJmM24rdzJlc28wWncw?=
 =?utf-8?B?T0haU2VianNBcHVPVVhZczZRbXYwbWVCVVBQdnp3TWc2bzMwaGM0Rm96YVRE?=
 =?utf-8?B?elRoOWdsTDRKci9TQzQ5TjY0aFhpbXh1eWlSMnRuaGdvOWJ1YUtZalBHMFlk?=
 =?utf-8?B?M1g1Z1ZGaTJJZWVDZXpUUzBrMEJuUkZHVVM3THBmMjJtZHVTdWt0UlVYa2xn?=
 =?utf-8?B?aVlpWS82Mi8wSm9hWVdnSC95QjQ5UElmVEpXM1Ztd1BvT2pDcWI0OE1tdVl1?=
 =?utf-8?B?R1liWjJCQndldnVVU3QxNDFIWjdrWjNkUmd6YWoxWmttd3F5K2dsOU9TQzBx?=
 =?utf-8?B?SGR1WmZJSnJYbXAyVExWWGFPN0N1Y09UYnM2eHdhUUFwZGQ0WTdHdk41Q2dG?=
 =?utf-8?B?aXhKTjVzeUpDS1luMWlWSnplWC9pcDRQNWk5QlBGMFBzQk5kY2NCUkp3THV3?=
 =?utf-8?B?RktUR2J6YjJGM3hmanBTWDB2WnNJVndTRlI4cEJtZEVPbmsraGFScUoweXgz?=
 =?utf-8?B?QUhCcHBEendHZXdxY1ArWHFsUldhNGlGaVk5OWVSU2xkbGhGRXRXbDliWndF?=
 =?utf-8?B?U2h5SUI5MlBZUnBqQ1B2UlJMa1JYMmxlWGN0b0hid085eE1TSk1UYzBCVDRk?=
 =?utf-8?B?STdrUXJrdkVjeFo1SHJQaXFKbW1jVUh4MEI5TTRjYkdQOWtLc0o2WU1FalYz?=
 =?utf-8?B?S2dPbWFlc0dDQlpUa1ZyRFVWYm1RSEZYVHh1bjQzRTlQS2JwMVg5b3EyQUoy?=
 =?utf-8?B?NGFnenhac2t4cFIxUHM3dk9nZ2xGTll6ck95djdzbEZFNzBiZVlJSmRGS0h2?=
 =?utf-8?B?c21lWVpyRlZld0VDMDlSZ2dST1gxT0pHTzZZMmRIOHVxb2VoQ3FiMCsrK0lk?=
 =?utf-8?B?Tm9WbVcyNjh5TmlJcjNJbjZwL0FxY2xnWEVUNDMvelRPcFcxNEhpaDRTd3BM?=
 =?utf-8?B?U3NVem5JWlRRZThhOW5qMUdqcHB4eU1iRGwxRVVuQUJFR2ZWSllwbU41RWJ2?=
 =?utf-8?B?K3BQWUxNSkRDcmp6Ujd2R3JPbHNUb21CaDhqRXBTUXRPdW9BdUJKcnRQTnVS?=
 =?utf-8?B?YkkvYjUySXZDck91L25zRTBaTHZXQ09kbnRncDN1bVJFQWZGNWxSb0YwK3ZV?=
 =?utf-8?B?dlpsbnpDY210ZmNuYUpMbU5vdVJVUG8vV3lpRW9WSWtNZCtMdEJjU04vcWQ5?=
 =?utf-8?B?Z0Q1K0llMjNvV0hGSWJrZUVPTkRwSnRlZ2x4aDJhTzdJMjV6VlkxRzN3YTUr?=
 =?utf-8?B?K3pPeTAyc0VKWkxHRHhDMVQ5M3hsOGtZSXllZFhtKy8zNU5kbmxCb1o5cW1h?=
 =?utf-8?B?SEIvTE52WUdTREo3Z3llR1NIazRhUlYxa0ZHRmN1MVNEMzhTU1BnYnM2RFR3?=
 =?utf-8?B?L2REV2UrSHhjSmxLTGhsOW0rNXlkbWMwODcrWnhFR2lQK2Y5Z0hlMHFpcDhh?=
 =?utf-8?B?T2RxbHl4MC9KcEZabE10aXZFcWNjblJpaldNUHVRcjd2YVQwaytUSFFzT0hH?=
 =?utf-8?B?RkNnM29IaXVYdGVNWjVJd1lMUjNYT2JWQkxmWjlaTzRZZmdFS0syNTJISzlx?=
 =?utf-8?B?ZXdwNDhpZi9yVFBZdXdFZ3JQRW1WSFZ1L2JmOGgrMGlqMXF4T0k1QndhaC9k?=
 =?utf-8?B?RjErcmJrZjFsbW1wUlI3dVdHeFlXRDhzOHo4bzBQQ0p5QkpRVXgyNjFqZG05?=
 =?utf-8?B?VHkwU3JrOTBZUXlHa0hJRldQblVMeW55cCs5aW1lck1wR3NJYS9QcjZIYis2?=
 =?utf-8?B?d3lWUkE4M3lvNFBDenQ3NW1keEpnTVAvYWhWeWRiRkwxZEpsZk93NUVHY1JS?=
 =?utf-8?B?UHg5RjErUnlvZG1tdlQ1S0FadUdjak50LzJDbE1QNkFDeTlRWEZoTm5SNXlr?=
 =?utf-8?B?ckhFL0xhRkd4dUpsUEZiTExVL3RncDFCVkdXSGpSR0FZY25rc2cyaUFDUUVR?=
 =?utf-8?B?MnZjclhFUjZucGxyWDAyekxrMHlBQm9YSERXdktqckk1QlQ4QkpXajhBZFhB?=
 =?utf-8?B?Smhqc05OK3VUQU5aVzFRaXFrYnFMektLd2kydHErcjVidGFGcmdpN0tUN2xx?=
 =?utf-8?B?eU84WlZ2NTlMRDNneE05d0VrN3N6TzhlMW1xMGpKQnpaQkVhVXJuOWJ1V3ZQ?=
 =?utf-8?B?d0RyUWlMczM4WStmcTlwN0JXYXNhUkFDTFk0eStrZHBVOWxkL0YzdWJId0s1?=
 =?utf-8?B?MEJFR2ZVa0E5akJPRFppUTJnU0FzWTNiajNGdUJXd1FZcSt4M3BIQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 389d3484-9d28-4a86-31c7-08dea5465435
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 16:51:01.2120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: onOC7U5Erfhj5wow6ml9D8kiQFqgLKfTN7QGG8SK0aXE1jUsxb+I5Voo42G7d9bzTttD3feZkagyoeIg+wXnZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 16:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236069

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gUm9iaW4g
PGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDI3LCAy
MDI2IDk6MTMgQU0NCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIu
TWFya29Ac2llbWVucy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS82XSBzdWRvOiBzZXQgc3RhdHVzIG9m
IENWRS0yMDI1LTY0MTcwIGFuZCBDVkUtMjAyNS02NDUxNw0KPiANCj4gT24gU3VuZGF5LCBBcHJp
bCAyNiwgMjAyNiBhdCA5OjE34oCvUE0sIE1hcmtvLCBQZXRlciB3cm90ZToNCj4gPg0KPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IE1hcmtvLCBQZXRlciAoRlQg
RCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQo+ID4gPiBTZW50OiBTdW5k
YXksIEFwcmlsIDI2LCAyMDI2IDg6NTAgUE0NCj4gPiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBDYzogTWFya28sIFBldGVyIChGVCBEIEVVIFNL
IEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCAx
LzZdIHN1ZG86IHNldCBzdGF0dXMgb2YgQ1ZFLTIwMjUtNjQxNzAgYW5kIENWRS0yMDI1LTY0NTE3
DQo+ID4gPg0KPiA+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29t
Pg0KPiA+ID4NCj4gPiA+IFRoZXNlIENWRXMgYXJlIGZvciBzdWRvLXJzLCBub3Qgc3Vkby4NCj4g
PiA+IEl0IGNhbiBiZSBlYXNpbHkgZGVkdWN0ZWQgZnJvbSBmaXJzdCB3b3JkIGluIE5WRCBkZXNj
cmlwb3Rpb24uDQo+ID4gPiBBbHNvIGN2ZWxpc3RWNSBwcm9kdWN0IGlzICJzdWRvLXJlIi4NCj4g
PiA+DQo+ID4gPiBJdCBsb29rcyBsaW5lIHRoYXQgbmV3IHZlcnNpb24gb2Ygc2JvbS1jdmUtY2hl
Y2sgbWF0Y2hlcyBwcm9kdWN0IHdpdGgNCj4gPiA+IHN0YXJ0c1dpdGggaW5zdGVhZCBvZiBlcXVh
bHM/DQo+ID4NCj4gPiBCZW5qYW1pbiwgYW55IGlkZWEgYWJvdXQgdGhpcyB0b3BpYz8NCj4gDQo+
IFllcywgc2FkbHkgdGhlIENQRSBvZiBzdWRvLXJzIGlzIHRyaWZlY3RhdGVjaDpzdWRvLg0KPiBX
aHkgdGhpcyBpcyB0aGUgb2ZmaWNpYWwgQ1BFIG9mIHN1ZG8tcnMsIEkgZG9uJ3Qga25vdy4uLg0K
PiANCj4gV2hhdCBpdCBpcyBoYXBwZW5pbmc6DQo+ICAtIEZyb20gaHR0cHM6Ly9jdmVhd2cubWl0
cmUub3JnL2FwaS9jdmUvQ1ZFLTIwMjUtNjQxNzANCj4gICAgd2UgZXh0cmFjdCB2ZW5kb3IgYW5k
IHByb2R1Y3QgbmFtZSwgdGhlbiB3ZSBsb29rIHRoZSBwcm9kdWN0cyBkYXRhYmFzZQ0KPiAgICB3
aGljaCBpcyBidWlsdCBpbiBzYm9tLWN2ZS1jaGVjay4NCj4gIC0gVGhlIHJldHVybmVkIENQRSBh
cmUgIm1lbW9yeXNhZmV0eTpzdWRvIiwgInRyaWZlY3RhdGVjaDpzdWRvIg0KPiAgLSBUaGVuIHdl
IGNoZWNrIGlmIHRoZSBDUEUgaW4gdGhlIFNCT00gbWF0Y2hlcyB3aXRoIHRoZXNlIENQRS4NCj4g
ICAgQ3VycmVudGx5IHN1ZG8gaXMgZGVjbGFyZWQgYXM6ICo6c3Vkbywgd2hpY2ggbWF0Y2hlcyB0
cmlmZWN0YXRlY2g6c3Vkby4NCg0KSGVsbG8gQmVuamFtaW4sDQoNCkkgd2lsbCBzZW50IENWRV9Q
Uk9EVUNUIHVwZGF0ZSB0byBnZXQgcmlkIG9mIHNvbWUgb2xkZXIgc3Vkby1ycyBDVkUuDQoNCkhv
d2V2ZXIgZm9yIHRoZXNlIHR3byBDVkVzLCBJIGNhbiBzdGlsbCBvbmx5IHNlZSAic3Vkby1ycyIg
YXMgcHJvZHVjdCwgbm90ICJzdWRvIiwgYWxzbyB2aWEgbGluayB5b3UgaGF2ZSBwcm92aWRlZCBm
cm9tIGN2ZWF3Zy5vcmcvYXBpLg0KDQpQZXRlcg0KDQo+IA0KPiBUaGUgZWFzeSBmaXggaXMgdG8g
ZGVjbGFyZSB0aGUgcHJvcGVyIENQRSBvZiBzdWRvIHVzaW5nIENWRV9QUk9EVUNULA0KPiB3aGlj
aCBzaG91bGQgYmUgc2V0IHRvICJzdWRvX3Byb2plY3Q6c3VkbyIuDQo+IA0KPiBUaGlzIGJlaGF2
aW9yIGlzIGRvY3VtZW50ZWQgaGVyZToNCj4gaHR0cHM6Ly9zYm9tLWN2ZS1jaGVjay5yZWFkdGhl
ZG9jcy5pby9lbi9sYXRlc3QvZGVzaWduLmh0bWwjZmluZC1hcHBsaWNhYmxlLWN2ZQ0KPiANCj4g
Pg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0Bz
aWVtZW5zLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRv
L3N1ZG9fMS45LjE3cDIuYmIgfCAzICsrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3N1ZG8vc3Vkb18xLjkuMTdwMi5iYiBiL21ldGEvcmVjaXBlcy0NCj4gPiA+IGV4dGVuZGVkL3N1
ZG8vc3Vkb18xLjkuMTdwMi5iYg0KPiA+ID4gaW5kZXggZDZlZTg4MWY4Yy4uMTJmODFjNWQ0YSAx
MDA2NDQNCj4gPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE3
cDIuYmINCj4gPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE3
cDIuYmINCj4gPiA+IEBAIC02MCwzICs2MCw2IEBAIFJERVBFTkRTOiR7UE59ICs9ICIke1NVRE9f
UEFDS0FHRVN9Ig0KPiA+ID4NCj4gPiA+ICBGSUxFUzoke1BOfS1zdWRvID0gIiR7YmluZGlyfS9z
dWRvICR7YmluZGlyfS9zdWRvZWRpdCINCj4gPiA+ICBGSUxFUzoke1BOfS1saWIgPSAiJHtsb2Nh
bHN0YXRlZGlyfSAke2xpYmV4ZWNkaXJ9ICR7c3lzY29uZmRpcn0gJHtsaWJkaXJ9DQo+ID4gPiAk
e25vbmFyY2hfbGliZGlyfSINCj4gPiA+ICsNCj4gPiA+ICtDVkVfU1RBVFVTW0NWRS0yMDI1LTY0
MTcwXSA9ICJjcGUtaW5jb3JyZWN0OiB0aGlzIENWRSBpcyBmb3Igc3Vkby1ycyINCj4gPiA+ICtD
VkVfU1RBVFVTW0NWRS0yMDI1LTY0NTE3XSA9ICJjcGUtaW5jb3JyZWN0OiB0aGlzIENWRSBpcyBm
b3Igc3Vkby1ycyINCj4gPg0KPiANCj4gDQo+IC0tDQo+IEJlbmphbWluIFJvYmluLCBCb290bGlu
DQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290
bGluLmNvbQ0KPiANCj4gDQoNCg==

