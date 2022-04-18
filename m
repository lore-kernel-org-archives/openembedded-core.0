Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156E8C64E7E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web10.36147.1650255402709480708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 21:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=wLTAmoeA;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.87,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1650255403; x=1681791403;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OIpaGN43c7jUJNCij8BkJ3HEze0xL+j3gC5yXg83POY=;
  b=wLTAmoeAcK8P2tQgSDHMkmi4F5gYvjou6yNQAKs4EgD6BBxi7QEICo+o
   POFMcwnKxxbRrssOTYJU+O7vZa6sLZ5bE8DsAW/JjcdWkTT2kUAQ312Ld
   mXAM/ymxWSpo+c8L/Su8epYO+wn5LFUwjNgBP/0E16mTeToZP88zguBUs
   rqcWuPf3FLXBwWCLsrdszbyd9qTh/oiWhmGmKOjbIeOFJ92hgdvmLptxc
   Ici9iNHR5pNj4Mz69yV8Dw0cOKBjjSuYYhZ1g+58ClNE51LksYCsPyCmC
   noMtRMml41bbundaxGRD3OuSmp8EEFUX7fb/lLKEpojICktVsGlWwjyDv
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="54127477"
X-IronPort-AV: E=Sophos;i="5.90,267,1643641200";
   d="scan'208";a="54127477"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 13:16:39 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZctq3whHYwqfiqcjvEyNdmxCF2bsP8zmsZEtT2UgjY5AupnHlPOgglPH7iQwxyezHgUtfrpZxHJzWBW54NVRLfHU0EOv/WTnSa7jooh/WefDZOWbGJscGvufZVLxTXuKF/Z0Q8R0g94Wj5I85wMJTdtkBV7g1MfeN5RU06B8ZQYTK8lh1wPwG+KOv2TzHOJvHQnb7gLfNNwGkpydQdWpQDw0x1UOLIfhNN8bAy+5suyNVaZlETBkUYNjGFdL3r7hNz6cPg5AmhZTqRYSSzbgeZ/JYFElS2srFgdQ8/R7x0O04Ts/GjVqCp4mzCMRSDoTNYsCdKDASGthwUOiNkpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIpaGN43c7jUJNCij8BkJ3HEze0xL+j3gC5yXg83POY=;
 b=OD1MEqobd/jZv/2Efz0mGbOL5QCHhSxlwawmSSlo+BO843etqZvR8EwVS47btQN28vrPg+Agoq4cGI9PX9ppyzAKBrTFRAxyBehSpK+mHkWuMdKbUJprYOSkffTLQYe2LZRYURf8nQo50LiEPzlCZReH9RxKEVr7XMvEUd/b6CISq0dYgxmLIhn4wHb4Td4U1KaHo7+KbDAtOjlKjx3WmrokEXRHaTX/5Ht9S5x3zUUKM6A1uZBCYiQAZkoJL6Cff2neZEUDMqGLFRuPArD/Iex3niD4w+Hl7172WgjvlRlcqXNuFQMkGIA42ZRc9nVF3NKdSS9J/hdU107tHtiviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIpaGN43c7jUJNCij8BkJ3HEze0xL+j3gC5yXg83POY=;
 b=XKPJglglLL6H1jMd4vtt9pE9RnBcmVa5M35mzhbLdp1VEevTSl1Z0AkFfSEwhoMPJjIUeCzwXMHtqUyJfISPxq0x1Zsef+lxBnUovHw6uHBfh+2yFyO1IoVzl7qXgu1q7RFpMkDYahF9gssnu2L3slvna8fTH9mcCvbfVubmzYg=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS3PR01MB6225.jpnprd01.prod.outlook.com (2603:1096:604:f0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 04:16:36 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::b8ca:d7c2:54cb:348a]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::b8ca:d7c2:54cb:348a%4]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 04:16:35 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] libbsd: upgrade 0.11.5 -> 0.11.6
Thread-Topic: [OE-core] [PATCH v2] libbsd: upgrade 0.11.5 -> 0.11.6
Thread-Index: AQHYTOJcIIYs4R6sJUaR8Q7UYhuweqzuVTQAgAbFyIA=
Date: Mon, 18 Apr 2022 04:16:35 +0000
Message-ID: 
 <OSBPR01MB1845847087F7A78E52E7085CDCF39@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1649364599-24962-1-git-send-email-wangmy@fujitsu.com>
 <Ylc2ih7dovPZ2wFh@mail.local>
