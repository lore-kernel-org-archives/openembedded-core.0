Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684E8C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 00:55:09 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web10.3565.1652144097919631646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 17:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KL7UW4Bh;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.101,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1652144098; x=1683680098;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7kBKUoFQKbXLnejAozq9SN4d3ZP5cS5sAg3YqA7WPVg=;
  b=KL7UW4Bh1z66+hTqqhlkD9b/E9gj2OzfqQZ1fz4yrGRBomoHQRAbQkbp
   HdOfvhC2r234GNfHYKifure9nMwdbqm4ffR0i9iMUiN0Y2mXtU1Ut9iVc
   BnnnG0DYSyOjh9S51uBShP1QH23Em2y0zegkEy81b9a1dZWCR0zXiwbbq
   IGMp6muws7bnmf0ydQhBg88NJfMDLe6Yw/YOtoOsR0rglmAraPKSVidh0
   sGE5XXx0swQNevHLBqKs9I/BVNEV0aJbShqhskaYg5H1ZlEpCu+Fwq2fi
   g0iREVVWgcqlx+9B4nbjHyNtxxf3tZZYVAYCq0lzVdHb5cHYQ0FZjD/TG
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="55257126"
X-IronPort-AV: E=Sophos;i="5.91,213,1647270000";
   d="scan'208";a="55257126"
Received: from mail-tycjpn01lp2171.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.171])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 09:54:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igmZZqGc7Zx504B+WIWC4vSIF0WDvPuIsN4E/UnrAtmIJSANnZHAsmkkq5sIte3FnGloeQasCnvAM+LUa0Blbjl3nIQ1dZ3H7JtioK8RkaAP99UvVdiixUeYUvlz/g7XC2dxYIbWDvcW/P2VMz0ZyZ21WVW9UHurS0cl1JlVZt0w6EZOuVtFOHd1Fx9M03KtQR3h66Iz8X8HkpA3Y45qVrniHqmW4LYQZWkRX8vgfGDq3s/B2Gv4ryN6hH3Wloch4T+sVRBX1xmb9GVxl2P1JIIKK8TPPOWluxHn4M/opQf5fD0BRrtEHmGpDSvWtvev+quMgkUJFPzW3oEpuV1mew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kBKUoFQKbXLnejAozq9SN4d3ZP5cS5sAg3YqA7WPVg=;
 b=XxYLUcReRJAyqJgYle3VCBvdcYCiK+cSroZ3peIjZbhKQrjtzCcgvDobSfizplGMPA8vEzwWuHJFxW/YZCfKRBvnZWIJ5D10mik7rqIgOI0FHfPvnkNZd2v2P6AIjAL5mVpy+PXJuxsqL1KPs8vvy2TlM6nhXXaBf7+4nX4U8ZMjKzJan89dVy75/MCTs+p2XlYN93HgoAlPDxNYcopsnJ6klzIToTy7CH3u98jCr3gGECf2pqAsfFKsD8R3Rn7iQPAnW3VXUqfu2ogn0OdUaNHCV6Dod8Om492l2vyPzQPjVrWeIvbYZi/lgpFaMs5lfkG51txRuTwaGbcBrgy3kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kBKUoFQKbXLnejAozq9SN4d3ZP5cS5sAg3YqA7WPVg=;
 b=LrIGtCZktkwu+zGG4VRFwWqnZZMYp/Zx7mhEuW4dVj3WtsGUiKH+xX9z+mq9aZ6mCsVe0KBI92r7jVysGX54ybehAQkLbU/7MIzpEp6AKxJySiNpEOwIpMJcZj0psFJ4rhBiLWC8XYp4SyR6fXwUo55GdMVHh/mKfFaMponZYpQ=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OS3PR01MB7160.jpnprd01.prod.outlook.com (2603:1096:604:14c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 00:54:51 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%7]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 00:54:51 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Topic: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Index: 
 AQHYYPqy/ocPXdQui0OLuVvDKY1+Ca0RY4IAgAEiy4CAAIIIgIACu/kAgAB7qACAAQd0IA==
