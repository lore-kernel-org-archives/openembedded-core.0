Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B43C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 08:27:59 +0000 (UTC)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
 by mx.groups.io with SMTP id smtpd.web10.181492.1698740876035083844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 01:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=QsY4IZcT;
 spf=pass (domain: fujitsu.com, ip: 216.71.156.121, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1698740875; x=1730276875;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Nfm2cEqI7UptHIY1R8p0kIsEJOfndnxTqqp5Zp/1sNA=;
  b=QsY4IZcT46d/MJ+mih3FkGOWEhYT1J+WrncQts0+m01stC22sLL1EdWs
   5Ou4qef3qFCMY26Cc3OFzX+1U8xe3fsms1ZgEmBV6TTPg7y2/sspydbWz
   wh0tCWfGEPbCrM0gEJ1Wo9GZq4geIgffiBxWZg7v4mecMBnvuRVAkM8fN
   WmCKDDDEWUW8adQHf+MvFfA+95R2ZP+djwf0iNjAV+l9PnDHV2mbzSFJt
   SZY2Ii5SA2XlRGJR/UapFkwSg+MmQ2xUuQOXtJsgjAy4KWQ2m+vOp9LLC
   1JpDR/GuLIWV4+PELIMeQKyHErLyGj/EnvfIdWibXJQvTU9BhTtP7a3Jr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="101618764"
X-IronPort-AV: E=Sophos;i="6.03,265,1694703600"; 
   d="scan'208";a="101618764"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 17:27:52 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpgtNbdMGyVtEuJMHUFYM3n60NKKGn9gGaQ4Ms8k0YMGIEHyKnKqIk5ptkOK28AyH+qvRZsk0ZsJdO0rO/SQKel+EnKn6YnN1c6VV2B9EFs/KzCLper1LuK2tsg0mmZmO/IeiMQsPm8iBbIfvePwwYcr97MNTn2srG3E3kPVuGtZEOPSkNfgaGl4qEPrDdi1/A+7hgpIbMBjrFCuJMVcVCnL/vaKWhemHIeDxkS94PT1ULX0u47/p0pMQmry2n34apF8BNmxfAPBY4hhHSQNPYLgHjDRLqXj3EvZzb1BQ5PvD+Q5hA/m+qoQL3Hh/Xcc12/SayH5JZG58+nrsbGd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nfm2cEqI7UptHIY1R8p0kIsEJOfndnxTqqp5Zp/1sNA=;
 b=XhTY4FCLpPY6KempeUF9vKJQ0tNx+Pv0DVgipu9NXkG1uX/l/kAR2vUeb2jqqqSndscUl6RRwb3PN8R3uIVbtgpctxSj7ZGzEtdyzbzw/QSWLePSdZygOhezHjSB+9zjI+1gKroBPZahXoR0wXVsN6AfgRe0q9Yy4gUkwJmTMelSLxt5fCOEYLuRkHZjyk08/Dxl1FYtOYhZ/4L2bnReE5C4ev0DXckc/T0HC54ud1Qkba//XPdUe7/SCDvgCVHpZrs4OyjvlEVJWGew+LeEQ0CLfFHT4ue9Ly6cDef3RItvNJNEsHF6WzqcH87WgLIM0xkYZbJFENx4gHFyn/HZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com (2603:1096:604:1c8::7)
 by TYCPR01MB5645.jpnprd01.prod.outlook.com (2603:1096:400:b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Tue, 31 Oct
 2023 08:27:50 +0000
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::652b:4f70:cc35:59de]) by OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::652b:4f70:cc35:59de%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 08:27:50 +0000
From: "Tingting Qiu (Fujitsu)" <qiutt@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V5] kbd:Add ptest support
Thread-Topic: [OE-core] [PATCH V5] kbd:Add ptest support
Thread-Index: AQHaBVwQXH8DjjlSw0yzfbalUPOQYLBXOJ4AgAEdWICAAE2tAIAK9WNg
Date: Tue, 31 Oct 2023 08:27:50 +0000
Message-ID: 
 <OS3PR01MB9515FAF1056124430B410EFABAA0A@OS3PR01MB9515.jpnprd01.prod.outlook.com>
