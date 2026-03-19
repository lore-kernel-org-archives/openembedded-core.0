Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7F11091909
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 18:19:14 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2895.1773944217730888136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 11:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RhP0+eOh;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: careers.myinfo@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-668d41905a4so76777a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773944216; cv=none;
        d=google.com; s=arc-20240605;
        b=iMoTLep8Ys9mUlvJJajBL7waDr0gChit5QpzGlmTyiBgs3oJ1GjgSsvqzzQqwsTBrP
         jK+nIJTIWkS5GDueYivcpQ2nSBOU1Eif+8aBwVL68G21TSXRNl2Xk8e6ovi+MkZ79o4k
         Jif6OovBBsi2W8KyU/GPZ6lxnZrfh0zp8Qh+Z1vwjp87RMUm3T0vxkw/5CZiViVJtg2P
         gNMC1huz69le03MMNQrM82hOaN7zAeCfcQf6FJpQflvWEz/IrhI62e23gpj30GwVK4Ki
         ZQXX+iN28Iq7KYux6s8z4BnTaG1obIGKADcua9w7mOM16D9gKniMkOKQMCcepdbFJiPW
         wtlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bzu4z9iGhLSMVvtYJafbZV34cc/ID9pjso6wHmTubhw=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=GDgGi0v0KdL8yQjOg7p3po7X7S9BASsg6G/YND3nK1e2D3R/C59IQ1gQZ9M3CdJKIQ
         YUjVcjXTyLdKM/3oB225vhb+cJ87bF1I4KOV5Cc3QP1AodF1uRRCEjLJtfFWuWDH/8xF
         btPjW11DBN9AkKHWDqpOu1z95nO4qwE+9w3baDABcOpv66JtXUwKjYiO/FBeiaPWDHX0
         RiNe+fEsL015k2ducCvDHuP5MPBQFbvYSP+N6aPLBwTcNcr4w8blac8CQdP7J7DLQPHB
         nbmsjncZqKPOdwVLDAmcRJ0BdsLcba6XE1xP5QKTFQlsGQCsB/E5E2eumrKudW8zrbik
         aQJQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944216; x=1774549016; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzu4z9iGhLSMVvtYJafbZV34cc/ID9pjso6wHmTubhw=;
        b=RhP0+eOhbf6eaJmfuI2j1NYfd1VN8P+hDZGAP+6A2D9AMYj0kzgn0LhmPViqMG5QUK
         KYALy1nYE2YACsbRjmF1hsZmbw0p/cjEUhPSMLadfrDVYC8iTyc8ozms2SzpKIfUG8Ml
         35+DavTisapjNG0/wVlx7wnCQiR5GoP1CRB1bVxQQ8a+VRxA4qp+vGSs+z0y1mw+Kd80
         WFR4pnArGJ9xFXC8ZrvxDUZH+5yWDlKLb04hhMRpl2gNrQZPcbWuWqS2aE2iYlwfcBsE
         JugYeP5rDEoNw8NvYEBDiVpAPA1J/U7ZQKybKqivs6Rbq0Huk1DwIzgLABm97Cl8a81w
         IXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944216; x=1774549016;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzu4z9iGhLSMVvtYJafbZV34cc/ID9pjso6wHmTubhw=;
        b=Uv/jMJ5XPyNmVTfhRFKEWhcz8Md1ceEEXiYCr6KhDVeRXR2nLEQE+ffG4RsICatQOP
         3jWkxSx2xZAUfWLJMncq8ivKip/Ops5cJBKkJsCB1Mkad1cvZApCWiqhuIfN+KQWhaSs
         1LSHnf1Urvdg+GpF25x/z0OnqmeXgimHDyFtxdTYDTnSCmSLJmL67tBvyBJqIW2qNok2
         Ry5IfKTXq1U6Td2+Wg9X6KtUSUmS5ofDeNA34gtSbQfeFUUljcyT6+GOlMOSEvm6eE0e
         W00yy96s7lPjyXsmpR+sDPz8PTz90QEANH4PS0m4MmKFOib7YlyNk7WhofYiaZLj/tx3
         TTYw==
X-Gm-Message-State: AOJu0Yw1I7nqe/9TcjAOsyRyiSSvuwAOb5N6SpF0cPp8GzygXGHPD9Wy
	OeByEvJn28ef7yHa+2eLZ1zHsLR5kOxisMlxxLoqS3WVLRl30jtAMdCUyh9Pli+4kBVr+1Es0P7
	THAgE248s5lfXPpPkZqDTlsJl/dp7EU44mw==
