Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A078CC83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 17:04:49 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.18964.1752253484965561631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 10:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M9TBtSiA;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e898fb745beso3579762276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 10:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752253484; x=1752858284; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f8B3SLAi6R/EuEE6X7AAwElv00sJyfHM1BRW99YA2C4=;
        b=M9TBtSiAI/GV9FPWOmxv6G4O88y0qNYMparTj6mQRUDMLFXgdhPCDY/5QYdVPwEbrU
         OZAZcXkgT1cg29uLGhB4RXQXojRxgJc1Baj6SkjY3XfZb/PCEB32GGX+DBWQjGQtLP+j
         r6MYp4sswCQaS3y1Q9IlT5pFbd8Z4DAtHl/mkVJRvjBSeK1IL0tAfv8OLMq3fInN403m
         TpouYUUAoIJMmwd19dHRRJdEBYLiZn8/g2MYt1dQ92no7OYhmq/OGqviKEdvPGojsmFf
         MpUA8oX4HlONRj0fLdaCvgqpPQDWi63Ja5O5281Xfi6tUWK4xKPHFDbCYeJeutrMgVq+
         WDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752253484; x=1752858284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8B3SLAi6R/EuEE6X7AAwElv00sJyfHM1BRW99YA2C4=;
        b=J15dBn1TUIiiS+xtfZcKuOFhdxW2+Rs2Ui4w2q+3RsoSu56T9YCDufzzxBeMmQ1ICh
         0Q2jPMEXO0p/vPq219/bZd4vMIPEECBIRiFnKhKoao/JdGYpeqoVtzcyIuc67cu2u7Kp
         GiPy5JfMVe2Dylgn51V8xhN2NtIcN5/uNjNtSwcKhOH4KLViY7o/U4ib9YnGmmXxwbB9
         VIod4e3aN69FZdiFqiS6lZ/B6ExsOo/ptJpkFz4kFy0z9X2EfRBUGQL1NPojozdAGKKt
         Vk36QH5a8tGmwGLlD7XCPzdwQd8gbCg/Ca069lLZzR2kMthsl0RiLe36eqRB3v3OIcpl
         MtNw==
X-Gm-Message-State: AOJu0Yz57QBh2TfpCoQORgkvDhYg6rG0ibG5n3abVtmyVMXRPuTSd7iy
	i+t8AIrsiD+KN1VjcLgKcqu2NArQikK+SJolWRcz4dE9Mb66hL3ouxr3k5+K8zbA/fPmKz28K6R
	VszDuyKl43URMJqqlhSHJq8MBCrJIYJ0=
X-Gm-Gg: ASbGncvUjJ0SsdaaqZ58jdREYmctiBTjE2g6lTwI4nRFX0rvBjNUnyESmVo1A2q9dvy
	Mie0s7LOIxnjMYNgGiFQ7Bm3mOSBN75MHvHQX2MB4B/3f8rjyZmdh8AzNe1RNv6oGmP72zLFIg6
	JbPhqWKIUJzJiDyIzxmDDf5Qc399TGhTTzxwAbZ6sMnD+VQPwStx/qaKcG784OZfO2GPuZaw78N
	rhViXzFVnjPfEg6t1USrn04mAvki/sYpUTlIpcrJWiieoYJ0TY=
X-Google-Smtp-Source: AGHT+IG8OjVvrxxuE5Qe+tmnjNbiLfqZUcYB3dKUnRdk+xx9k2E6cx5ajaYuCfsy3Uz2ATJy3atTyor5pa8GGN0xO3A=
X-Received: by 2002:a05:690c:67c6:b0:70e:7e33:fbd6 with SMTP id
 00721157ae682-717d6a2b465mr64184137b3.17.1752253483975; Fri, 11 Jul 2025
 10:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250711165344.15438-1-mark.jonas@de.bosch.com>
In-Reply-To: <20250711165344.15438-1-mark.jonas@de.bosch.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Jul 2025 10:04:31 -0700
X-Gm-Features: Ac12FXwRwQNFszb8iuUn6XwBxby4GfvcWkwSCXSFE1X0X6F1Y9sxjGoJCBLWnFw
Message-ID: <CAMKF1srRqJMqwhKEKyqkie6_nMrcrhe6jBypV7-yRTDtT4_zXw@mail.gmail.com>
Subject: Re: [PATCH v2] dosfstools: Add ptests
To: mark.jonas@de.bosch.com
Cc: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com, 
	mathieu.dubois-briand@bootlin.com, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Content-Type: multipart/alternative; boundary="0000000000007809c00639aa4eda"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 17:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220163

--0000000000007809c00639aa4eda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A small nit
There are some tabs vs spaces discrepancies

