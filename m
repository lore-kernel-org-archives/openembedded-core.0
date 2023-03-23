Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F83C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 11:49:19 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.44])
 by mx.groups.io with SMTP id smtpd.web10.70417.1679572153648870621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 04:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=fSAbtO8f;
 spf=pass (domain: siemens.com, ip: 40.107.8.44, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRF8Jgb9qZmeXQRibj/W1aqSzK1psQx7uUZbn7iJk0xFLKpAuShIbF7AI7Pmx0lXlwq2x9cK0YZTh9BTGT8n6z0EzYIzOZi1UhwGcBieOWNHVu8U3lMUKjzG9MK1armCXZz4+SiGSoYfogAj5Hgrixnaf5W2XNQNFgF0FEcaD03+5KnQuN3AdlspTCiR+KNnMnu9JP3S2KLiEhqmyXhMjqS9h8YvmXALTaVIaW/voDO7J4wAYsGmJKrTXD0PIZOM6n3D41g8Y49/whx6UkOtfKfRuzz6+J1s4kg7OaszNv/ZFknU5x+++lalooxjscu1Bo4rvpydpEwX7gz15nzUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlHiRgWpD/elRViDTkqbXpo1h/1l6bznRkhP7uNp86A=;
 b=aNYN9eYewXFxO9TAQj400lW0jPNLiej364jWjMNMbjGYyl9pX4UhMZ6s5NN1Jv/ARfgDsZs1ZRD6UH4ZMh74IXVpsYA6+NnDlMhd5nUm7kuNliH5ihCcsx80xJMI1EubgK+acEhEqEkTvnKZtmI3Ym4IYu0Ib6LDJC/v0eKmr+z9drxIeehb8cNE7dDMuqGa5/7fGayJZkodaukU655KPo8e+DG9f54DnKfXOXcUDgCoQzIvT5CJrRFK1HCfMKH5sQTJwH8twMdlq6cWmn2HnnrREpmJkCv0m4mlDo3ulJ9P6WwzeTiyTgxghG9ltADrjbugiN+dd1c0K0ZNO8WtZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlHiRgWpD/elRViDTkqbXpo1h/1l6bznRkhP7uNp86A=;
 b=fSAbtO8fN3QMdYYUBA1klZ1NXtI6ASweBs0DzHxHMa8itv6qBO8znLWTYkFElMkweIz4KJd9EURNGStjSawqE7aA9fEqrH96UwsoRPrFH5sjKeWVDJkgs98ZNN8qgwsceqBarghlLS+naoMQ44TGhlnHWAitnFJng7Bm/hsN3R+pX1TW0gzIVMGToKFDnpDr1luobXIFi6zjwYRqwJP706x7jhoMN8w0ollaQN0+SG75pOqLYiYXaAkakI4iRIwIF9OvVOTpqFxUxcmehL1uMhoDcYCpl4BPVxAymD7QbgrX0lPaWE826Qh22ayRugW55mS04AwcgFpNACWrJmKe6g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3212.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:114::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.8; Thu, 23 Mar
 2023 11:49:10 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006%7]) with mapi id 15.20.6222.008; Thu, 23 Mar 2023
 11:49:10 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][master][langdale][kirkstone][PATCH] gcc-shared-source:
 ensure that S exists in do_deploy_source_date_epoch
Thread-Topic: [OE-core][master][langdale][kirkstone][PATCH] gcc-shared-source:
 ensure that S exists in do_deploy_source_date_epoch
Thread-Index: AQHZXXb+4qjT9DaV70e0IXo3pT15Aq8IPZAAgAABojA=
Date: Thu, 23 Mar 2023 11:49:10 +0000
Message-ID: 
 <AS1PR10MB56977C15BBE1FCE6CFA875A8FD879@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230323110146.243968-1-peter.marko@siemens.com>
 <a8d4855315c091bde32979f928885320c1b5b3dd.camel@linuxfoundation.org>
