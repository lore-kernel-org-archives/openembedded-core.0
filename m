Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2941660601
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 21:29:15 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id hn15so5416037igb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 14:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ITFidLo4r1mebmm9UlPMpYcr5CFvby12f2NG/70X4N4=;
	b=EGAkPnBBneX86vi42aV08ajQLgYtCauYI+SEgBY4n2n/8DBc+l0bEi8ncDvA77XiKu
	F9awiD8LmDuxfXf7IoOELkh8l9Tlp+Ze4Dg7+M6vdGLVElA7HbfvJZa8MUpXc9oFYdOi
	Pk5XHs8/rOp8gFQlafaPHLU1R4qKS+KvejwVo29J/Wd7X83yNbO+1dh0x1gshTlYPVfG
	NjwE5s1IMs0c7Tazgpqu/CU4ARnk9VfcNUyPHhqeoPcN0b9czYXJKM0RC0xMDQ+H9oxT
	ZWuDPiF6pPwouOPMRsG1stuSJEtZBfNhYZFUfCUHBMDPZBqLWC42Jh+BOTeBmSQkv3kG
	OE3A==
MIME-Version: 1.0
X-Received: by 10.50.110.65 with SMTP id hy1mr14046596igb.13.1413754155482;
	Sun, 19 Oct 2014 14:29:15 -0700 (PDT)
Received: by 10.50.169.2 with HTTP; Sun, 19 Oct 2014 14:29:15 -0700 (PDT)
In-Reply-To: <1413746147-7120-5-git-send-email-marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-5-git-send-email-marex@denx.de>
Date: Sun, 19 Oct 2014 14:29:15 -0700
Message-ID: <CAMKF1so0A-vVEswvF290RAXZFab=F+Cw=NP2nRTYVBFm77c4qA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] kernel: Pull uImage generation into separate class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Oct 2014 21:29:22 -0000
Content-Type: multipart/alternative; boundary=089e0111d1de3cc6120505cd4ad8

--089e0111d1de3cc6120505cd4ad8
Content-Type: text/plain; charset=UTF-8

On Sunday, October 19, 2014, Marek Vasut <marex@denx.de> wrote:

> Pull the uImage image format generation from kernel.bbclass into
> a separate kernel-uimage.bbclass. The recipes which now need to
> generate an uImage will have to inherit kernel-uimage instead of
> kernel class.
>
>
Does it trigger a doc change as well ?


