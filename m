Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B71C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 16:10:44 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.910.1743437436667998123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 09:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZ8IInN5;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-601b6146b9cso2538574eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743437436; x=1744042236; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uhNkK4p2OLDQcW+ymFG6Ml9hqObZBTf7jSHiSbMfqVU=;
        b=PZ8IInN5f0iIG1oCEXKiX8CVITdx0USftt13WTPOoKmclXOILsEDjOrnoIaOqN2kwE
         NMAMwY3yCKU7MqkIbjjtNodu4HIV5WxfyeGbQENO2E/ebqE9vpsRJDcndOgwWkRrJgX4
         XzxeAb8KIWQiIla2tefbO8VI6wGbc/IhjG7UqFOYPYk1HS0Jft4ti/AGOQN4s/ZOQSVW
         ifEY6fSzJIxQCf6OJbGehS8Cqhl9UITrhSF+/9Ui3yFxUi2zyFuW8LcZoO6xZmd+sPWk
         ssydZT/U9W1uSZx6N3VoDWBBnIUu3TbhxJGabUkLbhIdLmKJgw56zsdJFD8PadRjfKHV
         Ot5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437436; x=1744042236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhNkK4p2OLDQcW+ymFG6Ml9hqObZBTf7jSHiSbMfqVU=;
        b=AFQLP7niluorZR6C16UEvO1gzUYqBfoqKViFyavPgCHbhbviK0WJLdzPzLcFSbVWH4
         /lCR4fQHPSvH6fE4f5sVtKKPQCIiJZpWb/4+xpq0C6jxoiDRcZ1qNkJBw+qvlk3Ycw3F
         UJDpMt20m6vdHPCE5N3KCTjiq53BKdVm9o9VEeWbFwgRolNXJLnVAyxwKFMALXs37Vsw
         QOZE3M9S1Pe2260VI3OSUJOMK16dFvj721/nAjmLqd4oCsrgxyte/M4nfOWp3IJavOjO
         bg0f/TiDTDsEmm+q8Q/7BEYPgHycYDzLJkCPeUiO2ARUqDfLHUqEa4RFPUrQu0TxrITz
         urbA==
X-Gm-Message-State: AOJu0Yy1OGQgLDL/S6EPsgwpo6MxVCQRRC8LTygX0+QmolQ7dA2XUxwF
	JrtsUsG6XUNnGNgRA9rYKzrHPYqtye7CdvP6alK5ry57ecL7x2B6PyHEyrQ24UbIop4K444BGr5
	NlXDr1JaPL61bJFWTZ8kkJmT7ZVU9mk3n
X-Gm-Gg: ASbGncuKUjU3Oq1MlrcWJbzVZyGoYdBcNjIzTTu2lFWtkWdrm95Yft/yWLoQIEEL3F9
	i01hJ2JKk45heZ4IfH5D9eRz99XLVD22QecTVyquFYGWAjLPxJlI1jtssLOdxwcoJl6zHYAVpa0
	pSPY66UgEL2rgx2RIWogYM6m918i/k+2rSK9uRy2O4xBWdT/ZlJyDcww3Jqc0=
X-Google-Smtp-Source: AGHT+IE+tQKl93PzXzoP06SSdexyGulOrfnusCzOtLXzePf4d5xp7QdqEnrITbl6Jl4ylyZGvOayO1VsxhK30pmpfFE=
X-Received: by 2002:a05:6808:2217:b0:3f8:150b:f571 with SMTP id
 5614622812f47-3ff0f541e1dmr6226571b6e.21.1743437435007; Mon, 31 Mar 2025
 09:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250331090517.2284874-1-haixiao.yan.cn@eng.windriver.com>
In-Reply-To: <20250331090517.2284874-1-haixiao.yan.cn@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2025 09:10:24 -0700
X-Gm-Features: AQ5f1JqLK2bMpr01mXAyI0QkMXzfrr52bhqbKy-dQUpACnU-cx0ASKnhmRggNPE
Message-ID: <CAMKF1spUtsn+pck_GGyLRFprQ10hbq13ZoiFi_yYwUWjmo-Q3g@mail.gmail.com>
Subject: Re: [oe-core][PATCH] glibc: Add single-threaded fast path to rand()
To: Haixiao.Yan.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000007a660631a5a9e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 16:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213985

--000000000000007a660631a5a9e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks ok

