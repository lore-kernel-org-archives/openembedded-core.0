Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA05EDF03A
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 05:19:12 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38845.1770873543340824303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TGbP8o1+;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: nmjain23@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50336cffef9so66375041cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 21:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770873542; cv=none;
        d=google.com; s=arc-20240605;
        b=HO4OnmcoGRvmcTbkBWPRSW1X13kf2Avc2ylrIQ+vYI6TmZGEROH44gsC/k0ZYJw7/+
         cs/67GM7p645fH//fCTqeOJnqNvjHVi4U+ZV/gPNIK71CG7xjGLWQqL18/9wXVAE9vqj
         V3G12ipIMFq1gA6q36wwbRzP2KFbOW5h+UxYMZqdeW6TqffBWZSpexkm9YrRqrAaCRff
         FmYWycswrXdaPbW8XdkP2q4gG7EVSUN5S5PJFC9EDeXReBGPGjgpVTVGDXM36oa30VGP
         S1xHVLXysf+UFFBZAb99W2r4ZhQznq9n9DeJD+Z/cPjC/8fsQTRRqdyZnHwtp4M4To/b
         qEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fBbuoaVk9zyvRbgrt4XRU7Mzr37arx7d+1VDtGpi0no=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=Iy5mtKfcQFfsZAoDh+HbSd2pn5un7QhfuDHUtZ+54Xx51PRmEPFruq2RwjA0DzDowC
         +HdA4ngvZWOHwV1lt2Di9ePtWDsY3UWZSgZfagAfp7cADldOmHaggkYi3f15NhBzsXTW
         Nuxy3cuoWhznEcW8Uzf7jxHDwO8qkTCfk8mEu4LvUx8dWmoBK/vbTpIcQQoasPMMNJOP
         D6siSMCaUI23FgoyFYm+V1d2qEvKY9Df9j5QnmufD1gP4TNSL7cq1KRTGCuNZZS5JWGf
         hTaW0wKPEy5+oxHcLZxzgE53Zt9RIqR2NKax/2XFl8Tg9l5JFDQpOECcQn4+PApHK+Nc
         JD2A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770873542; x=1771478342; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBbuoaVk9zyvRbgrt4XRU7Mzr37arx7d+1VDtGpi0no=;
        b=TGbP8o1+qT10CRal6dWdj3GfV/zGYjWZNAdfwJV+QxyuttT4zP/Ma64M2zQX3EtRCb
         XVsxmQmp17Mvao/xs4XAUKwMo1RwvttodU//bz2U89KX43q0gkpLq/ReX38RrRGTBk5w
         oE0s4eO2Ypcm1oZn124/Z8nI1v1RzhcmYBNE2gygLqWssbVPwymw0bURPGELGLIZTamX
         uZ74loFsnMlNeG9i3l9N/nofkJ2CkUlr4o8PqGHtRIIof+SyNg8N5S8rfBq8DG5wKJ6z
         /LPRYgGVoZVM3zUoJntYO0Vy7wkmnTLigmjBXzbL7rEB1cV+w5d2q8YQAD4HV/pLAqYF
         Szaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770873542; x=1771478342;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBbuoaVk9zyvRbgrt4XRU7Mzr37arx7d+1VDtGpi0no=;
        b=KN4q41p3r14L26wr274fVjaKbiyNb8UQWc4nQNOlr39SopznTdBh8kkukB8NZunRA9
         p8CyBeJYXflyAGp0L41NHE26l3iy6LE4jb8DTtliUIQXXVeU2QXYFOpLunmL38ZvPhBX
         VFy2Ws8GNRDhJxIM712GNOCumrWirolU1bpgudttWb7QiU1KWmd+SL2P7NHHR1ILamVQ
         YmVFPobUwdUGIv+QFGqCA3oca+JPPqQPQdogDeXwpkFCWsuIUX1XSuDMURyxK3P450Ws
         irgXOp5rnAWlnh3G5CH5Q1K787iA0t0dmXlK7ssmaXIDS5Uz5DrPLWvW5M2rT/NyZ7vt
         4/JA==
