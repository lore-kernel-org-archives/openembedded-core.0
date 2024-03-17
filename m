Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E438C54E60
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 14:37:27 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web10.19941.1710686245999244184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 07:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0WzKmKj;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: rwmacleod@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7e058305935so323646241.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710686245; x=1711291045; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gEd7c5Gm6l6jc5rfbGxQA95JrM4c5AaXF0rS1GU6/H4=;
        b=D0WzKmKjw6yCmQ3XydJQr75Ntmb8gqByuHsgUU2fTTyqcebuwazyOhoNhi/GVtHqGY
         IELedzJ7wD8Xj1+u2MO/duiMZIjzyBO6edYm+VPrk4XB4oNLF2PzTd1nAa00lkdqFjrz
         ajn4CTl00u9RJQ1Kx+S/oPvLvbLrGTMBSomHSTf84EYkbAmv8JPJqOsJEnutlx4qU0vq
         RGRSShwvR1IqC4+OOxuvieTvhA1p5H2dQTay/DSLOpF+YfrjhmYV6zO9NmIH/8L2jR57
         hmujC3UE1Z462zz4GM8kedd1iFufqScZnRNuF1k5VcADu587UCFOBco4MjnoFXuD1Eko
         He2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710686245; x=1711291045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEd7c5Gm6l6jc5rfbGxQA95JrM4c5AaXF0rS1GU6/H4=;
        b=wsv18c8Uc2A8gEbYXQ7Fic4dVRUIWfmg57dRC5/UMgSG1QZBlZP1BRWPhSH+/5IxkN
         wMMqF84Vu7AACFmyOG49coBL0OzlDddrUk6SJb8Yrn6ysm4baZDOXliOJgfecOpfJiq1
         9WCw3Au8WPwNq5/diaRNyc4zauE0STmuChvbM/FhzwvfDekVdMF7lyK39ufuG1G/1Id5
         jkr6JvQBtWFipjqmZhzCStZWpjnrZDxPfCPcJvFFtB/feGqz+cH08S6RXD6bsfiyx2Dj
         CeHUJc+nWnKOjnGgpncdtpPUMqSW3G1RVbvTUXAfMxI6gwCtBhiGY9QZR1pPfW9LQDZ+
         2dcw==
X-Gm-Message-State: AOJu0Yyxu90wAJhH+vSfZqkwPXS7tTGXATQYIhbkbc+2ILpozl9L8Spm
	SoCuwPj0HQVlJs1cXhbVlekFOeuZ8RYbkLvgC1OK3NI2ETE7pSWLnj49NoN7XP20QYrEB3S+UpE
	Yl2jT9A89tcLClHmcHMoX0BbHuFE=
X-Google-Smtp-Source: AGHT+IHFZVdih7YEmG+khb38Ut6OxmAQqh2AK+XtrJdZOMlcl6QHa8zUTNCMlQsfwMR8HHc5ttqcUx+btZNPSV8skbI=
X-Received: by 2002:a67:ff95:0:b0:474:c573:6ce5 with SMTP id
 v21-20020a67ff95000000b00474c5736ce5mr6584373vsq.1.1710686244916; Sun, 17 Mar
 2024 07:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240317120138.180013-1-martin.jansa@gmail.com>
In-Reply-To: <20240317120138.180013-1-martin.jansa@gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Sun, 17 Mar 2024 10:37:14 -0400
Message-ID: <CAK6=ix7A-RfJ4b9gkFvwu8LYCvNW6Uj9ff1ZqvJBGQ0A6xCORg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] stress-ng: avoid calling sync during do_compile
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000f357300613dc2dc5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 14:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197264

--000000000000f357300613dc2dc5
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 17, 2024, 08:01 Martin Jansa <martin.jansa@gmail.com> wrote:

> calling 'sync' from do_compile in the middle of big OE world
> build harms the build time.
>

No objection from me but do you have a any data on how much an innocuous
call to sync slows down a build?

Randy


> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../0001-Makefile-avoid-calling-sync.patch    | 35 +++++++++++++++++++
>  .../stress-ng/stress-ng_0.13.12.bb            |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644
> meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch
>
> diff --git
> a/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch
> b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch
> new file mode 100644
> index 0000000000..fec8c524eb
> --- /dev/null
> +++
> b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid-calling-sync.patch
> @@ -0,0 +1,35 @@
> +From 1d1801902a4944c6f5fa521c19b32fbac7342a0c Mon Sep 17 00:00:00 2001
> +From: Colin Ian King <colin.i.king@gmail.com>
> +Date: Sat, 6 Aug 2022 13:05:59 +0000
> +Subject: [PATCH] Makefile: avoid calling sync
> +
> +Original commit message:
> +Makefile: use ld-gold if it is available
> +
> +Speed up linking by using ld-gold if is available. Add build
> +time detection to see if compiler allows it
> +
> +MJ: backported only the "sync" removal from Makefile as calling
> +    it from do_compile in the middle of big OE world build harms
> +    the build time.
> +
> +Upstream-Status: Backport [V0.14.04
> c10e5c3f9f5560a085279f4c4b399c2f34cb897d]
> +
> +Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + Makefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index f8f71c54b..23db4c612 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -425,7 +425,6 @@ OBJS += $(CONFIG_OBJS)
> + stress-ng: $(OBJS)
> +       $(Q)echo "LD $@"
> +       $(V)$(CC) $(CPPFLAGS) $(CFLAGS) $(OBJS) -lm $(LDFLAGS) -o $@
> +-      $(V)sync
> +
> + config.h:
> +       +$(MAKE) -f Makefile.config STATIC=$(STATIC) -j
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
> b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
> index 807ecd3466..72dafddaf8 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "git://
> github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
>
> file://0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch \
> +           file://0001-Makefile-avoid-calling-sync.patch \
>            "
>  SRCREV = "f59bcb2fe1e25042e77d5e4942f72bfa026fa305"
>  S = "${WORKDIR}/git"
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197260):
> https://lists.openembedded.org/g/openembedded-core/message/197260
> Mute This Topic: https://lists.openembedded.org/mt/104982006/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f357300613dc2dc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Mar 17, 2024, 08:01 Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">calling &#39;sync&#39; from do_compil=
e in the middle of big OE world<br>
build harms the build time.<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">No objection from me but do you have a any data =
on how much an innocuous call to sync slows down a build?</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Randy</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Makefile-avoid-calling-sync.patch=C2=A0 =C2=A0 | 35 ++++++++=
+++++++++++<br>
=C2=A0.../stress-ng/<a href=3D"http://stress-ng_0.13.12.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">stress-ng_0.13.12.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/stress-ng/stress-ng-0.13.12/=
0001-Makefile-avoid-calling-sync.patch<br>
<br>
diff --git a/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefil=
e-avoid-calling-sync.patch b/meta/recipes-extended/stress-ng/stress-ng-0.13=
.12/0001-Makefile-avoid-calling-sync.patch<br>
new file mode 100644<br>
index 0000000000..fec8c524eb<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-Makefile-avoid=
-calling-sync.patch<br>
@@ -0,0 +1,35 @@<br>
+From 1d1801902a4944c6f5fa521c19b32fbac7342a0c Mon Sep 17 00:00:00 2001<br>
+From: Colin Ian King &lt;<a href=3D"mailto:colin.i.king@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">colin.i.king@gmail.com</a>&gt;<br>
+Date: Sat, 6 Aug 2022 13:05:59 +0000<br>
+Subject: [PATCH] Makefile: avoid calling sync<br>
+<br>
+Original commit message:<br>
+Makefile: use ld-gold if it is available<br>
+<br>
+Speed up linking by using ld-gold if is available. Add build<br>
+time detection to see if compiler allows it<br>
+<br>
+MJ: backported only the &quot;sync&quot; removal from Makefile as calling<=
br>
+=C2=A0 =C2=A0 it from do_compile in the middle of big OE world build harms=
<br>
+=C2=A0 =C2=A0 the build time.<br>
+<br>
+Upstream-Status: Backport [V0.14.04 c10e5c3f9f5560a085279f4c4b399c2f34cb89=
7d]<br>
+<br>
+Signed-off-by: Colin Ian King &lt;<a href=3D"mailto:colin.i.king@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">colin.i.king@gmail.com</a>&gt;<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">martin.jansa@gmail.com</a>&gt;<br>
+---<br>
+ Makefile | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index f8f71c54b..23db4c612 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -425,7 +425,6 @@ OBJS +=3D $(CONFIG_OBJS)<br>
+ stress-ng: $(OBJS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)echo &quot;LD $@&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(V)$(CC) $(CPPFLAGS) $(CFLAGS) $(OBJS) -lm $(L=
DFLAGS) -o $@<br>
+-=C2=A0 =C2=A0 =C2=A0 $(V)sync<br>
+ <br>
+ config.h:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0+$(MAKE) -f Makefile.config STATIC=3D$(STATIC) =
-j<br>
diff --git a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.=
13.12.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">stress-ng_0.13.12=
.bb</a> b/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.13.=
12.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">stress-ng_0.13.12.bb=
</a><br>
index 807ecd3466..72dafddaf8 100644<br>
--- a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.13.12.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">stress-ng_0.13.12.bb</a>=
<br>
+++ b/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.13.12.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">stress-ng_0.13.12.bb</a>=
<br>
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/ColinIanKing/str=
ess-ng.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer" =
target=3D"_blank">github.com/ColinIanKing/stress-ng.git;protocol=3Dhttps;br=
anch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-stress-cpu-disable-fl=
oat128-math-on-powerpc64-to-avo.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile-avoid-callin=
g-sync.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;f59bcb2fe1e25042e77d5e4942f72bfa026fa305&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197260): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197260" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/197260</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104982006/953=
399" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/104982006/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000f357300613dc2dc5--

