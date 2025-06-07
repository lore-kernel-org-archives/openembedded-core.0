Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40C7C5B543
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 18:19:12 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.23607.1749320349795757258
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 11:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=XGi/l6mp;
 spf=pass (domain: snapchat.com, ip: 209.85.208.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6069d764980so7834217a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1749320348; x=1749925148; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=30xjgRp7BSTrEKUVLfJln19WYJCUlIqdADHduj/o4Eg=;
        b=XGi/l6mpX5V0WhwYy11if91WJe7q+frW2q8grkqPIW4babxBaZ0J9uk6qB9r0MVR4k
         L6HIQCu69vqmi8wWx42JsN2u9vJtlV9Wdha4xTp2exD4/RlkYlgJE8SHvTt0Y+VENOsf
         Gs1zyoDckxElqxj+6TvNuUAyEIXdXAVJzMEzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749320348; x=1749925148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30xjgRp7BSTrEKUVLfJln19WYJCUlIqdADHduj/o4Eg=;
        b=Fdw9QO11QuZwAn8hxa+Y80MlTrvQpytOZapNH7rIIiGC8+OZ/mcJBHgf7uzrH/4nLK
         C33UuKK8lfRgZU9rf00MMqlIbQif40pPHg3fYVPWQORBfWK/9q0mTUtxJR3omj3J47SW
         DsCJRlPuJ+lozgHBbcINxTkwQUaLqLPG0hy+rKctiEj7gwwym67G19x7IksbIxTQIGrg
         t19/OdE1yB+hsuVvVx1tTi57YuEfM9ZNitFfYqG5cNluy3xbe1XxdR4MYAY6znZlz26h
         4bSAnKsKE5ye9cQwsJMEgo8YKnJxRhMY5DjFyD7Upt8Yzwf7AY8doHf6LwkhpIUDvio0
         oNEQ==
X-Gm-Message-State: AOJu0Yy9goMJSr9bjPqNcmruVrYq2enGfuOVaN1YTSf5ga4ZHbYW5NH4
	Pk4pd0MVQiWTHCDZ+DQvQ629WyWbp67aZotDJaJy8jBmbSkc2UIWDFEf7oxb65BoRgXcvVGtPLY
	CrVHgs4ol9fEhS1u2qhy36AVPHOe8FgiN4x+uEjiMZw==
X-Gm-Gg: ASbGncutwP5ZJtFivyE0dQX3mAvGq1XPYIfjj8Q+XsosHDZzNB/doZ8RgFECv6uQnjQ
	vK6zc3dWlqJFTAUr0G2W+Ix30BDm2sdUcHZSTU6J1UWOad0UmQevqUoiqv0qio+IMM5l61JJIQt
	2iAGPX2Exeh3msMJp9CgEcDp95Dqh+BDkjlMSQFhjCsKA=
X-Google-Smtp-Source: AGHT+IGgbTrDIUpcRqXWvtQlzBEnAOmXa73XU4UBV7djDV1+RVjKs/s/TnDCOkD+CB3UpWlgxu0lfuPYF4ZAZtjsPtI=
X-Received: by 2002:a17:907:2dab:b0:ad8:e448:6c64 with SMTP id
 a640c23a62f3a-ade0787f496mr973673066b.24.1749320348119; Sat, 07 Jun 2025
 11:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250607143512.484259-1-ecordonnier@snap.com> <1846C96415AFC342.11623@lists.openembedded.org>
In-Reply-To: <1846C96415AFC342.11623@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Sat, 7 Jun 2025 20:18:57 +0200
X-Gm-Features: AX0GCFs6Yt6wMJRtnlvMg2L2pgSoq1WO0KcsN8ksUH8ZZG1lVqpJyUjHiiMHMxw
Message-ID: <CAHUKmYb2s02KZGwJKeESOmawNjri785ZSVVfGimVtdBY7p7TKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] findutils: use getlimits from findutils
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f2dee00636ff61b9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 18:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218203

--000000000000f2dee00636ff61b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I've tested the patch and it works fine, however during my rebase a
trailing dollar was introduced at the end of this line:
+    install -m 755 ${B}/find/getlimits ${D}${PTEST_PATH}/$

I can resend the patch series if needed, but that's the only change
required. Sorry about that.

=C3=89tienne

