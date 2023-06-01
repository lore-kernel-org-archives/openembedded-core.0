Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14151C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 06:59:08 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web10.24981.1685602741655739983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 23:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1 header.b=vc+zkK7M;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1685602741; x=1717138741;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=SQMkEAQxbW9Xd8DoC0QHuRyA82itzrrV2vdxZvX6648=;
  b=vc+zkK7M4bdt5C4sSmoY5XD/BM96Q4wqqbmMOH6wRfLWUCPtqllPK/Uu
   0xWGiaQ4xU4XhQBmHKM9lGEZNdzl5djjT8pC4xHm/rDmdcVR/fXOJwiFW
   EBBwHBW864p1u4qTTvKmpY/CIOlu8+siMTUDkyF1BIdi02yu5zUCWrZLn
   wOWOsexNzO3tH1eEYeRoxCtBHTtC/cJPvcN3EZn+UoOG2sCam32XoWKTT
   yL8s9hM7CIYUyOZCSebptbJt4HoN7tHfNSn+zbPPx6fiwmUnuKgdr39JI
   GFMUrNueh9Uk4FZBR6O6hkzmI39iRAxLb/P4hnnuqwILMhAD5yX+2IaJn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="94042567"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="94042567"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 15:58:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Moq/ieOH97oEhcwkXCctZpblhwc3EawG+PStfa1K1KFdFs0fkppI4BPkPkXM8OCQmeWyl+CajB2nytXgKSdjbAy8WFcPsm723h1R1Q5XLZ34IzWeXX1mkFYWu1QMThVlZ7IYfUW2DPm7OswwB6DUorQcr3dWjicSJCe++qvvp+mKc1gfqPB2m0e38dyU2jjlrMC0/IdHFtaNjNxqz3xM4VbWqEgLQZzZ1WvK27aY9lHEFJCEgLFCgsiTwllMArQUJpzSUIMBtDO3IOieA/NLarNcbh07MVnn8NMGMIBFCL3V0O9XTt5EZV36c3dM4a/dlSGJjOHoc2HAPjNdv4BnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQMkEAQxbW9Xd8DoC0QHuRyA82itzrrV2vdxZvX6648=;
 b=XXaxia3QlsTxXnpqer+8kHRiHkpAbfhyXp0Rct5ve5kqH6EHS2oNwfoX2sis5peaso3EQbHqevkmjGH0hzR5moDtjpQXiE7aLuRKAt1L3il64UCZxZp2cf4sFpLDzvs6upUyeyOMkej/RMKt0pwmBxN8zRPRY6ts2/WwgymVjdKCiAqQeAfww7PXhD08xQSCzbCPzRaDTNhP34l0kcqx3pur7o77dQcik+vtNsslLXz6eHNgsHnTTxk3xU3hZivpndICS1NhB+UBwEc6INxaUvCnaHVzQvxHeBO1wC6MRGbTaC6c4LOqTOCfWwWNEjmm6mx5bpek9mRvzkW7QH5TjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYCPR01MB6191.jpnprd01.prod.outlook.com (2603:1096:400:49::7)
 by TYWPR01MB10603.jpnprd01.prod.outlook.com (2603:1096:400:2fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Thu, 1 Jun
 2023 06:58:56 +0000
Received: from TYCPR01MB6191.jpnprd01.prod.outlook.com
 ([fe80::f0c4:a51d:a996:14e]) by TYCPR01MB6191.jpnprd01.prod.outlook.com
 ([fe80::f0c4:a51d:a996:14e%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 06:58:56 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Is aarch64_be under maintenance?
Thread-Topic: Is aarch64_be under maintenance?
Thread-Index: AdmUVJ7Lf/hFeIQFSMaBIHGjw7h/Eg==
Date: Thu, 1 Jun 2023 06:58:56 +0000
Message-ID: 
 <TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?shift_jis?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?shift_jis?B?Y2UwNTBfQWN0aW9uSWQ9NmVkYWQ5MmQtMWQ4YS00OTRmLTkzNDEtNjA3?=
 =?shift_jis?B?ZWMzZWI0ZTI1O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?shift_jis?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?shift_jis?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?shift_jis?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?shift_jis?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?shift_jis?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?shift_jis?B?SklUU1UtUkVTVFJJQ1RFRIHKwMs7TVNJUF9MYWJlbF9hNzI5NWNjMQ==?=
 =?shift_jis?B?LWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRlPTIwMjMt?=
 =?shift_jis?B?MDYtMDFUMDY6NDM6NTNaO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00?=
 =?shift_jis?B?MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIxZC04MWUx?=
 =?shift_jis?Q?-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB6191:EE_|TYWPR01MB10603:EE_
x-ms-office365-filtering-correlation-id: bebf3777-9560-44e5-ef9a-08db626daaef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ANna4e3UTR6zAj2MGi/LkBVEY8uujwJgwV6hc4b3OvTKGbRkkveYWemUjabNRE3WxuEkFJrWDWHMtLIski54hvRJnuuum2c7pkviJiKPIqVQH5MftB0YS6S2sTkTeIVv/WVCfeHJe2n7MDyyqMMND78Wm27mJR+8S2FTWUtHUn+ceKkLJa3ESrNPkycZ/FVXCmkQAN+9YiwPBmTG8JEpvKJl0RKFL3FHHWQ+LCtP+J15VTJjOxduQhxcCe3H6gF2EsWeV74T7mxFn5D25XHh+SOUPVXTT9ceNtyt0354Wu20pl1uvc5Yx7y0ndOQ4DB2LitrzP9ismAP/i6O+ca/IR4YBuWP6hsxvWLi6buFpZ3tO1v3LtE2F+JpNuH5NvatrEUnl8IBrtdjB08w91aHmK9EWCqP07HkUPCvnlXXnZdfpTTWSG1E7uFpyYaD636X+zHQ1GKjrb93/aw5K59GMFJLlEL71yryKaUuBTZLny8pGJ69JhkdTL3mxFfxMk7d/lBnKREHY/etrQL+KMx/OZlimJxQoOgxS0boMPQ0aVdATx6BmtnT6lyWFUF35SrVUzgvpf0KbSuLXnnnSuj2k8WLmkx6mieQxVBjhi7fW9p4zNxkYf1NbfIckHLdy+PTiAxJrkjZxCEUlL2AN9IilQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6191.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(1590799018)(451199021)(186003)(83380400001)(66556008)(4744005)(6916009)(66476007)(76116006)(85182001)(66446008)(66946007)(38070700005)(2906002)(82960400001)(64756008)(6506007)(9686003)(86362001)(8936002)(8676002)(33656002)(1580799015)(52536014)(38100700002)(7696005)(55016003)(5660300002)(122000001)(71200400001)(41300700001)(316002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?shift_jis?B?UC9Tb1ZKZnc3UjVjWjBQNVVCbkRlTU1Ma3NJZHpReVcrZytlNm8yVWVi?=
 =?shift_jis?B?VitmR3VnOEJ3MjNOdmhvZ3U2R1VuY0dDNWovYkFwNlo3d3p6amV2VjEz?=
 =?shift_jis?B?WHFMTUMxVUFHK0RyNWhUOEJMdVlzaFNrU09HWUtMQTl1b2FvdWhIYjNa?=
 =?shift_jis?B?b0xXSzlLTkJHWnZmR1cvRHAxa0JnU0xnNDh4SmhlYk1VQno5RjJycFBW?=
 =?shift_jis?B?RWxnME91anByckJlcXZJSFZUV09EQ1FRakI1NmNpZXZuS3pVVXBNTUtS?=
 =?shift_jis?B?ZkVENFQzZCtvazRMWnZRb1Z4WlRiTU9rN1RLZ1daeHFYWE5FTXkwc3Mz?=
 =?shift_jis?B?OXhKd0pqbklEd0FCQWVwdDQ2Q0lxZEZiSjUvZ2F4bm05ZVpkOWNJN0Ex?=
 =?shift_jis?B?ek05Kyt3U01MZ1ZSK2x3Ty9XOStzMWlWWjJBci9WWk51WDU1cXprQTAy?=
 =?shift_jis?B?NG1HUC9mK0ZJSTlNV1hUTldvTGp1dG4xT1Q1a3Qrb1VrWFliZGwzaUlH?=
 =?shift_jis?B?bFM1R3BJb2cxYlcrUnlrdXYrMzNqbUdUdmphQlJTb3F6V3llMDVCZVpT?=
 =?shift_jis?B?Y0J5cEc0Tk56Zk0rcW1qT3BDZmxYanZqOXRMYmcrS2ZXcmpVN05vWExZ?=
 =?shift_jis?B?OEtYYVNjMGtJbUR1RjR0a0w2MHdwR0x5NGpWT09maW1IUC9CTTJZUngy?=
 =?shift_jis?B?NlpPdGFvYmsxNzR4dElTaTllZWxMVXhGNStld3dlcEp3bHNyQ2xCZDVB?=
 =?shift_jis?B?SkZEaWEwbzdDZGYvcnRoSFAwYmpMMGZMV1JTR0gwbHFNWG9ZeDFDOUcw?=
 =?shift_jis?B?L29tY1R4bnhJcllOZVpjSmhOZVJrby93SUIxZXFsNWNKM3p3d3RrVmRn?=
 =?shift_jis?B?TzlpYXZMSFR4SGZZUDhncmpuc25WZU9aNUNuSUdob1RabWZrZko3U2dU?=
 =?shift_jis?B?NVVaNVNhWWFqVDR0Z2pmTGs5YTdlWjYyLzZlYVdYNVF4dTZ3dnVLY3JB?=
 =?shift_jis?B?WEYxRlpoLzk3OXRLang3ZWNRMWhYdjJiMmpvbjJKZC93UFBMMkd5T2F6?=
 =?shift_jis?B?elpjMVpzaGxBN3YwOVZOTDdZWmtlQmd5amtIR2YvWWNDanZ0Q3VFRDdD?=
 =?shift_jis?B?Rm9EYW1kWFB5blR4WVBwVmEwbC9ib05wVU9IWElBS0dGZVpSTG0zM2wy?=
 =?shift_jis?B?bHRFdklvUm9RYXR3NlBpZDZDdElIc1JCTVptT3FQcUUyUlFLbzh0YTRj?=
 =?shift_jis?B?OG5Dakh1ZTQ2WDc1a0IzN0pOMWJXd29oN0JRMWJ5c1J2T05mVXRzRGpm?=
 =?shift_jis?B?MFhNaG9iZ0pmZ29pZVdDT29ybVlVVkthUzdoQ1IvT085NWI1U3VsN2pR?=
 =?shift_jis?B?cHJWckd4aWNMSDBQUUlGb2t6eFVXd0Y1emNLbTJGYy9qWmtDL2xnbU1n?=
 =?shift_jis?B?ZDArY0xzU0puY0VMZ2dWR1BJTjN6Tm9tVzZSNElIRDRDeWxHYmJGUXF0?=
 =?shift_jis?B?dm5jd0QzSTFOeVVHZGRaa3hiSjh5VE4yM1NUMEN2S09VVVBYQXVYZU9G?=
 =?shift_jis?B?c01QOEp5LzFDZDBTQlN0WWFtNjVJYTRTZWJyT1JNd1E3dW1rdThHYnVJ?=
 =?shift_jis?B?VmsxalJEZzh1aXBMWkRjS0NiYUZXa0ppQUVwL3phWCt3NkM0aWZReWdV?=
 =?shift_jis?B?NW1ZRk5yMDJlOUEyZ3p3dlc5MitkNmZyOC9OK050bGdQdWZEUkJhS3F2?=
 =?shift_jis?B?UjZvTUdJY3ZxNUNNZ1g5OGUzWllFK3FFekdNaWc1Q25YUkZRSUo1OC8y?=
 =?shift_jis?B?RjkrRmdtZzJLVXVMeTYzeHlkLy9aYzVnUzhRNVY5Y1VWM1pnRzNxSTlK?=
 =?shift_jis?B?WXBsVzlmOFV5azdHbUxVSGhiY2ZnbnlTcTNsUG0vTGZ2Tkpra2pVWHJE?=
 =?shift_jis?B?eldJYXY4eStPUytlaEFBWnh6b0lJRnU1RklhVWFwdENoaTVreWxhaEhF?=
 =?shift_jis?B?T2hYTWd3a2ljMVc3c05TQi9jMTlSdDVvSEhOdzFaWUV1RmFQdk5nRVVt?=
 =?shift_jis?B?VjFrKzNwSFpXTWtmNEhsRFFpM256OU82Sm43NGpWM282V3NvamZTYjZU?=
 =?shift_jis?B?YnM3eVF6NGl2OG5DcXlOVEh5eDFwMWpGc1pTVU9TRXNVREplVTZUS25q?=
 =?shift_jis?B?UGdXT0ZrSFJaKzcwbXBkYld1UG5KekRrWEpOMWJ0OHEwYitMb2ZUbHk2?=
 =?shift_jis?B?cllEdz09?=
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	d3sseVsc7lrYkGYSIc54jSslNEn3/IumXBWUovsV61+gw+Lc5psl/8+Qq4wkcCEeqHiV1Z5VOJZvnFbwSdUMMMFv9ENvkJ1/POjhZyFMXQUFKLVjyoIDrjU/OI46HFnenTR4KI2kyznOvMS1M9cZD/0nSzylAr5Y+LAJFni0fJwuipJjormSuUfNRjC9+N/g45/ZEQ9CmJL5HJC/PpG+P5ecZbbY9mgnlL9NMrjWbV3d18CIoVLy7Bx4hdJFIJfxWvMlYzYpncmLGPOTs38bs2z8Nh7n8YzJ1l+08vp3RVxuOP/ppWYgUYOLxBtcvCMziAS9bt5mgatoT1tGkTzG38wG1+55+emJlMTM/r3fTgd7knXd0Rtd/b/GXumVOitklSuSIikAHdpVggaHHm9jpNfYWy06Bg1BqCpRHNjvkrD/kchuJirFQc9L0g4awMPoNxqQYqQ2cNIKIwfdg3/q0HvQtbN3njqaYK01J+DUvww6bWL7A5PgBnUbQ420zZ1d15+p5V/VRYvKCVwsapNZG5yYwnM0m7KcsbLvLyepUaonSSe4loM9Kn3JQ4keBZYIs8VSl51mZyFkxXT2EUB9pDO4FT+z/JAvh55AhEGN+q68Lvz2td7JwPCUcsMMUclMIRrW2g/BRF/rZwAwYAW2/t9W3aKkxPMEnwWhsxqZZUypMgnory/pnra5QEUqP37tKlYROFQTXLJUSgLlURgqt8Bc4kwp5io0x7sS84+ZEQ1OSmfCbCsOh/Ey2LrMebJC3cp0Yf7qT/RmyaJLaht6LNTSp7syAdVTgtVzlw6FqUI=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6191.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bebf3777-9560-44e5-ef9a-08db626daaef
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 06:58:56.1765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bv4Z8282WIUJf8odH3Jkh+1YbowPeCDivJ26JSAm7+NeplWnfSqzYku2zZafbRG230Pi1LT4au4KsZJ4+pcgIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10603
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 06:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182046

SGkgYWxsIA0KDQpSZWNlbnRseSwgSSB3YW50IHRvIGJ1aWxkIGFuIGltYWdlIG9mIGFhcmNoNjRf
YmUsIGJ1dCBpdCBzZWVtcyBnbyBiYWRseS4gVGhvc2UgcmVjaXBlcyB0aGF0ICJpbmhlcml0IG1l
c29uIiBoYXZlIHRoZSBmb2xsb3dpbmcgZXJyb3I6IA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KfCAuLi9mcmliaWRpLTEuMC4xMi9tZXNvbi5idWlsZDoxOjA6IEVS
Uk9SOiBFeGVjdXRhYmxlcyBjcmVhdGVkIGJ5IGMgY29tcGlsZXIgYWFyY2g2NF9iZS1wb2t5LWxp
bnV4LWdjYyAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIg
LVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNy
b290PS91YmludXgtZGV2L3ViaW51eDAwMS9idWlsZC11YmludXgvdWJpbnV4LTIwMjMwNy9idWls
ZC1wb2t5LXRlc3QtYXJ2OGJlL3RtcC93b3JrL2FhcmNoNjRfYmUtcG9reS1saW51eC9mcmliaWRp
LzEuMC4xMi1yMC9yZWNpcGUtc3lzcm9vdCBhcmUgbm90IHJ1bm5hYmxlLg0KfA0KfCBBIGZ1bGwg
bG9nIGNhbiBiZSBmb3VuZCBhdCAvdWJpbnV4LWRldi91YmludXgwMDEvYnVpbGQtdWJpbnV4L3Vi
aW51eC0yMDIzMDcvYnVpbGQtcG9reS10ZXN0LWFydjhiZS90bXAvd29yay9hYXJjaDY0X2JlLXBv
a3ktbGludXgvZnJpYmlkaS8xLjAuMTItcjAvYnVpbGQvbWVzb24tbG9ncy9tZXNvbi1sb2cudHh0
DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpJdCBzZWVtcyB0aGF0
IHFlbXUtYWFyY2g2NF9iZSBkb2Vzbid0IHdvcmsgd2VsbC4NCkFuZCBnbGliLTIuMCBhbHNvIGZh
aWxlZCBpbiBkb19jb25maWd1cmUuDQpTbywgaXMgYWFyY2g2NF9iZSB1bmRlciBtYWludGVuYW5j
ZT8gT3IgaXMgdGhlcmUgc29tZSBpc3N1ZXMgaW4gbXkgdXNhZ2U/DQoNCkJlc3QgcmVnYXJkcy4N
CkxlaQ0K

