Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E62EC1438
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 12:36:28 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15264.1772533630349861466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=V/lUTTty;
 spf=pass (domain: siemens.com, ip: 52.101.66.43, mailfrom: stefano.tondo.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DV1Cmm1B5+g7uDFB2NFAlUotT4TZPvGPGv3+TDmoWPWnobx/kylX+FDXOG+QLxuBSnyGGg607kw/ZTdEpCIQnvBsxgZJGxRQ+ywV/dnzUNOyNlYCMP9uKTisF8QbhqYjB+FyJQK/YopkVQ79FNwQCf+rYtsM9+mkIZB+CJ1FnvRfcjUU8sMEhhHaNuIeAhKAvzEW0botVyJaRjYYLAxeSIFWTwM8REXyCel5HzT+sDW8eCK5u74/mBxFS+cBOewFpTMlDCvO8QwCSUcYv+gKD9+m3osA4Lt0/EzqFB07SJgW54Juiuap7Nf3oIiAJ3gvenBj41A/UdzkRfPl5Rchaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZc47+kOVhKCeK+qYW8bWUtqYAJNp/aYA383S3poXsc=;
 b=OHKrNpxN/12mOtdbB0L+qxKgV3jSUCeY4Z8MtKCHe6kUUGd6WkWxAEqv5XcZebBRzIpUcSb+HjmAgNTSQBgwDryWVadfmDk3qh0tqgWiiBBFvsp0JCP4lkla1SNMAeZQk+CnDAepGbGICxSCKIE+VVIG4u7ZdZFs0d1bSE5YsKjfbcEIGARzZHP8AuZW5FdFWFPqhOdgn34LDYB8Hr3S7lIJt0gfnkeIQkl/dc8vKW3uOtLPAE+x2nVlcnfBC5DimQW9aylDrM1DxNbBkgIEfpN0F4R88e6ysWDwBCmvAhZ/9vS1JJkLs+PIJjw9l6BwR2gsmT6yUNESgZRRVwB66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZc47+kOVhKCeK+qYW8bWUtqYAJNp/aYA383S3poXsc=;
 b=V/lUTTtycG/32ToMXoRkt7w8xz7sxu1ENOXNmLNUvGBEqvuUZAQfTXufIxb0npjGVKR1BkZzkJA1Q4FsoZW5dr3CsKklSpyb/ciiI9nz6N9CoZg9gqzNKg0FbDyBqCtFaop6hgJxm2MbWT5xdaQWaUUIyxI8GhvysD5dxE4n7kD4hgzOhevFDRuwuA7OWf5/YEYUy3dSWfWYf68O8+Z/BK91PkYDY9g9H4T491DJzTAfWXIPOXknBNbNracBVnt9Zvp7TiOL3XplktmMwNgBx03briT+2HLV78bb0NgLSzxtukPtTmhqMeB6OYhjbra7EyakHyp1Fn1d9EhrgYd3uQ==
Received: from AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::20)
 by DB8PR10MB3164.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:11a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:27:06 +0000
Received: from AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f490:9f02:a64c:84b7]) by AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f490:9f02:a64c:84b7%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:27:05 +0000
From: "Tondo, Stefano" <stefano.tondo.ext@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"stondo@gmail.com" <stondo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Ross.Burton@arm.com" <Ross.Burton@arm.com>, "jpewhacker@gmail.com"
	<jpewhacker@gmail.com>, "Marko, Peter" <Peter.Marko@siemens.com>, "Freihofer,
 Adrian" <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH v5 04/10] spdx30: Add version extraction from SRCREV for Git source components
Thread-Topic: [OE-core] [PATCH v5 04/10] spdx30: Add version extraction from
 SRCREV for Git source components
Thread-Index: AQHcql3ZDda3RcgmnE6hcYu7kUwHNrWcfnwAgAAcyus=
Date: Tue, 3 Mar 2026 10:27:05 +0000
Message-ID: 
 <AS4PR10MB5441FFDC9C00E4D486E9C709AC7FA@AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260302160114.46884-5-stefano.tondo.ext@siemens.com>
 <DGT0HVQB154L.3E9JJLNYVHH0Q@bootlin.com>
