Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1874DCFC28A
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 14:47:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12858.1763736422610296075
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 06:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3RtOL2XZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775895d69cso9439835e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763736421; x=1764341221; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vfmMVnPLw2U9uAAJoI+EfQBn0M0wVI7kzCE5Bv+GXGY=;
        b=3RtOL2XZaeQPi1GxcB+LqUx3oZ89z7FdHuDUt69X9hShBnRufAoHOEh23+sXaEvfCN
         TAF/Cuf8gwkZ/uqi+AOpgQJYiTXnb0B0M8ZJU5ME4PYr2wVy8EYXBsRYJLFe9uP9ElRK
         Q3vq6kaCovLkYAc3J/QQZ/NpOep19PM3kqNF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763736421; x=1764341221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfmMVnPLw2U9uAAJoI+EfQBn0M0wVI7kzCE5Bv+GXGY=;
        b=SMPxW+q1pbulh+F0vI54NLaXTZXFtlyVzD5podtpIQo+BVNVEObH/37aSZ8PYHjIur
         8Q2Woo4ISNehK+K0cg1YgaNl3sOR9s29IlRxbw7VaJf0+Uybg6DsEUG214pypIGbz6s0
         B5b/JYJaY58+ULjFR/C+lsONPUlMSc6wWfsXeKJIhmq06Gj/dvJQfOKwqo/vN/3illLp
         DM887HKWOKGAvDAHnTdX8VHYx/JE6i9FYLKcb+be2XQExKc14v+YRckbjWaAR5lEukzh
         kdVn1GGsa+l4PpFtXkW89crYdivkCULHXdC0lgjoLdq6i3JTYomSCYD7TVTaxEhX9vVy
         sRhA==
X-Gm-Message-State: AOJu0YyTu5RtsEPoUUc8MeUjItIxNIQAzPk0TctVFjbF6RGYaEc0THDj
	0yHok7nUAldys66LobLZh/KOM5u2RuTg1JGp1jqlR+vBqLQjVaoxgGxdWuiwOVWWfXZeQm997b5
	6gjRPNOHZZHsZwxs3lsDu7di8lpcjFSKIel6mCEzamg==
X-Gm-Gg: ASbGnctPQy35d2MrW63djupLTW53ZvTpnOkWeCjKwaxUs/ztOMJHom1WJ4lob2w2cYe
	n/KDFgw6lXSNTdeU5QNQtO+1YPNmVX80vKaVFP7+8M8inN67Uf1YAVuQvPRgubZUEEUJID7MwYb
	6YYD0sltFj4N/T0HNxXkFLtW0wGO7k2sExnwV7T+DkTrPLbJKeIUhwQofFN7A5ZanbZsdSfIix+
	t2LO5pd7liPezQH5BytdgHL9a5xVMLe0fd927vd8GYPtLDReQHC2LBSU1dCqW9r6Vc4Sqs4kwco
	uYHpVm0KFKfUO4plBdmwx4i2oH0/Ag==
X-Google-Smtp-Source: AGHT+IEdT375rVPcrEkF8NHZQTgUx/1xQvdvJrh5MkFg3uuxEqhngGkoYkQMg2xiqcpfsfOYT0J+P0cBkt2xy+p7TyQ=
X-Received: by 2002:a05:600c:450f:b0:477:7b30:a6fc with SMTP id
 5b1f17b1804b1-477c01fa4a8mr31313395e9.30.1763736420509; Fri, 21 Nov 2025
 06:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20251121115420.15308-1-pratik.farkase@est.tech> <20251121131306.19079-1-pratik.farkase@est.tech>
In-Reply-To: <20251121131306.19079-1-pratik.farkase@est.tech>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 21 Nov 2025 15:46:34 +0100
X-Gm-Features: AWmQ_bl2xa1tSTeAawwn9xr6rmc9JyX7fIcF3gMNarvURHPUunv5UIWLv0DIMI8
Message-ID: <CAMSfU+7Gv+wMb5JBf=aYfWTOoaZhcELDfcJ93_LHzbxrVyYSwQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] libyaml: add ptest support
To: pratik.farkase@est.tech
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@ericsson.com
Content-Type: multipart/alternative; boundary="000000000000d27d8f06441be224"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 14:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226687

--000000000000d27d8f06441be224
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 21 nov. 2025 =C3=A0 14:13, Pratik Farkase via lists.openembedded.or=
g
<pratik.farkase=3Dest.tech@lists.openembedded.org> a =C3=A9crit :

> Add ptest support for libyaml to enable running the test suite
> on target devices. This includes:
>
> - test-version: Verifies library version information
> - test-reader: Tests YAML reading functionality
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
>

Thanks! Looks good to me now :)

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>


