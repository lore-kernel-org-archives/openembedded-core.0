Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F91BC38A2E
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com
 [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web12.8433.1649251124586873423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 06:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=XwdQcHJz;
 spf=pass (domain: fujitsu.com, ip: 216.71.156.125,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1649251125; x=1680787125;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8DY5UVrzY8ddZc+xSDhVEj3BtLpzfpg5JcF1c4HIvHE=;
  b=XwdQcHJzHgqtHDu39tarUK2DBrGmaBp7SrWINcCneOvZB1FeSXEnp4QL
   RWBkJKgIw/GKLXn3pkHmgRTb/dUbnCfWeD8deZrzZVyT7g9J1eCrpoag0
   FK+S2PjsQaHAK2L+4nlip2A5QWUNISDc1XhCgtiz8ZdtvOpboxua8zoTz
   MSM2mUl90Q9EngFDh6D2T+waetvPOi+ZwV2v6zopTmGl2B8ngpZVbLbBX
   0hg96Acfp+Fbs8O4GgNO5Q3Gtazx9kjhrKV/71VoIAS95NFRz/TFlmM1T
   Ha47FoFm0WuhDysaLcTb0Z5jnbkVZluxX+eO9of9Izd7hUSwXnBOlP0bf
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="53553080"
X-IronPort-AV: E=Sophos;i="5.90,239,1643641200";
   d="scan'208";a="53553080"
Received: from mail-tycjpn01lp2170.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.170])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 22:18:42 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csdSferoi9zaw3Ymv8kmYrc1vkApfoadMxZEGs+um7UZ7D0o3D4+d6GhEV3RPMD6uU0LwFzEETap8AK6Qk0KpBCJbx+K+ue5X8skobaFKb2ryn8GL9TEJQhXVAryDUYKdrQQUHY/RAXxtXMw1QYvu3dAmiAlJABQoEvw6lOx0DtkJ4iwiADUjeojLecJDw5D8Vvhbklc9Lz+Q1gH4pB2028swYDOAuaRHjjRZigN9RsnnRUXvQM/XsB/y3q0ADmcMULIuvaXeX2/9Sri8TN0jaATNuIdzH03vLSK72hzpZSwErTI0LHIwrgGig/Lbt5sV+cOWDwnBr13ggLOMEpijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DY5UVrzY8ddZc+xSDhVEj3BtLpzfpg5JcF1c4HIvHE=;
 b=FXOVsK73HffPBIBZhh39+48AwDDjjKaQ8rotS5CjwI2mFxE2xH/fNAKHWyaFA/I0x/h52eVqiy11WlPs4UqhXfgd+JcdEIzSo1DcKbGFYffiK7syyqMe6d4OMbxoVClZrcFiILJO+KpInKvW3ZLnmwuZphRMxumlhbzridSUj8mVlT5opjfkeK3iN6Qnduph++EGO5wWLnPuhkzg+A+dJIT+e1V2jlab9Y3z269edYz0dD3OcytC7sUDOwS1+bO8qAkvz+Sj8vzWA/HMhd9O2N3/E8c9sq225ZYHPQuGQZ3Fuf8DQAik2LWWKYfp16GrXoTw5QhGlF9sycCUxTANfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DY5UVrzY8ddZc+xSDhVEj3BtLpzfpg5JcF1c4HIvHE=;
 b=FcXhLR7dTtWzEacI2NfGq0SUYd7YzDoqsf8BrX08uz6lKBDzVUiAA0lCArtHjsb1WxSStP4woaTnpG9McukY9KMV/32zhHXgnLCsNy68hvRFMFbotpmxc+5BUekY6bzzVQ1GoogQsEFbXXjgFkDmzfpq2LEwuO7w1+HaXfePkBk=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS3PR01MB7876.jpnprd01.prod.outlook.com (2603:1096:604:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 13:18:37 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::b8ca:d7c2:54cb:348a]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::b8ca:d7c2:54cb:348a%4]) with mapi id 15.20.5144.021; Wed, 6 Apr 2022
 13:18:37 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] lttng-tools: upgrade 2.13.4 -> 2.13.6
