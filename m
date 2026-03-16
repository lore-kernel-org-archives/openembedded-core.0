Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F675EFCBBB
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 06:09:41 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43798.1773636684294905861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 21:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U16nYSie;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: careers.myinfo@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a49fc06b4so31264161fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 21:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773636682; cv=none;
        d=google.com; s=arc-20240605;
        b=jJOgbntvMr17WumK48oov2D/KpdWMYHU9WEc9J1NEziJEpC60oFObBHYzDuUswODOX
         p+X87y4raMOqO7GzTf47mmIvKIj6hQVw/4hwqEGaWtRIhA51u4K1lIjnKgLD3SO5pclE
         38kE8ZIm1z9NQZRBW2IcVJ1XK6IFCuPP8lk9qap5vEfhP1QTL9kOuscLKai6+p1JHbVi
         UBRa/nLYCtsF6RYfdZPamtmqp7eA+WmExUaSveKH7JZlDoleUUC0xrVTNZzXyqCnljnO
         7XffcNtg9bGPkVDHsa/HqRD6GqcXuP5+nwhlEwoNmHcfYmJ/yDe2NYwsqor90DHhI1To
         5fxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HSRP3OIrIxRjXsLs4HUjdqep93zIX71udQwVTGhCkWY=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=S7VzpeVCF+4QfiEZJBMQ+Lm6X5yFwCpH3zbU6pCW3OosM+ROMKajxpkTdoHLe2DFnC
         LyA4QZaetYyJ+y4SgvADuhOvyP70Zb0IGO8BJFlP+9oeMF3uhSE8YYcFtOZ2nYLzt5x0
         G5+hj7bwR5vGvHRFzoTtJPmSS3BBXFh1xWRUn48ehX0Mp18YKqhCPAeCSESwNFcilQ5/
         KcKeUOrQpxoliGdnDV/Euh+MbKVSLLgdF863oakeZmp1UAuf8olhYtqVFaxJL3drjU74
         XuEj28eUpgTqjPbMfoMLbwpAlYp1JYjDcD8Qk9IfVDzE0DJfRHvZXoyoO1DS7K4rHwam
         NV/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773636682; x=1774241482; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSRP3OIrIxRjXsLs4HUjdqep93zIX71udQwVTGhCkWY=;
        b=U16nYSieu+zrfSbOiK3y+sk03r5sBNs6sNuCNEy94ER/6MF6kYPdhB/abJ/SDMORGb
         Cc8SzqDqKgr0brC5xL3cVXK/dlzGsns9fzH6y3a+1X71p2mx+7/ejaQC7C3d9sKwJ0Fc
         YPqvdBZoM35QIz6vBt3vLyXgnwaNm1SV7l4fw/M2cG1q1Fv/eV9VYNS3QqkKEZ75mfvm
         kyVtMiiAgz9axevl15oIUgny1E07gR362uHZ7KxwwisUbHnGNWtmpT2DOV2mjtlOCODE
         G0WM+0S9rxW5I89cz1NuscY9Q5A3hT5Tbf06QdytbOS2u16bvSMMHlDg1+HArrjoFCLH
         Do+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773636682; x=1774241482;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSRP3OIrIxRjXsLs4HUjdqep93zIX71udQwVTGhCkWY=;
        b=TV39rkqFD03Tqguv21MAaAp/lTdAS6a31+G8zU6Qcvb369Sn4omvMDgxK9+vDH5wWQ
         fK4RS1GzI3BQnF1D1bhVJYukgYEWHoXQ0YbdU7bhGrNY0TI5dXvYeFf5sQRZq7u40B0r
         6MABgyiTIaZI5QiwO1XVY81eRQsyBdIgBpl68rqNI2Rf+4OcIiXQgA9cZ7h7YSQbun30
         /Wx2xAMEf4ILjvkgNqQdk/JOyPO8inTjKM2YkSylNgWEDy33oiYKmXgPk6vOoIhe5EOB
         9thNrBJvLa/VJyuxG0b0meQia7dyZsVr8421jRDzPcF/TtQ0UQyQrAHClAyDl9iobXqP
         rONA==
X-Gm-Message-State: AOJu0Yy6YB4j2Gsjegt0zdaV6az+0ni2q+vab7z4lSHgs88IdrEurJsx
	Wjn5XR12Glr8kSZCMreyyeIw609RJnORfeQJRC9abEJZIHrujL0ovTXTSYs9jThu+daln1lK0hU
	QMN3UVN+k4Govd97LiTnFn6QfJp6f7jUP/w==
X-Gm-Gg: ATEYQzyKk9rfUZJibd3yHDK+e1qYJNYAZTCmziW9EutizaoJZihEANPzmNWmXfC/xAW
	Ldu1J+WIcYQAT2Ow3a/RSbR6r6ukmJp1HDViMZnzSevDCx2/u3A2tQcJ6W56oijbk0nR5zLCBcO
	MhCk1gzlfaasO9iLTWbEvpGm+MLF1/Ps1zcFG3IfiPmoxtb0fj0HWipjCSozWhY5qRGRyiYQggF
	WsDSUagwnPxFut9PT2peHHbMWYC0WPP+H5H8i4Qr9ybgatzQODskkuMsgLXYl46V5wuC9DISCt2
	g0agZ8YcwadGoiY3eTIpPYFUD3aDSVo9/uuslA==
