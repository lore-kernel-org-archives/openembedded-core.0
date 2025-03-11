Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41AEC28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:42:39 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.5839.1741689756183883255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 03:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HrJFim6q;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso8827617a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 03:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741689755; x=1742294555; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/Ry8UGIyJ57Yl9TAan2VQL+/BETQuW8axSVtz/HsSc=;
        b=HrJFim6q1VAXaPRL48pe2PsOW1VcqS5wB+p5JuJuyOpatTh93NvJBxQSZ2H3lKVo1u
         LBNzNOh32SwQWxpgqrLuKC6bfhz6Z4ThiZ2wVGQrUFXbc5GrMD50yDVINHPRDXbBPwss
         J3xOc9F8A4tBKkNThDdR75vabenjHZ/8M0BW/tTdRvjFk4QyhZ5gXEJPO4CwVLYxnZ7j
         SjGETdr9bo7203urAMQ14Wm1JjF0iFQngMultNNXAv80yagM/lFVdoT3ZErVbtyiJPt6
         nbIb01+u25QRCqM3JGH0mMoiSPz4tUrvc/tDJ7758cSWJcuL8rOf4rSgwc88/bbhYqnc
         TJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741689755; x=1742294555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/Ry8UGIyJ57Yl9TAan2VQL+/BETQuW8axSVtz/HsSc=;
        b=W9NBIpbsQaIHrjKa7fxHzZkE0q1fVqz7Dues4ll/vGsSDf+gtIcKM+MoaQTmyPMbFu
         Nzl8qMdC3MEYlSIO+eaHqnrDz0U/ZElgCQaevtOM9i8ewo5dJjbt7TwPl+jSa8Ypzypw
         YzrqWkhPam3URPlOtuWu4I8Ty/nKbeGD5sIC+I6iHOvqGivIRrYuQiS3/ZQwOJ4jzVhi
         h70B0UMpeyxH2/ACYGUT7u9Zzxlov3F8zvLWJj/WMUTVcMleE1XrEHN4ux5SF6Ytx8tT
         K/61my/hzbAtYHq8/rAFfNpaLQNJDL7FfWTIocSotXgeK+224i3QVJ5QJvPFwas0MbcZ
         sPfw==
X-Gm-Message-State: AOJu0Yy+EOUK2j7eYvd7CesO2Up+oikCLR9cd522k6dQ6JNmlklHRu5c
	JUetlcwbiLtIncYJbWVRNjx1HuNZN1r4PNSnsoTQDxpoy2+Sl0YZ7WBKf16Rm2in8uY9F8P9Dfj
	L2vRF4YPl9NL8ctwdrdO6/gMhVWo=
X-Gm-Gg: ASbGncsUPZbSTjTQlJpV0V/Bck9gLP0Y+hr+/teY5t3MUE66irjqABWzlKFgykPcsI8
	BcVOv1IROjHjGOCVg4lG8fWurKF0iXCEvkKZOkfsDdRvr/asFOEeb8G5YXuoSABcqhSTGzjeGRn
	k4lqSG119Vg9iCuuyLDdg1aYYax2k3
X-Google-Smtp-Source: AGHT+IH0mZU2Iiyb0spzKpcEdRjNuhe4auNZG+9fITKXUf57a7baJ8nW37chvBriS51UNtvc5rT1n4ekC8+iK7Wgz8o=
X-Received: by 2002:a17:90b:1d46:b0:2fa:2133:bc87 with SMTP id
 98e67ed59e1d1-3010051f268mr3948493a91.6.1741689755437; Tue, 11 Mar 2025
 03:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250311100500.355914-1-alex.kanavin@gmail.com> <20250311100500.355914-3-alex.kanavin@gmail.com>
In-Reply-To: <20250311100500.355914-3-alex.kanavin@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 11 Mar 2025 11:42:23 +0100
X-Gm-Features: AQ5f1JoIpLSUyMKXSTSo54ecC9SV2LtVBvutU9u81dPlromz5-oUFS3ziDDwKEw
Message-ID: <CAApg2=QaDqX6UngNosZqkiAQiC3iKo99-gx63DJPUq-h3SFaXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] gnupg: follow odd-even scheme in upstream
 version checks
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000002e921006300ebfab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 10:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212556

--0000000000002e921006300ebfab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 11:05=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:

> From: Alexander Kanavin <alex@linutronix.de>
>
> Unfortunately this has been overlooked, and resulted in
> erroneous updates to testing/development releases.
>
> The check will report an 'unknown' latest version until 2.6.0
> is released.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-support/gnupg/gnupg_2.5.4.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
> b/meta/recipes-support/gnupg/gnupg_2.5.4.bb
> index e6a7e3fb407..0001631d2c5 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.5.4.bb
> @@ -11,9 +11,9 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D189af8afca6d6075ba6c9e0aa8077626 \
>
>  DEPENDS =3D "npth libassuan libksba zlib bzip2 readline libgcrypt"
>
> -inherit autotools gettext texinfo pkgconfig
> +inherit autotools gettext texinfo pkgconfig upstream-version-is-even
>
> -UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
> +UPSTREAM_CHECK_URI =3D "https://gnupg.org/ftp/gcrypt/gnupg/"
>  SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://0002-use-pkgconfig-instead-of-npth-config.patch \
>
> file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
>
>
Could you maybe add a comment next to the version hash saying that the
project is using odd/even
convention and that people should only update to stable branches? At least
it might avoid the error
next time.

Kind regards,
Marta

--0000000000002e921006300ebfab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 11,=
 2025 at 11:05=E2=80=AFAM Alexander Kanavin via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_bla=
nk">alex@linutronix.de</a>&gt;<br>
<br>
Unfortunately this has been overlooked, and resulted in<br>
erroneous updates to testing/development releases.<br>
<br>
The check will report an &#39;unknown&#39; latest version until 2.6.0<br>
is released.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.5.4.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a> b/meta/recipes-suppo=
rt/gnupg/<a href=3D"http://gnupg_2.5.4.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gnupg_2.5.4.bb</a><br>
index e6a7e3fb407..0001631d2c5 100644<br>
--- a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.5.4.bb</a><br>
+++ b/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.5.4.bb</a><br>
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D189af8afc=
a6d6075ba6c9e0aa8077626 \<br>
<br>
=C2=A0DEPENDS =3D &quot;npth libassuan libksba zlib bzip2 readline libgcryp=
t&quot;<br>
<br>
-inherit autotools gettext texinfo pkgconfig<br>
+inherit autotools gettext texinfo pkgconfig upstream-version-is-even<br>
<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gnupg.org/download/index.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://gnupg.org/download/index.=
html</a>&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gnupg.org/ftp/gcrypt/gnupg=
/" rel=3D"noreferrer" target=3D"_blank">https://gnupg.org/ftp/gcrypt/gnupg/=
</a>&quot;<br>
=C2=A0SRC_URI =3D &quot;${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-use-pkgconfig-instead=
-of-npth-config.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-autogen.sh-fix-find-v=
ersion-for-beta-checking.patch \<br><br></blockquote><div><br></div><div>Co=
uld you maybe add a comment next to the version hash saying that the projec=
t is using odd/even</div><div>convention and that people should only update=
 to stable branches? At least it might avoid the error</div><div>next time.=
</div><div><br></div><div>Kind regards,</div><div>Marta <br></div></div></d=
iv>

--0000000000002e921006300ebfab--

