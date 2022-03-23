Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3EBC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 09:19:09 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web09.7011.1648027146558159264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 02:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1
 header.b=ByKZDhtU;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.87,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1648027146; x=1679563146;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=VK/Qkua9KeceVreB0bSVsm0K4gv4f6o1zXHqgSk7vt8=;
  b=ByKZDhtUEOl1jX2Op7GO9uXxx3oLVE6tBlcIpmPXot/zONlPObb41f0g
   ODqvGcZgxBylrKzNmC7n6J8+UrfkRugjJmO4ZdEqDuovcWh7DACzNADt3
   JqUS63CySS6c8xZyaozbAktrq4Wt4bNOPJ4DKvralx05Va01rujTTzAHW
   cdAYMfQ81aL0+x8ya+1K1aEj03KuEY6n6Ed84CMJmnqFBvn/4HZi2GFzU
   lOyYHgHuiPHZJDI6w/iZ+35KytLWj5Oo61gOaZUwbTRRKS0VufvrOOn2P
   W778bN4Rk36fkqVEC27wrLbO5+OHdFEBnVzIHTGquphDCk/18yQdKHxwk
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="52355090"
X-IronPort-AV: E=Sophos;i="5.90,203,1643641200";
   d="scan'208";a="52355090"
Received: from mail-os0jpn01lp2107.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.107])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 18:19:04 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnC7HxVyuhrBsrPEcZ3Nek/7iHX5TkeTUq33tz3QKP4ZRDnoz4FmyX2TzADwKTcBpe5S4Y1r+EJ6gU0UfJf0Il2xCX6M4M3wVA/J1d1q63bZLM8BVmXtFwfk3dlpGytofwaaWpGHbBrA/H/sSLxRH3ilddrf4tUa9hA4BLtnuH1Uzo3yYqCAoYBKv9RwdjGHxXEL+X5NXdiimH9cyDHnDmTVldKJq4J/vTfRJjifcEFZLyIFENhsBt1Tb/9wSzJ3p8+4sbiuhnunhf2dFNitnnqvWSaAgoiLqdEMJ09BpQFADtAgce2lcFwvJ12T51YbupUAMx40Nnv7a8FeGTwKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK/Qkua9KeceVreB0bSVsm0K4gv4f6o1zXHqgSk7vt8=;
 b=ldPkKAJYLcu+1JXlpiJ2u6NB4J3EP7S3GGcKZI6tzlkWP8L4MANR14pCPLRO4TGso1raD27+mmWE6MMDUcK5QmBgrh4EhFpcdEYPlsi0cL2c3dEVCD8P5BlgcfJROlCZyZQRvYTXmCkFyK7zlL33DAA+KVvQ2huiuZHxXi7ObFW+HSFdx1GzWjwsj9IyJFmc0+3KJ7lqUAFsQ3lqEx+nkV9jQp0Nt5nP4EBwdqOiSIZj2bkVRFiBnx3ijzwjYz6IXfZ2dGbBnIL1bvMhsaG6NdBciovUpHBfu/slGB8jvJ4Qhdqsil2JRx/paqLK9rGXgrxDiXhBoXRwjDTZllFN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK/Qkua9KeceVreB0bSVsm0K4gv4f6o1zXHqgSk7vt8=;
 b=g2cTwCS/AxwmtvqfhuAlza4pcZ8xr1PLuzf9AqzJjMpzoe1kf1DtpdSPXNWuRyf0Gqoq0gYfddWMBDBROzDolZG0S15esTsv51YYV1dk7U+5e5M3sRhrlMGkWDGUND5O2Jrly8a2kdLDe9utI+Ad9XtTe2ivlupFJnDpYDScXLM=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSZPR01MB6583.jpnprd01.prod.outlook.com (2603:1096:604:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 09:19:00 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::acb6:1530:384a:eaff]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::acb6:1530:384a:eaff%5]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 09:19:00 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] rng-tools: enable macro
 JENT_CONF_ENABLE_INTERNAL_TIMER
Thread-Topic: [OE-core] [PATCH] rng-tools: enable macro
 JENT_CONF_ENABLE_INTERNAL_TIMER
