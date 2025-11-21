Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD41ECFC261
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 11:23:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9474.1763724175418168951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 03:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eJ7cjT/k;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so1005808f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763724174; x=1764328974; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Velx28eXhJycceY8X2JMYaN10dpescN08elzaXnxLu0=;
        b=eJ7cjT/klivs4KDqJmdAigHJqdAURWdBEQiCuUD0x4h7vFuKnHJNjW5/enhRaNMrJf
         AdHj7f/navX/na5Hd5TeU0YSHk58+wkUOHDtooahd+DOnFgiq+MwSQf4HWUojQMbMN3R
         dDsaQsoWFHXa76SQ1b2GPyYHh6BYqKdxMwAM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724174; x=1764328974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Velx28eXhJycceY8X2JMYaN10dpescN08elzaXnxLu0=;
        b=K823E5mHPfc1dt+2naI/jVHFPjE0dCZBelNRkaSfvr8qBQ3JUu+ndDTCS/hFg+/nJs
         ahmriKk75XUBGlo15Gi2fA1KOftXG27ZwW4Q5kYTmMPVyUqPMP8byVVSYGz1ZiqLPLxy
         WZ1w/LyMjY/9HeEsVLZhq5HxMHr3VTErJ1jYq8lQR5USFq2FofcWrmMiJkTVC0Lxsd2t
         V3/eIFmIYDJZf67TWU9kSPyhk/NtgtgAk/vUqmNm1mdvMOOyXV4Ge7TKUQ8S+psE+9hW
         H1yI7TowMx9Q3zOcZtkOs9RTgW3m8Ot+dsg+o4rD14+uYF5fvQUJqjYqpdq7F1XKjr9E
         jsEQ==
X-Gm-Message-State: AOJu0YxQJ7d/D3vUWYm0yDRL3E8dnpFUrmQOMbFxr4We8+xzdT/ec5/c
	3anvlkdx9PR3nWFHXK9wV0vF6Z6awqXZgpYcXWwHOastaYV3mcAca71dvlS2FzzWSJZO4hmm1E7
	mDz8V+A3qYs51Bwcg1Ag25DsRRVHllWvieEULEgQ5sA==
X-Gm-Gg: ASbGncveqiYAnxPILDpQSwa0qUX40ZUqp23Bh4TTO5uWNcqDGenh8Y34v5uR+S+gxLq
	9l1HlvmgvnPQbqi+bByNDKS/nLIm6A48ioLhZBtrfMy6j5BXa/AX0kwfKDPE6AKsyZf3vhTQxzA
	wiEa8TnqYsXo1fGee/QpTN+R0uq3hgNSmdhboIX/7NVG1pmI6iq4UByGEadU2nmZJxuMMFOlKHN
	xPseHTOOpe67dkD3gVQ53X6NzTog+bs0BuqC8zWcWGXObL0MhechReaW9pXVFCcQwBw7EJUuz2H
	/DHGJ0WGgeStsIh+2l05TWJ67i7eCQ==
X-Google-Smtp-Source: AGHT+IEqyXOJ+8N3iUYwDccC5BMrjtPx5Guva8bX2oAOGUIAfBqqyiNC3QmZcbKgXcap7oVU+grBqhfPHmEQfZ05lXc=
X-Received: by 2002:a05:6000:2008:b0:429:d253:8619 with SMTP id
 ffacd0b85a97d-42cba63b310mr7086977f8f.5.1763724172520; Fri, 21 Nov 2025
 03:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20251121105612.12259-1-pratik.farkase@est.tech>
In-Reply-To: <20251121105612.12259-1-pratik.farkase@est.tech>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 21 Nov 2025 12:22:26 +0100
X-Gm-Features: AWmQ_bnK8LwCrQ97IAsa-os9Rrwt02TCZQVmcSzNpgsGupGBtIZojTuKMlzc5wM
Message-ID: <CAMSfU+6rTuAHSGci4LS8Kuu-XZqzZjzJXd8Vh2p_c2Bq=mag7w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libyaml: add ptest support
To: pratik.farkase@est.tech
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@ericsson.com
Content-Type: multipart/alternative; boundary="000000000000c9008706441908e9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 11:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226669

--000000000000c9008706441908e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le ven. 21 nov. 2025 =C3=A0 11:56, Pratik Farkase via lists.openembedded.or=
g
<pratik.farkase=3Dest.tech@lists.openembedded.org> a =C3=A9crit :

