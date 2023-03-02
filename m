Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B281C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 02:01:36 +0000 (UTC)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web11.5160.1677722491885926797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 18:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Y0fO1kCu;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.76, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1677722492; x=1709258492;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4/axBOjUXk+Zw5b92XktnGRzevCGofQtfUXLKXEwI+c=;
  b=Y0fO1kCulpFeTDHgn75Fazo6lDiKZSJV4iX8kjT3YDkBDFjXx4nd/COS
   kUfsbLslCdjqjjTaYgIb+WuhHFNEFoQ/TQOmNecW4wKFkPfSxqWVZpUHb
   NIsNNpaF4SXlvg981gHxw0xM/AXJ79iDVrRpR+OoWb2NhAy4Fi27QYIoe
   QG+jKDlIwa0GNRoSOiJBeswhwpI2AEajLM7j1JuDTw8LLYGTeAHPuAT0L
   LmElfCvy9a2ZpiGal+/lFZO+T3Gz1+ddNv+8YGK9FkGEjNLnaLDggyONc
   x3AXdzsIFGZeAUeVmDiP/zpZk08Eez88aDivuqxQD+hVcbVwPg+Ca1BqW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="78491284"
X-IronPort-AV: E=Sophos;i="5.98,226,1673881200"; 
   d="scan'208";a="78491284"
Received: from mail-tycjpn01lp2177.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.177])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 11:01:28 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2s14JV0E41UidtJ/HKs8CrAb0Pcm1c93vloTvyHPlF3JbTvQ0436Or6OTfV/799qNrfv2/QSvujOdqFgtURLn7BUdG06r/4jEGW1nkVx8FWsWDZNRpmoB+JfLjziZPD/2prkfjAB+bIeeuhxJTFB7ZDi+mMxPMv9QaEcgnHqHVHz8ZfdX+NPGmaZf3401HW4C8oP1WuY9Hnoe/wSpuQVBObEiCorv6JeskYP7VhCCDeDpz1bElUfP7whX7QGVZPhL3+oL0YeKX6dolwedc+y6xYHIJiKXwh4kQjHmW/TTqohijqecmkVq/Slcu7iS3/m2PJe+h8Ym63MCx5MUbaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/axBOjUXk+Zw5b92XktnGRzevCGofQtfUXLKXEwI+c=;
 b=eqRXwm2Ksb1x+jHsFQDQaoK0Zm4IRJUenDDFCYqqYCQIgAk1Y5+VKKMuL4UUcae0o2c863DWBwLTULQ6h10bxBtbr/VADybcra6gedxghqHkd20ThK5R3tWqQ1KkghFPRpB42CHDYSM1f7EgBT3XfkU5lQ9l6bDzecTPjRBoI2P/KqzjPu2AzfLUqI+O0mWGj00zR2nLsqJGyCyAhkpWLzKU2NM3v24GUBdJll7P3GirxdaOkmE40w7aCYHckpZnv25akA/0NE5/qS6T1qGLfaYR+jx7mDc8s2YHzKM7eyS6v/VcpdrXg2KILbS4nvLiuTajaG1PmuNxcFKA7Jnosw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS3PR01MB9460.jpnprd01.prod.outlook.com (2603:1096:604:1c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 02:01:25 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::3b7b:61ff:847a:5bf9%4]) with mapi id 15.20.6156.017; Thu, 2 Mar 2023
 02:01:25 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/4] vala: Fix install conflict when enable
 multilib.
Thread-Topic: [OE-core] [PATCH 2/4] vala: Fix install conflict when enable
 multilib.
Thread-Index: AQHZR/oHgPZhSbia5kylZ4DrIlk6ya7d4gGAgAjjh4A=
Date: Thu, 2 Mar 2023 02:01:25 +0000
Message-ID: 
 <OSBPR01MB1845D1E95A8383D70E6F550CDCB29@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
	 <1677206695-16822-2-git-send-email-wangmy@fujitsu.com>
 <cdfcc4e555f8093eb7672e167af45933ac27730e.camel@linuxfoundation.org>
