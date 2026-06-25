Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32045CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 07:18:46 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5974.1782371920856196808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 00:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KWbHHBUa;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4624a44e152so1600444f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 00:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782371919; cv=none;
        d=google.com; s=arc-20260327;
        b=nkl79/tMKvR/jYcb41tQnVaq5OsYmpEseEypi6jFlndlsNPqQzSzhq/ZH1mFN6MnZz
         PgKhdnTTkwmYtxowVR2pcJWR5biA93ET4kwYnhwN38qvxjBJVeZncWZ0oh4mgkyS8OT1
         OPHpEU/pJ+0UGIfn0BIL0h2kpI2PO9r78Q/5by7UrI5cjjCFJ4EmmpRPsLjI1KCaIRsv
         08CJxl000tMSvAuP4tozyGE14R7HI6p55jC+MCH7RNcwDXaRHM32ix42uDhKkGuAS5jU
         sCgBkiKP6oyBZRVwaIBhUEN5aS2bDNpFpJ1gDYvpLtN90Ij4qp3uit8IzmAbutJD5ode
         1k3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2vtzIOEqHUfVDYWeLLhUtFMiaqK20n2Fxi994zN2ocI=;
        fh=GdwBnR3LvlLTEv75Ufd9sTT9aMnQnW0ygJJoMacso18=;
        b=Yp+OSlTfz2aTJuR/BpOUWXlLuqiwz0uoKoV3FGnCIgJCpT9N7r3hGpbq70tJvrCoU3
         Qt3Jhco2jjBmoKowkXB2+1CPW2Ci7CDJWBFJMgQxZhK5eqUaAh5PgL9H1PMOb8Bv0xLB
         L9pSCl0bQisZeal4279pO3q9ndjeZIh3QvRHjSAPQFXDXvXYAas4esnX0K+LixHELtVQ
         ASTpFxRkBE+6Czk9DnlUJ4CYIDlBSekbo1BKDwJYmfKegp+SbfTh5Er/T0joLWt9NtvV
         TyZYQwSXncQjBUeXLILjgs1SmPxbhkGzFNjD8L74MeXM6cI1cxvOzvTL3HdTPWKUIU6n
         vfGw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782371919; x=1782976719; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2vtzIOEqHUfVDYWeLLhUtFMiaqK20n2Fxi994zN2ocI=;
        b=KWbHHBUaHpubefzCJR90Tfa+BS/u/RW7eYBi+WekjMF+jo28Sip/k5A4/ZlykR3EA3
         QddjDkHgZ5Oxq59C2xuy0KR28LX8lrIl6HA8RJ8jvjVQZ7MtwHPr/c7XYNuRYkWqm3Kz
         qWlg4Z6ShWuRxs41NQgs5eEo4MxNyDHz4qQe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371919; x=1782976719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vtzIOEqHUfVDYWeLLhUtFMiaqK20n2Fxi994zN2ocI=;
        b=MFajZFBqti02XPYxrnQOlhZAsrZ8BgbyLyaf125yeAGO1bwBns+mncGU8IryHjdC7m
         R+9g9X4IcjrqkewCtVfGWJv7pjVxIGuGZz7WS50x7LQURaugkKEkdZF8uCdaVfOYVCHr
         EepsHsI0X1i6WXNipVa+Xp97y10do8lGG/2gRpsbH6/zJxPtMVGMoQ2O+QceQZSA2sdb
         mQcyQOj2PApNhmp+0QUoJmT6KvaKKWNDdY+VnKnkwDmm/W2pDGyGY0Vfh7CQpX5df2vg
         MHWsWgA/6rYy6IiZToUxv94g522cNC0s82+KEN8aSw0apEK0SspA4fAysQsObTSCeP+U
         LdoQ==
X-Gm-Message-State: AOJu0YyQTLAaqx7++dG8fTP5WP+OKTxaiYD8EG1ugWr+HHcNL6l4KMvt
	wqwdo803bVbcC8Dyc7PM3KANDYFxweOWhPD5fTLwHjgMok1NZ8KTD+9AQRGd1FpihMhjHnhcrsW
	Dd5fbxsNywGw6ezJI1pPs5aXgbQUGk1E9n1U7h3wH6Q==
X-Gm-Gg: AfdE7cn+gVTQsH+0sam4GObs6g6FetyCiIm3PIuTiAu4Nw9qZK2ZF+4kWqsn6q6OBp1
	GGB0c/GKS8z6VFOE+DmADh59tNZDT4r1P5rkdvlBD5LCfltJ73GpVhnX4s1I3KLdIQoibmjgnvF
	7/gZsvlp7N3wtHDAxaJzhcMsJrBG1eVvx23iipdAW5wgO1eFCA+JJEZ6isol4X/wWKxv3+ifWZC
	UkWmiK0tvwYTKFla/X9CM+oR3BMAkicSELYIgLzzonV8c8dbEgP9TvmJxga4CuSsZRurIc8V8Mv
	exDJWyLBUqFOJhMKbiYkcVeJL5fNZA==