X-Gm-Message-State: AOJu0YyDQW9CFXvxwI/5O8t4jM2sPa3+b7u3MGSl7Y9TtYboW9lR/hwS
	ClpU5PEdXlxn8NTNuEDfeLFou3FJ6kDM3L9OwbA6adFJnWtw6EfJNUfvJGqid0TXicRs6XXGBRw
	sY7baVefvun4OrkTeV3kqmZpc7dr/MjHj+g==
X-Gm-Gg: AZuq6aKE9zt27bDTaQxYqxs7jdbL0gsfHfLTnlUagYv1g6PrG/B2kBJzlbgHcz86upW
	evj1yLDE9u0EcH+Yh4tnvGjvRzkru/Ao0woniZBd6Slnvwl7L+n5iblem+Zvw3sIxeL509yuZDJ
	yR3NRSvs76EnGq5v5xbfr0PUkv6g+hQk/ZoHgCSgk3H/tB9E1a1tAzoSKtAPuNzAClXOHE7fstW
	TJJeY5uwgPTeSeYdBDQc+v5RlIPlo29nDUfizqFL5maIvZrtd9Te1OC5yjbafU5+n2rL0eewy2o
	vqlV7pwTG8+u0hbhuhJ7Rjk=
X-Received: by 2002:ac8:5d8d:0:b0:4f1:adf6:5b77 with SMTP id
 d75a77b69052e-50691f547d4mr23867101cf.59.1770873542065; Wed, 11 Feb 2026
 21:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20260123054425.3413000-1-namanj1@kpit.com>
In-Reply-To: <20260123054425.3413000-1-namanj1@kpit.com>
From: Naman Jain <nmjain23@gmail.com>
Date: Thu, 12 Feb 2026 10:48:50 +0530
X-Gm-Features: AZwV_QgWK8qDqoy3IcYmXJjagM3XxDMF2zPegjt79Qjetperd64_ViS-SPSbY9A
Message-ID: <CALCkg5apDM2hjHPiH1dN5+fE7bmDkkvh+9fW1AHMyNO6oB2B4A@mail.gmail.com>
Subject: Re: [meta][master][PATCH] libmd: add ptest for 'libmd'
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006ac0c6064a99a06d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 05:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231011

--0000000000006ac0c6064a99a06d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Can you please check it

On Fri, 23 Jan, 2026, 11:14=E2=80=AFam Naman Jain, <nmjain23@gmail.com> wro=
te:

> Adapt the compile 'test' phony target from Makefile and deploy as
> ptest for libmd.
> It takes less than 30seconds for ptest completion
>
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/libmd/files/run-ptest    | 18 ++++++++++++++++
>  meta/recipes-support/libmd/libmd_1.1.0.bb     | 21 +++++++++++++++++--
>  3 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libmd/files/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index 739995bcfe..b9616e9bf4 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -32,6 +32,7 @@ PTESTS_FAST =3D "\
>      libconvert-asn1-perl \
>      libexif \
>      libgpg-error\
> +    libmd \
>      libnl \
>      libpcre \
>      librsvg \
> diff --git a/meta/recipes-support/libmd/files/run-ptest
> b/meta/recipes-support/libmd/files/run-ptest
> new file mode 100644
> index 0000000000..0c4a5f64ec
> --- /dev/null
> +++ b/meta/recipes-support/libmd/files/run-ptest
> @@ -0,0 +1,18 @@
> +#!/bin/sh
> +
> +cd test
> +status =3D 0
> +
> +for testbin in *; do
> +    if [ -x "$testbin" ] && [ ! -d "$testbin" ]; then
> +        if "./$testbin"; then
> +            echo "PASS: $testbin"
> +        else
> +            echo "FAIL: $testbin"
> +            status=3D1
> +        fi
> +    fi
> +done
> +
> +return $status
> +
> diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb
> b/meta/recipes-support/libmd/libmd_1.1.0.bb
> index dc588a0f95..ffc59deb26 100644
> --- a/meta/recipes-support/libmd/libmd_1.1.0.bb
> +++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
> @@ -8,9 +8,26 @@ HOMEPAGE =3D "https://www.hadrons.org/software/libmd/"
>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0436d4fb62a71f661d6e8b7812f9e=
1df"
>
> -SRC_URI =3D "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.=
xz"
> +SRC_URI =3D "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.=
xz
> \
> +          file://run-ptest \
> +"
>  SRC_URI[sha256sum] =3D
> "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
>
> -inherit autotools
> +inherit autotools ptest
> +
> +do_compile_ptest() {
> +    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
> +    oe_runmake check
> +}
> +
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    for bin in ${B}/test/*; do
> +        if [ -x "$bin" ]; then
> +            ${B}/libtool --mode=3Dinstall install "$bin"
> ${D}${PTEST_PATH}/test/$(basename "$bin")
> +        fi
> +    done
> +}
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>

--0000000000006ac0c6064a99a06d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto">Can you please check it</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, 23 Jan, 2026, 11:14=E2=80=AFam Naman Jain, &lt;<a=
 href=3D"mailto:nmjain23@gmail.com">nmjain23@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Adapt the compile &#39;test&#39; phony t=
arget from Makefile and deploy as<br>
ptest for libmd.<br>
It takes less than 30seconds for ptest completion<br>
<br>
Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=3D=
"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0meta/recipes-support/libmd/files/run-ptest=C2=A0 =C2=A0 | 18 ++++++++=
++++++++<br>
=C2=A0meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0| 21 +++++++++++++++++--<br>
=C2=A03 files changed, 38 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/libmd/files/run-ptest<br>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index 739995bcfe..b9616e9bf4 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -32,6 +32,7 @@ PTESTS_FAST =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0libconvert-asn1-perl \<br>
=C2=A0 =C2=A0 =C2=A0libexif \<br>
=C2=A0 =C2=A0 =C2=A0libgpg-error\<br>
+=C2=A0 =C2=A0 libmd \<br>
=C2=A0 =C2=A0 =C2=A0libnl \<br>
=C2=A0 =C2=A0 =C2=A0libpcre \<br>
=C2=A0 =C2=A0 =C2=A0librsvg \<br>
diff --git a/meta/recipes-support/libmd/files/run-ptest b/meta/recipes-supp=
ort/libmd/files/run-ptest<br>
new file mode 100644<br>
index 0000000000..0c4a5f64ec<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libmd/files/run-ptest<br>
@@ -0,0 +1,18 @@<br>
+#!/bin/sh<br>
+<br>
+cd test<br>
+status =3D 0<br>
+<br>
+for testbin in *; do<br>
+=C2=A0 =C2=A0 if [ -x &quot;$testbin&quot; ] &amp;&amp; [ ! -d &quot;$test=
bin&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;./$testbin&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $testbin&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $testbin&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 fi<br>
+done<br>
+<br>
+return $status<br>
+<br>
diff --git a/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a> b/meta/re=
cipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
index dc588a0f95..ffc59deb26 100644<br>
--- a/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
+++ b/meta/recipes-support/libmd/<a href=3D"http://libmd_1.1.0.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libmd_1.1.0.bb</a><br>
@@ -8,9 +8,26 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.hadrons.org/soft=
ware/libmd/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.ha=
drons.org/software/libmd/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause &amp; BSD-2-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0436d4fb62a71f661d6e8=
b7812f9e1df&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://archive.hadrons.org/software/libmd/li=
bmd-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://archive.hadrons.org/software/libmd/li=
bmd-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1bd6aa42275313af3141c7cf2e5b964e8b1fd488=
025caf2f971f43b00776b332&quot;<br>
<br>
-inherit autotools<br>
+inherit autotools ptest<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 sed -i &quot;/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d&quot; =
test/Makefile<br>
+=C2=A0 =C2=A0 oe_runmake check<br>
+}<br>
+<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test<br>
+=C2=A0 =C2=A0 for bin in ${B}/test/*; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x &quot;$bin&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/libtool --mode=3Dinstall in=
stall &quot;$bin&quot; ${D}${PTEST_PATH}/test/$(basename &quot;$bin&quot;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000006ac0c6064a99a06d--

