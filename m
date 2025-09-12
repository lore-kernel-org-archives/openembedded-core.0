Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDC1CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 12:03:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.14983.1757678631922741238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 05:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=C7SD9TBd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKEU017582
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 12:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3Gmdj1xd9+ESJAw9MTRUbbE98lXWbbkg/KuFyyHZkw=; b=C7SD9TBdqSDkuQVO
	E8zfeETU4eyyXYLjygV2LX94Tw7Y6kJkkR5d8VhDB07mbSFwLLGCV63G5QaEbkTv
	LfbEprGprqrkqenPTYpUyZeWYjhekCRE90e2+2E9z8FW1E733NmwM1NJRdjMoxPf
	yfQhfeqO1MGcCuaLUOooLdRU3BP/idjuHrHBACiVlNwTN86w4morY1VH6AKoCeUN
	j4tTnxYx2VgYzKiAhjM7SSgbyVraEyOOLrU1AGqZEhqF0e9z/ZI+GGx33YyChbi9
	AQMcB8WC0qTng/AUW1HMmOW2qe/PAusySbKnVwO5mauhv3knJdeFa1wXaDjEtZOL
	bI5Tzg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwskps7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 12:03:51 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-72281c6c162so19639237b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 05:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678630; x=1758283430;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3Gmdj1xd9+ESJAw9MTRUbbE98lXWbbkg/KuFyyHZkw=;
        b=pqnjpeuNoA3qcPUd4fMaQDtvOtHsR+wvYvYeUYU+RLsxAjMEv3Xl3hUtu8XhxRPc0e
         ZBkS/ic3YwDngsPQCAVu2aZKCcn3+PyJ2Yx/1MHpJKQObi1M4msf1YKDGRr3YBa89gvX
         Ky+251gld2gDa5/mxm2+P7BxeF9kI8sBBHRHFi69PPn9BGexFHjRXjOEqOZ/jmpql/Ff
         jJsnjJn8Uk8WY6VVBztqb3wPrl3VBog+mDT+sBDSKczp95CrowJw8TTarh1+guWOzIW+
         fhtJST6HBkcHEGD3QFyJ2xmGCAGbkmSI9OMa8oTTEyVH+xVHjLIWELDXKVHSMiOHlwiN
         iUug==
X-Gm-Message-State: AOJu0YzLXlk9CVBQlEttr3H68bVcPY+SvEEZ1kymJcQQzY+l/OqcMwzF
	uwGrnscGBTqIqfAvuF7QZ/ieKa9RJ5qxl3BQ+ApLwKe1ea60DP5+rVQQcvKai67aus2wMsOMJjE
	9TT03GjqiNGGmpueBQrW6B/kdl07e39nnp5L24gtpD+hu3KBy2vE7Q24N/n22905EN5syUuI7Dp
	fi9qq/L/E=
X-Gm-Gg: ASbGnctU48AyasWTAYz+8FE0gAV+uNfJ9QEZfvWXUpYI6uQ9CWUeFE4uaL/9G8dnwbU
	VygFZFosdpvlP3sxs3qTFgAzMEJB6MGMEYUG0xMHWQ/ToKyoNP1pZIQPYo3UHtP4HiOqjmvpzoA
	STi6U+XfoqxJ0RgFqLNMvjVpRhViywXIImLxWPkb7AWyQM2QUUdLgX5jmxd0RMo/Dx+rWSqOotA
	j4v4M/gpR4G/4s8b7+aZu8EMNdNwQzB9P09E/CEzSLiOY6lyXzrXpX0eEP7UUnvN/wIdC4pPkJA
	uoDbDLywJpr6/UX3m8tjuaDy10c+qd6776/NwR5NRoTWurisxDaVQPtLdn+hyePuWIPnIbblUQ=
	=
X-Received: by 2002:a05:690e:1598:10b0:628:ef07:5e75 with SMTP id 956f58d0204a3-628ef075f2fmr878138d50.18.1757678629809;
        Fri, 12 Sep 2025 05:03:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGByCeQMwoWDHF8SWniEx02XCDZOyEni9RZgZQs1KmVPA9b+KKsCBTuiDqgvjDfkyXJRehkOg==
X-Received: by 2002:a05:690e:1598:10b0:628:ef07:5e75 with SMTP id 956f58d0204a3-628ef075f2fmr878086d50.18.1757678629217;
        Fri, 12 Sep 2025 05:03:49 -0700 (PDT)
