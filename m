Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2DACA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 16:06:52 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.70])
 by mx.groups.io with SMTP id smtpd.web11.22877.1757520409901901133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 09:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=hv+YhA0p;
 spf=pass (domain: axis.com, ip: 52.101.83.70, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgCWZqzI3aY0pHmniZ9ibX6i+7ZQUpiWz6qUT6LlEFhp6NveFeAwHEPDCXAc70oUIEDzc095BUwCwslBcpBO6ZZzvX4lkTRm5yfmnX4KGV+ttBuucBo7eek+1WQKkSCG29HlCSza/FuovjGqmEQyTTVIijNi0v/OG03jBMhndgfRckOubkCBkxa5nZszyYMJXXIBI/hjUbZSa/8VNZrfE66K+pM6IG1L606XD5bywFKBPKxtu++spwkcFNrXNAmXHUXgF2gea08EDR1Bc1WI0Aevp5VhWf1DZCL/jwXJkyl94S4YVm1CnGrP+nPZnJONAHAQ9yhc9dnzwLifYfAGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCWMUT3GUd5mCaxoUDihI3EJ6iqFbmZRO/XS82y5hv8=;
 b=TcgMJNO4leNj+ByvdpvFOvPjMVrvSiui4DY5tEroX2bT3dl7XjoGvkX9vh1Nk4c/qg2N5251BSAj8t402xYPccqoI3pHn/gkmOe/tH8BSxpAQKoliwlrw/B+QDG4h7ws+5RD932nVxBuyHT4pVqrRoWYVW87oMBxc6RwLbHDOTqws/tR7ZutwT493kI6YVnWkmjZn3Jb1/XrPBcna8NEdACrFt1QfsLJHOP22XF6AlxGe5T6SJqwWuwOZUt1UqGIDUQHVq7TVs4AAOn7/iq4COjywhsT1016IeBK1gYJpYj2iLrVid2pVsvAq8eMbthVEg3YL8m3YO7GY7hilXd0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCWMUT3GUd5mCaxoUDihI3EJ6iqFbmZRO/XS82y5hv8=;
 b=hv+YhA0pTmGV8Jgj8mHTG3t47livIMqFNBfjnNWft34na/4xvpksMxUVD4V64RgS4rrW8R4YDh6vZVahHi7EOJQNiFUZ49BtwxaENOC2lwYUQLEf0bfoptymioHXE9xKRXPsKuKwpLBSGlbApwZ9/ojBiIj2iaiPyiHxibSQYNQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBAPR02MB6199.eurprd02.prod.outlook.com (2603:10a6:10:186::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 10 Sep
 2025 16:06:46 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 16:06:45 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] meson: Backport patches to support dependencies
 on header-only Boost libs
Thread-Topic: [OE-core] [PATCH] meson: Backport patches to support
 dependencies on header-only Boost libs
Thread-Index: AQHcIlZdiRyxO7HZD0qiV1YpoMATVLSMlDJg
Date: Wed, 10 Sep 2025 16:06:45 +0000
Message-ID: 
 <DB5PR02MB10213BDD0AA3FAF40FA681EAFEF0EA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <1863EEAC76CF6A05.10180@lists.openembedded.org>
In-Reply-To: <1863EEAC76CF6A05.10180@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBAPR02MB6199:EE_
x-ms-office365-filtering-correlation-id: 832faecd-b164-4f09-535f-08ddf0840a75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?PxFr8yMfheKZ3l+vmbE9Mr+sjr6JUwPs4GP762X+mZyit9gctqFPUORLp1fA?=
 =?us-ascii?Q?+WIazFhc58mE4ZDvdx+EpCnR7oHSO+jCtKqa9g99LgN1H4D/Hft0wDzVLjlD?=
 =?us-ascii?Q?L9c/XU9O3fLYmoW0Ub06qZ6mJjnrHrGu4vhKqUmtxE0fTafjWCzVcLN3COAp?=
 =?us-ascii?Q?mvwI1lOdB8qGQW95DW9jcrOWGjiIgpZTb9B1HllJVtFx2HH48FmXzc6PkBPw?=
 =?us-ascii?Q?re8jmTjbqKB/fcNYy6UI3DJwPf8p80LfU5W7yyZTGU1BQGpJfZOZOs6ZO6kG?=
 =?us-ascii?Q?R0ac849v3srxPa67DKlM5SvwLcWg7/5CWLXz+j6KgCOYvcaBu+9JXZGq2jlj?=
 =?us-ascii?Q?pChC4Pku5r9nk9RShJ6NzK5JyYEQHQptVA4p8r8OaycH4RR0LHg51EWjPLnz?=
 =?us-ascii?Q?Ybf/G0SJijeNed7YkmnNk/PqNgOce/bio760NU5hxhhSLuhjOImQhaTlEoFn?=
 =?us-ascii?Q?AlKDurvWBMp2kuFxHRXFOovFFCp4vyIWdMWNhOTZL/m6n8U1q/VFkY+7RPWt?=
 =?us-ascii?Q?VbHxyl9fc6J9iBbRwlJ13ZdTWo50nOT0KafwxWfJgZJ9PcA24+/D3H8CxQC8?=
 =?us-ascii?Q?zkVbkPFDn5rVorIocwrzBdp9LZuxhi0GZH8ShMosUD77Z1goSQc9FdPvx5kn?=
 =?us-ascii?Q?1kqf9O+8qKOIdtyXw0HfDCljqppmAGaE3n8SlSg9Hh+ENfIs4DCz65flzowS?=
 =?us-ascii?Q?c9QzEAMpKtdskW59vmXcGOLUFPjcysCS4jqiw21bh4yFkFMtuCENZe7b6DIK?=
 =?us-ascii?Q?JfdAFZMu69rJD346Xgi1MVRVcojY/vdWdJyGdTfuYU/s3/OcpqSTJxdYVrCw?=
 =?us-ascii?Q?ppibfFEWcmGF3SwdKKSjLN80ghnXNNSmz4jqM1MOFpl3okvum6Gj4+5gBZr9?=
 =?us-ascii?Q?zJexa9Esch3zXbm1Tcp0Vox72i/E1gIG4k6zn2gxJsX5FLqbIdcnbJAf5B8I?=
 =?us-ascii?Q?5WmrNmJjCAcTE7A/yQQ5U8cLirYhTJEZ65Ig0UhhIuRHG+qLEeMJjU9CCr28?=
 =?us-ascii?Q?Lhx1XBHFJzxEKDCOJOmNBQKb9O9yC6DSBuPy9QPPcpeIP0X6cUa5Qbs+0BZ0?=
 =?us-ascii?Q?BD1ECRJ7zW1GUaPD2VtG7R2wVJQTX4/yaj49b4f/+OFtnNUtShoFyRGfTBxP?=
 =?us-ascii?Q?74g2ke1KRHgFnebs4ywnhxnJ4kjRQ7OCZPHfyoV3vUxnotsPuyYP9nT58p6P?=
 =?us-ascii?Q?jnY3GTM86nnhKo045OuHoVBZuJFnex4NNpBXuEwJ9Un8TLilFCKS32GQ4xEP?=
 =?us-ascii?Q?UQiz/UtYan2fG/aqIeO2nH/fv2z91czvbYyc5/B5pK6CtiA2IjcNQNAnF7nd?=
 =?us-ascii?Q?Buis5XTbONJqOzbnmAw78EvxXFmYlrtOKfrlOpo6uD+2z59bf7rXcgVs4TF9?=
 =?us-ascii?Q?Kk7rpc4WotPagH34E9Lic5vkN92NgiYEVBMvgvVWIhJGl+3d+6zq3WPBOtj9?=
 =?us-ascii?Q?nDKETOKvZMEQbvEuW7qpU4Pgbw8x6HTFf0mIjv/tpGLuHG5ZQxBpRtZcGHVD?=
 =?us-ascii?Q?BjaPiL9F1sPwgGk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Sgr7p/xSNiNUqvBFO1siP2d3WekYj9zISur4+3Q6IDlXRHw9eho5PhjTGqp1?=
 =?us-ascii?Q?W5sCuRhPqdCRXM8xSIiPav1d8C3nlUqtuVIBKhjP6P0qEp4B01Hr6UMSjypJ?=
 =?us-ascii?Q?cddyaC03d3xHVy28RgGfeNxiNc8RlPGm2MjSvL43wukFoNengQAgYIns3xMg?=
 =?us-ascii?Q?T8/cnfJpc1lZ9zH7Mvcfg8vKrk4vPHzNnoOqaG91VuqGWvcYbMfjUOV36ccR?=
 =?us-ascii?Q?LSu1cjC/Ow0dQTWZXRKDzdqMfUufQjP/nmghfBThXHrsQDWbK542IPfuv5JA?=
 =?us-ascii?Q?JsSFOkaYqew6eTa4hNfKQwVyYR1vt8Ph9KoKiMJE1UuGQiSOsGD/IGazJEEw?=
 =?us-ascii?Q?UD0XgP2guqg+Nu4/RcNcLjSJYx0FDFOPBnXHfAUNE05MwVqY+pRAam0r2Svq?=
 =?us-ascii?Q?Cga+Qi3tNur5665eoou/3mG5rhTuWNYURyM/5Co3WI7XGBe4bdgE8FSmCy/r?=
 =?us-ascii?Q?z1TSk5+0/WtCRDeAezCC43Njrow1BcgUE9Z4C77jcoISTTCgCLw/y13O19Me?=
 =?us-ascii?Q?XXIE+QlU57Xs1QUN8dZ5OGr7GrMmBet/i/YCOda1CZsWVycnZ+yspGPt3ii8?=
 =?us-ascii?Q?jhSteHEjUNlWlByD5CvF5LCjZgU/Erz5LMzUbvqskJZL+1rsCFojmvr4OOjW?=
 =?us-ascii?Q?okKlJX9uxc9fBya44r5yWblaaOoxntkX3SyyUQyrar9BCJ5DcZ+Pki+Wd5w6?=
 =?us-ascii?Q?IFGSXZZzfSeEKRSun5WEiXxYba69ZFlhViWwDhpAjnxUjxUchWCGUfwWinna?=
 =?us-ascii?Q?jA18PzZmVOYwJbF9f8z55JqSvUlP4hXulre95i/2qZr64xhSJpytG2Hdh3K+?=
 =?us-ascii?Q?fU6QWtIfH4uK50fk7+HN40GJoCHdNVCAPitprjOdbqiXPujM9FUPOKfWfxeB?=
 =?us-ascii?Q?6JN4v5I2xpCuka0DIadPHUYlWzdRwzUKjDWvGVsFMzCylWotruOLhUykuJ+p?=
 =?us-ascii?Q?dByTY+1JxXhDDPHr1ltzqtu0WkyMkHZRXRpP51pDD/HTagrz8UYqTizlm1yR?=
 =?us-ascii?Q?jgxzt3/m9kvBsj+SUKbUvTVJpGlyMXuNtQAxUoKw9ZdeBSLP5ox+wFEjuK4y?=
 =?us-ascii?Q?YhLqWlv2ycRPvGZgo/UNdJGcMlX1uH6CUh5sKFfD8F8/uwJbd5Nl3+Pupc37?=
 =?us-ascii?Q?OyU1xjQPOWDBCN4fCwGH8KU7FNVg0cSjvdJzTSAYKA7L8nkCdt891RdS9EzN?=
 =?us-ascii?Q?jK6nAK7z8dVI0INPmm11DucVSLS1IYzZFdyXzBYdGw7MdECKMlsaM+aZEQOC?=
 =?us-ascii?Q?HpQUHHrL3t0OT9BqADT1fkDvy8cN9U8K/+iG/kPtL3roqXL4kxSrzTrc7YYd?=
 =?us-ascii?Q?xxulJ4Z5HvRuVZpl2ESVVEPMAKM1xam6wuYlFDopvcaqmJLHEptHoP/GGVXM?=
 =?us-ascii?Q?NeUanTWMsADIl65EcywoCD/+EgJDzSd0zwnv1Ky0zZa4M2vE7Tdf7LhlgEU4?=
 =?us-ascii?Q?vzwno7zFo0goKMCWAA1iOuNEZKGQ8GVYqKx8ExdeRzghHo3Ey72VgyPYGILF?=
 =?us-ascii?Q?HW27aC7V/A29kuEougWwVLZgAsgciW3ZmF/rrgT2Ysst66iWtUxC3QiRBA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832faecd-b164-4f09-535f-08ddf0840a75
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 16:06:45.8176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ID3nOZ3V8NQcWKoCPJjeASXju45aNAN7Kuz4pOmgEImMcu/23ndIl6XlLRaZjDds
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 16:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223226

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt via lists.openembedded.org
> Sent: den 10 september 2025 15:25
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] meson: Backport patches to support dependencie=
s on header-only Boost libs
>=20
> With Boost 1.89.0, the Boost.System library was made header-only. Since
> this is a frequent library to have as dependency in meson.build files,
> this resulted in build failures.
>=20
> Backport two patches so that Boost dependencies on header-only libraries
> work as expected.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  ...heck-for-header-only-Boost-libraries.patch | 58 +++++++++++++++++++
>  ...python-must-have-a-library-component.patch | 34 +++++++++++
>  meta/recipes-devtools/meson/meson_1.8.2.bb    |  2 +
>  3 files changed, 94 insertions(+)
>  create mode 100644 meta/recipes-devtools/meson/meson/0001-Check-for-head=
er-only-Boost-libraries.patch
>  create mode 100644 meta/recipes-devtools/meson/meson/0002-Boost-python-m=
ust-have-a-library-component.patch
>=20
> diff --git a/meta/recipes-devtools/meson/meson/0001-Check-for-header-only=
-Boost-libraries.patch b/meta/recipes-devtools/meson/meson/0001-Check-for-h=
eader-only-Boost-libraries.patch
> new file mode 100644
> index 0000000000..3d2810aff9
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/0001-Check-for-header-only-Boost-=
libraries.patch
> @@ -0,0 +1,58 @@
> +From f16897135c394d36656da0078613864076300e07 Mon Sep 17 00:00:00 2001
> +From: Jussi Pakkanen <jussi.pakkanen@mailbox.org>
> +Date: Fri, 29 Aug 2025 14:57:06 +0300
> +Subject: [PATCH] Check for header only Boost libraries.
> +
> +Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/6a=
9a81619c139d0f6ae3d265f7366e61615d92a1]
> +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +---
> + mesonbuild/dependencies/boost.py | 22 ++++++++++++++++++++--
> + 1 file changed, 20 insertions(+), 2 deletions(-)
> +
> +diff --git a/mesonbuild/dependencies/boost.py b/mesonbuild/dependencies/=
boost.py
> +index 662f985..e153e8f 100644
> +--- a/mesonbuild/dependencies/boost.py
> ++++ b/mesonbuild/dependencies/boost.py
> +@@ -452,6 +452,10 @@ class BoostDependency(SystemDependency):
> +                 break
> +         libs =3D sorted(set(libs))
> +
> ++        any_libs_found =3D len(libs) > 0
> ++        if not any_libs_found:
> ++            return False
> ++
> +         modules =3D ['boost_' + x for x in self.modules]
> +         for inc in inc_dirs:
> +             mlog.debug(f'  - found boost {inc.version} include dir: {in=
c.path}')
> +@@ -462,7 +466,7 @@ class BoostDependency(SystemDependency):
> +                 mlog.debug(f'    - {j}')
> +
> +             #   3. Select the libraries matching the requested modules
> +-            not_found: T.List[str] =3D []
> ++            not_found_as_libs: T.List[str] =3D []
> +             selected_modules: T.List[BoostLibraryFile] =3D []
> +             for mod in modules:
> +                 found =3D False
> +@@ -472,7 +476,21 @@ class BoostDependency(SystemDependency):
> +                         found =3D True
> +                         break
> +                 if not found:
> +-                    not_found +=3D [mod]
> ++                    not_found_as_libs +=3D [mod]
> ++
> ++            # If a lib is not found, but an include directory exists,
> ++            # assume it is a header only module.
> ++            not_found: T.List[str] =3D []
> ++            for boost_modulename in not_found_as_libs:
> ++                assert boost_modulename.startswith('boost_')
> ++                include_subdir =3D boost_modulename.replace('boost_', '=
boost/', 1)
> ++                headerdir_found =3D False
> ++                for inc_dir in inc_dirs:
> ++                    if (inc_dir.path / include_subdir).is_dir():
> ++                        headerdir_found =3D True
> ++                        break
> ++                if not headerdir_found:
> ++                    not_found.append(boost_modulename)
> +
> +             # log the result
> +             mlog.debug('  - found:')
> diff --git a/meta/recipes-devtools/meson/meson/0002-Boost-python-must-hav=
e-a-library-component.patch b/meta/recipes-devtools/meson/meson/0002-Boost-=
python-must-have-a-library-component.patch
> new file mode 100644
> index 0000000000..c03c47534e
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/0002-Boost-python-must-have-a-lib=
rary-component.patch
> @@ -0,0 +1,34 @@
> +From d0644d543f4df39cf2ba14337000ee019cb20b6d Mon Sep 17 00:00:00 2001
> +From: Jussi Pakkanen <jussi.pakkanen@mailbox.org>
> +Date: Fri, 29 Aug 2025 22:51:48 +0300
> +Subject: [PATCH] Boost python must have a library component.
> +
> +Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/80=
917ca8c1a5af499cc6e004ad5d5a050da9045e]
> +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +---
> + mesonbuild/dependencies/boost.py | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/mesonbuild/dependencies/boost.py b/mesonbuild/dependencies/=
boost.py
> +index e153e8f..fdb35d4 100644
> +--- a/mesonbuild/dependencies/boost.py
> ++++ b/mesonbuild/dependencies/boost.py
> +@@ -440,6 +440,8 @@ class BoostDependency(SystemDependency):
> +         mlog.debug('  - potential library dirs: {}'.format([x.as_posix(=
) for x in lib_dirs]))
> +         mlog.debug('  - potential include dirs: {}'.format([x.path.as_p=
osix() for x in inc_dirs]))
> +
> ++        must_have_library =3D ['boost_python']
> ++
> +         #   2. Find all boost libraries
> +         libs: T.List[BoostLibraryFile] =3D []
> +         for i in lib_dirs:
> +@@ -483,6 +485,9 @@ class BoostDependency(SystemDependency):
> +             not_found: T.List[str] =3D []
> +             for boost_modulename in not_found_as_libs:
> +                 assert boost_modulename.startswith('boost_')
> ++                if boost_modulename in must_have_library:
> ++                    not_found.append(boost_modulename)
> ++                    continue
> +                 include_subdir =3D boost_modulename.replace('boost_', '=
boost/', 1)
> +                 headerdir_found =3D False
> +                 for inc_dir in inc_dirs:
> diff --git a/meta/recipes-devtools/meson/meson_1.8.2.bb b/meta/recipes-de=
vtools/meson/meson_1.8.2.bb
> index bfeaab0a79..0dd0544e14 100644
> --- a/meta/recipes-devtools/meson/meson_1.8.2.bb
> +++ b/meta/recipes-devtools/meson/meson_1.8.2.bb
> @@ -14,6 +14,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
>             file://0001-python-module-do-not-manipulate-the-environment-w=
hen.patch \
>             file://0001-Make-CPU-family-warnings-fatal.patch \
>             file://0002-Support-building-allarch-recipes-again.patch \
> +           file://0001-Check-for-header-only-Boost-libraries.patch \
> +           file://0002-Boost-python-must-have-a-library-component.patch =
\
>             "
>  SRC_URI[sha256sum] =3D "c105816d8158c76b72adcb9ff60297719096da7d07f6b1f0=
00fd8c013cd387af"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"

Note that these patches are from after 1.9.0 so they are needed even if=20
Wang Mingyu's patch to update the meson recipe to 1.9.0 is applied.

//Peter