In-Reply-To: 
 <cdfcc4e555f8093eb7672e167af45933ac27730e.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZDc3MWU5NmUtODY0NS00MTZmLWI3YzktYjRjNWYxNGIw?=
 =?utf-8?B?OGRjO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMy0wMlQwMjowMDoyMFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|OS3PR01MB9460:EE_
x-ms-office365-filtering-correlation-id: 1d8cbd4b-e706-4525-76c5-08db1ac207bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LJnc1hzLyjxT+EbatC87VGnXDdL0x5bwltip1PnWbBb54hklns/dvXK8k7LHSq42WMcN151SJ4Y8fdDks90FRetNeqRodPDeqKHSmFh9EouwW04Xv3d3BvPC2XWmEEzthFSPMwaUCUk4RJwQ01AowGJWOP2kngZQLeybiRxaoylNotYxs3iqsi5tFr9QUTt0xg3yVoV/CWGgiAz6YFgaw3LeU2965KRqEfPf6UBCvyR8cOKd1y2SE7H8u2lg+hbLCPnVXtHyqLg+WBIgIustaXFCJ4/4a3ZqUUJ+Kqc1Tyjq1vPbFxKOamwvgFgJ3jSf9QFoCUrGvMwfdXF68IMUeowoQ+L1SMYHdsVMfjiVmjNMvie5QtgfC2Le9KVbdXIOWazEevVp51N6Dl+cHflesPKxvv6fOlXnplHKCH7axDotvzXl1u+jZyhpoodiuJfaIynKVyuitqO+LF55X4MMfLEU8/KfBXdaTKQvBKn4jVQUlqRLzOmv0yUIKHpK/+w9kbExEYkuNb52u7KrazLlSo6Qlk9kXqiZuOHsuXcvSk6dm+GvOBlw2JVfC+QfoKx3V1uXejxSGAZFDEpToNtgEV9m4kFLyuTukxd/rTqzMzfNUBl+Y5qSLSJDQr98BWbgwHZ5mw3jKjB2gDxySkgwBNIm4+aP+vFjP3C6fgESpmlvV5RuaaX8pMKRbL7KQd2oSwy52lTYPgl0E7pygIuSbA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199018)(1590799015)(5660300002)(1580799012)(64756008)(66446008)(66476007)(85182001)(8936002)(83380400001)(41300700001)(2906002)(66556008)(66946007)(76116006)(55016003)(52536014)(8676002)(316002)(33656002)(82960400001)(122000001)(38100700002)(9686003)(186003)(26005)(71200400001)(53546011)(6506007)(7696005)(966005)(478600001)(86362001)(110136005)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YVE3SUM0bitmczRCOE5VTmJBQU9OVklSWXV0QjF1Z29KMzE3VDlZeXhXalBn?=
 =?utf-8?B?ZDY3VmhuT25sSHh5WitUZW5jcHlsbU5XUGlCQmlnNWkwcDVKQmtjUnIrQU1q?=
 =?utf-8?B?YzU3eUpPNDNYWWFQdWhIWXFUV0xXcEdwYzF6a1R0a0cwckxCZnBZYmVvL3cz?=
 =?utf-8?B?QjRoVnloMjhYYUxCanV1OHNYeVZZOFo5bzkxUERremJKRmlaTWhSQlV2Ulpm?=
 =?utf-8?B?bUVkS2VHT2ROZlhIaGxvdENlMmNFK0VVQTZoWDFnM3NpRFpOaDRGQktVeWRl?=
 =?utf-8?B?WVRXdVdlcmZ6SDZWUWQxck1jazNoSTFJVzZuVVhhYzhFczNsS25leFRQd2N0?=
 =?utf-8?B?RTlWSUhUQ0lRSXp3ZkxoRFV5NWh3U1ptY0pHZk5pMnV4REhDV3IrTUR6RStZ?=
 =?utf-8?B?dTBMRlZpVk5ZdVRXZGsxaHpURG1zNm93RnJjZUYxOE1aak5HQ3h5bjFjLzF4?=
 =?utf-8?B?S0lMR0o4dThOMjRWaHVLVUhvMWxNUXNmWmYvZU1CcFpiUWhhVlZWYi9kbDlH?=
 =?utf-8?B?TkdRenVWaVRya2V1akgzL0FWRVdTYW5vWGRzd0VOMG44WlluYWlJRVczcXpM?=
 =?utf-8?B?cXRPZGlDTjBtNXBxYjlzWmw2WlVDNXB0TE9tMXJxVnJUaDZneEpWdHE2YjJB?=
 =?utf-8?B?U0FPeHFqbTFjQjludzVBMmJvOElpT1lMN1ZzWWhpcXM1ZHNwdE8wZWljblhY?=
 =?utf-8?B?NnpyQU4rcXVRYno4Qnk1Rm5LbE4rdGtEdXJXbHBRUW5GY2xrcjJoakVBT2da?=
 =?utf-8?B?OGtiUWgrZFg5UWYxQkduWFVSYWJ1MTkwVWRMQzY1UXNwQUoycjZHUGhIOUZU?=
 =?utf-8?B?dThIbzlhWE5DeHphdFA3NytieEc0cUJvb0krUE93Q2RJS29nOWRGMU9lbGp5?=
 =?utf-8?B?SWhnMFFRUXNQTXY1QzFodDR2V1ZqSm1PcHdPbGVMR0lNT0NZQzJEbGpqWkhU?=
 =?utf-8?B?TGlMZldORVR0UzU4OGhDeGVwc0R2cEVTY25TYm91SW85Q0pNS25UNnlQeXA0?=
 =?utf-8?B?akVLZ1FzTTBBNjYvOU9Qd3A2REFLTnZSQ216b0pFajhHbk9PMjgrcmQvTS84?=
 =?utf-8?B?RzJYNU1SQ2lwZmRIK0JBY2dZL3BkWVBDdVU4U1N2ZGFhNEF2QWx3WkMzV3Zk?=
 =?utf-8?B?Vmtrbkc0OGl5SjVHbURjT1VWK1Evd0FaamZUOHJ6Tld0blZJQWxpR3o1aTRl?=
 =?utf-8?B?aCtJZ2VZUU5aYUY5dW5RTW9OUnBXSTYwdkVjMUxGakc2QXN2UEprY21nRVJD?=
 =?utf-8?B?WERqWHVCU3RsYTFvTXpOcmEySHFScHJja1V4QmNaZHQ3SVRuSTRhSGtQRFNa?=
 =?utf-8?B?TVd1dmNSVDh6UHdPZHMvcGlwOTJIVU5mdWZFWHd2Y01vNUdMQXBVVks3WkM1?=
 =?utf-8?B?VkFBWmYrR2NXakpGYzdFNkp1T2lqbUo2THQxV0hnZ1BkaUhkSXhFVUVLNWd0?=
 =?utf-8?B?S0pEV1dXRngvTjhlUTNBbWhJNWpRaHhZMTVMNzE4elRBWTRwSERWYkY0NmtI?=
 =?utf-8?B?Nmx1TVZwN0QwMWhsMlhuR0YzOGJVVTk4dDg4UHp4K01yUlh3ZXBNMGVNejB4?=
 =?utf-8?B?V2xjMXpzTFNqMVVVdzBzeWRac1BXSTFqTE01ZGN1UldkcVJCVXhXaUw2ZHhN?=
 =?utf-8?B?MUtrR3JBdGNxdUdUYjRQRGx5ODNEUlBkZm5hNGVrQ3NkVkZ1YnBoUzhEZVoy?=
 =?utf-8?B?RWtYa3lYbFZxQWNEeTc1YkN2R3NRZmFtL2V5K2tJcExqcENSbTM5YnRZZlQ0?=
 =?utf-8?B?NHcyamsvU0RmRUFKR0hTT1BBUDJUWEt0ZThoQ3VEdk9IR1dPcURac1dhR090?=
 =?utf-8?B?Zkd6UjRaZytpNjhaN1ZyeWNnY2htVi80L0x5Y0ZydzVYMHI5NUM5ZVBmME1G?=
 =?utf-8?B?cEpiSENFeFRXRjlLeGkvQ1dmeTdtblZ5OWVMbVMwMll5RXEvQytwNWRpQ09h?=
 =?utf-8?B?d1JlTHNRTkpHN3VFdmhrcWY2aldFUlVEN1hnTnBxZW9YRFBCbkNWZloycmVH?=
 =?utf-8?B?SEY2T0tqOHErejg3YUtPN29rTmRhLzBySEloRjR0d2pkd1hLVGRMY3FXeEVv?=
 =?utf-8?B?MkV6TldhVElXaG5SUWxwSnFJWGNCS1NLVUVvRWp3UG9yREVDL3hHTGZwV3R1?=
 =?utf-8?Q?UYX4pifH4TLZdsrVT59umtAUC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HUrvrBvoJM9hBy+zfrnIvvuezu1X/LKXYPipXHmgX2QOKkeKBxEquyLq1B489e9Dq3gQ9zbQrgMP9Stw6s5MNbVjHaamwSA3DcwXnWyrtvm6O4YiM6r1IWtr4CDIhphMiYTgSW9nr2+b0QDYyhezGi6gpRdxVyEdM931A50RJE658HOSDoSlxIFd3gvwpHcvtrVoeI4FjEzTCJ52X7J6iWFdXtY5oP7i3Md+92UinRXTiyNyQmK7UOysX5D27NkVnGfeZWmNJvswLe/uzzypIF1fXVL1Hm4EWHQFTXenH6egqr70UVNSC5JGAVg1ywa0d0fyV/Y+lG/P1g4GkPekHCy+ZL+i/BXRu7Xa44K65wGjPweobJWc7pxBG1YiKhUoTg+GWLacSplZP8+Be9CGNZMpz8vAozI+3iEilckDFM9hzBV8Vd1ZaZRZGhWch4zbXU2l0IlDl7BwnIeLe0XwM6BZQ1QPGDzP3A0vm6c0QTR/7JFSxZrVkL3g5YsfgLp++klZdyxgCWz1Q9m3P2B1y2FGd3gOYLfS1GLaxgV2+qBuevvDl4/RkinvtnQGPeYS6ErhWO11KKC8zRGJn78/QTN0dFStadZi6LhvyoZz3QEQ+lY15RRlu+2vRgXqCW45Bp1jAuQeN6CAdXNpq/3KlhyJ83NsM6qlTblcOR1+w2NIaZi76/oorzVNnEyp+pHCx2kbBkHTOgKrg3D4+dudlePrG+XyTSNxhCUkKS6Ud7yqiKL8ukHhhJWHILlwSRMgloaFezwOXZcwl8lpuYYi/1RtPGKDxRtoYmp0jjgQwp6awyUjhHb1UL4CDI7KzcKTi1Pg9lH/cb2Nj0JbBN3tjg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8cbd4b-e706-4525-76c5-08db1ac207bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 02:01:25.8710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wOR3YWduEcg5Lh66DRRCYLgB2SZg2g6Gt2r753orhD4dOUmegePqfVx4U/aqXCLtwb37xxd9TdlNCpxSSGHpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9460
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 02:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177953

