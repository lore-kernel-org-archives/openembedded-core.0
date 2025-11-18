Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DC7CED24D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:19:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8556.1763457568219721648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LeeJq+Za;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IpphKUih;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI98pdd4166700
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 09:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvKxUBWu6Z35EiqmUAqvdFg+7ctik+tgHzfPwlj9UEY=; b=LeeJq+ZaNJ/OBglb
	BaPGzYsx8MM7sCaIyS+YxPuDBU/G7yiDnl4/wh0KpBNMYGMqEhVSDxrdjKnqovNO
	gxVNUCaeBbHUle9/87bZPxaSJ0TPxKmXPbKbNObtLNUwpvy/o2ZQilK+RDxRT2EP
	06nxGI5k/RG4+U3Rpz19CICNNicKr1XV0nd374YvEc0K2OnBHbewmKrjVSAdMKID
	mzqeKhGL4NmSHL1JWmDFoBfgg9HRimWY1aP3zOD4/7G3OOJbDiefh0WSfzVaaPsT
	147ZW2Yh0pTcfhlm3wckxmW/SUuMPXdUIELtZpMw37PG/q4DeAnGFiBOhEJO5STv
	3BYTFA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593txvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 09:19:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-880444afa2cso65619526d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 01:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763457566; x=1764062366; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvKxUBWu6Z35EiqmUAqvdFg+7ctik+tgHzfPwlj9UEY=;
        b=IpphKUihi7ruj4gDWLNldn3jmwI3Tg5w60bklzDELfZrR928QUEwngZ5UDhQhAih75
         xjoQRGHxxDuEzkqEbgyDkpYPj35BRTq6WTkljpbw/qlAQaA8cYLlP5cIxrK7BKNSA7r1
         wv7YgLb3v1IUGKxE6tvnugl9mWRwReE8HtdyaO1k3ffSDGPsw48RqTIB/Mwp/8YLmiDc
         0wkVHF2ehIv1JlUfDJ6I4iwVyRUotaRpWqDWliJjlzxvoX8LfAs0/SgSopXfCufzD6Gk
         /yq3SaEAfmtU23dkkYgAbkV47S9kkulCbGwSuc9BmbFycD78kDKgz3e87CcLYVbM5k+T
         A+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763457566; x=1764062366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xvKxUBWu6Z35EiqmUAqvdFg+7ctik+tgHzfPwlj9UEY=;
        b=bkSKdNrBIK9ztIk6IMXjpAOyZ4WofOeVTxCP89iX0kXYZh4Kpn/LawCMj9voCaNisv
         kVYTH5rPb1mCnbPt5KJIHwxbWMniFo8oiJqyonTnNUIit2StadLL/KDBK81hwR3cUMAN
         vhX4EytDW+hv1rcbG5VjWTR1u+wLZpC+Ej5B42RtgMsg2hhO2g7AzSvDa+OgyRxObtfn
         oVEEqggcA8MYhfEIa7+W6ZXqy34omwU+PNpxZuJe8XsiWNoEWxeTxaSeDIe1McEEv3mq
         PGCSCpHvlQ3dexShbDgRxiZDM76zCslPVjrb03PydNZlRNQxxWXPsygltEq2oC6K6qY8
         IJEQ==
X-Gm-Message-State: AOJu0Yx9E71tgTHILfu3XAJm3qf3+Oe4dxGKiqKJrPteYQrNUdLr/vQx
	YRLDaMkPy2QufvUCo+7xVbw/opJEqePnWkFpFWFILyjcgF+6L77Z8cx6f8Z2dl65ibSwyYzWCzQ
	g6tH6iVj5EqWaI0W7k6O/KCXicJbsx90j1pMa8uF1jVpcuq4/og/FwuYaNQjjGeahdoiObGD95h
	4PZSDYImJo2lIlQrx8czNWKZR/UTzozm7IZnEHoJrRW3SJMstKGvIzKz2Uzg==
