Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81760C3DA79
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 01:47:41 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web11.1489.1705369654956132234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 17:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=bCfmv7dZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.152.246, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1705369655; x=1736905655;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Bkm+OEnRvlJECxTR6r7ViZ+l3T/SuY1WCbg8nCpNqVE=;
  b=bCfmv7dZid+m84BWDmTu/cYxTB3jsHGEstLeT8TveKEL+o9s3RMFv6v+
   Gw5fJ7JHaSM/97veY9mcbqXgCEL5njENu7QQiR6Q6h9vCaihO9Xenq+hj
   x8XUd+YEre4PafzP3+ch7xzkKP7J/MUq9HsGJJidSKs1EFCPpDTKfr7YJ
   kocaPJfppnLVfOFajnNW6HkR5wUQvQlWT8Eqff0kv5SJpo3aRnFYlDWeg
   cRo+MJ9r7sU/giPZRtebT2pymYROo8JIa91LQWZV6W9XbRXTmVHhChWMK
   XrkJS5jEPBvri91VggdL4yBjmSi4cXcYHhKHGeIQEu0+CR4DcjO0MGMxq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="19219360"
X-IronPort-AV: E=Sophos;i="6.04,197,1695654000"; 
   d="scan'208";a="19219360"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 10:47:29 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jczcUfgZwSLlLiJi8WT0XlpawY4QEiYZk9R/BmI0ViACpfkMoMew4zCL/6IQF9ee6wFPmDHV/QUIjSnxblUITa0BPxYC+7rfzOm/qa/faUTxGw1cEAzvwmb42zY/xj0B9tZqv1r9tq53whWb3hyp/uL6N8XxBHBZyyAswqiP4GeDajFyAxVAoxshyKzh0ygyvKaOU5kia7V6w5oFgsb9Q3K8ei9vUeoV81VlQPjH/nCZn2LpgmhJyw1X7pPnPU3PC4gSZxSYCQR54DVwRY+pdiwibOGkxluV5+tBll87okGlPMkCzZPVkn0Rh1IqRdoNL3ad77Ssk0EHiEwLAmNNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJ2BQDDSTIaAatuzER49tg9zKRyV4JtqzLaomWv3EXM=;
 b=NO8XL8WN5h1o5nJqUC9395T4lBVH2KaB1MRnpxkkgNmOy3VLIqyxxecyXnonuWfHAlv0XplseYwEDnaiAa6RhnYnFDMbxlXYgP0zBthp0/whEsNkiusSxPibpOHB+O2Bdc8b9FWDYMyGz1wjs8ZH1MnCURF8GPfBegapX95pOliZPFkJ1axdwrdrAHWiYQ5GcqFre4Se6AmWaNk8vRVm30Sl+6jKOS7KnhDPB7lXdrGvPMl8fwyL11Gm6LVZ+UAxyTOku2j5CyjTI7tSE2bo4+KnUYUzkwq8ECtv5gQwMgvSXkWi3/ljoUZKZOjMXq9O5ujGysxQ8X81K34eZCHgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11788.jpnprd01.prod.outlook.com (2603:1096:400:407::5)
 by TYYPR01MB8232.jpnprd01.prod.outlook.com (2603:1096:400:fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.19; Tue, 16 Jan
 2024 01:47:25 +0000
Received: from TY3PR01MB11788.jpnprd01.prod.outlook.com
 ([fe80::900a:7ef4:82:25c9]) by TY3PR01MB11788.jpnprd01.prod.outlook.com
 ([fe80::900a:7ef4:82:25c9%4]) with mapi id 15.20.7202.020; Tue, 16 Jan 2024
 01:47:25 +0000
From: "Shinji Matsunaga (Fujitsu)" <shin.matsunaga@fujitsu.com>
To: "'ross.burton@arm.com'" <ross.burton@arm.com>
CC: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] Revert "cve-check: Modify judgment processing using "="
 in version comparison"
Thread-Topic: [PATCH] Revert "cve-check: Modify judgment processing using "="
 in version comparison"
Thread-Index: AQHaJ58f8tlOZjRcwUSIZSE/nUGKxLC+En4ggB3Vv6A=
Date: Tue, 16 Jan 2024 01:47:25 +0000
Message-ID: 
 <TY3PR01MB11788074557F62300C5551E1892732@TY3PR01MB11788.jpnprd01.prod.outlook.com>
References: <20231205171839.1693642-1-ross.burton@arm.com>
 <TY2PR01MB3289D3B71F809070F9056935929EA@TY2PR01MB3289.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY2PR01MB3289D3B71F809070F9056935929EA@TY2PR01MB3289.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9M2RjYjIwNDQtZDMxMS00NzEyLWI0OTktZDgw?=
 =?iso-2022-jp?B?ZDJhMGNmOTAzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjMtMTItMjhUMDE6NTU6MDFaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11788:EE_|TYYPR01MB8232:EE_