Thread-Index: AQHYPoxYSutjzx+t6EGovojrMdURBazMpfOAgAAD5ICAAAJagIAAA4hQ
Date: Wed, 23 Mar 2022 09:19:00 +0000
Message-ID: 
 <OSBPR01MB18454C445173C80EC8878AD4DC189@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1648022502-11770-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj_hFxsyawFnsU+wb_Kh=uDp2oD3suN+iHUzuHRgG_fs=w@mail.gmail.com>
 <OSBPR01MB1845F67F2E4385E4EBFB4F38DC189@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CANNYZj8FG3wacP9e7jq=u-HeAhr01XBtwqMjG6YkamHsDGrTEw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8FG3wacP9e7jq=u-HeAhr01XBtwqMjG6YkamHsDGrTEw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ca96bee-4250-4123-d012-08da0cae2ab7
x-ms-traffictypediagnostic: OSZPR01MB6583:EE_
x-microsoft-antispam-prvs: 
 <OSZPR01MB65835EF224665A3511502EBCDC189@OSZPR01MB6583.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cfLdmjLwKgcFKqz0/wcxPJdH4mKvDRgTDX0ZTUc52Vlg3z8KQhnkAyAgFlq7anOxj6FZcjwSnQ38C57v4qC/FtDvEWoLbPHtc2qiHeqPAiKyb1tqPCAL3hNuu6Op7Gq7EMoBiPHbVjfXz+QRz6+GR//Juw4af91PjofTcQgF0un53Zv2Z75yOsDB05iSgAFEgt7Bdg0JKzQtliUkuS9T/cylZB44gGim3xgqopFl6BaX1ASBmVwW/aN3Rlu0ZA0RsQbRI9JqKwt1iWZ1JBLh1l2VeDQF5DWA0vcaK8BARdDzkZNW67q/c0irzZMApZi2Pj8plcV43QpZZaptVRWhYwCooY2mz05b71aDV1isam+S+YJ8kG/EpDnhgVkYpS/6ve3BE+jPyPIAtcLlaFsyEuz8F3Et6QtBvFXhigJfGYbG7xZu00C5pKE/p6mqFHVZkVwNvxotBUusH7dUEVqkzp1ZIUsP64cKxrZTZYyKynHONQyaE+RGHPxzVZY3EJiit9sHC0B2MaQXRVur3Mle5dunSk/x2qMiEKzN5lNwo7CTp04RiV7K+pP97SgJI+tUTs0RV1y/+1IS8TzNQ0/9vO72RctFhCP8/Da5HxNy0N3NKwLN0dg8H2oiUSpYwxf6q0wY2A+omd3CXvTcgcQ+gQaxFAhDN+jL4IIgji8CZCO63X/ODFynUbZWTrfGLOUXhUTy9mIATp6pvhugfOihelFXo4RAPW/aaIPZpqz+dS5KCs9hQsjDQSkL4B6c9YIz7BAz9J9vEuxZ9PW4x1pRy+/i5vEXep+jZJMhX+qOsbufEyrMMyERxCgTXwT56SPdCqjKSdtIhoKKz36xihvK0A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(71200400001)(5660300002)(86362001)(7696005)(9686003)(6506007)(33656002)(508600001)(26005)(186003)(85182001)(53546011)(55016003)(76116006)(2906002)(66946007)(8936002)(82960400001)(52536014)(38100700002)(316002)(110136005)(122000001)(38070700005)(64756008)(66446008)(66476007)(8676002)(83380400001)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WjlNQmFjN2ljbm42Y0YxbFQzbjZGajBvZTNPVi9YZDZGSWw3RmRVVFpITmtH?=
 =?utf-8?B?RWQwTDFGYmpYcHVkS2JSbE0yd3BmUWMrY3FMSnh6SkVKUDkydEFFUmFmclUw?=
 =?utf-8?B?M3pLVzFHRjdENFFyNFZsZ2NIQ2hsV0p2UVpMZnV3ZldQSmsvZGtGQmx6ZGRM?=
 =?utf-8?B?Qy9XV2RuTCtNOGlRdkg2VDVPOVllSnZjWU8rOC9wUkovY3YwL3UrUlluTHc4?=
 =?utf-8?B?dzdpTmpXZUtSeDdNMzV3MVo5YkorNDBialcyTmhOT0FRczNsb3ZxeWRjSUlP?=
 =?utf-8?B?VVJTUEo2TWFJaTBibjdJOUtCVzZwVFlMQjBLWlZPMkpkb1RCQi82eWdLbmRy?=
 =?utf-8?B?RnoyRDVqdXU2S3lyTHdoNm1tSU5TZ0RZeFMwU293L1NNVUVMTnIxalpidFNB?=
 =?utf-8?B?MlFZdkJla3pDeG1uOU8wK2Z1azRZUXdQUlgxZjBSTUJidVRtb2c4SVc2bllW?=
 =?utf-8?B?N3ZQQjM4ZVNYYU12VU9KL3hDQzl2RmdhbHVOSklXRjlWSDZtQ2xHQXA1b0tM?=
 =?utf-8?B?M2dUWWdKUUora3kwVGNtYW9zenFldVV1WFdnQ3Z5Z1I3VXlrMmZ0OGo5QU5a?=
 =?utf-8?B?ZHRyYkxhTzNjaEdEU2U0SkZ4VFRXSnNxL0VoSzZWWG1WR1AxSTdZVTIxNWtY?=
 =?utf-8?B?RkRod3hvT29lT3NQVjBkSFdPclltUE1RcHNxOUZmOXV4K3JNZDVaREJlNGIx?=
 =?utf-8?B?WVA5dldrVUV5elRWbS9iTGdLY2NudFBFcjlva3pNS3RpeFo5NHhJT1hESkEw?=
 =?utf-8?B?azNKcXNLZUlJNVVMVisxVU92K0dXR3dNcGNtZU1LNDJXOVM1Q2ZsMnBZazJG?=
 =?utf-8?B?cFd1SmhWbDVSM2lSU0Zkb1lrQzljb2pOTHprY1VhdCtidVJEa2t2UXlPRmVW?=
 =?utf-8?B?azFoUlpSc1p4OUZwczBvNHE4ZCswUlhKY0Z0bkQrVk8zUUFtSFRPc1A4UnZk?=
 =?utf-8?B?d2ZweEFmb3U0Y2VlZ1dIRkYvd1UzVXY1ZFhvNXkveGh5Rm9Oa0FkSFJTeGh0?=
 =?utf-8?B?QTBvNmVQMDIwLzZjeE1pYnk0aDE5d2VnZkhwYXhUNGk2M1ZOZ1JwUXBVL3RK?=
 =?utf-8?B?QlNUc3hrNlViU0xReUY3V2l1dnZqaTBKRS8rUi9kV01hbUhOVEtzWDhaNmZL?=
 =?utf-8?B?U1FyblBWY2l0L3o2bEEzbUVaYXpZeWo4Rnh1Q0xqRDB4Q01TalB0dmJSMDA5?=
 =?utf-8?B?blVFU3c4Yk43SUYwTW1KT0ZSSmhvOTVIdXNSdDFJOVBLM0FyQkEvaGN4YXQ1?=
 =?utf-8?B?b3Nja1JER2MzZ0Z6OXcycWY1bWhQM3NUOVRDYmFVa1BmdUU3TUhEYndkMGxu?=
 =?utf-8?B?SnduM1VVQS9zekwxQWtGbUVVd1c2MW9JL3U1cnlOMytJZjd2Z0c4MENVdlFH?=
 =?utf-8?B?N2h1MjU4eWlKbE9OTkNTd3dvTmxVc3Noem9YQWNUZTdESlk3SWF4TzBRMXBQ?=
 =?utf-8?B?U055SDFhN0w4clJoVnJkY2FFRzR4K0R5RWNuWXd1RGNHK2FjVjdZc2tFUkFx?=
 =?utf-8?B?K2tBUjRpbmVicmt1dHBHTUFCV2t0aWtjZWtMeURuNHgwRWdsREVPV3RiNGJJ?=
 =?utf-8?B?Ykk1M1FsTmhCNE9NcG9USW1KTUNpUXFxQ0pjUEgwemZNTFRVdlh6TElyM2Jw?=
 =?utf-8?B?TG5iMkYyL3h3aWVDWWVpOXVKRUVmemlzendRRUt4RkErZHVkVFgrUWNLMW1U?=
 =?utf-8?B?ZnRIL2lFV3R2UVZrQjJJdTJaSjUvd0FTNm5DSHNGbG1TcnIxOE50VnJ5cklX?=
 =?utf-8?B?d3RPZURUUzdJaHh0NDFMY3AwRW8yOWNHejN0ZWlkUm9JV3BsbjVja3RpelZY?=
 =?utf-8?B?c0FzZzBJWkFzbTg4ckd0MzNSUTJ0WnJkc09nTEdSTVA1Y29xVVhRZnorZDJo?=
 =?utf-8?B?WTJJUmNyK0NLZHVLZVo4cDBuRk11dE1NakduVUVybjQrdjQxTWFPcnQvNkZh?=
 =?utf-8?Q?370JcKhR2ipR3hK6i/zE7zmd7etGVFqD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6ca96bee-4250-4123-d012-08da0cae2ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2022 09:19:00.6097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rRXppBbhf+/LAw6/yOQJRJnkQs+XMiLPH8OgoFqfvUqhhszPJ1+L707r9zLFCWnGwN8aN3/ToHjKUbXWwHTv4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6583
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 09:19:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163583

