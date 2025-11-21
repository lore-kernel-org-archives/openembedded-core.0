Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446E6CFC26F
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 12:33:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10489.1763728397265216987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 04:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rT0NXkxt;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477770019e4so18847125e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763728395; x=1764333195; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ItKNDwcZgLTDQv8JshOrXU3pfveL/QMHatk3GvclC6I=;
        b=rT0NXkxtWcHV07N6YrwgJ9Eo2q2KU6qK8YzWu6rZMN8cp00tmkBslfKuPeoRK3TBLa
         o0WoHcwCtz/KrBgutmBC7IiBe0o+EBgnykI0DyFiV8G41HuHPAeerw1AD6eSFk6kdxx+
         EHHausT1gZKKDT1xKXBO/dtVKPp+o9MgADq2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763728395; x=1764333195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItKNDwcZgLTDQv8JshOrXU3pfveL/QMHatk3GvclC6I=;
        b=SCwPj7mI8UsYsETo79sNmUWwT4R/G+/zZmhL8Q2ufO5df3Pcrf2QzYZGXYUe+UICCQ
         hziayi+YpWDeKYOCNcb0IL0v/oN0tF15tXGLCtkSEn52EO9sjdixIseMu9VtwxhCVMFP
         c2Gp+vP7XMJqbChb4hGm1AizGodgfT8VqjIPz8CHcVwGBAl4jPeZNOmsbXj4gHOAeSdK
         GYvLLyv2/ukUwA7y+lzYV2KjWvNPNuq/PvogVpgHytIHIPR0wL123FyZEvXW4DObJsF1
         61tYD2JgCK3Z9abqMPCxu8rALStWN5TxafU0dsdPuwVo2zGAXHTyMhbQOsdT0Ucg06p+
         yaXw==
X-Gm-Message-State: AOJu0Yw6piGp35/oc+s5dCKdumy90ORdokqkotNst5v0AobqIJ3lWQ7M
	qdoKYQhys2TWzM8uewy0xuYTrg1/HAl58OA55eAwDus/piqCD/KTgqI9SJTzeqHPERS2Mz93HbK
	j0X3WIg2mwCJcyrOthtvpR5zKH9HqxCW+oYy7AB+P1Q==
X-Gm-Gg: ASbGnctTWjc0NFH6AT1DJkCkT2HiM9HxAjBLKWfSp6ckHE3nEBFCp1CPvWddA04mDXT
	BpVRrTjAhVE5OFpZI7dr1EcNgUUrxMUYvqzwK4iS7wrzSP16/nyXXAa9vOuh7ud3SF9/Ax8UPzw
	4YLEgJ3uScSnimi96OGVLQKvgAEpckXK1XPizAjF75g85X0T7vCBWgnl+ZY27BQK0UOEhzCyOzC
	tkNA0HW1/Hv9s6A2CmgF0R3jz/0hi5jgVFt7Ww2c4JdEKw6CTwr+Yuj3M+ErM+J0wgY/N0Y3S3D
	tRH706CTsIXWQNci09edlkSaRshlcQ==
X-Google-Smtp-Source: AGHT+IHoIbPxpQgEcY4FJ3DbJbG0Bu2V1bvSeo3/U9AFxk3Ikai5b7RDOW/1uJtO5C2+BT2mjx8dCsChytykyps91JI=
X-Received: by 2002:a05:600c:a08:b0:477:54cd:2030 with SMTP id
 5b1f17b1804b1-477c01be3f6mr18999355e9.21.1763728395387; Fri, 21 Nov 2025
 04:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20251121105612.12259-1-pratik.farkase@est.tech> <20251121115420.15308-1-pratik.farkase@est.tech>
In-Reply-To: <20251121115420.15308-1-pratik.farkase@est.tech>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 21 Nov 2025 13:32:49 +0100
X-Gm-Features: AWmQ_bmeBHafwyAdj82V76QX-wqV_S9_xYXwMgjaAQigOUtcZgrgmj1SNenbXR4
Message-ID: <CAMSfU+4hh2rXJWHT5qLd=RMZvC2qs++7CS71j11Y6N9vV7W12w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] libyaml: add ptest support
To: pratik.farkase@est.tech
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@ericsson.com
Content-Type: multipart/alternative; boundary="0000000000007cd98706441a04b3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 12:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226676

--0000000000007cd98706441a04b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 21 nov. 2025 =C3=A0 12:54, Pratik Farkase via lists.openembedded.or=
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
> Changes in v2:
> - Remove hardcoded version from test summary
> - Remove static XFAIL/XPASS/ERROR lines (always 0)
> - Move PTEST_TESTS definition above functions for better readability
> - Auto-discover test binaries in run-ptest
>

^ this changelog is nice but need to go after the "---" line (that way, it
is in mails for review but not in final commit message)


>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../recipes-support/libyaml/libyaml/run-ptest | 46 +++++++++++++++++++
>  meta/recipes-support/libyaml/libyaml_0.2.5.bb | 21 ++++++++-
>  3 files changed, 66 insertions(+), 2 deletions(-)
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
> index 0000000000..a9cbe9cf0d
> --- /dev/null
> +++ b/meta/recipes-support/libyaml/libyaml/run-ptest
> @@ -0,0 +1,46 @@
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
>

This test is now redundant. You can remove it.


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
> +echo "# SKIP:  ${SKIP}"
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226673):
> https://lists.openembedded.org/g/openembedded-core/message/226673
> Mute This Topic: https://lists.openembedded.org/mt/116406209/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000007cd98706441a04b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 21=
 nov. 2025 =C3=A0=C2=A012:54, Pratik Farkase via <a href=3D"http://lists.op=
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
Changes in v2:<br>
- Remove hardcoded version from test summary<br>
- Remove static XFAIL/XPASS/ERROR lines (always 0)<br>
- Move PTEST_TESTS definition above functions for better readability<br>
- Auto-discover test binaries in run-ptest<br></blockquote><div><br></div><=
div>^ this changelog=C2=A0is nice but need to go after the &quot;---&quot; =
line (that way, it is in mails for review but not in final commit message)<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
---<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0.../recipes-support/libyaml/libyaml/run-ptest | 46 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-support/libyaml/<a href=3D"http://libyaml_0.2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libyaml_0.2.5.bb</a> | 21 ++++++++-<br>
=C2=A03 files changed, 66 insertions(+), 2 deletions(-)<br>
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
index 0000000000..a9cbe9cf0d<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest<br>
@@ -0,0 +1,46 @@<br>
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
+=C2=A0 =C2=A0 fi<br></blockquote><div><br></div><div>This test is now redu=
ndant. You can remove it.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
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
+echo &quot;# SKIP:=C2=A0 ${SKIP}&quot;<br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226673): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226673" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226673</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116406209/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116406209/4316185</a><br>
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

--0000000000007cd98706441a04b3--