>
> ---
> Changes in v3:
> - Remove redundant executable check in run_test function
>
> Changes in v2:
> - Remove hardcoded version from test summary
> - Remove static XFAIL/XPASS/ERROR lines (always 0)
> - Move PTEST_TESTS definition above functions for better readability
> - Auto-discover test binaries in run-ptest
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../recipes-support/libyaml/libyaml/run-ptest | 38 +++++++++++++++++++
>  meta/recipes-support/libyaml/libyaml_0.2.5.bb | 21 +++++++++-
>  3 files changed, 58 insertions(+), 2 deletions(-)
>  create mode 100755 meta/recipes-support/libyaml/libyaml/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index 06d113e264..6a0c23586e 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -49,6 +49,7 @@ PTESTS_FAST =3D "\
>      libxml-simple-perl \
>      libxml2 \
>      libxmlb \
> +    libyaml \
>      logrotate \
>      lua \
>      lzo \
> diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest
> b/meta/recipes-support/libyaml/libyaml/run-ptest
> new file mode 100755
> index 0000000000..a5f554a15b
> --- /dev/null
> +++ b/meta/recipes-support/libyaml/libyaml/run-ptest
> @@ -0,0 +1,38 @@
> +#!/bin/sh
> +
> +# run-ptest - Execute libyaml test suite
> +
> +cd tests || exit 1
> +
> +TOTAL=3D0
> +PASS=3D0
> +FAIL=3D0
> +
> +run_test() {
> +    test_name=3D"$1"
> +    test_bin=3D"./${test_name}"
> +
> +    TOTAL=3D$((TOTAL + 1))
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
> +for test_bin in ./test-*; do
> +    if [ -x "${test_bin}" ]; then
> +        test_name=3D$(basename "${test_bin}")
> +        run_test "${test_name}"
> +    fi
> +done
> +
> +echo "# TOTAL: ${TOTAL}"
> +echo "# PASS:  ${PASS}"
> +echo "# FAIL:  ${FAIL}"
> +
> +test ${FAIL} -eq 0
> diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> index 0d8e8762d5..9a905215d3 100644
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
> +PTEST_TESTS =3D "test-version test-reader"
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
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226677):
> https://lists.openembedded.org/g/openembedded-core/message/226677
> Mute This Topic: https://lists.openembedded.org/mt/116406990/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000d27d8f06441be224
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 21=
 nov. 2025 =C3=A0=C2=A014:13, Pratik Farkase via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;pratik.farkase=3D<a href=3D"=
mailto:est.tech@lists.openembedded.org">est.tech@lists.openembedded.org</a>=
&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add ptest support for libyaml to enable running the test suite<b=
r>
on target devices. This includes:<br>
<br>
- test-version: Verifies library version information<br>
- test-reader: Tests YAML reading functionality<br>
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
Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br></blockquo=
te><div><br></div><div>Thanks! Looks good to me now :)</div><div><br></div>=
<div>Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr"=
>yoann.congal@smile.fr</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
---<br>
Changes in v3:<br>
- Remove redundant executable check in run_test function<br>
<br>
Changes in v2:<br>
- Remove hardcoded version from test summary<br>
- Remove static XFAIL/XPASS/ERROR lines (always 0)<br>
- Move PTEST_TESTS definition above functions for better readability<br>
- Auto-discover test binaries in run-ptest<br>
---<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0.../recipes-support/libyaml/libyaml/run-ptest | 38 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a> | 21 +++++++++-<br>
=C2=A03 files changed, 58 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100755 meta/recipes-support/libyaml/libyaml/run-ptest<br>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index 06d113e264..6a0c23586e 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -49,6 +49,7 @@ PTESTS_FAST =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0libxml-simple-perl \<br>
=C2=A0 =C2=A0 =C2=A0libxml2 \<br>
=C2=A0 =C2=A0 =C2=A0libxmlb \<br>
+=C2=A0 =C2=A0 libyaml \<br>
=C2=A0 =C2=A0 =C2=A0logrotate \<br>
=C2=A0 =C2=A0 =C2=A0lua \<br>
=C2=A0 =C2=A0 =C2=A0lzo \<br>
diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest b/meta/recipes-=
support/libyaml/libyaml/run-ptest<br>
new file mode 100755<br>
index 0000000000..a5f554a15b<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest<br>
@@ -0,0 +1,38 @@<br>
+#!/bin/sh<br>
+<br>
+# run-ptest - Execute libyaml test suite<br>
+<br>
+cd tests || exit 1<br>
+<br>
+TOTAL=3D0<br>
+PASS=3D0<br>
+FAIL=3D0<br>
+<br>
+run_test() {<br>
+=C2=A0 =C2=A0 test_name=3D&quot;$1&quot;<br>
+=C2=A0 =C2=A0 test_bin=3D&quot;./${test_name}&quot;<br>
+<br>
+=C2=A0 =C2=A0 TOTAL=3D$((TOTAL + 1))<br>
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
+for test_bin in ./test-*; do<br>
+=C2=A0 =C2=A0 if [ -x &quot;${test_bin}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_name=3D$(basename &quot;${test_bin}&quot;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 run_test &quot;${test_name}&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+done<br>
+<br>
+echo &quot;# TOTAL: ${TOTAL}&quot;<br>
+echo &quot;# PASS:=C2=A0 ${PASS}&quot;<br>
+echo &quot;# FAIL:=C2=A0 ${FAIL}&quot;<br>
+<br>
+test ${FAIL} -eq 0<br>
diff --git a/meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.b=
b" rel=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a> b/meta/recipes=
-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libyaml_0.2.5.bb</a><br>
index 0d8e8762d5..9a905215d3 100644<br>
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
+PTEST_TESTS =3D &quot;test-version test-reader&quot;<br>
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
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226677): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226677" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226677</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116406990/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116406990/4316185</a><br>
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

--000000000000d27d8f06441be224--

