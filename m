Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39472C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 17:58:46 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.19256.1747331924379150918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 10:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K05xtZ1b;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7053f85f059so11379187b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747331923; x=1747936723; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uHdl2ylfwbaGcUSycqFMAortIF/sJw6WSEnK6SaRjKs=;
        b=K05xtZ1bx2nH4qtdCQWIbdjvbgwmYATa9vAJazG6q64ZJa/bP3dwvdX3z7V5QCbdZr
         gXU059xYMuxhhiDuPYx66ko1o5ZyYdk97lWmhn4MP1QxA3eJkQIigJHF19febZMccfC7
         GPVfxuQ6/kyzEemaij7lqHlrzkn/TbWADIhN+41Aqbgd/7sCoa/o697AKmgRTRGIUtRJ
         DRcZdA3w5i5WJvSTgaFlFChNN0Qnckv2vL5K6fJ0v9Y4hIOrQF8sKSVbU2dc+Ixkq+dN
         SoyI8eROdokLFvzNqOdbo9Izn/vZEFSoPhc5IyF7F6NHoM8vaeRYMyZwAbj1zvx7/jZq
         HhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747331923; x=1747936723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHdl2ylfwbaGcUSycqFMAortIF/sJw6WSEnK6SaRjKs=;
        b=aK3+4a8TEZlt//e477Th0xGO3kzQ5Xq2jnzyB5eUi17SQynHSa0ZZLFmB9Ge+w6THd
         l6wOZQ0qy28FUmPCc+1Hp1M9uw4tdSGHr7ephQUbSG3OI5o5fS7qicXliwN7Eysr+9oH
         ZP4PbyaM1OuaM0rSK7CdYxre+NzWn+ucVR5hie85jee6KXHhKVkk3tDtEeSlZCZ+W7p7
         fiA5pT48842UfkkQUoEea8CU0pA6KIQjpbVKfH37zdowTz7gijSI3MFavEGZRgYF/bnK
         dEc0zlMrxYFMLUxWuHr1QMjibKX4QGgHTpy+ZS2CX0f/2VruzFXA/zi+IvnFPpq+lZln
         vXlA==
X-Gm-Message-State: AOJu0YxNd0ByNgplrkCAq0Hhp4dUj1KOFqnDyDwA9RVydgujEzBMdtvw
	3lOfib7hD765WLlG6vcffAvLcc4frf+wLKC4yaipLKUgn+bieLfiqOtwfoU0RMdnqFO1IWBJEiO
	mGuPLwUpyJOEMEIbxztW2hAopewJWqWe/Ghnjano=
X-Gm-Gg: ASbGnculDMPE19jFfn63acxGi0wSWSJkZWWu1+KYmMaLJBz42ZlX1ATWPIkkx+3YtRy
	0alDyowNo+dmQsMxw1LeD1z+0Rc2U+F6wD4Oy6wRublOK1tHsR6VJGiYBG3h4xyn99zcewtpqyr
	Dy67i58YeHyOIOAgv8s952Cs0c8l4/jQqwqA==
X-Google-Smtp-Source: AGHT+IFxvDAvT5mRgDhj4Q1Zk0Fwhqgecg2QJ3p9NbqA4dGIowT/5pahBPW0gnXJWHI0z0ygDQflHXnB7pxCATmCX9E=
X-Received: by 2002:a05:690c:368c:b0:70c:8da5:6622 with SMTP id
 00721157ae682-70ca79f429fmr9835287b3.18.1747331923237; Thu, 15 May 2025
 10:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250513035520.147573-2-vince@underview.tech>
In-Reply-To: <20250513035520.147573-2-vince@underview.tech>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 15 May 2025 13:58:30 -0400
X-Gm-Features: AX0GCFvr9AdlhBtKKUYHOaK4dn2zHycLpo-UiotMIt3n23KYIaDJGNc-UbFCx_Y
Message-ID: <CADkTA4O0-G7ZuQj=H4MqO4aYwwZvQzYPa1TPmOR+hvwTJ5SikQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] linux-yocto: build out-of-tree drivers with SDK
To: vince@underview.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000096e5cf0635306a97"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 17:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216701

--00000000000096e5cf0635306a97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 11:55=E2=80=AFPM Vincent Davis Jr via lists.openemb=
edded.org
<vince=3Dunderview.tech@lists.openembedded.org> wrote:

