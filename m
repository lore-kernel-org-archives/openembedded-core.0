Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB18BE9DE7A
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:16:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127948.1775726201678767342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=C0CI5r7X;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ba840146so5765165e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 02:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775726200; cv=none;
        d=google.com; s=arc-20240605;
        b=GKRGtnF70K7TeC5R5BmBzxStwM1tmOkiyrRMAFlQHINsY9gLcBHez4eMiy9YpglbkU
         pDJQOQTQQDziEIw9//B/hWsglc/RyS2heDgJwA88KXvYRWHjRNnXIQbm7PuI8wAvwfEG
         zWWH2SMLDSGgl1BjkaTc/eJVKWo7zSBQZNb2DDkY0bY4KRl3cNA8rNrBnSY5p7Pp2RQs
         9hSxJqrFk/RyJgnxrlSt9HEIePzaBm1nnCX+5DhaN3e3xGtOOsZYXNypL5yeno+UMTeR
         8MAi8XfVBd6IEgRPDxoVZUSpaXFkjZsRV6lQXn2/bBjzpZvp8E3Lso0A0rTKUf8zwTJN
         k9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+BCK7/HJamIrQh05t+QCXpFnkwgCwrYHMXQN0RNoilU=;
        fh=f+nv1ydO5EleRm+2P1DLqsFtDwe8Ww+uY77bp/2cJxA=;
        b=X4MhjigKKS2Ka1hebDfTla3Y0C+NzGU0CTb+J2N7RfwZDqZMiwIjroOm+OiXL/WYT8
         dq7jncHR+qtmNtOUO8jO40vtHgY64DZjjkAMcI9f+nBK/1mMU/KS4hJl9cyBEZJSeqdK
         8ubYreS91AnqmAnAvFTYsbU6zWMzvbyGMtC+S+jo9JYRpk03neBVwzvsb8ockPN/g4sx
         BGxiQK5/bJuc9kaKtGh8mG5dHDBMsMyWgIBETPTvn2zj4accGV/HSM85+H9OImVZQ8d6
         /Q0JlBW3QtPvujYywT/mx43VdXNyqWeTuQp+DnDdKhxRPGwE2sN7dGnTGF6HK9Fs4jnS
         To9g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775726200; x=1776331000; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BCK7/HJamIrQh05t+QCXpFnkwgCwrYHMXQN0RNoilU=;
        b=C0CI5r7XVp+WJ6RfQkVOimNmKYCdz9Y30fYrl4FwszxHRVqe1IIaueIDeDtPwnPg6F
         XHpWkwIeIcah6Y7z50ugg1QlrPgQC9OBH/tGqf/YoopWm7t5e5lkSgcPA5psnmesEz12
         Oa2gdzFsE0dQiTWuRXUK7uHhglizI5e19sEAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726200; x=1776331000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BCK7/HJamIrQh05t+QCXpFnkwgCwrYHMXQN0RNoilU=;
        b=GD8c3bDJtBJTR8UokME9Q33F8tv10baEEaFlM5m8Ap4L5L/Zy9Sf9y45slxtEkeqJM
         VmV6s0/AaCxlftoOb/4CzDs1RzCv1P0ccL7iRLStnZPsdIYL7pcXHKEiISYajfLGM4zh
         zei4BL/JayPMwu/6Yu8Y7pcsJMit909UumhGvJa8u9xs5yZDx26XzBpOCpPhb0OzOt7s
         ozS+3vd9Of2u8702vNXlHEl/wYGDfc2a/k2WbhOK32G2hkGERB2qDkGGiySGTPALlFu5
         guYQ9O1Nsqg12aebbd2NuDIHKJnI61SARJx0yja+ams8xd0STQpebKhdyqG2wb8o9DlX
         W6jQ==
X-Gm-Message-State: AOJu0Yx8fqsRV+7gR1UAJ0mQd8d4gGuzHgFPEL4BObnyEY7H2TLL+SR1
	wf/4u49CSovM594IZBORL11OQOwBdpIwXRb6SHHVObs+iLQwScs0GttZ7TVmphh+1dFTBbMaw3l
	VqbeI879QzOs/hgkDoIUfOgIAoyY8gq6NMNTsyY3QZg==
