Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60EFC4707B
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 01:09:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.1252.1704935340555064213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 17:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BegVc9cZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.54, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3374c693f92so3668233f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 17:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704935339; x=1705540139; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s5pCnhWR5X04vFZiSAiJ56tZbgSrRyY4KCuX1AVN2qY=;
        b=BegVc9cZ+1h+pJgnCjl+giWsqDJFGbgiwYBmpmBo12Rr7tnH3rFNLK2B+Y2J8zQtVg
         gmtUsr1a7d9NdYJCVFQuTxi5e1x2AlPFneNbqvAjIwWdorun/lOrJs67yX54dhatESqE
         pb2+pVkQLAmq97KhSl5vw1aythojsPDonMG0UmJ7OfAahGiWmOW5PEvnEVjH+pxVV3JE
         8JWHu952iLjseWnsRM6Grz+etbTaaj+NG30KJ2SJhu/S1StZiV6USEYK+pPMPhDwoseo
         AzNEijd0kIBrC3vhtQsRfO3TkCNtLgOy6nmSopVAmHv2FmygOvtVZKaecz4xViSGa+FY
         vfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704935339; x=1705540139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5pCnhWR5X04vFZiSAiJ56tZbgSrRyY4KCuX1AVN2qY=;
        b=QOKc/mfiDCL8St953Fxcwo+f5dhhXh8voxP0w0NSvX4B7aTftvy2TlBnGSXzXPdSVd
         gVmaTjKHUOG+AVf/Wqb10dQ88XGeg7NuVdNDi8IOHJLZ1I9TdJWXnZKMmmBJ7lHktWYI
         VvLQ7AK05dZD/zGlI1aq+ApzGCyR83lSENv5EXlWKVQhs0I4j6D0LJ0e1R35h/Z1uMtr
         /OzkkjMeNDgWCocor3AI1Owe6tcjhVX2Ut+3S0r4Ehxh/+bZtLCtO+MeUKbr6UY+xTVC
         BFh3zxb6VYia28f6qOS6ZD0XNmcsogbSqtHpuoBQtCaGyjfRtoNep5uFoJrxNWKNPVuY
         /X1g==
X-Gm-Message-State: AOJu0YwKd6fEjW2gbnBiD/n4JOWB5UO+GNhBeMV3KOH+NPNMwxamx3CZ
	ixU3wW8cNmf95UYDBU7Rj2iXLzz4NMoo0znMaWjhdo1jOPOJNhDspI5XQk7mIDc=
X-Google-Smtp-Source: AGHT+IFuGR+WLnnF/WB4IXNIzVxEyHCKkVMdjd9v1zZDc/iOKvGGdpWuj51mIa69JxnsOup4w0RtHkXoYvEAiUSUpCU=
X-Received: by 2002:a05:6000:885:b0:337:3f72:3dd5 with SMTP id
 cs5-20020a056000088500b003373f723dd5mr174093wrb.32.1704935338460; Wed, 10 Jan
 2024 17:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20240109111719.3908417-1-sanjana.venkatesh@windriver.com> <8bb0d710-5391-4731-bc39-e4acf8c799fe@windriver.com>
In-Reply-To: <8bb0d710-5391-4731-bc39-e4acf8c799fe@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 10 Jan 2024 15:08:49 -1000
Message-ID: <CAOSpxdYcm1dfodaivjc4epLruYp9GqorDBymEuxGh9HEjqOq1A@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] gdb [V2]: Fix CVE-2023-39130
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: sanjana.venkatesh@windriver.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Gowda, Naveen" <Naveen.Gowda@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>, Yash.Shinde@windriver.com
Content-Type: multipart/alternative; boundary="00000000000036daed060ea131be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 01:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193533

--00000000000036daed060ea131be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024, 2:56=E2=80=AFPM Randy MacLeod <randy.macleod@windrive=
r.com>
wrote:

