Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC551CCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:39:47 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.14435.1761914387059123078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 05:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YFIpDKn+;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso610423766b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761914385; x=1762519185; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ko3dOPqV/Ok++M5u34o1SI93owWEamZLx+88Tn8/iBE=;
        b=YFIpDKn+3VTqyQrwAdijZkrUx7Sfpapoygo8moZ8mndO5aVtWlsw3XRHTW01B4ght5
         bp0jOWwMtA++GThIlV3fA+v23Xezk9OvNOtLoNyK0unSKPQNfCJymjvCrrwLmKadrzOQ
         ZTyzKRMqlDhU/Dox1oRAu0lAkGsoJx0wItAqOduOGGDRGRQeXT+vrWsX1KN3h8GoSxuF
         21HXuRrxItZ0NQSAvz+KE0fOm21ZudoFjTjkpnMDSFWpZzuQIc+BtD7+qYxcue8gFWvp
         kP4nrwmPelNGesHfbbSyMp8yLaxE2XJ94ms23BIi3WP7Xg6pBNrcEQXTLRwNuLOUwlYP
         tk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914385; x=1762519185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko3dOPqV/Ok++M5u34o1SI93owWEamZLx+88Tn8/iBE=;
        b=fmoBYQqOqXXvjC6erD0LhDhc88ZFnXrhFv4w8RWJfDOJveVNAV8p/GERWTVU+VUKx8
         6S2HoL4LV9JD224kCZeSIQCTzEmWTcAjieCW0DAPD7iMRQ8wM5w2UdILHLRj6EDiMoaK
         k4+BkxuhBKMA7E7ScRNJdefLF0W0Gumy8HsGskfsNacdq7n/22GXq6vyvKCgSb9nlbcc
         Z8QFLwtwJd4lLBSgTVzcHYyceayl/4iXLI4fTrZwYD4y0WzkYwKufMUo02a+Qlxxxj5o
         w7AlR1BET8jcWsElLJhtmgHPPqgMVJKYKMh5Y/Cke2gKK35q4Msv+hFqakQKzQVECAjB
         hLQw==
X-Gm-Message-State: AOJu0Ywvl1McmsWCKsZ77w77Zpm5MDjMk15IsYM98zW7Yf8rojrFkgi5
	YrKBHfkeP544yim2z9xpbBB0jnePbh2x5uOepe3vlsIWQ3ATDzWKQUZ+lHvBNCkDpPVlCEMU7WW
	Zi4iKF1OeEGpZuaFghp0bJu8WAdp88G0=
X-Gm-Gg: ASbGnct/1jVIanW8vMQ+Nw8FY/aXdHhihGW+5E2svNMof2oxNpkJhgLKb9Evbc50RLU
	UiPOjb6c849tdO5xUnptPG5kgi+yPFPUJa/6GLF99SfoPxJtyNLEA7dhV8Inn5KdIm+RUbRoDrH
	ZA06HOCbIMHUsRq8GrkzwsZay8tRVU/j1WFw7i6s/OA79H6VYOCAe7Zx1ylFqsk7mC0gocRErm7
	Gndo2PINzLPXoiI1JklShv1RSMttHuVcirVi1H9hto/h3Q08L8StXooc1xV5SKkNnsyzISd
X-Google-Smtp-Source: AGHT+IE3KPODByW2+yZgzbzJGYp12uTSNseoUiVHDpUyKZqq2XH2uQKn99x05LAefwqnof1zhqxGMjvNcAkT9eeCRxI=
X-Received: by 2002:a17:906:6a21:b0:b3f:f6d:1d9e with SMTP id
 a640c23a62f3a-b7051f278acmr784376266b.6.1761914384998; Fri, 31 Oct 2025
 05:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251030193525.866305-1-joaohf@gmail.com>
In-Reply-To: <20251030193525.866305-1-joaohf@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 31 Oct 2025 12:39:33 +0000
X-Gm-Features: AWmQ_bnwRZCmg4C0eQbZk6oaX0EyHX26s8lJABc9K-8k4_2HYpBvA1mtecZTOxs
Message-ID: <CANPvuR=Bx7xYpC40Ci-vAGQH8z4cHFL+4siHt0=UFvDuYm=a8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] readline: backport a patch to fix for caller
 setting rl_prompt to NULL
To: joaohf@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000ae7e1064273a9e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 12:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225537

--0000000000000ae7e1064273a9e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jo=C3=A3o,

Jo=C3=A3o Henrique Ferreira de Freitas via lists.openembedded.org <joaohf=
=3D
gmail.com@lists.openembedded.org> escreveu (quinta, 30/10/2025 =C3=A0(s) 19=
:36):