Received: from smtpclient.apple ([2a01:90a0:1ff:f800:987f:741c:ba70:e493])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334eb58sm347464366b.100.2025.09.12.05.03.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:03:48 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [OE-core] [PATCH] meson: Backport patches to support dependencies
 on header-only Boost libs
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <20250910132452.3929251-1-pkj@axis.com>
Date: Fri, 12 Sep 2025 14:03:37 +0200
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D6CC8672-1385-4B08-8223-4845751B54C4@oss.qualcomm.com>
References: <20250910132452.3929251-1-pkj@axis.com>
To: peter.kjellerstedt@axis.com
X-Mailer: Apple Mail (2.3826.700.81)
X-Proofpoint-ORIG-GUID: Hwyi3Mw1ThEj074tAUmcmD5YGq0rjFuY
X-Proofpoint-GUID: Hwyi3Mw1ThEj074tAUmcmD5YGq0rjFuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX9nXtLYlkzAV/
 WT5wVJgs5xFoDDdMY5ll3FBuNKA2IEP1y+1q1zbm/691+NNbaFLhlswgGFF4HpHr4R3jSg1If0S
 2dWuZGn2+WFIcLn2My78is2FTwr4ZmQbRwWzc6hdfnNCSxN2+tbDv9ZBdImG3mjYz8gO/Jh9KiP
 DYE7QguN1st3d3iBf7e3sr9FYDHXT3fojI13Z4+1QWHGEOwEk//hOZ6VF/Gs0tIuAE/71j2prGS
 ZHwjJUjV0rXv46oKFaHkVvFTtbEbCoNKJ3lvbr8M7wjGbmA0+z48ARgAWDNwXx6M0joOG3idOEC
 HeCzUTW/7qLD8yGC4WzgvcaGjyHYhSU+Ir48xjgdaM4Flq3Stpw5LZ4QRU4rx66k8dFGYmpPs0u
 Ov3sSyA8
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c40c27 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=3-RhneuVAAAA:8
 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8 a=FPQ1Pj9CcbRD3PXun9QA:9 a=CjuIK1q_8ugA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VLVLkjT_5ZicWzSuYqSo:22
 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 12:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223309



> Op 10 sep 2025, om 15:24 heeft Peter Kjellerstedt via =
lists.openembedded.org =
<peter.kjellerstedt=3Daxis.com@lists.openembedded.org> het volgende =
geschreven:
>=20
> With Boost 1.89.0, the Boost.System library was made header-only. =
Since
> this is a frequent library to have as dependency in meson.build files,
> this resulted in build failures.
>=20
> Backport two patches so that Boost dependencies on header-only =
libraries
> work as expected.

Thanks for fixing meson, I ran into this exact issue earlier today!

regards,

Koen