On Sat, Jun 7, 2025 at 4:35=E2=80=AFPM Etienne Cordonnier via lists.openemb=
edded.org
<ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Having findutils depending on coreutils-getlimits makes it harder to
> replace GNU coreutils with uutils-coreutils
> using PREFERRED_PROVIDER.
> Also, the findutils repository contains a version of getlimits used for
> the tests, so there is no need to depend
> on coreutils's version of getlimits.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-extended/findutils/findutils/run-ptest | 3 +++
>  meta/recipes-extended/findutils/findutils_4.10.0.bb | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/findutils/findutils/run-ptest
> b/meta/recipes-extended/findutils/findutils/run-ptest
> index 3dec117067..0c9af47efd 100644
> --- a/meta/recipes-extended/findutils/findutils/run-ptest
> +++ b/meta/recipes-extended/findutils/findutils/run-ptest
> @@ -5,6 +5,9 @@ ln -s /usr/bin/find /tmp/oldfind
>  # make oldfind visible
>  export PATH=3D"/tmp:${PATH}"
>
> +# Add findutils ptest directory to PATH for getlimits
> +export PATH=3D"/usr/lib/findutils/ptest:${PATH}"
> +
>  export built_programs=3D"find xargs locate updatedb"
>
>  # this gets substituted by sed during build
> diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb
> b/meta/recipes-extended/findutils/findutils_4.10.0.bb
> index 508485bcd3..15dedb3582 100644
> --- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
> @@ -15,12 +15,13 @@ CACHED_CONFIGUREVARS +=3D "gl_cv_func_wcwidth_works=
=3Dyes"
>  EXTRA_OECONF +=3D "ac_cv_path_SORT=3D${bindir}/sort"
>
>  # need od from coreutils for -t option
> -RDEPENDS:${PN}-ptest +=3D "bash sed grep coreutils coreutils-getlimits"
> +RDEPENDS:${PN}-ptest +=3D "bash sed grep coreutils"
>
>  do_install_ptest:class-target() {
>      mkdir -p ${D}${PTEST_PATH}/tests/
>      cp ${S}/init.cfg ${D}${PTEST_PATH}
>      cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +    install -m 755 ${B}/find/getlimits ${D}${PTEST_PATH}/$
>
>      # substitute value in run-ptest with actual version
>      sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-pte=
st
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218197):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_218197&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3D-nlFzTZahyvVY_v3eEDMoUCaCqsrG2LPNZeCTKOjTE9-LIxsa-JmXS5mTr_aPQQC&s=3DDaJ=
W6kfmBfV3mTY4K3CYbtobCTGQDxyhS64FctqtQCE&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_113520661_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D-nlFzTZahyvVY=
_v3eEDMoUCaCqsrG2LPNZeCTKOjTE9-LIxsa-JmXS5mTr_aPQQC&s=3DHzs1Ld-h7P0Gb3qTL_5=
nCvzj6_zqxTdAgszG4UNPZ9w&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D-nlFzT=
ZahyvVY_v3eEDMoUCaCqsrG2LPNZeCTKOjTE9-LIxsa-JmXS5mTr_aPQQC&s=3DamzbbfpWZhWf=
6j4wZ-8C2zz7-uJSxX3W_Ur0sBi6anM&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f2dee00636ff61b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br>I&#39;ve tested the patch and it w=
orks fine, however during my rebase a trailing dollar was introduced at the=
 end of this line:<br>+=C2=A0 =C2=A0 install -m 755 ${B}/find/getlimits ${D=
}${PTEST_PATH}/$</div><br>I can resend the patch series if needed, but that=
&#39;s the only change required. Sorry about that.<br><br>=C3=89tienne<br><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jun 7, 2025 at 4:35=E2=80=AFPM Etienne Cordonnier v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordo=
nnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
Having findutils depending on coreutils-getlimits makes it harder to replac=
e GNU coreutils with uutils-coreutils<br>
using PREFERRED_PROVIDER.<br>
Also, the findutils repository contains a version of getlimits used for the=
 tests, so there is no need to depend<br>