X-Gm-Gg: ATEYQzzWh5RnIioeU9NTAPtv/YMlHDPw3EhPw3e0xMvEJKWubZsbt2LFzx71IqJegDo
	zaHHmM+GIpywAyRluOPtJuZUEdgZ5Mt4/T9qTfHNtnFQUDNWIRKGpHD65F42B3IEgip9ZPWfyVO
	/prKj2ZGk0IMBfT6zVMxAQAG36JaIfZmaR3Rg7cm/b/Kev6WvzUtJAuTjQnebj+kLa084HLyXoL
	OY3G6ZzMmgGRTtDk6M4wShiwL9d2f8h45qilZ09ObpEp5y+IoV46FixxGQd19Jll5MyxQxT4Mgs
	jXmH4QwA3j8Q9KXfF5tjkynS+FbzC13vCiLj2g==
X-Received: by 2002:a05:6402:3884:b0:661:8491:6475 with SMTP id
 4fb4d7f45d1cf-668c991abcamr383872a12.18.1773944214751; Thu, 19 Mar 2026
 11:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260319181409.1689458-1-moins@kpit.com>
In-Reply-To: <20260319181409.1689458-1-moins@kpit.com>
From: Shaik Moin <careers.myinfo@gmail.com>
Date: Thu, 19 Mar 2026 23:46:42 +0530
X-Gm-Features: AaiRm526ZY3n0la7CnsHtb1h4EPdFeeb8Otz1vIBb86mBuMaVxBVKx-4Mx-1yao
Message-ID: <CAN01=z3BoMof_x34PVps8mR5zBjLU3mGtjZyH0tFrgVQyhbDjA@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH -v2] libpcre2: Enabling Ptest support
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c58c42064d649225"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 18:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233549

--000000000000c58c42064d649225
Content-Type: text/plain; charset="UTF-8"

Hi,
Please ignore the above patch

Regards,
Moin

On Thu, 19 Mar 2026, 11:45 pm Shaik Moin, <careers.myinfo@gmail.com> wrote:

> Install libpcre2 test suite and run it as ptest.
>
> Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine
> (RunTest), and grep utility (RunGrepTest).
>
> pcre2posix_test: Verifies the POSIX wrapper API
> RunTest: Executes the core PCRE2 test suite through pcre2test
> RunGrepTest: Checks pcre2grep to ensure its grepping style matching works
> as expected with various patterns and input files.
>
> Signed-off-by: Shaik Moin <moins@kpit.com>
> ---
>  .../libpcre/libpcre2/run-ptest                | 32 +++++++++++++++++++
>  .../recipes-support/libpcre/libpcre2_10.47.bb | 18 +++++++++--
>  2 files changed, 48 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libpcre/libpcre2/run-ptest
>
> diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest
> b/meta/recipes-support/libpcre/libpcre2/run-ptest
> new file mode 100644
> index 0000000000..2acfd17b17
> --- /dev/null
> +++ b/meta/recipes-support/libpcre/libpcre2/run-ptest
> @@ -0,0 +1,32 @@
> +#!/bin/sh
> +
> +TESTS="RunGrepTest RunTest"
> +total=0
> +pass=0
> +fail=0
> +
> +for T in $TESTS; do
> +    if [ -x "./$T" ]; then
> +        echo "Running $T"
> +        total=$((total + 1))
> +        if "./$T"; then
> +            echo "PASS: $T"
> +            pass=$((pass + 1))
> +        else
> +            echo "FAIL: $T"
> +            fail=$((fail + 1))
> +        fi
> +    else
> +        echo "SKIP: $T (not found or not executable)"
> +    fi
> +done
> +
> +# Summary
> +echo
> "============================================================================"
> +echo "# TOTAL: $total"
> +echo "# PASS:  $pass"
> +echo "# FAIL:  $fail"
> +echo
> "============================================================================"
> +
> +# Exit code based on failures
> +[ "$fail" -eq 0 ] && exit 0 || exit 1
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb
> b/meta/recipes-support/libpcre/libpcre2_10.47.bb
> index 217a60aae9..70079e0b65 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
> @@ -12,7 +12,9 @@ LIC_FILES_CHKSUM =
> "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
>
>  file://deps/sljit/LICENSE;md5=97268427d235c41c0be238ce8e5fda17 \
>                      "
>
> -SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
> +SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
> +           file://run-ptest \
> +"
>
>  GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
>  UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
> @@ -28,7 +30,7 @@ DEPENDS += "bzip2 zlib"
>
>  BINCONFIG = "${bindir}/pcre2-config"
>
> -inherit autotools binconfig-disabled github-releases
> +inherit autotools binconfig-disabled github-releases ptest
>
>  EXTRA_OECONF = "\
>      --enable-newline-is-lf \
> @@ -57,3 +59,15 @@ FILES:pcre2test = "${bindir}/pcre2test"
>  FILES:pcre2test-doc = "${mandir}/man1/pcre2test.1"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +do_install_ptest() {
> +    t=${D}${PTEST_PATH}
> +    cp -r ${S}/testdata $t
> +
> +    for i in pcre2posix_test pcre2grep pcre2test; do
> +        "${B}/libtool" --mode=install install "${B}/$i" "$t"
> +    done
> +    for i in RunTest RunGrepTest test-driver; \
> +      do cp ${S}/$i $t; \
> +    done
> +}
> --
> 2.34.1
>
>

