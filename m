Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E07EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 21:45:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2314.1689198328199747363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 14:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NCptRHnk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6557242ad9=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36CLHNbk018895
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 14:45:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=iSxwCfrEjcrvk3uxSyOnXKr/CQ5a85TgyEqaFvfq/Ds=; b=
	NCptRHnkCHR7iTCLsiYp/hMOMcG1t6Nptn7YbhsBQKLkEtl2pbQKf9KETubrs45Z
	40hEYi0uqnWcdQnYw5D+JBCaR5tTGqcLV5J2lnz8x9wQUVr+6mXes0QA2rluHX3p
	mAh5zn2gLdBHykvxpHQQqvSqqrQFVq30664Ml0DOr/2a5aqU6OTpDzIsC7zSCfvz
	aRoocL7FPm7z+LWL6880/rUx3Dx2pfCBhwrseEQURV5DgkGotCTfFez5YVgeKqQw
	P+fiB3uo0Ca4kgzfRFa7hzS9sRMy1wVON7lO4y/N0neRsq+CzAVEohrUTJss+C7r
	zKtf9HeNu4w7jIIux/k+IA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq7afbsf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 14:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzybzhSgvBJpvZFLExV1lkNDbJmOJLo0JLpsLhUJ6Vec26a5oP5hbmj3uHlOwQ3ACSL4jH8S0nE1clKCGGhLt32EoHzSu7ss60c8SfwuiFMus8n1+utshCES45Evwcz7GzVdYp8z7o5Cs59tbkrKMjuR5OMGtVIg9UNJxfkOnY2Q+VTNZA58HVzDPBzpexv3HP95m/JdgHlzRL06HSHgeazeU2FF9GX0x+MHp47t/Q9RLdl6A3zVrNJhMzZ6y/rf8MDDNk/j36rQGl53LVyxLkqw7+Xap+qAg7lGOsJyQLT64Wr39Vi7IdpjG9LPlgoAhOsmlvTsKLn5Oqx/q/bUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSxwCfrEjcrvk3uxSyOnXKr/CQ5a85TgyEqaFvfq/Ds=;
 b=Xej4O8gWrWTa0QTBg/OuKAfZTfboMAvryw4kD2Olkr9WXpcmvp+DXjQDMkN6r06tHda/wNkrmBCR9+GDAwdtyXcrCI0EcLt4IqNUhO/HLjNdxSD613UtGo+Tth6wU5l9T+ULwB2LRtFEiKatA7Vaq1gDc/79XhAc44lLfJdh39GiwWGMOfdz7U9WWq9V1huFeJUUoVKg2k2bVg8cpWeXoZBDriU6pyHoB0uMJOJLvuvhz4UysOwYgeQvk5z1820t+GnS3vXNBbybh1jav+vtK6dqeBodhsaXBtiH72i9CENCn52IcImNDfWQnN01eGpCfN16bH0/Mdosa45x4Bp3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 21:45:24 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8fd8:1fa0:3c9a:3420]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8fd8:1fa0:3c9a:3420%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 21:45:23 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "Slater, Joseph" <joe.slater@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [oe-core][PATCH 1/1] libgpiod: modify RDEPENDS for ptest
Thread-Topic: [oe-core][PATCH 1/1] libgpiod: modify RDEPENDS for ptest
Thread-Index: AQHZtQh5RuAUSId7ak6G43BwdDhfCK+2qgiQ
Date: Wed, 12 Jul 2023 21:45:23 +0000
Message-ID: 
 <BY5PR11MB39924BE2D246540E2C6AB4558836A@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <17713C3EC05D7E47.19802@lists.openembedded.org>
