Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDC1C88E73
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 08:18:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18465.1789460274486027167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 01:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WgFEEaL0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=grsg++7a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZQmU2250554
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 08:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sST9/y+NSo/nUUpdQohOcvXi
	966ZNqr9NnLcw4GhXkg=; b=WgFEEaL0VyHRLh0k2fwYH9RwBQwAHi1oG1j5ciGp
	4Dy56YPK6D1rXKukhFvQ+yXcU2qKyvJw9qQmxgGmccZklvjTsMn5vvdy2o+vSaVO
	5u/29rSkp/IqELh2S5uxZDu7BzbYP4GqNfAem7LCFtN8P7hQ8THTPxkx5ZS6/+ND
	Zq4uz57O0FD22+t9FEcQsLfuyYSEptVmM0skpcUYg02LNDKrDmc28h3kgubdVcKv
	qzr9w8cXtWdH9Rxg6G1zUnbVmZEkF8L38HEc0QkKOzYWWcnVsPqXkrQjYQfXlQ3F
	KNqVjuh4Lqo++PYd5nh0JolNXb7rJQDGX9PClxZX+niZCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye70rsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 08:17:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1b824e84so421299685a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 01:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789460272; cv=none;
        d=google.com; s=arc-20260327;
        b=ZZtfncCvgKBMnmHpCUOD+En9wvare1/ZYj5oUDI9xn5ZGr0Js+C86tzv8X+t84vOsd
         0kFhOobuZotnhF/izA0VYXk20XJJSF9Imnqez7SV2SU03uojD+uyXwUqWO7X11TZfa1B
         iAxIaqql6TFzLEdsVUozdobKt1xA88U4XFXKOWR12PO4noZXl+uPPq1hoYla5nreb0ye
         N4z4m1rfZ6dn9TkIajxwPttIR+nmSPsU40hqAJNAr3wEeJa0E5xkTy35uz/jKBPyK2IV
         NcgQOWiMHiAEIHISo83sggRU8kqy07Hhqb5Tn4wPiDpEpWajT+wl623BvvThKGB8N5vp
         ANLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sST9/y+NSo/nUUpdQohOcvXi966ZNqr9NnLcw4GhXkg=;
        fh=iza1usADmQUfHi/hAlftl5HkefGywCuuJjID874ksfM=;
        b=bEBWlndC5E+P3cQY75K472yXxq2W9rP16u223VjMNrzWCuwvSKfJIsg7WxOtEamWQ3
         12IxcIpMcp+l7+Y+Bdwx7xca8R/4Yyl6Ugkh3AN0smpYyiqSIUAl23LrNB53FyZ7qgHp
         zSC4XZul74I6PtXoRVajorXosjYVduwG0UWsdWxtXz/YjziTTv/kMBfOlRfLKgVlzhPG
         EYKFjjtiROI7U/SxHFdAjmTpdVwlkQvMq/QwJtI5dc8QciqUV+c/PY9tnarZmuqloaz2
         Ds78IM1vBQY8jZeeofQaXZoad+xECm78VYn2K7v3SBCCiHF1Nwjahy9Gaxi2a9fmoGP6
         ohHA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789460272; x=1790065072; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sST9/y+NSo/nUUpdQohOcvXi966ZNqr9NnLcw4GhXkg=;
        b=grsg++7asALcLKAWNPUi5nWcCTObwRuq2h2P5u6wd9VpXSafETM456HXmnJHAnur1x
         9H7DrtunhZ5/3i447IgTvGwg6KRGj+dQJhPEvKJVc82dyVGDE6EzJFEnAXLic2UFEa7J
         vfTW5s2tIQ4hVPcqW+cd+gHiTmfw87l42CaA9cHVkPrX6j6y45OjNh0IVbHRvxPzenSg
         hnx1r8XwPjrYdbH/T+R9thuS/hmY2E6czz5piKBx22Y4fpfSMcoKUZamcBax+K0WhR9R
         ybPK0YCdWfiFDq5SjfOwWm8aQHfJ+4N7kAnRAKbZ8ZxvKNyNLsXlrH2+8JzmaQF4Xw3S
         GhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460272; x=1790065072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sST9/y+NSo/nUUpdQohOcvXi966ZNqr9NnLcw4GhXkg=;
        b=TXebTUMEWLnzPlfYK+2VDk6vRznBrdl0NcvxSWyggZIMmP6tk8vmEwsFiOS+ngVqWN
         T+/cKBnt0DgV6f3O3UFxssNcKW/8lpgfr2skDnq+u7nnspHMkSXXVPE/Z8UhUjMWQVSG
         qsOl33P5gm0cTJ7zZ2CdWA1tRfRBpbXz+muKC80rcz6QuMvs1Znv6VwTejqCOJjkF1RE
         bFSxcBmPMLYhvAX2jeVL4GH9gtU+M+ySQlWOVQhOKLRB9Tx/4asPmWTas395XqXjIhmm
         TWJMaRksWAnhpQNCvcNZT3/rX512lc5ut/SutIJEHZVkHzGxbbJxH1KZRcL6FfpROwsO
         zwQA==
