Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.34092.1611564194306346160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 00:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pDXOdVWP;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id w187so6759164vsw.5
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 00:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FQB3nT0HwrtUXlC338QOfuOgTIBSrc1PrEqh9w8WZKc=;
        b=pDXOdVWP8tBoJgvBgvMqD4/Epttd9Y8rnmaZWShffwj7l5jm7nTV/9cyEmLD1arsyF
         kEb4VV68w/3sNXfmH7Nl9vJGjXv/qTJjye2+WxeIPe/7t+EH0Lyp0sjpHpmdj/0tnyfA
         SgSm5Naz/BzTfCbKDluyJL86L5LAJA1+tQSYWlNz8px3JDS75vzR+icBuF9R54g2oHs9
         UHbJmeCMCjROa588vd6XXzbbpnPKN/hMnjwLCpJ+CjbUv1mquapXORihhrgowhQA/lh1
         DIVeiIWabrfHpROWoC1sV2ZZSEw3/ZUhqB0rIkAR6wLgCtJr32VqeO5nQfMlh5loaRKY
         P3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FQB3nT0HwrtUXlC338QOfuOgTIBSrc1PrEqh9w8WZKc=;
        b=jIHbpGq6yeQ0M25HoXaLUcQiYGTupL6g963fAhTMqyCaPCy6mNagG7ofrxEnT+FpS2
         gk7jkGa94ZEyj4Ca1ousD7wlF0KUNGknsLLHj4MNGG+WxpZ/r4XasjgLlVTApd05C5R0
         AHgl/3rlpQN5iCyJ2GsBcnqbALM94kblHyFAHvL+9JUQzehYBBE2Yt240Y5UP4AOPXTI
         2RVDP1aa3Wk3qS/cHcNknloV1Fvd6x2Kf74GEDeixPvGYfkuVzrSifent0qdTHDXYPYn
         QQXFmAszV1eUsWQAcLA3Jb0tnRC9WWlU8hTIAmlBZEG8fB8yMTIy4h8STrf8buT7bn4/
         LT+Q==
X-Gm-Message-State: AOAM531WIt2jO9LRexTL91Gp2gdA3wpnaPMhfaztxpUx1PZnQrdxzMRy
	n6yZ2psz8T5mBVRRRa4rgsYP4lkcawLwky+QFKA=
X-Google-Smtp-Source: ABdhPJzqk1MGDz46Eiiqf2SwORKKDF5Rb4A+d/Ef1PQPYHUWzyf3gp7ekrZHIbKGnVLuBRP2dzGytkK+EieV4N/ojds=
X-Received: by 2002:a67:ffda:: with SMTP id w26mr205885vsq.41.1611564193482;
 Mon, 25 Jan 2021 00:43:13 -0800 (PST)
MIME-Version: 1.0
References: <1611541232-1991-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1611541232-1991-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 25 Jan 2021 09:43:02 +0100
Message-ID: <CANNYZj_tZuJU_UtFRTT92AVnhSthwpuVwibnY0ne=Pe26qgA9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-docutils: Fix bug of program rst2man cannot be found.
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000049094705b9b5873c"

--00000000000049094705b9b5873c
Content-Type: text/plain; charset="UTF-8"

Wait, you need to provide a better explanation. Where does this issue
happen? And why isn't it fixed upstream?

Alex

On Mon, 25 Jan 2021 at 03:20, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../python/python3-docutils_0.16.bb               | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-docutils_0.16.bb
> b/meta/recipes-devtools/python/python3-docutils_0.16.bb
> index 50547a1b0c..3b2df223ed 100644
> --- a/meta/recipes-devtools/python/python3-docutils_0.16.bb
> +++ b/meta/recipes-devtools/python/python3-docutils_0.16.bb
> @@ -14,4 +14,19 @@ S = "${WORKDIR}/docutils-${PV}"
>
>  inherit distutils3
>
> +do_install_append_class-native() {
> +    mv ${D}${bindir}/rst2html.py ${D}${bindir}/rst2html
> +    mv ${D}${bindir}/rst2html4.py ${D}${bindir}/rst2html4
> +    mv ${D}${bindir}/rst2html5.py ${D}${bindir}/rst2html5
> +    mv ${D}${bindir}/rst2latex.py ${D}${bindir}/rst2latex
> +    mv ${D}${bindir}/rst2man.py ${D}${bindir}/rst2man
> +    mv ${D}${bindir}/rst2odt.py ${D}${bindir}/rst2odt
> +    mv ${D}${bindir}/rst2odt_prepstyles.py
> ${D}${bindir}/rst2odt_prepstyles
> +    mv ${D}${bindir}/rst2pseudoxml.py ${D}${bindir}/rst2pseudoxml
> +    mv ${D}${bindir}/rst2s5.py ${D}${bindir}/rst2s5
> +    mv ${D}${bindir}/rst2xetex.py ${D}${bindir}/rst2xetex
> +    mv ${D}${bindir}/rst2xml.py ${D}${bindir}/rst2xml
> +    mv ${D}${bindir}/rstpep2html.py ${D}${bindir}/rstpep2html
> +}
> +
>  BBCLASSEXTEND = "native"
> --
> 2.25.1
>
>
>
>
> 
>
>

--00000000000049094705b9b5873c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wait, you need to provide a better explanation. Where=
 does this issue happen? And why isn&#39;t it fixed upstream?<br></div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=
=3D"ltr" class=3D"gmail_attr">On Mon, 25 Jan 2021 at 03:20, Wang Mingyu &l=
t;<a href=3D"mailto:wangmy@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-=
by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" target=3D"_bla=
nk">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-docutils_0.16.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-docutils_0.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-docuti=
ls_0.16.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.16.bb</=
a> b/meta/recipes-devtools/python/<a href=3D"http://python3-docutils_0.16.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.16.bb</a><br>
index 50547a1b0c..3b2df223ed 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-docutils_0.16=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.16.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-docutils_0.16=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-docutils_0.16.bb</a><br>
@@ -14,4 +14,19 @@ S =3D &quot;${WORKDIR}/docutils-${PV}&quot;<br>
<br>
=C2=A0inherit distutils3<br>
<br>
+do_install_append_class-native() {<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2html.py ${D}${bindir}/rst2html<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2html4.py ${D}${bindir}/rst2html4<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2html5.py ${D}${bindir}/rst2html5<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2latex.py ${D}${bindir}/rst2latex<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2man.py ${D}${bindir}/rst2man<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2odt.py ${D}${bindir}/rst2odt<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2odt_prepstyles.py ${D}${bindir}/rst2od=
t_prepstyles<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2pseudoxml.py ${D}${bindir}/rst2pseudox=
ml<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2s5.py ${D}${bindir}/rst2s5<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2xetex.py ${D}${bindir}/rst2xetex<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rst2xml.py ${D}${bindir}/rst2xml<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/rstpep2html.py ${D}${bindir}/rstpep2html<b=
r>
+}<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000049094705b9b5873c--
