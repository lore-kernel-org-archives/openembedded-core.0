Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16C6CD4F3D
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 07:59:33 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12593.1779436772187511780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 00:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=HXFsLqCR;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.72, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPq66lGZXU+z38vQsfg+Y1eYtZ/ZcbVWydkIc7qaj/FPse6iSv7PLxfEi5ojio05riIPtdJFqH9hXySa+J2Ex5U3RiUHOIvhyPEWs3hlyr+v/s+Qsqf61nxq9Dtj3ZOAJEhCyQE5Oa+jwEpJzZ2QPSntLFbnO9R0aKXG9rmqgTImuzsVE/vlSRwAghdh/zhz4EQnZLLLPX5OVqCr2rm8rb8K/c8rDCDL+/VjJbuqJmlYaH+H7Kjmmiwr67mY9DbLR7aQbt9+QV9C2+JTMnIPYHekv9pLrimaLMd6Lz8h4piAWK4yiZWrhMy06PAH2MLUAd8wkG6pdVaXFU4oLHvPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQAtz/d/RxjyWhPQqtmk7s5sDx25Q81qtjQOWmPe2nc=;
 b=DkpK9uEehiodi9Y1QXKdAY27zSJzqiAZOxZXmkpfNeZDWY6VWTJvIcPc+wC3RgvFBIlz46mkcNbkrtcdyuiI66lrKHzE1Icx6mrGgG2fHITA9el8A5Wslu4/49wUvCWkAg6G4oRmsiuG+49Mslc5iGQKBp8WY2RmOrbkbCt+M2YMJpSLVP/5H5HTa2EQZiuI/eRX6v0O0rMGi/w59H43bhqfMmMNKbmIrEaVVpxpvEVO3YBgGJ9aUpB/NCEmrIAduUUbmeYA4sFjSKVyBqyvYWzcyyhkJD5ZJQpAZufrBkBQKoMWxPUSHVOjLeyTIE1QXEcMW70evEjeg0jWgLwlUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQAtz/d/RxjyWhPQqtmk7s5sDx25Q81qtjQOWmPe2nc=;
 b=HXFsLqCRPA5hYYgMCHS8RKX4b+oabVfkgk+NB6/6pC5wCbGMl6VmGOeBIIMyTeqkQz40Nvuu9NHDGLLOFXkjguZMWdZhh1uiXb/BJj8HCsf6T6MV4E4y8jGhiFNPXhniY27s7Cs4NwvNHaM1MchERukIVR5h7DWkcxWnEO1ojqnbhXIZInUlp90J8G7zkZSz97YRgwK3J5ieljqGxqcq3XZbDk3uL0lXYjzd6UrkzDFzSFwvcm2RmJ6V0J5y4iRTeMMkFhKCQN0+JRtf9SoYVI77onQOUIDL2aBV3Y5XM6aUfVICa0L0ljU54o7OGrl5GB8LgnlkBpOpjtNa8Slu2Q==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by SEZPR06MB6118.apcprd06.prod.outlook.com (2603:1096:101:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 07:59:27 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 07:59:26 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>
Subject: [PATCH v2 0/3] devtool: fix standalone clone conversion for nested
 git repos
Thread-Topic: [PATCH v2 0/3] devtool: fix standalone clone conversion for
 nested git repos
Thread-Index: AQHc6cDpfvw9AccklEKlhlKkeZWYUw==
Date: Fri, 22 May 2026 07:59:26 +0000
Message-ID: <20260522075925.2381158-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|SEZPR06MB6118:EE_
x-ms-office365-filtering-correlation-id: e7c2bac8-1467-416a-41b7-08deb7d80b94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 TI/9rvQosf27BZHnCbHZtmCS/a8UhG50MySq9PbcepcRdZYoxJ/LP2yOb4AvHSLwk/3YoGwCQvFwOrSSrdaFKr7J6ooU6j8RZbCsvRWWN3UsNYGYvxO9V2ylrGmU7TFCEiF4yknF4ORB143CxLf5zh+bz+V7lMvTS51solFC+I0YaIkvPbppXIr5vNvcfCRgHF9KRwrfaa+D70m9woGKA8xlgiL9fAHZX7YreGHjN18dzNkCjkmilvjenYaOK4bS7d0Oc2ctiOzbmuQJ+l0KOhnEKZG6o5kTewNX1EPfTDS5XqzNviBJOACAWQgC3/E3Pl2rQlMxxwzSbThQWzr5DoT5siRnmoiViCU84ZznNGvoZAxMOmQjYl8++LtLk2uCMUK1y2OB/PrjwWtTPwcpjS7I+SrsVvmW02N+FgEWSX1pRg00a4hbwGm4fsJKeO0Xg0uv9Uhi/hsHRLX8tuZtKAaN0n4Y33j32LEenvG2/2cNBxHCDPZt//9xbok1Zl1wWnfjtZPwJIFytYkKqlLR+5uE42A5cXuX4R3EXx14cF1bzN9INLW5dXBrUlP/S9DBzBlLrkn9T6O6x6fjxgMI+wDSn2xBGVLd3jOJ1yVI4dXgmi0o7yobf71Bn5cx73Cr0MzX0KNKu0G/p6efw6I84FjvpNTxuJeDh4F1jiCeRa4MSe7fNP3kAV9Ck3CBpG5E8oPivEKv4HguaUipJBgPOaF+MeO3PsHlpR5x1+MpM9lm75auoLX+gGLu8i62Hg3d
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4MdvTGWxwBnPpYFfQS6c4k6Pw5tw6XSLuEKvHC9NZvYVy6dvX+9tJul4o05m?=
 =?us-ascii?Q?8gAdEJNygdjiRuCGIyyANsFekECRGflLN9jscz/KIJALBOw4RxaB9QT1VRgC?=
 =?us-ascii?Q?aB7nzwqFIRXS3UO/9mPMzTdaAeLeo9w4nFGxO798qLxWG2bmZY8e1anftNEd?=
 =?us-ascii?Q?JEOzB6PmO5FrJH9qmVro4v9KayxiXYvTmyRFZRM9pFN03dq38c44vTI3hSZu?=
 =?us-ascii?Q?WnpwFqHjyVuA0T6jTBxDroH6BXCvic1xH9MBi1KfUvDYBjC8e7r2Fyb115nb?=
 =?us-ascii?Q?Dy17kUjAhuHY68K5g29x1sPZGmdBzzBoiQ9IdcHP+IHgzXVGqtbXEO8allhk?=
 =?us-ascii?Q?9yxZWvmNCfYp4lhmq+EohdTsns4UqXXff7oxbolKHGzLYBfBW4Gp0PU0d26S?=
 =?us-ascii?Q?G8WG2yrFYRaIizmvkXZPXLpHBmTInSES+0jTpKxU70ONIT4ZuXmsGGbiGL6G?=
 =?us-ascii?Q?YR/g9FHtnFNRWX0jt9IC3qlTuj1vnkZVxDx4jMVM1D3kBR9Jt1OqWIeIegsX?=
 =?us-ascii?Q?p5uwF4aH9894W/3hH+D5zTCWZz7FBzC/nMtTCGGyKALGbxSrXg4ykC+2NJ3I?=
 =?us-ascii?Q?yKRjrQLJu2e5C7dR25H9ePF6qRrwIFQZd5EEsSVw2eTSiBLOGxQu29gpaxmU?=
 =?us-ascii?Q?4W42Hvkb5/Qn9TgZypry+k+/cffRCKATrQdP4MR3gCSbiSO8UxB+z8n5ZC/t?=
 =?us-ascii?Q?g6/EJEfz1FLqyi9kLOlpv6uZgISqBvjejr1Os6CN9dPHYLvtqaK3ZIWdEzsJ?=
 =?us-ascii?Q?0b4keU3pngzO46jq4Gkk1YoqUksXaCcvDAPP++ZU8/bwx0JrS+8dcv4zIgys?=
 =?us-ascii?Q?Ek2ldU0Ths3y6Tkl8joANy2mBqYV5WND9UJEV1P3XezZ/oRd7/sHQQW/AFvv?=
 =?us-ascii?Q?aMqE6CKXUcLlg0yZGdLiFLS9DYoXD9bOgyUM+Tur+6mub++DI2fzvtVW9LKd?=
 =?us-ascii?Q?AUEMmNbERVfP5cZJj3IhZNz2degVBvI5dFbjyBW8JFMHG0ydKEtEqfgbJ3c0?=
 =?us-ascii?Q?K9QhnVov0fByM8UDETwmmp4pz9aMmU2KP5NtY/eYnO3b0UcoQ5eirgdx+O7w?=
 =?us-ascii?Q?APDEiphonDAfLg66eyP9suJNy3o8Qw6LnVVpLBDgeI0Nj3PKmVyAy8UDR+wR?=
 =?us-ascii?Q?5gpgEnFWUWCEKdhrErwdTD1a26C45epHGofPsAHd6orBTPKH+43s2+pREKIm?=
 =?us-ascii?Q?o+D/lHaK3v4lb8XXED90btRUrEA5wLJ8v34vXBvhuMMC6+MZsXmp4hnUhtva?=
 =?us-ascii?Q?G6vaNpaxd6Oy5Zk0RlqMY0cXSxta12oyNa9e7ThE/KYmyFwpbimYFORyc+GF?=
 =?us-ascii?Q?D8X1jUs88F6tXDXpBSmxIo095pTEuL0xVy1BDfXpx7eKm3sCSTtPpHMLRbAF?=
 =?us-ascii?Q?T4N6mHfFZSZNCdRNbm5kQADvKwOc9w26s2yNgvWFs4HdnHcgntWoJnSsuEhM?=
 =?us-ascii?Q?kvJdAHKxJOtM4pmiXlzSRW3f06I1HBVPMi7QF+6XiuTsUEhzS4onMwAbQEk+?=
 =?us-ascii?Q?OnrJ8TdgmLWw4bWGN3PnFSkasi1ICzIFyA4RYESeoVf1tTUc5ivc3uzxGKmT?=
 =?us-ascii?Q?YKEf5WRx3qtmJHw8xJC2J+Ws17RH9Aje+VCQjxSlFka3RXL09Xr9AEhpke0F?=
 =?us-ascii?Q?/VCScAvZSuDX4BOjXydvYzeiHq6HgqP1FWKQbu33yUpMuGFiBA5WPX4CTNog?=
 =?us-ascii?Q?pFqfoxHQ+27FpTdgL42zhcTHqkc4355TBC5jSUNZGG0DB1IvcLHMYvLrfwDS?=
 =?us-ascii?Q?keXr2kztxw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	r/qUZn/U5I4r29xC6M4Rqjz5ZNgb8hmbRNTcXDDcHye6VtMN+6zc1+Rais63nQPwmaPF00PZNqz2euCfQwfjQRhGTGEk7c+k+mPW/T9XI5cKhQcQskweFoTggr7LdcqGbIyHALjkEGySEeiMblyo/V/6HEzb8Zp1Zv7YST9NqwUECIJdMKHN5vT0U4F1rpzcemIIT6mbVIvNm8r6oPFOK1I1QbZzAbXdUtw+tgDOSfUMZJRyoOkuUkTxJz+/UfRLNSftADhH4P5PjZLKFKUCrLRnuxaGXk1ny9qh+14YgNlJUfDwIn4WAaEzGldy0zC8bI5vembbQVyxH2s3QwyfFw==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c2bac8-1467-416a-41b7-08deb7d80b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 07:59:26.8007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E9CMTDy6tpG4ZLr1yvpX5hSWg+htWnVpG7zpRmQg2CXTGT8JgtUQcWcyEveHxX2zRxvGvNRb+gGp0fcHQh3182fMtLWdMZpb1yoUfNrPJh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 07:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237529

When a recipe has multiple git SRC_URI entries with destsuffix values=0A=
nested inside S, devtool modify left all but the top-level repo with a=0A=
.git/objects/info/alternates file pointing into the downloads cache.=0A=
=0A=
Running 'bitbake -c cleanall' then removed those shared objects, breaking=
=0A=
all subsequent git operations in the workspace.=0A=
Fix git_convert_standalone_clone() to walk all git repos nested inside S=0A=
and repack each one to a fully standalone clone.=0A=
=0A=
v1:=0A=
  - Fix git_convert_standalone_clone() to walk all git repos nested=0A=
    inside S and repack each one to a standalone clone=0A=
v2:=0A=
  - Add selftest recipe devtool-test-multi-destsuffix with six nested=0A=
    git SRC_URI entries to reproduce the scenario=0A=
  - Add test_devtool_modify_multi_git_destsuffix_standalone to verify=0A=
    all nested repos have their alternates removed after devtool modify=0A=
    and remain usable after 'bitbake -c cleanall'=0A=
=0A=
Jamin Lin (3):=0A=
  scripts/scriptutils: Convert nested git repos to standalone clones in=0A=
    devtool workspace=0A=
  meta-selftest: Add devtool-test-multi-destsuffix recipe=0A=
  oeqa/selftest/devtool: Add test for multiple nested git destsuffix=0A=
    repos=0A=
=0A=
 .../devtool-test-multi-destsuffix_git.bb      | 29 ++++++++=0A=
 meta/lib/oeqa/selftest/cases/devtool.py       | 67 +++++++++++++++++++=0A=
 scripts/lib/scriptutils.py                    | 28 ++++++--=0A=
 3 files changed, 120 insertions(+), 4 deletions(-)=0A=
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multi-d=
estsuffix_git.bb=0A=
=0A=
-- =0A=
2.43.0=0A=

