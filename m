Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.78200.1629417947884814194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 17:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tdjAHSzt;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id l24so6131899qtj.4
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 17:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dO7U61dpC5T3e6xAT8HRrsGLNZZAMglD6mzNiACDn4s=;
        b=tdjAHSztBUqpQ61azfRDh1yh03Hz96gDv/XtgUiaaC0e3r5uy+AxWeXZyp1MDCQSGa
         HJh+/jS7w4ApqDv2Q7/mQ3yNih5d6PGAdh8sddQMbwcBuMIxdMBaRTb/ALipPfpQfwBw
         1GXig3QJmhGyOro6qLzRBQL3iyDUfltxpCPjxRz6vxDV5EuysXJg/FdARdD9Ibpuj/6y
         hOiQwF7T0izgzzrkog1Wubb1zDM/gl9nhM4pdpOcb4k4ydsJPy8jff1AWdMoV3302U8H
         dvZfKXbx7SBWJwmy33CXij2hkn6mCeAQ4KhR+xDT1L4JQJT251Aei/jRjl/opE0nk0A7
         fU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dO7U61dpC5T3e6xAT8HRrsGLNZZAMglD6mzNiACDn4s=;
        b=EW00UXMoka51iU3kY1w+ExMUtTlcaQmwN12+yKUj0BygHnCT2HyFzcrIgyUIvXgr5L
         I9FAnEjyVmn0/xkIllgCbYQ+dWd1KaPq4T4HcnSj2IP4tTmAxWn6k9YixcHOTsm6w7Jd
         7tXlix4jrhZt5/2XUUTB1tnPhWAGxQxw52vrSwHidAszYuUWHJlRurxbaoaDUyAWvk5E
         DnTxgJvcmZ0DRJzwMct6uxalInP9zIwpxt/JCUHcp26hZCTma+ZbZ1HYPIjwWFMT/HzX
         aP8zoJIJRDcpMCFmiBZFXnYt2x2oebGkfkdu+HRoKv8EqfUF0/MJM4kaelB5qebzbBhI
         QeEA==
X-Gm-Message-State: AOAM533RjmVga+KgKh+I2O77DFW8UPriQQmd8t0o+br9Uls8MisJHC7E
	qJ2vFker+xvyOB5jZC4EqT5ERZV5mApRv2JRhJA=
X-Google-Smtp-Source: ABdhPJysTEJ84dZMhMOcn5oYdmL5BrhP5D0vx4xj+U74SaX90rm72SV94PmbWmNtIzTP2Hr55I+voyhMuNMFNtP2NKw=
X-Received: by 2002:ac8:b82:: with SMTP id h2mr15500691qti.214.1629417947049;
 Thu, 19 Aug 2021 17:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org> <20210818165033.3935964-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210818165033.3935964-4-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 19 Aug 2021 17:05:36 -0700
Message-ID: <CAMKF1sqdDrt7+28CS8=1jdoXKKY-qOuq2wD33zDyVAaFSMc9rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] pseudo: Fix to work with glibc 2.34 systems
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ecb21905c9f26d38"

--000000000000ecb21905c9f26d38
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 9:50 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The merge of libdl into libc in glibc 2.34 causes problems for pseudo. Add
> a fix
> that works around this issue.


I have made an incremental change which fixes the build failures on
rv32/rv64

https://git.openembedded.org/openembedded-core-contrib/commit/?h=yoe/mut&id=da5c9b3c3c7e66c52ea2f79343e6009ff410f2ca


