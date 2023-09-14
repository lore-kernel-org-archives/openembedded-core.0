Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FA9EE0212
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 01:09:06 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web10.2182.1694653736838466696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 18:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KZGrPeR4;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1694653737; x=1726189737;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5seY0wLtzIn6sHiQdvjGnoRIHLThyzVYLOFmwTtNQhI=;
  b=KZGrPeR4C9szcyyqNXUaDg50gkdCJGUZTnzyp0bNfQGO0fxlAGIVQHTq
   VY3Qrf0wjQn1uaKWMA4uhShgkjc1J8FcqdR6Vd9BiyVjGPMIYyHeX6P2r
   TGChPljAoSYy52hdEvZi4nsRlCoTE0WcRF3RGexpXFd5cOmHsj4KbZCh/
   O1VPerLa9AM44s7q1J5YPnLSR1+EY2xYEtq4xxZ00+IistH0flBPBCssp
   R3S0eUF1X0+Q5RlKJzTus5qGbk6mZu+abCqpfYZpzyMnJNOhLRPk9QB9U
   +40yxo0CnZsuJmH1vFNkh2sDHgu6tpXzk33Vd6gl9bKudnjClRY6TaftO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="6287819"
X-IronPort-AV: E=Sophos;i="6.02,144,1688396400"; 
   d="scan'208";a="6287819"
Received: from mail-os0jpn01lp2112.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.112])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 10:08:53 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nmpxc57iQIFkgG376Fv0lW5ecZjdkXAJifi+gsdkYAiZDb60i1ck3j5qSBBNOFqZY/Ac+q2QAU6Z+zpO/m2BC75Fe6IYdpp2NzK8MJQVQBcxavu6ghp40697sP07JEvD+AeC04wAxAubKTPksn+N0UZnC2vS66xXCYJYD/Cmlj+ZTsfp4LAECMDHwitTEYYkXFl/0jfJznrGkmthxkfwMOoXCjOZplGU03hJi8MOZHBkxZmCCPtwuA4fPlnFajq6BewCSlEp3BoxTAXpO0kYqXukgA5PWmg5aovhJwJtnEpimLzP1w82M0MaUCl0AxgdW0/4Wj4Vu/Cx38VXp4lERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5seY0wLtzIn6sHiQdvjGnoRIHLThyzVYLOFmwTtNQhI=;
 b=l+MsF4y3jttVCUtkTpsefk9G4GdJJzVvXVi0VgETwJ5m+GHYctKxAcJL/LREfOowkmc2PQWdIw3Clli3mcyydaHX7MvlLDyA+MouSuH/Jy/PqSYgfFM6G6tDCGB0nPDdHTLv5o79Ua5DSlvGttDzKe9EFPY0Fd/3gO2N4Rmf601av2WU1fkMVDzW3cAlJZhm1+zbD8UgYggDBk+ZTJL2Is7FKMJiZxAwbGirDLD7j8rDyMpJbTsZDV1vQhJIqlczu6FZEqdwJgkvrZXNb5o5H8Fp6mSuAqaTYGW9Inv3rmA6SGGS/gE4TQTvm6UmLjQ5xIGuKOfIYUeOFN6YGAy9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TYWPR01MB8808.jpnprd01.prod.outlook.com (2603:1096:400:167::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 01:08:50 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::d0ea:74f:3b21:9273]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::d0ea:74f:3b21:9273%4]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 01:08:50 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] [OE-core] [PATCH] font-util: upgrade 1.4.0 -> 1.4.1
Thread-Topic: [PATCH] [OE-core] [PATCH] font-util: upgrade 1.4.0 -> 1.4.1
Thread-Index: AQHZ5iX6yhytYvSOKkyAWsGHh1N9UrAYjS6AgAD0dtA=
Date: Thu, 14 Sep 2023 01:08:50 +0000
Message-ID: 
 <OSBPR01MB1845CA86AD1B0020FD325044DCF7A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1694597797-21673-1-git-send-email-wangmy@fujitsu.com>
 <0b4b6a18c6a9eb8af992da05201a8c601b02f21c.camel@linuxfoundation.org>
