Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC676CCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:04:18 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.19065.1761926652545063612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 09:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KNh3OzDs;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4736e043f9so416643366b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761926651; x=1762531451; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ubk1MfBONS3OfS+011H2J2KRKHHdQxOcGhvYHpobM0c=;
        b=KNh3OzDsc4BWv2VeA6+t59jUxWADlTyW0W0whfxspQcZTjk2+MSatxcvNx/OAhHNm5
         /HEVPxdOWkS0vR5hWPRVWgtAFelgQaumZete4j+BQghCNe6rTWhKbH5aaOd4d6R/mGGl
         6rZWTtS8ONWlhZA6HBbxhSRioT+Cp217MuQphbPBj2wOVAiyWpuKFY5I69MgePrkdyrE
         43Q+jHvBKNYkxwTfVBEN1j9iPPyC+HNmCu4J8vFEUOrt64OUUiRrkhT+TLV+KK761ROR
         +NGhmv/A0xVy/J8TwP0AktY7IqK4KnU/6q+sTdx+HEJiWWPLOr6ahWysLkt380usSCvL
         QSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761926651; x=1762531451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubk1MfBONS3OfS+011H2J2KRKHHdQxOcGhvYHpobM0c=;
        b=lmfkBgbV0ZnQ/taFLOQ94yeRy0e7AACef+VIxSVcgtAVhHxbm/RSsaXss7tACp4dWv
         R11oFXQPdoiZ8YrierhSnGswbr7HBvQI3vrEI5D78aeT0w6jG4UE1EE1NIwjO/K/vS5h
         97tjJ4RgXYba75V93WMb6AbbaZyjK/IH2MBZX5AUAHV7iKIV7laMWyhxSdlF+Vv2OuDm
         D3xe0RRpzVkjhWqcAJOOC5L//2plznx777+GuueMVIUfYKV7YJbxudp1zkoS7QGmnHCw
         4Tm+jbkTicvIauQMTjmn4osEmok1bHy+F6VYh6OMglCH8TK4n+06wB/GKC6w24RG1PBE
         Ke2Q==
X-Gm-Message-State: AOJu0Yy+0t4yZw/+29dY25oBZzsJw6I3zj1UicdKGhd7Rq/OeoPJwtku
	GrQ/X06XAZ5qdGUzFudFRkNeAJp4OrjgvWGh5uayWAEwZFwxErunTAI6QpmXMlPBm2UFc22VQht
	QOREVQFRi1qasJwz3bg+zK9hfGDjE2/CY+zrN
X-Gm-Gg: ASbGncttA5Pqbk5vJ8MfhKrUmTr30Fto4zbp9Nl/dzbWdO6rUneb6SPWr5yepqlTjoQ
	NnrL8dAZ9lkjFPQG70EGEeLs8h0rab/hNx65mIN5JP/P4MwGlo6vEe8SoZ4rHxs00E27fh/Y7HB
	m5sKTd4D0/8FEtkfBJXIZbhzqpK3fsWCZSpZCcT2BWgoWlJWtsQEz3JZjTciYtSgcx2IkveSHTY
	G77zOJFkq9fN6doEZKR1rMR7f9GZ6cQS7G0XoT2zgyt9YwQRUCdM6/7fw3X0A==
X-Google-Smtp-Source: AGHT+IEtfaixn+JZIQhp1GT2AnoFeP6ACFpK6l9NjGCiwG0HW5ikhkf+RxJQj9oNjkgg87lrKWNQsUQ9UjkAsJfsP/E=
X-Received: by 2002:a17:906:c144:b0:b47:de64:df1b with SMTP id
 a640c23a62f3a-b70704b27c8mr439337866b.39.1761926650277; Fri, 31 Oct 2025
 09:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251030193525.866305-1-joaohf@gmail.com> <187393CCE6182CD0.23165@lists.openembedded.org>
 <CANPvuRnHpGhyHGrwLGcAmZjqVnVXyA2hZHR9otvhS7__s+UjOA@mail.gmail.com> <CANFVK78YMUq2vgu0Aypa+ChjUBj4ncC1B5KM6jp3Jvas6=S2DA@mail.gmail.com>
In-Reply-To: <CANFVK78YMUq2vgu0Aypa+ChjUBj4ncC1B5KM6jp3Jvas6=S2DA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 31 Oct 2025 16:03:58 +0000
X-Gm-Features: AWmQ_bnNRxP7eEUJG3AYihhmT6jSn5qdAd7WSHflzkUehHJMxbpLyDCG14jhdXA
Message-ID: <CANPvuR=XDkVhwNoGfG=iyNNmzhFuN949qY_wz00RSMyzaizRaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] readline: backport a patch to fix for caller
 setting rl_prompt to NULL
