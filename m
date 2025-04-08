Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55634C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 03:42:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.66928.1744083734138520195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 20:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YdIyevjo;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2264aefc45dso64059325ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 20:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744083733; x=1744688533; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kwT5uSnZkn67cavMmwHHZi8+a7M7P5iAH7+ZkMwjYo0=;
        b=YdIyevjo3nQpmozif1RMNhgxwezfi+ccA1kx6gjbr3KjURisR3hKH8GErjF3Hfvi6U
         835lAdhFgrwurtZoJi7bfou/tMr8J48ZZhpqapWgk7litToqc/hkZb2fTvYPUgkoRrCP
         1FyJvvW2NLUT/9xQ6dO8h9yGXHaq2LWM1HvI9mqdjtikaLOn9ZIukZVqa5/wGdMckipQ
         pBZuRSctEGoaYuCCmhr6rL5usXD3T5Kmo214Bs8h/oB3bYB1W0zFfFcPHzK80+tqwtzw
         rLeYNl1IdeEX1m/bvr5PjxDWTkFE9QP/gjymrLVe41BW9nIMGAol7EOhfldM0MdteYI4
         jvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744083733; x=1744688533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwT5uSnZkn67cavMmwHHZi8+a7M7P5iAH7+ZkMwjYo0=;
        b=sax9MNjsK123eRRzhpc/4dHt3EyxQpTPExIy9e0jKlaqu6DzO4egrfUZBicsmbKyhj
         gKXo2YutK/TSv6DzFP1nFQOCTWSggQYSfnRX3zjzo04Rhn4IJkBsxrg3tPYH4IA54Q5n
         CC/4GbJrctGpgvOYkXwr9wLbidFNuMUtDLgkZPMh0+tRjq6y7hR4mpTwZ+66RPMQfj3V
         o09YWF2CEsFLhqpO2WpyWB162yhyloAbMr/KnwlsTGuNHsWOMCO29hua3T0pD2w1X1jA
         6aREr7pGoAx+ifDCAjjHQ0K2wVmg8l3eeOq9EWvh9npc7F8rpe2AeZl/SzrdB5bsZ2mr
         8O6g==
X-Gm-Message-State: AOJu0Yx4ZGWNrQQ9YJmUkbkdEQaZmtZStexPLdG7Ytsi9S+T5e/V38EJ
	y2ABE3aD2CZLNuKqwd4jEK27OYJk0li5P/zmVvVZ4axC6JRbiB9aMhNp1iFcUeuP46sx1hN/qlr
	7EUpNk8RLmZwto7jmX6Lh5QgR7lQ=
X-Gm-Gg: ASbGncvVjsI8LN6fBhXltMG8Ap5f7/a4QMQtEit0XN7bmPSNiTA+kgjjT+R70cku4g9
	zgJXGTYlQws2ZzKQCYnYwss1XAUnxn0/W5yQWllC2LLLVUPYuGLWdyaUpiwFdBMDwhiYq0qGmwr
	UEygBCeV1alam1SQDan80vW8uuJvM=
X-Google-Smtp-Source: AGHT+IEkkp1TQGM0JFd9odkp/c03kfmtjMcwcgb9mlOlFhQgc3UVzpngRsuLDtxa5lJDIw1nLYHJbIpZEw+yS34TMOU=
X-Received: by 2002:a17:903:41c4:b0:227:ac2a:2472 with SMTP id
 d9443c01a7336-22a8a868170mr200649615ad.28.1744083733448; Mon, 07 Apr 2025
 20:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org> <20250404162932.447699-4-mikko.rapeli@linaro.org>
In-Reply-To: <20250404162932.447699-4-mikko.rapeli@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 7 Apr 2025 23:42:02 -0400
X-Gm-Features: ATxdqUEiPYPJznd6CMvAJ8FugyGXSEiPgzp7wGkACn64PnEMq_Smp9g54B185o0
Message-ID: <CADkTA4Onb3hm14bu2X=R304++4jgKgpmNUmd30UTx4opaqSF8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006410a206323c2343"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214505

