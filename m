Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA02FD2D105
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:49:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59402.1768312153941574332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 05:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GwLO8mbX;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso35159555e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 05:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768312152; x=1768916952; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yd7Xz5xptFaVKBwhKPc/YSAQSj4bg+CehWVdurDG780=;
        b=GwLO8mbXbD691v0uDzHZR5kaLiny2dLJeJ/KCcemppLJtqJi5NCyt2ii+M2sjyCo6h
         lcCfe+5k1UCGpjyGo8XepZ7obynfze2XVCw2M7nsET0EYJCbBLutYYuqmeq65EZ689MO
         W0DLlix4STQFxP2a2wNNfGcs3RkvXob66dnnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312152; x=1768916952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd7Xz5xptFaVKBwhKPc/YSAQSj4bg+CehWVdurDG780=;
        b=Od+nt0TvQTvP7GxrcWTOK/95RbT2pKulhZBOha3JVbUg+pgHOdemWogUUtdS3xp0ZZ
         D9GtHAAkKea4ZJOsZzGp3IuLnCZjqkosAOax3rE9zA5i/ArXp6vm55Egdj0QXmQXMX8L
         wGcKPIMy3VgSj+cBZ/T8IBkrmal5kLxuA67Q9fyQYp/jVXxpq7mSkTn9ApzmFCOdt4Nw
         QXA/38Rm+xGmNkDG3RyG9sRzG7/J1LTpWtKnRVuGTqa/6EOsv7uOEK/m+BOpf3djjaC/
         +f126EgY15BHNdc4X0MVVY/88VywUGBiurobUPbS+shrG+LcHG5eTBqW5jalwwZ2YlkT
         QlUw==
X-Gm-Message-State: AOJu0YwHBeKzm8HVj3Vy3KkccsV4E6S0GGQd9xPwUPs10b2LnS1VaI8N
	nL9Gie3xkpzXXTUAIGy7v1NsEGC7Tpfwez8hLJwcnvBwyzgyEgRUspztahMJ/7WwH+c3xUX6M+f
	G7NAHRQItjvDBrV1XkEvobp7EHNaIMPO/+pbiI40+BQ==
X-Gm-Gg: AY/fxX46YTsqFf6/BbCPuDt+1ZcIyR22widHh0G3lpDK4c8hPopc87xTXiz8ivl4ov6
	XRMBqxWZEwix6fKGeV3fwQJhCqnQlkRmUw8X4fI4SiCkgHbKufrTumYRt7OkSsMQygmPSD3Tzp5
	9MkHOXA6zgzIx+pXMX4ITUntrxwCJ+uvpWQY72CJHoBOoBq92kgDYdj5jai6qJAvzC/JkALLlDM
	PReBH3IkroQYrOKn5+37DnJ7aVv3DUnXqDf+tBPFqi2mwPIQHqiUfzARLirh2NvXl6i4GT4Ww==
X-Google-Smtp-Source: AGHT+IHiw2nTBRd/5RodWQPN4MbJXXJZN1aYGfnvoQCt6jquewGCmUDTjwxfPYwr/JN2GjnZFgsyw4MyVTYidKGPR/U=
X-Received: by 2002:adf:e5c4:0:b0:432:5a4e:c023 with SMTP id
 ffacd0b85a97d-43423e85d0amr3240021f8f.13.1768312152116; Tue, 13 Jan 2026
 05:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20251231215843.487608-1-peter.marko@siemens.com>
In-Reply-To: <20251231215843.487608-1-peter.marko@siemens.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 13 Jan 2026 14:48:45 +0100
X-Gm-Features: AZwV_QhsZlpHI_D_8rN5rLrWViXUo30TzAoOjueyqBuG4-0g7xtScIuuJir0U1U
Message-ID: <CAMSfU+4Tv5mO2sLgxitWvRceF5mM3MnuszSLMMSY+0jbG_9ZBw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] qemu: ignore CVE-2025-54566 and CVE-2025-54567
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000adf2b006484541ed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 13:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229265

--000000000000adf2b006484541ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mer. 31 d=C3=A9c. 2025 =C3=A0 22:59, Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :

> From: Peter Marko <peter.marko@siemens.com>
>
> These CVEs are not applicable to version 8.2.x as the vulnerable code
> was introduced inly in 10.0.0.
>
> Debian made the analysis, reuse their work.
> * https://security-tracker.debian.org/tracker/CVE-2025-54566
> * https://security-tracker.debian.org/tracker/CVE-2025-54567


Did you contact NVD to get them to update the database with this info?

Thanks!


> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index dde3b0be139..748a32215e0 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -88,6 +88,9 @@ CVE_STATUS[CVE-2023-1386] =3D "disputed: not an issue a=
s
> per https://bugzilla.redh
>
>  CVE_STATUS[CVE-2024-7730] =3D "fixed-version: this is fixed in v8.2.7"
>
> +CVE_STATUS[CVE-2025-54566] =3D "cpe-incorrect: This issue was introduced=
 in
> v10.0.0-rc0"
> +CVE_STATUS[CVE-2025-54567] =3D "cpe-incorrect: This issue was introduced=
 in
> v10.0.0-rc0"
> +
>  COMPATIBLE_HOST:mipsarchn32 =3D "null"
>  COMPATIBLE_HOST:mipsarchn64 =3D "null"
>  COMPATIBLE_HOST:riscv32 =3D "null"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228749):
> https://lists.openembedded.org/g/openembedded-core/message/228749
> Mute This Topic: https://lists.openembedded.org/mt/117018510/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000adf2b006484541ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 31 d=C3=A9c.=
 2025 =C3=A0=C2=A022:59, Peter Marko via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siem=
ens.com@lists.openembedded.org">siemens.com@lists.openembedded.org</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=
=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
These CVEs are not applicable to version 8.2.x as the vulnerable code<br>
was introduced inly in 10.0.0.<br>
<br>
Debian made the analysis, reuse their work.<br>
* <a href=3D"https://security-tracker.debian.org/tracker/CVE-2025-54566" re=
l=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/trac=
ker/CVE-2025-54566</a><br>
* <a href=3D"https://security-tracker.debian.org/tracker/CVE-2025-54567" re=
l=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/trac=
ker/CVE-2025-54567</a></blockquote><div><br></div><div>Did you contact NVD =
to get them to update the database with this info?</div><div><br></div><div=
>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/qemu.inc | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index dde3b0be139..748a32215e0 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -88,6 +88,9 @@ CVE_STATUS[CVE-2023-1386] =3D &quot;disputed: not an issu=
e as per <a href=3D"https://bugzilla.redh" rel=3D"noreferrer" target=3D"_bl=
ank">https://bugzilla.redh</a><br>
<br>
=C2=A0CVE_STATUS[CVE-2024-7730] =3D &quot;fixed-version: this is fixed in v=
8.2.7&quot;<br>
<br>
+CVE_STATUS[CVE-2025-54566] =3D &quot;cpe-incorrect: This issue was introdu=
ced in v10.0.0-rc0&quot;<br>
+CVE_STATUS[CVE-2025-54567] =3D &quot;cpe-incorrect: This issue was introdu=
ced in v10.0.0-rc0&quot;<br>
+<br>
=C2=A0COMPATIBLE_HOST:mipsarchn32 =3D &quot;null&quot;<br>
=C2=A0COMPATIBLE_HOST:mipsarchn64 =3D &quot;null&quot;<br>
=C2=A0COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228749): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228749" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228749</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117018510/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117018510/4316185</a><br>
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

--000000000000adf2b006484541ed--

