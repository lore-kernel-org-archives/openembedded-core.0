Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web12.1118.1602274505013418203
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 13:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uMNa0AvW;
 spf=pass (domain: gmail.com, ip: 209.85.219.195, mailfrom: rwmacleod@gmail.com)
Received: by mail-yb1-f195.google.com with SMTP id j76so8171086ybg.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lQAQxaIY/khVJieL9CA48PpAm0WUl5K92WPj9Rj37Q=;
        b=uMNa0AvWJEynJ0FyMfGs25/1MHldD2wjV7hhklcAjkFVfmfJMfUMK1sqbmMdPrf10A
         nxdBYSx++dW8upEBbYrOJzkBTwB+4dP44Z1qSEgIV8QB8wE2M0ERU+eyT5/qLwLst6fQ
         4Hm8yTAGCeW44gbpFMUXSRfA0jtHrAOWNG+n+ZtmJX6yUwPWBgoN2tHwjKb0GUI7MwgP
         8cd9KUnOHWpSXz6lf5cZGE/IBuCxLwb3EF9rlIsmn0CiAVCX0bP+uOCBNUDRW5/iCWE/
         UJDYKmUQCjPs/xfCT/qyK/2TOP0RMaLItRzczmQ4aQMNEakFGdwf5FL8Kmiht2q86orf
         LG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lQAQxaIY/khVJieL9CA48PpAm0WUl5K92WPj9Rj37Q=;
        b=ULRYws+X5+38KyKgnbE9+p4+JC+WuUNxJ/XjYVETg3WbqAavfbzUF1PSWedOc33B4h
         65e4Z5NQ0wThQ9IETt0Umye8fXd09k7g+OuF8te6maVajiWze19Wc3KQJgeCnwEKNutq
         3qA7koENJ/nvEIqapeGYINnEUhZgoJN1qt709Ltg9gNmdU4f61UNxEghjl4/+/grwhQZ
         HyX49DGCVkfDtCAJvxUJLysXhOGXaxeBr35fli/i0TY5B4BkMk88NDCCsoQW29qRBIyw
         XYznSoDZ14Dyj/W0RSoWDG5pRYuLBmryVXg0zArC/+p+QQcdfr+iUFmd+PpiYt7Fa9bb
         CsuQ==
X-Gm-Message-State: AOAM5328Q5soC7Ravf1gy1JtMd2AbDgUbjzOaWULqd9KX8VdIgRwmNH6
	/FGv512opGfAttCU+XQgTSMkzlASaRFE6Tr9SJw=
X-Google-Smtp-Source: ABdhPJwWG4sXgy1D1YPv1UIE8g2V3VLg6U7WQAiBub8oAYsYtvbw219aWfgvh/SoPmuD1str7ahlHH0+2XLli6olPBA=
X-Received: by 2002:a5b:d43:: with SMTP id f3mr18647874ybr.46.1602274504169;
 Fri, 09 Oct 2020 13:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201009174436.3243814-1-stacy.gaikovaia@windriver.com>
In-Reply-To: <20201009174436.3243814-1-stacy.gaikovaia@windriver.com>
From: "Randy MacLeod" <rwmacleod@gmail.com>
Date: Fri, 9 Oct 2020 16:14:52 -0400
Message-ID: <CAK6=ix4Uro_mQyie8ZiMXST5TUMvWcDgwDTsAtYtEtjaBE5vmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept test failures
To: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a75aa305b1429ab2"

--000000000000a75aa305b1429ab2
Content-Type: text/plain; charset="UTF-8"

On Fri., Oct. 9, 2020, 13:45 Stacy Gaikovaia, <Stacy.Gaikovaia@windriver.com>
wrote:

> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
>
> After glibc uprev 2.32 -> 2.32, the


2.31 -> 2.32

following drd ptests
> fail with the error "condition variable has not been initialized".
>
> drd/tests/annotate_hb_err
> drd/tests/annotate_sem
> drd/tests/annotate_rwlock
> drd/tests/annotate_order_2
> drd/tests/annotate_smart_pointer
> drd/tests/annotate_spinlock
> drd/tests/monitor_example
> drd/tests/pth_cond_race
> drd/tests/pth_inconsistent_cond_wait
>
> In glibc 2.32, the POSIX thread functions are in both
> libc and libpthread, causing valgrind to misinterpert
> test behaviour. This patch tells valgrind to intercept
> the pthread functions in libc,



It's intercepting both as mentioned in the patch commit:

   "intercept both the libc and the libpthread functions"
so please make that clear in your commit log.


resolving these ptest
> failures. Patch can be removed once we uprev valgrind.
>

