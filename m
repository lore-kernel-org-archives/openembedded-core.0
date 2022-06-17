Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9770CC43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 06:07:28 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web09.27621.1655446043555055336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 23:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=nHXhCyBk;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.101,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1655446044; x=1686982044;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zYqqe6eKOtlTBdi9SxLMxZQmKGebYqRckCFxThVrpUY=;
  b=nHXhCyBknNnNzQ4ipfrKiRgei6Nx9etJHJ68VJ38yMVwwtJ9dFsXrxLC
   wu82uSjW6+lE+6QLoGTlZWfBNA6YycBuvLYG+m095LBLBSKftVZoopnbQ
   qbyKV4WHWkSvMCr231AeQDLwWBYPjBRzU3y7psJooGUjNWRx6JvYqFCmb
   6gZYsywm/ackrriv7FerSeQStRzjvnEv7rlveD1QRhWwzutxrDnlIciRq
   i9sbrivOHE3Zuc2JXeLLeWSaJuTRx5GxogNIhCFCLFSt8yD5EOXNbQxUR
   7RZXyper4oRII8iYIfw5704iy06Vq3ljFk+lrHZSgeY4eLFXnOHzN/D2b
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="58112995"
X-IronPort-AV: E=Sophos;i="5.92,306,1650898800";
   d="scan'208";a="58112995"
Received: from mail-tycjpn01lp2171.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.171])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 15:07:21 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjL4nPUjd4SCMnbjIS04tAMiY3d4JUz8dtX/5mKa5r098ZAON43R2GYSEJRa7WXeFfyygP1hijLEB1GHPIMyDjPztgtisCvElgpgju5ItPw23gBLUMi5Sve4j8NollJz4dSzFGcKDacs35wgAqCvwsFUre2qxjrUx8mXoehHm1AHLGvZa9I9ffctx738jj7JdCZo9YwgUwnTwJlfgWezEgRewpWkreoKGUdk+MzvonchuICBjORjmwd3Nor0D388mBEf72MwGmQwYW1u6Rp5LZjiXvfFXeQ76OSU3vY/0nUM6KWWa61vMrL72syhPbioKKcqL3V3EWc4wAsqunOrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYqqe6eKOtlTBdi9SxLMxZQmKGebYqRckCFxThVrpUY=;
 b=nci7cI8r5LC7IyrANpvd1eISkRpLZkbQ9tfCwBg+HK90rr6g61kIjbyO7xi5i2hHoNhZE0Le5fY88pb6vMfsBnDkDAl+CWarrGXFtRnKkP2VZn3fNBcXH0ZwxRYHPxuHhXsISnL0AWVdg38KHB8oNvz3gtN7Xh1EeyIaugPSzImcv3fU4Q4BxF//jUdY13MIYblb5/647b0tHxVgZb6kePnHy/lcyX5t2RxRUb40SSnuN9pYw4nDm3FkxUFEGxsWE2oxhanVdB3wcrs0aqBys2+Ar7Ostxca5JX70O20pFp8R1DpKq67dhmFzlOegk/49LHumK4r3rEcm43NlsmluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYqqe6eKOtlTBdi9SxLMxZQmKGebYqRckCFxThVrpUY=;
 b=lQdci/WCqDtcv8Ixmm+n2YGVLqfCyoYU1tlUwbYOnK5UM+U8ZBOL4sGVdRKhBqytNNBDgF392GuaGQTsOHjN3kmO6Zx9FnYXvAxmWYopw9tWR/DD/+XQUt2ZfR0zJP1RV3cA/QO0MfPVk3uQmOCWyFsbCYr2qAfxDfArBPcA720=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OSBPR01MB4487.jpnprd01.prod.outlook.com (2603:1096:604:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 06:07:17 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::35a5:7a16:e935:822a]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::35a5:7a16:e935:822a%6]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 06:07:16 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alex Kiernan <alex.kiernan@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
 doesn't work.
Thread-Topic: [OE-core] DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
 doesn't work.