> Signed-off-by: Marek Vasut <marex@denx.de <javascript:;>>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org <javascript:;>>
> Cc: Koen Kooi <koen@dominion.thruhere.net <javascript:;>>
> Cc: Paul Eggleton <paul.eggleton@linux.intel.com <javascript:;>>
> ---
>  meta/classes/kernel-uimage.bbclass | 44
> +++++++++++++++++++++++++++++++++++++
>  meta/classes/kernel.bbclass        | 45
> --------------------------------------
>  2 files changed, 44 insertions(+), 45 deletions(-)
>  create mode 100644 meta/classes/kernel-uimage.bbclass
>
> diff --git a/meta/classes/kernel-uimage.bbclass
> b/meta/classes/kernel-uimage.bbclass
> new file mode 100644
> index 0000000..f51321b
> --- /dev/null
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -0,0 +1,44 @@
> +inherit kernel
> +
> +DEPENDS += " u-boot-mkimage-native "
> +
> +uboot_prep_kimage() {
> +       if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> +               vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
> +               linux_suffix=""
> +               linux_comp="none"
> +       else
> +               vmlinux_path="vmlinux"
> +               linux_suffix=".gz"
> +               linux_comp="gzip"
> +       fi
> +
> +       ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}"
> linux.bin
> +
> +       if [ "${linux_comp}" != "none" ] ; then
> +               rm -f linux.bin
> +               gzip -9 linux.bin
> +               mv -f "linux.bin${linux_suffix}" linux.bin
> +       fi
> +
> +       echo "${linux_comp}"
> +}
> +
> +do_uboot_mkimage() {
> +       if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> +               if test "x${KEEPUIMAGE}" != "xyes" ; then
> +                       uboot_prep_kimage
> +
> +                       ENTRYPOINT=${UBOOT_ENTRYPOINT}
> +                       if test -n "${UBOOT_ENTRYSYMBOL}"; then
> +                               ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux
> | \
> +                                       awk '$3=="${UBOOT_ENTRYSYMBOL}"
> {print $1}'`
> +                       fi
> +
> +                       uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel
> -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n
> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> +                       rm -f linux.bin
> +               fi
> +       fi
> +}
> +
> +addtask uboot_mkimage before do_install after do_compile
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ec4d930..f3ba19c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -15,10 +15,6 @@ python __anonymous () {
>      import re
>
>      kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
> -    if kerneltype == 'uImage':
> -        depends = d.getVar("DEPENDS", True)
> -        depends = "%s u-boot-mkimage-native" % depends
> -        d.setVar("DEPENDS", depends)
>
>      d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.[^\.]$', '',
> kerneltype))
>
> @@ -448,47 +444,6 @@ MODULE_TARBALL_BASE_NAME ?=
> "${MODULE_IMAGE_BASE_NAME}.tgz"
>  MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
>  MODULE_TARBALL_DEPLOY ?= "1"
>
> -uboot_prep_kimage() {
> -       if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> -               vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
> -               linux_suffix=""
> -               linux_comp="none"
> -       else
> -               vmlinux_path="vmlinux"
> -               linux_suffix=".gz"
> -               linux_comp="gzip"
> -       fi
> -
> -       ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}"
> linux.bin
> -
> -       if [ "${linux_comp}" != "none" ] ; then
> -               rm -f linux.bin
> -               gzip -9 linux.bin
> -               mv -f "linux.bin${linux_suffix}" linux.bin
> -       fi
> -
> -       echo "${linux_comp}"
> -}
> -
> -do_uboot_mkimage() {
> -       if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> -               if test "x${KEEPUIMAGE}" != "xyes" ; then
> -                       uboot_prep_kimage
> -
> -                       ENTRYPOINT=${UBOOT_ENTRYPOINT}
> -                       if test -n "${UBOOT_ENTRYSYMBOL}"; then
> -                               ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux
> | \
> -                                       awk '$3=="${UBOOT_ENTRYSYMBOL}"
> {print $1}'`
> -                       fi
> -
> -                       uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel
> -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n
> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> -                       rm -f linux.bin
> -               fi
> -       fi
> -}
> -
> -addtask uboot_mkimage before do_install after do_compile
> -
>  kernel_do_deploy() {
>         install -m 0644 ${KERNEL_OUTPUT}
> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>         if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
> '^CONFIG_MODULES=y$' .config); then
> --
> 2.1.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0111d1de3cc6120505cd4ad8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, October 19, 2014, Marek Vasut &lt;<a href=3D"mailto:mare=
x@denx.de">marex@denx.de</a>&gt; wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">P=
ull the uImage image format generation from kernel.bbclass into<br>
a separate kernel-uimage.bbclass. The recipes which now need to<br>
generate an uImage will have to inherit kernel-uimage instead of<br>
kernel class.<br>
<br></blockquote><div><br></div><div>Does it trigger a doc change as well ?=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Marek Vasut &lt;<a href=3D"javascript:;" onclick=3D"_e(event=
, &#39;cvml&#39;, &#39;marex@denx.de&#39;)">marex@denx.de</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39;c=
vml&#39;, &#39;richard.purdie@linuxfoundation.org&#39;)">richard.purdie@lin=
uxfoundation.org</a>&gt;<br>
Cc: Koen Kooi &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#=
39;, &#39;koen@dominion.thruhere.net&#39;)">koen@dominion.thruhere.net</a>&=
gt;<br>
Cc: Paul Eggleton &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cv=
ml&#39;, &#39;paul.eggleton@linux.intel.com&#39;)">paul.eggleton@linux.inte=
l.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-uimage.bbclass | 44 +++++++++++++++++++++++++++++=
++++++++<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 45 ---------=
-----------------------------<br>
=C2=A02 files changed, 44 insertions(+), 45 deletions(-)<br>
=C2=A0create mode 100644 meta/classes/kernel-uimage.bbclass<br>
<br>
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimag=
e.bbclass<br>
new file mode 100644<br>
index 0000000..f51321b<br>
--- /dev/null<br>
+++ b/meta/classes/kernel-uimage.bbclass<br>
@@ -0,0 +1,44 @@<br>
+inherit kernel<br>
+<br>
+DEPENDS +=3D &quot; u-boot-mkimage-native &quot;<br>
+<br>
+uboot_prep_kimage() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -e arch/${ARCH}/boot/compressed/vmlinux=
 ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinux_path=3D&quo=
