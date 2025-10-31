Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C76CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:51:17 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.14656.1761915075228359972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 05:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mYPd3vGy;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso476375266b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915073; x=1762519873; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K1qNxYmHbDocHlDCrbjqiMiHAPM5q1oOVkbIg9b5CTo=;
        b=mYPd3vGyfcsvdQcMaYBQN3IFfkJ+Db86XTu8xKEgv3vRmXBiuqwX9eq17THgvulEu+
         YfGMkVnEGxum4YbtG+hEOsJ3jrrMidljSqlRIYL9lRHAn8l4yrHSn3ScDvWARODI5L3j
         1j8j1x4OyHxEaS2v+z/ljmr4p5KsokOMOUKqJK1HtajoCIOYvD4+pD8ZrQW6LFP2dy80
         KtSJM8r4+pgLHnG4NVwTxIyUcyOmAK5JzK2oi8VZdBM8r02RKNcx+bWzIjgC0oYo8vV+
         rlUIPqiJCVl0mE1MXy/U+utjcA6hkYY9Wct8I+22rr/GB78Tc9YNd3wewUlfnHL29482
         B8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915073; x=1762519873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1qNxYmHbDocHlDCrbjqiMiHAPM5q1oOVkbIg9b5CTo=;
        b=OCP+kuwl5rz/qkcvi+UAu/ZD6Cz3Cyog8yFtW4mzM0i93OIFGre/MpMfNbFJIQlDYb
         U8jFV0zYVr+ic7dtUowzA5NF7ENcCbltXU0WflNwor0JOOVcMw/X8NIJLt69tQ3TBf54
         3DzSrGXt+xZORLvlESw4FpqZ2e7kyNNkz9Jp/HZQ1L2xAuFob+gQujVq3lOGsTBPGBRu
         Wgjn4dwH79q6Rei/RmisvpqJr4ShiwP0pLy7HYwgHQMdlxw66O7HKL/pmto/j4Ajo2X0
         fJF3hvJLo0Uf4aEWyRpNEBiaDUm4dmfjzNVLwipMz0q/K+FbitZaCR/u18CNew9sY6eC
         qL6w==
X-Forwarded-Encrypted: i=1; AJvYcCWZMXOQUwzBz7KqTV9oh/ETBplbycXPuAInjBJXRJ74G/YNLnRtdQeLJdDL8+w168Iqk9q9W82NYFapTS7zT43D4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/jblbvsp3e/rG1rux4JqcMTuaqQyaRlpHGaEyEwe+BWuH8k//
	kbBZ9yLnn9XKExda63rrrgUUM8knRvROS+46G+ld9iUoWL4dxCUERGoFtdxI7eowoZAxyK9kX8G
	QSvuinPEoPdPmGJxlq22ng8Q9vpxmIDI=
X-Gm-Gg: ASbGncswa3gxaKioawgUMN59kyZb3bk25ZeIdOQYVvQhMP2BVhrmxvpgyJZSTXQ8BnD
	uCnr7Hf2pOiRcxXOYqiLAccIkak3Cu8GCBHpAYF3H8AZyyiJNLc/FrAC1B3W5iPrAal4IdAK0Wt
	fA6kjQJv1sHJvnNv8SoC5AsmQQDbV3VHmPwUXYoWjLM0u+2OCqstfW0CxAa3FmaEtXYdkkhdKwY
	uOzk26PDcyYiMsgeS7MwGv9/A5yvvowfTl0Z01/YfA0lG/U/HddfZ23A2VE89rW9nckjOrY
X-Google-Smtp-Source: AGHT+IFEj4UffvtDNUArHBuOrANfIa8IAYEeVlVMBhyiWRLP7MgKH8ThXAS8xbUZSDU5sYDYPPTdX+P6QXwGgI0u1QQ=
X-Received: by 2002:a17:907:1c27:b0:b46:31be:e8f0 with SMTP id
 a640c23a62f3a-b70700b58a0mr383649866b.3.1761915072454; Fri, 31 Oct 2025
 05:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251030193525.866305-1-joaohf@gmail.com> <187393CCE6182CD0.23165@lists.openembedded.org>
In-Reply-To: <187393CCE6182CD0.23165@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 31 Oct 2025 12:51:01 +0000
X-Gm-Features: AWmQ_blWMgCtOiYb752OVJ_RIW4VdQ9MjGRx76FGMajkkz9R1vMlSM2wroxNs0A
Message-ID: <CANPvuRnHpGhyHGrwLGcAmZjqVnVXyA2hZHR9otvhS7__s+UjOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] readline: backport a patch to fix for caller
 setting rl_prompt to NULL
To: quaresma.jose@gmail.com
Cc: joaohf@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000004ab8b064273d27f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 12:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225539

--00000000000004ab8b064273d27f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (sexta, 31/10/2025 =C3=A0(s) 12:=
39):

