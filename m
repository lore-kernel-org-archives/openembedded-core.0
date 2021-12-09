Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE3EC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 03:16:16 +0000 (UTC)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com
 [68.232.151.214])
 by mx.groups.io with SMTP id smtpd.web10.6705.1639019774648762356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 19:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Q56Rt4VM;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.214,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1639019776; x=1670555776;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eWt++iyISbRrVZesjudIYcpjvT7dLOlfdX3fQXjZvhA=;
  b=Q56Rt4VM8fMPf37kDvL2i3JpxWpxpVtd3TweaEBYr5KqK7CtnrTaCwzM
   gRffDoiFAcleuKzbkUJ2SqJrgzUtacfvQqTArNHO64Z3BfPdCvjAN3hSg
   VEmsmkTneLF7bLmusGWTbGyZa5z5Ca4SwW/dJw/s3HfGQRWvwjB//jQDX
   +aet0A5jcHulgOwll+2pqejpUNARVZvMIsJwwokEPVKw1Ox8wanBNiuiO
   zb+CZG/W/VzjcInlgqBarR3SgcOPlmCbll1EWfNat2A6Hx1Z+7Q9HpAlZ
   09vf/mxRSz7s9qtVbvzwSHz3Vf7Tj+IFq9+Umw10tjvUmHZD/3XKrYv4N
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="53397139"
X-IronPort-AV: E=Sophos;i="5.88,191,1635174000";
   d="scan'208";a="53397139"
Received: from mail-tycjpn01lp2174.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.174])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 12:16:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYCVUrDnjojFkJ9BF6FXc5J/JADQvgPAoLXDG6AmNZpv6qDCavbW4oHAMVpQlwZRbBfsocKJEmgMEP3Z+myHsmdQ+Zb2zi5mc33zBouFk4h/pYEboRkkcDnI87wOznx0oVhb0vcA8fydmDsty68IQg41joRIUzLQJ9rfBRqPg8ONFqbsQr5nCcoBfjeC3i/2L6E+4hHXrsvAVJyY2T1iHTy8dnzwTEyI768EM29gHgBtz5ApzbSZ1J6k5vLc2Om3rQsxMCqQ/ViyGpdzFDHuVzMxzDJeVf6Jh9BdEB2lUS6Oi5gO/+Vo6MqbgYV6H9NQ3OZ6DU+J+o141dGAvG9gUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWt++iyISbRrVZesjudIYcpjvT7dLOlfdX3fQXjZvhA=;
 b=denwy6IloMCd5IfHkSO3dD6j0hXJ98rtGzGPS9ischeP90wJyYLtgOtw/bjDG+9OKNULQ34LEqA/xaNXEGA5Urtb/ue5j7JQ2cL4rrT0Db6dRtPhrfFGeLVcBdQhuOg2kg83UGdccgEiDtOJZahdAeojD5vvo9p5+ltsk4z+y67vkaPhw+zYYkGjjQ46MZzbZHLYDfYm6D1dOSpS5xAjcPxYk+fLaLnRlIr9Tn+MG6V4udcufrvR1PLyMhjoDjM9GjHxAakYU8LGoJoVFqE64uD3lyUJHL+T3exVOM1PWP6I0xdii3luYiFGq2dT8vrmhu4CIIwtIBLghmcXa8qXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWt++iyISbRrVZesjudIYcpjvT7dLOlfdX3fQXjZvhA=;
 b=gcZwDtnFY1EcwogtF0IMSj3LzQCM4ngfA9f0HksS4ggL+lcnd2BBtFJ5v3tzaE6v26t/KMygNJ1TnTWHttG/TISAzN6YwxwhCKFF3d7Bx+CHV5QT1cV7wC1IHld3RMiuC9SwunZi4AlbDwrNNwuOUp98xG8ENWStCJwlFtWXc64=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS0PR01MB6435.jpnprd01.prod.outlook.com (2603:1096:604:e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 03:16:08 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::30c2:e4b4:cf0c:973c]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::30c2:e4b4:cf0c:973c%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 03:16:08 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