--0000000000006410a206323c2343
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 12:29=E2=80=AFPM Mikko Rapeli via lists.openembedded=
.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:

> At the moment linux-yocto kernels for various architectures
> are not very modular and a lot of drivers are built into the kernel
> even when they are not needed at runtime. These make the main kernel
> binary big and slow to boot. This also impacts udev in userspace
> which takes a long time processing events from all these built in drivers=
,
> for example when udev runs in initrd.
>
> Then constructing the initrd is very device and kernel configuration
> specific.
> initrd image needs explicitly define which binary packages to install
> to avoid pulling in complex dependencies. A full set of kernel modules
> via kernel-modules meta package is too big for initrd and most of the
> drivers are not needed for use cases like "just load modules to mount
> main rootfs". Then the initrd configuration breaks if kernel driver
> is built into the kernel since the binary package doesn't exist.
>
> Introduce kernel-initrd-modules meta package to solve these problems.
> The meta package adds dependencies to real kernel modules based on
> the kernel module file paths so that it will include several
> kernel subsystems and their drivers which are often needed to find
> main rootfs from some block device. This works when drivers are built
> as modules but does not break if drivers are built into the kernel.
>
> The resulting initrd is also smaller since only a subset of drivers
> are needed for "mount the rootfs" usecase. Tested on genericarm64
> kernel and qemu and AMD KV260 HW.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  .../kernel-module-split.bbclass               | 48 +++++++++++++++++++
>  meta/classes-recipe/kernel.bbclass            |  5 +-
>  meta/classes-recipe/module.bbclass            | 37 ++++++++++++++
>  3 files changed, 89 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> index 9487365eb7..101c5cd959 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
>  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
>  KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
>
> +# subset of kernel modules needed in initrd, to e.g. mount rootfs from
> block device
> +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> +
> +# match regex to path or file name. E.g. include all drivers with files
> in path /drivers/ata/
> +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> +/drivers/acpi/|\
> +/drivers/ata/|\
> +/drivers/block/|\
> +/drivers/cdrom/|\
> +/drivers/char/hw_random/|\
> +/drivers/char/tpm/|\
> +/drivers/char/|\
> +/drivers/crypto/|\
> +/drivers/dax/|\
> +/drivers/firmware/arm_scmi/|\
> +/drivers/gpu/drm/|\
> +/drivers/md/|\
> +/drivers/mmc/|\
> +/drivers/mtd/|\
> +/drivers/nvdimm/|\
> +/drivers/nvme/|\
> +/drivers/pci/|\
> +/drivers/scsi/|\
> +/drivers/tee/|\
> +/drivers/tty/serial/|\
> +/drivers/virtio/|\
> +/drivers/watchdog/|\
> +/kernel/arch/|\
> +/kernel/block/|\
> +/kernel/crypto/|\
> +/kernel/fs/|\
> +/kernel/lib/\
> +)(.*)"
> +
>

Apologies for not replying to your reply to my other review, I've had some
unexpected travel
and significant time away from my desk, so I'm running way behind on
everything.

I still don't agree with these values being defined in the base classes.
There's simply too
many kernels and versions out there to make sure this works (and is sane
everywhere)
.. I've lived that for 15 years in supporting the reference kernels.

The reality is that everyone will use the defaults, and never look at them
or otherwise
make sure they are valid for their kernel. We'll end up churning the
values, when really
it is specific to a kernel, a board and even a use case. A kernel recipe is
where all of
those things are explicitly handled, so putting the regex there makes it
very clear that
you need to define something.

There's also still the issue with the repeated set of directories in the
two classes.
To address that, why can't the variable definition be moved to a .inc file =
?

With the variables defined in a .inc file, it then becomes very easy for
kernel recipes
to include the .inc and get a default definition .. but we are still
putting the requirement
on them that they explicitly include the file to get the default, versus it
silently being
defined and used in the classes.

Bruce