x-ms-office365-filtering-correlation-id: 01da2c8b-8b82-4958-a87e-08dc16351734
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lLdJEXxw+aTOm8n6I8ISpIx/c3Nt1Qwu4HcyDG6Wem+uUF/wWHK0pMC0qzGkMoIJ7xkhuFpAw4Mp+aH8EbxBDYnpCdBwQeHS+tA9f/tu8NvemN7f8pQUf/fMJ8ThUV6JXoat+OFm1XEvhS75w+ucoMwIbzqBWJErJbrWAjsDhbXYXYq22xP2g1fx1QgH/2uVSTpLP59evQoUsIp0WAZGFpf433fysD0RfeEb1Ypro15bbzjLTHFmOnVSZSVYM+pH3GMz/QK8XbyYmA2YNBerQ5N9Av/oNYCO/kD9MzVRSp8Rccfo3vqk1WMHUBzY085jKTbYn+S+DY4mDW0IjLFzqsQZdNmd2D6qNyWMJZjwxpAG+skSQ1MVnBsmHjwgkBR8KLOdce2Q1LFSiYyyepVjUCDyY2NH9DGhc6WWpSmEfXAoQHIgcPK67Yr1VXLegvDOwEqgacC/0xPrwm10cRht4LsrstOSiHwuhHIFoLF6s+/yU9DZlM9bR007p5SGbq10JsO73vfi1yXPfUSTiZVZ3w2dC9qMGcKbnuGvYyA7lP168jLteiBMDH525SYPL5g2almDUa2rnaN2vxICAHX2+8N2xgF1DGn6nE83zmpaxd7xB29KGkoRM0+bqnS9J+2WuJBkvkhk/A3RuAeeKECsZfdxEin8/cfJi9ktZZSq8b2sa+yfXhw6t+G9VzdUp40c+ATcBipFdKo+PTUWnpTRhg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11788.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(1590799021)(64100799003)(451199024)(186009)(2906002)(52536014)(8676002)(8936002)(5660300002)(76116006)(7696005)(6506007)(9686003)(71200400001)(66946007)(53546011)(64756008)(66446008)(66476007)(66556008)(6916009)(316002)(478600001)(4326008)(41300700001)(1580799018)(86362001)(122000001)(82960400001)(33656002)(38100700002)(26005)(38070700009)(55016003)(85182001)(83380400001)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?Q2NyQTI5UWIrUWVSblhWeWM1NHFESTN2RnArZFZ4c0VhWGpCMmYwQ3JF?=
 =?iso-2022-jp?B?cnd0Z2dZQnQ0bFZwQjVoRHJLeVBZdzlXUTV0TWhQYmQ4MkQxdkpvRU04?=
 =?iso-2022-jp?B?a056L1QrcHFudnMvbWlJejJrTC9WNS9La09NcXg4QXBXS3hQL3EwZFZh?=
 =?iso-2022-jp?B?Y05ZVnJXcjYyaFp4Qm1DVVlkRS93N096TG5tTEpzY0JvVjVmQzdsK0Q0?=
 =?iso-2022-jp?B?MGZUclREcWlOZUhseE1QZ05SWkpDVWlYb1NBOTdtQ1FUUDVSTmRrSWtS?=
 =?iso-2022-jp?B?OWN1WDFvbmd2VHFjRWVGU3o3dUs0ZzBWSUI5dmhwZjk3SHdtd1pDTWN5?=
 =?iso-2022-jp?B?N2YxblpzaFQ0ZG00blRKWTdnOXEvVzRSZU12UVdJaXpHd3hZbktMakpM?=
 =?iso-2022-jp?B?QktnV1ErMGVDSDBYcnRZWUxzSzVYNE5mdzdsL08wdEZJOHZYcngyYko2?=
 =?iso-2022-jp?B?czhXRVovMDRPZFhJSHFXOERzZzNuNUdYQjBWRWVqOERlVW9tRTUwblN6?=
 =?iso-2022-jp?B?dGRxQ3hCNHpCVzh1a3IrRkhQdmpKWlpWL0lqVHpMVGlIN29LMStDRExU?=
 =?iso-2022-jp?B?OU83dEZyTTh3R1ZZWDFuQjlqSk9ySDZqT1pLeE5XZU5SOU8rS01QZ005?=
 =?iso-2022-jp?B?SmR6QVFla2xDTUN2dkFuSXYzNndkanRkNXFsUkhoWCtHNlhvc2s3dHRD?=
 =?iso-2022-jp?B?eDFJblhmcnFHcnVDRmhIejdONXc4Qm13VW1ZSmxYaTg3VEZzZjhzaUZY?=
 =?iso-2022-jp?B?TnNMV2tmQTRKa1F1eFNMcGZudnlzZUZ6ck9neWxQb3cveXVpMkdXVWlE?=
 =?iso-2022-jp?B?LzgrVHBGQ2VySEUvblpSbHZsb05odW1BVUxmbHl4MkhZaHlNS0Zwemll?=
 =?iso-2022-jp?B?OU93VFJNZHVtMUxsSUxYT1AvZG9mZjFRNmxxa280TStGam0wbzZuQmpQ?=
 =?iso-2022-jp?B?RTFQZjNwdXpFMFRDR2Uxb0VoeEU0UnZmalZkZUJNU3BFSVhxMW1EZnov?=
 =?iso-2022-jp?B?dWZUTHBGb0c0K0pRaVpuVlIySzBsaWw2VHRYRW41dW9UQWd4QlQzTk9j?=
 =?iso-2022-jp?B?UnB6K2pGQ3JVZitIcC9zdnBRTFFrSklyVTNMOE5PSngvZHdmZjdyMW1t?=
 =?iso-2022-jp?B?cUVRNGo5a1VPT21EaE5nTXZNTGFrTWFOenBwdDhPalZYTmVqREFMU0hP?=
 =?iso-2022-jp?B?YS81Mkw3NFQyRkJ5enRBUi9mVUNRYUxyM2xxUHJpeS9ZVGVQVzhzcmJM?=
 =?iso-2022-jp?B?Q21kZ2RJbFd3VzZWNDAraExwODZ0dzYvRGdjSURUY2FvRXBRRUpjSWlG?=
 =?iso-2022-jp?B?OFVaSWpyTnZjK1BMRUVVWUh2NTVRdzc2Wmx3YkllOThGb0FxMjJZL2ha?=
 =?iso-2022-jp?B?cGQyR3RIUlMweVhRK2phTlNVL21aWmFJUlFhbDdSN2RhN1gzRDY2UjF1?=
 =?iso-2022-jp?B?bHVhZ1huaWNQazRLbjJJZ1ZCRXNuVmlxMUVwaURqRnk4c2dwQ3R5a1hy?=
 =?iso-2022-jp?B?OUw5QTRPSjRkd1ZMM1JSOUJ6eDE3aWlzakl5L25JZFE2RkhhSEN6c2RR?=
 =?iso-2022-jp?B?YzN6SGttTnQwSnFiaEp1TVlYeDVJOExQeDVaVnFIdDhEUU0rdVdCMTB1?=
 =?iso-2022-jp?B?eUQ4SThNQlFIVGNwQXFmSjNpNGZuOUZrQ1hDWWNFTkRCdW13SmtYT1Jj?=
 =?iso-2022-jp?B?MExJOGVPcTRvZVRnZUxEdUt1VXR4S1dzZ2ZMVTcvTVd3N3h4ZU80OG5u?=
 =?iso-2022-jp?B?R0FhVmIzVkhtMm9UMkhKa0xpNWMxZjBOOXlHZm1GandCVEJoSzRmYVZp?=
 =?iso-2022-jp?B?N1JKb29jQWFIMUJNeDZZT0M4RUtydXpzaFllZHhXNHU0TXdZejAxUWpQ?=
 =?iso-2022-jp?B?NTdsWmJmaUZPZElNTnVYR0Jxck84Q29CaHhTVTAxVndHYnJjK283bEJ0?=
 =?iso-2022-jp?B?Mmx5M0VlSFZvOE1zd0lpRDlzcXljRkRtSXJobkNxNGlPT2k4ZHZkRUJX?=
 =?iso-2022-jp?B?MmRLKytYNDJRMDhsWFkxVWNnc0dJU1pnZWtlUVhiaDEvUU56eS93b2x0?=
 =?iso-2022-jp?B?cUNpODdtSWgxMjRqbmcrNTN0QkZNN0ZWZ0w0ZWVYU1AvTjlVdVRyVWty?=
 =?iso-2022-jp?B?Y0JETzRjMERCSUxBVE12aHpjblJKUHMyTGloV0x6L3NhRkM1NUhJbWNO?=
 =?iso-2022-jp?B?cHNhck0xeWNLREhlZldjNkFvaVlmaEdtcXplUEhJZGpLbExETjlIOU5p?=
 =?iso-2022-jp?B?blNXNlR1bnc4K3dBWXVkc2RWemF4L3c2c0hrZWVIblJjaUVwdkRZY1NK?=
 =?iso-2022-jp?B?bnZwcE5Xb3FOVUFudGNsY1Z2WTE1aWhNVUE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	F/GCd82NAyMuUn6MyuwdM+TydVl81grn0DYijAaeF6MCgy7FD9Y8wZJCx8q4KAzHlHloVhmsNFn/mY6qxzD/nlBEymT+U+xmqPWHrbmWWtzEBYUvfhfxgdxOsrKjqSRNcM3roKmNL+grc/HlXo6X0itg+/BGoXRMfBL1GCmF2dQYnLFS8MfIHf3sbq6+Ukpmw4jmKTvT0+jU6hOFbNuMBdKnr3RIPNsT1d/aqnm4omRQvNU2UYm7GKtcf6MAFVTteFDiVZ409d7sN0WsPN8l8eEqjzKiOkcd9THQQrBLvhsVHtAuD9nl+S0Vxg/4obmWhTYINpxZBjboAG62ZM2ds408fJ96fc5ofZ45jJMuMLnw+BkxbyzoMqzn8wjXhWgW4LRhTmI52P2Gndswb+2ouhdgG0acTFm7LnEiJQeAFg4YK43gHCK5VTHauR4aA14hsknxZcX2CBrzTK70JLkpBZfeeEkXaDo+QArR4QKeB/vBO4HNy7z/AtROz3h+rmR4Lfv3Wp8nM8GgtJY9Di4ALdhWEkbNuZXfbv0NvyeCbWorsAA0JDMm68YPdICS6YrZRfAXYEVy3wZeKtGj04Mrym6/+rrWTq8S63yQsIKYOL0ZLjOe7rG4RQzua6II4LZR
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11788.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01da2c8b-8b82-4958-a87e-08dc16351734
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 01:47:25.7667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOEA+sodJwW+JpgzeVdst1mxNADFOqFgQSiVXSWKq211XTqBt9EsctjnzrSs0URj0gnLmb62IAw9SZSwyW3MoIc0FPc2JvGHCFHkbvlUMG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8232
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 01:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193808

