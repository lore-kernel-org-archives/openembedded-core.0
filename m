Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C18C79F82
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 22:56:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1311.1788562587956026781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 15:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VVGwNFCT;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=g0x0UsZc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kb4Wh1224635
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Sep 2026 22:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xIdtM7PjbP15rgRTNpdJSaMs
	0mt+LaiZvK0mN2HXnJ0=; b=VVGwNFCT2QfZmsQuPtdERw/g6H9XEQL8NXAHMWGo
	JYnWvX+t8pCX9BWXAxMJ8srQmvybHV1SPz4GYhiY9Ch0CerUFpufxLDdxaUXiwyd
	bRU/YlErj5/Uz2D3L2yPTmlQkWzgjGYRMLHummjGwmh3lVB9SYYkn99S6dkYzevb
	Onh7N1VbhVXXYLPtnduNDD99cYxqrqz+kfCz1Vzl0+LrF/Ca7eM1RRChpqdO45pk
	uooYdC51+klsDTNSCB4Bsf+MFgm9QMYvt679AHdqMGQYpj1mxKSwtR99vzaROsXa
	8GalapZvfUADvGjB28WkXK06H+4xYM7E3TyjxQYhHgNeKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg010a209-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 22:56:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9382f9430deso263622185a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 15:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788562585; cv=none;
        d=google.com; s=arc-20260327;
        b=RJqlCgZ49hNiMhCklifcbSvmWYEP6wUDlsMOzTnKkylbs75qH2e3M/ILtRfy3ZlFeM
         mwQcS4Ezp13/nCtAOB03jb+Ap9s+ZNIKLxks6tD6peO/D06pmw1as7SgB8Y0zn1boQBf
         T2LizmPqsZverCU8Y+sJNNpTOndiNTItjgv5FFBr/1eO+2P/gSLG0dtL/AjEdr7BcSVj
         m9U3Qx3J6OmJYWh59Uiu75DbvfKa6Stt7hmOeg7Gcv2k7nVT+4KOAOVUxQsviAXzc1ZX
         swc9jNw3qY1/nr3pRvRePMsZ7V2zS7MMmXk98PQHEl9L1q8qfyL2ZdJxcWJTmL1G310s
         DvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xIdtM7PjbP15rgRTNpdJSaMs0mt+LaiZvK0mN2HXnJ0=;
        fh=/rLl7ylTmdlN6QHM+oSI9Dp6uZYrsEM7ZfnyO+586G8=;
        b=jBMc0Olb/nrGLzWnZ2XHs5yVxb+L8RHexV5Fx6jE5gPoIpIIAaJ0qoBez2JbB9bv0+
         oNn2X9HepPQfK6FMPQY6Sn1YPQYQvzZxtWG+0jL4t3VNvDukTz3jzGxi8MFB3j4+vCgx
         kU7yi8OJBVxWYBrWFZPSVNeyZdE3VTxK+JW/5oAO1hvEUHdr0mwtg6MFKSQOTbs13Qu7
         0la5n0ejkTvRO9PCk0ZzCVU7dIsWuyKxKdGfW9J2U3Mc/2AiwdzJ0XLO4gqVyYWl21Mg
         LIWxw5cOmjd7YpRbXobKqaN67X/8pYQ8um8QX0M15Jly0eszY/kACLZ58n3vd8Yp4CGf
         tUqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788562585; x=1789167385; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIdtM7PjbP15rgRTNpdJSaMs0mt+LaiZvK0mN2HXnJ0=;
        b=g0x0UsZcpcp7hdgdKsCmHjhR3zL99HioR3Dc5NHyIoZ9enFtdRYq5UZA1Ma+G5pWtT
         CKNz4/ZgyqhsikK5zcv91GGegwfHmTRrg45sCpAZ5fOnKrwPs0b3pTb6b7fV9uXWEm7O
         JqR0iVt5aUBfAAEWMabStlrAeTEarXBtir7lQ09G2BDPKj+FiAyG+QzAIPIdZmaWStYG
         in9z0FDo6P/6MACwtWEsq18SqANQr0piUJCRVcqDPHf7tI5PZAyo4FF6setCtBFfq6xw
         Symn27WqOvLsR98LtwJVTHuOif1Zj8U+FfJpStnDPFo3DF5h1p2XOAanVQaevtVSgP0y
         ibjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562585; x=1789167385;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xIdtM7PjbP15rgRTNpdJSaMs0mt+LaiZvK0mN2HXnJ0=;
        b=EdYQyTRhMuoO2yJ0PlCUVSLxJaax4fwf+huNIQvZ4C+s9oDi6IoSQFWHEYZiuNrH9q
         BmBbpDNUxtiUGREU9NqL7uA+fDpbASHRwcuC19eUaldFsvhr8UgjqBXuW6NWVxCiKXIN
         uyYQS3gO1SOIX9hpK+BCwQOPi5NiQliihMpMG0aJS6sb/en412mE3ruqwofnD52F9Tht
         ba0mPlcPZc7bYUOH4vFCKw7tV2oG0Gu4GSeAna7gIamCNdvTgo2Mu3HNs/IfZpuqfc7b
         psEym8WsEUFyrztDmDg7KQ3/anVUlwBMn1a/C/tXS/QEEBMC7r5Tlpp0NQGfhmxgDsdh
         1uXw==
