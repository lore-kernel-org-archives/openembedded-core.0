Return-Path: <ccasciato@21sw.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AADC3600B
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 00:51:43 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.119])
 by mx.groups.io with SMTP id smtpd.web10.1022.1743123093081455939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 17:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@21sw.us header.s=selector1 header.b=o4O0oby6;
 spf=pass (domain: 21sw.us, ip: 40.107.236.119, mailfrom: ccasciato@21sw.us)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUSuQ0kHyT0oerc5L6cEMHX6a1BrXu363gXAPHlJ84A+CVsNaVD4aszv7RgWLY+smBz7mtXQFkoPdTB4UnK9xyRhANmsQ2L1ojnmFF025MtN4+38oirLcY16qyzBIoUAK+AHu7cLr5h2xY8YhA7mLzXSyMOcSzzezmVeyxGGCZXsv4ZebTZ1lTIedGgO+ief1Hhubu9WshcYA2UJyZcu9mDj1AxcDkK0B2PevW0S5kokcRivOICUxxEhlPwuMojqLOhZYfMBD3zuL3onXFHl/hqqVk3KRSwfNHEDhOYgGJSzgkkOwIdtqrcROcDXlw0YrWbvf0L91IXxn5Y8nYOUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XjQSyx1BMrG3CJoas5b5w4fiEi13MjrdEaqSzbkaz4=;
 b=s63gBWd67U2dKY6sYHnks54CSfJwaIabrAm01ahp+uSShaOliu0UG0iM7jWNFx/1RpPwv3YVWYQ49L2cDAqITeKzcgCqQLo3n+NIkrYutdl/qDgZ5Stx6jSGDXtU4DM51lhDbB5Bfr8ED75gxyNQVLiSw4Hsv/AR2LgE4O6INBgH1gLsH1E/t4cZRvSdSpZCib/UMVCTVnS8RE3uWVOnD61kPnpCLuitRIY/vdX4RS7fBBxajJqUGmLCDsBVP981WKtGnCFCVXlSnc6myHstcskl7x7bzqjHhcJxgMw85lknx0cRRuUT59qGVY4VA8Nwjl9qR5cB60wDAOIdZR9XTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=21sw.us; dmarc=pass action=none header.from=21sw.us; dkim=pass
 header.d=21sw.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=21sw.us; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XjQSyx1BMrG3CJoas5b5w4fiEi13MjrdEaqSzbkaz4=;
 b=o4O0oby6pPmrlaCbM/5aaJyVgCP548We86gMRnBwuAnbiIHa9ZUE2xjtD4/uOR/thuPQDVPfQNYuv3Kgfcpif2Orlfli1Q714z3UcTgxHLuE5SoI/Zo07jSS1vn6A/BigFxzYq0RdqpSWBTFDt9B8ZkeZKbThyIOe7YwvAsoo1nCP60Ej3CuBwlJqJJgRSMyD5JE6R/PGxX5IKnetF/gCY3Y+i/6A7w4ia8Vjjjj+nfwQzjb/5hC5dl8Ywv18izwq5QlLgKz3xRCoNkMSKdCjpFOjsRjYeUVZRZmUNF0ENJdygkeOZ+qGtrjkVHVHyn/kwHPgVrp3KUVMhxwW/Yvxg==
