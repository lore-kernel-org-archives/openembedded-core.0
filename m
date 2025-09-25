Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB11ECAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 15:31:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.220.1758814272677511856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 08:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FvfRKRYS;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32e715cbad3so1304431a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758814272; x=1759419072; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pIzLRZDc4E9mIbLxM1ZHCW/LbL+nw2fPAyDpiTz4Ukg=;
        b=FvfRKRYSAFym+FH1bJJKv1m6GfuQ8PeaTJZBDmFxSsFkVS9qvm6jqnOWkt4xfQBal5
         PP+lichJRhrBVVF4yqis1ufWniVfDfl5bCkvxofsengmFiEy03tvfLukMdXgWlFTkYiJ
         hSSq2uLeWNy1FUnvmaRpoTVsS7hC1FSbI+VOJjeMsszMvUSQMeAYi7/lYwZZZ0GucFjR
         nY5ANTfhdCbnoHFyQgNTLgJxOeiZW4pagTl34AIEDefLN18kzx33N3b+y8Vj9ExqLbxB
         ZhXkWuWb04WexA9+VOLGmsSW670ghuUhzhkFWZV30TyZrVFD+95fYPkL4nG9/XdpDCzB
         Gi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814272; x=1759419072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIzLRZDc4E9mIbLxM1ZHCW/LbL+nw2fPAyDpiTz4Ukg=;
        b=JzbNCZf0BYNsNqAGBlCrR1Gzkvsp06GYMm42fVdXeQu+rCm8ot5F05RrSGK/NXWeEq
         OSHFR20toHlKKFaI6QGy/33Ul3rkJ8P48syenNv1iqIluqPFpRKESJOzDmwNO5+6R8Jd
         OtG6+VUk83obJ4O60c8csQK52CoE1KT9KFmyiMbNYgzO7XV5QJKNkz+qS8+MVXw8csw4
         UQt4aN91+hD+yYJQPr0eHtGL6G+NuMfiOpMh8FKDiLaxitiFzlaLnSrPIqlfiiMclYnB
         QXzpnvHEGKIB56rR7fBgorP50AdJqRqzJ3jr8Vc3b/ed5c980ithgC/uvxWKRXXMzVqX
         KyhA==
X-Gm-Message-State: AOJu0Yxx0YhHuPYVvyLW0xjKRE1slaEICJU44Ub3zGsxqbRVfNFHdA5i
	ysMLOWKxiXPkfKs0j5vklGpKaVCS7ggCq5SfZep1TNJ1QRsnO0mmGhpSykT/dj1mDIAz74ObUy7
	bi8obayQbOvEBa/7U0s49YhvzzWpZ67U=
X-Gm-Gg: ASbGncuJ3YD7axcBOdm7i8TaqvFUglhuBNrKqUuWRZFOYpGj0TAiFHKMXBo4alWRd/9
	fZEsBaduKt1tDr1EFNvXJy8cj5XrjJIHMAH9wF0tCtPzZABPcooVCwaYpqItuxsvcjT3agJ8fZM
	IQAvej4deHDWInftaCaTiVWnKs8c7p8ZxwB/yLSpoxiN+5qpaVZDfBqReyQ+zFkJZYaWaPEDdkZ
	dzR5VjrveV5VwWQ58GaJwfft/xeRZHOAdgHlRdW2n8PcTApQibPBKEPfoM=
X-Google-Smtp-Source: AGHT+IHJV5vFxY61Ao+JTvPmeS7hZATwsiGixk+pYXMDh/8EmGxwNICEErBGBmAqi1yAOxjadsGX8rfu5DFu7Pr0+oU=
X-Received: by 2002:a17:90b:1e03:b0:32b:b514:3928 with SMTP id
 98e67ed59e1d1-3342a2e2427mr4929227a91.33.1758814271010; Thu, 25 Sep 2025
 08:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250925152651.3059868-1-ross.burton@arm.com>
In-Reply-To: <20250925152651.3059868-1-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Sep 2025 11:30:59 -0400
X-Gm-Features: AS18NWDKl7QrGDAXSMuY2OAFT1QRxx1x11SdKX62Z-e5w0dwwIvKbv1YelK8XYg
Message-ID: <CADkTA4M0i60mteyct3fhXqraoEemC2K0fD0aunEemCPNOqNhgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: do builds in a clean build tree
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d979cd063fa1db8e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 15:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224044

--000000000000d979cd063fa1db8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 11:27=E2=80=AFAM Ross Burton via lists.openembedded=
.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Set B to WORKDIR/build and clean that on configure so we ensure that the
> build tree is clean.
>
>
Ack'd

There's no special reason for why we were building it without a designated
build
directory.

Bruce



> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 3b9e52fdb84..00b869e8b18 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -69,6 +69,8 @@ include ${@bb.utils.contains('PACKAGECONFIG', 'perl',
> 'perf-perl.inc', '', d)}
>  inherit kernelsrc
>
>  S =3D "${UNPACKDIR}/${BP}"
> +B =3D "${WORKDIR}/build"
> +do_configure[cleandirs] +=3D "${B}"
>
>  # The LDFLAGS is required or some old kernels fails due missing
>  # symbols and this is preferred than requiring patches to every old
> @@ -424,7 +426,7 @@ perf_fix_sources () {
>                         util/pmu-flex.h util/expr-flex.h util/expr-flex.c=
;
> do
>                 f=3D${PKGD}${TARGET_DBGSRC_DIR}/$f
>                 if [ -e $f ]; then
> -                       sed -i -e 's#${S}/##g' $f
> +                       sed -i -e 's#${B}/##g' $f
>                 fi
>         done
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224043):
> https://lists.openembedded.org/g/openembedded-core/message/224043
> Mute This Topic: https://lists.openembedded.org/mt/115432523/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d979cd063fa1db8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 25, 2025 at 11:27=
=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.ope=
nembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Set B to WORKDIR/build and cle=
an that on configure so we ensure that the<br>
build tree is clean.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Ack&#39;d</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">There&#39;s no special reason for why we were building it without a desig=
nated build</div><div class=3D"gmail_default" style=3D"font-size:small">dir=
ectory.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 3b9e52fdb84..00b869e8b18 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -69,6 +69,8 @@ include ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#3=
9;perl&#39;, &#39;perf-perl.inc&#39;, &#39;&#39;, d)}<br>
=C2=A0inherit kernelsrc<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/${BP}&quot;<br>
+B =3D &quot;${WORKDIR}/build&quot;<br>
+do_configure[cleandirs] +=3D &quot;${B}&quot;<br>
<br>
=C2=A0# The LDFLAGS is required or some old kernels fails due missing<br>
=C2=A0# symbols and this is preferred than requiring patches to every old<b=
r>
@@ -424,7 +426,7 @@ perf_fix_sources () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 util/pmu-flex.h util/expr-flex.h util/expr-flex.c; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=3D${PKGD}${TARGET=
_DBGSRC_DIR}/$f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e $f ]; then<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -i -e &#39;s#${S}/##g&#39; $f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -i -e &#39;s#${B}/##g&#39; $f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224043): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224043" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224043</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115432523/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115432523/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000d979cd063fa1db8e--

