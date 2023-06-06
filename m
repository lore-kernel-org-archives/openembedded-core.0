Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A40C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:35:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web10.7561.1686054946632973151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 05:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=FJCbTqZz;
 spf=pass (domain: siemens.com, ip: 40.107.22.87, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJdFHcsy2uFwkJi0WvC2Oa5B4etd/RVfX+9Y+q2mIEaM3x/X85DyvEXgAJPdOriqUi/7LmN6M4a/PmJf8nFJFy5xxboQwDbUKu7Jkqs7X5LCVZtTy1pdfle5MbjkYb3ZYfXT3Rgzb+hAzBGSWZlMKsIzD0e5mBrjfrN2oX/Ck+Ug5SZhYPC1ZyAu5wS/BlG7zQx5/aXsFytKhsDef1e+kmhYXAhTWH3ydgyFcACuxvchdHWSnCTnpnEV76AsfL70h913FCY8UpO/lm4vu4Kl1Qem+PH1qYIH7hOkPj4FiILj+waoXcfIJYtD14ZQpFzSAt1wfTENSyu9QlUhcDPfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCoxCh7F9J0pahoT2CofAOFLzZjb1jepVzY6MH5Sdfc=;
 b=EnvEbDo/QlNl5TXgtK6yrWRJGe7IgUfYpGAIf+X4mSKZ18pekRsw0x+Ax+lzgmdtE0SVvLbApKBOUFLf/iZrI1iVy/R3dkGlHJ0oYuGLRi7gE5CUveUTae86ANiMnhnwP0hExNmCOP3PS83b8DVWXMm5dvXd2L2/cI8aeU9ghGcQIAKrYtZeXBm2rbeuUG9LEYRZ6d+kh5xe331zxItaGOS2rmKIol4poK+T7WJocoaTzOmR8EQDAJpnQ9tqNv1zEowwLAWVQPFPIw06c1fLDFs+rPVFzPok1uQSp38bsrBQ9yqTm5E121cDt5IjtxKHz2m4o6DPEUH6JIWhQVWpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCoxCh7F9J0pahoT2CofAOFLzZjb1jepVzY6MH5Sdfc=;
 b=FJCbTqZzwQP9fgd7rbUNNCjh/4UfDYE9b0f8HqUpSnd7fPxcWxO2/zXRyaRwzxuKxRDrxX96W1engEVxGtXg8OHTZfzDldWlq3put3U7XH8PhZFVvJVZBEqBt8ydvIdKTC9sRs164Wu2mp+zQXM7BuyQ2obmKi+VFoH1FJdPeHNp2nDf3TcNFOJhN0HqZIiXWc560pQEP5QFAH5UbIH2a/Dqz+Rfnvi5aUkluMQb1S6wCPM+FdcKuOmibi9POu4/WK0OOY8GA4ovQ4+gc6kSSOkIroAkLgkEHQz1rrozC4k+w9XxbMQKzpVQxuUp0bTeQCgDETHwHh8z9DT4+Qlvhw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5205.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 12:35:44 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d5b7:373f:ecd8:8ad8]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d5b7:373f:ecd8:8ad8%4]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:35:44 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>, Geoffrey GIRY
	<geoffrey.giry@smile.fr>, Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>, Yoann Congal
	<yoann.congal@smile.fr>
Subject: RE: Clarifying CVEs for NVD (Was: Re: [OE-core] [PATCH]
 cve-extra-exclusions: ignore inapplicable linux-yocto CVEs)
Thread-Topic: Clarifying CVEs for NVD (Was: Re: [OE-core] [PATCH]
 cve-extra-exclusions: ignore inapplicable linux-yocto CVEs)
Thread-Index: AQHZmDiMQpMhOeGR3Uqj3E7MWvcQPq99tMMg
Date: Tue, 6 Jun 2023 12:35:43 +0000
Message-ID: 
 <AS1PR10MB5697D5773788B749770744D1FD52A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230227110027.804671-1-geoffrey.giry@smile.fr>
 <CAApg2=TLNBWVgS9_KdjhA1kDrio34i4st6mkthSErihXkkNvjg@mail.gmail.com>
In-Reply-To: 
 <CAApg2=TLNBWVgS9_KdjhA1kDrio34i4st6mkthSErihXkkNvjg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-06-06T12:35:42Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4b460172-77c0-4a45-99d9-93d278c70fa3;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5205:EE_