--000000000000c58c42064d649225
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto">Please ignore the above patch</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto=
">Moin</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, 19 Mar 2026, 11:45 pm Shaik Moin,=
 &lt;<a href=3D"mailto:careers.myinfo@gmail.com">careers.myinfo@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Install libpcre2 test=
 suite and run it as ptest.<br>
<br>
Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest),=
 and grep utility (RunGrepTest).<br>
<br>
pcre2posix_test: Verifies the POSIX wrapper API<br>
RunTest: Executes the core PCRE2 test suite through pcre2test<br>
RunGrepTest: Checks pcre2grep to ensure its grepping style matching works a=
s expected with various patterns and input files.<br>
<br>
Signed-off-by: Shaik Moin &lt;<a href=3D"mailto:moins@kpit.com" target=3D"_=
blank" rel=3D"noreferrer">moins@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../libpcre/libpcre2/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 32 +++++++++++++++++++<br>
=C2=A0.../recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a> | 18 +++=
++++++--<br>
=C2=A02 files changed, 48 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/libpcre/libpcre2/run-ptest<br=
>
<br>
diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest b/meta/recipes=
-support/libpcre/libpcre2/run-ptest<br>
new file mode 100644<br>
index 0000000000..2acfd17b17<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libpcre/libpcre2/run-ptest<br>
@@ -0,0 +1,32 @@<br>
+#!/bin/sh<br>
+<br>
+TESTS=3D&quot;RunGrepTest RunTest&quot;<br>
+total=3D0<br>
+pass=3D0<br>
+fail=3D0<br>
+<br>
+for T in $TESTS; do<br>
+=C2=A0 =C2=A0 if [ -x &quot;./$T&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Running $T&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 total=3D$((total + 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;./$T&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $T&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass=3D$((pass + 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $T&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail=3D$((fail + 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;SKIP: $T (not found or not executab=
le)&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+done<br>
+<br>
+# Summary<br>
+echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D&quot;<br>
+echo &quot;# TOTAL: $total&quot;<br>
+echo &quot;# PASS:=C2=A0 $pass&quot;<br>
+echo &quot;# FAIL:=C2=A0 $fail&quot;<br>
+echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D&quot;<br>
+<br>
+# Exit code based on failures<br>
+[ &quot;$fail&quot; -eq 0 ] &amp;&amp; exit 0 || exit 1<br>
diff --git a/meta/recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a> b=
/meta/recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a><br>
index 217a60aae9..70079e0b65 100644<br>
--- a/meta/recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a><br>
+++ b/meta/recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a><br>
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENCE.md;md5=3D6720bf=
3bcff57543b915c2b22e526df0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://deps/sljit/LICENSE;md5=3D97268427d235c41c0be238ce8e5fda17 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
<br>
-SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.=
bz2&quot;<br>
+SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.=
bz2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+&quot;<br>
<br>
=C2=A0GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/PCRE2Project/=
pcre2/releases" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git=
hub.com/PCRE2Project/pcre2/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/pcre2-(?P&lt;pver&gt;\d+(=
\.\d+)+)$&quot;<br>
@@ -28,7 +30,7 @@ DEPENDS +=3D &quot;bzip2 zlib&quot;<br>
<br>
=C2=A0BINCONFIG =3D &quot;${bindir}/pcre2-config&quot;<br>
<br>
-inherit autotools binconfig-disabled github-releases<br>
+inherit autotools binconfig-disabled github-releases ptest<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--enable-newline-is-lf \<br>
@@ -57,3 +59,15 @@ FILES:pcre2test =3D &quot;${bindir}/pcre2test&quot;<br>
=C2=A0FILES:pcre2test-doc =3D &quot;${mandir}/man1/pcre2test.1&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 t=3D${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 cp -r ${S}/testdata $t<br>
+<br>
+=C2=A0 =C2=A0 for i in pcre2posix_test pcre2grep pcre2test; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${B}/libtool&quot; --mode=3Dinstall inst=
all &quot;${B}/$i&quot; &quot;$t&quot;<br>
+=C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 for i in RunTest RunGrepTest test-driver; \<br>
+=C2=A0 =C2=A0 =C2=A0 do cp ${S}/$i $t; \<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000c58c42064d649225--

