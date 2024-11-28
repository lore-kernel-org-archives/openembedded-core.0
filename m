Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32C4D70DE1
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 16:05:48 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.98736.1732809939285681211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 08:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+Jy3oPa;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so654107a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 08:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732809938; x=1733414738; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P25IxRmuotBaAP9klN4uOjmIF9WutkkJ9VyclARS03k=;
        b=D+Jy3oPaM30Gc0rV/UaObb7th9eMVy0bItVBkIf4GCT6+Fd+W65dWKWFgilosZxE2y
         FoDldExOLpjc9cFQOUuF3+JytzwOUCXXIAaJD9p8iSfchTaCptm8GKYDdYlGNB42Ev/E
         kr+AwZ83TYCWTbVMLKPm5XMlxs81PnbL13garwXuaA6XJSSYk4RhSC7HG0BVFhGQjLQ9
         0ovULZFgF8/kAmIbvcCeVCjKDmPJmbyUA1s7VObJM4oRcP0xSMHPs2YqZT0OqkTuafHi
         i8zQNur8ylFZZkx3bBLYcwtVLoxUkedke6q4BURI9PSFpxHw1d2ly1COim+um6u3T/Xs
         9tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732809938; x=1733414738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P25IxRmuotBaAP9klN4uOjmIF9WutkkJ9VyclARS03k=;
        b=UY2JH2K0aMmNxH7h2yUYSjXlIWy9VmldSPgw2fIGTNw+tWlSW3v4Kk20a9z0FpNBGm
         SJDEnl2FlFWhyDsFOFhhV5wUd3EXPY18aKa5+jln9X/mdaLuKJutEeXUKIZXwGYqMNh8
         0NWtC4j452WPxmQ/2jBcnwvpcMZIi4FrDxqQTt+VaoF4qnB+S2ikiXHYPqs2/9WZRCyC
         fWzvDhZzjf0tOuhdMXNb7hAFF90Z5bFp+N/2Ctxa8WMLuF4jb7ohk0nTAynTug2qy3qs
         WWqz+G6bKbNGwuYpNc+CdRXqlo/1U/ulAgQk+42TbboW/squssMJS0Tr91W4yIVs8j0O
         CjFA==
X-Gm-Message-State: AOJu0Yx9V2xpnlSCWyxgT/YrVvjH73XwF0l4QAMEA76r94LMq/q7xrtX
	JOYiWlBzb+Kz+YvEQdN3PFpjxyo7rWjBMMUnzuwuBBUdeid3zE3QoOSPvElp2VFCykEyli7jgLT
	OuYSuH8c1kNFrsSLtsA9e/JYi97w=
X-Gm-Gg: ASbGncvq29vGq3pL2f1CwLHbWM+TTkbpvp/MdKVR3dvDkb+6RmthRFeQP/clROI02Uo
	s7hWgeZ9oSFiLNQ/KX+SBfbuQvmQ6TBrPeQ==
X-Google-Smtp-Source: AGHT+IFtY7nf1i7B8fwOXL6S0We+brpJm1Ja+fLMNSAGYV/8FUz0IMVwYvjIcXD5qIJD3wzmsOa7E0kFDCrI83UaSjs=
X-Received: by 2002:a05:6a21:33a9:b0:1e0:ccfa:7f18 with SMTP id
 adf61e73a8af0-1e0e0b8bf4amr10763971637.42.1732809938340; Thu, 28 Nov 2024
 08:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20241127125945.3211089-1-colinmca242@gmail.com>
In-Reply-To: <20241127125945.3211089-1-colinmca242@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 28 Nov 2024 17:05:26 +0100
Message-ID: <CAApg2=QjL7XBPbBU0tP7T_hO2OVTudzDf3u+2zJh9GVS3gXKoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: Update vector logic
To: colinmca242@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d6981f0627fb4083"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 16:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207994

--000000000000d6981f0627fb4083
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 1:59=E2=80=AFPM Colin McAllister via lists.openembe=
dded.org
<colinmca242=3Dgmail.com@lists.openembedded.org> wrote:

> The database used by cve-check currently stores the access vector and
> vector string for the oldest CVSS version for each CVE. This should be
> reversed, where the newest possible CVSS version is included instead.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> ---
>  meta/classes/cve-check.bbclass                   |  2 +-
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index 0c92b87f52..c4cbcdf8e3 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -31,7 +31,7 @@
>  CVE_PRODUCT ??=3D "${BPN}"
>  CVE_VERSION ??=3D "${PV}"
>
> -CVE_CHECK_DB_FILENAME ?=3D "nvdcve_2-2.db"
> +CVE_CHECK_DB_FILENAME ?=3D "nvdcve_2-3.db"
>  CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
>  CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
>  CVE_CHECK_DB_FILE_LOCK ?=3D "${CVE_CHECK_DB_FILE}.lock"
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index a68a8bb89f..e111709b22 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -355,21 +355,21 @@ def update_db(conn, elt):
>          cvssv2 =3D 0.0
>      cvssv3 =3D None
>      try:
> -        accessVector =3D accessVector or
> elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
> -        vectorString =3D vectorString or
> elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
> +        accessVector =3D
> elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
> +        vectorString =3D
> elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
>          cvssv3 =3D
> elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
>      except KeyError:
>          pass
>      try:
> -        accessVector =3D accessVector or
> elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
> -        vectorString =3D vectorString or
> elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
> +        accessVector =3D
> elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
> +        vectorString =3D
> elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
>          cvssv3 =3D cvssv3 or
> elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
>      except KeyError:
>          pass
>      cvssv3 =3D cvssv3 or 0.0
>      try:
> -        accessVector =3D accessVector or
> elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
> -        vectorString =3D vectorString or
> elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
> +        accessVector =3D
> elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
> +        vectorString =3D
> elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
>          cvssv4 =3D
> elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['baseScore']
>      except KeyError:
>          cvssv4 =3D 0.0
> --
>