t;arch/${ARCH}/boot/compressed/vmlinux&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_suffix=3D&quo=
t;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_comp=3D&quot;=
none&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinux_path=3D&quo=
t;vmlinux&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_suffix=3D&quo=
t;.gz&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_comp=3D&quot;=
gzip&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${OBJCOPY} -O binary -R .note -R .comment -S &q=
uot;${vmlinux_path}&quot; linux.bin<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${linux_comp}&quot; !=3D &quot;none&=
quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f linux.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gzip -9 linux.bin<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f &quot;linux.b=
in${linux_suffix}&quot; linux.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${linux_comp}&quot;<br>
+}<br>
+<br>
+do_uboot_mkimage() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KERNEL_IMAGETYPE}&quot; =3D &q=
uot;xuImage&quot; ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KE=
EPUIMAGE}&quot; !=3D &quot;xyes&quot; ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uboot_prep_kimage<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ENTRYPOINT=3D${UBOOT_ENTRYPOINT}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if test -n &quot;${UBOOT_ENTRYSYMBOL}&quot;; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ENTRYPOINT=3D`${HOST_PREFIX}nm ${S}/v=
mlinux | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0awk &#39;=
$3=3D=3D&quot;${UBOOT_ENTRYSYMBOL}&quot; {print $1}&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C &quot;${linu=
x_comp}&quot; -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n &quot;${DISTRO_NAME=
}/${PV}/${MACHINE}&quot; -d linux.bin arch/${ARCH}/boot/uImage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm -f linux.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+addtask uboot_mkimage before do_install after do_compile<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index ec4d930..f3ba19c 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -15,10 +15,6 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
<br>
=C2=A0 =C2=A0 =C2=A0kerneltype =3D d.getVar(&#39;KERNEL_IMAGETYPE&#39;, Tru=
e)<br>
-=C2=A0 =C2=A0 if kerneltype =3D=3D &#39;uImage&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D d.getVar(&quot;DEPENDS&quot;, True=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot-mkimage-native&quo=
t; % depends<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;DEPENDS&quot;, depends)<br>
<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(&quot;KERNEL_IMAGETYPE_FOR_MAKE&quot;, re.sub(=
r&#39;\.[^\.]$&#39;, &#39;&#39;, kerneltype))<br>
<br>
@@ -448,47 +444,6 @@ MODULE_TARBALL_BASE_NAME ?=3D &quot;${MODULE_IMAGE_BAS=
E_NAME}.tgz&quot;<br>
=C2=A0MODULE_TARBALL_SYMLINK_NAME ?=3D &quot;modules-${MACHINE}.tgz&quot;<b=
r>
=C2=A0MODULE_TARBALL_DEPLOY ?=3D &quot;1&quot;<br>
<br>
-uboot_prep_kimage() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -e arch/${ARCH}/boot/compressed/vmlinux=
 ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinux_path=3D&quo=
t;arch/${ARCH}/boot/compressed/vmlinux&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_suffix=3D&quo=
t;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_comp=3D&quot;=
none&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinux_path=3D&quo=
t;vmlinux&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_suffix=3D&quo=
t;.gz&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_comp=3D&quot;=
gzip&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${OBJCOPY} -O binary -R .note -R .comment -S &q=
uot;${vmlinux_path}&quot; linux.bin<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${linux_comp}&quot; !=3D &quot;none&=
quot; ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f linux.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gzip -9 linux.bin<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f &quot;linux.b=
in${linux_suffix}&quot; linux.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;${linux_comp}&quot;<br>
-}<br>
-<br>
-do_uboot_mkimage() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KERNEL_IMAGETYPE}&quot; =3D &q=
uot;xuImage&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x${KE=
EPUIMAGE}&quot; !=3D &quot;xyes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uboot_prep_kimage<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ENTRYPOINT=3D${UBOOT_ENTRYPOINT}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if test -n &quot;${UBOOT_ENTRYSYMBOL}&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ENTRYPOINT=3D`${HOST_PREFIX}nm ${S}/v=
mlinux | \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0awk &#39;=
$3=3D=3D&quot;${UBOOT_ENTRYSYMBOL}&quot; {print $1}&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C &quot;${linu=
x_comp}&quot; -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n &quot;${DISTRO_NAME=
}/${PV}/${MACHINE}&quot; -d linux.bin arch/${ARCH}/boot/uImage<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm -f linux.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-}<br>
-<br>
-addtask uboot_mkimage before do_install after do_compile<br>
-<br>
=C2=A0kernel_do_deploy() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/$=
{KERNEL_IMAGE_BASE_NAME}.bin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ${MODULE_TARBALL_DEPLOY} =3D &quot;1&quot;=
 ] &amp;&amp; (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39; .config); then<=
br>
--<br>
2.1.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote>

--089e0111d1de3cc6120505cd4ad8--
