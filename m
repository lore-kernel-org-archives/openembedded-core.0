Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D38C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 12:27:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web10.71130.1679574424174817647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 05:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=K5N33pfJ;
 spf=pass (domain: siemens.com, ip: 40.107.20.59, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKJHyszBSTZa1e48MZQFgY+A1s9dG0xN/Och/pIve+yFgPlcP29H1drlYnhv+kRjsb68ev7pD6h5oCp5f1zGpsRxxjQPKKC8RbbgpE2T/qvaf/XjBeLNQnpADkLVFLSMzwbmzQ7ZRUbPwsT2PB+NWpJnYl1HrIq1TNL+xcBEbVA+49kLkds9yvFpjD7heyHoGcNKhYuO4egA/fZbAi7lSTwOdrKCRrZJSR0KuwkbxuWKQZ77rKzxL+LXqfY/4mNRnG9hiI908Gocy2V6g72OsMBdl49fmdBrSaRgj/+CreSgXMsLvszY3gw+Pe0Q0w85+qk0V7N/qt8mGjFs8InXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXtj+x7h0nmTb/w8bLWU0+C20uGY88E+yHLZ7C7eKlc=;
 b=jMFWDERMm4mcPKEVpNfQ6Q8q3PwUo9fI+GXrVUKiA1Q88KANFfL3baye7/pa7V6TgYvt1jWlapElstWzbtvIgXZwIfKhuNQaWC42m6F84MvaBZIxFV8AJgkOkqoUnxgDZ0ORKJTPAAKoAwYqwcfaptN8zri57tEJv2Tp8HeIfKBWb/cu5DynQj084BmkZUU0mFR6QKx7L5MRNgUq1BtC2CUhEBMpkiG5ZHb0EzpEWtn0Po85gTkIY1hC36SLC//hthP8pVRLigDr5tCko7mhgHIu+EmQNVKLMHsKnHPXIdTSNTiA8ZVBClvN53fxnEdcTcIPUzasgvexqiPoJFJwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXtj+x7h0nmTb/w8bLWU0+C20uGY88E+yHLZ7C7eKlc=;
 b=K5N33pfJbq6b7DzIeahDAed4MTf9yF18ZwQibvtTtk5NJsrdnlGloVrOrCSURB0m4nLaGcaW+FuWpSVmgYu2vZoN/I/EiNJbqRz8v4CaTQougcx3+hfL8SsbRz+0a3HAb3XwriuCsmCrmM5B0W70nIYaCpq5eBVdEFq4GfK0ffGQTZnkSwXeqs6sAZPWNXPGhPM+o9RxldKtM321VISzX3GxXte73u/VKBpHPHkzt80YinIEa1C7vAiWaErcZ2eQlL5l2k2JNR0TUoFnx5tRHXNel+BdgFWF3Gia/Gfu32SXC0iMfb3tbPUNqCC6Cq6uT8UiH/fP74ERIOejNZ5fiw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PR3PR10MB3948.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.8; Thu, 23 Mar
 2023 12:27:01 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006%7]) with mapi id 15.20.6222.008; Thu, 23 Mar 2023
 12:27:01 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][master][langdale][kirkstone][PATCH] gcc-shared-source:
 ensure that S exists in do_deploy_source_date_epoch
Thread-Topic: [OE-core][master][langdale][kirkstone][PATCH] gcc-shared-source:
 ensure that S exists in do_deploy_source_date_epoch
Thread-Index: AQHZXXb+4qjT9DaV70e0IXo3pT15Aq8IPZAAgAABojCAAAN0AIAAASAAgAAGZdA=
Date: Thu, 23 Mar 2023 12:27:01 +0000
Message-ID: 
 <AS1PR10MB56970634F4CCF1755C6682ACFD879@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230323110146.243968-1-peter.marko@siemens.com>
	 <a8d4855315c091bde32979f928885320c1b5b3dd.camel@linuxfoundation.org>
	 <174F09F9DA2ECC9A.19937@lists.openembedded.org>
	 <AS1PR10MB569705403F56BA43CA730619FD879@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <f7d2ef262419b2328adccf0cac83ff42a975a4c8.camel@linuxfoundation.org>