> I've observed this issue affecting iwctl and connmanctl.
>
> Patching readline solves the issue.
>
> References:
>
> 1:
> https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/issu=
es/1
> 2:
> https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/comm=
it/b30636dc66fc783a091af51b049dc5240f861dd0
> 3: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
> 4:
> https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-fr=
ont.org/
>
> Fixes [YOCTO #16047]
>
> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> ---
>  ...for-caller-setting-rl_prompt-to-NULL.patch | 24 +++++++++++++++++++
>  meta/recipes-core/readline/readline_8.3.bb    |  5 ++--
>  2 files changed, 27 insertions(+), 2 deletions(-)
>  create mode 100644
> meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-N=
ULL.patch
>
> diff --git
> a/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to=
-NULL.patch
> b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to=
-NULL.patch
> new file mode 100644
> index 0000000000..7cc366079a
> --- /dev/null
> +++
> b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to=
-NULL.patch
> @@ -0,0 +1,24 @@
> +From 7c1019182f928ca05e794aecd06c33a27b7d07b1 Mon Sep 17 00:00:00 2001
> +From: kas User <kas@example.com>
>

Can you please use your name here too?

Jose

+Date: Thu, 30 Oct 2025 14:19:41 -0300
> +Subject: [PATCH] fix for caller setting rl_prompt to NULL
> +
> +Upstream-Status: Backport [
> https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=3D=
devel&id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd
> ]
> +Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> +---
> + display.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/display.c b/display.c
> +index 9aa8c7b..edb525d 100644
> +--- a/display.c
> ++++ b/display.c
> +@@ -783,7 +783,7 @@ _rl_optimize_redisplay (void)
> +
> + /* Useful shorthand used by rl_redisplay, update_line,
> rl_move_cursor_relative */
> + #define INVIS_FIRST() (local_prompt_invis_chars[0])
> +-#define WRAP_OFFSET(line, offset)  ((line <=3D prompt_last_screen_line)=
 ?
> local_prompt_invis_chars[line] : 0)
> ++#define WRAP_OFFSET(line, offset)  ((line <=3D prompt_last_screen_line =
&&
> local_prompt_invis_chars) ? local_prompt_invis_chars[line] : 0)
> +
> + #define W_OFFSET(line, offset) ((line) =3D=3D 0 ? offset : 0)
> + #define VIS_LLEN(l)   ((l) > _rl_vis_botlin ? 0 : (vis_lbreaks[l+1] -
> vis_lbreaks[l]))
> diff --git a/meta/recipes-core/readline/readline_8.3.bb
> b/meta/recipes-core/readline/readline_8.3.bb
> index a2f23eb353..8bc4477946 100644
> --- a/meta/recipes-core/readline/readline_8.3.bb
> +++ b/meta/recipes-core/readline/readline_8.3.bb
> @@ -1,7 +1,8 @@
>  require readline.inc
>
>  SRC_URI +=3D "file://norpath.patch \
> -            file://fix-for-readline-event-hook.patch \
> -            "
> +           file://fix-for-readline-event-hook.patch \
> +           file://fix-for-caller-setting-rl_prompt-to-NULL.patch \
> +           "
>
>  SRC_URI[archive.sha256sum] =3D
> "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225518):
> https://lists.openembedded.org/g/openembedded-core/message/225518
> Mute This Topic: https://lists.openembedded.org/mt/116036505/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000ae7e1064273a9e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jo=C3=A3o,</div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Jo=C3=A3o Henrique=
 Ferreira de Freitas via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;joaohf=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org">gmail.com@lists.openembedded.org</a>&gt; escreveu (quinta, 30/10/2=
025 =C3=A0(s) 19:36):<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">I&#39;ve observed this issue affecting iwctl and connmanctl.<br>
<br>
Patching readline solves the issue.<br>
<br>
References:<br>
<br>
1: <a href=3D"https://gitlab.archlinux.org/archlinux/packaging/packages/rea=
dline/-/issues/1" rel=3D"noreferrer" target=3D"_blank">https://gitlab.archl=
inux.org/archlinux/packaging/packages/readline/-/issues/1</a><br>
2: <a href=3D"https://gitlab.archlinux.org/archlinux/packaging/packages/rea=
dline/-/commit/b30636dc66fc783a091af51b049dc5240f861dd0" rel=3D"noreferrer"=
 target=3D"_blank">https://gitlab.archlinux.org/archlinux/packaging/package=
