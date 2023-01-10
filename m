Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFBDC5479D
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 00:44:01 +0000 (UTC)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
 by mx.groups.io with SMTP id smtpd.web11.91851.1673311436451902721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 16:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=kqdiwNDz;
 spf=pass (domain: fujitsu.com, ip: 68.232.152.245, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1673311437; x=1704847437;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FvClNjTAl+qGBX5sJ4TzdVQpEnxzp30D3EQ3wEMT2sI=;
  b=kqdiwNDzIAvtVUg1+bdlH71hrdsRR1ATGFZsbmc7WTyM86OO3cQeUfUZ
   a5yopeETQ+Cy2FeO8mxFXiuCAHLeR1G6ZTai6WMJH1QzFnLDSxXI4cHuM
   zTkYtdYJoBNPAAaM73uVBtXr4F0+aCZ7fsLdoqLhYRmImcfL206WyH//F
   EwQ4EjsaMXX9LqGfgCkRzRbyEAf42JMloi+uQEAuDITH4Ki5LrEficiCH
   NPwONm3WRE5YL6WC25M2pKLzB7v80+4wgcoSeN4LeA2PBIWVJd09yG60f
   vvm6fgzUlfPvRrLifhMFZShs4CPAitEAiL3ujE5DY6kGEcpvt3e3l3sTA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="82291186"
X-IronPort-AV: E=Sophos;i="5.96,313,1665414000"; 
   d="scan'208";a="82291186"
Received: from mail-tycjpn01lp2171.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.171])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 09:43:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXb9rizPjUGyEC7UERKHqzO5xzOyNpsUJB6pyfeo/0euCl/lwGAOJTxFdQmoZJeIx1K7R0rELAYg0/zNAOXozc+bNwaTB9rz2Nhy7X5GQDfasq2URffmbwzDAhSrltOR/4cCXKFFKOyxKjGRpuhpySMjHiyP2PycmU9VMaPIPOP5heMZztqDsOWkLui0TLBV2PRHvU/OhhFkWJ+xEH0puaQG5tbioJjlWjDSYFIJKplAe8fIpNsr3jFuRaerYtXyopLzKUETJ8mohqfRdbi4gy2xk+Kx2HhKBSUwuKoZ348heWzhxRWvqsV3ePBxmsh6pv929xb+x5tBmHLjtwc04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvClNjTAl+qGBX5sJ4TzdVQpEnxzp30D3EQ3wEMT2sI=;
 b=RPaohcIu/WLZLUjiqEY+GnasO2XsVHmxvbogl4Iw1zx3HYt7JgT5SFBBWlDPLpDMZWuWciZQvPHv8duu8I2vnOHWaJrlCl+ChtFdFJ8WWxq5YcZONvBWEvgeQiIoNlp1xDJMDsy0SQSAX69c+aQaBI1Nu7TPtuBPIyEiTjQfLbdIizS3fys2ZX0GxYt0tsPYvHB7FJ0sp5OyjsD9n0zG8bWJ7lyfJ6blsVdUN3nvCS0B+7CGrE/w43tf9ufyAmmCECwdKX+wHHRzi+ifOOPJst/NFHOAgvIvLfBiPzibjMHQ7R4YR8oHOX9Giwqq2YBQr0DhMsVamWjFfO0Ish+PxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYCPR01MB7799.jpnprd01.prod.outlook.com (2603:1096:400:181::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 00:43:51 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::dee:2a48:6a33:db8]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::dee:2a48:6a33:db8%9]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 00:43:50 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] How about move nghttp2 to meta-oe?
Thread-Topic: [OE-core] How about move nghttp2 to meta-oe?
Thread-Index: Adkj2+zm7yzO6zgxSd2sMM33OOqvFgAMenUAAB+MqoA=
Date: Tue, 10 Jan 2023 00:43:49 +0000
Message-ID: 
 <OS0PR01MB617847A78FD3AA141D22EFC0A0FF9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <OS0PR01MB6178F685B87CCDCDCDDCC32FA0FE9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj8u-5c51tDTSEnDXo2NVo8Rxem4UHvrZr5uzz9Fg7U-qQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8u-5c51tDTSEnDXo2NVo8Rxem4UHvrZr5uzz9Fg7U-qQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YzVjM2IyZmItNGJmMS00YzM1LTgxYmYtZjJmZjk4ZTZl?=
 =?utf-8?B?YTc2O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMS0xMFQwMDozOTo0NVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|TYCPR01MB7799:EE_