Received: from MN0PR22MB5515.namprd22.prod.outlook.com (2603:10b6:208:4c7::12)
 by SJ2PR22MB4734.namprd22.prod.outlook.com (2603:10b6:a03:583::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.25; Fri, 28 Mar
 2025 00:51:29 +0000
Received: from MN0PR22MB5515.namprd22.prod.outlook.com
 ([fe80::7b97:a11c:793c:c238]) by MN0PR22MB5515.namprd22.prod.outlook.com
 ([fe80::7b97:a11c:793c:c238%4]) with mapi id 15.20.8583.023; Fri, 28 Mar 2025
 00:51:29 +0000
From: Clayton Casciato <ccasciato@21sw.us>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Marta Rybczynska <rybczynska@gmail.com>, John Day <jday@21sw.us>, Michael
 Chaffin <mchaffin@21sw.us>
Subject: cve-update-nvd2-native.bb | NVD API missing field
Thread-Topic: cve-update-nvd2-native.bb | NVD API missing field
Thread-Index: AQHbn3kxr55oxHjyP0CI8Aq4rpMOkg==
Date: Fri, 28 Mar 2025 00:51:29 +0000
Message-ID: 
 <MN0PR22MB5515538A06F683C36A16A2A4B7A02@MN0PR22MB5515.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=21sw.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR22MB5515:EE_|SJ2PR22MB4734:EE_
x-ms-office365-filtering-correlation-id: de6bc3c4-3e11-4c85-be68-08dd6d92ad08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|8096899003|13003099007|80162021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?ufHk8fzgaVzRiugrV8IQW0z0uUdwpts4j2MMpM2Frh3vydM4d0XpGDefSi?=
 =?iso-8859-1?Q?nZtj6BuxsIlV6voy4CaSr/43xjFxYusupiZkQjB5gkwoF5TeIFJD0sLA0W?=
 =?iso-8859-1?Q?6R9IOszTfrel/M9vvoMTJofMb+DIqiR3iGgZdquI0e7GXTdTFihkMrvu/T?=
 =?iso-8859-1?Q?AacV6iFSMBnbEPem/YJ++l2GEBfXkq7H80pn9r4o+tdWSLdvJaal1g7t/b?=
 =?iso-8859-1?Q?XcW/uCB0llBC+mFcfKdCyLrtsjp6kiTyL+EFRXUCRaThycbk2RCOtmTZvB?=
 =?iso-8859-1?Q?L14Lyyachu2JbycyuBqhTQtxY9RaH0oQPMCQHW9FQ77f3KMZrq+//0+fNQ?=
 =?iso-8859-1?Q?QJdw5109vA+u8PF/w7/vrACDWOnHm5YzdYoeTz+9rHyA8ysbh2/GmKHuGF?=
 =?iso-8859-1?Q?j0KFu7njLs5ZTul1ZO0igNpbDs/+yumZ55Uyb1VPDkicIjLFWfmZ31Sgi6?=
 =?iso-8859-1?Q?Uad9DUW+vqoMGCzX9ioyh3CcV8n2ZS9ROPBLpeKL6nUvWP/z6z/ja3/E7t?=
 =?iso-8859-1?Q?lpISd+MfJYlpKP4GTx21zd9T4ALOHTJS24m3mOZ+/wtOmvdgJgxJUHmaOq?=
 =?iso-8859-1?Q?Ubr2Ti64NGYSlFoPbfnK1WDQYzljdrG1JH5HBimOzvLnkzKYjH0JfWDnIa?=
 =?iso-8859-1?Q?J+Cs1IhC0Otjq6wIiAHGzJxKxTrvGLDjKC66bk2OWAuje1wgyLeN44IVP5?=
 =?iso-8859-1?Q?KBl6hPRubdUcDzAFFbPRcI6yjcSmlyJ+cn/ZmpWCEQ7+4or+gaRCHKkzEC?=
 =?iso-8859-1?Q?Jm7JSuARp7GDB5Fxc3uzhPXwdR4CpzIXA/7pJOIa+EBrXN0sBGDsKiyoYN?=
 =?iso-8859-1?Q?n10WvsBqt5XQRlkF+5jAIoPktUHTkwPKXpGMptP76UPXsKlso//1BSlYmz?=
 =?iso-8859-1?Q?TOO/FL6TygJVvJyrWeHoTy6VvcjplD+b//v/7Dr+r+2lEDu8NDB/ZH2r90?=
 =?iso-8859-1?Q?asKy1U8q0xfp6kZmZvYtsXkP+swaoT2l89p+IaDsBonfpvKpwl+dmBoJK0?=
 =?iso-8859-1?Q?xDqmD2E30ehZfEVYFT/xrAPBQtjMialn5lnu2f78+W9Bl/Xr/uk7aHqFEB?=
 =?iso-8859-1?Q?Ajytgm7VIeTLlUOdJP89n31WVLTpE0PNHLyiZd8hAT9SsKUUJ0OazujfJE?=
 =?iso-8859-1?Q?Pny6ANmc7HswgOUCxlneAWpRYVZM9Etwf0WOnGU8PAz5p7Q9cf7N74yIsv?=
 =?iso-8859-1?Q?4vLMEOXHTaGZzMf+U1YgT5Hj6R8rO7ovwA5yrGFlwN0zv0xXe70wCyHvC3?=
 =?iso-8859-1?Q?UEP6vevuJ0vNZtaWE8XsfcyiTcaHIv1ZyKTEOVj75CFJmonB6PEMMslgL2?=
 =?iso-8859-1?Q?hK7WuNGm20KtN5G9zT64Nsr/wiGYS633Qhza6cIQnh6+K7oXKT60EqPVHC?=
 =?iso-8859-1?Q?IYJ9K0oVkJLhcl4ofsuphDqh73iwjvwVvVeREEOpm5XL2RHeWW95xeBpAn?=
 =?iso-8859-1?Q?cpjUiTXqg4iJKSudRBeZcZfQwOxIwOhZwPEWcAkduM64p9LK7xY4tTLhLF?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR22MB5515.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(8096899003)(13003099007)(80162021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?1Zoe4iWQRHp0Dx2jK5PsSJYKGYkWRApEAtwfJBMh9xGtAK+Dvmc26mM17S?=
 =?iso-8859-1?Q?XdTHVK2mVN88Brpmh1wcMNWGr9FIOGTtDS3A4YpnOz1CnfweBVWSp3Cfnq?=
 =?iso-8859-1?Q?D7qdr/FzN/a2X6xraruq1NV4oLKQ+CuJLFaqvnaks22MUREturxWy7yoyu?=
 =?iso-8859-1?Q?dJiMVYaEfIyFJfIokWZbIg1UENHFWYOLM4U9Lv+u9xrr6IbJIdWksa61UU?=
 =?iso-8859-1?Q?0WRdxjAAaELeQFYFK5YYgUZo5fTJy839KaWf3BD6kwYVGnf78RxvX184cC?=
 =?iso-8859-1?Q?mgjraj+TeTBGgeJ3cd3Mx5C51C0CUYAdTvEksO32+EisuR3+quIJWEVqtX?=
 =?iso-8859-1?Q?3BH/0XxER9+qk5pKzbJes8fotMg+O0DoDkCjOgTIgZqimbi4LKoaqZFlhk?=
 =?iso-8859-1?Q?QWq8sSWvljKwcjSCzT6O0oN+wUthFarQNCslsG/qXBhFg293e6clghLA47?=
 =?iso-8859-1?Q?0KtVGlmzBTmaAR6JtZkUWfpNTVa8YHXMRa7ZBd3Al480oZFHf3SmmRfY7W?=
 =?iso-8859-1?Q?pWvJj+0L+XdMgd6bt8E5aEVHAJTtTn1+ZatyufAd7QckptrSFrAY9ATm4C?=
 =?iso-8859-1?Q?RpIgEvmAGbTaa3fb8Z/czm92BalyMJYS5QSCkRuoLWhxVizL9naZxu5dCC?=
 =?iso-8859-1?Q?vMmc1KUJnxEVxG1ptwltSrXtAkZ6h2TYIZATVRIAbjc5aUd+vt7Nmcv1N/?=
 =?iso-8859-1?Q?aQnPopYgM19ZGtyejqWY6m8j0R3juPiUgxEVFedqA7YsYTDzB0sEpxXj0c?=
 =?iso-8859-1?Q?3bNPddG6S1/U+VH/5djXRBJDDV0H0ukGc39tMSmqluJEAmfuxY9BXg0tLM?=
 =?iso-8859-1?Q?P2KRKU79Hlt7VdAeNtFLk6HSffVoIPE36EV0g32R6Orcne8b/z317/pi9p?=
 =?iso-8859-1?Q?T2U0d/oP5Fo1dO0NDN9t7wyGftPMCbRBDifh5Ko0hgySo0Y5oP3mPhSi14?=
 =?iso-8859-1?Q?F+vixHThk06ftv3/SgV3sq+0XbhIlT8D6i9eQ/MUBklpcVXCICCuQWZubF?=
 =?iso-8859-1?Q?g9ZB96z0Hz1bUp2qqgP99EFYoiDuEYY9fqJiBRZVhuABQ+xugEUW+N7nil?=
 =?iso-8859-1?Q?+CLj63ectegDcb9hV+AmrFUCUy+Svyf+fe88B5GcPMXghFMXCikBVbew3q?=
 =?iso-8859-1?Q?ilJU1cFmh67sFp72lyTRwqUX63pcogFJ7ft4k+ROuoKJMjqxV4fr0jG/M1?=
 =?iso-8859-1?Q?Qpc6gpJYpomiavHrO5CIl3/EC9NpBJEetqyHEsytCGs1sU6/cR5buOtXJr?=
 =?iso-8859-1?Q?cflcTR0ridrxT7+JAfDDxf3xF40Fhd+L0oCjjNQIiaCZoB8Kx32L1hAKSk?=
 =?iso-8859-1?Q?2bD9M25/go4TlaugQUIh4tOEUtc0ya096zI5Mq+ZKXLk+mGMzPG6wbJs7F?=
 =?iso-8859-1?Q?IaGYOzsI9iEBUXa0V/M150A8oX3htTiugxw2s/0iy5ynlQb8D+PObleM+X?=
 =?iso-8859-1?Q?S0GykgvY5Lzcv1N2FOiHW0wnNAGwhSFhE5JHxkPi1rhe9GU943r+ee/P0u?=
 =?iso-8859-1?Q?1z+vgErNHFxejQwdmu0MnnhR49HrPgXmf2MNmDGPaLy3c42q24WPf3alwW?=
 =?iso-8859-1?Q?EFdgK/Rdn+gAhJIziAjgRvZLA6Usj3R7YIOzHiXB3IWbaZCEFiCWxnx8Ts?=
 =?iso-8859-1?Q?ldlMCWgCq4S98=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MN0PR22MB5515538A06F683C36A16A2A4B7A02MN0PR22MB5515namp_"
MIME-Version: 1.0
X-OriginatorOrg: 21sw.us
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR22MB5515.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6bc3c4-3e11-4c85-be68-08dd6d92ad08
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 00:51:29.1846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4ac144-0fc5-4d2d-b796-d7cf051f555a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ig5BKOL6KKC6yTaMECjNNGFyo4JD0PuKYFL0MkA2pss+mZCwzQRkHIXb67mqP8nM2JIwxBx4rw5X66zQSPhkOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB4734
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 00:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213803

--_000_MN0PR22MB5515538A06F683C36A16A2A4B7A02MN0PR22MB5515namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello!

This error surfaced today (Scarthgap):

ERROR: Error executing a python function in exec_func_python() autogenerate=
d:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_fetch(d)
     0003:
File: '[...]/openembedded-core/meta/recipes-core/meta/cve-update-nvd2-nativ=
e.bb', lineno: 90, function: do_fetch
     0086:    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
     0087:    if os.path.exists(db_file):
     0088:        shutil.copy2(db_file, db_tmp_file)
     0089:
 *** 0090:    if update_db_file(db_tmp_file, d, database_time) =3D=3D True:
     0091:        # Update downloaded correctly, can swap files
     0092:        shutil.move(db_tmp_file, db_file)
     0093:        # Need to 'touch' the file to ensure NFS sees the data
     0094:        os.utime(db_file)
File: '[...]/openembedded-core/meta/recipes-core/meta/cve-update-nvd2-nativ=
e.bb', lineno: 241, function: update_db_file
     0237:            total =3D data["totalResults"]
     0238:            per_page =3D data["resultsPerPage"]
     0239:            bb.note("Got %d entries" % per_page)
     0240:            for cve in data["vulnerabilities"]:
 *** 0241:               update_db(conn, cve)
     0242:
     0243:            index +=3D per_page
     0244:            ph.update((float(index) / (total+1)) * 100)
     0245:            if index >=3D total:
File: '[...]/openembedded-core/meta/recipes-core/meta/cve-update-nvd2-nativ=
e.bb', lineno: 341, function: update_db
     0337:
     0338:    accessVector =3D None
     0339:    vectorString =3D None
     0340:    cveId =3D elt['cve']['id']
 *** 0341:    if elt['cve']['vulnStatus'] =3D=3D  "Rejected":
     0342:        c =3D conn.cursor()
     0343:        c.execute("delete from PRODUCTS where ID =3D ?;", [cveId]=
)
     0344:        c.execute("delete from NVD where ID =3D ?;", [cveId])
     0345:        c.close()
Exception: KeyError: 'vulnStatus'

DEBUG: Python function do_fetch finished

--

Here is the associated URI: https://services.nvd.nist.gov/rest/json/cves/2.=
0?startIndex=3D0&lastModStartDate=3D2025-03-20T23%3A57%3A40.089066%2B00%3A0=
0&lastModEndDate=3D2025-03-27T19%3A14%3A06.038616%2B00%3A00

CVE-2025-2682 (2025-03-24) appears to be missing a "vulnStatus" field.

Is an issue with the API?

--
Clayton Casciato

--_000_MN0PR22MB5515538A06F683C36A16A2A4B7A02MN0PR22MB5515namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This error surfaced today (Scarthgap):</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
ERROR: Error executing a python function in exec_func_python() autogenerate=
d:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
The stack trace of python calls that resulted in this exception/failure was=
:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
File: 'exec_func_python() autogenerated', lineno: 2, function: &lt;module&g=
t;</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0001:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp;*** 0002:do_fetch(d)</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0003:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
File: '[...]/openembedded-core/meta/recipes-core/meta/cve-update-nvd2-nativ=
e.bb', lineno: 90, function: do_fetch</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0086: &nbsp; &nbsp;bb.utils.mkdirhier(os.path.dirname(d=
b_tmp_file))</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0087: &nbsp; &nbsp;if os.path.exists(db_file):</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0088: &nbsp; &nbsp; &nbsp; &nbsp;shutil.copy2(db_file, =
db_tmp_file)</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0089:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp;*** 0090: &nbsp; &nbsp;if update_db_file(db_tmp_file, d, database_tim=
e) =3D=3D True:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0091: &nbsp; &nbsp; &nbsp; &nbsp;# Update downloaded co=
rrectly, can swap files</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0092: &nbsp; &nbsp; &nbsp; &nbsp;shutil.move(db_tmp_fil=
e, db_file)</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0093: &nbsp; &nbsp; &nbsp; &nbsp;# Need to 'touch' the =
file to ensure NFS sees the data</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0094: &nbsp; &nbsp; &nbsp; &nbsp;os.utime(db_file)</div=
>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
File: '[...]/openembedded-core/meta/recipes-core/meta/cve-update-nvd2-nativ=
e.bb', lineno: 241, function: update_db_file</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0237: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;total =
=3D data[&quot;totalResults&quot;]</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0238: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;per_page=
 =3D data[&quot;resultsPerPage&quot;]</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0239: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.note(=
&quot;Got %d entries&quot; % per_page)</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0240: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for cve =
in data[&quot;vulnerabilities&quot;]:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp;*** 0241: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; update_db(=
conn, cve)</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0242:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0243: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;index +=
=3D per_page</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0244: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ph.updat=
e((float(index) / (total+1)) * 100)</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0245: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if index=
 &gt;=3D total:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
