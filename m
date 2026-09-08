Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EC7C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 07:47:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2006.1788853627931795403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 00:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XAkR2q+w;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cWEkeHen;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lrbl2154237
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Sep 2026 07:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=clkTs7vpRpih5W6Hv2ugww1J
	MrB9ZFByIbwBxps73Do=; b=XAkR2q+wMMK1B3Blblvk44zl4WmA84NWVKbaEj2E
	4VKZyGHxSXCsOzc7sFnzCrASZqARch4cZiHUBM9K7uY76iBzq/fBPOuDaxzfjcsu
	mWwIuhHltM7I8pfJNBrUz8vIwdXiNI/VdFkRrk8g5wdJUJKEtJyNJOwoBr5gCXOH
	l4DMVHUxKXHpPD/KziKX/CJW75mDzlJIDF4ddwx11GXm3P0uAzyLv0KjiMJqFqN9
	bGrPbN3NV01DLycPRbaCtXFjK/JF+dvr1y0lnGEI727zpm0/0pj/ayRgs8vvCUp9
	hnIoRUbxIWRMkmyMA+fNUOSsJM3P8ZkCk0jaH3DEhNscTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwjapt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 07:47:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so749194985a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 00:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788853626; cv=none;
        d=google.com; s=arc-20260327;
        b=dBHkK37MQ7vWcFuvEVwCD1dcexswMzsRR5vygWgW04ToVHyfgNVaRbfJQnOgb26RNa
         /PK2QWpR45NqPtz/t4zaUT4mqAXZBf5fr8OMVmJXYem73XWDnf7uBaQHJd0niw3DZSRz
         5jbztjlaYrJafbf3wc+MJCAGafxAqiOvRI7Ay5YpW+Kn+W1iXEcAVfe0NZQ1lBHzDKmj
         3VPztMwFi4pxs0YpDlsabhhmxFVWKRATgU8QZCktmneeFzKy8XD0fv1TwF3VhBQ+Vgw6
         knASDVHMUTNore/zEWaxzSMjqay6NS1BJMdK2+XoUqRWvrEsIySj6Wp6nb1K6AlQ3k9l
         lBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=clkTs7vpRpih5W6Hv2ugww1JMrB9ZFByIbwBxps73Do=;
        fh=OS5lnE3Hfo0c2hVuOZk3memKWGGXcCYc0WiMFc3MjYA=;
        b=mvqVmHv28qUMZNwOV0MfpRltkXPPk1OZW34WTt+OmKhIKEgRDqzOwFoSJIyXDf0p1w
         mE0W+KfLSdNGAV722J3DRPftH+bt/iuTfOc0fATXO4PW6rb3KaeYXwKig5V6CLGsAUa7
         b8cyqJN1P0fSihfyI/nhfW+CdIjUiGw0pSjNPdsNZXW6cuRkMSlHd2wDNWfpBMEz/FLY
         6GxdfoxQ/eT6TF3Oq2UhTZto8CZhKz3cLuHxWhaNFR6leeO9B7qd9gXl73ogzu672Moq
         EacKJiNj3D2GHpEFIkJlgrbZUU08Ns/buXK7rRj04x3ylilNMs5wrFzoFAv5Que64+CM
         3ibQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788853626; x=1789458426; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clkTs7vpRpih5W6Hv2ugww1JMrB9ZFByIbwBxps73Do=;
        b=cWEkeHen2B0zdKkdbkvBbRFw9kADiHEqSY9H5Kj18u//s0EZNk0yNUq1pu61yLyk5D
         1I+Lf4gddiaW0hAgiV8S/0d1hqH+LWaCIupliXebthRNo+sYaHuedA8glCWZTBLTrlyv
         SyF4dnIhxatXzny+bp+6E0TZ20ETSlIZMz/dGJEd+5L35UUcZGiegINDnw9mbioFnO98
         nUJ7eQuruiwFnajYXLKDEAAizXXcRM+l8w8ODUmfdqci4V+tMpVukdxV715RuaKpnejE
         BwvgcQZ2vBel5dK1mKmT2ZVq+dqfMndJ1ncQfrTMRjhWifW11889tSj2e/D7xzE2J5py
         wDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853626; x=1789458426;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=clkTs7vpRpih5W6Hv2ugww1JMrB9ZFByIbwBxps73Do=;
        b=psODRvigOy9rtSOnjrX89zYxe5vgcsCedJB1NjyFN5aec0Mc2RGYmPEdzbKB6zaKjz
         dEsvPVQsqHwX/zS7w0UfC7UJv1xPwP0F+Mm2yX4KWNpNDfsv4aIirkptT8sajCkwvVvC
         gTlKc8MJ1e9K7Z5FjJXCzfCbOOj6FKKpLCsKDxfuZc05OC0G9URCnbbAoYpvKoq3zCHv
         lrSZgaxxPIgy1Q4o7K3dAdFs1ZZc/QPc65sNiUTIMp7IfsShkvzTRgXUjxahopbUoL4B
         8mp6Gybbxp5QXG/c3s7w7ympIhOXWAjZE1EwXFr1Ho8FIP1G7F7N92ecAwrKRK3kvl+l
         qDvg==
X-Gm-Message-State: AFuF++lJO38eLaQMO+6GKiWyPSKTfwvwqSOw0U0MavQMWN24j5ume7Zd
	f0KyxjwxIC/z6429PbiTr+KeuTNTx/pXHsLOLjMdiN7LQk8YHWbM0zvVnqL8GtrbweHTKUehBBm
	WBFMH/NGikcL8OaSUW2ZO+hPt4spQA1MjihD5FWr53D8NJMSFALcvqUKoEjy9jbBD36ydEyaAFB
	yEAesD0Mwwulz1DRxbSlCsbE6jh6YLLbX2YawbD/r93N96Doam+hRXotggrw==
