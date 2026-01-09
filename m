Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AF7D16811
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 11:05:27 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7884.1767956718900509868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 03:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YOTmiOgF;
 spf=pass (domain: smile.fr, ip: 209.85.218.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b804646c718so609732566b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 03:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767956717; x=1768561517; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DiNHT/qiJN6jEKgoXQs4nh93TMtBNdTigqo/HEGPChQ=;
        b=YOTmiOgF76IKLr0ljNr/Lef6YU2XuoJYwFXouZ8Jdf+XUGBJgqXGcAhMdR4NN7Lu85
         ayuHdV2LChji88mEvj55thPepq6vtwygtcrlgwthUrgVf2mgxi0TfSUPHLzYZg4ZXrJL
         +3r8p89g2FCONqBcCbQ+m6US3/bpGj/QLnb6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956717; x=1768561517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiNHT/qiJN6jEKgoXQs4nh93TMtBNdTigqo/HEGPChQ=;
        b=DQefFKsiHeOFhWfJZESGUiC0CCaAZ4y7MwmTKcXxd4fbLjgZlxVt5dg6t717wFlk2o
         NGaEoNjF62aAvPMN1usdrVVSbZotyIicWZeDI+Gg4Cv1uXbhjMFqCPG7iYfXoJMf9I8V
         2XidEOyy/SbJLh9UTsTaoQ77VAo7Elcsh25u4sx1cfw/JcCoONiNr4c/qUVB4gGoiQ34
         ooSd6uGdufpSNsj3sQedcvGN21RRFicIeaJgoiFvrHUghckak489yDlTdE6IS27C1CPr
         Qd+zHlzPBcUVqzrKPw/+8RaE4LtqsMwbAkT0EyfaMA5bjAaWFiLH+foTkCxfNOPLcjkU
         YP4g==
X-Gm-Message-State: AOJu0YxCk9DNfQFo2MWZKHV2Gcyonztai4H9IVYPh5WIJke/RUnQ/pZO
	l5xo3KKT1OMZYfgpavB+2ekiXgDBWRGobu2VWP25xjX5SeZ2Lo8JaQFhauGJc1r2ufmePpW8uCm
	0z8690++i1B8aV3m4U2ffzAmIFIFdcJ/XHnuqaVxJWw==
X-Gm-Gg: AY/fxX5tHBSOwNq1H79CXDbMhkMP9LlLdhMRXdOI2hL9oqVNCj24wC2sy16rNKfkHuD
	WDkoEv1g6qjJ0tczC9uYsj9XilhXMCATTHs5U7lerwdA3+Tiz8F9rMBpw7rAZUZvOnp2brqeVZA
	LbyZh8avUzR7USpT27OF6lmZBEEIMsgBXAoJQqQOV3DfW1ST1BrOzfIfcFjgPIWpPpEMhKeL3Lv
	+7+oMm7T5wCLN9ZS/6U//bwPzQamdxkHTauw4l0knvWsJhx6H7ccXgVCMCNiU3Ft3M61YL8lqqg
	CtjAG75rDPcCfqNuDiKiPRIZinUeJb1QfGN+chzx
X-Google-Smtp-Source: AGHT+IE81g5qwyNkPCf17X1kFU1acrItlT6O+DQjAgulLGQDzOpR6cdVQTXloVcdv9ZAKCjiqteEikBxd9+nGyL/77k=
X-Received: by 2002:a17:906:7955:b0:b6d:5bc3:e158 with SMTP id
 a640c23a62f3a-b84451ad77fmr940688466b.17.1767956716974; Fri, 09 Jan 2026
 03:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20260109020507.2808-1-khai.dang@lge.com>
In-Reply-To: <20260109020507.2808-1-khai.dang@lge.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 9 Jan 2026 12:04:50 +0100
X-Gm-Features: AZwV_QioBMk1wZmzXJA90difuFWo-bxSbaVh9QNlhEF8jI59kIX7wcrbeQrS8hE
Message-ID: <CAMSfU+73RuWjHmnUUXY6d+W-dQpP+wsGZn+yZv7DcJCeG_2iqw@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] docbook-xml-dtd4: fix the fetching failure
To: khaidangbk1998@gmail.com
Cc: openembedded-core@lists.openembedded.org, Khai Dang <khai.dang@lge.com>
Content-Type: multipart/alternative; boundary="0000000000001803650647f2800e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 11:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229102

