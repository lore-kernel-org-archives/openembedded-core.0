Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1FCC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 23:54:56 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.11205.1709769286747796442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 15:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SKDnjY35;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso353050276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709769286; x=1710374086; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sMVXT2OJQQO7B+/9Fu34JDrkHeWAlbzW2BoRIt6nGoU=;
        b=SKDnjY35FiV63WTC/69darl29pCGKyRwXLO5llG+K4Xc3GtEMw4XSGF7EgTiXkHZNg
         rSNn8U+uSB/wCsi+vXyvGJusCC6HOenzQArQ2w7mrc1M85UEktpb+92s4tzvFuGL+rpe
         Roy22Kw+HU3558vgwgd+jc7bXJ0anvMV5mt3VxLBBAqxiXb91F2whaBWJUFBnayUzAsF
         xppO48Y/dLS5glXISA/bbm6EIJm5gVuQS3ZRi7O2x9mlJDFT6Av8ULvBiS2VT4l6bXW1
         08mfLIwJNoYJs/B1xniIwFS6NQYIO/Qu/JDF0q+WEkjBFay3lTeUJWlXqqAEdxTm6YZi
         AJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709769286; x=1710374086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMVXT2OJQQO7B+/9Fu34JDrkHeWAlbzW2BoRIt6nGoU=;
        b=pLbNvjJmMigKEKThq6LM/MnDb1rjK7Fxw0iXwTaJq404xvSE1kTp8LEutjEXH4AZqj
         nxGn4LlsrQYSChWYpLI7TuWI7SEhTav63x5KER8kF7GZu09iTOOe2cUkM2phyTAY4aXq
         mvvTtP8aBsmmO7Ql1q43KKJ4MJ3PNjtutmdHNQB8woyhzIANOTZshBDcstwBGAGSutRM
         SWsuxSx5OJoZllKPmWyII9303QsFPJTAEXmj/0UA+4E17DqtLXbj9veUGKZsGPmnyyow
         THIfpmYA2rupEAWLWPSkSzmJfwe7X4txORWXDZXK1C4J9QZcXRhW9BRWjDQPERE9C8Cn
         Neqg==
X-Forwarded-Encrypted: i=1; AJvYcCXPD4RdmX5/pK2GNy9mbCYvYgMyn/T4UIk/75fYG2pXMECzgbdAA63ZF5vIi34lE1fRMVEFgZuN+YwCjzQewsIvGczJh4NkLhOyUjyCOSyzBhtIofXnByIM
X-Gm-Message-State: AOJu0Yyi4Yal27xO/GluuD+Gku+JeM6K/36S+Ezoy4CVIFk75zaA38bi
	6ZYhngURoJWCZnEqGe/JGweGOYgzxx2b8vsPy5wrnPUhh3pV81rdPV8ideQ3bANQbXLNv7vSFAP
	QIneb9Qb+Ll7y7XhW2jv1H5r2Kww=
X-Google-Smtp-Source: AGHT+IGs8EAKZJH6+WB+RDBxIAX9PuIgv9ONLQUPLRnCUjDgs7cEXRAF0RrsXGkqbwYWaORCosTZLBEi4cokhx7DPvY=
X-Received: by 2002:a25:6a8a:0:b0:dc7:494e:ff33 with SMTP id
 f132-20020a256a8a000000b00dc7494eff33mr1197003ybc.7.1709769285757; Wed, 06
 Mar 2024 15:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20240306154151.3741709-1-alex@linutronix.de> <20240306154151.3741709-38-alex@linutronix.de>
In-Reply-To: <20240306154151.3741709-38-alex@linutronix.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 6 Mar 2024 15:54:34 -0800
Message-ID: <CANx9H-ALONEaNrYs6fnQCmB5e+Jktugp+urZWwNxOKjUhTYYUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 38/47] python3-wcwidth: upgrade 0.2.12 -> 0.2.13
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ecf554061306aed4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 23:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196758

