Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0958CC64ED6
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 01:41:06 +0000 (UTC)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
 by mx.groups.io with SMTP id smtpd.web10.7776.1677202858586995114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 17:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=QdVaho86;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.245, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1677202859; x=1708738859;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AxRS71+JJVmI9r4SJMR9Oyih8TIJj3tr7W60y9JUX0g=;
  b=QdVaho86r2sQB2L2OaYUzP4aQlhVnuAXdHmoASVU9HwRigU+4JWAdz+c
   0U+ZwVrvDUT3xBWM86pcM27m79NcH8sO3VCaL/pERp2i6MN1nZHv142Bb
   6IAELTzENgStBmeRiDAIpaD3H4UOhaxh3sSE/v0s+VEfYlwZEOcL0L47K
   8gqwX93EUZNmEXvBeygtjGdLaXgjfO8sN0F4kWbp+LthoL3LyUitGy1cc
   BgpRwTu9INM8NqCou4LoqSuqzmTmxmGEYye/rSFtkZuAwRnjvKvVYC7RJ
   NlsZVjP7jipl2ZYZoZKwg5ke0Qcpb0rL2K2IyUwJuiVKGMZ2F2GhRxTTZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="85970538"
X-IronPort-AV: E=Sophos;i="5.97,322,1669042800"; 
   d="scan'208";a="85970538"
Received: from mail-os0jpn01lp2111.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.111])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 10:40:56 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAkCM9NBqCEQpH7hMBI47AnMYKV6TRRDRZS8NbwaQok+Lcb0VQxRxMvettcnBTL4Y0ecT1nDYyoYgAYxmUXl8hX345LZZSiBbgkg1AAfZ8zjwqclFHiUInuWYppqh8D7K/elLx70qxefDIQj63ApE/oI6pLppC38sRsfsTdl1XRB1LYjLIODypG8lMUpjiN+BQ5aN08+MX8nCnolQlucfL1OAl0t7wC8oo4gR6jZA+cTa78fZDBRc1Ci0OaXn2+wy3XeQ0sijjPmzPJ2hJboTInhwnv10nj1s4BP1Lzirfu+lH5GX266/wH10E1xNHCTz/E3OYT3sci7l3oSBPm6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxRS71+JJVmI9r4SJMR9Oyih8TIJj3tr7W60y9JUX0g=;
 b=VHdulJ41pBOIQZcatny6mWPSf7d6+6QxzlmLFRjj8MTGXnL+UTYCjFK4Nd0djabxRtfvXY+aPVmyqPXV4Od5hPmjIsA4gT8kuubqqG36cYrrTvfcR9P15AAcYS7CSKA4wbRlOoTRG3V5yftdXu9QEZyshNSHJQaU8jxtvqCNMNEDJHIv28BPghKmupeQ7bDLqaCZkNyUK4H9A6HZqvlASnpyPPxwfHbf2aQaHpm1JWhTUhyZJWAgEpaH0FfcWh/a+jMIPjr/GW2sKsHyUbbVvtT1/e4Wd7o2VVrhy7LCf32eFl+kxvH2HxyxGy79wS0Do5k62uyujgjq5D6uFL3tkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OS3PR01MB5751.jpnprd01.prod.outlook.com (2603:1096:604:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 01:40:52 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::5517:58b6:8c62:d968]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::5517:58b6:8c62:d968%9]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 01:40:52 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
Thread-Topic: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
Thread-Index: AQHZPSI3fGqjRabvj0Ca1CFuEiNlHK7HzJ4AgBWV54A=
Date: Fri, 24 Feb 2023 01:40:52 +0000
Message-ID: 
 <OS0PR01MB6178EE320C1E4539CFF5E1D5A0A89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj9LYjUbmyRy8q52H-7RgEx_tr4Uz0BRUSUBMVmHRzhS0w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9LYjUbmyRy8q52H-7RgEx_tr4Uz0BRUSUBMVmHRzhS0w@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9OWVhMjFlZTAtY2JkOS00NmQ0LTljN2QtNTM4MmEwZmE4?=
 =?utf-8?B?YzY5O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMi0yNFQwMToyMjowMFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|OS3PR01MB5751:EE_