X-Received: by 2002:a05:6402:f25:b0:65f:9c21:e68e with SMTP id
 4fb4d7f45d1cf-663ba9bb42amr4658664a12.5.1773636241107; Sun, 15 Mar 2026
 21:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260211080135.92891-1-moins@kpit.com>
In-Reply-To: <20260211080135.92891-1-moins@kpit.com>
From: Shaik Moin <careers.myinfo@gmail.com>
Date: Mon, 16 Mar 2026 10:13:48 +0530
X-Gm-Features: AaiRm51cWe0aH_6fPGgRDHg6FDuQfcjpAMXHPZl4PkSSQMa9T_XRNRqDuLqfgoo
Message-ID: <CAN01=z2Yep8KYBtjQ8s=sJm2LBVJ1ErCfTGRBaDTOxDO2jvPgg@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] libpcre2: Enabling Ptest support
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001caf60064d1cde16"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 06:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233211

--0000000000001caf60064d1cde16
Content-Type: text/plain; charset="UTF-8"

Hi team,

Can I get update on this?

Regards,
Moin

On Wed, 11 Feb 2026, 1:32 pm Shaik Moin, <careers.myinfo@gmail.com> wrote:

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
>  .../libpcre/libpcre2/run-ptest                | 38 +++++++------------
>  .../recipes-support/libpcre/libpcre2_10.47.bb | 25 ++++++------
>  2 files changed, 24 insertions(+), 39 deletions(-)
>
> diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest
> b/meta/recipes-support/libpcre/libpcre2/run-ptest
> index d7c79827bf..2acfd17b17 100644
> --- a/meta/recipes-support/libpcre/libpcre2/run-ptest
> +++ b/meta/recipes-support/libpcre/libpcre2/run-ptest
> @@ -1,39 +1,27 @@
>  #!/bin/sh
>
> -echo "START: ptest-runner"
> -date +"%Y-%m-%dT%H:%M"
> -echo "BEGIN: $(pwd)"
> -
> -# Space-separated list of test binaries
> -TESTS="pcre2posix_test RunGrepTest RunTest"
> -
> +TESTS="RunGrepTest RunTest"
>  total=0
>  pass=0
>  fail=0
> -results=""
>
>  for T in $TESTS; do
> -    echo "Running $T"
> -    total=$((total + 1))
> -    if ./"$T"; then
> -        echo "PASS: $T"
> -        pass=$((pass + 1))
> -        results="${results}\nPASS:  ${T}"
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
>      else
> -        echo "FAIL: $T"
> -        fail=$((fail + 1))
> -        results="${results}\nFAIL:  ${T}"
> +        echo "SKIP: $T (not found or not executable)"
>      fi
>  done
> -echo
> "============================================================================"
> -echo "Testsuite summary for PCRE"
> -echo
> "============================================================================"
> -
> -if [ -n "$results" ]; then
> -    printf "%b\n" "$results"
> -fi
>
> -# Summary with per-test details
> +# Summary
>  echo
> "============================================================================"
>  echo "# TOTAL: $total"
>  echo "# PASS:  $pass"
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb
> b/meta/recipes-support/libpcre/libpcre2_10.47.bb
> index d73e8fea05..70079e0b65 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =
> "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
>
>  file://deps/sljit/LICENSE;md5=97268427d235c41c0be238ce8e5fda17 \
>                      "
>
> -SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2
> +SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
>             file://run-ptest \
>  "
>
> @@ -58,19 +58,16 @@ FILES:pcre2grep-doc = "${mandir}/man1/pcre2grep.1"
>  FILES:pcre2test = "${bindir}/pcre2test"
>  FILES:pcre2test-doc = "${mandir}/man1/pcre2test.1"
>
> -BBCLASSEXTEND = "native nativesdk"+
> +BBCLASSEXTEND = "native nativesdk"
>
>  do_install_ptest() {
> -        t=${D}${PTEST_PATH}
> -        cp -r ${S}/testdata $t
> -        for i in pcre2posix_test pcre2grep pcre2test; \
> -          do cp ${B}/.libs/$i $t; \
> -        done
> -        for i in RunTest RunGrepTest test-driver; \
> -          do cp ${S}/$i $t; \
> -        done
> -        # Skip the fr_FR locale test. If the locale fr_FR is found, it is
> tested.
> -        # If not found, the test is skipped. The test program assumes
> fr_FR is non-UTF-8
> -        # locale so the test fails if fr_FR is UTF-8 locale.
> -        sed -i -e 's:do3=yes:do3=no:g' ${D}${PTEST_PATH}/RunTest
> +    t=${D}${PTEST_PATH}
> +    cp -r ${S}/testdata $t
> +
> +    for i in pcre2posix_test pcre2grep pcre2test; do
> +        "${B}/libtool" --mode=install install "${B}/$i" "$t"
> +    done
> +    for i in RunTest RunGrepTest test-driver; \
> +      do cp ${S}/$i $t; \
> +    done
>  }
> --
> 2.34.1
>
>