In-Reply-To: 
 <a8d4855315c091bde32979f928885320c1b5b3dd.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-03-23T11:49:09Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=418a80b5-9e1d-4842-b73c-b4e1612feffe;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3212:EE_
x-ms-office365-filtering-correlation-id: 3173724a-99c5-4227-52e4-08db2b949db7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8s49K6PZP+9Cl79wT7w3RGyAoyaTI4rykIgcGDR5E5VKWlrwxWUuNOaL0qiKC6EHq/c2QGqPTv51Gb+CExr1RF32IvP1qvfC1bBufVjmzJdcoo5A5u+9wU2kVQihypbnHk9nwojKJc53U5dPk1bIkrCY0xDedpPvMJFjZGJQ1iS+7C0PMRre+WV54tJouWpUjASQmpDZuPIEQLrMsS2rXRrOoJHXQ1R+8LCqU+aLo7+m5s78go2FWqq21Z5pExgLZ9QE/VKuYeuLdPs1U8QprIzitX7XaxVSz11Z1paMGe7Zd/8K49i37aoVzIunItY0U9a3D1a5OOd+tjpgzDvmdjXL88XF9GHwMUwLInj1MIDO90SXk5LS6/53BAcIb12uP+F+YWObXfpy62K3uKWzDVoYf/ly02yRpS/IV4+PI7J9wfZ93uq4vC89Y1kPiGITGmiMEDEHbqbm798ByRfo4aH/W+30qpglOaRjC2kkVYMKuFlLHwXA5uF1EMmdpVfI863AgCWOFXwrLzB3+8+BrsFAH6R4sgqvxX4TMfpqcQ212BtWHkhnDpGA88h7xGolLcB5Vpum7wezC6VNUe1Js//f8VKCE1/uo6GBVOJDgB7VEIS0EHdrxB5A8RRrwe4BiijLzHWRUOSAfmr+JTAC5YHzWtlNg/IbFVH9V4QwURGVGBjh5rXU8ErejmTOdKo091mYLzXSvgFtGsJN589Xag==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199018)(55016003)(38100700002)(38070700005)(2906002)(83380400001)(71200400001)(478600001)(9686003)(186003)(33656002)(86362001)(7696005)(316002)(66556008)(66476007)(66446008)(64756008)(8676002)(66946007)(4326008)(6916009)(76116006)(52536014)(8936002)(55236004)(53546011)(26005)(6506007)(5660300002)(122000001)(41300700001)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dGdwVm9pcWkzdjlvdkZLblBTWW44cUNQUTdhKzdMN25RRCtlVmoxdExBYVBo?=
 =?utf-8?B?a1J5d3lXUVVoM2x6LzV5WnptUVpCNy9yQXV4OXpiTm45cHVvNGdPaTRzTGFP?=
 =?utf-8?B?WDkwcktjVjFBeVFLaEZUbjhCVmREQnFVODJuTFplUng3R1cyOWtjb0NSeS8w?=
 =?utf-8?B?WlVsRGZTR2tiTFdFZHhMQzhVZmsrZEFZblFmQURRMmtwUGN1TXlKZzZLYUN1?=
 =?utf-8?B?YTU5ZHl0a3U5QXowdWRoQ05BYWFwdm5ocjNVT2VWeDFOT0FJRFFwQU92WTMr?=
 =?utf-8?B?T0hVWmkyZkU3TExhL3JmWTliSzBvVDl2NjBicVNJUjBuay9FZUl0Z1BKT3lW?=
 =?utf-8?B?bEtYWGt6Y2dINUlGMTNBT3AyN0pqN0owTUxUc1RYRDZISFYvOUMxUjcyTXVI?=
 =?utf-8?B?YTM0eFZGb2dHcUpJMk9hejEzQU1tckxtcHlqcHM4QzVJVDd3SEp5NlVkQmR1?=
 =?utf-8?B?bStxQVhWN3RLRnVDUmVZa0JCQmlyNWxnaHQ2eGJXTTNvNFVSb21yZmhxNWUz?=
 =?utf-8?B?TzFUb0IzekY1RVdMc2RCWXdHOU5XdWhCRk5pTTJTTTNJTFFwRkVMQmF2YXVE?=
 =?utf-8?B?U0lFVzZUZkEvT3gyb3RpbUt1c1VmTElnM0JGNkZsM2Ric0h5c1h1OFc4R2JQ?=
 =?utf-8?B?WW1iaFBkVzhZL1AxOG1ocFR6NTVFc2NUem8rZVBiVndKRGFrTFZFTWRqenlT?=
 =?utf-8?B?aGhQamw3QUtuS1R5VjJ1TUZwWFBZRXRzdHZBMVhYMEtsaGQ1MG4xbERSTTlp?=
 =?utf-8?B?d21WWmdpanVkMEIrd1dhZE52L2NBTThKKyt3d0t5bE93ZG40TzBXVUtaVzJU?=
 =?utf-8?B?cmJhM2QvLzV2WmVBN09KWnk4emRJdmJCMHVtZ0hGdjFlUU51dERncHpaT2ZH?=
 =?utf-8?B?aXdSc2lYUWNHN0huN0ZiVjBqNGVZTGV0ZjZaMzJDS3hpbzgrcnlHdzZpckFE?=
 =?utf-8?B?TGR2TXhMTFl6cUw3ZDRNWXJDdVI3Rmd6a2VIQ3RMVjhXRkM0WE1raHRCcGRk?=
 =?utf-8?B?M1d2Mm5ORmRPc1Z2cFBhcHRyU2hSeUhDZjQ1TWZtd21wNzd1MkZ3bjI1b3ZB?=
 =?utf-8?B?Z1B4dUYvRkF0ZGN0ekpBMC9kL2hVT3Q2S3lyU3MwSVZESWlGTjgwaHZLeXNY?=
 =?utf-8?B?RHB4ejh6QmFwR0NuZDVMdE5ScWZZSXRYYkpqWk43VWI0WVZUTVArNS9Vbkpz?=
 =?utf-8?B?V2NwZExYQzd4ckN2MlVqbDl3UmlVZGZPQWlybWovZmFxVW5xYjhpWlorNGVB?=
 =?utf-8?B?NVVHc3N5OWtxVytGZExBNzR0WEZQUzFpbW0xT2FUQ2V2TkZVcisyUC9jTzJr?=
 =?utf-8?B?dDV4Q2k2eUdCdURreCtQdWRCc3FSWTd1OFJMVm9PNjZhWmE3SFNnOUFGOXhi?=
 =?utf-8?B?UktlRnRqWExsaExDK0JLcHg0TXcwWE5NOHI1L20xMzVwQklsS240TmhKNHBx?=
 =?utf-8?B?ZklFS3p2aUh2d2ZYVktkN1p1VDl3ZmlFaXU3MmhFS29Xb2k4dVRsWEpCZEJY?=
 =?utf-8?B?YmltSGl4UEpsSGJzMVA3RytRaDlZbnhla1N4MVdHc2tNVUFOS0paWWFXcDZI?=
 =?utf-8?B?TC9EQm85T2c3NTFrM0pvTXRnVVM4Smd1eE9BZXY5UlRSQ1d0bEp6alR1K2dC?=
 =?utf-8?B?S3crY2FaY2ZoUGRuOWFWS21CQVQvK2ZzYU4rQVBsQkJIUFhrYzZHdFRWRXQy?=
 =?utf-8?B?cDR4MythZ09YbG01WlppbnZ4b1NvdWtpNHQ2SXk5OWZ2TWlXL01FMExSVkFp?=
 =?utf-8?B?Tkcxa2NkbGpDRWkxVkRnZDZTZW9mbkpROUNvVnF1b2RWZE1LVVRtTzNUdmpH?=
 =?utf-8?B?YmJpajZzNnZlQ2pkRzZFTkpRV2lEWjIxakI4WjZoekxYQjFhazhsRDBaZ2Nz?=
 =?utf-8?B?YWlwaE14MVcwQWJ0YlVhTEZiNmIwdnRKQktIMHVwSU5kenhJa2F5QUVVNjUy?=
 =?utf-8?B?bUtNOWYrUGhHOHIrbVdNWCs3YUlDM1h3NCswY0lOY2E2cG9OSjczVUR2WFJU?=
 =?utf-8?B?elBjMDJ5N1dtc1phbGNQY3N4K2Q3amNrV092NEY1eUU1ZC9YaTBmdWtaRG9u?=
 =?utf-8?B?eUZMczhXQjIwZ1doYTUyc0ZHMlVscTByR0FIQ01mU05sTTdkMzVYcXQ1WUFE?=
 =?utf-8?Q?0egNQuCy3bQfUEQfTlWNR7CSl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3173724a-99c5-4227-52e4-08db2b949db7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 11:49:10.3745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XtzWVBdevmV7sZ+3Ll6PmscHFdhPtILVmeoBnRfOR4rjOPZ10Nu93XPx5P4+xYj+03Vi96h3oYEQRUMojPLL/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 11:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178979

