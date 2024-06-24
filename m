Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D7FC2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 07:28:09 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.135124.1719214082979527669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 00:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VoLNNHDM;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-48f531f925dso477207137.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719214082; x=1719818882; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lwpeYRxz31CgwQ7KVlZUEFxLCh7rY9i1s0q6YJ1IEw=;
        b=VoLNNHDMjoff9VMhpf2pc/NUVIkOmiH2Kc3JY18mA8TvNidJRquz/lvQsP8ddzYD7r
         AaUN3KA49Ijly2/HxAcsg8CH734oMSTLisPBctt73uxa34LQbmO3R3YhB7Qw7Ik0FJM3
         OuxJMzXlVxhK7F8RDzNl2dNMoyzmeH2RsvKtdrqEAVoL17T5CHBRsfPBRER5jLNtKwoQ
         i9jKVhP36XavWOYarLqE9mMOO7NWo0+pQ6rkpuwJWdW3FmSa5HmxZw1nzw0+zkc8AQ8a
         TBE2Jd75iwAsX3rfGkqK5TJRMfOhrBsoEWFbAiRgOySdnaQEz2I4/OJ3O1WLGULzhrzq
         CkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719214082; x=1719818882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lwpeYRxz31CgwQ7KVlZUEFxLCh7rY9i1s0q6YJ1IEw=;
        b=N8eLHN/2BK/PFBtRMBKg2mtyLvbgYDY+vH/Rn5PtkgI1pyeFIMyOqyTgtelb0iZuK3
         j8zifZHr9jZYYpqmw5ETYLRIHwkp59B8Ty17xsli9gv38FkNED8A/65xzHsdqEpn0Vnn
         fJxYpuUom9kMuWPnDOKv3mvWrP9DIeGbNzwGNpYyjrhylomQvAF6GGAOT96+ano/LDrG
         Ht2y8QgCUn35SYJvqtjhI78Mdq5PlFcG+7Fh3IrWYeRw6RGOmv1QzvTPfZFUUoQ6RBRp
         m2m32NYDqgQRKZ0EN9FzRE6Ezy4XCk2NJUKuf2At+9KfwjR+Dp/KRWDSELUcwUkR2mKW
         BnQA==
X-Gm-Message-State: AOJu0YwXiWavzj5cKvHERfsYDQE/8K2InYK6SsiAdgUqytZcME0ESo4N
	/DTZGBqA6iE3CNx048i6rBHP7fA58dhk/l+hXxBjinBCyj0tLCYA42rhzy66GJdLjgY9AiCzGW1
	Y4pds/mm3zI3fkCOvooRwTZ2UBn8=
X-Google-Smtp-Source: AGHT+IHF0SLF5TKQD1gW+Cz/sXRjiOCRyI8MOyXEwOIB4ja/yNJnANM53pmCka8EDDgfEBW2gx7NPPA0s+LSfjGNOyE=
X-Received: by 2002:a05:6102:828:b0:48d:993b:c03e with SMTP id
 ada2fe7eead31-48f4c063e4fmr3914113137.6.1719214081843; Mon, 24 Jun 2024
 00:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240619103406.276716-1-jose.quaresma@foundries.io>
 <20240619103406.276716-3-jose.quaresma@foundries.io> <202406211951348908bcd0@mail.local>
In-Reply-To: <202406211951348908bcd0@mail.local>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 24 Jun 2024 08:27:45 +0100
Message-ID: <CANPvuRnUiBHZJY=j1gEzzQK8C6+F9CJkGY6Ho=Bc-zPamrNDOQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 3/3] go: move to a single binary bootstrap option
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000a43b86061b9db84d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 07:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201066

--000000000000a43b86061b9db84d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexandre Belloni <alexandre.belloni@bootlin.com> escreveu (sexta,
21/06/2024 =C3=A0(s) 20:51):

> Hello,
>
> This caused:
> AssertionError:
> Unable to find recipes for the following entries in maintainers.inc:
> go-binary-native
>

I noticed that you have fixed what was missing in maintainers.inc.
Thanks

Jose


