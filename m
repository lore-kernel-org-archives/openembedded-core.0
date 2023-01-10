Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0540C5479D
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 00:53:21 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web11.92057.1673311996713536789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 16:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KI04YIRL;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1673311997; x=1704847997;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EusPWqkRP02Fvp3VeueIdG3ijBjfXSUDYB+IiEqAPb0=;
  b=KI04YIRLitWNLeMmxiIQdztgc7iWNVlsXmeF6UPNz+MZyJXzC8IDoqn9
   Na3dG8qth3u6dV3+s8N8DLMZXkgh/lnSGuL/JwgS3CP16BLsfDzcrMdwn
   uGyb2P26HaHr7fMOPXFrnAJijmGN0WLgf04MLDFAg8dlD2gtlMJNGJQaB
   tNHmq9KtiXM8JsXJiOt0pZM2u3yGlPLlbfGIK5P72hMGRhIOrZ6OWrqQ2
   60sqTi/MiTLTnv+B1X2OGaIZSYUuRJSlqeU86nqBDrval9HexEAzIsWZ4
   aODePFfak3ucI96hhoM9d+CT31v43lk3iklBn5ZQ9HA1QhOFGb0CjbxPI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="73974599"
X-IronPort-AV: E=Sophos;i="5.96,313,1665414000"; 
   d="scan'208";a="73974599"
Received: from mail-os0jpn01lp2110.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.110])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 09:53:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwDQPS+AeXqf+htuUlcByFx5fbNI8H3pb6JO4tKIvEyg+fUz0PyZpxTNmckevmySlnoY7ZqrEHVSNDS35Isv+0pEc79bZOU5mTw8VgdLvbeJY1a84PPHqOaEjT9sDv4+zi7QWzuSjw11af/O7ehkf6IzfFrnJPmOiIqqdnbzHz8rOBVqkHoGZEY/Hs+mCS+BncJ3tveX/rtCGekOYcRbxyQTRNVkK0XPAj28n50GtfQBn69SE4l22AuXiXzdA4tk7qDAacm4KUs01rEbbYZCfVzOKp1FKj6amy+nGuWqCg1hMq5G45nqDE++9PNJziBlxufZEgKXB4gSZc+rfQNcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EusPWqkRP02Fvp3VeueIdG3ijBjfXSUDYB+IiEqAPb0=;
 b=CuKiSthU3B3k1kCjX8oN0Yboe9ngDoEZCne7txxFZbhjUku/Pk3/44GulSfcgkimN+mco6v02Vrst+sn2LtA6aHH6EjtS+44KGPoItFGmjCbjzh8wqMHq1JuN16JuTxGMPe1D6jTTe0ZtnBKB7sHY2NSCVZ85crNv8TYS2DdnttRpxEn+TUltT9Prj6Ua+7nkGuc9NzdkFpI6lw+dRU8iLxxjpzFTqE5vY69x4S0gLY5H5yEQohfRWSS+04WuHXHEfOy2IPRj9pqXNYK2lt9VgwjZONPpMZAFrfbQSFZxJ/OWBtaE1nZB0ryhB5ZKt2gM3DJpSaEeairmtMn7UWKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYCPR01MB6030.jpnprd01.prod.outlook.com (2603:1096:400:48::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 00:53:10 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::dee:2a48:6a33:db8]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::dee:2a48:6a33:db8%9]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 00:53:10 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] libpng: Enable NEON for aarch64 to enensure
 consistency with arm32.
Thread-Topic: [OE-core] [PATCH] libpng: Enable NEON for aarch64 to enensure
 consistency with arm32.
Thread-Index: AQHZIXEY1N1M+Rii3EeqS64AmfkWEq6V67UAgADsyeA=
Date: Tue, 10 Jan 2023 00:53:10 +0000
Message-ID: 
 <OS0PR01MB617885AF17E1B19027724DDDA0FF9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1672969740-3842-1-git-send-email-leimaohui@fujitsu.com>
 <90d500a25cd084c2e1a6238dddc17dcde60c125a.camel@linuxfoundation.org>
In-Reply-To: 
 <90d500a25cd084c2e1a6238dddc17dcde60c125a.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NjYxNDg5OTQtZTY4My00NjI4LTllMzctODVhNzY5ODZl?=
 =?utf-8?B?ZDJiO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMS0xMFQwMDo1MTozNVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|TYCPR01MB6030:EE_
