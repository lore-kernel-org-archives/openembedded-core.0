Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1392BC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 19:53:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.1763.1668023595921452943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 11:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JRz9AgdP;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id w14so27501948wru.8
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu2reiC8WtSWKE5VPQqybicrjk0nbJFiIk6FvVqSd7s=;
        b=JRz9AgdPNvEn55WrsOW+oW8r4cCt3ylO7KWFdk5Mbcl5A1YlxgOPxsGwnLWcVTIsDE
         VY10WGk1fhttWAWOFoAUNqmFHzzZ9M+KMVcRub26VZjvt56LdymhvAkFxGo+CPVe+/E4
         O9mjAdNojcWaOjXg8LeGrNSYv5uHdw4nOG5ERCD2oR0m2ePrqR7rM1k1ZEypaViaED8l
         7EOWqd3WbKhUR+a7w7iSJrYrzyNyBhluUTVCMO2VgHzosuid8Vv7m6v8K4fhHVCkz3/Z
         WCqSRFcuOqsQ1PaYvgvswx43CaTvPciN5QiXy0tn22kZVR48uhCUteVq6VJEMSqxGye0
         HwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fu2reiC8WtSWKE5VPQqybicrjk0nbJFiIk6FvVqSd7s=;
        b=xHyfdSRXB7d/2VgF7p/AujzeyquuuXJm9hQNsbAW+GpFe8BkfIQ3C5OPfnEPFVhbdP
         yJKIWZlgsxX701CfJ4XUvNjdjXQ98eJmJbbxDPcusw/bgkoxPIEksv8reMeQXWzidLcx
         P1L+Mv5CsicYaIRCCWAe/TPWjujC+agPaaFaui8xwO3EQY90Gs3annSwNPJH+7Ntkue0
         emPrp7Km3IqkI5aGXR3HFXW2LcizVHK49Hh/pvouAdjX6BBZQAF1EC+PEBR5RGjhuTjP
         QCFS2vaNS2xsxKopS9DD8Sssvz1Y1tOF/Fb2pERYS+pbT2SeQvZ9jdeMNHUxuZxSSIGl
         sjmw==
X-Gm-Message-State: ACrzQf0wIezcm9Rs8F3QcYxN8Fd7fhU9w7nGxyxN3KvZ/lTkhnzP9eKj
	t8FHJYNT1cKs3RnlGxFxdqeJHDV25Ktw9C64rg8=
X-Google-Smtp-Source: AMsMyM7GwfjCewRd5xoE0kob9UthzZ/vjPbpiHg29mofCyOgE3xxdevWfTaab7UxepTUuEkr07bgB5sgN78d2ubJ3eA=
X-Received: by 2002:adf:f8c3:0:b0:236:9c97:6f6b with SMTP id
 f3-20020adff8c3000000b002369c976f6bmr38379623wrq.548.1668023593994; Wed, 09
 Nov 2022 11:53:13 -0800 (PST)
MIME-Version: 1.0
References: <1667435031-7224-1-git-send-email-paul.eggleton@linux.microsoft.com>
 <7449258.EvYhyI6sBW@linc>
In-Reply-To: <7449258.EvYhyI6sBW@linc>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Nov 2022 20:53:02 +0100
Message-ID: <CA+chaQdrSSoXccVRyWHNm=pX9jFV_SN-ucmBovu-=g_Y0FMNbw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] [PATCH] Allow fitimage + initramfs rebuild to be accelerated
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: openembedded-core@lists.openembedded.org, Ming Liu <liu.ming50@gmail.com>, 
	Marek Vasut <marex@denx.de>, Andrej Valek <andrej.valek@siemens.com>, 
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, 
	Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>, 
	Sean Anderson <sean.anderson@seco.com>, George McCollister <george.mccollister@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cc0f1b05ed0f0187"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173050

--000000000000cc0f1b05ed0f0187
Content-Type: text/plain; charset="UTF-8"

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12937 might be
alternative solution which we at LGE were using for different usecase than
fit image, but in theory should work as well.

