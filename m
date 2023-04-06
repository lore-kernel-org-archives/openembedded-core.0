Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C933C7619A
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 01:55:22 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web11.148967.1680746121287186439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 18:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=gLfBMNzh;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1680746121; x=1712282121;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GfY7qkMB8eL1y8qOvrA9qJDWRRNGyUlsfTjEOQ/yKww=;
  b=gLfBMNzh69ywiL54eV43g7VtA152K4cq2sZKXC2qm0Pu7SFq10WNsiLJ
   JGA4MDINkAbFqFeDBvar7DNLhHEqqKFJuMy1WnYSiFlQZOPaY6h1JN+4L
   NoW/Qvi92KL18DGwFmEfWAoUTV5Esgombb9D4Fa/HAbwVKGw/ijXGwnEW
   IRUjfh+JXAlH/WsOcPzgJpCkUq+iyUhfSNgO77a2ovHmA5ocqaDjY4odx
   YDFfy2/JCPt3V/x2vTI76DULFv/owK8nyt/b69eWhBlEkKj2MkYbPS55O
   Xiwxx7dWMJV4zE4g8+Rz+IUo3z5jIaOq9h38DNqi+krYg9jTGCXgSN5gX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="81410715"
X-IronPort-AV: E=Sophos;i="5.98,322,1673881200"; 
   d="scan'208";a="81410715"
Received: from mail-os0jpn01lp2106.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.106])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 10:55:18 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpadmH+u99sjBcnQxx2YqwmxkolkKOB0NK/gEPJtXiuOOJbLiegMI7IiAeXCrtgRFss0vxEMOznxox1DHr1plVJtwXiYfYahClW7XI0uVoHNgvCmyNYbOnEm+4JSjiYZDmiUf9/XsfFwAim9x9tHF7Ctl5LOpQvPRvYX7Ap0O9leeJ8Mwhk+quTuOdhIaM0+zFxpWw1gsdMZYTgJkgjoh/P1pTGobeYq5xtRqefzG5SpVx2na/Db3HfhptW7muoC+rIVzxHoFrCS6LLi0zGmuLSTlkXyFNkUwePv1uJSeRD9crVZ380RTcUOovLhOa7XgYs6pHlnO1SZPzI1a5E3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfY7qkMB8eL1y8qOvrA9qJDWRRNGyUlsfTjEOQ/yKww=;
 b=OruZ0XKh3WRdNDcs6TQJiIWKBIQ2KFsvk5YmkOSJk1CpBK9PPSl/rIMJGu5DuKlNY929uWu2fe2tlUlJxuwmgUFMDehzh9V0SxV3E0pHm89K1s47n/zAAiStDC03CJTmp1lw5HlZ9LLdNC77g8eXss9mrmeVbkSOXXgLaNNrPbOcBSmKT8awwInux8F9z5H0KbVeA7liEu4vTg0q4VjNHt5nmzFB6Yt/p5zIZH2o2pCC5XtIqoQiqEYlqpbygL+bha9HPRWYQ5C6Q8wDjB3OsktRu8/9r6401dhvFw//tVkTgUvmxdWNWKqCje8dmN+JcV0JO+M0LOYqZQawyRSgJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com (2603:1096:604:1c8::7)
 by OS7PR01MB11729.jpnprd01.prod.outlook.com (2603:1096:604:242::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 01:55:15 +0000
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::4bb4:7c26:81d3:efbf]) by OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::4bb4:7c26:81d3:efbf%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 01:55:15 +0000
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "fnstml-fujitsuten@fujitsu.com" <fnstml-fujitsuten@fujitsu.com>
Subject: RE: [OE-core] [meta-oe][PATCH V1] lz4: Add ptest support
Thread-Topic: [OE-core] [meta-oe][PATCH V1] lz4: Add ptest support
Thread-Index: AQHZZtxNsSy5tqOvcUydU3w2/jjSnq8bMpUAgAJN/HA=
Date: Thu, 6 Apr 2023 01:55:14 +0000
Message-ID: 
 <OS3PR01MB951514ED0047CEF94AE8BE37BA919@OS3PR01MB9515.jpnprd01.prod.outlook.com>
References: <1680602399-5469-1-git-send-email-qiutt@fujitsu.com>
 <b0fb4536b693be4e8f1e564a8d6d8ee9031c9ec9.camel@linuxfoundation.org>
