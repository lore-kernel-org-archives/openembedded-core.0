Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBBBC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:36:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.4068.1646822201289192123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=n2v6H+fI;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646822201; x=1678358201;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3aQzAvpNtuB25gTTYaolcd8/6nscu188D0B7X+ai0gA=;
  b=n2v6H+fIaAtD5sFk3JSyL1xYjIjPltWRRDuzs8Ny1YKAgV3p+cX/r8ST
   lNtp2LZBSZd/2kw4T8/7qReigQPwnNxLqaE5y+N36LQD8GDjG3GFNzKNA
   75nmUM3WLsIjvP7dXsMrFwBA/4u/QmZJ3HAA1RTF7RA2nipG+tyKqmG4c
   ijRuDcCX0V8XjFyAN13KIj92UC6c9AFs3PXqB7wjpturdDILI0YcX2jut
   XkF424D37IUR5DCj2hkj/9XkqHc+VXiylyRxzbh3sSPoMkTvO10blA9UN
   XLf9GA8qQhTnwQVyKPC1l7mW1tBH20kDJBP+VxYi75HPkKy4WqB1CcTS4
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="341372765"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400";
   d="scan'208";a="341372765"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 02:36:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400";
   d="scan'208";a="632565223"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2022 02:36:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 02:36:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 02:36:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 02:36:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 02:36:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqlDPgVMqKm8eCUAP74pkO4zDxgMtHemgj8Bu3mKTd8voU9BDnFL6clQ0jVi2ebWFcdmcsNJ0zq5Hen3UfdbrzFbEG2svS58zOLkGD5xJ4qsf93Gr+AOnOLxSqi2pOL8AjXT0H0wzae7UFu+bEKA0CVo53myImSkTB95y+km5h2fD+3Q1GopB9giNmtUj2tLYxC0fRHaMC5/+stYdKFO4s80RtCTjqwjua1vgzzYPpzB9hkn8mysWEUHXDN6IFvR1NveaIwbk2FfYOxXs829EjzZI7sSQAuCLB9Htm7zgNM1/J1avwtQWWqmsYFww/VAJGXFxCDYdtzLp+fFecD/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aQzAvpNtuB25gTTYaolcd8/6nscu188D0B7X+ai0gA=;
 b=Lbx/NLrkahOrdiUwkmgTBTFqiHjGYDZ1nbH0JV9PTD8B/wu120NbidMFtfsf1fOj+bG8h6xSzudh080K1L9U0iHcCC8x7XrGj9YAjuPTkudRJC9jPlwBzpo7DYtT53lKpjNHUqq17G8d5pZAfd7Ut8TPMLlFwxoYRchsyXbvi3zmNKd9Eab81c5oYyxodE1Xl/j/Oy77RaPe4Hhqn+hNDjrUO/Du37ksGAv5sXY38fuRBuv2dUWHh+4rXlLDj1ct+lmK5M25+3RkCU4t0i1C2rjLE60TYdHqg4kIXjUnwXv9sjPAIUfo4VY4c8zBCIWfinbDodvnLb4ztJyugoXYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM6PR11MB3756.namprd11.prod.outlook.com (2603:10b6:5:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Wed, 9 Mar
 2022 10:36:33 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::3caa:2b5d:2d52:8643]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::3caa:2b5d:2d52:8643%4]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 10:36:33 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.5_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.5_M3.rc1)
Thread-Index: AQHYMj2eqbbMBAfaWk+LDTxFIYO8zKy23mGQ
Date: Wed, 9 Mar 2022 10:36:32 +0000
Message-ID: 
 <DM5PR1101MB234897AC9C7090C394A36DB9BB0A9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <77803c5750f16e9f50051c88c0335818d60320c2.camel@linuxfoundation.org>
In-Reply-To: 
 <77803c5750f16e9f50051c88c0335818d60320c2.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ea089a1-1b66-4424-be21-08da01b8adf2