To: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001c327a06427684f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 16:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225546

--0000000000001c327a06427684f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jo=C3=A3o Henrique Freitas <joaohf@gmail.com> escreveu (sexta, 31/10/2025 =
=C3=A0(s)
15:27):

> Hi Jos=C3=A9,
>
> I'll fix it. I totally missed those points. Thanks.
>
> So, the original patch is this one
> https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=3D=
devel&id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd
> but it looks it's a mix of 5 fixes, because the commit message says:
>
> fix for termcap on GNU Hurd; fix for caller setting rl_prompt to NULL; fi=
x
> for event hook not reading pending input; fix to accept 4-byte UTF-8
> characters beginning with 0xF4; fix for macros to include character searc=
h
> arguments; new function to read history from non-regular files
>
> Also, if we take a look here:
> https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
> mainly the patch that fix the readline issue for connmanctl/iwdctl is thi=
s
> one
> https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.txt
>
> That's why I took only that change.
>
> I'll send a v2 fixing author and explaining the reason. That why it will
> make it consistent.
>
> Thanks for reviewing it.
>

Nice! It will be easy for the maintainer with your above description.
Thanks


>
> On Fri, Oct 31, 2025 at 9:51=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com>
> wrote:
>
>>
>>
>> Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
>> gmail.com@lists.openembedded.org> escreveu (sexta, 31/10/2025 =C3=A0(s)
>> 12:39):
>>
>>> Hi Jo=C3=A3o,
>>>
>>> Jo=C3=A3o Henrique Ferreira de Freitas via lists.openembedded.org <joao=
hf=3D
>>> gmail.com@lists.openembedded.org> escreveu (quinta, 30/10/2025 =C3=A0(s=
)
>>> 19:36):
>>>
>>>> I've observed this issue affecting iwctl and connmanctl.
>>>>
>>>> Patching readline solves the issue.
>>>>
>>>> References:
>>>>
>>>> 1:
>>>> https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/i=
ssues/1
>>>> 2:
>>>> https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/c=
ommit/b30636dc66fc783a091af51b049dc5240f861dd0
>>>> 3:
>>>> https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
>>>> 4:
>>>> https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold=
-front.org/
>>>>
>>>> Fixes [YOCTO #16047]
>>>>
>>>> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.co=
m>
>>>> ---
>>>>  ...for-caller-setting-rl_prompt-to-NULL.patch | 24 ++++++++++++++++++=
+
>>>>  meta/recipes-core/readline/readline_8.3.bb    |  5 ++--
>>>>  2 files changed, 27 insertions(+), 2 deletions(-)
>>>>  create mode 100644
>>>> meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-t=
o-NULL.patch
>>>>
>>>> diff --git
>>>> a/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt=
-to-NULL.patch
>>>> b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt=
-to-NULL.patch
>>>> new file mode 100644
>>>> index 0000000000..7cc366079a
>>>> --- /dev/null
>>>> +++
>>>> b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt=
-to-NULL.patch
>>>> @@ -0,0 +1,24 @@
>>>> +From 7c1019182f928ca05e794aecd06c33a27b7d07b1 Mon Sep 17 00:00:00 200=
1
>>>> +From: kas User <kas@example.com>
>>>>
>>>
>>> Can you please use your name here too?
>>>
>>
>> Looking in the patch and you are not the author so can you please add th=
e
>> author?
>>
>>
>>>
>>> Jose
>>>
>>> +Date: Thu, 30 Oct 2025 14:19:41 -0300
>>>> +Subject: [PATCH] fix for caller setting rl_prompt to NULL
>>>> +
>>>> +Upstream-Status: Backport [
>>>> https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=
=3Ddevel&id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd
>>>> ]
>>>>
>>>
>> You need to explain the reason to only pick the changes for display.c an=
d
>> drop all the others.
>>
>>
>>> +Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.co=
m>
>>>> +---
>>>> + display.c | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/display.c b/display.c
>>>> +index 9aa8c7b..edb525d 100644
>>>> +--- a/display.c
>>>> ++++ b/display.c
>>>> +@@ -783,7 +783,7 @@ _rl_optimize_redisplay (void)
>>>> +
>>>> + /* Useful shorthand used by rl_redisplay, update_line,
>>>> rl_move_cursor_relative */
>>>> + #define INVIS_FIRST() (local_prompt_invis_chars[0])
>>>> +-#define WRAP_OFFSET(line, offset)  ((line <=3D prompt_last_screen_li=
ne)
>>>> ? local_prompt_invis_chars[line] : 0)
>>>> ++#define WRAP_OFFSET(line, offset)  ((line <=3D prompt_last_screen_li=
ne
>>>> && local_prompt_invis_chars) ? local_prompt_invis_chars[line] : 0)
>>>> +
>>>> + #define W_OFFSET(line, offset) ((line) =3D=3D 0 ? offset : 0)
>>>> + #define VIS_LLEN(l)   ((l) > _rl_vis_botlin ? 0 : (vis_lbreaks[l+1] =
-
>>>> vis_lbreaks[l]))
>>>>
>>>
>> The patch is also partial, two more changes are still missed.
>>
>> Jose
>>
>> diff --git a/meta/recipes-core/readline/readline_8.3.bb
>>>> b/meta/recipes-core/readline/readline_8.3.bb
>>>> index a2f23eb353..8bc4477946 100644
>>>> --- a/meta/recipes-core/readline/readline_8.3.bb
>>>> +++ b/meta/recipes-core/readline/readline_8.3.bb
>>>> @@ -1,7 +1,8 @@
>>>>  require readline.inc
>>>>
>>>>  SRC_URI +=3D "file://norpath.patch \
>>>> -            file://fix-for-readline-event-hook.patch \
>>>> -            "
>>>> +           file://fix-for-readline-event-hook.patch \
>>>> +           file://fix-for-caller-setting-rl_prompt-to-NULL.patch \
>>>> +           "
>>>>
>>>>  SRC_URI[archive.sha256sum] =3D
>>>> "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc"
>>>>
>>>>
>>>>
>>>>
>>>
>>> --
>>> Best regards,
>>>
>>> Jos=C3=A9 Quaresma
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#225537):
>>> https://lists.openembedded.org/g/openembedded-core/message/225537
>>> Mute This Topic: https://lists.openembedded.org/mt/116036505/5052612
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> quaresma.jose@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>
>
> --
> Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
> Campinas-SP-Brasil
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001c327a06427684f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Jo=C3=A3o Henri=
que Freitas &lt;<a href=3D"mailto:joaohf@gmail.com">joaohf@gmail.com</a>&gt=
; escreveu (sexta, 31/10/2025 =C3=A0(s) 15:27):<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Jos=C3=A9,</div><=
div><br></div><div>I&#39;ll fix it. I totally missed=C2=A0those points. Tha=
nks.</div><div><br></div><div>So, the original patch is this one=C2=A0<a hr=
ef=3D"https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?=
h=3Ddevel&amp;id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd" target=3D"_bla=
nk">https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=
=3Ddevel&amp;id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd</a> but it looks=
=C2=A0it&#39;s a mix of 5 fixes, because the commit message says:</div><div=
><br></div><div>fix for termcap on GNU Hurd; fix for caller setting rl_prom=
pt to NULL;=20
fix for event hook not reading pending input; fix to accept 4-byte UTF-8
 characters beginning with 0xF4; fix for macros to include character=20
