Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB724C87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 14:11:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6841.1754748655083683637
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 07:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rdpnx4ik;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b78a034f17so2435884f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 07:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1754748653; x=1755353453; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KKe6FsdfBUIppwPi+k3Dp5YEZm0xn8yEKrdxMycdf+A=;
        b=rdpnx4ikxFX7Id5unlRb2livCXbOgUJ5wDZnXh+B/xEj8AMgYJnyQIIGZ7eStTdjdJ
         yq3mnxCIXnBxr1fk+j3EmNDO3oBy9UycnpBGfhSBJ8+nSFiboHBzECOA3aNxr1adV6EU
         nk6vbZTsly1jXl7+GTtZBSgbc9pzoOFnqbIVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754748653; x=1755353453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKe6FsdfBUIppwPi+k3Dp5YEZm0xn8yEKrdxMycdf+A=;
        b=aoZiY5ZiYvrDZseQZv6TRjlL3ZH/d7HIY8vqYFEyX7MxpDF1TYyUv0PhvtH6VJQoVn
         EHyEWnDUKx2It1kdj8UxXz1Va4Ip7XXO9NFGaNGlK6679wLAou9PYSUJOPdsv1hImIza
         GoJhHXU/cgDtviWBP8F+cRDzxgCDqK21JQDMxUqccLnd1aT/UhvLdKPAERkWAfvXQ5p/
         GEGHwSHFp29mWM9LjQxaS/wXhjVBNoQYkskCpWtazwXAB0EwVjQvNVnibD6EMHiBxyj9
         ob7bJAs92LDvDKYPTrhNHzGdUUIcbMzLJ4NGujVxkHcu9+43+ELHgsXbcsJnDXYg73lj
         guWQ==
X-Gm-Message-State: AOJu0Yw//Ml5l79Ht3cjCIqnNz9gcls7X6UVjiHwefMFcylB4ztvocQI
	c5kofRxuDpopJIF2ojcYssJ3TWN3rkMMCB7pbub4YFEyO9nDIT8BIQxsYYbvUnQvvUpeLtloh03
	jajO0uoLq8WadRGkCEKqVUoq/BITxCyaQ4g+LyCP7wA==
X-Gm-Gg: ASbGncuVPIwHxA2ivmfK5l/+BcK1RL9UKpenfO3ygp5wNjk7XtelX4PZxOw+8wtL+QU
	Vva6zHftnZToouTu8k5b6xdvKY85U+tSSksoHE3irxviB+4QFNJJc+NnY9jftbmD/cowJfNUvOs
	VX2XcyldfINOoNw2/k/UwRNhbUQFdoEsHbikfSz/tJjSrZ5dVV7KPzRz1Wr37QkoWhyEDSTrWDn
	CR5LA==
X-Google-Smtp-Source: AGHT+IFOKu44z69ZNv2hSqIQI8OKRJgoPK1WLH7iH+8qaA2+rvWv0vKOA61F0/POBLDPwcxPOjczcahgLOk9P4VpS7U=
X-Received: by 2002:a5d:5d0c:0:b0:3b7:87be:d9d8 with SMTP id
 ffacd0b85a97d-3b900b7af16mr4757883f8f.43.1754748653224; Sat, 09 Aug 2025
 07:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250809071200.4017253-1-skandigraun@gmail.com>
In-Reply-To: <20250809071200.4017253-1-skandigraun@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 9 Aug 2025 16:10:26 +0200
X-Gm-Features: Ac12FXzH7phS3f4o2goSOJ6ynoF5rAQrvY6OxITS9fkU5dlyJXvxq1OcnKJsI8k
Message-ID: <CAMSfU+7fZMF6E4sJyjPwT8x=T3fB1_JK-k8Y-irAq13Y04xQoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rpm-sequoia: upgrade 1.7.0 -> 1.9.0
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000255d83063bef4220"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 14:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221673

