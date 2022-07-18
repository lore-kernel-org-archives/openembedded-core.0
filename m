Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2DEC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:25:58 +0000 (UTC)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com
 [216.71.156.121])
 by mx.groups.io with SMTP id smtpd.web10.21562.1658103957160020748
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=V7EJ9mLe;
 spf=pass (domain: fujitsu.com, ip: 216.71.156.121,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1658103957; x=1689639957;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yyGAMpCzB6+fJAFg0mHeOwoUYH1pBoi3/MsJIRuEtO0=;
  b=V7EJ9mLe8bofQ9Uwzv7ZRnIliOirsjqgF63gyv8hW76mE18s1sDvJs7z
   e3bbnlobVy9XM+3RkSnqYoYL/D2sqWXN6u3zJiZ3Ox+OATvgsQ+kAWKS9
   orFpqa0WnDtUpWnQsI9k3N6MpzWxp4AjrwG3E9iIVl/fEx2KJJLHzWRg2
   +Vh2QZwuWG1QQ1jJA4DY4gYJ2uXCNobkQbCNo/P8vb+TlqwU2jBtDNEOn
   DwzysFngnKxtNA806yLtKYXix/ff2XZGxRy1q5jCfB+J93+rTXj3Hl/uf
   8cNB0eOGZQQ3vl3vDIYvEeTTGKce0T8XSyULgl/Kuu+TGUYp+vkF9iVDe
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="60919408"
X-IronPort-AV: E=Sophos;i="5.92,280,1650898800";
   d="scan'208";a="60919408"
Received: from mail-os0jpn01lp2112.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.112])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 09:25:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f484k95+6vAwKLIGKLI+k2vBQ9TYNpPyLH7LirkQOz+P0lr0egnugi0jxli6t1RF87TRWd2jDCjzWosK3X2ryVY8FnpWSVnvbvFIUDeW5EERcHKuYpNAyhlHQtjtQxqaR7WE1VZNcBk4tMslTRP/hDQsw99VAWWawpR3hhkmNMFEx4IJtxV3oRr1ek4i4XCRMJ/t+oM9k7qF1qZcX4FbD2+AIVeA8ENFOgtKzKRVwvpv3SlvdnchfcvWCzV3z4SG5SHjoY7P6dZP/799wwJLSGRIpj9+jGFN3Afa7IUGeqt11xqmifqGqTzXJaGmp+AyBtE8w3Z5Pb3u24dFas6uzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyGAMpCzB6+fJAFg0mHeOwoUYH1pBoi3/MsJIRuEtO0=;
 b=oH5cY/8I3f4AFguXKnc/ajYwNvSrg6FCmO+QS0oqq/3DQOaunNG+VlAhmKeeYPVaIEMcFqzqhhIA8M2+oQBAAwm9w3atU1aqy5Klpsxpd6899Jsr9aNSoEZAYutbB/gkeKbGJnaVgDKxqDuPYAhmGjenf3ooH6mawl+o4P7KTRglM2C6aM0X6hYIJhzvnq2qU4HyePjLH5mmDko6vTwmx9lErZzmZ912utqw1w6+a6zTA3LCoMvtqlAIA9Bv7nw380sTao1eMOAj6Sn46kOtH2i4QtfCXxw3Xao0L16e2GaQnNjBrqewm0Boy6IYjRK3Yie9MsnP5F8c2gS7IoawOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyGAMpCzB6+fJAFg0mHeOwoUYH1pBoi3/MsJIRuEtO0=;
 b=ksYqWj4MjgbXZgzcwMvwwqZRonB5GOsD7InJIDLfJIN45CyjmskfzB4bOvwJUV+udbx+EMJHkU8DkYzsbTlRNoFGKMgQuGfj9DtFx6E2RzfjmX9rh07mnToC2hYTA0Loxng3yKNzmGkWf+oRfy6zOvIbjrl0jRMy5wjlzWqbNFs=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TYCPR01MB6835.jpnprd01.prod.outlook.com (2603:1096:400:b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 00:25:50 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::4c4f:9d9b:ae06:4299]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::4c4f:9d9b:ae06:4299%7]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 00:25:50 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] python3-docutils: upgrade 0.18.1 -> 0.19