SGkgUmljaGFyZCwNCg0KSSBoYXZlIHZlcmlmaWVkIHRoYXQgaXQgZmFpbHMgdGhlIHJlcHJvZHVj
ZXIgYWxzbyBvbiBtYXN0ZXIgKHBva3k6IDIzMjEyYzhjNDQgKEhFQUQsIG1pcnJvci9tYXN0ZXIp
IHJwbTogZml4IFJQTV9FVENDT05GSUdESVIgdmFsdWUgaW4gU0RLKQ0KDQpJIGRvbid0IHRoaW5r
IGl0IGhpZGVzIGFueXRoaW5nLg0KVGhlIGNvbnRlbnQgb2YgJHtTfSBpcyBjb21wbGV0ZWx5IGly
cmVsZXZhbnQgZm9yIHRoZSB0YXNrIGV4Y2VwdCB0aGF0IGl0IGlzIHVzZWQgdG8gY3JlYXRlIHBh
dGhzIHRvIGZpbGVzIGJhc2VkIG9uICIke1N9Ly4uIi4NCg0KQmVzdCBSZWdhcmRzLA0KICBQZXRl
cg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IA0KU2VudDogVGh1cnNkYXksIE1hcmNo
IDIzLCAyMDIzIDEyOjQwDQpUbzogTWFya28sIFBldGVyIChBRFYgRCBFVSBTSyBCRlMxKSA8UGV0
ZXIuTWFya29Ac2llbWVucy5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW21hc3Rlcl1bbGFuZ2RhbGVdW2tpcmtzdG9u
ZV1bUEFUQ0hdIGdjYy1zaGFyZWQtc291cmNlOiBlbnN1cmUgdGhhdCBTIGV4aXN0cyBpbiBkb19k
ZXBsb3lfc291cmNlX2RhdGVfZXBvY2gNCg0KPiBPbiBUaHUsIDIwMjMtMDMtMjMgYXQgMTI6MDEg
KzAxMDAsIFBldGVyIE1hcmtvIHdyb3RlOg0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5t
YXJrb0BzaWVtZW5zLmNvbT4NCj4gPiANCj4gPiBUaGlzIGluY2x1ZGUgb3ZlcnJpZGVzIGRvX2Rl
cGxveV9zb3VyY2VfZGF0ZV9lcG9jaCBmdW5jdGlvbiBhbmQgaXMgDQo+ID4gYWRkaXRpb25hbGx5
IHJlZmVyZW5jaW5nICR7U30uDQo+ID4gSWYgJHtTfSBkb2VzIG5vdCBleGlzdCB5ZXQsIHRoZSBm
dW5jdGlvbiB3aWxsIGZhaWwgYmVjYXVzZSBpdCBjYW5ub3QgDQo+ID4gZXZhbHVhdGUgcGF0aCAu
LiBmcm9tIG5vbi1leGlzdGluZyBkaXJlY3RvcnkuDQo+ID4gDQo+ID4gUmVwcm9kdWNlciAodmVy
aWZpZWQgaW4ga2lya3N0b25lKToNCj4gPiAgIGJpdGJha2UgZ2NjIC1jIGRlcGxveV9zb3VyY2Vf
ZGF0ZV9lcG9jaA0KPiA+ICAgYml0YmFrZSBnY2MgLWMgY2xlYW5zc3RhdGUNCj4gPiAgIHJtIC1y
ZiBidWlsZC90bXANCj4gPiAgIGJpdGJha2UgZ2NjIC1jIGRlcGxveV9zb3VyY2VfZGF0ZV9lcG9j
aA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVt
ZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mtc2hh
cmVkLXNvdXJjZS5pbmMgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLXNo
YXJlZC1zb3VyY2UuaW5jIA0KPiA+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mtc2hh
cmVkLXNvdXJjZS5pbmMNCj4gPiBpbmRleCBjZDJlMzQxMDk5Li43Yzg0ZWEwODhkIDEwMDY0NA0K
PiA+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLXNoYXJlZC1zb3VyY2UuaW5j
DQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mtc2hhcmVkLXNvdXJjZS5p
bmMNCj4gPiBAQCAtMTAsNiArMTAsNyBAQCBTUkNfVVJJID0gIiINCj4gPiAgZG9fY29uZmlndXJl
W2RlcGVuZHNdICs9ICJnY2Mtc291cmNlLSR7UFZ9OmRvX3ByZWNvbmZpZ3VyZSINCj4gPiAgZG9f
cG9wdWxhdGVfbGljW2RlcGVuZHNdICs9ICJnY2Mtc291cmNlLSR7UFZ9OmRvX3VucGFjayINCj4g
PiAgZG9fZGVwbG95X3NvdXJjZV9kYXRlX2Vwb2NoW2RlcGVuZHNdICs9ICJnY2Mtc291cmNlLSR7
UFZ9OmRvX2RlcGxveV9zb3VyY2VfZGF0ZV9lcG9jaCINCj4gPiArZG9fZGVwbG95X3NvdXJjZV9k
YXRlX2Vwb2NoW2RpcnNdICs9ICIke1N9Ig0KPiA+ICANCj4gPiAgIyBDb3B5IHRoZSBTREUgZnJv
bSB0aGUgc2hhcmVkIHdvcmtkaXIgdG8gdGhlIHJlY2lwZSB3b3JrZGlyICANCj4gPiBkb19kZXBs
b3lfc291cmNlX2RhdGVfZXBvY2ggKCkgew0KPg0KPiBJIGhhdmUgYSBzdXNwaWNpb24gdGhpcyB3
YXMgZml4ZWQgZGlmZmVyZW50bHkgaW4gbWFzdGVyLg0KPg0KPiBUaGUgZml4IGxvb2tzIGluY29y
cmVjdCBzaW5jZSBpdCB3aWxsIGp1c3QgbWFrZSB0aGUgZGlyZWN0b3J5IGV4aXN0LCB3aGljaCB3
aWxsIGhpZGUgdGhlIGVycm9yIGJ1dCB3b24ndCBmaXggd2hhdGV2ZXIgdGhlIHJhY2UgaXMgY2F1
c2luZyB0aGUgdW5kZXJseWluZyBkZXRlcm1pbmlzbSBwcm9ibGVtLg0KPg0KPiBDYW4geW91IGNv
bmZpcm0gdGhlIHByb2JsZW0gZXhpc3RzIG9uIG1hc3RlciB0byBzdGFydCB3aXRoIHBsZWFzZT8N
Cj4gPg0KPiBDaGVlcnMsDQo+DQo+IFJpY2hhcmQNCg0KDQoNCg==

