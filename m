Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236A6D58D7B
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:34:26 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.25850.1732559663875734753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 10:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UdVDdytn;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-71d4c462ab1so597356a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732559663; x=1733164463; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UNEsjpzEVnm6a+9fWxxYhaPz2OzVgac+S9dLxsJYcOI=;
        b=UdVDdytnGNy2E8IjfYTEljpbj7GPjtk/b+QHmZUooAxsbMWkdUjAaijLaFl/9xZv0F
         QSUp8FTA0CBdnbTJBZT/P5kTkViS++1ZEU0XfMledX/O1V8erwLSpJroOKkD9Nbj6wjX
         ltafD+LdOciQ4k/EBTsuqNZg77Uj7C2dnhfRiJ1N6AiIo8IK/j6WckqcMuKXB27vmQJd
         COvWEQsBlyZwVplA/Szt07FjumrgCdmXVtajOCr1TV39hgwwS0e9OrNxJfU7c5t4wwvM
         rbb9VtzoSGWlXhnBf/jtWMSphajBc6v95C0YmT1ysFMmzaPN8/5vN5n+M8Q3/1vE5omN
         59lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732559663; x=1733164463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNEsjpzEVnm6a+9fWxxYhaPz2OzVgac+S9dLxsJYcOI=;
        b=nos+9I/S6gr9LbWm2WN0h1AYOpqz8YhNtVWAlC6Aka+R7R1t4c67Y9fRkwF5LPFYoH
         8baT+cVLzOkQagAW6IfLN9mED3yF1euG5wxZ9mxVWUb0KEAYN2XyusqXcNIA+T4+3/uh
         NqcryZ3k8xH0WVZh64GIQl4gN0L/0aFOxZGeizdmLKlP9+pYwKThd17+G21jgxRXVjF7
         DwMow5zTLsl4Fk4tdpF6QI2XXBqja9WuYa094Y5oaG47xUM5jBTVRt+i6JgJXINQgl4N
         L33efJw+uFVdrq1/NuMi+d8TrhleDKWaIbhGURWpRSWyRm6rRrpJJAn7Sq3sg96f7MbK
         9YTA==
X-Gm-Message-State: AOJu0YytcU8R9SSJrKGCvj2/5asDFWwmcmJDKP3NNWQfpS7u+iX7v6N1
	F/UJsvkErTN8qjIYLQ25n/I6i+cbJtow0yZ9F2rZTkU+8McmR43mg83vxxomBbH+DB71CoH71CE
	u6IqmLv1+J1euR1EwnoP8c81LuXY=
X-Gm-Gg: ASbGncuzN9+7fVIocozCfzNycwNEq5NfDMkSUu0AP8OhQryTKn8d4f3NuIgaiAurbrS
	UNCRN5Ds5lRCh6/Y8iRLTep+Mvb4g2HMIi/PMKEjv8bA4CddwqxOIAybxl/GZLw==
X-Google-Smtp-Source: AGHT+IG/K12lJ6P+Z9phYENcCqze3m4xUQGL4okVuTp0UYZKAzzsKZ700ZC+kt+1tTT/3q3KqQo+PvdUIIrzI9/m748=
X-Received: by 2002:a05:6830:349e:b0:71d:5a8a:1a2f with SMTP id
 46e09a7af769-71d5a8a1bfdmr681874a34.14.1732559663027; Mon, 25 Nov 2024
 10:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20241125120127.2205232-1-alex.kanavin@gmail.com> <20241125120127.2205232-15-alex.kanavin@gmail.com>
In-Reply-To: <20241125120127.2205232-15-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2024 10:34:12 -0800
Message-ID: <CAMKF1srY--yRX9W-n2WB2WerNry+-a+Yh=hfun7AR_r39fZ8fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/35] mtd-utils: upgrade 2.2.0 -> 2.2.1
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000445c880627c0fb37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 18:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207794

--000000000000445c880627c0fb37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 4:02=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> From: Alexander Kanavin <alex@linutronix.de>
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

If it is Locked at the SRCREV pointing to release point then maybe rename
the recipe to reflect the PV


> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index a40d79c8649..3545f8e4262 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
>  DEPENDS =3D "zlib e2fsprogs util-linux"
>  RDEPENDS:mtd-utils-tests +=3D "bash"
>
> -PV =3D "2.2.0"
> +PV =3D "2.2.1"
>
> -SRCREV =3D "31e990c56aba7584cde310685d663bb122f16003"
> +SRCREV =3D "13ec33609213c1dbd75852a09560a707a7f19a5c"
>  SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207762):
> https://lists.openembedded.org/g/openembedded-core/message/207762
> Mute This Topic: https://lists.openembedded.org/mt/109769671/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000445c880627c0fb37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 25, 2024 at 4:02=E2=80=AFAM Alexander Kanavin v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mtd-utils_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">If it is Locked =
at the SRCREV pointing to release point then maybe rename the recipe to ref=
lect the PV=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><br>
diff --git a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" =
rel=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> b/meta/recipes-de=
vtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"noreferrer" target=3D=
"_blank">mtd-utils_git.bb</a><br>
index a40d79c8649..3545f8e4262 100644<br>
--- a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
@@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives<br>
=C2=A0DEPENDS =3D &quot;zlib e2fsprogs util-linux&quot;<br>
=C2=A0RDEPENDS:mtd-utils-tests +=3D &quot;bash&quot;<br>
<br>
-PV =3D &quot;2.2.0&quot;<br>
+PV =3D &quot;2.2.1&quot;<br>
<br>
-SRCREV =3D &quot;31e990c56aba7584cde310685d663bb122f16003&quot;<br>
+SRCREV =3D &quot;13ec33609213c1dbd75852a09560a707a7f19a5c&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.infradead.org/mtd-utils=
.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.infradead.or=
g/mtd-utils.git;branch=3Dmaster</a>&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207762): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207762" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207762</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109769671/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109769671/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000445c880627c0fb37--

