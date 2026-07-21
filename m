Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8F8C44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:36:03 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24325.1784644552907573113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=def/bHJG;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-667b0ced2d3so12630164d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 07:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784644552; cv=none;
        d=google.com; s=arc-20260327;
        b=X8xV795jyAEdPzHY5Flx0d9uoLcLv1ce2G9Wl9RcolHZDnKzSWPjk+FVPcuYKyOylI
         SASMAb4EXxr4grmX+8hxx6O3w01uzo0WB+HCHkkfLZ686+QlFtW57niA7gNWR4pdAZuq
         JyWS5/08mzQHV+92wwXw+UdurlsJMjyYjfX8GGIObAsEjNBvCFsvxB4Mh6JLJXLe47gT
         9+cyEuI3rAZMVSCcbBJ6OtynOis2etIVfjo0Lp0qOV1Ilo5D+xj68390PW0zYMW5SkyX
         2qE36E6/Apg1LPXM4DvVVWOJF5XLMZuBoAUGBKtAibl4X4i0zBMISKg6WxyIkD2gRjh5
         3h9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A4/XYVkJ/6rdvqIlYcAYdBZI3KKrMwum/xaFzi4FyXg=;
        fh=LF7ElVRlXKDPLPNPaC2ukmFxcz+X7tJiIlC9OM0P330=;
        b=oYtgyennI/N9UUkx3qJGrrEazEJ2qkGR7QypVOeJ7o3yO6fz7JiMC3Cxu/aZcG1vtj
         cBzk2vqWjQPekxomMgZ46tmz8MQIsnXYzUtEboYQxQ/rRloHvgNjvA5DQNnKSZtEJQRc
         PKpNox4SIVVE/tfhe7Zw2KQm/f0l66KP+UTsRFHzn63Y9s8bqa6XCq9EuT/PqVz9GZpa
         f9SfA2F5C/qDeAA8KgV4dloZZZBxf/7NZMp7ZEUm2XnxxzHBlY6BSNvMc7edDv88OyJ+
         LaT6Eqve5p4jIg179oaYlmpWqJlePI+ZBgAIEFOCFNYpT6LesT5iOG63bvBG3KfSZCue
         ZkxQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784644552; x=1785249352; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4/XYVkJ/6rdvqIlYcAYdBZI3KKrMwum/xaFzi4FyXg=;
        b=def/bHJGY05ZSmy75osT+q8QHEHyxGNw74VZkvOcPHxrl3dEzAa+9v0J7Xq0xxRAA0
         4STMovjgWk1V3k9YiL8kALhupcrrhK1XpznNqPfPTzykG03Np+j8WnFNCy1P1YEbtwUT
         BsxXkACkzDlJnl0be3k/XOD/Hpee1bLzldy31ztfjyn9WmvL6Fgkutze1KftlI4h9FsI
         D560rAT5M8KmX8X3wyp0pgeN3qleE8wbyzMBBYVTzpm352DhrxVWRfqGpqBWZJM2UeiD
         Lu0rCUbA9ZHOZzLv8nYhF/Qx4v+mnXn4BrshEpeOqjnDTWBkAdZhoydj8YrB4mMqTaE8
         LZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644552; x=1785249352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A4/XYVkJ/6rdvqIlYcAYdBZI3KKrMwum/xaFzi4FyXg=;
        b=ayJlhqoQhlcYpR/3xTstH4ABZhBxcZqWhbLDD3LvHTv16sumWF+6DF4NQBePVGs36v
         9D32FUo1wf1np1lwNWt2nNy4NiO6dG2jBDrlCI24FoAnk5eEdtqCaQiisS7q55iTcrsY
         z/rpF1PW9qZH/a3Ib3UJdNhUV/1iQOtFDF5xXyJ2syZAQmck/w3UvIPsW/FlJL1edJp7
         x//9juueNZEgR3OvYBYGHczZKs+RxxprBuDaR4UpomwiteF+i+xttj1rxva0eR7j0VYc
         jkb3jNFV1eCVe3Bpk2Pnb6ZU/vh6ZeXJC4XgT9ZJKfb5ICQUO//cAdRp+tW+2AuCGc4v
         166g==
X-Gm-Message-State: AOJu0YydtYv+1bIEqT9ucVKq0ItZTieElhwCsBkLy8WSGCz4uuwya73O
	9QO1dBRUGHyEP3LLpsoMogYI+IDYJlme2P//i/qjgYGhRunmu2/QS2acnWHPVO0r9X5KeoulJmN
	kBY0KnfIqUt3b8LVnfDZytv1sPTLrXgs=
