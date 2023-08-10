Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E7AC001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 06:44:04 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.54])
 by mx.groups.io with SMTP id smtpd.web11.11923.1691649834925449654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 23:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=0CjB/zZQ;
 spf=pass (domain: siemens.com, ip: 40.107.14.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ol5aDLQtgGOHv0H9ErivXktQmSv4cSJ56+SCuSwOaBBKpNjDaGrIKe1Bmip6Z+t7MDTJ6FBhNkuekMuprokiWh4EopY+bnM2wv52BpC71nfovaLZEmmxEgdrWUoaEG2xL5lOANcuvSpFMENEOM4/szBkCDVoRLJGimbtpOjjOsz0SHdV73ItTw4oe5vhU9wmZzwQAzMHaKiDkDiS/9Wv0x4FtzL09B79UaXDrmQ8qXsYYVuR+jA3h/+qoWopQr9/nwJ35dpPsf9QTy9jva14GOC2g6jwrwf5VANRIdP5UIi6AozOMhVgCIl5xa2hfvWAxGMU0zwJMFwajJVLGbhDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eKSUVOv8KTGaamjvRIY86ApFF/5+Ybq4swWGr1cDzY=;
 b=SXDfU3NRfuxsKv1IlCgsVqyE2rRcTqM2HDbY5hJ4LooFVaJxHZO4nfTWpYmDXgNQSYWh5rOyGXNWObLMBTK+naoZ1OOP+etUVemv+JAklr3dibAeEBv0qBxtWTZCWSK6VVi7rmVdK+znOTP7Y2JOD98TyPTiMQBrcFm/hC/1HuNIAPQp0OmHCgsCf4vPt7f5I2EVDE3Rfwcc6bakhEaKRBs8kVHBUvfmCA1Gvh47JrAXkVEVmZ+W0k4Mp6pLsry6K/4bkFNFTxAK0Bl3miFRk1aDifuXq25OYnAsydNMRrxTWmZHRrK9f6tuwnofA+k60k2dK0DlWG49uQ1AJmHg+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eKSUVOv8KTGaamjvRIY86ApFF/5+Ybq4swWGr1cDzY=;
 b=0CjB/zZQq+nG2vU9/q1p1a2TLojtpLZda5tC7q/plQRi8IpKbRsDuHU9Mp1XQkqf3ztyXf2WnvgvaZyXtrSPX+O5heALS14xMdlPGsLA1GFXNXUbTgSybBiICQHp4gc6ok74f8Nl0EGLGbByR8ptvVgsZfcNdZOHAhZX5vr3tt7BowyjMoFv8rYZJoLSo2Czj7A0BSzic5YX+uy6Qzwisy7d8dPqIGxRuq41SzadDJhA34mUNZMBI5W+moHiu6qDD3NQfUV6RhhJCTnQa+scTijHYgakffggeSvs26RwOEwPyJ6o8kjYN2wdVLj7mGwqrZArtj7xjYaO+VtMOiTnMA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB6951.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:579::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Thu, 10 Aug
 2023 06:43:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 06:43:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][dunfell][PATCH] openssl: Upgrade 1.1.1t -> 1.1.1v
Thread-Topic: [OE-core][dunfell][PATCH] openssl: Upgrade 1.1.1t -> 1.1.1v
Thread-Index: AQHZxMfAfAdG+5h8NkaMGndpUHOSDq/i26OAgABFSuA=
Date: Thu, 10 Aug 2023 06:43:50 +0000
Message-ID: 
 <AS1PR10MB56970F1C4E386AFAF6277118FD13A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230801222931.2942099-1-peter.marko@siemens.com>
 <CAOSpxdb-Bf_7T_o-DrA_vbOF-Bnz9Zk5bCV3WKEOc95GqtChJA@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdb-Bf_7T_o-DrA_vbOF-Bnz9Zk5bCV3WKEOc95GqtChJA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6bbd78fd-1a0e-4746-979a-252f9234aa3c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-08-10T06:38:16Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB6951:EE_