X-Gm-Gg: ASbGnct2GUYhimb9y91uwr9DbLPeLY4tjoPWgEDPA+z8fcd2iW4W+9xel8X+QHASlqt
	kuNj5H6R8YH3LJvkhlt/yiOad+yNPuavRVX/JNHi8NyG1iCm+rHDPrPlKuneNCqsmsoViBlfSyb
	yrIeJ9vQFcdUFlBuJ6bXkBhvVNJqKZC6xs15gAZwNZ7QqaNQtZCnHZxCV+xdFduelo
X-Received: by 2002:a05:6214:260b:b0:880:5350:e75b with SMTP id 6a1803df08f44-882925e97d2mr191958286d6.23.1763457566061;
        Tue, 18 Nov 2025 01:19:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMjvAcdoiRc/VIxl9Yj2c5Cx6/YAgQjBFw5NgL3ladT1xiy5LhlYM10NMkWlj1I7FIuAjoY5s+LfYhACWqX64=
X-Received: by 2002:a05:6214:260b:b0:880:5350:e75b with SMTP id
 6a1803df08f44-882925e97d2mr191957936d6.23.1763457565526; Tue, 18 Nov 2025
 01:19:25 -0800 (PST)
MIME-Version: 1.0
References: <20251118090655.1431-1-wangmy@fujitsu.com>
In-Reply-To: <20251118090655.1431-1-wangmy@fujitsu.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 17:19:14 +0800
X-Gm-Features: AWmQ_bn9zujzxCfYsVEnGGh9wGNK2NFIZbMtsCw_9HMtCVWYpK8z8wC4yAHiWww
Message-ID: <CA+s=J=x7oTkBh8vfMxq83jF4WhCTN-fdR4hsGmGfjDsoRxu9tw@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH v3] libdnf: upgrade 0.74.0 -> 0.75.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691c3a1f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=omOdbC7AAAAA:8 a=7CQSdrXTAAAA:8 a=JYP773rzBVNIUOtvTJkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3MyBTYWx0ZWRfX7KiZ2/z3vABj
 mJyjB3hXOu2Y8eiokpXDoJRBtAqMSHkdDVMHVSg1yNmxwO3MikdCaVC8em1BvLCvFIao06OKKUY
 cpRo2AdbRk3uDjTe0PckInHLRcztxsGkYZ0QO577GKg3dqNlSLIZBiY0MUgdfD/ugXpcae1LzQX
 xrNQ+A+5STwqbxQJPYJZ6xCCCmrztFZipnvAH0nIIVBL82VouHRTpAFcVwx7FGowwKmDgcdGq89
 954IIQjySPl/VAi/C3XTVlW3WgRNovAWkeO1IJ4k4FjIg1P1/aJNXPE2RWLmJFymLPoD/RKW4zM
 D1JuH0Hd8C9fAcuckY17mNbIAGfveflSFMwrH1/k4qBPpOQsLlRuaVsAEFbfLoA526d5/AbyH7U
 IRyOOMTnEN4flis9aaB/ojV9t8sS3g==
X-Proofpoint-ORIG-GUID: 4KRLSKHl6lxwlGxkBfIN6sYRI5pzmm_3
X-Proofpoint-GUID: 4KRLSKHl6lxwlGxkBfIN6sYRI5pzmm_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 09:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226514

On Tue, Nov 18, 2025 at 5:07=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> optional-check.patch
> removed since it's included in 0.75.0
>
> Add patches to fix compilation error with musl:
> 0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
> 0001-utils-utils.cpp-fix-compilation-with-musl.patch
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...FNM_EXTMATCH-if-not-already-like-und.patch | 39 ++++++++++++++
>  ...-utils.cpp-fix-compilation-with-musl.patch | 51 ++++++++++++++++++
>  .../libdnf/libdnf/optional-check.patch        | 52 -------------------
>  .../{libdnf_0.74.0.bb =3D> libdnf_0.75.0.bb}    |  7 ++-
>  4 files changed, 95 insertions(+), 54 deletions(-)
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Def=
ine-FNM_EXTMATCH-if-not-already-like-und.patch
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.=
cpp-fix-compilation-with-musl.patch
>  delete mode 100644 meta/recipes-devtools/libdnf/libdnf/optional-check.pa=
tch
>  rename meta/recipes-devtools/libdnf/{libdnf_0.74.0.bb =3D> libdnf_0.75.0=
.bb} (85%)
>
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM=
_EXTMATCH-if-not-already-like-und.patch b/meta/recipes-devtools/libdnf/libd=
nf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
> new file mode 100644
> index 0000000000..14ef362ccd
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMAT=
CH-if-not-already-like-und.patch
> @@ -0,0 +1,39 @@
> +From 486d1c7826efb9e42bbb18b6537fd23a0a33b324 Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Sun, 16 Nov 2025 23:29:18 +0000
> +Subject: [PATCH] dnf-repo: Define FNM_EXTMATCH if not already (like unde=
r
> + musl).
> +
> +With musl, FNM_EXTMATCH is not defined:
> +dnf-repo.cpp
> +| dnf-repo.cpp: In function 'void dnf_repo_conf_load_overrides(DnfRepo*,=
 const char*)':