In-Reply-To: 
 <f7d2ef262419b2328adccf0cac83ff42a975a4c8.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-03-23T12:27:00Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c02287d4-93dd-4839-84b0-1a9d446bd22a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PR3PR10MB3948:EE_
x-ms-office365-filtering-correlation-id: b0227b61-97f5-4a70-3432-08db2b99e761
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QVnTpHiTM846GSAJXanYOCey+BwAqT0OBW9JZCAp25iAq0Y6HDruF61ozsyIgiddpkCmvJr8pQqAn2R+Bx7XsZXaTNcWt1oOFK6YA1chAgYXsEeqy2LFWVZCBz+naSvFDYddpgOXUCMIOEb2Fxb3Z+tKS8J9mDoBSHBZ+5o8y3D+KfrQLYqqKqldPYNQ2b7DTcORJZWFnFBkRrzWUQDFY82ewnp/h78i62FcOmQc3k35FpynzMsO5VBMf40QlSh6g6YumLpVtwiCXI0aRzu6o0tp23SFfFpd8kcDtJmRiuvdPQWtRf8EoWAwggf1I+ui7CxvXI8yU91CDNWm3VfUz/215dxQbbrs2CXeQ5pPTFM/kiLNsGHpSbRKIHvR8N6S08jQmIpnbJXXdbVFETyTB+RhRC/0xS6ThMfrcd7MW7RbutQ8Aw+Crbqhux788uV9dNmSiok59X+XMKgWLRjGhRNdYV2Id2ukcxmUfSM6717pRUUjuDfKSoX9SdvvtHS9ocbMpm0fuf8Op5iyUHygC7SR/xL7t6EcLwiBkJDPkmD9oYNEASaeRt6Sf9XRsA9+TvwyvDETdl3PfhQXWLwXC3p2qqrUN+ZNa0KnzshgPkFFDDu0wjeCoghcJc6T2v2MmqrNi0sj0Bm7b2+IMeMSt7puWdz+E4DN+qDdUxZp6zVaz8kDRrxQysd/6Ah+AXRp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199018)(2906002)(83380400001)(33656002)(82960400001)(86362001)(55016003)(38070700005)(38100700002)(122000001)(4326008)(6916009)(8676002)(5660300002)(41300700001)(66946007)(64756008)(66446008)(66476007)(66556008)(76116006)(52536014)(8936002)(4744005)(71200400001)(55236004)(53546011)(6506007)(9686003)(186003)(478600001)(26005)(316002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WkZCblZhaVQyUjhzNjhFQ0VOalArOHUrK0dQTzcxcFp4b202N2RlTE9KcEtn?=
 =?utf-8?B?dEh2amo0WlN0cGxGV245YVFUZm02blNuMFVBUHlnMUpIVTBKWXdqMHQxSnZ6?=
 =?utf-8?B?WEwwTUFEWEZDRkh0VVBrT3ppTW56L1ZGc0FrQUYxcUpONFZxWjRxM3kwNk9p?=
 =?utf-8?B?N3MzUFhRWFBGcm45bzg3RkVyU0dLYmlTejJaaStPTkxmbXdkQ2trZ1BoT0ho?=
 =?utf-8?B?SlJDa3I2N2orT2pKQmt4eTlQUlRlQ3ZsUXlzQXVpN2NlUmFEaGgveHJFUnkz?=
 =?utf-8?B?N2JZVWhhSzZOZzdOTURQZXhxMHZBT2YxbGJqNUNpbExhbTltMzhLeFYrZ1po?=
 =?utf-8?B?Sk9ndnFHblZEQzBWODZTK1FHVkdlSHpGSTFIS1pIbnQ2OE95dnA0bGp5Q3JW?=
 =?utf-8?B?akZ3K1ZxZmJTTmFkSHh6bURqNDhTaWVrMVRZU2pvS2l3T0psMGh6di96VGE5?=
 =?utf-8?B?bFA5QVRrYjZudGlIZ0pkOC8xdTVjVDhsNUpjZXpSREVvQW9sYzZva2lzbWJu?=
 =?utf-8?B?ZGZzRnY2cDNMRXBjc0FmUDhuOFVlMjJFQmdLdGhQQ1JTS2pmeEQxRElnYkt5?=
 =?utf-8?B?VmV5UDg4MlJCR3JNS3g1VGUvQWFFS0Fjb0h3SmZBeURpVEdpK1pCQ0lwUWZ5?=
 =?utf-8?B?M08wT3lra2FYTEg2VWZ6elh6M1I5Q3dkRnlIS2pBN0pLcnVBUndwR1FMb21L?=
 =?utf-8?B?TTcwYXFMVHduOVpqYWJXNnozNDJySlIzNHZsVVplMUd6aUNHT25ZRkdwOGRY?=
 =?utf-8?B?Yzl0Tlg1WllCZ2MyVy9sSWRiSU1wZVJaVTNvRkVlTW4zc0xWaEgzclhVQ3g2?=
 =?utf-8?B?WGkyWEsyQTczcENvLzdCSkFya0RIa1drS25PazdUZzVZc0lIc3ZuYVdncnhD?=
 =?utf-8?B?cmhCSTlZUkFxM1d5OGJuOTIzTG8yNmsrcTAyd2lQazNMNGZsZThrMi9TNm5F?=
 =?utf-8?B?VWk3d2pmSHgvdUNrVVpXeEJvemovbGxDVVZmQTIvd1ZRN2FxMUViUmtUYWtF?=
 =?utf-8?B?WTd6UFVQcVh3ZWwxZTh0ZWlDVkZ2UG5naWJVRjZlVlljckJyTDNTektQN0h3?=
 =?utf-8?B?MUorajJUQ0tGQlo4aFR4ajVqREZ0azVTb20yY0Y5YnQ3U3EybEZ4aHJhcE53?=
 =?utf-8?B?WTVyaTE3MmRESkV3c0l0U0JWUnpBQWYwdnlPcHJTZXMvY1huUnp3OXZmeTNm?=
 =?utf-8?B?dGxsd0tqKzFSNHpra0ZuM0pMSlVLLzlGUnByRlk3clZIZHFPTDl4SU51YVVK?=
 =?utf-8?B?RnFndHRRV3k0VUZvTGY5bGtrdnQ2czAxM2JWZEhSeTRnODEwQ3VtWklkeDA0?=
 =?utf-8?B?WUE4Mm1iY2gzWU05Z1Fvc2xNTVI2OHVpUG5LVkZDV0pUcHQrZmtrWkQ4ekJ0?=
 =?utf-8?B?YXlwbHMvK1lWbXk2cXNwdG03NDRqcUhTbFdiMDJPRzlwYVk5Sk5yNWI4RVRU?=
 =?utf-8?B?VVZyeWRxN3BSREY1MktMTW8zQnNLa0pBSjRxVmU3aGpTY2RFRmhNNFZ1L3lk?=
 =?utf-8?B?dzJqc1orcVRmd0dXTGhxbFV2RHBDQmpIb0pka05STm0xem5IZWpoREJCb1NX?=
 =?utf-8?B?ZVdtZ3BPOFk3OVN2VCt5WXR1Y290WHBJUnhTYmFxTXFHeVJSZXhFeUpoUVd5?=
 =?utf-8?B?ckpzKzdvWlpSbGNqSGN6VWVZd3JQbTBjTnFZMEttVUJJSVVjbVcxdFlCMThZ?=
 =?utf-8?B?NDlPaG9XcGhUTWg0dldhdzJDcHpwVzQ3NW00c213SndCK0pEWXdLTzIzVG9E?=
 =?utf-8?B?cWdpV1MzKzFNNjJBdXZramRlVW94SDZnNVUwemh3UU5OWHFHektyWHl0SExM?=
 =?utf-8?B?RDJQd01PQlo5LzdHc1BNZVdZUERaUTFlTmZGenFGQ2J6Qm5xY3I0T01vYWJh?=
 =?utf-8?B?c3QyMllKYUVHMFZxclFOTDNIWHdJM1MwZWphMFRabWxCdGl4ZWs4RXZudHA0?=
 =?utf-8?B?NUhrdW56WFhmS2RuQ2I3emxSdzA0S3BRVnlQa20rMDdlZFB1b2NXaHUwTStj?=
 =?utf-8?B?VDlnUEVtNVZXNi9WMUVDTTlFZS8zTmZHdzhCUlFUUTd2K21TSExFT0FZZXp4?=
 =?utf-8?B?UXhzQlJ4aVZKdnZ2cEY0MWlGd3U4UldwVG8wNkdlY3JaNFhvazJINGFwaWhC?=
 =?utf-8?Q?vawUO0EAwGSOkGNqDcoHJhrbK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b0227b61-97f5-4a70-3432-08db2b99e761
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 12:27:01.4627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfmRUV5CvQ7gpcalkaYfAoQafZMhHXcdcw3Sx2Bqdp3mSta7dENKpyVttei9Q8YirlbCpjpVezf3TYYxlkwaVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3948
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 12:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178983

SSBoYXZlIHNlbnQgb3V0IHRoZSBhbHRlcm5hdGl2ZSBpbXBsZW1lbnRhdGlvbi4NCg0KVGhhbmtz
IGZvciB5b3VyIGhpbnRzLg0KICBQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPiANCj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDIzLCAyMDIzIDEzOjAzDQo+IFRvOiBNYXJr
bywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4NCj4g
Q2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXVttYXN0ZXJdW2xhbmdkYWxlXVtraXJrc3RvbmVdW1BBVENIXSBnY2Mtc2hh
cmVkLXNvdXJjZTogZW5zdXJlIHRoYXQgUyBleGlzdHMgaW4gZG9fZGVwbG95X3NvdXJjZV9kYXRl
X2Vwb2NoDQo+DQo+IE9uIFRodSwgMjAyMy0wMy0yMyBhdCAxMTo1OSArMDAwMCwgTWFya28sIFBl
dGVyIHdyb3RlOg0KPiA+IFdvdWxkIHRoaXMgYmUgbW9yZSBhY2NlcHRhYmxlIGNoYW5nZT8NCj4g
PiANCj4gPiAtICAgICAgIGNwIC1wICR7U30vLi4vJHNkZV9maWxlICR7U0RFX0RFUExPWURJUn0N
Cj4gPiAtICAgICAgIGNwIC1wICR7U30vLi4vJHNkZV9maWxlICR7U0RFX0ZJTEV9DQo+ID4gKyAg
ICAgICBjcCAtcCAkKGRpcm5hbWUgJHtTfSkvJHNkZV9maWxlICR7U0RFX0RFUExPWURJUn0NCj4g
PiArICAgICAgIGNwIC1wICQoZGlybmFtZSAke1N9KS8kc2RlX2ZpbGUgJHtTREVfRklMRX0NCj4N
Cj4gWWVzLCB0aGF0IG1ha2VzIGl0IGNsZWFyZXIgd2hhdCB3YXMgZ29pbmcgb24uDQo+DQo+IFdl
IGRpZCBoYXZlIGEgZGlmZmVyZW50IGJ1ZyBpbiB0aGlzIGFyZWEgd2hpY2ggSSB0aG91Z2h0IHRo
aXMgd2FzIHBlcmhhcHMgcmVsYXRlZCB0byBidXQgaXQgZG9lcyBzb3VuZCBsaWtlIGEgZGlmZmVy
ZW50IGlzc3VlLg0KPg0KPiBDaGVlcnMsDQo+DQo+IFJpY2hhcmQNCg==