X-Gm-Gg: AeBDietcSpT0ZXZCMOdlnNrr7eWUmwtMhbOLYt6rVCSkfTSxAGEmTEH64KsZ98bcAZh
	cqSEXb0F4mU59E/4ZD/wPD/+tOHAOD3fdvS2zW7KLEX9lfQ2PxHJTlXcBB5r3O2tuYF7Zq58Rph
	9l/GPhF3TbfqDSTmN1EpYkgVghzZny6k3RqJo5Fs0DlMkFIHWK2S7LrWML4YFfc0IPUAUSjgPPQ
	qypfr0QqBh7DseTma2LpYcDaCd21R/reILZUhCUS2bKCdXmPFK1xzNl3Bldsv4ZCf8w+r+0zR4I
	/SajlfK2fP4gwF2UWi7NlePwjDJxiw2wzGms+gzGylFHi25gmCOu
X-Received: by 2002:a05:600c:8591:b0:488:ab5b:d711 with SMTP id
 5b1f17b1804b1-488ccfe6a5amr29294585e9.23.1775726199858; Thu, 09 Apr 2026
 02:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260408112654.1029664-1-hprajapati@mvista.com>
 <DHOHF1H8G3WD.UP4M83OEJ4QI@smile.fr> <CACVbggGm5+EoVYHn0_tRgk0-+_tgWy-huqzrLe7=vPk7=9TJzQ@mail.gmail.com>
In-Reply-To: <CACVbggGm5+EoVYHn0_tRgk0-+_tgWy-huqzrLe7=vPk7=9TJzQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 9 Apr 2026 11:16:13 +0200
X-Gm-Features: AQROBzCJbTU_T1dJ1nqN2Z7ZfCsktrBMFu5oBUOBG0QbSlGUmjVAFdF73CrZDfY
Message-ID: <CAMSfU+50zA=cP7TGTyVHh_My7KeuK_J-MQeqMoLQ9N5GghRQAA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] vim: Fix CVE-2026-25749
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c7c73064f037973"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234899

--0000000000005c7c73064f037973
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 9 avr. 2026 =C3=A0 11:05, Hitendra Prajapati <hprajapati@mvista.com=
> a
=C3=A9crit :

> Hi Yoann,
>
> Thanks for the info. I understand it's too late for kirkstone.
>

Well... Stay tuned because I might ultimately slip them in: I need to fix
the branch before building the release.


> Regards,
> Hitendra
>
> On Thu, 9 Apr, 2026, 2:00=E2=80=AFpm Yoann Congal, <yoann.congal@smile.fr=
> wrote:
>
>> On Wed Apr 8, 2026 at 1:26 PM CEST, Hitendra Prajapati via
>> lists.openembedded.org wrote:
>> > Pick patch from [1] also mentioned in [2]
>> >
>> > [1]
>> https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26f=
a9
>> > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749
>> >
>> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> > ---
>>
>> Hello,
>>
>> I'm sorry but this patch (and the other vim patches sent after this one)
>> is too late to make it into the last kirkstone release.
>> See: End of kirkstone LTS support
>> https://lore.kernel.org/yocto/DH8I3C005I7I.EAFAABGT2FJL@smile.fr/T/#u
>>
>> Regards,
>>
>> >  .../vim/files/CVE-2026-25749.patch            | 64 ++++++++++++++++++=
+
>> >  meta/recipes-support/vim/vim.inc              |  1 +
>> >  2 files changed, 65 insertions(+)
>> >  create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patc=
h
>> >
>> > diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch
>> b/meta/recipes-support/vim/files/CVE-2026-25749.patch
>> > new file mode 100644
>> > index 0000000000..8b04379b9b
>> > --- /dev/null
>> > +++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
>> > @@ -0,0 +1,64 @@
>> > +From e0065a61a42bdff9c75aa18104f8ff546938395f Mon Sep 17 00:00:00 200=
1
>> > +From: Christian Brabandt <cb@256bit.org>
>> > +Date: Thu, 5 Feb 2026 18:51:54 +0000
>> > +Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in
>> 'helpfile'
>> > + option handling
>> > +
>> > +Problem:  [security]: buffer-overflow in 'helpfile' option handling b=
y
>> > +          using strcpy without bound checks (Rahul Hoysala)
>> > +Solution: Limit strncpy to the length of the buffer (MAXPATHL)
>> > +
>> > +Github Advisory:
>> > +https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
>> > +
>> > +CVE: CVE-2026-25749
>> > +Upstream-Status: Backport [
>> https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26f=
a9
>> ]
>> > +
>> > +Backport Changes:
>> > +- Excluded changes to src/version.c and runtime/doc/version9.txt
>> > +  from this backport. This file only tracks upstream version
>> increments.
>> > +  We are applying a security fix, not a version upgrade. These change=
s
>> > +  were skipped to maintain current package versioning and avoid merge
>> conflicts.
>> > +
>> > +Signed-off-by: Christian Brabandt <cb@256bit.org>
>> > +(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)
>> > +Signed-off-by: Anil Dongare <adongare@cisco.com>
>> > +---
>> > + src/tag.c                 | 2 +-
>> > + src/testdir/test_help.vim | 9 +++++++++
>> > + 2 files changed, 10 insertions(+), 1 deletion(-)
>> > +
>> > +diff --git a/src/tag.c b/src/tag.c
>> > +index 6912e8743..a32bbb245 100644
>> > +--- a/src/tag.c
>> > ++++ b/src/tag.c
>> > +@@ -3348,7 +3348,7 @@ get_tagfname(
>> > +         if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf =3D=3D NUL)
>> > +             return FAIL;
>> > +         ++tnp->tn_hf_idx;
>> > +-        STRCPY(buf, p_hf);
>> > ++        vim_strncpy(buf, p_hf, MAXPATHL - 1);
>> > +         STRCPY(gettail(buf), "tags");
>> > + #ifdef BACKSLASH_IN_FILENAME
>> > +         slash_adjust(buf);
>> > +diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
>> > +index dac153d86..f9e4686bb 100644
>> > +--- a/src/testdir/test_help.vim
>> > ++++ b/src/testdir/test_help.vim
>> > +@@ -222,4 +222,13 @@ func Test_helptag_navigation()
>> > + endfunc
>> > +
>> > +
>> > ++" This caused a buffer overflow
>> > ++func Test_helpfile_overflow()
>> > ++  let _helpfile =3D &helpfile
>> > ++  let &helpfile =3D repeat('A', 5000)
>> > ++  help
>> > ++  helpclose
>> > ++  let &helpfile =3D _helpfile
>> > ++endfunc
>> > ++
>> > + " vim: shiftwidth=3D2 sts=3D2 expandtab
>> > +--
>> > +2.43.7
>> > +
>> > diff --git a/meta/recipes-support/vim/vim.inc
>> b/meta/recipes-support/vim/vim.inc
>> > index fc9b4db055..fa63689ef1 100644
>> > --- a/meta/recipes-support/vim/vim.inc
>> > +++ b/meta/recipes-support/vim/vim.inc
>> > @@ -17,6 +17,7 @@ SRC_URI =3D "git://
>> github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps \
>> >             file://0001-src-Makefile-improve-reproducibility.patch \
>> >             file://no-path-adjust.patch \
>> >             file://CVE-2026-33412.patch \
>> > +           file://CVE-2026-25749.patch \
>> >             "
>> >
>> >  PV .=3D ".1683"
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>

