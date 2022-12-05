Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5B6C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 13:28:55 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.71])
 by mx.groups.io with SMTP id smtpd.web10.14915.1670246929837292894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 05:28:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yVOrrNh5;
 spf=pass (domain: arm.com, ip: 40.107.103.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0NSTuWbTSxbLpzQcj/Ffx3ceqxXgKr4je95ZzhhmoUJShCUSTZAnhUuoe/+qEgoT20fbbpDcPa6dp8n7+i6iRgcBMewGIsJzUZppHG4haFeWH1gVLqcYGoEw6brmgW3QUU36d3Jw7Vse9qLM77mWf4FUvKO1v++MO1NvsABQLKuavo6Q6NAtthwQSAh9ZBLAeoWKBfjbu1p/pFgspN6VBbcfx8ofpDRIwvODpIoGRvZz/L4GhwqqmqaHDhGsm3dg480yYLXv9vwjTcKHFT5o+fNDRlzBscPH3pfmKMvvh4gqrhSCth+eXrFnfOaZqEnFFWI5wY9VYxePoly4q+9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IT0GY7EWsi5bcqvyoQUPllcoAaARQeaavxxfn4qMRJQ=;
 b=Xd+9rSTpQyhgbUDL7OHo0ZWiny5hHy4205d9uDZMZcz1qccCbNqltPigmIdsAKyMwaiNtr5s9jUse5DCKkIfHx04A+c7S1XA4q43F4TOc9ivTuEnXPCnMHJwW1BEWRCaQ0xzjQEPIfs7Mzt2EWQKd2WJpgWa7MXoLgV7+qTIrRBpocWkb3qLfyra1j3RMUdAVdBczKZ3LOG/pxzsClcpu2sPC/EXaPzdAf5QU0vbgfeoq9+L3801GZP/CEnQN7ZojngYDzUSwpbI0DOy7fOAeOWSoKHDlFTcim8ik8UhNFEDnVXH6tY6ZNwJanXUwon891GpFAk6TPfVOMQfUwzhXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IT0GY7EWsi5bcqvyoQUPllcoAaARQeaavxxfn4qMRJQ=;
 b=yVOrrNh544kIBm2kmQUuTdJDS23RqHAJFiOqhXHgqiU0qj/RAaHNWIATixIY3gl95qktHnQJWTY7vwK6WeNL7VGEHV+zNoKoUgivkexr5vEo4Mfmcdt2ExRZCzjzJfOF6mE7r2Ffz3WSbYrLiIZifSbqVYe8e3yERob0vDB228w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB5953.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 13:28:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%8]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 13:28:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "mark.hatle@kernel.crashing.org"
	<mark.hatle@kernel.crashing.org>
Subject: Re: [OE-Core][master,langdale][PATCH] libdrm: Remove libdrm-kms
 package
Thread-Topic: [OE-Core][master,langdale][PATCH] libdrm: Remove libdrm-kms
 package
Thread-Index: AQHZBntW3gabpl2rdkm/0seMKGcl3q5fTfYA
Date: Mon, 5 Dec 2022 13:28:41 +0000
Message-ID: <D32FA7DC-6F1F-4480-B5EF-1D9A79119C52@arm.com>
References: <20221028021738.46045-1-sandeep.gundlupet-raju@amd.com>
 <53fe1ba9-660d-aece-0b2d-8188b82332b4@amd.com>
 <cd6f1de6-3520-f050-afab-3f29a3ce16ba@amd.com>
