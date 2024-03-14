Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5C9C54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 08:35:34 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.7810.1710405327737136262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 01:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CAa36lxo;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512b3b04995so719672e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 01:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710405326; x=1711010126; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/2JEos4wNDRfW0FIObBXOEoWEAaiH7yENIwQsQRqCUY=;
        b=CAa36lxoYJyhHVE29vrtF4Bm2QajuTSgQVItbwKHvkH+/GB0tvU8XMwO/6/KK9JsHm
         UfDGoWQGOvI7UizT1wXftXj3aiexwAGuNfe6Bow0YOdOpjxQlbojZ9rv3GWvqc3ZcQFm
         Z8C42sZaKMf9z/XxF912S1QzdV8qVScmXJjFRAloyqOEZFS3XZPdtkccRfjf/S9nZFvo
         AZ9KxRCkvD0VxSxElyTTzqtz7c5sjiU9h5Ab/A1iWSQXNDVQ87TE9kTy4QdjNDJvmQzq
         aRaF0h01qN2aSp7wdwFQe6xoN1detQgCsd+CrB1twdAdV7CMwXeKR7Demn/iIuChspcS
         0o4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710405326; x=1711010126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2JEos4wNDRfW0FIObBXOEoWEAaiH7yENIwQsQRqCUY=;
        b=K93BfEXgYCT9/OzNb5lGdA0Pj1UpIgWzBTtNCg9FTdFKc5xk0lGdcnlY+COBV4V/2V
         +/xvk7RACuUw9l/1kkaDVGcSy1v6vUVVXwiF5hFTXJkHSHB7BXJ4r90IaAyZyvHmoRKh
         +aODjCxwww1aQm7cvPubpbpO9UYHQ0Mh9WMpJDomMM8aMvX1YTI2LcqWdCTgcY5mI5Gm
         kRHjZi9j8putGN0STHgEqJ+qU/MODNouotzbmOdGCdTyeXjQdIX/1VunSsyEA9EvzsLK
         JKzJFGtJeki5/WmwifSBwa8vZM44wwcsVJEQrXK1EtuK7NYZ/7Dj32WybyHeSCIVAl35
         JFFA==
X-Gm-Message-State: AOJu0YxCR52AMzI/3yv0PjAfeVqtPGVkGLECa8wthasnR6qV5YwBvwpW
	i6U2IoDuN0RjrRZRktaiC8UECN8QC7ngkBugWEjW2Kmf8qJV44VtpSKwoOatFXuJ0aCfZ1OBPCD
	Ct36NNSq4DX/hdhvRuIqx20FQ4Co=
X-Google-Smtp-Source: AGHT+IEc+RopnPTsVMf1pralaYGKjYAZAuliSUP15PaMVYueZmxDJC/ouURmEb3iryLBElR2qthbopP3FRcVsIBF+i4=
X-Received: by 2002:ac2:4e04:0:b0:513:c658:799b with SMTP id
 e4-20020ac24e04000000b00513c658799bmr766303lfr.55.1710405325455; Thu, 14 Mar
 2024 01:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <d70935f0c1bc2315f649af3011f5b2a1cfdbecc1.1710362494.git.joerg.sommer@navimatix.de>
In-Reply-To: <d70935f0c1bc2315f649af3011f5b2a1cfdbecc1.1710362494.git.joerg.sommer@navimatix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Mar 2024 09:35:13 +0100
Message-ID: <CANNYZj_A-3OzXhD4QZrEnxxEpNyj9sxb=fONdmep5O=YfVhpRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sngrep: new recipe for ncurses SIP Messages
 flow viewer
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d888c806139ac507"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 08:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197099

--000000000000d888c806139ac507
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This should go to the openembedded-devel list.

Alex

On Wed 13. Mar 2024 at 21.41, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../recipes-support/sngrep/sngrep_1.8.0.bb    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-networking/recipes-support/sngrep/sngrep_1.8.0.b=
b
>
> diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb
> b/meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb
> new file mode 100644
> index 000000000..2824dde88
> --- /dev/null
> +++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb
> @@ -0,0 +1,37 @@
> +SUMMARY =3D "Ncurses SIP Messages flow viewer"
> +DESCRIPTION =3D "Tool for displaying SIP calls message flows from termin=
al"
> +HOMEPAGE =3D "https://github.com/irontec/sngrep"
> +BUGTRACKER =3D "https://github.com/irontec/sngrep/issues"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPL-3.0-or-later & OpenSSL"
> +LIC_FILES_CHKSUM =3D "\
> +    file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE.OpenSSL;md5=3De39170c41c6f83de36426dbf49a03632 \
> +
> file://README;beginline=3D100;endline=3D124;md5=3D758a88cf2b27572df05996a=
3810066b3
> \
> +"
> +
> +DEPENDS =3D "\
> +    libpcap \
> +    ncurses \
> +"
> +
> +SRC_URI =3D "git://
> github.com/irontec/sngrep.git;protocol=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "f7b36df3b79617892958b67cb4ad9313c6ce72d2"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> +
> +PACKAGECONFIG ?=3D "\
> +    openssl \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> +    unicode \
> +"
> +
> +PACKAGECONFIG[openssl] =3D "-DWITH_OPENSSL=3DON,-DWITH_OPENSSL=3DOFF,ope=
nssl"
> +PACKAGECONFIG[gnutls] =3D "-DWITH_GNUTLS=3DON,-DWITH_GNUTLS=3DOFF,gnutls
> libgcrypt"
> +PACKAGECONFIG[pcre] =3D "-DWITH_PCRE=3DOFF,-DWITH_PCRE=3DOFF,libpcre"
> +PACKAGECONFIG[zlib] =3D "-DWITH_ZLIB=3DON,-DWITH_ZLIB=3DOFF,zlib"
> +PACKAGECONFIG[unicode] =3D "-DWITH_UNICODE=3DON,-DWITH_UNICODE=3DOFF"
> +PACKAGECONFIG[ipv6] =3D "-DUSE_IPV6=3DON,-DUSE_IPV6=3DOFF"
> +PACKAGECONFIG[eep] =3D "-DUSE_EEP=3DON,-DUSE_EEP=3DOFF"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197083):
> https://lists.openembedded.org/g/openembedded-core/message/197083
> Mute This Topic: https://lists.openembedded.org/mt/104914270/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d888c806139ac507
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">This should go to the openembedded-devel=
 list.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div></d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed 13. Mar 2024 at 21.41, J=C3=B6rg Sommer via <a href=3D"http://list=
