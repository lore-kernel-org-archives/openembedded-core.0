Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C492DC5B543
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 14:54:21 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.19960.1749308058079352610
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 07:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Rn+KtXOC;
 spf=pass (domain: snapchat.com, ip: 209.85.208.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso808915a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1749308056; x=1749912856; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e/KgGGfc15qGI0G4V77pvMOgJj5OCn6XyRlHME4vYPU=;
        b=Rn+KtXOCFtAGmejm4keXHxPw/aWuPoIteHK1pZAd4bwpT8q4QqdgXH9r+yUZ5In6WB
         +u8dS3dIV9yrj+mMkSToG3aH40oMZldSgzqHXPs24H9Zz3T1BEFWr8EPZ+wNorGk4X0+
         eM5pM6QcVBNgPh57qdm6JIDz0dndJipz45iyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749308056; x=1749912856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/KgGGfc15qGI0G4V77pvMOgJj5OCn6XyRlHME4vYPU=;
        b=wWArf4hIRNSDN2ApaQtcUFMXT9ROCJ+mK6Kg7ikw/fhfJT+Tfxn6mI7O/4vYzOcPB2
         XUouwXaoHod2Y0qQIxdk6i/oRs5/d6FPFeTccM4kYA7X7rB1C2lIxCKdp90E9az447iF
         AzeoQ6RZrcTuFNPyUX5fCmNJWT/LsoJubEz3fnnB99GfPXn3NBxeXG7i7G7r3Dyqx3Ee
         fYqIkyS4hrMjua0jqPz4WU3OgB6kEwlv/0VznQgmqeLVTZZwQxsM75Tmvn1cHE0KU+25
         LFi04BQYLc42BF6u0dtqIjCtyivik88aS/6U63L4n5KTkxBg0IqieHyPZ8/q17Ndu99V
         b1lw==
X-Gm-Message-State: AOJu0YwLRChFrV+UiwuONYKz9WAtXDqzADUTd4aBGKWVxPnJtKQKjmA2
	K7PLWPCs7QDJ99CD6AXtQWcVS049YSUoD8jl2F7cztyxJzLqrjr6eEfODG5hhPyCMxXPRY2IXjI
	sQE3UYCtD78uLTT4GSA8DC1cXnWn2ZNZdZXh3XNy08Q==
X-Gm-Gg: ASbGncvCAP7ES6CCFzs4zk1G1071Njkj4JFQsUUGbfTnagSUKx9RioqdfdDWD0OhxJK
	axundkVU3RVP0/JX7lHbthiO86xcygQpe77Hop9aNgpXt2D2UauyLuSBMOLf7tCMJK/K+gYNKWe
	/nJaSayxipZVkF4w27hB6f/ARczSkpV9USRkUgD1MlKcpEVxZiwnQg3A==
X-Google-Smtp-Source: AGHT+IE80MrH1pokVLaBQfjpZGVpNakMMDHJ5L6qMrsHUyIKHwC8nSJL3oRlKZlOdelFg884IWWzx0w8DQGwNCksA+A=
X-Received: by 2002:a17:907:970b:b0:ad5:3055:a025 with SMTP id
 a640c23a62f3a-ade1a8ece90mr641210466b.6.1749308056307; Sat, 07 Jun 2025
 07:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250607143512.484259-1-ecordonnier@snap.com> <1846C964E9540149.17668@lists.openembedded.org>
In-Reply-To: <1846C964E9540149.17668@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Sat, 7 Jun 2025 16:54:05 +0200
X-Gm-Features: AX0GCFuWdBxmmYcniD_zCh4hDyKjkfmAoEarNDKo5cznkfUG61hf-ZVSchPmIUE
Message-ID: <CAHUKmYYrZiK+Fwyqwph2z6nr=6w2nSaLL-W=kc_=V9k20w8Rqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] Revert "coreutils: split out coreutils-getlimits"
To: ecordonnier@snap.com, Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004cb4d80636fc85fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 14:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218199

--0000000000004cb4d80636fc85fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qi Chen,
is this patch OK? Or were there other recipes than findutils which needed
coreutils-getlimits? If there are other recipes which need getlimits, I
could create a small recipe providing getlimits instead of the patches I
sent.

Regards,
=C3=89tienne


