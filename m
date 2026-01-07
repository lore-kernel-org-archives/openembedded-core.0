Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38633CEFD1A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 12:18:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4447.1767788287900427007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 04:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BHMwBVkO;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PqmwVzhD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079dtM02593336
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jan 2026 12:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wh3U99fzyVwzTbiTncASIZZHtGa1IvRSjV5xMB1GOAU=; b=BHMwBVkOYC9Maa+2
	CPfGsjaVgc7fAwvkK/pvzBGnA4UE9dzLXIcg4tgbyBu+uNVzzKvLs8LQxaTQThwQ
	m42xfUYTbTzR5pw097lWNGhzd2P2/sMQx4iw0adW7s9YkRVgv9zUp+A7z/u5bSv6
	qTgm1HtOyTdB1b59ARfsPtJT0uYdcIOsl9FCexpNPfnIlD3YibySGMwiX4faeSuy
	si1x96lyexkKyWtFYxgOz66+PjFGGN75/maBsFU7j7LLyQAHirArlOa8GrNcHbYD
	+MWIu/rFWOZwF8GnSpUETWW16GbW8ciU17UPWWfGzYfK2ae7jiKEeB8PWQ8g7uCn
	WEM6zw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn290fbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:18:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee416413a8so23872891cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 04:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767788286; x=1768393086; darn=lists.openembedded.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh3U99fzyVwzTbiTncASIZZHtGa1IvRSjV5xMB1GOAU=;
        b=PqmwVzhDXmlBvqxLuEBvyVIsCEmfMYz2YUEjesM7iYWGwcot9HhI8N49NS3+dhQcnC
         ufkbde9kD3+6acq8nFqZJo/rgHK/cf8MFVSUpF6ZLhz1vj8WIc4QjaAenwSzrLNWa9/z
         00x/BvsQuv6mVTOla2NYjo5B2vSsi4VaaseDEeJ+MH03EalmngWpD5UYc/gwcF9jHXTc
         t8r3h4E/23DNXYpW0rhXIwjRNYsbv3cwUX+garR0Z+w1vGO3Vb80TedBEYtIjrYTtm+D
         Gxkei3k0y16ZNv2U7xU6i2G4MvTOQZDzZJ+RF+eTNJNDEvSahENJXVP/0W3t2geZN4XU
         b5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788286; x=1768393086;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wh3U99fzyVwzTbiTncASIZZHtGa1IvRSjV5xMB1GOAU=;
        b=YQ0lLSfplBUdU3+tNJTS8ozYYjuGZDVPWSXDkAp8byEU4dqbvxkE9s4lC7+twO5fH1
         5MAEWSMV4swQK6d40oIdjqGMNLMKr//usjUptmMqaFdWtcL0bd3NF10uwDP+cWRklMUc
         fvM7gfJBV55qXLdLVxUl1ysF/E44KxIMetn3tQSIimeUSTeZTGn+T3w+RwUYCUGfagPk
         F+SEMi1JQpPCSnn9rVXUpKB3LAnJ6fgzdOshFK/DEl4kacuQTdA+RUDr9FqRQhPOxrDM
         Gr5xPGWaTgjcXaKjTYbrqcKWrD4Rz4rbe4uQ7GjxyEdd/MnFEITUBJOh3bsO6Krr3Lzf
         bK2g==
X-Gm-Message-State: AOJu0YyNr3SwGMfPL73Vjveg3sXGIcv3JbZ9H7Kqop/f9nk++i7canki
	USg/y6HpWEvT7RQzCejqPUte6NYL5HfAF6yV5c27WHSA3qo3pLBo96tp4sxwx+37mQ6Kb5cyqiC
	lRVT0QUlyIiZYsXHPIsSuk/bASfVkS01i5QWwKYqCWb29aMqCFL17yUG4bFtkrlGUgfpzP+i0mQ
	63doJCR98=
X-Gm-Gg: AY/fxX5HbIiMuLfSt+yv+tUHs67GIemsvSAhIu2EfpgYAfWsuQ0tBD39wcD6SOgoTzs
	b5n5R5CgMmogwntZRsUqXKx6C24PaSCGfC8i8J7vcUmr4rvTsgpjXyU9Yv9zpyY78FQ88mkWeTO
	HXyhEdI64Suwze5GC2ucjAV9uJIDA6QuCvFjMp9pO2l3t9OuZrwrx3zp2d+vV3z/RHn30/n5WQY
	s798n6NMsx6WNwozRCm97QwMEYxrpDE74DlKfaXpFcvlTjWhlP78R/pzKpfMENluLKRAud4UhgI
	CF9KU3ro+XcWvHqowl9NEnnhTYbCwtAotzqRLKW5aLmcFHGT5lKvQyTfSbnGKRzio5Ql1zme3HF
	T+rXBqT7abx1cKmfDYlU1Rht+EjOARThax3sgCEBYOOV/NehtNCaD4WDZIcwNF7BOzg==
X-Received: by 2002:ac8:5e08:0:b0:4ee:4a3a:bd08 with SMTP id d75a77b69052e-4ffb4af54dcmr26947161cf.80.1767788286362;
        Wed, 07 Jan 2026 04:18:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAoKeYmxy81zKDUFBM1Hmas4oD24vYuxJSu95O2XXoPea1gmQg6bxSR0MZ4TryXWHu8dlfiA==