> Attached patch enables the compilation
> of out-of-tree drivers whilst utilizing
> the Yocto built SDK.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  ...-add-KCFLAGS-to-build-with-Yocto-SDK.patch | 65 +++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 ++
>  .../linux/linux-yocto-rt_6.12.bb              |  4 ++
>  .../linux/linux-yocto-tiny_6.12.bb            |  4 ++
>  meta/recipes-kernel/linux/linux-yocto_6.12.bb |  4 ++
>  5 files changed, 81 insertions(+)
>  create mode 100644
> meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with-Y=
octo-SDK.patch
>
> diff --git
> a/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with=
-Yocto-SDK.patch
> b/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with=
-Yocto-SDK.patch
> new file mode 100644
> index 0000000000..edf6a8480f
> --- /dev/null
> +++
> b/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with=
-Yocto-SDK.patch
> @@ -0,0 +1,65 @@
> +From e48021f480428b5e34d299261029bfafdf0e3a2f Mon Sep 17 00:00:00 2001
> +From: Vincent Davis Jr <vince@underview.tech>
> +Date: Sun, 11 May 2025 19:57:46 -0400
> +Subject: [PATCH] Makefile: add KCFLAGS to build with Yocto SDK
> +
> +Upstream-Status: Pending
> +
> +When running
> +
> +make -C \
> +"${SDKTARGETSYSROOT}/lib/modules/<kernel version>/build" \
> +modules_prepare
> +
> +Issues that are encountered include
> +
> +make -f ./Makefile syncconfig
> +make -f ./scripts/Makefile.build obj=3Dscripts/basic
> +   92 | #include <sys/types.h>
> +      |          ^~~~~~~~~~~~~
> +compilation terminated.
> +
> +ld: cannot find Scrt1.o: No such file or directory
> +ld: cannot find crti.o: No such file or directory
> +ld: cannot find crtbeginS.o: No such file or directory
> +ld: cannot find -lgcc: No such file or directory
> +ld: cannot find -lgcc_s: No such file or directory
> +ld: cannot find -lc: No such file or directory
> +ld: cannot find -lgcc: No such file or directory
> +ld: cannot find -lgcc_s: No such file or directory
> +ld: cannot find crtendS.o: No such file or directory
> +ld: cannot find crtn.o: No such file or directory
> +
> +Solved by setting KCFLAGS as the yocto project SDK
> +KCFLAGS is set to --sysroot=3D"${SDKTARGETSYSROOT}".
> +
> +Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 64c514f4bc19..bbe7b0503841 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -459,7 +459,7 @@ HOSTRUSTC =3D rustc
> + HOSTPKG_CONFIG        =3D pkg-config
> +
> + KBUILD_USERHOSTCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-prototyp=
es \
> +-                       -O2 -fomit-frame-pointer -std=3Dgnu11
> ++                       -O2 -fomit-frame-pointer -std=3Dgnu11 $(KCFLAGS)
> + KBUILD_USERCFLAGS  :=3D $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
> + KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)
> +
> +@@ -491,7 +491,7 @@ KBUILD_HOSTCXXFLAGS :=3D -Wall -O2 $(HOST_LFS_CFLAGS=
)
> $(HOSTCXXFLAGS) \
> +                      -I $(srctree)/scripts/include
> + KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
> +                       -Zallow-features=3D $(HOSTRUSTFLAGS)
> +-KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> ++KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS) $(KCFLAGS)
>

This needs to be explained more.

our eSDK and ontarget building and testing of out of tree kernel modules
work fine
without this.  The eSDK uses the sysroot, and that is done via the
definition of
the compiler.

Is there a reason why that won't work here ?

You could also just overload the HOST_* flags variables versus adding
something
completely new.



> + KBUILD_HOSTLDLIBS   :=3D $(HOST_LFS_LIBS) $(HOSTLDLIBS)
> + KBUILD_PROCMACROLDFLAGS :=3D $(or
> $(PROCMACROLDFLAGS),$(KBUILD_HOSTLDFLAGS))
> +
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 4b1f93a692..43ad4c4791 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -20,6 +20,10 @@ KMETA =3D "kernel-meta"
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name=3Dmachi=
ne;protocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name=3Dmachine;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dmaster;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dmaster;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
>
> +# Appears to be the only way to build out-of-tree
> +# kernel drivers with the yocto project SDK.
> +SRC_URI +=3D
> "file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch"
> +
>  # Set default SRCREVs. Both the machine and meta SRCREVs are statically
> set
>  # to the korg v3.7 tag, and hence prevent network access during parsing.
> If
>  # linux-yocto-dev is the preferred provider, they will be overridden to
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> index 6560175461..3f34dbf87d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> @@ -20,6 +20,10 @@ SRCREV_meta ?=3D
> "a50ff542f8d79235030741f9e850d34768907d2d"
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine;p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.12;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.12;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
>
> +# Appears to be the only way to build out-of-tree
> +# kernel drivers with the yocto project SDK.
> +SRC_URI +=3D
> "file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch"
> +
>  LINUX_VERSION ?=3D "6.12.27"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> index cf6014efad..aab465e9dd 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> @@ -25,6 +25,10 @@ PV =3D "${LINUX_VERSION}+git"
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine;p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.12;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.12;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
>
> +# Appears to be the only way to build out-of-tree
> +# kernel drivers with the yocto project SDK.
> +SRC_URI +=3D
> "file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch"
> +
>  COMPATIBLE_MACHINE =3D "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5=
)$"
>
>  # Functionality flags
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> index fefed8c9c5..b5efcc0192 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> @@ -43,6 +43,10 @@ KBRANCH:class-devupstream =3D "v6.12/base"
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRANCH};p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7B=
KBRANCH%7D;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.12;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.12;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
>
> +# Appears to be the only way to build out-of-tree
> +# kernel drivers with the yocto project SDK.
> +SRC_URI +=3D
> "file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch"
> +
>

