Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47DBD79763
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 08:25:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5384.1769847928019012840
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 00:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P3fmFkUl;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so2576389f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 00:25:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769847926; cv=none;
        d=google.com; s=arc-20240605;
        b=JjHrB/IUyyw3H4XeLL3KAvfksEMecQ5JupRPhJ71QArHXlCTV+Qyyn8HoDGNJ4PRM0
         HgercZiIK4ewXpieeGUA140I/jVhCHjSCQWiEx0HJfxgzMKJQUP5+EQCrTvqHGtL6qp8
         9TFmaW+InIjLvRGiyJKcucLZS9fprR5cfvzBgm0EZPENg8KM6xaXevHc7ZyRdYmwyUCD
         8/GHGR/y9FC77NaSpnJhGWBAxE47FQNsJwLzyg9zi3QF6JgBLBLAb9AkXOozs8dyN9jp
         SEiBwV9fPIr4guCo4XozuKefe3IV7kTmy7xyEKLv+bhrTcePy+3bOI5NFbjaLKi0Qu52
         4GwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MEqT6y5YT8c0Zq6MAyh7Umrt8ehyspTQH5Y3B+juMCk=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=i3S+TePkjpAKieBUaPGsTkmsLKKNrPrMGc+qyx2HgR+xNMzvqRdb8fFdLYdk5dm/k9
         hMigiO9Te3enUS/WVfs95sj2vJS5Rx3Fy5X4A3CLP0hZb+Gn4WBlW9hJ8+5aM7sJGprt
         DhV1JGMbuFwg5B+M6XCRC1kEC6YXDnG9KcxRKd0rmtruLasB80SpZsHKK8S1KHAnsSwy
         7nZtsYUPJLJq5hCPKsjnXms8XtYZjNaAzQCeQurX/QwO7oaqvFvj4pbj0f+GkA9zxsNO
         9/Kg4A4E3VVC6F/RTiyzXO/WTIWPcIDn9iKmfdMi+mhzqv5k3aDNDIMD0/lt3xP/53GF
         yRVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769847926; x=1770452726; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MEqT6y5YT8c0Zq6MAyh7Umrt8ehyspTQH5Y3B+juMCk=;
        b=P3fmFkUlNe20SmUpHqxZWye7XMcj+ssG+D45udHEHEblKQTe9DtWK7BByKmTQTKvaS
         0UAdPCoLu5VmUpLENbtZfxjNh84Qg4m8vDZjbQati6MDOGymdjpSul2w3l9G/jF79ytl
         G1p2HSyX0Tk3wcHjnO84cOF7hv+6kSbPCG0n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847926; x=1770452726;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEqT6y5YT8c0Zq6MAyh7Umrt8ehyspTQH5Y3B+juMCk=;
        b=i0G+NEpetalvTsnP0aBhjypL6UX/6yyMZ/IoOw7FieiLNuK2xhXXRpBPdmCD/EkesH
         +O4REPD01DcKhiEOH1AE4DbR8rBSd1sskMPNOECYmfEICC+o6fR8QOCdATmpy4Lp3eQN
         fUH9YPSOUDwji0I5XbW1GObD04DjKffUz4Xk5K4XX5s1JXSpiHR0IffePX86PORsn093
         n/CnbhaKbSuojKBxq6xO2ysM9UYGOtVsuPCRKS8OvXUaM5v37cKcHMsL9OZjHjp6eJCQ
         DlGQRjNnqdyE0p4jJZ6QkhA+Gkd7DN3sIJ3QCghQJg1xb1gMWWeiB7ed3VAcYZ/l4LGn
         G+gQ==
X-Gm-Message-State: AOJu0YyR4+224Dfhyk6vs/jSUu8yAO5h/rxcTfrHf2PvTNbk9g9v78Ox
	n+ls3i7H38NZccXVw82muUoICsrtEML+AI7MqG8qrdFapXpo6ele0OXDxfeUWHvgaNd2JMomY6J
	hbwieFwXHfGYKABS7G6n13KU5J2y0aBGF26eYiZOOjNn4zXPelujROug=