>  python split_kernel_module_packages () {
>      import re
>
> @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
>      modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modu=
les',
> file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=
=3D'%s
> kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue,
> hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_name,
> kernel_version))
>      if modules:
>          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> +
> +    initrd_metapkg =3D d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE') or=
 ""
> +    initrd_module_regex =3D d.getVar('KERNEL_INITRD_MODULES_REGEX') or "=
"
> +    if (initrd_metapkg !=3D "") and (initrd_module_regex !=3D ""):
> +        initrd_module_regex =3D re.compile(initrd_module_regex)
> +        initrd_modules =3D []
> +        for module in modules:
> +            files =3D d.getVar('FILES:' + module)
> +            m =3D re.match(initrd_module_regex, files)
> +            if m:
> +                initrd_modules.append(module)
> +
> +        if initrd_modules:
> +            d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+'
> '.join(initrd_modules))
>  }
>
>  do_package[vardeps] +=3D '${@" ".join(map(lambda s: "module_conf_" + s,
> (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 36ce659762..3dcaebcaed 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel
> do_transform_bundled_initramfs d
>
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> -PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> ${KERNEL_PACKAGE_NAME}-dbg"
> +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
>  FILES:${PN} =3D ""
>  FILES:${KERNEL_PACKAGE_NAME}-base =3D
> "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
>  FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
>  FILES:${KERNEL_PACKAGE_NAME}-dev =3D "/${KERNEL_IMAGEDEST}/System.map*
> /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config*
> ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build=
"
>  FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D
> "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
>  FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
> +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =3D ""
>  FILES:${KERNEL_PACKAGE_NAME}-dbg =3D "/usr/lib/debug /usr/src/debug"
>  RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base (=3D
> ${EXTENDPKGV})"
>  # Allow machines to override this dependency if kernel image files are
> @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1"
>  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D "1"
>  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D "1"
>  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D "1"
> +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "1"
>  DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules meta pack=
age"
> +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "Kernel initrd
> modules meta package"
>
>  pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
>         if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> diff --git a/meta/classes-recipe/module.bbclass
> b/meta/classes-recipe/module.bbclass
> index f2f0b25a2d..51f864f1f9 100644
> --- a/meta/classes-recipe/module.bbclass
> +++ b/meta/classes-recipe/module.bbclass
> @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
>  KERNEL_MODULES_META_PACKAGE =3D "${PN}"
>  FILES:${PN} =3D ""
>  ALLOW_EMPTY:${PN} =3D "1"
> +
> +# subset of kernel modules needed in initrd, to e.g. mount rootfs from
> block device
> +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> +
> +# match regex to path or file name. E.g. include all drivers with files
> in path /drivers/ata/
> +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> +/drivers/acpi/|\
> +/drivers/ata/|\
> +/drivers/block/|\
> +/drivers/cdrom/|\
> +/drivers/char/hw_random/|\
> +/drivers/char/tpm/|\
> +/drivers/char/|\
> +/drivers/crypto/|\
> +/drivers/dax/|\
> +/drivers/firmware/arm_scmi/|\
> +/drivers/gpu/drm/|\
> +/drivers/md/|\
> +/drivers/mmc/|\
> +/drivers/mtd/|\
> +/drivers/nvdimm/|\
> +/drivers/nvme/|\
> +/drivers/pci/|\
> +/drivers/scsi/|\
> +/drivers/tee/|\
> +/drivers/tty/serial/|\
> +/drivers/virtio/|\
> +/drivers/watchdog/|\
> +/kernel/arch/|\
> +/kernel/block/|\
> +/kernel/crypto/|\
> +/kernel/fs/|\
> +/kernel/lib/\
> +)(.*)"
> +
> +FILES:${PN}-initrd =3D ""
> +ALLOW_EMPTY:${PN}-initrd =3D "1"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214354):
> https://lists.openembedded.org/g/openembedded-core/message/214354
> Mute This Topic: https://lists.openembedded.org/mt/112087526/1050810
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

