Return-Path: <tobiasschmidl@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0D8C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 15:07:49 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.77])
 by mx.groups.io with SMTP id smtpd.web09.8679.1652972867626086257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=LU3QmXFm;
 spf=pass (domain: siemens.com, ip: 40.107.15.77,
 mailfrom: tobiasschmidl@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3GF76t0XAsJb9IfZwHYhQjycHWGUEbcPphFfskuQSwVihALmP41s58v6IMruNTvxZa8b9FAVWYWTQtvGrO6B9qcFhz+lxaeJVvCHL6KeBiwAOEsvG/s6NYnWR3aJ5NyaEEe3uhdEdJC/OTR0m28KJuV7KPofotaXMEJG8xPyW/ORcmna1c78Jl7HQd1MsTF6Nal/Ei6Mt7XF9Ickwkr8h33DRLmD/sn7agJHcrTobouOZNFBgOCQeQ+2B8NkBGezOpTSKVw+MhkCb61VVCbtw6Lkpy3E+e9PXOixsNH//Xpc+FVFm2OgEJ4+ZegqhjGQSUdtTSEaqSjB8cM5hYBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=377lVvCRjdh7OG8qLssUzuLtu3nC0XgTGLtnELcIst0=;
 b=nBtP9RmhS0FgPKtTxMMAsTsudRAZihbU0aD51PqS+swkxPqghovSdQ6acGzYUcjDwci378EBLCWrivh9M+P7k92TSqPJiplIZ3CRBNrOEhIChMkFdJk4v//X7ofMyxqrBWVFVO8gYZNqLHTQ1BbnkFNk9MlSGILX94JMZu/XsJEvi6guaSamxNlo7Dmq7Vi/ePYnqgFnj4Eg9YIKkn0Hw5BxykgtBj+k8TBWavQ5R9vW8axtOQ5Yaeb1yVUnBhGOa7aL7kUZk7yn3M8Efiipd7qJmhjqKlWmWaag2PViCzKQ5988UAnmmheA4V43By+3guNX4GRH82V3q9zPhuzRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=377lVvCRjdh7OG8qLssUzuLtu3nC0XgTGLtnELcIst0=;
 b=LU3QmXFmwvrSZY/pPjdw1Vf9YlF9wuZxxOCcSSxQPVSrx0EbRDzimMjsqBO//KeD5A7dpj7MgOmQNCeMLpbQ7pcGxB5lgRG4d3C3fZ5lMA37ospj7ta2KRtGNhqpBsSV5BE3lcsQiT7/zBjVKqdcGygMPz3wMnzj8JUuATBAujJeJWR3yk5ZEBf7IV3VigSDFiummg0IX879Vt5kqi1Gxo1FLvJekvVM/KCC26DP13UVWfUfwNv94ZZDeE7lBTJjvsR6dUVXeL/+R/AhTyWs15qKdkSweJ4Trzeos925i7C2BMXBYrjH6aPvrG4D61us5nzR4gxKa+y5ec0AFVUu3w==
Received: from AM0PR10MB3234.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::8)
 by VI1PR10MB2704.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 15:07:44 +0000
Received: from AM0PR10MB3234.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c7d:ac53:4146:b332]) by AM0PR10MB3234.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c7d:ac53:4146:b332%9]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 15:07:44 +0000
From: "Schmidl, Tobias" <tobiasschmidl@siemens.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] wic/plugins/images/direct: Allow changes in
 fstab on rootfs
Thread-Topic: [OE-core] [PATCH 1/1] wic/plugins/images/direct: Allow changes
 in fstab on rootfs
Thread-Index: AQHYah6zBLFNriwsC02+h2quAegR460mNfWAgAAaLwA=
Date: Thu, 19 May 2022 15:07:44 +0000
Message-ID: <e0e0e182f37740ee29885818ca1022f1c43e06cf.camel@siemens.com>
References: <20220517184816.1348026-1-tobiasschmidl@siemens.com>
	 <20220517184816.1348026-2-tobiasschmidl@siemens.com>
	 <20220519153401.0d3d92b3@melee>
