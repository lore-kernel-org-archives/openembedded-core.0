Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B654C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 03:54:17 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.67102.1744084455435560892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 20:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aOKhaRbQ;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-603fd257386so1114359eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 20:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744084454; x=1744689254; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wo2DHk0S8/CyGGBPyE7yA1X/v8JG7JP8SL2nF1YSGHU=;
        b=aOKhaRbQJ/SPoP7zUgQPzrad97eaZ+blPeaoHNHsY4yB7BgDRYzrROJu+0z2tziPii
         MSZfKrtqVVARQFA/t22bpAnqsWJrwlU39IJ4vs90s0/ZqVMAtgeFAUokiLmc8Y5zZGEN
         8twP7MBeV6FMeBEctxeC2pOb3fmufgEjSj6bxA3KD3Ad7YaZ91Pu/JJq0PjsKknpU43f
         7IAGbWPhOBRQI2k2XrqjPManacQmakQ+d6RkvmifokBKQkZ/nJQb5y5f5Fu0+ApmLxpo
         yaG9wVcT4VIz7dy+/i22VxnoXRdcNCoUT1R9nfkYUifPShwIP+v6AaM6mV2LxM39jxPo
         CO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744084454; x=1744689254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wo2DHk0S8/CyGGBPyE7yA1X/v8JG7JP8SL2nF1YSGHU=;
        b=adGBL3FcE8Ore4AVafMKwp60o5ImZAKlIFQj2vRECznrGvMtdPzxz1nh0MJyTcUUYn
         LHU0R40EJy+bchg/+qEg42OVBXmz4doqXrO8gu9tqR0bh1RmuUG93ogPma2DCukpH6Av
         6TsYaDkkYfsk/wkIV2CdCyZXVzX7FxWGdN7lmQ1IJK7thFqni2tAvXr4P8vxHVTpYAGS
         uFQeOzpteLVPapMEEdzgYDdsvGb/15Vs/JJCJZ5KS6mkDQxSS/dXwQEOFPmO7a9ssTfo
         hWdVk5Mn+j55NaPYbd35731rFbsmha7tPRrudAyxhLSHMHNp5Si93YF/0uv9529kNqQ3
         Dknw==
X-Gm-Message-State: AOJu0YxWHlHPRFUrKHb1YoojoMpMSkiT47THdI7oAs68iJz5LPuJNSRY
	+JAiGsV0oVQFp2GbidlDSCDiivYWJa8OofgeQlxUJMlroHsB4e4ae6N2iDKtoIq9lTZ1MelLJtt
	2Ey5/jsGwoskTJVht04aOmZzQ/ts=
X-Gm-Gg: ASbGncvf+eoQCBH3Ow/DaJlaChfyRt4p2kTH5CXMOwYo1njZKzQPb9r4yrcaXNYyBvD
	VyRw/DTxHwbfSoEjTstt7mkOj2+HVIwmb/SsO8wJKpsxxnoeb/VmLi++2LaJ84Va9WRAuv9cWd/
	7qvnPH+7JWqANjRUgNeDUGEC7HmiB5IrATcBaGZ7cnMm67YkjNesJ3OA2+6Ls=
X-Google-Smtp-Source: AGHT+IHYguANO+TuZygIMoS3R/qbjv9f4lzkRdWKEjvxgK0jHPpSlp5oeoZfkpk6R5L+jgsRXKu2ZbfoYSiRhZRy8vE=
X-Received: by 2002:a05:6820:1690:b0:602:8233:4c93 with SMTP id
 006d021491bc7-604157454bamr6843815eaf.4.1744084454553; Mon, 07 Apr 2025
 20:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250408034829.4000367-1-alistair.francis@wdc.com>
In-Reply-To: <20250408034829.4000367-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 20:54:03 -0700
X-Gm-Features: ATxdqUFkwBCfDWS2GnsynE-nugMaCueBgFHnGcjxJpehxVsPuXmAxVgut3XiYeE
Message-ID: <CAMKF1so4BmMRgPzWBwfCfDV2_h50W=T2QoxOaWz5eFkMeJn_ug@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] ktls-utils: Initial commit
To: alistair23@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000005f420e06323c4eea"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214507

--0000000000005f420e06323c4eea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe send it to oe-devel mailing list

On Mon, Apr 7, 2025 at 8:48=E2=80=AFPM Alistair Francis via lists.openembed=
ded.org
<alistair23=3Dgmail.com@lists.openembedded.org> wrote:

> Package ktls-utils which includes tlsd.
>
> This is used when in-kernel TLS consumers need a mechanism to perform TLS
> handshakes on a connected socket to negotiate TLS session parameters that
> can then be programmed into the kernel's TLS record protocol engine.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../ktls-utils/ktls-utils_0.11.bb               | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
>
> diff --git a/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
> b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
> new file mode 100644
> index 0000000000..e85dc4ac72
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "TLS handshake utilities for in-kernel TLS consumers"
> +DESCRIPTION =3D "In-kernel TLS consumers need a mechanism to perform TLS=
 \
> +handshakes on a connected socket to negotiate TLS session parameters tha=
t
> \
> +can then be programmed into the kernel's TLS record protocol engine."
> +DEPENDS =3D "gnutls keyutils glib-2.0 libnl"
> +RDEPENDS:${PN} +=3D " gnutls"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd568123389d9a12625cca2b089b17=
28b"
> +
> +SRCREV =3D "5c3314b5728b272cbaf0d98f4d521cca9610b6bf"
> +SRC_URI =3D "git://
> github.com/oracle/ktls-utils.git;nobranch=3D1;protocol=3Dhttps"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig systemd
> +
> +PACKAGECONFIG[systemd] =3D "--with-systemd,,systemd"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214506):
> https://lists.openembedded.org/g/openembedded-core/message/214506
> Mute This Topic: https://lists.openembedded.org/mt/112147336/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005f420e06323c4eea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Maybe send it to oe-devel mailing list=C2=A0</div><div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 7, 2025 at 8:48=E2=80=AFPM Alistair Francis via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;a=
listair23=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Package ktls=
-utils which includes tlsd.<br>
<br>
This is used when in-kernel TLS consumers need a mechanism to perform TLS<b=
r>
handshakes on a connected socket to negotiate TLS session parameters that<b=
r>
can then be programmed into the kernel&#39;s TLS record protocol engine.<br=
>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0.../ktls-utils/<a href=3D"http://ktls-utils_0.11.bb" rel=3D"noreferre=
r" target=3D"_blank">ktls-utils_0.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
=C2=A01 file changed, 17 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/ktls-utils/<a href=3D"http:=
//ktls-utils_0.11.bb" rel=3D"noreferrer" target=3D"_blank">ktls-utils_0.11.=
bb</a><br>
<br>
diff --git a/meta-oe/recipes-kernel/ktls-utils/<a href=3D"http://ktls-utils=
_0.11.bb" rel=3D"noreferrer" target=3D"_blank">ktls-utils_0.11.bb</a> b/met=
a-oe/recipes-kernel/ktls-utils/<a href=3D"http://ktls-utils_0.11.bb" rel=3D=
"noreferrer" target=3D"_blank">ktls-utils_0.11.bb</a><br>
new file mode 100644<br>
index 0000000000..e85dc4ac72<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-kernel/ktls-utils/<a href=3D"http://ktls-utils_0.11.b=
b" rel=3D"noreferrer" target=3D"_blank">ktls-utils_0.11.bb</a><br>
@@ -0,0 +1,17 @@<br>
+SUMMARY =3D &quot;TLS handshake utilities for in-kernel TLS consumers&quot=
;<br>
+DESCRIPTION =3D &quot;In-kernel TLS consumers need a mechanism to perform =
TLS \<br>
+handshakes on a connected socket to negotiate TLS session parameters that =
\<br>
+can then be programmed into the kernel&#39;s TLS record protocol engine.&q=
uot;<br>
+DEPENDS =3D &quot;gnutls keyutils glib-2.0 libnl&quot;<br>
+RDEPENDS:${PN} +=3D &quot; gnutls&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd568123389d9a12625cca2b089=
b1728b&quot;<br>
+<br>
+SRCREV =3D &quot;5c3314b5728b272cbaf0d98f4d521cca9610b6bf&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/oracle/ktls-utils.git=
;nobranch=3D1;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github=
.com/oracle/ktls-utils.git;nobranch=3D1;protocol=3Dhttps</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools pkgconfig systemd<br>
+<br>
+PACKAGECONFIG[systemd] =3D &quot;--with-systemd,,systemd&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214506): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214506" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214506</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112147336/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112147336/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005f420e06323c4eea--

