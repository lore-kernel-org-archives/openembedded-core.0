Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6388CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 13:36:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45777.1781185014437446977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 06:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=Rq37koJt;
 spf=pass (domain: de.bosch.com, ip: 40.107.159.56, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dde0DA9u2z/GHM+C+881It3OpRDRozGUGFeiXlqgoDYoifJLsu9FSJ6f17aekTMTWVQ81qwL0PpRP0zkVP378pQJ91aqBAI7ep/3RHMpk9CZY39YproQajbzRk/OBDPdS6jJ6bZsjpDQf5A09rufUSiWVjepOIBExCFondmXTwdqDTrqAeh9vsrXGlZWfSr55ixd0624eHy/vuK6mSw05c/gtpxmuapXsR9PARgHXj4Zgk4mL8COJz2cibRqpHAO9OcTMFxwnrSTy0lJHV7Lc3DTI7MkY2ANZMd4NH2AtaChB9eC1KgZRbGwPKLkL9XJtiXTvyRWXmmSKKdtjGgYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDbFs4Ig00TAEr3U3W6YSvRVrc8skZNMr2Bqh36/8q4=;
 b=lA8XG4uxcZtQjjdye2enrEtwYaW62VbBkU1rZnENjUy/7XpGcebl6ZoAYv1+xWah/uQ/vY3BDdKCxZxXkQ2n30cfHVW4IIYruV8SPVr/INwpoSS3laylpz+6BTRD4XizHyozDYlbHVTqXHLfYLW1s2+BBluPU4W2U8k23V0/ZDFCF1pOWseKRs/1NnRBj3neDwS4jG+MguOSXzg8RZJ+cvCVQkaFSuxBFwlRYENs27mYZ+5haq+f1/1w5lIeT6NCvnkdGi0omUhdGudS4WRDkRK4BOMqiLpHjKb7zf34OmeEzp8SNZZ/YJftHtyaIn7BWpeENxIPwYVqn0/rKk08Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDbFs4Ig00TAEr3U3W6YSvRVrc8skZNMr2Bqh36/8q4=;
 b=Rq37koJt+cIF2GEQcA549JvjHY9fW0TvGZMMosOa7KfWpcUJgbkWqPeiS/hosbiv/dQGgIR0GuuC/Xud/C8asb+IUUkCgEe+gY72Jfe3aluDR65iwaKxfMcHP17vQAiG5pww9p0NVTHD+iHIqcrf4x5bsUpHaNdaq/olnlRoigiC2ixrBvjvXsk7l/Di7SeEyXAeOLgnhJZzn06Q3/hKF24YjllwcVp1syOD3NY6MI3FOKD6HhntOWeMJXZ/zC4e+JsWrTMxPsPPfsSB9l/aGw8VVZprOxSWIllUYiLgxoGa3IcNhu4CozZookDvZ5OMWKVhF29/nWrON8EoYLw2iA==
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::11)
 by PA4PR10MB5634.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 13:36:50 +0000
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f]) by DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f%2]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 13:36:50 +0000
From: "Jonas Mark (BT-EL/ESW1)" <Mark.Jonas@de.bosch.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Jonas Mark (BT-EL/ESW1)"
	<Mark.Jonas@de.bosch.com>, "Simoes Ricardo (BT-EL/ESW2)"
	<Ricardo.Simoes@pt.bosch.com>
Subject: [wrynose] Backport request: curl: fix mbedtls detection
Thread-Topic: [wrynose] Backport request: curl: fix mbedtls detection
Thread-Index: Adz5o9MW/xU/Wa/xTwapHCSrHL5OjA==
Date: Thu, 11 Jun 2026 13:36:50 +0000
Message-ID: 
 <DB9PR10MB5354030CAD115C7BFE8A7471AD1B2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR10MB5354:EE_|PA4PR10MB5634:EE_
