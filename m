Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC2FC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 17:38:39 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.90809.1701970709581338218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 09:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fRDQ5Ah3;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5d2d0661a8dso10653487b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 09:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701970709; x=1702575509; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7DYf/edvE7F3XFVSFyq+hXDE55AlPuDHKcxkAu9Lt0U=;
        b=fRDQ5Ah3cHqLC9ct2UJXX3QFsx04C68CIZxZbA7FLqDUhbR6bJ3p9DjFD64Y/nynvj
         ZCncBk/HWOmAUaaeTuwk1bW9Lp5XP3oI7zLBKOqwyYfXsogmtAA5WOods3TS58M9jyQw
         N4pm8RqGvOYI2T/VlTCIUrEvuGAAYsgCn86pu5pglqnCXU84ciThWhKi8cymGzKeSHgj
         eGv/Txy241xkylk9U89JomcDNJ3T2967WACJqY4pH/CfmRWD/mol9sgJBv2CvM5bFUAd
         5okJExOvennawwe0Ue6qYOnyI/6Hnhupk4LpuKF0bKXQSQ9a6PGE+3OOXYtWhezcW3IB
         4bdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701970709; x=1702575509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DYf/edvE7F3XFVSFyq+hXDE55AlPuDHKcxkAu9Lt0U=;
        b=hE/KioLadYJXMGge7P/FV3AYgPgMvA3tecK30E6bhb3KGpYDXWD9HPoffYKy5lQmTu
         GhQhUGyXJj7Sp1Wuca483hWspleXG9rwQzPcFchHiumWXA7fEylBTSoxtGl/47AvlXGl
         hhUhfl4zT1IG3n91EX3y29fXKPmWa8lz+0A7If2d9PH8qRNRwAYuCeBJz+AFLdPPnCSh
         sikWkHMz9yL9HVZz5IoWOcB6QjPOmOGDJr0ct7NWFu0/ueX+mnN6OO1M3s748+kF8o0c
         rsBNwHWJc1whDOE0S6XZNUq0sqVkRAhRdAPh7LzjYV70ha720JWG7RLAe2p+Ll9aWkzO
         mnnA==
X-Gm-Message-State: AOJu0YxLhnsy0+v8cmbQnyHkFtJlrEchzLSV+p3DxNqkXJqA6sCxTAHO
	LMFnRS4fl2rCM+cqe6EZeOiX9SeGbOtOqeQmcCI=
X-Google-Smtp-Source: AGHT+IEjfQPcu0Xm4NHxCXgqV6dhwlMSoYoT9IqAkf0dpF7CPBuljOatreZVuyTfdzuc9K1EIiZT4PSQ3x8QllFxDmg=
X-Received: by 2002:a81:b048:0:b0:5d7:70a0:ea04 with SMTP id
 x8-20020a81b048000000b005d770a0ea04mr2715397ywk.7.1701970708620; Thu, 07 Dec
 2023 09:38:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701959631.git.pidge@baylibre.com> <25d25aac54efcb8afe5a6d17f70800b57a0d0a21.1701959631.git.pidge@baylibre.com>
In-Reply-To: <25d25aac54efcb8afe5a6d17f70800b57a0d0a21.1701959631.git.pidge@baylibre.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 7 Dec 2023 09:38:17 -0800
Message-ID: <CANx9H-DTVzzHb8p=U-igt8AwdM5Uwf80QTVyr0XSS74JK1bWXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] python3-qemu-qmp: Add recipe
To: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000816dba060beeef5d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 17:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191969

--000000000000816dba060beeef5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This will also need a maintainer entry in:
https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/includ=
e/maintainers.inc

On Thu, Dec 7, 2023 at 6:36=E2=80=AFAM Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=
=C3=A1in <
pidge@baylibre.com> wrote:

> From: Ross Burton <ross.burton@arm.com>
>
> Add a recipe for python QEMU Monitor Protocol. This will be needed for
> qemu screendumps for qemu screendump testing.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  .../python/python3-qemu-qmp_0.0.2.bb               | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.b=
b
>
> diff --git a/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
> b/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
> new file mode 100644
> index 00000000000..faa0cc69738
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "asyncio library for communicating with QEMU Monitor Protoco=
l
> (QMP) servers"
> +LICENSE =3D "LGPLv2+ & GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cf66a4984120007c9881cc871cf4=
9db \
> +
> file://LICENSE_GPL2;md5=3D441c28d2cf86e15a37fa47e15a72fbac"
> +
> +SRC_URI[sha256sum] =3D
> "c918e9e3ae09abdf70c7ece67637a93ac4583d940bbf48d24ff77987f74f1b8b"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +PYPI_PACKAGE =3D "qemu.qmp"
> +
> +DEPENDS +=3D "python3-setuptools-scm-native"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191960):
> https://lists.openembedded.org/g/openembedded-core/message/191960
> Mute This Topic: https://lists.openembedded.org/mt/103035077/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000816dba060beeef5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This will also need a maintainer entry in:<div><a href=3D"=
https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/includ=
e/maintainers.inc">https://git.openembedded.org/openembedded-core/tree/meta=
/conf/distro/include/maintainers.inc</a><br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 7, 2023 at 6:=
36=E2=80=AFAM Eil=C3=ADs &#39;pidge&#39; N=C3=AD Fhlannag=C3=A1in &lt;<a hr=
ef=3D"mailto:pidge@baylibre.com">pidge@baylibre.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ross Burton &lt;<a=
 href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com<=
/a>&gt;<br>
<br>
Add a recipe for python QEMU Monitor Protocol. This will be needed for<br>
qemu screendumps for qemu screendump testing.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
Signed-off-by: Eil=C3=ADs &#39;pidge&#39; N=C3=AD Fhlannag=C3=A1in &lt;<a h=
ref=3D"mailto:pidge@baylibre.com" target=3D"_blank">pidge@baylibre.com</a>&=
gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-qemu-qmp_0.0.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-qemu-qmp_0.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-qemu-qmp_0.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-qemu-q=
mp_0.0.2.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-qemu-qm=
p_0.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-qemu-qmp_0.0.2.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-qemu-qmp_0.0.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-qemu-qmp_0.0.2.bb</a><br>
new file mode 100644<br>
index 00000000000..faa0cc69738<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-qemu-qmp_0.0.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-qemu-qmp_0.0.2.bb</a><br>
@@ -0,0 +1,14 @@<br>
+SUMMARY =3D &quot;asyncio library for communicating with QEMU Monitor Prot=
ocol (QMP) servers&quot;<br>
+LICENSE =3D &quot;LGPLv2+ &amp; GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4cf66a4984120007c9881cc871=
cf49db \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE_GPL2;md5=3D441c28d2cf86e15a37fa47e15a72fbac&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;c918e9e3ae09abdf70c7ece67637a93ac4583d940bbf4=
8d24ff77987f74f1b8b&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta<br>
+<br>
+PYPI_PACKAGE =3D &quot;qemu.qmp&quot;<br>
+<br>
+DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#191960): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/191960" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/191960</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103035077/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103035077/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000816dba060beeef5d--

