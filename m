Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB96C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 01:04:21 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web10.468.1657155858989092193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 18:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=NY5shi6w;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.87,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1657155860; x=1688691860;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xpEstMNIiOdMXjoFgOk2FHlDH5u+VT3IrhIbAilMhb0=;
  b=NY5shi6wRHZI0qrQWN+SqJ+xp2JrUHiC2Z+r59khMRML5QHZSX3BHZXJ
   u8uDOcTGseFCjx0Mp1wOz0oWiOBjcx4XxQq6y0QV+9lzRlyduiveuA/A9
   eKwiM63LKTAZh/jsxa//JSJoL12Q12wbAflIF9wv4Q2mDqGAhvBZsXvwb
   dsqkevSmeW/bFvPmOHAQuAXKVTu31+VbsKnJ4YBpOBxG5BXChXs6Uw8+6
   1BsryccxxsU7X7loHGOw9B5in+ZIq8BSK//6XEjDExYOEgsdbVnDgjdf/
   xaa6mYD+oaeP5vrhojOnww/CyN0prMTGsT8G48o3OdOep2+j9XApKVOQR
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="59872194"
X-IronPort-AV: E=Sophos;i="5.92,251,1650898800";
   d="scan'208";a="59872194"
Received: from mail-tycjpn01lp2176.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.176])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 10:04:17 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM5eHAa6RQ/9/2ODJE2QpGICIEgYGPH9EbiHqTYHKcd9rKACV4PBPljHHdiYniaoLRV8GRwmfxC8dAVvRTDxLuBE7ZN/UHXaGpRJV7NqOBe+rI0aHRuI+IS/nbHf3Le89qN6T6iJPYG8TLtP/e9APvlimmLC183roLoie3Hi30xmNiyZEZ/nXcKLSuC8JIjlvg784ACGUxEyQxirG6oOuntHcFiHJRxcvB605A01I/s7g63IlwOeeg8aw0O3CrNKi2twRvXydBxJIJaapMv4DIWOVN+s57RnYrHSOzZeMnr/vkreDLHeRQmMzK0m6lAgVM9d6DrUyIQIODprW+DlWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpEstMNIiOdMXjoFgOk2FHlDH5u+VT3IrhIbAilMhb0=;
 b=IubGBZ2+cZU0K3gdTM3LoMdtVvfIGZBrOlZmcNO4Vca/QNrZxKrui4WJOA7e8FEOB3TXJOZYCRroIPhG8BM+/n8t0HyDA1Zog7MzoxgOHoS7uHcWNLV+Qj3VCWNxTjRETzKaVSeTouUuevQ5r/xeltW+H+NcIiyQ9VXOFd/MHCaZmXqwHu6bLxsuosB87VMIeLXn8IHg9Bs9hMA3JvAtxciKPWlQUVz4u+w+HuGXLwjSYtbmt14QkdvLBGJo4yjvSyY5IeHLnF7mbh66l0VlPhkTN7XDiJqkp7jxMffHNeRAedu4EIBEqYVLcPnLaomxLMdl8PAYXFy/Qlp9yOz13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpEstMNIiOdMXjoFgOk2FHlDH5u+VT3IrhIbAilMhb0=;
 b=HJEk1JgCeO49PLPp65JiQLI0I3Wk8uOOB0N+iaY/K/U16iW0gySwMkF0SOTmAiUjnjMbWsd6ZVoaQ3brNhM7AoJ82Nox4HyXhpENhdfXrPQ/Rl+2j1AEWFxNAadb1Grl0FQNaUrVWV2Ar7mh8GV6pLZQkzciMmjZ+Hb7Tpgovc8=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYAPR01MB3552.jpnprd01.prod.outlook.com (2603:1096:404:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 01:04:13 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::35a5:7a16:e935:822a]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::35a5:7a16:e935:822a%7]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 01:04:13 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Question about nativesdk-qemuwrapper-cross
Thread-Topic: Question about nativesdk-qemuwrapper-cross
Thread-Index: AdiQ6Emp1+TO49DUQvOutr2UU6Cf8wAMDqCAAB9Ii2A=
Date: Thu, 7 Jul 2022 01:04:13 +0000
Message-ID: 
 <OS0PR01MB61787554070A3029E0F3C518A0839@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <OS0PR01MB6178C500A5157ED31549D49DA0809@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <8b13b18a7aa7568fc234d58e5871cf9adb3debd5.camel@linuxfoundation.org>
