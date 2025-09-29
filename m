Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A969CCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 08:25:53 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.48677.1759134346766041071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 01:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tKkSNWqH;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-421851bca51so306560f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759134345; x=1759739145; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=THDoZtndN7wbU9hHJngRTPNIkbHrG3NTpzeOoqxO0C8=;
        b=tKkSNWqHKeux8MOVKBgiliw+Fwo1bHndFxpastOGhWjqRh8hsjFo2LirkBsPTxvpvh
         T/+AxyT4INzYiukujfiAEIv6xDggVgqxhHQou+9Y0u3qw2nWR1SU4ekocV3NiioRIqsd
         G1qMOTLfrBrvxXBMZW3PuVedbSmMglVZsFE/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759134345; x=1759739145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THDoZtndN7wbU9hHJngRTPNIkbHrG3NTpzeOoqxO0C8=;
        b=P11WoJB58P+gdfYt/WCbgbarV4f0qg85zfrsuud/kRYjckXTgf8JUDXaKmPxuW74uM
         YKb4JhzDVfbmuW4ilhbleBBmaTlWKj0DVv42OTb7cyvlJe5WiHllqeAw7SleKte5mofO
         zgMWfQ9pSSL9uRyHeQKfNzK7F09teaLbV+rCn0cJA3V7Db1fIcSrk/v3fEDtpddQB2LP
         yrpKqCsqj14V82YYyGVG83MVtuMHnucULplPhbQ+hWSaR5ZCJb3QOE5GbcvhE7vdsCSA
         F9t4M0+DZJiIB+yIgfJzX+pHQ4B8Gb25qdIwOoYUbc/q5+gGuqPbIcmUQkvxOc413eG/
         rFYQ==
X-Gm-Message-State: AOJu0YzxLUDQ/R3DYYEBUoWlCLBq1maI5hUI8US8SBeCE81awZEjXfG6
	6Fz3DNAz40Xy/nhWF3URF89nrQgdM+3yDCH2SMBAUMYO2R9lD+PEGK2yJtOZ2MclGpZVtiZAuPG
	WjiiTjGUKZxnq4UISt7eLwxYxyYQS/7FIcvlj+9MXKg==
X-Gm-Gg: ASbGnctArzFoUsmweT0Dsp19Ij5SHH48L3qPEurRadhTulSYVQ5jV8EHFwkY+UXhOVH
	3H7064zmSqivEO1YyTu+Yq/yn8k1jb4K1WEANa4MX+Z4K4lVL8fb0SCs4DNLxPoxpCX+9UNQ8kY
	hV/XLaF/TUw5ET6v9k8CC6vGiqiXQzGDXprzwnlL2wwKBab4RQIn/LwUzA9c0xUxO7tKlqrOSzP
	oEeRw9oxA==
X-Google-Smtp-Source: AGHT+IH25wfsKCIXi4tXlt2uQiutfQt2Rqr957zj2cHV6g3mXTxkbe2odyZHxwv8SmPlJHq2OOlypV1ZiHsvixMTWzk=
X-Received: by 2002:a5d:64c9:0:b0:3fb:9950:b9eb with SMTP id
 ffacd0b85a97d-40e481be762mr12946148f8f.28.1759134344767; Mon, 29 Sep 2025
 01:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250929-min-gcc-version-v1-1-c93d7f5a4f49@bootlin.com>
In-Reply-To: <20250929-min-gcc-version-v1-1-c93d7f5a4f49@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 29 Sep 2025 10:25:17 +0200
X-Gm-Features: AS18NWBl5TDpjATKIL1nMltdWkLDSCI--6BW9JjNO8mHlIaWCywJgYoMqH5DKfc
Message-ID: <CAMSfU+5b1Dd2fohNSgs1pT-9By8cPkv-HLpg3BoO0cveY_78Qg@mail.gmail.com>
Subject: Re: [PATCH] sanity: Update minimum gcc version to 10.1
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000bb82cc063fec6102"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224124

--000000000000bb82cc063fec6102
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 29 sept. 2025 =C3=A0 09:31, Antonin Godard <antonin.godard@bootlin.=
com>
a =C3=A9crit :