In-Reply-To: 
 <0b4b6a18c6a9eb8af992da05201a8c601b02f21c.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NWE0Y2MzMDAtYzNmOS00YWJiLTg2NTgtMjFhYjZkYTY3?=
 =?utf-8?B?ZTExO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wOS0xNFQwMTowMToxOFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|TYWPR01MB8808:EE_
x-ms-office365-filtering-correlation-id: c1414e0f-e12b-4f23-7e98-08dbb4bf2819
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RvBI0dlyiCeyEZOb0pxHvUnSjwFJyqlaLdh/i9tO5QCWqxS6K76mB5nPXqctPnzq4DZrrVtr68eiTcqgJSz1xJfiW2ZYSYFY91m21aUXyl6IKtA5LDS3XP96xTTbKytfxGIws2w9XqCpMk0IBjn4htM9ICE7wDG3eaMBaSFGIlVVF/NlwOM+SBc+R15TcxgDio/fOVlQLWnjwzL7A2u2MbIy3c2v1t5XKfiuyZYhAlrdyZhSf7zrs9endrfy9WDi969PKeaFko8uIW9MLkRurNwQG5ma4vgniop4JQLQpuzSb4ubLi+0f6MvZAlQuNZa/mUfCEbmg76K6YvC8hhymVlDtM4Gzzja1rO7ZhnOzS9sAdNRUupPdfhb+DsADswzIR+3lvIImNfuGBZT+WhEB3S9r3dw8rXrBHU2RNNkflCdftLLshcujvzMJZ3x7zeGFUpDASlh4VcRj/Jjn6hzwuT6qGTUyXiavPsFJDEyY0gJdUMaHFGi+Mp20wV4XY8s4r4zHqpbDfE3EU83EaP5GRmZq5NGV1Wp+CGVzFp9wulbq95GNZrLAkUfFBQfbn6WN0lzNbKnPYexAEQMyggY4b/H2GjIUzTSbZLhFvxJQTPeoOA6CqX13wEZUdYBhT8y
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39860400002)(136003)(376002)(1590799021)(451199024)(186009)(1800799009)(1580799018)(7696005)(53546011)(6506007)(71200400001)(9686003)(478600001)(966005)(83380400001)(26005)(52536014)(2906002)(64756008)(8936002)(66946007)(76116006)(8676002)(66556008)(66476007)(110136005)(5660300002)(316002)(41300700001)(66446008)(33656002)(85182001)(82960400001)(86362001)(55016003)(122000001)(38070700005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T0JWTjFHYy93eFYweXNJbTR0MC9BSisxekpLOVRXKzQ0SnI3M2xQOWtmaUE3?=
 =?utf-8?B?V01kMnpnQTNzbHhBazZpb1pKT1lhSTZXdS9BMzB2cTB2VmdIMWdpUUk3bkV2?=
 =?utf-8?B?amNPRU9CaGN2RVZ6aEdlVVpHK1JqbHc3cmQzaVhBUzVkYVFSazR6Z3ZSalhq?=
 =?utf-8?B?MVgwMzdEbFNFT3Qwd1NJbzVLakYxc3pqRisvOVFiWEdRcXUyVWZ3S1JlcmRw?=
 =?utf-8?B?WHYzdjA1WG1PS0Y4L1B3ZWxpT2haSExqeGdEMWwyNTJvZ2RyanAyL090T3lQ?=
 =?utf-8?B?MXYyUjRZTkFwdGVvM1FaQUcxUVBQbllJUUc4K1U2RkM1R21OeE1CR202NjJL?=
 =?utf-8?B?em11ay9NL3JsYzBoYktiUTdFVW44UHVyeXc4MFpSZXFOTlM2UitDVjcvQW5R?=
 =?utf-8?B?OGxhaEVKSUZvRkwwME12ekViMCtZbTh2ZVNEL0swNUtPYWEwUmFhSUZXZXBK?=
 =?utf-8?B?QzZacjhUaUtKV01Ea3QxK2xLOVFnL3JGS284T3VPUklrSjB2WjV4V3RMZnUr?=
 =?utf-8?B?UDRBZkEyVE1UZi92c0o1dHQ5NCtrMTl4ZXNqcSsrYVFSTkFYWjRMWVhLWUJq?=
 =?utf-8?B?aEtDd0NKeHZ1YmlPSWwrQ0ZVR3hBV3VYQjZtY1l3NHpoQXZGSm0rbVJMalpn?=
 =?utf-8?B?cHVuZE9MS0l4cFRTenZEWGU1QXoyMEJuTG82VG5KdnR1WDVHc3l6NFc5WXRB?=
 =?utf-8?B?WllwME0zMUZhZnMycG1CbzNYTVNJY0RVTEVFU3p5czJucjYza1V6OElnRVdE?=
 =?utf-8?B?VjNRODgvb2ZQK2NqZU1HVmpGSHVHeGl1MG5FaytYa3Uycld5dzRZY3RpNWUv?=
 =?utf-8?B?THhXWkZ5aDVKVmtpKzY2SkFSbUlkelpJQm51UmxKZmhpaGNYSzVYUnF1c1or?=
 =?utf-8?B?L2lmTEFVK1JQL0MvRDZxbnBrTHpVU05vRWxObnZRL0hLNEZZYWJTdEw0WnJs?=
 =?utf-8?B?TzU0dnlXMjFDUWVBR3MrMzg4NEdiZG9CTlJNOUo1SWZWdWRudnhXdXUycHlQ?=
 =?utf-8?B?Q0NlbkgzYTZhdTludnhQRTY4VENZR3h0TCtEdEFLQXg3dncxUGdocThsWEZ2?=
 =?utf-8?B?cmgyTDZ4bk5MWUFiaEFyakNLUXhNZGJ2UlVsTWJRYy9RVjVwZkhOd00rTEpF?=
 =?utf-8?B?ZzVkVm0vcVUrWkhNZHhLWC8xRnpWUCtmYTgyWG1mWHBYWTRaYlNPVW1ZbFls?=
 =?utf-8?B?TXFtVW5WSnN3MWU4UGpkTXVmZ21XUnJBTXZsbUtidVYxVnNIMWtkWFZwNGpD?=
 =?utf-8?B?ajNrcWpFOHgwWHRwaXdLeFFlK3JYMjg1VHMwU0FyT2JoY05lYm5tRkppNU1N?=
 =?utf-8?B?ZWpHSTF4d3FoWW9iTVVJTWswWFJjUFBPeUlqdmtNb2ZuUWl0VmN6NXJYZld3?=
 =?utf-8?B?YnFta1BXMmdmM2xhMERNQ2FKcEhQcjluT3hUTHprNXF2akxyc0xnaTdaclE1?=
 =?utf-8?B?dEE1dFlZbnlpZUlhWVBobHlvWURrcDlPalBCZ2RnTk5aTWR6VjlQMWVEV0Ew?=
 =?utf-8?B?dHFnZVdOWE5KRytNUkI2bm1ZelV0Uk9tbkFiQ2YzL0grQTlNaXhoZVdoaFlU?=
 =?utf-8?B?VUtGQ3BzbE1YUC9mWCtQK2xRWHZSZTlZMEhMbExqVTlvRHJ2dkVLQUI2dTln?=
 =?utf-8?B?bzlJM0preHg3WDdBK3dwcWVQVVV2NERUNi9RdUVuUmF4eUFyVUpEQk9xOUxi?=
 =?utf-8?B?N0UvUzZNS0RlWHNGSkh1b3FnN1h4Y0NZT05GSksxY3FRaG1tTDhaMWtOMkFl?=
 =?utf-8?B?SFFRWkIwOG9BQ0FWb1RVaExoMWJ5eGNpWE1oV0FuVERWcERFbFQraWFmVlFW?=
 =?utf-8?B?RTdRVmIxM09XSlJLQ3l6d2oyL2NwRnM5VUFhOCtIVXhWVXVtdjZHK3M3a1Fn?=
 =?utf-8?B?S1NmQlA2OC9JQWFlMFRXQlllMDVWNzJOdEo0Ty9CVDY4azNtTEtPQXE1QWZL?=
 =?utf-8?B?VDdzWDFzUFhMZ00xcEc5RUN5Q2xMWDhRWGJHOExOSERmR3lzaUFvRTlqazFs?=
 =?utf-8?B?SEJubEVlNVVtMUNNbGEreTV1TWFDcEZTOTVYN2RnUEd4WWRhOXZxSjJ3a0Mz?=
 =?utf-8?B?L2F3SFFjYXZXOHIvMGZYbi9RVG1TS2RuVGpKWDZpSDFnTEp1a1NZSk1FWXdX?=
 =?utf-8?Q?vLYIPA5Y6LIBGO4jveAixHfry?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+foFUTDYwWRfOcEs8nfsETYV36seP955Aoj5Rne7et1DUDY3car3Pvh3RGfgXmrq4x/pEjQAejMmxIoBdipL8crRj0L18hXZJLaOOdubk9MRt8ru/HhXz2oSK7EI15BwDCYrXf8lPXQm4DlLW4t0blWyzHPLtbJVJAMgx69wuJe4OMpF+/+0As1oN0/E8urkDEH+OgxFoFi5hUaj89CffjroTGJypeF+HvLRAzzdhQoLcSTYZk35SUTK/TCJIcFJQQ95h7frytcHWZLg5SIBW2QwaPqZNzh3eVVXeAbC+vuGOPSgDvWwxkEHLqQlGp2rGZck60vvV2zN7dadNM6EHe9PJkL4OU9ZM/N0rQu8jD7YMttdfjmbXI3gw9Xl/lzfjhdfimj9VJ0DYETtrDdy2iTW9/09vVnnGZhaxn+Q4W8JsUasvT07oNioDiCq50NUEwVmCKoZzQy5P3n2r45vBA6ZuQeW4EOPNrGplIsr1TKmil2Bghpo13Zd7qFDz69lD7YQ/YSrnH0hu5MF6gDOSgnV3bY4962n399RVW0aUC8Wel8Jg14alq2RT3/Tsh78fhPm+uTAGEak+IbWxNmzp9pLTJwAsc2qEzFCwFBNP5GeCBZqALF90xZf+CjkUbMzxkBK4xIhAbbg2dn7QpqpDLy1sJBL7tltrYCgWcZodpl4Of83w80R3bmkNK8dbUhG5p9wR+SdQINqK0/qxNN1PfCMqkdzhCqEqsGfQgmbZZ41PNMMBQKppaMQb0RwoF+RALb2lGPWxzEh9yIv66plk6uP1tQWgB77HH3PNQBxZUeU8BJdLK14LDxdLY1vweU0eSxMQJ3ebNQ9lqZmnK2sfA==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1414e0f-e12b-4f23-7e98-08dbb4bf2819
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 01:08:50.7206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Wm8/NU82x7Hukj2WIpGqxCIuXF2Z83qjaeNKnWDdKXHwXCiyf0C+hNzTZiDwb2ZZ9hHFZ7pJqDt+W5tbrl15g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 01:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187622

VGhlIG9yaWdpbmFsIExJQ0VOU0Ugb2YgYmIgZmlsZSA6DQpMSUNFTlNFID0gIk1JVCAmIE1JVCAm
IEJTRC00LUNsYXVzZSAmIEJTRC0yLUNsYXVzZSINCg0KVXNpbmcgdGhlIGxpY2Vuc2UgY2hlY2sg
dG9vbCB0byBjb25maXJtIHRoZSBDT1BZSU5HLCB0aGUgY29uY2x1c2lvbiBpcyBhcyBmb2xsb3dp
bmc6DQogTUlULW9wZW4tZ3JvdXANCiBVbmljb2RlLVRPVQ0KIEJTRC0xLUNsYXVzZQ0KIEJTRC0z
LUNsYXVzZQ0KIE1JVA0KDQpEbyBJIG5lZWQgdG8gbW9kaWZ5IHRoZSBMSUNFTlNFIGluIHRoZSBi
YiBmaWxlIGJhc2VkIG9uIHRoZSBjaGVjayByZXN1bHRzPw0KwqAgLS0NCkJlc3QgUmVnYXJkcw0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5n
IE1pbmd5dQ0KRGV2ZWxvcG1lbnQgRGVwdC5JDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdh
cmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpIE5vLiA2IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAw
MTIsIENoaW5hDQpURUw6ICs4NisyNS04NjYzMDU2Ni04NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZB
WDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCmh0dHA6Ly93d3cu
ZnVqaXRzdS5jb20vY24vZm5zdC8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4N
Cj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTMsIDIwMjMgNjoyNiBQTQ0KPiBUbzogV2Fu
ZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gW09F
LWNvcmVdIFtQQVRDSF0gZm9udC11dGlsOiB1cGdyYWRlIDEuNC4wIC0+IDEuNC4xDQo+IA0KPiBP
biBXZWQsIDIwMjMtMDktMTMgYXQgMTc6MzYgKzA4MDAsIHdhbmdteSB3cm90ZToNCj4gPiBGcm9t
OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gTGljZW5zZS1VcGRh
dGU6DQo+ID4gLSBSZXBsYWNlIHVuaWNvZGUgZmlsZXMgd2l0aCBvbmVzIHRoYXQgcHJvdmlkZSBi
ZXR0ZXIgdGVybXMgb2YgdXNlDQo+ID4gICBJZGVudGljYWwgZmlsZXMgYnV0IHRoZXNlIGhhdmUg
dGhlIHVuaWNvZGUgdGVybXMtb2YtdXNlIChTUERYOg0KPiA+ICAgVW5pY29kZS1UT1UpIGluc3Rl
YWQgb2Ygc29tZSBvbGQgbGljZW5zZSBmb3JtYXQuDQo+ID4NCj4gPiAgICBodHRwczovL3d3dy51
bmljb2RlLm9yZy9QdWJsaWMvTUFQUElOR1MvSVNPODg1OS84ODU5LTEuVFhUDQo+ID4NCj4gaHR0
cHM6Ly93d3cudW5pY29kZS5vcmcvUHVibGljL01BUFBJTkdTL09CU09MRVRFL0VBU1RBU0lBL0pJ
Uy9KSVMwMjAxLlQNCj4gWFQNCj4gPiAgICBodHRwczovL3d3dy51bmljb2RlLm9yZy9QdWJsaWMv
TUFQUElOR1MvVkVORE9SUy9NSVNDL0tPSTgtUi5UWFQNCj4gPg0KPiA+IC0gUmVtb3ZlICJBbGwg
cmlnaHRzIHJlc2VydmVkIiBmcm9tIE9yYWNsZSBjb3B5cmlnaHQgbm90aWNlcw0KPiA+ICAgT3Jh
Y2xlIG5vIGxvbmdlciBpbmNsdWRlcyB0aGlzIHRlcm0gaW4gb3VyIGNvcHlyaWdodCAmIGxpY2Vu
c2Ugbm90aWNlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlA
ZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi94b3JnLWZvbnQve2ZvbnQtdXRpbF8xLjQu
MC5iYiA9PiBmb250LXV0aWxfMS40LjEuYmJ9ICAgfCA3ICsrKystLS0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkgIHJlbmFtZQ0KPiA+IG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWZvbnQve2ZvbnQtdXRpbF8xLjQuMC5iYiA9Pg0KPiA+IGZv
bnQtdXRpbF8xLjQuMS5iYn0gKDc0JSkNCj4gPg0KPiANCj4gRG9lcyB0aGF0IG1lYW4gdGhhdCBM
SUNFTlNFIHNob3VsZCBoYXZlIFVuaWNvZGUtVE9VIGluIGl0Pw0KPiANCj4gQ2hlZXJzLA0KPiAN
Cj4gUmljaGFyZA0K

