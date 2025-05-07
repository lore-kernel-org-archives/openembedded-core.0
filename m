Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED57C3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 16:17:12 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.339.1746634629339136994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 09:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HDaJsKtT;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30a9718de94so125392a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746634629; x=1747239429; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sWVRU+4/2+tt5FnIlnKCJ3Yp662sOMbbyqwHvRtLw0Y=;
        b=HDaJsKtTQBHK2L/dgJKWZC9Ag0FezAntFXJFCdguJToy+zSftI9GUM5zq8lc9HFh1q
         CXD6rlCXOj7CvkY7l1o0JS+bhDAxXw02GtAwbqCEu6TQ34EnjQIL1tR7mRqX6gZoIEsZ
         efvrbv+5YneiNGq+DstKGkRqP6jwJCOHAIjrUDlXN39rk+TSsIjbw1w1df41Q8zocdoq
         FvUfGHGLtQXEip42drROCVgzPCz3kTooU6cukus3S88Qqj6GuVcGXV1cz0f3JCQLJP92
         48+A57Wth1mGWPq6LxcC3LVCkP7U+BJ1tXq5sVqnuv1XRsvNY4q4ovRj+JX29iYMh44i
         HWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634629; x=1747239429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWVRU+4/2+tt5FnIlnKCJ3Yp662sOMbbyqwHvRtLw0Y=;
        b=UxipRFcR5hI/tIJBMD0aZRMB9h+Rpi18nx0lXADQed1qNA5XU0Nbq1HFUgwzSKZf6V
         wUDvCnjhNj/o8M53Xo7mbfMB+4zYJ7F90bQQsXKASPtgRKey15rDwm/Lrlnqemjv3FE6
         Djs7/FwccIbjROzc/HrKqClULpFNqmhKNmQGdQqLFZhKWUVduO7MxkB7iOB1xj3vz5jv
         g6hWyam82TFoYViVsTgpt+6/jwbxQ1WwLkAZjSW97i7iab/8jGeQeklcLrgIWyuHWR1j
         hV3mFOvW9Xl4pbppmb+kMkTBJrJ/y99tkAvKPCkV0PzK9dLraewHWqMDuMLThLcvY7Fu
         CdvA==
X-Forwarded-Encrypted: i=1; AJvYcCWD56xO9uNU9pSHDd3zsTjVhVPcmnk45wGOndgHW5L4OlNo4SKKCzLVV2u/AK0c+TVrs7UPB1szoP98qkpamTEFcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXXrZvm/FNdNE6ijjIGeo+HveDx1SeQ0p/rHVHLBNIW3L+NoUM
	xc800zd2b8sXLQ+BxF5P0iS5HOYfuw+N8+KIpyMGNRFHSct0jHunn5n9w5Yd1b+URLVkfBeBruS
	ackahG9YRqnyDFmlUbpULuOaKKkbbZWbi
X-Gm-Gg: ASbGncuoKTvtbtzE8C1t8MLWw93lGI4YVbVL6dkOzHIrehFz635/IuYn1wVwSwdaOGr
	GBV6a8r6g1aiwbFnUxpywV1RneGkL0ujvY9pbq8EWrfHiCv71ZNjEbaFJvEvTZGlBEWKQDFYlw6
	y91a4tJaQX+qrxL9Qf5drqXw==
X-Google-Smtp-Source: AGHT+IF4GfD8sfVeTjxkUN1Dd7ZByZSdd8ROqRo7Rvcl2Uu9E+S3OTbKHgRY5GK/kRdvuG5MA838JLRSkiRSW6HAfKc=
X-Received: by 2002:a17:90b:2f85:b0:30a:3e8e:492c with SMTP id
 98e67ed59e1d1-30aac2483f4mr5429790a91.32.1746634628615; Wed, 07 May 2025
 09:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <183D4757C69BDCF6.4227@lists.openembedded.org>