> Add ptest support for libyaml to enable running the test suite
> on target devices. This includes:
>
> - test-version: Verifies library version information
> - test-reader: Tests YAML reading functionality
>
> The tests are built from the upstream test suite using the
> autotools check_PROGRAMS infrastructure.
>
> All 2 upstream tests pass successfully:
> START: ptest-runner
> BEGIN: /usr/lib/libyaml/ptest
> PASS: test-version
> PASS: test-reader
> DURATION: 0
> END: /usr/lib/libyaml/ptest
> STOP: ptest-runner
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  .../recipes-support/libyaml/libyaml/run-ptest | 49 +++++++++++++++++++
>  meta/recipes-support/libyaml/libyaml_0.2.5.bb | 21 +++++++-
>  2 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100755 meta/recipes-support/libyaml/libyaml/run-ptest
>
> diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest
> b/meta/recipes-support/libyaml/libyaml/run-ptest
> new file mode 100755
> index 0000000000..885e4b68d5
> --- /dev/null
> +++ b/meta/recipes-support/libyaml/libyaml/run-ptest
> @@ -0,0 +1,49 @@
> +#!/bin/sh
> +
> +# run-ptest - Execute libyaml test suite
> +
> +cd tests || exit 1
> +
> +TOTAL=3D0
> +PASS=3D0
> +FAIL=3D0
> +SKIP=3D0
> +
> +run_test() {
> +    test_name=3D"$1"
> +    test_bin=3D"./${test_name}"
> +
> +    TOTAL=3D$((TOTAL + 1))
> +
> +    if [ ! -x "${test_bin}" ]; then
> +        echo "SKIP: ${test_name}"
> +        SKIP=3D$((SKIP + 1))
> +        return
> +    fi
> +
> +    if ${test_bin} >/dev/null 2>&1; then
> +        echo "PASS: ${test_name}"
> +        PASS=3D$((PASS + 1))
> +    else
> +        echo "FAIL: ${test_name}"
> +        FAIL=3D$((FAIL + 1))
> +        return 1
> +    fi
> +}
> +
> +run_test "test-version"
> +run_test "test-reader"
>

This is the duplication of PTEST_TESTS. Is there any way to avoid the
repetition?
Run every binary in tests/ maybe?


> +
> +echo
> "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +echo "Testsuite summary for yaml 0.2.5"
>

This hard-coded "0.2.5" version will most likely *not* be updated on future
upgrades.
Either remove it (my recommendation) or generate it from $PV.


> +echo
> "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +echo "# TOTAL: ${TOTAL}"
> +echo "# PASS:  ${PASS}"
> +echo "# SKIP:  ${SKIP}"
> +echo "# XFAIL: 0"
> +echo "# FAIL:  ${FAIL}"
> +echo "# XPASS: 0"
> +echo "# ERROR: 0"
> +echo
> "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
>

The lines forced to "0" are not used by any tools (that I know of) and
provide little info (being static). How about removing them?


> +
> +test ${FAIL} -eq 0
> diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> index 0d8e8762d5..1d950572ab 100644
> --- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> +++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> @@ -7,14 +7,31 @@ SECTION =3D "libs/devel"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://License;md5=3D7bbd28caa69f81f5cd5f486472366=
63d"
>
> -SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
> +SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
> +           file://run-ptest \
> +"
>  SRC_URI[sha256sum] =3D
> "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4"
>
>  S =3D "${UNPACKDIR}/yaml-${PV}"
>
> -inherit autotools
> +inherit autotools ptest
>
>  DISABLE_STATIC:class-nativesdk =3D ""
>  DISABLE_STATIC:class-native =3D ""
>
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_compile_ptest() {
> +    oe_runmake -C tests ${PTEST_TESTS}
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    for test in ${PTEST_TESTS}; do
> +        if [ -f ${B}/tests/.libs/${test} ]; then
> +            install -m 0755 ${B}/tests/.libs/${test}
> ${D}${PTEST_PATH}/tests/
> +        fi
> +    done
> +}
> +
> +PTEST_TESTS =3D "test-version test-reader"
>
Can you put this definition above the tasks where it is used? That would
make the code easier to read.

Thanks!


> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226667):
> https://lists.openembedded.org/g/openembedded-core/message/226667
> Mute This Topic: https://lists.openembedded.org/mt/116405792/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000c9008706441908e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 21 nov. 2025=
 =C3=A0=C2=A011:56, Pratik Farkase via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;pratik.farkase=3D<a href=3D"mailto:est=
