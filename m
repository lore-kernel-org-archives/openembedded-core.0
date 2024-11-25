Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2875ED58D7C
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:36:56 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.25913.1732559812364189189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 10:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cNVmsl28;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ea5120dd60so521739b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732559811; x=1733164611; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nCcwwWt8ls7aywPCaDVJjzU//RwDeP+8IIddbjyvVd8=;
        b=cNVmsl28g1gCxVdoe0CSr7OQ5iNIHDYyWwdCVGGyRTSfaeYXcpWFsY4oexstnFPw0y
         azvYgj189UDAX3OACXpxA0jXe69itIdvWqZIlMsZjdQwHI+Qhe3mV7uK/xqMWSDyOSgv
         CbMLQIYh3ktJfqYxeC8jCykyI/SPAwlxDfOFZG9H5sQ5HU0H1P+fOsgz+tABrzucmw+g
         PbljLAbWBK5hfTm3ziTGoD9v/kCzAcw2III49esUNzv1WQnVhOHavAqUxLYElsfkb9sc
         6IEuGQqmJ6Stz/O2aMPz4f5lwH8wLjPd9eTnS+HZO4CygPg4FC64I4l0Peim7bCkYLB6
         7KVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732559811; x=1733164611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCcwwWt8ls7aywPCaDVJjzU//RwDeP+8IIddbjyvVd8=;
        b=catuSQ4g9ewBxrRS610x+HomDPFgFsqc5y/Gfzu+sZ4CRDYewDECZ2/yDZmriqN8oB
         FcWOZ6CTUEh6hBlATPtmNdd/GFMVlWbI0LRGPYcJPhnnnyqQAtcZQ1jdarvDyuD9S369
         5PNR5sQZ17nENn7M0oq1OxCLUFqJdNVI+TJ+lEMDLDRP8ZQUv0FUcFvwOWlqoQVO24Zn
         mgggDboH20pezSRB6KyDEwQpXgkrMwdObFfgCt69VPZvEjKWlZgyRR5Tgl8MWbMnTZzf
         jijzMgIOnpYsDsWjiFOAzfMJ0lY/lP5j5hMpvYmxwWvc6bLqAx0JDR42sDYMzvuzImVz
         e6qg==
X-Gm-Message-State: AOJu0Yz5iuzkTJ5ipk2RTmfhBNPYlkeIkt/gfbaskfjlV/A57PYBTHFl
	l+76kLQzLs4KiQ1BcyDlmWIdESR3R1BRBOum7OM6Y/19HHlL5zslwPtXM5PuYd06+E8PVRpfCgA
	TZWQcjJnN05+Io5SqnM9bg9lnEBA=
X-Gm-Gg: ASbGncsSQJVcg/oKMUHvfaRy/X/QC71QIqn1dj3Upp7jMllLzOGIxYzm0Rf1lvNyZxy
	zBALTTzhHF4JGqaciqgtBdT7pU8GKShsei2gjUSRWTHGvX5FCwFHydnpxBhzLpw==
X-Google-Smtp-Source: AGHT+IHYawvCcje0NR639tpmWcPzWTJteOCimBGPGREN/5L+LQcBgnC7lwDsRg7wrLOT9DV3Xt2THMeido8dTGyPyLo=
X-Received: by 2002:a05:6808:2185:b0:3ea:4f8c:e54e with SMTP id
 5614622812f47-3ea4f8cf698mr3006229b6e.17.1732559811431; Mon, 25 Nov 2024
 10:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20241125120127.2205232-1-alex.kanavin@gmail.com> <20241125120127.2205232-8-alex.kanavin@gmail.com>
In-Reply-To: <20241125120127.2205232-8-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2024 10:36:40 -0800
Message-ID: <CAMKF1so3Azx6swzqwshQ4W5SRGo0H28hCboqN1mpovEcPrkFpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/35] gawk: upgrade 5.3.0 -> 5.3.1
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000001cd3340627c1044d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 18:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207795