linux-yocto patches go to the linux-yocto mailing list for integration.

But I think there are other ways to solve / work around this, so no need to
send it there immediately.

Bruce



>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>  LINUX_VERSION ?=3D "6.12.27"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216393):
> https://lists.openembedded.org/g/openembedded-core/message/216393
> Mute This Topic: https://lists.openembedded.org/mt/113084730/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000096e5cf0635306a97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 12, 2025 at 11:55=
=E2=80=AFPM Vincent Davis Jr via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;vince=3D<a href=3D"mailto:underview.tech@lis=
ts.openembedded.org">underview.tech@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Attached patch en=
ables the compilation<br>
of out-of-tree drivers whilst utilizing<br>
the Yocto built SDK.<br>
<br>
Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
---<br>
=C2=A0...-add-KCFLAGS-to-build-with-Yocto-SDK.patch | 65 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a>=C2=A0 |=C2=A0 4 ++=
<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_6.12.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto-rt_6.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_6.12.bb" rel=3D"noreferr=
er" target=3D"_blank">linux-yocto-tiny_6.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a> |=C2=A0 4 ++<br>
=C2=A05 files changed, 81 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/0001-Makefile-add-=
KCFLAGS-to-build-with-Yocto-SDK.patch<br>
<br>
diff --git a/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-b=
uild-with-Yocto-SDK.patch b/meta/recipes-kernel/linux/files/0001-Makefile-a=
dd-KCFLAGS-to-build-with-Yocto-SDK.patch<br>
new file mode 100644<br>
index 0000000000..edf6a8480f<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-wi=
th-Yocto-SDK.patch<br>
@@ -0,0 +1,65 @@<br>
+From e48021f480428b5e34d299261029bfafdf0e3a2f Mon Sep 17 00:00:00 2001<br>
+From: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
+Date: Sun, 11 May 2025 19:57:46 -0400<br>
+Subject: [PATCH] Makefile: add KCFLAGS to build with Yocto SDK<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+When running<br>
+<br>
+make -C \<br>
+&quot;${SDKTARGETSYSROOT}/lib/modules/&lt;kernel version&gt;/build&quot; \=
<br>
+modules_prepare<br>
+<br>
+Issues that are encountered include<br>
+<br>
+make -f ./Makefile syncconfig<br>
+make -f ./scripts/Makefile.build obj=3Dscripts/basic<br>
+=C2=A0 =C2=A092 | #include &lt;sys/types.h&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~<br>
+compilation terminated.<br>
+<br>
+ld: cannot find Scrt1.o: No such file or directory<br>
+ld: cannot find crti.o: No such file or directory<br>
+ld: cannot find crtbeginS.o: No such file or directory<br>
+ld: cannot find -lgcc: No such file or directory<br>
+ld: cannot find -lgcc_s: No such file or directory<br>
+ld: cannot find -lc: No such file or directory<br>
+ld: cannot find -lgcc: No such file or directory<br>
+ld: cannot find -lgcc_s: No such file or directory<br>
+ld: cannot find crtendS.o: No such file or directory<br>
+ld: cannot find crtn.o: No such file or directory<br>
+<br>
+Solved by setting KCFLAGS as the yocto project SDK<br>
+KCFLAGS is set to --sysroot=3D&quot;${SDKTARGETSYSROOT}&quot;.<br>
+<br>
+Signed-off-by: Vincent Davis Jr &lt;vince@underview.tech&gt;<br>
+---<br>
+ Makefile | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 64c514f4bc19..bbe7b0503841 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -459,7 +459,7 @@ HOSTRUSTC =3D rustc<br>
+ HOSTPKG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D pkg-config<br>
+ <br>
+ KBUILD_USERHOSTCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-prototypes=
 \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-O2 -fomit-frame-pointer -std=3Dgnu11<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-O2 -fomit-frame-pointer -std=3Dgnu11 $(KCFLAGS)<br>