>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> ...heck-for-header-only-Boost-libraries.patch | 58 +++++++++++++++++++
> ...python-must-have-a-library-component.patch | 34 +++++++++++
> meta/recipes-devtools/meson/meson_1.8.2.bb    |  2 +
> 3 files changed, 94 insertions(+)
> create mode 100644 =
meta/recipes-devtools/meson/meson/0001-Check-for-header-only-Boost-librari=
es.patch
> create mode 100644 =
meta/recipes-devtools/meson/meson/0002-Boost-python-must-have-a-library-co=
mponent.patch
>=20
> diff --git =
a/meta/recipes-devtools/meson/meson/0001-Check-for-header-only-Boost-libra=
ries.patch =
b/meta/recipes-devtools/meson/meson/0001-Check-for-header-only-Boost-libra=
ries.patch
> new file mode 100644
> index 0000000000..3d2810aff9
> --- /dev/null
> +++ =
b/meta/recipes-devtools/meson/meson/0001-Check-for-header-only-Boost-libra=
ries.patch
> @@ -0,0 +1,58 @@
> +=46rom f16897135c394d36656da0078613864076300e07 Mon Sep 17 00:00:00 =
2001
> +From: Jussi Pakkanen <jussi.pakkanen@mailbox.org>
> +Date: Fri, 29 Aug 2025 14:57:06 +0300
> +Subject: [PATCH] Check for header only Boost libraries.
> +
> +Upstream-Status: Backport =
[https://github.com/mesonbuild/meson/commit/6a9a81619c139d0f6ae3d265f7366e=
61615d92a1]
> +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +---
> + mesonbuild/dependencies/boost.py | 22 ++++++++++++++++++++--
> + 1 file changed, 20 insertions(+), 2 deletions(-)
> +
> +diff --git a/mesonbuild/dependencies/boost.py =
b/mesonbuild/dependencies/boost.py
> +index 662f985..e153e8f 100644
> +--- a/mesonbuild/dependencies/boost.py
> ++++ b/mesonbuild/dependencies/boost.py
> +@@ -452,6 +452,10 @@ class BoostDependency(SystemDependency):
> +                 break
> +         libs =3D sorted(set(libs))
> +=20
> ++        any_libs_found =3D len(libs) > 0
> ++        if not any_libs_found:
> ++            return False
> ++
> +         modules =3D ['boost_' + x for x in self.modules]
> +         for inc in inc_dirs:
> +             mlog.debug(f'  - found boost {inc.version} include dir: =
{inc.path}')
> +@@ -462,7 +466,7 @@ class BoostDependency(SystemDependency):
> +                 mlog.debug(f'    - {j}')
> +=20
> +             #   3. Select the libraries matching the requested =
modules
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
> ++            # If a lib is not found, but an include directory =
exists,
> ++            # assume it is a header only module.
> ++            not_found: T.List[str] =3D []
> ++            for boost_modulename in not_found_as_libs:
> ++                assert boost_modulename.startswith('boost_')
> ++                include_subdir =3D =
boost_modulename.replace('boost_', 'boost/', 1)
> ++                headerdir_found =3D False
> ++                for inc_dir in inc_dirs:
> ++                    if (inc_dir.path / include_subdir).is_dir():
> ++                        headerdir_found =3D True
> ++                        break
> ++                if not headerdir_found:
> ++                    not_found.append(boost_modulename)
> +=20
> +             # log the result
> +             mlog.debug('  - found:')
> diff --git =
a/meta/recipes-devtools/meson/meson/0002-Boost-python-must-have-a-library-=
component.patch =
b/meta/recipes-devtools/meson/meson/0002-Boost-python-must-have-a-library-=
component.patch
> new file mode 100644
> index 0000000000..c03c47534e
> --- /dev/null
> +++ =
b/meta/recipes-devtools/meson/meson/0002-Boost-python-must-have-a-library-=
component.patch
> @@ -0,0 +1,34 @@
> +=46rom d0644d543f4df39cf2ba14337000ee019cb20b6d Mon Sep 17 00:00:00 =
2001
> +From: Jussi Pakkanen <jussi.pakkanen@mailbox.org>
> +Date: Fri, 29 Aug 2025 22:51:48 +0300
> +Subject: [PATCH] Boost python must have a library component.
> +
> +Upstream-Status: Backport =
[https://github.com/mesonbuild/meson/commit/80917ca8c1a5af499cc6e004ad5d5a=
050da9045e]
> +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +---
> + mesonbuild/dependencies/boost.py | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/mesonbuild/dependencies/boost.py =
b/mesonbuild/dependencies/boost.py
> +index e153e8f..fdb35d4 100644
> +--- a/mesonbuild/dependencies/boost.py
> ++++ b/mesonbuild/dependencies/boost.py
> +@@ -440,6 +440,8 @@ class BoostDependency(SystemDependency):
> +         mlog.debug('  - potential library dirs: =
{}'.format([x.as_posix() for x in lib_dirs]))
> +         mlog.debug('  - potential include dirs: =
{}'.format([x.path.as_posix() for x in inc_dirs]))
> +=20
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
> +                 include_subdir =3D =
boost_modulename.replace('boost_', 'boost/', 1)
> +                 headerdir_found =3D False
> +                 for inc_dir in inc_dirs:
> diff --git a/meta/recipes-devtools/meson/meson_1.8.2.bb =
b/meta/recipes-devtools/meson/meson_1.8.2.bb
> index bfeaab0a79..0dd0544e14 100644
> --- a/meta/recipes-devtools/meson/meson_1.8.2.bb
> +++ b/meta/recipes-devtools/meson/meson_1.8.2.bb
> @@ -14,6 +14,8 @@ SRC_URI =3D =
"${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
>            =
file://0001-python-module-do-not-manipulate-the-environment-when.patch \
>            file://0001-Make-CPU-family-warnings-fatal.patch \
>            file://0002-Support-building-allarch-recipes-again.patch \
> +           file://0001-Check-for-header-only-Boost-libraries.patch \
> +           =
file://0002-Boost-python-must-have-a-library-component.patch \
>            "
> SRC_URI[sha256sum] =3D =
"c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000fd8c013cd387af"
> UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223209): =
https://lists.openembedded.org/g/openembedded-core/message/223209
> Mute This Topic: https://lists.openembedded.org/mt/115169173/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