--0000000000001803650647f2800e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 9 janv. 2026 =C3=A0 06:42, Khai Dang via lists.openembedded.org
<khaidangbk1998=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Updating SRC_URI, the old archive url is deprecated.
>
> Signed-off-by: Khai Dang <khai.dang@lge.com>
>

Hello,

I'm sorry but the walnascar support has ended in november 2025.
(I need to make it more clear in https://wiki.yoctoproject.org/wiki/Release=
s
)

It looks like this patch is needed for the (supported) branches
scarthgap and whinlatter, can you send the backport request there please?

Thanks!


> ---
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb                | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> index 1148d53694..ea0861823d 100644
> --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> @@ -10,11 +10,11 @@ LIC_FILES_CHKSUM =3D
> "file://docbook-4.5/docbookx.dtd;beginline=3D15;endline=3D30;md5=3D
>
>  file://LICENSE-OASIS;md5=3Db9ee6208caa6e66c68dfad6f31d73f92"
>
>  # Install the latest 4.5 DTDs, and the previous releases for backward
> compatibility.
> -SRC_URI =3D "
> https://docbook.org/xml/4.1.2/docbkx412.zip;name=3Dpayload412;subdir=3Ddo=
cbook-4.1.2
> \
> -
> https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=3Dpayload42;subdir=
=3Ddocbook-4.2
> \
> -
> https://docbook.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayload43;subdir=
=3Ddocbook-4.3
> \
> -
> https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=3Dpayload44;subdir=
=3Ddocbook-4.4
> \
> -
> https://docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=3DpayloadPV;subd=
ir=3Ddocbook-${PV}
> \
> +SRC_URI =3D "
> https://archive.docbook.org/xml/4.1.2/docbkx412.zip;name=3Dpayload412;sub=
dir=3Ddocbook-4.1.2
> \
> +
> https://archive.docbook.org/xml/4.2/docbook-xml-4.2.zip;name=3Dpayload42;=
subdir=3Ddocbook-4.2
> \
> +
> https://archive.docbook.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayload43;=
subdir=3Ddocbook-4.3
> \
> +
> https://archive.docbook.org/xml/4.4/docbook-xml-4.4.zip;name=3Dpayload44;=
subdir=3Ddocbook-4.4
> \
> +
> https://archive.docbook.org/xml/${PV}/docbook-xml-${PV}.zip;name=3Dpayloa=
dPV;subdir=3Ddocbook-${PV}
> \
>             file://docbook-xml-update-catalog.xml.patch \
>             file://LICENSE-OASIS"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229093):
> https://lists.openembedded.org/g/openembedded-core/message/229093
> Mute This Topic: https://lists.openembedded.org/mt/117170940/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000001803650647f2800e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0ven. 9 janv. 2026 =C3=A0=C2=A006:=
42, Khai Dang via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;khaidangbk1998=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</div=
><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Updating SRC_URI, the old archive url is deprecate=
d.<br>
<br>
Signed-off-by: Khai Dang &lt;<a href=3D"mailto:khai.dang@lge.com" target=3D=
"_blank">khai.dang@lge.com</a>&gt;<br></blockquote><div><br></div><div>Hell=
o,</div><div><br></div><div>I&#39;m sorry but the walnascar support has end=
ed in november 2025.</div><div>(I need to make it more clear in=C2=A0<a hre=
f=3D"https://wiki.yoctoproject.org/wiki/Releases">https://wiki.yoctoproject=
.org/wiki/Releases</a>)</div><div><br></div><div>It looks like this patch i=
s needed for the (supported) branches scarthgap=C2=A0and whinlatter, can yo=
u send the backport request there please?</div><div><br></div><div>Thanks!<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0.../docbook-xml/<a href=3D"http://docbook-xml-dtd4_4.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xm=
l-dtd4_4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb=
</a> b/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xml-dtd4=
_4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a><b=
r>
index 1148d53694..ea0861823d 100644<br>
--- a/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xml-dtd4_=
4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a><br=
>
+++ b/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xml-dtd4_=
4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a><br=
>
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM =3D &quot;file://docbook-4.5/docbookx.=
dtd;beginline=3D15;endline=3D30;md5=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE-OASIS;md5=3Db9ee6208caa6e66c68dfad6f31d73f92&quot;<br>
<br>
=C2=A0# Install the latest 4.5 DTDs, and the previous releases for backward=
 compatibility.<br>
