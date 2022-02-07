Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB79AC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 18:49:55 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.111])
 by mx.groups.io with SMTP id smtpd.web11.239.1644259794449897144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 10:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=NcV3bUjo;
 spf=pass (domain: melinkcorp.com, ip: 40.107.220.111,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSWHsm1yY4NADIVozwtwrimekGrviksXWLinjEbSV8AEtiAz1Euk1uL432GZOBUL0DO7RpL7ZFn4EAhJZs3awj1Cl+U5pMiy5bKXR1jOkzH91KyBE4UKGaP7bl6HprP4RFNvMva5RSEE7iMHvU3aG8AneJz0RwqKFL8e5VZ0K6BKnstWOZYjsLeLVSMOrlddR2c6d3eo9dyEgbU5Ui++tSDPXQ5a4GS0u7jxOCBe5iVwqbrBMVbly4UIAywAX6UfroEY87l5yGfIfNP71cnchVVWYDgmLM3l/1qYL0kQjHqdl4GKKbVjJLdzNP9rB/Ge9vNOZLT6rxm4QF3WawWUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mq2Sm3wyTn7/rwtgLbOD1cpuoNWuSLQjDvo0p6nyFJ0=;
 b=dyXhIJaA6UaQQ1pEs//jP3rKl+JaSxmY8X0wzEcvIVIlFXc3iWvy0rKgIi0YVmwrzM3MPYxdofNZI0ecQqdrpaXwsXDuwLZIhxhvEmSiZD2+qWmuwfC92LUKg93pwfe4RJl7FUKHXmM2Uy92YfP6hxqMjYUNKnA7nQeepGadOJ95XIbxGrO/JfybrhPT77KeZHqGK6qVJR9wj6IIaedNJOHsMf64+9Q3IEHqtBi06a3oCrFxhP7KiWilGrw+7ynNvhrtjOc6PJ2g6KssumnWKZfdXxrZko/a38NK6BICbImsA+mEn94Q9SytX9SLbcX7rwGVv+23AAvRmQgZXmtC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mq2Sm3wyTn7/rwtgLbOD1cpuoNWuSLQjDvo0p6nyFJ0=;
 b=NcV3bUjoK2ECuQ/oOnFkkwfwVT6Ved1JT5PnpzfKav/4xB33v0s9kwrNt8by7HI+qCAEK5BLx9Y6P/GwhNiKezX9WNUJr/Nm1BDVc0UHXhC6HK6wp7mZ9b4PtJnFVuvWbqYUNlZHJCltl7B0E3P+spPvcfJ2jgAFSUzgJDSzdF8ffhLjOwZjBjsfP4WdJ/K+Szt/0j3hkUmaIQEGnbzUUW3W4cZliduv/+9MR0juK7i+jFItMkcCneG7PYDu0xPZVDN0DQ/jv2mbe5bC2SqD8XWT/7S/6M+YulxixIW8YVrNWcodoztVztuvu/H6B/fd01/HXBjUtwCtOxbb05UgFA==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by MN2PR20MB2847.namprd20.prod.outlook.com (2603:10b6:208:f8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Mon, 7 Feb
 2022 18:49:51 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::b805:3743:bea:e7d]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::b805:3743:bea:e7d%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 18:49:51 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gio-querymodules: error while loading shared libraries: libffi.so.6:
 cannot open shared object file
Thread-Topic: gio-querymodules: error while loading shared libraries:
 libffi.so.6: cannot open shared object file
Thread-Index: AdgcTEk/yTwxPrPGTJaVV/RKLvaNJQ==
Date: Mon, 7 Feb 2022 18:49:51 +0000
Message-ID: 
 <CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 9ca09400-05f1-40b5-bbe6-3bb25066c312
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f26aee1-fc6f-49ab-0a3f-08d9ea6a9f97
x-ms-traffictypediagnostic: MN2PR20MB2847:EE_
x-microsoft-antispam-prvs: 
 <MN2PR20MB2847DF3632CA95597C39051DBB2C9@MN2PR20MB2847.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vWXEkTZjN+60nYfNrceLEsLRgzpcIEvqtbzaIROg5ioF2uniINvXUAwOgQU8qyJJIOzLTC54SaTHaJLTClKk3UCTj/NSST6p1XPgSgEoZtyMlMaBrrANfMvmWI21+38Jmfzxc8RyBNkMPJzDztdaP5ooZyBW+q9CfCHxuB6Ml1ELrxN63PhQUUV464lVi48c5ptvvclM7bTW4Ad/zjCOw71pCOsOAppptamUTklXnagwHXkUw2S1rcjCHxO/++tXB2l86QLQcU3NLDSB0GlWSgaPR7wO3K8ftBuUNlaU+LurK8bb8DnsZxpr3pzsc/rDQjYN7cbjsI4B/jkiXAguIxAkkqEPixJ6q8Gpz8286PaS6A50atLQOWfKhPiyzv2itxo8ZVyO9zFq0tPwI/niE0ZExuHQzH9RrL51sAuCiD3zDDHgFgODG6G8O2P3jSSvJvaPCybJgzACRVJymXAXMr0HOVJDlnjvdYHqESTdBu/+5nSAzlIeIoYDOkrjwwVg8tkHguNPWRWR46+zPmou815AcIzyEmQudJBfQbB+qr6CpUmmM538pIoG1cNOJ5FqUKtf9G+NKAhhJF01QbE8Nw8u57KX6Ob58ztWi2NJWIetusA5U3QCdwJ6ML9wdomJFL/17kecBYtwClLio+0T+yPkkdQ8dPJBvZWX0RYKxpNVo1p8o/I63eNOsSpD+Wwr4qzu8EOzAAXGsZh3S3GdGQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(39850400004)(396003)(136003)(366004)(346002)(376002)(122000001)(26005)(186003)(9686003)(38100700002)(83380400001)(5660300002)(2906002)(52536014)(55016003)(33656002)(508600001)(71200400001)(6506007)(7696005)(38070700005)(86362001)(66446008)(66476007)(66556008)(66946007)(76116006)(64756008)(8936002)(8676002)(316002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qkcz98O0Nqy8IyG38PwB3A+BhtsjtilqNUfJLZGKDW9gWAOr0PMO/lS3y/Pc?=
 =?us-ascii?Q?uzCP13JyAV1dtQJ23p8AxhYDTU0xGf8nPJJY0KtXYfCGIA/bA9/te/md7Pjc?=
 =?us-ascii?Q?DRAndxTLUCM758iUjSp6dt778oNpFxU4paA/D/nmjG+dEHKKMXvl4W8+3pT9?=
 =?us-ascii?Q?Uv3Fezf4CgT78rkf/1FgxJ8iOC6ulBucuTiGUMYL/r4ddy8GrC+wIq2vLRey?=
 =?us-ascii?Q?Kf2L0GxOS35ybVNjdSeXKTX4e/qFQoq7DFWuc5LCK3ep1OW/3+rnCfpLpFi9?=
 =?us-ascii?Q?ftTY+GXcknBlp/1tjzAuJM5584IOEPHbRZerkfZ8CHXHuHgq0wNad6MclhU4?=
 =?us-ascii?Q?CR2dRyrrViNLFOKXk5k+Af4BB3ivzlosYCLfQZ79bH7NGgfWf7oeYeCY094j?=
 =?us-ascii?Q?EVIwvWBgp4h+Sy1tPcc7CimJUxwCFK+BamcTWmKGO274sbNHRtxiK3RMN2sm?=
 =?us-ascii?Q?IHBFA7fAj1rrF4f+fIlUbMOudcVqk2FgmiF1UGBqsfyZwm08nS7SkcxVkL8N?=
 =?us-ascii?Q?FPHoOV40YUnA3UbCRrq9edqGAC7wvQ7TtAVt8MhCxMWhvzOKgCF773+/IIVW?=
 =?us-ascii?Q?CIKvNuKOpmdW2tsye7KnwPNG9xQyff79mnMPdQka4fYPpi/ZhxGsUAQ6ZitI?=
 =?us-ascii?Q?jCZuDAh1XjB99yITGCWXFrm3qGr4zrdcy/qNCWuhUdyPnuKv1avIcUfPQ1En?=
 =?us-ascii?Q?DWPgknUKsWMibxXxYbkhxcNqFpecPqtg6Vum5agzzI8UAkS9c1JqAKv3KnSY?=
 =?us-ascii?Q?x8ZxbEinQH2JHIEnDwaFVCoQxJ3ls53wc1uAtTNWABa3TnFwliY2cX0HJd5l?=
 =?us-ascii?Q?JE1bYkSXFVXuIIpyCfGZs816o2HzU/inrH/8ZIWIiVhZtTCi3XE5lRdbD8S8?=
 =?us-ascii?Q?6stwO+nc9sdFDvF7s77I2U6aN8NU71xLMBavQseH8Titcksam1JiPOsl8MLl?=
 =?us-ascii?Q?A4QKX4jesYFI1hFS73dwiZV5Tr7ndDWhUyQuHxa0HSXKmVQiTI1TKWiiO//V?=
 =?us-ascii?Q?OM2Mk8JE/9kvxz9IYUbe/OxrPW7bnx/MdH4l+pAExMtCksbZ4FQLDwO5CE3m?=
 =?us-ascii?Q?uY0j4PLj0UAFon7mWIk1TkgtUPNV3g4gbky+NLKeO7SRsEX7KA75QOqyUq5T?=
 =?us-ascii?Q?C9pL572SHpPIoZKsmW+RJ30xRhZaqQyYQMPxhZPeM7DLM89jgRI1ttI4cqic?=
 =?us-ascii?Q?kENaCXS2SNY21iiDsWODhfCOAI2BR69N7pAt38XgCJxFL5cJwzzZ2lnfp/AK?=
 =?us-ascii?Q?Nf79ZnzwCmK/fiM8vK9THDena3FngM+1/rTWNjYAg3Z79PfBWJNd0P6SOLXV?=
 =?us-ascii?Q?16Y1mqA8i0OIRoBd/cg5jxFxGcKVPT1k82KO6E7qsPGKIi26L9A+aX9IUViz?=
 =?us-ascii?Q?aqJ3GEro54AaYCwAVi5iGmoaHX46J3UZzgs4HwT7D2r405nEl2qlhSTK8K/7?=
 =?us-ascii?Q?QcqSSBp8/GHCihKBl3rvWAfe2nQBSlnFZ81KhZrWSswvy2BBvxsWJwCe39Pw?=
 =?us-ascii?Q?I1P4SMLALp5gTycJJSM4moU6KFY5tcO3zD684pN47qrw6M/ZDx5VMwozDbU7?=
 =?us-ascii?Q?zNW0RqYpu4eblqqzoYJoFHe0Zw7svmD/+BG4kUulPZZOmDuFr4YbBDY4a6xx?=
 =?us-ascii?Q?KA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f26aee1-fc6f-49ab-0a3f-08d9ea6a9f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 18:49:51.3451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rl0fQxJ2hE8biZNFNfM3njfGbI7dhrpUZA71sABMbpOLhtGFKdLjWWWHCqXv9QUxc0UjU+uqdBB4VZbfCWLrHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB2847
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 18:49:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161463

All,

I'm having some upgrade issues related to upgrading libglib-2.0-0.  I have =
a device that is based on the morty release that I am upgrading to a build =
based on the dunfell release.  I am using opkg for a package manager.  Duri=
ng upgrade I see the error message in the subject.  I think I have an idea =
of what is happening and I'm looking for help on how to fix it.

I seeh that libglib-2.0-0 depends on libffi.  Between the morty release and=
 the dunfell release, libffi upgraded from libffi6 to libffi7.  When I upgr=
ade my system, libffi upgrades from libffi6 to libffi7 prior to libglib-2.0=
-0 upgrading.  When libglib-2.0-0 upgrades, it calls '/usr/libexec/gio-quer=
ymodules /usr/lib/gio/modules/' in its postrm script.  This postrm script f=
ails and gives the error listed the subject line.  I'm assuming that this f=
ails because gio-querymodules depends on libffi6 which is no longer install=
ed.

Has anyone run into a similar problem and found a way to fix it?  I've trie=
d a few different ways to force a different upgrade order and so far nothin=
g works.

Thanks,
Bryan