In-Reply-To: <DGT0HVQB154L.3E9JJLNYVHH0Q@bootlin.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-03T10:27:04.621Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR10MB5441:EE_|DB8PR10MB3164:EE_
x-ms-office365-filtering-correlation-id: 293f3d20-ab5d-4105-36ba-08de790f6ac8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|31052699007|39142699007|376014|38070700021|8096899003|13003099007|7142099003|7053199007;
x-microsoft-antispam-message-info: 
 5PpCN0DZ2jSH8+p0ytBByaQA6LS5/wAp385cGrDbJIjOwkIwG1JUafZZ+GBHzTSJ4jNsY1xyURBfoShwnAU83tT23yQY1086aMgGYERbiwAzA1rX/H9ECnEiNZab4Q/dS2dybQvlxau+orpo1Rz6cXIoq6P1sXo5Z+63a0xhWNnGFf8D+G6Ke9f/irvc9BoMc1D8Z8MGwfZwvQnSjmSP53sBvk2CsCWVIQ60lH5B8qkTZuNxD95P1Gja7kwwmtEmtz+altKjy98uwA+x6DfoZVDo+4uaDsQGD7wZdc5z5yQXPA0ik8jTpnXaSfKPNgo95UtBLKX3kcygKjKtbjdO3PezczRYh64lRmcNiz9rQ+7Tkn81AhMF0+dLmlmixrVvwblCxTfiu3U4fWlbYSBjjcT2amjWCNFOnjLssV8Lp/ivPtbn6/VqBQYv4G07SoasLL1uJJXJ3gW3RQaNuksbhuufT8DgvgKqw9RVD48m+Dv8HAdI6yf7WIk1juxAjPvR/68oh9YESO5FfZij5aUjJLeFBYaG0R/UizSfNna4JBxziQysUpaAz2G+Fl1YXXHwA8qlgNwimP70eBLcafNTVhiNmkHwZy4xC8ahPiuICY5UxUaIM6ERkgeObKcaEo/23EUAszg4db8V0lpslCYTNR3HL4QDO8NrNVcyy5S3wBrbtucAiQ+qB7YSr7o7JKa0wQAwGOfZvZPa3T7xTTuDy2Iak1ALCHqWxtLsM8smAw0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(31052699007)(39142699007)(376014)(38070700021)(8096899003)(13003099007)(7142099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8STbsGr1dGH2CSina/9MVUdzqIdxmk+MFarM3URM4Rn55OQHMROe3EodPuga?=
 =?us-ascii?Q?TL5Aepv8bqXdOrgv8vJRAdfwtVGt7TzIjPGXz2f/gsbz7p2CwmoAwIJKInSC?=
 =?us-ascii?Q?Zf1/MEbeoaD3LOIH6PRujVmp30MXNHnK5xubGCDb7g1J6Icl00h58d4Dj/IH?=
 =?us-ascii?Q?AT8GzoR5CaFEwkLRxazA5LNVn1k5gRiIgIblYkDnyKufZsbu41Ls0NFA3yrC?=
 =?us-ascii?Q?i39YFXBL8psYhK8aN37Htuzg8kBDrugJIN83oAGwpADInNGo7WkCjtFzwdzE?=
 =?us-ascii?Q?h46jSwk4IpzqAwvTA2uHYOclF19GLQ2esLnrFe4bb/ORU6j5jOU0Cr9pT4fN?=
 =?us-ascii?Q?1mBGo6VH+UTMRGbCdGI+ueJCv3bpLsKUHWTCUuDvtYpwMPXXCNwyF2PBCxiq?=
 =?us-ascii?Q?jfsk0hWUtyeyybXWHjPlbVrkD13VfYBpMdnH41c8ncUKHE8BaZ0m+OJ/s8m1?=
 =?us-ascii?Q?CTuGAF67zYIwEOa7ZV0dQLhSERMYk+W/ojjU6NN1wPAGSBwUkYtC3Swr5eUT?=
 =?us-ascii?Q?9V/QM9bEMuZb4ZC5FlSemwOjlnhjVQ6ZFl7ik989eZE2XqjgVXbN7noDvlD6?=
 =?us-ascii?Q?WGMrA49+FZyqrDUbRfLXsoYUF4rVQFUlr2x0dZlnk0aY91GY7JgvNf/bqjy3?=
 =?us-ascii?Q?2AvuFL6wwHFh9ENHL4r4OnqdmU23NvXxuCT2tk3G7v5oJRzFoKFO+dPnI2YS?=
 =?us-ascii?Q?xhdoYfYMlsFeK671am6jA2s8N/iZwUbIH2fMgz3nFZ4Yc8uqCpH/v7l9igWv?=
 =?us-ascii?Q?2CQ1vOFyHopV2r35Pf8GYygrJG4C2pAWSlpopfM9/pG5d6jkuE3s30RYfuXf?=
 =?us-ascii?Q?PG6JXnQ7Fg6HUXI+AVVUQoOT3yI1uuxTfzO9wmgmFDbFKARjHqe3yyc1E17W?=
 =?us-ascii?Q?QTRWgPRzv4atB6B18Ci/sVKY4p5axFxEKEvLjU/D2n+kwOhv8LdZ2zAtV+BC?=
 =?us-ascii?Q?e8bIeeEwctwkHB7yf7Ygw+FPg0ESSsb2E5hzeAq7JINuVgxuap778VMnphUs?=
 =?us-ascii?Q?b4tgZG0Jf1Sq31mZtlzbhL7xxcIna8/We0agB/BeSrOJA19bNir+D9qCZl4L?=
 =?us-ascii?Q?YgO+jJcLIa51VadPPG6sphvpG9/U40PKTelnfVuD7VTbLruwtReklWNWB+50?=
 =?us-ascii?Q?pr1pW/dE0V2NzTv2LEcQQsMWwqwUP0uY/PVwdiiSp4TQMvq4eT5A11d/K5iH?=
 =?us-ascii?Q?OXdC/KzFzmtEcoCRKhG2uZjt35+3Ita8DV9/1k+8tnZhK9uUi/2XTnVld1C1?=
 =?us-ascii?Q?9ZlvXjY+xEHMNI5F8EFLWHoP2frRvjF0qILQj/t8rsLNQu+p25wOFsIcJMDb?=
 =?us-ascii?Q?v0aiR3EjJBNSFC1ikpxsySR4BQn9z7++oLJksUwz4cGRFC7DCHcttAdg85sD?=
 =?us-ascii?Q?/x1ZRpEBKBKg0oNfX38cj84Pj+B1TY6i2oOjWoczJK217/EiTXzgqJfdFK6k?=
 =?us-ascii?Q?6O9S6b48Wj/4f5HdP0Z0VJj+KxjQtsompFR0d9lYr2YLxGjPGir1uRNCXk0F?=
 =?us-ascii?Q?8Zifts9tqQ+Ak0/1U/67pk2vuLdp3REz58UUb3s+mgt8WmP/TYJwY/uR3tAi?=
 =?us-ascii?Q?ANMzDhyD20sJyzO862CyvkxFS4xDzXPSZ3MNShtznP8kh2CS8WKYLgVCXiBB?=
 =?us-ascii?Q?ccJRn+pG1xrR/YnZ1q5E4F33iu9M6TiIV5R6RYiHOyfraD5MlNMDlpfrCpRA?=
 =?us-ascii?Q?gks+BWVHTacBZWM3QkzXFz/3mx1ZEAEkUdq4qQ8T8LL16cfh62px6tdwbr/j?=
 =?us-ascii?Q?WMS8Q3kwKw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5441.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 293f3d20-ab5d-4105-36ba-08de790f6ac8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 10:27:05.5454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kOw1bFIqMItdllEI0JayX8sVe5g/I3M2crpq2rPMNkWzOgdSDMv/RODx+5KKHRTU+i/SktR/QTlbtjiw+BX6hAT8zT2rnM4p5QN1TnRMVNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3164
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS4PR10MB5441FFDC9C00E4D486E9C709AC7FAAS4PR10MB5441EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 12:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232308

--_000_AS4PR10MB5441FFDC9C00E4D486E9C709AC7FAAS4PR10MB5441EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

this is weird. In V4 I ran successfully all tests locally before submitting=
.
I will take a look right away, curious to see what V5 broke.

Stefano
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Tuesday, March 3, 2026 09:42
To: stondo@gmail.com <stondo@gmail.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>
Cc: Ross.Burton@arm.com <Ross.Burton@arm.com>; jpewhacker@gmail.com <jpewha=
cker@gmail.com>; Tondo, Stefano (ext) (SI B PRO AUT PD ZUG SW 2) <stefano.t=
ondo.ext@siemens.com>; Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.=
com>; Freihofer, Adrian (SI B PRO TI EAC CCP) <adrian.freihofer@siemens.com=
>
Subject: Re: [OE-core] [PATCH v5 04/10] spdx30: Add version extraction from=
 SRCREV for Git source components

On Mon Mar 2, 2026 at 5:01 PM CET, Stefano Tondo via lists.openembedded.org=
 wrote:
> Extract version information for Git-based source components in SPDX 3.0
> SBOMs to improve SBOM completeness and enable better supply chain trackin=
g.
>
> Problem:
> Git repositories fetched as SRC_URI entries currently appear in SBOMs
> without version information (software_packageVersion is null). This makes
> it difficult to track which specific revision of a dependency was used,
> reducing SBOM usefulness for security and compliance tracking.
>
> Solution:
> - Extract SRCREV for Git sources and use it as packageVersion
> - Use fd.revision attribute (the resolved Git commit)
> - Fallback to SRCREV variable if fd.revision not available
> - Use first 12 characters as version (standard Git short hash)
> - Generate pkg:github PURLs for GitHub repositories (official PURL type)
> - Add comprehensive debug logging for troubleshooting
>
> Impact:
> - Git source components now have version information
> - GitHub repositories get proper PURLs (pkg:github/owner/repo@commit)
> - Enables tracking specific commit dependencies in SBOMs
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---

Hi Stefano,

Thanks for the new version, but we again have a lot of selftests failing:

2026-03-02 17:36:16,484 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_binary (subunit.RemotedTestCase)
2026-03-02 17:36:16,484 - oe-selftest - INFO -  ... FAIL
...
2026-03-02 17:36:16,486 - oe-selftest - INFO - 7: 7/29 178/673 (21.91s) (0 =
failed) (devtool.DevtoolAddTests.test_devtool_add_binary)
2026-03-02 17:36:16,486 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 419, in test_devt=
ool_add_binary
    result =3D runCmd('devtool add  -b %s %s' % (pn, bin_package_path))
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'devtool add  -b tst-bin /tmp/devtoolqalnb521vt/tst=
-bin.tar.gz' returned non-zero exit status 1:
...
2026-03-02 17:36:37,300 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_fetch (subunit.RemotedTestCase)
2026-03-02 17:36:37,301 - oe-selftest - INFO -  ... FAIL
...
2026-03-02 17:36:37,302 - oe-selftest - INFO - 7: 8/29 181/673 (20.82s) (2 =
failed) (devtool.DevtoolAddTests.test_devtool_add_fetch)
2026-03-02 17:36:37,302 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 554, in test_devt=
ool_add_fetch
    result =3D runCmd('devtool add --no-pypi %s %s -f %s' % (testrecipe, sr=
cdir, url))
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'devtool add --no-pypi python-markupsafe /tmp/devto=
olqaamxld4_b/python-markupsafe -f https://eur01.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Ffiles.pythonhosted.org%2Fpackages%2Fc0%2F41%2Fba=
e1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f%2FMarkupSafe-0.2=
3.tar.gz&data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7Cfa7273d9ff86436=
f48af08de7900c21d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639081241603=
094951%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D8F4uo=
ng%2BOpYL%2FDGs7JXQv4eiNpO35f2hMedzRnFG0ic%3D&reserved=3D0'<https://files.p=
ythonhosted.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695a=
f5952530482c963f/MarkupSafe-0.23.tar.gz> returned non-zero exit status 1:
...
2026-03-02 17:37:54,668 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_fetch_simple (subunit.RemotedTestCase)
2026-03-02 17:37:54,668 - oe-selftest - INFO -  ... FAIL
...
2026-03-02 17:41:18,826 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_python_egg_requires (subunit.RemotedTestCase)
2026-03-02 17:41:18,826 - oe-selftest - INFO -  ... FAIL
...

Continuing with 25 test fails.

https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F35%2Fbuilds%2F3314&data=
=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7Cfa7273d9ff86436f48af08de7900=
c21d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639081241603157675%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DKDCdm12DN4fL1iGLQZ=
%2FZmLPSjg%2BgOZzVggpncz%2FFcj8%3D&reserved=3D0<https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/35/builds/3314>
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F48%2Fbuilds%2F3204&data=
=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7Cfa7273d9ff86436f48af08de7900=
c21d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639081241603212892%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D5BeBNBPHUGGL3nzdHc=
7aEHxhDgiy3LWR%2F%2F4XHZic%2BMY%3D&reserved=3D0<https://autobuilder.yoctopr=
oject.org/valkyrie/#/builders/48/builds/3204>
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F23%2Fbuilds%2F3434&data=
=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7Cfa7273d9ff86436f48af08de7900=
c21d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639081241603271951%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Df63cwRTFpSuC%2B5nl=
a372zSRE3oBgp9fET7W9hA2DpSE%3D&reserved=3D0<https://autobuilder.yoctoprojec=
t.org/valkyrie/#/builders/23/builds/3434>

Can you have a look at these failures?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7Cfa7273d9ff86436f=
48af08de7900c21d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6390812416033=
28730%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsI=
lAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D8f9pqx=
Csj2L4NXqIIe4KCylV%2FMTzhPJrZp2aw8w9y54%3D&reserved=3D0<https://bootlin.com=
/>


--_000_AS4PR10MB5441FFDC9C00E4D486E9C709AC7FAAS4PR10MB5441EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Mathieu,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
this is weird. In V4 I ran successfully all tests locally before submitting=
.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I will take a look right away, curious to see what V5 broke.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Stefano</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Tuesday, March 3, 2026 09:42<br>
<b>To:</b> stondo@gmail.com &lt;stondo@gmail.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> Ross.Burton@arm.com &lt;Ross.Burton@arm.com&gt;; jpewhacker@gmai=
l.com &lt;jpewhacker@gmail.com&gt;; Tondo, Stefano (ext) (SI B PRO AUT PD Z=
UG SW 2) &lt;stefano.tondo.ext@siemens.com&gt;; Marko, Peter (FT D EU SK BF=
S1) &lt;Peter.Marko@siemens.com&gt;; Freihofer, Adrian (SI
 B PRO TI EAC CCP) &lt;adrian.freihofer@siemens.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v5 04/10] spdx30: Add version extracti=