x-ms-office365-filtering-correlation-id: 373c2f5b-2743-4e1f-15bd-08db996d280b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NuCBmIyISwE9tryMc27ixMO9g0fMn+UUCWyq4RnK34Z25i45lD6wFaYlzQ3e0z5Wyw/5By3erJLKyVUgZcmPJ1MoWFGVJiU4F66IugUY0tmh7KojJxBWMBgUQMKiC80SPH4yZUNPA213HB3bvfOZLKE/FVqmMtJqxaOhqxo+0OKgLu4xwa8g4xeC/XRwR094fQaG3sxnrm7fjAfgoxAaj3hRfQd8DLfGa6sTuho0/tVwTpqLYx/yHQKKV2wmja8sXEFiN0OxOKDBAjiuBeKPoftY7HTmyqbLTHBa1f7+k7ADdWHgBYn1NPJvhI+O941P2o3W7HzX+dVwEd0HNjhLvRzDhFxvekjIychS1kPcLeYpQc7Lo2qSuHJSz9KrKDeSgByt2pNVVFb7qPtQRWdWWKGQcfeAbmSQ8BEKnjqXRyKrBgF7FbEWSikQFpS/G23qKfR7nYUCE3V7wIj4cfx5+ENhua3WMRzvOf3FJo8ExhAskDd2u2xS5IWq/oB1d4X+uyOehekHsINT3YoJw1usbkfYBjPto7H3GJftOXbXAW5VnZ538gdmm7ltRpvY7wvCoj8JkcmnHG6aMayv4MiNbzitr41o74XKeYoiSZcfqD0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(376002)(396003)(39860400002)(186006)(451199021)(1800799006)(55236004)(53546011)(26005)(6506007)(71200400001)(66556008)(7696005)(966005)(478600001)(82960400001)(33656002)(38100700002)(9686003)(122000001)(66946007)(66476007)(66446008)(76116006)(4326008)(6916009)(316002)(41300700001)(64756008)(38070700005)(52536014)(5660300002)(8936002)(8676002)(2906002)(83380400001)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MHBxRThVRnJFVU5QbUZyeHFWR0Q4ZDBwMDJzL0J1UDc3Vm5uL3hiVWMxbU8z?=
 =?utf-8?B?TEk3U0h6alU2bzZIQXN6VWc4RDhmWlNJQzQvWUlwTmlmc3U0QzRlVDVrMUxv?=
 =?utf-8?B?SjhFMVgvd0EwWjV2cFd5MGJ5eFBQY1dHdTc5U3hPM21LOG8vWCtWOEtZWnZk?=
 =?utf-8?B?NkFVTjFoOE1sV2FMRWJoZlBhQkFHRE9PWTlFU1VaM3JaRFlEajBqcUU0eDlP?=
 =?utf-8?B?OUFKek1VT3d3WUg4MFF5SnE4UjNSOUpCclBWRmRqLzFETG5QSHdQZHZqODRh?=
 =?utf-8?B?RjVVT0hPUkNuUTBQQSt3MzhsMUdobXkzb2IxRlRPOHAyTk1yTU5xbTNJUjBm?=
 =?utf-8?B?QXN5dHVXWm9MY0hpT1R1dmxGTmgxTG4yT3RBc3Y2ZncxWEJXVzM5UEs5QmMx?=
 =?utf-8?B?clVaajhLb1hScmEzVVpsd1NkV3RtdHQ4YlNXU0IxTlV2TjUwdHcybGplWHd0?=
 =?utf-8?B?REhqSWdYaGVwcWl5dG96UG9WRk1XZGppKzdwNVp5dnIrcmVxZWtUY0lTZFpq?=
 =?utf-8?B?c3l1QkExSVBMbVh5ajRiWkFaaFJoZk8yUUJXaDJCZWZWTkxwczQ0cmxxUksy?=
 =?utf-8?B?UXZ6UU50SlZFcERxS2ZRL0JzNWZ0TlN6Ym12M25FclVSOVBDRjNUYm1jM29Y?=
 =?utf-8?B?TnVBeVBzVHlZWnB4RVNwdWF3RlJhZHQ1ZiswSWJydk55V1BHMDU0UVp4c01l?=
 =?utf-8?B?N0NaUXNPYzRBOUw1Wk9CaFZhZmRlWXZOazFOWmhqS3BSOTNXbmtzT3h5N2RV?=
 =?utf-8?B?WFNRdjlDMWhyRzRwUlZrZThPUzBmTGgyTS81QUlQVkJIcytVamprTjZNOVVL?=
 =?utf-8?B?K0FpM2QzMUl2NjZNRkd3WnJIR1NOYWN5dlFKNTFqMnVVZVJPai9EbWtaRGZt?=
 =?utf-8?B?aWl6RHRDOWtudlI0QUZUQy8zdVE4NlZKR3ZwbXhheWJnWERQL2hNSEt3bkdS?=
 =?utf-8?B?L1Y2R2tKcWxLSWdpeVdLeTBic0tmUU1sTkdpL0w5c1JCdE1GbGQ1bjJqZk90?=
 =?utf-8?B?WlUwV0NCbWZNTmNMV2NJV29YQnhoeWZTSlY1ZTA3TjJEZlk0dFNCNE1iR1hx?=
 =?utf-8?B?VW56eC9wTURwblgyc2F2WnE0eU1TWkl2OTU2U2l5MkN6ZkdTUlFTZmxBT1hr?=
 =?utf-8?B?dXh0L043VmpseFo2VU85ZTJXdURQWDY3WXEzSnFQVk9oTEhhVnN6YTN5U002?=
 =?utf-8?B?eGxyaitJSjU1Y2NwMS9VTzkyZlBEc0RsL1FJeGRWM0tpbFBTWXEwdmZvZ2kw?=
 =?utf-8?B?LzlXbjVwUkZoN0NXUXl0cmNvQTVMTjhEeW5kYUVBZUIxSkNxTnE4VmpjVlNz?=
 =?utf-8?B?bDdlSEp3MlpWa0N6bzJEUHBRUXlwS3NzTEZ3OFNSL3gremNPU0VSS294U0h4?=
 =?utf-8?B?blZuUHY4dXdtSHN2aGQvMkJZN3BPRzh5N0NSb29yUTlrekpmeGJucnZ4M2k5?=
 =?utf-8?B?WmdrSk5ZczVqejl6RnhaYlIycVZ5VHMxbXJGTUpRTUFnQ3hPVWFaQmUrYjE1?=
 =?utf-8?B?MzJ0cGduSFdDVk9nQjhUUmtVM2RhZlFyYjFWMGxrNUtWeXk1OUdXMnUrUHZ5?=
 =?utf-8?B?RlJLeTRxTGFzL2VrZkhZVnorRU9NdWEweXZjVE1hd2Z3OVZFbFFsOHA3dEt5?=
 =?utf-8?B?MWRabGVZYTk1UGJXcFlUZWdna0RHUmRzOGl2ZkljcHdCNnNJdWlrOC8xS1N2?=
 =?utf-8?B?cHlBRHFDTm11SlNicy83SHRWR0ZsY0lxL3BHVjJUSlgxWXp5MzN0REZUYmQy?=
 =?utf-8?B?ekRFOUFIUWt6aUpzcDhzeHRyNTBmMDc5ZCtSZDdJYlFMam96MXpzR2VacmxF?=
 =?utf-8?B?SGpNU1VJY01nWVE1WHJtUnhxZld0NDR3SE5KYjB1dUJaL2UramttUXBEOVU2?=
 =?utf-8?B?ZjhMdGFwMWNKWXVya24ra0lXZCtCQlExaXo4RmJKdDUxRDFHV3N0Z1hJSU42?=
 =?utf-8?B?VkxleUp2a1VDK1o1TWpxVEgrdDJaMVIzNVdac3RmYkFSOUMyQUNTNFoveDRk?=
 =?utf-8?B?cGRZWWNtanZ6S3ZRZzk1ZWxmL1hFb3YrUXozSjlGMVJvNmFhMFM1UlZpUGti?=
 =?utf-8?B?NUdpS3lnTFhMNVNDRHl4cXRwSGx1QU0vREFaclBiV2M0dERIdkk2SEo2Y0pD?=
 =?utf-8?Q?VetVSJ0gTsxPlejYzE+WxNK+2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 373c2f5b-2743-4e1f-15bd-08db996d280b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 06:43:50.5164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GMRPzOrZd73aYF9z2HHFexfFzzSQ7rwRSTF4LyeviUe83Zr1nvmRQif4mACfM1HIUlFia6l0qxMhqGFL4fslPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 06:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185724