When we're at this patch... I'm wondering if anyone is actually using the
vectorString from our database for
any processing? In other terms, is someone extracting parts of the vector
(like network vulnerabilities)?
Or we can just remove it and people who want it, will have a look in other
places?

test_image_json is not checking for the vector string, most likely time
outs when downloading the database.

Kind regards,
Marta

--000000000000d6981f0627fb4083
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 27, 2024 at 1:59=E2=80=AF=
PM Colin McAllister via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;colinmca242=3D<a href=3D"mailto:gmail.com@lists.opene=
mbedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">The database used by cve-check=
 currently stores the access vector and<br>
vector string for the oldest CVSS version for each CVE. This should be<br>
reversed, where the newest possible CVSS version is included instead.<br>
<br>
Signed-off-by: Colin McAllister &lt;<a href=3D"mailto:colinmca242@gmail.com=
" target=3D"_blank">colinmca242@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> | 12 ++++=
++------<br>
=C2=A02 files changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index 0c92b87f52..c4cbcdf8e3 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -31,7 +31,7 @@<br>
=C2=A0CVE_PRODUCT ??=3D &quot;${BPN}&quot;<br>
=C2=A0CVE_VERSION ??=3D &quot;${PV}&quot;<br>
<br>
-CVE_CHECK_DB_FILENAME ?=3D &quot;nvdcve_2-2.db&quot;<br>
+CVE_CHECK_DB_FILENAME ?=3D &quot;nvdcve_2-3.db&quot;<br>
=C2=A0CVE_CHECK_DB_DIR ?=3D &quot;${STAGING_DIR}/CVE_CHECK&quot;<br>
=C2=A0CVE_CHECK_DB_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILEN=
AME}&quot;<br>
=C2=A0CVE_CHECK_DB_FILE_LOCK ?=3D &quot;${CVE_CHECK_DB_FILE}.lock&quot;<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-nativ=
e.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> b/=
meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
index a68a8bb89f..e111709b22 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
@@ -355,21 +355,21 @@ def update_db(conn, elt):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvssv2 =3D 0.0<br>
=C2=A0 =C2=A0 =C2=A0cvssv3 =3D None<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D accessVector or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV30&#39;][0][&#39;cvssData&#39;][&#=
39;attackVector&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D vectorString or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV30&#39;][0][&#39;cvssData&#39;][&#=
39;vectorString&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D elt[&#39;cve&#39;][&#39;metri=
cs&#39;][&#39;cvssMetricV30&#39;][0][&#39;cvssData&#39;][&#39;attackVector&=
#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D elt[&#39;cve&#39;][&#39;metri=
cs&#39;][&#39;cvssMetricV30&#39;][0][&#39;cvssData&#39;][&#39;vectorString&=
#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvssv3 =3D elt[&#39;cve&#39;][&#39;metric=
s&#39;][&#39;cvssMetricV30&#39;][0][&#39;cvssData&#39;][&#39;baseScore&#39;=
]<br>
=C2=A0 =C2=A0 =C2=A0except KeyError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D accessVector or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV31&#39;][0][&#39;cvssData&#39;][&#=
39;attackVector&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D vectorString or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV31&#39;][0][&#39;cvssData&#39;][&#=
39;vectorString&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D elt[&#39;cve&#39;][&#39;metri=
cs&#39;][&#39;cvssMetricV31&#39;][0][&#39;cvssData&#39;][&#39;attackVector&=
#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D elt[&#39;cve&#39;][&#39;metri=
cs&#39;][&#39;cvssMetricV31&#39;][0][&#39;cvssData&#39;][&#39;vectorString&=
#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvssv3 =3D cvssv3 or elt[&#39;cve&#39;][&=
#39;metrics&#39;][&#39;cvssMetricV31&#39;][0][&#39;cvssData&#39;][&#39;base=
Score&#39;]<br>
=C2=A0 =C2=A0 =C2=A0except KeyError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
=C2=A0 =C2=A0 =C2=A0cvssv3 =3D cvssv3 or 0.0<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D accessVector or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV40&#39;][0][&#39;cvssData&#39;][&#=
39;attackVector&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D vectorString or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV40&#39;][0][&#39;cvssData&#39;][&#=
39;vectorString&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D elt[&#39;cve&#39;][&#39;metri=
cs&#39;][&#39;cvssMetricV40&#39;][0][&#39;cvssData&#39;][&#39;attackVector&=
#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D elt[&#39;cve&#39;][&#39;metri=
cs&#39;][&#39;cvssMetricV40&#39;][0][&#39;cvssData&#39;][&#39;vectorString&=
#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvssv4 =3D elt[&#39;cve&#39;][&#39;metric=
s&#39;][&#39;cvssMetricV40&#39;][0][&#39;cvssData&#39;][&#39;baseScore&#39;=
]<br>
=C2=A0 =C2=A0 =C2=A0except KeyError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvssv4 =3D 0.0<br>
-- <br></blockquote><div><br></div><div>When we&#39;re at this patch... I&#=
39;m wondering if anyone is actually using the vectorString from our databa=
se for</div><div>any processing? In other terms, is someone extracting part=
s of the vector (like network vulnerabilities)?</div><div>Or we can just re=
move it and people who want it, will have a look in other places?<br></div>=
<div><br></div><div>test_image_json is not checking for the vector string, =
most likely time outs when downloading the database.</div><div><br></div><d=
iv>Kind regards,</div><div>Marta <br></div></div></div>

--000000000000d6981f0627fb4083--

