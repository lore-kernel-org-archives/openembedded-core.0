Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0ACCCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 15:45:23 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147.1762184720772701457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 07:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5obSvt/;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: joaohf@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63f96f3c8f0so498567d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762184720; x=1762789520; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hcQTZASOD2TONM1e4hAn4IjtAEl/tWvG1PMqCYi9t6g=;
        b=Q5obSvt/ZAQtkwyXNm3TXnD754ShzJmgAxDba11ydLba7HGss+LFvts2vJBILhQLKO
         hkOW5Be7MCdpXgrdu6UsJV3503R/8Sx6vNyuyggRlyi01ypNKkH4qGCYWZ1U0cJbAnOm
         Jw6cVr0TJTTrmsI/DNsWLIEXntxb9wySkF+P0tt8VRqSWRZa5mZtdUelJgLsJNCzgbbS
         ThrXo018D2CjTVaJjUDiWHwMFQXCWvZWZLmDB7+E0SDG49q/GcYx7PqdM/NQqfksCUzz
         5KnUPekPMfh6ILrJtjJ3I43isZ/EnRBGH2XgVhmVpe4bnqFMVw8EWcup/aYNZxOLS+6R
         bSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762184720; x=1762789520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcQTZASOD2TONM1e4hAn4IjtAEl/tWvG1PMqCYi9t6g=;
        b=hEAjREkBR5FSvHa75GwkQI+HlJr/8rBsgcuQbW0jDq7IWzSrB5agVHGCApJGwi585q
         DQ8srzkzdK4QGkOYvrQTo2oWsoHUlqmXfczOigUqmOO2pHPW7xxbmIlcjE4BKuiJwnQ4
         2rT8Din4DrflZPs2tvD91WjU2SEIYVjsUBJK1RD17Ay710u60KkGjGLZLzoQgnPLcVTa
         JXzv/HYQ3ON+D9f16V8+mVad6Ej/CQElMLD/9N9viHwSVgTKKT044pIrgsrcOO4Nb35e
         qszK6PA5Dm4BVC9s8H7FPN5GqI4ABTU9BQU5R9lb4Bi1bNEVfZgFxHjacgJjh2rCmIwY
         A5jQ==
X-Gm-Message-State: AOJu0YzuTgEAopp01mHUilANeH2aLoeBT+veidIf4AHH43Ul7w/DdXey
	DLc3oRmse4pUILQj2YU07/d5WozrwAoS0Bh+uDjzMrXIyYsw/pp3vaEhUbJM8C5SapX8BbPmX35
	e+RSmC6tSHIynErB2VXiQ6+xiK4A9TSA=
X-Gm-Gg: ASbGncslISEGdfOWwX2/73w+agf1IxXG+Ax9pfW4bhwY6GmsfkQsn7H8MhX3KwZOawb
	YZ/p94swf7DbvxwpwmPhuoxyj4CGP2auAT9iQcUwFAdV+L6kf8SH+/2UhY/arr5u0H8fMj64HUC
	9aYYbmFSCPVl3r7dGMXWgP91lb+MZM7siqU1oc88W/gBzLuKMLByq+0q0qy1e2DeQ6FMWxGsmwm
	RbHprjO/VarZ5unfi6HzbANu02XH5z/pvT1Uz6v9R5SzIPcScLh6Fhn57v90x5s4tralxpn
X-Google-Smtp-Source: AGHT+IEZrfszhhxWRrNKkxDeVzsXkgpWkXPCtEHk5NRkAR5b3bNrERiWkXce7ZNReTG6XRayavpCQaARkjtwMqN/uSk=
X-Received: by 2002:a05:690c:14c:b0:786:57f5:b4ab with SMTP id
 00721157ae682-78657f5b760mr46070237b3.1.1762184719673; Mon, 03 Nov 2025
 07:45:19 -0800 (PST)
