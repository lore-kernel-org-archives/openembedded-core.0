Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0919C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 05:25:34 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.20845.1719725109079183598
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jun 2024 22:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hgN77x/A;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-64b417e1511so17052317b3.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Jun 2024 22:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719725108; x=1720329908; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BykLWGTd2FTObbua4Eit3VK+b2LSk1G1jnTZ9kqd3n4=;
        b=hgN77x/AZUOlT8ILnTZHMU/8XdKSyMx+1gKw0bHZqvg4hoSU/PxeHxlAlhRGU3z66K
         iJHABD4YtBFSHW/+PHkeqbob+LZ8XMxN9j3bx1ycJZ65qPIJssbXTaa6ArK76qbqQR8T
         1Q073pwjuF70vDjDShk2HUNu1uOzX/A9WZWJ28DfG38xsDJ1f1UsN7sY3nHNaAaJaKh8
         3M6iy6XksycrVzYAI7a3Rv76A1g7lLJ/dRq0BkKnnZwErYr0UUW44EBKUf/MnYAjGh4M
         ELed4wYzMbGZB/HZFr/AGguDIKlndE0uKJOe++47yotpw51nuTFyTFY+eTffkZA69P+A
         iW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719725108; x=1720329908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BykLWGTd2FTObbua4Eit3VK+b2LSk1G1jnTZ9kqd3n4=;
        b=klk9pendJWL86auoRW6aZeBJnHfHGt6dtOOAV4IzfouUMHBnSMDqvF7vcPVVulr7Nl
         dpvCQHF9SUmm+p29PGue8oaN4CzMGCZz+aSWiRXybaVGAe71QsUU/gIUQBcR0V5eN0Iy
         oCSgaSSbFP6n7J9wN3X1DLzyhu8rP72f2te3Tv9oui8E8xKDbXTeTMb7crnsjCzEmify
         z9F5IxvM41Omn55/RT0WMxUhixeWMtahEy9EXWNJJq/jQnTWQFbqgispm2mLPx74Rjk3
         lReAU5in6S+r9+Lhs6bVXEuXIwD23M9ixtRJvUawuGxS1AMRSMwy+izprWCOeo9IwSqH
         62tw==
X-Forwarded-Encrypted: i=1; AJvYcCVF3hTe9Q1/NBHsqRXtUyyipuwFZtnBbQ5HJvkbTrWIcjEe4lpzTKsYFyYEW6mQ9bEGXbMFXiRAhXR4KxBuhPtlHQfxmrsiST7RzV7FlCnvoBV95rmp3oEd
X-Gm-Message-State: AOJu0YxUHlgDzxzaHk+X5aFvlhUObR/mixmtjPjWU6foKQZmHt/qeqLQ
	YicIemRJZlikZiD8HFGf/c73g0RP/4ZKsi2gwEkC6coNY7R1yGm+qY3o3MaWjuCAm/nBO+bdONa
	DsxvLZlKSybSGFF7dttjNK6EpwsU=
X-Google-Smtp-Source: AGHT+IGlMK/9DQhFM3altdOioBGktPWsjGGKquOrwMjIRCyM18RKqYZ6FHORGmIq+iuXlPT/sPxFKzzctXGwLrwYtMU=
X-Received: by 2002:a05:690c:a05:b0:64b:4a32:850a with SMTP id
 00721157ae682-64c71dd0ff3mr23087637b3.29.1719725108099; Sat, 29 Jun 2024
 22:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240628150116.3799311-1-alex.kanavin@gmail.com>
In-Reply-To: <20240628150116.3799311-1-alex.kanavin@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 29 Jun 2024 22:24:56 -0700
Message-ID: <CANx9H-DyHHy1rOE+MpyC7KYkQV+tyU8V0UcJDoV=Lw8TswzQpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: drop deterministic_imports.patch
To: alex.kanavin@gmail.com
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002e00ce061c14b4c8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 05:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201231

--0000000000002e00ce061c14b4c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 8:01=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> From: Alexander Kanavin <alex@linutronix.de>
>
> https://github.com/python/importlib_metadata/issues/489
>