In-Reply-To: <cd6f1de6-3520-f050-afab-3f29a3ce16ba@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AM9PR08MB5953:EE_
x-ms-office365-filtering-correlation-id: 2cf502be-3e75-47c6-a9bb-08dad6c4a063
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MtqtL+UKPCnIe/+itHoEO+NO07PHsxWBR5OqsWtVB2anSmV+lH1f9cExkF62PE+rdMTRgKILf8sb7H/N1/pvklwVBU0nIvogt98aqWiXOPZbRTYuEZ3h435ozHCbQe/cgLxfljQcNZQUlc2fvQt6X72G7Fx8faRYtLEUAeSCFmyJwNF10jW/Sz4TGpcg9O9PQRMJfgK3w9AkzA4iNTH980CmJi1EnPYwDOwjwa6bJzWZ487QCFXbtvdekJMUuZTenitZvik1d+GLbyuaG4zSA0JDmKQhTawVQBGvNvrzRGvae6ln3VU/t14+p5Z59GXC60cFfrMQkw0+7r/Z5dSOZyhrL9EWFPU0dY4/peFLEfYDU110MlaeNZ5xVXCnn4BXPrqhTB1Cd0uHYLsrbsbk2i0Hap3eo4/KctzV3HRWOaMZDefEXRkfOrmecnGNRD/uqTFL0uGKjbOtRA2YTVelSCjDEKX9YHSqrH2OSHxY0VwFQFG5G/KlgZrCZk4Ye0N0ojs+rqkIqgRVpJIrRefEwU0dT6DKhQIy+SCT6f5+AulD6nILWblcR4/fycOt+Fdwsg5GbH9dlbaKHf4unuOKJFarm9f6H21hn6J8yB/C4rN1jhvi0npM0p9teYpCE32w7WhyuOpy0xwDcR/lvfhPh2y6cyDNn9fUijerrltrsyy7pgXUi+Jl2Igl0sM0kKySZzv4RFQcsLXZI6h6qnmNLu+SfcPvJT6+Qn/s9fAk/ioy76XN0JoPRyvAGXtyY/hu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39850400004)(396003)(366004)(451199015)(41300700001)(2906002)(8936002)(186003)(83380400001)(5660300002)(86362001)(33656002)(122000001)(2616005)(38070700005)(38100700002)(36756003)(6506007)(66899015)(71200400001)(54906003)(6916009)(6512007)(316002)(53546011)(26005)(478600001)(6486002)(966005)(64756008)(66476007)(4326008)(66946007)(91956017)(76116006)(8676002)(66556008)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bktqUWNrc0tTVVJ2VkFMeENZOVRPK1NPcm5pODBraXcyM3dmcWpSUWNBV0Iy?=
 =?utf-8?B?aUZwbzVVVkgyZE1rYTNqYm5Yb2Z1bjZVbWpLbVlwNk0yb2R5cnhhbDBVdTJF?=
 =?utf-8?B?eU9zeDV4N0dGNU1ZanpWdXJzdlhZeUNQanJqWnBCM0VVWE5mNkdqMmJMNEJE?=
 =?utf-8?B?eEFQcEliM2xIdjFzWG1oQWtkeHRCZ0Y5a01jTlZZSXFycElUU3VVMHJHTGs1?=
 =?utf-8?B?YXdXR3NYd09XSTQzUGZMSTAza2hIbEdCUEVPZkdraUgxUk5vTXREZkY2OHY1?=
 =?utf-8?B?akg4dGNLLzRXdFhneFVGd1ljTFlLVWY3NE1aeEF3Q1NpNVI4WUt1bUxkTHIx?=
 =?utf-8?B?WFVsdFkzK2d0Y0MwQ1N5cXZkcGhRR0ZuRWtEZnJHMGVxYWVza0xYME5ZNFB3?=
 =?utf-8?B?TXlXVm1hWlBLZyt3OXdDWnJhSkVyTXphenFFM1c0V3NhcFFvd3RQUllqb1BB?=
 =?utf-8?B?NmpoTUdsUzFQZXRuVWRLSGJqK3RHNVZtaUpuU0RqMFM2WEFvVjU3WTdYanc3?=
 =?utf-8?B?aERrakNYN1ZLbEo3bHV3SlNDV2JnM2hvZzFtN1lld3pUZzMraE1LcFVNS0E5?=
 =?utf-8?B?bDhGUVptdTVyRXdCUWJoZHgxejEvS2VWZHQ1eUxyN1lXRWRIYmEyOThaSHpn?=
 =?utf-8?B?b1hEV1oxZHU4ZmxSbitaVGlLVUNxNmFibGk1TVlneVo1QVBjUEtCeWNsT05z?=
 =?utf-8?B?V29zT2JIR09naFVnVFl3T05GYzlYUmVWWGt0bnFkUUVsMngxVWVnNytjSXhh?=
 =?utf-8?B?QTR6TjFUQVdhMmV6NUlWZ1NuMEFQYjUvQU5nSDVNNTZLblJjdjB4QjB2TlNS?=
 =?utf-8?B?MnZ5dERSMnlpNDVlMXpVUnFhZjc3OG1KaWp0VmMwN0RWbUZnRDNwb1BFTWx2?=
 =?utf-8?B?T1NPYkkxV0IycEFKbjMwYU05OVJrTTZ4VTRkV2F1d1F5U2JmbzFKdXZ0NDdl?=
 =?utf-8?B?TXRDdk55M2RDSzVLQzNHZW9JeUdicWd3bHpNeElCZkJOYXRKa0R6S0t4Ukps?=
 =?utf-8?B?dEgvVFhCaWVVRDRTTWlvOHNvM1J6WC9TRWl3TFByckxXUFBHcnowaWFqV1dP?=
 =?utf-8?B?OFRjS1lIOUN4aWVzNDE4czdUVmtHRi9RT3kycWhrWEtKWXVObGpXY0J3MVpD?=
 =?utf-8?B?QjZiRjBOb0hEZCtwUzBqUnhHRmRKUkgyMWNKaWwvVlFYS2tjMUZDZFEvcXBV?=
 =?utf-8?B?Qm1FQ0wxeFg3Rzg4ZlhBcysrV2lLSzNhdDQrSHhsSDJBSGh3d1lOTTRKSFdX?=
 =?utf-8?B?ZmhwVnRZVVI5bFJldjE3WHhmZTJYdUFsNzVENlZST1owd1pjeDZ5RzBpaHZr?=
 =?utf-8?B?eEM4QXd4K1lNQ1g2aDI1QjliS2djRU9LbE1PUjJnUXNJTDljbDc4dUREYjJU?=
 =?utf-8?B?NzlWcFhhTWF1SjlTbGtkaUpIWk1vaVB3dEErR3owZ05CaE9kY3FDU3NVbDlo?=
 =?utf-8?B?RDh2eFJJSzVoQmN3b3hncGx5djFoWDlHK1NzWmpkM2VtT3BvQzhiQklORWx3?=
 =?utf-8?B?YXNhazFnUHpuS01ZQ1Q3YXRRMUNMeXovZzVaeit6VjUrZVkybEd2NFRWZUlz?=
 =?utf-8?B?MzhQczFmbEVsT3V0dzYrb0ZhQU5ud1VNSnZmTDNsQStXdTJ5UHlzNTl4cXNI?=
 =?utf-8?B?YkU0d3Y5aVFGdGJaV01JcXptUENidzJHL2Q4N0xQR2hSamlLczJLQ1FhOEFS?=
 =?utf-8?B?UHZXUGZPcWR0WlJUY2lEcGRjYUZPa0RtVTkxcTFDeS8xUzBqLzhiZ3NxeDNo?=
 =?utf-8?B?eW9WREFncDJycnREK2xpMHFUMTdNVzVYOG1sR0ZrZlppa2NaTTNPWHBUQkdi?=
 =?utf-8?B?alIrSTNpb0VvcGQvNCtTbGRucmFXSVhvSDVudENEM00vNzdBUHA0UVI4cUVr?=
 =?utf-8?B?SkJuV0tMV050UVE4U2tzTHovUk1BV3hvYkp4MSttd2xhWTBTMTBzUzY5UERJ?=
 =?utf-8?B?ZUplOHpRRWMzbVhFL0xrc3FzSDZFOUJ3NzVIdXhNcm13ZnVBeDBqc1ljZG5Y?=
 =?utf-8?B?Rk4vMXNJMXVoMjFCZUV5RWRqTHoybU9iYkNZbWZwK1FvWXBldHY4bUgzaFI4?=
 =?utf-8?B?djhscmsrelNtbnFsQ1dscVpLanZ0dis4cXM1LzdBcjd3SThPVDhGM3dEOTN0?=
 =?utf-8?Q?fAlfrpBlOEWqQe5IYVwtDJwEN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2C855D7430E024F8DC6875566505C3B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf502be-3e75-47c6-a9bb-08dad6c4a063
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 13:28:41.9010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nU73a6jLK69XgXLlZYJkxOL62SkBApCrlLZr27pKSnZWj90VIHzEnG+r3feJc7F4mK7EhOZ/yq/JrZsllGeLiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5953
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 13:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174285

