Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE77CD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 17:51:28 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4712.1777571485018072700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 10:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nuTOOG9t;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a413f83226so2063424e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777571483; cv=none;
        d=google.com; s=arc-20240605;
        b=Luo/cP39CnEIxcGtnLf8SrOBm4rFUcjOpBHRgI8su+R77oyuACRmacOKxXqWHk5b0S
         chYMcugyZqw+dnCdhiYFWP+GtjBx3ousA4DPIxAUWKnLVaXgzPRMb4CD5cHeaiAoaxcU
         5n3w9Txo6tJAI4HHT6rP40OG2QpWIqBOA9czbUa6SSOvD0z0akJvx3fdFZ+U0uK9pRbJ
         l8utoSOc098jR6u2UrnR8eDw77xxLi/Wn/pwS/k28aHB9qR3oXhNAe6a8xzWiQeufhcS
         J6KwsmPs6hLeCtaEZqQaJQH0CQzL/ajvOT1u1IV4jM7ybSMShEofnPeuPhgn2cl9HtQL
         K39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YP5v9aKdkGbmkO/oZkxri4RDQZte3IpjXoNoYt43NJ0=;
        fh=KZ6tPs5eiQDdM7vGTCahELypm7tdcvuMe/Yw4pvHVRk=;
        b=asy7drSVn+ijgil22aopYhwKJRS5bStHkcaPGdwG0A8H53pbRnh3nsM9WS36EFhMlI
         nAcmnur/Wh/hCAFLbd4mQ5W+f1MbRyU0f2Fx3zZb7ftZH9iHpVMOnRoXEkUeXQ4wwGup
         mtHt/taN/Ek6W1fnG8D9gI3UpZJB/y944ka5pi+3e5EIaABbkGdOIhM1kbPaKPy3vqz3
         Qr/xriSDRQrSt3j52JybR1gBalHnnASxlQ+ri3DG4ZufCCDbRb0pA2RVJCYRTh8jOrE+
         5LnL8eMu6ucXTTAHiYmwq6vnMz06q/wHRNj1lmTRTHm/r2+O+Aaanf2dUS2rWcM/6ggV
         1o5g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777571483; x=1778176283; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YP5v9aKdkGbmkO/oZkxri4RDQZte3IpjXoNoYt43NJ0=;
        b=nuTOOG9tGusmeWfrvRKv6eAy2rN8XeZLtco+u7WvCwb0dFEnzsa97t17t7QRLVQHn9
         gj88VVC9bn2hRF/B8KgWIQFAEZIUgW9xb2bwTuFt8ocldm9oyalV6ykOvoAcTczFWtdF
         es8v4kZkKSphNhy1SEagoqjNS7zzPbV05gqcMY5DeO9uma+CZV2T36uPI4j3VdJOuG0A
         FZWFioUKW2uMg9Ei3JHHnWkfCXsw+FsNV1SUfBNkKYjKMA4yD1/6H9kyDX2ZuY2CtoQb
         yajWp4hI9XrpiY+Gc61JHr1uAQAT+F3PXF9SfMrwP5PYn9li02LcI70NW/PSKTdCXUlc
         ZqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571483; x=1778176283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP5v9aKdkGbmkO/oZkxri4RDQZte3IpjXoNoYt43NJ0=;
        b=sWu7OO7INQfT7EzwomfsdGIyg/jYgXVwow37IsZEVXB/2xRvokrQTlSb4kV4xXVplK
         UqWME9Q1avTprQXTywcYghnyipVLeu00pFjNu8tz6Xs/dafJJDuGmwliRO/s/PMfR0FG
         /YhWJhLg9Z9vNdPttEPBgeLbKuNQO50Viu3bp4umZ5WWKpHqf+tJHyC9ihYggUaDyGTg
         l2I+URn8OWtTwpPJA0fkP62Vpt1kYcUuA+dQHwmjdiqnBQjycjc+RvZtIUVweCv7ihiR
         qpC57oOzBeTQdaHfSUE7hvwlmnQcrEnCsRGcH2we/ZrGoCx75oEHlpsdKsT1jvsViqss
         s6/w==
X-Gm-Message-State: AOJu0Yyj+ck/ra206lmSEziK6Y5qtwoGB7ZiGdlJkgmAOKpurM1LmLWj
	K6UhfyDUswTw/5pEhvMIyIadrYFKf+nCVTmONe36dfSHvnzoQG/DdOwA/F1LEpxRn9OurOS/PeZ
	KLnuQmIf79vZ+PdD+Vbl6E4DQkqGS3/A=