SSBzZWUuDQoNCk9wZW5zc2wgYmFja3BvcnRlZCBmb2xsb3dpbmcgdG8gMV8xXzEgLSBodHRwczov
L2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVuc3NsL2NvbW1pdC85NjkzMjczOTAyMjBhZWU3NTE1YTQw
NTRkNTE4OTE4NjQwMmQ2Njg3DQpTbyBJIG5lZWQgdG8gYmFja3BvcnQgZm9sbG93aW5nIHRvIGR1
bmZlbGwgLSBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2Nv
bW1pdC9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLUNvbmZp
Z3VyZS1kby1ub3QtdHdlYWstbWlwcy1jZmxhZ3MucGF0Y2g/aD1raXJrc3RvbmUmaWQ9ZjAyOGE1
NTM4MzU4OGQ2OGMwNTJmMTlmMTZkMGYzZjRkMDU2MGM1Nw0KSSdsbCB0cnkgdG8gZmluZCBzb21l
IHRpbWUgYW5kIHNldHVwIGEgbWlwcyBidWlsZCB0b2RheSBvciB0b21vcnJvdy4NCg0KTm90ZSB0
aGF0IEkgZG9uJ3QgbGlrZSB0aGF0IHBhdGNoIGFzIHdlIHNob3VsZCBwcm9iYWJseSBjb3JyZWN0
IGNvbmZpZ3VyZSBvcHRpb25zIGZvciBvcGVuc3NsLCBidXQgSSBkb24ndCB3YW50IHRvIG9wZW4g
dGhhdCBpbiBkdW5mZWxsLg0KDQpQZXRlcg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+IA0KU2VudDogVGh1cnNkYXks
IEF1Z3VzdCAxMCwgMjAyMyA0OjMwDQpUbzogTWFya28sIFBldGVyIChBRFYgRCBFVSBTSyBCRlMx
KSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtkdW5mZWxsXVtQQVRDSF0g
b3BlbnNzbDogVXBncmFkZSAxLjEuMXQgLT4gMS4xLjF2DQoNCj4gSSdtIGdldHRpbmcgYSBmYWls
dXJlIG9uIHRoZSBhdXRvYnVpbGRlciBmb3IgdGhlIHFlbXVtaXBzNjQgbWFjaGluZToNCj4NCj4g
REVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb21waWxlDQo+IE5PVEU6IG1ha2Ug
LWogMTYgLWwgNTINCj4gcGVybCAiLUkuIiAtTWNvbmZpZ2RhdGEgIi4uL29wZW5zc2wtMS4xLjF2
L3V0aWwvZG9maWxlLnBsIiBcDQo+ICAgICAiLW9NYWtlZmlsZSIgLi4vb3BlbnNzbC0xLjEuMXYv
aW5jbHVkZS9jcnlwdG8vYm5fY29uZi5oLmluID4gaW5jbHVkZS9jcnlwdG8vYm5fY29uZi5oIHBl
cmwgIi1JLiIgLU1jb25maWdkYXRhICIuLi9vcGVuc3NsLTEuMS4xdi91dGlsL2RvZmlsZS5wbCIg
XA0KPiAgICAgIi1vTWFrZWZpbGUiIC4uL29wZW5zc2wtMS4xLjF2L2luY2x1ZGUvb3BlbnNzbC9v
cGVuc3NsY29uZi5oLmluID4gaW5jbHVkZS9vcGVuc3NsL29wZW5zc2xjb25mLmggcGVybCAiLUku
IiAtTWNvbmZpZ2RhdGEgIi4uL29wZW5zc2wtMS4xLjF2L3V0aWwvZG9maWxlLnBsIiBcDQo+ICAg
ICAiLW9NYWtlZmlsZSIgLi4vb3BlbnNzbC0xLjEuMXYvaW5jbHVkZS9jcnlwdG8vZHNvX2NvbmYu
aC5pbiA+IGluY2x1ZGUvY3J5cHRvL2Rzb19jb25mLmggbWFrZSBkZXBlbmQgJiYgbWFrZSBfYWxs
DQo+IG1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeQ0KPiAnVE9QRElSL3RtcC93b3JrL21pcHM2
NHIyLXBva3ktbGludXgvb3BlbnNzbC8xLjEuMXYtcjAvYnVpbGQnDQo+IG1ha2VbMV06IExlYXZp
bmcgZGlyZWN0b3J5DQo+ICdUT1BESVIvdG1wL3dvcmsvbWlwczY0cjItcG9reS1saW51eC9vcGVu
c3NsLzEuMS4xdi1yMC9idWlsZCcNCj4gbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5DQo+ICdU
T1BESVIvdG1wL3dvcmsvbWlwczY0cjItcG9reS1saW51eC9vcGVuc3NsLzEuMS4xdi1yMC9idWls
ZCcNCj4gbWlwczY0LXBva3ktbGludXgtZ2NjICAtbWViIC1tYWJpPTY0IC1taGFyZC1mbG9hdCAt
bWFyY2g9bWlwczY0cjIgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtRF9GT1JUSUZZX1NPVVJD
RT0yIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5IC0t
c3lzcm9vdD1UT1BESVIvdG1wL3dvcmsvbWlwczY0cjItcG9reS1saW51eC9vcGVuc3NsLzEuMS4x
di1yMC9yZWNpcGUtc3lzcm9vdA0KPiAgLUkuIC1JaW5jbHVkZSAtSS4uL29wZW5zc2wtMS4xLjF2
IC1JLi4vb3BlbnNzbC0xLjEuMXYvaW5jbHVkZSAtZlBJQyAtcHRocmVhZCAtbWFiaT02NCAtbWlw
czMgLVdhLC0tbm9leGVjc3RhY2sgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1
Zy10eXBlcw0KPiAtZm1hY3JvLXByZWZpeC1tYXA9VE9QRElSL3RtcC93b3JrL21pcHM2NHIyLXBv
a3ktbGludXgvb3BlbnNzbC8xLjEuMXYtcjA9L3Vzci9zcmMvZGVidWcvb3BlbnNzbC8xLjEuMXYt
cjANCj4NCj4gLWZkZWJ1Zy1wcmVmaXgtbWFwPVRPUERJUi90bXAvd29yay9taXBzNjRyMi1wb2t5
LWxpbnV4L29wZW5zc2wvMS4xLjF2LXIwPS91c3Ivc3JjL2RlYnVnL29wZW5zc2wvMS4xLjF2LXIw
DQo+DQo+IC1mZGVidWctcHJlZml4LW1hcD1UT1BESVIvdG1wL3dvcmsvbWlwczY0cjItcG9reS1s
aW51eC9vcGVuc3NsLzEuMS4xdi1yMC9yZWNpcGUtc3lzcm9vdD0NCj4NCj4gLWZkZWJ1Zy1wcmVm
aXgtbWFwPVRPUERJUi90bXAvd29yay9taXBzNjRyMi1wb2t5LWxpbnV4L29wZW5zc2wvMS4xLjF2
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZT0NCj4gIC1ET1BFTlNTTF9VU0VfTk9ERUxFVEUgLURP
UEVOU1NMX1BJQyAtRE9QRU5TU0xfQk5fQVNNX01PTlQgLURTSEExX0FTTSAtRFNIQTI1Nl9BU00g
LURTSEE1MTJfQVNNIC1EQUVTX0FTTSAtRFBPTFkxMzA1X0FTTSAtRE9QRU5TU0xESVI9IlwiL3Vz
ci9saWIvc3NsLTEuMVwiIg0KPiAtREVOR0lORVNESVI9IlwiL3Vzci9saWIvZW5naW5lcy0xLjFc
IiIgLUROREVCVUcgIC1NTUQgLU1GIGFwcHMvYXBwX3JhbmQuZC50bXAgLU1UIGFwcHMvYXBwX3Jh
bmQubyAtYyAtbyBhcHBzL2FwcF9yYW5kLm8gLi4vb3BlbnNzbC0xLjEuMXYvYXBwcy9hcHBfcmFu
ZC5jIEFzc2VtYmxlciBtZXNzYWdlczoNCj4gRXJyb3I6IC1taXBzMyBjb25mbGljdHMgd2l0aCB0
aGUgb3RoZXIgYXJjaGl0ZWN0dXJlIG9wdGlvbnMsIHdoaWNoIGltcGx5IC1taXBzNjRyMg0KPiBj
YzE6IGVycm9yOiAnLW1pcHMzJyBjb25mbGljdHMgd2l0aCB0aGUgb3RoZXIgYXJjaGl0ZWN0dXJl
IG9wdGlvbnMsIHdoaWNoIHNwZWNpZnkgYSBtaXBzNjRyMiBwcm9jZXNzb3INCj4gbWFrZVsxXTog
KioqIFtNYWtlZmlsZTo3MTE6IGFwcHMvYXBwX3JhbmQub10gRXJyb3IgMQ0KPiBtYWtlWzFdOiBM
ZWF2aW5nIGRpcmVjdG9yeQ0KPiAnVE9QRElSL3RtcC93b3JrL21pcHM2NHIyLXBva3ktbGludXgv
b3BlbnNzbC8xLjEuMXYtcjAvYnVpbGQnDQo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTc4OiBhbGxd
IEVycm9yIDINCj4gRVJST1I6IG9lX3J1bm1ha2UgZmFpbGVkDQo+IFdBUk5JTkc6IGV4aXQgY29k
ZSAxIGZyb20gYSBzaGVsbCBjb21tYW5kLg0KPiBFUlJPUjogRXhlY3V0aW9uIG9mDQo+ICdUT1BE
SVIvdG1wL3dvcmsvbWlwczY0cjItcG9reS1saW51eC9vcGVuc3NsLzEuMS4xdi1yMC90ZW1wL3J1
bi5kb19jb21waWxlLjMwMTc0NTcnDQo+IGZhaWxlZCB3aXRoIGV4aXQgY29kZSAxDQo=