On Sat, Jun 7, 2025 at 4:35=E2=80=AFPM Etienne Cordonnier via lists.openemb=
edded.org
<ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> This reverts commit 149584beef1e1b28a4e51f40515204e7edaa9d1f.
>
> The coreutils-getlimits package is no longer needed since findutils-ptest
> now uses its own getlimits implementation. This improves modularity and
> makes it easier to use alternative coreutils implementations via
> PREFERRED_PROVIDER
> (e.g. uutils-coreutils recipe in meta-openembedded).
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-core/coreutils/coreutils_9.7.bb | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb
> b/meta/recipes-core/coreutils/coreutils_9.7.bb
> index 091e1ea2c5..dc9dfae26b 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.7.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.7.bb
> @@ -74,11 +74,6 @@ RDEPENDS:coreutils:class-target +=3D
> "${@bb.utils.contains('PACKAGECONFIG', 'singl
>  # regardless of whether single-binary is in effect.
>  RPROVIDES:coreutils +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'single-binary', 'coreutils-stdbuf', '', d)}"
>
> -# put getlimits into coreutils-getlimits, because other ptest packages
> such as
> -# findutils-ptest may need this command. Note that getlimits is a
> noinst_PROGRAM
> -PACKAGE_BEFORE_PN:class-target +=3D "${PN}-getlimits"
> -FILES:${PN}-getlimits =3D "${bindir}/getlimits"
> -
>  # Deal with a separate builddir failure if src doesn't exist when
> creating version.c/version.h
>  do_compile:prepend () {
>         mkdir -p ${B}/src
> @@ -106,9 +101,6 @@ do_install:append() {
>         # in update-alternatives to fail, therefore use lbracket - the
> name used
>         # for the actual source file.
>         mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
> -
> -       # this getlimits noinst_PROGRAM would possibly be needed by other
> ptest packages
> -       install ${B}/src/getlimits ${D}/${bindir}
>  }
>
>  inherit update-alternatives
> @@ -213,6 +205,7 @@ do_install_ptest () {
>          fi
>      done
>
> +    install ${B}/src/getlimits ${D}/${bindir}
>      # handle multilib
>      sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
>  }
> @@ -224,6 +217,7 @@ do_install_ptest:append:libc-musl () {
>      sed -i -e '/tests\/split\/line-bytes.sh/d' ${D}${PTEST_PATH}/Makefil=
e
>  }
>
> -RDEPENDS:${PN}-ptest +=3D "${PN}-getlimits xz  \
> +RDEPENDS:${PN}-ptest +=3D "xz  \
>                           ${@bb.utils.contains('PACKAGECONFIG', 'acl',
> 'acl', '', d)} \
>                           ${@bb.utils.contains('PACKAGECONFIG', 'xattr',
> 'attr', '', d)}"
> +FILES:${PN}-ptest +=3D "${bindir}/getlimits"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218198):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_218198&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DA9bEAAbvLazUdYd37esvLuMf7rJlZmHAglqENz6xHoWpT5ZGUQJDNRe7hac1mj6M&s=3DlCx=
BdFhVad7CRLo0B-qWW7q5CaAp1j3Zv6phlXg3rGs&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_113520662_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DA9bEAAbvLazUd=
Yd37esvLuMf7rJlZmHAglqENz6xHoWpT5ZGUQJDNRe7hac1mj6M&s=3DiuhfYUTV70oP7RaX64p=
8FGjCw_N5WcrvOp_tiPSRIcw&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DA9bEAA=
bvLazUdYd37esvLuMf7rJlZmHAglqENz6xHoWpT5ZGUQJDNRe7hac1mj6M&s=3DgupniZrbLUmq=
zKv61gy_aB1AhBaveHZg76FdUopAki8&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004cb4d80636fc85fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Qi Chen,<br>is this patch OK? Or were there other recip=
es than findutils which needed coreutils-getlimits? If there are other reci=
pes which need getlimits, I could create a small recipe providing getlimits=
 instead of the patches I sent.<br><br>Regards,<br>=C3=89tienne<br><br></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sat, Jun 7, 2025 at 4:35=E2=80=AFPM Etienne Cordonnier=
 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &=
lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Etienne Cordonnier &lt;<a href=3D"mailto:ecor=
donnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
This reverts commit 149584beef1e1b28a4e51f40515204e7edaa9d1f.<br>
<br>
The coreutils-getlimits package is no longer needed since findutils-ptest<b=
r>
now uses its own getlimits implementation. This improves modularity and<br>
makes it easier to use alternative coreutils implementations via PREFERRED_=
PROVIDER<br>
(e.g. uutils-coreutils recipe in meta-openembedded).<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.7.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_9.7.bb</a> | 12 +++---------<br=
>
=C2=A01 file changed, 3 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.7.bb=
" rel=3D"noreferrer" target=3D"_blank">coreutils_9.7.bb</a> b/meta/recipes-=
core/coreutils/<a href=3D"http://coreutils_9.7.bb" rel=3D"noreferrer" targe=
t=3D"_blank">coreutils_9.7.bb</a><br>
index 091e1ea2c5..dc9dfae26b 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.7.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_9.7.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.7.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_9.7.bb</a><br>
@@ -74,11 +74,6 @@ RDEPENDS:coreutils:class-target +=3D &quot;${@bb.utils.c=
ontains(&#39;PACKAGECONFIG&#39;, &#39;singl<br>
=C2=A0# regardless of whether single-binary is in effect.<br>
=C2=A0RPROVIDES:coreutils +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;single-binary&#39;, &#39;coreutils-stdbuf&#39;, &#39;&#39;, d)=
}&quot;<br>
<br>
-# put getlimits into coreutils-getlimits, because other ptest packages suc=
h as<br>
-# findutils-ptest may need this command. Note that getlimits is a noinst_P=
ROGRAM<br>
-PACKAGE_BEFORE_PN:class-target +=3D &quot;${PN}-getlimits&quot;<br>
-FILES:${PN}-getlimits =3D &quot;${bindir}/getlimits&quot;<br>
-<br>
=C2=A0# Deal with a separate builddir failure if src doesn&#39;t exist when=
 creating version.c/version.h<br>
=C2=A0do_compile:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${B}/src<br>
@@ -106,9 +101,6 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in update-alternatives to fail, therefore use=
 lbracket - the name used<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # for the actual source file.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN=
}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# this getlimits noinst_PROGRAM would possibly =
be needed by other ptest packages<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/src/getlimits ${D}/${bindir}<br>
=C2=A0}<br>
<br>
=C2=A0inherit update-alternatives<br>
@@ -213,6 +205,7 @@ do_install_ptest () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0done<br>
<br>
+=C2=A0 =C2=A0 install ${B}/src/getlimits ${D}/${bindir}<br>
=C2=A0 =C2=A0 =C2=A0# handle multilib<br>
=C2=A0 =C2=A0 =C2=A0sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-pte=
st<br>
=C2=A0}<br>
@@ -224,6 +217,7 @@ do_install_ptest:append:libc-musl () {<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;/tests\/split\/<a href=3D"http://line-by=
tes.sh/d" rel=3D"noreferrer" target=3D"_blank">line-bytes.sh/d</a>&#39; ${D=
}${PTEST_PATH}/Makefile<br>
=C2=A0}<br>
<br>
-RDEPENDS:${PN}-ptest +=3D &quot;${PN}-getlimits xz=C2=A0 \<br>
+RDEPENDS:${PN}-ptest +=3D &quot;xz=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;acl&#3=
9;, &#39;acl&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;xattr&=
#39;, &#39;attr&#39;, &#39;&#39;, d)}&quot;<br>
+FILES:${PN}-ptest +=3D &quot;${bindir}/getlimits&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#218198): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_21=
8198&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DA9bEAAbvLazUdYd37e=
svLuMf7rJlZmHAglqENz6xHoWpT5ZGUQJDNRe7hac1mj6M&amp;s=3DlCxBdFhVad7CRLo0B-qW=
W7q5CaAp1j3Zv6phlXg3rGs&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_218198&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DA9bEAAbvLazUdYd37esvLuMf7rJlZmHAglqENz6xHoWpT5ZGUQJDNRe7hac1mj=
6M&amp;s=3DlCxBdFhVad7CRLo0B-qWW7q5CaAp1j3Zv6phlXg3rGs&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_113520662_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DA9bEAAbvLazUdYd37esvLuMf7rJlZmHAglqENz6xHoWpT5=
ZGUQJDNRe7hac1mj6M&amp;s=3DiuhfYUTV70oP7RaX64p8FGjCw_N5WcrvOp_tiPSRIcw&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_113520662_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DA9bEAAbvLazUdYd37esvLuMf7rJlZmH=
AglqENz6xHoWpT5ZGUQJDNRe7hac1mj6M&amp;s=3DiuhfYUTV70oP7RaX64p8FGjCw_N5WcrvO=
p_tiPSRIcw&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DA9bEAAbvLazUdYd37esvLuMf7rJlZmHAglqENz6xHoW=
pT5ZGUQJDNRe7hac1mj6M&amp;s=3DgupniZrbLUmqzKv61gy_aB1AhBaveHZg76FdUopAki8&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DA9bEAAbvLazUdYd37esv=
LuMf7rJlZmHAglqENz6xHoWpT5ZGUQJDNRe7hac1mj6M&amp;s=3DgupniZrbLUmqzKv61gy_aB=
1AhBaveHZg76FdUopAki8&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004cb4d80636fc85fc--