> +| dnf-repo.cpp:971:50: error: 'FNM_EXTMATCH' was not declared in this sc=
ope; did you mean 'FNM_NOMATCH'?
> +|   971 |             if (fnmatch(repo_id_pattern, repoId, FNM_EXTMATCH)=
 !=3D 0) {
> +|       |                                                  ^~~~~~~~~~~~
> +|       |                                                  FNM_NOMATCH
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/l=
ibdnf/pull/1737/commits/47ed831c1fdb32519f2d66fee91bc47f9521d1d4]
> +
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +---
> + libdnf/dnf-repo.cpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/libdnf/dnf-repo.cpp b/libdnf/dnf-repo.cpp
> +index 44c0f8758..d53959414 100644
> +--- a/libdnf/dnf-repo.cpp
> ++++ b/libdnf/dnf-repo.cpp
> +@@ -69,6 +69,10 @@
> + #include <string>
> + #include <vector>
> +
> ++#if !defined(FNM_EXTMATCH)
> ++#define FNM_EXTMATCH 0
> ++#endif
> ++
> + typedef struct
> + {
> +     DnfRepoEnabled   enabled;
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix=
-compilation-with-musl.patch b/meta/recipes-devtools/libdnf/libdnf/0001-uti=
ls-utils.cpp-fix-compilation-with-musl.patch
> new file mode 100644
> index 0000000000..061e7dffbd
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compil=
ation-with-musl.patch
> @@ -0,0 +1,51 @@
> +From 699608a4c03ebbf64c1d7b6f56d9811492175daa Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Mon, 17 Nov 2025 00:05:14 +0000
> +Subject: [PATCH] utils/utils.cpp: fix compilation with musl
> +
> +The basename() function requires the libgen.h header when
> +compiling with musl-libc, otherwise it complains:
> +error: 'basename' was not declared in this scope; did you mean 'g_basena=
me'?
> +Also, musl's basename requires char* instead of const char* argument:
> +error: invalid conversion from 'const char*' to 'char*' [-fpermissive]
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/l=
ibdnf/pull/1737/commits/8720d5eeb0d348686d4c5f2ccb5a6c73d66eeff5]
> +
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +---
> + libdnf/utils/utils.cpp | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/libdnf/utils/utils.cpp b/libdnf/utils/utils.cpp
> +index f5d200b8a..501bc0ed2 100644
> +--- a/libdnf/utils/utils.cpp
> ++++ b/libdnf/utils/utils.cpp
> +@@ -9,6 +9,7 @@
> + #include <sys/stat.h>
> + #include <dirent.h>
> + #include <cstring>
> ++#include <libgen.h>
> + #include <glob.h>
> + #include <stdexcept>
> +
> +@@ -311,7 +312,7 @@ std::vector<std::string> createSortedFileList(
> +             auto * path_fname =3D basename(path);
> +             bool found{false};
> +             for (const auto & path_in_list : paths) {
> +-                if (strcmp(path_fname, basename(path_in_list.c_str())) =
=3D=3D 0) {
> ++                if (strcmp(path_fname, basename((char*)path_in_list.c_s=
tr())) =3D=3D 0) {
> +                     found =3D true;
> +                     break;
> +                 }
> +@@ -325,7 +326,7 @@ std::vector<std::string> createSortedFileList(
> +
> +     // sort all drop-in configuration files alphabetically by their nam=
es
> +     std::sort(paths.begin(), paths.end(), [](const std::string & p1, co=
nst std::string & p2) {
> +-        return strcmp(basename(p1.c_str()), basename(p2.c_str())) < 0;
> ++        return strcmp(basename((char*)p1.c_str()), basename((char*)p2.c=
_str())) < 0;
> +     });
> +
> +     return paths;
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/libdnf/libdnf/optional-check.patch b/m=
eta/recipes-devtools/libdnf/libdnf/optional-check.patch
> deleted file mode 100644
> index 9228b0560f..0000000000
> --- a/meta/recipes-devtools/libdnf/libdnf/optional-check.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From a4abd42a6b92f6aa16490c0f482bf08c4a6c2864 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Thu, 18 Sep 2025 11:23:33 +0100
> -Subject: [PATCH] Move libcheck dependency to tests/
> -
> -If we're not building the tests then there's no point in depending on
> -libcheck, so move the pkg_check_modules() call to tests/CMakeLists.
> -
> -Upstream-Status: Backport [https://github.com/rpm-software-management/li=
bdnf/commit/6a127aec78d2ef837776e0e5a8e3636101a54ab0]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - CMakeLists.txt       | 1 -
> - tests/CMakeLists.txt | 7 +++----
> - 2 files changed, 3 insertions(+), 5 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index a489ea73..d1969899 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -59,7 +59,6 @@ find_package(LibSolv 0.7.21 REQUIRED COMPONENTS ext)
> -
> -
> - # build dependencies via pkg-config
> --pkg_check_modules(CHECK REQUIRED check)
> - pkg_check_modules(GLIB REQUIRED gio-unix-2.0>=3D2.46.0)
> - include_directories(${GLIB_INCLUDE_DIRS})
> - pkg_check_modules(JSONC REQUIRED json-c)
> -diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> -index e4909682..78743f4e 100644
> ---- a/tests/CMakeLists.txt
> -+++ b/tests/CMakeLists.txt
> -@@ -1,3 +1,6 @@
> -+pkg_check_modules(CHECK REQUIRED check)
> -+pkg_check_modules(CPPUNIT REQUIRED cppunit)
> -+
> - add_subdirectory(libdnf/conf)
> - add_subdirectory(libdnf/module/modulemd)
> - add_subdirectory(libdnf/module)
> -@@ -7,10 +10,6 @@ add_subdirectory(libdnf/sack)
> - add_subdirectory(hawkey)
> - add_subdirectory(libdnf)
> -
> --
> --
> --pkg_check_modules(CPPUNIT REQUIRED cppunit)
> --
> - set(LIBDNF_TEST_SOURCES
> -     ${LIBDNF_TEST_SOURCES}
> -     ${CMAKE_CURRENT_SOURCE_DIR}/run_tests.cpp
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes=
-devtools/libdnf/libdnf_0.75.0.bb
> similarity index 85%
> rename from meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
> rename to meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
> index 720e7d6e6f..ddcbc7d9ff 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
> @@ -9,16 +9,19 @@ SRC_URI =3D "git://github.com/rpm-software-management/l=
ibdnf;branch=3Ddnf-4-master;p
>             file://0001-Get-parameters-for-both-libsolv-and-libsolvext-li=
bdn.patch \
>             file://0001-drop-FindPythonInstDir.cmake.patch \
>             file://armarch.patch \
> -           file://optional-check.patch \
> +           file://0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-=
und.patch \
> +           file://0001-utils-utils.cpp-fix-compilation-with-musl.patch \
>             "
>
> -SRCREV =3D "91a0bf9aada36a722855051526f012e0b5ab1af9"
> +SRCREV =3D "d39573195e24b43687587a8d83b9f6ac274e2412"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
>
>  DEPENDS =3D "glib-2.0 libsolv librepo rpm libmodulemd json-c swig-native=
 util-linux"
>
>  inherit cmake pkgconfig setuptools3-base gettext
>
> +COMPATIBLE_HOST_libc-musl =3D 'null'
> +
>

The syntax is wrong. Is this needed after patches added above as well?

