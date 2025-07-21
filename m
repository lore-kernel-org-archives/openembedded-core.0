Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4175EC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 07:16:11 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.34726.1753082165648016881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 00:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jDjZV+wi;
 spf=pass (domain: mvista.com, ip: 209.85.218.53, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae708b0e83eso707924166b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 00:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1753082164; x=1753686964; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAhEfVy0j34Axwt3iztzZNBERxfrgPVzjtF3vf61G1Q=;
        b=jDjZV+wiy9Wq8IP7KEyKK12tlSlOGJIN7yVPpgjuKBHsUeJ+gUTiaM3Z4Egzai1SQi
         zfeISNoHeZKbk3sHn00KAG15O1lGFS+S24QHXadyH2ygtm8++d3b2mn7KWPxK315FWLW
         5rAPoC/Cd6idoapkQ30Rx55fbWWHUgTUF3hrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753082164; x=1753686964;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAhEfVy0j34Axwt3iztzZNBERxfrgPVzjtF3vf61G1Q=;
        b=cpUP2DW8U1FYfkOrrS7rYUwjuidQdTezgHRRSK/LxfmvUUzPJxVYrAR3J3y/Hudb88
         I87KSeMJHypo4EJW39uBfkE1d73cJp/hrB4mcAyMyC5xymqEd6g/H6Hmvh9FsygeR7ky
         1SWjMxE2VPxK8MOqllcL8pATwYiWahKP4l07fwHdjysVwR91YreZ6jjktdXp9HwSI6qm
         VzNHs1FseIqslqCnBWC9dib2o4G6emQDSXDjhhAEGhcYEzjV+gTzb3oZ4UaHjTiA3qf4
         fiGOIBwDIqHZomzcpgYC5ranw8ynqr6G+tE+SgWLxRcKEEPRTZaa9SNkTP2JB76dBVZk
         uxSg==
X-Gm-Message-State: AOJu0YxE1ZkA79GHMQ6fwrnG/0sv6n7aywdW8hT2KGikjh+A3MdNjg8q
	Oc0IJWiF4aTPi9M60wlFK1DiVob/qF3yorX4y0cOEHV+CGjNep10aD/otKHlyOTi3/1MnMMESn8
	pPYpbXlbuJ1fpP3gjAgETHinZnY6uQTWmJQHZoZLUJvua7WFEb21kn6o=
X-Gm-Gg: ASbGncsGOD04nxkvBx+FtgHXEGqXlp7iWM9fWXW4E0C5ZZrbHcXuOmVuWISDytFEE7d
	XcYFGyjoWuN/bMheKfoSyEz/OReBV4AIYv3enoqasKNCEFC9chDV1pb2C6gUITwWqCzmLM/tvS/
	3VBj4GlNXgWmCqupI7YqFEEAVWgKjPVeVGlURSyBAbKIxuZ05RMLT3HzwblnTiV6LGXaeMsCLbG
	R4cIu8=
X-Google-Smtp-Source: AGHT+IGdZWVHatKfoJg3lONif8ofjM9iKYsWsXqjuxWT8hJIjVfl+Jmdnj1YGILsQiXjpLTGBd5yQw7DPlHUVBz7PtQ=
X-Received: by 2002:a17:906:4715:b0:ae0:be38:64bf with SMTP id
 a640c23a62f3a-ae9ce189d4dmr1571040866b.58.1753082163257; Mon, 21 Jul 2025
 00:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250701103252.6703-1-vanusuri@mvista.com>
In-Reply-To: <20250701103252.6703-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 21 Jul 2025 12:45:51 +0530
X-Gm-Features: Ac12FXxCFWIzn0wO61cbVbB0hdCXiPyPjWlPVAwE2k82BNwAr92nIch6K97BZq8
Message-ID: <CANQUz18dZfkQWXPC9ZgVc-VP86Q3-pPcpHL31K8PbTF7k-17Ng@mail.gmail.com>
Subject: Re: [OE-core][master][walnascar][scarthgap][PATCH] xserver-xorg:
 upgrade 21.1.6 -> 21.1.18
To: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000009a7c8e063a6b3fbf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 07:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220660

--0000000000009a7c8e063a6b3fbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update on this ?

Thanks & Regards,
Vijay

On Tue, Jul 1, 2025 at 4:03=E2=80=AFPM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> xorg-server 21.1.17
> This release contains the fixes for the issues reported in today's securi=
ty
> advisory: https://lists.x.org/archives/xorg/2025-June/062055.html
>
>    * CVE-2025-49175
>    * CVE-2025-49176
>    * CVE-2025-49177
>    * CVE-2025-49178
>    * CVE-2025-49179
>    * CVE-2025-49180
>
> Additionally, this release includes a fix for CVE-2022-49737 which was
> issued after the fix was merged back in 2022 and several other various
> fixes.
>
> Ref: https://lists.x.org/archives/xorg-announce/2025-June/003609.html
>
> xorg-server 21.1.18
> This release contains an additional fix for CVE-2025-49176 from June 17
> security advisory: https://lists.x.org/archives/xorg/2025-June/062055.htm=
l
>
> Ref: https://lists.x.org/archives/xorg-announce/2025-June/003612.html
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../{xserver-xorg_21.1.16.bb =3D> xserver-xorg_21.1.18.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb =3D>
> xserver-xorg_21.1.18.bb} (92%)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> similarity index 92%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> index 38c81f2372..14c45be432 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> @@ -3,7 +3,7 @@ require xserver-xorg.inc
>  SRC_URI +=3D
> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
> +SRC_URI[sha256sum] =3D
> "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
>
>  # These extensions are now integrated into the server, so declare the
> migration
>  # path for in-place upgrades.
> --
> 2.25.1
>
>

--0000000000009a7c8e063a6b3fbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Team,<br><br></div>Any update on this ?<br><b=
r></div><div>Thanks &amp; Regards,</div><div>Vijay</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Jul 1, 2025 at 4:03=E2=80=AFPM &lt;<a href=3D"mailto:vanusuri@mv=
ista.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanu=
suri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
xorg-server 21.1.17<br>
This release contains the fixes for the issues reported in today&#39;s secu=
rity<br>
advisory: <a href=3D"https://lists.x.org/archives/xorg/2025-June/062055.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://lists.x.org/archives/xorg/2=
025-June/062055.html</a><br>
<br>
=C2=A0 =C2=A0* CVE-2025-49175<br>
=C2=A0 =C2=A0* CVE-2025-49176<br>
=C2=A0 =C2=A0* CVE-2025-49177<br>
=C2=A0 =C2=A0* CVE-2025-49178<br>
=C2=A0 =C2=A0* CVE-2025-49179<br>
=C2=A0 =C2=A0* CVE-2025-49180<br>
<br>
Additionally, this release includes a fix for CVE-2022-49737 which was<br>
issued after the fix was merged back in 2022 and several other various fixe=
s.<br>
<br>
Ref: <a href=3D"https://lists.x.org/archives/xorg-announce/2025-June/003609=
.html" rel=3D"noreferrer" target=3D"_blank">https://lists.x.org/archives/xo=
rg-announce/2025-June/003609.html</a><br>
<br>
xorg-server 21.1.18<br>
This release contains an additional fix for CVE-2025-49176 from June 17<br>
security advisory: <a href=3D"https://lists.x.org/archives/xorg/2025-June/0=
62055.html" rel=3D"noreferrer" target=3D"_blank">https://lists.x.org/archiv=
es/xorg/2025-June/062055.html</a><br>
<br>
Ref: <a href=3D"https://lists.x.org/archives/xorg-announce/2025-June/003612=
.html" rel=3D"noreferrer" target=3D"_blank">https://lists.x.org/archives/xo=
rg-announce/2025-June/003612.html</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://xserver-xorg_21.1.16.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">xserver-xorg_21.1.16.bb</a> =3D&gt; <a href=3D"http://xserv=
er-xorg_21.1.18.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.=
18.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-graphics/xorg-xserver/{<a href=3D"http://xserver-=
xorg_21.1.16.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.16.=
bb</a> =3D&gt; <a href=3D"http://xserver-xorg_21.1.18.bb" rel=3D"noreferrer=
" target=3D"_blank">xserver-xorg_21.1.18.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-x=
org_21.1.16.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.16.b=
b</a> b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_2=
1.1.18.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.18.bb</a>=
<br>
similarity index 92%<br>
rename from meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xo=
rg_21.1.16.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.16.bb=
</a><br>
rename to meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg=
_21.1.18.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.18.bb</=
a><br>
index 38c81f2372..14c45be432 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_21.=
1.16.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.16.bb</a><b=
r>
+++ b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_21.=
1.18.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.18.bb</a><b=
r>
@@ -3,7 +3,7 @@ require xserver-xorg.inc<br>
=C2=A0SRC_URI +=3D &quot;file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pr=
e-gen4-hardwar.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Avoid-duplicate-defin=
itions-of-IOPortBase.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;b14a116d2d805debc5b5b2aac505a279e69b217dae2fa=
e2dfcb62400471a9970&quot;<br>
+SRC_URI[sha256sum] =3D &quot;c878d1930d87725d4a5bf498c24f4be8130d5b2646a9f=
d0f2994deff90116352&quot;<br>
<br>
=C2=A0# These extensions are now integrated into the server, so declare the=
 migration<br>
=C2=A0# path for in-place upgrades.<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000009a7c8e063a6b3fbf--