In-Reply-To: <Ylc2ih7dovPZ2wFh@mail.local>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32ff0aea-cbbf-4f01-0912-08da20f23a36
x-ms-traffictypediagnostic: OS3PR01MB6225:EE_
x-microsoft-antispam-prvs: 
 <OS3PR01MB62253578F9ADCFE13D41C46DDCF39@OS3PR01MB6225.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mQnjAgauq9GyVpk7Jq8tuSAw0fFbRfTKOTus+r10/BLRrnDP2VEZ8oVn1tq7/aPljo4EvKpTGzh9kK7KokQXzLd9sN2wJOiMentBB1uT2czQtPLw+uzUku8ubrPl5Ch4HIrr2gb+mIs4wMtafVGBtqOnhx9GRKaKBnP6KS/+vO6S/ZrB5NzNGqdcSBD5xaynVgW5KCszgC/qICyFRR7Wb2C38y5UVbETwieeZlLNXnwntIrDkN4Rt2cm9ucREUM0YHY8CrP0LTNX3qvBRAEsk4x/cygfycGndOWEsMDitDgtoVmNMs4mAvv9Q2y6O6yeKix9t7qnMJDb6rdZsLRcTSuCqiKV51T5DjeyxVTCzlLZUOpbs1Q7qBwsebaJq56wQsrOmqJ4PhMrOikB5A91LM1hgQU3JxsQygPBwkszbR1NCk9wd5INnLVueqBTvBRj58j3nDzYhIWuiBXmzINyKN1l0fz1eJWjCoY84Hy8i8E0xPXUcOk/d32LeS2SmGY/mUmH8w+kJp9XLO6k6NV0hVh3t3qeMhSP4pDDAP2QgJYrgDvOgrOvFp6qnHMgPd3gnIheCs9Vv0dJMvG34O5rDWo5V//gPAqDHFri20BGojrUOVcluJxnv6KpoSL4DTaZYrBXzDzYjgE50n1uCLrTsW90BAVHGDyqQSgKUJBdC19zZ8ds6a8hsLtAWT5Ce/cOSLx20CmVSI558hv1jZqi/COGRgyHIPScwimfdaZgmxuBVRccLCmPqUODY3EYgvGpzbdQnxVuaaLLhBXzyWL2xs03iImoyyjpH926EsEMZKmFx2m3htv6HmHugNrHdLf+m2YTRswXcZD6CTX0QM/6IA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6916009)(316002)(38070700005)(38100700002)(33656002)(9686003)(7696005)(6506007)(186003)(26005)(55016003)(508600001)(122000001)(966005)(83380400001)(85182001)(66446008)(4326008)(86362001)(71200400001)(8676002)(66946007)(82960400001)(66556008)(64756008)(66476007)(76116006)(8936002)(52536014)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dEhjR1VRTXNFRXJyUzhBdHhId1cyMGx6c2VZN2FrZllqYWo0NFNaZEpua3FW?=
 =?utf-8?B?T0lGV3RJeWRBQ0FxSFFiYXdNYmhMREd2UUtPSHQ2VlRETXdaejBYTVJLU0RS?=
 =?utf-8?B?aFlhU3lDVmN5SFc1cGlpcW1BOGZYcnVxTktad1psQTY5SEx1R1IxOW1DTndF?=
 =?utf-8?B?NGNuOWVHa21NV3B3N0FkTTVnZUFQd3hrRXNvZDlFclVHczIrRldQVjNybmlZ?=
 =?utf-8?B?VEdvd09wK095a0VTUDdKR0pGT3NSUmYvSWkyNWxGcTF6MmRRM1hOdWN4Ky9n?=
 =?utf-8?B?NFZUdFJod2FFSnJNY3VtcURsbXR5eTNwMnpBMEFqY3pUUkUwVW05Wngrdjl1?=
 =?utf-8?B?VDZVN3dyTXExWG56aVMxVkE4ZzVWRHBlODcxeVNKTWZxK25vZlpQK1ZyNUpH?=
 =?utf-8?B?R0xOZGNGbUNva1ZuRkxpUTF3UkczekZYci95SnhlempuZCszWlRacFRUV0g0?=
 =?utf-8?B?Uk9zbjNCQU15OHlzUXZkYUFyMFlSRVVONCtkaTE0Y1NONTNZMGhGSUFqcCtZ?=
 =?utf-8?B?Zy9wd1YxL0RGSFBEUUhsMWJVMXdNd3k3ZEN1clVvMjlqK25YN1creUFCUUdM?=
 =?utf-8?B?Z1dEKzNTczZyYlJIUUpRSGN4WTIxejBiWGpzcytmY2czVHBCa1AwOE4xZ2xG?=
 =?utf-8?B?QWJzNFN4NnY2ZmJTTzAwQ2tyVFZhZGJXZEdTOGQzQlZvM0w1VklBeGpQOFdJ?=
 =?utf-8?B?OXpyVVpPN0tyYUxST3VKdS9wUHh2OW9sY1JyTi9GVC94ajVxb1FqSVErUnlo?=
 =?utf-8?B?QURRcUhaK2pEeVBlS0dDdkRNVytiK1BqNHNlb3NYU3UyRFM5V016Rm5vNnFw?=
 =?utf-8?B?VEVaenlUMi9BQzFGVFdzdzYyK09YTUN4NUVZNHVlOGhwV0Fkbm10RnVtNngx?=
 =?utf-8?B?c1U3Um5DMU04dmxJdUlmdXk3cCsrcWlVSThQeGV5VEdqNTY5NVpLOGRQNUxN?=
 =?utf-8?B?Q2dLNkl4MkpFZUVrdHR4SWhNN3A4UnM1d0Z5RmFid2tYTG9LTy9VYlRWU2RY?=
 =?utf-8?B?RmtaZ1pnd3owQmtWeXYvQTRoMXhvTDZXSVBLSkluNXU1cERXTDNNUk5mSDMx?=
 =?utf-8?B?WDBWR3JGRFNiOFc3cEJTMkJpSEwyR1kxOXplUU5OUTd1eG9pN094UWMyR3N1?=
 =?utf-8?B?YkJ5amlUYnMvOWdaNUU2NUhhRkpYS3JUK2xPbi9rRWVpNmZVOENzS1pPODhG?=
 =?utf-8?B?TkpTVXlkUkpicWNuV2FJN1MyR1dISUo2LzR0TTlzb3EyL2pmQ09YMy9TSnJS?=
 =?utf-8?B?ek9ncFF3Ukg3Q2Z0VUpFUlphQThKUGYxUDFsNHI5ZnVwcGxtaHVRajM1RVQ0?=
 =?utf-8?B?bkE3WEkzQWJCd0lPa2VnZW9GcXR6dW5aR282Ulkxai9YdlZXRFZhQnBOdmUx?=
 =?utf-8?B?UnNmenhuRTRnZXVtSVd3MGRQRm1EWElTZ0hJWnFNb2twNWJyUVNpc3ZHb3Z6?=
 =?utf-8?B?S0F4d1V2N1JpR0tMRDJZNStmSmlXd1VvSHEvdEdWc2RmM0Q3OXdxNkdHcG1u?=
 =?utf-8?B?ZnJsVXA4RUNLMktGQ21VMGZndW9JQURjVHJDNGVQeDN5NzBWbTRsKzRmSFNr?=
 =?utf-8?B?d3c3NllMVkdCbHk1Zm9iTzZ6S1BLcTRua01Zb1ZQSFZ3UXhkaU5XTVdPWXlL?=
 =?utf-8?B?U01PSmlzb1FEN1RXcW42cXNoVWFFdkdRbVhyVGhmMVFrVG1wMnhINlN5Nm9r?=
 =?utf-8?B?N0pETEFyYUJZWm9SVXg5UWxzWlRJWDRTZEhNM0ZIdDBoNzRsd3FMbVYyZHFR?=
 =?utf-8?B?cWRQZnNWV01MZXNIUEt2V1k4bzdCaTk0WnRXeklYNlJjL2N3TG04N2pRK3VG?=
 =?utf-8?B?Rlo0a2xYN054S3N1ZkVzcTRKZjZyNFJ0Wk5XZkF6S3JMMkpDdEp1NkdkYXZ3?=
 =?utf-8?B?K2tsTWhsb3NmdU9vbm5sdGxJallUaXMrK3ZKc25EZEZQUTNqNmVVd0VyQWlD?=
 =?utf-8?B?TnBOTEkybUZaRHY1eE9ReWhWRnFUcnhvdEhPd2p0YmdIcWdYTjZUVlBScGhN?=
 =?utf-8?B?cFdycHZpdjdnWi9JeVJaOGpPeVJ6VDV5NHpiQkFPZk5ub0w1YjNNdDdObkFL?=
 =?utf-8?B?V3BqZkt3cnVUT2NUQW5ZQjIvZVdodTJwcnZMb0F4YzE1OXNXWWozcmt5Nk5D?=
 =?utf-8?B?NWFicVdiR252NkJiTkgwN1lIUmtEQlZKc0UwSTFDQXd1a0FjUjJxd2hnZjZS?=
 =?utf-8?B?S3hZcUgxcWFYVnBIS1Q0Z1ZvdEUwQm9VdVdMV3hDT0pUSjR5NExCWXJTTXVS?=
 =?utf-8?B?WXhRRy9xb0hhaklWWjRKK1VxR1ZqSnFEVHJVZGJCSUFQOG1ZelM0WDdQWEFi?=
 =?utf-8?B?eDRUblJRV3ZVNG9DSitjaXdra1dzQ0NadjBHTzlPcjAwVnZZM3oxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32ff0aea-cbbf-4f01-0912-08da20f23a36
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 04:16:35.5109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 b8PYQQVCh+lihKGqiYr8sF0LeX9peSO4rzWZcq+gtEzx4rzvAfqVLmNCrJRnaoFOyRgYZ92dP3WuekKmi9dz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164581