x-ms-traffictypediagnostic: DM6PR11MB3756:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB375681CF1C418084BDAB75D1BB0A9@DM6PR11MB3756.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4myyJqvBdSkT3+O69DnIEEusiw7SvRtbsPwCQiOCFX9iqcJtWem0KqbEOZoSI+KPGOcFDVKHFWlDzho8d4mL8poPJIshSSOfr/U1d3azCfHWK5cXCvlII7ACN2+rMmZivmv9toRaXPpxnI8C+scDZ5mzOIXngve+Q/shO8xhD0U22BVGtKrNHPjg0AIqIfRgDubd3Sh3ehl291owT6L9a+EKQf++IBLIPbFfAgdWtlGJuXPx80u57dCNikr6xMV+TBMtqTrwv0OV41S2Jc/CsLtKrW+xiCeUwVSFA39STyOe0YSTJHuzcgWGHGZJuGGQG7R7UKogiPB8vYKlviTaK1po6elfrG4lAnqKe/W8lYNwqbtE2BiuuqFMEYeHw2jU4PCZfzm11kU8ili0DC81o0emWpPUL37JAt6CNOjPpeT6cFte+FEMulTi49qXBtc1PqpWA+Xi5EoF+8s9kTG1FyPrn6ZDwA7wvoPMVW+a7hMPs0XpDApWRfZ4RvGGmGbc1PSfcDXKihbFTUmO8kR71KKnbL44Zr1auKJZcgoRSVHf5WjJLLu0WgbWrC5dwA8yVqDFFtt6jgczoohVDUTO7U1rVNK41/1xR79U7gmIcXzZeSnrXTbdPidJIGnSho2IV70lDnrVYjYf09NJyqCrM5LVNFPg5L4VtzA06GJu1Y5t1OHRcvRQyJNj+e7DAM5jzcbBe5pY08tAdn33utn5ZO9AOFL/P/az59fD+oFSFNx3GkP8F4vFGmFiukpukVkWW7WVlBMl5W4ql1FT3Gf+V2WEeb3Smlx4jb7p8BfGLNkjr1SUcEgD8BZhWH/gXHcSZobdiaG4wQ2L6uec9eOKn7boaK4SF/lHHatGkfcLeFc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(76116006)(66476007)(66446008)(8676002)(64756008)(316002)(966005)(15650500001)(5660300002)(83380400001)(9686003)(52536014)(66946007)(7696005)(6506007)(26005)(186003)(71200400001)(55236004)(8936002)(55016003)(53546011)(86362001)(82960400001)(33656002)(122000001)(2906002)(508600001)(110136005)(38070700005)(38100700002)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZktTaCtRQkxvZ0JjTmxRNHhnMUkzMWgyQUkvV05ST0VOUVRqZ3NFT3NET0Ry?=
 =?utf-8?B?R2JKbXhhNHBjNi8rMUo2ZVkyYnl4b3R4d0czeUxUbWhHaXFxZHNMSkoyajc1?=
 =?utf-8?B?MGJvQ0dGdmpXTjNydVFkeGRGZ1JhenVtWUc2RFFyN25FcEY4QnBqYjk0Rmht?=
 =?utf-8?B?cVN1clF0NmpRS0llRTRDeERmU1pDTnRwZGFXYS9nZnBwTm9LU09kNmV1RTlo?=
 =?utf-8?B?T3QyTkM4YzFXWXF4dytNclpVTDkvMG5oMG04YXZ0OGpZM1ZvcERyNVh0R2pr?=
 =?utf-8?B?dWlmNnBWREZBNkIvcXpIL1k2QU5RR09qR2xFNmV4bG1uajhYVjA4ZVAzdGg1?=
 =?utf-8?B?SVFJSGZZVVRjN3VXS0EyeEtFa3FiNFBXVXhLa3FRRUJ0bjVnR2d4MWp5eFNV?=
 =?utf-8?B?dytpQ3hIMktDeE02MzNkY0pQckVTTmtLZ05aVDEyS1ZqSTRNOE91aHllbUZ3?=
 =?utf-8?B?QUpTano5NzFDYUpwTUk4SGRldmowQW1NWndUSFlDV0xPd1dWY0diQXcrYkhn?=
 =?utf-8?B?K25HWC8zVEpMbVlFd2dOYkJYSWpsbVd2M2lmV2Q4aGcwaVV3VXRDUkZYLzVP?=
 =?utf-8?B?S3k1bUFaUTJlL3E2Q1pzbFlBMHJxMkl6YXN2end3RHRWbWF3MFFmZTQ1Rmc1?=
 =?utf-8?B?RHpLYXZYK0VtQjdQZWgwMURjaHI1RTFnTWp5VlFEYTl0VThkL3RYRHd1aTlr?=
 =?utf-8?B?ZUM1eWVBSFIvL1VaYVczbk1Zd3lPZ1I4ck0xMFVjSnhoa3YrcE5OdHZsMFZK?=
 =?utf-8?B?bGRHdDdOMmJpemc4SjdzVE16bGUxUGk3SWRzdmtUa2xjUTVKY1pXdkFWWGZi?=
 =?utf-8?B?QzV2bmRZanAzb1dZZitxNFIzT2hTQU5lMWdJSkdVODhBQTlpRnM2RzNoU2RN?=
 =?utf-8?B?ZEc0RmVkVUNYaTZMN0JtYmp4Qkh0OUdCRmxkbS9tRXk0Z2paMG9GTTkzUUs3?=
 =?utf-8?B?Q0dTdGpNakdoTXJFcW5BREVTc1VuVXJpTkVwWXE2T0ZsMk4wVVUyRk55RFRE?=
 =?utf-8?B?S1ZGMVNPeW82VkowdmNEYWFFc0FFWHFHYW5wTjNZNWdnM2hDSEpORVkzV21S?=
 =?utf-8?B?bDJkS3UxZXN2Skc3WVNTSTJxd3cwWFl4UERVSlJHeTdJRFF3U1dnTHNmWkVi?=
 =?utf-8?B?cjQrSjdBM0paWm9UVFBtTm9HMGc4RGQ4WHJoc1N2WkY3N1piQm8zL1JUTmlq?=
 =?utf-8?B?SmFxUkx3RHF1L1dENUJRVjhkY3RsSnZpSlNzd2VTQms1WGFCMEpOV2E5eStI?=
 =?utf-8?B?eGJJRWZGZWFLVUJFOVFBaUNCbVdlRjJ6WU92YmJUWS9tVHpyd2YxbTNabGJ6?=
 =?utf-8?B?Y285VU1icXZFUUlGTU9VQTcrY2dEUHg2cVJEUks3SGx5WEMzeDlqU0l6YUR3?=
 =?utf-8?B?VFBPaEdmekpRRnVVZXNiR0ZPWDBZOVMyQ2UxVlYzK2JyVXg5YkhYNkZJVGNu?=
 =?utf-8?B?T2gzaHJUNzZvemRkcFQxK2YreG9OVU1LNldlWTJOTHBiK1NDT2FTK0dXU3dZ?=
 =?utf-8?B?RXpsSUVGU2JRZzlaR1QycnBNTC9VRUwxR0Zpb1BraEhxa0VIaHpZRXF4RlBC?=
 =?utf-8?B?M1B3VGIyK1BMdFVZdVMvdjJUS1Y4VUhrUGVhZDBicWRVajdmUDRkVUJNWTF4?=
 =?utf-8?B?UGx0TWhLZm9pdnJKK0RUT1pjR29VTTFWN3ZPa3J5L2JsTHlSTzdLeHh4dlRL?=
 =?utf-8?B?aVZtTWQvd0QrVjRnT0pENzAyZGRlZThsMFFWeElJNEhBOXM3Q3NZdFd5OVVY?=
 =?utf-8?B?dzlOMHJmSjI4ZFluUThBNmpSUWVVY0FGVjRON2JiS20zVEltaE5QZnVkMHho?=
 =?utf-8?B?enh3NGRZTnZuN1B0RXhjN29NMlo1ZTd0Y05xeEhnODNnNmlsMzl4VjVvYWNZ?=
 =?utf-8?B?all6TVRHUXk3d1RsUUU1M1hzNytrMXVVSldkZ1dtaWNleEJvb21ZZURhc1hH?=
 =?utf-8?B?MVE1VnZvUnZudFA5dzZ3cWJkYWcwV1BWbnBFU3FCSVBhdWZxZTVKR1pqSHVK?=
 =?utf-8?B?T2JOeGEvSXRPT0k2cW5YeUFXa2h2ZE5Tamp5aEdpdG9jSFNDUExNZWFHR1A5?=
 =?utf-8?B?NVpWVkxJOU1jQlRZa0h1Q3hYdmMyeHcxSkYwRUpVRmFzT3V3Z1Qrb1Y1Ni9O?=
 =?utf-8?B?UUJ5akR1WXY4dEpNOHNxWTBHNTNCTHpQV09qbHk1bkw1b0Y5Qzl5aUVLZDli?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ea089a1-1b66-4424-be21-08da01b8adf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 10:36:32.9698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 GTyZZAkANxOhfAV5bP3Rt5HprBwFbYelbQl57KlhHjGHqTa0HHMNeDLe9y5xNHU9s6tF7bhMi5ZZq6dXKLWm5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3756
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 10:36:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162957

