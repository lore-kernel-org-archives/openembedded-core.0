Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABC4C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:57:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32122.1788778624632095612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lPycGEjo;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=b7yPQQeB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnPPW4064569
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Sep 2026 10:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8J0bAWAtWCwUGCOjPm82tOgO
	h2edqGDn0sudsjuHxC4=; b=lPycGEjoUVdnE960zc09nR+VeJ+kfIICWUdUyz03
	yLmbqBxVz1ZqxzDSdY5LWVDAhcpRRFSOC4EXFNgeVa2nP/yih16/Nio6vGYno1Ik
	Bbj1Hm9TJ5Jtar9z5l/0uq5YUeQoUSUVcjHteVc/oPVCxZV6N3fbA3eQ20aaTs8U
	SnQQXqC2dIEKkrs8np7wfgfm7hKafxTkfypYskOJkoaflpd4VSpLmun5w9hQkR8e
	Pe4LWWLNzBIbeuWkZypZHjHjc2ZcJO4HU9a/QHm031GQNIFSLcoxcwWxYS5rX5L3
	emiW65Ax6W/p288gyMX4HNv2adbgg4cN6YNruYYN/NSicQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86ru4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 10:57:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cc0ed09b5so33805636d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 03:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788778622; cv=none;
        d=google.com; s=arc-20260327;
        b=eTpmVodZYoSirOQHVV26YWDyAt5Qqwzf95zZ45s9D3XAHaUJ0DiP49PX4qr5rWvzkS
         L7hxkGRYVipHxLQH4IP6R122BurQOYbfbjsmA0sorkw5GT1wW2dpwMqWbvbyW4FqTARL
         5rRpTykJOCRkVBpWkZ4OUclKcvl5HRZkQCy/v49/fWrcg7FCSam02drWNt1idBMIZ1Oz
         ovSSOTRFdylsX7ssR1+Al1MY+8BZFWVVE1+M5bY0I/iRVXdg9CB72YOdpdoubcsUc741
         vh4zfQFx2gSodiQhH0weX7iSf2EHafDBOwfG28PROAkpYBk89DRYpaEdAbs5WeG0jzAS
         A0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8J0bAWAtWCwUGCOjPm82tOgOh2edqGDn0sudsjuHxC4=;
        fh=OS5lnE3Hfo0c2hVuOZk3memKWGGXcCYc0WiMFc3MjYA=;
        b=C3UtWqOgV2geYrB7f3JUqtgh/Bl7ZvP9V5Yk87MgutKeuUzSCd8Krke+JV0SWMnlJw
         tpppMLnfwdUKP/z7ouj2F5u5hOFhJNhF88Bvnd1jN9Vd83Jz+SuNyTCU8NfVmWRFGvxL
         XkQyaMk2GhcXnhGMikpTM6da/jOnqHzgWfwCL+4R4Kq1ULgGodcxZd8FHAxniqeNk0i0
         W9j10FC3sujUU8eB7OgBu8PgHvouGOBwSruvybZo0kDbTbaOOJ9+JfCCRYz/zS5ZuPbn
         gvShnlr5Te8ShZrVuQvP2bT6QU7KRBsFBGaX5ciGpwRJHdgZvZXIxAMXwCPsbUgnm9BR
         LQCg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778622; x=1789383422; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8J0bAWAtWCwUGCOjPm82tOgOh2edqGDn0sudsjuHxC4=;
        b=b7yPQQeBCOSX8k+EugtGLf+403rzuHXYnEDBvd3iSHsklT45qcKVDtysWne01IyU3q
         iW5HPSlxgawE7NYfjLRjndgZTFU1rdkVJCT/LWYWFOw7961yjDHADrYn1E6y99h8J91C
         NtFhXmZ5DTUsU+tvRMV3Hj147zwEKPHAOdBo9FIsNcbzYwApnkUrzjQ30f3SUrqHuqmr
         EsQCqsPXRhrbLAFvsH52YIo+pHm8PWapVrrbScuxsRVhXRrYgsAZK3MXwSkvssqxYDNj
         yYk/3D11dbmYJeXr+0Y8bNT2P1/mlOyjjus5a5ZdHYlvNHyjUd+Z4/DBb52GEVn5SGck
         rsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778622; x=1789383422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8J0bAWAtWCwUGCOjPm82tOgOh2edqGDn0sudsjuHxC4=;
        b=V2zKXi6aiabm6fF8w7VSLHQZIM7Yu+jJRMIMNusYtfh89ZzfX6KzM9QE+xboUZuIZ8
         l0/vapuC0BiZXyl6n07Ca34Y90SGry6qO3ZQlVOA2t8dITLfDiLkNFMhtLmZA+R8ZGWt
         uD9nSYX5qmC2lYbSofAAGgrzQLCJvp0tg8IjFa6CYyIt2IyirEVDwWRqpa1CqSllFtck
         kIbHHs01k8pvvg+Uz191EnuG8Fcbi7qWs2iWzmMGo0BblfUZW2nIjUy4Sel61VG3jNiu
         gB/5+S6bSMmzc4oFP94EgXIrpYaV7uVYYFBZSUOipFhv2A1YMKdqsOt44ROVtIHiKdXn
         GfiA==
