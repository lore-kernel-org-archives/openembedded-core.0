Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3467AC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:37:51 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web10.49000.1681717066499783229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=uL5v0gSv;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1681717067; x=1713253067;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=y8L+EPMFJfxJXAyo2Fyt9ypBdus5YiqA2/pOVCrytt8=;
  b=uL5v0gSvf0EGSWonsP/EXieMCmWc0a7gPb3T1sxviA2QOYL71+DueGXP
   vC+p5HAsmwnTitNIsASMHgwWc9HK8LvRSrko4Ds88W5veYk+lgmXt8gZ8
   jLB0dDUVaYFiNoeOX6BpOfMONg278R87+mVPqyo0OGpaFTXw8q+aqWSeR
   p/P6DxyAJqo5/Pm9tLYzCwUrIhFf9nOIiBOyzf2o/8PHk8Vf36sugYYJq
   lE93tdXWcdZ3lwEn7eaBiqD4o6zmop+3wwEXwXzmgMDWqC087UUaeJwIr
   P8o0qF9nZUTbfEJD0Uq3FLjGDrQ9rk1MAgv7dJ7FbO0hbQbBQhDZe2xz8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="82111060"
X-IronPort-AV: E=Sophos;i="5.99,203,1677510000"; 
   d="scan'208";a="82111060"
Received: from mail-tycjpn01lp2175.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.175])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:37:45 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBE1O8w9dL9TnOz0fUYAjP/f2uShMnQqRAbG3SFX56PhUGqzBggTx+CHL/D8z2sW0e1xJmtdzkNvTgIzBTnBnII0eJqaHvIbjr3eCjxhsBTuVQGRpmTK4zKSYaTtKC0JmmxolS36oMkLYIX26I7dHrVk9No/V6coBVuOXNI9je/LzVQztDTgYIwRPvOQA2i+jMkqg1S7u6AIgdrVSff3BtQ2/N0ZF7+HuilG396WrDgDlQyneBfQqJ058EXtgmjs6BzhXVku/uiaHzUYaEBdntwSDoV6sY8JVi0c6RBd11+rG3BKflPZ+kA25I9GWQwXImKu70WZYu3hR3kQy+zkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8L+EPMFJfxJXAyo2Fyt9ypBdus5YiqA2/pOVCrytt8=;
 b=cP9nxFPDEscaTV07kIqR/jRHkAFt08ME0347Lkp8dvT6H1dIHpEKTTZaFR+yjm1vxK83TWQGbK6cSnur+UaOHvKM/97Y4TaN6ipBggsjWfb3md4IOfoDkHNv8N7yD0j/xiCHVtZICQsYkZbeMqSt1f9s0KQFcY+avA/5FgWHuU1tr/TGwxX6hE+39gADSh6fR6hsGIZg6fu+GNWj16B3u1gDuQfzP3ArFAmKj9K0jDBDHKNCzNsXtjrwBjsHDQnTDWoZnTnPLy/CVF0MTg32eZtvpXP/SctuuWq8J0TTIP3vHm41W7e/6TWnIb4iONuEFn0kB6l1y8RtVJdUcO18WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSZPR01MB8545.jpnprd01.prod.outlook.com (2603:1096:604:18a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 07:37:41 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::d0c8:d828:b11:7d9e]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::d0c8:d828:b11:7d9e%5]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 07:37:40 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] tcsh: upgrade 6.24.07 -> 6.24.10
Thread-Topic: [oe] [meta-oe] [PATCH] tcsh: upgrade 6.24.07 -> 6.24.10
Thread-Index: AQHZcPsB1KrDQmOawU6QrRSIU1UPM68vHLmQ
Date: Mon, 17 Apr 2023 07:37:40 +0000
Message-ID: 
 <OSBPR01MB1845BE4DF795DBA5E75FDDEBDC9C9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1681715072-18848-1-git-send-email-wangmy@fujitsu.com>
 <1681715072-18848-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1681715072-18848-2-git-send-email-wangmy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MjQ1MjZkNmQtOWM1Yi00YTIyLTllMTMtYmMxMzhhMGYx?=
 =?utf-8?B?Y2IzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wNC0xN1QwNzozNjozN1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|OSZPR01MB8545:EE_
