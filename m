Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7391AC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 12:38:17 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.117])
 by mx.groups.io with SMTP id smtpd.web10.30550.1701866292646115626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 04:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=VaANh6S7;
 spf=permerror, err=too many SPF records (domain: nedap.com, ip: 40.107.104.117, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=De9ZgpjS4b5AxE7zPt+6z+hGHsdQZtt84NG48HJ7g/2RIy+fZqL4h79tc00U1+QhLbQyAmBUuRtUtYxkun8WkWPHmXzxPvif3HmlxJUR/vfhJuRtlwQXS32H/T/zOJiIIhfKEv9nwWGEGSwp4NN4o1jM/LIC2jvua30y0IGJha0rJ54pCQm4P3SAKXbSF2r6TLgxJk8l7fzLl39lbXcSQTGky5ISbrUJs2//m7dq6B3HWnH2G9uwVFu7O2TR+IsO/tjzKhBHMU+Pzg3KKl/yVJAsZlHl9pOs/C9SsCM9DlYTcZYWRkXVSJpyzDGBoN9Sdy72Vejv5SGM6TroIV64Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWMlXN+gJSa9SOuAa70BgW4BEpgwNqmKzZTkAv7xMoQ=;
 b=Xa1KnV45JRkzPEy92+R+aD5rAPdO6Li/sxJYYL49DMCZF69d84i1x1+DpZkuab6p0yl8ATiXn5nvbeTkpKsqGYKG73L2M3XF9g5TNSGB+iRg9Zx1Z2bbRfeD67zsASIxCoh+wFgCdou+kDT/sa584nBkmVcdIL9Koa4h1FG+qnnkrNVfFrUCar8Y6wKiJKEanscethGs6QUQvz6dgWt/PcQeGfapdM+9DmDMWLkff2cE2f+Y9+JOXO/S5FMe2xYigy6q7AhIiybCXpQUowVFmtCyFo4lW2fnAJB1nnLqJ1gPkDmyqKtmJ6qXCgNbH7fcP/eGoG4yriuUZMw/Tns1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWMlXN+gJSa9SOuAa70BgW4BEpgwNqmKzZTkAv7xMoQ=;
 b=VaANh6S70YF7wVv8P7+wYEK3c5Wk3C0yoHKZJMIzWiNJ2hMUbGutVFqnn1Bxy1q9GB76p2hkmlZTmX5jXpQnlj1HsX7Ftcti62eKqft+N2AnbqFIBX/OZw1382xkWCbJzdt+02WVd3Gv+ATj2j8VDCvVD12V4WueWRIVrbswV2k=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by GV2PR10MB6233.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:78::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 12:38:07 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ba10:eb74:e945:d470]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ba10:eb74:e945:d470%6]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 12:38:07 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Andrey Zhizhikin
	<andrey.z@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
Thread-Topic: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
Thread-Index: AQHaKCweoNQ7B/z6PEScELiCQX1qz7CcJLuAgAAJqYCAAAJAcA==
Date: Wed, 6 Dec 2023 12:38:07 +0000
Message-ID: 
 <VI1PR10MB31822295979B4CE4CDB89E8EF784A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20231206092536.2874022-1-andrey.z@gmail.com>
 <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
 <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
 <CANNYZj8-9PHqeiRuExw+kdPhCNspCERzH1zKA9O7L06F=bx27w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8-9PHqeiRuExw+kdPhCNspCERzH1zKA9O7L06F=bx27w@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|GV2PR10MB6233:EE_
