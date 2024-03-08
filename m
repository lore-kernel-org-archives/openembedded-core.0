Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CD3C54798
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 00:22:33 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web10.9289.1709857351503489139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 16:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=hgNXa38l;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.101, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1709857352; x=1741393352;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TtxJqJaT+bXvzS00qgErTQXTNib+/HXKC6yLMeo3Zf8=;
  b=hgNXa38lV4fTXUWU5FQ6eZqlq1cBtl04wvNmNLXSCiYITX6vHa10g/VO
   X5BVv559VEfYG5uYwCNmZOBFWBUe6olwiXHbYHtzAap8WggoHQd2TzZxq
   H34CKTAqZ6LLVeS9ADm0pP3AF/g99soIIEyzdyvmYU+6ayKnAPk6mRP+V
   bUvj/noELbCJvDquawuBY0Wr69R8XEZ/m5gL7qgkrl4VrPaajpWpUvkKo
   iBxTHzpUi6xTqXwjIggCQxL4pPE+Go/ka3caEjP1ogCyEpOIRlHInYLFe
   IQ5EZNexHjPWW5I79g4IkeD3t6uXQzwpbPRHiMjcfcrDcf/JZIxfi8Bsa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="112961438"
X-IronPort-AV: E=Sophos;i="6.07,107,1708354800"; 
   d="scan'208";a="112961438"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 09:22:25 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaU2aZ1EWPFJheexzusvYIQlsf5+q3t7CNjSgF8Z3hmG9E9g54eEWK0/4wIhJSxeR6KoLdI38tEBkS0Fl8BA3HubDhmghkz1+8+EAUwxxzbec613V8Ovegj2fCzmH4UdvSB3SqIln6042m0qYl6Ar5DUGm80taFVo7uJraX3F00gX6x9p1P2nXjqyLWGbL2gdJ+4e9Yz+ibfKlrN9BQ8I8LvERZBxSxJhhJEPzQhQ6zhNJRD2BGeReGLNjo0TBZKvY4q+QrLiygb4IMnunNIZqiLqJ/UNaEqexYWqCFCd8Zg9OC8dRVOuxAI9iYHdlVN7uidmwVxGufkQj2GYcK0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtxJqJaT+bXvzS00qgErTQXTNib+/HXKC6yLMeo3Zf8=;
 b=ZvjNmL1xZAvreR7vPKpMJB1sF1H1FVDUPB2AqjPXieQ3fKeUl+79b0//A1C1oouZ64dfCq0Dbkn4QTDD8Hxw+3/tRDoBiU72eNf4UbRlWFhzamJPi5Dp4LkHKpwz2+NAMzhwI8iXINtztflKueUd1LvAkAk/jfJz95Z9StjCyz7IibWO2tFp3EJPBd+cUIDz95iyBl8x9HxWtq1qDZT9EmpBsrfywSnBc/4JPY7zKovONrIvlYgOpZr63vpnO6bCNxkppzoJhx7cLtBroIgnyk0m7/Q1GGJ9loIIRzrvZaI6QVCi3Q6kQuMASVLCBIUu9oG1ibodVqs2EkhMMk3KlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYCPR01MB10590.jpnprd01.prod.outlook.com
 (2603:1096:400:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 00:22:21 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::4189:9809:9327:afc8]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::4189:9809:9327:afc8%4]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 00:22:21 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] glibc: Fix conflict error when enbale multilib
 on aarch64.
Thread-Topic: [OE-core] [PATCH] glibc: Fix conflict error when enbale multilib
 on aarch64.
Thread-Index: AQHaaHUpatzEX0efzE20ox1aXl40t7EcJnuAgBDlEjA=
Date: Fri, 8 Mar 2024 00:22:20 +0000
Message-ID: 
 <TY3PR01MB11056E0F4F06FD30D842303E3A0272@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240226053210.3501-1-leimaohui@fujitsu.com>
 <CAMKF1sqh5ngJdQfKvgQ-9Omc6U6SeKE2DzV6127-ep2iyS=8Jg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqh5ngJdQfKvgQ-9Omc6U6SeKE2DzV6127-ep2iyS=8Jg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YWQ1MjFiZDktZGMzMC00M2RlLThlMDUtZjk5ZjNjYTUw?=
 =?utf-8?B?MTQyO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDMtMDhUMDA6MTk6MDZaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYCPR01MB10590:EE_
