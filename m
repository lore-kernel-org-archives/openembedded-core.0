Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DBDC19F2B
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 21:19:23 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.41])
 by mx.groups.io with SMTP id smtpd.web12.21.1659561555502366381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 14:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=rYp9VH4r;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: agilent.com, ip: 40.107.236.41,
 mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAECi5gYPFXYMtjq5Hx0eCfWHJJhsx+1YLRc7u2gozfRU5w4eZIaChTj8Gpn5mfudviLJMj+SIK9/T/vC88c+xaCNyHdQXC4R31d+0DJZsX3pJtL4NEGrIvmKKRjw9pCLyu83Gy0IUggMTmZCYPdGhM63JOg0LPtjQw3dgtr9ExDEqP8z+SIZBTnWy5HyTpTNfQO5RXYgPEQ8Sp+aDfPcsYI6ibs9o9hKKZqm1XqjVLsk4wlvVbb9lMvjFdAjMF3wUoDdiSaax6y+aE1aN/3nzIUIsllLVl8nSxNlF39/iMOQgdkFyCf2bM0neVa4xh3XspNqYARFAw3Rm29f6WIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4jtcUKGyx+dWgix4K6lnnKeob0urP0R7GEW/66qPgQ=;
 b=E951XnA+sKRMd4pRhiEzkF4ZmIFZn2uBgKbuYLAZFjeYQAohBxPBHz7TRnbMPL1irJ8jEuF3qYyvBdgfKlHC3hbOYnueF0yccfWtX8qo77OhF0L7FVMwGMUE0OHG4HdwHdd1hJjOpmxaBowVs3OEI7xFSJLN2vB2rhOakWoJcIA13zAie0zkvOjINdxLV08SrbtOft+xNXCKgQBjTGUyruBgkiBqfOTAVwFoxlqKG3XKtOyzJFXTbgkX7y//qQK/NNJWFFJTNADCZ/fq9nMPGqRX8zPWpjDecr6NSnSBP2iUKnYVD2ECgN1fVwn5j1gv31DSGmdjhK5AIxBpQ4o5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4jtcUKGyx+dWgix4K6lnnKeob0urP0R7GEW/66qPgQ=;
 b=rYp9VH4rjaRduYFCc5SCatscvndcs9uOfBgDAK6oG2LYwT8EgR2Yg2AC98xqotI+UEL4jUSMUZEAUQFyCYQ0ubs310Jcx/gDZDtLrDaRwzJJmJSigcnys3JJho6lOvSpTnmhODzIa7i86k0tuLunyL8u+4fBZQ6efIhdRD/xjWvHRv01HuHsAgEXrIQCNVXudjWgIxPqeDzlBJe6iuzaI3jjW9q4pDFu9XQB2YVVl5Gpu6FBSboq+eapqf2fC6Ny1GJgoc9Fifeus9puwMxbRrg+D+XqTaWal2pUyIwgjqPK6CIRd64qlhXv8nh1F1oxJ4Mjp5D2G5QaCworcUzH1Q==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 DM4PR12MB5120.namprd12.prod.outlook.com (2603:10b6:5:393::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Wed, 3 Aug 2022 21:19:13 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a588:9ba:3cdb:7324]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a588:9ba:3cdb:7324%3]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 21:19:13 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "Openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [OE-core] Introducing yb - a new tool for Yocto environment
 setup/management
Thread-Topic: [oe] [OE-core] Introducing yb - a new tool for Yocto environment
 setup/management
Thread-Index: AdinQOzDt2w3R+XrRs2owi5G2reWzQAOGaoAAAAKQcAAAR8GgAAAD1jA
Date: Wed, 3 Aug 2022 21:19:13 +0000
Message-ID: 
 <DM8PR12MB543084F29DB1F9824A59036E8B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
 <DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CANNYZj_z_sBEfsHWkNeBwbY5M+rMPowB4wX-ArSzjnM5rkea9A@mail.gmail.com>
 <DM8PR12MB54301DF4A7AADD3F59F00B668B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CANNYZj8udmf43H7baFWXKJQTxV+GjMm+BtoFz_OKepM8vOuUdg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8udmf43H7baFWXKJQTxV+GjMm+BtoFz_OKepM8vOuUdg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ef09a5b-f169-4b4f-0f5b-08da7595d06d
