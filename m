Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96190C79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:44:37 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9165.1788878676340540390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 07:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nc16mTB6;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66d23c88af0so1495675d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 07:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788878675; cv=none;
        d=google.com; s=arc-20260327;
        b=E2fiYVUAIW9tMUaGIWnUYWyDsH/s8gs8TNUtXnK7Np+hStMDt/3uiufEUUr5Xq9VT5
         hqfsa6iNqg7F/v7HHSs1zesVZycCtNp9UdhReljM6InvQ4U4GUkCYyhvmnrdxg3fza/D
         9p4MGgsv0RYLyUrIeek08WdN3m4nBErYsl0YAjoyuDpgrZqYdUFMX8BryDWOO8pt/S9/
         2bFJRqQT6ghPSGYwW3aYplku73h4+ttzJVmaxxNeNvDdgRObHWr1WhYqOKbwfEqHrVW7
         9IYRxBwtZhwPnULaozj0h5pAvs1+3H+rxHByZReavZihXqn9Y8O/KlTOPjUFt9a+sJr0
         bbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WcdyM2/ctTPRkKK2l6mojZZhoFH1ZQXkYth5hrl3QQw=;
        fh=uxGvXFEmSpY3EDi5ss0twpsDlj+Bh1oHVzHVj0cjw+E=;
        b=W/Y0NcDt3nUX5+FEC7P0WBz90HZQQ/PXZOk7tzo06qaM3rsC+86L2UmD4wA7rDY+Nk
         +sqsmdLLi+XihMcZFzmtHkpAfI84lTHny08dsreM+LDD/CcuXZr242T9dZGwMah3GeOW
         NamVDhpEGyZM7drqAqkOWeftVBbiJa24SHIni+Cu8EyDHkWywwhBgJxSKAUtSBL+1HOz
         H07mowbx6l3GCZWZ4DnOfbrZWD4BAVJfLgZLY2VDwEt4ivaZiCG49aIgGd9izVaiDX9b
         CnGBjIrI1fOnYm3rhc9hqH+9wCixlcmu77IE4sbiZQmGZrhXSnl7i0g82p8mvLAfj7Y/
         11rQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788878675; x=1789483475; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcdyM2/ctTPRkKK2l6mojZZhoFH1ZQXkYth5hrl3QQw=;
        b=nc16mTB6S0nG70HnWQT0tGT6iVaYqFw2ALzziQl3TE7UTeeFu4TFmEnGrFgPka2hjm
         PPEC4TqBxvO9Nz9b89zPVPtGu8Keq6fhzNcpwt6nAMXKL001r0ok1lqdXe44N0Aoh85A
         2I2l0gRIMO7jby3WuYcDzwn301mM74xYbDK3JS91BaGcGv5NhwShSDvXguW7oUciyq0M
         JSC2vT+z27cXLzqiL5d5QtL88jWlr1vXrhmW7VAkQC007lclTICFAm1yxuohu+arsGCh
         4eFBzQBBDA8cJxc+22RgpKldJEXNzwXtbbkOZTfS7Ka3ldI5HgGrQjZUCPapiiDGVA2M
         yNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878675; x=1789483475;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WcdyM2/ctTPRkKK2l6mojZZhoFH1ZQXkYth5hrl3QQw=;
        b=UqYIoUfE28xL6wRExOo0d0TeN6z+NOJvhUCxTWGfSRCAKempFCr6ODX0TgPdJOALBo
         GVdJGAOVrKFEkIAowkjjb8GdrwgThmd3YEDzedJKa5i095QeXvcwicvZbRA7/AnNU9pW
         wrSYM2yw5cerKjwKyDS1xdo/jYEDeTEMiatpi5mWwVJFlstHrnoWL1i+3kxgTHiF8SKE
         1melCEGyfH2EJhiXm922NSrEhAf+0K8MN4v7Lkz87MqpTjGN9SyCiTSANOILDLPXSULw
         VQL653QmOgxYuQKDQYB3WIxK+UB3BpPrDrDB1KMdnRsbbDKIZz4jpgtrVQcAaHP5q7s6
         SD9Q==
X-Gm-Message-State: AFuF++m3rc4HLQfyaxyEUsA+Naw+zOhq9EYrlhxmdf7SMxPth2OpXnH9
	gE/+hT28PybOCxSrT2HI8dvM8FUYVhWp7GyfOY8WyCUx781KKYRGIu45EJhkkwEQ+fhuupObD8g
	XKzr8Q1rQqGu5xtCegACXmqrS4k1dDLw=
X-Gm-Gg: AYBFou0ADxBjlXu9jQnnHOIxXPReTFU942/LwQ0o6u1aSMydNTSgsgSoApZdxzp62VD
	0m3dO3JV/7G3ACf7t7e2xBr5SO/CoIbLtEYJnY0ANPVnpAx0JXoTuVapmGdImxyf6PvhUAeKdNB
	ndvzXhLHD9E6KPLnjn2bV9GEVnB1w2vWfMw1S7UOHZPJ9NhslGzlGnBCbxzHFDuAj0230OtE4wK
	yp2nBVO4HMhdeODnjsie8JAjRUKWQqdYluPwhE4YOpChzy9x14fqVCUYogBw7o0nUQvN+oyRL44
	UG52xahtAK+9UfKaWzgw+XqkxTL5g83kX8Bof1tAFg9DtMkM7C1UL6O06v7I