X-Gm-Gg: AR+sD1386o84u+5N2HbXY96bGsAWlRUT5w6DOCyNb4i5RznsqpKVlTYF1CkDwW+4R47
	1FJlb2Y4ImXS7NDiuytRI7W1fM/yMxyjMrSEe+c6m33oHqsh2wVwHJrpoCKWMqR0vN1fGtSmtCH
	dmKHmVLpKxmFqUUr9BuqgohssZ117D4AqmFGZ/fGaB+kI8t2ClVxqcc5QfW8P89xj9iz3czwoZ3
	FLQmoXPR4VO8tbH6RP7lWcW0nq7WZqgw1aVoOn0oSaKp20oU/jMb20jm/n5HLkeC2iuRckE5/I=
X-Received: by 2002:a53:c104:0:b0:667:a2e7:dd3b with SMTP id
 956f58d0204a3-6683bc35bf7mr3794743d50.58.1784644551703; Tue, 21 Jul 2026
 07:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260721093251.2697077-1-martin.jansa@gmail.com>
In-Reply-To: <20260721093251.2697077-1-martin.jansa@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 21 Jul 2026 08:35:40 -0600
X-Gm-Features: AUfX_mzuAihs6CIPAvfHGMonS58X9sc8cybBr0QJpN2E-4o4ulotwJXuVKTs7lo
Message-ID: <CAJdd5Ga3cryEZHK_gL_d1Si3-RJYsRQL7Hmuv0PaGPJr3SULHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] glib-networking: update LICENSE for openssl PACKAGECONFIG
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008e00ef06571ff071"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241541

--0000000000008e00ef06571ff071
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 3:32=E2=80=AFAM <martin.jansa@gmail.com> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> Fixes:
> glib-networking: LICENSE is using an old syntax and should be upgraded to=
:
> "LGPL-2.1-or-later AND LicenseRef-Glib-Networking-OpenSSL-Exception"
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/recipes-core/glib-networking/glib-networking_2.80.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
> b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
> index 3d47e354e2..d81d7d75e9 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "
> https://gitlab.gnome.org/GNOME/glib-networking/"
>  BUGTRACKER =3D "http://bugzilla.gnome.org"
>
>  LICENSE =3D "LGPL-2.1-or-later"
> -LICENSE:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' &
> Glib-Networking-OpenSSL-Exception', '', d)}"
> +LICENSE:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' A=
ND
> LicenseRef-Glib-Networking-OpenSSL-Exception', '', d)}"
>

I believe this could be "AND LGPL-2.1-or-later
WITH openvpn-openssl-exception", since the text of the license matches
https://spdx.org/licenses/openvpn-openssl-exception.html (with
replacements), but please double check my work.


>  NO_GENERIC_LICENSE[Glib-Networking-OpenSSL-Exception] =3D
> "LICENSE_EXCEPTION"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
>

--0000000000008e00ef06571ff071
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 21,=
 2026 at 3:32=E2=80=AFAM &lt;<a href=3D"mailto:martin.jansa@gmail.com">mart=
in.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gma=
il.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<br>
Fixes:<br>
glib-networking: LICENSE is using an old syntax and should be upgraded to: =
&quot;LGPL-2.1-or-later AND LicenseRef-Glib-Networking-OpenSSL-Exception&qu=
ot;<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.80.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.80.1.bb</a=
> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glib-networking/<a href=3D"http://glib-netwo=
rking_2.80.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.80.=
1.bb</a> b/meta/recipes-core/glib-networking/<a href=3D"http://glib-network=
ing_2.80.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.80.1.=
bb</a><br>
index 3d47e354e2..d81d7d75e9 100644<br>
--- a/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.80.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.80.1.bb</a=
><br>
+++ b/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.80.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.80.1.bb</a=
><br>
@@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOM=
E/glib-networking/" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gno=
me.org/GNOME/glib-networking/</a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"http://bugzilla.gnome.org" rel=3D"nor=
eferrer" target=3D"_blank">http://bugzilla.gnome.org</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
-LICENSE:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#3=
9;openssl&#39;, &#39; &amp; Glib-Networking-OpenSSL-Exception&#39;, &#39;&#=
39;, d)}&quot;<br>
+LICENSE:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#3=
9;openssl&#39;, &#39; AND LicenseRef-Glib-Networking-OpenSSL-Exception&#39;=
, &#39;&#39;, d)}&quot;<br></blockquote><div><br></div><div>I believe=C2=A0=
this could be &quot;AND LGPL-2.1-or-later WITH=C2=A0openvpn-openssl-excepti=
on&quot;, since the text of the license matches=C2=A0<a href=3D"https://spd=
x.org/licenses/openvpn-openssl-exception.html">https://spdx.org/licenses/op=
envpn-openssl-exception.html</a> (with replacements), but please double che=
ck my work.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0NO_GENERIC_LICENSE[Glib-Networking-OpenSSL-Exception] =3D &quot;LICEN=
SE_EXCEPTION&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079=
008b364516c \<br>
</blockquote></div></div>

--0000000000008e00ef06571ff071--

