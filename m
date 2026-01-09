Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33846D1A631
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:59:39 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10513.1767967169838825817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYENmoJF;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so2550082a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 05:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767967169; x=1768571969; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l8deXwY6b33y82cFl6uRKO0LuGxttkLNtCIfI9Oj4pI=;
        b=jYENmoJF9mcTLIVq2pPICloFaiz0MMRnCxW6hehgiiLESwlRJJ+p9V89qhQx/Fcwh/
         r2r0TMhJJLRSHwm+5wQe3O2KaYBBkzCxn7DJApXdaznYlWrZFd69vF5Fqju8L9auL03N
         eNDlPfkJH0ExNAHKG5q2AN2kxh1kTgadHFC9yCsG/eBNzk8DkXEdpBRlQahVBqlxMncf
         LgsUcvg8UIHFxDeeYwcI8R9qJuopnM1u3YKIqmhG9pb51UKJ5ws6zoRpmpzFhGDFfmvl
         XZgmuUHyXf+3d/7mv1T7f5J+c0xDCZy+ccoZbwNgRbspz+00wKWkDIUgPEMCDMBmGSYg
         2Gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767967169; x=1768571969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8deXwY6b33y82cFl6uRKO0LuGxttkLNtCIfI9Oj4pI=;
        b=a/uVlceWPt6Ui6y1kBevVvA7tB/XEgZ4GCPGbO99d567mRXWyVKsO7bxRcGR1HXx+k
         Gmo4uyzOKpANITiz+2pWhuMV6Wq1UHbStjS04RbumIPktbC2JyVGD9wbAT6YgFULGO59
         oVcXavSIadiLhvETnvgSyv94yJW9NxzLap1BgeizoXoGOxu7XwvPihigUlWCnkjea8lD
         R9Q/9otKh9j0D4iPVDhK4yOISIFJqGr5VNyevOIxikDcOd0HedbAkySvjpYifX1dlXUl
         FUK54Ig0G2Gd+K6Cp1Evnb4TfmLUvuIRvKA4fG9cwdFcyuOVfY4pRmGBWUggTL7BKXFi
         O/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmvbdSMyfcmeya6GdTckuLCx8gpAZsOX/YbzTzaozDBZISAGYUpk7VVZX3yDFx9N5tNhvY6vGdwCnmsdwCSxYTyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjAtG9ux/DYdHaYQ3f/YOnTGnHxMoU14mb1OUbrWI0xJOVl4HN
	LjMfrYLZTvNO6C1HOmgLs6jf3DxYQwB1OcKHM31KW67Dl2ZAfE7bjE0qraTEPzPmZKZcsTqszpx
	CGlU5No3jj3OmfZBH5fz+dBfAW72ScL0=
X-Gm-Gg: AY/fxX776QK6uqV1AuYsKk0a9G6KHM/q+yHtcJCTeH8THz36saWNe/BBHAqC9pIRjES
	fmKc7zh0rJ7/lBpY0NI2yTYydCcI6oSTk8nFlVecACXEhIfEUYAJPtP+t3RIvTtFHqA3+fa2Kyx
	Xul8bXFsgC22/EX3XSRwUdU4TEhLzWvlmYTUGI5H0cchuFnpngtPQ9/IcTugw9TPjN7PU9C/KJ+
	XmyDnj0ny7gdq8TjLHgWgDTaaGKys2mrQ8+R6YxS1j+7wbHtinyvLo93GkIOx871cMRIzMI
X-Google-Smtp-Source: AGHT+IGdVPTU+hgIoB5PNkaYG8jtY0qCDUabiHC+pBwT4st5lsqEYkqhhHdRx46xVe9l9mLyswKssDZf4Ba4FblHi/c=
X-Received: by 2002:a17:90b:1643:b0:340:bc27:97b8 with SMTP id
 98e67ed59e1d1-34f68c4ffd5mr8932993a91.10.1767967169004; Fri, 09 Jan 2026
 05:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20260109045447.1933604-1-alistair.francis@wdc.com>
 <20260109045447.1933604-2-alistair.francis@wdc.com> <188914A07F2508FF.2783356@lists.openembedded.org>
In-Reply-To: <188914A07F2508FF.2783356@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 9 Jan 2026 08:59:17 -0500
X-Gm-Features: AQt7F2o-0tiMxvYkP3eFsNC5vzsgbZHcRB5tipmi3UbAhoGvws-Y9Gm4MxTMzyw
Message-ID: <CADkTA4PdDMLu4Jhi01qKQoYTfqGWpi33i0uXEgUWfXRG_-+ssQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] cml1.bbclass: Support the rustavailable task
To: bruce.ashfield@gmail.com
Cc: alistair23@gmail.com, openembedded-core@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000001548b40647f4ef3b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229124