On Mon, Mar 31, 2025 at 2:05=E2=80=AFAM Yan, Haixiao (CN) via lists.openemb=
edded.org
<Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> Backport a patch [1] to improve performance of rand() and __random()[2]
> by adding a single-threaded fast path.
>
> [1]
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9ad737=
8800d6302bc11467cf2b514f
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>  ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
>  2 files changed, 48 insertions(+)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-t=
o-rand.patch
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path=
-to-rand.patch
> b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path=
-to-rand.patch
> new file mode 100644
> index 000000000000..736fc51f3874
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path=
-to-rand.patch
> @@ -0,0 +1,47 @@
> +From 4f54b0dfc16dbe0df86afccb90e447df5f7f571e Mon Sep 17 00:00:00 2001
> +From: Wilco Dijkstra <wilco.dijkstra@arm.com>
> +Date: Mon, 18 Mar 2024 15:18:20 +0000
> +Subject: [PATCH] stdlib: Add single-threaded fast path to rand()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Improve performance of rand() and __random() by adding a single-threaded
> +fast path.  Bench-random-lock shows about 5x speedup on Neoverse V1.
> +
> +Upstream-Status: Backport [be0cfd848d9ad7378800d6302bc11467cf2b514f]
> +
> +Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
> +Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> +---
> + stdlib/random.c | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/stdlib/random.c b/stdlib/random.c
> +index 17cc61ba8f55..5d482a857065 100644
> +--- a/stdlib/random.c
> ++++ b/stdlib/random.c
> +@@ -51,6 +51,7 @@
> +    SUCH DAMAGE.*/
> +
> + #include <libc-lock.h>
> ++#include <sys/single_threaded.h>
> + #include <limits.h>
> + #include <stddef.h>
> + #include <stdlib.h>
> +@@ -288,6 +289,12 @@ __random (void)
> + {
> +   int32_t retval;
> +
> ++  if (SINGLE_THREAD_P)
> ++    {
> ++      (void) __random_r (&unsafe_state, &retval);
> ++      return retval;
> ++    }
> ++
> +   __libc_lock_lock (lock);
> +
> +   (void) __random_r (&unsafe_state, &retval);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.41.bb
> b/meta/recipes-core/glibc/glibc_2.41.bb
> index 71b89ac9ffb3..d707e1a6775d 100644
> --- a/meta/recipes-core/glibc/glibc_2.41.bb
> +++ b/meta/recipes-core/glibc/glibc_2.41.bb
> @@ -53,6 +53,7 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>
> file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>
> file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
>
> file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
> +           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patc=
h
> \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213954):
> https://lists.openembedded.org/g/openembedded-core/message/213954
> Mute This Topic: https://lists.openembedded.org/mt/112000674/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000007a660631a5a9e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Looks ok=C2=A0</div><div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 31, =
2025 at 2:05=E2=80=AFAM Yan, Haixiao (CN) via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;<a href=3D"http://Haixiao.Yan.C=
N">Haixiao.Yan.CN</a>=3D<a href=3D"mailto:windriver.com@lists.openembedded.=
org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">From: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.c=
n@windriver.com" target=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
<br>
Backport a patch [1] to improve performance of rand() and __random()[2]<br>
by adding a single-threaded fast path.<br>
<br>
[1] <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0=
cfd848d9ad7378800d6302bc11467cf2b514f" rel=3D"noreferrer" target=3D"_blank"=
>https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9ad7378=
800d6302bc11467cf2b514f</a><br>
[2] <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bug.=
cgi?id=3D32777</a><br>
Signed-off-by: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.c=
om" target=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0...dd-single-threaded-fast-path-to-rand.patch | 47 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.41.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.41.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 48 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-sing=
le-threaded-fast-path-to-rand.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-=
fast-path-to-rand.patch b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-sin=
gle-threaded-fast-path-to-rand.patch<br>
new file mode 100644<br>
index 000000000000..736fc51f3874<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-pa=
th-to-rand.patch<br>
@@ -0,0 +1,47 @@<br>
+From 4f54b0dfc16dbe0df86afccb90e447df5f7f571e Mon Sep 17 00:00:00 2001<br>
+From: Wilco Dijkstra &lt;<a href=3D"mailto:wilco.dijkstra@arm.com" target=
=3D"_blank">wilco.dijkstra@arm.com</a>&gt;<br>
+Date: Mon, 18 Mar 2024 15:18:20 +0000<br>
+Subject: [PATCH] stdlib: Add single-threaded fast path to rand()<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Improve performance of rand() and __random() by adding a single-threaded<b=
r>
+fast path.=C2=A0 Bench-random-lock shows about 5x speedup on Neoverse V1.<=
br>
+<br>
+Upstream-Status: Backport [be0cfd848d9ad7378800d6302bc11467cf2b514f]<br>
+<br>
+Reviewed-by: Adhemerval Zanella=C2=A0 &lt;<a href=3D"mailto:adhemerval.zan=
ella@linaro.org" target=3D"_blank">adhemerval.zanella@linaro.org</a>&gt;<br=
>
+Signed-off-by: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.=
com" target=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
+---<br>
+ stdlib/random.c | 7 +++++++<br>
+ 1 file changed, 7 insertions(+)<br>
+<br>
+diff --git a/stdlib/random.c b/stdlib/random.c<br>
+index 17cc61ba8f55..5d482a857065 100644<br>
+--- a/stdlib/random.c<br>
++++ b/stdlib/random.c<br>
+@@ -51,6 +51,7 @@<br>
+=C2=A0 =C2=A0 SUCH DAMAGE.*/<br>
+ <br>
+ #include &lt;libc-lock.h&gt;<br>
++#include &lt;sys/single_threaded.h&gt;<br>
+ #include &lt;limits.h&gt;<br>
+ #include &lt;stddef.h&gt;<br>
+ #include &lt;stdlib.h&gt;<br>
+@@ -288,6 +289,12 @@ __random (void)<br>
+ {<br>
+=C2=A0 =C2=A0int32_t retval;<br>
+ <br>
++=C2=A0 if (SINGLE_THREAD_P)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 (void) __random_r (&amp;unsafe_state, &amp;retval);<=
br>
++=C2=A0 =C2=A0 =C2=A0 return retval;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0__libc_lock_lock (lock);<br>
+ <br>
+=C2=A0 =C2=A0(void) __random_r (&amp;unsafe_state, &amp;retval);<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.41.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.41.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.41.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.41.bb</a><br>
index 71b89ac9ffb3..d707e1a6775d 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.41.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.41.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.41.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.41.bb</a><br>
@@ -53,6 +53,7 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${SRCBR=
ANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0021-fix-create-thread-fai=
led-in-unprivileged-process-BZ-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0022-Avoid-hardcoded-build=
-time-paths-in-the-output-binar.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-tests-Skip-2-qemu-tes=
ts-that-can-hang-in-oe-selftest.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-stdlib-Add-single-thr=
eaded-fast-path-to-rand.patch \<br>
=C2=A0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#213954): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/213954" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/213954</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112000674/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112000674/1997914</a><br>
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

--000000000000007a660631a5a9e4--