X-Gm-Message-State: AFuF++nSkJ0MIjGt5tt2qielcEzCsIebO05gzIvKUnb37pLuJZWzHDw6
	h3Ufv8ljQdvZ3O23Tl1IBNLSX4XSNpFWOJIbGqmgWDATfIvHIp7hh1/sKzoPOvwNBO96F1qYYKJ
	g5emi+xCCu0WLCrW+UWo7A+Ftl89wx6ovYY3uY8HJBeveExescIOc5gC8U0gP6urOj1Ck7EqPZp
	40nHsDLjdJgDUm5IYnrlPQ84jTVBzIewMYAM4Fv8Kk3Y2ldXOe8u3zjpIAEQ==
X-Gm-Gg: AYBFou3mtEp/pq0WNjvEtEnqlLCHjZpIviqOVaAIL/zRC/1tV/wJEyrAOaDJxjUqcmp
	si9ILUiz2RRChugD3SBymGkPtBn0esEi5r647RduPq0xuvDip/JwObfD29oqZ2qY5wXC5MehS53
	2vhxXUVtvTS3QnO+KlG8Z04OOLS6RmJgu7xQMJFriWzg5W/XwNXm3nrsq0pOw=
X-Received: by 2002:a05:620a:3727:b0:939:9f51:29a0 with SMTP id af79cd13be357-93a29a8fe24mr933723985a.50.1789460272487;
        Tue, 15 Sep 2026 01:17:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3727:b0:939:9f51:29a0 with SMTP id
 af79cd13be357-93a29a8fe24mr933716885a.50.1789460271589; Tue, 15 Sep 2026
 01:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260909085518.640950-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260909085518.640950-1-HimaniRamesh.Barde@windriver.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 09:17:40 +0100
X-Gm-Features: AcwNN1WEIIoyQOY4EZFwSnF4ewB0RO-WduF3KkT9TeaSwek0Dg_Nc2kEFLdqYWY
Message-ID: <CADWMC-a=HbUnve0KALJ3TdCUE+Ef_hgNzHK-mLjdA495CvLv=g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4] systemd: re-enable ptest support
To: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com, Randy.MacLeod@windriver.com,
        ross.burton@arm.com, raj.khem@gmail.com,
        richard.purdie@linuxfoundation.org, Shiva.Komati@windriver.com
Content-Type: multipart/alternative; boundary="000000000000d408bf065b812f35"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNyBTYWx0ZWRfX4bbRdlexnOlP
 stYhajIGvDyxd7XWnpBddyTvBCILuNqjkHWaSI6evf1BDHIV1SSvlDgA5LcDxSSms20V3F2d8sd
 Ap0Bgy/9rE6+WTbroF1zaNDXqlQUA2PzBlqgyfKm0XJB5O/CFkWbSMGUQKKhmgTomRewpPJtnMj
 W8YO0zQWir8QkOWZBwYN9r/8fh8/JH/JP8Mv+T7ecYjR38OKrZdvhU7DzVizHqB98uecYZq0jpy
 IUzP0QMXx4cbUqhkBk7XeDCup1HKrE8BKpMKHFtNkq6d3n8LMyX5RPtP35Fvgz1eqw+0uo728x8
 GwN82tb1j3ZI5PWyDtV4hHnoQE5y0ynYXdl7lPnGolhZINsocJ2ahSA4zRFQlEGAF+XutxmdlTW
 3FwegFPRTtOU96F04Q3C8sdr3Fg2hnNV3zZRPJw/qniVWzkPEUB+c1ruIkm323R2RczXFeTf+la
 o4mOvLPibdU3/OUZBRA==