Rm9yIHRoZSBzb2x1dGlvbiB0byB0aGlzIHByb2JsZW0sIGNhbiBJIGRlbGV0ZSB0aGlzIGZpbGUg
ZnJvbSB0aGUgdGFyZ2V0Pw0KDQrCoCAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9w
bWVudCBEZXB0LkkNCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0
ZC4oRk5TVCkgTm8uIDYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDog
Kzg2KzI1LTg2NjMwNTY2LTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2
ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9m
bnN0Lw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0KPiBTZW50OiBG
cmlkYXksIEZlYnJ1YXJ5IDI0LCAyMDIzIDY6MTYgUE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg
6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDIvNF0gdmFs
YTogRml4IGluc3RhbGwgY29uZmxpY3Qgd2hlbiBlbmFibGUgbXVsdGlsaWIuDQo+IA0KPiBPbiBG
cmksIDIwMjMtMDItMjQgYXQgMTA6NDQgKzA4MDAsIHdhbmdteSB3cm90ZToNCj4gPiBGcm9tOiBX
YW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gRXJyb3I6IFRyYW5zYWN0
aW9uIHRlc3QgZXJyb3I6DQo+ID4gICBmaWxlIC91c3IvYmluL3ZhbGEtZ2VuLWludHJvc3BlY3Qt
MC41NiBjb25mbGljdHMgYmV0d2VlbiBhdHRlbXB0ZWQgaW5zdGFsbHMNCj4gb2YgbGliMzItdmFs
YS0wLjU2LjMtcjAuYXJtdjdhaGZfbmVvbiBhbmQgdmFsYS0wLjU2LjMtcjAuYWFyY2g2NA0KPiA+
ICAgZmlsZSAvdXNyL2Jpbi92YXBpZ2VuLXdyYXBwZXIgY29uZmxpY3RzIGJldHdlZW4gYXR0ZW1w
dGVkIGluc3RhbGxzDQo+ID4gb2YgbGliMzItdmFsYS0wLjU2LjMtcjAuYXJtdjdhaGZfbmVvbiBh
bmQgdmFsYS0wLjU2LjMtcjAuYWFyY2g2NA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBN
aW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGEvdmFsYS5pbmMgfCAzICsrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGEvdmFsYS5pbmMNCj4gPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGEuaW5jDQo+
ID4gaW5kZXggZDNkYWVlMzdkYy4uOTA2ODk2NjJjYiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhLmluYw0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxhL3ZhbGEuaW5jDQo+ID4gQEAgLTY2LDMgKzY2LDYgQEAgUEFDS0FHRV9QUkVQUk9D
RVNTX0ZVTkNTICs9DQo+ICJ2YWxhX3BhY2thZ2VfcHJlcHJvY2VzcyINCj4gPiAgdmFsYV9wYWNr
YWdlX3ByZXByb2Nlc3MgKCkgew0KPiA+ICAJc2VkIC1pIC1lICdzOiR7UkVDSVBFX1NZU1JPT1R9
OjpnOycNCj4gPiAke1BLR0R9JHtiaW5kaXJfY3Jvc3NzY3JpcHRzfS92YXBpZ2VuLXdyYXBwZXIN
Cj4gPiAgfQ0KPiA+ICsNCj4gPiAraW5oZXJpdCBtdWx0aWxpYl9zY3JpcHQNCj4gPiArTVVMVElM
SUJfU0NSSVBUUyA9ICIke1BOfToke2JpbmRpcn0vY3Jvc3NzY3JpcHRzL3ZhcGlnZW4td3JhcHBl
cg0KPiAke1BOfToke2JpbmRpcn0vdmFsYS1nZW4taW50cm9zcGVjdC0wLjU2Ig0KPiANCj4gVGhp
cyBsb29rcyBhIGJpdCBvZGQgc2luY2UgY3Jvc3NzY3JpcHRzIHdvdWxkbid0IGJlIGluc3RhbGxl
ZCBvbiB0aGUgdGFyZ2V0Pw0KPiANCj4gQWxzbywgd2hlbiBwb3N0aW5nIHRoZXNlIGtpbmRzIG9m
IGNoYW5nZXMsIGNhbiB5b3Ugc2hvdyBhIGRpZmYgb2YgdGhlIHR3byBmaWxlcw0KPiBwbGVhc2U/
DQo+IA0KPiBTb21ldGltZXMgd2UgY2FuIHR3ZWFrIHRoZSBmaWxlcyBzbyB0aGF0IHRoZXkgY2Fu
IGJlY29tZSB0aGUgc2FtZSBidXQgaXQgaXMNCj4gaGFyZCB0byBrbm93IHdpdGhvdXQgY29udGV4
dC4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg==