Thread-Topic: [OE-core] [PATCH] python3-docutils: upgrade 0.18.1 -> 0.19
Thread-Index: AQHYlcNkfCOG3/F1x0GjR9Q4Z8HgRa1/qAQAgAAA3ICAA6QYgA==
Date: Mon, 18 Jul 2022 00:25:50 +0000
Message-ID: 
 <OSBPR01MB18451275E728D4DE026351A3DC8C9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
 <c26547d12783ebb94f1d2222403c11cc7c9633d8.camel@linuxfoundation.org>
 <CANNYZj9vT+YqW6qHqCLMoxzfc9G=ZdJzYW03qsQBF=eP6+d0yQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9vT+YqW6qHqCLMoxzfc9G=ZdJzYW03qsQBF=eP6+d0yQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NzcwMjU4NDItZTA3My00YTgzLWIxNzAtOGY1YWQwNTJj?=
 =?utf-8?B?YWRiO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0wNy0xOFQwMDoyMDo1Nlo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be40a7fc-a9d7-4221-a823-08da68541140
x-ms-traffictypediagnostic: TYCPR01MB6835:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5EjFGKIjtVnigZStAg8g8pXHJ4NpcVHOK7++4dLR1AUfBW3rbl+XpbhjGt5rfJe0O4HoJAfNyJnzeIQHjnicUc4kUOn+PpGwVGSBEP5AzcXNFNR/E8FUK7RTIZWFKnaYzq7XDdfN6Je3eanZpT+OCKMxKJNsGPnm/KPkixpNWcibHKjkWP9QUDiDogrAPwdlvEd6ddzs9VGzPVWsJgSq1QLTFEdamsfTUpPXILh1WF9Vg2Vuq1f8Scj3aS3KaFbowk3s4X2jsNEEB8x8F6tCWE+EyISnq9swFLtAPxEPZ+x4DD2lhEI7T2yDYVSAhkdCo754SybAbHC4R3FiajpFyBU/EQTuvqyz8UNxwpvUJsQTrfVn8qBTdlvNyLEh443fMEMrIDcqXL367yZc9IGFJuqQDoEDAO9dQzma4pX4i40+9i1Jsj0T8ZtsDWoSc043mtuGrD4kCQYSnsPikGVDuB3f6wERlFCrzTII65uT0zUwpIyyZ48Bhaz/TDbJd1DjBpItmB4JIMPAKOv21j4pYvYVo895UNApQRPqpP7RzD7mWGSLiJDuKN40V8c5EiwxjcxxP76Yuhzkuwt1l4WIJXjOziTUFsanZZQCZnOvAGpCuTdZSTCzLfh2znUZdyUY1bkLe390rSABZmyLyNMVHv5X26W+fZfs1c0ve54/n05pwtq4J8UYTH1vQ7IxU8mB233E7/xEjQNSFG1A7E9CItpN83sXtngMVKt0oo7gpY3ndaeFEtJT16yLFSvqgQRX+d/JjOX4Yut1yFFOSy/YVhZhytTGqEy2Quowc2GcsFIjXbHSjySbwGtWvbGmWGfyYJ5pZ9eIm3N/Nsfj4YL3aQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(478600001)(52536014)(8936002)(71200400001)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(86362001)(8676002)(4326008)(316002)(6916009)(966005)(54906003)(38070700005)(5660300002)(85182001)(38100700002)(6506007)(7696005)(53546011)(2906002)(26005)(122000001)(41300700001)(82960400001)(9686003)(33656002)(186003)(55016003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WTRtUm54WmYyY1VKbDBBWkZOeEZhd21SdnQ2ZXNDREVGek0rSGcyWnBpN1ZM?=
 =?utf-8?B?Qm9OalFKc0ZrVHk5cE10cTRod2p4cS9xUGh6UkVxRzJmL001ek5DUS9kd3hx?=
 =?utf-8?B?WEI3NHQ3dURwT3RGLzZkQmN1R2NuVmt5SHBMM1FicGhDVDhBNDFSS0lITm96?=
 =?utf-8?B?OGc5dTdaOGVUNm5INllIc3ZwYXl6di9xUDJjRzhLNWJUSzVNcVZqVlNMdTJw?=
 =?utf-8?B?WXYzbWVjUDcrT2NFeU1wREEyWndnMDVCNlZMek1YYWFQVmhlY1N5ZlhrTUZM?=
 =?utf-8?B?cHV1WEtnZ2hlSEhZeHh1VDJyc0JNR3hUYWxUeldVRkNQMHFoSHlzWldzTGNy?=
 =?utf-8?B?S0luUWNOd3FIbElTWElya1hTcGZDaVpOUU9aUXhHTkQzL25HUTZpWUZrNkh6?=
 =?utf-8?B?bk1lQ0FlR3NocVBPc245ZjNxYkx0MUl1amxvQTlrWTVRZkJxSkt2Sk0ydFhV?=
 =?utf-8?B?U1YycUFPVmxHK1plMGxyc3NVZUI4YmFIekpHMXEzMlFGaHFLaVgxblI3OWNP?=
 =?utf-8?B?QTBvT21lZU1KRXFIeXE0UFFKZEVZZ2N2NkRoTkYyV1V3QjZjN0lqRTdOeFYw?=
 =?utf-8?B?bzhPck5SWWNINTZMSXk2K0RaRWJCSkN6QUIycUlaWW0ySFBxczVzRlkyZDdB?=
 =?utf-8?B?eHNONjJJWGowR3VtUGQ5MDVSUTVISjZtQVRSK3ZESm1sQWxrS2lBTk9xRFVJ?=
 =?utf-8?B?RTY4TkhaZjdTa1hRTlZlNUdlenJxMVhEZWJaR2lLS0cyVmYxWjJkZXRyUThB?=
 =?utf-8?B?V1JDTVNSS0dCSldHSnNiUkozbTlzdTFzUW5STjFYTFBLMVlsenRWSVdpZjVi?=
 =?utf-8?B?NkQwOWI2NFQ2Y1M0WVl6UXZrSmxYYmlaZ0lzSmQwYzQ2VkFQNmdXaDNwMFdk?=
 =?utf-8?B?Z1VCYnpqaEgxUmZEaGlVRXdKZVdkRmRSb0c4T2d5bHFWeklJaWJDUzBJQjQy?=
 =?utf-8?B?czM5aHlLTStPdkFmRUNORlBBc1RWZzlRdFBQV0xEQ2pubHpIU0ZBR3BwRTh2?=
 =?utf-8?B?L09JTnRtVXJDRTltVW5FMFpNNy91Rk01WXFmOVNxSytKdWgrQ0lsWWhFTTZU?=
 =?utf-8?B?WGNDQTR2cTVQOTJyNEw3Z3NpQjZINlhtcGNIU2xqajVicHdXdEZOaWluTGdy?=
 =?utf-8?B?UUVBNDNrM1FnT0R4L3BMY0tGc3VjRFJoUnNycm9pNXBnSVRiV0x5ZFZXMHZO?=
 =?utf-8?B?bitzb0hpUFNScGhPMW82UHRqQzNVYjBmSHVLMDFtMm1kQUJBUyswY3FORHJD?=
 =?utf-8?B?UEM3L0NwL28xcHBSN2RpVjFialhOQmlmcGRqNG5NM0VESWdjVXZWVUppcUJ4?=
 =?utf-8?B?UU8xUm9YaWV6WHBHU1c4SHJiWnRFVGRjbVErV292N1VHbmgwak5vbU03YWZH?=
 =?utf-8?B?UElaT1hheU1hMHpWQTJDQk9DbGNuRmlIL2tERUxhdmVlREJ6Q2dYblpjalBn?=
 =?utf-8?B?MWNIbm4vL042OUhrc2hYOEwrWnZrZG9DUzZDRS9iVGVMSGRqb0RRWHpGRXFk?=
 =?utf-8?B?cUxZU294ZE93QmVrQmY5d25LMEpqSGhFTWpDdG91cklteHQrUU1XYzVBZE9V?=
 =?utf-8?B?ZG9RdjhtOEJhYlBJVzZOZkYwSkQ1MkluV3FqMWpiQmNHNzdJWGswSkt2UC9x?=
 =?utf-8?B?aVhESXU2a25wbmhRaUlWR1VzNiszR3VTdXVsRUQzSnc5Q0NsemVBK3JNSkVI?=
 =?utf-8?B?YTZXa3NiaWpqVXoydEpSb1E5MUI0QWlBRWRGVVkzeWJkdEVHWTY4enFBYjZv?=
 =?utf-8?B?bU9ndHltZmpaWk8vM0RTdXhmek84MzFELzNCNTc3L1ZBRWI3SmlsaE4wU0NU?=
 =?utf-8?B?bTliV3NyYkVSTlhnTkxuSEtlRGpuU1JZSTJXdVVSRTZXdTk3TU5qUTZEUFVS?=
 =?utf-8?B?ekFFZHRXQmNrNUlwT3k0cW0za1kvdE9ua1V4RThLTVdiNWNOWXpUS2hsYVhH?=
 =?utf-8?B?YTFTajRIcTB1RmxOS3g1MC9USS85cXhBdmFTS0MycllnanBHZTFBU2tYTEl3?=
 =?utf-8?B?Zk1ib3QwdkZVS2ZjUGl6YnpEMzZjbmY4MHdFcll5L0dZMkk0cW1jTUxzS0pK?=
 =?utf-8?B?Q01IdkRHUU16MXpRZldpS0FWRWZWSzF0RkFBNlRjenRaYUoyczBHcFRiVzZE?=
 =?utf-8?Q?nH8Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 be40a7fc-a9d7-4221-a823-08da68541140
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 00:25:50.2181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 sRoQ9Dbg/U5X9g9jZzn8zoGog+YH1vLZW9A4b/U84g/+0334x1eevQDF4KEz6xLlpgt6b1V6nbntQcdcrtDmVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6835
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168164

VGhlIHJlbGV2YW50IHVwZGF0ZXMgb2YgQ09QWUlORy50eHQgYXJlIHRoZSBmb2xsb3dpbmc6DQoN
CkNvbW1hbmQgbGluZeKAnGVudHJ5IHBvaW504oCddG8gdGhlIGRvY3V0aWxzIHBhY2thZ2UuIFBh
cnQgMi8yLg0KU3VwcG9ydCBgYHB5dGhvbiAtbSBkb2N1dGlsc2BgIHdpdGggbmV3IG1vZHVsZSBg
ZG9jdXRpbHMuX18gbWFpbl9fYC4NClN1cHBvcnQgYGBkb2N1dGlsc2BgIENMSSBjb21tYW5kIHZp
YeKAnGVudHJ5IHBvaW504oCdaW4gc2V0dXAuIHB5Lg0KS2VlcCB0b29scy9kb2N1dGlscy1jbGku
IHB5IGZvciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBhbmQgbWFudWFsIGluc3RhbGxhdGlvbi4N
CkNhbGxzIGBkb2N1dGlscy5fXyBtYWluX18uIG1haW7vvIjvvIlgLg0KDQpCdXQgdGhlIGFib3Zl
IGNvbnRlbnQgY2FuIGJlIHJlZ2FyZGVkIGFzIHRoZSBjaGFuZ2Ugb2YgQ09QWUlORy50eHQ/DQrC
oCAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9wbWVudCBEZXB0LkkNCk5hbmppbmcg
RnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkgTm8uIDYgV2Vuemh1
IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDogKzg2KzI1LTg2NjMwNTY2LTg1NjgN
CkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWpp
dHN1LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgSnVseSAxNiwgMjAyMiAxMjo0NSBBTQ0KPiBU
bzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gQ2M6IE9F
LWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBSaWNoYXJk
IFB1cmRpZQ0KPiA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHB5dGhvbjMtZG9jdXRpbHM6IHVwZ3JhZGUgMC4xOC4x
IC0+IDAuMTkNCj4gDQo+IE9uIEZyaSwgMTUgSnVsIDIwMjIgYXQgMTg6NDEsIFJpY2hhcmQgUHVy
ZGllDQo+IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gPiA+
IExpY2Vuc2UtVXBkYXRlOg0KPiA+ID4gIHllYXIgdXBkYXRlZCB0byAyMDIyDQo+ID4gPiAgdXJs
IG9mIHNvbWUgcmVwb3NpdHkgYW5kIGxpY2Vuc2UgY2hhbmdlZCAgZXhjZXB0aW9ucyBvZiBCU0QN
Cj4gPiA+IDItQ2xhdXNlIExpY2Vuc2UgY2hhbmdlZA0KPiA+DQo+ID4gVGhpcyBsYXN0IGJpdCBz
b3VuZHMgYSBsaXR0bGUgd29ycnlpbmcuIElzIHRoZSBjb2RlIHN0aWxsIHVuZGVyIEJTRC0yLQ0K
PiA+IENsYXVzZT8gSG93IGRpZCB0aGUgZXhjZXB0aW9ucyBjaGFuZ2U/IFdlcmUgbmV3IG9uZXMg
YWRkZWQgb3IgcmVtb3ZlZD8NCj4gPiBEb2VzIGl0IGNoYW5nZSB0aGUgbGljZW5zZT8NCj4gDQo+
IEluIGNhc2VzIGxpa2UgdGhpcyBpdCB1c3VhbGx5IGhlbHBzIHRvIGluY2x1ZGUgYSBsaW5rIHRv
IHRoZSBjb21taXQgb24gdGhlIHdlYiAoZS5nLg0KPiBnaXRodWIpIHdoZXJlIHRoZSBjaGFuZ2Vz
IGFyZS4gSWYgdGhlcmUgYXJlIHNldmVyYWwgY29tbWl0cyBiZXR3ZWVuIHRoZSB0d28NCj4gcmVs
ZWFzZXMsIHRoZW4gaW5jbHVkZSBhbGwgb2YgdGhlbSwgdGhlcmUncyB1c3VhbGx5IGEgd2F5IHRv
IGJyb3dzZSBoaXN0b3J5DQo+IHBlci1maWxlLg0KPiANCj4gQWxleA0K

