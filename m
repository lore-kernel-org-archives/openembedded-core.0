Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D86C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 13:19:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.53])
 by mx.groups.io with SMTP id smtpd.web11.26213.1684502352602951966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 06:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=gjBxhZR6;
 spf=pass (domain: siemens.com, ip: 40.107.8.53, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehhcDA/APCQtYV2nEK1H7VdpRg/7/1Wkff5TRU54Nm4XbptHbB5eYCYKuevKpBvZVvHLPLM048x0Gs3J4CdQd8CccGDZ4qjm7BAJOepRRMxpVzJS2fD+UPXN8CgjEpjt49vnUKlWSY6fT0q6t7p5qSJSho9EXzpjnSkEkOc9k8oosupHEky/MSDbxFDuFrrAyLa4RJFbxGiUsg60yusGTBBN6602wsF6srDwunSN1xylk3jgmf7S8Dcip4f9syTnQxLKEk6a4i6h4WZBBhkidgYiNhEkkRaw1xWUK+o1wDP5u9f8PzdmFwmhBzesH57dQkqYV7NVwiGOtNXdH7LffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H59nK8qiEWAYAptMwVjyEQmStcm/m4Bpg5RDkcsnmI0=;
 b=FgDnST/YSfFqmqCAA5zymYGP3WfyUaUZ2G1aTyMgGtw87wcLD8PZ7zm0D+ktVvOeFcDGG836TBLG1YoNxNVAN97RVW4gAVRvaTrviOXfazryPs84xJeCu1JMuyycwXEGc9xyX8nxMP5Xg7b5eK9cvdn4pH/OUVbcun9UhRRFqk1Et4sYRgQe1N+YGKGQfpArT12Xf2Asq6y2VPE0Nsgj6R0Azep8DERUkP8HpN/UAJqQYC8OzAd92t5m+nCubIB2523BfTCrEt6t/Q3Wni3qp7EMCJrk5AFnVPlKiJqCTLlIZdpW8P4pLn8qBWR8bFYoxtm6yG8JcMzxorQ5KRxthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H59nK8qiEWAYAptMwVjyEQmStcm/m4Bpg5RDkcsnmI0=;
 b=gjBxhZR6/WG4trlxo6/d700zr9O6bjIVxegnAgY0+tzPahZL5ckfHEzdBubNDRaZHi66Z7Kpj2D4rsh6kA+OcQxuPubGVB1mm86xI5BOe8n7UbujPjPQO8KkW+e6VSKTyklfa97KmbMG0rWQCjfhgKfJCJwZd98sJjIaU/lyScuXPKuLsLBd95z6eq0ms9kAKZgPq2lk0Odk0qZr4iDOrCesNNv2MeepVlPatd7eJqgwQ0DlIexn+K6/VwGYP47t43OYkL3FmwiOF+hEofwbNl+rTVXixR7iYuqLvZl4VayFO3s5ZDN1r15HGqbZEZnKzD2ybFPxHxmBspOhDTGK+A==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by GV1PR10MB6325.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 13:19:09 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:19:09 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "michael.opdenacker@bootlin.com"
	<michael.opdenacker@bootlin.com>
CC: "Marko, Peter" <Peter.Marko@siemens.com>
Subject: Re: [OE-core][PATCH v4 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Topic: [OE-core][PATCH v4 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Index: AQHZiiqX4/ejRVsz1kO2l0zje1vXfq9hkfwAgAACqgA=
Date: Fri, 19 May 2023 13:19:08 +0000
Message-ID: <846c66cf5b623f84f4575ffa51b11a51f2510e49.camel@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <20230519081850.82586-1-andrej.valek@siemens.com>
	 <4b3d799e-21ae-bea4-e702-9d2db4b7145e@bootlin.com>
In-Reply-To: <4b3d799e-21ae-bea4-e702-9d2db4b7145e@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|GV1PR10MB6325:EE_
x-ms-office365-filtering-correlation-id: 624d85d5-341a-4212-17a0-08db586ba0fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jihpQohLwdFOOB+LfbkJgcyzhLFiE+uxUkRQtCmJ4Ex6IPBOT/TJGqYwEMTyPvqMTc62Pm/baXhDtvbOqBsp4awHHyhUJF87kg4zDKsIFs2XfMNFfYws9lBwiqeeKOoG2D1s4A5idj+/xuc9/Zuyk4+3N7j+MOGpdbSnf5aNQQekp5XFU/MydKZ02WnhHutbMpH0IHJTUIOnmvm9wHBJHwlFVenKGXwRQ2do+b4K6rwDGddCxAgEZM+9udIs3mTfOB+nM5hfxDNgRGKpmKubTGiHnqgor5zX1ZU/UPGdQdbYLwwTT8lVZJjBuB95bvcJVcGMlCNujbjPxzslBl8ph0HXuu+xyJjOAolL3wc/b/BPGmSnH5dIXAVv2KfQb6oJIWn6CldGjdzkMvA1VcG+sZ0BQBwUWjGVkuAkc/ishAK/68w9odoUOJBXS+pnyunNDyXqbO7fmnzV1MCuUKSWWB3wniZpy5dUoQtgHzvHznQwTYMcX/WHtOW4v6R0hVm4wcgx+4SZ964+aZM/JTESglKN4IspG8kG+/rQhB9oA9XJw4xwebyb2D6ybx0CrMaqD0ExbYfl5Z9ojU5cK1Jgcv6gfVvvqp6Ced4vv+DcZhw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(83380400001)(186003)(91956017)(966005)(110136005)(71200400001)(2616005)(66446008)(478600001)(6486002)(6506007)(6512007)(26005)(53546011)(107886003)(8936002)(64756008)(5660300002)(36756003)(66556008)(122000001)(82960400001)(38100700002)(41300700001)(8676002)(66946007)(76116006)(2906002)(4326008)(66476007)(38070700005)(316002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dzE0NTFveG5RMEhEMmFSc1RnZVZ5VUdJQmFSQWsva1lwZUtlbWM4YkVqY1BR?=
 =?utf-8?B?NTVxblpwWkg1OUxnK3JzaGpNSUpXaG1tb0dXU1RZeE9LQ0d0cUY2eHpIMjdY?=
 =?utf-8?B?L0FPbmlTS2NnYUx4WWdsTnNQS0dvcTA5Zzh1YUxPVW8vVitZQUE1ZGxPOXZm?=
 =?utf-8?B?M1NMb09oSVZiN0pJeDJHK2xxdnZnandENEEzL3VObnAvY3ZMMmE5dnIzQ2lS?=
 =?utf-8?B?endQMzVpOVMwTkFCcHRrN1loTlhUbmtudDlGUDYxb0l3UlIxdGJYSFp3ODd5?=
 =?utf-8?B?ank1M3V0SzQwNy9KdVZWU3JZSWw3SjFNK214ZnliakUrRm51VWMzYTBIeHNv?=
 =?utf-8?B?bXdISDdyVkhrOG02QnBYOS9KMlF5Z0NHOURkSUVCUzM0K2xYcXdxNzJmaExv?=
 =?utf-8?B?S0ZiTnNzS2dLdloxNXYwY2lCb1IyT2F5MXZsZHZ6aGsvc1d4Vk16WG9JakEz?=
 =?utf-8?B?SE5vK0c4aE5kQmJ2d1lEWkFweVgwZWoyRk5LczZCUVh2dGZsRzBoMnBicDMx?=
 =?utf-8?B?MVo0V0wrMEZFQnZPWkp2QXpSNkVWdTMvY2REeEp3LzJaK3VXRmdjNnRtazNn?=
 =?utf-8?B?VkxPYWpKQklOdTMyWHlBRHBHUkJlNVN4SjBSSXB3RVJZMUx0Ri96SmFFOWNC?=
 =?utf-8?B?SWxhREg3djViL2xvUE9mUGhzRW1FbXgzdVI5K1JxVHhxMStyNFJEYUhyVWda?=
 =?utf-8?B?VU1jdzRlTlpyZWRoSGxqMHFzUVd1b253cWFTNUt2dHB0a1RubFd5a2hiU2VN?=
 =?utf-8?B?MTRSMWcvVzBBYm41dzhCVmpCVU96MlhJNm9ML3RtenhpYk5SM3M5TFMyem1O?=
 =?utf-8?B?RUJyb1RxSGgzakhFS3RVME5SVCtwOGhxK1J1RVNwZXFOTTJPMkhKTGVJWVJx?=
 =?utf-8?B?RnNCOE5MZHpzL1BnWEk1Q3B2amZXbjRwUEtoS0ZuaUxFb1ZsQ00rcjdSRFZl?=
 =?utf-8?B?bGRibkhMQ2xtbFpHY2s4UUhBbGJhUXdFYytPU2NyM3NJL0pRaG1yazdOUWwx?=
 =?utf-8?B?dldPdExhSHFxZzAzNHRHckkzelpnMHhqMU5RQm5QN3JFU1ZHYS9DTFpBU2Zp?=
 =?utf-8?B?akVFZGVKK3JXNWp6ZU0zNTdjOVFnODluczdqUHRQVFJqbzVQcE85dldQZ1lu?=
 =?utf-8?B?WjFyVHZXK0NrMXExMFFwMXNudmVaU1NuckJESFpPUzhmSjJxQnlXeW9tcVZ2?=
 =?utf-8?B?Q1RjbUZNT1dETFJod0c3T3dGR2pGdGR5REVnV0J1clk1Q292SGtaZDRrOHpZ?=
 =?utf-8?B?MStPcXdPUUVEWm9NNHp6Yithd2pYNHlQdGV5Si8vUTJlNDllMXpqTHdVM3BP?=
 =?utf-8?B?YWM2dk44RGRHbjhhRXpsNHNRNGpDclh6dEpTTEc2UWIxUGNKLzhqTFQrSGZr?=
 =?utf-8?B?Nkt5Y3RPWkJnclRVRXFjNGRGdHVIWHdqSGFXQkhrZU10MHFkRFk2ZzRGbzBY?=
 =?utf-8?B?YzFnNW0wUWJ3cndXc0w5ZHJIdjRpYUtEbzNCYjRaRFFYS2Y1b3lQK055eFdn?=
 =?utf-8?B?M0phWGk5RUxoT1VXWDVrMVpWOHpBWjNjREFYVkZCNlY1N1IyS2pBUE5OSFlE?=
 =?utf-8?B?MUdMcEs2QXJ4c0ZMc2kzeTFSdll6ZmluTDRKMUlibStnNmh4UUdaVWNpWW1o?=
 =?utf-8?B?R3dtWkZlZTdWQzk0NTZEbnZweTR5K3duZE5CaUdxM0h3TjNMVDVlTFV1YUNY?=
 =?utf-8?B?bmpkWWw5QjB2VFNGdXExalNGRndTYUZyeUNvMGxrVjByMlFKekdzdTd5OU8x?=
 =?utf-8?B?YldBdDdHSVJhZ3FoUzBWdEcwVWpLK0psYS9jOTV3bHQ0YlRwcXF1TTN1eENj?=
 =?utf-8?B?YTdONGV4cTVkd1ZtQWNSSjJuV2gwd29SNSt4NHYyTk5qb05sUktSM0F6Y3pF?=
 =?utf-8?B?VmJYWXozNHpzTXkyQkpiSU5lRlVlZEQ4RTBhcUplck5TbkhSSW8xWmhmSlFV?=
 =?utf-8?B?a2pZV1FhS1lMWG9ZcE94ZllVdFRacXE3bzVob2ZyTkVwcGxpWkZZTEhXN1Bt?=
 =?utf-8?B?S2xOZ09xUk5Hdkg2RlFsaFRabzh1c1JPSkR5akZYdVZtQUxrdSthaFZ6czR5?=
 =?utf-8?B?Q3ovYS8xb0RTdkt2SXVrbEFoWHc4dUZHS0xRK1pkREhSckJ6UXRORXVyQ2k2?=
 =?utf-8?B?YmNoKzN0ZjhncklJWGxyd1JLR3RSU1hudStyY3EzQnZMY29ZdmlpNHZZWDhz?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BAC5237368D2B469966B29921C28CBE@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 624d85d5-341a-4212-17a0-08db586ba0fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 13:19:08.8379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u6QxgPkrHl2Up40yfA5SkX3493R+d81XFxjc/4a/aV91SphA4b3rKJ7yDJIF78ilYYjK9ht43LhVxSeRum4RivdVz7tgvuwwriIF2+Wj318=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6325
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 13:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181551

SGVsbG8gTWljaGFlbCwNCg0KSSB3YW50ZWQgdG8gdXNlIGEgIkNWRV9TVEFUVVNfUkVBU09OIiwg
YnV0IGl0IHdhcyBhZHZpc2VkIGhlcmUNCmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9n
L29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTgxMDM3IGJ5IFJpY2hhcmQuIFNvDQpJIHdhcyB0
aGlua2luZywgdGhhdCBpdCBoYXMgdG8gY29ycmVjdC4NCg0KUmVnYXJkcywNCkFuZHJlag0KDQpP
biBGcmksIDIwMjMtMDUtMTkgYXQgMTU6MDkgKzAyMDAsIE1pY2hhZWwgT3BkZW5hY2tlciB3cm90
ZToNCj4gSGkgQW5kcmVqLA0KPiANCj4gT24gMTkuMDUuMjMgYXQgMTA6MTgsIEFuZHJlaiBWYWxl
ayB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiAtIFJlcGxhY2UgQ1ZFX0NI
RUNLX0lHTk9SRSB3aXRoIENWRV9TVEFUVVMgKyBbQ1ZFX1NUQVRVU19SRUFTT05JTkddIHRvIGJl
DQo+ID4gbW9yZSBmbGV4aWJsZS4gQ1ZFX1NUQVRVUyBzaG91bGQgY29udGFpbiBmbGFnIGZvciBl
YWNoIENWRSB3aXRoIGFjY2VwdGVkDQo+ID4gdmFsdWVzICJJZ25vcmVkIiwgIk5vdCBhcHBsaWNh
YmxlIiBvciAiUGF0Y2hlZCIuIEl0IGFsbG93cyB0byBhZGQNCj4gPiBhIHN0YXR1cyBmb3IgZWFj
aCBDVkVzLg0KPiA+IC0gT3B0aW9uYWwgQ1ZFX1NUQVRVU19SRUFTT05JTkcgZmxhZyB2YXJpYWJs
ZSBtYXkgY29udGFpbiBhIHJlYXNvbg0KPiA+IHdoeSB0aGUgQ1ZFIHN0YXR1cyB3YXMgdXNlZC4g
SXQgd2lsbCBiZSBhZGRlZCBpbiBjc3YvanNvbiByZXBvcnQgbGlrZQ0KPiA+IGEgbmV3ICJyZWFz
b24iIGVudHJ5Lg0KPiANCj4gDQo+IEknbSBub3QgYSBuYXRpdmUgRW5nbGlzaCBzcGVha2VyLCBi
dXQgd2hhdCBhYm91dCBqdXN0IA0KPiAiQ1ZFX1NUQVRVU19SRUFTT04iIGluc3RlYWQgb2YgIkNW
RV9TVEFUVVNfUkVBU09OSU5HIj8NCj4gDQo+ICJSZWFzb25pbmciIGlzIGEgbWVudGFsIHByb2Nl
c3MgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseS4gU2VlIA0KPiBodHRwczovL3d3dy5lbmdsaXNo
Zm9ydW1zLmNvbS9FbmdsaXNoL1JlYXNvblZzUmVhc29uaW5nL3pkZ2R3L3Bvc3QuaHRtLiANCj4g
SXQgc2VlbXMgdG8gbWUgdGhhdCB0aGUgdGVybSAicmVhc29uIiBzaG91bGQgYmUgc3VmZmljaWVu
dCwgYXMgdGhlIA0KPiAicmVhc29uIiBmbGFnIHRoYXQgeW91J3JlIHVzaW5nLg0KPiANCj4gSSdk
IGJlIGludGVyZXN0ZWQgaW4gd2hhdCBvdGhlcnMgdGhpbmsgYWJvdXQgdGhpcy4uLg0KPiBUaGFu
a3MgaW4gYWR2YW5jZQ0KPiBDaGVlcnMNCj4gDQo+IE1pY2hhZWwuDQo+IA0KDQo=

