Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE80C48BD7
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:06:40 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.41])
 by mx.groups.io with SMTP id smtpd.web11.13904.1700057192851015411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector1 header.b=MLJVbnaL;
 spf=pass (domain: infinera.com, ip: 40.107.237.41, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhZwIS/A3S9L+XvCoHkvxBRshvHH4Aq87Mp1iR88oVp22GgTh7sNmCZBOCI0Q0uyuUmo28Y9DxKuQFDhZ9BcKGD+1fNKs5666U/oN3krLhi8Mt4OjaPANifUuysfhbm1o9871dBbuee/hoTeuFksWJsyWrjq3dp0eivHciBBlADUJLNCQqkKS8qWThHa5swcAwOQoE6/KSWcy1hfAaij09iEf+PcbTR/e+oV7wcRKSnOmwGimJDcZeOW1TbONR9lyh21KHzKN3/Z7E96juZth4ei9hqzSmlUCjD00pUgOtOh/MPy8igTj3s7Ea9rmqUt6aYF2sqQQurPdCp8Uqc4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAkmt1iaZbJKrrwxtsgk0/nn3RXCTCk1J3lUF1po1v0=;
 b=cQ9x0hL34KgLliQgL0uTGlWF+eEIiROvTb153VGNVE8c7yIe04l9n78D0PwOPtPAlnix3Fto0uE1OF9KY7sfWxoFiwOIxLznnVr7HB/AAbM4DMeqkMc0N0CphlhafBrMWOgnnbUHsCZNm2YN/XhVDRZ1JYc1vNLQ38GoiQs9Jc3NRwQpnOMd/m1NkQvGsVtgfWRR9klDuN+jyXPPEt2X9ZgCt7QTHrRXUMgjG5R+xPRamNvbrtRYTja/+H3bodjAtLTtwihsn0+aCOa4DhPhFyBx1xqOuekPXtRTdPYdfaonAQygCzV6vOX+44PxGtlEuwVm/AnokPc6xbklaBgkzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAkmt1iaZbJKrrwxtsgk0/nn3RXCTCk1J3lUF1po1v0=;
 b=MLJVbnaLKgi3LxKEEhbbdulktPMUlG1u4OZKdCKPdzU3eBDFULiD4EuW48Z3KDpBAc09suOG5LVtIeRvhl5E8tPhOVVnF1JcB7RrcmbbjX1h8m+CXNJHmE1USOENXDsM+L+awZN+BNG2vDWt7W2GAvecBKaJ51TSuNp4nHCTftl/j5h9l2my2nMRoxmaWJhqPqJ1h7fqxpDv96GChtfTMBgVD7KvY5r6czss4UrWS4h8zqItufrE19N/I2KqiQdXGS12pWD49V03knsycCXAVZfd4F90oeQIq28E35w5wdge+GOHAHUiXaWKdg57hc9LvK6HkW6xCubYYTthPZNM4g==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DM6PR10MB4378.namprd10.prod.outlook.com (2603:10b6:5:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Wed, 15 Nov
 2023 14:06:28 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5%6]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 14:06:28 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] shadow: Add PW_SUBDIR
Thread-Topic: [OE-core] [PATCH 2/3] shadow: Add PW_SUBDIR
Thread-Index: AQHaFzo4YvdKKSdR20CYqjr8bGTp4bB7UeuAgAASpACAAADZAIAABfyA
Date: Wed, 15 Nov 2023 14:06:28 +0000
Message-ID: <4d8c459ce91ac4071c77c352006d0272d30efc90.camel@infinera.com>
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
	 <20231114203608.1490318-3-joakim.tjernlund@infinera.com>
	 <CANNYZj_c1dCdhhuPhnNdQ+9PKQ_FPdbB-b2miypMM9jQuofBcg@mail.gmail.com>
	 <4f3483d322d0d4afb65b31ba06b3e0d383b62b6b.camel@infinera.com>
	 <CANNYZj9DWffE1qOKO1SpqeMJcfXeaFxOMFFUieivDK-9ooH0yg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9DWffE1qOKO1SpqeMJcfXeaFxOMFFUieivDK-9ooH0yg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.1 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|DM6PR10MB4378:EE_