x-ms-office365-filtering-correlation-id: 4b2f1762-ee17-4732-e9e7-08dec7be7e03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 n67Wysdouiae0jl3mcmZo5nrFsOWC06UWfVQuvwkz+ukbeIC2zkevgxzHu6SBWPCfNROYSCSobDQLmKEFqVDp0SoROvIXqBEUQiTWPERfUveqDlU7CL/6eyzWJP4iSM0O+t1Si/sL796jF8iHKcEBEnmngiFbUlwLfUjXBJCuGRF8NyHzNf+I+Zf9h1Y5N3AIhPdS3fU6fVPWqzym85fNRc7vjY2WTr4ZR3zHdikvOaSBgfRdFMbcvNenANSQ1WkfaecvxUo9tuhYgNLUpVSkOxsvdnchiEJWr0XvWhgilOWG0mcxTjiO4vLDbOFKqMXnJNbHZMtjeyjGfhS/igmH9/FMQlF5qVqlhd0+8yT5KPbhZ4oLHJ17uXqxNQu0P8GMS9GYCdL3ivm1cByOb9Dba7GL1fczDQ9CnR7rvlEQfEDReBv2xhUuQLVbkPIEbzwAH7Z3B0uJFjlnOO0Ol3BLh2qHcpuid3vYXavWycXvjOjPL8j62fOORGYS8IunoACQzeZekUHqrxmfoXRiAf4f5ictiSxjZKzV8VhtCOPscTtX4JdMN9XQGrKNGRmi1FmJbA0SDLMXZpu+3oZEfirRZfjOtL3bs3QrgQz4jWglF3kBJbFNKBMvsDNYbqr8s2fmG6gznVZ+a4c4EOX1x/t7tRWigrVLbrX+ubGFwzaqc/jEbAyCZdan2lureowu9KKTbkkYWYMjfV4nWNf46igu4+N1i1gA674RbZxndHZ052NBnXjTLwuudmOy2mGW9Cz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OytZBhIJ5eCAsRVpa2bAiXzjqOQw/3ECK4YZiEslUumYcob9Eng27SCiXFAc?=
 =?us-ascii?Q?TK746zGlAwzymCBVgr1jCqrSeNUX7H9qShF6noox1IH984exYxm+MRVFVVdB?=
 =?us-ascii?Q?x/70cqGNKe7QXaUTdVF+JZr1OdPi6gyk3Bw8OY2l1zlsIjREOQntuPUqFKv9?=
 =?us-ascii?Q?4PVfM09NlxxL6Pu60IRsyZaxQInMz79jS+sO13xWSmWZPXcRlC/0P4dalzOo?=
 =?us-ascii?Q?Xdp1Qd6z5PmzQC0dv+ikf0V+bMI/82wWiz9/8Nv2d8HYrXwvUE+x+wl/8h46?=
 =?us-ascii?Q?1xRjmM7szaBhD/e5hrEk4OBCpXTw0xIe/BzJv9Szwz7mEfMJ8/WvG7T+AIm4?=
 =?us-ascii?Q?MCwKFJF0VXW5vyN7nY3LlxaIuHiCubocy6kEgU46APchQh6F8DMKktkaeVpW?=
 =?us-ascii?Q?f4mqEO3OwPycRh6+L+tofLcw8yfmcKRFuo9JtuE31+k76AHT247CoSIKcJP9?=
 =?us-ascii?Q?aPvE+W3b0Inw95H4a76yGH6JOLC6suPrjoCAe11qAOQt/m2x92Q0ESHR8k1M?=
 =?us-ascii?Q?3OTFO1TJGA4od7fE5P4INYXFWU8BJLRDoTnCnQShp7UA21Z2hi8SxyF85D32?=
 =?us-ascii?Q?xsgK/mFcDLyS3TPUR84LJZmpBWY1fymH2QKZ8FVxPVLZFYCUn09Tb1KioPu4?=
 =?us-ascii?Q?OKW1L4AjbU1iPPsVPEyl22pDHLFx/zYZqbX6Cari9uUiljbZ/ShfnWcSdUtX?=
 =?us-ascii?Q?XQTu/1fTgOr+hAeaVMbVze6XmnWGxw6/joBxA3Mxvl6rQCDhfS6xtjka3V5+?=
 =?us-ascii?Q?PoXon6Xra06Ju2zU5yvpmjuT4Zj8513YAhRxk/4Gsj+usA4YWorm1xiykOS1?=
 =?us-ascii?Q?TZXahmEMmQClT/nMHgRdo9gbxlWtlsZ4kUFNmzRRcDgp0PmYn6c5RmF3P1ES?=
 =?us-ascii?Q?O2YJoA24nrimjcMlxKV/y4/WeFK2Z4WoYpw2MLbCpSwiw6QOlIP3pFyhU0RP?=
 =?us-ascii?Q?J2MpIWbZe1mfr0aYLw29a+wuk7rsgajP5zb4IYKjRFUzWBfsHupnPZg1LRM4?=
 =?us-ascii?Q?z/9yu+bcI6VLAWFEnaay4azAXmzkT1R439xWi5VOtEEqNcdrXqHfPuMPkncf?=
 =?us-ascii?Q?1NtPYXfzDPGIlsjG8r/yHIPgzpVRy/+GtLl2Fwdu1ip52NBu6i+oP8zTduNL?=
 =?us-ascii?Q?tGUO/nALUhQTXeYniiY13q/lBuR9p2qJ/QNia9k8IHJhtDSyOrNC0i9bCHqb?=
 =?us-ascii?Q?BtmJzaLpaQbhRsaP5Lhu38WR3AbNBbOuoH0tAwqHXyvtpJgD5VTNN8Easzqr?=
 =?us-ascii?Q?qRKaDGsfD+PEZ2Q7Hj9U96NEiKqO+eVwHaaI79WcKa9fX1hR7N7J6h61K7bM?=
 =?us-ascii?Q?m0CMn/N6lDMNS4YmX+WU+8chy0cl1Yeq4gjRuHcZNQa/vauz5xtCelbfRxnf?=
 =?us-ascii?Q?27bIZfFPl2o94TbblaVBa2J/c14mwE9kR+GOsQ9MimE/PKGjMZo5SClRhtgw?=
 =?us-ascii?Q?H0Tnb6nlukM7g+MXZ5pfsfNx2H3gF7uccFknHwVmWpDqQhSHa6vmpxmo1nI1?=
 =?us-ascii?Q?OAe0wr5at0GLGRPq1NimVtYIvzdSBAUkVKHQemdoJ2v0Ow/sl8NDpmOXc1Ko?=
 =?us-ascii?Q?bAviFKanQ/+Y5Mrrbr3xUdFnu6LCbynYyuB+tjzPhmUiyN/VT9zgUw+MqmBB?=
 =?us-ascii?Q?tJ1V9lhJU66+ZwvQ4Tl5IksXnC0XSXhKQ0vstw7GQqX+FGutBoEdV8TCLxMP?=
 =?us-ascii?Q?313JgI9wcKj0LdeLQwEJeSeBlbk2pQdDOxgPIDc/2NQVeJaZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2f1762-ee17-4732-e9e7-08dec7be7e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 13:36:50.4694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92wKseKT42KLCVz7WptbTAUD+vuBr3N3ob2P/QM0y/iQNn905WkaFS+97SCmuRhDWVJlRz4eh/b9FojSwcyAtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5634
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 13:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238440

Hi Yoann,

I kindly ask for backporting of c6ba523 "curl: fix mbedtls detection" from =
master to wrynose.

The commit fixes the mbedtls detection logic in curl which lead to build pa=
ths leaking into curl-config and libcurl.pc.

Thank you,
Mark