In-Reply-To: 
 <8b13b18a7aa7568fc234d58e5871cf9adb3debd5.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NzBhNGVjNzMtYjQyNS00MGIyLTlhNGEtYmNkM2E0OGU1?=
 =?utf-8?B?NDljO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0wNy0wN1QwMDowODoxM1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a27b0ab-2df3-4c56-f723-08da5fb49b7c
x-ms-traffictypediagnostic: TYAPR01MB3552:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cMifxIw+qQE+CneSRJzC4I9MghZQDG41VkR8sIWOI0xxG5W2waW6Tfi7ZwV/8dKzsat3DZXmDPUTFvrIOStWBTCPzZPx0IjI2gZnDySPkAgPzuvqVgFybKFdJLJg6sZuxv9eR4qjIk9YZBrccsw/TjEHEUGWUk9voT2fKyLnP2qeMbCUcGiJ+NKRvTt9dmnDjZQ3SKV2u4rQ15DOl7YSWlIZBCCpxreIgQbfQ3ml9i37UVo+QgBYfAXnaCbyoe7UEEDeB3tOTmmK/H4hVy6ZF6mGMq6nCrBcrU416eEoBkW8Tjw+lCfxWSif3nhs0nuqI/3a8XRfPHt95AURJ3iJ2h1clQQHVzF8iJnwOQVI40UvGPzegRwFcpFpoXS/KOlCMoBoUe1b2lvRHlFY9pPbH7vPfY5shUPEI9quL8ica7/bsiI8XZBT1lp0C0razyLukyN2jAAUepTP9VAlX31Kt/qN0ya8pzSKJb35Dn2ACVCA04cGyHwCYQk5/72Cu8lnAznMlJORdvZC0PvLbO0zbdJ5yPRVCFbWQhWsMSK32VDFYWnVE2q/sjIOAwZqKKYYrlj4k4Lv9kC11ppoPASYRDFjiQMvMgwbvz3grQ2PTg0qhBjZY5iKzdabmdbBapDDkBT8EWRPiyErUNKZiRtkTNs3eM20p069dERl/Y0hgN7zTna/7EpMaA9pUHbqjtpYc3ORjfdxs5zkY6Z1igkqjiIzgNGBHrVB9G3Zf8UxY0SmOVqcgfa30KSbNLzcYJ41NdKeeq0+LpPvsr1EC4XhR3E5jtRz1PqDLsskkGLGRJeX6IDVglfuTwz95qRZ94Zj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(186003)(8676002)(38100700002)(66946007)(85182001)(82960400001)(478600001)(41300700001)(33656002)(66556008)(66476007)(66446008)(53546011)(76116006)(7696005)(64756008)(6506007)(2906002)(52536014)(86362001)(8936002)(26005)(9686003)(122000001)(38070700005)(5660300002)(55016003)(316002)(110136005)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MUJjSllha2IrUG1ERE54OTBTNTV1K3JhVlZQRk9FUDd1Z2xRZ2Vkd3pzWTJR?=
 =?utf-8?B?ZTlDSEFHUEMrcjdzVjZRUysyMHJCbWZMM1BDbkhBMGx3bW1YeWtLb25yWDdY?=
 =?utf-8?B?SU1GcWY1ejRwVnFoVmhObEZNNmhpU3lBOW9rck05NW45MEp1U3ZQcE93ZS9k?=
 =?utf-8?B?am9BN0htWlNpTkN3cHhZQWIxbmZnL0dEYW95STYrL1RKUENvaHJUZHJWOEUw?=
 =?utf-8?B?WjRZZFltUTV2Mk1Ob2ZUbkgvNEYwNzlrQXhUZjdVRW0rUGozSUFxWjZSeGFw?=
 =?utf-8?B?Z3YvV1lWWEZSdVJoZW56SW5RUXdYdUhuZVN5Q2dkbDBzWEordW1BcHlRaDJ2?=
 =?utf-8?B?b2FNSjRPNWRmUXVweTAzcG83aDBuZHVaWWtMb015YzlxSG9WM3ZEcDFBZ0Jt?=
 =?utf-8?B?aFg2dEZzSW4ySVVZS2w5YlF4dEJDZzliNlM3UDNDZ1doQXlXMzg3R1N0dGFB?=
 =?utf-8?B?RVhCU28ydmNFbm1jK2p1UDNZMTlaVzRHQThrM3RrMnhIYU9QRVpLU3hZWGM4?=
 =?utf-8?B?T3UyTHlrNXk3UVRTMGxvOWszY0I5bVBrSzh6OFpOMTFBNFJoS0dOZVRuTU5n?=
 =?utf-8?B?TzhOSHR4NjNraTBtWHVzMUxUNFp4cmh4TnlibWc5ODlnRkdyUXN4Nld2UmlU?=
 =?utf-8?B?WmxCYkhQeDRiSEt4eWNBMW9mTnUxNnlPeW50OFdiQ29QeEVRZFhxNVpxWndr?=
 =?utf-8?B?SkhQeWpjN1ZyMXdWWTFVcHpzSDZXaWQ4SmF0QkJlZC9XdEU3K2Vic3BUbE4r?=
 =?utf-8?B?TTZBbm9KVkNpWGhHZEJmUFlEZkdvRnA1NW41MDVNVjlpZkd5TWZaWVAwUDJr?=
 =?utf-8?B?RnRSR3VsZEVBR2xBejRDaWl2L3pGYWNNY2Q3RFZjVE1wUGlhK1RCRkd5akJN?=
 =?utf-8?B?dW9lRnB2TlZKNE4wOEQxMHVVQ2NtWjNVbDVxcEJyMk9wM0kxU2t2QTZGWWUx?=
 =?utf-8?B?M3dObHZ1TVF0cUZEZGlVNkxwRHdtR3FPVmFaRUt4TXFoV1pBWGFRcVFoNDVz?=
 =?utf-8?B?K2VYNVRwdVdpcUVIUWFHR214ejhTdFh1UmlMUzM5czlyNlArWGZMWVlsdzNO?=
 =?utf-8?B?NUZyR3dCVkRDNXNremFMOGU1UitRRkxERkJFUGtVTDI0ZXRGTFkyTE56WnVz?=
 =?utf-8?B?U3NhOVJtay9VL1NzQWs3b3dHQW15UlphQ0ZsVnR0SytIYmFPTHlXY3M1K2Vr?=
 =?utf-8?B?THMybnJjc3l6eEVmQUVBS0ZGSnVDOG5kaFZqa0NqVXd1MTk5TkdlMmh6Uzgv?=
 =?utf-8?B?cXVXRHFkaHh1MHNja25tWUwzUlRpMlhWSTQ3VitSNGVxVEJ2bkV5QlRNcWFV?=
 =?utf-8?B?YVBQcDBWcXphOWY0Vk5xbHZuSncrZHhhSjhiSExVUS8xRUJvK25pR3JBZUJh?=
 =?utf-8?B?Ymp5ei9xSi9kelZ5eTlTUGhjRG5PUFlrRWkzYXMwdzJONlVoS3lGeXJ6M00x?=
 =?utf-8?B?OFQ3STF5NFZmME9mRzR1Sm1YTWVyVS9hRVY1L0VPTzRqWWVSTEY3dlZvSGUz?=
 =?utf-8?B?RkhEWXovWEtKV1V1T2Q0UURqd0IrK1A4dVI5Yk5XOGp1b1doekg3S0ZmeVhi?=
 =?utf-8?B?amZwNWxyZGdXSEVieFl2VjdjV0RuTHF4blpUeUNXNzU0VlRhOFhTQ25VVmMy?=
 =?utf-8?B?VWN0N1UxMDdwYTgvU3pJWGNiOEl0NkNGRytwVVBOa04vRXVUeUt3NDJEMnpD?=
 =?utf-8?B?SEtpd1ZZNDlhd1NDVDk3RkQ0QjlsWEg2OUZvNkNKMjhvYnJtSi9EcExsMmhR?=
 =?utf-8?B?L2VKb3o0UnlEK1I1TjE4QUYzRDVkQVIvdkpmMEVJT3c2NDh1emxYaHBJaDM3?=
 =?utf-8?B?cVpTenhCWW5WT3c2b2svamJzS1c2VUhod3BCUUtqZTcyZDZhVHdwbzlDZDlI?=
 =?utf-8?B?azg4RmVqcDk4YWFiMFExaTR6cUFXQ25kRFplTTY3VFBaTUdDOThoRkFXcGlZ?=
 =?utf-8?B?eFFLS0xwb2F0L1l3KzVmV2MyNjlkeTNQRVYzRnhNaFJKVFJFMFFIbW5qQ1hW?=
 =?utf-8?B?L2NqQVdTb2NBU3E2M3g0S0M0L1NWMnFCOURMbktYZ1pZZWZldjhWUmx6TlhL?=
 =?utf-8?B?a1lCcnFxRU4yekFxS0NpMkx0UmlUcitTQTg3UWQvMHlTMHZsS2lPMC8wMWVY?=
 =?utf-8?Q?M4M/P4F9aIzQCbO3RAP3M94xP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7a27b0ab-2df3-4c56-f723-08da5fb49b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 01:04:13.3288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 0Bcr/MlxGow8Tv+eRzECGagN8hTUbpmJ7at8fEqnNNV/wYeAvAR+hwIl5yX47GCa+gDa7fSrxJavu0CYxjZLRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3552
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 01:04:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167753