SGVsbG8gQWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy41X00zLnJj
MTogIA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRl
c3RyZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09
PT09IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuDQoNCk5vIG5l
dyBpc3N1ZSBmb3VuZC4NCg0KDQpUaGFua3MsDQpKYXkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZyA8cWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBP
biBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogVHVlc2RheSwgOCBNYXJjaCwgMjAy
MiAxMjowOCBBTQ0KPiBUbzogPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IDx5b2N0b0Bs
aXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBDYzogcWEtYnVpbGQtbm90aWZpY2F0aW9uIDxxYS1i
dWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogW3Fh
LWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1
aWxkZXINCj4gYnVpbGQgKHlvY3RvLTMuNV9NMy5yYzEpDQo+IA0KPiBBIGJ1aWxkIGZsYWdnZWQg
Zm9yIFFBICh5b2N0by0zLjVfTTMucmMxKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRl
cg0KPiBhbmQgaXMgYXZhaWxhYmxlIGF0Og0KPiANCj4gDQo+ICAgICAvc3J2L2F1dG9idWlsZGVy
L2F1dG9idWlsZGVyLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by0zLjVfTTMucmMxDQo+IA0K
PiANCj4gQnVpbGQgaGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6IDgwNTVlYzM2MDUw
N2U2YTY3OGVlNWM0MDE4ZWMxYWI3ZjVhOWNjZTUNCj4gbWV0YS1hZ2w6IDlkZjdhNDBkZDBiNWUz
ZWUxZWQ3MmU0NjBkYzk5MTkzZWViNGJkNmMNCj4gbWV0YS1hcm06IDY0M2NmNThhNjk4ODUwNWRi
ZDkyNDMxNDI0OTZhM2JjNjQ5ZWZiMWMNCj4gbWV0YS1hd3M6IDIxNGE1ODY3YjNiMGQ5YmE1NDgx
OGFhYmIxNzExZWFkZjRiYTllYjMNCj4gbWV0YS1ncGx2MjogNWM5ZjAzMzg5MmFlNTZjMTc4NjE2
ODU5YTEyNDVlZmQzNzVlNjRiZA0KPiBtZXRhLWludGVsOiA2ZmJhNThhZGIzODIzY2Q3NTc4MDYy
YjBhZmE0OTM4ZGQ3MjA2YWRiDQo+IG1ldGEtbWluZ3c6IGQ0OWU4MDNlNGI4YjYyZGMxNDhjMTgy
YWY0OTllNTgyZTc2ODRkZTQNCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IGE3NWI5YTU0OTU2M2UwOWZj
YTlhOGMyODBmNTczMTE1MjkxM2I2NTENCj4gb2Vjb3JlOiA0Y2FlYTJkMzJmMTc3ZmJiZTM4ODdm
MzdiNjcwMGIyYjQ5OTZiMmJlDQo+IHBva3k6IGFmYmRiYTliMTJiYzEyNjM4ZDgyODEzZDFjZDMx
ZWM0Nzk5NzFjNGINCj4gDQo+IA0KPiANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVzc2FnZSBm
cm9tIHRoZSBZb2N0byBQcm9qZWN0IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTA4KTogaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9tZXNzYWdlLzEwOA0KPiBNdXRl
IFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC84OTYxNTY2Ny80
ODk5NDYzDQo+IEdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2pl
Y3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9sZWF2ZS8xMDQwNjgwNS80ODk5NDYz
LzcxNTM4OTk5NS94eXp6eQ0KPiBbamF5LnNoZW4udGVvaEBpbnRlbC5jb21dDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