--000000000000ecf554061306aed4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 7:42=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...{python3-wcwidth_0.2.12.bb =3D> python3-wcwidth_0.2.13.bb} | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-wcwidth_0.2.12.bb =3D>
> python3-wcwidth_0.2.13.bb} (72%)
>
> diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
> b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
> similarity index 72%
> rename from meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
> rename to meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
> index 6ce5e70c2a6..4a9bf753233 100644
> --- a/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb
> +++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/jquast/wcwidth"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db15979c39a2543892fca8cd86b4b5=
2cb"
>
> -SRC_URI[sha256sum] =3D
> "f01c104efdf57971bcb756f054dd58ddec5204dd15fa31d6503ea57947d97c02"
> +SRC_URI[sha256sum] =3D
> "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
>
>  inherit pypi setuptools3 ptest
>
> @@ -18,8 +18,10 @@ RDEPENDS:${PN}-ptest +=3D " \
>  "
>
>  do_install_ptest() {
> -      install -d ${D}${PTEST_PATH}/tests
> +      install -d ${D}${PTEST_PATH}/tests
>        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +      install -d ${D}${PTEST_PATH}/bin
> +      cp -rf ${S}/bin/* ${D}${PTEST_PATH}/bin/
>  }
>

thank you. I had figured out that this was needed but you beat me to it.

Reviewed-by: Tim Orling <tim.orling@konsulko.com>

>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196721):
> https://lists.openembedded.org/g/openembedded-core/message/196721
> Mute This Topic: https://lists.openembedded.org/mt/104767983/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ecf554061306aed4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 6, 2024 at 7:42=E2=80=AFAM Alexander Kanavin &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)">Signed-off-by: Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&g=
t;<br>
---<br>
=C2=A0...{<a href=3D"http://python3-wcwidth_0.2.12.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-wcwidth_0.2.12.bb</a> =3D&gt; <a href=3D"http://py=
thon3-wcwidth_0.2.13.bb" rel=3D"noreferrer" target=3D"_blank">python3-wcwid=
th_0.2.13.bb</a>} | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-wcwidt=
h_0.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-wcwidth_0.2.12.bb=
</a> =3D&gt; <a href=3D"http://python3-wcwidth_0.2.13.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-wcwidth_0.2.13.bb</a>} (72%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-wcwidth=
_0.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-wcwidth_0.2.12.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-wcwidth_0.2.13=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-wcwidth_0.2.13.bb</a><br>
similarity index 72%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-wcwidth_=
0.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-wcwidth_0.2.12.bb</=
a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-wcwidth_0.=
2.13.bb" rel=3D"noreferrer" target=3D"_blank">python3-wcwidth_0.2.13.bb</a>=
<br>
index 6ce5e70c2a6..4a9bf753233 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-wcwidth_0.2.12=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-wcwidth_0.2.12.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-wcwidth_0.2.13=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-wcwidth_0.2.13.bb</a><br>
@@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/jquast/wcw=
idth" rel=3D"noreferrer" target=3D"_blank">https://github.com/jquast/wcwidt=
h</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db15979c39a2543892fca8=
cd86b4b52cb&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;f01c104efdf57971bcb756f054dd58ddec5204dd15fa3=
1d6503ea57947d97c02&quot;<br>
+SRC_URI[sha256sum] =3D &quot;72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63=
e9b4e64fc18303972b5&quot;<br>
<br>
=C2=A0inherit pypi setuptools3 ptest<br>
<br>
@@ -18,8 +18,10 @@ RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0do_install_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
+=C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/bin<br>
+=C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/bin/* ${D}${PTEST_PATH}/bin/<br>
=C2=A0}<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">thank you. I had=
 figured out that this was needed but you beat me to it.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Reviewed-by: Tim Orling &lt;<a href=3D"mai=
lto:tim.orling@konsulko.com">tim.orling@konsulko.com</a>&gt;</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)"><br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196721): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196721" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196721</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104767983/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104767983/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ecf554061306aed4--