--0000000000001cd3340627c1044d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 4:02=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> From: Alexander Kanavin <alex@linutronix.de>
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...c-re-enable-disabled-printf-features.patch | 35 +++++++++++++++++
>  ...001-m4-readline-add-missing-includes.patch | 38 -------------------
>  .../gawk/{gawk_5.3.0.bb =3D> gawk_5.3.1.bb}     |  4 +-
>  3 files changed, 37 insertions(+), 40 deletions(-)
>  create mode 100644
> meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-prin=
tf-features.patch
>  delete mode 100644
> meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.pat=
ch
>  rename meta/recipes-extended/gawk/{gawk_5.3.0.bb =3D> gawk_5.3.1.bb} (94=
%)
>
> diff --git
> a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-pr=
intf-features.patch
> b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-pr=
intf-features.patch
> new file mode 100644
> index 00000000000..4fe60c7cb83
> --- /dev/null
> +++
> b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-pr=
intf-features.patch
> @@ -0,0 +1,35 @@
> +From 879fb11c7c006a8533a092fb75b38d84cc570d83 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Fri, 22 Nov 2024 12:13:58 +0100
> +Subject: [PATCH] configure.ac: re-enable disabled printf features
> +
> +This is needed for ptests to pass for one thing.
> +
> +Upstream-Status: Inappropriate [needs a config option]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index cb99ffe..5fe792f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -398,7 +398,7 @@ int main()
> + ])],
> +       has_f_format=3Dyes,
> +       has_f_format=3Dno,
> +-      has_f_format=3Dno  dnl Cross-compiling, assuming the worst.
> ++      has_f_format=3Dyes  dnl Cross-compiling in oe-core


Does this work if you pass is via EXTRA_OECONF


