Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E148CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 09:56:15 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11892.1781690172994810544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 02:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F4zGu0GZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ce9df31130so82045816d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 02:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781690172; cv=none;
        d=google.com; s=arc-20240605;
        b=lUXqVvdUDcx/ar+UdaGzW9Dm491qIn6UFZO7KOv9ViGMbEZUtM1/LTflDaYZ3cf9PD
         pR1UhAkjlKbh9rO4HgTKiWp5gbxl9OvTi6CjFDJ3/Qcyy7CseRRHRvLtKGB0okf/2eb/
         8US0vFDlu7AzMcCk7w2a1tyK2pWUVx3iFlA0RCdHuRBWNVbehlsd+cC7seD5yi7Wku0R
         h2uvu+3ILuiPWAkDR2WeAXKwC/+CiP3RkdBmgK+Ur+Wj8jCcKivarTgVKzecKYZVmi0R
         iFb0br4vc34IVdflGcLJDOzLTx8zDXtU22DltC/7stv+/aRpXkA8/FyGUe7vxE1RMphk
         1FXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tQu7RCEcp904zk+S//G0TKPg4JGBeBMRyi6PaeO4iNs=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=k+y0k7TJRLhSowJ/IHp4tNDQ0SNUyRsFMoRIBfMOqT0LSTMziSTbRYhHF3T0Tlla7K
         RcmRaP+J74yKEqFSnZ4GA+u7wT31byyO2/nmudgpVM47/N683Y2sc9CDPvimt/scFx78
         lWuPVLzXuC6GgTjsUtAarsUEVrzK33b9MA8H46HJv2QSsKpHjnIi8mehIK7tw+43oCYJ
         nthxnVjyWldEZMbC4kXV6caiMMP9pjPluEXrlb744L/62RSVAukfZ3zHDKizam1lL28P
         DSiPVOTuGqGS4HAw+KXfNBMPmjU32m01bSIV211HPXeNwWxog/fftIhWajDYXKGsTq47
         yMxw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781690172; x=1782294972; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tQu7RCEcp904zk+S//G0TKPg4JGBeBMRyi6PaeO4iNs=;
        b=F4zGu0GZRAyI8hIAZcCO055fN2TvzcWYLM4KdIp0Y4mGB5FT0yyZplyqFSM+KN7oiV
         h5tnUK4U73jnwo0gftDJDpnZVlmA3ZjnFEh4me0XBIwXqFf3QUzCZbv79D4NOuZ8tidJ
         unrzt74EfvsdNozBb3qGaJUvofUqgEYdo8TEPTSfYslHo0hILpXUxOmA0wtcHbUaMszO
         EP2O9u3ME5KBPFVUXhgNx1jznCOFnsHUEFhIhK0XIVXStQbdHTilaejZy1lmm59uKD3m
         q5vloPlYNSr4c3dh8g1S7Azpba87FQ332Q+cOFhvodKHVmB6EiiBBFOrg2kzpT8bICg9
         /hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690172; x=1782294972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQu7RCEcp904zk+S//G0TKPg4JGBeBMRyi6PaeO4iNs=;
        b=hprkrQvtxQg3n9wcp7YUuGCNYHRn6O+DeY/ZSefxjcOHGIaKarPqAyaaW4LDiBJusc
         MYSyPPyoifMSyQt+2MArYMZe/9zxqYC/cU7ectTJzjwa+mVM0HALgh0MrGJ76Yy84qKd
         9pFc27ql2zJz9MRwM03dQBHNOWPY9JWaL+l1hq+drhSXvpkYArIntOHq3+jN9AGeh7fa
         CbWohoPllCVRS7uT6kc1pJBic7Wprm6vo8HnSj+Kt7Jaf8Z5uhXtk+/YL9wxjWYYZyVm
         2iwRqDk0v96SBNYydL6izp+R4e13RTirGUVFzPiVn22xBKcmY8EHVEYG7iySqqVGRZef
         TFww==
X-Gm-Message-State: AOJu0YxyPFjTK09Upk1wWcg6wuzo9BnSE+KeuIFgYo3SNRrUfkOdY8RF
	lvBTg1Fh0w4izh/t3T9ExbWexcHP3WYJYQccyqoCSTTn7DCQkw5uB0BgrR4yb3EKHqTMg5s/QO2
	7lIGG2yobwatxU5oXqm+IeTa5XNiDhvl/UA==