Date: Tue, 10 May 2022 00:54:51 +0000
Message-ID: 
 <OS0PR01MB61786F05D3748BC41FBC3CDBA0C99@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_wg3r2smGwNVoN34L0ai-pPjPEfjg0P7LoQEirfL8rhQ@mail.gmail.com>
 <OS0PR01MB61785EBD9D1441B3201AC1A2A0C69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_K42tgo7kRVV4fOHkFXQBxEs86KdGBX_vbYsahip9FVg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_K42tgo7kRVV4fOHkFXQBxEs86KdGBX_vbYsahip9FVg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9362664a-c1cb-4154-a1ea-08da321fb085
x-ms-traffictypediagnostic: OS3PR01MB7160:EE_
x-microsoft-antispam-prvs: 
 <OS3PR01MB71604746FE07E2C0204689EEA0C99@OS3PR01MB7160.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8R+cYkG05X6N0STBRbY9/7npP8f6sUVOi9moQadz/3KmXo2tIosavVEHxlLt8T/vYd8OUx/IugHqonHzSKKx0yiqrQIouql4B8bcPX5wQgQxrwJ3mo6mCRCdInkuQQkoM/U+zTWBG9c11NLqS9DXPSIQrFzLbDKN8l2mBLqzjQ5DoXIiB+N5hlWAl25EjOPj+fgsf5HlQ2LT8rw7nOfT3FdbCub4w6Ua4osO5UU4NpLRsO6HAlvsDEgxu1zG5sjPhzJBfE3u64XLTv32YnvdZm0TxChh1eaRYPNGOuD7PBXl9XiaBcJxbBvkjar8jM6DwAhv3OdzcVAywKCH4QgC8ExRPSKFAfLlM1RLreCtXhd0wbZpJkcvT3TySaPVwaMomWzQhyqgHX3k53COCIYu7hNYiG9e9buoL0z5I0Nm+LZozXfFvNo4HLOm9ODv2xdfAe3eRLFEuFB7j5duQGM0wbFrcbgJW3cgqbTL4M9W7dXDHnsnUwgzs1V6YfYmzYXcjvG48s7uGepO3V87Btef943ByIl2gbWiugpKKGwYQfwdon1opQFOaNSl3IVr8QtFzH26Ue+nPX7EPuX4gPCBRipD2FRDSjhuj7qjYL5H52dWy1PkAyA+LBvWNxsRWCgbdCFQ4tGVTtUy6w21IhSZQ0GRPTEoA9RxSdOqYJ25Se8iZLZkZR5Fqd/otYmHBmFPLFsSX8jh4tDhGfVnL8aGCSfXzVHdjJcrSEEAIT8Uu+4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(6506007)(85182001)(53546011)(9686003)(83380400001)(26005)(33656002)(5660300002)(8936002)(122000001)(186003)(2906002)(66556008)(316002)(508600001)(38070700005)(38100700002)(52536014)(76116006)(55016003)(82960400001)(66446008)(66476007)(64756008)(4326008)(8676002)(86362001)(66946007)(6916009)(71200400001)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SUFyOFlYVE9xRWp0OUtobXBSRWtXeXcwTTMyVGVMVEVNciswbXlEUit4c3pn?=
 =?utf-8?B?TW1kM3pPWXJyZWNmV1JtRTJKVDhCbzJsS3hVSTlYOG5QaXNsZW1aS0lHYU5X?=
 =?utf-8?B?OE5NS3M2RTZrNXF6MUx5YlB5UXpRaWdNVWs1bW5jSitTUlFDcFk3NVNkUkkz?=
 =?utf-8?B?SGJrdkJUdzMrRFU3aGtiUTV6eE52YkhOZXBma0tuS0RGTXFzS0hOVnVwUE5I?=
 =?utf-8?B?VERZMk5WU1JxR0NlWlBIQTdkblI2K3hPb1hnNFhIUE5wdFNPWGZrejdJUjBN?=
 =?utf-8?B?OG10Mjg5akh5YVNGNk5QOHRKNWN2WXoyZVVNR2pDallMTitZYmltQjlKeSs4?=
 =?utf-8?B?V3hlOGJ3c21uS3FPdm1zMklkd3dFMStMRUNoQ1F0UDZFMk9DSDlSYU9mRjU4?=
 =?utf-8?B?RjlYZ1dCZHlDYURaekZMSmlYYy9HUXJ2U2hjR1ArcWorYmRhcERFWGg5OVRs?=
 =?utf-8?B?K3FCRVpYTFpxTW5zbW13WTNBUHdjdFBtZ21qZUc0U04vMUY3c0VrdCtMcVo0?=
 =?utf-8?B?VjhWaXJjQy9Hc1ROTGdCZUdRbENHcXNLaUdWZFMzSG5HWTN5NEpOeWExeC8y?=
 =?utf-8?B?WENRakwwNksyRXNwTThqRTRRZHdMVjNXdTRHQ0RXVmFzWUk1NnB6a3J4MDRt?=
 =?utf-8?B?VzZxTGdKMWdWbDdrNSsrbUZYY0NjcGJkOHhkQnNCY1Z5YitKdGFLeEZyakMw?=
 =?utf-8?B?V0RabUNQei9pR3NBdnNwbUFYMWlHOXFRaVFzTjl2ZTRmRDJNN0lmWWhkZ2RH?=
 =?utf-8?B?ZHgwMURJbGs3OFIwaFZ4c0tKdGhhRkFLdGE3YmRBSzEyL1I5YVdoU213V1gy?=
 =?utf-8?B?bWZGNmR2QlFpVmNFTFpPTERwZzlZSERSVW9xWkkzRkFOR3Azd0NCVDhONnU0?=
 =?utf-8?B?ZzkyLzhhejIvdXhvMGRqVVFIWnBrcmVtU01QSXptMnpWTEkzNGpybmlMZGhR?=
 =?utf-8?B?b1gvc3lnTmsyYWtySklKbXptZnpnODhlQWk5cldiZEFZdWpwb2swZmRUOFBz?=
 =?utf-8?B?TUVPOURucitGaHlOalI3QmdtWElhOWtzZkwzSTIzeUFpOWlHQ2RSWFl3L0F3?=
 =?utf-8?B?VnJtM20zS3FYa0xoVWNrMmd2VGZYWGc4ZGE2cXJmT2JLMm1zeEtxdWM4bmpZ?=
 =?utf-8?B?aitocGEvKzBNYUtxdlloTXB6dHNOellLamNWY2ZLU0FUWkJ0S0c1QnNuWUhp?=
 =?utf-8?B?aFY5YWZCbU9QelkreXhiSFE0Z3BaVXk3bjNkSEdkQ0JtbGNpbGVwYzN5bkZv?=
 =?utf-8?B?cGJmdVpBKytvc05QM04vS1FlcFhqTmdlbkhSUUZJcjQ3cHk2WkV5UjJkT2lC?=
 =?utf-8?B?YWlxNmlReGluSUJNK1RaTE9pZytiSzA1MXZIM0RQaWRtSTF3a3ZZK3FyTkJs?=
 =?utf-8?B?dStLVE8xZW9uRG9meWhFVW1Qb3ArT0x5QzQ3MVRLcEcvUFYyZmtxUjQwRkdi?=
 =?utf-8?B?UEN6M0hIdVk0c0xrU1J0SzlyK080R044NWdiM2xRcTZSZSt4dzJzcFNzYXRL?=
 =?utf-8?B?dE1LN0J5YlNqUm5mSkpqcHRwRHJYMkFnLzlxeHlFaHJab1FaZWpwbnJEU0FG?=
 =?utf-8?B?VWptbjNpa3NRdzFtN0pwK1orRHd0OUg0bnNyQUdtSVpKdFVFdGw2dFpza2Zr?=
 =?utf-8?B?OVphZDZxREFjazB1MjlVc1U1ejNidmFleGFSSWtSNlY4QVo4cTd3amkwNTFj?=
 =?utf-8?B?R2pKUjkyWmNSdGVjdDBURkFDMGZ6YXhMVWtjV1doVHNhQ0lzcFNQV0hxMHhz?=
 =?utf-8?B?R2ViR3pjc0QwQzlyZkpDWEwxQUpiekk4YzYvS3NhcWp0VzlIcW1nR211Z1BK?=
 =?utf-8?B?Y0xMRXBOYy9GYUI3ekVhSGJYUm9WYnJQU0c2NXVrYzRrSGJpY0o4NUdlU2N3?=
 =?utf-8?B?YlJzQ1NuZ0dzQzdUdWdUZll5RWFrTTdmcXhDcEJqQjBKTzFuMnNTZVVPVUN4?=
 =?utf-8?B?Tm9HNkVUZ2FlclpWYmsvcktaN0x1RnlGVHJwL1RLVmNBTXhBRndUcjFHaHlS?=
 =?utf-8?B?N3E2RjFqOW5HcGhnWnhia2t1dlBDdHp5YUFsaTFRS0NtOHpqZ3drdTFlT0VN?=
 =?utf-8?B?VFh0cktCclloQ0ZPeFRmY05TRjlkMWNUWmhEdGNnbExqdkhCRVNnaDBoTGl4?=
 =?utf-8?B?LzhjQndrcjgwenMyaEpvUDVhdXl5M0NqYzNicWgvenFJOHhkZGdyWFUvS2ZD?=
 =?utf-8?B?M0dCWmdlVWI2emN0V1RibjI0ZlcwUTZoSjdRNWI3RjZqRkVZQ1lqMHhpekFv?=
 =?utf-8?B?a1ZmT2JscGFZS05ZclhEcm53NXdybEtYUjBLRng2ZjJUSFluVWE3RzJidEZQ?=
 =?utf-8?B?dnp1UVBGbEwvaW9CeHo1Q001a2thV0V3d3JOcVFHbXBObi9YQmJJdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9362664a-c1cb-4154-a1ea-08da321fb085
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 00:54:51.2800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 RGxyl5gYHyRqJEeP2vtozxKAk/Zl5oT/WOwNtg8idsk8GQ0TwHd5bh8LqJlMjwerWMhoicTnMgozlQTwI2pIEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 00:55:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165408

