Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 18E8960291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 14:18:36 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id f2so165841964vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 06:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/1jqKOd2CSOf3bi8Yd6QhcRxzJrUXJN9MQUMxARwFlw=;
	b=QxnFs5T+8whKEipH9Js/uTVk+90Ot48mLMsLB5rZRfSKQiVCoViE7TOwH00gco2cB3
	UEOXoPgEG3w2gToIQ4WTMiJ/8R6LpVsXEVhsYQ5yspNL7d8pe+ZIkCfV9IHoc9H2oxcc
	pFP1w2rXjsdZVr0e20KzWatgR1cqTXoqX0D3G7vaxdg8vXS0i4AcUOZt9EpaCdb4FSAr
	etCuGHK94H0LpdQpCWPEExS1Nx9b49N4hVgDUtTpoCJgijSLB4D5TsYRARMJPCyer30f
	HTfp5IMpbmxaA4dFj/6jgwGQ+R/GURggAZFM+8Hy4zXcv7X7ISnimfSk5q7J0SBoc55b
	3nmw==
MIME-Version: 1.0
X-Received: by 10.31.161.131 with SMTP id k125mr44207505vke.74.1451485116604; 
	Wed, 30 Dec 2015 06:18:36 -0800 (PST)
Received: by 10.31.30.204 with HTTP; Wed, 30 Dec 2015 06:18:36 -0800 (PST)
In-Reply-To: <1451430328-29838-2-git-send-email-liu.ming50@gmail.com>
References: <1451430328-29838-1-git-send-email-liu.ming50@gmail.com>
	<1451430328-29838-2-git-send-email-liu.ming50@gmail.com>
Date: Wed, 30 Dec 2015 15:18:36 +0100
Message-ID: <CALatG=5hCFEwNVJtd5Wv-aREN3VwyzL7rwmVRYM3=vuKikK6Xw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"yue.tao" <yue.tao@windriver.com>,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH 2/2] kernel-initramfs: new recipe, creates initramfs bundled kernel packaging
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
X-List-Received-Date: Wed, 30 Dec 2015 14:18:37 -0000
Content-Type: multipart/alternative; boundary=001a1144071ac5a82805281e36d0

--001a1144071ac5a82805281e36d0
Content-Type: text/plain; charset=UTF-8

Hi,

I need do more work on this patch, and will send the V1 soon, please ignore
this for now.

//Ming Liu

2015-12-30 0:05 GMT+01:00 Ming Liu <liu.ming50@gmail.com>:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> So far, there is not a workable way to package the initramfs bundled kernel
> image, the only place is tmp/deploy from where we could get it, but if a
> user want to add it into a certain image, there is no guarantee that he
> will achieve it because a explicit dependency is missing between package
> and bundle_initramfs, and this was designed to avoid introducing circular
> dependencies when using kernel modules in the initramfs image.bb that is
> caused by kernel.bbclass trying to build the initramfs before the kernel
> packaging.
>
> To fix this problem, the idea is to split the initramfs bundled kernel
> packaging to a new recipe, make the do_install depend on kernel's deploy
> task, then with the following config:
>
> IMAGE_INSTALL_append = "kernel-initramfs"
>
> The initramfs bundled kernel could be added to the image without
> introducing any circular dependencies.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/recipes-kernel/linux/kernel-initramfs.bb | 50
> +++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb
>
> diff --git a/meta/recipes-kernel/linux/kernel-initramfs.bb
> b/meta/recipes-kernel/linux/kernel-initramfs.bb
> new file mode 100644
> index 0000000..481b142
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/kernel-initramfs.bb
> @@ -0,0 +1,50 @@
> +SUMMARY = "Initramfs bundled kernel image"
> +DESCRIPTION = "When built, it packages a initramfs bundled kernel image
> of the \
> +preferred virtual/kernel provider."
> +
> +SECTION = "kernel"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +
> +inherit linux-kernel-base
> +
> +# Whilst not a module, this ensures we don't get multilib extended (which
> would make no sense)
> +inherit module-base
> +
> +S = "${STAGING_KERNEL_DIR}"
> +B = "${WORKDIR}/build"
> +
> +KERNEL_VERSION = "${@get_kernelversion_headers('${S}')}"
> +
> +PACKAGES = "kernel-initramfs"
> +FILES_${PN} = "/boot/${KERNEL_IMAGETYPE}*"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +# Skip processing of this recipe if INITRAMFS_IMAGE or
> INITRAMFS_IMAGE_BUNDLE
> +# is not set correctly, to avoid generate a single empty package which
> makes
> +# no sense.
> +python __anonymous () {
> +    if not d.getVar('INITRAMFS_IMAGE', True) or
> d.getVar('INITRAMFS_IMAGE_BUNDLE', True) != '1':
> +        raise bb.parse.SkipPackage("Set INITRAMFS_IMAGE and
> INITRAMFS_IMAGE_BUNDLE to enable it")
> +}
> +
> +# Need the output of deploy.
> +do_install[depends] += "virtual/kernel:do_deploy"
> +
> +# We only need the packaging tasks - disable the rest
> +do_fetch[noexec] = "1"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +do_populate_sysroot[noexec] = "1"
> +
> +do_install() {
> +       if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =
> x1 ]; then
> +               echo "Copying initramfs bundled kernel image from
> ${DEPLOY_DIR_IMAGE}..."
> +               install -d ${D}/boot
> +               install -m 0644
> ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin ${D}/boot
> +       fi
> +}
> --
> 1.9.1
>
>