--0000000000001548b40647f4ef3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 8:56=E2=80=AFAM Bruce Ashfield via lists.openembedde=
d.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Thu, Jan 8, 2026 at 11:55=E2=80=AFPM Alistair Francis via
> lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
> wrote:
>
>> From: Alistair Francis <alistair.francis@wdc.com>
>>
>> Allow the user to run the rustavailable kernel make command to determine
>> if Rust is avaliable for kernel builds.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta/classes-recipe/cml1.bbclass | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/classes-recipe/cml1.bbclass
>> b/meta/classes-recipe/cml1.bbclass
>> index 3c2b4da4af..efbdd2a795 100644
>> --- a/meta/classes-recipe/cml1.bbclass
>> +++ b/meta/classes-recipe/cml1.bbclass
>> @@ -107,6 +107,15 @@ do_diffconfig[nostamp] =3D "1"
>>  do_diffconfig[dirs] =3D "${KCONFIG_CONFIG_ROOTDIR}"
>>  addtask diffconfig
>>
>> +python do_rustavailable() {
>> +    oe_terminal("sh -c 'make rustavailable; if [ $? -ne 0 ]; then echo
>> \"Command failed.\"; fi; printf \"Press any key to continue... \"; read
>> r;'",
>> +                d.getVar('PN') + ' Configuration', d)
>> +}
>>
>
> This seems a bit heavy to just determine if rust is available. Since the
> task is already after do_configure .. why not just check the .config ?
>
>
and of course, I remember this right after hitting send.

This class is used for more than just the kernel, so anything
done needs to be safe for other non-kernel usecases.

Bruce



> Bruce
>
>
>
>> +
>> +do_rustavailable[nostamp] =3D "1"
>> +do_rustavailable[dirs] =3D "${KCONFIG_CONFIG_ROOTDIR}"
>> +addtask rustavailable after do_configure
>> +
>>  do_showconfig() {
>>      bbplain "Config file written to ${KCONFIG_CONFIG_ROOTDIR}/.config"
>>  }
>> --
>> 2.52.0
>>
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229117):
> https://lists.openembedded.org/g/openembedded-core/message/229117
> Mute This Topic: https://lists.openembedded.org/mt/117170673/1050810
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

--0000000000001548b40647f4ef3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 9, 2026 at 8:56=
=E2=80=AFAM Bruce Ashfield via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 8, 2026 =
at 11:55=E2=80=AFPM Alistair Francis via <a href=3D"http://lists.openembedd=
ed.org" target=3D"_blank">lists.openembedded.org</a> &lt;alistair23=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Alistair Francis &lt;<a href=3D"mailto:alistair=
.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Allow the user to run the rustavailable kernel make command to determine<br=
>
if Rust is avaliable for kernel builds.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cml1.bbclass | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bb=
class<br>
index 3c2b4da4af..efbdd2a795 100644<br>
--- a/meta/classes-recipe/cml1.bbclass<br>
+++ b/meta/classes-recipe/cml1.bbclass<br>
@@ -107,6 +107,15 @@ do_diffconfig[nostamp] =3D &quot;1&quot;<br>
=C2=A0do_diffconfig[dirs] =3D &quot;${KCONFIG_CONFIG_ROOTDIR}&quot;<br>
=C2=A0addtask diffconfig<br>
<br>
+python do_rustavailable() {<br>
+=C2=A0 =C2=A0 oe_terminal(&quot;sh -c &#39;make rustavailable; if [ $? -ne=
 0 ]; then echo \&quot;Command failed.\&quot;; fi; printf \&quot;Press any =
key to continue... \&quot;; read r;&#39;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;PN&#=
39;) + &#39; Configuration&#39;, d)<br>
+}<br></blockquote><div><br></div><div><div style=3D"font-size:small">This =
seems a bit heavy to just determine if rust is available. Since the</div><d=
iv style=3D"font-size:small">task is already after do_configure .. why not =
just check the .config ?</div><div style=3D"font-size:small"><br></div></di=
v></div></div></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">and of course, I remember this right after hitti=
ng send.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">This class is us=
ed for more than just the kernel, so anything</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">done needs to be safe for other non-kernel u=
secases.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:small=
"></div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+do_rustavailable[nostamp] =3D &quot;1&quot;<br>
+do_rustavailable[dirs] =3D &quot;${KCONFIG_CONFIG_ROOTDIR}&quot;<br>
+addtask rustavailable after do_configure<br>
+<br>
=C2=A0do_showconfig() {<br>
=C2=A0 =C2=A0 =C2=A0bbplain &quot;Config file written to ${KCONFIG_CONFIG_R=
OOTDIR}/.config&quot;<br>
=C2=A0}<br>
-- <br>
2.52.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229117): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229117" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229117</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117170673/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117170673/1050810</a><br>
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
rek II<br><br></div></div>

--0000000000001548b40647f4ef3b--

