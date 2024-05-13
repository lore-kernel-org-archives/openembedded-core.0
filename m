Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4422DC25B4F
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 00:45:36 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web11.49798.1715561126636779763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 May 2024 17:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=hAIBP51F;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.87, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1715561127; x=1747097127;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P+OG47KemZR4vsQh2pDghAR9YSUC3gsi3wPTCP31lbA=;
  b=hAIBP51FVXS8G2sKLqCGIFH1NAKr81NNSBiRHvvnMwTD8a+4AohKFOw4
   n6dtPL4HR2OpTX1G/pky13LoUffqffxpVJsZlHdHadY2m1KlVTdAmzBvG
   SezxSjIW+U0QZKww5+028YbHWbwCNs/41H33wqoH0uw5sd2fY1MNq/5OR
   OOxX3U9HnYR4JgjwjyCTW0GVJjRBA1KjbkHCkuEvzQSrqcY6FXTHLkZoK
   QO8pyvcUO1Mc2BjACYxlGkFhbB0KNPSvuiZjydF9Mo9csdZ8KLKa9o5oi
   JgAMhB9IMCcZsyvZnzAISvtXpFpBklIHT5bfz6v/fjticKMdhJqZ9oakJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="119146968"
X-IronPort-AV: E=Sophos;i="6.08,157,1712588400"; 
   d="scan'208";a="119146968"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 09:45:24 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6dpuL940Zwjj8q0icuE6AZHvLd0UrjpaFtXdlDw5vPqybGndraVOKa+g6L1LN7JpVKLOTw+GRS8sW6fQgsGDL3x1rOvXsTJ3lkuadp1LxxLRMV3WRQHbHI/uRbv1NSjuJzNxRvniunmXWU07lA0Nrtq8gwjn+zwpE7lov4ZdOP9TfM5emnwj9PeL4BgYjlgDQEGKTiLihqfNoiirBonX9TW7ksVHhmW0pyNLU7HK6c7ni9sP6Fo7eLbbfB/1IS5EEwBXx+eoc4MTAHky6Y25pj9Ip8AvJ4UOwfxg+wz3dD1okfcGMebBsi4DprslWO+/tnegksrMlw5WDXrPzKmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+OG47KemZR4vsQh2pDghAR9YSUC3gsi3wPTCP31lbA=;
 b=bGV5LS1SFk1QSs0OBq6+rEBkgT7FthLaycHV89HXgEjuWrAs5MS/oO9EweAO5wsxBa16dHXe1R7H06o6ZEksZVA9SR8ndYNzoJq1kE9YXplGq4L4K+iU1pss6oX8du9uAPMqSr89nWcNCsY7LbqMkjKe96ScEuIJ+n8zxzHYT6GOFcLO8ZpKNDm3wwrsy2/EnlYKcyx6yuCtRbTraCUiKiGnv6BtkL4/Y7UmPqq172cQRgr2uRY0CQQ04gKDt+Rxgk0bY5oZTx9QcTapRqrQvdUubnz7ZY4ry6ysQrj0iRSGU/E6pLbyAn3mdWSOzWkbBPho6tpYnK/kJBbeJ9U6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYRPR01MB12350.jpnprd01.prod.outlook.com
 (2603:1096:405:105::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 00:45:20 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e%6]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 00:45:20 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when
 enable multilib.
Thread-Index: AQHamthAA1WlsJSKE0i8b52cEJCNw7GPumSggAB8LoCABC+IYA==
Date: Mon, 13 May 2024 00:45:20 +0000
Message-ID: 
 <TY3PR01MB1105679931DF375DA6FC8F9F8A0E22@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <17CB016975A375B8.19032@lists.openembedded.org>
 <TYCPR01MB1105524607983912E618C3F2FA0E72@TYCPR01MB11055.jpnprd01.prod.outlook.com>
 <CANNYZj9wbPVs5=dVVRr=Hz5w7SVpPC-sZQyEa85ct5M3=z9Anw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9wbPVs5=dVVRr=Hz5w7SVpPC-sZQyEa85ct5M3=z9Anw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZTkxMzM5MzItZDlmMy00NzQ1LWFiMGQtMTQzMzEwMThh?=
 =?utf-8?B?Mjk4O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDUtMTNUMDA6Mzg6MzhaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYRPR01MB12350:EE_