Can you add the pass, fail, skip and total counts and mention the test
system qemux86-64? This will help people track things when there is another
update.


> Upsteam-Status: Backport
>

This goes in the body of the patch. Mention the vg commit ID too please.


Thanks,

Randy


> Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> ---
>  .../valgrind/0001-drd-Port-to-Fedora-33.patch | 46 +++++++++++++++++++
>  .../valgrind/valgrind_3.16.1.bb               |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644
> meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
>
> diff --git
> a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> new file mode 100644
> index 0000000000..bca3d9b892
> --- /dev/null
> +++
> b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> @@ -0,0 +1,46 @@
> +From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001
> +From: Bart Van Assche <bvanassche@acm.org>
> +Date: Sat, 19 Sep 2020 08:08:59 -0700
> +Subject: [PATCH] drd: Port to Fedora 33
> +
> +Apparently on Fedora 33 the POSIX thread functions exist in both libc and
> +libpthread. Hence this patch that intercepts the pthread functions in
> +libc. See also https://bugs.kde.org/show_bug.cgi?id=426144 .
> +
> +Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> +
> +This patch was imported from the valgrind sourceware server
> +(https://sourceware.org/git/?p=valgrind.git), commit id
> +15330adf7c2471fbaa6a0818db07078d81dbff97. It was modified to
> +remove the changes to the valgrind NEWS file, as these are difficult to
> +maintain and don't impact the valgrind code itself.
> +
> +Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
> +---
> + drd/drd_pthread_intercepts.c | 9 +++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
> +index 58c45aaec..c2882e5ab 100644
> +--- a/drd/drd_pthread_intercepts.c
> ++++ b/drd/drd_pthread_intercepts.c
> +@@ -174,7 +174,16 @@ static int never_true;
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
> +    { return implf argl; }
> + #else
> ++/*
> ++ * On Linux, intercept both the libc and the libpthread functions. At
> ++ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthread
> ++ * functions in both libc and libpthread. Older glibc versions only have
> an
> ++ * implementation of the pthread functions in libpthread.
> ++ */
> + #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
> ++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
> ++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
> ++   { return implf argl; }                                               \
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
> +    { return implf argl; }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> index d4ca1a7752..7508098b55 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> @@ -40,6 +40,7 @@ SRC_URI = "
> https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>             file://s390x_vec_op_t.patch \
>
> file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
>             file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
> +           file://0001-drd-Port-to-Fedora-33.patch \
>             "
>  SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
>  SRC_URI[sha256sum] =
> "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
> --
> 2.25.1
>
>
> 
>
>

--000000000000a75aa305b1429ab2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri., Oct. 9, 2020, 13:45 Stacy Gaikovaia, &lt;<a h=
ref=3D"mailto:Stacy.Gaikovaia@windriver.com" target=3D"_blank" rel=3D"noref=
errer">Stacy.Gaikovaia@windriver.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">From: Stacy Gaikovaia &lt;<a href=3D"mailto:Stacy.Gaikovai=
a@windriver.com" rel=3D"noreferrer noreferrer" target=3D"_blank">Stacy.Gaik=
ovaia@windriver.com</a>&gt;<br>
<br>
After glibc uprev 2.32 -&gt; 2.32, the </blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">2.31 -&gt; 2.32</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">following drd ptests<br>
fail with the error &quot;condition variable has not been initialized&quot=
;.<br>
<br>
drd/tests/annotate_hb_err<br>
drd/tests/annotate_sem<br>
drd/tests/annotate_rwlock<br>
drd/tests/annotate_order_2<br>
drd/tests/annotate_smart_pointer<br>
drd/tests/annotate_spinlock<br>
drd/tests/monitor_example<br>
drd/tests/pth_cond_race<br>
drd/tests/pth_inconsistent_cond_wait<br>
<br>
In glibc 2.32, the POSIX thread functions are in both<br>
libc and libpthread, causing valgrind to misinterpert<br>
test behaviour. This patch tells valgrind to intercept<br>
the pthread functions in libc, </blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s intercepti=
ng both as mentioned in the patch commit:</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><span style=3D"font-family:sans-serif">=C2=A0 =C2=A0&quot=
;intercept both the libc and the libpthread functions&quot;</span><br></div=
><div dir=3D"auto"><font face=3D"sans-serif">so please make that clear in y=
our commit log.</font></div><div dir=3D"auto"><font face=3D"sans-serif"><br=
></font></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">resolving these ptest<br>
failures. Patch can be removed once we uprev valgrind.<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">Can you add the pass=
, fail, skip and total counts and mention the test system qemux86-64? This =
will help people track things when there is another update.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
Upsteam-Status: Backport<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">This goes in the body of the patch. Mention the vg=
 commit ID too please.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Randy</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Stacy Gaikovaia &lt;<a href=3D"mailto:Stacy.Gaikovaia@windr=
iver.com" rel=3D"noreferrer noreferrer" target=3D"_blank">Stacy.Gaikovaia@w=
indriver.com</a>&gt;<br>
---<br>
=C2=A0.../valgrind/0001-drd-Port-to-Fedora-33.patch | 46 +++++++++++++++++=
++<br>
=C2=A0.../valgrind/<a href=3D"http://valgrind_3.16.1.bb" rel=3D"noreferrer=
 noreferrer noreferrer" target=3D"_blank">valgrind_3.16.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 47 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-=
Port-to-Fedora-33.patch<br>
<br>
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedo=
ra-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedo=
ra-33.patch<br>
new file mode 100644<br>
index 0000000000..bca3d9b892<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.p=
atch<br>
@@ -0,0 +1,46 @@<br>
+From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001<br=
>
+From: Bart Van Assche &lt;<a href=3D"mailto:bvanassche@acm.org" rel=3D"no=
referrer noreferrer" target=3D"_blank">bvanassche@acm.org</a>&gt;<br>
+Date: Sat, 19 Sep 2020 08:08:59 -0700<br>
+Subject: [PATCH] drd: Port to Fedora 33<br>
+<br>
+Apparently on Fedora 33 the POSIX thread functions exist in both libc and=
<br>
+libpthread. Hence this patch that intercepts the pthread functions in<br>
+libc. See also <a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D426144" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://bugs.kde=
.org/show_bug.cgi?id=3D426144</a> .<br>
+<br>
+Signed-off-by: Bart Van Assche &lt;<a href=3D"mailto:bvanassche@acm.org" =
rel=3D"noreferrer noreferrer" target=3D"_blank">bvanassche@acm.org</a>&gt;<=
br>
+<br>
+This patch was imported from the valgrind sourceware server<br>
+(<a href=3D"https://sourceware.org/git/?p=3Dvalgrind.git" rel=3D"noreferr=
er noreferrer noreferrer" target=3D"_blank">https://sourceware.org/git/?p=
=3Dvalgrind.git</a>), commit id<br>
+15330adf7c2471fbaa6a0818db07078d81dbff97. It was modified to<br>
+remove the changes to the valgrind NEWS file, as these are difficult to <=
br>
+maintain and don&#39;t impact the valgrind code itself.<br>
+<br>
+Signed-off-by: Stacy Gaikovaia &lt;<a href=3D"mailto:stacy.gaikovaia@wind=
river.com" rel=3D"noreferrer noreferrer" target=3D"_blank">stacy.gaikovaia@=
windriver.com</a>&gt;<br>
+---<br>
+ drd/drd_pthread_intercepts.c | 9 +++++++++<br>
+ 1 file changed, 10 insertions(+)<br>
+<br>
+diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c<=
br>
+index 58c45aaec..c2882e5ab 100644<br>
+--- a/drd/drd_pthread_intercepts.c<br>
++++ b/drd/drd_pthread_intercepts.c<br>
+@@ -174,7 +174,16 @@ static int never_true;<br>
+=C2=A0 =C2=A0 ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 { return implf argl; }<br>
+ #else<br>
++/*<br>
++ * On Linux, intercept both the libc and the libpthread functions. At<br=
>
++ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthrea=
d<br>
++ * functions in both libc and libpthread. Older glibc versions only have=
 an<br>
++ * implementation of the pthread functions in libpthread.<br>
++ */<br>
+ #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0{ return implf argl; }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_=
decl;=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_=
decl=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 { return implf argl; }<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.1=
6.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">valgrind=
_3.16.1.bb</a> b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_=
3.16.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">valgr=
ind_3.16.1.bb</a><br>
index d4ca1a7752..7508098b55 100644<br>
--- a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.16.1.bb"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">valgrind_3.16.1=
.bb</a><br>
+++ b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.16.1.bb"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">valgrind_3.16.1=
.bb</a><br>
@@ -40,6 +40,7 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/=
valgrind/valgrind-$%7BPV%7D.tar.bz2" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">https://sourceware.org/pub/valgrind/valgrind-${PV}.tar=
.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://s390x_vec_op_t.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-none-tests-fdleak_cm=
sg.stderr.exp-adjust-tmp-paths.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-memcheck-tests-Fix-t=
imerfd-syscall-test.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-drd-Port-to-Fedora-3=
3.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;d1b153f1ab17cf1f311705e7a83ef589&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c91f3a2f7b02db0f3bc99479861656154d241d2=
fdb265614ba918cc6720a33ca&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000a75aa305b1429ab2--