X-Gm-Message-State: AFuF++kyx4b2NlYAM9VLfR7tJ9Q09izox2nlgR5aez9uXra6FFwm0gW9
	UDpQLubi6GKc6jkNzmCV2+kKjyxXjlXFE+NeVaprJ7zFnIB7YW2kMznPjZfg098iCIXduSfJfwi
	OIVO50r6hbIKNDa0oZgmZzZBkv3k+3WupEjw/n8+TdwgzbrNQuhmlmF5j72jOdCsD8Dy8Po00FH
	HIl2KMHz1ERV2Se5WUfEyFdcVqMBBV+r8Wc+3y12NnCiclsA9EuWo2VD0y3w==
X-Gm-Gg: AYBFou20U88usikxJZua7D9oF6jxqr2D3L9PI5D2EaOnjwHYyb1wF8Kn/plpM4Cdm2s
	2l/xKDhxchVWDU9DS1ZaYh45sueRX7/Qi9kouUeVsiR3guJC2JEzKa+7YtGO1GLjIV7MuOZmone
	wNX2NotZTX0hfvhTGLkqro8UsyfqmbVCL4qWmbEJzmua7BhInltw3hGUs8wHU=
X-Received: by 2002:a05:620a:7111:b0:939:7cef:2bc7 with SMTP id af79cd13be357-939804b4413mr993890085a.45.1788562585522;
        Fri, 04 Sep 2026 15:56:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7111:b0:939:7cef:2bc7 with SMTP id
 af79cd13be357-939804b4413mr993884885a.45.1788562584975; Fri, 04 Sep 2026
 15:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260904080004.2501262-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260904080004.2501262-1-HimaniRamesh.Barde@windriver.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 23:56:14 +0100
X-Gm-Features: AcwNN1W6oyMdDFLlUijNjHWUSlYTmIkk2-akZhieO1X9LHiHrGzk3xGpRL_m_uw
Message-ID: <CADWMC-a4S4RFOS8u2bq3FWp6rLwg8gz_zTgb-qbU4t1V3WjAPg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] systemd: re-enable ptest support
To: HimaniRamesh.Barde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        ross.burton@arm.com
Content-Type: multipart/alternative; boundary="000000000000894f76065ab02d45"
X-Proofpoint-ORIG-GUID: CEvlxG_zu_2LUJ6U2I9iyQBBdDUWPKEI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDIxMyBTYWx0ZWRfX+T5wTUJlnNn8
 yBZ8ctlMSqOxNUPArD9bl1udRfv+2WpBjKxI1pf6Hr3LDXCPM3Aa8+btTWWCgdBM5y4dSqXt18D
 acoQ4WCSk0+fh6f9cSmUQ5UKVC1sW1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDIxMyBTYWx0ZWRfX3fVqSdk5oLtT
 wLwzwdRovdToDlZRTLZSsp/O1RdYxR9udg7e/t2W7XW0pcVHWzshCHYYrY+4zz9utw2Ff2r49rT
 Jqw2Tu12xiWzEAIqX9Ximxl2l172jnvJ9BFVHGrcR/VUy5X2y8bA2Qqq6mIznLWCV8/X8gUvVHf
 RAyDMGOR7sGNOD4LLt9R8YJnwLKVFp5AKkwpcpeIuyWS1o/4iYGrGUAQ0UvL4hBGzLFIDnHxCQo
 a4EPZzEdxs0fjkIBQiCpEXJL1TURWEQO44V9NXXpUdSn5/kcBEE7QU08Yqn28IIKKyZokmwsojU
 e838mpckpv7y8KwGg/XY8gre9aOld4oYn5DEAnId8hqze5YUembe2BkU8YaoSlxyavZUdAJML0D
 4JzZh3ebdDSizke/IxCNzVDQpkRGqiBKA9OFzO2USNezGUMoa6QqnLhKQLEcbUZFgB9E1ZSFFP1
 OUZDOafuqYBQ9LVIwKQ==