--0000000000006410a206323c2343
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 4, 2025 at 12:29=
=E2=80=AFPM Mikko Rapeli via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@list=
s.openembedded.org">linaro.org@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">At the moment linux-yo=
cto kernels for various architectures<br>
are not very modular and a lot of drivers are built into the kernel<br>
even when they are not needed at runtime. These make the main kernel<br>
binary big and slow to boot. This also impacts udev in userspace<br>
which takes a long time processing events from all these built in drivers,<=
br>
for example when udev runs in initrd.<br>
<br>
Then constructing the initrd is very device and kernel configuration specif=
ic.<br>
initrd image needs explicitly define which binary packages to install<br>
to avoid pulling in complex dependencies. A full set of kernel modules<br>
via kernel-modules meta package is too big for initrd and most of the<br>
drivers are not needed for use cases like &quot;just load modules to mount<=
br>
main rootfs&quot;. Then the initrd configuration breaks if kernel driver<br=
>
is built into the kernel since the binary package doesn&#39;t exist.<br>
<br>
Introduce kernel-initrd-modules meta package to solve these problems.<br>
The meta package adds dependencies to real kernel modules based on<br>
the kernel module file paths so that it will include several<br>
kernel subsystems and their drivers which are often needed to find<br>
main rootfs from some block device. This works when drivers are built<br>
as modules but does not break if drivers are built into the kernel.<br>
<br>
The resulting initrd is also smaller since only a subset of drivers<br>
are needed for &quot;mount the rootfs&quot; usecase. Tested on genericarm64=
<br>
kernel and qemu and AMD KV260 HW.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../kernel-module-split.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 48 +++++++++++++++++++<br>
=C2=A0meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 5 +-<br>
=C2=A0meta/classes-recipe/module.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 37 ++++++++++++++<br>
=C2=A03 files changed, 89 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes=
-recipe/kernel-module-split.bbclass<br>
index 9487365eb7..101c5cd959 100644<br>
--- a/meta/classes-recipe/kernel-module-split.bbclass<br>
+++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
@@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot;&quot;<br>
=C2=A0KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION}&quot;<br>
=C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quot;1&quot;<br>
<br>
+# subset of kernel modules needed in initrd, to e.g. mount rootfs from blo=
ck device<br>
+KERNEL_INITRD_MODULES_META_PACKAGE ?=3D &quot;${@ d.getVar(&quot;KERNEL_PA=
CKAGE_NAME&quot;) or &quot;kernel&quot; }-initrd-modules&quot;<br>
+<br>
+# match regex to path or file name. E.g. include all drivers with files in=
 path /drivers/ata/<br>
+KERNEL_INITRD_MODULES_REGEX ?=3D &quot;(.*)(\<br>
+/drivers/acpi/|\<br>
+/drivers/ata/|\<br>
+/drivers/block/|\<br>
+/drivers/cdrom/|\<br>
+/drivers/char/hw_random/|\<br>
+/drivers/char/tpm/|\<br>
+/drivers/char/|\<br>
+/drivers/crypto/|\<br>
+/drivers/dax/|\<br>
+/drivers/firmware/arm_scmi/|\<br>
+/drivers/gpu/drm/|\<br>
+/drivers/md/|\<br>
+/drivers/mmc/|\<br>
+/drivers/mtd/|\<br>
+/drivers/nvdimm/|\<br>
+/drivers/nvme/|\<br>
+/drivers/pci/|\<br>
+/drivers/scsi/|\<br>
+/drivers/tee/|\<br>
+/drivers/tty/serial/|\<br>
+/drivers/virtio/|\<br>
+/drivers/watchdog/|\<br>
+/kernel/arch/|\<br>
+/kernel/block/|\<br>
+/kernel/crypto/|\<br>
+/kernel/fs/|\<br>
+/kernel/lib/\<br>
+)(.*)&quot;<br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">Apologies for not replying to your reply to my other revi=
ew, I&#39;ve had some unexpected travel</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">and significant=C2=A0time away from my desk, so I&=
#39;m running way=C2=A0behind on everything.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">I still don&#39;t agree with these values being define=
d in the base classes. There&#39;s simply too</div></div><div class=3D"gmai=
l_default" style=3D"font-size:small">many kernels and versions out there to=
 make sure this works (and is sane everywhere)</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">.. I&#39;ve lived that for 15 years in supp=