x-ms-office365-filtering-correlation-id: d140a237-767c-44d6-3810-08db16082a5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XLIk9GlJbzxp7Tlgra3kPJXpM+bRKw0ljtxlYvBJFogTYodqA9tn1T98pDHN9HymTl/Jc5r9QgWMerWTZaRa/7fQnD4odOkNmo4jsD1cySyYGjStdzGFH7gHzeMm/L5gaLzIreiIIWtwzN4ds94hqSyHok5bFeJNEep0I5LTju8/4hxi+c/5CCHDOpPNEGUwYxRELMNosVbxDeBlmNcWb72M+84t3+QIoAY0QhDWLrhitMkArGGHjz7Y0TQqnq9Qnf/RamLFCnlQsNe3jQ7cp32mFdDeNUIGseQtcPkjeC/bvtVFEcu89EchNA9+U4eW5SdIaqJHjnuzJHG9BuuXc3S0ZgennIUedhDjpd0YoBrMTygh24GSrG4PXv6kWurSRpS8zCm4TgPEluV+2L3ya0MGAZpZMeu0Zn38fiuXCBPkWfwQcyqlA4C//gw0QSNOiM6IydpUM6+bDshQ6kIylkzSLysYxZkpMkmj7Q8+KS90d6HzNOmmCWsgso1B86qYLABn3hU948xmmIuaDSBl/ew+6ZMlbnGe5R996LIToDxpCqbGrGLlBwoKlrwZzsob+sIQ4NI24iKxAaW0V9jU2EczzW2WtEkbDJl4FDhyvY8sgXz1p6injFC9MxtAcOCDtVIrVzkdcu5hFhXiy8LFgyvWYWUjjdUFox1NwVCpxhjnyzMzuu1kGQ+luON8ujq5s5fLiQX/vPzXZK7jnWlNjJY/YBN7vSQTBEadfi5f33tinVfsbF3stNFU8EoiVzEj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199018)(1590799015)(86362001)(1580799012)(38070700005)(85182001)(55016003)(33656002)(76116006)(316002)(66476007)(66946007)(41300700001)(66446008)(66556008)(53546011)(64756008)(4326008)(8676002)(6916009)(966005)(6506007)(26005)(478600001)(66899018)(7696005)(71200400001)(9686003)(186003)(122000001)(82960400001)(38100700002)(5660300002)(52536014)(83380400001)(8936002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Mm1HMHlXQUNmRVdHNUFnVXQzNHNyWFYwbXkxSGVlcG8wTklUdmJXUUdoOE4w?=
 =?utf-8?B?dHJIbGwxcW0rNTZXQXR6emZLVlBCQmJ4UmlFS2YxcVFjY3g1QXpDMWYySVll?=
 =?utf-8?B?d1h6T0xaM2lIQVU1RHk3NTBjRUdwNXEyekwvem9LZHhCWnJLNm04ZlpicmRE?=
 =?utf-8?B?b3E3RlBnM3N4VEdROW9xMXNuSjRpNTY3NlZGdlBETG1jcXZWcU1QZlZrOGtj?=
 =?utf-8?B?TCtCTFFBajZsUlYrYUw5azlaQUpyakxWaXRINXdTNzdGcktXYnQvK3J5WDhI?=
 =?utf-8?B?NGRZRG16MGIzRlZQeldmaE55QmtHWTZQeGNXVEl3L3dlMTFNUFJYQ1cvYVlL?=
 =?utf-8?B?blhLd0FKT2JPanNOZzFZbFhJUlM1b25OamdqY3Z6Qm84cGlGR3BhUXRBZzNi?=
 =?utf-8?B?WXRaMkRJSE5VcEg0bVo4bEgwWi9BaHc3T1JaSGdlVm0veUVGYUNod0QrUnk1?=
 =?utf-8?B?aGd1c1F6VnRiMW5SVEpsdnBXNjRuNVVNRjVMdVhtcU1QZVhsdTM0ZjhxWEhW?=
 =?utf-8?B?NXVQSmMrUThnTjNQbFdvQnl5dmFjd0N4blRITlkrWDBjdnNsQk5hNi9od0lT?=
 =?utf-8?B?THVsRmpib1lHbEQyUXE1MHdva3NobWlCck9tdE5PWHFOTlI0VUxHZGZnWHZC?=
 =?utf-8?B?NnliZ2NKeGhMemI0aXhMd25ncHIwYXBzWUJlZW5hd0lXWUhyd0R0L3FRN1Vw?=
 =?utf-8?B?dnRIS0tHU3ljUXptTnJRRWcvSTZWWjZ1eko5RWtuZjBaZ2NMR0kxbGVWVm81?=
 =?utf-8?B?Vjk0cGprVjY0dkFiUkYwbEFvUlR5Q2lheGZ6ekFoWkVmcEZGN25oVFVkZHVi?=
 =?utf-8?B?VkxBMHEwODJ3ekVVR2RnZTVIcVFBbWd1VE1aZFF1UnpFMmNaYlRDMDBmeEJV?=
 =?utf-8?B?UVpvck9oZjdaNzVtN3FtWGpUalpkSjltblJheXUxMVFwV1FQUGNUQ2wzYmx6?=
 =?utf-8?B?Q2xDbkxHRDhjY3dLTXhHQ0JXQnpraU5YQUk0YlNMcXpGK1M4dFlhQ3hMcmRF?=
 =?utf-8?B?c242a1hqeUlpQTVtTm5DSEIzS29NcXdkVzI0R2NVNWxWMFlIdWg0dE1Jd1dX?=
 =?utf-8?B?WlhGSEVpVSt1Tzdxdi9ndVZCQWkxRm1HalphNVNDc1ppM3RoQ2NMRlpTNkpT?=
 =?utf-8?B?Nm1PeFY1MzNiSEZCZmNlcUFkeUs2M3lHME9yZ3JPaGZycmVJWUlDbDUxUE5H?=
 =?utf-8?B?bndiL0hGU3NsUHdkTFlvUmJXbzA5N2g2ekd3YWNFTzQ0d3V1aHVaV3hKMWtl?=
 =?utf-8?B?QXA0cU9DRmRhYjlZSWZwdEJUTy9zSEhPWFdXSFh4elliUkJjUnpuWGxnSGZC?=
 =?utf-8?B?UWZvdVJaN2RYS2J5YjF3S2FWd2Y5c3NQSHoxSlJ5cS9DWjRCS293clBIN3gz?=
 =?utf-8?B?a292YjFuT0pGd3dGTCtCUjNHZGZERG1qVUpTdEszMTE1WE1hT1k1WGd2Wnhi?=
 =?utf-8?B?U3J0WGF4cUdlWmN5TjVmZmthQW85SExOMjk5MzJrV3BQTUhPUXZCL3dtYzN4?=
 =?utf-8?B?YXdTclBZcWZsbERTVitxU1NVaGZUekx5OElNbDc4WUVnUWJ0bHdNRW5ockE1?=
 =?utf-8?B?djRUOWtXb2pQM3BCanUyTVQrRDV4Ukc1NXFBdThQa01JTStwa3AvU0crYzdS?=
 =?utf-8?B?QTBSd0ZvMFpoRXlpL2RsYy9PRStTVm44ODdwZEgxSnhQV3hteGo1dy9NUHZi?=
 =?utf-8?B?bURFZWVQb3hmZFlzYitvb0RQbUZadG5xNG5GeXFjWmt2dk82UTIwbkIxTTdY?=
 =?utf-8?B?aU5YbGFPT0JtZjU4cG5Uc2VGNFhnOFlMaTFzcjJuMHJBY0hlWkdNRHVjcytU?=
 =?utf-8?B?WjMyTi9oUkY5bVVjVlNVZ2ljZTlpbHZCQUxDUllmd0hwejRrd3Q1V3IyL3lY?=
 =?utf-8?B?bnFieEdKWGRRN3RWVW1tTzFHdkpSdlhTNk0rOFBGSEc2SHZGb1dneEpaYTZX?=
 =?utf-8?B?MWdzZVFSODVCQSswRTVESENjWnprdzlvdmN2eHZSWk9oQnpnR1FzZktmREdh?=
 =?utf-8?B?K3NCYzhtRnY0R2RQWk42T0NvbksraU5kdWhIQnowWlRNa3NJM1NpOHpKbitu?=
 =?utf-8?B?WjNrOXJWVFlBOGhQSDdqMmJyNVRLL3dMLzVpK0dNVXpyM1hzNUdaR1FETUVk?=
 =?utf-8?Q?3+Wi3hWZxixhz3TLEq7tX9ZeD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	J4HHk/9iFKS4kW77R0XZaLzEblWiJWn5NjBugOvCED7lpekbVJyVw1xnF158Lr2lFZSMDwaSPom+7vQn51v7axHJ3TqC77sMv1Zsv4KtAxCSRn1BLTt4bQ4ngSSRyaAc62wFmYKLxPM4216iPU7v8VKRQZc72R34ciUiPpLEP8b/Pj0dpuAuMXpUorw4o3Hl3uKL/aT7IN/zG1Tpi0h578gGiufP9Gn8bYpze9XOSJBezVRdmpXa6N4Ieiu6j9FwZJnKCoO3VStm4MwNJv1e1a5Bb81qC9Xdem9Xw6aSV3ppP3rWJ9jLXkp4a2Yw5+sifQUDkC01A2Tq/hqj6ZiQxynQQ2zy1PtWiBYfwqYcXKWJJtF7RcIC/Js/cFJdj8tDeINB/2bP2TcROieLis13UdB9UgbvTnLRP9/ubP9p3nAkD3vXAu81tfFNtedPPObqNHOt8kgVu3PIiy6HiDJG+ej9crOt+48P3TUefSs7GSzwAwABgU110D7pF3JuJd4QATT9hJiiHVrlzB2XcPmLKw7T7nugfkMAwCvzOcchzSTg1NTSG0iK2jaELPtTXlUP9g7K0NFM9N57BCDUVM1MpL9IpiLz6fQWT44NewqcyE2z2TtAuX1GyBvN+Clsz0PwFvT8Og4J1TmFDQuE4B2FYYdeGmubFoyqTc49nhyjmiy9k9GDs6eG3PzYIB7SjRAgM+ldSNAh7GmtpWrGlMVhAYhl/SPkglJfW6uPJr6OzUxlw8oq6Bn0j1uw3kXtBPq1ze0VIixN/vdBC+6B2u8av2oQunh3mfHBOKI7HHevv78rcbOoYmKxroikIwmiLkoi
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d140a237-767c-44d6-3810-08db16082a5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 01:40:52.9006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wZOotPbOrb/I6KDm3hE/e2YVVL1G8HfdwgM1vxP9NyFJTzLQVJFKhVxGO6l4/8erB6G3vLL6HNVgN2NL86qg1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 01:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177645

