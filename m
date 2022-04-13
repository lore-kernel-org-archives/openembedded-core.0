Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C8AC48BE5
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.7793.1649863810887400527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id bh17so4696461ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nIOj3RkIwl25Uy4KLiRn42dXoDlLSbi83iBBMouOH2U=;
        b=dP+8bs9k3fpVZ8OKg1Hcl0SIkFWFvUDcHPDIb1I4H3qvaJKqbC3MFaxl92/zxn7QcK
         Bp5teTT+vKXYKeCgORSbKOdUd5hFvoArTl6U20y2mDaFfP5LiWJJ84tjA5bmpZhxqfOP
         ia8Psu4wHzoyXiBDUcPUSW+lJrwAApntM6Au48g3cGtrSo4DyankvXKi9YWuuRvmBskt
         d+aGxKMyFvzSeWQOBiO+h2IvDC8ZiK3TXZkPc/Zi0Xh72j9h8YkXRBfSU7OQZ2Cht3JR
         4haNSR/vkScSi02R2I2kfFijzd88CitA1PpuZ5NmiQbNBrV+uMxsRWpIsyi0/i1NZSq7
         4Jdg==
X-Gm-Message-State: AOAM533phkuaU7Ymn/q3Jjms945MyDazKTedMoVWS5SQaeDwC/hdQ63c
	6rGgLM7J3wH7f78BEqpiysePXNaBEuNtBqzvSYU=
X-Google-Smtp-Source: 
 ABdhPJxd4kswXXsQM2h08E8MwFbw2cuixKJjnEwfPeV/HnKCDzaDYPZWvQjsBLiQt7YTk5Q+HVlsFSGhaGl2pSbVx04=
X-Received: by 2002:a17:907:3ea3:b0:6e8:74b3:178c with SMTP id
 hs35-20020a1709073ea300b006e874b3178cmr18549133ejc.230.1649863809131; Wed, 13
 Apr 2022 08:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <16E4E3A4B092DE46.30353@lists.openembedded.org>
In-Reply-To: <16E4E3A4B092DE46.30353@lists.openembedded.org>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 13 Apr 2022 08:29:57 -0700
Message-ID: 
 <CABcZAN=J00ggNnfaqmvjyaGSNGwd97om=PtdgFe7buS_LjSadg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license: add 'any_incompatible' function
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000045665405dc8ada28"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164331

--00000000000045665405dc8ada28
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 11, 2022 at 9:14 AM Christopher Larson via
lists.openembedded.org <kergoth=gmail.com@lists.openembedded.org> wrote:

> This function returns True if any of the specified packages are skipped
> due to
> incompatible license.
>
> License exceptions are obeyed. The user may specify the package's license
> for
> cross-recipe checks.
>
> This allows for additions to packagegroups only for non-incompatible
> builds. For
> example:
>
>     RDEPENDS_${PN} += "${@'dbench' if not any_incompatible(d, 'dbench',
> 'GPL-3.0-only') else ''}"
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/license.bbclass | 37 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 0c637e966e..db8c3f8584 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -320,6 +320,43 @@ def incompatible_license(d, dont_want_licenses,
> package=None):
>
>      return incompatible_pkg_license(d, dont_want_licenses, license)
>
> +def any_incompatible(d, packages, licensestring=None):
> +    """Return True if any of the packages are skipped due to incompatible
> license.
> +
> +    License exceptions are obeyed. The user may specify the package's
> license
> +    for cross-recipe checks.
> +
> +    This allows for additions to packagegroups only for non-incompatible
> builds.
> +    For example:
> +
> +        RDEPENDS_${PN} += "${@'dbench' if not any_incompatible(d,
> 'dbench', 'GPL-3.0-only') else ''}"
> +    """
> +    if not isinstance(packages, str):
> +        packages = packages.split()
>

If it's not a string, I split it? Oops :) v2 forthcoming.
-- 
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--00000000000045665405dc8ada28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 11, 2022 at 9:14 AM Chris=
topher Larson via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;kergoth=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">This function returns True if any of the=
 specified packages are skipped due to<br>
incompatible license.<br>
<br>
License exceptions are obeyed. The user may specify the package&#39;s licen=
se for<br>
cross-recipe checks.<br>
<br>
This allows for additions to packagegroups only for non-incompatible builds=
. For<br>
example:<br>
<br>
=C2=A0 =C2=A0 RDEPENDS_${PN} +=3D &quot;${@&#39;dbench&#39; if not any_inco=
mpatible(d, &#39;dbench&#39;, &#39;GPL-3.0-only&#39;) else &#39;&#39;}&quot=
;<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/license.bbclass | 37 +++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 37 insertions(+)<br>
<br>
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass<br=
>
index 0c637e966e..db8c3f8584 100644<br>
--- a/meta/classes/license.bbclass<br>
+++ b/meta/classes/license.bbclass<br>
@@ -320,6 +320,43 @@ def incompatible_license(d, dont_want_licenses, packag=
e=3DNone):<br>
<br>
=C2=A0 =C2=A0 =C2=A0return incompatible_pkg_license(d, dont_want_licenses, =
license)<br>
<br>
+def any_incompatible(d, packages, licensestring=3DNone):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Return True if any of the packages are ski=
pped due to incompatible license.<br>
+<br>
+=C2=A0 =C2=A0 License exceptions are obeyed. The user may specify the pack=
age&#39;s license<br>
+=C2=A0 =C2=A0 for cross-recipe checks.<br>
+<br>
+=C2=A0 =C2=A0 This allows for additions to packagegroups only for non-inco=
mpatible builds.<br>
+=C2=A0 =C2=A0 For example:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RDEPENDS_${PN} +=3D &quot;${@&#39;dbench&#39; =
if not any_incompatible(d, &#39;dbench&#39;, &#39;GPL-3.0-only&#39;) else &=
#39;&#39;}&quot;<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 if not isinstance(packages, str):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages =3D packages.split()<br></blockquote>=
<div><br></div><div>If it&#39;s not a string, I split it? Oops :) v2 forthc=
oming.</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><font color=3D"#333333">Christo=
pher Larson<br><a>chris_larson@mentor.com</a>,=C2=A0<a>chris.larson@siemens=
.com</a>,=C2=A0<a>kergoth@gmail.com</a><br>Principal Software Engineer,=C2=
=A0Embedded Linux Solutions,=C2=A0Siemens Digital Industries Software</font=
><br></div></div></div></div></div>

--00000000000045665405dc8ada28--