In-Reply-To: <183D4757C69BDCF6.4227@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 May 2025 12:16:54 -0400
X-Gm-Features: ATxdqUGp25DnpxyyvQUST7cj6aa-Csb494bHaS58HgiIaaAkLUKI5BAgh7bCrKo
Message-ID: <CADkTA4NTYoqfESwHCg9hp2UqaEX2JqWsbQ5wqU5mwKLfoHmmmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yoto/6.12: bsp/arm: fix CONFIG_CRYPTO_LIB_CHACHA
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000097532a06348e108d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 16:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216122

--00000000000097532a06348e108d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ooops. I see the "yoto" now.

I can send a v2, or if you want to tweak it on the way in. Either is fine
with me.

Bruce

On Wed, May 7, 2025 at 11:11=E2=80=AFAM Bruce Ashfield via lists.openembedd=
ed.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following commit(s) to linux-yocto/.:
>
> 1/2 [
>     Author: Mikko Rapeli
>     Email: mikko.rapeli@linaro.org
>     Subject: genericarm64: add CONFIG_CRYPTO_LIB_CHACHA=3Dm
>     Date: Wed, 7 May 2025 14:43:40 +0300
>
>     Fixes CONFIG_CRYPTO_CHACHA20_NEON build as module:
>
>     WARNING: [kernel config]: specified values did not make it into the
> kernel's final configuration:
>
>         [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (m) and .config va=
l
> (n) do not match
>         [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n
>
>     Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ]
>
> 2/2 [
>     Author: Mikko Rapeli
>     Email: mikko.rapeli@linaro.org
>     Subject: qemuarma15.cfg: enable CONFIG_CRYPTO_LIB_CHACHA
>     Date: Wed, 7 May 2025 14:43:41 +0300
>
>     It's a dependency of CONFIG_CRYPTO_CHACHA20_NEON.
>     Fixes:
>
>         [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (y) and .config va=
l
> (n) do not match
>         [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n
>
>     Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ]
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> Apply this on top of my recent kernel series and the warnings
> should be gone from the various arm builds.
>
> Bruce
>
>  meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> index 2daf71600a..6560175461 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> @@ -15,7 +15,7 @@ python () {
>  }
>
>  SRCREV_machine ?=3D "28fcf1f308c59515410f6a0d0bc3278d5296a3c1"
> -SRCREV_meta ?=3D "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
> +SRCREV_meta ?=3D "a50ff542f8d79235030741f9e850d34768907d2d"
>
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine;p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.12;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.12;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> index b1a45ab168..cf6014efad 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> @@ -18,7 +18,7 @@ KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
>  SRCREV_machine ?=3D "5b22e7aef539a991b75fa45101cbc02051327cb6"
> -SRCREV_meta ?=3D "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
> +SRCREV_meta ?=3D "a50ff542f8d79235030741f9e850d34768907d2d"
>
>  PV =3D "${LINUX_VERSION}+git"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> index b44bb94590..fefed8c9c5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> @@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?=3D
> "5b22e7aef539a991b75fa45101cbc02051327cb6"
>  SRCREV_machine:qemux86-64 ?=3D "5b22e7aef539a991b75fa45101cbc02051327cb6=
"
>  SRCREV_machine:qemumips64 ?=3D "8e88d1714f7f56efc4650cf84b86845d44c01eb1=
"
>  SRCREV_machine ?=3D "5b22e7aef539a991b75fa45101cbc02051327cb6"
> -SRCREV_meta ?=3D "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
> +SRCREV_meta ?=3D "a50ff542f8d79235030741f9e850d34768907d2d"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream',
> and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the
> same
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216119):
> https://lists.openembedded.org/g/openembedded-core/message/216119
> Mute This Topic: https://lists.openembedded.org/mt/112669991/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000097532a06348e108d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Ooo=
ps. I see the &quot;yoto&quot; now.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I can send a v2, or if you want to=C2=A0tweak it on the way in. =
Either is fine with me.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">B=
ruce</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, May 7, 2025 at 11:11=E2=80=AFAM Bru=
ce Ashfield via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.co=
m</a>&gt;<br>
<br>
Integrating the following commit(s) to linux-yocto/.:<br>
<br>
1/2 [<br>
=C2=A0 =C2=A0 Author: Mikko Rapeli<br>
=C2=A0 =C2=A0 Email: <a href=3D"mailto:mikko.rapeli@linaro.org" target=3D"_=
blank">mikko.rapeli@linaro.org</a><br>
=C2=A0 =C2=A0 Subject: genericarm64: add CONFIG_CRYPTO_LIB_CHACHA=3Dm<br>
=C2=A0 =C2=A0 Date: Wed, 7 May 2025 14:43:40 +0300<br>
<br>
=C2=A0 =C2=A0 Fixes CONFIG_CRYPTO_CHACHA20_NEON build as module:<br>
<br>
=C2=A0 =C2=A0 WARNING: [kernel config]: specified values did not make it in=
to the kernel&#39;s final configuration:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [NOTE]: &#39;CONFIG_CRYPTO_CHACHA20_NEON&#39; l=
ast val (m) and .config val (n) do not match<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapel=
i@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
]<br>
<br>
2/2 [<br>
=C2=A0 =C2=A0 Author: Mikko Rapeli<br>
=C2=A0 =C2=A0 Email: <a href=3D"mailto:mikko.rapeli@linaro.org" target=3D"_=
blank">mikko.rapeli@linaro.org</a><br>
=C2=A0 =C2=A0 Subject: qemuarma15.cfg: enable CONFIG_CRYPTO_LIB_CHACHA<br>
=C2=A0 =C2=A0 Date: Wed, 7 May 2025 14:43:41 +0300<br>
<br>
=C2=A0 =C2=A0 It&#39;s a dependency of CONFIG_CRYPTO_CHACHA20_NEON.<br>
=C2=A0 =C2=A0 Fixes:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [NOTE]: &#39;CONFIG_CRYPTO_CHACHA20_NEON&#39; l=
ast val (y) and .config val (n) do not match<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapel=
i@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
]<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
<br>
Apply this on top of my recent kernel series and the warnings<br>
should be gone from the various arm builds.<br>
<br>
Bruce<br>
<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a>=C2=A0 =C2=A0=
| 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a> | 2 +-<b=
r>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a><br>
index 2daf71600a..6560175461 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a><br>
@@ -15,7 +15,7 @@ python () {<br>
=C2=A0}<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;28fcf1f308c59515410f6a0d0bc3278d5296a3c1&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;23e01a412ce53c2b1a9ac83d143702c7d03ec0f0&quot;<br>
+SRCREV_meta ?=3D &quot;a50ff542f8d79235030741f9e850d34768907d2d&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D=
${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.12=
;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bra=
nch=3Dyocto-6.12;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6=
.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a><br>
index b1a45ab168..cf6014efad 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a><br>
@@ -18,7 +18,7 @@ KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;5b22e7aef539a991b75fa45101cbc02051327cb6&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;23e01a412ce53c2b1a9ac83d143702c7d03ec0f0&quot;<br>
+SRCREV_meta ?=3D &quot;a50ff542f8d79235030741f9e850d34768907d2d&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_6.12.bb</a><br>
index b44bb94590..fefed8c9c5 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?=3D &quot;5b22e7aef539a991b75fa45=
101cbc02051327cb6&quot;<br>
=C2=A0SRCREV_machine:qemux86-64 ?=3D &quot;5b22e7aef539a991b75fa45101cbc020=
51327cb6&quot;<br>
=C2=A0SRCREV_machine:qemumips64 ?=3D &quot;8e88d1714f7f56efc4650cf84b86845d=
44c01eb1&quot;<br>
=C2=A0SRCREV_machine ?=3D &quot;5b22e7aef539a991b75fa45101cbc02051327cb6&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;23e01a412ce53c2b1a9ac83d143702c7d03ec0f0&quot;<br>
+SRCREV_meta ?=3D &quot;a50ff542f8d79235030741f9e850d34768907d2d&quot;<br>
<br>
=C2=A0# set your preferred provider of linux-yocto to &#39;linux-yocto-upst=
ream&#39;, and you&#39;ll<br>
=C2=A0# get the &lt;version&gt;/base branch, which is pure upstream -stable=
, and the same<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216119): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216119" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216119</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112669991/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112669991/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--00000000000097532a06348e108d--