on from SRCREV for Git source components</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon Mar 2, 2026 at 5:01 PM CET, Stefano Tondo v=
ia lists.openembedded.org wrote:<br>
&gt; Extract version information for Git-based source components in SPDX 3.=
0<br>
&gt; SBOMs to improve SBOM completeness and enable better supply chain trac=
king.<br>
&gt;<br>
&gt; Problem:<br>
&gt; Git repositories fetched as SRC_URI entries currently appear in SBOMs<=
br>
&gt; without version information (software_packageVersion is null). This ma=
kes<br>
&gt; it difficult to track which specific revision of a dependency was used=
,<br>
&gt; reducing SBOM usefulness for security and compliance tracking.<br>
&gt;<br>
&gt; Solution:<br>
&gt; - Extract SRCREV for Git sources and use it as packageVersion<br>
&gt; - Use fd.revision attribute (the resolved Git commit)<br>
&gt; - Fallback to SRCREV variable if fd.revision not available<br>
&gt; - Use first 12 characters as version (standard Git short hash)<br>
&gt; - Generate pkg:github PURLs for GitHub repositories (official PURL typ=
e)<br>
&gt; - Add comprehensive debug logging for troubleshooting<br>
&gt;<br>
&gt; Impact:<br>
&gt; - Git source components now have version information<br>
&gt; - GitHub repositories get proper PURLs (pkg:github/owner/repo@commit)<=
br>
&gt; - Enables tracking specific commit dependencies in SBOMs<br>
&gt;<br>
&gt; Signed-off-by: Stefano Tondo &lt;stefano.tondo.ext@siemens.com&gt;<br>
&gt; ---<br>
<br>
Hi Stefano,<br>
<br>
Thanks for the new version, but we again have a lot of selftests failing:<b=
r>
<br>
2026-03-02 17:36:16,484 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_binary (subunit.RemotedTestCase)<br>
2026-03-02 17:36:16,484 - oe-selftest - INFO -&nbsp; ... FAIL<br>
...<br>
2026-03-02 17:36:16,486 - oe-selftest - INFO - 7: 7/29 178/673 (21.91s) (0 =
failed) (devtool.DevtoolAddTests.test_devtool_add_binary)<br>
2026-03-02 17:36:16,486 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/laye=
rs/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py&quot;, line 41=
9, in test_devtool_add_binary<br>
&nbsp;&nbsp;&nbsp; result =3D runCmd('devtool add&nbsp; -b %s %s' % (pn, bi=
n_package_path))<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/laye=
rs/openembedded-core/meta/lib/oeqa/utils/commands.py&quot;, line 214, in ru=
nCmd<br>
&nbsp;&nbsp;&nbsp; raise AssertionError(&quot;Command '%s' returned non-zer=
o exit status %d:\n%s&quot; % (command, result.status, exc_output))<br>
AssertionError: Command 'devtool add&nbsp; -b tst-bin /tmp/devtoolqalnb521v=
t/tst-bin.tar.gz' returned non-zero exit status 1:<br>
...<br>
2026-03-02 17:36:37,300 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_fetch (subunit.RemotedTestCase)<br>
2026-03-02 17:36:37,301 - oe-selftest - INFO -&nbsp; ... FAIL<br>
...<br>
2026-03-02 17:36:37,302 - oe-selftest - INFO - 7: 8/29 181/673 (20.82s) (2 =
failed) (devtool.DevtoolAddTests.test_devtool_add_fetch)<br>
2026-03-02 17:36:37,302 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/laye=
rs/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py&quot;, line 55=
4, in test_devtool_add_fetch<br>
&nbsp;&nbsp;&nbsp; result =3D runCmd('devtool add --no-pypi %s %s -f %s' % =
(testrecipe, srcdir, url))<br>
&nbsp; File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/laye=
rs/openembedded-core/meta/lib/oeqa/utils/commands.py&quot;, line 214, in ru=
nCmd<br>
&nbsp;&nbsp;&nbsp; raise AssertionError(&quot;Command '%s' returned non-zer=
o exit status %d:\n%s&quot; % (command, result.status, exc_output))<br>
AssertionError: Command 'devtool add --no-pypi python-markupsafe /tmp/devto=
olqaamxld4_b/python-markupsafe -f
<a href=3D"https://files.pythonhosted.org/packages/c0/41/bae1254e0396c0cc8c=
f1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Ffiles.p=
ythonhosted.org%2Fpackages%2Fc0%2F41%2Fbae1254e0396c0cc8cf1751cb7d9afc90a60=
2353695af5952530482c963f%2FMarkupSafe-0.23.tar.gz&amp;data=3D05%7C02%7Cstef=
ano.tondo.ext%40siemens.com%7Cfa7273d9ff86436f48af08de7900c21d%7C38ae3bcd95=
794fd4addab42e1495d55a%7C1%7C0%7C639081241603094951%7CUnknown%7CTWFpbGZsb3d=
8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbC=
IsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D8F4uong%2BOpYL%2FDGs7JXQv4eiNpO=
35f2hMedzRnFG0ic%3D&amp;reserved=3D0'</a>
 returned non-zero exit status 1:<br>