x-ms-office365-filtering-correlation-id: 7d8cac33-9268-4817-cfc5-08daf2a50b65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NiRmTABJ2pdeFxVztQ3zkjgIz96SSM0Jr0GzpGTVIrEyGHEaj0UZ84dMj8RdQx9lbi4M94xpRxuFQRSVJtK9UlcYUylpO/IXiiSa376RswfDumD1EvBwLVI8bl09C9JB4vL7STFcrb8cw/FbjsKetwvvuToP1ZD1OtTP0Vk7v38nZTJggJj4Bk0j/RcnFx6REuDF74btsskwG5+YXPR7Qrl1BGr+twaclfqnvLiUcmDdv50N7m79yRmEkQLNSUuh6aGSEXIv0DIXZjngvUFT2Nq0U6z7JADgYttaPpgSfDHhBJyAWpTB6wYCnyIkqsPn1PFjLsLC2xuJhE3KLOiKdem4qlN9P/9YcuFmwYi0oOs+Az1cZX2xj2K52/fTcIUXtyMesA7F9uMBdgdiO0eaEFRg2D9b+DY2DFtJFxLsLBvpKO8mnwprjGXLVPUZWBsbTQoSZVNcvTq2dsve1SKLyAIvfx/ChaRJyFfKJuYdRpFsEPJb9HaB90QFDBNiXUPuneR7MVMQNT3ZZxoKurLZ3yqHPoIeinnD/xE+RfFYTQojE6e7otyR78zHhLEBR/2QS4AXdD/ZvwfyUQcWRUHzKQtn+KJd8g6cFx2A4slQ/XlPPmkja+dK2hSSzVbg3I+NTXl/uuaEuT6xRf/LAqe8ddEDZL4Pl++T0PGBlaguhuW89BStsia4fFUXxPukZFw/lArAPyjjtPrjhs05+gstZpgioL2DOa7rA6aVSzp/KxE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(1590799012)(451199015)(66556008)(1580799009)(52536014)(2906002)(8936002)(5660300002)(85182001)(41300700001)(66446008)(66476007)(66946007)(76116006)(64756008)(8676002)(71200400001)(316002)(7696005)(110136005)(33656002)(6506007)(26005)(478600001)(53546011)(186003)(9686003)(55016003)(86362001)(83380400001)(82960400001)(122000001)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UWZGZFpWcFY1ZFc0M2RXWHF1WVdFK0VBYjhjTW1KRWpsS2FmMVpDMXJNZGc4?=
 =?utf-8?B?QUVjSWxWTkJPMXRlOCtCLzEybjhVVndtVkZtdTgwdVo2bDFVS1hBQ0MvcDJv?=
 =?utf-8?B?NmZGSE1nbDJtVFNYSjROVEdOZXh1aGJ3K0QzMVpSVDc0L2hMR0QxbmZid29N?=
 =?utf-8?B?ajNoNnFJSEN0UnM5OHhvUk0weTNVS2xudjA1a1lWREtqT3F3OGZNVHlmV2x0?=
 =?utf-8?B?MVozOW1BamE4UXI5S0I3VjlWeklWU1JEWU9iZzN0eXQ3anR6U3FSMW51TUI3?=
 =?utf-8?B?UHBBRnBlR2V3QktIbms5MzRpRm5ESyt2cnBNRGUxckZrMHNycGVaaGNwOFJq?=
 =?utf-8?B?RWVRaTExN1F2TGFOSmNIN0NVMFFSZzBxaHFSSXkwWnAxbktNTGdlY29JQU05?=
 =?utf-8?B?MHA4aEJYOUx3ZjN4eXh2dkJ1MjRPL0VCc3hoMStzVFZpYXRsVDN0Rk43aEl5?=
 =?utf-8?B?UncxVGxvM1IveCtNZi8vODZnc2EySG5RQktERmovTmdnMzFmb1BMT1o3a2Vo?=
 =?utf-8?B?eEVKb1ZzNzA1NjE3eUVWODdoaWxIU01sRDNzOFlPaDluaDBwRXlERzdJN2tn?=
 =?utf-8?B?NUJ2MVlrQXVySzN3Vlk2QnlLSWNVK1RLci8vZmZWellmaXFKa2I3N28wTVM3?=
 =?utf-8?B?MDF3QTU5YkRqdmtUUEd3NGNNUEZ6dis4ZXByM2Y5VkJ2RVorNnRhNlNlbFpR?=
 =?utf-8?B?ZTFHNythTkdkZUNwWURQZ1ByR3BDWUxjUXhRRnlha1JFNVUxQkt4T0w4RHFE?=
 =?utf-8?B?YUtUL01KRHVKUERWdElyelpVeVBSTzl3blM0cnF3WnFieVBhQ1d0MU5xYlov?=
 =?utf-8?B?TWpzU0tDZUFYUnUwSElqa1k4SXgyT2NCRGFLOFNudWo2bk96L2pXOUhXWjVH?=
 =?utf-8?B?NjhmSFZlQ0NkelJXcERWT05pSTRCQzVUVWFRQmpYb0cyNUVFYWIwZnZPbXRX?=
 =?utf-8?B?cXRnVWpXQzVrWjk5emVyakZDY1h0dkJ2NnFOcGZ6Y1pKbXh1OFMzaWl1ZHVx?=
 =?utf-8?B?cUZUVGVlYTMycm5STTB3TmNiTlBBeWJndlcreGx2Wm9xd0t6TTFFWGdtZis2?=
 =?utf-8?B?eC9aMlplMzIxVVVjOXc0L2tDRGN2SGt4TStIYldSeFJJZC8vcUFJMENRZTR6?=
 =?utf-8?B?a3RiTEFaeDZvZzQ5OVc5RTJmR0pqTC9SRHkzR0JCY1d2TjNjOFdxS1V5U2Vp?=
 =?utf-8?B?L2MwSWcrSzFzd2xDMWhxVDlnRlM3K0V3TG13UXEvcWFCTkx3NmxYYm1ZR0d3?=
 =?utf-8?B?cWlEc2t4dVFnT29QbnZoVTJJZUV2TWtiMGgvakNDQU5pZzY0K3NVS2FqK1Rw?=
 =?utf-8?B?b3JQanUyajN1TUNybHpzZkVWODhaUmNWdG9FdmF0TE02TEtWWkduc2htbENU?=
 =?utf-8?B?TVBFNTB5ZWxaZFhDYTlGbWxXWDJkaDdzU1Q3WTdnNDRwelZCNElIVXl0M2JR?=
 =?utf-8?B?M2VWMkk1TU1QOE9sZnRiU0czT0puR29ZUmJ5Q0JYcXdSd29UR2F0NEtJb0hB?=
 =?utf-8?B?ZGRscDFmd3B4TmJwZHV3S3JIYS9IMVBUQkFVZjJWSElZRTBCQWQxY2ZpYk5W?=
 =?utf-8?B?Z1FRY3FpV3doZmZ3WG1pY2hkTExPTk5vZWJhSkFjSEJ3L0xjd1lTeFBnRVp5?=
 =?utf-8?B?Y3BUZkFhTzJPaVo1c3dnY1BUQytKdEdDNG5icUpJZjJJV05TOE05QUhMRnFR?=
 =?utf-8?B?UkRWVWZNODFRZ2Y5VmpUVU5Va3dHaG9RTmNaVzYvcGFPdEluQlpwT1V1RWxB?=
 =?utf-8?B?cDZOUjlocW50STdTV2dUcmJSb0ZBWVQ2djRFSnhKTXJrMXd6TFBZY1lBUGpL?=
 =?utf-8?B?WmpyTkkzTGVCUjZMNElGTzEyZEhzc0xNZzBaRTJkTnVwYWxiK2xMdmFJNFlY?=
 =?utf-8?B?V2tJdCtqeHpyNzN3UnF2Y2hZQWxxUXA4NWRUL0ZOaWlTNktTK1orWkwwTVlY?=
 =?utf-8?B?RWR5c2MvS3JRUzBVZzVUcHBWUnBrRldoQ0Y1OFpKQitJRVdaQXRBL2RuZERD?=
 =?utf-8?B?bkNFSnRFQnFuNkpPSFRad0pha2tXM2lPT1NTWmN5RS9kaUxIbHgyVkJrblRG?=
 =?utf-8?B?ZlZjTUFMVGNjN1V0bGhSR0haR1p4cnBzcCtlOHRrUUFHNWVpajdQL2hKbVhZ?=
 =?utf-8?Q?a3C14Af2PL0K5dMExV+QH0LIv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Z9ECbY+nrS91MTX2l0WhAxNwhRfSFNTgd28ouT3Vn9dDTXodCW29R+wwSC4bA0mVl13bUZLRA51IN7k0szpHrwaAlseKwh6hkyvvh19Rwig9uFmvzEjX/l3sAC9J/8UnezJqQCYzS5xRiA+i4n7t1zRdeSjOh7ahBvAQjf5rf2V3/3N7K9VxALjrnrLkRL7Y4FFBpg/ak1Y533t3mGRikQHL8bNXIbZ4dqUR1TL4g1a5MKyuWapYJFing9vDEacThE4QyskH7Kbhif96+OUUxtDtqS8mUMkjTdcYRY+hGKk3AUkk/+1TKLrX/+1PnG4Dx8vPgThDN0zcnkwtvaaRGAZazA0eriySEkvK/R6J/Qf8u5adaKcEb7ilR9bF97om6h7U26jZG2iHB241r5ISKO5CklHmYdiaUip7Q92vbJzXWFtdBzW4IEhrUzIfEHZdUCE7gRhjB29xgH4W8G1X4mfJ51MBw8Sd9ANj+TGm9WdTfn1myKNpxu/JqlCMx5sAEz4UVTedRj6vD0wGOf20A+P3P2wfLFgwJjvJqgw8GXV3Gp7aWXROOzNttCL+nwF0oEdpgTwEJ5bey1Gb0eOlkXlWINl5fA9jaotbcSWGC+3kgH3zsA6nKXEKThL2Rwkq32moEQPzv4cYkXi6Ve9x2JzlrlQUVe7Ym878EkBCHm228BA7ewoMEhfNkxEkgWKb2Ui9ujLlaQNkD/uXWRYe/xKmYXhxx4Pi76FTdYepQhMz1UDPdQjmUBp7GGLSw2bmHiItDJY5JbFop8yQWPrb/srguwH8b+TCLl4GuUHXfG4QAT7fs0b8zatq62KdwUr63p52TWStn/C5XQIaMBDQ9QmGYqoR66sAkiZOrYzUhnw=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8cac33-9268-4817-cfc5-08daf2a50b65
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 00:53:10.0312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLRLOKJSu3JZgeLw5iJjP7RgxU6PS1Z8oQu7J/Hwo0biWmkZ3/UacgzEjf7nVrdLz1Ga81BHMLpO1GM2iEqHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 00:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175703