X-Received: by 2002:a53:df45:0:b0:667:dfad:8767 with SMTP id
 956f58d0204a3-66fb59212demr6566397d50.9.1788878675241; Tue, 08 Sep 2026
 07:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <TYYP301MB1158B7A88A133C646658C16AEBAF2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To: <TYYP301MB1158B7A88A133C646658C16AEBAF2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 8 Sep 2026 08:44:21 -0600
X-Gm-Features: AcwNN1WaKVDb2EUKcyAosSAVlZ5lMphiUN85i7vpYqmaErbgWBgy3pp3RTGII-s
Message-ID: <CAJdd5GZSuNS-ykMbZQc82aAqSmnGdv6-q0r7qfLUpjr_tBLiAA@mail.gmail.com>
Subject: Re: [PATCH] spdx30_tasks: Fix duplicated revision in Git PURLs
To: =?UTF-8?B?S0FaVVlPU0hJIEFLSVlBTUEgKOeni+WxsSDlkozmhbYp?= <kazuyoshi_akiyama@jp.honda>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"stondo@gmail.com" <stondo@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000fbf04a065af9c534"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 14:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245372

--000000000000fbf04a065af9c534
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 4:44=E2=80=AFAM KAZUYOSHI AKIYAMA (=E7=A7=8B=E5=B1=
=B1 =E5=92=8C=E6=85=B6)
<kazuyoshi_akiyama@jp.honda> wrote:

> _generate_git_purl() generates invalid PURLs of the form
> `pkg:github/<owner>/<repo>@<rev>@<rev>`.
> purl-spec only allows a single `@<rev>`.
>
> oe.spdx_common.fetch_data_to_uri() already appends "@<rev>" to the
> download location, and urlparse() leaves that suffix in parsed.path.
> Therefore, the parsed repository name(`{repo}`) includes `@<rev>`.
> So, need to strip the revision suffix before splitting out
> the owner(`{owner}`) and the repository name(`{repo}`).
>
> While here, replace str.replace(".git", "") with str.removesuffix() so
> repository names that contain ".git" elsewhere are preserved.
>
> Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
>

LGTM, thank.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>



> ---
>  meta/lib/oe/spdx30_tasks.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index dac02e3784..b2f208e1f6 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -379,11 +379,14 @@ def _generate_git_purl(d, download_location, srcrev=
):
>
>      for domain, purl_type in git_purl_handlers.items():
>          if hostname =3D=3D domain:
> -            path =3D parsed.path.strip("/")
> +            # oe.spdx_common.fetch_data_to_uri() appends "@<rev>" to the
> +            # download location, which must not become part of the
> +            # repository name
> +            path =3D parsed.path.strip("/").partition("@")[0]
>              path_parts =3D path.split("/")
>              if len(path_parts) >=3D 2:
>                  owner =3D path_parts[0]
> -                repo =3D path_parts[1].replace(".git", "")
> +                repo =3D path_parts[1].removesuffix(".git")
>                  return f"{purl_type}/{owner}/{repo}@{srcrev}"
>              break
>
> --
> 2.34.1
>
>

--000000000000fbf04a065af9c534
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 25,=
 2026 at 4:44=E2=80=AFAM KAZUYOSHI AKIYAMA (=E7=A7=8B=E5=B1=B1 =E5=92=8C=E6=
=85=B6) &lt;kazuyoshi_akiyama@jp.honda&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">_generate_git_purl() generates invalid PU=
RLs of the form<br>
`pkg:github/&lt;owner&gt;/&lt;repo&gt;@&lt;rev&gt;@&lt;rev&gt;`.<br>
purl-spec only allows a single `@&lt;rev&gt;`.<br>
<br>
oe.spdx_common.fetch_data_to_uri() already appends &quot;@&lt;rev&gt;&quot;=
 to the<br>
download location, and urlparse() leaves that suffix in parsed.path.<br>
Therefore, the parsed repository name(`{repo}`) includes `@&lt;rev&gt;`.<br=
>
So, need to strip the revision suffix before splitting out<br>
the owner(`{owner}`) and the repository name(`{repo}`).<br>
<br>
While here, replace str.replace(&quot;.git&quot;, &quot;&quot;) with str.re=
movesuffix() so<br>
repository names that contain &quot;.git&quot; elsewhere are preserved.<br>
<br>
Signed-off-by: Kazuyoshi Akiyama &lt;kazuyoshi_akiyama@jp.honda&gt;<br></bl=
ockquote><div><br></div><div>LGTM, thank.</div><div><br></div><div>Reviewed=
-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gma=
il.com</a>&gt;</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
=C2=A0meta/lib/oe/spdx30_tasks.py | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index dac02e3784..b2f208e1f6 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -379,11 +379,14 @@ def _generate_git_purl(d, download_location, srcrev):=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0for domain, purl_type in git_purl_handlers.items():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if hostname =3D=3D domain:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D parsed.path.strip(&quot=
;/&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # oe.spdx_common.fetch_data_to_u=
ri() appends &quot;@&lt;rev&gt;&quot; to the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # download location, which must =
not become part of the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # repository name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D parsed.path.strip(&quot=
;/&quot;).partition(&quot;@&quot;)[0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path_parts =3D path.split(&=
quot;/&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(path_parts) &gt;=3D =
2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0owner =3D pat=
h_parts[0]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo =3D path_part=
s[1].replace(&quot;.git&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 repo =3D path_part=
s[1].removesuffix(&quot;.git&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return f&quot=
;{purl_type}/{owner}/{repo}@{srcrev}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000fbf04a065af9c534--