...<br>
2026-03-02 17:37:54,668 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_fetch_simple (subunit.RemotedTestCase)<br>
2026-03-02 17:37:54,668 - oe-selftest - INFO -&nbsp; ... FAIL<br>
...<br>
2026-03-02 17:41:18,826 - oe-selftest - INFO - devtool.DevtoolAddTests.test=
_devtool_add_python_egg_requires (subunit.RemotedTestCase)<br>
2026-03-02 17:41:18,826 - oe-selftest - INFO -&nbsp; ... FAIL<br>
...<br>
<br>
Continuing with 25 test fails.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/3314">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F35%2Fbuilds%2F=
3314&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7Cfa7273d9ff86436=
f48af08de7900c21d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639081241603=
157675%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DK=
DCdm12DN4fL1iGLQZ%2FZmLPSjg%2BgOZzVggpncz%2FFcj8%3D&amp;reserved=3D0</a><br=
>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/buil=
ds/3204">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F48%2Fbuilds%2F=
3204&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7Cfa7273d9ff86436=
f48af08de7900c21d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639081241603=
212892%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D5=
BeBNBPHUGGL3nzdHc7aEHxhDgiy3LWR%2F%2F4XHZic%2BMY%3D&amp;reserved=3D0</a><br=
>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/3434">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fautobuilder.yoctoproject.org%2Fvalkyrie%2F%23%2Fbuilders%2F23%2Fbuilds%2F=
3434&amp;data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7Cfa7273d9ff86436=
f48af08de7900c21d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C639081241603=
271951%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Df=
63cwRTFpSuC%2B5nla372zSRE3oBgp9fET7W9hA2DpSE%3D&amp;reserved=3D0</a><br>
<br>
Can you have a look at these failures?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C02%7Cstefano.tondo=
.ext%40siemens.com%7Cfa7273d9ff86436f48af08de7900c21d%7C38ae3bcd95794fd4add=
ab42e1495d55a%7C1%7C0%7C639081241603328730%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0=
eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo=
yfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D8f9pqxCsj2L4NXqIIe4KCylV%2FMTzhPJrZp2aw8=
w9y54%3D&amp;reserved=3D0</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS4PR10MB5441FFDC9C00E4D486E9C709AC7FAAS4PR10MB5441EURP_--