SGksIFJpY2hhcmQNCg0KPiBJJ20gYSBiaXQgd29ycmllZCB0aGF0IHdlIGRvbid0IHdhbnQgdGhp
cyBvcHRpb24gZmxvYXRpbmcuIEhvdyBhYm91dCBzb21ldGhpbmcNCj4gbGlrZToNCj4gDQo+IEFS
TU5FT04gPSAiJHtAYmIudXRpbHMuY29udGFpbnMoIlRVTkVfRkVBVFVSRVMiLCAibmVvbiIsDQo+
ICItLWVuYWJsZS1hcm0tbmVvbj1vbiIsICItLWVuYWJsZS1hcm0tbmVvbj1vZmYiLCBkKX0iDQo+
IEFSTU5FT046YWFyY2g2NCA9ICItLWVuYWJsZS1oYXJkd2FyZS1vcHRpbWl6YXRpb25zPW9uIg0K
PiBFWFRSQV9PRUNPTkYgKz0gIiR7QVJNTkVPTn0iDQoNClRoYW5rcywgaXQgZG9lcyB3b3JrIGFu
ZCBJIHdpbGwgc2VuZCBWMiBwYXRjaC4NCg0KDQpCZXN0IHJlZ2FyZHMNCkxlaQ0KDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IE1vbmRheSwgSmFudWFy
eSA5LCAyMDIzIDY6NDQgUE0NCj4gVG86IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5j
b20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBsaWJwbmc6IEVuYWJsZSBORU9OIGZvciBhYXJjaDY0
IHRvIGVuZW5zdXJlDQo+IGNvbnNpc3RlbmN5IHdpdGggYXJtMzIuDQo+IA0KPiBPbiBGcmksIDIw
MjMtMDEtMDYgYXQgMDk6NDkgKzA4MDAsIGxlaW1hb2h1aSB3cm90ZToNCj4gPiAtIFdoZW4gTkVP
TiBpcyBub3QgZW5hYmxlZCBmb3IgYXJtMzIsIGl0IHNob3VsZG4ndCBiZSBkaXNhYmxlIGVuYWJs
ZS1hcm0tbmVvbg0KPiBmb3Igb3RoZXIgYXJjaGVzLg0KPiA+IC0gTkVPTiBpcyBlbmFibGVkIGZv
ciBhYXJjaDY0IGJ5IGRlZmF1bHQsIHNvLCB0byBlbnN1cmUgY29uc2lzdGVuY3kgd2l0aCBhcm0z
MiwNCj4gcmVmZXJlbmNlIHRvIGxpYnBuZy0xLjYuMzgvY29uZmlndXJlLCBhZGRlZCBlbmFibGVf
aGFyZHdhcmVfb3B0aW1pemF0aW9ucw0KPiBvcHRpb24gZm9yIGFhcmNoNjQuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+ID4gLS0t
DQo+ID4gIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjM5LmJiIHwg
MyArKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9s
aWJwbmdfMS42LjM5LmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGli
cG5nXzEuNi4zOS5iYg0KPiA+IGluZGV4IGQ5ZGNmMzcuLmIxNzI2MWEgMTAwNjQ0DQo+ID4gLS0t
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18xLjYuMzkuYmINCj4gPiAr
KysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi4zOS5iYg0KPiA+
IEBAIC0yMiw3ICsyMiw4IEBAIEJJTkNPTkZJRyA9ICIke2JpbmRpcn0vbGlicG5nLWNvbmZpZw0K
PiAke2JpbmRpcn0vbGlicG5nMTYtY29uZmlnIg0KPiA+ICBpbmhlcml0IGF1dG90b29scyBiaW5j
b25maWctZGlzYWJsZWQgcGtnY29uZmlnDQo+ID4NCj4gPiAgIyBXb3JrIGFyb3VuZCBtaXNzaW5n
IHN5bWJvbHMNCj4gPiAtRVhUUkFfT0VDT05GOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiDQo+ICR7
QGJiLnV0aWxzLmNvbnRhaW5zKCJUVU5FX0ZFQVRVUkVTIiwgIm5lb24iLCAiLS1lbmFibGUtYXJt
LW5lb249b24iLA0KPiAiLS1lbmFibGUtYXJtLW5lb249b2ZmIiwgZCl9Ig0KPiA+ICtFWFRSQV9P
RUNPTkY6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICINCj4gJHtAYmIudXRpbHMuY29udGFpbnMoIlRV
TkVfRkVBVFVSRVMiLCAibmVvbiIsICItLWVuYWJsZS1hcm0tbmVvbj1vbiIsICIgIiwNCj4gZCl9
Ig0KPiA+ICtFWFRSQV9PRUNPTkY6YXBwZW5kOmFhcmNoNjQgPSAiIC0tZW5hYmxlLWhhcmR3YXJl
LW9wdGltaXphdGlvbnM9b24gIg0KPiA+DQo+ID4gIFBBQ0tBR0VTID0rICIke1BOfS10b29scyIN
Cj4gDQo+IEknbSBhIGJpdCB3b3JyaWVkIHRoYXQgd2UgZG9uJ3Qgd2FudCB0aGlzIG9wdGlvbiBm
bG9hdGluZy4gSG93IGFib3V0IHNvbWV0aGluZw0KPiBsaWtlOg0KPiANCj4gQVJNTkVPTiA9ICIk
e0BiYi51dGlscy5jb250YWlucygiVFVORV9GRUFUVVJFUyIsICJuZW9uIiwNCj4gIi0tZW5hYmxl
LWFybS1uZW9uPW9uIiwgIi0tZW5hYmxlLWFybS1uZW9uPW9mZiIsIGQpfSINCj4gQVJNTkVPTjph
YXJjaDY0ID0gIi0tZW5hYmxlLWhhcmR3YXJlLW9wdGltaXphdGlvbnM9b24iDQo+IEVYVFJBX09F
Q09ORiArPSAiJHtBUk1ORU9OfSINCj4gDQo+ID8NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hh
cmQNCg==