+ KBUILD_USERCFLAGS=C2=A0 :=3D $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)<br>
+ KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)<br>
+ <br>
+@@ -491,7 +491,7 @@ KBUILD_HOSTCXXFLAGS :=3D -Wall -O2 $(HOST_LFS_CFLAGS) =
$(HOSTCXXFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -I $(srctree)/scripts/include<br>
+ KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-Zallow-features=3D $(HOSTRUSTFLAGS)<br>
+-KBUILD_HOSTLDFLAGS=C2=A0 :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)<br>
++KBUILD_HOSTLDFLAGS=C2=A0 :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS) $(KCFLAG=
S)<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">This needs to be explained more.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">our eSDK and ontarget building and testing of =
out of tree kernel modules work fine</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">without this.=C2=A0 The eSDK uses the sysroot, and th=
at is done via the definition of</div><div class=3D"gmail_default" style=3D=
"font-size:small">the compiler.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Is there a reason why that won&#39;t work here ?<br class=3D"gmail-A=
pple-interchange-newline"></div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">You could also just overload the HOST_* flags variables versus adding som=
ething</div><div class=3D"gmail_default" style=3D"font-size:small">complete=
ly new.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+ KBUILD_HOSTLDLIBS=C2=A0 =C2=A0:=3D $(HOST_LFS_LIBS) $(HOSTLDLIBS)<br>
+ KBUILD_PROCMACROLDFLAGS :=3D $(or $(PROCMACROLDFLAGS),$(KBUILD_HOSTLDFLAG=
S))<br>
+ <br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto-dev.bb</a><br>
index 4b1f93a692..43ad4c4791 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
@@ -20,6 +20,10 @@ KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-dev.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=
=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto-dev.git;=
branch=3D${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dmaster;des=
tsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blan=
k">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dmaster;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
<br>
+# Appears to be the only way to build out-of-tree<br>
+# kernel drivers with the yocto project SDK.<br>
+SRC_URI +=3D &quot;file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SD=
K.patch&quot;<br>
+<br>
=C2=A0# Set default SRCREVs. Both the machine and meta SRCREVs are statical=
ly set<br>
=C2=A0# to the korg v3.7 tag, and hence prevent network access during parsi=
ng. If<br>
=C2=A0# linux-yocto-dev is the preferred provider, they will be overridden =
to<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a><br>
index 6560175461..3f34dbf87d 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a><br>
@@ -20,6 +20,10 @@ SRCREV_meta ?=3D &quot;a50ff542f8d79235030741f9e850d3476=
8907d2d&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D=
${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.12=
;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bra=
nch=3Dyocto-6.12;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
<br>
+# Appears to be the only way to build out-of-tree<br>
+# kernel drivers with the yocto project SDK.<br>
+SRC_URI +=3D &quot;file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SD=
K.patch&quot;<br>
+<br>
=C2=A0LINUX_VERSION ?=3D &quot;6.12.27&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6=
.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a><br>
index cf6014efad..aab465e9dd 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a><br>
@@ -25,6 +25,10 @@ PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D=
${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.12=
;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bra=
nch=3Dyocto-6.12;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
<br>
+# Appears to be the only way to build out-of-tree<br>
+# kernel drivers with the yocto project SDK.<br>
+SRC_URI +=3D &quot;file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SD=
K.patch&quot;<br>
+<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;^(qemux86|qemux86-64|qemuarm64|qemuarm|q=
emuarmv5)$&quot;<br>
<br>
=C2=A0# Functionality flags<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_6.12.bb</a><br>
index fefed8c9c5..b5efcc0192 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
@@ -43,6 +43,10 @@ KBRANCH:class-devupstream =3D &quot;v6.12/base&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D;protocol=3Dhttps" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dma=
chine;branch=3D${KBRANCH};protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.12=
;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bra=
nch=3Dyocto-6.12;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
<br>
+# Appears to be the only way to build out-of-tree<br>
+# kernel drivers with the yocto project SDK.<br>
+SRC_URI +=3D &quot;file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SD=
K.patch&quot;<br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">linux-yocto patches go to the linux-yocto mailing list fo=
r integration.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">But I thin=
k there are other ways to solve / work around this, so no need to</div><div=
 class=3D"gmail_default" style=3D"font-size:small">send it there immediatel=
y.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
=C2=A0LINUX_VERSION ?=3D &quot;6.12.27&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216393): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216393" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216393</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113084730/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113084730/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000096e5cf0635306a97--