--=20
Yoann Congal
Smile ECS

--0000000000005c7c73064f037973
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 9 avr. 2026 =C3=A0=C2=A011:0=
5, Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.com">hprajapa=
ti@mvista.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote gm=
ail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"auto"><span>Hi Yoann,<br><br>Thanks for the info. I understand it&#=
39;s too late for kirkstone.</span></div></blockquote><div><br></div><div>W=
ell... Stay tuned because I might ultimately slip them in: I need to fix th=
e branch before building the release.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><span>Regards,<br>Hite=
ndra</span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, 9 Apr, 2026, 2:00=E2=80=AFpm Yoann Congal, &lt;<a href=
=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Wed Apr 8, 2026 at 1:26 PM CEST, Hitendra Prajapati via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; Pick patch from [1] also mentioned in [2]<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/vim/vim/commit/0714b15940b245108e6e9=
d7aa2260dd849a26fa9" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9</a><br=
>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-25749" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/=
CVE-2026-25749</a><br>
&gt;<br>
&gt; Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvi=
sta.com" rel=3D"noreferrer" target=3D"_blank">hprajapati@mvista.com</a>&gt;=
<br>
&gt; ---<br>
<br>
Hello,<br>
<br>
I&#39;m sorry but this patch (and the other vim patches sent after this one=
)<br>
is too late to make it into the last kirkstone release.<br>
See: End of kirkstone LTS support<br>
<a href=3D"https://lore.kernel.org/yocto/DH8I3C005I7I.EAFAABGT2FJL@smile.fr=
/T/#u" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.kernel.=
org/yocto/DH8I3C005I7I.EAFAABGT2FJL@smile.fr/T/#u</a><br>
<br>
Regards,<br>
<br>
&gt;=C2=A0 .../vim/files/CVE-2026-25749.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 64 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 65 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/met=
a/recipes-support/vim/files/CVE-2026-25749.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8b04379b9b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch<br>
&gt; @@ -0,0 +1,64 @@<br>
&gt; +From e0065a61a42bdff9c75aa18104f8ff546938395f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Christian Brabandt &lt;<a href=3D"mailto:cb@256bit.org" rel=3D"=
noreferrer" target=3D"_blank">cb@256bit.org</a>&gt;<br>
&gt; +Date: Thu, 5 Feb 2026 18:51:54 +0000<br>
&gt; +Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in &#39;=
helpfile&#39;<br>
&gt; + option handling<br>
&gt; +<br>
&gt; +Problem:=C2=A0 [security]: buffer-overflow in &#39;helpfile&#39; opti=
on handling by<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 using strcpy without bound checks =
(Rahul Hoysala)<br>
&gt; +Solution: Limit strncpy to the length of the buffer (MAXPATHL)<br>
&gt; +<br>
&gt; +Github Advisory:<br>
&gt; +<a href=3D"https://github.com/vim/vim/security/advisories/GHSA-5w93-4=
g67-mm43" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/vim/vim/security/advisories/GHSA-5w93-4g67-mm43</a><br>
&gt; +<br>
&gt; +CVE: CVE-2026-25749<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/vim/vim/comm=
it/0714b15940b245108e6e9d7aa2260dd849a26fa9" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://github.com/vim/vim/commit/0714b15940b245108e6e9d7=
aa2260dd849a26fa9</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Excluded changes to src/version.c and runtime/doc/version9.txt<br>
&gt; +=C2=A0 from this backport. This file only tracks upstream version inc=
rements.<br>
&gt; +=C2=A0 We are applying a security fix, not a version upgrade. These c=
hanges<br>
&gt; +=C2=A0 were skipped to maintain current package versioning and avoid =
merge conflicts.<br>
&gt; +<br>
&gt; +Signed-off-by: Christian Brabandt &lt;<a href=3D"mailto:cb@256bit.org=
" rel=3D"noreferrer" target=3D"_blank">cb@256bit.org</a>&gt;<br>
&gt; +(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)<=
br>
&gt; +Signed-off-by: Anil Dongare &lt;<a href=3D"mailto:adongare@cisco.com"=
 rel=3D"noreferrer" target=3D"_blank">adongare@cisco.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/tag.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt; + src/testdir/test_help.vim | 9 +++++++++<br>