> On 2024-01-09 6:17 a.m., sanjana.venkatesh@windriver.com wrote:
>
> From: Sanjana <sanjana.venkatesh@windriver.com> <sanjana.venkatesh@windri=
ver.com>
>
> Issue: LIN1022-4855
>
> Signed-off-by: Sanjana <sanjana.venkatesh@windriver.com> <sanjana.venkate=
sh@windriver.com>
> ---
>  meta/recipes-devtools/gdb/gdb.inc             |   1 +
>  .../gdb/gdb/0013-CVE-2023-39130.patch         | 326 ++++++++++++++++++
>  2 files changed, 327 insertions(+)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.pat=
ch
>
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
> index 099bd2d8f5..62b813d5cb 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -15,5 +15,6 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>             file://0009-Fix-invalid-sigprocmask-call.patch \
>             file://0010-gdbserver-ctrl-c-handling.patch \
>             file://0011-CVE-2023-39128.patch \
> +           file://0013-CVE-2023-39130.patch \
>             "
>  SRC_URI[sha256sum] =3D "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8=
463c3cc787152e32"
> diff --git a/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch b/me=
ta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
> new file mode 100644
> index 0000000000..c659f8a08c
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
> @@ -0,0 +1,326 @@
> +From 2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com> <amodra@gmail.com>
> +Date: Wed, 9 Aug 2023 09:58:36 +0930
> +Subject: [PATCH] gdb: warn unused result for bfd IO functions
> +
> +This fixes the compilation warnings introduced by my bfdio.c patch.
> +
> +The removed bfd_seeks in coff_symfile_read date back to 1994, commit
> +7f4c859520, prior to which the file used stdio rather than bfd to read
> +symbols.  Since it now uses bfd to read the file there should be no
> +need to synchronise to bfd's idea of the file position.  I also fixed
> +a potential uninitialised memory access.
> +
> +Approved-By: Andrew Burgess <aburgess@redhat.com> <aburgess@redhat.com>
>
> +
> +Upstream-Status: Backport from [https://sourceware.org/git/?p=3Dbinutils=
-gdb.git;a=3Dcommitdiff;h=3D2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80]
> +CVE: CVE-2023-39130
> +Signed-off-by: Sanjana Venkatesh <sanjana.venkatesh@windriver.com> <sanj=
ana.venkatesh@windriver.com>
>
> Hi Sanjana,
>
> I was looking in the gdb git repo to see if you had to adjust the commit
> at all
> since it's a fairly large patch. It seems you didn't change anything whic=
h
> is good!
>
> but...
>
> I think you need this follow-up commit:
>
> commit ec2479e820c32ef443382a622a1d555a71730f64
> Author: Alan Modra <amodra@gmail.com> <amodra@gmail.com>
> Date:   Sat Aug 12 19:26:12 2023
>
>     Re: gdb: warn unused result for bfd IO functions
>
>     Add a missing return statement.
>
> It would be nice to be able to test that these toolchain changes don't
> cause any regressions.
>
> The code here is only "Used as a last resort if no debugging symbols
> recognized." so that's a bit of a challenge. What runtime testing, if any=
,
> did you do so far? Do you know or can you easily determine if any of the
> tests in gdb cover the code that changed here?
>
> It looks like Steve already has your patch in his queue so unless he says
> otherwise, just send a commit to add the patch above
>

Since I haven't merged it yet you can send a V3 or a follow-up patch.
Whichever you prefer is fine!

Steve

>

--00000000000036daed060ea131be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jan 10, 2024, 2:56=E2=80=AFPM Randy MacLeod &l=
t;<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank" rel=3D"n=
oreferrer">randy.macleod@windriver.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><u></u>

 =20
  <div>
    <div>On 2024-01-09 6:17 a.m.,
      <a href=3D"mailto:sanjana.venkatesh@windriver.com" rel=3D"noreferrer =
noreferrer" target=3D"_blank">sanjana.venkatesh@windriver.com</a> wrote:<br=
>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Sanjana <a href=3D"mailto:sanjana.venkatesh@windriver.com"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">&lt;sanjana.venkatesh@wind=
river.com&gt;</a>

Issue: LIN1022-4855

Signed-off-by: Sanjana <a href=3D"mailto:sanjana.venkatesh@windriver.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">&lt;sanjana.venkatesh@windri=
ver.com&gt;</a>
---
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 .../gdb/gdb/0013-CVE-2023-39130.patch         | 326 ++++++++++++++++++
 2 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/=
gdb.inc
index 099bd2d8f5..62b813d5cb 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,5 +15,6 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            <a rel=3D"noreferrer noreferrer">file://0009-Fix-invalid-sigpro=
cmask-call.patch</a> \
            <a rel=3D"noreferrer noreferrer">file://0010-gdbserver-ctrl-c-h=
andling.patch</a> \
            <a rel=3D"noreferrer noreferrer">file://0011-CVE-2023-39128.pat=