X-Gm-Message-State: AFuF++ntk+HYMXQ1aoue9SYfNYpXLTII1sE9iDeLZ986KRkPTUqLKShS
	KKIL2XJv5HYfqF9VXcKkw43sgfqnf8kNpj9NsA23UFwroSk6Nc5Z4yDpVOmfK5Q/nRA2uEEssGV
	l7df+5FR0yOFGwxydpwcpnxRU/dRWHyz1aaHwvZXsr3wkmq8vthnUtzwCQaRWw2hYgVMCP1Mpyl
	yk038OWg0XxlQ25GlVLg+ryCE2N00znnK5nw80nD7aucvkWisCN0D2ZUZ3FA==
X-Gm-Gg: AYBFou088UEJrZWCUfSr1M0JA3cHmroasAUOFLNQ/E1FBPDRFgIxKj+gfsKNxapbVvS
	zbzupeX0VeT0JbRlZTQ7L7fVAiXkgXDv0a/6dbzxDxGpq0sykTxWiHtnSXQreqY2eHmrd3xHbYC
	z8kl00EoGNs8WE+lN8qxU2QsBqUTw7cI4M1mmp/7lAF9bjE1tyl3uhJ3WE7/Q=
X-Received: by 2002:a05:6214:33ca:b0:910:3453:9011 with SMTP id 6a1803df08f44-9103f0701b4mr298354126d6.35.1788778622418;
        Mon, 07 Sep 2026 03:57:02 -0700 (PDT)
X-Received: by 2002:a05:6214:33ca:b0:910:3453:9011 with SMTP id
 6a1803df08f44-9103f0701b4mr298353796d6.35.1788778622053; Mon, 07 Sep 2026
 03:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260904080215.2501426-1-HimaniRamesh.Barde@windriver.com> <20260907080837.202307-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260907080837.202307-1-HimaniRamesh.Barde@windriver.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 11:56:50 +0100
X-Gm-Features: AcwNN1VN4XwTMt_JeN5CTR1Q3AlkmXxXommH6_IVxRbWDfQheJN22SXW4pGkBR4
Message-ID: <CADWMC-ZoiXRctqshhKkk-nD0jmS6FBj6=rYTnbzqNqPDNDOmuw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] systemd: re-enable ptest support
To: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        ross.burton@arm.com, raj.khem@gmail.com,
        richard.purdie@linuxfoundation.org, Shiva.Komati@windriver.com