> Hi Jo=C3=A3o,
>
> Jo=C3=A3o Henrique Ferreira de Freitas via lists.openembedded.org <joaohf=
=3D
> gmail.com@lists.openembedded.org> escreveu (quinta, 30/10/2025 =C3=A0(s)
> 19:36):
>
>> I've observed this issue affecting iwctl and connmanctl.
>>
>> Patching readline solves the issue.
>>
>> References:
>>
>> 1:
>> https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/iss=
ues/1
>> 2:
>> https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/com=
mit/b30636dc66fc783a091af51b049dc5240f861dd0
>> 3: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
>> 4:
>> https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-f=
ront.org/
>>
>> Fixes [YOCTO #16047]
>>
>> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
>> ---
>>  ...for-caller-setting-rl_prompt-to-NULL.patch | 24 +++++++++++++++++++
>>  meta/recipes-core/readline/readline_8.3.bb    |  5 ++--
>>  2 files changed, 27 insertions(+), 2 deletions(-)
>>  create mode 100644
>> meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-=
NULL.patch
>>
>> diff --git
>> a/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-t=
o-NULL.patch
>> b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-t=
o-NULL.patch
>> new file mode 100644
>> index 0000000000..7cc366079a
>> --- /dev/null
>> +++
>> b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-t=
o-NULL.patch
>> @@ -0,0 +1,24 @@
>> +From 7c1019182f928ca05e794aecd06c33a27b7d07b1 Mon Sep 17 00:00:00 2001
>> +From: kas User <kas@example.com>
>>
>
> Can you please use your name here too?
>

Looking in the patch and you are not the author so can you please add the
author?


>
> Jose
>
> +Date: Thu, 30 Oct 2025 14:19:41 -0300
>> +Subject: [PATCH] fix for caller setting rl_prompt to NULL
>> +
>> +Upstream-Status: Backport [
>> https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=
=3Ddevel&id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd
>> ]
>>
>
You need to explain the reason to only pick the changes for display.c and
drop all the others.


> +Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
>> +---
>> + display.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/display.c b/display.c
>> +index 9aa8c7b..edb525d 100644
>> +--- a/display.c
>> ++++ b/display.c
>> +@@ -783,7 +783,7 @@ _rl_optimize_redisplay (void)
>> +
>> + /* Useful shorthand used by rl_redisplay, update_line,
>> rl_move_cursor_relative */
>> + #define INVIS_FIRST() (local_prompt_invis_chars[0])
>> +-#define WRAP_OFFSET(line, offset)  ((line <=3D prompt_last_screen_line=
) ?
>> local_prompt_invis_chars[line] : 0)
>> ++#define WRAP_OFFSET(line, offset)  ((line <=3D prompt_last_screen_line=
 &&
>> local_prompt_invis_chars) ? local_prompt_invis_chars[line] : 0)
>> +
>> + #define W_OFFSET(line, offset) ((line) =3D=3D 0 ? offset : 0)
>> + #define VIS_LLEN(l)   ((l) > _rl_vis_botlin ? 0 : (vis_lbreaks[l+1] -
>> vis_lbreaks[l]))
>>
>
The patch is also partial, two more changes are still missed.

Jose

diff --git a/meta/recipes-core/readline/readline_8.3.bb
>> b/meta/recipes-core/readline/readline_8.3.bb
>> index a2f23eb353..8bc4477946 100644
>> --- a/meta/recipes-core/readline/readline_8.3.bb
>> +++ b/meta/recipes-core/readline/readline_8.3.bb
>> @@ -1,7 +1,8 @@
>>  require readline.inc
>>
>>  SRC_URI +=3D "file://norpath.patch \
>> -            file://fix-for-readline-event-hook.patch \
>> -            "
>> +           file://fix-for-readline-event-hook.patch \
>> +           file://fix-for-caller-setting-rl_prompt-to-NULL.patch \
>> +           "
>>
>>  SRC_URI[archive.sha256sum] =3D
>> "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc"
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225537):
> https://lists.openembedded.org/g/openembedded-core/message/225537
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

--00000000000004ab8b064273d27f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.=
com@lists.openembedded.org</a>&gt; escreveu (sexta, 31/10/2025 =C3=A0(s) 12=
:39):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>Hi Jo=C3=A3o,</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Jo=C3=A3o Henrique Ferreira de Freitas via <a hr=
ef=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.o=
rg</a> &lt;joaohf=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu (quinta, 3=
0/10/2025 =C3=A0(s) 19:36):<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">I&#39;ve observed this issue affecting iwctl and connmanctl.<br=
>
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
e your name here too?</div></div></div></blockquote><div><br></div><div>Loo=
king=C2=A0in the patch and you are not the author so can you please add the=
 author?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Jose<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+Date: Thu, 30 Oct 2025 14:19:41 -0300<br>
+Subject: [PATCH] fix for caller setting rl_prompt to NULL<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.org/cg=
it/readline.git/commit/display.c?h=3Ddevel&amp;id=3D488d7edc22894d30b6de7f2=
d4190bf7403f63ffd" rel=3D"noreferrer" target=3D"_blank">https://cgit.git.sa=
vannah.gnu.org/cgit/readline.git/commit/display.c?h=3Ddevel&amp;id=3D488d7e=
dc22894d30b6de7f2d4190bf7403f63ffd</a>]<br></blockquote></div></div></block=
quote><div><br></div><div>You need to explain the reason to only pick the c=
hanges for display.c and drop all the others.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
ks[l+1] - vis_lbreaks[l]))<br></blockquote></div></div></blockquote><div><b=
r></div><div>The patch is also partial, two more changes are still missed.<=
/div><div><br></div><div>Jose</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
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
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225537): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225537" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225537</a><br>
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

--00000000000004ab8b064273d27f--