Basically the initramfs do_deploy could be without version and then the
hardlink with datetime (or any other version) is created in fast
do_deploy_links task.

Similarly whole kernel can be reused from sstate and only hardlinks created
with new version if the do_deploy signatures still match.

There are still some selftest issues caused by my changes for #12937, last
weekend I've left selftest running for 24 hours and got:
2022-11-06 00:02:22,894 - oe-selftest - INFO - oe-selftest () - Ran 520
tests in 86409.229s
2022-11-06 00:02:22,894 - oe-selftest - INFO - oe-selftest - FAIL -
Required tests failed (successes=427, skipped=11, failures=36, errors=53)

Now going through the failed tests and some aren't reproducible and some
are caused by hardcoded image name expectations in selftest (e.g. not
expecting now configureable ".rootfs" suffix for images).

Regards,

On Wed, Nov 9, 2022 at 8:42 PM Paul Eggleton <
bluelightning@bluelightning.org> wrote:

> Hi folks
>
> Any comments? Alternative approaches?
>
> Thanks
> Paul
>
>
> ----- original message -----
> Subject: [OE-core] [RFC] [PATCH] Allow fitimage + initramfs rebuild to be
> accelerated
> Date: Thursday, 3 November 2022, 13:23:51 NZDT
> From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
> To: openembedded-core@lists.openembedded.org
>
> We have a usecase where our initramfs changes on every build (since it
> contains a version number which is based on the date), and we're
> incorporating that into a fitImage. Most of the time our builds are done
> from shared state and we want them to be as efficient as possible.
> Currently, when the initramfs signature is different this setup requires
> the kernel to be recompiled on every build, which is not ideal. I've
> come up with the following rough patch to address this, which does the
> following:
>
> * Avoid the dependency of do_bundle_initramfs on ${INITRAMFS_IMAGE} if
>   we are going to be building that for the fit image later anyway
> * Add a do_preserve_kernel_build task to preserve the files needed to
>   re-run do_assemble_fitimage_initramfs in a separate location from
>   ${B}, which can be saved to sstate
> * Add a do_deploy_fitimage task to deploy just the files written out by
>   do_assemble_fitimage_initramfs to ${DEPLOY_DIR_IMAGE}; this allows us
>   to preserve less in sstate than we would have to if we allowed
>   do_deploy to rerun. Of course the downside is we then need to add a
>   dependency from the image's do_build on the kernel's
>   do_deploy_fitimage, and I had to introduce a variable to control that
>   which is a bit awkward.
>
> This patch is quite rough and I'd like to take suggestions on how to
> improve it. One of my challenges is I don't have a complete grasp of all
> the usage modes supported by this code so I'd appreciate folks who do
> taking a look.
>
> Thanks!
> Paul
> ---
>  meta/classes-recipe/image.bbclass           |  5 +--
>  meta/classes-recipe/kernel-fitimage.bbclass | 55
> ++++++++++++++++++++++++-----
>  meta/classes-recipe/kernel.bbclass          |  2 +-
>  3 files changed, 51 insertions(+), 11 deletions(-)
>
> diff --git a/meta/classes-recipe/image.bbclass
> b/meta/classes-recipe/image.bbclass
> index e387645..cedd913 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -137,13 +137,14 @@ def rootfs_variables(d):
>
>  do_rootfs[vardeps] += "${@rootfs_variables(d)}"
>
> +IMAGE_FITIMAGE_DEPEND = "${@'virtual/kernel:do_deploy_fitimage' if
> d.getVar('IMAGE_FITIMAGE') == '1' else ''}"
> +
>  # This is needed to have kernel image in DEPLOY_DIR.
>  # This follows many common usecases and user expectations.
>  # But if you are building an image which doesn't need the kernel image at
> all,
>  # you can unset this variable manually.
>  KERNEL_DEPLOY_DEPEND ?= "virtual/kernel:do_deploy"
> -do_build[depends] += "${KERNEL_DEPLOY_DEPEND}"
> -
> +do_build[depends] += "${KERNEL_DEPLOY_DEPEND} ${IMAGE_FITIMAGE_DEPEND}"
>
>  python () {
>      def extraimage_getdepends(task):
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> b/meta/classes-recipe/kernel-fitimage.bbclass
> index 7980910..40406fc 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -731,10 +731,32 @@ do_install:append() {
>         fi
>  }
>
> +python do_preserve_kernel_build() {
> +    archdir = d.getVar('KERNEL_OUTPUT_DIR')
> +    src = d.getVar('B')
> +    dst = d.getVar('INITRAMFSDIR')
> +    oe.path.copyhardlinktree(os.path.join(src, archdir),
> os.path.join(dst, archdir))
> +    for fn in ['vmlinux', 'fit-image.its']:
> +        oe.path.copyhardlink(os.path.join(src, fn), os.path.join(dst, fn))
> +}
> +
> +INITRAMFSDIR = "${WORKDIR}/initramfs-work"
> +SSTATETASKS += "do_preserve_kernel_build"
> +do_preserve_kernel_build[cleandirs] = "${INITRAMFSDIR}"
> +do_preserve_kernel_build[sstate-plaindirs] = "${INITRAMFSDIR}"
> +
> +python do_preserve_kernel_build_setscene () {
> +    sstate_setscene(d)
> +}
> +addtask preserve_kernel_build_setscene
> +
> +
> +addtask preserve_kernel_build after do_bundle_initramfs
> +
>  do_assemble_fitimage_initramfs() {
>         if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
>                 test -n "${INITRAMFS_IMAGE}" ; then
> -               cd ${B}
> +               cd ${INITRAMFSDIR}
>                 if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
>                         fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its
> fitImage-bundle ""
>                         ln -sf fitImage-bundle
> ${B}/${KERNEL_OUTPUT_DIR}/fitImage
> @@ -744,7 +766,9 @@ do_assemble_fitimage_initramfs() {
>         fi
>  }
>
> -addtask assemble_fitimage_initramfs before do_deploy after
> do_bundle_initramfs
> +addtask assemble_fitimage_initramfs after do_preserve_kernel_build
> +
> +do_assemble_fitimage_initramfs[depends] +=
> "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
>
>  do_kernel_generate_rsa_keys() {
>         if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" =
> "1" ]; then
> @@ -793,20 +817,33 @@ do_kernel_generate_rsa_keys() {
>
>  addtask kernel_generate_rsa_keys before do_assemble_fitimage after
> do_compile
>
> -kernel_do_deploy[vardepsexclude] = "DATETIME"
> -kernel_do_deploy:append() {
> +FITIMGDEPLOYDIR = "${WORKDIR}/fitimage-deploy"
> +SSTATETASKS += "do_deploy_fitimage"
> +do_deploy_fitimage[sstate-inputdirs] = "${FITIMGDEPLOYDIR}"
> +do_deploy_fitimage[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
> +
> +python do_deploy_fitimage_setscene () {
> +        sstate_setscene(d)
> +}
> +addtask do_deploy_fitimage_setscene
> +
> +do_deploy_fitimage[dirs] = "${FITIMGDEPLOYDIR} ${INITRAMFSDIR}"
> +
> +do_deploy_fitimage[vardepsexclude] = "DATETIME"
> +do_deploy_fitimage() {
> +       deployDir="${FITIMGDEPLOYDIR}"
>         # Update deploy directory
>         if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
>
>                 if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
>                         bbnote "Copying fit-image.its source file..."
> -                       install -m 0644 ${B}/fit-image.its
> "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
> +                       install -m 0644 ${INITRAMFSDIR}/fit-image.its
> "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
>                         if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
>                                 ln -snf
> fitImage-its-${KERNEL_FIT_NAME}.its
> "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
>                         fi
>
>                         bbnote "Copying linux.bin file..."
> -                       install -m 0644 ${B}/linux.bin
> $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
> +                       install -m 0644 ${INITRAMFSDIR}/linux.bin
> $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
>                         if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
>                                 ln -snf
> fitImage-linux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
> "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
>                         fi
> @@ -814,14 +851,14 @@ kernel_do_deploy:append() {
>
>                 if [ -n "${INITRAMFS_IMAGE}" ]; then
>                         bbnote "Copying fit-image-${INITRAMFS_IMAGE}.its
> source file..."
> -                       install -m 0644
> ${B}/fit-image-${INITRAMFS_IMAGE}.its
> "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
> +                       install -m 0644
> ${INITRAMFSDIR}/fit-image-${INITRAMFS_IMAGE}.its
> "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
>                         if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
>                                 ln -snf
> fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its
> "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
>                         fi
>
>                         if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
>                                 bbnote "Copying
> fitImage-${INITRAMFS_IMAGE} file..."
> -                               install -m 0644
> ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE}
> "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
> +                               install -m 0644
> ${INITRAMFSDIR}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE}
> "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
>                                 if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
>                                         ln -snf
> fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}
> "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
>                                 fi
> @@ -829,3 +866,5 @@ kernel_do_deploy:append() {
>                 fi
>         fi
>  }
> +
> +addtask do_deploy_fitimage before do_build after do_deploy
> do_assemble_fitimage_initramfs
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 7bb3449..f2efb3e 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -140,7 +140,7 @@ set -e
>      # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set
> to 0,
>      # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is
> built
>      # standalone for use by wic and other tools.
> -    if image:
> +    if image and 'fitImage' not in d.getVar('KERNEL_IMAGETYPES'):
>          if d.getVar('INITRAMFS_MULTICONFIG'):
>              d.appendVarFlag('do_bundle_initramfs', 'mcdepends', '
> mc::${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
>          else:
> --
> 1.8.3.1
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173049):
> https://lists.openembedded.org/g/openembedded-core/message/173049
> Mute This Topic: https://lists.openembedded.org/mt/94747626/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cc0f1b05ed0f0187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D12937">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12937</a> m=
ight be alternative solution which we at LGE were using for different useca=
se than fit image, but in theory should work as well.<br><div><br></div><di=
v>Basically the initramfs do_deploy could be without version and then the h=
ardlink with datetime (or any other version) is created in fast do_deploy_l=
inks task.</div><div><br></div><div>Similarly whole kernel can be reused fr=
om sstate and only hardlinks created with new version if the do_deploy sign=
atures still match.</div><div><br></div><div>There are still some selftest =
issues caused by my changes for #12937, last weekend I&#39;ve left selftest=
 running for 24 hours and got:</div><div>2022-11-06 00:02:22,894 - oe-selft=
est - INFO - oe-selftest () - Ran 520 tests in 86409.229s<br>2022-11-06 00:=
02:22,894 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed=
 (successes=3D427, skipped=3D11, failures=3D36, errors=3D53)<br></div><div>=
<br></div><div>Now going through the failed tests and some aren&#39;t repro=
ducible and some are caused by hardcoded image name expectations in selftes=
t (e.g. not expecting now configureable &quot;.rootfs&quot; suffix for imag=
es).</div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 9, 2022 at 8:42 PM =
Paul Eggleton &lt;<a href=3D"mailto:bluelightning@bluelightning.org">blueli=
ghtning@bluelightning.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi folks<br>
<br>
Any comments? Alternative approaches?<br>
<br>
Thanks<br>
Paul<br>
<br>
<br>
----- original message -----<br>
Subject: [OE-core] [RFC] [PATCH] Allow fitimage + initramfs rebuild to be a=
ccelerated<br>
Date: Thursday, 3 November 2022, 13:23:51 NZDT<br>
From: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.microsoft.com=
" target=3D"_blank">paul.eggleton@linux.microsoft.com</a>&gt;<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a><br>
<br>
We have a usecase where our initramfs changes on every build (since it<br>
contains a version number which is based on the date), and we&#39;re<br>
incorporating that into a fitImage. Most of the time our builds are done<br=
>
from shared state and we want them to be as efficient as possible.<br>
Currently, when the initramfs signature is different this setup requires<br=
>
the kernel to be recompiled on every build, which is not ideal. I&#39;ve<br=
>
come up with the following rough patch to address this, which does the<br>
following:<br>
<br>
* Avoid the dependency of do_bundle_initramfs on ${INITRAMFS_IMAGE} if<br>
=C2=A0 we are going to be building that for the fit image later anyway<br>
* Add a do_preserve_kernel_build task to preserve the files needed to<br>
=C2=A0 re-run do_assemble_fitimage_initramfs in a separate location from<br=
>
=C2=A0 ${B}, which can be saved to sstate<br>
* Add a do_deploy_fitimage task to deploy just the files written out by<br>
=C2=A0 do_assemble_fitimage_initramfs to ${DEPLOY_DIR_IMAGE}; this allows u=
s<br>
=C2=A0 to preserve less in sstate than we would have to if we allowed<br>
=C2=A0 do_deploy to rerun. Of course the downside is we then need to add a<=
br>
=C2=A0 dependency from the image&#39;s do_build on the kernel&#39;s<br>
=C2=A0 do_deploy_fitimage, and I had to introduce a variable to control tha=
t<br>
=C2=A0 which is a bit awkward.<br>
<br>
This patch is quite rough and I&#39;d like to take suggestions on how to<br=
>
improve it. One of my challenges is I don&#39;t have a complete grasp of al=
l<br>
the usage modes supported by this code so I&#39;d appreciate folks who do<b=
r>
taking a look.<br>
<br>
Thanks!<br>
Paul<br>
---<br>
=C2=A0meta/classes-recipe/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 5 +--<br>
=C2=A0meta/classes-recipe/kernel-fitimage.bbclass | 55 ++++++++++++++++++++=
++++-----<br>
=C2=A0meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
=C2=A03 files changed, 51 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass<br>
index e387645..cedd913 100644<br>
--- a/meta/classes-recipe/image.bbclass<br>
+++ b/meta/classes-recipe/image.bbclass<br>
@@ -137,13 +137,14 @@ def rootfs_variables(d):<br>
<br>
=C2=A0do_rootfs[vardeps] +=3D &quot;${@rootfs_variables(d)}&quot;<br>
<br>
+IMAGE_FITIMAGE_DEPEND =3D &quot;${@&#39;virtual/kernel:do_deploy_fitimage&=
#39; if d.getVar(&#39;IMAGE_FITIMAGE&#39;) =3D=3D &#39;1&#39; else &#39;&#3=
9;}&quot;<br>
+<br>
=C2=A0# This is needed to have kernel image in DEPLOY_DIR.<br>
=C2=A0# This follows many common usecases and user expectations.<br>
=C2=A0# But if you are building an image which doesn&#39;t need the kernel =
image at all,<br>
=C2=A0# you can unset this variable manually.<br>
=C2=A0KERNEL_DEPLOY_DEPEND ?=3D &quot;virtual/kernel:do_deploy&quot;<br>
-do_build[depends] +=3D &quot;${KERNEL_DEPLOY_DEPEND}&quot;<br>
-<br>
+do_build[depends] +=3D &quot;${KERNEL_DEPLOY_DEPEND} ${IMAGE_FITIMAGE_DEPE=
ND}&quot;<br>
<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0def extraimage_getdepends(task):<br>
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass<br>
index 7980910..40406fc 100644<br>
--- a/meta/classes-recipe/kernel-fitimage.bbclass<br>
+++ b/meta/classes-recipe/kernel-fitimage.bbclass<br>
@@ -731,10 +731,32 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
+python do_preserve_kernel_build() {<br>
+=C2=A0 =C2=A0 archdir =3D d.getVar(&#39;KERNEL_OUTPUT_DIR&#39;)<br>
+=C2=A0 =C2=A0 src =3D d.getVar(&#39;B&#39;)<br>
+=C2=A0 =C2=A0 dst =3D d.getVar(&#39;INITRAMFSDIR&#39;)<br>
+=C2=A0 =C2=A0 oe.path.copyhardlinktree(os.path.join(src, archdir), os.path=
.join(dst, archdir))<br>
+=C2=A0 =C2=A0 for fn in [&#39;vmlinux&#39;, &#39;fit-image.its&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.copyhardlink(os.path.join(src, fn), os=
.path.join(dst, fn))<br>
+}<br>
+<br>
+INITRAMFSDIR =3D &quot;${WORKDIR}/initramfs-work&quot;<br>
+SSTATETASKS +=3D &quot;do_preserve_kernel_build&quot;<br>
+do_preserve_kernel_build[cleandirs] =3D &quot;${INITRAMFSDIR}&quot;<br>
+do_preserve_kernel_build[sstate-plaindirs] =3D &quot;${INITRAMFSDIR}&quot;=
<br>
+<br>
+python do_preserve_kernel_build_setscene () {<br>
+=C2=A0 =C2=A0 sstate_setscene(d)<br>
+}<br>
+addtask preserve_kernel_build_setscene<br>
+<br>
+<br>
+addtask preserve_kernel_build after do_bundle_initramfs<br>
+<br>
=C2=A0do_assemble_fitimage_initramfs() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if echo ${KERNEL_IMAGETYPES} | grep -wq &quot;f=
itImage&quot; &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -n &quot;${INI=
TRAMFS_IMAGE}&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${INITRAMFSDIR}<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${INITRA=
MFS_IMAGE_BUNDLE}&quot; =3D &quot;1&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-bund=
le &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ln -sf fitImage-bundle ${B}/${KERNEL_OUTPUT_DIR}/fitImage<br>
@@ -744,7 +766,9 @@ do_assemble_fitimage_initramfs() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initr=
amfs<br>
+addtask assemble_fitimage_initramfs after do_preserve_kernel_build<br>
+<br>
+do_assemble_fitimage_initramfs[depends] +=3D &quot;virtual/${TARGET_PREFIX=
}binutils:do_populate_sysroot&quot;<br>
<br>
=C2=A0do_kernel_generate_rsa_keys() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${UBOOT_SIGN_ENABLE}&quot; =3D &quot=
;0&quot; ] &amp;&amp; [ &quot;${FIT_GENERATE_KEYS}&quot; =3D &quot;1&quot; =
]; then<br>
@@ -793,20 +817,33 @@ do_kernel_generate_rsa_keys() {<br>
<br>
=C2=A0addtask kernel_generate_rsa_keys before do_assemble_fitimage after do=
_compile<br>
<br>
-kernel_do_deploy[vardepsexclude] =3D &quot;DATETIME&quot;<br>
-kernel_do_deploy:append() {<br>
+FITIMGDEPLOYDIR =3D &quot;${WORKDIR}/fitimage-deploy&quot;<br>
+SSTATETASKS +=3D &quot;do_deploy_fitimage&quot;<br>
+do_deploy_fitimage[sstate-inputdirs] =3D &quot;${FITIMGDEPLOYDIR}&quot;<br=
>
+do_deploy_fitimage[sstate-outputdirs] =3D &quot;${DEPLOY_DIR_IMAGE}&quot;<=
br>
+<br>
+python do_deploy_fitimage_setscene () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sstate_setscene(d)<br>
+}<br>
+addtask do_deploy_fitimage_setscene<br>
+<br>
+do_deploy_fitimage[dirs] =3D &quot;${FITIMGDEPLOYDIR} ${INITRAMFSDIR}&quot=
;<br>
+<br>
+do_deploy_fitimage[vardepsexclude] =3D &quot;DATETIME&quot;<br>
+do_deploy_fitimage() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0deployDir=3D&quot;${FITIMGDEPLOYDIR}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update deploy directory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if echo ${KERNEL_IMAGETYPES} | grep -wq &quot;f=
itImage&quot;; then<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${INITRA=
MFS_IMAGE_BUNDLE}&quot; !=3D &quot;1&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bbnote &quot;Copying fit-image.its source file...&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${B}/fit-image.its &quot;$deployDir/fitImage-its-=
${KERNEL_FIT_NAME}.its&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${INITRAMFSDIR}/fit-image.its &quot;$deployDir/fi=
tImage-its-${KERNEL_FIT_NAME}.its&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ -n &quot;${KERNEL_FIT_LINK_NAME}&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -snf fitImage-its-${KERNEL_FIT_NA=
ME}.its &quot;$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bbnote &quot;Copying linux.bin file...&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KE=
RNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${INITRAMFSDIR}/linux.bin $deployDir/fitImage-lin=
ux.bin-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ -n &quot;${KERNEL_FIT_LINK_NAME}&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -snf fitImage-linux.bin-${KERNEL_=
FIT_NAME}${KERNEL_FIT_BIN_EXT} &quot;$deployDir/fitImage-linux.bin-${KERNEL=
_FIT_LINK_NAME}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
@@ -814,14 +851,14 @@ kernel_do_deploy:append() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${INI=
TRAMFS_IMAGE}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bbnote &quot;Copying fit-image-${INITRAMFS_IMAGE}.its source fil=
e...&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its &quot;$depl=
oyDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${INITRAMFSDIR}/fit-image-${INITRAMFS_IMAGE}.its =
&quot;$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.it=
s&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ -n &quot;${KERNEL_FIT_LINK_NAME}&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -snf fitImage-its-${INITRAMFS_IMA=
GE_NAME}-${KERNEL_FIT_NAME}.its &quot;$deployDir/fitImage-its-${INITRAMFS_I=
MAGE_NAME}-${KERNEL_FIT_LINK_NAME}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ &quot;${INITRAMFS_IMAGE_BUNDLE}&quot; !=3D &quot;1&quot; ];=
 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;Copying fitImage-${INIT=
RAMFS_IMAGE} file...&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${B}/${KERNEL_OUTPUT_=
DIR}/fitImage-${INITRAMFS_IMAGE} &quot;$deployDir/fitImage-${INITRAMFS_IMAG=
E_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${INITRAMFSDIR}/${KER=
NEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE} &quot;$deployDir/fitImage-${INI=
TRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${KERNEL_FIT_LINK_NAME=
}&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -snf =
fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT} &q=
uot;$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
@@ -829,3 +866,5 @@ kernel_do_deploy:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+<br>
+addtask do_deploy_fitimage before do_build after do_deploy do_assemble_fit=
image_initramfs<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 7bb3449..f2efb3e 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -140,7 +140,7 @@ set -e<br>
=C2=A0 =C2=A0 =C2=A0# If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE=
_BUNDLE is set to 0,<br>
=C2=A0 =C2=A0 =C2=A0# the do_bundle_initramfs does nothing, but the INITRAM=
FS_IMAGE is built<br>
=C2=A0 =C2=A0 =C2=A0# standalone for use by wic and other tools.<br>
-=C2=A0 =C2=A0 if image:<br>
+=C2=A0 =C2=A0 if image and &#39;fitImage&#39; not in d.getVar(&#39;KERNEL_=
IMAGETYPES&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;INITRAMFS_MULTICONFIG&#3=
9;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_bun=
dle_initramfs&#39;, &#39;mcdepends&#39;, &#39; mc::${INITRAMFS_MULTICONFIG}=
:${INITRAMFS_IMAGE}:do_image_complete&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-- <br>
1.8.3.1<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173049): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173049" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173049</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94747626/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94747626/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cc0f1b05ed0f0187--