Content-Type: multipart/alternative; boundary="000000000000597a84065ae27aed"
X-Proofpoint-GUID: vxVOScCw1sz36RG7EQN0-K5N5Z0cNjdt
X-Proofpoint-ORIG-GUID: vxVOScCw1sz36RG7EQN0-K5N5Z0cNjdt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfX1qT4pO7lMFnt
 g6WGJDQT3TEr1NDTLTGM7v+z+/vpq/71MIB3PvYC2bRhivZMpbmcddjBgiqVk6RdH43hiI5FGqN
 62+smIGZlY0jXTin3oh4z4BU1Vyq6CI=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e987f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=GhQEx97vAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=bRPFyGj2DOAoZfFcLfUA:9
 a=QEXdDO2ut3YA:10 a=ygfikJQSAAAA:8 a=tjuFXTvfhPsJCo5rsE0A:9
 a=66WgNaRIwHSHOBTE:21 a=lqcHg5cX4UMA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=rfsfOhzgo-V0TFs3tIRs:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfX8P5N8uPhGXWW
 StyidQXbkI0t535SpB/q1XiUHsmdRoQGTwBvndwKyNGwBHFxd+e2glaerZCu9vSj2QLnUeX4xR6
 0baTr46AGNAlpAiFGYnwnEC18eT7VBqQCHPzNGJcn2Ol66CJuwBhLMzTtbblD96sHMVdTnbSl2k
 cJegfZFxGr8ouFVj3HOdLDavogucib37+ENG8MoeGSgy9hzzILKOuod7T3ZWMr9GQFHuTK60K81
 pCuPGPqNwnoNcz0JqEyL3rYyd4UARkE+Df7HpBwtGMVnG1/m+eFawLJJmpbGVf1JP9phWh0R0jd
 OJ5ndH0DOUmkJfjQQvyGa0H1CwPIJ+c9kNeAoLOhZZiv5Y1sgijd3+VuyTEZWlvSdty889Inya7
 zd6n3BkZ1Ad3bHU6KuAZs/p5SkddkcKEXPEvt1D3nJx+nBBACbEjIdsslQlOYVqUdqDgnroA1oa
 TAzdKovrMUiF4PNqydA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 10:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245247

--000000000000597a84065ae27aed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Himani,

On Mon, Sep 7, 2026 at 9:09=E2=80=AFAM Himani Ramesh Barde <
HimaniRamesh.Barde@windriver.com> wrote:

> ptest support for systemd was dropped in 2018 (commit 906230a73b3c) when
> the recipe switched to meson, as there was no easy way to install and run
> the test suite. Current systemd and meson resolve this: the meson
> 'install-tests' option installs the unit-test binaries and a
> run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and
> run-unit-tests.py already emits PASS:/SKIP: results per test.
>
> Add a 'tests' PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtests and
> -Dinstall-tests and pulls in python3-pefile-native (needed to build the
> boot hwids test). do_install_ptest relocates the installed tests into
> ${PTEST_PATH} and drops the mkosi/integration-tests harness (which needs =
a
> booted system). A run-ptest wrapper drives run-unit-tests.py, and systemd
> is registered in ptest-packagelists.inc.
>
> The test/units integration tests, which require a booted system, are out
> of scope here and can be addressed separately.
>
> Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 342
> unit-test binaries plus run-unit-tests.py install into ${PTEST_PATH} and
> systemd-ptest packages cleanly with no QA errors.
>

Please try to keep the commit message to approximately 72 characters per
line.