--001a1144071ac5a82805281e36d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>I need do more work on this pat=
ch, and will send the V1 soon, please ignore this for now.<br><br></div>//M=
ing Liu<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2015-12-30 0:05 GMT+01:00 Ming Liu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</span>=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:pe=
ter.x.liu@external.atlascopco.com">peter.x.liu@external.atlascopco.com</a>&=
gt;<br>
<br>
So far, there is not a workable way to package the initramfs bundled kernel=
<br>
image, the only place is tmp/deploy from where we could get it, but if a<br=
>
user want to add it into a certain image, there is no guarantee that he<br>
will achieve it because a explicit dependency is missing between package<br=
>
and bundle_initramfs, and this was designed to avoid introducing circular<b=
r>
dependencies when using kernel modules in the initramfs <a href=3D"http://i=
mage.bb" rel=3D"noreferrer" target=3D"_blank">image.bb</a> that is<br>
caused by kernel.bbclass trying to build the initramfs before the kernel<br=
>
packaging.<br>
<br>
To fix this problem, the idea is to split the initramfs bundled kernel<br>
packaging to a new recipe, make the do_install depend on kernel&#39;s deplo=
y<br>
task, then with the following config:<br>
<br>
IMAGE_INSTALL_append =3D &quot;kernel-initramfs&quot;<br>
<br>
The initramfs bundled kernel could be added to the image without<br>
introducing any circular dependencies.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com">peter.x.liu@external.atlascopco.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-initramfs.bb" rel=
=3D"noreferrer" target=3D"_blank">kernel-initramfs.bb</a> | 50 ++++++++++++=
+++++++++++++++<br>
=C2=A01 file changed, 50 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://kernel=
-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">kernel-initramfs.bb</a>=
<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-initramfs.b=
b" rel=3D"noreferrer" target=3D"_blank">kernel-initramfs.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://kernel-initramfs.bb" rel=3D"noreferrer" =
target=3D"_blank">kernel-initramfs.bb</a><br>
new file mode 100644<br>
index 0000000..481b142<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-initramfs.bb" rel=
=3D"noreferrer" target=3D"_blank">kernel-initramfs.bb</a><br>
@@ -0,0 +1,50 @@<br>
+SUMMARY =3D &quot;Initramfs bundled kernel image&quot;<br>
+DESCRIPTION =3D &quot;When built, it packages a initramfs bundled kernel i=
mage of the \<br>
+preferred virtual/kernel provider.&quot;<br>
+<br>
+SECTION =3D &quot;kernel&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f=
80980d171dd6425610833a22dbe6&quot;<br>
+<br>
+inherit linux-kernel-base<br>
+<br>
+# Whilst not a module, this ensures we don&#39;t get multilib extended (wh=
ich would make no sense)<br>
+inherit module-base<br>
+<br>
+S =3D &quot;${STAGING_KERNEL_DIR}&quot;<br>
+B =3D &quot;${WORKDIR}/build&quot;<br>
+<br>
+KERNEL_VERSION =3D &quot;${@get_kernelversion_headers(&#39;${S}&#39;)}&quo=
t;<br>
+<br>
+PACKAGES =3D &quot;kernel-initramfs&quot;<br>
+FILES_${PN} =3D &quot;/boot/${KERNEL_IMAGETYPE}*&quot;<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+<br>
+# Skip processing of this recipe if INITRAMFS_IMAGE or INITRAMFS_IMAGE_BUN=
DLE<br>
+# is not set correctly, to avoid generate a single empty package which mak=
es<br>
+# no sense.<br>
+python __anonymous () {<br>
+=C2=A0 =C2=A0 if not d.getVar(&#39;INITRAMFS_IMAGE&#39;, True) or d.getVar=
(&#39;INITRAMFS_IMAGE_BUNDLE&#39;, True) !=3D &#39;1&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;Set INITRAMFS=
_IMAGE and INITRAMFS_IMAGE_BUNDLE to enable it&quot;)<br>
+}<br>
+<br>
+# Need the output of deploy.<br>
+do_install[depends] +=3D &quot;virtual/kernel:do_deploy&quot;<br>
+<br>
+# We only need the packaging tasks - disable the rest<br>
+do_fetch[noexec] =3D &quot;1&quot;<br>
+do_unpack[noexec] =3D &quot;1&quot;<br>
+do_patch[noexec] =3D &quot;1&quot;<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+do_compile[noexec] =3D &quot;1&quot;<br>
+do_populate_sysroot[noexec] =3D &quot;1&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;${INITRAMFS_IMAGE}&quot; -a x&q=
uot;${INITRAMFS_IMAGE_BUNDLE}&quot; =3D x1 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Copying =
initramfs bundled kernel image from ${DEPLOY_DIR_IMAGE}...&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/boo=
t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D=
EPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin ${D}/boot<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a1144071ac5a82805281e36d0--
