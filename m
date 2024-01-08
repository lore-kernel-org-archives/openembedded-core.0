Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB4EC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:55:05 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.133])
 by mx.groups.io with SMTP id smtpd.web11.8694.1704725703389174425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 06:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=ENfUmDA9;
 spf=pass (domain: nedap.com, ip: 40.107.105.133, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xx4oKCXjIcGPg9IFxDvuP06GvY09kaONvIfMKDQ+6VkXT7BrtWyOU03gWqLGs10el75tCeoQ7tmh3Vm2vyb4zF0gjBXQn59z+r393s/ImxkufkU/Uv4p7KB6cTK0lihiJfJ9p6Y9m4ywX2PNMCt8YUQgg7LXPFUXwU8mE3KiyAK/bsIy++eoDPOE1MIweg9izaWbSMcX4JwnknqNYmIOEJI/aXhB8Eq7slNocOatea8+eKpLEAfO5AqPTDuDhsnKSSgLY7bEE4beWu9BncCqy638NKCHT8rPsNojwVX/XH9fq/14nYkOBMvBn3L8qR0aoYCpOFd9sFiGURxBzQ9AZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DULA24CtVzDPsX2tFlzEypqHAyuHVIOYRRfN9l0Dnpg=;
 b=YWrGtgmEWJ9zV7KuJAu18ul7i7/N2LU3mVq+eW65KGGL3Fy5o/oTBVyN1qxBQN6xsa+IHtPTxp9SGz/4uxUw3asVp29AurZrHRh8dWmEgAT8kvVHCbkjqA4aNw48W3Rg+vWGDfuUW33iSEwljoobqmMka4ZiJeZQhrd7HJLdT0ZVuHpVmXEvm9aokotrP2jP8oku4WPuzD6PzbTEdLrDWVGV11eAECpGWE4/6M4tSO0Ovj8U89Xfp2KmBH3mic4Bla4trNen3WsuB2F7Y4pg9F3jMXM3rHijbvYwphH31H2jzOqZlbbTGmrX1cB/lqDF8ChB7huiCYSdrGRHDIRAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DULA24CtVzDPsX2tFlzEypqHAyuHVIOYRRfN9l0Dnpg=;
 b=ENfUmDA9yu1xEUwgYTZhm2JJaj85k10GPB0FxxnSZEWy28lBvHa4bxMb3ehrpGak7Pp8x1/44jQxficN+8DPk38xv8NAMy9wbMhM3/BBr713XKKZU7jj5BeilTlqqrEeoQvJZwRtLlaz+uT4vnufh0t7WWVX1M4WQAdEkiwwuQw=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by DB9PR10MB6313.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 14:54:59 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 14:54:59 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Jermain Horsman <jermain.horsman@nedap.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [RFC v3 1/2] bitbake-layers: Add ability to update the reference
 of repositories
Thread-Topic: [RFC v3 1/2] bitbake-layers: Add ability to update the reference
 of repositories
Thread-Index: AQHaQkDbQO4SYF/iqUWX+rPvRqE5OLDP/YqQ
Date: Mon, 8 Jan 2024 14:54:59 +0000
Message-ID: 
 <VI1PR10MB3182B00786B2D333E22A38A9F76B2@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20240108143857.2316-2-jermain.horsman@nedap.com>
 <20240108143857.2316-4-jermain.horsman@nedap.com>
In-Reply-To: <20240108143857.2316-4-jermain.horsman@nedap.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|DB9PR10MB6313:EE_
x-ms-office365-filtering-correlation-id: bf8cd92e-c7a5-4a0b-97ee-08dc1059c91c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5FrkRce4DSO3X+iDpghTPt+7QIvbamG68H/Mo7b1Wr1hIT+aFmxU7m8OmOF+kHof4nTHhTzFzBcZRXr5cxL2JNTXlDwtVwtXEuqbac+cKgCsKQG87vCGxVt2isqnupYAz+BCsFuNcelP+UQgAkagG4UQ6v0qhkv9d5+TS4ep5i1bfSf4CoyLD49iRrEGqbcWcWGGX4Jd2IA+n9jC+VrQ1P/Z9JHvFosp9v8BiIpwo2uyhkKfsd20bwhvH6Er3EGtYrTYy5bz+jlcOHgKBJRiBzI1r/iM3AY1w7ROXLcqp8J9j/QLGnJ9qJ/j7MWzEQdeyFs0XMfuyczptywcYqTnXT7tUd7DfILLIsXlSEpypP7TAmhrkmsTspl0ckGKNr0a+VPKufv20iwgeP6Tsn0LEl5iP9LDRqm1hrfv93BGtbT1VXGDM+2cKXKsz7XrZYhYFSbZZF1YQz9xwQ2AY3aDo4LA2Mf8jK6NdMytczCHRZ6o8vmlJ+njg/AKsxoyuit5dzrPxeoTV0Omi76Wjnx9wTWCIokorD/d/Boj1c4MG790J4bZnT41iI94zp/ytTorp3bOtfXZoX1Lj4uUlpxGVdRjFKCF+1+iGUOMURcyu9Thz6/B8OwyR6U91XJzjYkK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39850400004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(44832011)(33656002)(38100700002)(2906002)(8936002)(316002)(8676002)(15650500001)(5660300002)(110136005)(55016003)(38070700009)(66476007)(64756008)(66446008)(66556008)(66946007)(76116006)(122000001)(41300700001)(86362001)(52536014)(9686003)(26005)(6506007)(478600001)(71200400001)(83380400001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RnRQc1RPZ21SRGhrcnNLSHdZMmVWZzFpNWF3b2NLZXlBN2ZtZ0JDaEdYT0hS?=
 =?utf-8?B?YktmejRyT0t4Um1pYmtXWEVPbzg4YnBRNE0rSzN2RlBvaGdEWXlWdU8vZVJ0?=
 =?utf-8?B?QkhTNVlNOUJXRTMra1loWnY4RnFZaDhGcG5UM2pWdmZEa21WeVhIaXd6T2xB?=
 =?utf-8?B?bFNqNWVWOHdKS1pocHUvTC9ONk1iSWkwVERTN05ubXNNV1VzVjYvTEZtMG93?=
 =?utf-8?B?d2FBd2Y3MWwrTVlXaW1ZY1JjZElaTCtVdWV1ZVB2R3hEa1RIYjZvODhkWFgw?=
 =?utf-8?B?N1NEeEp2VXBFZFdpYzZKR3Z2NXNGczM4bmZDbWlIOXVRSm5wNkJyYkI3QmhQ?=
 =?utf-8?B?ZDNaWVRTYTJtZ2dZZjdFSzVHY2lGcUdCaE1wVFRQY29IK2o4NDhzc3ZlUHFU?=
 =?utf-8?B?OFYyOTVqTG93Ny8vTUVsWS9XYWppMVRhdkhWMlBybVFoV1JlWk9WOWYwdUor?=
 =?utf-8?B?d2pCeGhtWldsYzNPT2hCaVdBajNFY2lrdGhEcm9jQ25PRFRob1VFSFhBTG4y?=
 =?utf-8?B?REJSd3oxVmFiRGRRM0FiWkFpd01QRHIrdCsrNGFJeUgwR3RvNk1rdFV6enBO?=
 =?utf-8?B?TDduMWtRSUY4Q0xqc1pMMTUvR055UEhIcFFDZG0vVmZoYjZLcWsvbUZjWlJu?=
 =?utf-8?B?NkYzcDZPaFQ5ZUtESzQ1MkdwTlNWUWtCM3Z0QkUvSU9OOURpd0s4ZGF0eEwv?=
 =?utf-8?B?V2dHWUVGTFdqT3pZaFFZR2RsTHJIaS9hbnBnY1BNc0xtUGV2bERFaTBDR1pu?=
 =?utf-8?B?T2cvY2xDT0dQeHRqVVdxcXAzcEZ6TVNPMnhtaEhDdG9ranFWQk92Ty90OXZa?=
 =?utf-8?B?YlVmSCszTThuQ3Y4Uy9VeXVIeWhxbUpuSndKdVREOEdva1Bwa3hzWFJoS29W?=
 =?utf-8?B?bG1GRy95RHRRY1JPRmdQYTc4RFBzZk9SRjk4L1lHZXBtemlxYVVycWVOOElK?=
 =?utf-8?B?VXRKd0h3cnFJUWoyR1RweEhlUmZjUmozL3g4SU5ZMjVVZXJBTE55U3IvNkYv?=
 =?utf-8?B?VWJoRG5abVRuaVVVcWpoQzNhT04zR1d4ZHZGTW51NFhEd0tTRm8wbmNLeU8z?=
 =?utf-8?B?NUI1NXlJdFNCNGVVSFpkZTlXNjZ5R1RnaWdjZzQ2VXNFMnZjbGpBb3pIclZC?=
 =?utf-8?B?emNyekphSS8zeEUrejhHbVFnczB0UDVsNnQvNEFldEdFNVVZOHNacm53dERu?=
 =?utf-8?B?SklZODMwWGZTYXgrWnRSS2hoeXlVbC93MmpnN092RWJ0M2c2NXdJaXhJVlJX?=
 =?utf-8?B?Wnk3TDNjWkFRdTQ5bDVRZnR5dU05cjNubDZjbWQ1ZDlYSGcrQjJqNmgwMm90?=
 =?utf-8?B?bHpFQ2R1elhSUlRNbmlka1RwZDRrZ280R3VIbzBnZFZnMUJ5KzFlRS8yYWIw?=
 =?utf-8?B?eFZQaU1TZ0RXYlVTeDc5dUpGUXBtaGlBcUJ1cHNoZndYMTB1SkVKbHg1K3VQ?=
 =?utf-8?B?RlYwV1plbGh5MHEyK3dKVkZnOHlWemR2YjVrMGczeCszNHhRSHpTcmxLcitM?=
 =?utf-8?B?eGszOGpoRTNjZWRwMm1lYTNBcHhOQnlha3BXUXlJRjVCWWdkVStlQnNkdlpE?=
 =?utf-8?B?MnYyVFF1TGRRemsxb3BEWlY2THNwVlkwRjdBbmkvcDFLMi9UWDZBT3FGc2dW?=
 =?utf-8?B?ZGdWby9jeDlrSk5FMHVqb0hNSzlldk5lSFRGdE5LTHVPT2ZubHJlYjBiUmJ0?=
 =?utf-8?B?M0dvQjQrdDg3eHN2dHAwN0hxYkNWUUlhVDEzb2dxbW0rVHZXbFZLVXo3TDgy?=
 =?utf-8?B?ZHV2dXh6cUowM1JiaXREM1BkNEVxMEtzZWtEbm1JVEx0U1pvTXoycStzcStC?=
 =?utf-8?B?M2JsMk8vL3pvQUdFYmpNUWVxUGxrdlhObVN0K3Zwb3BoZmxvbHdvOFBNRDVG?=
 =?utf-8?B?N3k3WUtUM2dvSHk1czJ1UFZ6SU1GQzRhR2FZMjVRbWZBbzEvWDRueGVrTTMw?=
 =?utf-8?B?SldFT1UrckhoNzdUOGloRkZpMmhhQTlGQ3E5TTl3ZDhGeGRjVkRGT285RzBh?=
 =?utf-8?B?U1ViK2pzcTRhUTdZeVBKYmRpSjE2M1FMNThkNUczRThIUEprNlhtMytrMktR?=
 =?utf-8?B?K29RZUpXdkFzejdYNW9QVmJXSnUva0xZV204dUpBVjhUdzZ2YjFzZDNsYWs2?=
 =?utf-8?Q?Jqmo5k8nQm5/CbFRd0x7xRL3I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8cd92e-c7a5-4a0b-97ee-08dc1059c91c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 14:54:59.1739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8O9fb2+90Ivonx8skcH84uIcmN7BJi63rhJgcKfecpo/S9Iuzx5jX3/donl7KECyywNmszWKFNgAVhXbc4SuxXt5geBtHqykmowK3zKh64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6313
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193411

VGhlcmUgYXJlIGEgZmV3IGFkZGl0aW9uYWwgcmVtYXJrcyB0aGF0IEknZCBsaWtlIHNvbWUgaW5w
dXQgb24uDQoNCj4gKyAgICAgICAgICAgICAgICBsb2dnZXIuZXJyb3IoIk5vIHJlcG9zaXRvcnkg
c3BlY2lmaWVkLiBQbGVhc2UgcHJvdmlkZSBvbmUgdXNpbmcgJy0tcmVwb3NpdG9yeSBSRVBPU0lU
T1JZJy4iKQ0KPiArICAgICAgICAgICAgICAgIHJhaXNlIEV4Y2VwdGlvbigiTm8gcmVwb3NpdG9y
eSBzcGVjaWZpZWQuIFBsZWFzZSBwcm92aWRlIG9uZSB1c2luZyAnLS1yZXBvc2l0b3J5IFJFUE9T
SVRPUlknLiIpDQoNCkkndmUgaW5jbHVkZWQgYm90aCBhbiBlcnJvciBtZXNzYWdlIGFuZCBhbiBl
eGNlcHRpb24gaGVyZSwgdGhlIGV4Y2VwdGlvbiBpcyB3aGF0IHdhcyB1c2VkIGVsc2V3aGVyZSBh
bHJlYWR5Lg0KSG93ZXZlciwgdGhpcyBkb2Vzbid0IHByb3ZpZGUgY2xlYXIgZmVlZGJhY2sgb24g
d2hhdCBleGFjdGx5IGlzIHdyb25nLCB1c2luZyBhbiBlcnJvciBtZXNzYWdlIHdpbGwgcHJvdmlk
ZSBjbGVhcg0KZmVlZGJhY2sgaW4gbXkgb3Bpbmlvbi4gKEl0J3MgYSB2ZXJ5IG9idmlvdXMgcmVk
IG1lc3NhZ2UgYWZ0ZXIgYWxsLCBhbmQgbm90IGp1c3QgYSB0cmFjZWJhY2sgdGhhdCBuZWVkcyB0
byBiZSBhbmFseXNlZC4pDQpPbiB0aGUgb3RoZXIgaGFuZCwgb25seSAgdXNpbmcgYW4gZXJyb3Ig
bWVzc2FnZSBpc27igJl0IHF1aXRlIHN1ZmZpY2llbnQgZWl0aGVyLCBhcyBpdCB3aWxsIG5vdCBl
eGl0IHdpdGggYW4gZXJyb3IgY29kZS4NCg0KPiArICAgICAgICBwYXJzZXIuYWRkX2FyZ3VtZW50
KCctLXJlcG9zaXRvcnknLCAnLXAnLA0KDQpJJ3ZlIG5hbWVkIHRoaXMgb3B0aW9uICctLXJlcG9z
aXRvcnknIGFzIEkgd291bGQgbGlrZSB0byB1c2UgJy0tdXBkYXRlJyB3aXRoICctLXJlcG9zaXRv
cnknLCB3aXRob3V0ICctLXJlZmVyZW5jZScNCmF0IHNvbWUgcG9pbnQsIGluIHdoaWNoIGNhc2Ug
Jy0tdXNlLWN1c3RvbS1yZWZlcmVuY2UnIGRvZXMgbm90IHNlZW0gYXBwcm9wcmlhdGUuDQoNCkkn
bSBvcGVuIHRvIHN1Z2dlc3Rpb25zIGFuZCBJJ2QgbGlrZSB0byBrbm93IHdoYXQgcGVvcGxlIHRo
aW5rIGFib3V0IHRoaXMuDQoNClNpbmNlcmVseSwNCg0KSmVybWFpbiBIb3JzbWFuDQo=