x-ms-office365-filtering-correlation-id: fa7ae8c4-c5c1-4c16-5207-08dc72e5f745
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|1800799015|376005|1580799018|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SVRVcW5xNTJTeGFjamI2ejNvdFQzY3hrTDNwVTk1dGdGVXV0SENjcHdKSUFE?=
 =?utf-8?B?U2EzTkV2UDFwUTJVRkxkU2lWWktTejNBZk45RjU1M015RWF6VUp1M29hbkNM?=
 =?utf-8?B?M3RCRGNMWVNDUXI2SlpkcTlkc0RuSTdkd2w4YzIyUG9CaVF2UzNnL1JFWE15?=
 =?utf-8?B?OXQyTjVKU25wc1lqM0FVSEJhRldqWFdjQStqOG1FbHpJbGx4bGNIQWtGbjJs?=
 =?utf-8?B?ODl6RkpUWnpxZ283cjVyVkc2V1RGWkhJKzkxbjNVTnRseWJoVjAwVThEQzZD?=
 =?utf-8?B?enp4M0UrYWhiRDA3RGtLa3pKWjFJVlMvK1VwanRTZHA3L2VhWmVUMEQyaHJH?=
 =?utf-8?B?TS9YNkxVcU9lVzM1WWJhV1draDJWdW55SmQ1QjNoTTJvVk5XekxwS2ZqcW5J?=
 =?utf-8?B?MHBWM0ZuRk9tOWtNR2ZaaWFaUFhiZXRIdTBuWll5N1pCZlNEczVuM084SE9B?=
 =?utf-8?B?djg2cTJDMjJvQ1BCeVp6ZUFZUVhhQTVyMHZSUUxmdGhuODJIYTJxNTNJeER1?=
 =?utf-8?B?QU5jOUQwN0U0Z281WDcrb1hUR1dxcXhNdENKZ1pTdHVYVmVvZDUzY3p0aDlO?=
 =?utf-8?B?eXFaR3BMdDVzbERyY0dkakw0a2pSSlZOTnNuYi9rODJhNGl0NVFST0tERmFW?=
 =?utf-8?B?M1UrbzhHK3JjUHhOV2NjaXZtV3FJS2ZkWkxUb2dSUTdvYVg0WjlIKzZXWTZY?=
 =?utf-8?B?c0Y5TkVKSTgySFNWNm5SM0praWl2cytMWlZVMWZJajkwNlVNVkVZaGl3Zysw?=
 =?utf-8?B?VkxCS0dvNXBtZHpFeng3SHlURm43M3Jxemd6djhxa0Mvekh3cFBuWndlcnBs?=
 =?utf-8?B?Z0R3RGY0Ynh5Z0hzS1RIeTdpRXgwZVA2Ym9odHpSSmZ3WDhoTXo5V29vcmlt?=
 =?utf-8?B?U1FXTGQyNndQZGxnbVJ5QnJTS1IxQ1pPdHJXVGRKWWFBOVpOaUFuR0JHZDQv?=
 =?utf-8?B?Vll6Vm9kblVyTHI0NzZvc3kyV1hubk05TVBjcy9tMVgwWWhoRTdNVXJlaXB0?=
 =?utf-8?B?OHNBd05wVDhZbVlsckpyWkMzREhCdTVJWkhtTU9FSU9lbmREQ1Q1eURPUnZG?=
 =?utf-8?B?Y0swT2RrYkNpTkNENEZLWTJ2MFUvMU41QWYvZGcxQ1lqYzF0QUZlMjhGNUZV?=
 =?utf-8?B?VXc5Y0FMVG9WRm4zTEFrUklVRi9DMW1UUGVIbFROV21LY0YvZVBMTGdGenpN?=
 =?utf-8?B?bjd2Y3ZsOGZSYWtzRGRIQXRXQXoxcHRoZWo2VFlIYjcvL2JFVlI1NU56R1Vl?=
 =?utf-8?B?SGtyOGNsSlZkT1VvaFFoRmVVS05UVEV3elIrVTZyL1V1UHZyVHFtSTNJa0Y4?=
 =?utf-8?B?ZWc5T0ozT1NabVdQTTB6ekFFYy9RdU55aVozajFNeThZNkZjWG5aeHF1MWVm?=
 =?utf-8?B?Rk5FQ2dmR1l2UG04eUtTM3ZxNnRaQ3hnNHhtcis5bTByU29vKzhpRkNqMU95?=
 =?utf-8?B?VlZQSjNzbWNJTVlpV3FzTzJZa2JGck1nS1RvUVQrWk5nUlBRUmV3L3FZLzBh?=
 =?utf-8?B?WkYxNVVpYmFCMk91SnQyTGtvRjloVEN2Vk5waTlocTZDWFd1VmdybDNyYTRL?=
 =?utf-8?B?dFgwRjUzdWZ5enBwSVJWc3RFZnBsMFRlam5XdU1mTUl5cGoxY0xrY3h5T2lL?=
 =?utf-8?B?M0prOWNNZzRXVkVlR0RlMTQvK21veTNmMUxlZlgzeWRSZTJnTFMxeEVqOVoy?=
 =?utf-8?B?OVFrZzE5VzRYVEY2WlJVOEJ1ZVpNZGI5V2UwdXJxYnptSXlodFpXdGhnekRm?=
 =?utf-8?Q?NoEVYhN9A91XF1CADBR+WyduxcDsYt5MlYtpP0V?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(1580799018)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bWs0OElUU2FpbGdmZDkveFJoUGE3VnZuR1dQVEk1WDZOMG94bkNXYjZZL21v?=
 =?utf-8?B?NWpFSTg5Y1dmVWJHVGd2d2ZlMS9qTUU0VzhjQXAzMjNOTkVUYVJmZjIySVFR?=
 =?utf-8?B?UFEzcGNkemJQK0Exa0xqdFdCRGR2b0lTWkpPQlVjT1dXTHUvV3hiQXJrajV4?=
 =?utf-8?B?Q20yeWtncW12TE1rOWg0YjBzM0N5S2prK0lud0NnMnNuamJWR3AzeUJKYVhi?=
 =?utf-8?B?bG9MVjErVWZBeC9nRlUrUlZncFBaZlFEOTBBcHBPRkY0TzBjbzdRQlo2ZGtH?=
 =?utf-8?B?cnVXMGF4ekpjNkEyY2I3ckFiRjJIWkVZYTg0cHhCK0ZaNW1TNmdBOVBGRFhO?=
 =?utf-8?B?SDFFS3Z1aVdaclYxVVhYS0ZreEFMRVF6c01tdGdSbHJOVDYyOUNDY2VVYWpY?=
 =?utf-8?B?ZGZzbEdaOWZZUE9xNXlGSTE3dldTaXNKc090ekRFZjlaNlAvTmM5NHp4cmMr?=
 =?utf-8?B?QVNock5FNEVub3gxaGVQZDBIR1h3d3ZCajhqd05iaTJFakhsayt2NmRBY1hp?=
 =?utf-8?B?aGxmNVJTQzF6RE90dzNCNHFkUG5FTEhCdkh1SThibE5nV1J6TkhSQkZvTk9E?=
 =?utf-8?B?V04wVEVOZmdwYkxnSjQ2V29MU2czZlpIVHd0MW5BQVQweDB3Qkd6VVlvNzlD?=
 =?utf-8?B?YURpa2w1cDVkUGRNRXVRenpuOFkvZ010UzYvc3YvRzFNQTZRem04U1RBTERo?=
 =?utf-8?B?NkFPQ0l4SXh0cFozbHlua01jcXNhdG8rdnlrcHIrZGVWMTV4b1pMRkY2SHpL?=
 =?utf-8?B?a1NxY0h6UTBLZmpFOTkya29rMjlPVVdzTXU3WHduc0lGeGdxdDgzbWhSU0pH?=
 =?utf-8?B?WkpEc2twNHhMenpRS040VDJER3NLY2pnczZobkJxUld5TitwVWxFM1p2NDcv?=
 =?utf-8?B?R09uZEIzQUN4L3pGekUrVWF4OVE4M25ISmUzMUkwZHg0ckwvZG9CYW1zaUtJ?=
 =?utf-8?B?SnFibUU4Ykl0WHVTbHhTNVNQeDhaRDFqSkJTQ1NIalVFQXcrTE1PcDhNY3NL?=
 =?utf-8?B?Z3RERVdjU21iYmtuWHBlTGRHK3ByUXVITHVIRU1pSGZSelNMdm9ub3ZQNGov?=
 =?utf-8?B?Mk9YbWhSK0FmU0VyRzd5S1VVbmgvaVUrTE01eGdJZE5jOFFUcEF3U3JPYzZR?=
 =?utf-8?B?eWFJWmpYVDZNemtIRnNkcXQ5V3V4YzRGSEZEUWhYandVYUFIaEJDa2NaVzIy?=
 =?utf-8?B?Q3RFMTlSSks4WGdISzdLL3BLSmRJWnlqd3JNRWxIMEhYa2xzcE5oZXNGWVdx?=
 =?utf-8?B?VDlTLy9TbHpEZGJEQ2JWV0ppSXBPVjJDa1hGU1NYdDYwRk05STlMTVg4WEFw?=
 =?utf-8?B?UElJK2hFOWJvZEZwdDhvcVRmaUNYczU3Z1pUUzk1cmF5bWRmQzZTRWczcVBX?=
 =?utf-8?B?cnNBbThqd0pLMGo2NFE2OXl0WC9GcjVYRTdPOXI1dERtWWFkam9sbjU5ODF3?=
 =?utf-8?B?eTZ1b0dqYWExZmI5bDNhTFJuMnFDQnNqNXFENkVhU01vSVliSG5QT0Rhd2Ur?=
 =?utf-8?B?bjNIL0xvWlFwRTNhR1V2djF3SzBreUhYRTg4SStTT1lmRGduQTFDdU9LbHFH?=
 =?utf-8?B?WmFyd1pTZW5idTk0WlA3YTVxS1JNWmJlRTFJMlo4Y3B1MVJvRjZORExZSFFx?=
 =?utf-8?B?VzgvTWRNRWNIdUNwaUh0ekgvc0s2SHNIV3BEYmJxNzlSS203L25wZmFwSCt5?=
 =?utf-8?B?enB3UkEveE96Uy80cFBoKzl4emY3enQ3YWZoRTBheVhhUU16QkNuZThTZkpE?=
 =?utf-8?B?b3ZTMUs4WFNsNnV0WHFPTW92VUJPU2tieW1PeUtOWjJwRFJKQlBRL2dBOGFh?=
 =?utf-8?B?N09ZWi95WWsxNzh0Z01QYy9CRzU4OXR6aVJpeEZsaXlydUg1dXZYNTIrY2xQ?=
 =?utf-8?B?cUkrMzc4V1F1Tjc1SkF0ZCtSR3piSC9nOFl3VS9ROUVjYWVFTEhuTjZiQnJ4?=
 =?utf-8?B?OS8rTXMxZTNyRHBjb0dHaVNmSjBJT3hwLzZZZFRuRm9JOHVnUEczbi9McUZH?=
 =?utf-8?B?WWl4aUVOVHo0aWEvWndKdUZWM3hldkk3R2gweUFLSkl5ZkdwQnkyc1hCN1Ji?=
 =?utf-8?B?cUwreXNvejlmOVdZNHNReU4rU09SMkdYR2wwZmIwb1QvUnBYRHA2d0VqczZD?=
 =?utf-8?Q?V/zaKlUIMsPz5fO++ycZbRWxI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yeXRPla29MgOYA92iHTSxbHQ2h1As5ygKunOpKLiH+c/Ep/X0nO7hPGNyPSZMSzxXazOvWW16bg3Y79OahnQPwzyTWF8n7r8nm5mZvWvnFnFs0ERSbueaRBiCXx1c7H3T3P1Umr97vDlG4YSdht9lg2GF6NJVhiUKI1lEaEPB3vMeqdRdn35KQ4BrJ3cBp1jpSSk2f3A3/biqANgCGf2gslgKUoruaDRMJCuxDYlt1EeliUY+BhvXqBXMDwRorOepc01sdk5W6vrODzLPcucSzmfGjzDDPS8DqUL7s651IgFeu8TTnDod9YO7Dx7W5uyfg1dI+/i1U5G4wlRh4ioEAw+0CPtjaaEuWtXclhvMzE8wBSSH1dx1K4kGVsWLqXa3AGdGYKM6olL6iEIpRjp1ceocOUzEC6A0VKN6J63Aeip7tHsHGAlXZjZ4X8uG0EmHvqym9E6Rqzn/6tEzjXJBl5lN+P1Vpk76vhLqDygxLMRSA4vU5knLxkIqYoCxjA5i7rJLnXw0VJkqeNus9SUuzfpq8Q01hKH2XXIW0DdKD9awmmF++Fma4QzqLgkTXRl/+LMD9/M+7/thPmVfYbXSayXlqCtsTduVSHWDpqOc6wnN6WgaeesR/Bed6euWfWE
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7ae8c4-c5c1-4c16-5207-08dc72e5f745
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 00:45:20.0904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NK9XUn/7V0alWXsUTaoVW0FmzbeYPrP3djFBxXevAFxsf/Oh3+OLLS6Ct5N0a1JyxkNbzJ0jGYoGDJz/tob+pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 00:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199221