SGksIEFsZXgNCg0KSSdtIHNvcnJ5IGZvciBsYXRlIHJlcGx5Lg0KDQo+IElmIG5laXRoZXIgY2xp
ZW50IG5vciBzZXJ2ZXIgcGFja2FnZXMgY29udGFpbiBhbnkgZmlsZXMsIHRoZW4gd2hhdCBpcyBp
bnN0YWxsZWQ/IElzDQo+IHRoZXJlIHNvbWUgb3RoZXIgdXNlZnVsIHBhY2thZ2UgdGhhbiBuZ2h0
dHAyIHBhY2thZ2UgcHVsbHMgaW4sIG9yIGRvZXMgaXQgaXRzZWxmDQo+IGNvbnRhaW4gc29tZXRo
aW5nIHVzZWZ1bD8NCg0KSSBmb3VuZCB0aGlzIGNvbmZsaWN0aW5nIHJlcXVlc3RzIGVycm9yIHdo
ZW4gSSBhZGRlZCBuZ2h0dHAyIHBhY2thZ2UgaW50byBteSBpbWFnZSBmaWxlIGJ5IGFjY2lkZW50
LiANCkFsdGhvdWdoIHRoZXJlIGlzIG5vIGZpbGVzIGluIG5naHR0cDIgcGFja2FnZSwgaXQgaXMg
cmVhbGx5IGFuIGlzc3VlLCBpc24ndCBpdD8NCg0KTXkgcGF0Y2ggaXMganVzdCBmb2xsb3dpbmcg
dGhlIGV4aXN0aW5nIGNvZGUuIEJ1dCBtYXliZSBpdCBpcyBub3QgYSBiZXN0IHdheS4NCkhvdyBh
Ym91dCBkZWxldGVkIHRoZSBSREVQRU5EUyByZWxhdGlvbnNoaXBzIGFtb25nIG5naHR0cDIsIC1j
bGllbnQgYW5kIC1zZXJ2ZXI/DQoNCiQgY2F0IC4vbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRw
Mi9uZ2h0dHAyXzEuNTIuMC5iYg0KLi4uLi4uDQpSREVQRU5EUzoke1BOfSA9ICIke1BOfS1jbGll
bnQgKD49ICR7UFZ9KSAke1BOfS1wcm94eSAoPj0gJHtQVn0pICR7UE59LXNlcnZlciAoPj0gJHtQ
Vn0pIg0KLi4uLi4uDQoNCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAxMCwgMjAyMyAzOjQ0IFBNDQo+IFRvOiBM
ZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SF0gbmdodHRwMjogRml4IGRvX3Jvb3RmcyBlcnJvciBhcyBmb2xsb3dpbmc6DQo+IA0KPiBJZiBu
ZWl0aGVyIGNsaWVudCBub3Igc2VydmVyIHBhY2thZ2VzIGNvbnRhaW4gYW55IGZpbGVzLCB0aGVu
IHdoYXQgaXMgaW5zdGFsbGVkPyBJcw0KPiB0aGVyZSBzb21lIG90aGVyIHVzZWZ1bCBwYWNrYWdl
IHRoYW4gbmdodHRwMiBwYWNrYWdlIHB1bGxzIGluLCBvciBkb2VzIGl0IGl0c2VsZg0KPiBjb250
YWluIHNvbWV0aGluZyB1c2VmdWw/DQo+IA0KPiBBbGV4DQo+IA0KPiBPbiBGcmksIDEwIEZlYiAy
MDIzIGF0IDA4OjM1LCBsZWltYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4gd3JvdGU6DQo+
ID4NCj4gPiBQcm9ibGVtOiBjb25mbGljdGluZyByZXF1ZXN0cw0KPiA+ICAgLSBub3RoaW5nIHBy
b3ZpZGVzIG5naHR0cDItY2xpZW50ID49IDEuNTEuMCBuZWVkZWQgYnkNCj4gbmdodHRwMi0xLjUx
LjAtcjAuY29yZTJfNjQNCj4gPiAgIC0gbm90aGluZyBwcm92aWRlcyBuZ2h0dHAyLXNlcnZlciA+
PSAxLjUxLjAgbmVlZGVkIGJ5DQo+ID4gbmdodHRwMi0xLjUxLjAtcjAuY29yZTJfNjQNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4g
PiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTEuMC5i
YiB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjUxLjAu
YmINCj4gPiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjUxLjAuYmIN
Cj4gPiBpbmRleCA4ZGRiODUxZjcxLi43MmE0MzcyMjE0IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjUxLjAuYmINCj4gPiArKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS41MS4wLmJiDQo+ID4gQEAgLTI0LDYg
KzI0LDggQEAgUkRFUEVORFM6JHtQTn06Y2xhc3MtbmF0aXZlID0gIiINCj4gPiAgUkRFUEVORFM6
JHtQTn0tcHJveHkgPSAib3BlbnNzbCBweXRob24zLWNvcmUgcHl0aG9uMy1pbyBweXRob24zLXNo
ZWxsIg0KPiA+DQo+ID4gIEFMTE9XX0VNUFRZOiR7UE59ID0gIjEiDQo+ID4gK0FMTE9XX0VNUFRZ
OiR7UE59LXNlcnZlciA9ICIxIg0KPiA+ICtBTExPV19FTVBUWToke1BOfS1jbGllbnQgPSAiMSIN
Cj4gPiAgRklMRVM6JHtQTn0gPSAiIg0KPiA+ICBGSUxFUzpsaWIke0JQTn0gPSAiJHtsaWJkaXJ9
Lyoke1NPTElCU30iDQo+ID4gIEZJTEVTOiR7UE59LWNsaWVudCA9ICIke2JpbmRpcn0vaDJsb2Fk
ICR7YmluZGlyfS9uZ2h0dHAiDQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KPiA+DQo+ID4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2Vz
IHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE3Njk4Myk6DQo+
ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVz
c2FnZS8xNzY5ODMNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9tdC85Njg3MjAzNi8xNjg2NDg5DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRl
ZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4g
PiBbYWxleC5rYW5hdmluQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
PiA+DQo=