orting the reference kernels.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">The reality is that everyone will use the defaults, and never look at =
them or otherwise</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">make sure they are valid for their kernel. We&#39;ll end up churning the=
 values, when really</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">it is specific to a kernel, a board and even a use case. A kernel rec=
ipe is where all of</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">those things are explicitly handled, so putting the regex there makes =
it very clear that</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">you need to define something.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">There&#39;s also still the issue with the repeated set of direct=
ories in the two classes.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">To address that, why can&#39;t the variable definition be moved =
to a .inc file ?</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">With the=
 variables defined in a .inc file, it then becomes very easy for kernel rec=
ipes</div><div class=3D"gmail_default" style=3D"font-size:small">to include=
 the .inc and get a default definition .. but we are still putting the requ=
irement</div><div class=3D"gmail_default" style=3D"font-size:small">on them=
 that they explicitly include the file to get the default, versus it silent=
ly being</div><div class=3D"gmail_default" style=3D"font-size:small">define=
d and used in the classes.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Bruce</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
<br>
@@ -183,6 +217,20 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0modules =3D do_split_packages(d, root=3D&#39;${nonarch_=
base_libdir}/modules&#39;, file_regex=3Dmodule_regex, output_pattern=3Dmodu=
le_pattern, description=3D&#39;%s kernel module&#39;, postinst=3Dpostinst, =
postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D&#=
39;%s-%s&#39; % (kernel_package_name, kernel_version))<br>
=C2=A0 =C2=A0 =C2=A0if modules:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;RDEPENDS:&#39; + metapkg=
, &#39; &#39;+&#39; &#39;.join(modules))<br>
+<br>
+=C2=A0 =C2=A0 initrd_metapkg =3D d.getVar(&#39;KERNEL_INITRD_MODULES_META_=
PACKAGE&#39;) or &quot;&quot;<br>
+=C2=A0 =C2=A0 initrd_module_regex =3D d.getVar(&#39;KERNEL_INITRD_MODULES_=
REGEX&#39;) or &quot;&quot;<br>
+=C2=A0 =C2=A0 if (initrd_metapkg !=3D &quot;&quot;) and (initrd_module_reg=
ex !=3D &quot;&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_module_regex =3D re.compile(initrd_modu=
le_regex)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_modules =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for module in modules:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files =3D d.getVar(&#39;FILES:&#=
39; + module)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(initrd_module_reg=
ex, files)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_modules.app=
end(module)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if initrd_modules:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS:&#39; =
+ initrd_metapkg, &#39; &#39;+&#39; &#39;.join(initrd_modules))<br>
=C2=A0}<br>
<br>
=C2=A0do_package[vardeps] +=3D &#39;${@&quot; &quot;.join(map(lambda s: &qu=
ot;module_conf_&quot; + s, (d.getVar(&quot;KERNEL_MODULE_PROBECONF&quot;) o=
r &quot;&quot;).split()))}&#39;<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 36ce659762..3dcaebcaed 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_tr=
ansform_bundled_initramfs d<br>
<br>
=C2=A0# kernel-base becomes kernel-${KERNEL_VERSION}<br>
=C2=A0# kernel-image becomes kernel-image-${KERNEL_VERSION}<br>
-PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KE=
RNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NA=
ME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg&quot;<br>
+PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KE=
RNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NA=
ME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-initrd-module=
s ${KERNEL_PACKAGE_NAME}-dbg&quot;<br>
=C2=A0FILES:${PN} =3D &quot;&quot;<br>
=C2=A0FILES:${KERNEL_PACKAGE_NAME}-base =3D &quot;${nonarch_base_libdir}/mo=
dules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERN=
EL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION=
}/modules.builtin.modinfo&quot;<br>
=C2=A0FILES:${KERNEL_PACKAGE_NAME}-image =3D &quot;&quot;<br>
=C2=A0FILES:${KERNEL_PACKAGE_NAME}-dev =3D &quot;/${KERNEL_IMAGEDEST}/Syste=
m.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${=
KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build&quo=
t;<br>
=C2=A0FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D &quot;/${KERNEL_IMAGEDEST}/v=
mlinux-${KERNEL_VERSION_NAME}&quot;<br>
=C2=A0FILES:${KERNEL_PACKAGE_NAME}-modules =3D &quot;&quot;<br>
+FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =3D &quot;&quot;<br>
=C2=A0FILES:${KERNEL_PACKAGE_NAME}-dbg =3D &quot;/usr/lib/debug /usr/src/de=
bug&quot;<br>
=C2=A0RDEPENDS:${KERNEL_PACKAGE_NAME} =3D &quot;${KERNEL_PACKAGE_NAME}-base=
 (=3D ${EXTENDPKGV})&quot;<br>
=C2=A0# Allow machines to override this dependency if kernel image files ar=
e<br>
@@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D &quot;1&quot;<br=
>
=C2=A0ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D &quot;1&quot;<br>
=C2=A0ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D &quot;1&quot;<br>
=C2=A0ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D &quot;1&quot;<br>
+ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules =3D &quot;1&quot;<br>
=C2=A0DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D &quot;Kernel modules m=
eta package&quot;<br>
+DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules =3D &quot;Kernel initrd =
modules meta package&quot;<br>
<br>
=C2=A0pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -e &quot;$D/lib/modules/${KERNEL_VERSION=
}&quot; ]; then<br>
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/modul=
e.bbclass<br>
index f2f0b25a2d..51f864f1f9 100644<br>
--- a/meta/classes-recipe/module.bbclass<br>
+++ b/meta/classes-recipe/module.bbclass<br>
@@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install<br>
=C2=A0KERNEL_MODULES_META_PACKAGE =3D &quot;${PN}&quot;<br>
=C2=A0FILES:${PN} =3D &quot;&quot;<br>
=C2=A0ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
+<br>
+# subset of kernel modules needed in initrd, to e.g. mount rootfs from blo=
ck device<br>
+KERNEL_INITRD_MODULES_META_PACKAGE ?=3D &quot;${@ d.getVar(&quot;KERNEL_PA=
CKAGE_NAME&quot;) or &quot;kernel&quot; }-initrd-modules&quot;<br>
+<br>
+# match regex to path or file name. E.g. include all drivers with files in=
 path /drivers/ata/<br>