x-ms-office365-filtering-correlation-id: 9ed17572-6e93-4c6b-9808-08dbf65832f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g0p8YhQZj09BG+Ss062VvnmsHLP4Pu5o3OmcOrWAmAMxK5CYYHt61zrAS8JAb/8EKkAa0xwiKYHB0GLdysx3+XsTidlouCrsmigviP3Rf/QDtWBEImHjAE3n7q5sri1ZYF0FK4tVMdRjwojyO7m+gEBc8YsBEfKn6XoinjPGoNOWs8d7raeKBZ9KRxuK5H5QkXx83WYIydVwi1rYZf6hv2eG+YLV1ejtnmway1atdulUIrXr25UcuMxAlhD5buXbeaOP5RgYMDxRut5IhKAGDMfNG2/Nxlk8fRJjC/xyKWoZtkaA5CfAaxNZhCZrkCvwFV6qmdXwG4Aa5Tm306fS5diPj3IK68RqPsNgV4CkIyVO7oZnoORN/PmiaxtX3QdlNFLUoDVhzi9/q4aeKEUUlT53aTZupDxOvzWT6EgwpPeuXWbYJM/cIPvCbymvGOplSO3gpqzLD8JIr8STJhOdLZ8j97bLK+GScNJNXUX9AK4cLt14+cTAP2kDk880/2aTYNCORDPYUcYNLGHZt7W0qmRR5FEhj6FHatQVH8phDeMaPnYAtYjCsshyDFCAcB6aNEOU14yd50ROaL++kHvAsyZGQusOuZzie8crI4wRx5tMtGDkdDBoYG20p5+6qg4S
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39850400004)(396003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66476007)(66446008)(66556008)(64756008)(76116006)(66946007)(8936002)(4326008)(8676002)(316002)(110136005)(71200400001)(478600001)(5660300002)(4744005)(38070700009)(44832011)(41300700001)(33656002)(2906002)(86362001)(52536014)(9686003)(83380400001)(26005)(38100700002)(122000001)(55016003)(6506007)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Vk1laytZKzc4a2I5NVBpZUR5Uko5YTVqSStvSXZyL3M3NUU0KzRINjVRbzZ3?=
 =?utf-8?B?TUJGYVhjMmVlcTFqVnlXNGtJNDZvNjVMbXAwZm1tTG1tM2x6elEvb3FsUm9P?=
 =?utf-8?B?czkwTzVJWkJHOG1yMUs0QlJlMm1hR2JxazEvSy9pZFRpOEZxSWxnQ2pQQ01q?=
 =?utf-8?B?K1lsV0pWTFZsRGVmRU0yYUM4eFJOZDZLWEhRcDY3QmtvaVhBK2ViY3R5S1Zp?=
 =?utf-8?B?ZmRWYnZ2UEVVZ2pqQWVneG9rM2dFLzgvNkpIM2NMaFpERGtzSGZWZXVGQVNF?=
 =?utf-8?B?UFk5SHRQVEJUWmY3NStKaExkaW9zbVNFZmFLQ2pEdzZuWWtCd0p1dURQcWdW?=
 =?utf-8?B?MWY2NWtNUlpIL0xkTENxT0lvSUdrZ1N0UUV4blZ1NWlWZUFQNjJMS3FWOU0z?=
 =?utf-8?B?dlhsZUFwVkc4ZlhyUHE4eFdUbzJEYktrdXp1aDhoRUk3ZDk3ZUxYamR3Uk01?=
 =?utf-8?B?Ni9uNm9ZakNqdjdoZDl1SXErYkpacllPejRPQmp5ZUdIeHc4NHJzZ0drMjZa?=
 =?utf-8?B?T2lvUldCWlRlRWxFS29VUG9EOEM5cjdMNmJFei9KTEpmY2dhM1UrVlJuckNG?=
 =?utf-8?B?MC82Wm80SWw4Y3oxL2VtWVJDZ2hxemVZUUFPTWRVeXFnWjdsNUROenNjc2RQ?=
 =?utf-8?B?ZFZtWWlXaFNlT2pqemQraSt1WVFvblYvbVpTTWVFQnhKZ2hCVmcwTkg5SkVI?=
 =?utf-8?B?OU9BVTNOeGJjUk1RazZXZDlqWWF2WEJVWEoralg3dUpOaUt6YzBaaVFOSThL?=
 =?utf-8?B?dklhQVJ5UWQxUWhKbTZpcEpaaWVRbGpFVE1zem9OTGhBcG9hUnU1ZGZjVjVv?=
 =?utf-8?B?WENjTHhZZy93VFlRQkhaUGNieTkyQkh3VExYVW9qUjRqejJxbmRoT1JhYTZY?=
 =?utf-8?B?L3ptMnBjNzZhSjZXSnI0K3E5bzB2K0Q4UWRyZW03WGZKdU15OFBQd0JtSXZI?=
 =?utf-8?B?dmlmMmMzc1J3YnpFQnpHbTVDUlQ1eHk4dWlVRkVpOTVYTmFOSUZUWkJVV3hY?=
 =?utf-8?B?eGg1NlNLemxnMDNaRnJScDJYNUVSTDNEQzdKekVzVnMzKzdwejRSYldsc1pT?=
 =?utf-8?B?Y0RIUGZoTUpDTXdsYUViZDI5M3l6c2dwNCtuelFqVGJHREtEZXlwNWZGU2FM?=
 =?utf-8?B?K0t5UDlvbk9Nb1hJR1U0MTFhcy9kenBOdkZtTERaLzVqcTVWWFFtTnh0N1hI?=
 =?utf-8?B?elR0NHFweVJqdyt3SWR1VUZrZHVscjg0cWlZS0NLTG8zQU45c0FwcXBhVm9H?=
 =?utf-8?B?bVIxV3YydWpPS3YzR29OTE00eVlmcnlBN0xxcW5Ia1RmNUxYUVFzUWxtRW4x?=
 =?utf-8?B?NitXMll6dC9JdWpLN3A5NjFyYktxWjRvTHk5R2l2STlxcXlNMERQU2RIMUxj?=
 =?utf-8?B?MFdjVzVKRzZtelRRS3RhTlg3aW5GUmtKMVNVOEN4dXZuRENCMEFsRm10aWpy?=
 =?utf-8?B?SDQ2NW8reVBFc2l6YXVScHBvMjhlZW40WlVRaWNsS1o2cERnNDM2Ty8wT3lX?=
 =?utf-8?B?aW5OWi9RWTAzUmZoYU52azBCM2NXNjROYi8vbllQUnFXVUdPWENTZVNtVmFs?=
 =?utf-8?B?WUFSYmF2SXRoZTViQnlUMHB1RGwrY3drTXlJVXY2aXlncmxOemxEeVJYd3NZ?=
 =?utf-8?B?LzgydnVrWUFtZVBzYklxdHJzeFVDT3dqUWRnZ1hoV1R2TlNMdHkvNHhvWlZU?=
 =?utf-8?B?aUFrbW9DNnFiMU5JeXRYRUZjMjl3cU40b2dOKytaNmNTdzBBRzc0T1JDWm5w?=
 =?utf-8?B?dWd0YmsvaVRRa2tkN0czWTJ2ZjQwbFFKTzM4eFpoRDltVHNoa0dGWEdZb1BT?=
 =?utf-8?B?NVRoL0RyUWtNc09xZ0RwSWxMZC80RDRDYm90dmRJWUZIdmE0Q1c1bktUbE1p?=
 =?utf-8?B?bnllUXc1WE0vaVRrMUk2blphd21KaHA1aEhWM3V6bm5wNzhjeDBEbmFvN0w4?=
 =?utf-8?B?Ynl1Q1JHd1Fnd3FhY0xnNFFQYUh3QjQrV2N1WXJGSDJlMjErWHMreFpITUpG?=
 =?utf-8?B?NzRsVU9UV1VuTGRFVjgvRzk5d0owVHBodmphaXhjRnMwSzQvR2JPZVh6aCtj?=
 =?utf-8?B?OHUyMkhickpUS0thbkFKbWh5UFNqanQrNGVUbGZLOWZYMGl4anhEUzBQOHh2?=
 =?utf-8?Q?nZY6zpyPkEx9jH+zN+ynAcW/3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed17572-6e93-4c6b-9808-08dbf65832f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 12:38:07.4929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRX6SqzQQKdDGW1KTBI+XSKEDzm3rgYXelEwYMmPe0dYaQYsPPVMkkvb47E1SXYzmjiyu3RYzMSWlIVtDNLFtf6WhoxioCjGVX4DY9iy2sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6233
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 12:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191885

