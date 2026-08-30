Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C57DC61DDE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:11:42 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9130.1788099100928846017
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=rW6is5UM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.93.195.59, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJpCCAy7x59VxK8iqoHdW7NmQfAqQMsTnSPaVoXVJHKZfOX3vpYcYJYN5sXBqAW2KVW5zvNFleGz7/bznA/oB8vc2QU4qlZVizn43RgZfZXFoiYrj09S3Q6mYbP/KwhlUgAY4pATJloZmxtEIZp+l5E9DIqW3FP8+6yCOdFYhU9/iaKfsTiMt3BNoqBBc25S9wUMhIndtKOHGn4ePGYbcs4ZELcYWeykPb3ymhZN3dYLZLjui43W0SQDkZOqneRzSKvgPn0ZlwzQXWn1wIGyaQ2DkTvE+asYU2O1gWu72hOb/kVw1lhWmwo72a+lt+dl3BJKL0lqxm8pNWrdXod3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNmBr8TfWYMAw1V1WDKzYH9gWEygKKa4SY4I/VeGC/w=;
 b=inruvtHuOMiwq0gMHu+BEt8o+MVOEwaHFcmD1iSPEJDWxPpPZfY5SBda/ZfIXFThg5Iti4WCaZCj3yjXVjshXzRKDqCVIBbgzC5doWY58HmFah6LQART5WTmivW09ySCu7arHUC9y3MhsHKu59gZZ6LBxx4SKP7hb1/PVcnPXc3jHt4OAGu/PVuoQhBA7EGJ2GbntFk6LwBqgwFA+2nUeWHMlKL4O/xUEc6Iz471G2Za/l0hJ/sYLZKEBc9bRgDWDmoCpsbOqw5GUAB/xaCXFq3dDPPyZEkph97coWx4EZA3db/0KhW8tog9gZ6FzqF600pyYmWW1yO2CluH9v9AnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNmBr8TfWYMAw1V1WDKzYH9gWEygKKa4SY4I/VeGC/w=;
 b=rW6is5UMoWeCrdJ+zz3/AeO4160fsqIgRrxJZKP8Ifv4QkeQ3k1g0WWAVEeQiSCs8NGVIXc7JH/K7ArJlAX8DOES7uQGss7Y4qKekWR0Ty1mC6Z5rUuBbpmqFjpoJlvDz01WTNm0E5Sncf8LEcgQxIxxiBEm9f3ns4YARnIDcDeZ1PGrgQMm0yi0iRA7EZ9BEvmnvjGtUbWwIiO3D/d60c4oIp7sw6IJBsjWOQa+bAeYepasSfgDE8TM7umK0onYRB1VbK1pXvaPNKzja9k76Gttq6eFraAlxT48url6FKnkgZtEXuhiNXekQ7VVZ33AMd143f7EnG+MM9VJlYKzpg==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 14:11:37 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::152b:7346:321d:4a2]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::152b:7346:321d:4a2%6]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 14:11:37 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Patchtest results for [PATCH] oeqa/selftest/bbtests:
 tweak test_git_unpack_nonetwork_fail to match either fetch or fetch2 in error
 message
Thread-Topic: [OE-core] Patchtest results for [PATCH] oeqa/selftest/bbtests:
 tweak test_git_unpack_nonetwork_fail to match either fetch or fetch2 in error
 message
Thread-Index: AQHdOIaEKCcId08Bp0yphUQeDvX3Yra2nvKAgAACBGA=
Date: Sun, 30 Aug 2026 14:11:36 +0000
Message-ID: 
 <DM8PR12MB5430BF1A22D1CF2FA74DD12A8BAA2@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20260830134952.4182115-2-chris.laplante@agilent.com>
 <010101a052f950a9-82c5481b-be36-42c4-ac78-506ee59524e8-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101a052f950a9-82c5481b-be36-42c4-ac78-506ee59524e8-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=8828043b-c3f5-4e65-a269-6f6afbb97d57;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2026-08-30T14:08:17Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|IA0PR12MB7723:EE_