X-Gm-Gg: AZuq6aKC/dAlqWBBfBv3plzfDhYr8yDpmK641/ZMz3ZtL7uZnNRnwyt2dGYNZej4Q5S
	P8XnLj1bwFofzhersPJlyOML4dN/3cXkmGp7gzOov9UPUkrLkxj636pjjysaeUjcg6wo2qirA8U
	CXqTL/Dgf3nMCKk5ApN5k+1Qomj2RnQA8HdvzY23uPVhVpqFIQ+MnJXVY/E6u8VyRQt4oJ1CzdQ
	s9f06oiYzx8ZLraQuDd+xbl1PlTX06Simh51jX5pgAX8tsifsn2llZSRz3PMWShmtUM8gbt95VZ
	0EdXYb3H4xiWkH+/vCeeWab3oPHUOw==
X-Received: by 2002:a05:6000:25c1:b0:435:a4a9:6f79 with SMTP id
 ffacd0b85a97d-435f3a6aa94mr7401521f8f.8.1769847925931; Sat, 31 Jan 2026
 00:25:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769845858.git.yoann.congal@smile.fr> <f05ec33d17952009ad6ac272d3aa2183074f1312.1769845858.git.yoann.congal@smile.fr>
In-Reply-To: <f05ec33d17952009ad6ac272d3aa2183074f1312.1769845858.git.yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 31 Jan 2026 09:25:00 +0100
X-Gm-Features: AZwV_QhaJldS-zY5A3JdJXwWJtuE5zEZFkVVlrP_ukqdJrnsKi1umR9a30ZwWHY
Message-ID: <CAMSfU+7Tbo6RYz4Yjo_S-aXHBVTfLwxBcvG5W5V8mBe0O1wiKw@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 17/22] libpng: upgrade 1.6.53 -> 1.6.54
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ee91050649aad473"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 08:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230232