x-ms-office365-filtering-correlation-id: 41b49ba9-ff7d-4061-124e-08dc3f05d1fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MAjD26fWExfQ34G1eqhzN4nrrSgOQ77dGgPbs2PKYt7En2URCAPkBnH2qmuQz8t0CszxoAzh3S/T6clPl8A9pDrGcXdp/WriXx8kK/Jf4eaJJneAr9PDJzYYcQbI8H/jx8yL2HoBTklAaBYo09/1FTNMe0oZnNXdBPcdMhewjLZXQqgn6fMY48xgpirPmU2b9Mlqhh171qJQnQz5YBzcfi3xX22wU4m1OjftimLu+Vlidd7gybuOFPpXmP6kiUygaWIHQ58CUJCrHV9N5s3w6P05rLw4tSnOu9x6yfgYrEgrjLHjWIqnVzOt1znZXLIr5X7Eg2vg9P23hJuShMNuDOvrPXSW4SYU4IlaSFoq4yi9Bi3fpzHcml9tIF5HzMIdO/jJghuH5s3uxSzNp7Pzs/OJ2AaRsVfHcKqTRdfR0j6i/fDHh7LriDU1n1GUXGJhrvJuqMIr36dG9FfP5PXcYA63CdkDUzNeoDwgcqjZIIXw2DsgE6q3qXDr3H8bgU25LzfAy+7uFMgi/G3J+A6My3lJLMnmWMc0CM7Vax3wHm9NJbwUqI2BDaT6PrB+TkZWhULzD9O6sY3bgRqSWTqtJsh+GCeQN4wjZ2/N33vcH7D7b0Pq1rTiMa6N1MvUUoWTI3sonS/mMCzM5OSkweEApK5O/bJXgMbAQ+4ZLnZpZ0uOeBMp7f6YieCtDFOlXWCk
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(1580799018)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWtaeDkzM3pWcXYwamt0dEhYbEVzdzdNU3RqY0pnYnU5TUFiSEttSWlUckJa?=
 =?utf-8?B?b3ZBNVgwUFFRdmQ1ZzVQdVQwUHo4K2RrSk5yNE9ySmtQUnZCWFhwWjRIUGxx?=
 =?utf-8?B?VFUyZ0ZsWlEvV21NWU15bUNFcTVFKzRrNlIwWUltQjB2RGJMRzJHVTBuM241?=
 =?utf-8?B?MnNGbTJybTBsUmpNMzhjWm9zQ3NlMjc3ZTdMVXBFMzU5UnQrUHh6UktJam5J?=
 =?utf-8?B?aDNlVDlydjlHZXJic0c2akpIWjRBWTlaMXZJak9BUlNZamIrN3E1UC9MeUNn?=
 =?utf-8?B?SFE3QTVXZ1ZLSW5QTVZnRkZKK0twVk16bDlMNUpNM0F5MWVONXhtWUpDOVdK?=
 =?utf-8?B?Yjk2YmlWR2VtWnZIMVJLWHdtVVR4ZHVsemV4UmZQcXZDeXRNUjJJOHBnUk5s?=
 =?utf-8?B?UFh3a3ZVWXlXZ29ZcjRqV1JBU0JGUXh0KzlvZlNzd2VObTd5TXdDRGRybTls?=
 =?utf-8?B?aFkwTE1YWHpZUUdrSXFkTHBxSEpwbEd5RFBKKzYrdHZnbEdMWDV4NHBrckJv?=
 =?utf-8?B?SzBDSUh0MWlGN2dEU2RadmpOTGt5aU9VY3BpbE1JZTRZSFB4N3ZpK2FNZmM5?=
 =?utf-8?B?M3V1Yytoc2lVSTkvVXNUSEtKcjlyMUV2NmJnNGg4NTEvaFdiYmxRVXhlZHV1?=
 =?utf-8?B?azJmQnR0WG8wRkQ4VCtUdlkveVRISW9pMklmcmpLeEFGR3J1YzJoUFpPMlNU?=
 =?utf-8?B?UDdGdTBQRXk0M0g2QTBxbGxwY1hTYTlOTFdLaTRBSVdraGVVQ01jNXBMYXBQ?=
 =?utf-8?B?QlNBanNaelIvaFNxTG9zbFFMbDdjRGV4a2dIYTRUbEEwL2p6Qncvb2Q0dG9u?=
 =?utf-8?B?Q1djcWMxTWgwVVJSK201V1MyRk5OdkY3cU4xRnRTRGZVZ0xXaGN5bzhGMlRE?=
 =?utf-8?B?TWxQd1VoWmpQbTJaLzZ5by92YlJ3ZDM1czZjUkh6OXdLZytUdmFyTkg4Sjh4?=
 =?utf-8?B?YTlkMXZNakE4UU55bEF3a2RlVkNNMENwVXNSSWx4U0xXSW5uZVpjOXh0Wjlv?=
 =?utf-8?B?Q1NkT25lNGtLNHMwUUVDdDRLUmtmK2djY1cxNVo2N1ZONGRvMFVKTFI5NVRZ?=
 =?utf-8?B?RlRHN3VBc3JNZzhaYW03Um56aC9LdXNJUmErNTE1ZWpzT2tDQkNTZ3VuRUti?=
 =?utf-8?B?eUkySFZCd3d6QnJ3THc5Z0tmVUlJNFNZQkduTm5PU1hzcmtPODRZTFlGVEZN?=
 =?utf-8?B?QnFXaXFOYlN4dFpHM0xIMEJFL3htUHg3d2dKa09PblVTZlE4VndySjRJaGFY?=
 =?utf-8?B?T1Fyc1ZaQVh3ZVpzQlJxeGhuZHR2cUMzVndjVHk0SXNWVUpzMTBOU1E3cmU3?=
 =?utf-8?B?Y3FEM3cvbkJsb2JIaWkxRG8rY0I2dzVQTlVvVlJyZWRzL3lwT3VKcHRMVU1H?=
 =?utf-8?B?R1M5WGhOQnVZV0N6Yi9iK2dNNndFVGp4YlZEM29TSE03T1FVT3paVmtsQTVj?=
 =?utf-8?B?QnBMMjlXTC9yc3QvK1FYcytTVGpneWpKczZPdDRuNWpiUEpoeW4xYk1YS0Yz?=
 =?utf-8?B?TERCUmRZOWF4SG5aVEQxd0NPSy9XUS94SjZyeEhhUGsxWGxxc284UzMwNVZo?=
 =?utf-8?B?NjAwMXV5U0hnSnl6OU5zMmJhbktOOEtqSWRFRjlqY1ZRaTRrbGx2bnFPZ2dj?=
 =?utf-8?B?RTJLV1NNSjhhVFhEazA2ZksvbzFUOW9pTkdRdk9qSGcwWUI4d2tQUlBobUhL?=
 =?utf-8?B?RFJqdlhXTU5VVWoySGFsc0VJYzBna0gwZFZxZlM0MTRpNWJxQkVXdEMvR0tP?=
 =?utf-8?B?b2srSGJFZGVtMnVPOUE0UnJBdExSWDZpN1FvNkRETjV0R2xESE1uY0JrZStq?=
 =?utf-8?B?SXZKQzF2Z0dNK0lRTnM0RmJvbEFFNmw0OUVqcU5SM0hESG9uUy90VTR5aG1T?=
 =?utf-8?B?aUtySGhHVnhJK0xLNHQxNnc1bGtUN25tVWd5US9ZQjdleFJyRmIxcmgweWdM?=
 =?utf-8?B?M2RFMTNlSmZBN1Zmc0tBOGEwMFQ4UWJ0ZHFMQU5nalNpZ2NseTIvN2FrbzRH?=
 =?utf-8?B?UTR0dzZBckpHZTcwb0ZLK0pZaERPNURzQ3loalVTeVJsNXl0UncvZnZ5SThl?=
 =?utf-8?B?c2I5emtkODk3amVLTnVQU0ZCSG0vaUVuZUlsMVZWQmV2ODhDa2VwR1FvMU05?=
 =?utf-8?Q?AzliWItXWe77rPqn8HLoF6GEM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mLYx3R/XU5a6WbQpzBWSfdS2joPKhgm3hQKOCI3mng14bRpX+xim/Xh9bmNyuesMmPVGo5HUyI3jvX8YSvJ4KnZbfkK1HQBHT2w4i0jVjBGN+b+BgjaBWfZ5jLvbRNXolMcxmae125xozjjV5OCklJLIe/XME854t24znlrKI2LBaJgbm0Avp7L4qfYglsKpMYbp7+oGKfHk7IAYVklGhNvSGTBo4+wrwXH3PFVrOTbQqyHNs0QwsBKkho9g6cIj/OmDlmVg8YNTMb55meTO/YQHrWGfaC7q+0jeqG+N4/reoUEfE4kTbo8T6/abp7DTWHrFTH1MNXJm5WZqR/jTFoC5scoT4BKkK8eLj9Mhil+C9L2DJLIaFv/1QUVSL2v6PTr+0bN615OXnnYqJVJ2p0tK1OXnMwSiBEvh5Z5KOWI63mk67uuWDHN7iBeKGHbMB3jMDFjaZCLCJnHk0qixmBZUcyfe55m5ROba7cUYsmUL9drN0ZNCWYN7VOez3Cj4fRfPUZ65GvLQZt88XOLLeVW3JMPoZZTOBqZkAF2YROfxjUwQtgHHCf4ZqSjH3/Ij+k6MNLloQn6+P7XUOYBKmgjyesRU3FOPkUHa9dspajRKDeQKdg96ehDu9lCVKRd2
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b49ba9-ff7d-4061-124e-08dc3f05d1fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 00:22:20.9846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1j2etF613o98/y5JXIdnYRDBvOrTgoJT430tN6836udU+eeUvr4vU34sTjP/UE7T6HcJh+qHPjRJH+CxXjbe9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10590
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 00:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196838

UGluZyANCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEtoZW0gUmFqDQo+IFNlbnQ6IE1v
bmRheSwgRmVicnVhcnkgMjYsIDIwMjQgMjoxOSBQTQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1h
b2h1aUBmdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGdsaWJjOiBGaXggY29u
ZmxpY3QgZXJyb3Igd2hlbiBlbmJhbGUgbXVsdGlsaWIgb24NCj4gYWFyY2g2NC4NCj4gDQo+IGxn
dG0uDQo+IA0KPiBPbiBTdW4sIEZlYiAyNSwgMjAyNCBhdCA5OjMy4oCvUE0gbGVpbWFvaHVpIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxsZWltYW9odWk9ZnVqaXRzdS5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBMZWkgTWFvaHVpIDxsZWlt
YW9odWlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBFcnJvcjogVHJhbnNhY3Rpb24gdGVzdCBlcnJv
cjoNCj4gPiAgIGZpbGUgL3Vzci9pbmNsdWRlL2ZpbmNsdWRlL21hdGgtdmVjdG9yLWZvcnRyYW4u
aCBmcm9tIGluc3RhbGwgb2YNCj4gPiBsaWIzMi1saWJjNi1kZXYtMi4zOStnaXQwKzMxMmUxNTk2
MjYtcjAuYXJtdjdhaGZfbmVvbiBjb25mbGljdHMgd2l0aA0KPiA+IGZpbGUgZnJvbSBwYWNrYWdl
IGxpYmM2LWRldi0yLjM5K2dpdDArMzEyZTE1OTYyNi1yMC5hYXJjaDY0DQo+ID4NCj4gPiBUaGUg
ZGlmZmVyZW5jZSBvZiBtYXRoLXZlY3Rvci1mb3J0cmFuLmggYmV0d2VlbiAzMmJpdCBhbmQgNjRi
aXQgaXMgYXMNCj4gPiB0aGUgZm9sbG93aW5nOg0KPiA+DQo+ID4gLS0tDQo+IHRtcC93b3JrL2Fh
cmNoNjQtbGludXgvZ2xpYmMvMi4zOStnaXQvaW1hZ2UvdXNyL2luY2x1ZGUvZmluY2x1ZGUvbWF0
aC12ZWN0bw0KPiByLWZvcnRyYW4uaCAgICAyMDI0LTAyLTI2IDAzOjQxOjU5LjU2MDAwMDAwMCAr
MDAwMA0KPiA+ICsrKyB0bXAvd29yay9hcm12N2FoZi1uZW9uLXhtbGxpYjMyLWxpbnV4LWdudWVh
YmkvbGliMzItZ2xpYmMvMi4zOStnaXQNCj4gPiArKysgL2ltYWdlL3Vzci9pbmNsdWRlL2ZpbmNs
dWRlL21hdGgtdmVjdG9yLWZvcnRyYW4uaCAyMDI0LTAyLTI2DQo+ID4gKysrIDAyOjIyOjI4LjU5
MjAwMDAwMCArMDAwMA0KPiA+IEBAIC0xNSwzMyArMTUsNSBAQA0KPiA+ICAhICAgWW91IHNob3Vs
ZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYw0K
PiA+ICAhICAgTGljZW5zZSBhbG9uZyB3aXRoIHRoZSBHTlUgQyBMaWJyYXJ5OyBpZiBub3QsIHNl
ZQ0KPiA+ICAhICAgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4NCj4gPiAtIUdDQyQg
YnVpbHRpbiAoYWNvcykgYXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0
aW4NCj4gPiAoYWNvc2YpIGF0dHJpYnV0ZXMgc2ltZCAobm90aW5icmFuY2gpIC0hR0NDJCBidWls
dGluIChhc2luKSBhdHRyaWJ1dGVzDQo+ID4gc2ltZCAobm90aW5icmFuY2gpIC0hR0NDJCBidWls
dGluIChhc2luZikgYXR0cmlidXRlcyBzaW1kDQo+ID4gKG5vdGluYnJhbmNoKSAtIUdDQyQgYnVp
bHRpbiAoYXRhbikgYXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkNCj4gPiAtIUdDQyQgYnVp
bHRpbiAoYXRhbmYpIGF0dHJpYnV0ZXMgc2ltZCAobm90aW5icmFuY2gpIC0hR0NDJCBidWlsdGlu
DQo+ID4gKGF0YW4yKSBhdHRyaWJ1dGVzIHNpbWQgKG5vdGluYnJhbmNoKSAtIUdDQyQgYnVpbHRp
biAoYXRhbjJmKQ0KPiA+IGF0dHJpYnV0ZXMgc2ltZCAobm90aW5icmFuY2gpIC0hR0NDJCBidWls
dGluIChjb3MpIGF0dHJpYnV0ZXMgc2ltZA0KPiA+IChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0
aW4gKGNvc2YpIGF0dHJpYnV0ZXMgc2ltZCAobm90aW5icmFuY2gpDQo+ID4gLSFHQ0MkIGJ1aWx0
aW4gKGV4cCkgYXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0aW4NCj4g
PiAoZXhwZikgYXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0aW4gKGV4
cDEwKSBhdHRyaWJ1dGVzDQo+ID4gc2ltZCAobm90aW5icmFuY2gpIC0hR0NDJCBidWlsdGluIChl
eHAxMGYpIGF0dHJpYnV0ZXMgc2ltZA0KPiA+IChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0aW4g
KGV4cDIpIGF0dHJpYnV0ZXMgc2ltZCAobm90aW5icmFuY2gpDQo+ID4gLSFHQ0MkIGJ1aWx0aW4g
KGV4cDJmKSBhdHRyaWJ1dGVzIHNpbWQgKG5vdGluYnJhbmNoKSAtIUdDQyQgYnVpbHRpbg0KPiA+
IChleHBtMSkgYXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0aW4gKGV4
cG0xZikNCj4gPiBhdHRyaWJ1dGVzIHNpbWQgKG5vdGluYnJhbmNoKSAtIUdDQyQgYnVpbHRpbiAo
bG9nKSBhdHRyaWJ1dGVzIHNpbWQNCj4gPiAobm90aW5icmFuY2gpIC0hR0NDJCBidWlsdGluIChs
b2dmKSBhdHRyaWJ1dGVzIHNpbWQgKG5vdGluYnJhbmNoKQ0KPiA+IC0hR0NDJCBidWlsdGluIChs
b2cxMCkgYXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0aW4NCj4gPiAo
bG9nMTBmKSBhdHRyaWJ1dGVzIHNpbWQgKG5vdGluYnJhbmNoKSAtIUdDQyQgYnVpbHRpbiAobG9n
MXApDQo+ID4gYXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0aW4gKGxv
ZzFwZikgYXR0cmlidXRlcyBzaW1kDQo+ID4gKG5vdGluYnJhbmNoKSAtIUdDQyQgYnVpbHRpbiAo
bG9nMikgYXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkNCj4gPiAtIUdDQyQgYnVpbHRpbiAo
bG9nMmYpIGF0dHJpYnV0ZXMgc2ltZCAobm90aW5icmFuY2gpIC0hR0NDJCBidWlsdGluDQo+ID4g
KHNpbikgYXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0aW4gKHNpbmYp
IGF0dHJpYnV0ZXMNCj4gPiBzaW1kIChub3RpbmJyYW5jaCkgLSFHQ0MkIGJ1aWx0aW4gKHRhbikg
YXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkNCj4gPiAtIUdDQyQgYnVpbHRpbiAodGFuZikg
YXR0cmlidXRlcyBzaW1kIChub3RpbmJyYW5jaCkNCj4gPiArDQo+ID4gKyEgTm8gU0lNRCBtYXRo
IGZ1bmN0aW9ucyBhcmUgYXZhaWxhYmxlIGZvciB0aGlzIHBsYXRmb3JtLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0K
PiA+ICBtZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy1wYWNrYWdlLmluYyB8IDEgKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy1wYWNrYWdlLmluYw0KPiA+IGIvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYmMvZ2xpYmMtcGFja2FnZS5pbmMNCj4gPiBpbmRleCAxZWY5ODdiZTBhLi4x
OWViN2FmYTgxIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJj
LXBhY2thZ2UuaW5jDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtcGFj
a2FnZS5pbmMNCj4gPiBAQCAtMTY3LDYgKzE2Nyw3IEBAIGRvX2luc3RhbGxfYXJtbXVsdGlsaWIg
KCkgew0KPiA+ICAgICAgICAgb2VfbXVsdGlsaWJfaGVhZGVyIGZwdV9jb250cm9sLmggZ251L2xp
Yi1uYW1lcy5oIGdudS9zdHVicy5oDQo+ID4gaWVlZTc1NC5oDQo+ID4NCj4gPiAgICAgICAgIG9l
X211bHRpbGliX2hlYWRlciBzeXMvZWxmLmggc3lzL3Byb2Nmcy5oIHN5cy9wdHJhY2UuaA0KPiA+
IHN5cy91Y29udGV4dC5oIHN5cy91c2VyLmgNCj4gPiArICAgICAgIG9lX211bHRpbGliX2hlYWRl
ciBmaW5jbHVkZS9tYXRoLXZlY3Rvci1mb3J0cmFuLmgNCj4gPiAgfQ0KPiA+DQo+ID4NCj4gPiAt
LQ0KPiA+IDIuMzQuMQ0KPiA+DQo+ID4NCj4gPg0KPiA+DQo=