Thread-Index: AdhxYR38VlAlQshxQSyxiIpryddRpQAnFlWAAB71CYAD5Y9fgA==
Date: Fri, 17 Jun 2022 06:07:16 +0000
Message-ID: 
 <OS0PR01MB6178CD703C7FA0F911A766CAA0AF9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <OS0PR01MB61783B64BAF9C5AE3BE85331A0D89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj8LKgJA5vheJz-fMO_7ySbgPenzGMH58zSZSCMLCm50mA@mail.gmail.com>
 <CAO5Uq5SfVGqyu-+-Nnxn4hFSaZDBtA2qhUo+TQ89CjxgvYU-cA@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5SfVGqyu-+-Nnxn4hFSaZDBtA2qhUo+TQ89CjxgvYU-cA@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 545ef929-eb98-4c9b-57ac-08da5027a17d
x-ms-traffictypediagnostic: OSBPR01MB4487:EE_
x-microsoft-antispam-prvs: 
 <OSBPR01MB448770C8812B9C2B5C951A86A0AF9@OSBPR01MB4487.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pnAjw8YkyQltthjQKqJ4MJPDTtyilrRZSuTkJByyYtzKmTEORT8STRDn/SNSszhDMWdzcjDHSGZnY9jEx/qg0VXypBaHyjKO+b9o1fj9a4/NElNchx+Ftmf5UDQNuWUjDxNkrFabpKxDmuJ/QIMVkvt5bVSnIvlRzmm+2yAOUwhzjzzqM0rF0cttDb52m9k5/D1UwpqIbo2gNuEXKbiZooUiHFnOvb8nnBk1chLtUZ5K2SwZYK4bERw8rQYJX78Ch4DdyKHcOUnu0BEa0lw60Lp6AdDZGAIeyWbiGsfEWY70TCt04kdHj5zrO9ODpPhBhIH/1Bbl5SZECSOK1KfaVJHm/z7m/mNE4maULf1wpB0bVnQKTLQAbUn1n7ZgAi9vH8XAy6nxZucnEgwQDuMpnoyNszeQ+fNc/WS7AGS5gtV630eZdVbDEH7tH7jBQ3yXxWDQkdLgkeDG7MFjmW3gn4Bb9QvcTmxMQvhOuGPULn1BgB/BdSoY/HjoV3Z1JFkC9VadHeLnlikZ+QyMKOoUWKoWtYwU+U94j8fAkL9CIbeJ9lEor3OOVawg+qQg0dsC9FqrEEwQaBX6FlwQXVNV9GRTakWYvnPesFDVY+BDcg56DZLJhWVHBw2+TidwbOLEkNRlr/9g7Pcp3nCtbTSDrzaR3sbb2glixr/uniF213vFw8sjtyQhmSdIOgu2IKvnJda/rDCRvhOC0yJSQNpfdvIKUX65luFEw8baZM1MsKOLPchXCr855E4oHRQVMiTBQ8uvN6KYEc/3SRfSqaEsbeBxQ1i07J9bkWISpPczrCS2SRFUzHbD6/L4LQVD+RbwT3Mumh7zIRFH8ipYM4KjOQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66446008)(76116006)(66476007)(66556008)(64756008)(8676002)(82960400001)(26005)(71200400001)(52536014)(66946007)(7696005)(6506007)(4326008)(110136005)(55016003)(2906002)(316002)(38070700005)(186003)(85182001)(508600001)(33656002)(9686003)(966005)(8936002)(5660300002)(83380400001)(86362001)(53546011)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkhZdEk0TVdzcUMrYm5TaElwcHFzclJyVjFjR3dTYjd0TEd3eWMzbFM0WHpr?=
 =?utf-8?B?blNSRHU0aitoajc3WUdpMmVZTElOaWNMVklvSkVySngvU3RwUEEwaUw4NkQx?=
 =?utf-8?B?Vmk3ZlJWcUppVUdhZWQvMGFPOUF5RDhDNzh1aGMrS2lVSUZLUlF6NXNWaHFK?=
 =?utf-8?B?MGdORVgvMjJIdUdHMlZsRENkcm1xdUtueXU5RUgxS3JEV3EzWklKQUd1YTQ4?=
 =?utf-8?B?bVdsdTFGV3BoaGx2VzRWTkRaMUdoNGdxeWpZc2NQcENwakpjeWxyNHBhT2JY?=
 =?utf-8?B?dW9XdE9VZHRMeXR6S2RweTNiazdXUkZDVHIzbTA1S1k4ZmZoUFMzeXVNMnU2?=
 =?utf-8?B?b3JTSFFVUi9RQ0NSVmtFWGYwNkljcTRnKzNSNXR5enoxOXZaYlNYYzRWcmxK?=
 =?utf-8?B?K2RuYXZndEl2QkltVHlOdVBSbUtCOG1mK2Z3U0NLZUdwVUFhZUh0M05yWVpl?=
 =?utf-8?B?UkFyaWFlUU1FSStySW05aHNMc2hqN3Z6eERXZWErQ0hLN3prdlFrS2VUVmdS?=
 =?utf-8?B?MHlCNENZa3I4dWdPVmoxSUowS2haNHF1dXBwc1ZyTXIvVGtSdkU1SUdva1RQ?=
 =?utf-8?B?d0I5ZFlxc1lDK1B5cGlmcGJpeVFRZFBuYi9oZ2VZRzBibEZxbmJTd2NIMm0y?=
 =?utf-8?B?REMzVFQyR3kzNFhsMm5iOXo2S3V5L2xCUzkyWmhuOVVwZ2M2TGcvWW1hcmR0?=
 =?utf-8?B?dnl6NnQwM3pIK1pYSncyMHJpWkFCVVZLVmRxS3BMQy91NkwzZmUvb1RKeHF6?=
 =?utf-8?B?TWFHbzZWWXZqZWFXSVZNd1VzdXUzS1F0L1pNOVpRNlRDN2VXaHZnZ0NNWDVm?=
 =?utf-8?B?OFNNL0NDMDlmanZZZHFUUVlTb3FZdFRoeC83dzc0ZVl2eTlrM0t4bTdnQmhJ?=
 =?utf-8?B?YmdUOUdEakNnMyttZUxtSFdlb0ttN0djVjlEcHJxc1VTMkV2ZXFxcWxYMGlG?=
 =?utf-8?B?bnN1ZFFhc3lsNm5LQTMvUnN3NkFoYlBiVmJUcHBTQlYxMUlwaTlKbEU4YUxG?=
 =?utf-8?B?cmhYNzZvczlsRUZOeVNlVEJEOVVSdTZFK0F2MjBseWRxNUNEZkhCV2tNY2pP?=
 =?utf-8?B?WW1VK20zNklXakZqTzNIUEU1a28rY2Vwd0RwdkNUY25wNTR0OEdtTnF6MERh?=
 =?utf-8?B?YXNSSVNKSW0zQXZGOUc4NEtubFY2NTZsekNQRnZRMXB2ZlNPU2J3RWdoNmRv?=
 =?utf-8?B?a3ZBY004WkFkSGhqR0FsZjdKZncyZ3hKUkcxaWs2eU5ORVFwRVFxR3hnQ25t?=
 =?utf-8?B?SHJncXMwajF4YXU1bnpCYnRxWU0wdzFwSTJRNDRJMzIzM3M0TCtqUG5LZ0NX?=
 =?utf-8?B?aEZCZk5aL3VxLzVCYzdqMjNZWXB0RisrWkMxUHlBUEJsU2Z3OFFwOFVrOG8w?=
 =?utf-8?B?Y0RRVUcrS0RIQ2V4Rzg0S2dqTDl5NmRPWFlxQmJ3MWFLOHNYTSt5cFE4UmJZ?=
 =?utf-8?B?TytvTVVVcDQ2V0hwY2FEdGFPU3VxODVKcjdHRWJwMk5WNU41QzA2azRIOHBE?=
 =?utf-8?B?c0hEcldCakFKK0EvVUFJZ1ByeHRIanJ3WVExRFZCOGxVVHozdndtZnBGQkhz?=
 =?utf-8?B?RW9OdTh0bkIzVGkzbElZYU9XQmJOOGlya0lUTFY0NVVnb0VHamMvOFc1L1ZM?=
 =?utf-8?B?RWhvTldQczJoMk9DV2ZsblZyOXFiZk01ZE5sdmFHTVZ4aEg1WXZkMllTTG5m?=
 =?utf-8?B?Y1puVTU2Y1I4cFBzNzZvZFZ3Q3ZRcU5XT2UxQnc3RkluTnJjUkJ0dzBtaGRU?=
 =?utf-8?B?UVVrWVdQUFBhSEc1djhRbGtWcDB4MHhrYllyZ21Mdm1sR2ZDczRjOHl6Tk90?=
 =?utf-8?B?OU5IakN3Qyt1UDViNmVWRUdaWHczaEFzc0h2eWxoNnJacExWdjZxcldUUjlH?=
 =?utf-8?B?NURuVEwxYlFtS1lpNTN4L050RkpXK293NVBkamtSK2wxRmltMUE2UkpodEhq?=
 =?utf-8?B?cktEbHNaTlNzMi9iMmNTQlA2Q3A2TDMzdDdSbHdkT2RVZnJYOXpEbjIzVlpP?=
 =?utf-8?B?U2lVQVkzRjZmcWJxUUNaVkxFMUlKb3JxMitrYTRKb2dIRTdoamttZG4zV0Uy?=
 =?utf-8?B?Q2VnOVVFSTl1bEp1d2RnUnFZS3llUG45TVQ0Qzd2aVRnTUJOYzIreWdQUC9F?=
 =?utf-8?B?aVRxUExkR3U5SXNyZVp5dXJKWFdLTE5NelpObUNvbnNNTXFpMmdXQkhGbTlt?=
 =?utf-8?B?dmlLazhTanF3UzZabE90NkV0cndyKzlUcUh4eE92SmNCVTBaaFhZOFlLTkVM?=
 =?utf-8?B?Zm9CWmdQTlNYekp2S1JkSTAySVhWWmY1a3IzcVAvbzN2SE9XR3hhK3pSTlZ1?=
 =?utf-8?B?SUhaU01iMk5KY3hoNG1tMG1vWWNJTHhpa2JyZzUwSzd1VUxjM3BtUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 545ef929-eb98-4c9b-57ac-08da5027a17d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 06:07:16.9172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 M/AWuyIPiKgQNP9AujjX8GYGli0LChUSK67C5Ra+ku8HC3HkIm9EdQjmuL9GJJ5degbg/0eLlu9LsUadaeRj2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4487
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 06:07:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167016

