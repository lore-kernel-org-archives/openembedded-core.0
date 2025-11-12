Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB10CD4847
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 20:56:33 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8129.1762980991522101353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 12:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mamjDMA+;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: nmjain23@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ed614777a3so406161cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 12:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762980990; x=1763585790; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/KAGdV3fi9tdl57tu8k5zvpWNarAcolbXzW1Wjtd4A=;
        b=mamjDMA+cwlII9r1c9BiMdfCWzQftrMCkgRlNTzZuVrItR3Mwu0c3lx3lmAPjkdlrx
         nvV4SUWN2P/1bteSFHDkpna9roUq0kgDNxXNHg97QKMRrimry+/xVQg9a021XMyi4JUd
         CyYABFF469UZXyB9Jmn0lV9juKFkZuwpikxkrGtYiDrpQtGKDWXjfV6L1Ohylirki3JI
         Ao82H4up4YVHAawgY9lPTcJZkzA6hdKFCStuHb3Y54nQrCychyu5T3VH9I4Y350w1ZxN
         hXvkjQMlDHN5GduL8jrnpZ7KCyvZ8cgO9/r3qrDPcGI2wDjpgDZGwhjlElOUBmvkMAMT
         2UNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762980990; x=1763585790;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/KAGdV3fi9tdl57tu8k5zvpWNarAcolbXzW1Wjtd4A=;
        b=JJpVOzY1ZE3FOJU9UbiL+1R1l0tP3CITNrKW6+TQ1YUth7ETkAkkup1drvFRUP9eMy
         Y+2+FP7P4M1Q+e4HakRpdVf7Y2tnFUqdgSC18dCVzkaoUgl5PXn3yo3RWGoPMPv9uhWp
         OdjPIR7RrIo65vRZH/56LJFZBUQ5nvaPLmlmsHlWP2vFyFcjC1KTOCazFdM8GEEOULyT
         RVcUA+Yjnb3Nxm1SLysSaPxQ0zs4fsl0WkfSsFN0PcrvpLoYwF4yaY6cp/B6fufBYKCb
         EkCatgv2zbb2L9rhiEu3VdFxNAL/injD+HECjdr1EOs0ajZuHsLHe9+ETDLozTU4FFIH
         5pMg==
X-Gm-Message-State: AOJu0YxvZs8OydiPNzlYIMTwIgrVgblIpyY4/DAsiDxD5bkLwnbwVVlf
	YP0MPB0rJnxB/8EvBjHTuadgyTOBU1VvQAkXU6B5Ka1+4Hcpl6qf/AZMxno60q9LDkUdB6yCX6A
	9oA0rv7+nN9VEzxi+oxmTVKgKF9mp/CT7eg==
X-Gm-Gg: ASbGncuc/cTttH4R8QoXdsHqIfxnHl19f85VJJxLELCGk+LHDTB7qmzgPdsdrBl7ek4
	Q1IEmTANRRunCENRD8Pl3N43kdYYJ+6M2R8s2tJA2AcSFEvGUyITLsDHEpJmZiRcxXHkur87mzY
	fAiIawoySM08SMlNqpEEi+59qXdP/tob2OuEGB3PBvGLjiom//WVJwzEq4tuUMBJhZhfugLpSa9
	R7MiGT6sD20IcggJOQ9w7sCajsu3Rr2MuxqUR4bwsHzEYxGlmUVfUTxjgCq6A==
X-Google-Smtp-Source: AGHT+IHjOb9tZBsaG64QAvkmuhNdgZhwhEJm5en8/vvaq/UrP3xEj2hbUa4Q17h8taD/d5NVo1F24RUJz36P475kJcI=
X-Received: by 2002:ac8:5744:0:b0:4ed:42ba:9bbf with SMTP id
 d75a77b69052e-4eddbc427a7mr57259991cf.14.1762980990139; Wed, 12 Nov 2025
 12:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20251107040923.4127069-1-namanj1@kpit.com>