X-Gm-Gg: AfdE7cmC4tQwywSu06yYYipsTv5oN1LtJluuNbRdGoEVPs0CBXum9CyF/p2hYtg15Za
	RUcYNVhXABwUZkY1Rn5MjF8OByANOUC2UPC32hREeQnKxBnXh3YrtqIwk0/A/Iu7H+OF4kv7c3C
	QxDXdncDqdwv9mJZB8WdXKBX847VUQPUZvEDmyK02r/jgUW1GPi6JRYhp7QPbGUu/MVI+kvZFKV
	tgLhET4lbSCaiGy8L8+selQESAur6S/0OBZfN2tXzvELZD9viYV1YNsPhQE4RZgZDzcxhixx3oW
	yzXg+MX4xNn22jbTzqnKrhmfQNE=
X-Received: by 2002:ad4:4353:0:b0:8ce:b4aa:9caf with SMTP id
 6a1803df08f44-8db5b7ad845mr46799946d6.18.1781690171768; Wed, 17 Jun 2026
 02:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260617093224.56557-1-ross.burton@arm.com>
In-Reply-To: <20260617093224.56557-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Jun 2026 11:56:00 +0200
X-Gm-Features: AVVi8CfNjvoUc8G8B-YYsCSluQl3WyNA_MNyk_eE73vCq70dBA8SFnV-tTT7Ggg
Message-ID: <CANNYZj_kKi4sVZKLt2m6AT17CmFuSxx9YBKq2jk_yKvPkaACAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libaio: update SRC_URI
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c9c45206547011dc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 09:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239027

--000000000000c9c45206547011dc
Content-Type: text/plain; charset="UTF-8"

Are there other Pagure items in core?

Alex

On Wed 17. Jun 2026 at 11.32, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:

> libaio has moved to Codeberg as pagure.io will be closed down shortly.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-extended/libaio/libaio_0.3.113.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb
> b/meta/recipes-extended/libaio/libaio_0.3.113.bb
> index 2392fd5db23..5f4c5547a11 100644
> --- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
> +++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
>  LICENSE = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
>
> -SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
> +SRC_URI = "git://
> codeberg.org/jmoyer/libaio.git;protocol=https;branch=master;tag=${BP}
> <http://codeberg.org/jmoyer/libaio.git;protocol=https;branch=master;tag=$%7BBP%7D>
> \
>             file://00_arches.patch \
>             file://libaio_fix_for_mips_syscalls.patch \
>             file://system-linkage.patch \
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239025):
> https://lists.openembedded.org/g/openembedded-core/message/239025
> Mute This Topic: https://lists.openembedded.org/mt/119848149/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c9c45206547011dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Are there other Pagure items in core?</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Alex=C2=A0</div><div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
 17. Jun 2026 at 11.32, Ross Burton via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.c=
om@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">libaio has moved t=
o Codeberg as <a href=3D"http://pagure.io" rel=3D"noreferrer" target=3D"_bl=
ank">pagure.io</a> will be closed down shortly.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/libaio/<a href=3D"http://libaio_0.3.113.bb" rel=
=3D"noreferrer" target=3D"_blank">libaio_0.3.113.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/libaio/<a href=3D"http://libaio_0.3.113.=
bb" rel=3D"noreferrer" target=3D"_blank">libaio_0.3.113.bb</a> b/meta/recip=
es-extended/libaio/<a href=3D"http://libaio_0.3.113.bb" rel=3D"noreferrer" =
target=3D"_blank">libaio_0.3.113.bb</a><br>
index 2392fd5db23..5f4c5547a11 100644<br>
--- a/meta/recipes-extended/libaio/<a href=3D"http://libaio_0.3.113.bb" rel=
=3D"noreferrer" target=3D"_blank">libaio_0.3.113.bb</a><br>
+++ b/meta/recipes-extended/libaio/<a href=3D"http://libaio_0.3.113.bb" rel=
=3D"noreferrer" target=3D"_blank">libaio_0.3.113.bb</a><br>
@@ -5,7 +5,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://lse.sourceforge.net/io=
/aio.html" rel=3D"noreferrer" target=3D"_blank">http://lse.sourceforge.net/=
io/aio.html</a>&quot;<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd8045f3b8f929c1cb29a1=
e3fd737b499&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://pagure.io/libaio.git;protocol=3D=
https;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">pagure.io/libai=
o.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://codeberg.org/jmoyer/libaio.git;p=
rotocol=3Dhttps;branch=3Dmaster;tag=3D$%7BBP%7D" rel=3D"noreferrer" target=
=3D"_blank">codeberg.org/jmoyer/libaio.git;protocol=3Dhttps;branch=3Dmaster=
;tag=3D${BP}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00_arches.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libaio_fix_for_mips_syscal=
ls.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://system-linkage.patch \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239025): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239025" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239025</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119848149/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119848149/1686489</a><br>
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

--000000000000c9c45206547011dc--

