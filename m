Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970C5CD4851
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 09:36:31 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (OS8PR02CU002.outbound.protection.outlook.com [40.107.75.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31466.1778837783378980676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 02:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=X+GIpSV7;
 spf=pass (domain: aspeedtech.com, ip: 40.107.75.139, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbqzHWPbCxmETLzg8mAdAfaNKPXzDouZoewCVix3UeFxogHHBdE+HGJGdOk49/G7WRXly4jtUMJ/mzRkn4hifiujIeQuIilkC2m8TDVi6f7GC3UOol5X2T9zHcTZ2RH3MrUg9pgRIn0kDoRo2nLMrp4uMQW/bV1cb5QYleXFdCLocs3hFoptsjpRpIjwzzQPI1fV6oPiEmvk2jDPZGMepZIYLOIvBY7RCiWEPZaB/2tQwVbW2QFi8BAXW88P0rwTODdL4/moRcvb8b//9QXGHnH3kxF8fIpz5GrQD22QZldNvwvED3KJDN62kQcEQRzq389t9aZY4rbGDCuQg6aREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrzCQ6TtGVO5VruVHoaaGVJGBWvh0NlKe/8APl/c0eU=;
 b=DEivoNXrLs+g0LtnpGGiJXj3uzJRVuxNQE1PTbWRpWtX/YxC+264hUajm7K0gImkJREF0zWzH5m90HKniCtZMjMVAfoa5xuy07V9jC+IVFPcrEqSVN/sFA9c2AzueWKt+8ye1Lf7/3Z9b9mHlWFdm0+xOZ7mqdfGDMoz98k/TL2Q9FCsbFaUr0p9UR6IksKnwGGf2H05CT+Ay0gofo9TqWtBhiEvEkZ0IEyHymJR/4DzKEftv5BNzm7J/zZUjFt4MyrspIW3hNhuOy25YKlP+/j0rGUCv3osJpTr4mwHIkjXr3zyHohdpa1sjvD4L6Lr9jxaZOVDnMwxi6Bbb6FRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrzCQ6TtGVO5VruVHoaaGVJGBWvh0NlKe/8APl/c0eU=;
 b=X+GIpSV7Sb8wOtG/sZtTBujINLSL6jP4QhlbtaBIc5HUwAUSHgMOqWABG78gT7fccflNg8lOq4aIby+1NNo/0W7BClnDqV56izBpZ54enz18F1kceoztEbtu8Z1N1O3v3cfzcQkob9KhuBcQ3wxOn7j4nU+ymVYbvdeKltp2Hz+fUvXu+REoLzCCLPChZ+s2tjvcUyJ6Bv8UdVHH4vmHMv4NMHpVeyOPjRMckRjHmrPsrsOlgNKmepATZmquFYHUY74tiit2S3YysB1myV+kQRPqAnQaOpKpVFlgsT//8e2b3D6Q2LXG5ry7RzQQS3bQnRivOTLNDoKGD7inwxvJ3Q==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by SEZPR06MB5176.apcprd06.prod.outlook.com (2603:1096:101:73::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 09:36:18 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 09:36:17 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>
Subject: [PATCH v1 0/2] oe: Fix build failures with multiple git SRC_URI
 entries
Thread-Topic: [PATCH v1 0/2] oe: Fix build failures with multiple git SRC_URI
 entries
Thread-Index: AQHc5E5HGNPd7wWzmUCh/5SRy6c/fw==
Date: Fri, 15 May 2026 09:36:17 +0000
Message-ID: <20260515093615.126849-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|SEZPR06MB5176:EE_
x-ms-office365-filtering-correlation-id: fbe8c799-f1c9-4261-629a-08deb26569dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 
 nyicUhj80FA1MF4ft8ZlNt6pBkHDXMubI9b6O7M4JwGagdryT9mKVBy+hR588Elqfhq4pWuBwAy3MH/QAB2mLrJ/uZjwWZTstmCszDYX8yWByiA1hZMs0/lX71T80H8Yd8WNTKuuhBEWVsVHJliR20err1RmumdyRR6HZtshoFl1KoDWA1GVNfGQImlF2WBP1yxlliIo42J83vHG7b8QSiLpsOu3o4wf0OurUMuUE4iZ9zJAQrYDzHuEbykPn+PXwyxO93n5nSejseube9tkQSTa0cx2bREJopUNh8T9ELFlJPwJ532OXf2Z7d0WHN8nBIUjCBPyGoT5HDPzojeLed1M3//c5vgftTz0ZL44r8iz+J6vJxP5A0vh+MV1yVharHtZNtxLfclmiuaTmJ+zMIzHdtqS91ciCSd+JcxTQrpRGBrsswGJe3U7JYia72ekrLA6MO+MUUZUGQ7yGjJZIKEL7s0DHYmRtWQx3Qs1fvloGwobiXphKHD3KyQRcQWduQjSKvTBD+qGn48LQhNfOaRDQPFjeGMQPfd6G3nBQwBg+JGgUOuzQ0XlzFpTSeE9exO6P7EnEeBJpDb3QMgmc/nxcJ6ukiXQ2x6H3WlG7B7Bja5AO0Z5E0cNkNLY/ntBGn7zYECUZkBtKb3C7VIrLnxfyvH0O9DajOWsIZLELF5c1CjMxci8B9jdRuCz/gGm2zLBqP67rTYHOXI3rIc1xODNP1/PJNksbZAaOeQIJT8foq08U9StKT7UIIiOIlXa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3pabjRzIclX+YMhD92nbyxCo1KaMdlG7FtNY9IacYKqAQnpMwvYVfDOXDjcS?=
 =?us-ascii?Q?fOlDVt0NNc5FluZLRpcVuMgZH3mDQAC3ZJDUal2fWQbuWpdTr+Qd6jlQ7X9T?=
 =?us-ascii?Q?KVoVtfcjo7QZ5hhp2IqO2F1gPqILc0RRGuOz4j565tR0tW6TMHU5Hh5KSvW9?=
 =?us-ascii?Q?LBJIx6pUS7af3h9ox0nzOxlhqgEyIneU+pF5JZkbeDPVGAPQ20dczvDAj0M6?=
 =?us-ascii?Q?wFDrGIddiLXFbHikHMjh/Zov6Ui1w9y3AaucypXj8Ls0zSg2wtHT1xUKlHLu?=
 =?us-ascii?Q?quQa1v5HDsodcVgY5NnL1DodPSnqjbtS0na3RkUVCnuLac6p6IotLJUg44Jl?=
 =?us-ascii?Q?MELaIIJEGd+FB51K0+dLrb57ZbBxwZj19SVuau6mh5rQXy1MnA0dOEiQ1wM0?=
 =?us-ascii?Q?+7V9MdMYTUBVqRWqGTdCLhZXQ+wdlJgbqq4+I1beUs0E2aTHQEj5sPcWh5OT?=
 =?us-ascii?Q?10C0dyHFuiXHripj0uJyx+xaE70yMfOlQmx2mreYoOuTyuM1wU8l8ircfGPn?=
 =?us-ascii?Q?/fDE9eIEc3Bk0tHG6zTrb/vrCGhD9QcjXNkQznjf9e1yiblj/e3+7tiDE+L2?=
 =?us-ascii?Q?x7jr/Hqxld/LCYn960wvg7zBQq5pgpA8tEZWGdKN2v/AKzMR+v0e1OymdEfS?=
 =?us-ascii?Q?lL30em859yef3m/B5utyHCvIQFWQ2pGXJCdAWLgHjFtPzDWopAenK1FeK3r6?=
 =?us-ascii?Q?7R4AjQ+1Ab3NLT3XLv2acLjmZyUK1U9hBhMyiuRMLq/GfjMPn/dh5/2QBUvj?=
 =?us-ascii?Q?6msBSzwfVZ/6ZIsv8bH5qTW/tGsGj4aK5KpDFUWyhzOVRxNpExc/7CE4zhKR?=
 =?us-ascii?Q?f5NkDQpY8OeW0UTHC2gAPJ3YhWJVtzfyTIq3QWS579GsMAIcK2DwY0NlPyJb?=
 =?us-ascii?Q?zk+Ib8VUZIFayrKdke8vQkqhEt7nFbWFwP3/YBwpFApzkxfmAgdhV4RDdIq1?=
 =?us-ascii?Q?axNASY4rZpd2HLA26kEg4wv7oZdkHCVDUovACuXYjVsVkkYvnGcaaMopnaQd?=
 =?us-ascii?Q?qWzYkKuyt/LZSjsAsXEG4eA8Ke0ttGuVrutZDyVENI/YxasyU5JufZ1m3X4G?=
 =?us-ascii?Q?DogWA3J5pKHW/JJvBIvpr4SGBeHvj0Q8K41q3DjxtbHUa9nsEnfj7bIJO5Bb?=
 =?us-ascii?Q?XqPqWVjzB0rXYFUEJAZq0MfJccQLvfPkrGV15G0htCfl/AMp1/uHkpB1dWEP?=
 =?us-ascii?Q?iHP4fd0F/UNmj35e1IsxVMEtloI0+2mGqEjj1yc3EFQqVrqsXdCQA6mSUONW?=
 =?us-ascii?Q?CpdPYHUMtw02NVX6DZ+QcdfYpjINiWhdL/hwoHlhUuJpSDWMFk5/9LnZ3iLh?=
 =?us-ascii?Q?NjZhn2baTbI2JcdAE7T4nUk12GPAHmE2oNNMp3rIlv4RRjlN7rN7OvD8xiaQ?=
 =?us-ascii?Q?cajEG8xGzx6QVw+zQT77P7t/hMyDwks5UQtOpd++0SHf/TWGxaH3yVD18Iyk?=
 =?us-ascii?Q?IYcc44PX2ippditnelnTOKtqrR5CAJaWQ6XbLWM4OlrZLYsNpbs34o2uuR4C?=
 =?us-ascii?Q?UDolB4omivNGTaA5RaemDWetcTcn9hhK+KKCZbj3/jAHNYzuhERTqCpaiSRS?=
 =?us-ascii?Q?4u8z2HV9PKZF28WQIT599oFF+djA4aT2YoSrPpDQetxVW88s6JATDuGw33ik?=
 =?us-ascii?Q?2lD9wmx0A2J7EujjXVdGCZq8milpAFb3IJbs20Is2Z5+meKMrxml3uLiS9Ac?=
 =?us-ascii?Q?lInvF2OG6yNOsMYRiyN2tAmbQThzl8K+eBw7EXrTnBAiJSRw/WChV1IhRmlu?=
 =?us-ascii?Q?+wkvNvRG/A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe8c799-f1c9-4261-629a-08deb26569dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 09:36:17.0213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YPenynbxsTDichuo+oaGVHI++SOgvdxAQxSFZ11MStRD6v7+eOxBvo/HCVh448pHY9BAo4XIHnbQtdSW5yTG52Y1ILJ8G+ZbnQO4nMpW6UA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 09:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237073

Some recipes (e.g. Zephyr-based) use multiple git SRC_URI entries with=0A=
different destsuffix values, causing each source to be unpacked into a=0A=
separate subdirectory of EXTERNALSRC that retains its own .git directory.=
=0A=
=0A=
These nested git repositories trigger two independent failures:=0A=
=0A=
1. externalsrc.bbclass: 'git add -A .' exits with code 128 during=0A=
   srctree_hash_files(), halting the bitbake parse phase.=0A=
=0A=
2. oe/reproducible.py: 'git log -1' exits with code 128 inside a nested=0A=
   repo found by find_git_repositories(), aborting do_unpack.=0A=
=0A=
Jamin Lin (2):=0A=
  externalsrc: Handle nested git repos from multiple SRC_URI entries=0A=
  reproducible: Handle nested git repos in find_git_repositories=0A=
=0A=
 meta/classes/externalsrc.bbclass | 37 +++++++++++++++++++++++++++++++-=0A=
 meta/lib/oe/reproducible.py      |  6 +++++-=0A=
 2 files changed, 41 insertions(+), 2 deletions(-)=0A=
=0A=
-- =0A=
2.43.0=0A=