WWVzLCBpZiBsaWJqaXR0ZXJlbnRyb3B5IGlzIHVwZGF0ZWQsIHJuZy10b29scyBtdXN0IGJlIG1v
ZGlmaWVkLCBvdGhlcndpc2UgZG9fY29tcGlsZSBlcnJvcnMgd2lsbCBvY2N1cg0KDQrCoCAtLQ0K
QmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9wbWVudCBEZXB0LkkNCk5hbmppbmcgRnVqaXRz
dSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkgTm8uIDYgV2Vuemh1IFJvYWQs
IE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDogKzg2KzI1LTg2NjMwNTY2LTg1NjgNCkNPSU5T
OiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNv
bQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDIzLCAyMDIyIDU6MDIgUE0NCj4gVG86IFdh
bmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+OyBPRS1jb3JlDQo+IDxv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSF0gcm5nLXRvb2xzOiBlbmFibGUgbWFjcm8NCj4gSkVOVF9DT05GX0VO
QUJMRV9JTlRFUk5BTF9USU1FUg0KPiANCj4gUGxlYXNlIGtlZXAgdGhlIHJlcGxpZXMgb24gdGhl
IG1haWxpbmcgbGlzdC4gVGhpcyBwYXRjaCBzaG91bGQgcHJvYmFibHkgYmUNCj4gbWVyZ2VkIHdp
dGggdGhlIGxpYmppdHRlcmVudHJvcHkgdXBkYXRlPw0KPiANCj4gQWxleA0KPiANCj4gDQo+IE9u
IFdlZCwgMjMgTWFyIDIwMjIgYXQgMDk6NTUsIHdhbmdteUBmdWppdHN1LmNvbQ0KPiA8d2FuZ215
QGZ1aml0c3UuY29tPiB3cm90ZToNCj4gPg0KPiA+IEFmdGVyIGxpYmppdHRlcmVudHJvcHkgaXMg
dXBkYXRlZCB0byAzLjQsIGEgbWFjcm8NCj4gSkVOVF9DT05GX0VOQUJMRV9JTlRFUk5BTF9USU1F
UiBpcyBhZGRlZCB0byBqaXR0ZXJlbnRyb3B5LmggdXNlZCB0bw0KPiBjb250cm9sIHN0cnVjdCBq
ZW50X25vdGltZV9jdC4NCj4gPiBybmctdG9vbHMgbmVlZHMgdGhpcyBzdHJ1Y3QsIHNvIGl0J3Mg
bmVlZCB0byBtYWtlIHRoaXMgbWFjcm8gZW5hYmxlLg0KPiA+DQo+ID4gICAtLQ0KPiA+IEJlc3Qg
UmVnYXJkcw0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiA+IFdhbmcgTWluZ3l1DQo+ID4gRGV2ZWxvcG1lbnQgRGVwdC5JDQo+ID4gTmFu
amluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKSBOby4gNiBX
ZW56aHUNCj4gPiBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQo+ID4gVEVMOiArODYrMjUt
ODY2MzA1NjYtODU2OA0KPiA+IENPSU5TOiA3OTk4ODU0OA0KPiA+IEZBWDogKzg2KzI1LTgzMzE3
Njg1DQo+ID4gTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQo+ID4gaHR0cDovL3d3dy5mdWppdHN1
LmNvbS9jbi9mbnN0Lw0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+ID4g
PiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDIzLCAyMDIyIDQ6NDAgUE0NCj4gPiA+IFRvOiBXYW5n
LCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+ID4gQ2M6IE9FLWNv
cmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+ID4gPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gcm5nLXRvb2xzOiBlbmFibGUgbWFjcm8NCj4gPiA+
IEpFTlRfQ09ORl9FTkFCTEVfSU5URVJOQUxfVElNRVINCj4gPiA+DQo+ID4gPiBUaGlzIGVycm9y
IGlzIG5vdCBzZWVuIG9uIHRoZSBhdXRvYnVpbGRlciwgY2FuIHlvdSBwbGVhc2UgY2hlY2sgd2h5
DQo+ID4gPiBpdCBvY2N1cnMgb25seSBpbiB5b3VyIGxvY2FsIHNldHVwPyBUaGUgbWFjcm8gcHJv
YmFibHkgbmVlZHMgdG8gYmUNCj4gPiA+IGVuYWJsZWQgaW4gYSBtb3JlIHRhcmdldGVkIHdheS4N
Cj4gPiA+DQo+ID4gPiBBbGV4DQo+ID4gPg0KPiA+ID4gT24gV2VkLCAyMyBNYXIgMjAyMiBhdCAw
OTowMiwgd2FuZ215IDx3YW5nbXlAZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4g
PiBkb19jb21waWxlIGVycm9yIDoNCj4gPiA+ID4gfCAuLi9naXQvcm5nZF9qaXR0ZXIuYzogSW4g
ZnVuY3Rpb24gJ3JuZ2Rfbm90aW1lX3N0YXJ0JzoNCj4gPiA+ID4gfCAuLi9naXQvcm5nZF9qaXR0
ZXIuYzo1Njo0NTogZXJyb3I6IGludmFsaWQgdXNlIG9mIHVuZGVmaW5lZCB0eXBlDQo+ID4gPiA+
IHwgJ3N0cnVjdA0KPiA+ID4gamVudF9ub3RpbWVfY3R4Jw0KPiA+ID4gPiB8ICAgIDU2IHwgICAg
ICAgICByZXQgPQ0KPiA+ID4gLXB0aHJlYWRfYXR0cl9pbml0KCZ0aHJlYWRfY3R4LT5ub3RpbWVf
cHRocmVhZF9hdHRyKTsNCj4gPiA+ID4NCj4gPiA+ID4gZW5hYmxlIG1hY3JvIEpFTlRfQ09ORl9F
TkFCTEVfSU5URVJOQUxfVElNRVIgdG8gdXNlIHN0cnVjdA0KPiA+ID4gPiBqZW50X25vdGltZV9j
dHgNCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBm
dWppdHN1LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC9y
bmctdG9vbHMvcm5nLXRvb2xzXzYuMTUuYmIgfCAyICsrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9ybmctdG9vbHMvcm5nLXRvb2xzXzYuMTUuYmINCj4gPiA+ID4gYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9ybmctdG9vbHMvcm5nLXRvb2xzXzYuMTUuYmINCj4gPiA+ID4gaW5k
ZXggYWU5NzRmOWY2Zi4uMDY5NjM1MTkwMyAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvcm5nLXRvb2xzL3JuZy10b29sc182LjE1LmJiDQo+ID4gPiA+ICsrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3JuZy10b29scy9ybmctdG9vbHNfNi4xNS5iYg0KPiA+ID4gPiBA
QCAtMzQsNiArMzQsOCBAQCBJTklUU0NSSVBUX1BBUkFNUyA9ICJzdGFydCAwMyAyIDMgNCA1IC4g
c3RvcCAzMA0KPiA+ID4gPiAwIDYNCj4gPiA+IDEgLiINCj4gPiA+ID4NCj4gPiA+ID4gIFNZU1RF
TURfU0VSVklDRToke1BOfSA9ICJybmdkLnNlcnZpY2UiDQo+ID4gPiA+DQo+ID4gPiA+ICtDRkxB
R1MgKz0gIiAtREpFTlRfQ09ORl9FTkFCTEVfSU5URVJOQUxfVElNRVIgIg0KPiA+ID4gPiArDQo+
ID4gPiA+ICAjIFJlZmVyIGF1dG9nZW4uc2ggaW4gcm5nLXRvb2xzDQo+ID4gPiA+ICBkb19jb25m
aWd1cmU6cHJlcGVuZCgpIHsNCj4gPiA+ID4gICAgICBjcCAke1N9L1JFQURNRS5tZCAke1N9L1JF
QURNRQ0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjI1LjENCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+
ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiA+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gPiA+IFZpZXcvUmVwbHkgT25saW5l
ICgjMTYzNTc5KToNCj4gPiA+ID4NCj4gPiA+DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTYzNTc5DQo+ID4gPiA+IE11dGUgVGhp
cyBUb3BpYzoNCj4gPiA+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzg5OTcx
MTM0LzE2ODY0ODkNCj4gPiA+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVy
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+ID4gVW5zdWJzY3JpYmU6DQo+ID4gPiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiA+
ID4gPiBbYWxleC5rYW5hdmluQGdtYWlsLmNvbV0NCj4gPiA+ID4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gPiA+ID4NCg==