SGkgQWxleA0KDQo+IFlvdSBjYW4gaXNzdWUgdGhpcyBpbiBwb2t5L21ldGEgYW5kIHBsZW50eSBv
ZiBleGFtcGxlcyB3aWxsIGNvbWUgdXA6DQo+IFtha0BmZWRvcmEgbWV0YV0kIGdyZXAgLWlyIFBB
Q0tBR0VDT05GSUcgKnxncmVwIGNsYXNzLW5hdGl2ZQ0KDQpJJ20gYWZyYWlkIEknbSBub3QgcXVp
dGUgd2l0aCB5b3UuIFNlYXJjaGVkIHBva3kgYnkgdGhlIGZvbGxvd2luZyBjb21tYW5kIGFuZCB0
aGVyZSBpcyBubyBleGFtcGxlIGFib3V0IGhvdyB0byBjb25maWcgUEFDS0FHRUNPTkZJR1t4eHhd
IGZvciB0YXJnZXQgb3IgbmF0aXZlIHNlcGFyYXRlbHkuIA0KVGhlIHJlc3VsdCBpcyBhbGwgYWJv
dXQgaG93IHRvIGNvbmZpZyBQQUNLQUdFQ09ORklHIGZvciB0YXJnZXQgb3IgbmF0aXZlLiANCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiQgZ3JlcCAtaXIgUEFDS0FH
RUNPTkZJRyAqfGdyZXAgY2xhc3MtbmF0aXZlDQptZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAv
bGliY2FwXzIuNjQuYmI6UEFDS0FHRUNPTkZJRzpjbGFzcy1uYXRpdmUgPz89ICIiDQptZXRhL3Jl
Y2lwZXMtc3VwcG9ydC92aW0vdmltXzguMi5iYjpQQUNLQUdFQ09ORklHOmNsYXNzLW5hdGl2ZSA9
ICIiDQptZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlMy5pbmM6UEFDS0FHRUNPTkZJ
RzpjbGFzcy1uYXRpdmUgPz0gImZ0czQgZnRzNSBydHJlZSBkeW5fZXh0Ig0KLi4uLi4uDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkJ1dCBJIHRoaW5rIHlvdSBt
ZWFuIG5vdCBQQUNLQUdFQ09ORklHIGJ1dCBQQUNLQUdFQ09ORklHW2ZpcHNdLiBGb3IgZXhhbXBs
ZSwgaW4gbGliY2FwXzIuNjQuYmIgZmlsZTogDQokIGNhdCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJjYXAvbGliY2FwXzIuNjQuYmINCi4uLi4uLg0KUEFDS0FHRUNPTkZJRyA/Pz0gImxpYmlkbiAg
JHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnc2VjY29tcCcsIGQpfSAiICAv
L25vdCBoZXJlDQouLi4uLi4NClBBQ0tBR0VDT05GSUdbZmlwc10gPSAiLS1lbmFibGUtZmlwczE0
MC1tb2RlIC0td2l0aC1saWJkbC1wcmVmaXg9JHtTVEFHSU5HX0JBU0VMSUJESVJ9LC0tZGlzYWJs
ZS1maXBzMTQwLW1vZGUiICAgLy9Zb3VyIGNvbW1lbnQgbWVhbnMgbW9kaWZ5IGhlcmUNCi4uLi4u
Li4NCg0KRGlkIEkgbWlzdW5kZXJzdGFuZD8gDQoNCkJlc3QgcmVnYXJkcw0KTGVpDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlcg0KPiBLYW5hdmluDQo+IFNlbnQ6IE1vbmRheSwg
TWF5IDksIDIwMjIgNDo0NCBQTQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1
LmNvbT4NCj4gQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyXSBnbnV0bHM6IEFkZGVk
IGZpcHMgc3VwcG9ydCBvcHRpb24uDQo+IA0KPiBPbiBNb24sIDkgTWF5IDIwMjIgYXQgMDM6MzAs
IGxlaW1hb2h1aUBmdWppdHN1LmNvbSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiB3cm90ZToN
Cj4gPiA+IFBBQ0tBR0VDT05GSUdbZmlwc10gPSAiLS1lbmFibGUtZmlwczE0MC1tb2RlDQo+ID4g
PiAtLXdpdGgtbGliZGwtcHJlZml4PSR7U1RBR0lOR19CQVNFTElCRElSfSwtLWRpc2FibGUtZmlw
czE0MC1tb2RlLGdudQ0KPiA+ID4gdGxzLW5hdGl2DQo+ID4gPiBlIg0KPiA+ID4gUEFDS0FHRUNP
TkZJR1tmaXBzLW5hdGl2ZV0gPSAiLS1lbmFibGUtZmlwczE0MC1tb2RlDQo+ID4gPiAtLXdpdGgt
bGliZGwtcHJlZml4PSR7U1RBR0lOR19CQVNFTElCRElSfSwtLWRpc2FibGUtZmlwczE0MC1tb2Rl
Ig0KPiA+DQo+ID4gSSdtIHNvcnJ5IHRoYXQgdGhpcyB3YXkgZG9lc27igJl0IHdvcmssIGJlY2F1
c2UgUEFDS0FHRUNPTkZJR1tmaXBzLW5hdGl2ZV0NCj4gbWVhbnMgUEFDS0FHRUNPTkZJRyBpcyBz
ZXQgZm9yIGZpcHMtbmF0aXZlIG5vdCBmb3IgZmlwcy4NCj4gPiBBbmQgSSBkb24ndCBmaW5kIGFu
eSBleGlzdGluZyByZWNpcGVzIHRoYXQgY29uZmlnIFBBQ0tBR0VDT05GSUdbeHh4XSBmb3IgbmF0
aXZlDQo+IG9yIHRhcmdldCBzZXBhcmF0ZWx5Lg0KPiA+IEkgd29uZGVyIElmIHlvdSBjYW4gdGVs
bCBtZSBhbnkgcmVjaXBlIGZvciByZWZlcmVuY2UuDQo+ID4gVGhhbmsgeW91Lg0KPiANCj4gWW91
IGNhbiBpc3N1ZSB0aGlzIGluIHBva3kvbWV0YSBhbmQgcGxlbnR5IG9mIGV4YW1wbGVzIHdpbGwg
Y29tZSB1cDoNCj4gW2FrQGZlZG9yYSBtZXRhXSQgZ3JlcCAtaXIgUEFDS0FHRUNPTkZJRyAqfGdy
ZXAgY2xhc3MtbmF0aXZlDQo+IA0KPiBBbGV4DQo=