x-ms-office365-filtering-correlation-id: 1dc0e309-c6aa-416d-bde1-08dbe5e40fa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /zJguM7f/LGEvJ42ofVspKHKd09qPqdk8z4ESWKhK1bfxUfx+lJ6+bVt4gnQFflPUbuLHH6bJURLos42XZOSlVo19xofnGD7mAQ9KeZaYYN81b2qTPKQC751dshEikunVrFbtJBYPzCJWfwIKVsuhe2cHbybqC8+wNaP2to/yQY1p8EiStFPc6b/gH6XVLH3u41hoO0nKCMH1mhUwXPTPwcM7leWz1acKfcySoP+1ef5NOOjDxjvObEJFAdHWO9NZmQXdC9ITD4TFpt67+ENFcOUjR8cpd9muPY9RJYrBpNUseQdeyWgP64BvlMDwcyvrzcxrD9EJPMDayYNh/Ku088jjDrPoHQnSEsbB+yYTUYYTJwszHl/0TomGJY4Psg+mP1jlXu+zQcGn/PX3lhJeU2vZGv3ycw+dJEdfmu0g2vxzW7cnUVvcIg975bvR3K3//kLPr4FtX85Aht6siFwZerW0EnQtYf7+ENtthcmIs6A/p32B3onKAgyhTsDxW+Q/mT4EEjr+aBlht/+2NoTxHRZdtoh11yo0mPU8iGSRUSlx8Ta9rNF6955uDt83+MZTdEZ+FpQ9YtADeHSCLNo0kGJP3a4pQU8jLwuU8K06Ho=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(346002)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38070700009)(45080400002)(76116006)(2616005)(316002)(478600001)(6506007)(38100700002)(91956017)(66556008)(64756008)(66446008)(66946007)(66476007)(966005)(6486002)(8936002)(8676002)(4326008)(4001150100001)(6916009)(6512007)(36756003)(41300700001)(71200400001)(2906002)(5660300002)(86362001)(122000001)(66899024);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVc0dFBPQlZOd2ZHTGRZZWZla0xEWkd4WUJ5TVR3Yll2RnF4TEkzS0RVV05m?=
 =?utf-8?B?d29XaFNjT3p3VjBKanZXc1pmbDZrWHU4YUdkTjdsdXNyTjNUTEhEQmxhTUF0?=
 =?utf-8?B?dko2QjIySy9aSlU3WCt0bmFYc1QyYzhpc1REd3MrVXpZZEhXeEJwRkdGTXAx?=
 =?utf-8?B?czI4RXdOZEQyOHlXK1JIalliVlU1YnNCV2JSS0pQQXk4T1FYeU9uL0I5cEFU?=
 =?utf-8?B?ajBVNUhWWUpjZjFXK2hNUTJqTWpIV28vZWthQnhvdEQwdDI4SDVteXVhbCtn?=
 =?utf-8?B?d2pzd3VRMXM0Yk0zRlRraXk5UTJrZDZVU3ZFUkFrWHhoR2l6VXpuencwY2VP?=
 =?utf-8?B?MG15cW9UYUlSL3NscDRGWXBFbFo3Z2xOQ0QxQVE2MkdIMXY5dEhiemNwLzM4?=
 =?utf-8?B?YjZjY0NqcWk5VGRZMTc4eHA1am1UbGZtRzdnZlBkSkVqWGNucDcrVWJxSzhl?=
 =?utf-8?B?b1l0WTNXRy9KMEp1VFN4d1pmalpnV3U5a0RZU3plMUxsMXFsVTQvdnhMVkFB?=
 =?utf-8?B?YlpUYnlZSHFKaFlKaUZxdU54QVdoWk1FOVQrSU5tNkxsTm11TVhPQUk1VGVq?=
 =?utf-8?B?TnI3VFp0amFhcVBTTEgvcjlzRlN4ekZKT2tZTkpOVkVNOTJ3SXNncDk1UVdL?=
 =?utf-8?B?Uit6cm5MTHZKMGdCS3JSSFRLQkgvWG5OQVFWajJwMDNHSVFFWlBnZUJLbU5G?=
 =?utf-8?B?QmY1QmdXalhGMmMwa09lQUJXSUllWStlUnlMVE52c1NYdkxhQWhrR2pZU1NH?=
 =?utf-8?B?azA0QlU0cDU1S0VGUThWS2RzVnVPNGxuUGtBcDJEaUM1MUNVZExPYzRuYktE?=
 =?utf-8?B?WDJNdlpUOGN6ZVRLeHFoS3R1S1RxaG5mTGtVR3N1ajQycDE0UEhQTWlSV1d5?=
 =?utf-8?B?anMxVVZlMStKMHp6UVcxdFBxNml6c0lORVgyRmYvSE9COVpBL20zU3NhM0xY?=
 =?utf-8?B?QitJb3pZbVRkOGRKNzhKeGlPWWxGMUhYd3p2azVBdVlVbkxjTXlwbWplZWxy?=
 =?utf-8?B?TmFoQStaQmJ5VDZLZUZWN3BUclkzWDE0TWtjZFI1WDV5SXBjblRZYXl6Ukts?=
 =?utf-8?B?c3BxVE5uRTl6eTNPd2RQNXd1bkYwZEJNQjF1bnROS1RlVGNSU2dLTkxOa3Yv?=
 =?utf-8?B?cU5OZkhnU1BaT0RSSnJkR2EvVHNTWVJ3bEt3UENnR3lnOUdCNlBJTmYwVnpN?=
 =?utf-8?B?a0F1dnNNU24xZmc2NnZlTDUzM2V3ZENaZ21TcWdHOE00b0pJWkh4S2ZlWktP?=
 =?utf-8?B?cE92cE1icFNyZFdCb0owQ0hubFJHWG1IYUdOQ2luSU5zc29wTmc3WWhyZ0Na?=
 =?utf-8?B?SlZpNUtQaUgrUDNiUmhLNzc5ZjJ5c0U2OU1HUVV5WWpCVnBPMnVoaFIrUVY3?=
 =?utf-8?B?OWU0b1FkUWJZZWs1cTJ1S1ovUlBJaVFPRjYrODh5bXhCZjRwbzJkSndIelRq?=
 =?utf-8?B?MlpRRlEzQ3VqVjVEcDRaV2JqRjFDMUROaFB2TTNFZHFLRXF5SG5OOHZPb1ZN?=
 =?utf-8?B?aU53ejJVcmFXN0lBeEtBb1Z4ZkduK1JSWGtVQkU2bGlhdVJFQWlTTGhoREZ5?=
 =?utf-8?B?T041MlNOQmJRb1QxMkR3YXFTazZpVWxFQllUeU1odDZ3QW5hTFVXNXJhdE05?=
 =?utf-8?B?S0M3akVKM1E5SmYvdVZ3MVhnMmNEZThtd3NxMkNqUlBlVkFqeGE1YXBtVHBI?=
 =?utf-8?B?eTI2dFVYazgzNk5EdHZNS0RhNUxHekJWTStmNDhLaUZ4aTRSOGlBSTVzUWJx?=
 =?utf-8?B?bzRtcFZYN0pTQkhVZ3E1K1NxcVBiQ29FQW1aSkFHdWFoellOY3owTE12YnVL?=
 =?utf-8?B?UDFjeVpFN3JvWmlRaVdlbjFoWUY1VHBMa1JlRzErWWFwTGhxVkl1NEluL3Z5?=
 =?utf-8?B?Yzl1elFOcFFIVDkxaTlqYW91N3hYRlM1aUE5UVV2YnJ4cmlndWhkM2lsUGlG?=
 =?utf-8?B?Rk5SclNyYmtrVzQvZllnd3E4OTFLYUVkUndyaG9lTzdxL0x3ckhlbDZMVnk1?=
 =?utf-8?B?MDMwNWExTVNvdGdRbWhLV3dHZzZTOUtsNHJ5STJjM2tsSTJxZGh1bFh2VjJ5?=
 =?utf-8?B?WVNsWVIvZmRmT1R2OG5LQUtFclp3RG81bmdvVXh1bjB4NTAvbmhQQkVXYklO?=
 =?utf-8?B?TzNEcHhnYm56RklraVpEaXhYTVpJSklSTk1EektuM3F4eE9FcWVGLzMxbXhR?=
 =?utf-8?Q?LogFiiqkgEt5HMeVHKm33sZRrvdngJvQs+ZB2c+2HBLj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <250D0FD3FF70A941A0A789D2762276F2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc0e309-c6aa-416d-bde1-08dbe5e40fa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 14:06:28.0631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pbl4/hK3vFXD0HzMQ7c2HqsfayUFKU5eKe2M5p8r86D2YnS55nBYljm2HZYl1rv4gixoPoSidxcY+qxA421CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4378
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190600

