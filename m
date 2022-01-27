Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4A8C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 18:09:30 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.1570.1643306969487815517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 10:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Abg76BQv;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id g145so3389389qke.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 10:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ccozF2vUyfP0iOqUlqb3W8ziQaYTEUqeUpcxlRIattc=;
        b=Abg76BQvBPCgJBf9HcstETXcuVEWc/7WQHuBMoPQG1aAZambwAmbsNeBcgZysyICiu
         xPoxGedRlnRl6mS3a3TmmW3zqrrWSYpUq3FEkGmAlOxb7gZVAdYnXzVKPuuXEqxfgyjX
         rMesuae31pPKsDy7wEspc9xG29ISrzGR3/wtF11HflLuhIEbGsw+vLZ0TrpG2C3C4pYl
         MOwXeSaYHVYasge+B38FErF721DvKsaFtsbmopuNbZ3QAJ1B73AIaJ70rJd9oI27hrN2
         V2iUQdsSCnYJNWHY7Y3akUC6i7qKylsKCC68iAqx8a4xfH/0lesnSIasm/HOlFkFYUdn
         RtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ccozF2vUyfP0iOqUlqb3W8ziQaYTEUqeUpcxlRIattc=;
        b=IHoTiaIozoqGNYINNytyItYMlc17M3tM8mvUIxTSkjfZksiKawIQu7jXGDCmTj5u0T
         +x8TTBjc3/4LxtdraXX52onFwAajpTq9KqMYimCTdthecEVEAnjD6cBx5ExIxP0nUl24
         yLFWEMV9RiGE4W42JgPOUCmY8L6AafJEMY8S89gSLgh65N3Onz5myV/QIbgvP08mBIZR
         oYfNe+cXvia4gUyaP9feF7kEmevUZ1/hQn6APjbTNGhCAAITvox2v2RJ4S37MdOC/o82
         LQXMRWzvqHYZd3Hu/zaU+haoLGyy2DJ+zsqSlf3nw1to+YecKAcXtEkEawVUUm4OS8wI
         4yow==
X-Gm-Message-State: AOAM532dT86fTgRBP6APJ4oW66NpYnc80eFVTDMQxgjyJKZsG2zNtHZ8
	n5D7F8hHtEBHJceF5klbw5iHUomjjFMoo6Jv9a8hBFGADtY=
X-Google-Smtp-Source: 
 ABdhPJyPA2DiyANNCxbhe3eSaTx3Sx8zJGjoA+xD6JGZRBLN8Y+STLlpgmdQbWtBaJgwVxKNtO8pcdyoQKuZz04zwxk=
X-Received: by 2002:a37:63cf:: with SMTP id x198mr3673281qkb.72.1643306968412;
 Thu, 27 Jan 2022 10:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20220127102005.3050843-1-alex@linutronix.de>
 <20220127102005.3050843-17-alex@linutronix.de>
In-Reply-To: <20220127102005.3050843-17-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2022 10:09:02 -0800
Message-ID: 
 <CAMKF1soS8r7zEf7MVMwJ_QBd8jEYDg_kBvAVy61CTNwGuWHiUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 17/17] gobject-introspection: replace
 prelink-rtld with objdump -p
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 18:09:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161044

On Thu, Jan 27, 2022 at 2:21 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> g-i internally processes the output with regexes, and seems
> happy with what objdump is printing. It only needs to resolve
> the library name as passed to the linker to the library file name.
> Also recursive resolution (that ldd is doing and objdump is not)
> is not necessary.
>