x-ms-office365-filtering-correlation-id: 1b5fedd1-1eef-43c5-5949-08db3f169f7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lQXhrGliMt2wj8qgOp8dNUNOJjUbnp6GpoqG764a6NFQ571fN53DArrlFZVw4YDZpEhpGr6F2KdG6qI68+/nRdg83yPb8z7gH5LWOojRoGxxQ3mILj+PbYo0b4kd3XwMFyGD0TsJl8hlEBIh/t5/d5pXaXcqKVyuajMc7V47aSdVmNa2c5DDZBqf7nlYU59uL6qRgOBDSGx9ygSRbFXwXX73FYyO/OgtnylvdS8jbGCTVuNCG6SOyKfUsAPcT2yHk4GiGdKs8Rki7HZrkKYPKZt6F849yk02Nx/10kkH+zg2mpb+ClJjcR2WkxleScoTFQ/b3bxib/QS/4VQmtB234Ra3XqDEFUuMgRsjO2WPKPhnr+bj87RcwM9DAQ51Z+o4Pa/t+iNECDBUwM2LMlhU5AUQTgqxvZI001MXuedH8kzf3okZ6AigFMGQrBqNYk3Wb+CdXRszHq+NQe9rfd0X38StYZ7Qf817Fh7QoJrIHFHVgpHTFbkNHsRyWd1Ow0z2WT1w37bTDIv2Fd3i654FlmJ0wVKmIPFf7mt6vDfj+s+4IFwsq/SdYUzxiEFflcCGl0YZGTBAGxD9fMj2CLv34HhROLdgEYgvz3YWvvb0+cKzoQUc0DpX6cwXmDIpWBd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(1590799018)(451199021)(86362001)(8676002)(8936002)(7696005)(1580799015)(966005)(55016003)(5660300002)(52536014)(83380400001)(122000001)(38100700002)(38070700005)(186003)(85182001)(6506007)(53546011)(26005)(9686003)(478600001)(82960400001)(6916009)(66556008)(66476007)(76116006)(66446008)(64756008)(66946007)(2906002)(33656002)(71200400001)(41300700001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S3BTWnIwdnRCcHlXSFJ1ZFp3Q0xIUjgxTFlYdTltM0xuam1yM1pqd3hHNnJp?=
 =?utf-8?B?Mmg3MHdLVGNKT2c0VjFDV1JvdDBpSWdncW1JaWJ4dG1aL0VnU3c2Q3lUUUox?=
 =?utf-8?B?U1A3NnNBTkpIYVZXdEJ3QjlkaHFpbWNyRjNEUGx6N05tRThLZXViOG5BRDZy?=
 =?utf-8?B?ckx2NXFjYjFiSUFEZzhuNGxXZEkyMk5Rb2kyQ2VtWkk3RnpOSGxGMm83b09q?=
 =?utf-8?B?NjM4WG4vUEhYRW5nUmhXeFNxTkdPTTAvMTYxMzdvd3Q0MW5WV3E1S2NzaHJW?=
 =?utf-8?B?MXcvZ1ZPYzgxU1E5UXFxWnZlOWUrT1pZZWZrVUZwOTNJazAyOTZncEplWHRi?=
 =?utf-8?B?RzRzTmRFWXJkV2ZPNEtQSlJkcUZqM2tUcmNvTlNOOUgwZ3lWYzNCamZNRGxZ?=
 =?utf-8?B?Rkc5bDdqVk0wMTJVeW4zdmVLSEcrdEhkVGh6YzlYVHRGT0QrV0haNy9jelB6?=
 =?utf-8?B?L0p6RFBBdWJLU2ExSW1leXhUNzQ0VXBZYm5yQ0pWR3hML3FuU0gvMjFteWg4?=
 =?utf-8?B?SDBjZmlsM04vUEpqUG1TOW1wMzRrS0t0WDQ0end3bkF4VmVXa1EzVGE0VWVp?=
 =?utf-8?B?Y3UrK29PWDJGcFpzTGExQ0g5VlhqSWZnazJBblQ1dlg5QW0zYWdOWXFqRDhY?=
 =?utf-8?B?d01iRmI0WkVVejdlR1ZLMndER3VmdkFwditXU3VETXZsOGZtYW1OdzdWUXJa?=
 =?utf-8?B?K2tXTVdtU2kram1xemJteEV5aFFVWDBJRDZyTHpNQXJlYzl4R2VPajREcVcv?=
 =?utf-8?B?c0ZvTHp0WlJ2V2tQVlJVZVYxcHVhQSs3MFF5KzdpbWFXMFN4Sjl4SmJDdjly?=
 =?utf-8?B?T1duZFlCTFYzN0VJQmhkbG9lL0FXSlNUTUJ2Z2RBRGxRRTBmR2pJQzNZbnJ1?=
 =?utf-8?B?KzJDY3Ztci9MbVpIZ0FwbDlhKzBhWWM2THFtUm8yZUIwSEZpMFNWVklLcG9I?=
 =?utf-8?B?WjE5ckgwQUFVUkx3L3dibXIwbDlFVGduajhmTWt1a1RIbWphNVM0TWxQcmgy?=
 =?utf-8?B?MStKdEh4dlA2SjZzQ3pJTnR5WFlidkt5Y2trWDB3TFlJcnBWUko4UUEwL1V0?=
 =?utf-8?B?TmtmdXdRUG5qT281VmttQTgwYVdmRDNDRFZBTFBjN2xKVHdsNllJcS9sbkc2?=
 =?utf-8?B?dG10NGJLWDBWenpaaEcwQ0dOS0NJWTVBZDBCYkppdjd4eUlnRWh4akltZy9N?=
 =?utf-8?B?MjhpSjFIb0NEVm5xaFlhT1g3STFCaFJGa3ZxUEs2UXNidXg0Nm9mMFREM3N3?=
 =?utf-8?B?OWI5VGRSLzAvc2tBbVg5dWpwdmlUY3JhNldzZkkwc29jTW9mMEVWcDYxRCtQ?=
 =?utf-8?B?T2orb3RqTWFvMU5WNjZIc1dEa3dXbGlDZnd0bVBlRWJKdFFnb2R3ZUpteDRD?=
 =?utf-8?B?YUZOd2IyRWxDaFE5b3NDSzBJTzY1Z2x1ZGVkdFRicVlwblo1SEp2VUw5by9y?=
 =?utf-8?B?dnFzdDNwWVpMdU5PYVI3NEdGNnBoSEZpSWRBS3JCaTVqNzF5UWlFam9iRXQr?=
 =?utf-8?B?azU2VHJSSFgrRGJadWkrMStBQ1JZdFFnSnBDK29scE9WdXUyT2kwdy9ib3Jn?=
 =?utf-8?B?QisxWFpuWDFTdk1vc0JHekxDL3k2M2xaR2tUckVoRVo1dnNWWWZzbHBUQWh1?=
 =?utf-8?B?NVdrQldCN1BiUDlVQlVWRHhjRHZ4ZVZUMDFSWmNoOTByeUVreUpQamttbHVa?=
 =?utf-8?B?R0dGMkFXeGIzeFovdDRhT1RoNUFuMkQyeEQvNlBMcldPRXhVajkwUHpOKzFH?=
 =?utf-8?B?TGxMS21wRkFrUkJYN1VtTlZMSi9KaXBUTzNJRC9kWitxaGR2T2E5NUxOeXZ3?=
 =?utf-8?B?ZmtyZHdkSVBoUXhMMHZ4ZWgxZ1M5RDZ3ZGJqZmxQOEh6bW1HazRHdksyZG1M?=
 =?utf-8?B?UC84YTZLaytEY1RwK203R2YyU3hYQmlhSm4rUER0d0JFNmF5SHpmekVMSjVF?=
 =?utf-8?B?SFVsTTRkenhRQWN4N2p0Qm15OUNhVzI3bHY1bmZ4ZWpWckprL2E4cndiZlZW?=
 =?utf-8?B?WlFvZTFyVG1CTitnQ08vaCtkK0pKRmFweGJURzZQYkc3MlR0YlRWb01TTkFU?=
 =?utf-8?B?ZHBwYnkxdzBaaHZXOGZXTWNUQThaWW4yMVR1bHVEM3BDRHBKcjIrekVnOFFR?=
 =?utf-8?Q?85EM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PWwoY3gCKhMo5q707wrIhkzgQIqrgBdkUm78yvV8xtOCj6DrtqpdZIapuMx6PBe+D0iT1//TkGrQHXv/HVq4lNDHyv0OkGHEyAscS73LEEoFDWq/XXK/CexVAJvhVQqVDlv5WcBg0Iiq6EgUzWsNJ+waPjONCHH2+VeQSV4vqRj1jzeSB7wXrqrV6vyWunpyL859/gAfRkyPz7v/F05zeHiYjkk4FF1yI330s7R31SdiwaUNCBKP9VrNBaPUkVPzXuohqr3T5IC+jDQupfzZXxFlwnxJMB/gpFIWprWyorNQnkPz6/Re5vEqyCAe3wa6np96XYOOLB5tEHYVlMcJ22hW4P0tGJL1H6i2Q0puYzGrgu4jHMt+8OQgEeS01Ye2zLsp3C1ouAZgwHPfM63kp+y/A3SYCGcFMlZYQBgsqUgRTAenbzMEWPPHDbb5suEFtsCMxZdISPavoUesLi4WKIVQiQDoDAzXmW5xV/9ogA5zFqZ+hP+aXUjcqe2kTvrMzGcnUpY4X05Cq16B4vryKm+3upqSOKvnfO1q9qqBnIEtobYEdZATJnJaD++QAkXNC7MSiAa4LpXLvygNtQ+QIiQNtrtXrCAUOchQBppZdrQR2pXmwB8/miJLqLDBs/RkxP1Ax1oYhYLDjtm72dyOMMLydivJux6pJIJLnkY6xbcETZV9E63i34I97oHBdGObb0d7Ghazn7nAJnqfoZ82AGSB5gjTdcSTMQw4LHQbgqQSi3KfeoJgvyD5F5aPfzRkTuD5XSR/UDJvmNm/MN8ELM90SGsv3zU2pcHdSJZ3QVY=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5fedd1-1eef-43c5-5949-08db3f169f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 07:37:40.0461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: irg5avZlK+2rlS+ULxQ6XWRwsWgsUxJf2NWP/sQHd2BBjnU88ivCvqMEMgmI9vVJdXsm4vdhwmEBmp5IoSWXRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8545
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180144

U29ycnksIHRoZSBlbWFpbCBhZGRyZXNzIHdhcyB3cml0dGVuIGluY29ycmVjdGx5IHdoZW4gc2Vu
ZGluZyB0aGUgcGF0Y2guIA0KVGhlIGVtYWlscyBvZiBtZXRhLW9lIHdlcmUgc2VudCBoZXJlLCBw
bGVhc2UgaWdub3JlIHRoZW4uDQrCoCAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9w
bWVudCBEZXB0LkkNCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0
ZC4oRk5TVCkgTm8uIDYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDog
Kzg2KzI1LTg2NjMwNTY2LTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2
ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9m
bnN0Lw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFdhbmcsIE1pbmd5
dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXByaWwg
MTcsIDIwMjMgMzowNSBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBDYzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNv
bT4NCj4gU3ViamVjdDogW29lXSBbbWV0YS1vZV0gW1BBVENIXSB0Y3NoOiB1cGdyYWRlIDYuMjQu
MDcgLT4gNi4yNC4xMA0KPiANCj4gRnJvbTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNv
bT4NCj4gDQo+IENoYW5nZWxvZzoNCj4gICAgLSBBdm9pZCBub24tZGVmYXVsdCBzZXR0aW5ncyBp
biBzeXN0ZW0td2lkZSBpbml0IGZpbGVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5n
eXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gLS0tDQo+ICAuLi4vcmVjaXBlcy1zaGVsbHMvdGNz
aC97dGNzaF82LjI0LjA3LmJiID0+IHRjc2hfNi4yNC4xMC5iYn0gICAgfCAyICstDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkgIHJlbmFtZQ0KPiBtZXRh
LW9lL3JlY2lwZXMtc2hlbGxzL3Rjc2gve3Rjc2hfNi4yNC4wNy5iYiA9PiB0Y3NoXzYuMjQuMTAu
YmJ9ICg5NCUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXNoZWxscy90Y3No
L3Rjc2hfNi4yNC4wNy5iYg0KPiBiL21ldGEtb2UvcmVjaXBlcy1zaGVsbHMvdGNzaC90Y3NoXzYu
MjQuMTAuYmINCj4gc2ltaWxhcml0eSBpbmRleCA5NCUNCj4gcmVuYW1lIGZyb20gbWV0YS1vZS9y
ZWNpcGVzLXNoZWxscy90Y3NoL3Rjc2hfNi4yNC4wNy5iYg0KPiByZW5hbWUgdG8gbWV0YS1vZS9y
ZWNpcGVzLXNoZWxscy90Y3NoL3Rjc2hfNi4yNC4xMC5iYg0KPiBpbmRleCBmMTM2YzA2YjcuLmFi
ZWI2ZTgwMyAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXNoZWxscy90Y3NoL3Rjc2hf
Ni4yNC4wNy5iYg0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtc2hlbGxzL3Rjc2gvdGNzaF82LjI0
LjEwLmJiDQo+IEBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgPSAiIFwNCj4gICAgICBmaWxlOi8v
MDAwMS1FbmFibGUtc3lzdGVtLW1hbGxvYy1vbi1hbGwtbGludXgucGF0Y2ggXA0KPiAgICAgIGZp
bGU6Ly8wMDAyLUFkZC1kZWJpYW4tY3NoLXNjcmlwdHMucGF0Y2ggXCAgIg0KPiAtU1JDX1VSSVtz
aGEyNTZzdW1dID0NCj4gIjc0ZTRlOTgwNWNiZDk0MTNlZDM0YjRmZmExZDcyZmM4ZDBlZjgxYTVi
Nzk0NzY4NTQwOTE0MTZjZTkzMzY5OTUiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiMTM0
NzVjMGZiZWI3NDEzOWQzM2VkNzkzYmYwMGZmYmJiMmFjMmRjOWZiMWQ0NDQ2N2E0MTA3NjBhYmEz
NjY2NCINCj4gDQo+ICBFWFRSQV9PRU1BS0UgKz0gIkNDX0ZPUl9HRVRIT1NUPScke0JVSUxEX0ND
fSciDQo+ICBpbmhlcml0IGF1dG90b29scw0KPiAtLQ0KPiAyLjM0LjENCg0K