--000000000000ee91050649aad473
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 31 janv. 2026 =C3=A0 08:57, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> From: Peter Marko <peter.marko@siemens.com>
>
> Handles CVE-2026-22695 and CVE-2026-22801.
>
> License-Update: copyright years refreshed
>
> Changelog:
> Version 1.6.54 [January 12, 2026]
>   Fixed CVE-2026-22695 (medium severity):
>     Heap buffer over-read in `png_image_read_direct_scaled.
>     (Reported and fixed by Petr Simecek.)
>   Fixed CVE-2026-22801 (medium severity):
>     Integer truncation causing heap buffer over-read in
> `png_image_write_*`.
>   Implemented various improvements in oss-fuzz.
>     (Contributed by Philippe Antoine.)
>

Hello,

I'm on the fence with this one :
The changelog line "Implemented various improvements in oss-fuzz" sounds
incompatible with the stable policy but it changes code in the contrib/
directory that we don't use/compile.

> Files in this directory are used by the oss-fuzz project
> (https://github.com/google/oss-fuzz/tree/master/projects/libpng).
> for "fuzzing" libpng.
>

We already upgraded libpng for whinlatter with a similar change "Added
allocation failure fuzzing to oss-fuzz." in the -> 1.6.52 upgrade.

I'm leaning towards taking it (hence why it is included in testing and in
this series) but I wonder what you think.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 9c18cb1d4dd0edf2e9c638c3c576cb803e1ff4c6)
> [YC: Added changelog]
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../libpng/{libpng_1.6.53.bb =3D> libpng_1.6.54.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb =3D>
> libpng_1.6.54.bb} (94%)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
> b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
> similarity index 94%
> rename from meta/recipes-multimedia/libpng/libpng_1.6.53.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.6.54.bb
> index 956cd243b19..3f2b80a060f 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
> @@ -5,7 +5,7 @@ library for use in applications that read, create, and
> manipulate PNG \
>  HOMEPAGE =3D "http://www.libpng.org/"
>  SECTION =3D "libs"
>  LICENSE =3D "Libpng"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5516d77a3cf75f55a0d37254e3e65=
a20"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9dc350edbbbee660c7d9af7948716=
8f2"
>  DEPENDS =3D "zlib"
>
>  LIBV =3D "16"
> @@ -14,7 +14,7 @@ SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
>             file://run-ptest \
>  "
>
> -SRC_URI[sha256sum] =3D
> "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4"
> +SRC_URI[sha256sum] =3D
> "01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805"
>
>  MIRRORS +=3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/
> ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
>
>

--=20
Yoann Congal
Smile ECS

--000000000000ee91050649aad473
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 31=
 janv. 2026 =C3=A0=C2=A008:57, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a hr=
ef=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens=
.com</a>&gt;<br>
<br>
Handles CVE-2026-22695 and CVE-2026-22801.<br>
<br>
License-Update: copyright years refreshed<br>
<br>
Changelog:<br>
Version 1.6.54 [January 12, 2026]<br>
=C2=A0 Fixed CVE-2026-22695 (medium severity):<br>
=C2=A0 =C2=A0 Heap buffer over-read in `png_image_read_direct_scaled.<br>
=C2=A0 =C2=A0 (Reported and fixed by Petr Simecek.)<br>
=C2=A0 Fixed CVE-2026-22801 (medium severity):<br>
=C2=A0 =C2=A0 Integer truncation causing heap buffer over-read in `png_imag=
e_write_*`.<br>
=C2=A0 Implemented various improvements in oss-fuzz.<br>
=C2=A0 =C2=A0 (Contributed by Philippe Antoine.)<br></blockquote><div><br><=
/div><div>Hello,</div><div><br></div><div>I&#39;m on the fence with this on=
e :</div><div>The changelog line &quot;Implemented various improvements in =
oss-fuzz&quot; sounds incompatible with the stable policy but it changes co=
de in the contrib/ directory that we don&#39;t use/compile.</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Files in this directory are used by=
 the oss-fuzz project<br>(<a href=3D"https://github.com/google/oss-fuzz/tre=
e/master/projects/libpng">https://github.com/google/oss-fuzz/tree/master/pr=
ojects/libpng</a>).<br>for &quot;fuzzing&quot; libpng.<br></blockquote><div=
>=C2=A0</div><div>We already upgraded libpng for whinlatter with a similar =
change &quot;Added allocation failure fuzzing to oss-fuzz.&quot; in the -&g=
t; 1.6.52 upgrade.</div><div><br></div><div>I&#39;m leaning towards taking =
it (hence why it is included in testing and in this series) but I wonder wh=
at you think.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit 9c18cb1d4dd0edf2e9c638c3c576cb803e1ff4c6)<br>
[YC: Added changelog]<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0.../libpng/{<a href=3D"http://libpng_1.6.53.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libpng_1.6.53.bb</a> =3D&gt; <a href=3D"http://libpng_1.6.5=
4.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.54.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/libpng/{<a href=3D"http://libpng_1.6.5=
3.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.53.bb</a> =3D&gt; <a =
href=3D"http://libpng_1.6.54.bb" rel=3D"noreferrer" target=3D"_blank">libpn=
g_1.6.54.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.53=
.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.53.bb</a> b/meta/recip=
es-multimedia/libpng/<a href=3D"http://libpng_1.6.54.bb" rel=3D"noreferrer"=
 target=3D"_blank">libpng_1.6.54.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.53.=
bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.53.bb</a><br>
rename to meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.54.bb=
" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.54.bb</a><br>
index 956cd243b19..3f2b80a060f 100644<br>
--- a/meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.53.bb" re=
l=3D"noreferrer" target=3D"_blank">libpng_1.6.53.bb</a><br>
+++ b/meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.54.bb" re=
l=3D"noreferrer" target=3D"_blank">libpng_1.6.54.bb</a><br>
@@ -5,7 +5,7 @@ library for use in applications that read, create, and mani=
pulate PNG \<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.libpng.org/" rel=3D"noreferr=
er" target=3D"_blank">http://www.libpng.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;Libpng&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5516d77a3cf75f55a0d37254e3=
e65a20&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9dc350edbbbee660c7d9af7948=
7168f2&quot;<br>
=C2=A0DEPENDS =3D &quot;zlib&quot;<br>
<br>
=C2=A0LIBV =3D &quot;16&quot;<br>
@@ -14,7 +14,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LI=
BV}/${BP}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568=
d7850165068778d98d4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f51=
68ccdaa85d53b887805&quot;<br>
<br>
=C2=A0MIRRORS +=3D &quot;${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}=
/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/&quot;<=
br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000ee91050649aad473--