--000000000000255d83063bef4220
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le sam. 9 ao=C3=BBt 2025 =C3=A0 09:12, Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> The upstream project has extended the tests slightly, by adding a cargo
> command
> to ensure that the library is built before the tests would be executed.
> This
> doesn't really work for ptests, since it rebuilds the library from scratc=
h
> on the
> target. As an attempt to solve this issue, introduce an environment
> variable with
> a patch, which, if present, will skip building the library before
> executing the test.
>
> Changelog:
>
> https://github.com/rpm-software-management/rpm-sequoia/compare/v1.7.0...v=
1.9.0
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
> v2: set correct permissions on run-ptest script
>
>  ...-lib-for-symbols-tests-conditionally.patch |  41 ++
>  .../rpm-sequoia/rpm-sequoia-crates.inc        | 522 ++++++++++--------
>  ...-sequoia_1.7.0.bb =3D> rpm-sequoia_1.9.0.bb} |  14 +-
>  3 files changed, 334 insertions(+), 243 deletions(-)
>  create mode 100644
> meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbols-=
tests-conditionally.patch
>  rename meta/recipes-devtools/rpm-sequoia/{rpm-sequoia_1.7.0.bb =3D>
> rpm-sequoia_1.9.0.bb} (85%)
>
> diff --git
> a/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbol=
s-tests-conditionally.patch
> b/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbol=
s-tests-conditionally.patch
> new file mode 100644
> index 0000000000..ddc897b86c
> --- /dev/null
> +++
> b/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symbol=
s-tests-conditionally.patch
> @@ -0,0 +1,41 @@
> +From aaae1cc05c906b1d413e02f9da0b908e4cf9456d Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Fri, 8 Aug 2025 18:17:39 +0200
> +Subject: [PATCH] tests: build lib for symbols tests conditionally
> +
> +When the tests are executed, cargo might not be available,
> +however the library could be built already.
> +
> +An example of when this could happen is cross-compiling for
> +embedded systems: when the library is compiled for a different
> +(potentially low powered) system, then at runtime frequently
> +there is no rust toolchain available to build the library;
> +however the library is usually already built and installed.
> +
> +To be able to run the test on pre-built artifacts, introduce
> +an environment variable, "DONT_BUILD_TEST_LIB", which, if
> +present with any value, will skip building the library.
> +
> +Upstream-Status: Submitted [
> https://github.com/rpm-software-management/rpm-sequoia/pull/99]
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + tests/symbols.rs | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/symbols.rs b/tests/symbols.rs
> +index c532a15..0c4d268 100644
> +--- a/tests/symbols.rs
> ++++ b/tests/symbols.rs
> +@@ -9,7 +9,10 @@ use assert_cmd::assert::OutputAssertExt;
> + #[test]
> + fn symbols() -> anyhow::Result<()> {
> +     // Make sure the library is built.
> +-    Command::new("cargo").arg("build").ok()?;
> ++    let skip_build_library =3D env::var("TEST_DONT_BUILD_LIB").is_ok();
> ++    if ! skip_build_library {
> ++        Command::new("cargo").arg("build").ok()?;
> ++    }
> +
> +     // We want the location of the build directory (e.g.,
> +     // `/tmp/rpm-sequoia/debug`).
> diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
> b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
> index 2764030ec7..b97e27a34f 100644
> --- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
> @@ -8,49 +8,51 @@ SRC_URI +=3D " \
> [SNIP]

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
> b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
> similarity index 85%
> rename from meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
> rename to meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
> index 46f9ee8548..418bfb574a 100644
> --- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.9.0.bb
> @@ -12,11 +12,10 @@ DEPENDS =3D "openssl"
>
>  inherit pkgconfig rust cargo cargo-update-recipe-crates ptest-cargo
>
> -SRC_URI =3D "git://
> github.com/rpm-software-management/rpm-sequoia.git;protocol=3Dhttps;branc=
h=3Dmain
> \
> -
>  file://0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch \
> -"
> -
> -SRCREV =3D "0667e04ae7fb8cf0490919978d69883d16400e41"
> +SRC_URI =3D "git://
> github.com/rpm-software-management/rpm-sequoia.git;protocol=3Dhttps;branc=
h=3Dmain;tag=3Dv${PV}
> <http://github.com/rpm-software-management/rpm-sequoia.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv$%7BPV%7D>
> \
> +
>  file://0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch \
> +
>  file://0001-tests-build-lib-for-symbols-tests-conditionally.patch"
> +SRCREV =3D "cd090b02119565c6d171fa9a892790c966cf10ef"
>
>  require ${BPN}-crates.inc
>
> @@ -64,6 +63,11 @@ do_install:append () {
>  do_install_ptest:append () {
>         install -d ${D}${PTEST_PATH}/src
>         install -m 644 ${S}/src/symbols.txt
> ${D}${PTEST_PATH}/src/symbols.txt
> +
> +       echo "#!/bin/sh" > ${D}${PTEST_PATH}/run-ptest
> +       echo "rc=3D0" >> ${D}${PTEST_PATH}/run-ptest
> +       echo "export TEST_DONT_BUILD_LIB=3D1" >>
> ${D}${PTEST_PATH}/run-ptest
> +       chmod 755 ${D}${PTEST_PATH}/run-ptest
>

Wouldn't that make run-ptest basically a no-op?

Maybe you can, either:
* rename the run-ptest generated by cargo-ptest and exec'ing it from your
script to keep the envvar
* overwrite the run-ptest generated by cargo-ptest (but keep its current
content: e.g calling the test binaries in sequence, printing "PASS:" ...)

Best regards,


>  }
>
>  # Tests need objdump
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221671):
> https://lists.openembedded.org/g/openembedded-core/message/221671
> Mute This Topic: https://lists.openembedded.org/mt/114612984/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000255d83063bef4220
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 9 ao=C3=BBt 202=
5 =C3=A0=C2=A009:12, Gyorgy Sarvari via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
he upstream project has extended the tests slightly, by adding a cargo comm=
and<br>
to ensure that the library is built before the tests would be executed. Thi=
s<br>
doesn&#39;t really work for ptests, since it rebuilds the library from scra=
tch on the<br>
target. As an attempt to solve this issue, introduce an environment variabl=
e with<br>
a patch, which, if present, will skip building the library before executing=
 the test.<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/rpm-software-management/rpm-sequoia/compare/v=
1.7.0...v1.9.0" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm=
-software-management/rpm-sequoia/compare/v1.7.0...v1.9.0</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
v2: set correct permissions on run-ptest script<br>
<br>
=C2=A0...-lib-for-symbols-tests-conditionally.patch |=C2=A0 41 ++<br>
=C2=A0.../rpm-sequoia/rpm-sequoia-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5=
22 ++++++++++--------<br>
=C2=A0...-<a href=3D"http://sequoia_1.7.0.bb" rel=3D"noreferrer" target=3D"=
_blank">sequoia_1.7.0.bb</a> =3D&gt; <a href=3D"http://rpm-sequoia_1.9.0.bb=
" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.9.0.bb</a>} |=C2=A0 14=
 +-<br>
=C2=A03 files changed, 334 insertions(+), 243 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm-sequoia/files/0001-tests=
-build-lib-for-symbols-tests-conditionally.patch<br>
=C2=A0rename meta/recipes-devtools/rpm-sequoia/{<a href=3D"http://rpm-sequo=
ia_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.7.0.bb</a> =
=3D&gt; <a href=3D"http://rpm-sequoia_1.9.0.bb" rel=3D"noreferrer" target=
=3D"_blank">rpm-sequoia_1.9.0.bb</a>} (85%)<br>
<br>
diff --git a/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-f=
or-symbols-tests-conditionally.patch b/meta/recipes-devtools/rpm-sequoia/fi=
les/0001-tests-build-lib-for-symbols-tests-conditionally.patch<br>
new file mode 100644<br>
index 0000000000..ddc897b86c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rpm-sequoia/files/0001-tests-build-lib-for-symb=
ols-tests-conditionally.patch<br>
@@ -0,0 +1,41 @@<br>
+From aaae1cc05c906b1d413e02f9da0b908e4cf9456d Mon Sep 17 00:00:00 2001<br>
+From: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=
=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+Date: Fri, 8 Aug 2025 18:17:39 +0200<br>
+Subject: [PATCH] tests: build lib for symbols tests conditionally<br>
+<br>
+When the tests are executed, cargo might not be available,<br>
+however the library could be built already.<br>
+<br>
+An example of when this could happen is cross-compiling for<br>
+embedded systems: when the library is compiled for a different<br>
+(potentially low powered) system, then at runtime frequently<br>
+there is no rust toolchain available to build the library;<br>
+however the library is usually already built and installed.<br>
+<br>
+To be able to run the test on pre-built artifacts, introduce<br>
+an environment variable, &quot;DONT_BUILD_TEST_LIB&quot;, which, if<br>
+present with any value, will skip building the library.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/rpm-software-man=
agement/rpm-sequoia/pull/99" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/rpm-software-management/rpm-sequoia/pull/99</a>]<br>
+<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ tests/<a href=3D"http://symbols.rs" rel=3D"noreferrer" target=3D"_blank">=
symbols.rs</a> | 5 ++++-<br>
+ 1 file changed, 4 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/tests/<a href=3D"http://symbols.rs" rel=3D"noreferrer" target=
=3D"_blank">symbols.rs</a> b/tests/<a href=3D"http://symbols.rs" rel=3D"nor=
eferrer" target=3D"_blank">symbols.rs</a><br>
+index c532a15..0c4d268 100644<br>
+--- a/tests/<a href=3D"http://symbols.rs" rel=3D"noreferrer" target=3D"_bl=
ank">symbols.rs</a><br>
++++ b/tests/<a href=3D"http://symbols.rs" rel=3D"noreferrer" target=3D"_bl=
ank">symbols.rs</a><br>
+@@ -9,7 +9,10 @@ use assert_cmd::assert::OutputAssertExt;<br>
+ #[test]<br>
+ fn symbols() -&gt; anyhow::Result&lt;()&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0// Make sure the library is built.<br>
+-=C2=A0 =C2=A0 Command::new(&quot;cargo&quot;).arg(&quot;build&quot;).ok()=
?;<br>
++=C2=A0 =C2=A0 let skip_build_library =3D env::var(&quot;TEST_DONT_BUILD_L=
IB&quot;).is_ok();<br>
++=C2=A0 =C2=A0 if ! skip_build_library {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Command::new(&quot;cargo&quot;).arg(&quot;bui=
ld&quot;).ok()?;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0// We want the location of the build directory (e.g.,<=
br>
+=C2=A0 =C2=A0 =C2=A0// `/tmp/rpm-sequoia/debug`).<br>
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc b/met=
a/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc<br>
index 2764030ec7..b97e27a34f 100644<br>
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc<br>
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc<br>
@@ -8,49 +8,51 @@ SRC_URI +=3D &quot; \<br>[SNIP]=C2=A0</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoi=
a_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.7.0.bb</a> b=
/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia_1.9.0.bb" =
rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.9.0.bb</a><br>
similarity index 85%<br>
rename from meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia=
_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.7.0.bb</a><br=
>
rename to meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia_1=
.9.0.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.9.0.bb</a><br>
index 46f9ee8548..418bfb574a 100644<br>
--- a/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia_1.7.0=
.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.7.0.bb</a><br>
+++ b/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia_1.9.0=
.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.9.0.bb</a><br>
@@ -12,11 +12,10 @@ DEPENDS =3D &quot;openssl&quot;<br>
<br>
=C2=A0inherit pkgconfig rust cargo cargo-update-recipe-crates ptest-cargo<b=
r>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-software-manageme=
nt/rpm-sequoia.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/rpm-software-management/rpm-sequoia.git;protocol=3D=
https;branch=3Dmain</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-optional-env-vars-to-force-runt=
ime-paths-in-test.patch \<br>
-&quot;<br>
-<br>
-SRCREV =3D &quot;0667e04ae7fb8cf0490919978d69883d16400e41&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-software-manageme=
nt/rpm-sequoia.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"=
noreferrer" target=3D"_blank">github.com/rpm-software-management/rpm-sequoi=
a.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-optional-env-vars=
-to-force-runtime-paths-in-test.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-build-lib-for-s=
ymbols-tests-conditionally.patch&quot;<br>
+SRCREV =3D &quot;cd090b02119565c6d171fa9a892790c966cf10ef&quot;<br>
<br>
=C2=A0require ${BPN}-crates.inc<br>
<br>
@@ -64,6 +63,11 @@ do_install:append () {<br>
=C2=A0do_install_ptest:append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/src<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/src/symbols.txt ${D}${PTEST=
_PATH}/src/symbols.txt<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;#!/bin/sh&quot; &gt; ${D}${PTEST_PAT=
H}/run-ptest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;rc=3D0&quot; &gt;&gt; ${D}${PTEST_PA=
TH}/run-ptest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;export TEST_DONT_BUILD_LIB=3D1&quot;=
 &gt;&gt; ${D}${PTEST_PATH}/run-ptest=C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 755 ${D}${PTEST_PATH}/run-ptest<br></bloc=
kquote><div><br></div><div>Wouldn&#39;t=C2=A0that make run-ptest basically =
a no-op?</div><div><br></div><div>Maybe you can, either:</div><div>* rename=
 the run-ptest generated by cargo-ptest and exec&#39;ing it from your scrip=
t to keep the envvar</div><div>* overwrite the run-ptest generated by cargo=
-ptest (but keep its current content: e.g calling the test binaries in sequ=
ence, printing &quot;PASS:&quot; ...)</div><div><br></div><div>Best regards=
,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0# Tests need objdump<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#221671): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/221671" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/221671</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114612984/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114612984/4316185</a><br>
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

--000000000000255d83063bef4220--

