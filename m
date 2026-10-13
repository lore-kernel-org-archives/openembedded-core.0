Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C14CC6B0E
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 08:18:23 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2350.1791879493131119094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 01:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=jJaFCgdQ;
 spf=pass (domain: est.tech, ip: 52.101.84.28, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSJVrlGzK8LU7bieP0TA+/YEuT2fog/JYygACk20cw0NThyF9btmeZFhcRKAuWRrcRT/XKm1p8FPHifrZ5w9ohykZ2zrP+3pxuJWn5eJYi5zNtLU4EaEQjeXyZnXTKHIKbP29JpC0Fmn7HRFxig5vww9Yglx7Q/BDEje9nSQc/n3z+VMu9SWFeRAJiQnCEt3ngwQX7OVv/z0WUMpifeNkPZyFDVpWxpxC8z8j8RpCYUpUdfAg1hjVbtPltYcceNO3G5LSm/pRPE2SR1xJ897i7tDbSmHClmQULUFh3+Xncr0Rn0H+/AFCU9EoSlVwZOdjHOFHx6Phn6Y6JIn//6pvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi3kfu9qDXWuLx1f/UeZxehuDBrfXT7yMSzQrcx02Z8=;
 b=ePfcDPtlEtMqq3Ope2cmGyHup5VuYnC1v1k5vnKyw+zAbS5s1gIaLQDfRQrHAx5wJz8rKyZN+uSNaf0WyXq79f9I+ZhOCVHN9gy61BDHOexQQUcsJZmLbU5PXe2kXdsq2bBmffkHjs7jUylzDVHVnX7UNu/aqFWidA17O+cxEImgkR7wHzeedvvDdF7o5QEh59pkV3CW1UvBIttrzrELfq7q3wqMokr7Up9IePhbqH6tG08VDKzj4Blsl39wtZXz1G8DsRFJvAYtS58DTY5IFnMrfBNzx44iTnphs7V5qS8gFyzbhaa/Yg0zhSlHjvhshoDIoBX3wh0bCtQ4hGUrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zi3kfu9qDXWuLx1f/UeZxehuDBrfXT7yMSzQrcx02Z8=;
 b=jJaFCgdQAa0zBNyWOFLBq4+j5aJhjSfM+fy9527vk1pOHV4ZBQGEe/kXzoX9WTB7xiMzepropwBIc0EhWtUlwz64+UDhccJbq3LuRrUEeuFzmi1WMAYfQC6KuoK+RnSLBdIHVQSR7OJ6r6NkgP5TttoiwJVMNk4BPONbiz0yWWNAvKOVNUV9XqMKzFkZnGW0o+O+KKdcT6sW51XfuF8N8lhtdEpx7QxRGv7Nso4UzthCTHMoOn6q9xcyBSlvFim7ZVOSwolCkPli9p3Z2NvhOZnbyOU4HHjgvrsd9Cmssjl1U4PfwJnofOw2SFbYa//yA22X0ikkAO0vxm5d3HJMnA==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU0P189MB1865.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:345::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:18:08 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 08:18:08 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH] libsoup: add ptest support
Thread-Topic: [OE-core][PATCH] libsoup: add ptest support
Thread-Index: AQHdWi/o4x7pzE+2BEirVKRRsFKwkLb6JicAgAD8Ah0=
Date: Tue, 13 Oct 2026 08:18:08 +0000
Message-ID: 
 <PA3P189MB32395C548E75E47E77343942FE9E2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20261012095602.19261-1-pratik.farkase@est.tech>
 <DM312DDZ2DWX.2IXZ0C78337R1@bootlin.com>
In-Reply-To: <DM312DDZ2DWX.2IXZ0C78337R1@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|DU0P189MB1865:EE_
x-ms-office365-filtering-correlation-id: 12020f2f-b312-4055-3556-08df29028360
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|56012099006|11063799006|4143699003|261009221727099003|261009223327099003|261009223027099003|261009220027099003|261009221227099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 5F6lg8PmUCzgRHv8KhIDNeUPnjUMu+j/ytbUtgfUSUHuBNnEKIhlJqD//RQ4JFigLMWRAjp8y1dEKU0k4ad8/op+VPrDjmYX5VQyUQGgUndfOsG73aX3OmTE1z007Z/vJSp+zV1eDiK25jYFJnuNYWgmQZsUW1Yaf06/1rYuW63wGspAj+ohYw/yFloaR6OUWetF/3qwg3qZq8ZAt852Ll8Q9OCYb/ut6PxTC0sMBtFbrbVf5F7o4HlhR/HuaMNFyFh+O8gfE9ZA4W+7nggvvzeyxKCkwOvsKedbLKcaYjTyRMXLJJhG7/HJBRULx/bM1llDfi+RRId9zzc9y0INs0G8tg8puZt5n6OF7Ac/jDi298ojwAYPUkpjngcADI/uchmPyNo7i3Ve0+FiaJiyNYioOHVR6oN7DOReEf3gMASZhYF7Cv3CgXbSEq3cVObJxBydASGndm7Hz3k7N4ytqJWnqGSJvDQjE6grYgOc/QWoLauDkN8bDzesdGOr7eBuCq4oWLSGoWrwVZitnWAKk5fNU1YDF5TWr99nuDnq05FtHushOiGz5tbFZPAYWo51cU2HoOP2BLIll23hMgZkn/iWIYjGEMNkiRMmOgae8jrWDwhRbQAx5UVxREkoRGsvcQsUhp1yropIRs/72o/CK+LWXruUIO+zTHmuIgaH7GY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(56012099006)(11063799006)(4143699003)(261009221727099003)(261009223327099003)(261009223027099003)(261009220027099003)(261009221227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?x9YrUS991WM5N8zSt6tKge18J5EbQAoHMlGpxlTfP3BMV6rZliKenPbrqagd?=
 =?us-ascii?Q?3UjpBKRA3b83/rC2OZBPfAM10ppH58/AJkmzL3zlTNwu4QOmFJ6RkB8uj9dj?=
 =?us-ascii?Q?nea7XkhMvSgeYcuM7+IJGuJ4qe/6z9XMrR+n10shF3krc6LRta6vhRltL5sy?=
 =?us-ascii?Q?HAPBas7SDyIKHKxBUS1w3KhCD+NvhRX6/uy7YvH4olJ/QX1u7cKcX4j3ECZu?=
 =?us-ascii?Q?Y+ecegG1nvsfMAFeQawX8TR348BLf0mqc5i21KCBgT3rATkqDXomKX8o4kU4?=
 =?us-ascii?Q?p83FSszdBWLnjytHuG5smVyfFn+m42aEighg+CPoxGjc2NZt73LNB/JN1pjn?=
 =?us-ascii?Q?DENE1s7AljVRHC/pQ/8MmW0+xKNH9d/xXP3285EVa8ucta9i2czNxax2F47w?=
 =?us-ascii?Q?ElkB/Xal7Vp8pqY1sAC0RFXyw2R6vn6ppK4GmNYPSTfbOnLC4ZervAjz4Oad?=
 =?us-ascii?Q?k6A6QiIrzOUHTdJxd4MK0bZzvTezq0q3m0vlb4UJvHPQfMb2DAc2IqExzDdJ?=
 =?us-ascii?Q?stAdhY4qI/GVZ7n0SPcf4ln3kAIqj7EHbIA/2c8lmN/8M9kxS5bYI3sVNhCB?=
 =?us-ascii?Q?o98SJua4T1PgRU9062HCTREBxoZx+mR/tGcloJqGAWiYvOYcW4QQqhfXhAiM?=
 =?us-ascii?Q?cRPmyYZn/0XP1QiHZKbrw3YJ+2CGHNmQY+YRIg5owZ3bRsnNxREwL0O22ngL?=
 =?us-ascii?Q?FDLHcuWBxCN564FgS8r50HfzdQ0G3IueWp90BggaNohIMkCNvxn+mUz7Z3KC?=
 =?us-ascii?Q?uRGt+CQAotSBIeN6e13qu2VjPNKkt8L/CqkXRcF3dlSwWYC5B4tjCN0ME0uw?=
 =?us-ascii?Q?JHs2EoTI6ybvXVXl7AYNPNP1ic6ef9owLul8t481m11Q3rYQuIq/FjSGQ8B+?=
 =?us-ascii?Q?rfRUOrF4wPIIZFv5g99oCCwkK3/QCgUrmiWI01p/XzvYofP1mvvne0P0p9pg?=
 =?us-ascii?Q?rjh/fShGCsuAN5bI17y5jJWP7Pg8GYssO5bOm/OLYEZWXfOegsGdr0Jppq08?=
 =?us-ascii?Q?dhbvX1GOdeVBwJFsx7m0nBWyW5pw29BHuZJfUYeWnSPR7fWldx6D8dETYCvj?=
 =?us-ascii?Q?kbCOwYU+qfLTfb5Km9j9OBgnv73J9V+aJGodCa3RuRuvht+ElH443VC2RMRU?=
 =?us-ascii?Q?EJF41//7B/rlu2DltkLTXpOmfvkvKP6QSpenktpY4nWdg1YYLtDOSN/8wgW4?=
 =?us-ascii?Q?xu2tQ9clXvHH4u9H6iIl08j/wSVt6I+GoD18ncc89KXS1KTVrtyQHpKiKP4r?=
 =?us-ascii?Q?Gf1CQShISXYtYpz5Aqmg/1j6c6s3EfecIZcqpfQcjS+JsV5mFGJAqApkBEVl?=
 =?us-ascii?Q?P+ZfUzIIdiqi+/SXByxIHqPPkPj+fJ//yroJptOzfcBua5TJOWSZsegOOkaa?=
 =?us-ascii?Q?OwNUv5WcgJIMwKHz7ghdueMviHLEdaUGvIE2U3E9rqNcSQ+BPTwlgHkxFK7G?=
 =?us-ascii?Q?nEj7P/R5WIPz40AqztV0Oox/lEF/QfdGG4vmeCuAjT83LFX7I+VsIhCGr0Cj?=
 =?us-ascii?Q?v/8mwRZNu7vE7H1ODBlhULJKP9isvnhlN+QH+2J0jmBjblQT2Y4ckxRG9vka?=
 =?us-ascii?Q?llBwDM7ErEyj5CUj4eZlFBfitMUqF0o8gc5K9Q6SFd8y38Nj/MRdEOouy9La?=
 =?us-ascii?Q?sSixGVncpTwew8YApk0p2u6Vg3QduOe2oHlHdMkLYvbWV8zECn77SH/RPRq1?=
 =?us-ascii?Q?O1xsKBwOLffhH7o304ue3JeKNh/aNTWQ7iso7Ch40i7KSfvRpIgfH30bZhkz?=
 =?us-ascii?Q?pCTI/XtWXg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 12020f2f-b312-4055-3556-08df29028360
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 08:18:08.0402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: goD9ohR3wjYnr814Fu9CBfJgvwA3sNbBlThoqbkEsPxcIzI51tBPo38w1qAtU8+DOrEzqTHlEmlfOB/iXxtGOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1865
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 08:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247709

Hi Mathieu,

Thanks for the heads-up. I've rebased on top of master and reworked the pat=
ch for the 3.8.0 recipe. As the recipe changed quite a bit with the upgrade=
, I have sent it as a fresh
patch rather than a v2.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Monday, October 12, 2026 7:15 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH] libsoup: add ptest support

On Mon Oct 12, 2026 at 11:56 AM CEST, Pratik Farkase wrote:
> Build the installed-tests via the meson tests/installed_tests options
> (enabled through a new 'tests' PACKAGECONFIG when ptest is in
> DISTRO_FEATURES) and run them under ptest with
> gnome-desktop-testing-runner.
>
> header-parsing-test is excluded as it aborts in do_param_list_tests()
> with the current glib; the rest of the suite passes.
>
> Tested on qemux86-64 with ptest-runner: 34 tests, all pass.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

We have an upgrade to libsoup 3.8.0 that was merged a few days ago. I
could try to merge the conflicts, but as the recipe did evolve a bit, it
would mean the merged patch would be really different from what you
sent. And we should probably avoid that.

Can you rebase on top of master and send a new version please?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