In-Reply-To: <20251107040923.4127069-1-namanj1@kpit.com>
From: Naman Jain <nmjain23@gmail.com>
Date: Thu, 13 Nov 2025 02:26:18 +0530
X-Gm-Features: AWmQ_bkC-oWQ8eXnvk5vmwEfDtivBzAheeh9ENY16ol-V-3b6AUpwUWlE7ZfypE
Message-ID: <CALCkg5ajxNo8LPWOXAsqQCSeGMa2duP+q-EHDaYW46RkhPpugA@mail.gmail.com>
Subject: Re: [meta][master][PATCH] socat: Update LICENSE field
To: openembedded-core@lists.openembedded.org, namanj1@kpit.com
Content-Type: multipart/alternative; boundary="000000000000a9c0bb06436bff5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 20:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226218

--000000000000a9c0bb06436bff5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Nov, 2025, 9:39=E2=80=AFam Naman Jain, <nmjain23@gmail.com> wrote=
:

> The below reference clearly states that GPL-2.0-with-OpenSSL-exception
> is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
> Therefore, update the correct license.
>
> Reference:
>
> https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14=
a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7
>
> Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---
>  meta/recipes-connectivity/socat/socat_1.8.0.3.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
> b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
> index ee6ca1fe44..964af9d124 100644
> --- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
> @@ -5,9 +5,10 @@ HOMEPAGE =3D "http://www.dest-unreach.org/socat/"
>
>  SECTION =3D "console/network"
>
> -LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> +LICENSE =3D "GPL-2.0-only & GPL-2.0-with-OpenSSL-exception"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> -
> file://README;beginline=3D248;endline=3D278;md5=3D338c05eadd013872abb1d6e=
198e10a3f"
> +
> file://README;beginline=3D248;endline=3D278;md5=3D338c05eadd013872abb1d6e=
198e10a3f
> \
> +
> file://COPYING.OpenSSL;md5=3D5c9bccc77f67a8328ef4ebaf468116f4"
>
>  SRC_URI =3D "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.=
bz2
> \
>             file://0001-fix-compile-procan.c-failed.patch \
> --
> 2.34.1
>
>

--000000000000a9c0bb06436bff5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 7 Nov, 2025, 9:39=E2=80=AFa=
m Naman Jain, &lt;<a href=3D"mailto:nmjain23@gmail.com">nmjain23@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The below reference =
clearly states that GPL-2.0-with-OpenSSL-exception<br>
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.<br>
Therefore, update the correct license.<br>
<br>
Reference:<br>
<a href=3D"https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e=
13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/aboutcode-=
org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/o=
penssl-exception-gpl-2.0.yml#L7</a><br>
<br>
Signed-off-by: Virendra Thakur &lt;<a href=3D"mailto:virendra.thakur@kpit.c=
om" target=3D"_blank" rel=3D"noreferrer">virendra.thakur@kpit.com</a>&gt;<b=
r>
Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=3D=
"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/socat/<a href=3D"http://socat_1.8.0.3.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">socat_1.8.0.3.bb</a> | 5 +++=
--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.8.0.=
3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">socat_1.8.0.3.bb</a> =
b/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.8.0.3.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">socat_1.8.0.3.bb</a><br>
index ee6ca1fe44..964af9d124 100644<br>
--- a/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.8.0.3.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">socat_1.8.0.3.bb</a><br>
+++ b/meta/recipes-connectivity/socat/<a href=3D"http://socat_1.8.0.3.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">socat_1.8.0.3.bb</a><br>
@@ -5,9 +5,10 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.dest-unreach.org/=
socat/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www.dest-unr=
each.org/socat/</a>&quot;<br>
<br>
=C2=A0SECTION =3D &quot;console/network&quot;<br>
<br>
-LICENSE =3D &quot;GPL-2.0-with-OpenSSL-exception&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only &amp; GPL-2.0-with-OpenSSL-exception&quot;<=
br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://README;beginline=3D248;endline=3D278;md5=3D338c05eadd013872abb1d6e198e10=
a3f&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://README;beginline=3D248;endline=3D278;md5=3D338c05eadd013872abb1d6e198e10=
a3f \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.OpenSSL;md5=3D5c9bccc77f67a8328ef4ebaf468116f4&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.dest-unreach.org/socat/downlo=
ad/socat-$%7BPV%7D.tar.bz2" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-compile-procan.c-=
failed.patch \<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000a9c0bb06436bff5c--

