Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E727D0EE0D
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 16:52:49 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1997.1764089559205543548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 08:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7vaNVIn;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-789524e6719so77531797b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 08:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764089558; x=1764694358; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PgAOF5s4zyEBTl+Urt/q+xXeHRW+hV8ltZ5Z5SzdTXw=;
        b=d7vaNVInoN7apRDZKpmHs22+GAxusELm4bRw5A9sI/6hlGPFkjk3eHuCbkdtQaFZ1+
         kK/iEKD8U97rbedxI6k2HkpyYolH2wpZLVTfdyCUlfxjzJ8BjR4GpiX/fsJFjfIvEy9N
         U/mKIl1nkFilMO2fwPzFTmwr1OS6Lx0kS2wb8DC5mcVmjnAVf73cPX9tWFRVj68w/CFw
         DIlngdHdFnZNRNe2+vkbdHvAQ76N+eUp0M1fnjIbZk9nyhrZ4FvmhX71ZWRZ8MWmFLPH
         OSp+MpZtbOs46jSDnbkzxmQMpIWzx8588S8mNlRXDvNRlhmJpYl1pvKx6pCVvndYEQsn
         Em7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764089558; x=1764694358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgAOF5s4zyEBTl+Urt/q+xXeHRW+hV8ltZ5Z5SzdTXw=;
        b=bFFO+qGS6YLlVJ1jVnXUgZS0kbqJuA56YJKqFvBBVinDcmRUQWMWlHTgmwT+AUGWc2
         7GYCoYWppOb1CdGTbWLQ0/pyKKZl3qW6VN9Q3e53almSKshJP3UeGHxJGX44xv4MO8zh
         a9F5Wh9/s0k7sZqQzpjM5of4b7PD1GyiLjyMMrrev2mGJ6LuuL2r+tzaJGzu2lNhNGju
         iABoWM3zUZI5o9godFCSVLPHhg8TleCpdANuISc5b4JtPnr8uImLxZDQp1YRgLWBxZ2E
         K8x1usIrvyQp26PJVHJQgLbI09CQWVjfXkM/BH7HcvBvMMrk4yFj4wb2SdCiAdIPWUyi
         iDnA==
X-Gm-Message-State: AOJu0Yxukiw96jmrmPfZnRD416252pvSpPZj8fibBkLRVXJsAm7y4iKQ
	NeVcmYlI1EArs2OvA69CrK/UDnv8/seX9x37DnmPpZyg4RGhdpDg4gEpJ9oZ5IYs0RUnfZ2/QHP
	wYkZPUSE0g2+OIFA6SuL2YtnK3D1NMa59TCL1
X-Gm-Gg: ASbGncuaB+bbRdbzh+NR2LZ83VAcHwywOrFPJ9ugSm+dJfBCrbqLSV4eNFI4gq7Ycrz
	2Bv3lJUJpNfIMQy37KtiwosT8GzWTkJ8XpqC+4GdosFDRFe4OGUSE5kPCe0I7HQ95fJdN7HCHek
	91VMsoXQkZkhpysGe/6jJIZ223XjYwgrHfsD+XS1rNYUc7idGYfc1+u5ICtSlRXvPZ7NMSkXaS9
	f4tmIkiMBJv4QYA5QNAqlVzheC2hqq/2NOzxCeyRcBLIpVmW7QFoGX5JFm9i6kZliZej335Pf6k
	wYtLwo2TdAygUY56uR3T46gaCWSTjHft84HrIB45NI6SzRl8OvhZE1GNZ3Uk57wYkmc3Y8AF+ZT
	/SaYfp/cSNgvkT6HKyLCf6yLxDDR8+ps=
X-Google-Smtp-Source: AGHT+IG9CflgPeU9IsV/anOBRLvjB3ig7GtNqRJcz3o0PnxR09S76jgx+xE23d2wl2yXBhUKVEsv3B3zE+CgNJCHMh4=
X-Received: by 2002:a05:690c:34c9:b0:787:bcba:e2f2 with SMTP id
 00721157ae682-78a7bc40132mr148391007b3.35.1764089558191; Tue, 25 Nov 2025
 08:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20251125084005.3939139-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251125084005.3939139-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Nov 2025 08:52:12 -0800
X-Gm-Features: AWmQ_bnjev6toGHhNf-BdMgKMmrLr1p16PdaaiuayY7nLhyZyHbxF06Ml0Egppw
Message-ID: <CAMKF1sp0RVG1HP6WvH6OK4k+xWmvg8ZYgqA2_C_yVZoCfrcBUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Drop 0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="00000000000077d3f206446e1bed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 16:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226772

--00000000000077d3f206446e1bed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM

On Tue, Nov 25, 2025 at 12:40=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> wrote:

> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This patch was originally added to replace pwd-derived paths in glibc tes=
t
> binaries with
> fixed Yocto paths (e.g., $(oe_srcdir),
> $(libdir)/glibc-tests/ptest/tests/glibc-ptest) to
> fix the repro issue with run-ptest script(no longer exists in master).
>
> In the current master:
> run-ptest script and the glibc-y2038-tests recipe were dropped via the
> following commit
>
> https://git.openembedded.org/openembedded-core/commit/meta?id=3Dfbe3679ba=
3c12c52a502511f5dde91fb4de7a6b6
> Glibc tests now run via check-test-wrapper, which dynamically configures
> environment,
> sysroot, and library paths. The hardcoded paths from this patch conflict
> with dynamic
> path resolution, causing some tests to fail like
>
> error: xdlmopen.c:28: error:
> dlmopen:/usr/lib/glibc-tests/ptest/tests/glibc-ptest/*:
> cannot open shared object file:No such file or directory
>
> Reproducibility is confirmed to remain intact without this patch. Since i=
t
> no longer provides
> benefits and interferes with correct test execution, the patch is being
> dropped.
>
> Testing results:
>
>             before   after   diff
> PASS         6937     6943     +6
> XPASS           4        4      0
> FAIL           72       66     -6
> XFAIL          16       16      0
> UNSUPPORTED   108      108      0
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  ...build-time-paths-in-the-output-binar.patch | 32 -------------------
>  meta/recipes-core/glibc/glibc_2.42.bb         |  1 -
>  2 files changed, 33 deletions(-)
>  delete mode 100644
> meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-th=
e-output-binar.patch
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-=
the-output-binar.patch
> b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-=
the-output-binar.patch
> deleted file mode 100644
> index 9fa5d471ad..0000000000
> ---
> a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-=
the-output-binar.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 662d544fbed823b9bf917058762ddb54bcee5f07 Mon Sep 17 00:00:00 2001
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Date: Sun, 24 Jul 2022 07:07:29 -0700
> -Subject: [PATCH] Avoid hardcoded build time paths in the output binaries
> -
> -replace the compile definitions with the output locations.
> -
> -Upstream-Status: Inappropriate [would need reworking somehow to be
> acceptable upstream]
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - support/Makefile | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/support/Makefile b/support/Makefile
> -index d41278eeab..657769418e 100644
> ---- a/support/Makefile
> -+++ b/support/Makefile
> -@@ -238,9 +238,9 @@ libsupport-inhibit-o +=3D .o
> - endif
> -
> - CFLAGS-support_paths.c =3D \
> --              -DSRCDIR_PATH=3D\"`cd .. ; pwd`\" \
> --              -DOBJDIR_PATH=3D\"`cd $(objpfx)/..; pwd`\" \
> --              -DOBJDIR_ELF_LDSO_PATH=3D\"`cd $(objpfx)/..;
> pwd`/elf/$(rtld-installed-name)\" \
> -+              -DSRCDIR_PATH=3D\"$(oe_srcdir)\" \
> -+
> -DOBJDIR_PATH=3D\"$(libdir)/glibc-tests/ptest/tests/glibc-ptest\" \
> -+
> -DOBJDIR_ELF_LDSO_PATH=3D\"$(slibdir)/$(rtld-installed-name)\" \
> -               -DINSTDIR_PATH=3D\"$(prefix)\" \
> -               -DLIBDIR_PATH=3D\"$(libdir)\" \
> -               -DBINDIR_PATH=3D\"$(bindir)\" \
> diff --git a/meta/recipes-core/glibc/glibc_2.42.bb
> b/meta/recipes-core/glibc/glibc_2.42.bb
> index f9c1cdc2f1..b33d1b44ba 100644
> --- a/meta/recipes-core/glibc/glibc_2.42.bb
> +++ b/meta/recipes-core/glibc/glibc_2.42.bb
> @@ -51,7 +51,6 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>
> file://0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
>
> file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
>
> file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
> -
>  file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
>
> file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
>
> file://0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
>  "
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226754):
> https://lists.openembedded.org/g/openembedded-core/message/226754
> Mute This Topic: https://lists.openembedded.org/mt/116466215/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000077d3f206446e1bed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 25, 2025 at 12:40=E2=
=80=AFAM Varatharajan, Deepesh via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;deepesh.varatharajan=3D<a href=3D"mailto:w=
indriver.com@lists.openembedded.org">windriver.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varatharajan@windriv=
er.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>&gt;<br>
<br>
This patch was originally added to replace pwd-derived paths in glibc test =
binaries with<br>
fixed Yocto paths (e.g., $(oe_srcdir), $(libdir)/glibc-tests/ptest/tests/gl=
ibc-ptest) to<br>
fix the repro issue with run-ptest script(no longer exists in master).<br>
<br>
In the current master:<br>
run-ptest script and the glibc-y2038-tests recipe were dropped via the foll=
owing commit<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/meta?id=3D=
fbe3679ba3c12c52a502511f5dde91fb4de7a6b6" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.openembedded.org/openembedded-core/commit/meta?id=3Dfbe3679=
ba3c12c52a502511f5dde91fb4de7a6b6</a><br>
Glibc tests now run via check-test-wrapper, which dynamically configures en=
vironment,<br>
sysroot, and library paths. The hardcoded paths from this patch conflict wi=
th dynamic<br>
path resolution, causing some tests to fail like<br>
<br>
error: xdlmopen.c:28: error: dlmopen:/usr/lib/glibc-tests/ptest/tests/glibc=
-ptest/*:<br>
cannot open shared object file:No such file or directory<br>
<br>
Reproducibility is confirmed to remain intact without this patch. Since it =
no longer provides<br>
benefits and interferes with correct test execution, the patch is being dro=
pped.<br>
<br>
Testing results:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 before=C2=A0 =C2=A0after=C2=A0 =
=C2=A0diff<br>
PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06937=C2=A0 =C2=A0 =C2=A06943=C2=A0 =
=C2=A0 =C2=A0+6<br>
XPASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
4=C2=A0 =C2=A0 =C2=A0 0<br>
FAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A072=C2=A0 =C2=A0 =C2=A0 =C2=A06=
6=C2=A0 =C2=A0 =C2=A0-6<br>
XFAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16=C2=A0 =C2=A0 =C2=A0 =C2=A016=C2=
=A0 =C2=A0 =C2=A0 0<br>
UNSUPPORTED=C2=A0 =C2=A0108=C2=A0 =C2=A0 =C2=A0 108=C2=A0 =C2=A0 =C2=A0 0<b=
r>
<br>
Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
---<br>
=C2=A0...build-time-paths-in-the-output-binar.patch | 32 ------------------=
-<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.42.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.42.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 -<br>
=C2=A02 files changed, 33 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded=
-build-time-paths-in-the-output-binar.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-=
paths-in-the-output-binar.patch b/meta/recipes-core/glibc/glibc/0022-Avoid-=
hardcoded-build-time-paths-in-the-output-binar.patch<br>
deleted file mode 100644<br>
index 9fa5d471ad..0000000000<br>
--- a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-i=
n-the-output-binar.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From 662d544fbed823b9bf917058762ddb54bcee5f07 Mon Sep 17 00:00:00 2001<br>
-From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
-Date: Sun, 24 Jul 2022 07:07:29 -0700<br>
-Subject: [PATCH] Avoid hardcoded build time paths in the output binaries<b=
r>
-<br>
-replace the compile definitions with the output locations.<br>
-<br>
-Upstream-Status: Inappropriate [would need reworking somehow to be accepta=
ble upstream]<br>
-<br>
-Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- support/Makefile | 6 +++---<br>
- 1 file changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/support/Makefile b/support/Makefile<br>
-index d41278eeab..657769418e 100644<br>
---- a/support/Makefile<br>
-+++ b/support/Makefile<br>
-@@ -238,9 +238,9 @@ libsupport-inhibit-o +=3D .o<br>
- endif<br>
- <br>
- CFLAGS-support_paths.c =3D \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DSRCDIR_PATH=3D\&quot;`=
cd .. ; pwd`\&quot; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DOBJDIR_PATH=3D\&quot;`=
cd $(objpfx)/..; pwd`\&quot; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DOBJDIR_ELF_LDSO_PATH=
=3D\&quot;`cd $(objpfx)/..; pwd`/elf/$(rtld-installed-name)\&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DSRCDIR_PATH=3D\&quot;$=
(oe_srcdir)\&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DOBJDIR_PATH=3D\&quot;$=
(libdir)/glibc-tests/ptest/tests/glibc-ptest\&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DOBJDIR_ELF_LDSO_PATH=
=3D\&quot;$(slibdir)/$(rtld-installed-name)\&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DINSTDIR_PATH=3D\&=
quot;$(prefix)\&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLIBDIR_PATH=3D\&q=
uot;$(libdir)\&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DBINDIR_PATH=3D\&q=
uot;$(bindir)\&quot; \<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.42.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.42.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.42.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.42.bb</a><br>
index f9c1cdc2f1..b33d1b44ba 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.42.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.42.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.42.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.42.bb</a><br>
@@ -51,7 +51,6 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${SRCBR=
ANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0019-timezone-Make-shell-i=
nterpreter-overridable-in-tzsel.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0020-tzselect.ksh-Use-bin-=
sh-default-shell-interpreter.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0021-fix-create-thread-fai=
led-in-unprivileged-process-BZ-.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0022-Avoid-hardcoded-build=
-time-paths-in-the-output-binar.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-tests-Skip-2-qemu-tes=
ts-that-can-hang-in-oe-selftest.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-Propagate-ffile-prefi=
x-map-from-CFLAGS-to-ASFLAGS.patch \<br>
=C2=A0&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226754): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226754" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226754</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116466215/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116466215/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000077d3f206446e1bed--