>
> On 19/06/2024 11:34:06+0100, Jose Quaresma wrote:
> > With the drop of the old 1.4 bootstrap C version we can
> > move the go-binary-native to go-binary and drop the PREFERRED_PROVIDER
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc                   | 4 ----
> >  .../go/{go-binary-native_1.22.4.bb =3D> go-native_1.22.4.bb}    | 2 --
> >  2 files changed, 6 deletions(-)
> >  rename meta/recipes-devtools/go/{go-binary-native_1.22.4.bb =3D>
> go-native_1.22.4.bb} (98%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> > index 4fb6e47b7f..a9724d7621 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -62,10 +62,6 @@ PREFERRED_VERSION_qemu ?=3D "${QEMUVERSION}"
> >  PREFERRED_VERSION_qemu-native ?=3D "${QEMUVERSION}"
> >  PREFERRED_VERSION_nativesdk-qemu ?=3D "${QEMUVERSION}"
> >
> > -# Bootstrap Go using a binary release from golang.org.  If you want to
> bootstrap
> > -# from source using the C-implemented Go 1.4 (only supports x86-64
> hosts) then use
> > -# go-native.
> > -PREFERRED_PROVIDER_go-native ?=3D "go-binary-native"
> >  PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?=3D "${GOVERSION}"
> >  PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?=3D "${GOVERSION}"
> >  PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?=3D "${GOVERSION}"
> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb
> b/meta/recipes-devtools/go/go-native_1.22.4.bb
> > similarity index 98%
> > rename from meta/recipes-devtools/go/go-binary-native_1.22.4.bb
> > rename to meta/recipes-devtools/go/go-native_1.22.4.bb
> > index 61da51be3a..ee094435a7 100644
> > --- a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb
> > +++ b/meta/recipes-devtools/go/go-native_1.22.4.bb
> > @@ -5,8 +5,6 @@ HOMEPAGE =3D " http://golang.org/"
> >  LICENSE =3D "BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd=
74707"
> >
> > -PROVIDES =3D "go-native"
> > -
> >  # Checksums available at https://go.dev/dl/
> >  SRC_URI =3D "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;nam=
e=3Dgo_${BUILD_GOTUPLE}
> "
> >  SRC_URI[go_linux_amd64.sha256sum] =3D
> "ba79d4526102575196273416239cca418a651e049c2b099f3159db85e7bade7d"
> > --
> > 2.45.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#200907):
> https://lists.openembedded.org/g/openembedded-core/message/200907
> > Mute This Topic: https://lists.openembedded.org/mt/106757823/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a43b86061b9db84d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexandre Belloni &lt;<a href=3D"mail=
to:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; esc=
reveu (sexta, 21/06/2024 =C3=A0(s) 20:51):<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hello,<br>
<br>
This caused:<br>
AssertionError: <br>
Unable to find recipes for the following entries in maintainers.inc:<br>
go-binary-native<br></blockquote><div><br></div><div>I noticed that you hav=
e fixed what was missing in maintainers.inc.</div><div>Thanks<br></div><div=
><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
On 19/06/2024 11:34:06+0100, Jose Quaresma wrote:<br>
&gt; With the drop of the old 1.4 bootstrap C version we can<br>
&gt; move the go-binary-native to go-binary and drop the PREFERRED_PROVIDER=
<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ----<br>
&gt;=C2=A0 .../go/{<a href=3D"http://go-binary-native_1.22.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">go-binary-native_1.22.4.bb</a> =3D&gt; <a href=
=3D"http://go-native_1.22.4.bb" rel=3D"noreferrer" target=3D"_blank">go-nat=
ive_1.22.4.bb</a>}=C2=A0 =C2=A0 | 2 --<br>
&gt;=C2=A0 2 files changed, 6 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-nat=
ive_1.22.4.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.4=
.bb</a> =3D&gt; <a href=3D"http://go-native_1.22.4.bb" rel=3D"noreferrer" t=
arget=3D"_blank">go-native_1.22.4.bb</a>} (98%)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/d=
istro/include/tcmode-default.inc<br>
&gt; index 4fb6e47b7f..a9724d7621 100644<br>
&gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt; @@ -62,10 +62,6 @@ PREFERRED_VERSION_qemu ?=3D &quot;${QEMUVERSION}&qu=
ot;<br>
&gt;=C2=A0 PREFERRED_VERSION_qemu-native ?=3D &quot;${QEMUVERSION}&quot;<br=
>
&gt;=C2=A0 PREFERRED_VERSION_nativesdk-qemu ?=3D &quot;${QEMUVERSION}&quot;=
<br>
&gt;=C2=A0 <br>
&gt; -# Bootstrap Go using a binary release from <a href=3D"http://golang.o=
rg" rel=3D"noreferrer" target=3D"_blank">golang.org</a>.=C2=A0 If you want =
to bootstrap<br>
&gt; -# from source using the C-implemented Go 1.4 (only supports x86-64 ho=
sts) then use<br>
&gt; -# go-native.<br>
&gt; -PREFERRED_PROVIDER_go-native ?=3D &quot;go-binary-native&quot;<br>
&gt;=C2=A0 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?=3D &quot;${GOVERS=
ION}&quot;<br>
&gt;=C2=A0 PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?=3D &quot;${GOVERSIO=
N}&quot;<br>
&gt;=C2=A0 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?=3D &quot;${GOVERSION=
}&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-nati=
ve_1.22.4.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.4.=
bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-native_1.22.4.bb" re=
l=3D"noreferrer" target=3D"_blank">go-native_1.22.4.bb</a><br>
&gt; similarity index 98%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-nativ=
e_1.22.4.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.4.b=
b</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-native_1.22.4.=
bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.22.4.bb</a><br>
&gt; index 61da51be3a..ee094435a7 100644<br>
&gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.22=
.4.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.4.bb</a><=
br>
&gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-native_1.22.4.bb" =
rel=3D"noreferrer" target=3D"_blank">go-native_1.22.4.bb</a><br>
&gt; @@ -5,8 +5,6 @@ HOMEPAGE =3D &quot; <a href=3D"http://golang.org/" rel=
=3D"noreferrer" target=3D"_blank">http://golang.org/</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707&quot;<br>
&gt;=C2=A0 <br>
&gt; -PROVIDES =3D &quot;go-native&quot;<br>
&gt; -<br>
&gt;=C2=A0 # Checksums available at <a href=3D"https://go.dev/dl/" rel=3D"n=
oreferrer" target=3D"_blank">https://go.dev/dl/</a><br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7=
D.$%7BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_GOTUPLE%=
7D" rel=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go${PV}.$=
{BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&quot;<br=
>
&gt;=C2=A0 SRC_URI[go_linux_amd64.sha256sum] =3D &quot;ba79d452610257519627=
3416239cca418a651e049c2b099f3159db85e7bade7d&quot;<br>
&gt; -- <br>
&gt; 2.45.2<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#200907): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/200907" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/200907</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10675782=
3/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/106757823/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000a43b86061b9db84d--