X-Received: by 2002:a05:6000:ac5:b0:46b:150e:319c with SMTP id
 ffacd0b85a97d-46dc2ef1412mr1093020f8f.39.1782371918890; Thu, 25 Jun 2026
 00:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260624223336.1254487-1-kris.gavvala@windriver.com>
In-Reply-To: <20260624223336.1254487-1-kris.gavvala@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 25 Jun 2026 09:18:13 +0200
X-Gm-Features: AVVi8CdLpBx2SEL8vjCo9BUadWvG1OBKYEEEpA7QrpDZLm-V1L2TcKdWUWnEcFk
Message-ID: <CAMSfU+4DoS4g1hZdLtK45fo3rmqiXXthb5kNusWjcts+S8MV9w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: skiptest tracemalloc_track_race
To: Kris.Gavvala@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000015600806550ecd88"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 07:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239546

--00000000000015600806550ecd88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 25 juin 2026 =C3=A0 00:35, Gavvala, Kris via lists.openembedded.org
<Kris.Gavvala=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit :

> In python3 ptests for whinlatter, tracemalloc_track_race fails with a
> segfault.
> To avoid ptest failures for now, skip test_tracemalloc_track_race in
> ptests if using glibc or musl.
> Making the change on master to backport to whinlatter.
>

Hello,

I think you meant "wrynose" instead of whinlatter (which is EOL).

Thanks!


>
> Fixes [YOCTO #16182]
> Upstream Issue: https://github.com/python/cpython/issues/143143
>
> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> ---
>  meta/recipes-devtools/python/python3_3.14.6.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb
> b/meta/recipes-devtools/python/python3_3.14.6.bb
> index 291bde70f6..0fd1831b86 100644
> --- a/meta/recipes-devtools/python/python3_3.14.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.6.bb
> @@ -320,6 +320,14 @@ SKIPPED_TESTS:append:libc-musl =3D " \
>      --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym=
 \
>  "
>
> +# Fails due to potential race condition so remove it for glibc and musl
> +# Bugzilla YP 16182 (test_tracemalloc)
> +SKIPPED_TESTS:append:libc-glibc =3D " \
> +    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race =
\
> +"
> +SKIPPED_TESTS:append:libc-musl =3D " \
> +    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race =
\
> +"
>
>  do_install_ptest:append () {
>      sed -i -e "s|SKIPPED_TESTS=3D|SKIPPED_TESTS=3D\"${SKIPPED_TESTS}\"|"
> ${D}${PTEST_PATH}/run-ptest
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239532):
> https://lists.openembedded.org/g/openembedded-core/message/239532
> Mute This Topic: https://lists.openembedded.org/mt/119965939/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000015600806550ecd88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 25=
 juin 2026 =C3=A0=C2=A000:35, Gavvala, Kris via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;Kris.Gavvala=3D<a href=3D"mai=
lto:windriver.com@lists.openembedded.org">windriver.com@lists.openembedded.=
org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">In python3 ptests for whinlatter, tracemalloc_track_race fa=
ils with a segfault.<br>
To avoid ptest failures for now, skip test_tracemalloc_track_race in ptests=
 if using glibc or musl.<br>
Making the change on master to backport to whinlatter.<br></blockquote><div=
><br></div><div>Hello,</div><div><br></div><div>I think you meant &quot;wry=
nose&quot; instead of whinlatter (which is EOL).</div><div><br></div><div>T=
hanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Fixes [YOCTO #16182]<br>
Upstream Issue: <a href=3D"https://github.com/python/cpython/issues/143143"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/python/cpython/iss=
ues/143143</a><br>
<br>
Signed-off-by: Kris Gavvala &lt;<a href=3D"mailto:kris.gavvala@windriver.co=
m" target=3D"_blank">kris.gavvala@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.14.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.14.6.bb</a> | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.14.6.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.14.6.bb</a> b/meta/recip=
es-devtools/python/<a href=3D"http://python3_3.14.6.bb" rel=3D"noreferrer" =
target=3D"_blank">python3_3.14.6.bb</a><br>
index 291bde70f6..0fd1831b86 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.14.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.14.6.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.14.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.14.6.bb</a><br>
@@ -320,6 +320,14 @@ SKIPPED_TESTS:append:libc-musl =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--ignore test.test_ctypes.test_dlerror.TestNullDlsym.te=
st_null_dlsym \<br>
=C2=A0&quot;<br>
<br>
+# Fails due to potential race condition so remove it for glibc and musl<br=
>
+# Bugzilla YP 16182 (test_tracemalloc)<br>
+SKIPPED_TESTS:append:libc-glibc =3D &quot; \<br>
+=C2=A0 =C2=A0 --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_tra=
ck_race \<br>
+&quot;<br>
+SKIPPED_TESTS:append:libc-musl =3D &quot; \<br>
+=C2=A0 =C2=A0 --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_tra=
ck_race \<br>
+&quot;<br>
<br>
=C2=A0do_install_ptest:append () {<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s|SKIPPED_TESTS=3D|SKIPPED_TESTS=3D\&qu=
ot;${SKIPPED_TESTS}\&quot;|&quot; ${D}${PTEST_PATH}/run-ptest<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239532): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239532" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239532</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119965939/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119965939/4316185</a><br>
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

--00000000000015600806550ecd88--

