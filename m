Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F88CF31A5
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:14:26 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4254.1763550857096221764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 03:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Hs2JMz8P;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so3683155f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 03:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763550855; x=1764155655; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zigEcArCgaoNLouJnidiAPpO80lwq+dacT6HDOSXS3M=;
        b=Hs2JMz8P8m2/xmwPZcfq7cz6beByNnJdMzStvVbtP2BEcXamctQFL9/HtkhKzv6plY
         jWptUBjH0Z6PPLIZNwM0ryHUi2fTeE/1pN6+HPxQZzU7+v1oVsWExIQHwmFjxcl/l7Ep
         KUvsQH2z2r+A3+8U592wELteSkyQdCXGnN1XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550855; x=1764155655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zigEcArCgaoNLouJnidiAPpO80lwq+dacT6HDOSXS3M=;
        b=bhYYF07aXcNrqpgHUSLwNerz6icHPO4Rdqd4B8gpkCjdVDjkCQQApjLFgkdmGyGshh
         9KrjQH/7rOguLzvDRn1BqMJXKAddsHAMi0kYnDn47mYtN2QwuO+xmXRqsJbpkysGhwgX
         NQOsbDQZn1PLRP/8oKCmgLyb3Kou5izQZ6rdtXPGAddv2rCBdWCOnNRW+SITpdPIY+IM
         St6bVvuBsesjtHy7Ioa+OGPTGJAvjNkWnrNfXaz2w7Wc9hgQ179Xf8qCy10lyyz+uVn3
         Dl5g+PU6DIF/gkO4nZNlFttHcun//OG142qm2+OWNDrmKoIGyzLJVH/NskhA5i//oybJ
         WMPA==
X-Gm-Message-State: AOJu0Yw4N/hOJVOtO3aEnxviOikj2RbpsgWNNz13qBihhDOwS1AIjew3
	dHgosc1mzn4n/NfFtb64DffBXaRXcDu//TCek+z4lBD1go8PLhEC3h6YqqnOwsySkmwRtRGhlAS
	h+aXdr4geFGRi1lYjuFmbgJFkqPg9E7Lx5aHYP/66PxZ+FvTELYTAiqSgnQ==
X-Gm-Gg: ASbGncvV7RRmsI0j7iM3ksOgMg186fAAvljUqURwA5Q8H0TGNAZlF78TgEJy33lV9a1
	CGBVyvt5hMJy08P/2RKY7Woa1B0jtAnDCBz3N0Br3FtSlNVTURMVrwqoh83U68FiAaEkYmQwhZW
	GcHVugVQL2LANkW+87bYdqh5m2z3vb+bkiTsAjax0KhARRYYovVg7CEWq0iRfW90lqNpurFmccZ
	NnQUVdsVnd8O6gTYxwwVgsxXQPhQrhuBJ9mMk6n5eFp2gUTBNafzvbbNCYDCuT2iqJCP6Hx/G0N
	+SDKC+6t7wD8pmEPWNrO4NsnQ8HTjgIcgAYS4Dyc
X-Google-Smtp-Source: AGHT+IEF79PJjChCZ5ijMHDD0dlfgVHl7rtLDDBfEiMSa/BfUT7l/04/NGyFFo1Xz6LhgMux5+F0+Eiv+0Y2eWlNKFQ=
X-Received: by 2002:a5d:5d01:0:b0:42b:4177:7131 with SMTP id
 ffacd0b85a97d-42b595add99mr20156770f8f.44.1763550855247; Wed, 19 Nov 2025
 03:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20251119101959.2603691-1-skandigraun@gmail.com>
In-Reply-To: <20251119101959.2603691-1-skandigraun@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 19 Nov 2025 12:13:48 +0100
X-Gm-Features: AWmQ_bnU-1p--J0L1lWJKFgepEuJWA86cS2PCrJ-vQOhqGh2tXpFj9xl-1FG0io
Message-ID: <CAMSfU+6HVotB37NL7o6arKjxkeGzm-wAHCOnTNDHcyQ6x_JjoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add canon-prefix-map to DEBUG_PREFIX_MAP
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004549bd0643f0ae80"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226551

--0000000000004549bd0643f0ae80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 19 nov. 2025 =C3=A0 11:20, Gyorgy Sarvari via lists.openembedded.or=
g
<skandigraun=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> When the debug-prefix-map and macro-prefix-map compiler flags
> were change to file-prefix-map[1] the -fcanon-prefix-map
> flag was removed, most likely accidentally.
>
> Due to this the file paths were not canonicalized before
> substituting them, so they did not always match the corresponding keys.
>
> E.g. relative pathes were not converted to absolute ones:
> ../../sources/foo.cpp doesn't match ${S}/foo.cpp, and due to
> this some debug sources were missed.
>
> This patch adds back the -fcanon-prefix-map flag.
>
> [1]:
> https://git.openembedded.org/openembedded-core/commit/?id=3Dff73fa7ef7666=
a6dbe34f15515bc3ab6e574c5b0


This patch does fix a bug I filed yesterday :
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16069

Awesome, thanks!

For the out-of-tree kernel module case:
Tested-by: Yoann Congal <yoann.congal@smile.fr>


> Cc: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 52ceb76bbb..f789b8e326 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
>  ##################################################################
>  TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
>  # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?=3D "\
> +DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
>   -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
>   -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
>   -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226545):
> https://lists.openembedded.org/g/openembedded-core/message/226545
> Mute This Topic: https://lists.openembedded.org/mt/116371356/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000004549bd0643f0ae80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mer. 19 nov. 2025 =C3=A0=C2=A011:=
20, Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</d=
iv><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">When the debug-prefix-map and macro-prefix-map c=
ompiler flags<br>
were change to file-prefix-map[1] the -fcanon-prefix-map<br>
flag was removed, most likely accidentally.<br>
<br>
Due to this the file paths were not canonicalized before<br>
substituting them, so they did not always match the corresponding keys.<br>
<br>
E.g. relative pathes were not converted to absolute ones:<br>
../../sources/foo.cpp doesn&#39;t match ${S}/foo.cpp, and due to<br>
this some debug sources were missed.<br>
<br>
This patch adds back the -fcanon-prefix-map flag.<br>
<br>
[1]: <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3Dff73fa7ef7666a6dbe34f15515bc3ab6e574c5b0" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3Dff73fa7e=
f7666a6dbe34f15515bc3ab6e574c5b0</a></blockquote><div><br></div><div>This p=
atch does fix a bug I filed yesterday :=C2=A0<a href=3D"https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D16069">https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D16069</a></div><div><br></div><div>Awesome, thanks!</div><=
div><br></div><div>For the out-of-tree kernel module case:</div><div>Tested=
-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal=
@smile.fr</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 52ceb76bbb..f789b8e326 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D &quot;${PARALLEL_=
MAKEINST} &quot;<br>
=C2=A0##################################################################<br=
>
=C2=A0TARGET_DBGSRC_DIR ?=3D &quot;/usr/src/debug/${PN}/${PV}&quot;<br>
=C2=A0# Beware: applied last to first<br>
-DEBUG_PREFIX_MAP ?=3D &quot;\<br>
+DEBUG_PREFIX_MAP ?=3D &quot;-fcanon-prefix-map \<br>
=C2=A0 -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \<br>
=C2=A0 -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \<br>
=C2=A0 -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226545): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226545" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226545</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116371356/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116371356/4316185</a><br>
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

--0000000000004549bd0643f0ae80--