Hi, Ross,

What do you think about the following?

Regards,
Shinji

-----Original Message-----
From: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B=20
Sent: Thursday, December 28, 2023 10:59 AM
To: 'ross.burton@arm.com' <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: RE: [PATCH] Revert "cve-check: Modify judgment processing using "=
=3D" in version comparison"

Hi, Ross,

What does "too common an issue" mean?
Is it okay to ignore the misjudgment by the following cases?

e.g. PV =3D "1.2.0" and Vulnerabilities Affected Versions (registered with =
NVD) =3D "1.2"

Regards,
Shinji

-----Original Message-----
From: ross.burton@arm.com <ross.burton@arm.com>=20
Sent: Wednesday, December 6, 2023 2:19 AM
To: openembedded-core@lists.openembedded.org
Cc: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B <shin.matsunaga@fujitsu=
.com>
Subject: [PATCH] Revert "cve-check: Modify judgment processing using "=3D" =
in version comparison"

From: Ross Burton <ross.burton@arm.com>

This change introduced a warning if version comparisons failed, but this is=
 far too common an issue in data that we don't control, so this shouldn't c=
ause a warning:

WARNING: automake-native-1.16.5-r0 do_cve_check: automake: Failed to compar=
e 1.16.5 =3D branch_1-9 for CVE-2009-4029
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m1 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m2 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m3 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m4\/m5 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m1 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m2 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m3 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m4\/m5 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m1 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m2 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m3 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m4\/m5 for CVE-2011-0715
WARNING: automake-1.16.5-r0 do_cve_check: automake: Failed to compare 1.16.=
5 =3D branch_1-9 for CVE-2009-4029
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2003-0577
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2004-0982
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2004-1284
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2006-3355
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2009-1301
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2009-1301

This reverts commit a1989e4197178c2431ceca499e0b4876b233b131.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s index 086d87687f4..5191d043030 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -375,7 +375,6 @@ def check_cves(d, patched_cves):
                         try:
                             vulnerable_start =3D  (operator_start =3D=3D '=
>=3D' and Version(pv,suffix) >=3D Version(version_start,suffix))
                             vulnerable_start |=3D (operator_start =3D=3D '=
>' and Version(pv,suffix) > Version(version_start,suffix))
-                            vulnerable_start |=3D (operator_start =3D=3D '=
=3D' and Version(pv,suffix) =3D=3D Version(version_start,suffix))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s=
" %
                                     (product, pv, operator_start, version_=
start, cve))
--
2.34.1