s.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;joerg.=
sommer=3D<a href=3D"mailto:navimatix.de@lists.openembedded.org" target=3D"_=
blank">navimatix.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">From: J=C3=B6rg Sommer &lt;<a hre=
f=3D"mailto:joerg.sommer@navimatix.de" target=3D"_blank">joerg.sommer@navim=
atix.de</a>&gt;<br>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/sngrep/<a href=3D"http://sngrep_1.8.0.bb" rel=3D"=
noreferrer" target=3D"_blank">sngrep_1.8.0.bb</a>=C2=A0 =C2=A0 | 37 +++++++=
++++++++++++<br>
=C2=A01 file changed, 37 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/sngrep/<a href=3D"=
http://sngrep_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">sngrep_1.8.0.b=
b</a><br>
<br>
diff --git a/meta-networking/recipes-support/sngrep/<a href=3D"http://sngre=
p_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">sngrep_1.8.0.bb</a> b/meta=
-networking/recipes-support/sngrep/<a href=3D"http://sngrep_1.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">sngrep_1.8.0.bb</a><br>
new file mode 100644<br>
index 000000000..2824dde88<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/sngrep/<a href=3D"http://sngrep_1.8.0=
.bb" rel=3D"noreferrer" target=3D"_blank">sngrep_1.8.0.bb</a><br>
@@ -0,0 +1,37 @@<br>
+SUMMARY =3D &quot;Ncurses SIP Messages flow viewer&quot;<br>
+DESCRIPTION =3D &quot;Tool for displaying SIP calls message flows from ter=
minal&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/irontec/sngrep" rel=3D"no=
referrer" target=3D"_blank">https://github.com/irontec/sngrep</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/irontec/sngrep/issues" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/irontec/sngrep/issu=
es</a>&quot;<br>
+SECTION =3D &quot;console/network&quot;<br>
+LICENSE =3D &quot;GPL-3.0-or-later &amp; OpenSSL&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;\<br>
+=C2=A0 =C2=A0 file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae504 \<br>
+=C2=A0 =C2=A0 file://LICENSE.OpenSSL;md5=3De39170c41c6f83de36426dbf49a0363=
2 \<br>
+=C2=A0 =C2=A0 file://README;beginline=3D100;endline=3D124;md5=3D758a88cf2b=
27572df05996a3810066b3 \<br>
+&quot;<br>
+<br>
+DEPENDS =3D &quot;\<br>
+=C2=A0 =C2=A0 libpcap \<br>
+=C2=A0 =C2=A0 ncurses \<br>
+&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/irontec/sngrep.git;pr=
otocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github=
.com/irontec/sngrep.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
+SRCREV =3D &quot;f7b36df3b79617892958b67cb4ad9313c6ce72d2&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit cmake pkgconfig<br>
+<br>
+PACKAGECONFIG ?=3D &quot;\<br>
+=C2=A0 =C2=A0 openssl \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;ipv6&#39;=
, d)} \<br>
+=C2=A0 =C2=A0 unicode \<br>
+&quot;<br>
+<br>
+PACKAGECONFIG[openssl] =3D &quot;-DWITH_OPENSSL=3DON,-DWITH_OPENSSL=3DOFF,=
openssl&quot;<br>
+PACKAGECONFIG[gnutls] =3D &quot;-DWITH_GNUTLS=3DON,-DWITH_GNUTLS=3DOFF,gnu=
tls libgcrypt&quot;<br>
+PACKAGECONFIG[pcre] =3D &quot;-DWITH_PCRE=3DOFF,-DWITH_PCRE=3DOFF,libpcre&=
quot;<br>
+PACKAGECONFIG[zlib] =3D &quot;-DWITH_ZLIB=3DON,-DWITH_ZLIB=3DOFF,zlib&quot=
;<br>
+PACKAGECONFIG[unicode] =3D &quot;-DWITH_UNICODE=3DON,-DWITH_UNICODE=3DOFF&=
quot;<br>
+PACKAGECONFIG[ipv6] =3D &quot;-DUSE_IPV6=3DON,-DUSE_IPV6=3DOFF&quot;<br>
+PACKAGECONFIG[eep] =3D &quot;-DUSE_EEP=3DON,-DUSE_EEP=3DOFF&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197083): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197083" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197083</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104914270/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104914270/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d888c806139ac507--