SGksIFJpY2hhcmQNCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5Lg0KDQo+IEEgbmF0aXZlc2RrLXFl
bXV3cmFwcGVyLWNyb3NzIHdvdWxkIHJ1biBiaW5hcmllcyBmcm9tIHRoZSBTREsgdW5kZXIgcWVt
dSwgc28NCj4gaWYgU0RLTUFDSElORSB3YXMgeDg2LTY0LCB0aGF0IHdvdWxkIGJlIGNvcnJlY3Qu
DQoNCk9LLCBpdCBzZWVtcyB0aGF0IEkgZGlkbid0IGdldCB0aGUgdXNhZ2Ugb2YgbmF0aXZlc2Rr
LXFlbXV3cmFwcGVyLWNyb3NzIGV2ZXJ5IHdlbGwuDQoNCj4gSXQgc291bmRzIGxpa2UgeW91IHdh
bnQgYSBxZW11d3JhcHBlci1jcm9zcy1jYW5hZGlhbi0ke01BQ0hJTkV9IHdoaWNoIGlzDQo+IHNv
bWV0aGluZyBkaWZmZXJlbnQuDQoNClRoZSBwcm9ibGVtIEkgaGF2ZSBpcyB0aGF0IHdoZW4gSSBj
cmVhdGVkIGEgcm9vdGZzKGFhcmNoNjQpIHVuZGVyIFNESyBlbnZpcm9ubWVudCBieSBuYXRpdmVz
ZGstZG5mLCB0aGVyZSB3ZXJlIHBvc3RpbnN0YWxsIGVycm9ycyBvY2N1cnJlZCB3aXRoIHNvbWUg
cGFja2FnZXMoc3VjaCBhcyBnbGliLW5ldHdvcmtpbmcpIHdoaWNoIGluY2x1ZGVkIHBvc3RpbnN0
YWxsIHNjcmlwdCB1c2luZyBxZW11d3JhcHBlci4NClNvLCBJIGFkZGVkIG5hdGl2ZXNkay1xZW11
d3JhcHBlci1jcm9zcyBpbnRvIG1ldGEtdG9vbGNoYWluLCBhbmQgaG9wZSBpdCBjYW4gd29yayBh
cyBxZW11d3JhcHBlci1jcm9zcyB1bmRlciBidWlsZCBzeXN0ZW0uIEJ1dCBpdCBzZWVtcyB0aGF0
IHFlbXUtJHtTREtfTUFDSElORX0gd2hpY2ggbmF0aXZlc2RrLXFlbXV3cmFwcGVyLWNyb3NzIHBy
b3ZpZGVkIGNhbid0IHdvcmsgZm9yIGFhcmNoNjQgcm9vdGZzLg0KSSBoYXZlIG5vIGdvb2QgaWRl
YSBob3cgdG8gZG8uIFNob3VsZCBJIGFkZGVkIGFub3RoZXIgcWVtdXdyYXBwZXItY3Jvc3Mgc3Vj
aCBhcyBxZW11d3JhcHBlci1jcm9zcy1jYW5hZGlhbi0ke01BQ0hJTkV9PyANCkkgd29uZGVyIGlm
IHlvdSBjYW4gZ2l2ZSBtZSBzb21lIGFkdmlzZXM/DQoNCkJlc3QgcmVnYXJkcw0KTGVpDQoNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5
IDYsIDIwMjIgNToxMiBQTQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNv
bT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFF1ZXN0aW9uIGFib3V0IG5hdGl2ZXNkay1xZW11d3JhcHBlci1jcm9zcw0KPiANCj4g
T24gV2VkLCAyMDIyLTA3LTA2IGF0IDAzOjMxICswMDAwLCBsZWltYW9odWlAZnVqaXRzdS5jb20g
d3JvdGU6DQo+ID4gSGksIFJpY2hhcmQNCj4gPg0KPiA+IEkgYWRkZWQgbmF0aXZlc2RrLSBxZW11
d3JhcHBlci1jcm9zcyBpbnRvIG15IG1ldGEtdG9vbGNoYWluLCBhbmQgZm91bmQgdGhlDQo+IGNv
bnRlbnQgb2YgbmF0aXZlc2RrLXFlbXV3cmFwcGVyIHNjcmlwdCBpcyBsaWtlIHRoZSBmb2xsb3dp
bmc6DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIyBjYXQNCj4gPiAvb3B0L3Bva3kvNC4xK3NuYXBzaG90
L3N5c3Jvb3RzL3g4Nl82NC1wb2t5c2RrLWxpbnV4L3Vzci9iaW4vY3Jvc3NzY3JpDQo+ID4gcHRz
L25hdGl2ZXNkay1xZW11d3JhcHBlcg0KPiA+ICMhL2Jpbi9zaA0KPiA+ICMgV3JhcHBlciBzY3Jp
cHQgdG8gcnVuIGJpbmFyaWVzIHVuZGVyIHFlbXUgdXNlci1tb2RlIGVtdWxhdGlvbiBzZXQgLXgN
Cj4gPg0KPiA+IGlmIFsgVHJ1ZSA9IEZhbHNlIC1hICJuYXRpdmVzZGstcWVtdXdyYXBwZXItY3Jv
c3MiICE9DQo+ICJuYXRpdmVzZGstcWVtdXdyYXBwZXItY3Jvc3MiIF07IHRoZW4NCj4gPiAgICAg
ICAgIGVjaG8gInFlbXV3cmFwcGVyOiBxZW11IHVzZXJtb2RlIGlzIG5vdCBzdXBwb3J0ZWQiDQo+
ID4gICAgICAgICBleGl0IDENCj4gPiBmaQ0KPiA+DQo+ID4NCj4gPiBxZW11LXg4Nl82NCAtciAz
LjIuMCAgLUUNCj4gTERfTElCUkFSWV9QQVRIPSREL29wdC9wb2t5LzQuMStzbmFwc2hvdC9zeXNy
b290cy94ODZfNjQtcG9reXNkay1saW51eC8NCj4gdXNyL2xpYjokRC9vcHQvcG9reS80LjErc25h
cHNob3Qvc3lzcm9vdHMveDg2XzY0LXBva3lzZGstbGludXgvbGliICIkQCINCj4gPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gPg0KPiA+IFJlZmVyZW5jZSB0byBxZW11d3JhcHBlci1jcm9zcywgaXQgc2VlbXMgdGhh
dCBuYXRpdmVzZGsgcWVtdXdyYXBwZXItY3Jvc3MgaXMNCj4gbm90IGNvcnJlY3QuDQo+ID4gV2h5
IHRoZSAicWVtdV9iaW5hcnkgIiBpcyAiIHFlbXUteDg2XzY0Ij8gU2hvdWxkbid0IGl0IGJlICJx
ZW11LWFhcmNoNjQgIj8NCj4gPiBJcyBpdCBiZXR0ZXIgdG8gY2hhbmdlIG5hdGl2ZXNkayBxZW11
d3JhcHBlci1jcm9zcyB0bw0KPiBxZW11d3JhcHBlci1jcm9zcy1jYW5hZGlhbi0ke01BQ0hJTkV9
Pw0KPiANCj4gDQo+IEEgbmF0aXZlc2RrLXFlbXV3cmFwcGVyLWNyb3NzIHdvdWxkIHJ1biBiaW5h
cmllcyBmcm9tIHRoZSBTREsgdW5kZXIgcWVtdSwgc28NCj4gaWYgU0RLTUFDSElORSB3YXMgeDg2
LTY0LCB0aGF0IHdvdWxkIGJlIGNvcnJlY3QuDQo+IA0KPiBJdCBzb3VuZHMgbGlrZSB5b3Ugd2Fu
dCBhIHFlbXV3cmFwcGVyLWNyb3NzLWNhbmFkaWFuLSR7TUFDSElORX0gd2hpY2ggaXMNCj4gc29t
ZXRoaW5nIGRpZmZlcmVudC4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0K