X-Gm-Gg: AeBDiev0w+c6OtVPKaj0HD0C0LR3iI5lNWxEC5yeER4lKtPwOIhvCiUnqh5/UcxDrZK
	VXsmnEQW1MT/b7cuTPbMHNYokOonwRo7KZmTV0P+/153WJt7LFC9x7Vs+seWxOREcydFqoUimSR
	DWMHAW18oTTsIch5MkiklUXYlSiX+Z3NCeiOhABgjQsRCTYo+VlwwK9I/fT6r4arL43vcXuSsP0
	uWIIaWYDElx5AMtrRcCh3HViN7+TZtTbDEjVbBIg02b5lEYooz039d46mTDJ00nqLH+BXUVvAYd
	HMdhXgvwLXoga/sI1Q==
X-Received: by 2002:a05:6512:39c4:b0:5a2:b86b:56c2 with SMTP id
 2adb3069b0e04-5a852741e88mr1406196e87.21.1777571482837; Thu, 30 Apr 2026
 10:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260430161702.77076-1-danismostlikely@gmail.com> <20260430161702.77076-2-danismostlikely@gmail.com>
In-Reply-To: <20260430161702.77076-2-danismostlikely@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 30 Apr 2026 10:51:10 -0700
X-Gm-Features: AVHnY4LIB8qtaFgud6RwJfng_S6uFZzNp9IGzW-yd2xK23jfCZ4YbUdxX1jthH8
Message-ID: <CANx9H-BO+dV6g2BWxE6PMc93tRaKaTFQkj3s9Lfo3pG6yFs6nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-requests: Increase chardet upper limit
To: danismostlikely@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Dan McGregor <dan.mcgregor@vecima.com>
Content-Type: multipart/alternative; boundary="000000000000cc27890650b11cfa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 17:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236178

--000000000000cc27890650b11cfa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 9:18=E2=80=AFAM Dan McGregor via lists.openembedded=
.org
<danismostlikely=3Dgmail.com@lists.openembedded.org> wrote:

> From: Dan McGregor <dan.mcgregor@vecima.com>
>
> OE Core includes chardet 6.0, while requests warns for any version
> greater than or equal to 6.0. Not for any real reason, but because
> it was a higher version than what was released when requests 2.32
> was released.
>
>
For "master" we should upgrade to 2.33.1 which is the latest release and
includes this patch:
https://github.com/psf/requests/compare/v2.32.5...v2.33.1

For 'wrynose' we should use the backport, but there is also a bump to
chardet < 8 that merged:
https://github.com/psf/requests/commit/b2a1d33f571518ca9a6148e7da787cc5827f=
897a



> Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> ---
>  ...01-Increase-chardet-upper-limit-to-7.patch | 26 +++++++++++++++++++
>  .../python/python3-requests_2.32.5.bb         |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644
> meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper=
-limit-to-7.patch
>
> diff --git
> a/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upp=
er-limit-to-7.patch
> b/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upp=
er-limit-to-7.patch
> new file mode 100644
> index 00000000000..2c445e42549
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upp=
er-limit-to-7.patch
> @@ -0,0 +1,26 @@
> +From 0f965846b95d096d76a1795db37fbe9acad0eb65 Mon Sep 17 00:00:00 2001
> +From: Amin Vakil <info@aminvakil.com>
> +Date: Sun, 22 Feb 2026 19:37:16 +0330
> +Subject: [PATCH] Increase chardet upper limit to 7
> +
> +Upstream-Status: Backport [
> https://github.com/psf/requests/commit/4bd79e397304d46dfccd76f36c07f66c02=
95ff82
> ]
> +---
> + src/requests/__init__.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/requests/__init__.py b/src/requests/__init__.py
> +index 051cda13..9a80c625 100644
> +--- a/src/requests/__init__.py
> ++++ b/src/requests/__init__.py
> +@@ -76,7 +76,7 @@ def check_compatibility(urllib3_version,
> chardet_version, charset_normalizer_ver
> +         major, minor, patch =3D chardet_version.split(".")[:3]
> +         major, minor, patch =3D int(major), int(minor), int(patch)
> +         # chardet_version >=3D 3.0.2, < 6.0.0
> +-        assert (3, 0, 2) <=3D (major, minor, patch) < (6, 0, 0)
> ++        assert (3, 0, 2) <=3D (major, minor, patch) < (7, 0, 0)
> +     elif charset_normalizer_version:
> +         major, minor, patch =3D charset_normalizer_version.split(".")[:=
3]
> +         major, minor, patch =3D int(major), int(minor), int(patch)
> +--
> +2.44.4
> +
> diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
> b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
> index 3477a5d83e9..02d476e975f 100644
> --- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
> +++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
> @@ -8,6 +8,7 @@ inherit pypi python_setuptools_build_meta
>  SRC_URI[sha256sum] =3D
> "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
>
>  SRC_URI +=3D "file://CVE-2026-25645.patch"
> +SRC_URI +=3D "file://0001-Increase-chardet-upper-limit-to-7.patch"
>  SRC_URI:append:class-nativesdk =3D " file://
> environment.d-python3-requests.sh"
>
>  do_install:append:class-nativesdk() {
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236176):
> https://lists.openembedded.org/g/openembedded-core/message/236176
> Mute This Topic: https://lists.openembedded.org/mt/119084300/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cc27890650b11cfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 30,=
 2026 at 9:18=E2=80=AFAM Dan McGregor via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;danismostlikely=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Da=
n McGregor &lt;<a href=3D"mailto:dan.mcgregor@vecima.com" target=3D"_blank"=
>dan.mcgregor@vecima.com</a>&gt;<br>
<br>
OE Core includes chardet 6.0, while requests warns for any version<br>
greater than or equal to 6.0. Not for any real reason, but because<br>
it was a higher version than what was released when requests 2.32<br>
was released.<br>
<br></blockquote><div><br></div><div>For &quot;master&quot; we should upgra=
de to 2.33.1 which is the latest release and includes this patch:</div><div=
><a href=3D"https://github.com/psf/requests/compare/v2.32.5...v2.33.1">http=
s://github.com/psf/requests/compare/v2.32.5...v2.33.1</a></div><div><br></d=
iv><div>For &#39;wrynose&#39; we should use the backport, but there is also=
 a bump to chardet &lt; 8 that merged:<br><a href=3D"https://github.com/psf=
/requests/commit/b2a1d33f571518ca9a6148e7da787cc5827f897a">https://github.c=
om/psf/requests/commit/b2a1d33f571518ca9a6148e7da787cc5827f897a</a></div><d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@vecima.com" =
target=3D"_blank">dan.mcgregor@vecima.com</a>&gt;<br>
---<br>
=C2=A0...01-Increase-chardet-upper-limit-to-7.patch | 26 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-requests_2.32.5.bb" rel=3D"noref=
errer" target=3D"_blank">python3-requests_2.32.5.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 27 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-requests/0001=
-Increase-chardet-upper-limit-to-7.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-requests/0001-Increase-ch=
ardet-upper-limit-to-7.patch b/meta/recipes-devtools/python/python3-request=
s/0001-Increase-chardet-upper-limit-to-7.patch<br>
new file mode 100644<br>
index 00000000000..2c445e42549<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-u=
pper-limit-to-7.patch<br>
@@ -0,0 +1,26 @@<br>
+From 0f965846b95d096d76a1795db37fbe9acad0eb65 Mon Sep 17 00:00:00 2001<br>
+From: Amin Vakil &lt;<a href=3D"mailto:info@aminvakil.com" target=3D"_blan=
k">info@aminvakil.com</a>&gt;<br>
+Date: Sun, 22 Feb 2026 19:37:16 +0330<br>
+Subject: [PATCH] Increase chardet upper limit to 7<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/psf/requests/comm=
it/4bd79e397304d46dfccd76f36c07f66c0295ff82" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/psf/requests/commit/4bd79e397304d46dfccd76f36c07f=
66c0295ff82</a>]<br>
+---<br>
+ src/requests/__init__.py | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/requests/__init__.py b/src/requests/__init__.py<br>
+index 051cda13..9a80c625 100644<br>
+--- a/src/requests/__init__.py<br>
++++ b/src/requests/__init__.py<br>
+@@ -76,7 +76,7 @@ def check_compatibility(urllib3_version, chardet_version=
, charset_normalizer_ver<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0major, minor, patch =3D chardet_version.=
split(&quot;.&quot;)[:3]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0major, minor, patch =3D int(major), int(=
minor), int(patch)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# chardet_version &gt;=3D 3.0.2, &lt; 6.=
0.0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (3, 0, 2) &lt;=3D (major, minor, patch=
) &lt; (6, 0, 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (3, 0, 2) &lt;=3D (major, minor, patch=
) &lt; (7, 0, 0)<br>
+=C2=A0 =C2=A0 =C2=A0elif charset_normalizer_version:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0major, minor, patch =3D charset_normaliz=
er_version.split(&quot;.&quot;)[:3]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0major, minor, patch =3D int(major), int(=
minor), int(patch)<br>
+-- <br>
+2.44.4<br>
+<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-request=
s_2.32.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.32.5.b=
b</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.3=
2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.32.5.bb</a>=
<br>
index 3477a5d83e9..02d476e975f 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.32.=
5.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.32.5.bb</a><b=
r>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-requests_2.32.=
5.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests_2.32.5.bb</a><b=
r>
@@ -8,6 +8,7 @@ inherit pypi python_setuptools_build_meta<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d=
3754a8893c3af500cec7d7cf&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://CVE-2026-25645.patch&quot;<br>
+SRC_URI +=3D &quot;file://0001-Increase-chardet-upper-limit-to-7.patch&quo=
t;<br>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; file://<a href=3D"http://en=
vironment.d-python3-requests.sh" rel=3D"noreferrer" target=3D"_blank">envir=
onment.d-python3-requests.sh</a>&quot;<br>
<br>
=C2=A0do_install:append:class-nativesdk() {<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236176): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236176" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236176</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119084300/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/119084300/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000cc27890650b11cfa--