.tech@lists.openembedded.org">est.tech@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
dd ptest support for libyaml to enable running the test suite<br>
on target devices. This includes:<br>
<br>
- test-version: Verifies library version information<br>
- test-reader: Tests YAML reading functionality<br>
<br>
The tests are built from the upstream test suite using the<br>
autotools check_PROGRAMS infrastructure.<br>
<br>
All 2 upstream tests pass successfully:<br>
START: ptest-runner<br>
BEGIN: /usr/lib/libyaml/ptest<br>
PASS: test-version<br>
PASS: test-reader<br>
DURATION: 0<br>
END: /usr/lib/libyaml/ptest<br>
STOP: ptest-runner<br>
<br>
Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
---<br>
=C2=A0.../recipes-support/libyaml/libyaml/run-ptest | 49 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a> | 21 +++++++-<br>
=C2=A02 files changed, 68 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100755 meta/recipes-support/libyaml/libyaml/run-ptest<br>
<br>
diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest b/meta/recipes-=
support/libyaml/libyaml/run-ptest<br>
new file mode 100755<br>
index 0000000000..885e4b68d5<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest<br>
@@ -0,0 +1,49 @@<br>
+#!/bin/sh<br>
+<br>
+# run-ptest - Execute libyaml test suite<br>
+<br>
+cd tests || exit 1<br>
+<br>
+TOTAL=3D0<br>
+PASS=3D0<br>
+FAIL=3D0<br>
+SKIP=3D0<br>
+<br>
+run_test() {<br>
+=C2=A0 =C2=A0 test_name=3D&quot;$1&quot;<br>
+=C2=A0 =C2=A0 test_bin=3D&quot;./${test_name}&quot;<br>
+<br>
+=C2=A0 =C2=A0 TOTAL=3D$((TOTAL + 1))<br>
+<br>
+=C2=A0 =C2=A0 if [ ! -x &quot;${test_bin}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;SKIP: ${test_name}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SKIP=3D$((SKIP + 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 if ${test_bin} &gt;/dev/null 2&gt;&amp;1; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: ${test_name}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PASS=3D$((PASS + 1))<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: ${test_name}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL=3D$((FAIL + 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+run_test &quot;test-version&quot;<br>
+run_test &quot;test-reader&quot;<br></blockquote><div><br></div><div>This =
is the duplication=C2=A0of=C2=A0PTEST_TESTS. Is there any way to avoid the =
repetition?</div><div>Run every binary in tests/ maybe?</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D&quot;<br>
+echo &quot;Testsuite summary for yaml 0.2.5&quot;<br></blockquote><div><br=
></div><div>This hard-coded &quot;0.2.5&quot; version will most likely *not=
* be updated on future upgrades.</div><div>Either remove it (my recommendat=
ion) or generate it from $PV.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
+echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D&quot;<br>
+echo &quot;# TOTAL: ${TOTAL}&quot;<br>
+echo &quot;# PASS:=C2=A0 ${PASS}&quot;<br>
+echo &quot;# SKIP:=C2=A0 ${SKIP}&quot;<br>
+echo &quot;# XFAIL: 0&quot;<br>
+echo &quot;# FAIL:=C2=A0 ${FAIL}&quot;<br>
+echo &quot;# XPASS: 0&quot;<br>
+echo &quot;# ERROR: 0&quot;<br>
+echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D&quot;<br></blockquote><div><br></div><div>The lines forced =
to &quot;0&quot; are not used by any tools (that I know of) and provide lit=
tle info (being static). How about removing them?</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+test ${FAIL} -eq 0<br>
diff --git a/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.b=
b" rel=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a> b/meta/recipes=
-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libyaml_0.2.5.bb</a><br>
index 0d8e8762d5..1d950572ab 100644<br>
--- a/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a><br>
+++ b/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a><br>
@@ -7,14 +7,31 @@ SECTION =3D &quot;libs/devel&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://License;md5=3D7bbd28caa69f81f5cd5f4=
8647236663d&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://pyyaml.org/download/libyaml/yaml-$%7B=
PV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://pyyaml.org/downl=
oad/libyaml/yaml-${PV}.tar.gz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://pyyaml.org/download/libyaml/yaml-$%7B=
PV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://pyyaml.org/downl=
oad/libyaml/yaml-${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c642ae9b75fee120b2d96c712538bd2cf283228d=
2337df2cf2988e3c02678ef4&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/yaml-${PV}&quot;<br>
<br>
-inherit autotools<br>
+inherit autotools ptest<br>
<br>
=C2=A0DISABLE_STATIC:class-nativesdk =3D &quot;&quot;<br>
=C2=A0DISABLE_STATIC:class-native =3D &quot;&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 oe_runmake -C tests ${PTEST_TESTS}<br>
+}<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 for test in ${PTEST_TESTS}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f ${B}/tests/.libs/${test} ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${B}/tests/.libs=
/${test} ${D}${PTEST_PATH}/tests/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
+<br>
+PTEST_TESTS =3D &quot;test-version test-reader&quot;<br></blockquote><div>=
Can you put this definition above the tasks where it is used? That would ma=
ke the code easier to read.</div><div><br></div><div>Thanks!</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226667): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226667" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226667</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116405792/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116405792/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000c9008706441908e9--