Interesting read. Dropping the patch is clearly the correct thing to do.

Thank you for following through with upstream.

>
> Upstream discussion revealed that:
>
> - the issue was happening due to a bug in setuptools
>
> - the bug was fixed in setuptools 63 (I confirmed this: empty dist-info
> directories no longer seem to trigger any issues if the patch is dropped)
>
> - the patch would obscure any further issues of this kind instead of
> exposing them
> for easy fixing, so they suggest we drop it and report if anything else
> pops up


Like you, I suspect we won=E2=80=99t see issues until something else =E2=80=
=9Cbreaks=E2=80=9D in
the future.


>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Reviewed-by: Tim Orling <tim.orling@konsulko.com>

>
> ---
>  .../python3/deterministic_imports.patch       | 40 -------------------
>  .../recipes-devtools/python/python3_3.12.4.bb |  1 -
>  2 files changed, 41 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/python/python3/deterministic_imports.patch
>
> diff --git
> a/meta/recipes-devtools/python/python3/deterministic_imports.patch
> b/meta/recipes-devtools/python/python3/deterministic_imports.patch
> deleted file mode 100644
> index 2de6ae2e981..00000000000
> --- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 039d5e652796b55f1132afa568c7432b6ed89afd Mon Sep 17 00:00:00 2001
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Date: Fri, 27 May 2022 17:05:44 +0100
> -Subject: [PATCH] python3: Ensure stale empty python module directories
> don't
> -
> -There are two issues here. Firstly, the modules are accessed in on disk
> order. This
> -means behaviour seen on one system might not reproduce on another and is
> a real headache.
> -
> -Secondly, empty directories left behind by previous modules might be
> looked at. This
> -has caused a long string of different issues for us.
> -
> -As a result, patch this to a behaviour which works for us.
> -
> -Upstream-Status: Submitted [
> https://github.com/python/cpython/issues/120492; need to first talk to
> upstream to see if they'll take one or both fixes]
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> ----
> - Lib/importlib/metadata/__init__.py | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/Lib/importlib/metadata/__init__.py
> b/Lib/importlib/metadata/__init__.py
> -index 82e0ce1..969cac4 100644
> ---- a/Lib/importlib/metadata/__init__.py
> -+++ b/Lib/importlib/metadata/__init__.py
> -@@ -710,7 +710,14 @@ class Lookup:
> -         self.infos =3D FreezableDefaultDict(list)
> -         self.eggs =3D FreezableDefaultDict(list)
> -
> --        for child in path.children():
> -+        for child in sorted(path.children()):
> -+            childpath =3D pathlib.Path(path.root, child)
> -+            try:
> -+                if childpath.is_dir() and not any(childpath.iterdir()):
> -+                    # Empty directories aren't interesting
> -+                    continue
> -+            except PermissionError:
> -+                continue
> -             low =3D child.lower()
> -             if low.endswith((".dist-info", ".egg-info")):
> -                 # rpartition is faster than splitext and suitable for
> this purpose.
> diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb
> b/meta/recipes-devtools/python/python3_3.12.4.bb
> index 8b5e7bd99cb..eb3866d9be7 100644
> --- a/meta/recipes-devtools/python/python3_3.12.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.4.bb
> @@ -24,7 +24,6 @@ SRC_URI =3D "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://makerace.patch \
>             file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patc=
h
> \
>
> file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
> -           file://deterministic_imports.patch \
>             file://0001-Avoid-shebang-overflow-on-python-config.py.patch =
\
>             file://0001-Update-test_sysconfig-for-posix_user-purelib.patc=
h
> \
>
> file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201224):
> https://lists.openembedded.org/g/openembedded-core/message/201224
> Mute This Topic: https://lists.openembedded.org/mt/106929238/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002e00ce061c14b4c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jun 28, 2024 at 8:01=E2=80=AFAM Alexander Kanavin v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Al=
exander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_blank"=
>alex@linutronix.de</a>&gt;<br>
<br>
<a href=3D"https://github.com/python/importlib_metadata/issues/489" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/python/importlib_metadata/=
issues/489</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Interesting read=
. Dropping the patch is clearly the correct thing to do.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thank you for following through with upstr=
eam.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)"><br>
Upstream discussion revealed that:<br>
<br>
- the issue was happening due to a bug in setuptools<br>
<br>
- the bug was fixed in setuptools 63 (I confirmed this: empty dist-info<br>
directories no longer seem to trigger any issues if the patch is dropped)<b=
r>
<br>
- the patch would obscure any further issues of this kind instead of exposi=
ng them<br>
for easy fixing, so they suggest we drop it and report if anything else pop=
s up</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Like you, I =
suspect we won=E2=80=99t see issues until something else =E2=80=9Cbreaks=E2=
=80=9D in the future.</div><div dir=3D"auto"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto"><br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;</blockquote><div dir=3D"auto">=
Reviewed-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.=
orling@konsulko.com</a>&gt;</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
---<br>
=C2=A0.../python3/deterministic_imports.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
0 -------------------<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a> |=C2=A0 1 -<br>
=C2=A02 files changed, 41 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/deterministic=
_imports.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.pat=
ch b/meta/recipes-devtools/python/python3/deterministic_imports.patch<br>
deleted file mode 100644<br>
index 2de6ae2e981..00000000000<br>
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 039d5e652796b55f1132afa568c7432b6ed89afd Mon Sep 17 00:00:00 2001<br>
-From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
-Date: Fri, 27 May 2022 17:05:44 +0100<br>
-Subject: [PATCH] python3: Ensure stale empty python module directories don=
&#39;t<br>
-<br>
-There are two issues here. Firstly, the modules are accessed in on disk or=
der. This<br>
-means behaviour seen on one system might not reproduce on another and is a=
 real headache.<br>