T24gV2VkLCAyMDIzLTExLTE1IGF0IDE0OjQ1ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gV2VkLCAxNSBOb3YgMjAyMyBhdCAxNDo0MiwgSm9ha2ltIFRqZXJubHVuZA0KPiA8
Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiA+ID4gUGVuZGluZy4uLiB3
aGF0IGV4YWN0bHk/DQo+ID4NCj4gPiBQZW5kaW5nIG1lcmdlDQo+DQo+IElmIGEgcGF0Y2ggaXMg
cGVuZGluZyBtZXJnZSwgdGhlIGNvcnJlY3Qgc3RhdHVzIGlzICdTdWJtaXR0ZWQnICh3aXRoIGEN
Cj4gbGluaykuIElmIGl0J3MgYWxyZWFkeSBiZWVuIG1lcmdlZCwgdGhlIGNvcnJlY3Qgc3RhdHVz
IGlzICdCYWNrcG9ydCcNCj4gKGFsc28gd2l0aCBhIGxpbmspLiAnUGVuZGluZycgaXMgYSBmcm93
bmVkLXVwb24gc3RhdHVzIHVzZWQgb25seSB3aGVuDQo+IHRoZXJlJ3MgYSBnZW51aW5lIG9ic3Rh
Y2xlIHRvIHVwc3RyZWFtIHN1Ym1pc3Npb24uDQoNCkkgaGFkIG5vIGlkZWEsIHdpbGwgc3RheSBh
d2F5IGZyb20gUGVuZGluZyB0aGVuLiBUaGFua3MuDQoNCj4NCj4gPiA+IEluIG90aGVyIHdvcmRz
LCB1cHN0cmVhbSBmaXJzdCwgcGxlYXNlLiBUaGlzIGlzIGNsZWFybHkgbm90IHNvbWV0aGluZw0K
PiA+ID4gdGhhdCBvZS1jb3JlIHNob3VsZCBub3QgYmUgY2FycnlpbmcgYW5kIG1haW50YWluaW5n
IGFuZCByZWJhc2luZy4NCj4gPg0KPiA+IFVwc3RyZWFtIG1lcmdlZCBpdCwgc2VlICBodHRwczov
L2dpdGh1Yi5jb20vc2hhZG93LW1haW50L3NoYWRvdy9jb21taXQvZWUzYTc5YzY5NTJmOGNhNjQ5
YzI4NmM3Zjc2NjM5ZDlkMWRlZGFhZA0KPg0KPiBZb3UgbmVlZCB0byByZXN1Ym1pdCBoZXJlIHdp
dGggdGhlIGNvcnJlY3QgdXBzdHJlYW0tc3RhdHVzIHRoZW4uDQo+DQoNCldpbGwgZG8sIEkgYW0g
anVzdCBub3Qgc3VyZSBvbiB0aGUgb3ZlcmFsbCBwYXRjaCBzdWJtaXNzaW9uIHByb2NlZHVyZSBh
bmQgd2hhdCBPVyBpbiBnZW5lcmFsIHRoaW5rcy4NCklkZWFsbHkgSSB3b3VsZCBsaWtlIHRvIGhh
dmUgdGhpcyBpbiBLaXJrc3RvbmUgKGFuZCB1cHdhcmRzKQ0KDQogSm9ja2UNCg==