X-Received: by 2002:ac8:5e08:0:b0:4ee:4a3a:bd08 with SMTP id d75a77b69052e-4ffb4af54dcmr26947011cf.80.1767788285798;
        Wed, 07 Jan 2026 04:18:05 -0800 (PST)
Received: from smtpclient.apple (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe60sm489336366b.45.2026.01.07.04.18.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:18:05 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [OE-core][PATCH] python3-pyzstd: upgrade 0.17.0 -> 0.19.1
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <20260107090744.844-1-liuyd.fnst@fujitsu.com>
Date: Wed, 7 Jan 2026 13:17:54 +0100
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EB63A912-D9CB-4A5E-BA6F-F66988514CB7@oss.qualcomm.com>
References: <20260107090744.844-1-liuyd.fnst@fujitsu.com>
To: liuyd.fnst@fujitsu.com
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-ORIG-GUID: YQXwCo-yuh4Lh13h4yt-p7XlmbsRZ4LO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NSBTYWx0ZWRfX33XMYuYTM97U
 kSSB+FYoRT6OpkCJkev3SkFv1ZsqY1wSZHFC9/VxGm/Asc4Sp6+4vnKWezQhqBUdv+6gaUw/fAA
 O3EFMbBtWWqCETafk+EcBZHfZaensGEbVsNMnutfRHTumBxdvePS1DPIyoTzssH/7rWK4WH+BN9
 wu1AdHKr51rL7iJdEsc2q72nlVpieKO4HSFHWYSEf27s85jeWw8bGrFodXJG73zAJJCLyxVfTLS
 tbptjN1aCvgMPHvlW3o87ntnVIp4hhhSSK/1K4utDQbYtoxy40TgWDOuUSXDWbV0UH2MYNLHuBh
 27IhIphiqpISu/XP8WdBkQxclxzZOvL6Oud6gpwdrHBAx3Ov2okUe4zhow8CNzvCGERPuAvF7xw
 JbCiDFhfsOQj5hIcURnDR/nKUdbSAs4VqJ/WHk8BKjumNxq+kj54sJ30TtMgtzBV0x/Hl2K30sH
 l7XXHGReNtGEn/ntsiA==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695e4eff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=/kpjpRmFdjEkggKB3J9tkg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=3zFDMma1u1GyMtLxngwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: YQXwCo-yuh4Lh13h4yt-p7XlmbsRZ4LO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228995



> Op 7 jan 2026, om 10:07 heeft Yiding Liu (Fujitsu) via =
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org> =
het volgende geschreven:
>=20
> 1.Changelog:
>  Fix SeekableZstdFile write table entries on 32-bits architectures =
when there is a huge number of entries.
>=20
> 2.Remove 0001-Remove-setuptools-version-limit-of-74.patch as =
setuptools was removed in pyproject.toml.
>=20
> 3.Remove do_configure:append as there is no setup.py in 0.19.1
>=20
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>

Thanks for doing this! This matches the local commit I was testing, all =
the results came back OK this morning, so:

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>

regards,

Koen


> ---
> ...emove-setuptools-version-limit-of-74.patch | 27 -------------------
> ...std_0.17.0.bb =3D> python3-pyzstd_0.19.1.bb} | 10 +++----
> 2 files changed, 3 insertions(+), 34 deletions(-)
> delete mode 100644 =
meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version=
-limit-of-74.patch
> rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb =3D> =
python3-pyzstd_0.19.1.bb} (53%)
>=20
> diff --git =
a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-versi=
on-limit-of-74.patch =
b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-versi=
on-limit-of-74.patch
> deleted file mode 100644
> index f2910322ff..0000000000
> --- =
a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-versi=
on-limit-of-74.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -=46rom bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 =
2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 9 Apr 2025 14:38:31 -0700
> -Subject: [PATCH] Remove setuptools version limit of '74'
> -
> -Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
> -support beyond that which is needed for python 3.9 on windows. We
> -do not have this problem on Linux
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index dd885e4..5d4d511 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -1,6 +1,6 @@
> - [build-system]
> - # setuptools 64+ support --build-option
> - # setuptools 74+ drops distutils.msvc9compiler required for Python =
3.9 under Windows
> --requires =3D ["setuptools>=3D64,<74"]
> -+requires =3D ["setuptools>=3D64"]
> - backend-path =3D ["build_script"]
> - build-backend =3D "pyzstd_pep517"
> diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb =
b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> similarity index 53%
> rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> index af7069b6ed..154e591f4b 100644
> --- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> +++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> @@ -9,12 +9,8 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Daedb5a2679cd1552fb61c181ef974b9e"
>=20
> PYPI_PACKAGE =3D "pyzstd"
>=20
> -SRC_URI +=3D =
"file://0001-Remove-setuptools-version-limit-of-74.patch"
> -SRC_URI[sha256sum] =3D =
"d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
> +SRC_URI[sha256sum] =3D =
"36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d586937830a8afc7d72"
>=20
> -inherit pypi python_setuptools_build_meta ptest-python-pytest
> +inherit pypi python_setuptools_build_meta ptest-python-pytest =
python_hatchling=20
>=20
> -# clang-16 with -flto segfaults on arm, therefore ignore flto for now
> -do_configure:append:arm:toolchain-clang() {
> -    sed -i -e "s|'-flto'|''|" ${S}/setup.py
> -}
> +DEPENDS +=3D "python3-hatch-vcs-native"
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228962): =
https://lists.openembedded.org/g/openembedded-core/message/228962
> Mute This Topic: https://lists.openembedded.org/mt/117131419/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