In-Reply-To: <20220519153401.0d3d92b3@melee>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1b9236a-fb06-4400-77ea-08da39a95406
x-ms-traffictypediagnostic: VI1PR10MB2704:EE_
x-microsoft-antispam-prvs: 
 <VI1PR10MB27047BCD34CA9F77DE2CA2AEA9D09@VI1PR10MB2704.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 y94cBpHrU1O+B66BLnEib7Wq9ff3VZnGWzk16veKT53sqdLpPeMNbv7l4M/fIQWF8iwhiPRze7yATypuSu2RR0nzWJrdx9UYTnyCUwXZrIw07UYG6hgfFxLnKoSLz7htly0O/UfAicMIs59CI4uwPSnxEvs1xT+u67UL+j9DJXibSPC5rDZiLpXjjwarhXWFIe27OmlG4SZlxH7jxldpWxDSE6tfklLaJZynAR9u6PisNTj59uvz5UXJ8V0Mag/dvo7WdMB2WGtmsuYR4TgBeBYLOmaj3si+XvRC/0dc66Y5GvbXWRa1bf50+Ra5nQ38p6iC/lxB1f2QCgV61Jl2uWYKjJf3kE5IFWgc04WyiUc4Q9CjCJC3dYmMeDabyx53GvEl9UfFcBISv3hKpJVpkRkw+HqHPkXYA4sIdF0UUL+KmvkfwRoMex8ASQSC7TSTz0JXKzimu1V3Fk00Zuks4JMYoxWr7NA9FpFRN0Ty7xctH1lKWhiYBLsAc+jOaOYPUYlyNA/XKwuzkFgdhncrGQa3WBysHVx/V8K6HBbfzR+0JQlAKEZ8OlP7pB9BPNwU44tXJCXAK8koLSjdrPiMQQHsJAH89W0BOSh6v3UxqTPn6ff21Dm5v3/CIFpsj7QHp+bF4eIbQiWY1D1NAMkGdxO5VFqW8hJp+bdrSexo2KEghFn7QQ91p1dpdOZn6uoFBl8zOegnwIAHmwwjo5twLA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3234.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(2906002)(82960400001)(66476007)(86362001)(66446008)(91956017)(316002)(38100700002)(6486002)(66556008)(64756008)(8676002)(4326008)(76116006)(38070700005)(122000001)(66946007)(6512007)(4744005)(8936002)(5660300002)(6916009)(71200400001)(6506007)(186003)(36756003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MldrcXdMNGFQWnRYSDVla0dXc2xKeVZNQThiVFR3MGdXOXZWNHRPSkVmd0Er?=
 =?utf-8?B?aVd2dmc0dEhnZzdLSm54d0VxUkR0OFprVzBReXhWQkhmS3NWcDk0SC93WVV5?=
 =?utf-8?B?a3d6WTRqYkNyR2h1dUFYUlpnbU13OXZhU2ZtaDBDRmN3Z2M1eXpPRkswL2lx?=
 =?utf-8?B?bWhLS1BaV1NCbXcyQmJzQ2tmT05SUUpua2U1RDJsT3F0empBWWFNNXQ3emFL?=
 =?utf-8?B?QU1UdDg2bWZCeUViS1FXNG9QdWo4YTZJdmR0bDZIWjlsUEJ2bWp0Slo5UVV5?=
 =?utf-8?B?MWdnRVFPRk5ySXRaektENEpEb2lTSk9LTWUzUEY4OUVmb1dTd2txaTY5Znlm?=
 =?utf-8?B?MGk4TDVleEEyNHpmaithOExVdlIzUnlVVzZVSW1peHl4bXFGVHdZUG5Dc01v?=
 =?utf-8?B?SGd3c3hjZVdVUWc1TmwzbStFbE95aHRWbVlVMkJhU3VTNmc4TTVXOGd2S2Z0?=
 =?utf-8?B?akY5cjZVYUdVUTZtQ1lCQTczS1J1WGhxWk1TUEllcVd1MGdVTVk1bEZFTWhp?=
 =?utf-8?B?QzMxQ0tBUFBCNXZneGp2UjFFSlIreEo4ZkE0K1VKa3JZa0FRT2xJaHVnTkFl?=
 =?utf-8?B?aHhZOFBsdEJyN0MwajJPVVQ4YmhXdVBBdndUcEMwYXp3SHRMVUFRVVBkZERi?=
 =?utf-8?B?WlpGY2x2aDBTeTNXcWVSZGs4K2lwbG81cTRHS093R2o1NDFicmdTZnBDZE10?=
 =?utf-8?B?Y1dIeFpUcS9ZTVFwbktLL3Y0Nm91bnNtRnRxYUFVRnNndkhVenJ3ZmdBVEgz?=
 =?utf-8?B?UnI0VUdxdDJrRSsraGQ4QUdQenZ0cjdFalQrRmdrTnBqeVVvSDlkbENZYU82?=
 =?utf-8?B?VnliclJSSWZ6dWN0TFhkZTRWeElYY09VUk1lT09jTTdVbVFwQSsrTzYvSFlo?=
 =?utf-8?B?NGp6Rks5WGk3QlArZXdlZWw2U0ZVMFIwUHQvV0l4U2RVbVl3MDNGaElBc1J1?=
 =?utf-8?B?bStkeERZWVlkVWsrV29reXFraStwTjNhQ21sS0xvOWUzZWtlVnRVNUpHOWtD?=
 =?utf-8?B?aGViM1pyQitjbmRDcW5palJYckIyVGJpYUozbXFPN0tDRDlFUlNlWHU2OE1a?=
 =?utf-8?B?ZnBXckJqb2FLNERoT0o2dGVRMTVsbWNvSjhFWWp0V0I3blovekxTZmVGTGN4?=
 =?utf-8?B?VVYyZlFCSHA3WUc3UUMzcVpiRS9YMVlYTzQzOFpDWnFDbnJsam5KdEl5V2Jk?=
 =?utf-8?B?NmY3UXBvNmpwQ29wa0VSQ0FuZ1kxOTNqYmZ1dnZXZjl4WG1iSmJENjJtWndu?=
 =?utf-8?B?VWQ0aXJkbDdsakVSQ3BCdmI4dHZWOHl5VFFrcUJtUk5FbUhPUDUvaEVzaTY3?=
 =?utf-8?B?UmRCdUlKbDVtNTkzeDJPNGw2bDYxN1BtaXFQMjRyaTkwZmhVTUt1SWpudXhE?=
 =?utf-8?B?T0hJek1TYjhtT3lJTHVEeFpMenRyc1B5NlhTUmFFbkFkZjEzL2RVa3Ywbi9K?=
 =?utf-8?B?WFVEbUNTZEpMdkFJYkZIaE94VFFrN1VFcHFqa0NUVmFkTUd4eC8raGZwclg2?=
 =?utf-8?B?N0VsYlRIZTNnb25yN0tabmZDbU53M3QvK0R0QjAvd09nUkwvMjlMczJmR01P?=
 =?utf-8?B?Zm5SOFg4dW9ScUpkQ21BZTZCdlJ5aHNFMmhFRXhZa3dlRzNQcG90d3kyT3hX?=
 =?utf-8?B?eXpBUUVnY3NqOUxZcUxROVc3d0RuUno5NXU4Zk1NeUExNUpBbG9Wa01Ga2lL?=
 =?utf-8?B?ZVJrMDJILzU3S2tFaFFOYUZGelREWnE2UVlMamJsQ0ppRlpWZEVvTFlCOGQv?=
 =?utf-8?B?aWpvTnliVEZkZGxJNGFaY1oxaVhEVFpBNGJ4bDE1cTZGRHRuVXlqNTUrU3hY?=
 =?utf-8?B?VlZsR1pMaUtDeWxtdHIzZTJOc2lGbWlyRjBLNUpSS2ZWYmRHeE9QcVU3Qi9q?=
 =?utf-8?B?QUFHcWxZUTRnbVptWjRPZUNYY1N2YVk5aFBtaCtXeXEyc3RNZnZKNTR6cFJI?=
 =?utf-8?B?bXlGampYL3k3ZUlFZEpxaW4weVllR0dOY1dxY0pUTnZSbmhST3RzOCtCN25M?=
 =?utf-8?B?OHdoRGFHL2tuM3g0aG52eUdMSUo1ZjNSMmdOU2Q5VHdGQ3ZKUy9Ib1pibFhE?=
 =?utf-8?B?UXovL0k5bnBSL3ZLV1FMd3U3MkR3bjVQUmNEUkxkVUhLY3Ezdng4dkRXV2Iy?=
 =?utf-8?B?aFdwOVovc2FLYzlrOGxEZm1uSmVJZkJyL2dLbENZTEhoTUFESjFJN2FyWktD?=
 =?utf-8?B?VDhJWWZWcElIV3REVThUL1A3SXhDV3hJeHF2SVBSbGFRY3RCaUtLSnpRa3Rk?=
 =?utf-8?B?OGUzWWlqdVN6SUJ4eGx5bm54WVN2Sk4zSSsxbWUrSGRhdlpZSzRCdm1FME4z?=
 =?utf-8?B?S2NQeVI5b2tMY1hCTzV6N3FydFBTWVdBdWYyejZybERNQmg5dFdva2J2Nk9w?=
 =?utf-8?Q?JFuvTW2KFEz5tnimWs7laFSw1E6KpLhk0Xqlp31OX82b/?=
x-ms-exchange-antispam-messagedata-1: dBGFpDn7SOD1p63xS/G9ImX0qVQ0fh9Luws=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE3793618D45F74EB603F5B9FDF5E6F9@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3234.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e1b9236a-fb06-4400-77ea-08da39a95406
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 15:07:44.8000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ZUCwjmVCHX7H4RsC5/FV5HA++8jYo6F7Es5KzQEc8Axb90PtXmTOlheHncRIuOB8mAwIgBjNB2BHtVD2Rtsgfy3H2kMiJ+5+C8//FYIMdMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2704
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 15:07:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165894

SGVsbG8gTHVjYSwNCg0KQW0gRG9ubmVyc3RhZywgZGVtIDE5LjA1LjIwMjIgdW0gMTU6MzQgKzAy
MDAgc2NocmllYiBMdWNhIENlcmVzb2xpOg0KPiANCj4gPiBBbGxvdyB3aWMgdG8gYWxzbyBtYW5p
cHVsYXRlIHRoZSByb290ZnMgZW50cnkgaW4gZnN0YWIsIHdoaWNoIGl0DQo+ID4gY3VycmVudGx5
IHJlZnVzZXMgdG8gd3JpdGUuIFJlYXNvbnMgb25lIG1pZ2h0IHdhbnQgdG8gZG8gdGhhdCBpbmNs
dWRlDQo+ID4gdXNpbmcgc3lzdGVtZC1ncm93ZnMgdmlhIC0tZnNvcHRpb25zIG9uIC8NCj4gPiBX
aXRoIHRoaXMgY2hhbmdlIC8gaXMgbm93IGhhbmRsZWQgZXhhY3RseSB0aGUgc2FtZSBhcyBvdGhl
cg0KPiA+IG1vdW50cG9pbnRzLCB0aGUgZm9ybWVyIGV4Y2VwdGlvbiBzZWVtaW5nbHkgd2FzIG5v
dCBldmVuIGRvY3VtZW50ZWQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVG9iaWFzIFNjaG1p
ZGwgPHRvYmlhc3NjaG1pZGxAc2llbWVucy5jb20+DQo+IA0KPiBUaGUgYXV0b2J1aWxkZXJzIGZv
dW5kIHNvbWUgZXJyb3JzIHdoaWxlIGJ1aWxkaW5nIHdpdGggdGhpcyBwYXRjaCBvbiBteQ0KPiB0
ZXN0aW5nIGJyYW5jaDoNCj4gDQoNCnRoYW5rcywgd2lsbCBsb29rIGludG8gaXQuDQoNCktpbmQg
cmVnYXJkcywNCg0KVG9iaWFzDQo=

