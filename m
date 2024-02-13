Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3CAC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 15:23:45 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.58])
 by mx.groups.io with SMTP id smtpd.web10.14002.1707837815777569227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 07:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=YFmg0zYR;
 spf=pass (domain: axis.com, ip: 40.107.6.58, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTSOz7aivV+nSrU2ZSpcfA8GHY7+4V3nvTaWmofUqLr5S+9VfPa9KUyRP6x/r89edLn8X+awaEHpat5n88vYIQrhQ1W5RUaYhV8Ej/Gu51TJKuMtPM8uUuBkOI9Eu61taiKhbMcN+4P7XvFumeQdz/RL1TZ7Q6kiQh6iaC6u6L7KDrHH8+gqDfvEB714UjuKQ6iPs5U3dcJpxtkGh6yeY+gbTs7jLsRPZM66hFBEJrERhNLPT3gOZr7gJzOgj/v4eXiOh6CiyvznBkgzghJHlzvomzElILETOqt+6s31nqpA7l9HzVrEcqYPZYRHEM5t7LtJ9m9ICXLGLZhiAc6jxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uag5+sCX0dXk/M7gzTPNslE+chXJM/YOS/oA2IyJ4TY=;
 b=ma95QE25kykL1sFKkoXLO3MbMg0qpFttfcC/Robp07FDBcPA6HjpEbhXacXproc7p7c4duoIyFd8lrd2007IPQtAA6Q7ktebgpbfXEXBpAjmyStLNQItg5y4jvUQsxfgNFXnEMj15EAnnkN7P8b9Y1FDTv0skLYnx8LAMbH4bWxgwbCmF5EbLzx/yZumdXu2pyB/mwGe9o29IDfcZZEKqTcPKpt0jr+HbzBbj0XR93sUzhf1BQJqOLaxR0jKhoKr+SmNbEZDYv8rAdaGnRyOUAKQ1z4tEWVFkWd7TvRssBPE1wDkFE1CpMJpUqBy9tFmpSl9G6VsbzVT25kmeZO1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uag5+sCX0dXk/M7gzTPNslE+chXJM/YOS/oA2IyJ4TY=;
 b=YFmg0zYR7u78M+G1QaoahoGUSuBkKti9l1wHMDVUumIMysqS7Vu5WbToPfwNJKbeeKORmMNaEbks0yG2RHNRYvEJuhDozlAToU/MfEPrAKVtsyhml6oVj2j9hqYT3KU1LcNA62N8TiPdPtZD+pB3c+7BW4RgZQNmrr+jQFmph8U=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA4PR02MB7038.eurprd02.prod.outlook.com (2603:10a6:102:bc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 15:23:32 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 15:23:32 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Ross Burton
	<Ross.Burton@arm.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
Thread-Topic: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
Thread-Index: AQHaXX4+Ckx7VR50KkaGtkLrINzr67EGl8UAgAGOmwCAAD9WAA==
Date: Tue, 13 Feb 2024 15:23:32 +0000
Message-ID: 
 <DB5PR02MB1021399439F1D4166CDDF6BA4EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
 <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com>
 <6c701a47-f76-e3d0-3ea8-1b44ec7617c0@crashcourse.ca>
In-Reply-To: <6c701a47-f76-e3d0-3ea8-1b44ec7617c0@crashcourse.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB7038:EE_
x-ms-office365-filtering-correlation-id: f3ae1113-281f-4671-8d34-08dc2ca7bd5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xr5despD2YXXCO77CwlefTrtDsniQk6hvt/21B47na99Y1NEsvZNxcGIr6kq3r70fVDMINsAW7MpOjYbMtvYRRd0+Pjd0ZNONn0IjcQWGuw1ScvnNt5tL36QNXNSYfBq3YiWYUZVKUfCLbo7q9rWX46ovzr9Bg9KBfD+di3DGjqjjLa7LF6K3Tvb0QFnWhj3BOFA/TyufC1sHZ025yeBB+GpFeL27Kyjld0D4JwMlrah1jRuqOzoY4IgGZaXAItmFQ+vn+Mz6L+q+EPGJAGGFhlSoiaRmagpN8+06IdVIXL/VMNc4wc3VupTVYTAQVTXkdZmBGUdtlUKP6TkVgDoladS6l0CXtfWmoYyoJC/wJ/0DgBjuKna+VjQ3Ke4tijXiC3w/bCRomlPzBnO/+8X383r8p7IKl8gTv1PiuUT47qrg6Ipv1xUgP7XMQ6dnTThAnjaetbAAoRCDTg5ETcLB0juBvZNKhEO2bMMsnHDHRlCbP1DnULEbFOxjiPOEiCG5ZFRBlCRYl3IcQpviXBwreq2hbjK0z9DQn5W5R2sukk6tEAoMCto5hLogCk3pqux43tEMNOk2KVclRvuLMfYE2KSS1g0v0kqyqIuxCuISIk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(33656002)(122000001)(86362001)(64756008)(66476007)(76116006)(71200400001)(9686003)(66446008)(966005)(6506007)(4326008)(66556008)(8676002)(8936002)(66946007)(53546011)(478600001)(26005)(7696005)(38100700002)(83380400001)(38070700009)(316002)(52536014)(5660300002)(44832011)(110136005)(55016003)(41300700001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OXBBQTN0QjIwTFphN1cvMFBROUQ4Qi94N0tHSnlSOUZaWWZFYWlSLzBxZVR5?=
 =?utf-8?B?OGc4VGtmbDd5T2Y3MjA4VXg5VmVrcVR5S1VTWEp2cFkrUlBwQ0tLUWJFaC9V?=
 =?utf-8?B?R1VpTUdQbXZ3YnFteGJIY05zOW9GVk1sNk45OUx4U2JCcGJjeTFTOW9Ob1N0?=
 =?utf-8?B?SllJZVdLenBjY29pRmZWWjlqVVNQQXpFZTM1VUZUN3oyNlg0K25oT1FzeE5E?=
 =?utf-8?B?cDhXL2Y0ZUorZk5SbVMwR1FYbGtubW5qenJSbktURVN0R2tXVkJxblZhTmpT?=
 =?utf-8?B?d0hPVHc1VkltOWxUaTU3Q25OT1dBRFdZbFFtYkIvd2JSdTRvMVhlMzdRTS8r?=
 =?utf-8?B?bzk3VmQzYVN5dEpHL1RqRGtrOFBlNzlKTkxCeDNTRjY4U1FSWXBveURRN0VI?=
 =?utf-8?B?NmIwTE5GVis0bk9QbFoyZjZ4NWRSTEJzT3BXd1JNZVVGSk9QczlId3M2ZDda?=
 =?utf-8?B?N3dCMkoxcTV5THJFWmtNbDNuN2VGZmVXOE1MRkhYMC9ybTMxR3V5REI0VHBF?=
 =?utf-8?B?U1Evcm42S1hrdFpmYlozWjEvU21DZU9wcEFTK2I0SDQvaGRFWWZVUHBvNEZ1?=
 =?utf-8?B?S2Y4cW9OWWZmUVRtc21CNTVpUzJtbG9XRTkzTDBlOENxeWplaTVSR0xnRXM0?=
 =?utf-8?B?WUhFU0JmcEVpR1prRTM4NTFTRU1QdjgxdGhaSzFxcHlpWVdsblhEdktCWlFW?=
 =?utf-8?B?bElEMkdwcFFPL2xQNWxxNHpUZkpkSi81eVRvczBPU3Y0T281bnBqdnFtTEpG?=
 =?utf-8?B?WmhRS1RCMDg5S1poUS9BMFdwOS9PSkQ4Um85YWwxcHNJUCtPOGZPTW14TjlF?=
 =?utf-8?B?YjlkUFJxbFVRbzd3NWVzS0Q3TGd0eUFkQ2FjSlVZMG9ZOURPUHdLRS9kTTBu?=
 =?utf-8?B?bC9MVG4xbEpWRnNNMk1LK0FxV0tOWVRnN2lrWXZReDRKM1NKOUZYeEhTOWMr?=
 =?utf-8?B?UXR3b1VITkVpekxLcExxK0ZCa0x0ZlFXckphQUhpaElZMGNTYk5LaCtlN3Vj?=
 =?utf-8?B?alZ6U1BkZEEvZTVMbE9yK3dHS2tUdmhqWmFLQVAwSUZmV2F4azVNYTZZVUlU?=
 =?utf-8?B?WVRTWHZaS3ZaM2Y3MFFjTnpLb2tQM0VtdkduZDVzMFRYTGZtM2N2VGJCVUF0?=
 =?utf-8?B?TSs5aGwzcEF5c3RzT0ZCYVkvZ2lIMzc0Y2hEMEIvQmJ0YlhYNm9ncEpCY0RC?=
 =?utf-8?B?RmNsMjlyK1Y5cVlZYS9lQm5INzRWYzNKUWVhUDJtRWJ1WVE0bmdRS1ZUckhj?=
 =?utf-8?B?a3pLRkpXeGovR3E5WHg0b2lQNCs5bTBqZ1MvR2JqNFU2ZXZlZnJEWEludG0y?=
 =?utf-8?B?dUZOMEozdzRHV25Zdkh0QUVlYjFJSU1pbEpHMStGSDFEK3U1eFBRaElQMy84?=
 =?utf-8?B?QytTQUhTRzk1VHFPbkZpc3JWR1V4SmFiS29hTnA0UW5hcGpxVms5Rkt2NUhU?=
 =?utf-8?B?VkJzU084MmFNZlFzdVBueHcwTkpSKzc4RHhsdng2QXpVeDdpaUs0aG03akVX?=
 =?utf-8?B?WURIS1dpeDZ6R05LckVNL1dORUhMT1lWcmdNUGFhaGxrT21wWkVWVmo0RHQz?=
 =?utf-8?B?eHdoaVY5a0ZDa2FVQnVqQUVncGlXaE5ZdURVbGNvVklFdGNwWGhJZnFQY1NW?=
 =?utf-8?B?QXRzb3JBdzd1Y2ZOY0N3RVdhK0JuQzRNdW5GZm82clhWZlVMYTAyM3hWYnFw?=
 =?utf-8?B?VTRjeDZwK0k3UHZXaUh6Q2RHMVk3dUhmbXhSaHJ3ODE1aGRHQ01Zc251Qlkr?=
 =?utf-8?B?OFJxbkYwalNmMkVxaHJtNDh3ZGNld2FKZldzUWFxc0pRSDVIR0t1VGZ5cmQw?=
 =?utf-8?B?ODZyZm9Va3NscHJTekM2cE5zMTJ1cHE5QVFydUpJUGdMN3BsT0lMSTV4R0xK?=
 =?utf-8?B?YkNpbnFteVdFOTFvWXJxUGVmRTJKM1dkYXNRQlJRVDNGY3JvZEVRR2xGbEdr?=
 =?utf-8?B?MGxTU3plZ1N4WmYxL0lzRm8wcFpJV3dsVHJDZHNXYzZFV1RHMkpJZE5Ldk54?=
 =?utf-8?B?aTN4MTdRSTIrK05TdzhJM2pwNXhDSUpqdEZLaTlLaFdhckJhdEthQjFHVjlZ?=
 =?utf-8?B?YmZRVVRWV0s0SHdkUXF4S3pNZDA0emhteUozL1dNRTJHVFFaSE02Y01VR09P?=
 =?utf-8?Q?wZ10=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ae1113-281f-4671-8d34-08dc2ca7bd5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 15:23:32.7732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wkkga60uhqDl9p3IDTdrLjrAatzUl+0uVTiXP9KAwmQZN2KY4PeKPGO4h7ddpM61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 15:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195412

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJvYmVydCBQLiBKLiBEYXkNCj4gU2VudDogZGVuIDEz
IGZlYnJ1YXJpIDIwMjQgMTI6MzUNCj4gVG86IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0u
Y29tPg0KPiBDYzogT0UgQ29yZSBtYWlsaW5nIGxpc3QgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gbW9yZSBwdGVzdCBw
ZWRhbnRyeTogd2h5IGNvbmRpdGlvbmFsbHkgaW5jbHVkZQ0KPiAicnVuLXB0ZXN0IiBpbiBTUkNf
VVJJPw0KPiANCj4gT24gTW9uLCAxMiBGZWIgMjAyNCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+IA0K
PiA+IE9uIDEyIEZlYiAyMDI0LCBhdCAwNjozOSwgUm9iZXJ0IFAuIEouIERheSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA8cnBqZGF5PWNyYXNoY291cnNlLmNhQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiA+ID4gIG1vcmUgYW5ub3lpbmcgbml0cGlja2VyeSAuLi4gaGVy
ZToNCj4gPiA+DQo+ID4gPiBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRl
ZC1jb3JlL3RyZWUvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuNC41LmJiI24yOA0KPiA+
ID4NCj4gPiA+IGl0J3Mgbm90IGNsZWFyIHdoeSBzb21lb25lIHdvdWxkIGdvIHRvIHRoZSB0cm91
YmxlIG9mIGNvbmRpdGlvbmFsbHkNCj4gPiA+IGluY2x1ZGluZyBydW4tcHRlc3QgaW4gU1JDX1VS
SSBhcyBpIHdvdWxkIGhhdmUgdGhvdWdodCB0aGUgb25seQ0KPiA+ID4gYmVuZWZpdCB3b3VsZCBi
ZSB0byBhdm9pZCB0aGUgdHJpdmlhbGl0eSBvZiBjb3B5aW5nIHJ1bi1wdGVzdCBpbnRvDQo+ID4g
PiBXT1JLRElSLCBidXQgYmV5b25kIHRoYXQsIGkgZG9uJ3Qgc2VlIHdoYXQgdGhlIHBvaW50IGlz
LCBhbmQgdGhhdCdzDQo+ID4gPiB0aGUgb25seSByZWNpcGUgaSd2ZSBydW4gYWNyb3NzIHRoYXQg
Ym90aGVycyB0byBkbyB0aGF0Lg0KPiA+ID4NCj4gPiA+ICBpcyB0aGVyZSBzb21ldGhpbmcgbW9y
ZSBzdWJ0bGUgaGFwcGVuaW5nIGhlcmU/DQo+ID4NCj4gPiBObyBnb29kIHJlYXNvbiwgYW5kIEni
gJlkIGFwcHJvdmUgYSBwYXRjaCB0aGF0IHJlbW92ZWQgdGhlDQo+ID4gY29uZGl0aW9uYWxzIG9u
IHRoZSBncm91bmRzIG9mIGNsZWFuaW5nIHVwIHRoZSByZWNpcGUgYW5kIGVuc3VyaW5nDQo+ID4g
dGhhdCB0aGVyZeKAmXMgbGVzcyBjb25kaXRpb25hbCBwYXRocyB0aHJvdWdoIHRoZSByZWNpcGUu
DQo+IA0KPiAgIGFkZGl0aW9uYWwgbm90ZSBpbiB0aGF0LCBpZiBhIHJlY2lwZSBpbmhlcml0cyBw
dGV4dCwgdGhlbiBpdCdzIHNpbGx5DQo+IHRvIGNvbmRpdGlvbmFsbHkgaW5jbHVkZSAicnVuLXB0
ZXN0IiBpbiBTUkNfVVJJLiBidXQgaXQncyB0cmlja2llciBpZg0KPiBzb21ldGhpbmcgZWxzZSBp
biBTUkNfVVJJIGlzIGluY2x1ZGVkIGNvbmRpdGlvbmFsbHk6DQo+IA0KPiBodHRwczovL2dpdC5v
cGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL3RyZWUvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2ZsZXgvZmxleF8yLjYuNC5iYiNuMTgNCj4gDQo+IHdpdGhvdXQga25vd2luZyB3aGF0IHRo
YXQgcGF0Y2ggZG9lcywgaXQgc2VlbXMgbGlrZSB5b3Uga2luZCBvZiBoYXZlDQo+IHRvIGxlYXZl
IGl0IGFzIGNvbmRpdGlvbmFsLiBtYXliZSBvdGhlciBleGFtcGxlcyBhcmUgbW9yZSBvYnZpb3Vz
Lg0KPiANCj4gcmRheQ0KDQpMb29raW5nIGF0IHRoZSBwYXRjaCwgaXQgc3RhdGVzIHRoYXQgdGhl
IHJlYXNvbiB0byBhcHBseSBpdCB3aGVuIHB0ZXN0IGlzIA0Kbm90IGVuYWJsZWQgaXMgdG8gYXZv
aWQgdW5uZWNlc3NhcnkgZGVwZW5kZW5jaWVzIG9uIGJpc29uLW5hdGl2ZSBhbmQgDQpmbGV4LW5h
dGl2ZS4NCg0KLy9QZXRlcg0KDQo=