search arguments; new function to read history from non-regular files</div>=
<div><br></div><div>Also, if we take a look here:=C2=A0<a href=3D"https://l=
ists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html" target=3D"_bl=
ank">https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html<=
/a> mainly the patch that fix the readline issue for connmanctl/iwdctl is t=
his one=C2=A0<a href=3D"https://lists.gnu.org/archive/html/bug-readline/202=
5-07/txtmA7rksnmmi.txt" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/bug-readline/2025-07/txtmA7rksnmmi.txt</a></div><div><br></div><div>That&=
#39;s why I took only that change.</div><div><br></div><div>I&#39;ll send a=
 v2 fixing author and explaining=C2=A0the reason. That why it will make it =
consistent.</div><div><br></div><div>Thanks for reviewing=C2=A0it.=C2=A0</d=
iv></div></blockquote><div><br>Nice! It will be easy for the maintainer wit=
h your above description.</div><div>Thanks</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 9:51=E2=80=AFAM J=
ose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blan=
k">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quares=
ma via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.op=
enembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; =
escreveu (sexta, 31/10/2025 =C3=A0(s) 12:39):<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Jo=C3=A3o,</div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jo=C3=A3o =
Henrique Ferreira de Freitas via <a href=3D"http://lists.openembedded.org" =
target=3D"_blank">lists.openembedded.org</a> &lt;joaohf=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openem=
bedded.org</a>&gt; escreveu (quinta, 30/10/2025 =C3=A0(s) 19:36):<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;ve observed this is=
sue affecting iwctl and connmanctl.<br>
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
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Jo=C3=A3o Henrique Ferreira de Freitas - <a href=3D"http://j=
oaohf_at_gmail.com" target=3D"_blank">joaohf_at_gmail.com</a><br>Campinas-S=
P-Brasil</div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000001c327a06427684f3--