> Since commit 19004950ad56 ("sanity: Check if the C++ toolchain supports
> --std=3Dgnu++20") host GCC must support "--std=3Dgnu++20", which became
> available in 10.1. This is already reflected in the documentation [1]
> but not here.
>
> Update the sanity check on GCC and raise the minimum version to 10.1.
> Remove the dead link to www.softwarecollections.org.
>
> [1]:
> https://git.yoctoproject.org/yocto-docs/commit/?id=3D0e538c102bfcb7184c76=
c2401e8cb878168c4434
>
> Cc: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  meta/classes-global/sanity.bbclass | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes-global/sanity.bbclass
> b/meta/classes-global/sanity.bbclass
> index d875a022db..439dc5ad75 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -505,18 +505,15 @@ def check_userns():
>                   "See
> https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-note=
s/39890#unprivileged-user-namespace-restrictions
> for more information.")
>
>
> -# Require at least gcc version 8.0
> -#
> -# This can be fixed on CentOS-7 with devtoolset-6+
> -# https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
> +# Require at least gcc version 10.1
>  #
>  # A less invasive fix is with scripts/install-buildtools (or with user
>  # built buildtools-extended-tarball)
>  #
>  def check_gcc_version(sanity_data):
>      version =3D oe.utils.get_host_gcc_version(sanity_data)
> -    if bb.utils.vercmp_string_op(version, "8.0", "<"):
> -        return "Your version of gcc is older than 8.0 and will break
> builds. Please install a newer version of gcc (you could use the project'=
s
> buildtools-extended-tarball or use scripts/install-buildtools).\n"
> +    if bb.utils.vercmp_string_op(version, "10.1", "<"):
> +        return "Your version of gcc is older than 10.1 and will break
> builds. Please install a newer version of gcc (you could use the project'=
s
> buildtools-extended-tarball or use scripts/install-buildtools).\n"
>

While you are modifying this line could you make the version a single
variable instead of repeating it twice? (I know I would forget to update
the one in the message -_-')

I shall try to remember to change here next time I play with the minimum
gcc version.

Thanks!


>      return None
>
>  # Tar version 1.24 and onwards handle overwriting symlinks correctly
>
> ---
> base-commit: 07747aa7390e98bf2853154e5fd473e4984a1d3d
> change-id: 20250929-min-gcc-version-5b52e05000f7
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>
>

--=20
Yoann Congal
Smile ECS

--000000000000bb82cc063fec6102
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 29=
 sept. 2025 =C3=A0=C2=A009:31, Antonin Godard &lt;<a href=3D"mailto:antonin=
.godard@bootlin.com">antonin.godard@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since commit 19=
004950ad56 (&quot;sanity: Check if the C++ toolchain supports<br>
--std=3Dgnu++20&quot;) host GCC must support &quot;--std=3Dgnu++20&quot;, w=
hich became<br>
available in 10.1. This is already reflected in the documentation [1]<br>
but not here.<br>
<br>
Update the sanity check on GCC and raise the minimum version to 10.1.<br>
Remove the dead link to <a href=3D"http://www.softwarecollections.org" rel=
=3D"noreferrer" target=3D"_blank">www.softwarecollections.org</a>.<br>
<br>
[1]: <a href=3D"https://git.yoctoproject.org/yocto-docs/commit/?id=3D0e538c=
102bfcb7184c76c2401e8cb878168c4434" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.yoctoproject.org/yocto-docs/commit/?id=3D0e538c102bfcb7184c76c240=
1e8cb878168c4434</a><br>
<br>
Cc: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_bl=
ank">yoann.congal@smile.fr</a>&gt;<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/sanity.bbclass | 9 +++------<br>
=C2=A01 file changed, 3 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanit=
y.bbclass<br>
index d875a022db..439dc5ad75 100644<br>
--- a/meta/classes-global/sanity.bbclass<br>
+++ b/meta/classes-global/sanity.bbclass<br>
@@ -505,18 +505,15 @@ def check_userns():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;See <a=
 href=3D"https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-relea=
se-notes/39890#unprivileged-user-namespace-restrictions" rel=3D"noreferrer"=
 target=3D"_blank">https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-nu=
mbat-release-notes/39890#unprivileged-user-namespace-restrictions</a> for m=
ore information.&quot;)<br>
<br>
<br>
-# Require at least gcc version 8.0<br>
-#<br>
-# This can be fixed on CentOS-7 with devtoolset-6+<br>
-# <a href=3D"https://www.softwarecollections.org/en/scls/rhscl/devtoolset-=
6/" rel=3D"noreferrer" target=3D"_blank">https://www.softwarecollections.or=
g/en/scls/rhscl/devtoolset-6/</a><br>
+# Require at least gcc version 10.1<br>
=C2=A0#<br>
=C2=A0# A less invasive fix is with scripts/install-buildtools (or with use=
r<br>
=C2=A0# built buildtools-extended-tarball)<br>
=C2=A0#<br>
=C2=A0def check_gcc_version(sanity_data):<br>
=C2=A0 =C2=A0 =C2=A0version =3D oe.utils.get_host_gcc_version(sanity_data)<=
br>
-=C2=A0 =C2=A0 if bb.utils.vercmp_string_op(version, &quot;8.0&quot;, &quot=
;&lt;&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;Your version of gcc is older than=
 8.0 and will break builds. Please install a newer version of gcc (you coul=
d use the project&#39;s buildtools-extended-tarball or use scripts/install-=
buildtools).\n&quot;<br>
+=C2=A0 =C2=A0 if bb.utils.vercmp_string_op(version, &quot;10.1&quot;, &quo=
t;&lt;&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;Your version of gcc is older than=
 10.1 and will break builds. Please install a newer version of gcc (you cou=
ld use the project&#39;s buildtools-extended-tarball or use scripts/install=
-buildtools).\n&quot;<br></blockquote><div><br></div><div>While you are mod=
ifying this line could you make the version a single variable instead of re=
peating it twice? (I know I would forget to update the one in the message -=
_-&#39;)</div><div><br></div><div>I shall try to remember=C2=A0to change he=
re next time I play with the minimum gcc version.</div><div><br></div><div>=
Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
=C2=A0 =C2=A0 =C2=A0return None<br>
<br>
=C2=A0# Tar version 1.24 and onwards handle overwriting symlinks correctly<=
br>
<br>
---<br>
base-commit: 07747aa7390e98bf2853154e5fd473e4984a1d3d<br>
change-id: 20250929-min-gcc-version-5b52e05000f7<br>
<br>
Best regards,<br>
--=C2=A0 <br>
Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=3D"=
_blank">antonin.godard@bootlin.com</a>&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000bb82cc063fec6102--