SGksIEFsZXgNCg0KPiBJdCdzIGluIGFiZWxsb25pL21hc3Rlci1uZXh0IG9uIHBva3ktY29udHJp
Yi4gUGxlYXNlIHJlYWQgUmljaGFyZCdzIHN0YXR1cw0KPiBlbWFpbCBhbmQgdHJ5IHRvIHBheSBh
dHRlbnRpb24gdG8gdGhlbSBnb2luZyBmb3J3YXJkOg0KSSBnb3QgaXQuIFRoYW5rIHlvdSBmb3Ig
eW91ciByZXBseS4NCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMTAsIDIwMjQgNDo0MyBQTQ0KPiBUbzogTGVpLCBNYW9o
dWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCB2NF1bUEFU
Q0hdIGxpYmJzZDogRml4IGNvbmZsaWN0IGVycm9yIHdoZW4NCj4gZW5hYmxlIG11bHRpbGliLg0K
PiANCj4gSXQncyBpbiBhYmVsbG9uaS9tYXN0ZXItbmV4dCBvbiBwb2t5LWNvbnRyaWIuIFBsZWFz
ZSByZWFkIFJpY2hhcmQncyBzdGF0dXMNCj4gZW1haWwgYW5kIHRyeSB0byBwYXkgYXR0ZW50aW9u
IHRvIHRoZW0gZ29pbmcgZm9yd2FyZDoNCj4gDQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1hcmNoaXRlY3R1cmUvbWVzc2FnZS8yMA0KPiAwMw0KPiANCj4g
QWxleA0KPiANCj4gT24gRnJpLCAxMCBNYXkgMjAyNCBhdCAwMzoxOSwgbGVpbWFvaHVpIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxsZWltYW9odWk9ZnVqaXRzdS5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBQaW5nDQo+ID4NCj4gPg0KPiA+DQo+ID4N
Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiA8b3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIGxlaW1hb2h1aQ0KPiA+ID4gdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDMwLCAy
MDI0IDQ6MjcgUE0NCj4gPiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+ID4gPiBDYzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4g
PiA+IFN1YmplY3Q6IFtPRS1jb3JlXVtQQVRDSCB2NF1bUEFUQ0hdIGxpYmJzZDogRml4IGNvbmZs
aWN0IGVycm9yIHdoZW4NCj4gPiA+IGVuYWJsZSBtdWx0aWxpYi4NCj4gPiA+DQo+ID4gPiBGcm9t
OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+ID4gPg0KPiA+ID4gLSBGaXgg
dGhlIGNvbmZsaWN0IGVycm9yIGJ5IG9lX211bHRpbGliX2hlYWRlci4gVGhlIGNvbmZsaWN0IGVy
cm9yDQo+ID4gPiBpcyBhcyB0aGUNCj4gPiA+IGZvbGxvd2luZzoNCj4gPiA+IEVycm9yOiBUcmFu
c2FjdGlvbiB0ZXN0IGVycm9yOg0KPiA+ID4gICBmaWxlIC91c3IvaW5jbHVkZS9ic2Qvc3lzL2Nk
ZWZzLmggY29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkDQo+ID4gPiBpbnN0YWxscyBvZg0KPiA+
ID4gbGliYnNkLWRldi0wLjEyLjEtcjAuY29yZTJfNjQgYW5kDQo+ID4gPiBsaWIzMi1saWJic2Qt
ZGV2LTAuMTIuMS1yMC5jb3JlMl8zMg0KPiA+ID4NCj4gPiA+IFRoZSBkaWZmZXJlbmNlIG9mIGJz
ZC9zeXMvY2RlZnMuaCBiZXR3ZWVuIGxpYmJzZC1kZXYgYW5kDQo+ID4gPiBsaWIzMi1saWJic2Qt
ZGV2IGlzIGFzIGZvbGxvd2luZzoNCj4gPiA+DQo+ID4gPiAgLyogRGVmaW5lIHRoZSBBQkkgZm9y
IHRoZSBjdXJyZW50IHN5c3RlbS4gKi8gIC0jZGVmaW5lDQo+ID4gPiBMSUJCU0RfU1lTX1RJTUVf
QklUUyA2NCAgKyNkZWZpbmUgTElCQlNEX1NZU19USU1FX0JJVFMgMzIgICNkZWZpbmUNCj4gPiA+
IExJQkJTRF9TWVNfSEFTX1RJTUU2NCAxDQo+ID4gPg0KPiA+ID4gLSBBZnRlciBvZV9tdWx0aWxp
Yl9oZWFkZXIgb24gY2RlZnMuaCwgdGhlIHBhdGggb2YgY2RlZnMtNjQuaCBhbmQNCj4gPiA+IGNk
ZWZzLTMyLmggaW4gY2RlZnMuaCBuZWVkIHRvIGJlIGNvcnJlY3RlZCBmb3Igb3ZlcmxheS1tb2Rl
LiBQbGVhc2UNCj4gPiA+IHJlZmVyZW5jZSB0bw0KPiA+ID4gaHR0cHM6Ly9tYW4uYXJjaGxpbnV4
Lm9yZy9tYW4vbGliYnNkLjcgZm9yIGRldGFpbHMuDQo+ID4gPiAgIEBAIC0xMiwxOSArMTIsMTkg
QEANCj4gPiA+ICAjaWZkZWYgX01JUFNfU0lNDQo+ID4gPg0KPiA+ID4gICNpZiBfTUlQU19TSU0g
PT0gX0FCSU8zMg0KPiA+ID4gLSNpbmNsdWRlIDxic2Qvc3lzL2NkZWZzLTMyLmg+DQo+ID4gPiAr
I2luY2x1ZGUgPHN5cy9jZGVmcy0zMi5oPg0KPiA+ID4gICNlbGlmIF9NSVBTX1NJTSA9PSBfQUJJ
TjMyDQo+ID4gPiAtI2luY2x1ZGUgPGJzZC9zeXMvY2RlZnMtbjMyLmg+DQo+ID4gPiArI2luY2x1
ZGUgPHN5cy9jZGVmcy1uMzIuaD4NCj4gPiA+ICAjZWxzZQ0KPiA+ID4gICNlcnJvciAiVW5rbm93
biBfTUlQU19TSU0iDQo+ID4gPiAgI2VuZGlmDQo+ID4gPg0KPiA+ID4gICNlbHNlIC8qIF9NSVBT
X1NJTSBpcyBub3QgZGVmaW5lZCAqLyAtI2luY2x1ZGUgPGJzZC9zeXMvY2RlZnMtMzIuaD4NCj4g
PiA+ICsjaW5jbHVkZSA8c3lzL2NkZWZzLTMyLmg+DQo+ID4gPiAgI2VuZGlmDQo+ID4gPg0KPiA+
ID4gICNlbGlmIF9fV09SRFNJWkUgPT0gNjQNCj4gPiA+IC0jaW5jbHVkZSA8YnNkL3N5cy9jZGVm
cy02NC5oPg0KPiA+ID4gKyNpbmNsdWRlIDxzeXMvY2RlZnMtNjQuaD4NCj4gPiA+ICAjZWxzZQ0K
PiA+ID4gICNlcnJvciAiVW5rbm93biBfX1dPUkRTSVpFIGRldGVjdGVkIg0KPiA+ID4gICNlbmRp
ZiAvKiBtYXRjaGVzICNpZiBfX1dPUkRTSVpFID09IDMyICovDQo+ID4gPg0KPiA+ID4gU2lnbmVk
LW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNkL2xpYmJzZF8wLjEyLjIuYmIgfCAxMCAr
KysrKysrKystDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJic2QvbGliYnNkXzAuMTIuMi5iYg0KPiA+ID4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJi
c2QvbGliYnNkXzAuMTIuMi5iYg0KPiA+ID4gaW5kZXggN2Q1ZTg4ZjI5My4uMTc5MWQ5N2RmZCAx
MDA2NDQNCj4gPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4x
Mi4yLmJiDQo+ID4gPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAu
MTIuMi5iYg0KPiA+ID4gQEAgLTQwLDggKzQwLDE2IEBAIFNSQ19VUkkgPQ0KPiA+ID4gImh0dHBz
Oi8vbGliYnNkLmZyZWVkZXNrdG9wLm9yZy9yZWxlYXNlcy8ke0JQTn0tJHtQVn0udGFyLnh6Ig0K
PiA+ID4NCj4gPiA+ICBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiA+ID4NCj4gImI4OGNjOTE2M2Qw
YzY1MmFhZjM5YTk5OTkxZDk3NGRkYmExYzNhOTcxMWRiOGYxYjU4MzhhZjJhMTQ3MzEwDQo+ID4g
PiAxNCINCj4gPiA+DQo+ID4gPiAtaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnDQo+ID4gPiAr
aW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIG11bHRpbGliX2hlYWRlcg0KPiA+ID4NCj4gPiA+
ICBERVBFTkRTICs9ICJsaWJtZCINCj4gPiA+DQo+ID4gPiArZG9faW5zdGFsbDphcHBlbmQgKCkg
ew0KPiA+ID4gKyAgIG9lX211bHRpbGliX2hlYWRlciBic2Qvc3lzL2NkZWZzLmgNCj4gPiA+ICsg
ICAjIEl0IGhhc24ndCBiZWVuIHRlc3RlZCB3aGVuIGxpYmJzZCBpcyB1c2VkIGluICduYW1lc3Bh
Y2VkIGhlYWRlcnMnDQo+ID4gPiBtb2RlIGFjY29yZGluZyB0bw0KPiA+ID4gKyAgICMgaHR0cHM6
Ly9tYW4uYXJjaGxpbnV4Lm9yZy9tYW4vbGliYnNkLjcuDQo+ID4gPiArICAgc2VkIC1pICdzOiNp
bmNsdWRlIDxic2Qvc3lzL2NkZWZzOiNpbmNsdWRlIDxzeXMvY2RlZnM6ZycNCj4gPiA+ICske0R9
JHtpbmNsdWRlZGlyfS9ic2Qvc3lzL2NkZWZzLmggfQ0KPiA+ID4gKw0KPiA+ID4gKw0KPiA+ID4g
IEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gPiA+IC0tDQo+ID4gPiAyLjM0
LjENCj4gPg0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91
IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5
IE9ubGluZSAoIzE5OTE4Nik6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xOTkxODYNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDU4MTcyNzMvMTY4NjQ4OQ0KPiA+IEdy
b3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+ID4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL3Vuc3ViDQo+ID4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+ID4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K