> + )
> + if test "$has_f_format" =3D yes
> + then
> +@@ -427,7 +427,7 @@ int main()
> + ])],
> +       has_a_format=3Dyes,
> +       has_a_format=3Dno,
> +-      has_a_format=3Dno  dnl Cross-compiling, assuming the worst.
> ++      has_a_format=3Dyes  dnl Cross-compiling in oe-core
> + )
> + if test "$has_a_format" =3D yes
> + then
> diff --git
> a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.p=
atch
> b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.p=
atch
> deleted file mode 100644
> index 6fffd1f373a..00000000000
> ---
> a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.p=
atch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Tue, 21 May 2024 15:10:11 +0000
> -Subject: [PATCH] m4/readline: add missing includes
> -
> -The cross-specific code fragment only includes stdio.h, where the native
> -fragment also includes fcntl.h and unistd.h.  This is important because
> -GCC 14.1 has made the implicit definitions an error:
> -
> -conftest.c: In function 'main':
> -conftest.c:144:9: error: implicit declaration of function 'close'; did
> you mean 'pclose'? [-Wimplicit-function-declaration]
> -conftest.c:146:14: error: implicit declaration of function 'open'; did
> you mean 'popen'? [-Wimplicit-function-declaration]
> -
> -Add the missing includes so that the check doesn't always fail due to
> -these errors.
> -
> -Upstream-Status: Backport [
> https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Dc1613c310d71b87f5=
09458e0259ecd10eda2b140
> ]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - m4/readline.m4 | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/m4/readline.m4 b/m4/readline.m4
> -index 38f96326..efd52d4e 100644
> ---- a/m4/readline.m4
> -+++ b/m4/readline.m4
> -@@ -66,6 +66,8 @@ dnl action if false:
> - dnl action if cross compiling:
> -               [AC_LINK_IFELSE(
> -                       [AC_LANG_PROGRAM([[#include <stdio.h>
> -+#include <fcntl.h>
> -+#include <unistd.h>
> - #include <readline/readline.h>
> - #include <readline/history.h>]],              dnl includes
> -                       dnl function body
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> b/meta/recipes-extended/gawk/gawk_5.3.1.bb
> similarity index 94%
> rename from meta/recipes-extended/gawk/gawk_5.3.0.bb
> rename to meta/recipes-extended/gawk/gawk_5.3.1.bb
> index ac9d8500d60..bd72fbf2808 100644
> --- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.3.1.bb
> @@ -16,11 +16,11 @@ PACKAGECONFIG[readline] =3D
> "--with-readline,--without-readline,readline"
>  PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr, mpfr"
>
>  SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
> -           file://0001-m4-readline-add-missing-includes.patch \
>             file://run-ptest \
> +
>  file://0001-configure.ac-re-enable-disabled-printf-features.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
> +SRC_URI[sha256sum] =3D
> "fa41b3a85413af87fb5e3a7d9c8fa8d4a20728c67651185bb49c38a7f9382b1e"
>
>  inherit autotools gettext texinfo update-alternatives
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207756):
> https://lists.openembedded.org/g/openembedded-core/message/207756
> Mute This Topic: https://lists.openembedded.org/mt/109769662/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001cd3340627c1044d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 25, 2024 at 4:02=E2=80=AFAM Alexander Kanavin v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0...c-re-enable-disabled-printf-features.patch | 35 +++++++++++++++++<=
br>
=C2=A0...001-m4-readline-add-missing-includes.patch | 38 ------------------=
-<br>
=C2=A0.../gawk/{<a href=3D"http://gawk_5.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gawk_5.3.0.bb</a> =3D&gt; <a href=3D"http://gawk_5.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gawk_5.3.1.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 +-<br>
=C2=A03 files changed, 37 insertions(+), 40 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/gawk/gawk/0001-configure.ac-=
re-enable-disabled-printf-features.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/gawk/gawk/0001-m4-readline-a=
dd-missing-includes.patch<br>
=C2=A0rename meta/recipes-extended/gawk/{<a href=3D"http://gawk_5.3.0.bb" r=
el=3D"noreferrer" target=3D"_blank">gawk_5.3.0.bb</a> =3D&gt; <a href=3D"ht=
tp://gawk_5.3.1.bb" rel=3D"noreferrer" target=3D"_blank">gawk_5.3.1.bb</a>}=
 (94%)<br>
<br>
diff --git a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-di=
sabled-printf-features.patch b/meta/recipes-extended/gawk/gawk/0001-configu=
re.ac-re-enable-disabled-printf-features.patch<br>
new file mode 100644<br>
index 00000000000..4fe60c7cb83<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-=
printf-features.patch<br>
@@ -0,0 +1,35 @@<br>
+From 879fb11c7c006a8533a092fb75b38d84cc570d83 Mon Sep 17 00:00:00 2001<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;<br>
+Date: Fri, 22 Nov 2024 12:13:58 +0100<br>
+Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>: re-enable disabled printf features<br>
+<br>
+This is needed for ptests to pass for one thing.<br>
+<br>
+Upstream-Status: Inappropriate [needs a config option]<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index cb99ffe..5fe792f 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -398,7 +398,7 @@ int main()<br>
+ ])],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0has_f_format=3Dyes,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0has_f_format=3Dno,<br>
+-=C2=A0 =C2=A0 =C2=A0 has_f_format=3Dno=C2=A0 dnl Cross-compiling, assumin=
g the worst.<br>
++=C2=A0 =C2=A0 =C2=A0 has_f_format=3Dyes=C2=A0 dnl Cross-compiling in oe-c=
ore</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Does this wor=
k if you pass is via EXTRA_OECONF=C2=A0</div><div dir=3D"auto"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex" dir=3D"auto"><br>
+ )<br>
+ if test &quot;$has_f_format&quot; =3D yes<br>
+ then<br>
+@@ -427,7 +427,7 @@ int main()<br>
+ ])],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0has_a_format=3Dyes,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0has_a_format=3Dno,<br>
+-=C2=A0 =C2=A0 =C2=A0 has_a_format=3Dno=C2=A0 dnl Cross-compiling, assumin=
g the worst.<br>
++=C2=A0 =C2=A0 =C2=A0 has_a_format=3Dyes=C2=A0 dnl Cross-compiling in oe-c=
ore<br>
+ )<br>
+ if test &quot;$has_a_format&quot; =3D yes<br>
+ then<br>
diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-i=
ncludes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missin=
g-includes.patch<br>
deleted file mode 100644<br>
index 6fffd1f373a..00000000000<br>
--- a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes=
.patch<br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
-Date: Tue, 21 May 2024 15:10:11 +0000<br>
-Subject: [PATCH] m4/readline: add missing includes<br>
-<br>
-The cross-specific code fragment only includes stdio.h, where the native<b=
r>
-fragment also includes fcntl.h and unistd.h.=C2=A0 This is important becau=
se<br>
-GCC 14.1 has made the implicit definitions an error:<br>
-<br>
-conftest.c: In function &#39;main&#39;:<br>
-conftest.c:144:9: error: implicit declaration of function &#39;close&#39;;=
 did you mean &#39;pclose&#39;? [-Wimplicit-function-declaration]<br>