Thread-Topic: [OE-core] [PATCH] lttng-tools: upgrade 2.13.4 -> 2.13.6
Thread-Index: AQHYSawOBGLN1HSf/U+nmVCiVyEjR6zi0hyAgAALu8A=
Date: Wed, 6 Apr 2022 13:18:37 +0000
Message-ID: 
 <OSBPR01MB1845F97070D9656A2DF5151CDCE79@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
 <1649011392-28818-5-git-send-email-wangmy@fujitsu.com>
 <Yk2I88BgEuWXpapX@mail.local>
In-Reply-To: <Yk2I88BgEuWXpapX@mail.local>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 706b4c14-a68c-4a50-18c9-08da17cff5c3
x-ms-traffictypediagnostic: OS3PR01MB7876:EE_
x-microsoft-antispam-prvs: 
 <OS3PR01MB787671BB6F3A909C085F45A8DCE79@OS3PR01MB7876.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 768JoM57bN3sdqM7mMyNOUqScWUTW23M8FHqJdzc9GDUsWe5wpw0c6JE9scoSoJeG8yXcwnJpiQ8CwnVLGRZ/pfESCwQcjt5UWtNNkrInmLWW8Cii2aXrZAz9mcw1Px9k4KyQOG0sAIAhVp5JWdG79mgEcP2EiUFtNiTR8kEq7OMK+pJs7i3Nojs1np+/tq6bUI7nyiCTkgwVEu1ceg2Kn/nglCvKPf5u23kC887V/gm0mifCwa1rGp1reU/N0Da4ejSxiyx2fQLYc/8agFJNED4J6iYmVVNxVKde9sWDW44eSOg6WlwE6JcAsIWg+YIKTPr0KK+NIyq774IAsTRWhAE4gA2fFhlIbE7iRJDd5sY+6+8ASAJGgGDEeqXQQEepZ+aE2I3tUfOQkaxiPJykHWz18lRBxGSRV4BmNJKHReZ6j6+NX7JWbGya+KZvOB+Jhy4CtGWTcLQGlXLwHacmcVaeSYJcs9CuLPS/cnj1oshb5iFONlm2hKNvhqkKYXNtvTkX2yhdRgxaBhlqcPpoyDDgr2Z9IGqgyN+VubT9dHL3B8nu2nIBwRXQwNtQILLVWYsn/srenR92abI9NSThwy6Mkp1tqmy1mgErGmp8bf0a26ar5091r+L6DgIrPGLUV4C75D7kEjFGdaQwBjJxSiPFqBITWg1H3H5R/3xoSztjYIihYCqXLtxOx6VugO2VuuZbzwVNQIWy/T01HArBADuuxzKlsrDVKsEFHS+/12y3lSIbHC++82bVgE1XdGkqzXgzKQSuN7GedHBChZ0kxp04rVH5QR5RqX1FtUmDGzr9J+xm+q9ksP7TPXnxiXX/WanXcdjARnEcRdHJWxGqw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(66556008)(186003)(38070700005)(66476007)(64756008)(85182001)(66446008)(8676002)(76116006)(6916009)(4326008)(71200400001)(66946007)(83380400001)(316002)(55016003)(86362001)(8936002)(33656002)(52536014)(5660300002)(966005)(508600001)(122000001)(38100700002)(6506007)(7696005)(82960400001)(9686003)(2906002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eDFKSmhjTWdYREpuM1l3d1RHWnpxUWNlUjBQbHlQUWluOGhvWTM2QzEyYkYx?=
 =?utf-8?B?WUV2TkI5aWxIMkp5Vlk4N2Fud2FBQ29IcHl3MW5YbU8rZXVCeUI5NnRibDBY?=
 =?utf-8?B?aEZ2QXhZalNzU0FJQThJb01HQzF4ZGZEQkN0VlpCL0NMd0p1Zi9EMGZtYTEx?=
 =?utf-8?B?dUhLbS9kay9Jd2JueDFsZm9ZNEVKNDg2ZWJQNm9oTWxua25rZ29IY3pSOEtC?=
 =?utf-8?B?OHhkaE4wM2FJMnVpTzVPazlETVQwSlhWZHB3UEtQSis4OW5FS1lCK0VIZTlk?=
 =?utf-8?B?eHNYUzhQRmx5SmZ0d2VJa0VWM0lncGgwMGw5ZGNUcjRua3JpbG42azFlcEtJ?=
 =?utf-8?B?ZmpGNFY1a05qelhxSWdncFFkQXVSYkVvZVJoTllLOGd3eUdBcjJmSWNhbEZ1?=
 =?utf-8?B?dWw4L0FDS1A1NWJYZHlUQlBWVy96Y2dyQmlQdThQWnU4TFpjMUc4SUpKNUp3?=
 =?utf-8?B?MkQ3bjgzT3doRWdHTGd1ZEIvemZzci9scWw1UmlKSHdaQmlLY3JQRkNmZUVO?=
 =?utf-8?B?Tm9YVllUL2FPYmpWalZkVU1vS3JsMUVqYnd3YWZRZlhUWEpFUkFOWnRabXAx?=
 =?utf-8?B?RzJ5MTBuSHRVNElyQW80M0dzMXlWd3hURUpja3lHVXdFQVdkM2x6dzZHamR0?=
 =?utf-8?B?S2RHSDFZNnBBYVZVUTVhSldoRDJwWFIva05NeTB3NU9mdDVvazFpditZeXov?=
 =?utf-8?B?L2xYRjF0OWNrdFpJeUp4bXRGaGt4QUh1SHFqMmtWQ0UrQmJyVG9ScmpLYS9p?=
 =?utf-8?B?N0xBdHZRMEhoR3pBQjZIOVJ2ZU13ZTJsdml6TmEvYmR2d2QwQjI5cFl2QkxZ?=
 =?utf-8?B?ZHNkTWJMMzlyM2pMOFR1cGtVNUFvbXVOT05RV0pDWSsvNmpLN3RCdEJ1eC8v?=
 =?utf-8?B?Y2VZKzJUbmYyNTMrN3J0L3d6ZHBiS0NBdmM2d3VLWU85bWRscC9HM2QwZGR4?=
 =?utf-8?B?OUJzdFpqZ0tHYXc1SFlXZllYYzVYdjZnV25FZEU0RVRZUlBGYnpPRHQ1VFp2?=
 =?utf-8?B?MEwwS1lJcSszKzdSa0FmbCtZbzY5TngwVk1KZlBlWFc0eU1hZnM3KzY5Mlh4?=
 =?utf-8?B?WWZ2REpPVnpPT0dyMXRmK2ZORkJ5OFFlaHNORUVSS25aejFUOU8reU9EVEIv?=
 =?utf-8?B?UjI5MXYxWHJxcmtPdHo4eitJNFpIcFJQSDd3cExZeVBZUGE4OXdpeG5NcTlr?=
 =?utf-8?B?bk1zR1BBQ2lkWW5TUThKdjVHSFYweTBBYk1IYkd1c1NSTE1pUFlhcVh5NGpF?=
 =?utf-8?B?dUVhOThrRzJOVlFYNmFsUTgzV2RFMDhxWHB3cDkxaVA5YjFLZ2FiRStTUUE3?=
 =?utf-8?B?cHUxdCtER3l0Vno5Mk5xTzVLZC9KUTJCSEdBYWZLeHQvRzBzQ2NiUVI1b0NO?=
 =?utf-8?B?UFdPaEpCVVJEcjJHVWhlaGJtU2ZwdkhXT1FLQkdyaUR5K2pEYmthSm5DdmhL?=
 =?utf-8?B?QVkrMm5UY2Y2NXdNT2NNeThhVjcxY3VWOUpqQTZaU1BORHB4YjdBQkJpbjRv?=
 =?utf-8?B?ZzZsaXozNjI0WDNEVHpkam1ZQUkvMHlsVFNDalhaaWlNSC9DM0ZRUE9sdE5E?=
 =?utf-8?B?Lzl5MlpDa1lRRlNtck9pR1FkTkI1ZktLTCtiU2M2bFF3VXF6Q216RXJTNVl4?=
 =?utf-8?B?elZRSVBOdEptVDNDM0JVdjRGUnpSQUtkc1lvWXBLNTI4UnpmWkgvNFhOMURI?=
 =?utf-8?B?cDltajVBeUNPUlhxaHVua3ZSOTYrQkg0SkcvaHhPazRJdE04d3NUenNjYXNL?=
 =?utf-8?B?VVBISktPTHF5dGxzT242TTBOVmlWY3JzbzUzR2xkdlNLdDVpLzF6aVVmYzdV?=
 =?utf-8?B?Nm9oTXlyWGJGaVFsRUE3VmkrM2pZRWRNUHRSYkw5TTVPVGRid2xINk90anpG?=
 =?utf-8?B?YTJOaFBIa2o2cHRvMTFUVlA2TGo3WlRJNHp3UTUwNFN5clk0eVpWYUZnMkZr?=
 =?utf-8?B?elZLc05Sd3hYZW5zM3lOQXMrS1Z4alZLQStFWkp1MWhnLzhDOTU2aXI3SURq?=
 =?utf-8?B?bk5lSXN0cGVoRForN2JSRlREYVlJTjQxMW0xZWpUalE4a2tZZDNGTDFqZEgv?=
 =?utf-8?B?NDNkeXFyMmtEM1NEVjY2bHdHN0QzSW0yNmhkQXA2Q3ZJZDFtbHNvdjU5WHBW?=
 =?utf-8?B?bDBheGxReDZ2cGJKaGlkNWJ2OHZWeEIzbzJERzMwTVMvdVdQNFRGV3JCVVhD?=
 =?utf-8?B?NHBtejBvQVFFNmdhZ0RhOGpOVkt4b1o3aDFJYmZLWVNOYkpWaWhJK3R0UlBi?=
 =?utf-8?B?OGNXamRHUXoxd0hkKzgzNnR6UEZ2UElQZFN2MlNGVHpOYWxrTkkxbWJiblZk?=
 =?utf-8?B?cTM0aW0yWEJyNVhTWXV0dGxtY3dxOExuQk0rSDdQUnJrbEM4ekxZQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 706b4c14-a68c-4a50-18c9-08da17cff5c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 13:18:37.4594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tMip02iP3dIIT+YGNp/chrL+y/+w8iAr1cXMBuv+Pz4n9RnR7hJ860TeXV8M6KdVITrad1ic2TvEqfa4m8Ktwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7876
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164081

U29ycnksIEkgbWlzc2VkIHRoaXMgZmFpbHVyZS4gSSB3aWxsIGludmVzdGlnYXRlIGl0IGltbWVk
aWF0ZWx5IGFuZCBzZW5kIGl0IGFnYWluIGFmdGVyIHNvbHZpbmcgaXQNCg0KwqAgLS0NCkJlc3Qg
UmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQpXYW5nIE1pbmd5dQ0KRGV2ZWxvcG1lbnQgRGVwdC5JDQpOYW5qaW5nIEZ1aml0c3UgTmFu
ZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpIE5vLiA2IFdlbnpodSBSb2FkLCBOYW5q
aW5nLCAyMTAwMTIsIENoaW5hDQpURUw6ICs4NisyNS04NjYzMDU2Ni04NTY4DQpDT0lOUzogNzk5
ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCmh0
dHA6Ly93d3cuZnVqaXRzdS5jb20vY24vZm5zdC8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxp
bi5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgNiwgMjAyMiA4OjM1IFBNDQo+IFRvOiBX
YW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiBDYzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSF0gbHR0bmctdG9vbHM6IHVwZ3JhZGUgMi4xMy40IC0+IDIuMTMuNg0KPiANCj4g
SGVsbG8sDQo+IA0KPiBMYXN0IHRpbWUgSSB0cmllZCB0aGF0LCB3ZSBnb3QgbmV3IHB0ZXN0IGZh
aWx1cmVzOg0KPiANCj4geydsdHRuZy10b29scyc6IFsna2VybmVsL3Rlc3RfY2FsbHN0YWNrXzEx
Xy1fVmFsaWRhdGVfdXNlcnNwYWNlX2NhbGxzdGFjaycsDQo+IA0KPiAna2VybmVsL3Rlc3RfdXNl
cnNwYWNlX3Byb2JlXzk0Xy1fRW5hYmxlX2tlcm5lbF91c2Vyc3BhY2VfcHJvYmVfZXZlbg0KPiB0
X2Zvcl9zZXNzaW9uX3Rlc3RfdXNlcnByb2JlX2VsZl9jeHhfZnVuY3Rpb24nLA0KPiANCj4gJ2tl
cm5lbC90ZXN0X3VzZXJzcGFjZV9wcm9iZV85NV8tX1N0YXJ0X3RyYWNpbmdfZm9yX3Nlc3Npb25f
dGVzdF91c2VycHINCj4gb2JlX2VsZl9jeHhfZnVuY3Rpb24nLA0KPiANCj4gJ2tlcm5lbC90ZXN0
X3VzZXJzcGFjZV9wcm9iZV85Nl8tX1N0b3BfbHR0bmdfdHJhY2luZ19mb3Jfc2Vzc2lvbl90ZXN0
X3UNCj4gc2VycHJvYmVfZWxmX2N4eF9mdW5jdGlvbicsDQo+IA0KPiAna2VybmVsL3Rlc3RfdXNl
cnNwYWNlX3Byb2JlXzk3Xy1fVmFsaWRhdGVfdHJhY2VfZm9yX2V2ZW50X3VzZXJzcGFjZV9wDQo+
IHJvYmVfdGVzdF9ldmVudCcsDQo+IA0KPiAna2VybmVsL3Rlc3RfdXNlcnNwYWNlX3Byb2JlXzEw
MF8tX0VuYWJsZV9rZXJuZWxfdXNlcnNwYWNlX3Byb2JlX2V2ZQ0KPiBudF9mb3Jfc2Vzc2lvbl90
ZXN0X3VzZXJwcm9iZV9lbGZfY3h4X21ldGhvZCcsDQo+IA0KPiAna2VybmVsL3Rlc3RfdXNlcnNw
YWNlX3Byb2JlXzEwMV8tX1N0YXJ0X3RyYWNpbmdfZm9yX3Nlc3Npb25fdGVzdF91c2VycA0KPiBy
b2JlX2VsZl9jeHhfbWV0aG9kJywNCj4gDQo+ICdrZXJuZWwvdGVzdF91c2Vyc3BhY2VfcHJvYmVf
MTAyXy1fU3RvcF9sdHRuZ190cmFjaW5nX2Zvcl9zZXNzaW9uX3Rlc3RfDQo+IHVzZXJwcm9iZV9l
bGZfY3h4X21ldGhvZCcsDQo+IA0KPiAna2VybmVsL3Rlc3RfdXNlcnNwYWNlX3Byb2JlXzEwM18t
X1ZhbGlkYXRlX3RyYWNlX2Zvcl9ldmVudF91c2Vyc3BhY2VfDQo+IHByb2JlX3Rlc3RfZXZlbnQn
XX0NCj4gDQo+IERpZCB5b3UgaGF2ZSBhIGxvb2sgYXQgYW5kIGZpeCB0aG9zZT8NCj4gDQo+IE9u
IDA0LzA0LzIwMjIgMDI6NDM6MTIrMDgwMCwgd2FuZ215IHdyb3RlOg0KPiA+IENoYW5nZWxvZzoN
Cj4gPiA9PT09PT09PT0NCj4gPiBGaXg6IGhpZGUgc3ltYm9scyBlcnJvbmVvdXNseSBleHBvcnRl
ZCBpbiAyLjEzLjUNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlA
ZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9sdHRuZy97bHR0bmctdG9vbHNfMi4xMy40
LmJiID0+IGx0dG5nLXRvb2xzXzIuMTMuNi5iYn0gICAgICB8IDIgKy0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pICByZW5hbWUNCj4gPiBtZXRhL3Jl
Y2lwZXMta2VybmVsL2x0dG5nL3tsdHRuZy10b29sc18yLjEzLjQuYmIgPT4NCj4gPiBsdHRuZy10
b29sc18yLjEzLjYuYmJ9ICg5OCUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWtlcm5lbC9sdHRuZy9sdHRuZy10b29sc18yLjEzLjQuYmINCj4gPiBiL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbHR0bmcvbHR0bmctdG9vbHNfMi4xMy42LmJiDQo+ID4gc2ltaWxhcml0eSBpbmRleCA5
OCUNCj4gPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLXRvb2xz
XzIuMTMuNC5iYg0KPiA+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5n
LXRvb2xzXzIuMTMuNi5iYg0KPiA+IGluZGV4IDBlYTRkYTA1Y2UuLmQ0MGQwYTJkZDAgMTAwNjQ0
DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy10b29sc18yLjEzLjQu
YmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLXRvb2xzXzIuMTMu
Ni5iYg0KPiA+IEBAIC0zOSw3ICszOSw3IEBAIFNSQ19VUkkgPQ0KPiAiaHR0cHM6Ly9sdHRuZy5v
cmcvZmlsZXMvbHR0bmctdG9vbHMvbHR0bmctdG9vbHMtJHtQVn0udGFyLmJ6MiBcDQo+ID4gICAg
ICAgICAgICAgZmlsZTovL2Rpc2FibGUtdGVzdHMucGF0Y2ggXA0KPiA+ICAgICAgICAgICAgICIN
Cj4gPg0KPiA+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiNTY1ZjMxMDI0MTBhNTNkNDg0ZjRj
OGZmNTE3OTc4ZjFkYzU5ZjY3ZjlkMTZmODcyZjQzNTdmM2NhMTIyMDBmNiINCj4gPiArU1JDX1VS
SVtzaGEyNTZzdW1dID0NCj4gIjFkNTJkMjQ5NDM3YjNmN2JhMjNhNDVhMjJjM2UyNmRkZTAwNmE1
ZGExMGU5Njc1Mzk1MjA4NGE5OGUwNTINCj4gM2UzIg0KPiA+DQo+ID4gIGluaGVyaXQgYXV0b3Rv
b2xzIHB0ZXN0IHBrZ2NvbmZpZyB1c2VyYWRkIHB5dGhvbjMtZGlyIG1hbnBhZ2VzDQo+ID4gc3lz
dGVtZA0KPiA+DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0KPiANCj4gPg0KPiA+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50
IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxNjQwNjcpOg0KPiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE2
NDA2Nw0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L210LzkwMjg3NDIyLzM2MTcxNzkNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUr
b3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1Yg0KPiBbYWxl
eGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gPg0KPiANCj4gDQo+IC0tDQo+IEFsZXhhbmRyZSBCZWxsb25pLCBjby1vd25lciBhbmQgQ09P
LCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0
cHM6Ly9ib290bGluLmNvbQ0K