s/readline/-/commit/b30636dc66fc783a091af51b049dc5240f861dd0</a><br>
3: <a href=3D"https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00=
007.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archiv=
e/html/bug-readline/2025-07/msg00007.html</a><br>
4: <a href=3D"https://lore.kernel.org/connman/20251018212411.181909-1-jsbro=
nder@cold-front.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.ker=
nel.org/connman/20251018212411.181909-1-jsbronder@cold-front.org/</a><br>
<br>
Fixes [YOCTO #16047]<br>
<br>
Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas &lt;<a href=3D"mailto=
:joaohf@gmail.com" target=3D"_blank">joaohf@gmail.com</a>&gt;<br>
---<br>
=C2=A0...for-caller-setting-rl_prompt-to-NULL.patch | 24 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/readline/<a href=3D"http://readline_8.3.bb" rel=3D"=
noreferrer" target=3D"_blank">readline_8.3.bb</a>=C2=A0 =C2=A0 |=C2=A0 5 ++=
--<br>
=C2=A02 files changed, 27 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/readline/readline/fix-for-caller=
-setting-rl_prompt-to-NULL.patch<br>
<br>
diff --git a/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_=
prompt-to-NULL.patch b/meta/recipes-core/readline/readline/fix-for-caller-s=
etting-rl_prompt-to-NULL.patch<br>
new file mode 100644<br>
index 0000000000..7cc366079a<br>
--- /dev/null<br>
+++ b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-=
to-NULL.patch<br>
@@ -0,0 +1,24 @@<br>
+From 7c1019182f928ca05e794aecd06c33a27b7d07b1 Mon Sep 17 00:00:00 2001<br>
+From: kas User &lt;<a href=3D"mailto:kas@example.com" target=3D"_blank">ka=
s@example.com</a>&gt;<br></blockquote><div><br></div><div>Can you please us=
e your name here too?</div><div><br></div><div>Jose</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+Date: Thu, 30 Oct 2025 14:19:41 -0300<br>
+Subject: [PATCH] fix for caller setting rl_prompt to NULL<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.org/cg=
it/readline.git/commit/display.c?h=3Ddevel&amp;id=3D488d7edc22894d30b6de7f2=
d4190bf7403f63ffd" rel=3D"noreferrer" target=3D"_blank">https://cgit.git.sa=
vannah.gnu.org/cgit/readline.git/commit/display.c?h=3Ddevel&amp;id=3D488d7e=
dc22894d30b6de7f2d4190bf7403f63ffd</a>]<br>
+Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas &lt;<a href=3D"mailt=
o:joaohf@gmail.com" target=3D"_blank">joaohf@gmail.com</a>&gt;<br>
+---<br>
+ display.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/display.c b/display.c<br>
+index 9aa8c7b..edb525d 100644<br>
+--- a/display.c<br>
++++ b/display.c<br>
+@@ -783,7 +783,7 @@ _rl_optimize_redisplay (void)<br>
+ <br>
+ /* Useful shorthand used by rl_redisplay, update_line, rl_move_cursor_rel=
ative */<br>
+ #define INVIS_FIRST() (local_prompt_invis_chars[0])<br>
+-#define WRAP_OFFSET(line, offset)=C2=A0 ((line &lt;=3D prompt_last_screen=
_line) ? local_prompt_invis_chars[line] : 0)<br>
++#define WRAP_OFFSET(line, offset)=C2=A0 ((line &lt;=3D prompt_last_screen=
_line &amp;&amp; local_prompt_invis_chars) ? local_prompt_invis_chars[line]=
 : 0)<br>
+ <br>
+ #define W_OFFSET(line, offset) ((line) =3D=3D 0 ? offset : 0)<br>
+ #define VIS_LLEN(l)=C2=A0 =C2=A0((l) &gt; _rl_vis_botlin ? 0 : (vis_lbrea=
ks[l+1] - vis_lbreaks[l]))<br>
diff --git a/meta/recipes-core/readline/<a href=3D"http://readline_8.3.bb" =
rel=3D"noreferrer" target=3D"_blank">readline_8.3.bb</a> b/meta/recipes-cor=
e/readline/<a href=3D"http://readline_8.3.bb" rel=3D"noreferrer" target=3D"=
_blank">readline_8.3.bb</a><br>
index a2f23eb353..8bc4477946 100644<br>
--- a/meta/recipes-core/readline/<a href=3D"http://readline_8.3.bb" rel=3D"=
noreferrer" target=3D"_blank">readline_8.3.bb</a><br>
+++ b/meta/recipes-core/readline/<a href=3D"http://readline_8.3.bb" rel=3D"=
noreferrer" target=3D"_blank">readline_8.3.bb</a><br>
@@ -1,7 +1,8 @@<br>
=C2=A0require readline.inc<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://norpath.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-for-readline-event-ho=
ok.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-for-readline-event-hoo=
k.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-for-caller-setting-rl_=
prompt-to-NULL.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;fe5383204467828cd495ee8d1d3c037a=
7eba1389c22bc6a041f627976f9061cc&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225518): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225518" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225518</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116036505/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116036505/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000000ae7e1064273a9e2--