X-Proofpoint-GUID: qTovyr9B1XyPX07QRCcgVhnoXvQar2i9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNyBTYWx0ZWRfX/4eWdoRL6GEL
 E6BkY3B8moqk4YWyAIsCM87VD8Scdii1B4StfAt3exgjFr5ab/wCPjgQwvsNXJMBxQFuup3sIj9
 yKkE96x1mXR3x5QVeANqdZ5XyUeJUpo=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa8ff31 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=GhQEx97vAAAA:20 a=t7CeM3EgAAAA:8 a=bRPFyGj2DOAoZfFcLfUA:9 a=QEXdDO2ut3YA:10
 a=ygfikJQSAAAA:8 a=mhUy6aM4D53TeK_FPXgA:9 a=RlQ-WVhcgilDTzfM:21
 a=lqcHg5cX4UMA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=rfsfOhzgo-V0TFs3tIRs:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: qTovyr9B1XyPX07QRCcgVhnoXvQar2i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 08:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245827

--000000000000d408bf065b812f35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Gentle ping.
It looks like this one got forgotten.

Jose

On Wed, Sep 9, 2026 at 9:55=E2=80=AFAM Himani Ramesh Barde <
HimaniRamesh.Barde@windriver.com> wrote:

> ptest support for systemd was dropped in 2018 (commit 906230a73b3c)
> when the recipe switched to meson, as there was no easy way to install
> and run the test suite. Current systemd and meson resolve this: the
> meson 'install-tests' option installs the unit-test binaries and a
> run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and
> run-unit-tests.py already emits PASS:/SKIP: results per test.
>
> Add a 'tests' PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtests
> and -Dinstall-tests and pulls in python3-pefile-native (needed to build
> the boot hwids test). do_install_ptest relocates the installed tests
> into ${PTEST_PATH} and drops the mkosi/integration-tests harness (which
> needs a booted system). A run-ptest wrapper drives run-unit-tests.py,
> and systemd is registered in ptest-packagelists.inc.
>
> The test/units integration tests, which require a booted system, are
> out of scope here and can be addressed separately.
>
> Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 342
> unit-test binaries plus run-unit-tests.py install into ${PTEST_PATH} and
> systemd-ptest packages cleanly with no QA errors.
>
> [YOCTO #16386]
>
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---
> v4:
> - Make the systemd entry in ptest-packagelists.inc conditional on the
>   'systemd' DISTRO_FEATURE via bb.utils.filter, so distros without system=
d
>   (e.g. poky) do not require systemd-ptest. Fixes the autobuilder failure
>   reported by Mathieu Dubois-Briand.
> - Fix leading-whitespace alignment of the PTEST_ENABLED and run-ptest
>   lines (Jose Quaresma).
>
> v3:
> - Move PACKAGECONFIG[tests] next to the other PACKAGECONFIG entries and
>   the PTEST_ENABLED conditional into the PACKAGECONFIG ??=3D block (Jose
>   Quaresma).
> - Drop the inline comment; details are in the commit message (Jose
>   Quaresma).
> - Fix the SRC_URI run-ptest indentation (Jose Quaresma).
> - Wrap the commit message at ~72 columns.
>
> v2:
> - Gate tests via a PACKAGECONFIG on PTEST_ENABLED (Jose Quaresma).
> - Register systemd in ptest-packagelists.inc, fixing the missing-ptest
>   QA error seen on the autobuilder (Khem Raj, Richard Purdie).
> - Add python3-pefile-native dependency (fixes boot hwids test build
>   failure). Exclude the mkosi/integration harness from the ptest package.
>  meta/conf/distro/include/ptest-packagelists.inc |  1 +
>  meta/recipes-core/systemd/systemd/run-ptest     | 11 +++++++++++
>  meta/recipes-core/systemd/systemd_261.2.bb      | 17 ++++++++++++++++-
>  3 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-core/systemd/systemd/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index ce6c0a2d76..5de3424e40 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -146,6 +146,7 @@ PTESTS_SLOW =3D "\
>      python3-numpy \
>      python3-xmltodict \
>      strace \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
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
> index 80e1aa07d1..095b123683 100644
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
> +           file://run-ptest \
>             "
>
>  PAM_PLUGINS =3D " \
> @@ -51,6 +52,7 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump
> elfutils', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} =
\
> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
>      link-udev-shared \
>      backlight \
>      binfmt \
> @@ -188,6 +190,7 @@ PACKAGECONFIG[selinux] =3D
> "-Dselinux=3Denabled,-Dselinux=3Ddisabled,libselinux,initsc
>  PACKAGECONFIG[smack] =3D "-Dsmack=3Dtrue,-Dsmack=3Dfalse"
>  PACKAGECONFIG[sysext] =3D "-Dsysext=3Dtrue, -Dsysext=3Dfalse"
>  PACKAGECONFIG[sysusers] =3D "-Dsysusers=3Dtrue,-Dsysusers=3Dfalse"
> +PACKAGECONFIG[tests] =3D "-Dtests=3Dunsafe -Dinstall-tests=3Dtrue,-Dtest=
s=3Dfalse
> -Dinstall-tests=3Dfalse,python3-pefile-native"
>  # When enabled use reproducible build timestamp if set as time epoch,
>  # or build time if not. When disabled, time epoch is unset.
>  def build_epoch(d):
> @@ -937,3 +940,15 @@ python do_warn_musl() {
>          bb.warn("Using systemd with musl is experimental, see
> https://github.com/systemd/systemd/blob/9ca4334/NEWS#L524 for details")
>  }
>  addtask warn_musl before do_configure
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    if [ -d ${D}${prefix}/lib/systemd/tests ]; then
> +        mv ${D}${prefix}/lib/systemd/tests/* ${D}${PTEST_PATH}/
> +        rm -rf ${D}${prefix}/lib/systemd/tests
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

--000000000000d408bf065b812f35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br>Gentle ping.</div><div>It looks lik=
e this one got forgotten.</div><div><br></div>Jose<div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Sep 9, 2026 at 9:55=E2=80=AFAM Himani Ramesh Barde &lt;<a href=3D"mailt=
o:HimaniRamesh.Barde@windriver.com">HimaniRamesh.Barde@windriver.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">ptest s=
upport for systemd was dropped in 2018 (commit 906230a73b3c)<br>
when the recipe switched to meson, as there was no easy way to install<br>
and run the test suite. Current systemd and meson resolve this: the<br>
meson &#39;install-tests&#39; option installs the unit-test binaries and a<=
br>
run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and<br>
run-unit-tests.py already emits PASS:/SKIP: results per test.<br>
<br>
Add a &#39;tests&#39; PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtest=
s<br>
and -Dinstall-tests and pulls in python3-pefile-native (needed to build<br>
the boot hwids test). do_install_ptest relocates the installed tests<br>
into ${PTEST_PATH} and drops the mkosi/integration-tests harness (which<br>
needs a booted system). A run-ptest wrapper drives run-unit-tests.py,<br>
and systemd is registered in ptest-packagelists.inc.<br>
<br>
The test/units integration tests, which require a booted system, are<br>
out of scope here and can be addressed separately.<br>
<br>
Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 342<br>
unit-test binaries plus run-unit-tests.py install into ${PTEST_PATH} and<br=
>
systemd-ptest packages cleanly with no QA errors.<br>
<br>
[YOCTO #16386]<br>
<br>
Signed-off-by: Himani Ramesh Barde &lt;<a href=3D"mailto:HimaniRamesh.Barde=
@windriver.com" target=3D"_blank">HimaniRamesh.Barde@windriver.com</a>&gt;<=
br>
---<br>
v4:<br>
- Make the systemd entry in ptest-packagelists.inc conditional on the<br>
=C2=A0 &#39;systemd&#39; DISTRO_FEATURE via bb.utils.filter, so distros wit=
hout systemd<br>
=C2=A0 (e.g. poky) do not require systemd-ptest. Fixes the autobuilder fail=
ure<br>
=C2=A0 reported by Mathieu Dubois-Briand.<br>
- Fix leading-whitespace alignment of the PTEST_ENABLED and run-ptest<br>
=C2=A0 lines (Jose Quaresma).<br>
<br>
v3:<br>
- Move PACKAGECONFIG[tests] next to the other PACKAGECONFIG entries and<br>
=C2=A0 the PTEST_ENABLED conditional into the PACKAGECONFIG ??=3D block (Jo=
se<br>
=C2=A0 Quaresma).<br>
- Drop the inline comment; details are in the commit message (Jose<br>
=C2=A0 Quaresma).<br>
- Fix the SRC_URI run-ptest indentation (Jose Quaresma).<br>
- Wrap the commit message at ~72 columns.<br>
<br>
v2:<br>
- Gate tests via a PACKAGECONFIG on PTEST_ENABLED (Jose Quaresma).<br>
- Register systemd in ptest-packagelists.inc, fixing the missing-ptest<br>
=C2=A0 QA error seen on the autobuilder (Khem Raj, Richard Purdie).<br>
- Add python3-pefile-native dependency (fixes boot hwids test build<br>
=C2=A0 failure). Exclude the mkosi/integration harness from the ptest packa=
ge.<br>
=C2=A0meta/conf/distro/include/ptest-packagelists.inc |=C2=A0 1 +<br>
=C2=A0meta/recipes-core/systemd/systemd/run-ptest=C2=A0 =C2=A0 =C2=A0| 11 +=
++++++++++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_261.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_261.2.bb</a>=C2=A0 =C2=A0 =C2=A0 | 17=
 ++++++++++++++++-<br>
=C2=A03 files changed, 28 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100755 meta/recipes-core/systemd/systemd/run-ptest<br>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index ce6c0a2d76..5de3424e40 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -146,6 +146,7 @@ PTESTS_SLOW =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-numpy \<br>
=C2=A0 =C2=A0 =C2=A0python3-xmltodict \<br>
=C2=A0 =C2=A0 =C2=A0strace \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#=
39;, d)} \<br>
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
index 80e1aa07d1..095b123683 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PAM_PLUGINS =3D &quot; \<br>
@@ -51,6 +52,7 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;mi=
nidebuginfo&#39;, &#39;coredump elfutils&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wi=
fi&#39;, &#39;rfkill&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x1=
1&#39;, &#39;xkbcommon&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &=
#39;tests&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0link-udev-shared \<br>
=C2=A0 =C2=A0 =C2=A0backlight \<br>
=C2=A0 =C2=A0 =C2=A0binfmt \<br>
@@ -188,6 +190,7 @@ PACKAGECONFIG[selinux] =3D &quot;-Dselinux=3Denabled,-D=
selinux=3Ddisabled,libselinux,initsc<br>
=C2=A0PACKAGECONFIG[smack] =3D &quot;-Dsmack=3Dtrue,-Dsmack=3Dfalse&quot;<b=
r>
=C2=A0PACKAGECONFIG[sysext] =3D &quot;-Dsysext=3Dtrue, -Dsysext=3Dfalse&quo=
t;<br>
=C2=A0PACKAGECONFIG[sysusers] =3D &quot;-Dsysusers=3Dtrue,-Dsysusers=3Dfals=
e&quot;<br>
+PACKAGECONFIG[tests] =3D &quot;-Dtests=3Dunsafe -Dinstall-tests=3Dtrue,-Dt=
ests=3Dfalse -Dinstall-tests=3Dfalse,python3-pefile-native&quot;<br>
=C2=A0# When enabled use reproducible build timestamp if set as time epoch,=
<br>
=C2=A0# or build time if not. When disabled, time epoch is unset.<br>
=C2=A0def build_epoch(d):<br>
@@ -937,3 +940,15 @@ python do_warn_musl() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Using systemd with musl is =
experimental, see <a href=3D"https://github.com/systemd/systemd/blob/9ca433=
4/NEWS#L524" rel=3D"noreferrer" target=3D"_blank">https://github.com/system=
d/systemd/blob/9ca4334/NEWS#L524</a> for details&quot;)<br>
=C2=A0}<br>
=C2=A0addtask warn_musl before do_configure<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 if [ -d ${D}${prefix}/lib/systemd/tests ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${prefix}/lib/systemd/tests/* ${D}${PTE=
ST_PATH}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${prefix}/lib/systemd/tests<br>
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
</blockquote></div></div></div>

--000000000000d408bf065b812f35--

