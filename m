Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9333DCD5BA4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 08:15:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32037.1779351341171312143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 01:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=iTMaPYZ/;
 spf=pass (domain: est.tech, ip: 52.101.83.68, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpydNfskWAiJND59qJgtq2cvMozyVcvRv+xEBd+JXOhqUhh7Yr86LfiolraN7KShqoO2PjLYL72iFT6oge8omvzu+hiZ6oM4Z55l/tVeXpuMNEiyWpD+2exO63QxaRXjOs2vD4ODIeTVJ742TDMufhkBPMNCaA2hV1bl7kNp0/Ezg1xUZNS2KYxtzq96grbGWys/mTmPEBzxG+CZLrun8aV1uDxDnJJdcMdIXLFrbdJp/ImLkmR7+16biT8fVuen5ICS33Yc9RARaRFHUBshb0gPwYxkKftpG2h4s+4G0rbIMNj55z01nyplS8eLtjFUu+88MO/ACV3SCcfsC4TGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plZSWYadg/3ohh0j/QtDlPoiU/k5hY5nEbmBQBrZCXA=;
 b=nqaZeIlQpluX9JtPyfqYV3bpvz5U5OHHTWSxGjfPUsnA3VTvarpyM8jQjD3CpGgr1zln6G5WeKTX4fVJhFwCr+AR6wsFK50TyJ2lIpyWD/fG8OjHM5TeGRuAnFrr+tEQ9tFeIWmcZYuVnVzDxFtBt2rWyqRcu7FGiiyExRAY4BmMl0/4AHoO3g+I6MU/MaULGPWM2OeUrpaNtLKOxGSO80dZihT/SRGk1dtONVnjubWLU24GnB33dbHQ6EGw42eOAB0xksgAtqdr/qgUbOl9mkI8OZMIaP1oQIY7S8P3lI9axum8yMS8//PBciDKPe2k2o6QaVwT2BJ+L0KG0IFSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plZSWYadg/3ohh0j/QtDlPoiU/k5hY5nEbmBQBrZCXA=;
 b=iTMaPYZ/PaClH+mUmjeD2G7ZApkWrWP99b8ClL89vfO5LQa15sybAa11f3/bkKGUS41GrYUcJX/bnrQrbUzP18ZMnkmxQycFLxG9CMScIuaCVcUJL0pm8fA+2tHltqvnyTQsMKvY9pm8bIA47uLH9P3UqZ1sv5+40vTH2RmybWpOmlA/4JK1wL6qn8UbAub5oYKYL/MHW9g+WV/WDnhRUAJbkEQbrLIp0tunK3GmfhBBMu8ZQMY3W/YeV/+3eCBcMBmpJRE/fIHBqCOeE/8DTcC5U2eTZPBz6IEHIPuscjl/PGK1QZDjAkKwt2Nr8G8cxSOtC8pI3YLEo7qagNB9lQ==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by VI2P189MB3657.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 08:15:32 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 08:15:32 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libatomic-ops: add ptest support
Thread-Topic: [OE-core][PATCH v1] libatomic-ops: add ptest support
Thread-Index: AQHc3S8KFi2NvL1lLEOjCGl93vrkQbYXMqKAgAEG7GM=
Date: Thu, 21 May 2026 08:15:32 +0000
Message-ID: 
 <PA3P189MB323951094EBC67AB1A4A13E3FE0E2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260506080459.21650-1-pratik.farkase@est.tech>
 <E1BDC2E7-0672-4BB7-987A-97BDC2E9483D@arm.com>
In-Reply-To: <E1BDC2E7-0672-4BB7-987A-97BDC2E9483D@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|VI2P189MB3657:EE_
x-ms-office365-filtering-correlation-id: 92d41534-dcec-4e22-86e2-08deb71120fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003|11063799006|4143699003;
x-microsoft-antispam-message-info: 
 JnwoodziaZ5dkagqS6fNSH+2199DxAFFh/3pU91xJRmegLOPtuz6oz0RSXvOORXAX2donqNuww3HHQYef36cQ+TAV5uELGeFS8Pu/s7n7MmRJ1CV7TThd5FhtrlA6B00RqQsQE43bEjQplRQ15CaWwe05BUKqrmTQggDU0jPt9Ig1rK1PnKobCWZ7B8b5px76RUOSdNx12rtvHPvTXK4xjDGV0eQN8Z44CFLOF1XxR99opWNkO36JmNVDrakh8afRwaXa71aqV5TbbZ7GigQUhw4QYfPjf8ez2WCael6lVDhWbPfKzuzW8P7bNmqIb0FodSXli3OQX2XhZ9WrJMkjhkk94NAU//rT8btQ9vpv8o49CDcricE9Dnlko/Ctf0gRkDh2zWZ1OAsGNRvXyi3SGfrai9yJuSqKTNwD1Bq1Hfnk01kaWHoCfJgPzz/9+ChEhqEr6Ht1mQvvhurv24XKjD2hSaRnwHI/LGFwYeeY2YAC79IWeyvQrVymlhiC97EW5xYDYxwNpuAmrr54OV7wEUOSV+flBNcvQoc24M96fdMtsotpwpkopuTiaAEhkK9AE5w3556Z7zdA2CyMvdC872AN0XQvSrWahfGmjI5sZPThvRLaL9nkS7RCmSOdLXlKzlc+CDYD8VRA4rydP9Wgh9bJIEcjD23av5VN2JM5nNBNa0XoEQbWfDEhPJ2XSnwc8OXCVdTEFMLHfQOD9M89qNGSaXxignWPXVirUHLPVhv1mpU5JNxYDstlF1k2HZQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gRCSO2YUPdj2Ck0dHHoVy1lTM9z4MBYjZknZvOSDZKRLg1TOYug8SLeiW6In?=
 =?us-ascii?Q?BqXLpwXV8pDvyNzGWl+JlouuKXcytvMCrSzBOfJhDKrw+ASAq5VuTVDSJWa+?=
 =?us-ascii?Q?RLwKukLaaRPyEij/l6RSzlj6idLtCFWyVoEs0cOVFz0/xiFHfvsGS2DVVgkh?=
 =?us-ascii?Q?FTcogQx5KAVwYeE/K5SzNBwx0MiXXCNZMmW19si013TI07wzFp7ncZHLWgQx?=
 =?us-ascii?Q?5ltoN8rpTvSQVI8XbyPX7DG4Yjwf3Gl31IsbZW2KPA6A4PiDIPwjd8V6r2co?=
 =?us-ascii?Q?G0RfTrrT0Cva6DLAX0Anq41qmJf4fZHpQAKcoX4RWjU7Rl81naHCVtNYAdAr?=
 =?us-ascii?Q?T0wvqT0H8kKPJtsaEbHKnD/hW0ox6KXEsNmcuhfDFZSe5uaqjf/bVQEel5DN?=
 =?us-ascii?Q?HOexUUtHL2Lj4G1IoYYTI9qy/b4fo8/oVdLR3ZoZuzVCvfiAurZkDLUvOU/g?=
 =?us-ascii?Q?T2AxnJUHOp13dV99CNP5abh4p8uTbi6Ww24P4z8s7EPwdkEiFkzabX8rPhH4?=
 =?us-ascii?Q?6S5hUUgA7kioQFkSgMmeJ4XrB4n0SMDQvEc/0E1eprbijTX+y0wYDGUohepb?=
 =?us-ascii?Q?bphHLo+WPaiH6m6cjF4cr2J0il1j1C4Xxc0ABg4PBmC5uAlVmLt3v1P8Vr6V?=
 =?us-ascii?Q?4rTO6RlYaitOhw3E24N7cqA+6c6iBICWuJruROS5JVaP0lb3pMy4l+d9KZFO?=
 =?us-ascii?Q?iPIv0cU2RuwyzKi8Ii/DJG/AmY5ewGIKu9oY/uLxGwgri/ogJZBLFU5O3A4R?=
 =?us-ascii?Q?C9aRAoeOadZ5cN4wmTWWwrLNN+ysSzejG1RAEvWcC1al4rXzOwFkBdlIyMqr?=
 =?us-ascii?Q?95xoj9Gnqg4E9q65zdvu3fYUm1C/bvXffXyA5fV7j3rWJmpGQfk9nK+ueiFR?=
 =?us-ascii?Q?spIXT/2NHJaX6/blFV7O5MdeGOT0bpey0tHFK6Aezu9lWKGFS0+ki2jHuaO2?=
 =?us-ascii?Q?hroIdhz7bFEggh4EqmKXgVCGtz3NvtSNLe7KRdILsO8rGvBKBcjgR4tfswIs?=
 =?us-ascii?Q?ENnw4fuSFsiJUlP7GarNnqjbzNz/AXHmqdlCZvIeIpZXcVIuMpBTaDRYHxjj?=
 =?us-ascii?Q?iJ4dMi+xmp5DZ4wWOR1ofmVcfmXMCQi5Q3h9D9unZmu2jgj6keHmpX9nbpa9?=
 =?us-ascii?Q?k5UWhIzRJxXr+AZM5WAO/i3tZjwWW6cCQX6lTCjp9kycm6HD/5WhSjrY41Xf?=
 =?us-ascii?Q?K3kvEXubgQPxwGA+Cwj0XUCVRdXvTn6ODHEL6vatp5k1OXejs/LtRpq8A4ye?=
 =?us-ascii?Q?eY7/81eI8w6r3xVarcM1+kj34kMa8GoatL20sMU71lHAR65lBwpyq+B89DzB?=
 =?us-ascii?Q?eEDxkBH28LPF7nod+TkYwvQVWc4Kretg+7OFKuKKB5YwiO/StXlpOtyK7SC3?=
 =?us-ascii?Q?foCZVM2xo+L2AR5vMGfpoTSz1i7G9jiAj05WU8AS1NMVvItCi9oKVxemzvu6?=
 =?us-ascii?Q?377UfEsqDDDYWplPdAt1jGLDyx6AKb4D/G+LXWa7vOKfpY3Kqy93yI7E+VqL?=
 =?us-ascii?Q?AD8ivIs32XggWtQjJGGIJUPu1cCe3S6Zu18kF3vEZYDkQ2d2mQeqXfvM/KP8?=
 =?us-ascii?Q?88oENB7LGwOjnx9fQOB7jchIaP1h8KS7XAHvRFPCpWBgb6hZSMuBX5A3EhAP?=
 =?us-ascii?Q?GitA76OlYk3II5x2y/zs/Q5KmcBTy247+fS7RMSTSV96/8K0+XLR9YGDUlfd?=
 =?us-ascii?Q?HvhIwbB9D4mEgMiR8qKNV5547AUv54OcnzWCYLM5hEXkaWdQDylOZqCxgSqY?=
 =?us-ascii?Q?N2Ttr7gKeQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d41534-dcec-4e22-86e2-08deb71120fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 08:15:32.8462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2J6vlVSbmrGSz1YlOsKrUQzAEdDFdzGLE7aNu4ybYrC3XAhnRk+ByML5yKvfaGiXF3W3ijKv2I90nj7L/JIeIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P189MB3657
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237478

Fixed this in v2.

Best Regards,
Pratik

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Wednesday, May 20, 2026 6:34 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] libatomic-ops: add ptest support



> On 6 May 2026, at 09:04, Pratik Farkase via lists.openembedded.org <prati=
k.farkase=3Dest.tech@lists.openembedded.org> wrote:diff --git a/meta/recipe=
s-support/libatomic-ops/libatomic-ops_7.10.0.bb b/meta/recipes-support/liba=
tomic-ops/libatomic-ops_7.10.0.bb
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +
> +    find ${B}/tests -maxdepth 1 -type f -executable \
> +        ! -name "*.la" | while read -r t; do

Can you use makefile-getvar to get the right list?

Ross