In-Reply-To: <17713C3EC05D7E47.19802@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3992:EE_|SA1PR11MB8473:EE_
x-ms-office365-filtering-correlation-id: 3e07ebad-e1f6-4de0-3f63-08db83214c29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FH9vy5+wHuEypZ6T/Kg/rAxd93AeRcGVYp4DLBx+N+Uh1V9u0zCQ0Zie0Udz7/4L4RJAwJSDdwqAzT9CnmYXLCni85w8ZjT8uoX4DgzSCtmVc9BmYzx2K25tJs0ExNsAK0d9tA3l5CHXjX9LLSOO28Xp4BrxlNhHPhejQff5TdNT++Xa6j4sit6F8GKh3CFBwxAZIbxx2QgMGiUNOqLqvhDVG5ASMFkOtYitpHTKROA+6oD2i3PCc3F4LFvUbXbhxp8rtQMxZOGOq92C+4tQYVIRFP6Q6KEGVoVd5k/SDawFh7VzwpGE/bPi7FX+GbpRzr2p5/tpNSb4JjMiGbEcrRYkBZSdJCWt5qZgiSA9T8yNat1n07SgV0w2Ai1hY7mpRg0kHw4N1fRC8k89vflRUr+VaJDPJ9gZKY/g0R5/a0ntLZ7AzgN8hrFp/TPHn3Nf/Oj6eVtNrSmKDxSCFHXhj2yx8CUVnTwShgkHUH/h6PekSfmLmelzPBdxHRAv3g7YPRYM6gXw4sK4N/c1lL7BD4c5VcFB9MT2+0YGWL15QYsd24JooavQASY3ccyPCp27X1avpKKy3itcgw3CLKro2Q8C5cYzX2zqacTfNlV/Q3ouSlyS6ZlQk3nfScEVKI0Z
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(136003)(376002)(366004)(451199021)(7696005)(478600001)(71200400001)(110136005)(83380400001)(86362001)(38070700005)(55016003)(76116006)(2906002)(33656002)(186003)(26005)(6506007)(53546011)(107886003)(9686003)(38100700002)(122000001)(8676002)(66476007)(66556008)(316002)(64756008)(41300700001)(66946007)(8936002)(5660300002)(52536014)(4326008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?g1VuAYiC8kdteDUWv5OGXOTHtz2wD9fk4QUo05DvejLhbVIBCGFfnEair4CO?=
 =?us-ascii?Q?RROLoIs5PN7skoe+QQdF9U8j3YmLRHWO/Wzyp7xEr8SaoOaBfgPirS87RJwX?=
 =?us-ascii?Q?GPqEb2le1Aa5+x4XwkQVuFxSDsHhGYpQfBNxB2yHoC4rXrgRM6+e9aL8BdM1?=
 =?us-ascii?Q?kptUNpFKqaXKPvMGpvmwmqHeBdn/0pydablHgXEeH13APthzBCZrHfEYEdPQ?=
 =?us-ascii?Q?fxIU6fvE+X9oM1eV/jA89QZHpCehPwwBcFoggXb1Ad0/q3bTFYwuPahJrcpT?=
 =?us-ascii?Q?fOoP5jDJH+FPJeazuUm/BnZH91f1pl65J9AAHheb8tByv2oSXvqY3VAVk32Q?=
 =?us-ascii?Q?8N8GOXvRNdu90Ppw12MneMsvo0xHZk9RJombmR5+i+5evR9O6Licb92q5fjD?=
 =?us-ascii?Q?B1pOoY2DvL+mGsAcE/l4nYhsTRXQZHWDyo4WqW9/VYr/evvOmAYMUZBfAgCc?=
 =?us-ascii?Q?1/Y4SLZj0JKIga3+jRE10YDGC3hPIGCzf0NSEO7wgSaB6V3IuEU1fSfBDwwr?=
 =?us-ascii?Q?+QEFpLzIwa/AdaJclW4H2IyhF5zh3Rhhz84F5YyAPWsYaAMVGBhbCxAclhTP?=
 =?us-ascii?Q?HlPbhTdv+RllHM4/GuLbRGc1tlEBW2ZVJXALTZ1YJql9p8Bk9UcfIGwU6bfM?=
 =?us-ascii?Q?8WjjPFp/KDtjplB1SSDBQQX1YfI9iIuFhyJ0zA72Pnerw/FWz+4wtKKI64BZ?=
 =?us-ascii?Q?P+qS9Ms5wWTB8F33tjpKgjxA5xIHz+OHRJbxlV735j+RgwNSZPhWp2yIL/wO?=
 =?us-ascii?Q?q5YWFdAJZT4J7S1Z9+yoR/OhzaSthdlkHJNoYqyQaKehUdhpATLjuiAHURpF?=
 =?us-ascii?Q?eKZ39xCtjw5/aAv7EOd5Mvt3lE9oKNVgVENLL5iK/W7D7BnxreHEQeIhCTmQ?=
 =?us-ascii?Q?hnvi78eHYoCQxw0McQUbca/w0xHWhwxtzq/udTVZqAsDw277QSj3ky4/iY2p?=
 =?us-ascii?Q?RLlWS5JtbXuwE61RscNj01uqN7vGoT1I18+f40vt62AOogRC34duPK2Ff/JT?=
 =?us-ascii?Q?r8Hm9BCU+S342eZy71eWcJKrWJV9ErdYL17EExvYBjkbdspVRKRf867/4Zc8?=
 =?us-ascii?Q?uuvhInRgdsTB+rzO6uYaA+MSIWQOwKE83e1YOxmlJxz2gECtyo54J4lnViqN?=
 =?us-ascii?Q?QuFuOxXq5MKbgLHCEEi7tL1GQFA3iNK/wCnv8qEjHd8P7qB1DKmkRK0VUf0a?=
 =?us-ascii?Q?PUjjBM1bGX2+bsn4O64biOVl2jnKiYQbV+KqIbSMidAN+3PV3TuzkKpnckWW?=
 =?us-ascii?Q?ilHxNRZ20pDK1yrvUXIhbeLA+KXHtLnZ/1UZnbDPANaQbeS0mcGrs3ZXeefp?=
 =?us-ascii?Q?+EyaBmvS1lkh6rScgb0t9mvIn16eJEhKDwqenJFmUCJ065RFnZ4yuTCAM+d2?=
 =?us-ascii?Q?Jr8h/e6SoS8zTtd9lHXOCsCRSJchf60X3U6iXUa1VV069riHJ6Az9JFy6Svr?=
 =?us-ascii?Q?4ZuHzi44DG3EkLPjfRIVM1Z2S2nm6rdV589znHkCOkI+Ji7MINJDOVCZkaNo?=
 =?us-ascii?Q?vX3jSq/35cuUQmE0CQygdgFjJ+D2MYUU16UdPmCW+5VHuEi9mISuxM0XWBO+?=
 =?us-ascii?Q?CsjVPxSyaTyg3AAI6kbeaSFCXlgwZTMqMpY5dXWK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e07ebad-e1f6-4de0-3f63-08db83214c29
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 21:45:23.7470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hXzWAYUhMjKR7+oi+ciQixQA/k5r0fQctY14Q9m2ne0rDZ4uQR+o8XCsLz4EVqecZ+SnjM5CWAj1mdbZbdATC69+XhlIpf1wemmHRnnJ9QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
X-Proofpoint-ORIG-GUID: tUb-xEhRMSJCmQLRgSLuCxLgiy3WOe-Q
X-Proofpoint-GUID: tUb-xEhRMSJCmQLRgSLuCxLgiy3WOe-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_15,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1011 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=866 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2305260000 definitions=main-2307120191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 21:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184226

Wrong list -- ignore     Joe

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Joe Slater via
> lists.openembedded.org
> Sent: Wednesday, July 12, 2023 2:33 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Slater, Joseph <joe.slater@windriver.com>; MacLeod, Randy
> <Randy.MacLeod@windriver.com>
> Subject: [oe-core][PATCH 1/1] libgpiod: modify RDEPENDS for ptest
>=20
> From: Joe Slater <joe.slater@windriver.com>
>=20
> The current use of RDEPENDS to add a dependency on bats results in the QA
> warning/error
>=20
>  lib32-libgpiod package lib32-libgpiod-ptest-dev - suspicious values
>   'bats-dev' in RRECOMMENDS [multilib]
>=20
> when building lib32-libgpiod with ptest not enabled.  We add the dependen=
cy
> only if ptest is enabled.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/reci=
pes-
> support/libgpiod/libgpiod.inc
> index a2d1f57a8b..cb19bc5fb8 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
> @@ -34,7 +34,7 @@ FILES:${PN}-tools +=3D " \  FILES:libgpiodcxx =3D
> "${libdir}/libgpiodcxx.so.*"
>=20
>  RRECOMMENDS:${PN}-ptest +=3D "coreutils"
> -RDEPENDS:${PN}-ptest +=3D "bats"
> +RDEPENDS:${PN}-ptest +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'b=
ats',
> '', d)}"
>=20
>  do_install:append() {
>      rm -f ${D}${bindir}/gpiod-test
> --
> 2.25.1