On Fri, Jul 11, 2025 at 9:54=E2=80=AFAM <mark.jonas@de.bosch.com> wrote:

> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
> v1 -> v2:
>   - Add missing RDEPENDS of ptest
>   - Link tools to /usr/sbin instead of /sbin
>
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../dosfstools/dosfstools_4.2.bb              | 30 ++++++++++++++++++-
>  .../dosfstools/files/run-ptest                |  5 ++++
>  3 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/dosfstools/files/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index 4253c7b062..46c8945eb4 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -99,6 +99,7 @@ PTESTS_SLOW =3D "\
>      coreutils \
>      curl \
>      dbus \
> +    dosfstools \
>      e2fsprogs \
>      elfutils \
>      gettext \
> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
> b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
> index 86fb68f664..0772f39381 100644
> --- a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
> +++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
> @@ -10,18 +10,46 @@ LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
> +           file://run-ptest \
>             file://source-date-epoch.patch \
>             file://0001-fsck.fat-Adhere-to-the-fsck-exit-codes.patch \
>             file://0002-manpages-Document-fsck.fat-new-exit-codes.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7d726084809b527"
>
> -inherit autotools gettext pkgconfig update-alternatives github-releases
> +inherit autotools gettext pkgconfig ptest update-alternatives
> github-releases
>
>  EXTRA_OECONF =3D "--enable-compat-symlinks --without-iconv"
>
>  CFLAGS +=3D "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"
>
> +do_install_ptest () {
> +    mkdir -p ${D}${PTEST_PATH}/tests
> +    install -m 0744 ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +    install -m 0744 ${S}/test-driver ${D}${PTEST_PATH}/tests/
> +
> +    mkdir -p ${D}${PTEST_PATH}/src
> +    ln -sf /usr/sbin/mkfs.fat ${D}${PTEST_PATH}/src/mkfs.fat
> +    ln -sf /usr/sbin/fsck.fat ${D}${PTEST_PATH}/src/fsck.fat
> +    ln -sf /usr/sbin/fatlabel ${D}${PTEST_PATH}/src/fatlabel
> +
> +    # dosfstools tests depends on variables defined in the tests/Makefil=
e.
> +    # To run the tests, we need to modify the following:
> +    # - srcdir: used to find the test scripts for each dosfstools tools
> +    # - top_srcdir: used to find the test-driver script
> +    # - Makefile: originally used to recreate build rules when needed.
> They're not needed here
> +    #             because we only want to run the tests.
> +    # - XXD_FOUND: Always satisfied by RDEPENDS of ptest package
> +    sed \
> +        -e 's/^srcdir =3D ..*/srcdir =3D \./'         \
> +        -e 's/^top_srcdir =3D ..*/top_srcdir =3D \./' \
> +        -e 's/^Makefile: ..*/Makefile: /'         \
> +        -e 's/XXD_FOUND=3D/XXD_FOUND=3Dyes/'          \
> +        ${B}/tests/Makefile > ${D}${PTEST_PATH}/tests/Makefile
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "bash diffutils gawk make xxd"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  ALTERNATIVE_PRIORITY =3D "100"
> diff --git a/meta/recipes-devtools/dosfstools/files/run-ptest
> b/meta/recipes-devtools/dosfstools/files/run-ptest
> new file mode 100644
> index 0000000000..4f6e349a23
> --- /dev/null
> +++ b/meta/recipes-devtools/dosfstools/files/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +cd tests
> +
> +make check
> --
> 2.34.1
>
>

--0000000000007809c00639aa4eda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">A small nit</div><div dir=3D"auto">There are some tabs vs=
 spaces discrepancies=C2=A0</div><div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 11, 2025 =
at 9:54=E2=80=AFAM &lt;<a href=3D"mailto:mark.jonas@de.bosch.com">mark.jona=
s@de.bosch.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From:=
 Ricardo Simoes &lt;<a href=3D"mailto:ricardo.simoes@pt.bosch.com" target=
=3D"_blank">ricardo.simoes@pt.bosch.com</a>&gt;<br>
<br>
Signed-off-by: Ricardo Simoes &lt;<a href=3D"mailto:ricardo.simoes@pt.bosch=
.com" target=3D"_blank">ricardo.simoes@pt.bosch.com</a>&gt;<br>
Signed-off-by: Mark Jonas &lt;<a href=3D"mailto:mark.jonas@de.bosch.com" ta=
rget=3D"_blank">mark.jonas@de.bosch.com</a>&gt;<br>
---<br>
v1 -&gt; v2:<br>
=C2=A0 - Add missing RDEPENDS of ptest<br>
=C2=A0 - Link tools to /usr/sbin instead of /sbin <br>
<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0.../dosfstools/<a href=3D"http://dosfstools_4.2.bb" rel=3D"noreferrer=
" target=3D"_blank">dosfstools_4.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 30 ++++++++++++++++++-<br>
=C2=A0.../dosfstools/files/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++<br>
=C2=A03 files changed, 35 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/dosfstools/files/run-ptest<b=
r>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index 4253c7b062..46c8945eb4 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -99,6 +99,7 @@ PTESTS_SLOW =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0coreutils \<br>
=C2=A0 =C2=A0 =C2=A0curl \<br>
=C2=A0 =C2=A0 =C2=A0dbus \<br>
+=C2=A0 =C2=A0 dosfstools \<br>
=C2=A0 =C2=A0 =C2=A0e2fsprogs \<br>
=C2=A0 =C2=A0 =C2=A0elfutils \<br>
=C2=A0 =C2=A0 =C2=A0gettext \<br>
diff --git a/meta/recipes-devtools/dosfstools/<a href=3D"http://dosfstools_=
4.2.bb" rel=3D"noreferrer" target=3D"_blank">dosfstools_4.2.bb</a> b/meta/r=
ecipes-devtools/dosfstools/<a href=3D"http://dosfstools_4.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dosfstools_4.2.bb</a><br>
index 86fb68f664..0772f39381 100644<br>
--- a/meta/recipes-devtools/dosfstools/<a href=3D"http://dosfstools_4.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">dosfstools_4.2.bb</a><br>
+++ b/meta/recipes-devtools/dosfstools/<a href=3D"http://dosfstools_4.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">dosfstools_4.2.bb</a><br>
@@ -10,18 +10,46 @@ LICENSE =3D &quot;GPL-3.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://source-date-epoch.patch \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fsck.fat-Adhere-to-th=
e-fsck-exit-codes.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-manpages-Document-fsc=
k.fat-new-exit-codes.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;64926eebf90092dca21b14259a5301b7b98e7b19=
43e8a201c7d726084809b527&quot;<br>
<br>
-inherit autotools gettext pkgconfig update-alternatives github-releases<br=
>
+inherit autotools gettext pkgconfig ptest update-alternatives github-relea=
ses<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-compat-symlinks --without-iconv&quot;=
<br>
<br>
=C2=A0CFLAGS +=3D &quot;-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BI=
TS=3D64&quot;<br>
<br>
+do_install_ptest () {<br>
+=C2=A0 =C2=A0 mkdir -p ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 install -m 0744 ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
+=C2=A0 =C2=A0 install -m 0744 ${S}/test-driver ${D}${PTEST_PATH}/tests/<br=
>
+<br>
+=C2=A0 =C2=A0 mkdir -p ${D}${PTEST_PATH}/src<br>
+=C2=A0 =C2=A0 ln -sf /usr/sbin/mkfs.fat ${D}${PTEST_PATH}/src/mkfs.fat<br>
+=C2=A0 =C2=A0 ln -sf /usr/sbin/fsck.fat ${D}${PTEST_PATH}/src/fsck.fat<br>
+=C2=A0 =C2=A0 ln -sf /usr/sbin/fatlabel ${D}${PTEST_PATH}/src/fatlabel<br>
+<br>
+=C2=A0 =C2=A0 # dosfstools tests depends on variables defined in the tests=
/Makefile.<br>
+=C2=A0 =C2=A0 # To run the tests, we need to modify the following:<br>
+=C2=A0 =C2=A0 # - srcdir: used to find the test scripts for each dosfstool=
s tools<br>
+=C2=A0 =C2=A0 # - top_srcdir: used to find the test-driver script<br>
+=C2=A0 =C2=A0 # - Makefile: originally used to recreate build rules when n=
eeded. They&#39;re not needed here<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0because we =
only want to run the tests.<br>
+=C2=A0 =C2=A0 # - XXD_FOUND: Always satisfied by RDEPENDS of ptest package=
<br>
+=C2=A0 =C2=A0 sed \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^srcdir =3D ..*/srcdir =3D \./&#39;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^top_srcdir =3D ..*/top_srcdir =3D \=
./&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^Makefile: ..*/Makefile: /&#39;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/XXD_FOUND=3D/XXD_FOUND=3Dyes/&#39;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/tests/Makefile &gt; ${D}${PTEST_PATH}/tes=
ts/Makefile<br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;bash diffutils gawk make xxd&quot;<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
diff --git a/meta/recipes-devtools/dosfstools/files/run-ptest b/meta/recipe=
s-devtools/dosfstools/files/run-ptest<br>
new file mode 100644<br>
index 0000000000..4f6e349a23<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/dosfstools/files/run-ptest<br>
@@ -0,0 +1,5 @@<br>
+#!/bin/sh<br>
+<br>
+cd tests<br>
+<br>
+make check<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--0000000000007809c00639aa4eda--