>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../pseudo/files/glibc234.patch               | 86 +++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/glibc234.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/glibc234.patch
> b/meta/recipes-devtools/pseudo/files/glibc234.patch
> new file mode 100644
> index 00000000000..86fad5a3def
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/glibc234.patch
> @@ -0,0 +1,86 @@
> +pseudo_wrappers/pseudo_util: Add versioning to dl* symbols to work with
> glibc 2.34
> +
> +From glibc 2.34 onwards, libdl is merged into libc. We need to work with
> libaries
> +linked with older libc and newer ones without requiring glibc 2.34 to be
> linked
> +in. To do this, use an older verison of the symbols. Sadly this is highly
> arch
> +specific.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Index: git/pseudo_util.c
> +===================================================================
> +--- git.orig/pseudo_util.c
> ++++ git/pseudo_util.c
> +@@ -28,6 +28,11 @@
> + #include "pseudo.h"
> + #include "pseudo_ipc.h"
> + #include "pseudo_db.h"
> ++#include "pseudo_dlsymvers.h"
> ++
> ++#if defined(__GLIBC__)
> ++__asm__(".symver dlsym,dlsym@GLIBC_" DLSYMVER);
> ++#endif
> +
> + struct pseudo_variables {
> +       char *key;
> +Index: git/pseudo_wrappers.c
> +===================================================================
> +--- git.orig/pseudo_wrappers.c
> ++++ git/pseudo_wrappers.c
> +@@ -28,6 +28,7 @@
> +
> + /* include this to get PSEUDO_PORT_* definitions */
> + #include "pseudo.h"
> ++#include "pseudo_dlsymvers.h"
> +
> + /* used for various specific function arguments */
> + #include <dirent.h>
> +@@ -122,6 +123,12 @@ pseudo_reinit_libpseudo(void) {
> +       _libpseudo_init();
> + }
> +
> ++#if defined(__GLIBC__)
> ++__asm__(".symver dlerror,dlerror@GLIBC_" DLSYMVER);
> ++__asm__(".symver dlvsym,dlvsym@GLIBC_" DLVSYMVER);
> ++__asm__(".symver dlsym,dlsym@GLIBC_" DLSYMVER);
> ++#endif
> ++
> + static void
> + pseudo_init_one_wrapper(pseudo_function *func) {
> +       int (*f)(void) = (int (*)(void)) NULL;
> +Index: git/pseudo_dlsymvers.h
> +===================================================================
> +--- /dev/null
> ++++ git/pseudo_dlsymvers.h
> +@@ -0,0 +1,30 @@
> ++/*
> ++ * Copyright (c) 2021 Richard Purdie
> ++ *
> ++ * SPDX-License-Identifier: LGPL-2.1-only
> ++ *
> ++ */
> ++
> ++/* We need to use the older symbols in libdl.so rather than the newer
> ones
> ++   merged into libc.so in glibc 2.34 onwards since libpseudo needs to
> link/work
> ++   with newer libcs and bianries compiles with older ones */
> ++
> ++#if defined(__GLIBC__)
> ++#if defined(__aarch64__)
> ++#define DLSYMVER "2.17"
> ++#define DLVSYMVER "2.17"
> ++#elif defined(__x86_64__)
> ++#define DLSYMVER "2.2.5"
> ++#define DLVSYMVER "2.2.5"
> ++#elif defined(__arm__)
> ++#define DLSYMVER "2.4"
> ++#define DLVSYMVER "2.4"
> ++#elif defined(__mips__)
> ++#define DLSYMVER "2.0"
> ++#define DLVSYMVER "2.2"
> ++#else
> ++#define DLSYMVER "2.0"
> ++#define DLVSYMVER "2.1"
> ++#endif
> ++#endif
> ++
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb
> b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index dacaef1a66b..c7684f00cbd 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -2,6 +2,7 @@ require pseudo.inc
>
>  SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
>             file://0001-configure-Prune-PIE-flags.patch \
> +           file://glibc234.patch \
>             file://fallback-passwd \
>             file://fallback-group \
>             "
> --
> 2.30.2
>
>
> 
>
>

--000000000000ecb21905c9f26d38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 18, 2021 at 9:50 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)">The merge of libdl into lib=
c in glibc 2.34 causes problems for pseudo. Add a fix<br>
that works around this issue.</blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">I have made an incremental change which fixes the build failur=
es on rv32/rv64</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a =
href=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=3D=
yoe/mut&amp;id=3Dda5c9b3c3c7e66c52ea2f79343e6009ff410f2ca">https://git.open=
embedded.org/openembedded-core-contrib/commit/?h=3Dyoe/mut&amp;id=3Dda5c9b3=
c3c7e66c52ea2f79343e6009ff410f2ca</a></div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto"><br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0.../pseudo/files/glibc234.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 86 +++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +<br=
>
=C2=A02 files changed, 87 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/pseudo/files/glibc234.patch<=
br>
<br>
diff --git a/meta/recipes-devtools/pseudo/files/glibc234.patch b/meta/recip=
es-devtools/pseudo/files/glibc234.patch<br>
new file mode 100644<br>
index 00000000000..86fad5a3def<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/pseudo/files/glibc234.patch<br>
@@ -0,0 +1,86 @@<br>
+pseudo_wrappers/pseudo_util: Add versioning to dl* symbols to work with gl=
ibc 2.34<br>
+<br>
+From glibc 2.34 onwards, libdl is merged into libc. We need to work with l=
ibaries<br>
+linked with older libc and newer ones without requiring glibc 2.34 to be l=
inked<br>
+in. To do this, use an older verison of the symbols. Sadly this is highly =
arch<br>
+specific.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
+<br>
+Index: git/pseudo_util.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- git.orig/pseudo_util.c<br>
++++ git/pseudo_util.c<br>
+@@ -28,6 +28,11 @@<br>
+ #include &quot;pseudo.h&quot;<br>
+ #include &quot;pseudo_ipc.h&quot;<br>
+ #include &quot;pseudo_db.h&quot;<br>
++#include &quot;pseudo_dlsymvers.h&quot;<br>
++<br>
++#if defined(__GLIBC__)<br>
++__asm__(&quot;.symver dlsym,dlsym@GLIBC_&quot; DLSYMVER);<br>
++#endif<br>
+ <br>
+ struct pseudo_variables {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *key;<br>
+Index: git/pseudo_wrappers.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- git.orig/pseudo_wrappers.c<br>
++++ git/pseudo_wrappers.c<br>
+@@ -28,6 +28,7 @@<br>
+ <br>
+ /* include this to get PSEUDO_PORT_* definitions */<br>
+ #include &quot;pseudo.h&quot;<br>
++#include &quot;pseudo_dlsymvers.h&quot;<br>
+ <br>
+ /* used for various specific function arguments */<br>
+ #include &lt;dirent.h&gt;<br>
+@@ -122,6 +123,12 @@ pseudo_reinit_libpseudo(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_libpseudo_init();<br>
+ }<br>
+ <br>
++#if defined(__GLIBC__)<br>
++__asm__(&quot;.symver dlerror,dlerror@GLIBC_&quot; DLSYMVER);<br>
++__asm__(&quot;.symver dlvsym,dlvsym@GLIBC_&quot; DLVSYMVER);<br>
++__asm__(&quot;.symver dlsym,dlsym@GLIBC_&quot; DLSYMVER);<br>
++#endif<br>
++<br>
+ static void<br>
+ pseudo_init_one_wrapper(pseudo_function *func) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*f)(void) =3D (int (*)(void)) NULL;<br>
+Index: git/pseudo_dlsymvers.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- /dev/null<br>
++++ git/pseudo_dlsymvers.h<br>
+@@ -0,0 +1,30 @@<br>
++/*<br>
++ * Copyright (c) 2021 Richard Purdie<br>
++ *<br>
++ * SPDX-License-Identifier: LGPL-2.1-only<br>
++ *<br>
++ */<br>
++<br>
++/* We need to use the older symbols in libdl.so rather than the newer one=
s<br>
++=C2=A0 =C2=A0merged into libc.so in glibc 2.34 onwards since libpseudo ne=
eds to link/work<br>
++=C2=A0 =C2=A0with newer libcs and bianries compiles with older ones */<br=
>
++<br>
++#if defined(__GLIBC__) <br>
++#if defined(__aarch64__)<br>
++#define DLSYMVER &quot;2.17&quot;<br>
++#define DLVSYMVER &quot;2.17&quot;<br>
++#elif defined(__x86_64__)<br>
++#define DLSYMVER &quot;2.2.5&quot;<br>
++#define DLVSYMVER &quot;2.2.5&quot;<br>
++#elif defined(__arm__)<br>
++#define DLSYMVER &quot;2.4&quot;<br>
++#define DLVSYMVER &quot;2.4&quot;<br>
++#elif defined(__mips__)<br>
++#define DLSYMVER &quot;2.0&quot;<br>
++#define DLVSYMVER &quot;2.2&quot;<br>
++#else<br>
++#define DLSYMVER &quot;2.0&quot;<br>
++#define DLVSYMVER &quot;2.1&quot;<br>
++#endif<br>
++#endif<br>
++<br>
diff --git a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" =
rel=3D"noreferrer" target=3D"_blank">pseudo_git.bb</a> b/meta/recipes-devto=
ols/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">pseudo_git.bb</a><br>
index dacaef1a66b..c7684f00cbd 100644<br>
--- a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a><br>
+++ b/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a><br>
@@ -2,6 +2,7 @@ require pseudo.inc<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/pseudo=
;branch=3Doe-core" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.or=
g/pseudo;branch=3Doe-core</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure-Prune-PIE-f=
lags.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glibc234.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fallback-passwd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fallback-group \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000ecb21905c9f26d38--