-SRC_URI =3D &quot;<a href=3D"https://docbook.org/xml/4.1.2/docbkx412.zip;n=
ame=3Dpayload412;subdir=3Ddocbook-4.1.2" rel=3D"noreferrer" target=3D"_blan=
k">https://docbook.org/xml/4.1.2/docbkx412.zip;name=3Dpayload412;subdir=3Dd=
ocbook-4.1.2</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docbook.org/xm=
l/4.2/docbook-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-4.2" rel=3D"nor=
eferrer" target=3D"_blank">https://docbook.org/xml/4.2/docbook-xml-4.2.zip;=
name=3Dpayload42;subdir=3Ddocbook-4.2</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docbook.org/xm=
l/4.3/docbook-xml-4.3.zip;name=3Dpayload43;subdir=3Ddocbook-4.3" rel=3D"nor=
eferrer" target=3D"_blank">https://docbook.org/xml/4.3/docbook-xml-4.3.zip;=
name=3Dpayload43;subdir=3Ddocbook-4.3</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docbook.org/xm=
l/4.4/docbook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-4.4" rel=3D"nor=
eferrer" target=3D"_blank">https://docbook.org/xml/4.4/docbook-xml-4.4.zip;=
name=3Dpayload44;subdir=3Ddocbook-4.4</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://docbook.org/xm=
l/$%7BPV%7D/docbook-xml-$%7BPV%7D.zip;name=3DpayloadPV;subdir=3Ddocbook-$%7=
BPV%7D" rel=3D"noreferrer" target=3D"_blank">https://docbook.org/xml/${PV}/=
docbook-xml-${PV}.zip;name=3DpayloadPV;subdir=3Ddocbook-${PV}</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://archive.docbook.org/xml/4.1.2/docbkx4=
12.zip;name=3Dpayload412;subdir=3Ddocbook-4.1.2" rel=3D"noreferrer" target=
=3D"_blank">https://archive.docbook.org/xml/4.1.2/docbkx412.zip;name=3Dpayl=
oad412;subdir=3Ddocbook-4.1.2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://archive.docboo=
k.org/xml/4.2/docbook-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-4.2" re=
l=3D"noreferrer" target=3D"_blank">https://archive.docbook.org/xml/4.2/docb=
ook-xml-4.2.zip;name=3Dpayload42;subdir=3Ddocbook-4.2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://archive.docboo=
k.org/xml/4.3/docbook-xml-4.3.zip;name=3Dpayload43;subdir=3Ddocbook-4.3" re=
l=3D"noreferrer" target=3D"_blank">https://archive.docbook.org/xml/4.3/docb=
ook-xml-4.3.zip;name=3Dpayload43;subdir=3Ddocbook-4.3</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://archive.docboo=
k.org/xml/4.4/docbook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-4.4" re=
l=3D"noreferrer" target=3D"_blank">https://archive.docbook.org/xml/4.4/docb=
ook-xml-4.4.zip;name=3Dpayload44;subdir=3Ddocbook-4.4</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://archive.docboo=
k.org/xml/$%7BPV%7D/docbook-xml-$%7BPV%7D.zip;name=3DpayloadPV;subdir=3Ddoc=
book-$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">https://archive.docboo=
k.org/xml/${PV}/docbook-xml-${PV}.zip;name=3DpayloadPV;subdir=3Ddocbook-${P=
V}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docbook-xml-update-catalog=
.xml.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://LICENSE-OASIS&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229093): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229093" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229093</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117170940/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117170940/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000001803650647f2800e--