x-ms-traffictypediagnostic: DM4PR12MB5120:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 khWjvic00lRgeeXnkl7VXhXY7XYiQEBekfFzHvNZyyZW6WSrW94B75AwvY7eB++1c0ORh48goktfVReews66CX8IHGp/2wuFoQ4umdS3+mbB+ZZRdD5KaHKvJtAw6jgF2N92Kp+1oSP2PR0qPswEi2on2IDbgaCRS04rWDfBfQRDeorWXzptXbgQgfdE9B1u+oBU8rWabIVYInTL1oyoyWkYWoRsWwg9QsEjhi4drlGStZBdU+MEUK9MSnml7UFnY5amvB7JWaTMDy+oJPM5ZmlMc/ibaNOnNiJ3vJ/hpXYLlQYeVohJ9mqyzmtdeB21po59O+eAHSxZP+mh/nPr7L5wCjKQHwgqeWI5RgKOPnat7JQ+TB9LkNi1CznYbxQOnuf+TD6L7OnCCoh+P4lGr9gXc+sFSY2wV1YzTjkFOrP3/epL9jgUqNgy+sR2O369nM4friu8ytRYxwYr6PFfHIgqic2tbNDraSs7+hucneGwTPnssIzsAbm0h82s9gnBgXjlSkyZlPO8YhAOZj3tnx38REqT0XsaEhG5zFypEEdPkUt6Oo4F+ZwspltQEooNeUJH2kcy4jmqE0SiQDnAhOHl+BsbdOvWcWb9L0KkGIET+DCaGWlVLmjZRWrkOnes0xDTCoOCkeCQaFhIQ1Be8tNQILt0TkZ3sV628euJaSOnLm/+AQS2ea5fKRY5f9TI7emfu06A1Npf5O9pcSLQW1xFzNhcgF+t4ItyPQchUPh2WO1F35LeL2i5r2dCVytxM5Apg76bevml0QHlplB2GUQuHnMpDCSxhZdFki97tR4w6rRbcbJkz5EXhjpR+6MN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(29502001)(55016003)(316002)(66946007)(38100700002)(2906002)(122000001)(9686003)(38070700005)(26005)(41300700001)(86362001)(6506007)(8676002)(54906003)(186003)(4744005)(52536014)(71200400001)(8936002)(478600001)(6916009)(5660300002)(7696005)(66446008)(76116006)(33656002)(4326008)(64756008)(66556008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZFZ6VTI0SUNlYjJVWG4yNjAzcjFERExyb25CK1BRWkZiNHZ5SnFWbFBtV1RI?=
 =?utf-8?B?Mnh4ZE5RVFNURjZEVDJWMVluanZPK2puVmJJdzMwSXZ0SHVacDVRS1FzUkFK?=
 =?utf-8?B?RnNDeUQ4SUk2Z0dZdTBVQUxReStjYldFRHRISFVWaWx3eTRTaFFiQTVSMnVE?=
 =?utf-8?B?Q0N4UkRwUCtmN1ZXU0NpOTM1YlVmcDdiY1RGK1pBWVJCZW9saE1HNTZxWkQw?=
 =?utf-8?B?dG1HQW1mU0sxSC92Z0ZxbGtBSWdrVXJMbEJ6RFJ5OGQ0ZVZtd1lFM2QyU09E?=
 =?utf-8?B?ekpTZC96dCsxQkNwK01uaVY1STNnMUxVWnlhaTAvOTFzMmg3eGtTZnQzLzJE?=
 =?utf-8?B?WFM5SXpaOXRlOTQ2VUZkeXV2a0xOQklwQW9UZEViMU9ENUh6UGJpcFdqQm5x?=
 =?utf-8?B?VEJ2bWhmTGxla2t6dDR4YlM4YXE1eG45cVh2SHFjQytoUWVYaEJCZEdxdFBG?=
 =?utf-8?B?dWtxbG83aHI5OEYrLzZjZktvM2FNbC9FN1BPT0hMUDRiR2RLdnJ5UjU5bi9W?=
 =?utf-8?B?S0IrSGwyRU5Nci9pY1NFaENYRVpjRGJ6WEtpRlpqZFZzYVdHK3BJbERINlBT?=
 =?utf-8?B?czJwZ1VTRWhTT0o1MTU3L2QzVlpQdFBnQ093ejdOcytSd1RpRjJIMEd6M0xB?=
 =?utf-8?B?YTUzMnJoU1NFK2J3TG8xYnR0eFBMZ0FESkNNUkxxdWJHakFwWTlwd0VsT04y?=
 =?utf-8?B?cm5jYWRzWG53Szlab2gzL1JPclVUUzA3eHhOYTcwMDMrKyt3K1Y5VHY3UDF0?=
 =?utf-8?B?K3VFR0w2QnBTeUxaei9HRnAvQkRSSWVHTFgvOE1uc3ptZEpiNEk1UGxvVlNo?=
 =?utf-8?B?ekVZY0Q1ZGEraUVzNnBYbmN1bnhGcnorRUx3YzltVUNVUk5BNWxSYkJQWDE4?=
 =?utf-8?B?V0JCRWNLQnZudGoydm9panNpc0swa1gyeHVoU0VjZ0ZOcTdUd2J4aDB2alVW?=
 =?utf-8?B?ZklJR3NrTVdFMk5TK05oMVJMWHU2cDNvSm8xZ2x5NDZtMm9qOFdIcjlXVEdn?=
 =?utf-8?B?RGZMcmtWTkh5TGxySmhjTDVmMGJWZUZEMk1rMjR5eFd3TFhlNkhIVC91WGdy?=
 =?utf-8?B?YmUwaFJzd1lyNFBpZmJIZmFhMzI0QllFckQ0K2RSckl5SDRtRERvZkhEYTh5?=
 =?utf-8?B?UWZvVlVBWFF5akphQWpIYnlUTEY5MjFjWDBxUnN0WjJzRTgzWktHYitzQUdD?=
 =?utf-8?B?V040ZlNjaEROVFVmK01HVnAyYnR6OVB2RkFxYzZ1SWp0SWpwUjNvMFNFajFj?=
 =?utf-8?B?SFoyWVcxUFp5enVpSFNucXU2SUZpWFhhMzRZWWZxbVNDOVY5VlQvQ2VSbWRS?=
 =?utf-8?B?NVIvYU1wRDZHcTNLbHNja1dTdDZLSEwzeWUzZVl0WVYvZTlRZHhqdVE1MWxK?=
 =?utf-8?B?cy9UZWpVSWdkeWRTZGg1WUxoVjlCT1FlcDF1SUh5eTdQQWV4WC8rWjcraEhs?=
 =?utf-8?B?UUJNQXVCbTY1OUpKWjYyMGRPcjQvVmNHUkQ0VjZlWmlBS0NVUWtueHZkSzVS?=
 =?utf-8?B?WFR3T05ESGpuSktFK3VCV2VvSlJZZVlGdVovS2RWZ0lPRDhDWWJwL2JzOUtJ?=
 =?utf-8?B?R3UydHRiaEIyQUhKNlhic3IyVndqcytjSTVRVWlyMGFDVGJJT3p2aUIxOTUz?=
 =?utf-8?B?YWxsOVhrckRuUnpwVzErREJwNVFzd2tWL1cxeU1BWHNOaTh6ZERsdndZRi9K?=
 =?utf-8?B?U282cTNVNHVKRkxmWVpLSmc2WTNnYTM3M2hOWndGVWJQMWZPSFZOcnNmWEd2?=
 =?utf-8?B?L05oOER4SVJLL0RFRFFJWU11cGdRdjdlQUpXYkkyNm5TYVpOVldIcUlhK3JY?=
 =?utf-8?B?ZmlDa3lyOXBza3Vxd1NyTHc1d3JDc0VwVmZnK1ZZVTR1U3dXbXY2bjJrejFx?=
 =?utf-8?B?eGZzTnIzVTFlTHpBQ2RBWklocEVXcmVZUk01UldOTi9zN0JoRU9wNmpURThq?=
 =?utf-8?B?SVlJZldYQ2hLUDlNbFdqVkJFa0VmbkY3cG1lQVRBQTA1N0ZtMUQrZ3ZkUXRQ?=
 =?utf-8?B?SWIrOVZJUmp0djlpTCtVemV6NE02K2JpeXljcmtLcHFFZndCZmtCK1l3MmRS?=
 =?utf-8?B?NWJFYmFYRVREUmQvSHU2UjhQUGdZTXVzR255THFhdlpnaFBzUGZXNlp4ckFZ?=
 =?utf-8?Q?TU6pVXzwmcYSdC4GiKB5Q7NcB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ef09a5b-f169-4b4f-0f5b-08da7595d06d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 21:19:13.3419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 2+bsC2gjyVbyts17hUSF1UN4OKAmM0WKUR2vV3GbuKMhW7sKO4f7qlVSR2ZOXBsJ2kXQEyv1VcOJ10Dsy9Y8fMY9ifI2w8W+u0OzanwwLNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 21:19:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168829

PiBUaGUgYml0YmFrZS1sYXllcnMgY29tbWFuZCBpcyBuZWVkZWQgb25seSB0byBnZW5lcmF0ZSB0
aGUgbGF5ZXIgY29uZmlnIGZpbGUNCj4gKGluIGpzb24gZm9ybWF0KSBvdXQgb2YgYW4gYWxyZWFk
eSBleGlzdGluZyB5b2N0byBzZXR1cC4gSXQgZG9lcyBub3QgcGVyZm9ybQ0KPiB0aGUgYWN0dWFs
IGxheWVyIGZldGNoL3NldHVwIGZyb20gdGhlIGpzb24uIFRoYXQncyB0aGUgZmVhdHVyZSBJIGxp
a2UgdGhlIG1vc3QNCj4gaW4gbXkgcHJvcG9zYWw6IG5vbmUgb2YgdGhlIG90aGVyIHRvb2xzIGJv
b3RzdHJhcCB0aGUgY29uZmlnIGZpbGUgaW4gdGhpcyB3YXksDQo+IHlvdSBuZWVkIHRvIGFsd2F5
cyB3cml0ZSBpdCBieSBoYW5kLg0KPiANCj4gVGhlIGFjdHVhbCBsYXllciBzZXR1cCAodXNpbmcg
dGhlIGpzb24pIGlzIHBlcmZvcm1lZCBieSBhbiBpbmRlcGVuZGVudCwgc2VsZi0NCj4gY29udGFp
bmVkIHB5dGhvbiBzY3JpcHQgKGNvcGllZCBmcm9tIGEgdGVtcGxhdGUgaW4gb2UtY29yZSksIHdo
aWNoIHlvdSBjYW4NCj4gcGxhY2UgYW55d2hlcmUgeW91IHdhbnQgKGUuZy4gaW4gYSBwcm9kdWN0
IGxheWVyIHJlcG8sIG9yIGluIGEgJ2NvbmZpZyBzdHJlYW0NCj4gcmVwbycpLCBhbmQgd2hpY2gg
ZG9lcyBub3QgcmVxdWlyZSBhbiBhY3RpdmUgeW9jdG8gZW52aXJvbm1lbnQgb3IgYSBwb2t5DQo+
IGNoZWNrb3V0LiBUaGUgZXF1aXZhbGFudCBvZiAneWIgc3luYycgd291bGQgYmUgdG8gcHVsbCB0
aGF0IHJlcG8gdG8gZ2V0IGxhdGVzdA0KPiByZXZpc2lvbnMgb2YgdGhlIHNjcmlwdCBhbmQgdGhl
IGpzb24sIHRoZW4gcnVuIHRoZSBzY3JpcHQgcG9pbnRpbmcgdG8gYW4gZXhpc3RpbmcNCj4gY2hl
Y2tvdXQgLSBpdCB3aWxsIHN5bmMgZXZlcnl0aGluZyB0byB0aGUgcmV2aXNpb25zIGluIGpzb24u
DQoNCkFoLCBJIG1pc3VuZGVyc3Rvb2QgeW91ciBhcHByb2FjaCB0aGVuLiBUaGF0IGFsbCBtYWtl
cyBzZW5zZSBhbmQgc291bmRzIHZlcnkgbmljZS4NCg0KQ2hyaXMNCg==