File: '[...]/openembedded-core/meta/recipes-core/meta/cve-update-nvd2-nativ=
e.bb', lineno: 341, function: update_db</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0337:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0338: &nbsp; &nbsp;accessVector =3D None</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0339: &nbsp; &nbsp;vectorString =3D None</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0340: &nbsp; &nbsp;cveId =3D elt['cve']['id']</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp;*** 0341: &nbsp; &nbsp;if elt['cve']['vulnStatus'] =3D=3D &nbsp;&quot=
;Rejected&quot;:</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0342: &nbsp; &nbsp; &nbsp; &nbsp;c =3D conn.cursor()</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0343: &nbsp; &nbsp; &nbsp; &nbsp;c.execute(&quot;delete=
 from PRODUCTS where ID =3D ?;&quot;, [cveId])</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0344: &nbsp; &nbsp; &nbsp; &nbsp;c.execute(&quot;delete=
 from NVD where ID =3D ?;&quot;, [cveId])</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;0345: &nbsp; &nbsp; &nbsp; &nbsp;c.close()</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
Exception: KeyError: 'vulnStatus'</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Aptos Mono&quot;,=
 Aptos_EmbeddedFont, Aptos_MSFontService, monospace; font-size: 12pt; color=
: rgb(0, 0, 0);">
DEBUG: Python function do_fetch finished</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
--</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Here is the associated URI: <a href=3D"https://services.nvd.nist.gov/rest/j=
son/cves/2.0?startIndex=3D0&amp;lastModStartDate=3D2025-03-20T23%3A57%3A40.=
089066%2B00%3A00&amp;lastModEndDate=3D2025-03-27T19%3A14%3A06.038616%2B00%3=
A00">
https://services.nvd.nist.gov/rest/json/cves/2.0?startIndex=3D0&amp;lastMod=
StartDate=3D2025-03-20T23%3A57%3A40.089066%2B00%3A00&amp;lastModEndDate=3D2=
025-03-27T19%3A14%3A06.038616%2B00%3A00</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
CVE-2025-2682 (2025-03-24) appears to be missing a &quot;vulnStatus&quot; f=
ield.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Is an issue with the API?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Clayton Casciato</div>
</div>
</body>
</html>

--_000_MN0PR22MB5515538A06F683C36A16A2A4B7A02MN0PR22MB5515namp_--

