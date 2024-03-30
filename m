Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21667CD128E
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 12:08:37 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.12519.1711800511686897688
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Mar 2024 05:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZiB+i2T1;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2a209b8af12so1603616a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711800511; x=1712405311; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7xh8xHkJaCdQuFAWeqaI3YIeLFy1KbPiclLIIJ+ik8A=;
        b=ZiB+i2T1O35ou2INU6N2Kyx3K4s2AgcygxNu15JIEAeD6AAg3sDo3krS5ZeQkA+y1A
         ygnooTGr6GhmIm2NsGyJW+kOrmQyrL4PeXbOWWFF8cR2KoPznF5ujRi+TZ/HRHHf4xuC
         bKc3bvNM4Jr1TbUeFn4UPKd2n9eFTATZZu0zcyuytyPv/j2qXAEMnDjVeQNPGesJvc+v
         uI7VXQBBhvVU1303KfF9f9b+zpLsG9a8N5eQVyVJkojt/UMjZ6JYm/2mIiQcB/4Udn0N
         +sSVpy1Vay8K+kLgbmOOql/cOp5MaGbBK70YXXrGLHjji0qIqvM0R0gqpuxS/wqspY8m
         atcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711800511; x=1712405311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xh8xHkJaCdQuFAWeqaI3YIeLFy1KbPiclLIIJ+ik8A=;
        b=sVKNAK63KUfj90fdhOLL8ZN4O0p2RqAmQpLwrtyfyagzc9tjwiN+EApgiaZPfnVBEq
         35y22rXuZFYGqfWEROeBal4T/HM7qSXQ3l2NirewD12T1Owcw79LZxSCLVWmHN5t2STh
         AbU4cgYSNeEUfMUQIXx77t7L2yKCFD93MBgYJeXmSKF+1fsWm2C8jG6DHF2aoDMriOun
         7PYZwOxhFhMeW4MUGQckIRwewUd44GM2aPGy9oxeJV4/vl6WYK+zQfkvMsGFdFHwjLrp
         soQq0imXlt8kj46qe3gJfJfAXgfPHmJuSBwRtz2/A0H/h/FlMRbKfL/61QUbGwQcuHA1
         PuvA==
X-Forwarded-Encrypted: i=1; AJvYcCWXqTKXshVA8/XWugRKbfsPPm74Ql1CREntkbTH+gG0luVJR5pbyGymdrU+dvxysmSW+fJNyztYNzUsVmBhwoAuYgk+4a3MdTLhJAr1/QEJn29oLeLvey3j
X-Gm-Message-State: AOJu0YzRBVmksNKaz4wtg7lYrL04bi3+Fg719OlQded1FrlVkA3DfRNv
	OyWHSz3qKefxt5Uz+l+jTCH4LwZlRQV0p10IpLzfTc8+qPmr4Yhv7e2l9P/LvG/9AquRaT+Jqfm
	qdTiB382bYEKrraT5v9ibV4nPCRs=
X-Google-Smtp-Source: AGHT+IE76WGDxn8UJdIH93oPbgQpSwhglsRcBZ079iNmf50EOhLftPNRFdJd3x3s1LyklP+a6+F1VxH8wGcaBWSCWR0=
X-Received: by 2002:a17:90a:4989:b0:29f:e0ef:4d8c with SMTP id
 d9-20020a17090a498900b0029fe0ef4d8cmr4054325pjh.44.1711800510856; Sat, 30 Mar
 2024 05:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
 <1710313714-12541-36-git-send-email-wangmy@fujitsu.com> <2d88c7fc227e44acf14470103dadd92e026b62f9.camel@linuxfoundation.org>
 <36b1d7d1-c1ea-4d1a-b7a7-27ff550cdcc7@kernel.crashing.org>
In-Reply-To: <36b1d7d1-c1ea-4d1a-b7a7-27ff550cdcc7@kernel.crashing.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Sat, 30 Mar 2024 13:08:18 +0100
Message-ID: <CAApg2=Tq7i4u3+U9iNXQufH8kKwnfty2OG=OUeL23j9PT9gFJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 36/36] xz: upgrade 5.4.6 -> 5.6.1 _WARNING_
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, wangmy@fujitsu.com, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000604b130614df9db6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 12:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197648

--000000000000604b130614df9db6
Content-Type: text/plain; charset="UTF-8"

Absolutely confirm. DO NOT UPDATE

Marta

On Sat, 30 Mar 2024, 02:04 Mark Hatle, <mark.hatle@kernel.crashing.org>
wrote:

> I know this request is a week or so old..
>
> But do NOT upgrade to 'xz' 5.6.0 or 5.6.1.  It has been compromised:
>
> https://www.openwall.com/lists/oss-security/2024/03/29/4
>
> --Mark
>
> On 3/14/24 8:40 AM, Richard Purdie wrote:
> > On Wed, 2024-03-13 at 15:08 +0800, wangmy via lists.openembedded.org
> > wrote:
> >> From: Wang Mingyu <wangmy@fujitsu.com>
> >>
> >> License-Update:
> >> ================
> >> *COPYING:
> >>   Add the license for the XZ logo.
> >>   Change most public domain parts to 0BSD.
> >>   Update COPYING about the man pages of the scripts.
> >> *getopt.c
> >>   MSVC: Don't #include <unistd.h>.
> >>   lib/getopt*.c: Include <config.h> only HAVE_CONFIG_H is defined.
> >>   lib: Update getopt.c from Gnulib with modifications.
> >>   lib: Silence -Wsign-conversion in getopt.c.
> >>   Add SPDX license identifiers to GPL, LGPL, and FSFULLR files.
> >>
> >> Changelog:
> >> =============
> >> * liblzma: Fixed two bugs relating to GNU indirect function (IFUNC)
> >>    with GCC.
> >> * xz: Changed the messages for thread reduction due to memory
> >>    constraints to only appear under the highest verbosity level.
> >> * Build:
> >>      - Fixed a build issue when the header file <linux/landlock.h>
> >>        was present on the system but the Landlock system calls were
> >>        not defined in <sys/syscall.h>.
> >>      - The CMake build now warns and disables NLS if both gettext
> >>        tools and pre-created .gmo files are missing. Previously,
> >>        this caused the CMake build to fail.
> >> * Minor improvements to man pages.
> >> * Minor improvements to tests.
> >
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/8737
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197643):
> https://lists.openembedded.org/g/openembedded-core/message/197643
> Mute This Topic: https://lists.openembedded.org/mt/105226831/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000604b130614df9db6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Absolutely confirm. DO NOT UPDATE<div dir=3D"auto"><br></=
div><div dir=3D"auto">Marta</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sat, 30 Mar 2024, 02:04 Mark Hatle, &lt=
;<a href=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel.crashi=
ng.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I know this r=
equest is a week or so old..<br>
<br>
But do NOT upgrade to &#39;xz&#39; 5.6.0 or 5.6.1.=C2=A0 It has been compro=
mised:<br>
<br>
<a href=3D"https://www.openwall.com/lists/oss-security/2024/03/29/4" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://www.openwall.com/lists/os=
s-security/2024/03/29/4</a><br>
<br>
--Mark<br>
<br>
On 3/14/24 8:40 AM, Richard Purdie wrote:<br>
&gt; On Wed, 2024-03-13 at 15:08 +0800, wangmy via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a><br>
&gt; wrote:<br>
&gt;&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank" rel=3D"noreferrer">wangmy@fujitsu.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; License-Update:<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; *COPYING:<br>
&gt;&gt;=C2=A0 =C2=A0Add the license for the XZ logo.<br>
&gt;&gt;=C2=A0 =C2=A0Change most public domain parts to 0BSD.<br>
&gt;&gt;=C2=A0 =C2=A0Update COPYING about the man pages of the scripts.<br>
&gt;&gt; *getopt.c<br>
&gt;&gt;=C2=A0 =C2=A0MSVC: Don&#39;t #include &lt;unistd.h&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0lib/getopt*.c: Include &lt;config.h&gt; only HAVE_CONF=
IG_H is defined.<br>
&gt;&gt;=C2=A0 =C2=A0lib: Update getopt.c from Gnulib with modifications.<b=
r>
&gt;&gt;=C2=A0 =C2=A0lib: Silence -Wsign-conversion in getopt.c.<br>
&gt;&gt;=C2=A0 =C2=A0Add SPDX license identifiers to GPL, LGPL, and FSFULLR=
 files.<br>
&gt;&gt;<br>
&gt;&gt; Changelog:<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; * liblzma: Fixed two bugs relating to GNU indirect function (IFUNC=
)<br>
&gt;&gt;=C2=A0 =C2=A0 with GCC.<br>
&gt;&gt; * xz: Changed the messages for thread reduction due to memory<br>
&gt;&gt;=C2=A0 =C2=A0 constraints to only appear under the highest verbosit=
y level.<br>
&gt;&gt; * Build:<br>
&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 - Fixed a build issue when the header fil=
e &lt;linux/landlock.h&gt;<br>
&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 was present on the system but=
 the Landlock system calls were<br>
&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not defined in &lt;sys/syscal=
l.h&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 - The CMake build now warns and disables =
NLS if both gettext<br>
&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tools and pre-created .gmo fi=
les are missing. Previously,<br>
&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this caused the CMake build t=
o fail.<br>
&gt;&gt; * Minor improvements to man pages.<br>
&gt;&gt; * Minor improvements to tests.<br>
&gt; <br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/48/=
builds/8737" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobu=
ilder.yoctoproject.org/typhoon/#/builders/48/builds/8737</a><br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197643): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197643" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/197643</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105226831/582=
7677" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/105226831/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000604b130614df9db6--