ch</a> \
+           <a rel=3D"noreferrer noreferrer">file://0013-CVE-2023-39130.pat=
ch</a> \
            &quot;
 SRC_URI[sha256sum] =3D &quot;1497c36a71881b8671a9a84a0ee40faab788ca30d7ba1=
9d8463c3cc787152e32&quot;
diff --git a/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch b/meta=
/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
new file mode 100644
index 0000000000..c659f8a08c
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch
@@ -0,0 +1,326 @@
+From 2db20b97f1dc3e5dce3d6ed74a8a62f0dede8c80 Mon Sep 17 00:00:00 2001
+From: Alan Modra <a href=3D"mailto:amodra@gmail.com" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">&lt;amodra@gmail.com&gt;</a>
+Date: Wed, 9 Aug 2023 09:58:36 +0930
+Subject: [PATCH] gdb: warn unused result for bfd IO functions
+
+This fixes the compilation warnings introduced by my bfdio.c patch.
+
+The removed bfd_seeks in coff_symfile_read date back to 1994, commit
+7f4c859520, prior to which the file used stdio rather than bfd to read
+symbols.  Since it now uses bfd to read the file there should be no
+need to synchronise to bfd&#39;s idea of the file position.  I also fixed
+a potential uninitialised memory access.
+
+Approved-By: Andrew Burgess <a href=3D"mailto:aburgess@redhat.com" rel=3D"=
noreferrer noreferrer" target=3D"_blank">&lt;aburgess@redhat.com&gt;</a></p=
re>
    </blockquote>
    <blockquote type=3D"cite">
      <pre>+
+Upstream-Status: Backport from [<a href=3D"https://sourceware.org/git/?p=
=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D2db20b97f1dc3e5dce3d6ed74a8a62f0dede=
8c80" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.or=
g/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D2db20b97f1dc3e5dce3d6ed74a8a=
62f0dede8c80</a>]
+CVE: CVE-2023-39130
+Signed-off-by: Sanjana Venkatesh <a href=3D"mailto:sanjana.venkatesh@windr=
iver.com" rel=3D"noreferrer noreferrer" target=3D"_blank">&lt;sanjana.venka=
tesh@windriver.com&gt;</a></pre>
    </blockquote>
    <p>Hi <span style=3D"white-space:pre-wrap">Sanjana,</span></p>
    <p>I was looking in the gdb git repo to see if you had to adjust the
      commit at all<br>
      since it&#39;s a fairly large patch. It seems you didn&#39;t change
      anything which is good!</p>
    <p>but...</p>
    <p>I think you need this follow-up commit:<br>
    </p>
    <p>commit ec2479e820c32ef443382a622a1d555a71730f64<br>
      Author: Alan Modra <a href=3D"mailto:amodra@gmail.com" rel=3D"norefer=
rer noreferrer" target=3D"_blank">&lt;amodra@gmail.com&gt;</a><br>
      Date:=C2=A0=C2=A0 Sat Aug 12 19:26:12 2023<br>
      <br>
      =C2=A0=C2=A0=C2=A0 Re: gdb: warn unused result for bfd IO functions<b=
r>
      =C2=A0=C2=A0 =C2=A0<br>
      =C2=A0=C2=A0=C2=A0 Add a missing return statement.<br>
    </p>
    <p><span style=3D"white-space:pre-wrap">
</span></p>
    <p><span style=3D"white-space:pre-wrap">It would be nice to be able to =
test that these toolchain changes don&#39;t cause any regressions.
</span></p>
    <p><span style=3D"white-space:pre-wrap">The code here is only &quot;Use=
d as a last resort if no debugging symbols recognized.&quot;
so that&#39;s a bit of a challenge. What runtime testing, if any, did you d=
o so far?
Do you know or can you easily determine if any of the tests in gdb cover th=
e code that changed here?
</span></p>
    <p><span style=3D"white-space:pre-wrap">It looks like Steve already has=
 your patch in his queue so unless he says otherwise,
just send a commit to add the patch above</span></p></div></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Since I haven&#39;t m=
erged it yet you can send a V3 or a follow-up patch. Whichever you prefer i=
s fine!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Steve</div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
><p><span style=3D"white-space:pre-wrap">
</span></p>
  </div>

</blockquote></div></div></div>

--00000000000036daed060ea131be--

