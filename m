Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCC8C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 11:31:01 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.18389.1707305457929201585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 03:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LDS6y4P1;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51032058f17so605883e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 03:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707305456; x=1707910256; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n0aWABCwAt1c4CKOQDx0E93JeOo+ep+Iq3IipL1GtTI=;
        b=LDS6y4P152ZQ9e4qmg4+H3nGsUAFSjBXC7IZ7FXKSpzcwa0l4oUP0k39TXp0BlDnd0
         Q3y8qrUh8/V3XdUanm2y444OBH5X6kYAWxk1yYvdauimbYEXE0MbawMJh0OV9L8esBLo
         5FjnbIHEWRmKQOA6PqKGzw8Lu8rrHjMs7Xe58+vjPg3PjEdHf21ZaWnYWLH5c6/h3K9T
         lEoN2QTnPj2DLvYCm0s+cgCvuiLVVzSZgF1cqMNVhiDdFvDHQbtTNP2Htg3xsIaIdQIv
         AsHRfnrR/xKVziS9pFu4YTleCI38nQbUZjNPkmeyaBMtC/O9r0v4yeGJjEYkNKtMGgTr
         VOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707305456; x=1707910256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0aWABCwAt1c4CKOQDx0E93JeOo+ep+Iq3IipL1GtTI=;
        b=ZndglsI5O7KI+s7Uw59/KqakLtZm2uXyfjQ2cubKz/3J71EH+3i3dp6+EdLFRdNn7a
         h9Tv2/bgLHy3StFUJMSzzWwjyZlmUkI3OIaYq0LhDAXvdsz8oS0sd8tluECyB6mbh9Cv
         +z+WGr+35xMQIke9zdcd6/4PQzs/H+xZ0CwWYQZTrfeFyLoMJWtWDKTuDDVNBBPMyCHe
         a4Jm09XyADR7bWWDdJIaPiJArA3F353TcsEfj3uoFc8/9uee8f2Vh8e2D/Q1ihdS1BBl
         qCpVSdG0Gm8y7WMjc7e568tAgbpAuABYWKQd/aQZFNQsMEnXkypwE6r+xLWqZu5Qcc7j
         QPKg==
X-Forwarded-Encrypted: i=1; AJvYcCWFbFV1mHXkyooAovCNo/g6Ew/wXs8qvHvTCeAuFjeApiBtwvegWfWFo013vDsSqzjeiGzVyxkmlIjtFjE3H4LAkJjHUImecfjGP115iGSrOImBNhxdfdok
X-Gm-Message-State: AOJu0YzpkMNTB0TfQNQnBIhKE18XUD9DAJQO1LiA0qZv3JAOeU/kVrT5
	caBhxPZ9gKP2gJgDeSUmJ4UjxpNp7vZ/ysdbhd6cNM2DVFXOnapd5uBz0gWob92i+vJPe56OIJ0
	MRMUwUJ+3/aLL9Deox6aySNhR9yEwfluu
X-Google-Smtp-Source: AGHT+IHYD+z+7teCzAIUazccp4lb3RFOV0Qc29W1TR75yWZpKek7+BdABYkBHPNNiu6Zuc2ph9d5uo9HIen10uAN9nw=
X-Received: by 2002:a05:6512:114e:b0:511:4b2d:d87c with SMTP id
 m14-20020a056512114e00b005114b2dd87cmr5488077lfg.49.1707305456008; Wed, 07
 Feb 2024 03:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20240207080823.498290-1-kai.kang@windriver.com>
In-Reply-To: <20240207080823.498290-1-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Feb 2024 12:30:45 +0100
Message-ID: <CANNYZj9n1DhDHfH0CQjWCyptB1aKhwS5NB55Tv=zVR+wr8e45A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ghostscript: correct LICENSE with AGPLv3
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003a844b0610c9072a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 11:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195052

--0000000000003a844b0610c9072a
Content-Type: text/plain; charset="UTF-8"

I think this needs additional research. Why was the license change missed
when it happened? Do we need to adjust LIC_FILES_CHKSUM with additional
entries?

Alex

On Wed 7. Feb 2024 at 9.08, Kai Kang <kai.kang@eng.windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> The license of ghostscript has switched to Affero GPL since version 9.07
> via commit:
>
> * 3cc5318 Switch Ghostscript/GhostPDL to Affero GPL
>
> https://github.com/ArtifexSoftware/ghostpdl/commit/3cc5318
>
> Correct it with `AGPL-3.0-or-later`.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
> b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
> index 2a966afc21..2c965b6451 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
> @@ -10,7 +10,7 @@ dot-matrix, inkjet and laser models. \
>  HOMEPAGE = "http://www.ghostscript.com"
>  SECTION = "console/utils"
>
> -LICENSE = "GPL-3.0-only"
> +LICENSE = "AGPL-3.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f98ffa763e50cded76f49bce73aade16"
>
>  DEPENDS = "tiff jpeg fontconfig cups libpng freetype zlib"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195040):
> https://lists.openembedded.org/g/openembedded-core/message/195040
> Mute This Topic: https://lists.openembedded.org/mt/104214872/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003a844b0610c9072a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think this needs additional research. Why was the licen=
se change missed when it happened? Do we need to adjust LIC_FILES_CHKSUM wi=
th additional entries?</div><div dir=3D"auto"><br></div><div dir=3D"auto">A=
lex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed 7. Feb 2024 at 9.08, Kai Kang &lt;<a href=3D"mailto:kai.kang=
@eng.windriver.com">kai.kang@eng.windriver.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" t=
arget=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
The license of ghostscript has switched to Affero GPL since version 9.07<br=
>
via commit:<br>
<br>
* 3cc5318 Switch Ghostscript/GhostPDL to Affero GPL<br>
<br>
<a href=3D"https://github.com/ArtifexSoftware/ghostpdl/commit/3cc5318" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/ArtifexSoftware/ghostp=
dl/commit/3cc5318</a><br>
<br>
Correct it with `AGPL-3.0-or-later`.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_10.02=
.1.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_10.02.1.bb</a> | 2 =
+-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscrip=
t_10.02.1.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_10.02.1.bb</=
a> b/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_10.02.=
1.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_10.02.1.bb</a><br>
index 2a966afc21..2c965b6451 100644<br>
--- a/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_10.02=
.1.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_10.02.1.bb</a><br>
+++ b/meta/recipes-extended/ghostscript/<a href=3D"http://ghostscript_10.02=
.1.bb" rel=3D"noreferrer" target=3D"_blank">ghostscript_10.02.1.bb</a><br>
@@ -10,7 +10,7 @@ dot-matrix, inkjet and laser models. \<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.ghostscript.com" rel=3D"nore=
ferrer" target=3D"_blank">http://www.ghostscript.com</a>&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
<br>
-LICENSE =3D &quot;GPL-3.0-only&quot;<br>
+LICENSE =3D &quot;AGPL-3.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df98ffa763e50cded76f49=
bce73aade16&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;tiff jpeg fontconfig cups libpng freetype zlib&quot=
;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195040): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195040" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195040</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104214872/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104214872/1686489</a><br>
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

--0000000000003a844b0610c9072a--