PiBMb29rIGZvciB0aGUgcGF0Y2hzZXQgJ1tSRkMgMC83XSBiaXRiYWtlLWxheWVyczogQWRkDQo+
IHVwZGF0ZS1sYXllcnMtc2V0dXAnIHBvc3RlZCBvbiA3IE5vdmVtYmVyLCBwYXJ0aWN1bGFybHkg
dGhlIGNvbW1lbnRzDQo+IHRvIHRoZSBpbmRpdmlkdWFsIHBhdGNoZXMsIHdoZXJlIHdlIGdldCB0
byB0aGUgZGVzaWduIHRoYXQgc2hvdWxkIHdvcmsNCj4gYW5kIGNvdmVyIHRoZSB1c2UgY2FzZXMu
DQoNCkkgaGFkIHRvIHdvcmsgb24gc29tZSBvdGhlciBpc3N1ZXMgdGhhdCBuZWVkZWQgbXkgYXR0
ZW50aW9uLA0Kc28gbm90IHRvbyBtdWNoIHByb2dyZXNzIHNpbmNlLCBob3dldmVyLCBJIGhhdmUg
cmVzZXJ2ZWQgc29tZQ0KdGltZSB0aGlzIG1vbnRoIGFuZCB3YXMgcGxhbm5pbmcgdG8gd29yayBv
biB0aGlzLg0KDQpTaW5jZXJlbHksDQoNCkplcm1haW4gSG9yc21hbg0KDQoNCg0K

