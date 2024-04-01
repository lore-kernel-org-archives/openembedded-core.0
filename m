Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1E8CD1283
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 09:06:30 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.33319.1711962388866536395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 02:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ht1QLhdx;
 spf=pass (domain: gmail.com, ip: 209.85.221.180, mailfrom: rwmacleod@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4d8a7ca969bso838754e0c.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711962388; x=1712567188; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cwPfNEAcKDqo6j7uGCim6rmcfLYC5a2F3XU79LawgWc=;
        b=ht1QLhdxYopxCQCvMnTjDS/5GrAWYpcj/fRXAWO0Zs3Qi/YrR0gsOhZSo9ofmM89d7
         u91QFmyY/2dGz+gogT3lH9wLhAOuATUtzt+BWih6Eoz929rqE6BNBL23JTkIj48xaimH
         zpoCbD2O7wmUC/wLIwW7E5K5y96+3Bft3gwU+weZQQjFyuJbQlSKFAhjWrYBnyBm40wT
         +x5eEN5xvUCOZj0p+2jAGlMnSesshdMUqvHNXmHT/ZH56vA449wQx9VxzCleAOXCJccZ
         Iop/x0dQ9v5ZT1i52eYZjfGWC18etDB+vWNWH1jwsj5CmR8LeuZpa9eMM10BGCBeSVeK
         /jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711962388; x=1712567188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwPfNEAcKDqo6j7uGCim6rmcfLYC5a2F3XU79LawgWc=;
        b=jmj1Z3u+xQDOJjCvKZRjr1IoKiVUHHxKxFr0kOh52Kipqz1M3hJsOeBYSZf947QKWh
         goRM+XCJlFGhILIw5RV/UZ1fHaDe0p0Dklf99BDh4x97KN/4zYnqoeG6ueJuE3c7R1af
         VV/f2y8W/OoF4OkvsJjVL1HFhw8LvGLT1NdXhRGOL3j4GNJyWma1gIKp38PVB6Sz3pnm
         gjvgTc9/BoR7hGqNSgZFEhVzmJDnHU5Y1Io18yajFY8mXRFsEYGaXsqgOZHEWsggu/xJ
         7yHBLjNP7JQ0ovMc8sfOaevpbKq4FEW9IiYDLTsN8x4U/HQY5XGYR2iHSI36gcRM1BfH
         egjQ==
X-Gm-Message-State: AOJu0YzAkXN8dnGyfkuPqzAWqOWCTAiDOCXqSCwYHfVHi+2hpwUn91TU
	iECHML/TPtDs3/PfbWYlLlqRDJ86KpDEziwS/hg7hLw2rJVmzEvFQV5P/kGymeLIMXwbly2kXzj
	8V64OIteAN4CJclaa6tNQwQ/cIY09bf9A
X-Google-Smtp-Source: AGHT+IH6Fl3tmDHJFZ5E/HwK9wiYYes5lN0H6TklHz0cHKlIjwldOAIJ/18sG/5RdFMv4TSYRJ3TOnmsTvJeqfKWJJk=
X-Received: by 2002:a05:6122:448c:b0:4c9:f704:38c with SMTP id
 cz12-20020a056122448c00b004c9f704038cmr5820923vkb.11.1711962387619; Mon, 01
 Apr 2024 02:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240401081011.479084-1-Yash.Shinde@windriver.com>
In-Reply-To: <20240401081011.479084-1-Yash.Shinde@windriver.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Mon, 1 Apr 2024 05:06:17 -0400
Message-ID: <CAK6=ix4Z4cC7h3xzHpURNC8ZOWrBqMUYV1+xkGFWzFcSFH2_Rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix stale qemu processes left after
 glibc oe-selftest
To: "Shinde, Yash" <Yash.Shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, Umesh.Kallapa@windriver.com, 
	Naveen Gowda <Naveen.Gowda@windriver.com>, 
	Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>, Shivaprasad.Moodalappa@windriver.com
Content-Type: multipart/alternative; boundary="000000000000fba8090615054d54"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 09:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197679

--000000000000fba8090615054d54
Content-Type: text/plain; charset="UTF-8"

The short log is misleading since this isn't really a fix.

You have:

glibc: Fix stale qemu processes left after glibc oe-selftest


Maybe:

glibc: Skip 2 qemu tests that can hang in oe-selftest


Skipping is what we want for now but
have you tried  wrapping the hanging test in a script that runs:
strace -f -ttt -o foo <test>
?

Randy


On Mon, Apr 1, 2024, 04:10 Shinde, Yash via lists.openembedded.org
<Yash.Shinde=windriver.com@lists.openembedded.org> wrote:

> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> qemumips and qemuppc were leaving stale processes behind after
> running glibc oe-selftest. During analysis, it was found that
> it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
> Disable them so that there are no stale processes left behind.
>
> [YOCTO #15423]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../glibc/glibc/0024-qemu-stale-process.patch | 45 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
> b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
> new file mode 100644
> index 0000000000..c28fa31b89
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
> @@ -0,0 +1,45 @@
> +glibc: Fix stale qemu processes left after glibc oe-selftest
> +
> +qemumips and qemuppc were leaving stale processes behind after
> +running glibc oe-selftest. During analysis, it was found that
> +it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
> +Disable them so that there are no stale processes left behind.
> +
> +[YOCTO #15423]
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> +---
> +diff --git a/sysdeps/unix/sysv/linux/Makefile
> b/sysdeps/unix/sysv/linux/Makefile
> +--- a/sysdeps/unix/sysv/linux/Makefile    2024-03-18 01:15:49.019202881
> -0700
> ++++ b/sysdeps/unix/sysv/linux/Makefile  2024-03-14 06:26:18.581404107
> -0700
> +@@ -222,7 +222,6 @@
> +   tst-process_mrelease \
> +   tst-quota \
> +   tst-rlimit-infinity \
> +-  tst-scm_rights \
> +   tst-sigtimedwait \
> +   tst-sync_file_range \
> +   tst-sysconf-iov_max \
> +@@ -233,6 +232,8 @@
> +   tst-timerfd \
> +   tst-ttyname-direct \
> +   tst-ttyname-namespace \
> ++  # Skip this test to avoid stale qemu process
> ++  # tst-scm_rights \
> +   # tests
> +
> + # process_madvise requires CAP_SYS_ADMIN.
> +@@ -270,9 +271,10 @@
> +   tst-ntp_gettimex-time64 \
> +   tst-ppoll-time64 \
> +   tst-prctl-time64 \
> +-  tst-scm_rights-time64 \
> +   tst-sigtimedwait-time64 \
> +   tst-timerfd-time64 \
> ++  # Skip this test to avoid stale qemu process
> ++  # tst-scm_rights-time64 \
> +   # tests-time64
> +
> + tests-clone-internal = \
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb
> b/meta/recipes-core/glibc/glibc_2.39.bb
> index b203060064..9122472689 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -49,6 +49,7 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>
> file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>
> file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
>
> file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
> +           file://0024-qemu-stale-process.patch \
>  "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197678):
> https://lists.openembedded.org/g/openembedded-core/message/197678
> Mute This Topic: https://lists.openembedded.org/mt/105259855/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000fba8090615054d54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The short log is misleading since this isn&#39;t really a=
 fix.<div dir=3D"auto"><br></div><div dir=3D"auto">You have:</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">glibc: Fix stale qemu processes left =
after glibc oe-selftest<br></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Maybe:</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">glibc: Skip 2 qemu tests that can hang in oe-selftest<br></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Skipping is what we want for now but</div><div dir=3D"auto">have you trie=
d=C2=A0 wrapping the hanging test in a script that runs:</div><div dir=3D"a=
uto">strace -f -ttt -o foo &lt;test&gt;</div><div dir=3D"auto">?</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Randy</div><br><br><div class=3D"g=
mail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr =
1, 2024, 04:10 Shinde, Yash via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;Yash.Shinde=3D<a href=3D"mailto:windriver.com=
@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">From: Yash Shinde &lt;<a href=3D"=
mailto:Yash.Shinde@windriver.com" target=3D"_blank" rel=3D"noreferrer">Yash=
.Shinde@windriver.com</a>&gt;<br>
<br>
qemumips and qemuppc were leaving stale processes behind after<br>
running glibc oe-selftest. During analysis, it was found that<br>
it was due to &quot;tst-scm_rights&quot; and &quot;tst-scm_rights-time64&qu=
ot; tests.<br>
Disable them so that there are no stale processes left behind.<br>
<br>
[YOCTO #15423]<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15423" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D15423</a><br>
<br>
Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windriver.com"=
 target=3D"_blank" rel=3D"noreferrer">Yash.Shinde@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../glibc/glibc/0024-qemu-stale-process.patch | 45 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.39.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">glibc_2.39.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 46 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0024-qemu-stale-proc=
ess.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch b/=
meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch<br>
new file mode 100644<br>
index 0000000000..c28fa31b89<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch<br>
@@ -0,0 +1,45 @@<br>
+glibc: Fix stale qemu processes left after glibc oe-selftest<br>
+<br>
+qemumips and qemuppc were leaving stale processes behind after<br>
+running glibc oe-selftest. During analysis, it was found that<br>
+it was due to &quot;tst-scm_rights&quot; and &quot;tst-scm_rights-time64&q=
uot; tests.<br>
+Disable them so that there are no stale processes left behind.<br>
+<br>
+[YOCTO #15423]<br>
+<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15423" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D15423</a><br>
+<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
+Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windriver.com=
" target=3D"_blank" rel=3D"noreferrer">Yash.Shinde@windriver.com</a>&gt;<br=
>
+---<br>
+diff --git a/sysdeps/unix/sysv/linux/Makefile=C2=A0 b/sysdeps/unix/sysv/li=
nux/Makefile<br>
+--- a/sysdeps/unix/sysv/linux/Makefile=C2=A0 =C2=A0 2024-03-18 01:15:49.01=
9202881 -0700<br>
++++ b/sysdeps/unix/sysv/linux/Makefile=C2=A0 2024-03-14 06:26:18.581404107=
 -0700<br>
+@@ -222,7 +222,6 @@<br>
+=C2=A0 =C2=A0tst-process_mrelease \<br>
+=C2=A0 =C2=A0tst-quota \<br>
+=C2=A0 =C2=A0tst-rlimit-infinity \<br>
+-=C2=A0 tst-scm_rights \<br>
+=C2=A0 =C2=A0tst-sigtimedwait \<br>
+=C2=A0 =C2=A0tst-sync_file_range \<br>
+=C2=A0 =C2=A0tst-sysconf-iov_max \<br>
+@@ -233,6 +232,8 @@<br>
+=C2=A0 =C2=A0tst-timerfd \<br>
+=C2=A0 =C2=A0tst-ttyname-direct \<br>
+=C2=A0 =C2=A0tst-ttyname-namespace \<br>
++=C2=A0 # Skip this test to avoid stale qemu process<br>
++=C2=A0 # tst-scm_rights \<br>
+=C2=A0 =C2=A0# tests<br>
+<br>
+ # process_madvise requires CAP_SYS_ADMIN.<br>
+@@ -270,9 +271,10 @@<br>
+=C2=A0 =C2=A0tst-ntp_gettimex-time64 \<br>
+=C2=A0 =C2=A0tst-ppoll-time64 \<br>
+=C2=A0 =C2=A0tst-prctl-time64 \<br>
+-=C2=A0 tst-scm_rights-time64 \<br>
+=C2=A0 =C2=A0tst-sigtimedwait-time64 \<br>
+=C2=A0 =C2=A0tst-timerfd-time64 \<br>
++=C2=A0 # Skip this test to avoid stale qemu process<br>
++=C2=A0 # tst-scm_rights-time64 \<br>
+=C2=A0 =C2=A0# tests-time64<br>
+<br>
+ tests-clone-internal =3D \<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.39.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">glibc_2.39.bb</a> b/meta/recip=
es-core/glibc/<a href=3D"http://glibc_2.39.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">glibc_2.39.bb</a><br>
index b203060064..9122472689 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.39.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">glibc_2.39.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.39.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">glibc_2.39.bb</a><br>
@@ -49,6 +49,7 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${SRCBR=
ANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0021-fix-create-thread-fai=
led-in-unprivileged-process-BZ-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0022-Avoid-hardcoded-build=
-time-paths-in-the-output-binar.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-aarch64-configure-Pas=
s-mcpu-along-with-march-to-dete.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0024-qemu-stale-process.pa=
tch \<br>
=C2=A0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197678): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197678" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/197678</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105259855/953=
399" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/105259855/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fba8090615054d54--