In-Reply-To: 
 <b0fb4536b693be4e8f1e564a8d6d8ee9031c9ec9.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZjliYjQ0OTUtYzE2Ny00YzZjLWIxYjktZDQ0M2E2ZWZh?=
 =?utf-8?B?NzlkO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wNC0wNlQwMToyODo1MVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9515:EE_|OS7PR01MB11729:EE_
x-ms-office365-filtering-correlation-id: 25ac07f4-a119-4ef9-c611-08db3641f721
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dVI085W8PnJ5n8WZKIhkJdXLKkvjIIcyZ5U3ZazGG6LA9BGdP+KEIfv+xgx354Uk2RUb3TFHS+oDLnCEKeFY1bK8jSIeSi8lfKZ6TB7srrvT/P5NFTkiMdTebVuI8F2VE/Zjlf3UUDpbXLcNYmP49jCHb1DI9dH5evg5nAfXjFiDSmynQdXbwnUuYZDXqmhdw9JmDwKedz5L5aDsHrsch2F2BeYR6Sl8KrGfBmdPDfC2/ggUwUmvc/iYQcHIFY7NQL2cVZ6JvlePej5grvIYS5nbKLN5btN3PF0VR6ekAPhYPN3incse9b1FUi+6CQRdxtto2I3lmpLhWM+XsAqaXTqz1F3HoX2v56EWk5B0k1CKW8/mj2N0MkwTbMyci3w5nhE+lsOlNhrrPlYY9K06bKg/VJ8GJaEoiF2tqYwFkHKlvVWiFGDTy3cEQY/tU7rl7/LszYe0CKy2EqmIYc7GCZ+pkjCyY+D57+YyaCnl0dHGZLGSe0nU+uzCynUQ/o9pGrH4P7eoIK9yE1N/xQRxi8+lhtQDiZf1ilOu4NZccz2r3U3isHkyqR4Hw+40RXRldBCmX6l9MT0eIYLO73ICrg52B6jBvrfhW2qarFhXqsBN7x0fzzy4DhPaQeq3ErePhLh2uDpRqHPzaCvtU49bJg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9515.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(1590799018)(451199021)(53546011)(6506007)(186003)(9686003)(107886003)(2906002)(26005)(1580799015)(83380400001)(82960400001)(55016003)(8676002)(5660300002)(7696005)(8936002)(52536014)(71200400001)(38100700002)(85182001)(478600001)(122000001)(33656002)(316002)(38070700005)(66446008)(41300700001)(110136005)(76116006)(86362001)(64756008)(4326008)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YnMyQ1N1WXpNZ0hnYkxpaFVrVFJmeEEyeGJRVTNSWVhhWUZXQ1RlSjd2M2p2?=
 =?utf-8?B?SnQvaW1FTGh5Yi9DS0ljOHdxeHp1ZDd4NUZ0QnRtNDBFYURBa0dnNmFoV1RZ?=
 =?utf-8?B?bW1rdEJwN09NTEFXWWE0OTVITnVzNEljVlYySnNrb1kybVFHREN2b295Zk9O?=
 =?utf-8?B?akxmbk9hblJQWTRYOEJlbmgwaVA4eDUzTzVFcHNrQkhkVmRFSm4rR2Q3U0dN?=
 =?utf-8?B?ZnlhZTRYY1A1bjROTWtBd1VHMnpGOXF5QmdITTJWdjQrK1NNWkFFdExkNnpF?=
 =?utf-8?B?YTFxT1NDQTNFbzJkOEd6bUlDd3U1U2lMV0UvVGoyclhnQnlvenA3WGViTEZo?=
 =?utf-8?B?S3RZM2w3WlBrcGkzNjgydXBzQnYwTkFNbGdOZGMyUGV2MGF3cGlyWFVaOWV0?=
 =?utf-8?B?eG1weTdmSHdHeUhZMGFyVzlQKzF1RjZqenRzbmhOcUdoRURHbFFsTE9LMSti?=
 =?utf-8?B?d1I1NE9BN3oxN0pMKzdENkZJbVpyd3luSTdVLzduQWNYdnczN0VSRU9KZS85?=
 =?utf-8?B?T0FZY1J3WW90OC9wZVQyNjVyRWNYblUwWjNFRktJVnBqcXZhMEZWVndTZHlR?=
 =?utf-8?B?U0x1Q2I1bkVlSWxZUUJaM0NoY25xZ2dQUEFJdDA5WS9hbHVkVHBTTS9HbTJ4?=
 =?utf-8?B?eFRScGcwZHNQM1BXRUpOYUFBc1NrRDZTbVg1M2pHOHMxdkZFRExBeCt2N1N3?=
 =?utf-8?B?T1ZnUGtUYWM4elNJU092cDlmb0ttN0txSmxIK2QvRzdpNnNmek11enVRV1hM?=
 =?utf-8?B?aU8zaVM0WFhreEJ4WDA3K3ZtbjRETmtudGErTGJ0SUdiUFFxdjNrR3h6QnE2?=
 =?utf-8?B?NmFiNzNLVUFNLzFkeisxczcwZmxGYnJsQWJUY0l0SW9vYnFlRm1ITFF3Z0RM?=
 =?utf-8?B?MWZZazFxeXR3b016KzZucG5PZXhPbSt6Qmdsb2tNVVcxMzRoOTNXMk42QmYw?=
 =?utf-8?B?cmgvMnl5WGZjV0VGRldPTE5CaUhyL3l3RXhoeDhPeG5id1pRd3YvRnBZWHUx?=
 =?utf-8?B?STlZWm9xLzBrc3ZsTFhCbmJ5YUdUOHVPcjMwMWZPZFNrRkpaSnRoL3Rnalgr?=
 =?utf-8?B?VWU2Zld0VDJYMG52WDdRYThYOFVFUU5FcDVURTY1WWk1TURiSHRseXdlK2sw?=
 =?utf-8?B?aVRWajg2cDhBSDV6WVhFV0dnSjNDQ2RSZllKTDh0M1ZWY3dqcWlWMW5GVHUx?=
 =?utf-8?B?WHBlQ3BQV1huVmJpdnlLMlhtak9qYmQyWkJKNWlPSGhGcmxWV3JVNEN4ZGg5?=
 =?utf-8?B?UVF1dEFnM25rVHNnU3ZSWUxneC9Bd2JSalI3MUNxaXRYbk5TaGUrZzRVNmlU?=
 =?utf-8?B?bTZhSVVYdThaUnF4YWY3MEcvckp4cFFWM09Gcm9zdUl5Y2xwSkRvK3JDVVdS?=
 =?utf-8?B?dWQrQ1JhTElqQzFTZ3Vzalpvd0tDQUdzem9LWFk2eERYZkN6RlJBWTg1a3Rp?=
 =?utf-8?B?cndoVUlZNkhxZGswaFhGYTlmQUhVWmNtdE1UczA3MnNydFNHalUwek5DWlRV?=
 =?utf-8?B?UDhtUDdYQlY0L1pUSFNTMzFVakdQS1cwakcraURpdjVXWFJadmp4ZnRLOE5J?=
 =?utf-8?B?NGhmMlZxNmRDVDRzOXJjT0NIOHR2QngvVHU3OUowOC9kUVNoRGdVOGVDcGNL?=
 =?utf-8?B?WjJaS2N2dkZrN0FYR2hDRHNoWUJqU2JWR0hlS21aN0xsOUo5a1dFbktQcjQ3?=
 =?utf-8?B?bHhKNDdwYXUwNFBod2U5eHFFM3pCUGx3Z1d5YVN6elhwZEFMYTdyQ0F5cG1i?=
 =?utf-8?B?RlpaenBxRmRIMEgvNnMyVFBva1UzMzVtcUIzNzc5eU45SnVIQ0tPOFZVejZt?=
 =?utf-8?B?cWV4Y2d6aXBzdkRhSlhNa1JOcThsT2M3MHJPMTNnRzNyUUF5eTRhMkdJT2Ux?=
 =?utf-8?B?RlVlUUZCNHZEdzNtSGN3bW92dng4VDhjMzVnNVp4cGZtMkhhMDNrNzc5OUlZ?=
 =?utf-8?B?dE1YS04xcVBKa25EQmozYTF3eHdrRnlnMUxVMEtMak5IYzhGLzYydm5FZjJh?=
 =?utf-8?B?b29JNnZHdFRPR2dQOHVZeXhDWnZPWXJKWllsQ3ZSbUR6Zjc2R2NuUWdQMVgv?=
 =?utf-8?B?UHFLNjJFZDlkdjJkUmhnY3ppTHdYdm9md01TS2d1ZGJicUtaV2xVYWowa1JK?=
 =?utf-8?Q?ZFjw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	TdPAr/xMkUhzm0evzyAjhrafzrP+w/BMcSDwVTmbBXrAwmgzMW/g8DwRcCx+lin/4JG4awFwhsC17wO6vmbIK9RzmoUJ13GpUe0o7xxaEmhRXSg5VOiXu/5QnJpTa4l0Sxs33vuevi7LIXeiHNjlKflkoAE0sEaCwJYaj0V5axiZnyzulY16+byCc4G2MRURpyK/4SeCeK0XwL5x4TYgOc1iZAqyUU/NAQAIz+6L9Ak/3NL6gsvY/+9H2NntCAZSPlZ/EP86x+sNLPKHeRuxI+Tzx2uIwCwRn2e6UFO81YchQELtNuBGqi6ZLVUtkwbTGF3/MX8P1Hp2dTayAKd7sgY1ZDHzO7RJy7D0uHUdTfucayvRTNk0uUsx2L7YtYR0kkxPac/ae+gocbcR+pawGzOEJ5PePzrC0R5P4KYXQsY7kO5YEZOc8i9e+oRJwUSDZJ52z24PyrsE5I5j99ppJo1Do1vID9IsLMITMDNzH14sjqsADu21AUTVkoFnmjfYZpqP+y4Un976fFUo19zUKpZ5BQS95BcyctlLVycTFaZYc3OKD9DkHXfvslyJITBd32EnBxT5zevNQ2VSuGZXCJ+7eJozgO5p+eBQ8+QcWTtC7diFGkZiDibFDAa9VfuKG8mq9o/6dtGCmgwdBQebT9Hp030NoTMt/hqC9BL/Ci8YrpbIb/ij/d0VnAGqHP7y7wEaahKONAvRMOefVy/+ZmteKjNK08vjkTBi9EQAzUYDtt/Ruh+kZjaZ8ntBCXV7KKUepiJov7wAdIYZkrOmO3QDu143mqA9VOQipwu9CrzNIa+ZaiHR3LN39UPT7q1bu0XXwsLazIs5cZk7XtCx8A==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9515.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ac07f4-a119-4ef9-c611-08db3641f721
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 01:55:14.9644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJbRUOo1BhA7iUIKyIF51wgnNSyewJISC0ogavP48MdrCgk7FdUMdfny0FhU7Xbz5Q99jRTYv/UzPOGWHSzpqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11729
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 01:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179754