SXQgZG9lc27igJl0IGxvb2sgbGlrZSB0aGlzIHBhdGNoIHdhcyBldmVyIHNlbnQgdG8gdGhlIGxp
c3QsIGF0IGxlYXN0IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL3NlYXJjaD9wPSUyQyUyQyUyQzIwJTJDMCUyQzAlMkMwJnE9bGliZHJtLWttcyBkb2Vz
buKAmXQgc2hvdyBpdC4NCg0KQ2FuIHlvdSBwb3N0IGl0IHBsZWFzZT8NCg0KUm9zcw0KDQo+IE9u
IDIgRGVjIDIwMjIsIGF0IDE4OjI0LCBTYW5kZWVwIEd1bmRsdXBldCBSYWp1IHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxzYW5kZWVwLmd1bmRsdXBldC1yYWp1PWFtZC5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBBbGV4LCBSaWNoYXJkLA0KPiANCj4gQW55
IHVwZGF0ZXMgb24gcmV2aWV3aW5nIHRoaXMgcGF0Y2g/DQo+IA0KPiBUaGFua3MsDQo+IA0KPiBT
YW5kZWVwDQo+IA0KPiBPbiAxMS8zLzIwMjIgMjowOSBQTSwgR3VuZGx1cGV0IFJhanUsIFNhbmRl
ZXAgd3JvdGU6DQo+PiBIZWxsbywNCj4+IA0KPj4gQW55IHVwZGF0ZXMgb24gcmV2aWV3aW5nIHRo
aXMgcGF0Y2g/DQo+PiANCj4+IFRoYW5rcywNCj4+IA0KPj4gU2FuZGVlcA0KPj4gDQo+PiBPbiAx
MC8yNy8yMDIyIDg6MTcgUE0sIFNhbmRlZXAgR3VuZGx1cGV0IFJhanUgd3JvdGU6DQo+Pj4gbGli
a21zIGxpYnJhcnkgaXMgZGVwcmVjYXRlZCBpbiAyLjQuMTExIHZlcnNpb24uIEhlbmNlIHJlbW92
ZQ0KPj4+IGxpYmRybS1rbXMgcGFja2FnZS4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBTYW5k
ZWVwIEd1bmRsdXBldCBSYWp1IDxzYW5kZWVwLmd1bmRsdXBldC1yYWp1QGFtZC5jb20+DQo+Pj4g
LS0tDQo+Pj4gICBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTEzLmJiIHwg
MyArLS0NCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkNCj4+PiANCj4+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJk
cm1fMi40LjExMy5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC4xMTMu
YmINCj4+PiBpbmRleCA5NTllZjY4MDMyLi42MTNkMzQzMGNlIDEwMDY0NA0KPj4+IC0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC4xMTMuYmINCj4+PiArKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTEzLmJiDQo+Pj4gQEAgLTM5LDcgKzM5
LDcgQEAgUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10gPSAiLURtYW4tcGFnZXM9ZW5hYmxlZCwtRG1h
bi1wYWdlcz1kaXNhYmxlZCxsaWJ4c2x0LW5hdGkNCj4+PiAgICAgQUxMT1dfRU1QVFk6JHtQTn0t
ZHJpdmVycyA9ICIxIg0KPj4+ICAgUEFDS0FHRVMgPSsgIiR7UE59LXRlc3RzICR7UE59LWRyaXZl
cnMgJHtQTn0tcmFkZW9uICR7UE59LW5vdXZlYXUgJHtQTn0tb21hcCBcDQo+Pj4gLSAgICAgICAg
ICAgICAke1BOfS1pbnRlbCAke1BOfS1leHlub3MgJHtQTn0ta21zICR7UE59LWZyZWVkcmVubyAk
e1BOfS1hbWRncHUgXA0KPj4+ICsgICAgICAgICAgICAgJHtQTn0taW50ZWwgJHtQTn0tZXh5bm9z
ICR7UE59LWZyZWVkcmVubyAke1BOfS1hbWRncHUgXA0KPj4+ICAgICAgICAgICAgICAgICR7UE59
LWV0bmF2aXYiDQo+Pj4gICAgIFJSRUNPTU1FTkRTOiR7UE59LWRyaXZlcnMgPSAiJHtQTn0tcmFk
ZW9uICR7UE59LW5vdXZlYXUgJHtQTn0tb21hcCAke1BOfS1pbnRlbCBcDQo+Pj4gQEAgLTUyLDcg
KzUyLDYgQEAgRklMRVM6JHtQTn0tbm91dmVhdSA9ICIke2xpYmRpcn0vbGliZHJtX25vdXZlYXUu
c28uKiINCj4+PiAgIEZJTEVTOiR7UE59LW9tYXAgPSAiJHtsaWJkaXJ9L2xpYmRybV9vbWFwLnNv
LioiDQo+Pj4gICBGSUxFUzoke1BOfS1pbnRlbCA9ICIke2xpYmRpcn0vbGliZHJtX2ludGVsLnNv
LioiDQo+Pj4gICBGSUxFUzoke1BOfS1leHlub3MgPSAiJHtsaWJkaXJ9L2xpYmRybV9leHlub3Mu
c28uKiINCj4+PiAtRklMRVM6JHtQTn0ta21zID0gIiR7bGliZGlyfS9saWJrbXMqLnNvLioiDQo+
Pj4gICBGSUxFUzoke1BOfS1mcmVlZHJlbm8gPSAiJHtsaWJkaXJ9L2xpYmRybV9mcmVlZHJlbm8u
c28uKiINCj4+PiAgIEZJTEVTOiR7UE59LWFtZGdwdSA9ICIke2xpYmRpcn0vbGliZHJtX2FtZGdw
dS5zby4qICR7ZGF0YWRpcn0vJHtQTn0vYW1kZ3B1LmlkcyINCj4+PiAgIEZJTEVTOiR7UE59LWV0
bmF2aXYgPSAiJHtsaWJkaXJ9L2xpYmRybV9ldG5hdml2LnNvLioiDQo+IA0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNzQyNDQpOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3NDI0NA0KPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85NTQxMjI3
OS82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