X-Authority-Analysis: v=2.4 cv=Zp7d7d7G c=1 sm=1 tr=0 ts=6a9b4c9a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=GhQEx97vAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8
 a=s-0nl9G3PniGyjDEWX0A:9 a=QEXdDO2ut3YA:10 a=ygfikJQSAAAA:8
 a=-rGjSfZCEIhsc_kMMYcA:9 a=2uTYrTZCLbQRG8c7:21 a=lqcHg5cX4UMA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=rfsfOhzgo-V0TFs3tIRs:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: CEvlxG_zu_2LUJ6U2I9iyQBBdDUWPKEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040213
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 22:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245130

--000000000000894f76065ab02d45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:01=E2=80=AFPM Himani Ramesh Barde via
lists.openembedded.org <HimaniRamesh.Barde=3D
windriver.com@lists.openembedded.org> wrote:

> ptest support for systemd was dropped in 2018 (commit 906230a73b3c) when
> the recipe switched to meson, as there was no easy way to install and run
> the test suite. Current systemd and meson resolve this: the meson
> 'install-tests' option installs the unit-test binaries and a
> run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and
> run-unit-tests.py already emits PASS:/SKIP: results per test.
>
> Enable install-tests, package the installed tree into systemd-ptest, and
> add a run-ptest wrapper that drives run-unit-tests.py. This provides ptes=
t
> coverage for the systemd:test and libsystemd meson unit-test suites.
>
> The test/units integration tests, which require a booted system, are out
> of scope here and can be addressed separately.
>
> Verified on systemd 257.6: -Dinstall-tests=3Dtrue installs 313 test-*
> unit-test binaries plus run-unit-tests.py; systemd-ptest packages cleanly=
.
> The recipe change parses without error against oe-core master (261.2).
>
> [YOCTO #16386]
>
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd/run-ptest | 11 +++++++++++
>  meta/recipes-core/systemd/systemd_261.2.bb  | 18 +++++++++++++++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-core/systemd/systemd/run-ptest
>
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
> index 80e1aa07d1..dfd2b7c0c9 100644
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

indentation


>             "
>
>  PAM_PLUGINS =3D " \
> @@ -937,3 +938,18 @@ python do_warn_musl() {
>          bb.warn("Using systemd with musl is experimental, see
> https://github.com/systemd/systemd/blob/9ca4334/NEWS#L524 for details")
>  }
>  addtask warn_musl before do_configure
> +
> +# ptest support: systemd's meson 'install-tests' option installs the
> unit-test
> +# binaries and run-unit-tests.py under ${prefix}/lib/systemd/tests.
> Package them
> +# into systemd-ptest and drive them via run-ptest. [YOCTO #16386]
> +EXTRA_OEMESON:append =3D " -Dinstall-tests=3Dtrue"
>

This should go in PACKAGECONFIG and condition to PTEST_ENABLED because
ptest is
not enabled in all builds. Something like
"${@bb.utils.contains('PTEST_ENABLED',
'1', 'tests', '', d)}
and then select it with PACKAGECONFIG[tests] =3D "-Dinstall-tests=3Dtrue,
-Dinstall-tests=3Dfalse"