on coreutils&#39;s version of getlimits.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/findutils/findutils/run-ptest | 3 +++<br>
=C2=A0meta/recipes-extended/findutils/<a href=3D"http://findutils_4.10.0.bb=
" rel=3D"noreferrer" target=3D"_blank">findutils_4.10.0.bb</a> | 3 ++-<br>
=C2=A02 files changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/findutils/findutils/run-ptest b/meta/rec=
ipes-extended/findutils/findutils/run-ptest<br>
index 3dec117067..0c9af47efd 100644<br>
--- a/meta/recipes-extended/findutils/findutils/run-ptest<br>
+++ b/meta/recipes-extended/findutils/findutils/run-ptest<br>
@@ -5,6 +5,9 @@ ln -s /usr/bin/find /tmp/oldfind<br>
=C2=A0# make oldfind visible<br>
=C2=A0export PATH=3D&quot;/tmp:${PATH}&quot;<br>
<br>
+# Add findutils ptest directory to PATH for getlimits<br>
+export PATH=3D&quot;/usr/lib/findutils/ptest:${PATH}&quot;<br>
+<br>
=C2=A0export built_programs=3D&quot;find xargs locate updatedb&quot;<br>
<br>
=C2=A0# this gets substituted by sed during build<br>
diff --git a/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.=
10.0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.10.0.bb</a> b/met=
a/recipes-extended/findutils/<a href=3D"http://findutils_4.10.0.bb" rel=3D"=
noreferrer" target=3D"_blank">findutils_4.10.0.bb</a><br>
index 508485bcd3..15dedb3582 100644<br>
--- a/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.10.0.bb=
" rel=3D"noreferrer" target=3D"_blank">findutils_4.10.0.bb</a><br>
+++ b/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.10.0.bb=
" rel=3D"noreferrer" target=3D"_blank">findutils_4.10.0.bb</a><br>
@@ -15,12 +15,13 @@ CACHED_CONFIGUREVARS +=3D &quot;gl_cv_func_wcwidth_work=
s=3Dyes&quot;<br>
=C2=A0EXTRA_OECONF +=3D &quot;ac_cv_path_SORT=3D${bindir}/sort&quot;<br>
<br>
=C2=A0# need od from coreutils for -t option<br>
-RDEPENDS:${PN}-ptest +=3D &quot;bash sed grep coreutils coreutils-getlimit=
s&quot;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;bash sed grep coreutils&quot;<br>
<br>
=C2=A0do_install_ptest:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${PTEST_PATH}/tests/<br>
=C2=A0 =C2=A0 =C2=A0cp ${S}/init.cfg ${D}${PTEST_PATH}<br>
=C2=A0 =C2=A0 =C2=A0cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
+=C2=A0 =C2=A0 install -m 755 ${B}/find/getlimits ${D}${PTEST_PATH}/$<br>
<br>
=C2=A0 =C2=A0 =C2=A0# substitute value in run-ptest with actual version<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s/__run_ptest_version__/${PV}/&#39; ${D}=
${PTEST_PATH}/run-ptest<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#218197): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_21=
8197&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D-nlFzTZahyvVY_v3eE=
DMoUCaCqsrG2LPNZeCTKOjTE9-LIxsa-JmXS5mTr_aPQQC&amp;s=3DDaJW6kfmBfV3mTY4K3CY=
btobCTGQDxyhS64FctqtQCE&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_218197&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3D-nlFzTZahyvVY_v3eEDMoUCaCqsrG2LPNZeCTKOjTE9-LIxsa-JmXS5mTr_aPQ=
QC&amp;s=3DDaJW6kfmBfV3mTY4K3CYbtobCTGQDxyhS64FctqtQCE&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_113520661_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3D-nlFzTZahyvVY_v3eEDMoUCaCqsrG2LPNZeCTKOjTE9-LI=
xsa-JmXS5mTr_aPQQC&amp;s=3DHzs1Ld-h7P0Gb3qTL_5nCvzj6_zqxTdAgszG4UNPZ9w&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_113520661_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D-nlFzTZahyvVY_v3eEDMoUCaCqsrG2L=
PNZeCTKOjTE9-LIxsa-JmXS5mTr_aPQQC&amp;s=3DHzs1Ld-h7P0Gb3qTL_5nCvzj6_zqxTdAg=
szG4UNPZ9w&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3D-nlFzTZahyvVY_v3eEDMoUCaCqsrG2LPNZeCTKOjTE9=
-LIxsa-JmXS5mTr_aPQQC&amp;s=3DamzbbfpWZhWf6j4wZ-8C2zz7-uJSxX3W_Ur0sBi6anM&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D-nlFzTZahyvVY_v3eEDM=
oUCaCqsrG2LPNZeCTKOjTE9-LIxsa-JmXS5mTr_aPQQC&amp;s=3DamzbbfpWZhWf6j4wZ-8C2z=
z7-uJSxX3W_Ur0sBi6anM&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f2dee00636ff61b9--