References: 
 <CANNYZj9rnOQ8BugHMLMzEGqFdHtHL+SkFmDjLvgNo8adO4VHVw@mail.gmail.com>
 <6763.1698120765303220209@lists.openembedded.org>
 <CANNYZj_sBnowv-v7XJed+irmv_hfw+QiipycWdaxmY4ZR1MYZg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_sBnowv-v7XJed+irmv_hfw+QiipycWdaxmY4ZR1MYZg@mail.gmail.com>
Accept-Language: zh-CN, en-150, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9OGIxNDBmM2EtMjRmMy00NzMwLWE3ZDUtMjMwNWZiMTY5?=
 =?utf-8?B?OWE0O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjMtMTAtMzFUMDg6MTE6MzhaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9515:EE_|TYCPR01MB5645:EE_
x-ms-office365-filtering-correlation-id: fbcdce94-c274-4787-d8b4-08dbd9eb4526
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KCTIYzwNyCy3qqgpc0q0iojdlR6+KkZ9ZjtiOppRAqAdPLIwboCIOaXA2tLlylhyvol8cJ/FPwGi9GT1svh58PbA6pJcc1aqY8FwkpKpGndZb0xvuKa5uvEffaosRQzRtryhcCYvI+4knod3lsBTtyDG2inoNZ/Ku6VVP/yeGE8pQ3qnL2oQ0qmtug4Uir7NA3TOizyFBEg9vyFNx6M9jxtjo2h0kuLpeNaDgRNiNJdsvvLOMMJYY9EnejvQFZJAD2dQukga0lLZrfGJrMcdpDxT/YAUDniIclF569pSJv/OiMUDYfcLgZfUzatYCLO7DRv6B198hB2a7pQ8oQhn7EiRZGaaPMZGTjuPaNwqISELdACgtY0ussG8N29rXgOfURK4pmLb38PVkMbCLEHXDha0SVCisSzAs5EYNn1gwyJ2OymAtsBq5v9KJFWbgDySMTfHYWyA+1v30wb7jHVPSD9sxl82kkjvMOdX/YCHdetZ4ENW+wI9MIfY5OVckNmywjmf2sr9y511MKMpFFtYcQBskMyI5f+U6YqAUJoOlgpRGIMH3JzfJ7oHbW3/nXaGWAXYMdfdGQFHflJ7pmP3K1ZgsEyjwafxFh0xAHJzYJ/vo79UzXgNrs9E7uo3rvLWtotpdh5h3rJUA7yU32ZH7g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9515.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39860400002)(376002)(346002)(230922051799003)(1800799009)(186009)(1590799021)(451199024)(64100799003)(8676002)(52536014)(1580799018)(8936002)(4326008)(55016003)(26005)(66556008)(33656002)(9686003)(71200400001)(66946007)(6916009)(478600001)(64756008)(66446008)(53546011)(38100700002)(86362001)(82960400001)(83380400001)(7696005)(38070700009)(122000001)(76116006)(6506007)(5660300002)(66476007)(85182001)(316002)(2906002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VFBLUDJKclAwaHI4WldmYmR5NnBXN3k4SnlCWnoxazFKZHJhazZLRkxiRnQy?=
 =?utf-8?B?RjhraHN1UGFXSWI1WFZ6Z1FmTlErOFpidVpObXNkRTJjc0ZhK2NDSHJhckNu?=
 =?utf-8?B?WnZiVnhMTmhtNmpXUzBNeEFMR3B3NlBjYXJlL3Q5YW9kZ1R3MVZWUFBuVEtr?=
 =?utf-8?B?MmRxQURicVJha3E2OHI2Sk5laW1KalY3R20zZ20zbmdmc0krZmRqaWhWSGxq?=
 =?utf-8?B?aWR2TnUyZ3J4aG82ZHJHTUtObVRMUG9RYUdHa1VZSnRiZU1MLzNvSy9BbE0x?=
 =?utf-8?B?U1loK21jWUJzTGtFaHAyMDhGa3hLbUhMN25ZaWlYV0wwMGtybUhBeDFaUVdW?=
 =?utf-8?B?RzVoZmN1ajhSOFZrMFI0Uys4d005Tm5lRnQ0THo4QWhHRXRlRzZDV1F4V2Fz?=
 =?utf-8?B?dWRvc3hDM3BtdHBuQzNSZnR4S2hjNVdlZ21Yd0tOTmR3ajdKaTdueDVIbXpE?=
 =?utf-8?B?Z0JmaWMzMmtqVWZ2VFZXTVJHdnFIN3g4R1JBakdreE9md0g4RkRSS0g2K2xD?=
 =?utf-8?B?eGZrWHd0YWJRcThDa3MwclBZNEthYnUwMlA0NzVPM3A1Uy9vNFhJZ1Ywbkps?=
 =?utf-8?B?RHhFck42b1NoejFHNVZWdjdMcGdMQU5LU1cyaUh2bDBHYVRZT2ovbUY4Y2M4?=
 =?utf-8?B?THRQakxDZ1I3dDBYQmtsTGI1TTFnZXQ5ZlN6eGpLekhteWljWnNuWVNJVnYy?=
 =?utf-8?B?RnpIUUhla3pNTFZ6Y21xTjE0MXQwbkY2ekw2d1h6TWtXTHJqR0JIV0lia3VG?=
 =?utf-8?B?NG1OSXY5ck1WbXlqSE52ZE9jOUtCc0kvV29xSUhNeXl2V05nc2djdFBJKzFF?=
 =?utf-8?B?UjBMbUdPUklnWk5JUFd1Z3NPcG1lSlh0U2lLWkp1MHZVYnNzMGZ6UWhzYnBN?=
 =?utf-8?B?bEVCRG9SVjVkNXorMThtYkJ4MkJ4L01ZR3M4ekMxVXo4WExtTlNNZ1lvZHlB?=
 =?utf-8?B?ajZmWjFoZ2haNG9zY0ZsYmxsUk1sU1BPMzRvNUQ4UTQwVlFDRGtFWUk0ODBs?=
 =?utf-8?B?aDhFMEkyVnFOK2wrZHZneWtoVnhRM0JCMFRiUTk3VGRCSG4renNObURXbDlt?=
 =?utf-8?B?ZW0yR1VwUmU0aVRtbXRpVmdlWG40aHdWYXM1UmhyTUc5WFFzVjc5VGtNck81?=
 =?utf-8?B?YlVIVXR4Mmhhc2V2Sm1WbGtGNi8zUXcrU0pnZzAxUHYxNzMwbGg1RnI5NkVX?=
 =?utf-8?B?TmZaV0NrYWJDbDN1cmovQUhSWlRNWmRxYkNINkFWaDhDT1RESnczVnF2eDRJ?=
 =?utf-8?B?elBlSEhpcVMxM1VBc1R1L0JZSVJmaWxuZHhoNFgyZEdudXlXOWZEc2YvTjZZ?=
 =?utf-8?B?ZGVGVllOblY3cDVRa1RHOVI5T1Q0b0w1cHVQNi9TM0pvTlpDU0p4UGJjR2Vi?=
 =?utf-8?B?Wm5mQTM5TFNQOUwxMW5Bbmk2dW4yTlJWenJEMUxMSHkzL2VyY2l0Y05tRmxr?=
 =?utf-8?B?eDd0N0lodS80YnhDRTNJRTJaUUVtM3hwSCtySTkxanRndlpKTWdCdmJkcEVJ?=
 =?utf-8?B?RGNlTVVXT0xOWjNWOG5LSVB5d2VadU9CcW12T1ZQMDVmNnZRTUoxM2FsSkJW?=
 =?utf-8?B?N3F6UTl3YjgzYVhGWTRtT29kTWxNd2l5dHRtaVdpelJsS2YvNTdtNllIRmN3?=
 =?utf-8?B?MC96WXRhRWN0TDVoa1hYQjFHc1piMFY2V2o4Z2syVnpXZ1Y1V3kvRlRDV2xs?=
 =?utf-8?B?YThwWTlONEY1U0xvQytyTGg1N3NuVWZsQ3dPSzZIemVGQVhHMEdpYWFTYUtT?=
 =?utf-8?B?c1pZNFY5TWRtMnhoS3V5Tk5UZDFUOCt0MUFTdkhMSnNMVG5mWUlqbkRTSFoz?=
 =?utf-8?B?OE53T2wxM2VBTy85VnRTMWtDZ0xlTVlSb29zSDlMZTJXcXVTUjJwYXlreXdk?=
 =?utf-8?B?c3JJL3Rqb1p6cFBEc3pFSHUwbE81aGEvbVhGcWE4eDV2SE9FN200Wkd3Z0Zj?=
 =?utf-8?B?T1M2TlpwUHBPRkJSM2pkMVd1VE9wUnVZRnB2Wk83bjBkUklib25qTDZNMWo3?=
 =?utf-8?B?VU9qbFlMZ3ltVGJ4YXhQeDNVMzBtdWRZZjFBMldYWjVYWFJieXRZaFNvMUlS?=
 =?utf-8?B?Y0JsR3ZpbXBiRkJRaXAySlJuSVpML2x3a3ZqYkUzME15UHNpMGo3bi9aUm9Q?=
 =?utf-8?Q?Bkbo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	MUK/07K1jK+vdIlhAI32j/bZtPeXI61oF6KUP0Hv3XeeN6dUYAiQDz3DOKOXI77ujfbS8hJl3tof1ienFzu+uGtc2qPutm3itD4QicpJJGK/qNWg/fQbyojc41AnG/rFoAvyZLd3i3TywcyUPGoT3N7mf2+TPy4ly5K6Xg/5eI24utBATwQgzzuVlwpD3Ylnd/jV2AbZ1NV61G81U4FmLDk8j1sdKXZi14emlsSB+n/OYQqB9sokyDTZs1DyadPwYhh6nMXZxf25U44MzU3iKQOP9vyC9WzOm11Atlk+zwvtgLb4KFD162gm3NMWpmz9K5T8NJIkiyZIXAYZVBk2FNlDf9tRRZA9mtMyvuZYY69Rp/bxzcbr+TM6hACY+hf5dYMp0hdL2wLwTa80Wzx85ZOUeq5u1dKV6MVy6LcWYDpVITjh1cgrdBGNseiaUj0sO7vrcOoapolvhJN8aUtMo7bARdrrLrJ0ikjU89tJfl925i6XaI2TW/td3pEGxYzaTWEX+WNUo5NF95X35Prserk5T4DgypwRMJk8ni/W3957IVd1fsCRg3d6wuHsvnT0n6cmN1tKPs1mYKTqStzAUsSkmL2tYwp3/MUJdCnqTFyRkq5imMfdsfX9aYl6+MmVBC6AFiFElYVsbUBzbTxlscrGyyWAIIyiqHJgq+w/4SXzwr2L/ifLd6th1ATnw4XkC0Nl4JPMZq+FeqpzyeAo4YMQNLsXw9k41uy/RpsbRQOOfdRJutPFiDwAYgBmaHu9jnAyBoraY/v0LtU3hc6cRbUEPPiEroFIU8Le8s737FJo+186CiV3BmVTEHQTDPsm
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9515.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcdce94-c274-4787-d8b4-08dbd9eb4526
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 08:27:50.3674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0HgI3gXCrN3SDL4qtD3moiVn1zEZtkEebC+4D4eLB8IxjtyrBjcMEEH+sR7DEcTIP+TBfrwG13OsJDEKHfN7zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5645
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 08:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189832

SGksIEFsZXgNCg0KSSdtIGFmcmFpZCBEQVRBRElSIHNob3VsZCBiZSBhbiBhYnNvbHV0ZSBwYXRo
Lg0KVHJpZWQgdG8gbWFrZSBhIHB0ZXN0LnBhdGNoIHdpdGggcmVsYXRpdmUgcGF0aCwgYnV0IGZh
aWxlZC4NCkFzIHdlIGtub3cgdGhlIHB0ZXN0IGRpcmVjdG9yeSBpcyBub3QgYSBmaXhlZCBwYXRo
LCBzbyBtYWtpbmcgYSBwYXRjaCBtYXkgYmUgbm90IHN1aXRhYmxlLg0KRm9yIG5vICdtYWtlIGNs
ZWFuJywgd2UgY2FuIG1vZGlmeSB0aGUgTWFrZWZpbGUuYW0gaW4gZG9fcGF0Y2goKS4NCkFueSBp
ZGVhc++8nw0KDQpCZXN0IFJlZ2FyZHMsDQpRaXUgVGluZ3RpbmcNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjQsIDIwMjMgNDo1MSBQTQ0KPiBUbzog
UWl1LCBUaW5ndGluZy/ku4cg5am35am3IDxxaXV0dEBmdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0ggVjVdIGtiZDpBZGQgcHRlc3Qgc3VwcG9ydA0KPiANCj4gT24gVHVlLCAyNCBP
Y3QgMjAyMyBhdCAwNjoxMiwgcWl1dHRAZnVqaXRzdS5jb20gPHFpdXR0QGZ1aml0c3UuY29tPiB3
cm90ZToNCj4gPg0KPiA+IEhp77yMQWxleA0KPiA+DQo+ID4gQXMgeW91IHNhaWQsIGl0IGlzIG5v
dC10aGF0LWVsZWdhbnQgYml0IG9mIGNvZGUuDQo+ID4gQnV0IERBVEFESVIgaXMgdXNlZCBhcyBh
IHBhcnQgb2YgQ1BQRkxBR1MgZm9yIGNvbXBpbGluZyBjIGZpbGVzIGluDQo+ID4gdGVzdHMsIHN1
Y2ggYXMgbGlia2V5bWFwL2xpYmtleW1hcC10ZXN0MDEuYywgbGlia2JkZmlsZS9saWJrYmRmaWxl
LXRlc3QxMy5jDQo+IGFuZCBvdGhlcnMuDQo+ID4gc2FtcGxlOg0KPiA+DQo+ID4gbGlia2V5bWFw
L2xpYmtleW1hcC10ZXN0MDEuYzogZiA9IGZvcGVuKERBVEFESVINCj4gIi9kYXRhL2xpYmtleW1h
cC9jaGFyc2V0LWtleW1hcDAubWFwIiwgInIiKTsNCj4gbGlia2V5bWFwL2xpYmtleW1hcC10ZXN0
MDkuYzogICBzZXRlbnYoIkxPQURLRVlTX0lOQ0xVREVfUEFUSCIsDQo+IERBVEFESVIgIi9kYXRh
L2xpYmtleW1hcCIsIDEpOw0KPiANCj4gSSBzZWUsIHRoYW5rcy4gSSB3b3VsZCBzdWdnZXN0IHRo
YXQgTWFrZWZpbGUuYW0gaXMgcGF0Y2hlZCB3aXRoIGEgZGVkaWNhdGVkDQo+IHBhdGNoIHRoYXQg
c2V0cyBEQVRBRElSIHRvIHB0ZXN0IGRpcmVjdG9yeSBvbiB0YXJnZXQgKHlvdSBjYW4gbWFyayBp
dA0KPiBJbmFwcHJvcHJpYXRlKSwgc28gdGhhdCB0aGUgY2hhbmdlIGlzIHJvYnVzdCAoc2VkIGV4
cHJlc3Npb25zIGFyZSBwcm9uZSB0bw0KPiBzaWxlbnQgcmVncmVzc2lvbnMsIGFuZCksIGFuZCBo
YXBwZW5zIGJlZm9yZSBhY3R1YWwgYnVpbGQsIHNvIG5vICdtYWtlIGNsZWFuJyBpcw0KPiBuZWVk
ZWQuDQo+IA0KPiBBbGV4DQo=