thanks for doing this, it further unbolts prelink from core metaddata.
Objdump -p is good, does it use it from binutils-cross ?

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/gobject-introspection.bbclass    |  2 +-
>  ...-error-return-codes-from-ldd-wrapper.patch | 28 -------------------
>  .../gobject-introspection_1.70.0.bb           | 14 ++--------
>  3 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-intr=
ospection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
>
> diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/go=
bject-introspection.bbclass
> index 4db1b362d9..7bf9feb0d6 100644
> --- a/meta/classes/gobject-introspection.bbclass
> +++ b/meta/classes/gobject-introspection.bbclass
> @@ -29,7 +29,7 @@ EXTRA_OEMESON:prepend:class-nativesdk =3D "${@['', '${G=
IRMESONBUILD}'][d.getVar('G
>
>  # Generating introspection data depends on a combination of native and t=
arget
>  # introspection tools, and qemu to run the target tools.
> -DEPENDS:append:class-target =3D " gobject-introspection gobject-introspe=
ction-native qemu-native prelink-native"
> +DEPENDS:append:class-target =3D " gobject-introspection gobject-introspe=
ction-native qemu-native"
>
>  # Even though introspection is disabled on -native, gobject-introspectio=
n package is still
>  # needed for m4 macros.
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/meta/r=
ecipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ign=
ore-error-return-codes-from-ldd-wrapper.patch
> deleted file mode 100644
> index b484b5e9e6..0000000000
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From f742da8b3913f4818d3f419117076afe62f4dbf4 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 5 Sep 2018 16:46:52 +0200
> -Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
> -
> -prelink-rtld, which we use instead of ldd returns 127 when it can't find=
 a library.
> -It is not an error per se, but it breaks subprocess.check_output().
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - giscanner/shlibs.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
> -index d67df95..80352a6 100644
> ---- a/giscanner/shlibs.py
> -+++ b/giscanner/shlibs.py
> -@@ -102,7 +102,7 @@ def _resolve_non_libtool(options, binary, libraries)=
:
> -             args.extend(['otool', '-L', binary.args[0]])
> -         else:
> -             args.extend(['ldd', binary.args[0]])
> --        output =3D subprocess.check_output(args)
> -+        output =3D subprocess.run(args, check=3DFalse, stdout=3Dsubproc=
ess.PIPE).stdout
> -         if isinstance(output, bytes):
> -             output =3D output.decode("utf-8", "replace")
> -
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.70.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.70.0.bb
> index d4ee03d33c..4f72a33bfa 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70=
.0.bb
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70=
.0.bb
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc434e8128a68=
bedd59b80b2ac1eb1c4a \
>                      "
>
>  SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)=
}/${BPN}-${PV}.tar.xz \
> -           file://0001-giscanner-ignore-error-return-codes-from-ldd-wrap=
per.patch \
>             file://0001-build-Avoid-the-doctemplates-hack.patch \
>             "
>
> @@ -33,9 +32,7 @@ DEPENDS +=3D " libffi zlib glib-2.0 python3 flex-native=
 bison-native autoconf-arch
>  # target build needs qemu to run temporary introspection binaries create=
d
>  # on the fly by g-ir-scanner and a native version of itself to run
>  # native versions of its own tools during build.
> -# Also prelink-rtld is used to find out library dependencies of introspe=
ction binaries
> -# (standard ldd doesn't work when cross-compiling).
> -DEPENDS:append:class-target =3D " gobject-introspection-native qemu-nati=
ve prelink-native"
> +DEPENDS:append:class-target =3D " gobject-introspection-native qemu-nati=
ve"
>
>  # needed for writing out the qemu wrapper script
>  export STAGING_DIR_HOST
> @@ -55,13 +52,6 @@ EXTRA_OEMESON:class-target =3D " \
>      ${@'-Dgir_dir_prefix=3D${libdir}' if d.getVar('MULTILIBS') else ''} =
\
>  "
>
> -# Need to ensure ld.so.conf exists so prelink-native works
> -# both before we build and if we install from sstate
> -do_configure[prefuncs] +=3D "gobject_introspection_preconfigure"
> -python gobject_introspection_preconfigure () {
> -    oe.utils.write_ld_so_conf(d)
> -}
> -
>  do_configure:prepend:class-native() {
>          # Tweak the native python scripts so that they don't refer to th=
e
>          # full path of native python binary (the solution is taken from =
glib-2.0 recipe)
> @@ -113,7 +103,7 @@ EOF
>          # for a different architecture
>          cat > ${B}/g-ir-scanner-lddwrapper << EOF
>  #!/bin/sh
> -prelink-rtld --root=3D$STAGING_DIR_HOST "\$@"
> +$OBJDUMP -p "\$@"
>  EOF
>          chmod +x ${B}/g-ir-scanner-lddwrapper
>
> --
> 2.20.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161039): https://lists.openembedded.org/g/openembedde=
d-core/message/161039
> Mute This Topic: https://lists.openembedded.org/mt/88718372/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