MIME-Version: 1.0
References: <20251031181228.3810813-1-joaohf@gmail.com> <6052589ab3fdb48fb79485fe7f7a80ed2ad21ec1.camel@pbarker.dev>
In-Reply-To: <6052589ab3fdb48fb79485fe7f7a80ed2ad21ec1.camel@pbarker.dev>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
Date: Mon, 3 Nov 2025 12:45:07 -0300
X-Gm-Features: AWmQ_bnE5DAXcRxHJbSF4P5c47X-6BpbrLMFooFePxbPqFqaqRyCIv13wXHzwd8
Message-ID: <CANFVK7_YkR5eZAnRAq-FmWng_iRCWzbyRpnwSH=E-tDNbfsRAA@mail.gmail.com>
Subject: Re: [PATCH v2] readline: backport a patch to fix for caller setting
 rl_prompt to NULL
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <quaresma.jose@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003eb0aa0642b29a58"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 15:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225666

--0000000000003eb0aa0642b29a58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I'll send a v3 soon. I was unsure where to add those notes.

Thanks

On Mon, Nov 3, 2025 at 11:58=E2=80=AFAM Paul Barker <paul@pbarker.dev> wrot=
e:

> On Fri, 2025-10-31 at 15:12 -0300, Jo=C3=A3o Henrique Ferreira de Freitas
> wrote:
> > I've observed this issue affecting iwctl and connmanctl.
> >
> > Patching readline solves the issue.
> >
> > The original patch from [5] mixes many fixes in one commit. I've extrac=
t
> > only what matters to solve the issues observed with connman and iwd. Th=
e
> > final patch is the same patch sent by readline author to readline's mai=
l
> list [6].
> >
> > References:
> >
> > 1:
> https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/issu=
es/1
> > 2:
> https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/comm=
it/b30636dc66fc783a091af51b049dc5240f861dd0
> > 3: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.htm=
l
> > 4:
> https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-fr=
ont.org/
> > 5:
> https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=3D=
devel&id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd
> > 6:
> https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.txt
> >
> > Fixes [YOCTO #16047]
> >
> > CC: Jose Quaresma <quaresma.jose@gmail.com>
> > Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com=
>
> > ---
> >
> > Notes:
> >     changes in v2:
> >     - add readline fix author name
> >     - add explanation why and where the original patch come from
> >
> >  ...for-caller-setting-rl_prompt-to-NULL.patch | 42 +++++++++++++++++++
> >  meta/recipes-core/readline/readline_8.3.bb    |  5 ++-
> >  2 files changed, 45 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-N=
ULL.patch
> >
> > diff --git
> a/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to=
-NULL.patch
> b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to=
-NULL.patch
> > new file mode 100644
> > index 0000000000..c8ac712d56
> > --- /dev/null
> > +++
> b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to=
-NULL.patch
> > @@ -0,0 +1,42 @@
> > +From a0a4c011c0c5e598c5b51cbf81d3b4501fa72e0c Mon Sep 17 00:00:00 2001
> > +From: Chet Ramey <chet.ramey@case.edu>
> > +Date: Thu, 30 Oct 2025 14:19:41 -0300
> > +Subject: [PATCH] fix for caller setting rl_prompt to NULL
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Upstream-Status: Backport [
> https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=3D=
devel&id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd
> ]
> > +Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.co=
m>
> > +---
> > +
> > +Notes:
> > +    The original patch came from [1, 2] and it has been integrated int=
o
> > +    readline git repository, commit
> (488d7edc22894d30b6de7f2d4190bf7403f63ffd)
> > +
> > +    This patch has only the fix needed to solve the follow issues [3,4=
].
> > +
> > +    I added the original author as this patch has been sent through
> readline mail
> > +    list.
> > +
> > +    1:
> https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
> > +    2:
> https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.txt
> > +    3:
> https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-fr=
ont.org/
> > +    4:
> https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/issu=
es/1
>
> We should keep these notes above the "---" divider in the patch file so
> that they're not lost if devtool or another tool is used to rebase
> patches.
>
> > diff --git a/meta/recipes-core/readline/readline_8.3.bb
> b/meta/recipes-core/readline/readline_8.3.bb
> > index a2f23eb353..8bc4477946 100644
> > --- a/meta/recipes-core/readline/readline_8.3.bb
> > +++ b/meta/recipes-core/readline/readline_8.3.bb
> > @@ -1,7 +1,8 @@
> >  require readline.inc
> >
> >  SRC_URI +=3D "file://norpath.patch \
> > -            file://fix-for-readline-event-hook.patch \
> > -            "
> > +           file://fix-for-readline-event-hook.patch \
> > +           file://fix-for-caller-setting-rl_prompt-to-NULL.patch \
> > +           "
>
> Minor nitpick: Looks like there's an unnecessary whitespace change here.
>
> Thanks,
>
> --
> Paul Barker
>


--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--0000000000003eb0aa0642b29a58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Paul,</div><div><br></div><div>I&#39;ll send a v3 =
soon. I was unsure where to add those notes.=C2=A0</div><div><br></div><div=
>Thanks</div></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 3, 2025 at 11:58=E2=80=AFAM =
Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev">paul@pbarker.dev</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri,=
 2025-10-31 at 15:12 -0300, Jo=C3=A3o Henrique Ferreira de Freitas<br>
wrote:<br>
&gt; I&#39;ve observed this issue affecting iwctl and connmanctl.<br>
&gt; <br>
&gt; Patching readline solves the issue.<br>
&gt; <br>
&gt; The original patch from [5] mixes many fixes in one commit. I&#39;ve e=
xtract<br>
&gt; only what matters to solve the issues observed with connman and iwd. T=
he<br>
&gt; final patch is the same patch sent by readline author to readline&#39;=
s mail list [6].<br>
&gt; <br>
&gt; References:<br>
&gt; <br>
&gt; 1: <a href=3D"https://gitlab.archlinux.org/archlinux/packaging/package=
s/readline/-/issues/1" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
archlinux.org/archlinux/packaging/packages/readline/-/issues/1</a><br>
&gt; 2: <a href=3D"https://gitlab.archlinux.org/archlinux/packaging/package=
s/readline/-/commit/b30636dc66fc783a091af51b049dc5240f861dd0" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.archlinux.org/archlinux/packaging/pa=
ckages/readline/-/commit/b30636dc66fc783a091af51b049dc5240f861dd0</a><br>
&gt; 3: <a href=3D"https://lists.gnu.org/archive/html/bug-readline/2025-07/=
msg00007.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/a=
rchive/html/bug-readline/2025-07/msg00007.html</a><br>
&gt; 4: <a href=3D"https://lore.kernel.org/connman/20251018212411.181909-1-=
jsbronder@cold-front.org/" rel=3D"noreferrer" target=3D"_blank">https://lor=
e.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-front.org/</a><=
br>
&gt; 5: <a href=3D"https://cgit.git.savannah.gnu.org/cgit/readline.git/comm=
it/display.c?h=3Ddevel&amp;id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd" r=
el=3D"noreferrer" target=3D"_blank">https://cgit.git.savannah.gnu.org/cgit/=
readline.git/commit/display.c?h=3Ddevel&amp;id=3D488d7edc22894d30b6de7f2d41=
90bf7403f63ffd</a><br>
&gt; 6: <a href=3D"https://lists.gnu.org/archive/html/bug-readline/2025-07/=
txtmA7rksnmmi.txt" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.o=
rg/archive/html/bug-readline/2025-07/txtmA7rksnmmi.txt</a><br>
&gt; <br>
&gt; Fixes [YOCTO #16047]<br>
&gt; <br>
&gt; CC: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" targe=
t=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas &lt;<a href=3D"m=
ailto:joaohf@gmail.com" target=3D"_blank">joaohf@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Notes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0changes in v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- add readline fix author name<br>
&gt;=C2=A0 =C2=A0 =C2=A0- add explanation why and where the original patch =
come from<br>
&gt; <br>
&gt;=C2=A0 ...for-caller-setting-rl_prompt-to-NULL.patch | 42 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-core/readline/<a href=3D"http://readline_8.3.bb" re=
l=3D"noreferrer" target=3D"_blank">readline_8.3.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 5 ++-<br>
&gt;=C2=A0 2 files changed, 45 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/readline/readline/fix-for-c=
aller-setting-rl_prompt-to-NULL.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/readline/readline/fix-for-caller-settin=
g-rl_prompt-to-NULL.patch b/meta/recipes-core/readline/readline/fix-for-cal=
ler-setting-rl_prompt-to-NULL.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c8ac712d56<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_pr=
ompt-to-NULL.patch<br>
&gt; @@ -0,0 +1,42 @@<br>
&gt; +From a0a4c011c0c5e598c5b51cbf81d3b4501fa72e0c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Chet Ramey &lt;<a href=3D"mailto:chet.ramey@case.edu" target=3D=
"_blank">chet.ramey@case.edu</a>&gt;<br>
&gt; +Date: Thu, 30 Oct 2025 14:19:41 -0300<br>
&gt; +Subject: [PATCH] fix for caller setting rl_prompt to NULL<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.o=
rg/cgit/readline.git/commit/display.c?h=3Ddevel&amp;id=3D488d7edc22894d30b6=
de7f2d4190bf7403f63ffd" rel=3D"noreferrer" target=3D"_blank">https://cgit.g=
it.savannah.gnu.org/cgit/readline.git/commit/display.c?h=3Ddevel&amp;id=3D4=
88d7edc22894d30b6de7f2d4190bf7403f63ffd</a>]<br>
&gt; +Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas &lt;<a href=3D"=
mailto:joaohf@gmail.com" target=3D"_blank">joaohf@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; +<br>
&gt; +Notes:<br>
&gt; +=C2=A0 =C2=A0 The original patch came from [1, 2] and it has been int=
egrated into<br>
&gt; +=C2=A0 =C2=A0 readline git repository, commit (488d7edc22894d30b6de7f=
2d4190bf7403f63ffd)<br>
&gt; +=C2=A0 =C2=A0 <br>
&gt; +=C2=A0 =C2=A0 This patch has only the fix needed to solve the follow =
issues [3,4].<br>
&gt; +=C2=A0 =C2=A0 <br>
&gt; +=C2=A0 =C2=A0 I added the original author as this patch has been sent=
 through readline mail<br>
&gt; +=C2=A0 =C2=A0 list.<br>
&gt; +=C2=A0 =C2=A0 <br>
&gt; +=C2=A0 =C2=A0 1: <a href=3D"https://lists.gnu.org/archive/html/bug-re=
adline/2025-07/msg00007.html" rel=3D"noreferrer" target=3D"_blank">https://=
lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html</a><br>
&gt; +=C2=A0 =C2=A0 2: <a href=3D"https://lists.gnu.org/archive/html/bug-re=
adline/2025-07/txtmA7rksnmmi.txt" rel=3D"noreferrer" target=3D"_blank">http=
s://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.txt</a><b=
r>
&gt; +=C2=A0 =C2=A0 3: <a href=3D"https://lore.kernel.org/connman/202510182=
12411.181909-1-jsbronder@cold-front.org/" rel=3D"noreferrer" target=3D"_bla=
nk">https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-=
front.org/</a><br>
&gt; +=C2=A0 =C2=A0 4: <a href=3D"https://gitlab.archlinux.org/archlinux/pa=
ckaging/packages/readline/-/issues/1" rel=3D"noreferrer" target=3D"_blank">=
https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/issues=
/1</a><br>
<br>
We should keep these notes above the &quot;---&quot; divider in the patch f=
ile so<br>
that they&#39;re not lost if devtool or another tool is used to rebase<br>
patches.<br>
<br>
&gt; diff --git a/meta/recipes-core/readline/<a href=3D"http://readline_8.3=
.bb" rel=3D"noreferrer" target=3D"_blank">readline_8.3.bb</a> b/meta/recipe=
s-core/readline/<a href=3D"http://readline_8.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">readline_8.3.bb</a><br>
&gt; index a2f23eb353..8bc4477946 100644<br>
&gt; --- a/meta/recipes-core/readline/<a href=3D"http://readline_8.3.bb" re=
l=3D"noreferrer" target=3D"_blank">readline_8.3.bb</a><br>
&gt; +++ b/meta/recipes-core/readline/<a href=3D"http://readline_8.3.bb" re=
l=3D"noreferrer" target=3D"_blank">readline_8.3.bb</a><br>
&gt; @@ -1,7 +1,8 @@<br>
&gt;=C2=A0 require readline.inc<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://norpath.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-for-readline-eve=
nt-hook.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-for-readline-even=
t-hook.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-for-caller-settin=
g-rl_prompt-to-NULL.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
Minor nitpick: Looks like there&#39;s an unnecessary whitespace change here=
.<br>
<br>
Thanks,<br>
<br>
-- <br>
Paul Barker<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Jo=C3=A3o Henrique Ferreira de Freitas - <a href=3D"http://j=
oaohf_at_gmail.com" target=3D"_blank">joaohf_at_gmail.com</a><br>Campinas-S=
P-Brasil</div></div>

--0000000000003eb0aa0642b29a58--