-<br>
-Secondly, empty directories left behind by previous modules might be looke=
d at. This<br>
-has caused a long string of different issues for us.<br>
-<br>
-As a result, patch this to a behaviour which works for us.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpython/i=
ssues/120492" rel=3D"noreferrer" target=3D"_blank">https://github.com/pytho=
n/cpython/issues/120492</a>; need to first talk to upstream to see if they&=
#39;ll take one or both fixes]<br>
-Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
-<br>
----<br>
- Lib/importlib/metadata/__init__.py | 9 ++++++++-<br>
- 1 file changed, 8 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/_=
_init__.py<br>
-index 82e0ce1..969cac4 100644<br>
---- a/Lib/importlib/metadata/__init__.py<br>
-+++ b/Lib/importlib/metadata/__init__.py<br>
-@@ -710,7 +710,14 @@ class Lookup:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.infos =3D FreezableDefaultDict(list=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.eggs =3D FreezableDefaultDict(list)=
<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 for child in path.children():<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for child in sorted(path.children()):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 childpath =3D pathlib.Path(path=
.root, child)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if childpath.is_d=
ir() and not any(childpath.iterdir()):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # E=
mpty directories aren&#39;t interesting<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
tinue<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except PermissionError:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0low =3D child.lower()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if low.endswith((&quot;.di=
st-info&quot;, &quot;.egg-info&quot;)):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# rpartition=
 is faster than splitext and suitable for this purpose.<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.4.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a> b/meta/recip=
es-devtools/python/<a href=3D"http://python3_3.12.4.bb" rel=3D"noreferrer" =
target=3D"_blank">python3_3.12.4.bb</a><br>
index 8b5e7bd99cb..eb3866d9be7 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a><br>
@@ -24,7 +24,6 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/py=
thon/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank=
">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://makerace.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-sysconfig.py-use-plat=
libdir-also-for-purelib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Lib-pty.py-handle-std=
in-I-O-errors-same-way-as-maste.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://deterministic_imports.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Avoid-shebang-overflo=
w-on-python-config.py.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Update-test_sysconfig=
-for-posix_user-purelib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-skip-no_stdout_fileno=
-test-due-to-load-variability.patch \<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201224): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201224" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201224</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106929238/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106929238/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002e00ce061c14b4c8--