X-Gm-Gg: AYBFou3lcklty1Bvc+X5+0gHHTHuSnaVtj2eElmtSOYgnzPX8q5BQt9b8oR0aZx+I34
	dEbKf6dICPUwm2x2jUCPegk+yYFUt3niBbaYWke/OAXMveJz1JgvrRPpb0YBP7hFOG83TMIicjC
	u0mS0HR1kzJnttOBrbVHE7Pmc5mRumXssZBEtpIoGO18T5CTtHXbsqKfbDES0=
X-Received: by 2002:a05:620a:2b91:b0:939:c39a:5e69 with SMTP id af79cd13be357-939c39a9aacmr60312885a.12.1788853625373;
        Tue, 08 Sep 2026 00:47:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:939:c39a:5e69 with SMTP id
 af79cd13be357-939c39a9aacmr60304085a.12.1788853623938; Tue, 08 Sep 2026
 00:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260907114507.294436-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260907114507.294436-1-HimaniRamesh.Barde@windriver.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 08:46:53 +0100
X-Gm-Features: AcwNN1X3eEpBCHgP1MKoHOaNjJfW6jw0KcsyMu6rHm7J9juScidTcSNpMFXiKuQ
Message-ID: <CADWMC-aJuXSA-hwiG04ywOC3QvDzuYQUAeD1ZTnOAbuUsP0Ujg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] systemd: re-enable ptest support
To: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        ross.burton@arm.com, raj.khem@gmail.com,
        richard.purdie@linuxfoundation.org, Shiva.Komati@windriver.com
Content-Type: multipart/alternative; boundary="000000000000cf88e7065af3f001"
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fbd7a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=GhQEx97vAAAA:20 a=t7CeM3EgAAAA:8 a=bRPFyGj2DOAoZfFcLfUA:9 a=QEXdDO2ut3YA:10
 a=ygfikJQSAAAA:8 a=mhUy6aM4D53TeK_FPXgA:9 a=Kqvb7YQUiP3lX5SY:21
 a=lqcHg5cX4UMA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=rfsfOhzgo-V0TFs3tIRs:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MCBTYWx0ZWRfX2WsCNkTbB0Ua
 k9DdpCol++JaCexBYLRU6YhekMQH/tqt/TPm3d/03e4WJ7MblIBknSoNl1LeMZCGaUOKGWe4udN
 LiSHYc5nrYI3BFpQpD9UNvFYRlZ3gyFXXnkSBMeh4nEgdVBUzmr2GTWNWXdG1fbLf4CNOt0exxc
 pKwjwjqc5LYkjvIsoAsSjiFdoRjXHtpPOiglebTlxNfcDWn1Vlt9IbQyAEc3Q/E9oHNUwuFyE7x
 3YnOunFVvLxZx3c4zerMQfHOMFrcKD5EMjIViEdM3QfrynuHOFoStYXN7pbxUPKgrhnwMkAeDD8
 6XFdE1wOccQW0WAKOAHTkVziYm6ZUm6dWMcbQHw80kmtL3OCw0BSC/QyrKTfKN0ChTvWs+GS8bf
 +3iOH/5I7KcPmlfjozNmjMWkzxjLyTiLk62IKGYp5vguL4fQX/DSnheHhovf+asMrt14o+dDtd/
 IBglcX8QHsSkp25Io3g==
X-Proofpoint-ORIG-GUID: Kwy8WOmYd3fUVMXIoQZ4L9z091uuYbw7
X-Proofpoint-GUID: Kwy8WOmYd3fUVMXIoQZ4L9z091uuYbw7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MCBTYWx0ZWRfXwldEVq/lTOxa
 8k1FFW21VT6Aesb5y8awkUS8g1dSgtJ2XjksLnY5llpEUgYerX+NiSwJdrfSyZF5pi8hFkk+lyK
 yrKLYMf+QLJVekOWtZ4z/k6x3kdF/kM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 07:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245335

--000000000000cf88e7065af3f001
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Himani,

The code indentation has not yet been fixed and It has a mix of spaces and
tabs.
You can see this with 'git format-patch -1' and look at the patch before
sending it.

Sorry for bothering you with these petty things.

Jose

On Mon, Sep 7, 2026 at 12:45=E2=80=AFPM Himani Ramesh Barde <
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
> index 80e1aa07d1..43c19c5edc 100644
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
> +            file://run-ptest \
>             "
>
>  PAM_PLUGINS =3D " \
> @@ -51,6 +52,7 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump
> elfutils', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} =
\
> +                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)} \
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

--000000000000cf88e7065af3f001
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Himani,</div><br>The code indentation =
has not yet been fixed and It has a mix of spaces and tabs.<br><span style=
=3D"background-color:transparent">You can see this with &#39;</span><span s=
tyle=3D"background-color:transparent">git format-patch -1&#39; and look at =
the patch before sending it.</span><div><div><br>Sorry for bothering you wi=
th these petty things.</div><div><br></div><div>Jose</div><div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Sep 7, 2026 at 12:45=E2=80=AFPM Himani Ramesh Barde &lt;<a href=
=3D"mailto:HimaniRamesh.Barde@windriver.com">HimaniRamesh.Barde@windriver.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">ptest support for systemd was dropped in 2018 (commit 906230a73b3c)<br>
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
index 80e1aa07d1..43c19c5edc 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &#39;tests&#39;, &#39=
;&#39;, d)} \<br>
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
</blockquote></div></div></div></div>

--000000000000cf88e7065af3f001--