+
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    if [ -d ${D}${prefix}/lib/systemd/tests ]; then
> +        cp -r ${D}${prefix}/lib/systemd/tests/* ${D}${PTEST_PATH}/
> +    fi
> +}
>

This part also seems redundant; if you say the tests are installed with
"-Dinstall-tests=3Dtrue",
it shouldn't be necessary to do this.

Jose


> +
> +RDEPENDS:${PN}-ptest +=3D "${PN} python3-core bash"
> +INSANE_SKIP:${PN}-ptest +=3D "dev-deps debug-files"
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245116):
> https://lists.openembedded.org/g/openembedded-core/message/245116
> Mute This Topic: https://lists.openembedded.org/mt/121086003/10043485
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000894f76065ab02d45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 4, =
2026 at 3:01=E2=80=AFPM Himani Ramesh Barde via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;HimaniRamesh.Barde=3D<a href=
=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">ptest support for systemd was dropped in 2018 (commit 906230a73b=
3c) when the recipe switched to meson, as there was no easy way to install =
and run the test suite. Current systemd and meson resolve this: the meson &=
#39;install-tests&#39; option installs the unit-test binaries and a run-uni=
t-tests.py runner under ${prefix}/lib/systemd/tests, and run-unit-tests.py =
already emits PASS:/SKIP: results per test.<br>
<br>
Enable install-tests, package the installed tree into systemd-ptest, and ad=
d a run-ptest wrapper that drives run-unit-tests.py. This provides ptest co=
verage for the systemd:test and libsystemd meson unit-test suites.<br>
<br>
The test/units integration tests, which require a booted system, are out of=
 scope here and can be addressed separately.<br>
<br>
Verified on systemd 257.6: -Dinstall-tests=3Dtrue installs 313 test-* unit-=
test binaries plus run-unit-tests.py; systemd-ptest packages cleanly. The r=
ecipe change parses without error against oe-core master (261.2).<br>
<br>
[YOCTO #16386]<br>
<br>
Signed-off-by: Himani Ramesh Barde &lt;<a href=3D"mailto:HimaniRamesh.Barde=
@windriver.com" target=3D"_blank">HimaniRamesh.Barde@windriver.com</a>&gt;<=
br>
---<br>
=C2=A0meta/recipes-core/systemd/systemd/run-ptest | 11 +++++++++++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_261.2.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_261.2.bb</a>=C2=A0 | 18 +++++++++++++=
++++-<br>
=C2=A02 files changed, 28 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100755 meta/recipes-core/systemd/systemd/run-ptest<br>
<br>
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
index 80e1aa07d1..dfd2b7c0c9 100644<br>
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
+file://run-ptest \<br></blockquote><div><br></div><div>indentation</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PAM_PLUGINS =3D &quot; \<br>
@@ -937,3 +938,18 @@ python do_warn_musl() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Using systemd with musl is =
experimental, see <a href=3D"https://github.com/systemd/systemd/blob/9ca433=
4/NEWS#L524" rel=3D"noreferrer" target=3D"_blank">https://github.com/system=
d/systemd/blob/9ca4334/NEWS#L524</a> for details&quot;)<br>
=C2=A0}<br>
=C2=A0addtask warn_musl before do_configure<br>
+<br>
+# ptest support: systemd&#39;s meson &#39;install-tests&#39; option instal=
ls the unit-test<br>
+# binaries and run-unit-tests.py under ${prefix}/lib/systemd/tests. Packag=
e them<br>
+# into systemd-ptest and drive them via run-ptest. [YOCTO #16386]<br>
+EXTRA_OEMESON:append =3D &quot; -Dinstall-tests=3Dtrue&quot;<br></blockquo=
te><div><br></div><div>This should=C2=A0go in PACKAGECONFIG and condition=
=C2=A0to PTEST_ENABLED because ptest is</div><div>not enabled in all=C2=A0b=
uilds. Something like=C2=A0<span style=3D"background-color:transparent">&qu=
ot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &#39;tests&#3=
9;, &#39;&#39;, d)}</span></div><div>and then select it with=C2=A0<span sty=
le=3D"background-color:transparent">PACKAGECONFIG[tests] =3D &quot;-Dinstal=
l-tests=3Dtrue, -Dinstall-tests=3Dfalse&quot;</span></div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 if [ -d ${D}${prefix}/lib/systemd/tests ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -r ${D}${prefix}/lib/systemd/tests/* ${D}${=
PTEST_PATH}/<br>
+=C2=A0 =C2=A0 fi<br>
+}<br></blockquote><div><br>This part also seems redundant; if you say the =
tests are installed with &quot;-Dinstall-tests=3Dtrue&quot;,</div><div>it s=
houldn&#39;t be necessary to do this.</div><div><br></div><div>Jose</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;${PN} python3-core bash&quot;<br>
+INSANE_SKIP:${PN}-ptest +=3D &quot;dev-deps debug-files&quot;<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#245116): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/245116" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/245116</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121086003/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/121086003/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualcomm=
.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000894f76065ab02d45--