Thread-Topic: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
Thread-Index: AQHX6rT5UQ+SjfiM6kCJK5KfMxTRmqwnCX2AgAJZ3yCAAAYFAIAAFwRw
Date: Thu, 9 Dec 2021 03:16:08 +0000
Message-ID: 
 <OSBPR01MB1845CD31B635BCDB8F52198EDC709@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
 <f206d7acc80b1d4f4425898539f06b33dfd091b8.camel@linuxfoundation.org>
 <OSBPR01MB18453CFB47B0AD1D05F85635DC709@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CAMKF1sr08pvVT=fVrdivghTWO_k4aKggX6P4nQR0-y4yr1bWUw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr08pvVT=fVrdivghTWO_k4aKggX6P4nQR0-y4yr1bWUw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 766cf1ea-4055-4a9c-5cef-08d9bac23e58
x-ms-traffictypediagnostic: OS0PR01MB6435:EE_
x-microsoft-antispam-prvs: 
 <OS0PR01MB6435EFBC817FC269AF35D8C2DC709@OS0PR01MB6435.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 D+eQVPeiETKqVcWFV1RKItyBmJbFv1yy8U+KAkEbGmmLr9BhhAurOdQFJIuNEzjnTNPBQ8+KGGwPlR30rpv8rsl267fU8urPMXOpkj7PAvLBB8+3oib4qxYg4dzcWVt2ihrRzYq4noi87jr6rRFeyilAAKM6gdRsGnuiwb/IRGySyGmFTrvRXFiVKFrnFDdT2fAhfDQQIPHOHpsIzY/2aiqB+9kKPh3GgTL7b/GCe35fQGaBW6qoCIJ7eD+PFpnu7+9u5cS7lr5jj3SD1xbChTpgLjNqSFSi/wCirIUEhqg7we4szPYL+/13LDjhSsoazYkRRaS0h7vFYEp6HKSSoHI71mBgM6Klpm/EzSApW3lPfHj1AYfYygQc740A4ITCT3DsIeG4B3p8MtMNqbhaBQUHe3/V1KvLgOZh9UbnOzIsCf0ieYzdaJU+GyT7C/i+K1jqcSpV84fH09swmfI5nlIiBMYsBcEmuFZrOI+RVP3MouZzQpymkfEwq3btPw9ntDlRD+HxsXYwyYDRCpkeI9FYBmLEaAm/YScYttpzECC0WodG5FaCEcRWRC0Sq455TF+iX7EI21FheYvtMR74tkBkBDJO/4z6LDL8L0r88zY76J+T91kz5wtualdnPw0jlJOUzFcV8dtK42iTLSwgaR4voZX/03LgIuyPwrXaYybuDTrIbs7kalHoNL5HQhiAp5p7IbCjuwi9AWKu/qJQ4+md/k7ocA/qyxbZ1Lj9EHlSVK8+r/zJGzFACuE+RT1P+vQ5XVJlffhA8uf2L7O2bIbVcfxpakDUx5OssPcTwPFiCRuWGuyF05xc5KUxnkMlK7Xqfz/7N3Uf78e9HtYQpg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(66446008)(64756008)(66556008)(66946007)(4326008)(71200400001)(9686003)(76116006)(8676002)(26005)(66476007)(54906003)(52536014)(6916009)(122000001)(508600001)(8936002)(5660300002)(316002)(7696005)(38100700002)(82960400001)(55016003)(33656002)(86362001)(53546011)(6506007)(2906002)(83380400001)(38070700005)(966005)(85182001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WmVId1U4dGg2ZlR5U3BNSTRjMTNNMzdDWi9XVGlWSTJ3T1M4UU9pbE9UelFR?=
 =?utf-8?B?SUtwS1NEWGJOekV4L0NMb1N6MEQ5UWN2L1dwY3dZNE9weFA3ekhhSjA1RlRu?=
 =?utf-8?B?c0c4NlZ3Zlc5U3VCelBjbWhoUjhnMzVPK1dQazZVeU9lMER0bWhadTJ1Unc1?=
 =?utf-8?B?UHh6Y2dkVlR0VVE1TTBZNnFmWGVaWHZDUS9NelhncVRNYjFhbEdjdkpiZ0tF?=
 =?utf-8?B?ajBCSnZZOWxqQlBpRWFpTHpuWTBvTVNuLzJTcVQ0UmhDdUpFUVJ4TG9BYUhm?=
 =?utf-8?B?QnB2ODBySnJqdWx4REV2dVNBYkVwL0x1NzZtK2ppOVFMZGFZQVJ2T3l2bDkw?=
 =?utf-8?B?NUhJSkpCYWFFN0hOcnB2YXl5SjJXWmlIUW1mK0h1L0d2Tmczb3E3WjFjNTNG?=
 =?utf-8?B?b01OcW85U2RYaW1FYWkxRS9BcFR3THgzSURmeUxYdGJPTG1mcnJuQnFMTHZC?=
 =?utf-8?B?b0JmRnlNNVpQS3dkdlZRajZ5ek1uaktrbUN5RlNwNXZSYnFUL1ZKT3NwQTVP?=
 =?utf-8?B?andiL0JKZCswdGFGWXJRbmZ0dmxrY2xLdjdwRVpYTjhma0dpL3hzWitac0pu?=
 =?utf-8?B?Rlo2UTBhQkoydm5oUGttTHVHaGJIZGl1VlVwNFBGMTE0b2MyVkJqbGFualdS?=
 =?utf-8?B?b1puYXBPb1ZYVUd1Q1MyaTUwMGhWV0FYMWhjcExFTHRkN2x3Nk43NHdvNHB6?=
 =?utf-8?B?OUpmWU5wRnVvUURQZTJaMTd2WHRMWXpacld0RTU5SnROdW5rZDVzOVY5VFk2?=
 =?utf-8?B?d2ErT1hFNUFEa1VOQnplbzZXcHJ1RVEyaHJKUmQzaDRJOUwybmpoN2tiQUpX?=
 =?utf-8?B?L0hiUEYzbi9pWVpiTmVUYnZXVU5vU2dpdXE4VGRsZHFnVGlUVXdheXE4YWhJ?=
 =?utf-8?B?TmRoWGlSVG85akhYY1B4alI4aDZ1NFZ5L3BRMjhTdHZST3IwTnhaOE1tbGtk?=
 =?utf-8?B?Vk0vdHU2NTFzVkRDTklSUFVGSkM4NEpZSXlmWEhhUVFQUkZWZGMvSmhRM0Fr?=
 =?utf-8?B?SUNYR3Y3dFlXRmV4VVJrSzlFd2QxV1ZSb2V6cDBiZ3lJK3JiT2U3UDhuQ1J6?=
 =?utf-8?B?VWVHQnNJSzlOblFMRzFEdmF0T1JhODVwU1hBckhkUUtvbFJOOGUyNFY2OUhQ?=
 =?utf-8?B?SXVEWmxvRDUrbFdRelluSWl3cmRUWWlMSDEyZHdHenlMcVVoWEJPT0lxR0I3?=
 =?utf-8?B?dkxMUW5KTVpWZGJXNnJsdEdVdG90b3hqYXRIRXNOdFVJb3h3Q2s1TDUxU0Uy?=
 =?utf-8?B?YTIvTlR5Y0x1b3VsN2NIUlJ0YlUyYVRsd2dLSk1BMlN3NFNSdVRjaDBXa01D?=
 =?utf-8?B?V1dBSVNDamdhQ0QwVXhMclNQTnhGalBUb0ZZbFRoMnhUeEF0YWRHR1RSRHgy?=
 =?utf-8?B?c1Bvby9aQXlaQkpOZXdQTkFQYmY4UHdINEQ1ZDZuMjQ3V0hpMVl0cjY1ZTAz?=
 =?utf-8?B?bHVabTczZGNsMEd3Y1EyUFR0c1BQRnh2T2N0UDg3aklEdnlCcjdUV2syMXNp?=
 =?utf-8?B?ZUpVdzhxaHJWMWFqdTA4RnNmSllOL1h1cjY1ZnpxUEpTbTJpa0RMK3gveVFk?=
 =?utf-8?B?R2ZsS1p4TnRRZWtDc25GcWMyWFJkVzhjbUZBTGl4SVA3aEppWjRObTB6a0RL?=
 =?utf-8?B?NkNCM2V1UmN4RTVXR0NjcmJibk5wZjZ5N1ZMS1FtcWtvbXZtY0J6aDdGYzYr?=
 =?utf-8?B?NXo1cEVYS1BwOVcvZklyT09mY1dFY1hKLzBJYlNCdXVBanlRV2tJUk5rR3Vp?=
 =?utf-8?B?U1p0TVY2T1Z5OVpjR0lhSHpJRlRQVXFBOEhraXVidzhKYWp6MUdUaHFjZlMr?=
 =?utf-8?B?Qzg3SVdaUGRvYUZNQXh4eE5BQmhRY0JTcUR6dmhBcjFqUnQ5NkEwYlN0UXcv?=
 =?utf-8?B?WmZjL3hlMmJyRHpJeWFrQ0FRSFpRaUJpSFNMUmpHejIxRVFjTkJHQmU5MzM5?=
 =?utf-8?B?YzUxbWJtTTZDeVhjdTlkRnM3ZkhNcEs3M20xM2JrSzZoZHVzSFExbWppMnE2?=
 =?utf-8?B?OVFLUlo3UHhISU9Wc0wyZDRYRzlqVHZjWlV1ak1ONzRXMjFsR2V3RTBkb0Yv?=
 =?utf-8?B?WXM4cjZLZ245UXN6M3F3RXRtcjV5dHdKTWR5dGZDM3RmMnI2UExTS1dXb0Yv?=
 =?utf-8?B?bUNjMmJoTmFFQjZiQjlOR0ErTTliQXZqOXUyYUFMa0c0cE5tOHdSK1pIQnlT?=
 =?utf-8?Q?9jlj5r0yFuTq9Q7NvScW4b0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 766cf1ea-4055-4a9c-5cef-08d9bac23e58
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 03:16:08.1254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 NEuNvPl+vkufim3OK74Cb7Crp52iH6G08iGcFIMXGjKNDPc+lmh417BQUJwmoAZbasR05GUf9LOgZaTqy02cNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6435
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 03:16:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159439

VGhhbmsgeW91IGZvciB0ZWxsaW5nIG1lIHRoZSBjb3JyZWN0IGZvbWF0LiANCkknbGwgY29uZmly
bSB0aGUgcGF0Y2ggd2l0aCBwYW5nbyBjb21tdW5pdHkgZmlyc3QsIGFuZCB0aGVuIHJlc3VibWl0
IHRoZSBwYXRjaCB0byB5b2N0by4NCg0KwqAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRGV2
ZWxvcG1lbnQgRGVwdC5JDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28u
LCBMdGQuKEZOU1QpIE5vLiA2IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpU
RUw6ICs4NisyNS04NjYzMDU2Ni04NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgz
MzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCmh0dHA6Ly93d3cuZnVqaXRzdS5jb20v
Y24vZm5zdC8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgOSwgMjAy
MSA5OjUyIEFNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3Uu
Y29tPg0KPiBDYzogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBwYW5nbzogdXBncmFkZSAxLjQ4LjEwIC0+IDEu
NTAuMA0KPiANCj4gT24gV2VkLCBEZWMgOCwgMjAyMSBhdCA1OjMwIFBNIHdhbmdteSA8d2FuZ215
QGZ1aml0c3UuY29tPiB3cm90ZToNCj4gPg0KPiA+IEFmdGVyIHNwZWNpZnlpbmcgREVGQVVMVFRV
TkUgPSAneDg2LTY0LXgzMicsIHRoZSBwYW5nbyBuZWVkcyB0byB1c2UNCj4gcGF0Y2ggdG8gbW9k
aWZ5IHRoZSBjb2RlLg0KPiA+IEkgYWRkZWQgdGhpcyBsaW5lIHRvIHRoZSBiYiBmaWxlOg0KPiA+
IFNSQ19VUkk6dHVuZS14ODYtNjQteDMyID0gImZpbGU6Ly8wMDAxLW1vZGlmeS5wYXRjaCINCj4g
PiBCdXQgaXQgZGlkIG5vdCB3b3JrLg0KPiA+IEhvdyBzaG91bGQgSSB3cml0ZSBpdCB0byBhcHBs
eSBwYXRjaCB3aGVuIHNwZWNpZnlpbmcgeDg2LTY0LXgzMj8NCj4gDQo+IFNSQ19VUkk6YXBwZW5k
Ong4Ni14MzIgPSAiIGZpbGU6Ly95b3VyLnBhdGNoIg0KPiANCj4gPg0KPiA+ICAgLS0NCj4gPiBC
ZXN0IFJlZ2FyZHMNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gPiBXYW5nIE1pbmd5dQ0KPiA+IERldmVsb3BtZW50IERlcHQuSQ0KPiA+
IE5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkgTm8u
IDYgV2Vuemh1DQo+ID4gUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KPiA+IFRFTDogKzg2
KzI1LTg2NjMwNTY2LTg1NjgNCj4gPiBDT0lOUzogNzk5ODg1NDgNCj4gPiBGQVg6ICs4NisyNS04
MzMxNzY4NQ0KPiA+IE1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KPiA+IGh0dHA6Ly93d3cuZnVq
aXRzdS5jb20vY24vZm5zdC8NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiA+IEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPg0KPiA+ID4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgNywgMjAyMSA5OjM3IFBNDQo+
ID4gPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+
ID4gPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gcGFuZ286IHVwZ3JhZGUgMS40OC4xMCAtPiAxLjUw
LjANCj4gPiA+DQo+ID4gPiBPbiBNb24sIDIwMjEtMTItMDYgYXQgMjM6MjEgKzA4MDAsIHdhbmdt
eSB3cm90ZToNCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWpp
dHN1LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAuLi4vcGFuZ28ve3BhbmdvXzEuNDguMTAu
YmIgPT4gcGFuZ29fMS41MC4wLmJifQ0KPiB8DQo+ID4gPiAyICstDQo+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkgIHJlbmFtZQ0KPiA+ID4gPiBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28ve3BhbmdvXzEuNDguMTAuYmIgPT4NCj4gcGFuZ29f
MS41MC4wLmJifQ0KPiA+ID4gPiAoOTQlKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNDguMTAuYmINCj4gPiA+ID4gYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41MC4wLmJiDQo+ID4gPiA+IHNpbWls
YXJpdHkgaW5kZXggOTQlDQo+ID4gPiA+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9wYW5nby9wYW5nb18xLjQ4LjEwLmJiDQo+ID4gPiA+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41MC4wLmJiDQo+ID4gPiA+IGluZGV4IDQwZGY3MDQyZTYu
LmRiMTcxNThkMjAgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
YW5nby9wYW5nb18xLjQ4LjEwLmJiDQo+ID4gPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9wYW5nby9wYW5nb18xLjUwLjAuYmINCj4gPiA+ID4gQEAgLTIwLDcgKzIwLDcgQEAgR0lSX01F
U09OX0RJU0FCTEVfRkxBRyA9ICJkaXNhYmxlZCINCj4gPiA+ID4NCj4gPiA+ID4gIFNSQ19VUkkg
Kz0gImZpbGU6Ly9ydW4tcHRlc3QiDQo+ID4gPiA+DQo+ID4gPiA+IC1TUkNfVVJJW2FyY2hpdmUu
c2hhMjU2c3VtXSA9DQo+ID4gPg0KPiAiMjFlMWY1Nzk4YmNkZmRhNzVlYWJjNDI4MDUxNGIwODk2
YWI1NmY2NTZkNGU3ZTY2MDMwYjlhMjUzNWVjZGMNCj4gPiA+IDk4Ig0KPiA+ID4gPiArU1JDX1VS
SVthcmNoaXZlLnNoYTI1NnN1bV0gPQ0KPiA+ID4NCj4gImRiYThiNjJkZGY4NmUxMGY3M2Y5M2Mz
ZDIyNTZiNzMyMzhiMmJjYWY4NzAzN2NhMjI5YjQwYmRjMDQwZWIzZg0KPiA+ID4gMyINCj4gPiA+
ID4NCj4gPiA+ID4gIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGZvbnRjb25m
aWcgZnJlZXR5cGUNCj4gPiA+ID4gdmlydHVhbC9saWJpY29udg0KPiA+ID4gY2Fpcm8gaGFyZmJ1
enogZnJpYmlkaSINCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBTZWVtcyB0byBicmVhayB4MzIgdW5m
b3J0dW5hdGVseToNCj4gPiA+DQo+ID4gPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVj
dC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzU3L2J1aWxkcy80NA0KPiA+ID4gMDMNCj4gPiA+DQo+
ID4gPiBDaGVlcnMsDQo+ID4gPg0KPiA+ID4gUmljaGFyZA0KPiA+DQo+ID4NCj4gPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTU5NDM0KToNCj4gPg0K
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNz
YWdlLzE1OTQzNA0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL210Lzg3NTQxOTA5LzE5OTc5MTQNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVk
LWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0K
PiA+IFtyYWoua2hlbUBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4g
Pg0K