SGksDQoNCj4gSSBzdXNwZWN0IGl0J3MgdGhhdCB5b3UgY2FuJ3Qgc2V0IGl0IGluIGxvY2FsLmNv
bmYgbm93Og0KDQpZb3UgYXJlIHJpZ2h0LCBzZXR0aW5nIE5JVF9NQU5BR0VSID0gInN5c3RlbWQi
IGluIGxvY2FsLmNvbmYgZG9lc24ndCB3b3JrLiBTeXN2aW5pdCBpcyBzdGlsbCBidWlsdC4NClNv
LCB0aGVyZSBpcyBubyB3YXkgdG8gZGlzYWJsZSBzeXN2aW5pdCBleGNlcHQgc2V0dGluZyBESVNU
Uk9fRkVBVFVSRVM6cmVtb3ZlPSJzeXN2aW5pdCIgaW4gbG9jYWwuY29uZiwgcmlnaHQ/DQoNCg0K
QmVzdCByZWdhcmRzDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBB
bGV4IEtpZXJuYW4gPGFsZXgua2llcm5hbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFNhdHVyZGF5LCBN
YXkgMjgsIDIwMjIgNTo1NyBQTQ0KPiBUbzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+DQo+IENjOiBMZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPjsN
Cj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIERJU1RST19GRUFUVVJFU19CQUNLRklMTF9DT05TSURFUkVEID0gInN5c3Zp
bml0Ig0KPiBkb2Vzbid0IHdvcmsuDQo+IA0KPiBJIHN1c3BlY3QgaXQncyB0aGF0IHlvdSBjYW4n
dCBzZXQgaXQgaW4gbG9jYWwuY29uZiBub3c6DQo+IA0KPiAjICRJTklUX01BTkFHRVIgWzMgb3Bl
cmF0aW9uc10NCj4gIyAgIHNldCAvaG9tZS9hbGV4ay9wb2t5L2J1aWxkL2NvbmYvbG9jYWwuY29u
ZjoyOTENCj4gIyAgICAgInN5c3RlbWQiDQo+ICMgICBzZXQgL2hvbWUvYWxleGsvcG9reS9tZXRh
LXBva3kvY29uZi9kaXN0cm8vcG9reS5jb25mOjcwDQo+ICMgICAgICJzeXN2aW5pdCINCj4gIyAg
IHNldCAvaG9tZS9hbGV4ay9wb2t5L21ldGEvY29uZi9kaXN0cm8vZGVmYXVsdHNldHVwLmNvbmY6
MjANCj4gIyAgICAgW19kZWZhdWx0dmFsXSAibm9uZSINCj4gIyBwcmUtZXhwYW5zaW9uIHZhbHVl
Og0KPiAjICAgInN5c3Zpbml0Ig0KPiBJTklUX01BTkFHRVI9InN5c3Zpbml0Ig0KPiANCj4gT24g
RnJpLCBNYXkgMjcsIDIwMjIgYXQgODoxMSBQTSBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBDYW4geW91IGV4cGxhaW4gdGhlIHVz
ZSBjYXNlIHBsZWFzZT8gSWYgeW91IGp1c3Qgd2FudCB0byB1c2Ugc3lzdGVtZCwNCj4gPiBzZXQg
SU5JVF9NQU5BR0VSID0gInN5c3RlbWQiLg0KPiA+DQo+ID4gQWxleA0KPiA+DQo+ID4gT24gRnJp
LCAyNyBNYXkgMjAyMiBhdCAwMjozOSwgbGVpbWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+
IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEhpLCBhbGwNCj4gPiA+DQo+ID4gPiBCZWNhdXNlIHRoZSBm
b2xsb3dpbmcgcGF0Y2gsICJESVNUUk9fRkVBVFVSRVNfQkFDS0ZJTExfQ09OU0lERVJFRCA9DQo+
ICJzeXN2aW5pdCIiIGRvZXNuJ3Qgd29yayBhbnltb3JlLiBJIGhhdmUgdG8gIiBESVNUUk9fRkVB
VFVSRVM6cmVtb3ZlID0NCj4gInN5c3Zpbml0IiAiIGluc3RlYWQgdG8gZGlzYWJsZSBzeXN2aW5p
dC4NCj4gPiA+IEJ1dCBJJ20gbm90IHZlcnkgY2xlYXIgaWYgdGhlcmUgaXMgZGlmZmVyZW5jZSBi
ZXR3ZWVuDQo+ICJESVNUUk9fRkVBVFVSRVNfQkFDS0ZJTExfQ09OU0lERVJFRCIgYW5kICIgRElT
VFJPX0ZFQVRVUkVTOnJlbW92ZQ0KPiAiIGZvciBteSBpbWFnZS4gQ2FuIGFueWJvZHkgdGVsbCBt
ZT8NCj4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiBj
b21taXQgYTZlYmJlM2ExMGZmNzYzODZkZGUwM2RkYWE3MDk3YmRiMmY1ZDlhNQ0KPiA+ID4gQXV0
aG9yOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4N
Cj4gPiA+IERhdGU6ICAgV2VkIEFwciAxMyAxODo0MTozOSAyMDIyICswMTAwDQo+ID4gPg0KPiA+
ID4gICAgIHBva3k6IFVzZSBJTklUX01BTkFHRVIgaW4gbWFpbiBkaXN0cm8gY29uZmlnDQo+ID4g
Pg0KPiA+ID4gICAgIEp1c3QgdG8ga2VlcCB0aGluZ3Mgc3RhbmRhcmQgYW5kIGNsZWFyLCB1c2Ug
dGhlIG5ldyBJTklUX01BTkFHRVINCj4gdmFyaWFibGUNCj4gPiA+ICAgICBpbiB0aGUgbWFpbiBk
aXN0cm8gY29uZmlnLiBUaGlzIG1hdGNoZXMgdGhlIGRlZmF1bHQgY29uZmlnIHdpdGggdGhlDQo+
IGFkZGl0aW9uDQo+ID4gPiAgICAgb2Ygc29tZSBESVNUUk9fRkVBVFVSRVMgdHdlYWtzLg0KPiA+
ID4gICAgIC4uLi4uLg0KPiA+ID4gICAgIEJCX0hBU0hTRVJWRSA/Pz0gImF1dG8iDQo+ID4gPiAg
ICAgKw0KPiA+ID4gICAgICtJTklUX01BTkFHRVIgPSAic3lzdmluaXQiDQo+ID4gPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4NCj4gPiA+IEJlc3QgcmVnYXJk
cw0KPiA+ID4gTGVpDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0
aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTY2MjE3KToNCj4gPiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE2NjIx
Nw0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210
LzkxMzY3MTg4LzM2MTgwOTcNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3du
ZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiA+IFthbGV4Lmtp
ZXJuYW5AZ21haWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCj4gDQo+
IA0KPiAtLQ0KPiBBbGV4IEtpZXJuYW4NCg==