&gt; + 2 files changed, 10 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/tag.c b/src/tag.c<br>
&gt; +index 6912e8743..a32bbb245 100644<br>
&gt; +--- a/src/tag.c<br>
&gt; ++++ b/src/tag.c<br>
&gt; +@@ -3348,7 +3348,7 @@ get_tagfname(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tnp-&gt;tn_hf_idx &gt; tag_fnam=
es.ga_len || *p_hf =3D=3D NUL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FAIL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++tnp-&gt;tn_hf_idx;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 STRCPY(buf, p_hf);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 vim_strncpy(buf, p_hf, MAXPATHL - 1);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STRCPY(gettail(buf), &quot;tags&quo=
t;);<br>
&gt; + #ifdef BACKSLASH_IN_FILENAME<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slash_adjust(buf);<br>
&gt; +diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim<br=
>
&gt; +index dac153d86..f9e4686bb 100644<br>
&gt; +--- a/src/testdir/test_help.vim<br>
&gt; ++++ b/src/testdir/test_help.vim<br>
&gt; +@@ -222,4 +222,13 @@ func Test_helptag_navigation()<br>
&gt; + endfunc<br>
&gt; + <br>
&gt; + <br>
&gt; ++&quot; This caused a buffer overflow<br>
&gt; ++func Test_helpfile_overflow()<br>
&gt; ++=C2=A0 let _helpfile =3D &amp;helpfile<br>
&gt; ++=C2=A0 let &amp;helpfile =3D repeat(&#39;A&#39;, 5000)<br>
&gt; ++=C2=A0 help<br>
&gt; ++=C2=A0 helpclose<br>
&gt; ++=C2=A0 let &amp;helpfile =3D _helpfile<br>
&gt; ++endfunc<br>
&gt; ++<br>
&gt; + &quot; vim: shiftwidth=3D2 sts=3D2 expandtab<br>
&gt; +-- <br>
&gt; +2.43.7<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/v=
im/vim.inc<br>
&gt; index fc9b4db055..fa63689ef1 100644<br>
&gt; --- a/meta/recipes-support/vim/vim.inc<br>
&gt; +++ b/meta/recipes-support/vim/vim.inc<br>
&gt; @@ -17,6 +17,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/vim/vim.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer noreferrer=
" target=3D"_blank">github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps=
</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-src-Makefil=
e-improve-reproducibility.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-path-adjust.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-33412.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-25749.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PV .=3D &quot;.1683&quot;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005c7c73064f037973--