SGksIFJpY2hhcmQNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNo
YXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDog
VHVlc2RheSwgQXByaWwgNCwgMjAyMyAxMDoxNyBQTQ0KPiBUbzogUWl1LCBUaW5ndGluZy/ku4cg
5am35am3IDxxaXV0dEBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IEZOU1QgZm5zdG1sLWZ1aml0c3V0ZW4gPGZuc3RtbC1mdWpp
dHN1dGVuQGZ1aml0c3UuY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFttZXRhLW9lXVtQ
QVRDSCBWMV0gbHo0OiBBZGQgcHRlc3Qgc3VwcG9ydA0KPiANCj4gT24gVHVlLCAyMDIzLTA0LTA0
IGF0IDE3OjU5ICswODAwLCBxaXV0dEBmdWppdHN1LmNvbSB3cm90ZToNCj4gPiBGcm9tOiBRaXUg
VGluZ3RpbmcgPHFpdXR0QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gQWRkIGEgcHRlc3QgZm9yIGx6
NC4NCj4gPiAtIEl0IGlzIHRha2luZyBhcm91bmQgMjUgbWluIHRvIGV4ZWN1dGUgc28gYWRkZWQg
aXQgdG8gUFRFU1RfU0xPVy4NCj4gPiAtIEl0IGNvbnRhaW5zIHR3byBjYXNlOiB0ZXN0X2ZyYW1l
LCB0ZXN0X2Z1enplci4NCj4gPiAtIEJlbG93IGlzIHRoZSBydW4gbG9nOg0KPiA+ICAgU1RBUlQ6
IHB0ZXN0LXJ1bm5lcg0KPiA+ICAgMjAyMy0wNC0wNFQwODoyOA0KPiA+ICAgQkVHSU46IC91c3Iv
bGliL2x6NC9wdGVzdA0KPiA+ICAgU3RhcnRpbmcgbHo0ZnJhbWUgdGVzdGVyICg2NC1iaXRzLCAx
LjkuNCkNCj4gPiAgIFNlZWQgPSA0ODUNCj4gPiAgIEJhc2ljIHRlc3RzIGNvbXBsZXRlZA0KPiA+
ICAgQWxsIHRlc3RzIGNvbXBsZXRlZA0KPiA+ICAgUEFTUzogbHo0L3Rlc3RfZnJhbWUNCj4gPiAg
IFN0YXJ0aW5nIExaNCBmdXp6ZXIgKDY0LWJpdHMsIHYxLjkuNCkNCj4gPiAgIFNlZWQgPSA3MTU0
DQo+ID4gICBPdmVyZmxvdyB0ZXN0cyA6IDY0IGJpdHMgbW9kZSA6IG5vIG92ZXJmbG93DQo+ID4g
ICBBbGwgdW5pdCB0ZXN0cyBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5IGNvbXByZXNzaW9uTGV2ZWw9
OQ0KPiA+ICAgT3ZlcmZsb3cgdGVzdHMgOiA2NCBiaXRzIG1vZGUgOiBubyBvdmVyZmxvdw0KPiA+
ICAgQWxsIHVuaXQgdGVzdHMgY29tcGxldGVkIHN1Y2Nlc3NmdWxseSBjb21wcmVzc2lvbkxldmVs
PTEwDQo+ID4gICBnZW5lcmF0aW5nIGxvdyBidWZmZXIgYXQgYWRkcmVzcyAweDEwMDANCj4gPiAg
ICAgNjU1MzYgLyAgNjU1MzYgICAtIGFsbCB0ZXN0cyBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5DQo+
ID4gICBjb21wcmVzc2lvbiByYXRpbzogNTQuMzI2JQ0KPiA+ICAgSEMgY29tcHJlc3Npb24gcmF0
aW86IDUxLjEyOSUNCj4gPiAgIHJhdGlvIHdpdGggZGljdDogMzQuMzM1JQ0KPiA+ICAgUEFTUzog
bHo0L3Rlc3RfZnV6emVyDQo+ID4gICBEVVJBVElPTjogMTUxOA0KPiA+ICAgRU5EOiAvdXNyL2xp
Yi9sejQvcHRlc3QNCj4gPiAgIDIwMjMtMDQtMDRUMDg6NTMNCj4gPiAgIFNUT1A6IHB0ZXN0LXJ1
bm5lcg0KPiA+ICAgVE9UQUw6IDEgRkFJTDogMA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUWl1
IFRpbmd0aW5nIDxxaXV0dEBmdWppdHN1LmNvbT4NCj4gDQo+IDI1IG1pbnV0ZXMgc2VlbXMgc2xv
dywgaXMgdGhhdCB3aXRoIEtWTT8gSG93IG11Y2ggb2YgdGhlIHRpbWUgaXMgaW4gdGhlDQo+IGZy
YW1lIHRlc3QgYW5kIGhvdyBtdWNoIGlzIGluIHRoZSBmdXp6ZXI/DQpZZXMsIHRoYXQgaXMgd2l0
aCBLVk0uDQpGcmFtZSB0ZXN0IDogOSBtaW4NCkZ1enplciB0ZXN0OiAxNiBtaW4NCg0KPiANCj4g
V2Ugc2hvdWxkIHByb2JhYmx5IGp1c3QgcnVuIHRoZSBmcmFtZSB0ZXN0cyBhbmQgc2tpcCB0aGUg
ZnV6emluZyBhcyB3ZSdyZQ0KPiBpbnRlcmVzdGVkIGluIGludGVncmF0aW9uIHRlc3RpbmcsIG5v
dCByYW5kb20gdGVzdHMhDQoNCkkgd2lsbCBzZW5kIGEgbmV3IHBhdGNoIGZvciBmcmFtZSB0ZXN0
cyBvbmx5Lg0KDQpCZXN0IHJlZ2FyZHMsDQpRaXUgVGluZ3RpbmcNCg0KPiANCj4gQ2hlZXJzLA0K
PiANCj4gUmljaGFyZA0KPiANCg0K