+KERNEL_INITRD_MODULES_REGEX ?=3D &quot;(.*)(\<br>
+/drivers/acpi/|\<br>
+/drivers/ata/|\<br>
+/drivers/block/|\<br>
+/drivers/cdrom/|\<br>
+/drivers/char/hw_random/|\<br>
+/drivers/char/tpm/|\<br>
+/drivers/char/|\<br>
+/drivers/crypto/|\<br>
+/drivers/dax/|\<br>
+/drivers/firmware/arm_scmi/|\<br>
+/drivers/gpu/drm/|\<br>
+/drivers/md/|\<br>
+/drivers/mmc/|\<br>
+/drivers/mtd/|\<br>
+/drivers/nvdimm/|\<br>
+/drivers/nvme/|\<br>
+/drivers/pci/|\<br>
+/drivers/scsi/|\<br>
+/drivers/tee/|\<br>
+/drivers/tty/serial/|\<br>
+/drivers/virtio/|\<br>
+/drivers/watchdog/|\<br>
+/kernel/arch/|\<br>
+/kernel/block/|\<br>
+/kernel/crypto/|\<br>
+/kernel/fs/|\<br>
+/kernel/lib/\<br>
+)(.*)&quot;<br>
+<br>
+FILES:${PN}-initrd =3D &quot;&quot;<br>
+ALLOW_EMPTY:${PN}-initrd =3D &quot;1&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214354): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214354" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214354</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112087526/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112087526/1050810</a><br>
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

--0000000000006410a206323c2343--