x-ms-office365-filtering-correlation-id: 99859034-d3e2-437b-7c24-08df06a09ab4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 BxHWRIMIlRZJGjYSg8nLO7hPg6i8Eogy0Nc8Q6zn8sf+vP5EcRY+90f/NVXF+YFhcJJEVVMiunOUZCdqo+V2+32U63wjm3nxK8wemt7QoXD1BgT/MjlEClVOn/Bwf7Sn/miOP6/BlH/b/7hESebOInKKP1Xz2fhbNgmONFqKeYapmlV88avZusfa7AoohQk3ddWd4tewON9pRcYf7U1h8pS+j5lrbgDQ/nJuCaJW52BJdcbB2Oka0ofno9V3IChfOCzt+Ztz230oOTyihJdPUr4iDK+0PkOXaQJcPIuP6Wp3qXapR0ncsCBIv8IdGlrNPjYRpQonMg29oAct8+IqXEk8FhvhfUr+DkgFY4bh+dRaBSGieEwcTgNqmmqOmEB/ek5UbQSywZSHL1jcU4dGee4S2ByOYaay1kMWsNVXCsrWqXNAlZF7Afxflzz4gwAu0VOTKXk4FNrh8yNfUykPkrJCyGHSrQsun+/3nmkq6uOOPWFATtLM5tjiPyY8QpcObsxomAj1jdQdCA7kiEDEmZFOk7UKTTZixipTbf99Hqewmrcb5Cg+1GVqSfvdmvhNszDcHwR4eAnArp2zsBsaLTmtGVqwXuX0Cj8V/fKnSM5PKEQD6eJBkgcmuxkYV8/Rtu9WSZVdt6eB3ogLrF6EsKowqqC0ZkFuQaemD9x2lBes3iLxRvlJNgb5ov7DEmDoRuo54OyCZL7cmCFq4wCx+XnhLx7LQ17fDfcjgu7Rryc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?HC0WK7Z5KWJKiLvGP782hCJtKT/XYllu+NnuHGLB8Lb58ucU6NYWQz+DPK++?=
 =?us-ascii?Q?I5YafSJT8thBgf4bxO6AR7up1jOUZgoyLB+6v37HbgScPBDbX3gg+fhlHmz1?=
 =?us-ascii?Q?KDmmngaOxF+fWV3sJ+gG7uQ2b81B/QFNnC8SglP9kWPc5NUt47DOqo8c+Efi?=
 =?us-ascii?Q?K34Mkl5PfaX+5cf5yae2olY/iK//wwxk8qBLJe2E6z0MlNg6d+rhxzpeOwjf?=
 =?us-ascii?Q?h56tAx8FfLkzs2H6VfwyYkwtdWJSFxqCGW/8GM8jLmZKqy4FqMgwdFw68rAT?=
 =?us-ascii?Q?L8ggaSJQa/xbCJNOr7t1Wg5nBQPZzHgy87iW5p9lKQw280HqbEQZVUk0t4id?=
 =?us-ascii?Q?2J7pn4w/fB5hcFOVIOIboYJ5b2QIkEdPSEJPPco28Azjrx/fI70HCfF1ya9O?=
 =?us-ascii?Q?qOFs6ofMUQ0OM3O4JlWaBoiHegPKDiXu0OYkwUtWLRCtSZQ8ZfTcvwQfwn5X?=
 =?us-ascii?Q?WESlyl4kzM78kEeofjc1Qf2oll9Xc6naGYNhCxeN/Wn6IVrRGAierDtFULeB?=
 =?us-ascii?Q?YdNo69uIhzInmnrJNYZB39fO6w3gmNHTCyMGWKOd6o4riG/yEUGsCt/C8bdq?=
 =?us-ascii?Q?ik1qWoCk9jazjsMKiMSPI91iyCFeYWYnsTV3kR0Uq3B27/4cn8QDXvkEsMtS?=
 =?us-ascii?Q?zm+XHL/o2Z4YMYoNEJtHJLAdyLyCycNmPjGjSc1qGBKeary881109q5VrNiy?=
 =?us-ascii?Q?US5KqcLQQX3T3lm0hrtY60LlXXpYY6GMLi//51N0Yl+/0OVO8QmaXU+RhmKw?=
 =?us-ascii?Q?vrKLR9j/sHLBA6ZDfroE9FK+7IQZ98VI6Ke1qtZjifQXq8Kis/YBwEKvqapn?=
 =?us-ascii?Q?/KioBTEycaSyoqPndJd+PYw8Xr2m7o9/DpIn44mGJeAuF2X20NZOmxgct2r3?=
 =?us-ascii?Q?Fyw/9R7cHytVlfWBC31+WibBik13C0LjdIF2rGj/OrlVw2WNDotxBh57pE6D?=
 =?us-ascii?Q?4e5F+MtW2Rw6K4iio5ohhPPe6hcAR0G0qNnYzuC+IWlkLwxey2QO8m8WPzVk?=
 =?us-ascii?Q?gL3SwAkEpcQcXKeTu6wUwoJAXpCM7bvgCtFqKDcgewSj0NaJ/V7y6OmOmeu2?=
 =?us-ascii?Q?NWtBx7ty23EhC3qvOsgbe5THauSrq/dtdPoFEHy68xS89u2fAn8gmUpAzFjA?=
 =?us-ascii?Q?5lKP8lM05HGbgV3Vv4xscE1MZiAJQn3Wdnj+3cEZlpj8h5A1OwI6xRX8+8xY?=
 =?us-ascii?Q?P2Rw6+LDLB/Fc9xfBGctgGg7V6EN+nbnRdrOuEbtOgnDx/VOnylwrqUpu0ZA?=
 =?us-ascii?Q?rYxB552d9NhiVW/7QtKScPz/KshM9bEsRouzz7Df2d4KD7n3sW8gQDv6Rqyj?=
 =?us-ascii?Q?A0x3dg4lpuVg51KOwD0wLLMFde9F6U8Bi0VYjJ46vfFRzAie5/BKxuWWDZMf?=
 =?us-ascii?Q?8u0Ce1wPdtu6k/SfF9kD0SSJzNrVrXZAKo4yqdXAqIeiOCqsxI+F+BnIPTZ7?=
 =?us-ascii?Q?JYbe91hFMaY3xLE5Cw/FGw3inytG8DrENM/jjDJ6uvIoiefa6RCFDJgbxTD6?=
 =?us-ascii?Q?imBs6sADPjIJYNzp+GLw4GmeRUJGjEX74naz/mypnM6rBrlDeTEEzAjhnYXx?=
 =?us-ascii?Q?LmvL8LAQEd6XijaGat1vntIdupiMabke4bdU2Cz+culACV66xi/N7R4z9PU0?=
 =?us-ascii?Q?J5hn1H5QNh5K/he4l5yet3PKuBP/oslQ5LaDHPI3r0hsQxCSaiENW+bmn//P?=
 =?us-ascii?Q?hPZ6mMl3ncASCQTWqKdDLwYdXy9dVD8xC7tOFtXDm6a2610AcHM1HO02mvED?=
 =?us-ascii?Q?fzYx6jSmFw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99859034-d3e2-437b-7c24-08df06a09ab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2026 14:11:36.9930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1pGG01K/zbOXAj/p0WqnbSky5uC+KiUE5eW884v9qGe78YSdvUTVcekW2LWkkvUf/9fsSegK1z/XQaZTdkz7BRWqyV8/e80D6oJN+gC/R6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244656

> Testing patch /home/patchtest/share/mboxes/oeqa-selftest-bbtests-tweak-
> test_git_unpack_nonetwork_fail-to-match-either-fetch-or-fetch2-in-error-
> message.patch
>=20
> FAIL: test max line length: Patch line too long (current length 244, maxi=
mum is
> 200) (test_metadata.TestMetadata.test_max_line_length)
> FAIL: test shortlog length: Edit shortlog so that it is 90 characters or =
less
> (currently 108 characters) (test_mbox.TestMbox.test_shortlog_length)

OK, I understand the 'shortlog length' failure and will send a v2.=20

But I'm struggling to imagine how "Patch line too long" is a useful thing t=
o check, especially when the original line is already over the limit? Am I =
supposed to break it up or something?=20

Thanks,
Chris