VGhlIHJlcGx5IGVtYWlsIG9uIHRoaXMgcXVlc3Rpb24gc2hvdWxkIGhhdmUgYmVlbiBvbWl0dGVk
IGJlZm9yZS4gSSdtIHZlcnkgc29ycnkuIFRoZSBzYW1lIHByb2JsZW0gd2lsbCBub3QgaGFwcGVu
IGxhdGVyLg0KDQrCoCAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9wbWVudCBEZXB0
LkkNCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkg
Tm8uIDYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDogKzg2KzI1LTg2
NjMwNTY2LTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6
IHdhbmdteUBmdWppdHN1LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRyZSBCZWxsb25pIDxh
bGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDE0
LCAyMDIyIDQ6NDYgQU0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVq
aXRzdS5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyXSBsaWJic2Q6IHVwZ3JhZGUgMC4x
MS41IC0+IDAuMTEuNg0KPiANCj4gSGVsbG8sDQo+IA0KPiBJIGZpeGVkIGl0IHVwIGJ1dCB0aGlz
IGlzIG5vdyB0aGUgdGhpcmQgdGltZSB0aGlzIGhhcHBlbnMuIFlvdXIgcGF0Y2ggaGFzIGENCj4g
ZGVjbGFyZWQgY2hhcnNldCBvZiAneScgd2hpY2ggaXMgbm90IGEgdGhpbmcgYW5kIGdpdCBhbSBm
YWlscw0KPiB3aXRoOg0KPiANCj4gZXJyb3I6IGNhbm5vdCBjb252ZXJ0IGZyb20geSB0byBVVEYt
OA0KPiBmYXRhbDogY291bGQgbm90IHBhcnNlIHBhdGNoDQo+IA0KPiBZb3Ugb25jZSBhZ2FpbiBn
b3QgdGhlIGZvbGxvd2luZyBwcm9tcHQ6DQo+IA0KPiBUaGUgZm9sbG93aW5nIGZpbGVzIGFyZSA4
Yml0LCBidXQgZG8gbm90IGRlY2xhcmUgYQ0KPiBDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nLg0K
PiBzb21ldGhpbmcucGF0Y2gNCj4gV2hpY2ggOGJpdCBlbmNvZGluZyBzaG91bGQgSSBkZWNsYXJl
IFtVVEYtOF0/DQo+IA0KPiBBdCB0aGF0IHBvaW50LCB5b3UgcHJlc3NlZCB5IGJ1dCB5b3Ugc2hv
dWxkIHNpbXBseSBwcmVzcyBlbnRlci4gUGxlYXNlDQo+IHJlbWVtYmVyIHRvIGRvIHNvIG5leHQg
dGltZS4NCj4gDQo+IE9uIDA4LzA0LzIwMjIgMDQ6NDk6NTkrMDgwMCwgd2FuZ215IHdyb3RlOg0K
PiA+IExpY2Vuc2UtVXBkYXRlOg0KPiA+IC0gIENvcHlyaWdodCB5ZWFyIHVwZGF0ZWQgdG8gMjAy
Mg0KPiA+IC0gIExpY2Vuc2UgSVNDIGNoYW5nZWQgYXMgZm9sbG93aW5nOg0KPiA+ICAgIHJlbW92
ZSAic3JjL2FyYzRyYW5kb21fb3BlbmJzZC5oIiBmcm9tIEZpbGVzDQo+ID4gICAgYWRkICJ0ZXN0
L2V4cGxpY2l0X2J6ZXJvLmMiIGFuZCAidGVzdC9zdHJ0b251bS5jIiB0byBGaWxlcw0KPiA+ICAg
IGFkZCAiQ29weXJpZ2h0IMKpIDIwMDQgT3R0byBNb2VyYmVlayA8b3R0b0BkcmlqZi5uZXQ+Ig0K
PiA+ICAgIGFkZCAiQ29weXJpZ2h0IMKpIDIwMTQgR29vZ2xlIEluYy4iDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+
ICAuLi4vbGliYnNkL3tsaWJic2RfMC4xMS41LmJiID0+IGxpYmJzZF8wLjExLjYuYmJ9ICAgICAg
ICAgICAgIHwgNCArKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pICByZW5hbWUNCj4gPiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2Qve2xp
YmJzZF8wLjExLjUuYmIgPT4gbGliYnNkXzAuMTEuNi5iYn0NCj4gPiAoOTAlKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMS41LmJi
DQo+ID4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTEuNi5iYg0KPiA+
IHNpbWlsYXJpdHkgaW5kZXggOTAlDQo+ID4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliYnNkL2xpYmJzZF8wLjExLjUuYmINCj4gPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliYnNkL2xpYmJzZF8wLjExLjYuYmINCj4gPiBpbmRleCBiYjg3NjZhMDcwLi43NGZj
OGVmNGU1IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJi
c2RfMC4xMS41LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNkL2xpYmJz
ZF8wLjExLjYuYmINCj4gPiBAQCAtMjksMTIgKzI5LDEyIEBAIEhPTUVQQUdFID0NCj4gImh0dHBz
Oi8vbGliYnNkLmZyZWVkZXNrdG9wLm9yZy93aWtpLyINCj4gPiAgIyBMaWNlbnNlOiBwdWJsaWMt
ZG9tYWluLUNvbGluLVBsdW1iDQo+ID4gIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgQlNELTQt
Q2xhdXNlICYgSVNDICYgUEQiDQo+ID4gIExJQ0VOU0U6JHtQTn0gPSAiQlNELTMtQ2xhdXNlICYg
SVNDICYgUEQiDQo+ID4gLUxJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0NPUFlJTkc7bWQ1
PTBiMzE5NDRjYTJjMTA3NTQxMGEzMGYwYzE3Mzc5ZDNiIg0KPiA+ICtMSUNfRklMRVNfQ0hLU1VN
ID0NCj4gImZpbGU6Ly9DT1BZSU5HO21kNT1jMmM2MzViOTRjOGRjZDM1OTNmNTNlMTBmYThhNDk5
ZSINCj4gPiAgU0VDVElPTiA9ICJsaWJzIg0KPiA+DQo+ID4gIFNSQ19VUkkgPSAiaHR0cHM6Ly9s
aWJic2QuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2VzLyR7QlBOfS0ke1BWfS50YXIueHoiDQo+ID4N
Cj4gPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjFhOWM5NTI1MjU2MzVjMWJiNjc3MGNiMjJl
OTY5YjkzOGQ4ZTZhOWQ3OTEyMzYyYjk4ZWU4MzcwNTk5YjANCj4gZWZkIg0KPiA+ICtTUkNfVVJJ
W3NoYTI1NnN1bV0gPQ0KPiAiMTliMzhmMzE3MmVhZjY5M2U2ZTFjNjg3MTQ2MzYxOTBjN2U0ODg1
MWU0NTIyNGQ3MjBiM2I1YmMwNDk5YjUNCj4gZGYiDQo+ID4NCj4gPiAgaW5oZXJpdCBhdXRvdG9v
bHMgcGtnY29uZmlnDQo+ID4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo+IA0KPiA+DQo+ID4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3Nh
Z2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE2NDIwMyk6
DQo+ID4NCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNv
cmUvbWVzc2FnZS8xNjQyMDMNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC85MDM3NDQzOC8zNjE3MTc5DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5l
bWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmli
ZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUv
dW5zdWINCj4gPiBbYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb21dDQo+ID4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gPg0KPiANCj4gDQo+IC0tDQo+IEFsZXhhbmRyZSBCZWxsb25pLCBj
by1vd25lciBhbmQgQ09PLCBCb290bGluIEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwNCj4gZW5n
aW5lZXJpbmcgaHR0cHM6Ly9ib290bGluLmNvbQ0K