--0000000000001caf60064d1cde16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi team,<div dir=3D"auto"><br></div><div dir=3D"auto">Can=
 I get update on this?</div><div dir=3D"auto"><br></div><div dir=3D"auto">R=
egards,</div><div dir=3D"auto">Moin</div></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 11 F=
eb 2026, 1:32 pm Shaik Moin, &lt;<a href=3D"mailto:careers.myinfo@gmail.com=
">careers.myinfo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Install libpcre2 test suite and run it as ptest.<br>
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
=A0 =C2=A0 =C2=A0 | 38 +++++++------------<br>
=C2=A0.../recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a> | 25 +++=
+++------<br>
=C2=A02 files changed, 24 insertions(+), 39 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest b/meta/recipes=
-support/libpcre/libpcre2/run-ptest<br>
index d7c79827bf..2acfd17b17 100644<br>
--- a/meta/recipes-support/libpcre/libpcre2/run-ptest<br>
+++ b/meta/recipes-support/libpcre/libpcre2/run-ptest<br>
@@ -1,39 +1,27 @@<br>
=C2=A0#!/bin/sh<br>
<br>
-echo &quot;START: ptest-runner&quot;<br>
-date +&quot;%Y-%m-%dT%H:%M&quot;<br>
-echo &quot;BEGIN: $(pwd)&quot;<br>
-<br>
-# Space-separated list of test binaries<br>
-TESTS=3D&quot;pcre2posix_test RunGrepTest RunTest&quot;<br>
-<br>
+TESTS=3D&quot;RunGrepTest RunTest&quot;<br>
=C2=A0total=3D0<br>
=C2=A0pass=3D0<br>
=C2=A0fail=3D0<br>
-results=3D&quot;&quot;<br>
<br>
=C2=A0for T in $TESTS; do<br>
-=C2=A0 =C2=A0 echo &quot;Running $T&quot;<br>
-=C2=A0 =C2=A0 total=3D$((total + 1))<br>
-=C2=A0 =C2=A0 if ./&quot;$T&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $T&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass=3D$((pass + 1))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 results=3D&quot;${results}\nPASS:=C2=A0 ${T}&q=
uot;<br>
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
=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $T&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail=3D$((fail + 1))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 results=3D&quot;${results}\nFAIL:=C2=A0 ${T}&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;SKIP: $T (not found or not executab=
le)&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0done<br>
-echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D&quot;<br>
-echo &quot;Testsuite summary for PCRE&quot;<br>
-echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D&quot;<br>
-<br>
-if [ -n &quot;$results&quot; ]; then<br>
-=C2=A0 =C2=A0 printf &quot;%b\n&quot; &quot;$results&quot;<br>
-fi<br>
<br>
-# Summary with per-test details<br>
+# Summary<br>
=C2=A0echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D&quot;<br>
=C2=A0echo &quot;# TOTAL: $total&quot;<br>
=C2=A0echo &quot;# PASS:=C2=A0 $pass&quot;<br>
diff --git a/meta/recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a> b=
/meta/recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a><br>
index d73e8fea05..70079e0b65 100644<br>
--- a/meta/recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a><br>
+++ b/meta/recipes-support/libpcre/<a href=3D"http://libpcre2_10.47.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libpcre2_10.47.bb</a><br>
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENCE.md;md5=3D6720bf=
3bcff57543b915c2b22e526df0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://deps/sljit/LICENSE;md5=3D97268427d235c41c0be238ce8e5fda17 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
<br>
-SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.=
bz2<br>
+SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.=
bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
@@ -58,19 +58,16 @@ FILES:pcre2grep-doc =3D &quot;${mandir}/man1/pcre2grep.=
1&quot;<br>
=C2=A0FILES:pcre2test =3D &quot;${bindir}/pcre2test&quot;<br>
=C2=A0FILES:pcre2test-doc =3D &quot;${mandir}/man1/pcre2test.1&quot;<br>
<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0do_install_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t=3D${D}${PTEST_PATH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -r ${S}/testdata $t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in pcre2posix_test pcre2grep pcre2test; =
\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do cp ${B}/.libs/$i $t; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in RunTest RunGrepTest test-driver; \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do cp ${S}/$i $t; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Skip the fr_FR locale test. If the locale fr=
_FR is found, it is tested.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If not found, the test is skipped. The test =
program assumes fr_FR is non-UTF-8<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # locale so the test fails if fr_FR is UTF-8 l=
ocale.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s:do3=3Dyes:do3=3Dno:g&#39; ${D=
}${PTEST_PATH}/RunTest<br>
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
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000001caf60064d1cde16--