x-ms-office365-filtering-correlation-id: 754138c4-bd4c-4b62-acd6-08daf2a3bd9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uZwcdPVCK5xsvAOjdfuTks1WEr0ZifPCAS8OeQKT5GdyQ+4AQgHLbqLjqeiP4BGCE8fSdsojHdg6m+nUwqsJFmM6w6IMOGkPjDf7U4dVuC/NkZNRhwIiRst5ckmyCOxMwoLzWUESCNWnnx7Y7SIcU3nyoI4TsylKJEjx1aWWftpkNe7JbKJT9vrWfFDfZwEq91nPliPi5gWmEz6EhxKGh8Zq8un46+Vf6zmLJBM2krifJWK+BpZtf2UVtmcmIWkocgFFvrWFUpNLZESmvMe/Vg4WKeHkzLgu+/Cx6uxSnrKhMBlOZLVfItHwYdwCsWeVSPZw5JLDbYKI9BgZTMrUY0Mv+oXmBxOJF4DVvdgUhepMwJC8cbDYVnrEZQB1KAICyMdr+xO+TwXsKFbARVlQr2QFPSTdzqvPCeZ9VWhr16wTevqTgZ9xGAq9tabxzxSNjnjHbz9KsWTAqIPlUYkoUC97fkCQ33y6/BhyY2CYN34nkBCv95Dlhbb7zA1LvKcq0ycoT4STUCvLTSCvzeQrAkmsK5eaml+3G7d3VgVaRFIc01SQBroc9kDO09r+U+cSJzW6tMHkAfieO5QmJoQ1MQHNz9Sc5rNcFvjBOs7NQg4Z2GnkJb0b1ZPlLpfsRW20g1KLfhIGm53EP3rZbkNlVZIeMrE2o48ISZSw6Zl5i3hxIdKjabbKu63cV1TvsaK2hEQCmJRj3Hx+aumZAe9cCd/Hqx0FdQ9OUb7jaYWBOJc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(1590799012)(451199015)(33656002)(5660300002)(316002)(71200400001)(26005)(9686003)(7696005)(186003)(478600001)(41300700001)(76116006)(64756008)(66476007)(6916009)(4326008)(66946007)(66446008)(66556008)(8676002)(52536014)(85182001)(83380400001)(8936002)(38070700005)(86362001)(55016003)(53546011)(6506007)(122000001)(38100700002)(82960400001)(1580799009)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NU1XbG56ZHFlcGFMRk0wS3FpOXA4dDBRZ3k2Sm9vVjBhZFFGVVEvaWVFb2s2?=
 =?utf-8?B?ZXFoY25GQ2IxL2lkc0JPYWdyUWJ0MHRLNENpbUpBektIL0dMcTBsYTI5Q2V1?=
 =?utf-8?B?S0lkQldDWDg5eG9lZ0o3blR6azZzV1dJTjduOWpQR3EwRHFDVE1BUTBHVjVa?=
 =?utf-8?B?b2ZNT1NDUEM3T21ybXJKRHFiVTZQdDNhT2FPWGQzRklDREpnRmJJbFk4aEJV?=
 =?utf-8?B?Vm1WbnlaRGpTZ2krQlBZUWVQcllsZ044dC8vMVBOYytqSyt2MkE3NkdxTnY1?=
 =?utf-8?B?Q2VoS0VZZDlTTFRjUTdCMmpJdTBNL3pCYXZUQ2lBcDJ4QmJPUGFIZng4ZU4v?=
 =?utf-8?B?UFJQZ210aXZYVDEwd0pWSi9NYUZTL0Flb0tud0JRL0w3MFVjdFlWbUVRYkR2?=
 =?utf-8?B?ZVRrTlBTeVFBWWFGZiszV2kvcXhHbjIvcFlYS01Dc2JmQUw3enNrZmdDcGo1?=
 =?utf-8?B?Z1pXSFNsRWd4V2pTS250RFBuU1JPWmhReVBIaU1jSk9IQkJDNXBUWlZmb3FD?=
 =?utf-8?B?QWoyeXJsbVFXeERGZWRPSEp2SU9YcjJtMUp3WTRIL3Z4U2kwbzUwK0pLZlRH?=
 =?utf-8?B?WUxKRktFWFp0RHYwdElNR1JiVDY3OUNmK2pqSG1SeFdJdDRrQ2ZNeUt1bHlS?=
 =?utf-8?B?d2J2NWZjZFV0dlBjV1JBZjNoT3MwZEtwUElHM0poRS9yeWVUM1l4THNlcFY5?=
 =?utf-8?B?K1Rna2hXVWF0N21qMUZ6TWlSek8wUGVvRmF4Yit6eEF6bit3SkxqTld0QklI?=
 =?utf-8?B?QW9YVlFmV3NERWVKR2ZTa0syejVtSVVjb1VYTzlHNFR6cnRIUVJJcU94T241?=
 =?utf-8?B?cmFBemxFVktmeTh4UE5NYmZnUFV1NVltWm13QXBpVFU3cUZ3U3VQdWRDZDFi?=
 =?utf-8?B?a3BRdXphRFBOQ0piMG9aVW1ERUxtdWxnTWVqOHNqYkoza2dPRzdjeThsT284?=
 =?utf-8?B?RTIwWmJobk5kT01PaW8wcWpYcTRCcGFQYlJhWSs2ZmNHbzIzUUVNanFSaXJZ?=
 =?utf-8?B?ZTlic2xZaTBwWFBTRjJQeHJQTGZESU5LQWxtMGpZTFhkSk1jVUkwMkdDSjhh?=
 =?utf-8?B?Z1lPVDEzUE1VYVBwZWJGSzdsZERnY1JmZGdkVklXMmZXZ3QzUWV4ajJWOWVz?=
 =?utf-8?B?blZCVWh2SVcwajJQb1N4Q09jeEFxUkh5d0FGVVM4d0xMeTBnV0dMWU1yemZ3?=
 =?utf-8?B?ak9QbkFoOEoxeWtVVEwwUEZFaHJCU3FucW11MWFBZ3p5QXRKUGNrMHJwV25Q?=
 =?utf-8?B?SDJCM2NiZkdpV0Z4dWszSEtyek5zcHAzcnBiaDdERGZsQytxem5wbkdZdWk5?=
 =?utf-8?B?RmlqdWJwbE02S0Fnd0FrbEorSXNnS0VMSkc4a3RvMllpbnlnbE1sWWtlTldY?=
 =?utf-8?B?TE4wME5WMW9leTJCVkZhbmpQdkNLOFFsQU9hT0VHMEdsSGxCZll0amJJbzYy?=
 =?utf-8?B?eFEvUHpwMk9Cbk1LcXhYQTFKQWlFa3FONFh2MEpkWXMwWHNWQjhLTWcyTUpY?=
 =?utf-8?B?UGRBcFBLSXNVcC84TjR3d2xWczBZQkpSYUEvWkVMb2g2eTVKMUpqNmg3K3Zj?=
 =?utf-8?B?KzMrTk9vUXBnQWZkWVR2L0FHUnp4VGR5SmdtVnhudzdMeVRBZGxneEhMWkZn?=
 =?utf-8?B?bUpvVnkvc2xlWFVNcy8vaEpNaE0wbTVYRG0rYVpRY0grM2gzQ0Z1QVVPSDZm?=
 =?utf-8?B?WFp1MkVEOFJ2bSsraVpmY0ZoTlE0a1ovSmc1RjIrNDIwQzVlWTNmcEVYbUFi?=
 =?utf-8?B?bjBaSWhrSHFHdzJXZ3hvOHpTWkdtVk54VElUY2VLTk9LMjBFN1pRMUVKczBk?=
 =?utf-8?B?M0EwUnZrbFRSajVoZStjMFJCVkUwT0F4a1pyZWVrOVpaSlhJTzdOQ1UrSVUr?=
 =?utf-8?B?WEVacjRUR0hRZGtMR0VhaVlhYTZ2QnVjcHhZZkowaktXZGhSYWZyTm41WVJQ?=
 =?utf-8?B?TEFoSkdVT2V2dHEyODVKZDQzelRhZjdEbnA3T1AwZUFOMlc0ZE53Q2VZMkFT?=
 =?utf-8?B?dDkyaXI3Q0pyYUtKaml0UjNVZDN1Snlab3FKTlp2ZEpsdVVKbjVxMXNsUTdN?=
 =?utf-8?B?QnJRL08vRUk1QzZZZ0VqSTM1ZEdPUE5wVjVZSVJnenhOZ3ViR2J6RkptZFlP?=
 =?utf-8?Q?zRFej+CLNOARXVUKlPX0kBqqI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	UGUlxkIRxeofkmD7/VTxFMX10aodKK4qGsIo8AqtlDl/AhtfRC9QOjfde9CjxvTIjWiDFNU6WjVR6NVCmMun4WbA9VxIfX/Q41eGhD/GhxAQ2N6DsGrJACj55C4Rl3NmkHvV+85Huz+nTlTsJKDcNPlujfF9hhVZi4glkAnb/xFLDTl8AvSR+5xH7+mpn397b4rTylMm92ohSY8t2MRtK6wsQVcC+6HUejxFrYw5Tr/0L4rampfXeRYpx36gH6bR70vJMu0nT/UGVSCTtbz+3VW3By7HId2CdB2bY09erVqboz7NrgL1/df2RjpL6KMXwZx8zrjhuhKyIbwZz0NRJLuIW3VusS8T2ltzyEgiS+95Osl0wTwikJEzFVq5/f+e8N65x24b5OsTG5Ei6i1miPmNCFskjAz8Tb7TDJ8PR86SMWzlnUL78sd/mNSnNSdAgIjeFv6FXsisjlGW/pptphd15brtUa7rxw+E/9wJo9+2jXebi6h0a9NKYj6bK6SCj/vtfJRMt1qfKVnDgfAg2W84I55uIvxEyVzaCO0wY0rQyP3ro+bnPiPDR2Cm/UdZKn2NP4YGFJHTFUByh3zsQZTluPKAdMX6IFQ3ui2QNmKUke9sw2rRmRaassTzE9/IJXb2xfIZU9W4s/KUEme3z8vYksPhrGq0CbBLt/9TWCb1g0cUGLgOnff1NxsYH6Da7TRP0IBVgXl/rLKywgocsxqFIH7SHRJ4TTgW46ldLvWnS8NQeJG9un1SavxMbPg+MtF+7BBYRIJvoMk0p+5xzVJlNL2CVJIc1Ya5Lx9EP4vpLGLtRGcASZnMMtBn+hwn
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754138c4-bd4c-4b62-acd6-08daf2a3bd9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 00:43:50.0474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtyMXSsppJgIw00ec3QYEx0dlCuweS3IMcBrmI76qFIaHmEkeA2wKyKRIjY6KEfcN7yNbA4nCf0a3FMGGcXOvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7799
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 00:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175702

