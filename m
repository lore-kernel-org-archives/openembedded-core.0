Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD29CA6CBF
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:20:47 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6618.1769505644920426164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DuxL5nJJ;
 spf=pass (domain: konsulko.com, ip: 209.85.215.179, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c63555db09fso1084308a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 01:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769505644; cv=none;
        d=google.com; s=arc-20240605;
        b=eb0RjOd/kdF8JpC50svLjALVm4vMIDDS9ErrD28tcWqccKA5h3Py4vi922jrphGUvG
         2RPU4UBu5uUxoWM99NAl8Y5rGJkr5YIKQhuplJhvWfQ8zS9AM1ihp72nS/6iDeynzi7S
         OdtvIxSuhJnHMrGO630Q5YpqH1W5zh8IbxXFZhbFJtuHxqzjcWFYUZEagw54aJeA/BCu
         Bk1aijOI55FL9kAc0nZq/0M06FPbBwjsgTQ+njkT9zZIii2TPauhuoVWj/bhd+1H7FwP
         mfNIaNbv4pITPeyEiZWRRI6Ruup4p2vDAaB5ACGamgMeBuMJdWkB+84gqPBfYwJMIoh7
         UDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b06cSU7ZVKypajqpg7zIuUDdWR7ZXPayFE5C4A0cric=;
        fh=zkxhuokCMv0Gi8jReSong71i+W1WYaJk421efuLdVxQ=;
        b=XZPPWkRGpDO17H/at4iKQQFyHYk4yHlJKT4kHZM7bG5/GI2yPgUbRHKHS8HldCaCiS
         vugtda5RJwoJRD8XiUAds8yrjh3BD3k1yg5js0VQ/Azc7J2vEujNTavjRqlr8Q+UPzv2
         DkvyL0nkC4F9o23hEn0GUiY8Dai5Rz0ADFKd/7zCDK02LiakpKy00YzKb7Vjfs5nmFiM
         dXSbj2H2N7Kz5ZGZ1WI8Yizt6NPg3IzZEIyEr2lxwE6aC3SbPqT/ZnqDrntDh9ryCQd9
         dX7MgNqJGiaBcWNeED9ke6KYnm4VDar/2uuskg6p+bhnNd76s+ZDuJn/fdMN5Al7Hlea
         eyJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769505644; x=1770110444; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b06cSU7ZVKypajqpg7zIuUDdWR7ZXPayFE5C4A0cric=;
        b=DuxL5nJJrRr8HMl7NIM1d9zIA7d1adHDJR5TWIxztYI6rJuJQVutqnfqyOr/PESa2R
         DgYKm4Oq4hW8TU0Y1AFCQS4zLvJ0wDXYfQyzAmmvlV0ESi8+n14ow7CyL1au8ABSFSZl
         MkCGnuHdUDk2HeEgWZNoatkkZgam/+8UdtD6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505644; x=1770110444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b06cSU7ZVKypajqpg7zIuUDdWR7ZXPayFE5C4A0cric=;
        b=gHFPGWQzSqoL1evw4GFCm/w1XjeLfSfp5n/kTXe/wg9risSF3nSg+GJR6ENk9nfN09
         JHl+fuS6sU64+PFbE1c6gulkGBU/Mt+aqci0bc0mwIpn6T3g2oUlZUJkR6FBwPKts8GU
         P+uv/WNLB1Xsf7RPNHma5w3FtHJFRt4nM7GGhgCGGJOwsX+3YpEPLY4Y491keibcNloL
         oakzOjafMif7hcBqqa5o5mo4H/FNRIseUHsteInP+c3EM4GNj4/sH3bU3bYX83BqGs1C
         1vj8R/iysqzYlTnq/kpzw4R4dRsbghUoERrW7BIpwCLM3KebjKOPXpbl5Kuyb3r6ee/9
         /Qdw==
X-Gm-Message-State: AOJu0YwruEwAJJg4is3ihCsJwsjZB0EhttJLwl7i9O30okZcEvJ0rTsg
	m3JsEJm6ukQ/J50P6MJW3dWmgfTIwcsNSE3yqkKz/Pfk75ZxNbA1Xy3wPs+/OuJ9sJMvHJdD5AZ
	XVUbFe/Pw9DZJoIWJdQyuoXHE3IdmIk1IovfSbVN0GeRHZHqDu0PZyx5AgQ==
X-Gm-Gg: AZuq6aI/byR1RLIOm9ktcBqrs/lg2/mnhzuG6zINDna5aeIRPaMG2Hk1WjILILmdBU3
	YqyMkQJ8lk3ic+NANsni48WrfcWIcx7ipAVDIbODg5JnmgO0IPiHXwJL2f7hrNxuqKzpFnN6Ggh
	fsYUQbnXrsf7uca3/E9tSf9mxx09AAlUbXP0o48A33bR5q1tiS9fMVxsNxUEC+86Mb030Dx1wwW
	gVY8mPYn7sbYVIk70HoZP+nAvyjUFemnWuisfRrPtTcbQYjX5MwiWhfml87VUzNq6/kdg==
X-Received: by 2002:a17:90b:3802:b0:343:3898:e7c9 with SMTP id
 98e67ed59e1d1-353ff8b45a6mr927798a91.2.1769505644215; Tue, 27 Jan 2026
 01:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20260123084336.3061764-1-leon.anavi@konsulko.com> <CA+chaQcjfc2w1Tt7L43VR4H=fV8NM9k8h8mNZwjPp3FejQr4ag@mail.gmail.com>
In-Reply-To: <CA+chaQcjfc2w1Tt7L43VR4H=fV8NM9k8h8mNZwjPp3FejQr4ag@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Tue, 27 Jan 2026 11:20:33 +0200
X-Gm-Features: AZwV_QgDHN6s0pH8QzBbMQf-7nw86Q9nbLItu4YKV6vRly7hFVjr_pp8Si50YEY
Message-ID: <CALtQ3O3BZwWd55xXNKoVNkYsHmvDHZQ2Didg=cO9v9WRPkb8CA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005a0ce106495b23d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 09:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230037

--0000000000005a0ce106495b23d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Fri, Jan 23, 2026 at 10:56=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om>
wrote:

> Thanks, but this needs python3-backports-zstd to be imported from
> meta-oe to fix the ptest as discussed in:
> https://lists.openembedded.org/g/openembedded-core/message/228548
> https://lists.openembedded.org/g/openembedded-core/message/229015
>
> And if python3-backports-zstd is no longer needed with python-3.14 now
> in oe-core, then you need to drop the whole
> do_configure:append:arm:toolchain-clang.
>

Thank you for the feedback. Yes, python3-backports-zstd is no longer needed
with Python 3.14. I tested it manually at run-time on rpi5 and also ran
ptest-runner. Based on your recommendation I
dropped do_configure:append:arm:toolchain-clang and sent v2 of the patch.

Btw on a separate topic: I haven't seen any remarks regarding my other
patch from Friday for updating python3-wcwidth to 0.3.1 but it hasn't been
picked up in master-next yet. Please let me know if any modifications are
needed.

Best regards, Leon


>
> Regards,
>
> On Fri, Jan 23, 2026 at 9:43=E2=80=AFAM Leon Anavi via lists.openembedded=
.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
> >
> > Upgrade to release 0.19.1:
> >
> > - Fix SeekableZstdFile write table entries on 32-bits architectures
> >   when there is a huge number of entries
> >
> > From release 0.19.0:
> >
> > - The project has been completely refactored to use the Zstandard
> >   implementation from the standard library (PEP-784)
> > - The refactor has some minor impact on public APIs, such as
> >   changing the exception raised on invalid input
> > - Add backports.zstd dependency for Python before 3.14
> > - Changes in build dependency: remove setuptools and C build
> >   toolchain, add hatchling and hatch-vcs
> > - Remove git submodule usage
> > - Drop support for Python 3.9 and below
> > - Use ruff as formatter and linter
> > - Embed type hints in Python code, and check with mypy
> >
> > All ptests pass following python3 upgrade from 3.13.11 to 3.14.0.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  ...emove-setuptools-version-limit-of-74.patch | 27 -------------------
> >  ...std_0.17.0.bb =3D> python3-pyzstd_0.19.1.bb} |  7 ++---
> >  2 files changed, 4 insertions(+), 30 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-versio=
n-limit-of-74.patch
> >  rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb =3D>
> python3-pyzstd_0.19.1.bb} (73%)
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-vers=
ion-limit-of-74.patch
> b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-vers=
ion-limit-of-74.patch
> > deleted file mode 100644
> > index f2910322ff..0000000000
> > ---
> a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-vers=
ion-limit-of-74.patch
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Wed, 9 Apr 2025 14:38:31 -0700
> > -Subject: [PATCH] Remove setuptools version limit of '74'
> > -
> > -Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
> > -support beyond that which is needed for python 3.9 on windows. We
> > -do not have this problem on Linux
> > -
> > -Upstream-Status: Inappropriate [OE-specific]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - pyproject.toml | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/pyproject.toml b/pyproject.toml
> > -index dd885e4..5d4d511 100644
> > ---- a/pyproject.toml
> > -+++ b/pyproject.toml
> > -@@ -1,6 +1,6 @@
> > - [build-system]
> > - # setuptools 64+ support --build-option
> > - # setuptools 74+ drops distutils.msvc9compiler required for Python 3.=
9
> under Windows
> > --requires =3D ["setuptools>=3D64,<74"]
> > -+requires =3D ["setuptools>=3D64"]
> > - backend-path =3D ["build_script"]
> > - build-backend =3D "pyzstd_pep517"
> > diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> > similarity index 73%
> > rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> > rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> > index af7069b6ed..a41c16682d 100644
> > --- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> > +++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> > @@ -9,10 +9,11 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Daedb5a2679cd1552fb61c181ef974b9e"
> >
> >  PYPI_PACKAGE =3D "pyzstd"
> >
> > -SRC_URI +=3D "file://0001-Remove-setuptools-version-limit-of-74.patch"
> > -SRC_URI[sha256sum] =3D
> "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
> > +SRC_URI[sha256sum] =3D
> "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d586937830a8afc7d72"
> >
> > -inherit pypi python_setuptools_build_meta ptest-python-pytest
> > +inherit pypi python_hatchling ptest-python-pytest
> > +
> > +DEPENDS +=3D "python3-hatch-vcs-native"
> >
> >  # clang-16 with -flto segfaults on arm, therefore ignore flto for now
> >  do_configure:append:arm:toolchain-clang() {
> > --
> > 2.47.3
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#229876):
> https://lists.openembedded.org/g/openembedded-core/message/229876
> > Mute This Topic: https://lists.openembedded.org/mt/117415035/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000005a0ce106495b23d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Martin,</div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 23, =
2026 at 10:56=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gm=
ail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Thanks, but this needs python3-backports-z=
std to be imported from<br>
meta-oe to fix the ptest as discussed in:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22854=
8" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/228548</a><br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/22901=
5" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/229015</a><br>
<br>
And if python3-backports-zstd is no longer needed with python-3.14 now<br>
in oe-core, then you need to drop the whole<br>
do_configure:append:arm:toolchain-clang.<br></blockquote><div><br>Thank you=
 for the feedback. Yes, python3-backports-zstd is no longer needed with Pyt=
hon 3.14. I tested it manually at run-time on rpi5 and also ran ptest-runne=
r. Based on your recommendation I dropped=C2=A0do_configure:append:arm:tool=
chain-clang and sent v2 of the patch.<br><br>Btw on a separate topic: I hav=
en&#39;t seen any remarks regarding my other patch from Friday for updating=
 python3-wcwidth=C2=A0to 0.3.1 but it hasn&#39;t been picked up in master-n=
ext yet. Please let me know if any modifications are needed.<br><br>Best re=
gards, Leon</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Regards,<br>
<br>
On Fri, Jan 23, 2026 at 9:43=E2=80=AFAM Leon Anavi via <a href=3D"http://li=
sts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedd=
ed.org</a><br>
&lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org" tar=
get=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Upgrade to release 0.19.1:<br>
&gt;<br>
&gt; - Fix SeekableZstdFile write table entries on 32-bits architectures<br=
>
&gt;=C2=A0 =C2=A0when there is a huge number of entries<br>
&gt;<br>
&gt; From release 0.19.0:<br>
&gt;<br>
&gt; - The project has been completely refactored to use the Zstandard<br>
&gt;=C2=A0 =C2=A0implementation from the standard library (PEP-784)<br>
&gt; - The refactor has some minor impact on public APIs, such as<br>
&gt;=C2=A0 =C2=A0changing the exception raised on invalid input<br>
&gt; - Add backports.zstd dependency for Python before 3.14<br>
&gt; - Changes in build dependency: remove setuptools and C build<br>
&gt;=C2=A0 =C2=A0toolchain, add hatchling and hatch-vcs<br>
&gt; - Remove git submodule usage<br>
&gt; - Drop support for Python 3.9 and below<br>
&gt; - Use ruff as formatter and linter<br>
&gt; - Embed type hints in Python code, and check with mypy<br>
&gt;<br>
&gt; All ptests pass following python3 upgrade from 3.13.11 to 3.14.0.<br>
&gt;<br>
&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.co=
m" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...emove-setuptools-version-limit-of-74.patch | 27 -------------=
------<br>
&gt;=C2=A0 ...<a href=3D"http://std_0.17.0.bb" rel=3D"noreferrer" target=3D=
"_blank">std_0.17.0.bb</a> =3D&gt; <a href=3D"http://python3-pyzstd_0.19.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.19.1.bb</a>} |=C2=
=A0 7 ++---<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 30 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3-pyzstd/0=
001-Remove-setuptools-version-limit-of-74.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-p=
yzstd_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0=
.bb</a> =3D&gt; <a href=3D"http://python3-pyzstd_0.19.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pyzstd_0.19.1.bb</a>} (73%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-s=
etuptools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-=
pyzstd/0001-Remove-setuptools-version-limit-of-74.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f2910322ff..0000000000<br>
&gt; --- a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptoo=
ls-version-limit-of-74.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,27 +0,0 @@<br>
&gt; -From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 9 Apr 2025 14:38:31 -0700<br>
&gt; -Subject: [PATCH] Remove setuptools version limit of &#39;74&#39;<br>
&gt; -<br>
&gt; -Upstream sticks to 0.74 since setuptools have dropped msvc9compiler<b=
r>
&gt; -support beyond that which is needed for python 3.9 on windows. We<br>
&gt; -do not have this problem on Linux<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [OE-specific]<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - pyproject.toml | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/pyproject.toml b/pyproject.toml<br>
&gt; -index dd885e4..5d4d511 100644<br>
&gt; ---- a/pyproject.toml<br>
&gt; -+++ b/pyproject.toml<br>
&gt; -@@ -1,6 +1,6 @@<br>
&gt; - [build-system]<br>
&gt; - # setuptools 64+ support --build-option<br>
&gt; - # setuptools 74+ drops distutils.msvc9compiler required for Python 3=
.9 under Windows<br>
&gt; --requires =3D [&quot;setuptools&gt;=3D64,&lt;74&quot;]<br>
&gt; -+requires =3D [&quot;setuptools&gt;=3D64&quot;]<br>
&gt; - backend-path =3D [&quot;build_script&quot;]<br>
&gt; - build-backend =3D &quot;pyzstd_pep517&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-py=
zstd_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0.=
bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-pyzstd_0.19=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.19.1.bb</a><br=
>
&gt; similarity index 73%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-pyz=
std_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0.b=
b</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-pyzst=
d_0.19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.19.1.bb<=
/a><br>
&gt; index af7069b6ed..a41c16682d 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-pyzstd_0.=
17.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.17.0.bb</a><=
br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pyzstd_0.=
19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyzstd_0.19.1.bb</a><=
br>
&gt; @@ -9,10 +9,11 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Daedb=
5a2679cd1552fb61c181ef974b9e&quot;<br>
&gt;<br>
&gt;=C2=A0 PYPI_PACKAGE =3D &quot;pyzstd&quot;<br>
&gt;<br>
&gt; -SRC_URI +=3D &quot;file://0001-Remove-setuptools-version-limit-of-74.=
patch&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d84271f8baa66c419204c1dd115a4dec8b266f8a=
2921da21b81764fa208c1db6&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;36723d3c915b3981de9198d0a2c82b2f5fe3eaa3=
6e4d8d586937830a8afc7d72&quot;<br>
&gt;<br>
&gt; -inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
&gt; +inherit pypi python_hatchling ptest-python-pytest<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;python3-hatch-vcs-native&quot;<br>
&gt;<br>
&gt;=C2=A0 # clang-16 with -flto segfaults on arm, therefore ignore flto fo=
r now<br>
&gt;=C2=A0 do_configure:append:arm:toolchain-clang() {<br>
&gt; --<br>
&gt; 2.47.3<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#229876): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/229876" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/229876</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11741503=
5/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/117415035/3617156</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.co=
m" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000005a0ce106495b23d2--