>
> [YOCTO #16386]
>
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---
> v2:
> - Gate tests via a PACKAGECONFIG on PTEST_ENABLED (Jose Quaresma).
> - Drop the redundant copy; relocate installed tests into ${PTEST_PATH}
>   (Jose Quaresma).
> - Register systemd in ptest-packagelists.inc, fixing the missing-ptest QA
>   error seen on the autobuilder (Khem Raj, Richard Purdie).
> - Add python3-pefile-native dependency (fixes boot hwids test build
> failure).
> - Exclude the mkosi/integration-test harness from the ptest package.
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-core/systemd/systemd/run-ptest   | 11 ++++++++++
>  meta/recipes-core/systemd/systemd_261.2.bb    | 21 ++++++++++++++++++-
>  3 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-core/systemd/systemd/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index ce6c0a2d76..4697843555 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -146,6 +146,7 @@ PTESTS_SLOW =3D "\
>      python3-numpy \
>      python3-xmltodict \
>      strace \
> +    systemd \
>      tar \
>      tcl \
>      tcl8 \
> diff --git a/meta/recipes-core/systemd/systemd/run-ptest
> b/meta/recipes-core/systemd/systemd/run-ptest
> new file mode 100755
> index 0000000000..b2204b96d4
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/run-ptest
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +# Run systemd's installed meson unit tests in ptest format.
> +# systemd's -Dinstall-tests=3Dtrue installs run-unit-tests.py plus the
> +# unit-tests/test-* binaries; run-unit-tests.py already emits PASS:/SKIP=
:
> lines.
> +set -u
> +here=3D"$(cd "$(dirname "$0")" && pwd)"
> +for cand in "$here/run-unit-tests.py" "$here/tests/run-unit-tests.py"
> /usr/lib/systemd/tests/run-unit-tests.py; do
> +    [ -f "$cand" ] && { python3 "$cand" 2>&1; exit 0; }
> +done
> +echo "FAIL: systemd-ptest (run-unit-tests.py not found)"
> +exit 1
> diff --git a/meta/recipes-core/systemd/systemd_261.2.bb
> b/meta/recipes-core/systemd/systemd_261.2.bb
> index 80e1aa07d1..3e04bd803c 100644
> --- a/meta/recipes-core/systemd/systemd_261.2.bb
> +++ b/meta/recipes-core/systemd/systemd_261.2.bb
> @@ -9,7 +9,7 @@ DEPENDS:append:libc-musl =3D " libucontext"
>
>  SECTION =3D "base/shell"
>
> -inherit useradd pkgconfig meson perlnative update-rc.d
> update-alternatives systemd gettext bash-completion manpages features_che=
ck
> mime
> +inherit useradd pkgconfig meson perlnative update-rc.d
> update-alternatives systemd gettext bash-completion manpages features_che=
ck
> mime ptest
>
>  # unmerged-usr support is deprecated upstream, taints the system and wil=
l
> be
>  # removed in the near future. Fail the build if it is not enabled.
> @@ -37,6 +37,7 @@ SRC_URI +=3D " \
>             file://systemd-pager.sh \
>
> file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>             file://0003-Do-not-create-var-log-README.patch \
> +file://run-ptest \
>

Please fix the indentation.


>             "
>
>  PAM_PLUGINS =3D " \
> @@ -937,3 +938,21 @@ python do_warn_musl() {
>          bb.warn("Using systemd with musl is experimental, see
> https://github.com/systemd/systemd/blob/9ca4334/NEWS#L524 for details")
>  }
>  addtask warn_musl before do_configure
> +
> +# ptest support. systemd's meson 'install-tests' option installs the
> unit-test
> +# binaries and run-unit-tests.py under ${prefix}/lib/systemd/tests. Gate
> it on
> +# ptest being enabled and package the installed tree. [YOCTO #16386]
>

I think this comment could be dropped and moved to the commit message.


> +PACKAGECONFIG[tests] =3D "-Dtests=3Dunsafe -Dinstall-tests=3Dtrue,-Dtest=
s=3Dfalse
> -Dinstall-tests=3Dfalse,python3-pefile-native"
>

Any special reason to not put the PACKAGECONFIG[tests] along with the
others?
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/syste=
md/systemd_261.2.bb#n110


> +PACKAGECONFIG:append =3D " ${@bb.utils.contains('PTEST_ENABLED', '1',
> 'tests', '', d)}"
>

The bb.utils.contains fits better along with the others?
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/syste=
md/systemd_261.2.bb#n52

Jose


> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    if [ -d ${D}${prefix}/lib/systemd/tests ]; then
> +        mv ${D}${prefix}/lib/systemd/tests/* ${D}${PTEST_PATH}/
>
+        rm -rf ${D}${prefix}/lib/systemd/tests
> +    fi
> +    rm -rf ${D}${PTEST_PATH}/mkosi ${D}${PTEST_PATH}/integration-tests
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "python3-core bash"
> +INSANE_SKIP:${PN}-ptest +=3D "dev-deps debug-files"
> --
> 2.54.0
>
>

--000000000000597a84065ae27aed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Himani,<br></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep =
7, 2026 at 9:09=E2=80=AFAM Himani Ramesh Barde &lt;<a href=3D"mailto:Himani=
Ramesh.Barde@windriver.com">HimaniRamesh.Barde@windriver.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">ptest support f=
or systemd was dropped in 2018 (commit 906230a73b3c) when the recipe switch=
ed to meson, as there was no easy way to install and run the test suite. Cu=
rrent systemd and meson resolve this: the meson &#39;install-tests&#39; opt=
ion installs the unit-test binaries and a run-unit-tests.py runner under ${=
prefix}/lib/systemd/tests, and run-unit-tests.py already emits PASS:/SKIP: =
results per test.<br>
<br>
Add a &#39;tests&#39; PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtest=
s and -Dinstall-tests and pulls in python3-pefile-native (needed to build t=
he boot hwids test). do_install_ptest relocates the installed tests into ${=
PTEST_PATH} and drops the mkosi/integration-tests harness (which needs a bo=
oted system). A run-ptest wrapper drives run-unit-tests.py, and systemd is =
registered in ptest-packagelists.inc.<br>
<br>
The test/units integration tests, which require a booted system, are out of=
 scope here and can be addressed separately.<br>
<br>
Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 342 uni=
t-test binaries plus run-unit-tests.py install into ${PTEST_PATH} and syste=
md-ptest packages cleanly with no QA errors.<br></blockquote><div><br>Pleas=
e try to keep the commit message to approximately 72 characters per line.<b=
r>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[YOCTO #16386]<br>
<br>
Signed-off-by: Himani Ramesh Barde &lt;<a href=3D"mailto:HimaniRamesh.Barde=
@windriver.com" target=3D"_blank">HimaniRamesh.Barde@windriver.com</a>&gt;<=
br>
---<br>
v2:<br>
- Gate tests via a PACKAGECONFIG on PTEST_ENABLED (Jose Quaresma).<br>
- Drop the redundant copy; relocate installed tests into ${PTEST_PATH}<br>
=C2=A0 (Jose Quaresma).<br>
- Register systemd in ptest-packagelists.inc, fixing the missing-ptest QA<b=
r>
=C2=A0 error seen on the autobuilder (Khem Raj, Richard Purdie).<br>
- Add python3-pefile-native dependency (fixes boot hwids test build failure=
).<br>
- Exclude the mkosi/integration-test harness from the ptest package.<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0meta/recipes-core/systemd/systemd/run-ptest=C2=A0 =C2=A0| 11 ++++++++=
++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_261.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_261.2.bb</a>=C2=A0 =C2=A0 | 21 ++++++=
++++++++++++-<br>
=C2=A03 files changed, 32 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100755 meta/recipes-core/systemd/systemd/run-ptest<br>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index ce6c0a2d76..4697843555 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -146,6 +146,7 @@ PTESTS_SLOW =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-numpy \<br>
=C2=A0 =C2=A0 =C2=A0python3-xmltodict \<br>
=C2=A0 =C2=A0 =C2=A0strace \<br>
+=C2=A0 =C2=A0 systemd \<br>
=C2=A0 =C2=A0 =C2=A0tar \<br>
=C2=A0 =C2=A0 =C2=A0tcl \<br>
=C2=A0 =C2=A0 =C2=A0tcl8 \<br>
diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-cor=
e/systemd/systemd/run-ptest<br>
new file mode 100755<br>
index 0000000000..b2204b96d4<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/run-ptest<br>
@@ -0,0 +1,11 @@<br>
+#!/bin/sh<br>
+# Run systemd&#39;s installed meson unit tests in ptest format.<br>
+# systemd&#39;s -Dinstall-tests=3Dtrue installs run-unit-tests.py plus the=
<br>
+# unit-tests/test-* binaries; run-unit-tests.py already emits PASS:/SKIP: =
lines.<br>
+set -u<br>
+here=3D&quot;$(cd &quot;$(dirname &quot;$0&quot;)&quot; &amp;&amp; pwd)&qu=
ot;<br>
+for cand in &quot;$here/run-unit-tests.py&quot; &quot;$here/tests/run-unit=
-tests.py&quot; /usr/lib/systemd/tests/run-unit-tests.py; do<br>
+=C2=A0 =C2=A0 [ -f &quot;$cand&quot; ] &amp;&amp; { python3 &quot;$cand&qu=
ot; 2&gt;&amp;1; exit 0; }<br>
+done<br>
+echo &quot;FAIL: systemd-ptest (run-unit-tests.py not found)&quot;<br>
+exit 1<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_261.2.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_261.2.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_261.2.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_261.2.bb</a><br>
index 80e1aa07d1..3e04bd803c 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_261.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_261.2.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_261.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_261.2.bb</a><br>
@@ -9,7 +9,7 @@ DEPENDS:append:libc-musl =3D &quot; libucontext&quot;<br>
<br>
=C2=A0SECTION =3D &quot;base/shell&quot;<br>
<br>
-inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives=
 systemd gettext bash-completion manpages features_check mime<br>
+inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives=
 systemd gettext bash-completion manpages features_check mime ptest<br>
<br>
=C2=A0# unmerged-usr support is deprecated upstream, taints the system and =
will be<br>
=C2=A0# removed in the near future. Fail the build if it is not enabled.<br=
>
@@ -37,6 +37,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://systemd-pager.sh \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-binfmt-Don-t-install-=
dependency-links-at-install-tim.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Do-not-create-var-log=
-README.patch \<br>
+file://run-ptest \<br></blockquote><div><br>Please fix the indentation.<br=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PAM_PLUGINS =3D &quot; \<br>
@@ -937,3 +938,21 @@ python do_warn_musl() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Using systemd with musl is =
experimental, see <a href=3D"https://github.com/systemd/systemd/blob/9ca433=
4/NEWS#L524" rel=3D"noreferrer" target=3D"_blank">https://github.com/system=
d/systemd/blob/9ca4334/NEWS#L524</a> for details&quot;)<br>
=C2=A0}<br>
=C2=A0addtask warn_musl before do_configure<br>
+<br>
+# ptest support. systemd&#39;s meson &#39;install-tests&#39; option instal=
ls the unit-test<br>
+# binaries and run-unit-tests.py under ${prefix}/lib/systemd/tests. Gate i=
t on<br>
+# ptest being enabled and package the installed tree. [YOCTO #16386]<br></=
blockquote><div><br></div><div>I think this comment could be dropped and mo=
ved to the commit message.<br>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+PACKAGECONFIG[tests] =3D &quot;-Dtests=3Dunsafe -Dinstall-tests=3Dtrue,-Dt=
ests=3Dfalse -Dinstall-tests=3Dfalse,python3-pefile-native&quot;<br></block=
quote><div><span style=3D"background-color:transparent"><br>Any special rea=
son to not put the=C2=A0</span><span style=3D"background-color:transparent"=
>PACKAGECONFIG[tests]=C2=A0</span><span style=3D"background-color:transpare=
nt">along with the others?</span></div><div><a href=3D"https://git.openembe=
dded.org/openembedded-core/tree/meta/recipes-core/systemd/systemd_261.2.bb#=
n110">https://git.openembedded.org/openembedded-core/tree/meta/recipes-core=
/systemd/systemd_261.2.bb#n110</a></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+PACKAGECONFIG:append =3D &quot; ${@bb.utils.contains(&#39;PTEST_ENABLED&#3=
9;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)}&quot;<br></blockquote><di=
v><br></div><div>The bb.utils.contains=C2=A0fits better=C2=A0<span style=3D=
"background-color:transparent">along with the others?</span></div><div><a h=
ref=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes-cor=
e/systemd/systemd_261.2.bb#n52">https://git.openembedded.org/openembedded-c=
ore/tree/meta/recipes-core/systemd/systemd_261.2.bb#n52</a></div><div><br><=
/div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 if [ -d ${D}${prefix}/lib/systemd/tests ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${prefix}/lib/systemd/tests/* ${D}${PTE=
ST_PATH}/<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${prefix}/lib/systemd/tests<br>
+=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 rm -rf ${D}${PTEST_PATH}/mkosi ${D}${PTEST_PATH}/integration=
-tests<br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;python3-core bash&quot;<br>
+INSANE_SKIP:${PN}-ptest +=3D &quot;dev-deps debug-files&quot;<br>
-- <br>
2.54.0<br>
<br>
</blockquote></div></div>

--000000000000597a84065ae27aed--