-conftest.c:146:14: error: implicit declaration of function &#39;open&#39;;=
 did you mean &#39;popen&#39;? [-Wimplicit-function-declaration]<br>
-<br>
-Add the missing includes so that the check doesn&#39;t always fail due to<=
br>
-these errors.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.savannah.gnu.org/cgit/ga=
wk.git/commit/?id=3Dc1613c310d71b87f509458e0259ecd10eda2b140" rel=3D"norefe=
rrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/gawk.git/commit/?=
id=3Dc1613c310d71b87f509458e0259ecd10eda2b140</a>]<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
----<br>
- m4/readline.m4 | 2 ++<br>
- 1 file changed, 2 insertions(+)<br>
-<br>
-diff --git a/m4/readline.m4 b/m4/readline.m4<br>
-index 38f96326..efd52d4e 100644<br>
---- a/m4/readline.m4<br>
-+++ b/m4/readline.m4<br>
-@@ -66,6 +66,8 @@ dnl action if false:<br>
- dnl action if cross compiling:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_LINK_IFELSE(<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[AC_LANG_PROGRAM([[#include &lt;stdio.h&gt;<br>
-+#include &lt;fcntl.h&gt;<br>
-+#include &lt;unistd.h&gt;<br>
- #include &lt;readline/readline.h&gt;<br>
- #include &lt;readline/history.h&gt;]],=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dnl includes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dnl function body<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gawk_5.3.0.bb</a> b/meta/recipes-extende=
d/gawk/<a href=3D"http://gawk_5.3.1.bb" rel=3D"noreferrer" target=3D"_blank=
">gawk_5.3.1.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
rename to meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gawk_5.3.1.bb</a><br>
index ac9d8500d60..bd72fbf2808 100644<br>
--- a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
+++ b/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.1.bb" rel=3D"no=
referrer" target=3D"_blank">gawk_5.3.1.bb</a><br>
@@ -16,11 +16,11 @@ PACKAGECONFIG[readline] =3D &quot;--with-readline,--wit=
hout-readline,readline&quot;<br>
=C2=A0PACKAGECONFIG[mpfr] =3D &quot;--with-mpfr,--without-mpfr, mpfr&quot;<=
br>
<br>
=C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-m4-readline-add-missi=
ng-includes.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-re-enabl=
e-disabled-printf-features.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;378f8864ec21cfceaa048f7e1869ac9b4597b449087ca=
f1eb55e440d30273336&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fa41b3a85413af87fb5e3a7d9c8fa8d4a20728c676511=
85bb49c38a7f9382b1e&quot;<br>
<br>
=C2=A0inherit autotools gettext texinfo update-alternatives<br>
<br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207756): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207756" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207756</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109769662/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109769662/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001cd3340627c1044d--

