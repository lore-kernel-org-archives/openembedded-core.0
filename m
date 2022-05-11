Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3B2C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 08:15:20 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com
 [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web10.8933.1652256913921016635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 01:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1
 header.b=ZIl0OU89;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1652256913; x=1683792913;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=REYq0Mac1JbRn0AznXptAIowVCsY4leyDTb5ipyLvZs=;
  b=ZIl0OU89zcPiByyHoj3ALug4d915nsWj2clP+ccxhWxbI8IckzZt3pWF
   WEDMaR2GoGUurFoR04TsW3DF3TXMRy0udmeo08j266jGnVts+EkmgRq0H
   4J9KwJLzqiW7KNdURDMshGgKjIHaPS6yvBHck3Yl0U0MCocJEEN7dV4+5
   +ZUzySZbCDGt57BLrumJCtL9G2e9JQVFDfnsSzE18SMxzmMhtA0AgkyzS
   QMmLuO39NNCSH4eoww3Z1AfJYi2ve07UcKWOnTtW40uTSCsg+cfqxac9D
   HrqxhRIIp2pUWp4KhOG8mKw57SmEeJnV+yfnr7Kc+B3ZCqdwSttgSdx/x
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="63655407"
X-IronPort-AV: E=Sophos;i="5.91,216,1647270000";
   d="scan'208";a="63655407"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 17:15:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+JtEKTJX8C++Bo5kfLwRSiRUoLxdJ6tNG4b1f4x72YxuRU6QgZU03qsjLMN6zLIxz7okc3OV/weik2pKsa05P4t059Cr3KJix2UUQIhFuhx/YkZ/vaLyjdgNzmT2OqS3lihb6CW0H9wnh32ezSXfZ0INwPZ69vszuHOtziOHTMO+ouglcL81+2Jl8fLYmxkAl2r+hAlhixWwr1maQaBeJMLOZJAczNI3C9o/ncCPmWYF2UIsUr7NSf24Jp90QlPk5ZPSOcXwFJb52ocllmX6qWE1BiF54eR5RormPm+K+/pt+j4qX4WQaWR5o+IL6iaGZMH46RISZA8pXnZJ9RZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REYq0Mac1JbRn0AznXptAIowVCsY4leyDTb5ipyLvZs=;
 b=Th9D8LKgbd5Ggg0jMQZn3T0Hebfko69dzH56/mLVOhJ1CK6VRrUFrAs1CPYFvkRCGlhA5DUPcw4H/hjBiejEVltDMcNCEGJTwf1cJU5+QPEKYbkq4FBu+V+vWWAb3OcHJJCoTQ6ynfV41mj5zKZ2MAfRI/TJ1UYiWK+V4jjhB/uaP0NF2vyQAnCmzFYSXD/EVfWo2D1MEP1T4YvSE+v9Tpu7K3ST2IR/E9yiCAP3KlK7wOuCUJWv535C+PzMUhu6yve4JOLV0Ozvo2RCQMlRtmoXJockgeFftB+xjBIbpSuQeHTKKm3x2SCHErlvdveNPjbzgKAT+yUqMGIB//T1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REYq0Mac1JbRn0AznXptAIowVCsY4leyDTb5ipyLvZs=;
 b=WJa29JZsBsictJ+GZk0t6WA+ndIaWAMnmvgOITD+VHmVeK8u+HzirEq/TyMpcvbCwYq0LTTTUbjcWtQJSDgF2x6qcNxfdE9rkLfz9CxMSawixSvMK0jZ+vPnkSW9sjPKL3SMktYBtDBUwaFxNEzxJvmyvi4E8nJEZuTH29OZyJg=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TY2PR01MB2041.jpnprd01.prod.outlook.com (2603:1096:404:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 08:15:07 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%7]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 08:15:07 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Topic: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Index: 
 AQHYYPqy/ocPXdQui0OLuVvDKY1+Ca0RY4IAgAEiy4CAAIIIgIACu/kAgAB7qACAAQd0IIAB6a4AgAAl6/A=
Date: Wed, 11 May 2022 08:15:07 +0000
Message-ID: 
 <OS0PR01MB6178F55D656ACB5989CB03D9A0C89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_wg3r2smGwNVoN34L0ai-pPjPEfjg0P7LoQEirfL8rhQ@mail.gmail.com>
 <OS0PR01MB61785EBD9D1441B3201AC1A2A0C69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_K42tgo7kRVV4fOHkFXQBxEs86KdGBX_vbYsahip9FVg@mail.gmail.com>
 <OS0PR01MB61786F05D3748BC41FBC3CDBA0C99@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj9-xW5_mEh1UTyX_AJ=nVbsN4LOhTGjYGVRvZjLH7=skg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9-xW5_mEh1UTyX_AJ=nVbsN4LOhTGjYGVRvZjLH7=skg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38436635-c14b-4dd4-fd70-08da33265c4e
x-ms-traffictypediagnostic: TY2PR01MB2041:EE_
x-microsoft-antispam-prvs: 
 <TY2PR01MB20411AC60F7087961EF40BFAA0C89@TY2PR01MB2041.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZhRMVimHyJL97gezf7myAo2soBhnj/90VBuJYJ80NYAijkWvJbuwmoxq6uL9nkHjeigvfwCKkd+cAgPP4LluUuQOLZPIjwOhRX0ByjRQKIplcBi8iDiH6tovy2L0iH6AqPoOsspjzh+6TDA8++4Ni9e/UJHCsiQ/yEbxLsKmZby7FWHj80eN+GC7pFa05CfWfZHH/4iCe4CiLVpqjtvwpe9YZJqBy+Tv43+5t1SFFPPHzUt12Vt01INvkvy1bSAtlDLWWo01m2llb6cwZjnflF7jOfQPB9zJaJLPymR0+G5JW0r9/bYIddiW1twIEQmviE2cQEQlnP3fGKPTdIUbMEqS14E7mN++uGRYysRa6/qGXGSVI1bv0yFb0MqUwwF9CPpWJ6NqnW2fkVuSZBT+/no3lwDKy7D/dJRL+BtPxugBogFRmCyYn1kmot7Ud4hKdLBjWw4PBH6M5O4VKeMYB9gd6JOfvNirggiPSM2Zwd1ukw0MDTp19QadMMZEi4lkGT0OZ+MsIzpqM2r2CbIrK7t1Ce54UxTlZCCMJKw4RGi2PHBfhRKSAYRZ0usHRUj3uZKlhWIVJ061j+WuARLW2lpbfcBJd9uZIvzUfYWFkf5L1HrMyY2VJjVvyitofJfo0B9tI3+sumd1MqcxfqHUaOBJkwVUuNI6+vCIuBnnIC9JcTPKl2qaKxgqpymoqmD9KmzDQ6W6mC4TT4dr0NndYatVt1yoWInntqklb3y8FCg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(86362001)(9686003)(52536014)(71200400001)(4326008)(7696005)(6506007)(26005)(38070700005)(66946007)(66446008)(66476007)(76116006)(64756008)(8676002)(66556008)(508600001)(6916009)(38100700002)(82960400001)(122000001)(53546011)(55016003)(83380400001)(85182001)(316002)(2906002)(186003)(33656002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkNOYndqWWRjVXFpdjVwNllEdmYzblpjK2hrUy93N2NIdjI0R25ERC9LRnNj?=
 =?utf-8?B?MXZHMlVMRUEwdU5EdzYvTHZNY0J0ZFdVeVhpallqazRTSHRaOGlyT0ZHZDBu?=
 =?utf-8?B?WVg5U05NYzVuUFJ4eW5vVmZaNjBZdzBmcnhWN1hRRHczdFJkVUs5bFNLSGdV?=
 =?utf-8?B?SHFyZ2U3QUJxcXdBRFBlL3FJSmV3Wk9PNHNLUWpJS1pEOEZJb0pXYUloSDh3?=
 =?utf-8?B?eDhTbXJJS3dwTUREc2tISmNSQU1nbnMwQTRUZW9JdWx6TnRZR00zWDRkT0RH?=
 =?utf-8?B?NG1HQXlvM1BzODgwd0JwNm9kaEo5VCt0TU5kRm04cWVrVVVwYld0aXFKZmRl?=
 =?utf-8?B?UVFEeVVFMXNTUUtpUXNEWnBhQ3VSSkhNSFZGQ0lIaGxzWnhZZUlHUm8wWW5s?=
 =?utf-8?B?Vmczb1NSYmJESWxGV1FjWER5STc5SkVHMHZZaUVXNE11SDBUYVdneVUrN1Q3?=
 =?utf-8?B?eUpmUmhRVElWMU9TK3ZyZWxybEUrOWxEcERzMkczQWNteVhOdWRQdytkeHY5?=
 =?utf-8?B?WkM2VFlEZTFySEtsVG5kcHFZSmsyTDd3VENqU3RQQ0g5K054ak5TSmE1QUpR?=
 =?utf-8?B?RjVIUWtrT2crcXZaR0R0WWdQbDZoeUppZ1g2SlQ4amRpd2hQRCtwbUZKaEZ1?=
 =?utf-8?B?UU4rUklZUHhWNlRJc0I0djlvanpsM3pLUG5Cb1gyVmVncVVEeXhsSVFUOEhx?=
 =?utf-8?B?L01Jc2Z1cEhJdjZvbDU3UDBVRGN5QzlIemRCOUhoQ0lnVHN1SXdyNXBiUGVW?=
 =?utf-8?B?ejZQVGUrQ21EL0dmZnlmeWh3WDVLVmg0RCt2Y3dsUjJIcllCUmphbnQycDN0?=
 =?utf-8?B?TEtZRW14UnU5cEN3b2xPNHFCUlF6NzNVdG92WU90ZFFBaE5wU0RRNW0yVVlZ?=
 =?utf-8?B?VUNLM1V0eGI1K04xUTFwL2pkYjM4L3JBTWhQaUlXK0FpSVN3THRWeWtBZzlu?=
 =?utf-8?B?MklIejJjYTUyaEhLNEF6KzFQUGVvSU5nNXljSkpwbHpOZ2YrSmo1eXppVnBa?=
 =?utf-8?B?OE9NRGpsSVI4VTMxclorZzV2MGZ0UFZnejlJS3l3YS9BTjVkcUJveTlLamsz?=
 =?utf-8?B?SEg0Vy9jSGo3WWZ3dWxpTTA3cnJ4YlNMdHpsUlB2VjM4WVphRUIyMnlHVFpm?=
 =?utf-8?B?ekZJY1VHbDJ4OEVmTkpiczhpdzV4RmFzeWEycXBjaGppVHFmZXE4UU5iM3FG?=
 =?utf-8?B?bTFnWmRmTndVMFB4MG90b1Q2NVlnYUZoTUd6a2d5dktFVXh2THpSOEFXYThM?=
 =?utf-8?B?NjRBTXp4bG9nT1M0WGVrakMzcElvcFVoNEhLK0lXcWVJV3d3M1VwWmE2UmE0?=
 =?utf-8?B?cGU5YTA1MUV5NzJ2VWlVYm5kRmd4bEFHSituemw3UGJBWUNFNUZYQVNNVUJG?=
 =?utf-8?B?Ynk0K0FkRW1vaDRsK1EwZHk4NDZmYXNLWUtCWS9vSFltWE1ha29MZEN5ZzFS?=
 =?utf-8?B?N2ZldERaYnB4cmhXaFFXMEgva3BIRHU3NE9mUVFXdGRyeWVUN2FDc0hyK0J1?=
 =?utf-8?B?WDdEYlJpRGc0VC9pcHBoU3MweHFja2lDUk1WcDgxbVdyOFFvK25KR04yaDlk?=
 =?utf-8?B?Nk10Z2w1alVPbXJwa2tDcFloc0ZlNTUxdk9nR2ZIQ09BQXRnd0tkaXZBQUFy?=
 =?utf-8?B?dTNveVRLNnVuT1lYVE5WNVlhOU5ORldOem1nYmNqSEcrejcvQzJoTEQvU0ZF?=
 =?utf-8?B?YjJQRkJuOWdZcDZOMGhhOGVFOFFLWThJaHdXVXlHL1p0Y3lJZVlyVlZUcTNB?=
 =?utf-8?B?K21POVZVQ1FKSFBSYTA1VSt4UlJya1lXWXFjb3ZpcUE2OWU4R3BuUExtM3c4?=
 =?utf-8?B?akRrU0cvK2tkcjNkbmM1Umg3OVVWRzhhZFlVR1RmNHo5OTNvL2s4UTJacWFR?=
 =?utf-8?B?Z1JBaFk0akV4K21UODNRL0l5ajFhWlltbysrQ3VwQzY1OHc0OERhVG91Q0pF?=
 =?utf-8?B?UW83N3doTUFHUHVIdzVuNGpUZXYySEJSTEdTMmt6K1V2cGFJY050ZEdKcGJU?=
 =?utf-8?B?OU1uQXp3YXNxQ2NyZ1d3WkhYSmV1azhlQVh2ZFlEUkJ6djk2VmF1VXhRUmRz?=
 =?utf-8?B?YUphR2FyV1UyZjlLZ3RzNHBKeGcwdnhzeHZNVGZFRlRjR2hJdWg1UnY4Lytw?=
 =?utf-8?B?Rm0rUUlLYjhCSUkyL2FCL2Nldk5EQks2VktJMFI4SlFoYlFBSFYwaVN2VWFn?=
 =?utf-8?B?Y2JzNGtyaDR6bHNRVmJkMWJJZFBGcU1ILzlVeTQ0TkZ3bkpqVUd4Q0RYU1A0?=
 =?utf-8?B?OUJyWnFmMWZGN1ZHQ3NXemJEejJUcU1qYnBhZ0NvcS92YjlBUDY3bzY1MXVG?=
 =?utf-8?B?eVdEVENGUGpwQUs5L2hTZUhURTJnNy9iaW5JL1BWc0xIZ3JHQUxpUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 38436635-c14b-4dd4-fd70-08da33265c4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 08:15:07.6332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 gVzmfCgJob324oKc0QxGtvPx4msIBkjkIU22O4886iXq3f39IPNAqSxFmeUYgInZ2PzeYUIIdTb0qETpv9soww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 08:15:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165490

SGksIEFsZXgNCg0KPiBQQUNLQUdFQ09ORklHID8/PSAiZmlwcyINCj4gUEFDS0FHRUNPTkZJRzpj
bGFzcy1uYXRpdmUgPz89ICJmaXBzLW5hdGl2ZSINCg0KSSBnb3QgaXQuIEl0IHNlZW1zIGFuIHVu
dXN1YWwgbWV0aG9kIGJlY2F1c2UgdGhlcmUgaXMgbm8gcmVjaXBlIHVzaW5nIHRoaXMgd2F5IGlu
IC4NCkluIHRoaXMgd2F5LCBpdCBtZWFucyB0aGF0IGlmIHVzZXIgd2FudCB0byBlbmFibGUgZmlw
cywgdGhlIGZvbGxvd2luZyBQQUNLQUdFQ09ORklHIHNob3VsZCBiZSBhZGRlZCBpbiByZWNpcGUu
IA0KDQpQQUNLQUdFQ09ORklHOmFwcGVuZDpjbGFzcy10YXJnZXQgPSBmaXBzDQpQQUNLQUdFQ09O
RklHOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSBmaXBzDQpQQUNLQUdFQ09ORklHOmFwcGVuZDpj
bGFzcy10YXJnZXQgPSBmaXBzLW5hdGl2ZQ0KDQpTbywgSSdsbCBzZW5kIGEgdjMgcGF0Y2ggaW4g
dGhpcyB3YXksIGlzIGl0IG9rPw0KDQpCZXN0IHJlZ2FyZHMgDQpMZWkNCg0KDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDExLCAyMDIyIDE6NDAgUE0N
Cj4gVG86IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IENjOiBPRS1jb3Jl
IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCB2Ml0gZ251dGxzOiBBZGRlZCBmaXBzIHN1cHBvcnQgb3B0aW9u
Lg0KPiANCj4gT24gVHVlLCAxMCBNYXkgMjAyMiBhdCAwMjo1NCwgbGVpbWFvaHVpQGZ1aml0c3Uu
Y29tIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IHdyb3RlOg0KPiA+IEknbSBhZnJhaWQgSSdt
IG5vdCBxdWl0ZSB3aXRoIHlvdS4gU2VhcmNoZWQgcG9reSBieSB0aGUgZm9sbG93aW5nIGNvbW1h
bmQgYW5kDQo+IHRoZXJlIGlzIG5vIGV4YW1wbGUgYWJvdXQgaG93IHRvIGNvbmZpZyBQQUNLQUdF
Q09ORklHW3h4eF0gZm9yIHRhcmdldCBvcg0KPiBuYXRpdmUgc2VwYXJhdGVseS4NCj4gPiBUaGUg
cmVzdWx0IGlzIGFsbCBhYm91dCBob3cgdG8gY29uZmlnIFBBQ0tBR0VDT05GSUcgZm9yIHRhcmdl
dCBvciBuYXRpdmUuDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ICQgZ3JlcCAtaXIgUEFDS0FHRUNPTkZJRyAqfGdyZXAgY2xhc3MtbmF0aXZlDQo+ID4g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2xpYmNhcF8yLjY0LmJiOlBBQ0tBR0VDT05GSUc6
Y2xhc3MtbmF0aXZlID8/PQ0KPiAiIg0KPiA+IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW1f
OC4yLmJiOlBBQ0tBR0VDT05GSUc6Y2xhc3MtbmF0aXZlID0gIiINCj4gPiBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9zcWxpdGUvc3FsaXRlMy5pbmM6UEFDS0FHRUNPTkZJRzpjbGFzcy1uYXRpdmUgPz0g
ImZ0czQNCj4gZnRzNSBydHJlZSBkeW5fZXh0Ig0KPiA+IC4uLi4uLg0KPiA+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPg0KPiA+IEJ1dCBJIHRoaW5rIHlvdSBt
ZWFuIG5vdCBQQUNLQUdFQ09ORklHIGJ1dCBQQUNLQUdFQ09ORklHW2ZpcHNdLiBGb3INCj4gZXhh
bXBsZSwgaW4gbGliY2FwXzIuNjQuYmIgZmlsZToNCj4gPiAkIGNhdCBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJjYXAvbGliY2FwXzIuNjQuYmINCj4gPiAuLi4uLi4NCj4gPiBQQUNLQUdFQ09ORklH
ID8/PSAibGliaWRuICAke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsDQo+ID4g
J3NlY2NvbXAnLCBkKX0gIiAgLy9ub3QgaGVyZSAuLi4uLi4NCj4gPiBQQUNLQUdFQ09ORklHW2Zp
cHNdID0gIi0tZW5hYmxlLWZpcHMxNDAtbW9kZQ0KPiAtLXdpdGgtbGliZGwtcHJlZml4PSR7U1RB
R0lOR19CQVNFTElCRElSfSwtLWRpc2FibGUtZmlwczE0MC1tb2RlIiAgIC8vWW91cg0KPiBjb21t
ZW50IG1lYW5zIG1vZGlmeSBoZXJlDQo+ID4gLi4uLi4uLg0KPiA+DQo+ID4gRGlkIEkgbWlzdW5k
ZXJzdGFuZD8NCj4gDQo+IFNvcnJ5LCBpdCdzIGFsd2F5cyBhIGJpdCBjb25mdXNpbmcgd2l0aCBQ
QUNLQUdFQ09ORklHLCBhcyB0aGUga2V5d29yZCBpcyB1c2VkIGZvcg0KPiB0d28gZGlmZmVyZW50
IHB1cnBvc2VzLg0KPiANCj4gV2hhdCBJIG1lYW50IGlzIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+
IA0KPiBQQUNLQUdFQ09ORklHID8/PSAiZmlwcyINCj4gUEFDS0FHRUNPTkZJRzpjbGFzcy1uYXRp
dmUgPz89ICJmaXBzLW5hdGl2ZSINCj4gDQo+IEFsZXgNCg==