x-ms-office365-filtering-correlation-id: 26e7c8b1-0643-4111-a44f-08db668a8ba4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rxjcvnhX9Xa6Tw9MXguYotpQRdmlNPkkkiM2PWcKp+Zzn8pzjvxe+u+KTotuJyzWrEeyIacCkirtZ4IAEHm/j3eV3YXGdWMaaYTOXpfJSoj3iqqLVFXWKKSxEB1HdH/C1khxL84RaMMq9zSV0GBPkL0xDX5zcQcHqClqiDnw7vZtmmHDIFndwg7/Sxcur8XDf0YhB4XJN1CQVCRhcfe3IOUAYAUaaPoWHONfqbtaYFlAd2YyjwTgS27drqWVO/R/+aUKlkbhr3jIfYdZq7htA939bWZx0wGJi5POZGjHURtyuBCgxMEPXrshxUYtjsBHOVYVpKCzhcfDg5gREut3bi2Ls8kAYcbY8lJr1QB6ksdzS/FHqUUfjfG4b7Zq1oCB/l6xmdefEmkglCF+SwMBauPIRUGutSzDnlVCpP/qPvjarMq1pEVD+NPOBtjhZmNafWGRdJinHIH/qHVXXfijGStM6jT/LDfqpOYrCkWpMRPsdHzZHwrT3IGfixaHYFNNH1Lm/OhfOvZ0bVLZyIg+xJuT2SrFIvi48IWL9citjefAk42iL4k/Oz6Z1DPO1b0ZclTOQXvjTZQMmZjja9+NQPLMRL2h9WyfDrXmxPZSHfU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(41300700001)(316002)(54906003)(110136005)(122000001)(82960400001)(52536014)(5660300002)(478600001)(2906002)(4326008)(76116006)(66556008)(66476007)(64756008)(66446008)(8936002)(8676002)(66946007)(71200400001)(38070700005)(7696005)(966005)(86362001)(186003)(38100700002)(26005)(55016003)(53546011)(55236004)(9686003)(33656002)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?clc1amFjcWtEazlHOHRNdllzSUlFQjFPODBYUENQRzJicWRiQmFaQlNRSmpa?=
 =?utf-8?B?RlRSakl0a0VBay92ZWZLRHpFQ0tZWCtzUGR0S0srd2ExMUhGdmdlampsdkto?=
 =?utf-8?B?cis5MjRRRUdrcW1XUHk0K05BWG1JRkVhM2pwekJ3bzFUK0EvYVZHeVllNjFo?=
 =?utf-8?B?SlpRRkpUR3JTUjcveURrQ2c2S00zWXQzMVZ6VjJWQk5kSnB4V0ZLTUQ2ckZE?=
 =?utf-8?B?NHdTQ3pzRm4rMTRVcjJNOGhibFpvUTBNeFlpYzZHdFlnZG1JTVlneEtHOW82?=
 =?utf-8?B?cXBzaXppUGJlTUtzOFliQ3pkelNQM1lVTm91VnFJNlg1ZGFpUng3S1FvbHlF?=
 =?utf-8?B?cTBxSTJkc2kvc2NzUXJJaThEZjhSaUl5M0FoNkxMSXhyMWZJRHhrRnVrNjFy?=
 =?utf-8?B?Z3ZRSENUWnpSVU44UTh0MmU4am4rcnN3Z1BoUzFBSmRGSC9ScHM3YXFudkl1?=
 =?utf-8?B?NWhpQmx3eEw5TFhTRndBV0x5RHQwK3RqK2pkWGpkV25ETnZieUhBdmhFQzRp?=
 =?utf-8?B?UFZ2YVJKQU1RVWlxN0hieE1zT3dXdElWY2Q5ZzFPVUN2NVRtUktNbmZNRFVF?=
 =?utf-8?B?UEQzQlVySWoyczBXYWFPNldkRk05M25NbWVMRGJpMW5IS0VxVU92NTg3d2dK?=
 =?utf-8?B?QWlSMzBjaDkrNysxWHZaK1hqOWJIRzB1NlNQTmNqY2h1Yng2M0twZ1NnZnFq?=
 =?utf-8?B?YTlsV2tRV3BpcndiMXJPZSs4SDR4SW4weVZEZWpuTFNBQkVCZ1hsY21rUjFN?=
 =?utf-8?B?VTZBYlpubm95WHhDbDQwbWxrcWxvSlZUd2JOdENLRTlqS1NYand2L0IwVktl?=
 =?utf-8?B?YXYrM1J4OGR3QzNKMExjTS92NUZGSnZQaU12T1ZvKzlMZXMzSktveTNqS3hn?=
 =?utf-8?B?TDFYV3FmOHB3eCtmWEVVY3NwWkhnQUZ6VGhkbnBENGdhS3V0THJVaFF3Q2tk?=
 =?utf-8?B?VDFaci8veWlKTHFhU2w5dUMySkRaanl2WXUxSmpPa0NjN1hsYUpuYVFBelRB?=
 =?utf-8?B?bmxDcGdya0tReWRDN2x6akVxTzltTHEyQzQwd2lkY0VsNjJBUWxwZ3UxNHRH?=
 =?utf-8?B?WUxYdDlpdG1RUUo0V0Q0dzIrendsM0djNzAydnRsQjBSRTYxZGpTdnBoRTFU?=
 =?utf-8?B?R2UrdVlSbVpVYWpmR3d4ZWh2K1F0NDlLTm04S1pCLzFKYjlLMyt5UkJSYm04?=
 =?utf-8?B?Y29Gd3hhczNMcVNLM2ZiSHk3K3RNekxNNVRYZ1BPNkRidDgvRUpOdTFTMSty?=
 =?utf-8?B?R3pwUlJBcExJcjBoc1FsS1FnNnh1UGxjeHZDU044eW1UOVErZ0srRW9SQlo3?=
 =?utf-8?B?N1NpREc2MCtva1VkUGJjSXRxbnJwTk9wK0xYR1FneXd5eERWdVdRM081QTF4?=
 =?utf-8?B?OEUzeTBXaFBxbUhjbDVxRDNsUEw4VHRBMU8yZ1R4bnBTSXE1K2R5dXZabkw5?=
 =?utf-8?B?VUY4QndlejZMZ1ZDdmhxOEVCczN4SWJBamlTWWlob3NpeDNVMXZUNzlWVzRE?=
 =?utf-8?B?bGRVVFFoejFid3RKM2pkelYrNFlrUUU3bHk0VGdOWGRGbmVobkg5YVNkNHhY?=
 =?utf-8?B?S0ZJN2N0cFRuVnk2MzNMMDJIZWt3NFJmelBWVElRS1dXRUhWVC9qd25Femxy?=
 =?utf-8?B?cHBmaGxDOHpzbWd0UXBBRko3WjRrNjFmeW9RK3lhaEM5NnQ5bTFxVDF6eEZs?=
 =?utf-8?B?MkNwSEI3c2kvMVBBdkJVSFp3MUNnUW1yR2p5SU1LOG9LZmJiY0dzTHJ5WCt2?=
 =?utf-8?B?ZlpTczhVaHhrci9DOTVsb1lIVlVabTBYMHNTcE9ZWUxUYzB3OTV1aGpUa3FH?=
 =?utf-8?B?UEhUTjJ4SzdJSTgvWVl5ZFNyNVpzdnVIODZCanN0ZDhocUx0ZWpTdFdJTHp2?=
 =?utf-8?B?WXBocEJwSXRKSmo4RmxYOSt1VS83T1NWYUhRTWxZNDc2K2ZibUV0WU9xeG9o?=
 =?utf-8?B?dEJkYjJGNi9nSUJZQlA0YU1JZHFvWlVYWUNIaUZYVG0vSGFqRXpYMjIxbVo1?=
 =?utf-8?B?UDQ0YkxoNHFHM1ZxV29jK2pNb1c0MGtrdUFuQ01LRGVDcmFrMkdEOTdSZWhZ?=
 =?utf-8?B?RUFsak9vWkZUaThtSkRPWWhySy9SZFR3UFV2d29zdFUxR3V3VDdFTXFtTysy?=
 =?utf-8?Q?+xl9gdFcLeL7sXiFR2RShKqSA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e7c8b1-0643-4111-a44f-08db668a8ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:35:43.6886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lcVNBv8UD90iWYBG7lvF2Swta4rEIx6279AEtpgZN4d5epFMSUft/+Gkc/74x8O1BtR6Yd1QG8exNZjASmgiRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 12:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182434

SGksDQoNCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIE1h
cnRhIFJ5YmN6eW5za2EgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogVHVlc2Rh
eSwgSnVuZSA2LCAyMDIzIDc6MzQNCj4gVG86IEdlb2ZmcmV5IEdJUlkgbWFpbHRvOmdlb2ZmcmV5
LmdpcnlAc21pbGUuZnI7IFJpY2hhcmQgUHVyZGllIG1haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnDQo+IENjOiBPRS1jb3JlIG1haWx0bzpvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnOyBZb2FubiBDb25nYWwgPHlvYW5uLmNvbmdhbEBzbWlsZS5m
cj4NCj4gU3ViamVjdDogQ2xhcmlmeWluZyBDVkVzIGZvciBOVkQgKFdhczogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0hdIGN2ZS1leHRyYS1leGNsdXNpb25zOiBpZ25vcmUgaW5hcHBsaWNhYmxlIGxpbnV4
LXlvY3RvIENWRXMpDQo+DQo+IEhlbGxvIGFsbCwNCj4gSSdtIGluIHByb2Nlc3Mgb2YgY2xhcmlm
eWluZyBlbnRyaWVzIGZvciBOVkQgdG8gaGF2ZSB0aGVtIGZpeGVkIGluIHRoZSBzb3VyY2VzLiBU
aGUgY29tbWVudHMgaW4gdGhlIHBhdGNoIGxpbmtlZCBkbyBub3QgaW5jbHVkZSBhbGwgdGhlIG5l
ZWRlZCBpbmZvcm1hdGlvbiwgaG93ZXZlci4NCj4NCj4gTGV0J3MgdGFrZSB0aGlzIG9uZToNCj4N
Cj4gKyMgaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjItMTQ2Mg0KPiAr
IyBJbnRyb2R1Y2VkIGluIHZlcnNpb24gdjIuNi4xMiAxZGExNzdlNGMzZjQxNTI0ZTg4NmI3ZjFi
OGEwYzFmYzczMjFjYWMyDQo+ICsjIFBhdGNoZWQgaW4ga2VybmVsIHNpbmNlIHY1LjE5IGE1MDFh
Yjc1ZTc2MjRkMTMzYTVhM2M3ZWMwMTA2ODdjOGI5NjFkMjMNCj4gKyMgQmFja3BvcnRlZCBpbiB2
ZXJzaW9uIHY1LjQuMjA4IGY3Nzg1MDkyY2I3ZjAyMmY1OWViZGFhMTgxNjUxZjdjODc3ZGYxMzIN
Cj4gKyMgQmFja3BvcnRlZCBpbiB2ZXJzaW9uIHY1LjEwLjEzNCAwOGFmYTg3ZjU4ZDgzZGZlMDQw
NTcyZWQ1OTFiNDdlOGNiOWUyMjVjDQo+ICsjIEJhY2twb3J0ZWQgaW4gdmVyc2lvbiB2NS4xNS41
OCBiMmQxZTRjZDU1OGNmZmVjNmJmZTMxOGY1ZDc0ZTZjZmZjMzc0ZDI5DQo+ICtDVkVfQ0hFQ0tf
SUdOT1JFICs9ICJDVkUtMjAyMi0xNDYyIg0KPg0KPiBXZSBuZWVkIHRvIHdyaXRlIGEgc2V0IG9m
IHJ1bGVzIG9uIHdoaWNoIHZlcnNpb25zIGFyZSB2dWxuZXJhYmxlLCBsaWtlIHRoaXM6DQo+IFt2
Mi42LjEyIC0gdjUuNC4yMDhdDQo+IFt2NS41LjAgPz8/IC3CoCB2NS4xMC4xMzRdDQo+IFt2NS4x
MS4wID8/PyAtIHY1LjE1LjU4XQ0KPiBbdjUuMTYuMCA/Pz8gLSB2NS4xOS4wXQ0KDQpOZXcga2Vy
bmVsIGJyYW5jaGVzIHN0YXJ0IHdpdGggdGFnIHZYLlktcmMxLCBzbyBpdCBzaG91bGQgYmUgdjUu
NS1yYzEsIHY1LjExLXJjMSwgdjUuMTYuMC1yYzEuDQpJbiBOVkQgREIgMS4xIGZvcm1hdDogNS41
X3JjMSwgNS4xX3JjMSwgNS4xNl9yYzEsIC4uLg0KDQo+DQo+IFRoZSB2YWx1ZXMgd2l0aCA/Pz8g
YXJlIHVuY2VydGFpbi4gR2VvZmZyZXksIFlhbm4sIGFzIGl0IHdhcyBzY3JpcHRlZCBvdXQgYWNj
b3JkaW5nIHRvIG9uZSBvZiB0aGUgZGlzY3Vzc2lvbnMsIGFyZSB5b3UgYWJsZSB0byBjb25maXJt
IHRob3NlICJzdGFydGluZyIgdmVyc2lvbnMgPw0KPg0KPiBLaW5kIHJlZ2FyZHMsDQo+IE1hcnRh
DQo=