SGksIEFsZXgNCg0KPiBsaWJzb3VwIGhhcyBhIGhhcmQgZGVwZW5kZW5jeSBvbiBuZ2h0dHAyLCBz
byB5b3UgaGF2ZSB0byBhZGQgbWV0YS1vZSBsYXllcnMgdG8NCj4geW91ciBidWlsZC4NCg0KVGhh
bmtzLCBJIHNlZS4gQnV0IGhvdyB0byBmaXggdGhpcyBlcnJvcj8gSSB3b25kZXIgaWYgSSBjYW4g
YWRkIGEgYmJhcHBlbmQgZmlsZSBpbnRvIG1ldGEtb2U/DQoNCkxlaQ0KDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSA5LCAyMDIzIDU6MzYgUE0NCj4g
VG86IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IENjOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
SG93IGFib3V0IG1vdmUgbmdodHRwMiB0byBtZXRhLW9lPw0KPiANCj4gT24gTW9uLCA5IEphbiAy
MDIzIGF0IDA0OjQ2LCBsZWltYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4gd3JvdGU6DQo+
ID4gSSBhZGRlZCBuZ2h0dHAyIGludG8gaW1hZ2UgZmlsZSwgdGhlIGRvX3Jvb3RmcyBlcnJvciBv
Y2N1cnJlZCBhcyB0aGUgZm9sbG93aW5nOg0KPiA+DQo+ID4gUHJvYmxlbTogY29uZmxpY3Rpbmcg
cmVxdWVzdHMNCj4gPiAgIC0gbm90aGluZyBwcm92aWRlcyBuZ2h0dHAyLWNsaWVudCA+PSAxLjUx
LjAgbmVlZGVkIGJ5DQo+IG5naHR0cDItMS41MS4wLXIwLmNvcmUyXzY0DQo+ID4gICAtIG5vdGhp
bmcgcHJvdmlkZXMgbmdodHRwMi1zZXJ2ZXIgPj0gMS41MS4wIG5lZWRlZCBieQ0KPiA+IG5naHR0
cDItMS41MS4wLXIwLmNvcmUyXzY0DQo+ID4NCj4gPg0KPiA+IFRoaXMgZXJyb3IgaXMgYmVjYXVz
ZSBuZ2h0dHAyLWNsaWVudCBhbmQgbmdodHRwMi1zZXJ2ZXIgd2hpY2ggbmdodHRwMiBkZXBlbmRz
DQo+IGFyZSBub3QgYnVpbHQgYXQgYWxsLiBTbywgSSB0cmllZCB0byBhZGQgZW5hYmxlLWFwcCBv
cHRpb24gdG8gYnVpbGQgbmdodHRwMi1zZXJ2ZXIgYW5kDQo+IG5naHR0cDItY2xpZW50LiBCdXQg
cmVjaXBlcyBmcm9tIG1ldGEtb2UgYXJlIHJlcXVpcmVkLg0KPiA+IFNvLCBJIGNhbid0IHN1Ym1p
dCBhIHBhdGNoIHRvIG9lLWNvcmUuIEhvdyB0byBmaXggdGhpcyBlcnJvcj8gSG93IGFib3V0IG1v
dmluZw0KPiBuZ2h0dHAyIHRvIG1ldGEtb2U/DQo+IA0KPiBsaWJzb3VwIGhhcyBhIGhhcmQgZGVw
ZW5kZW5jeSBvbiBuZ2h0dHAyLCBzbyB5b3UgaGF2ZSB0byBhZGQgbWV0YS1vZSBsYXllcnMgdG8N
Cj4geW91ciBidWlsZC4NCj4gDQo+IEFsZXgNCg==

