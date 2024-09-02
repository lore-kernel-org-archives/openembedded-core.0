Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3415CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 11:11:48 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.36254.1725275501153698629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 04:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YkbWPpJG;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-533488ffaf7so5571971e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 04:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725275499; x=1725880299; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rXaV8c+iuRfRQ6W2bLUvaTcjtXUEaC/vOhoQ9/EMI/c=;
        b=YkbWPpJGEYFn5Hb7FErpBpgFDhpAzFp80DUp/TmtbqkwFneTCxaMLBKBo6LiH9MdNd
         D6iSEXk1H/cpKOvneVsNf/WvbmcahWTDRmqN3Jd/bx8p1jbVkpvVA8OJUaSMsQ5KrysD
         9UP5O9P8mDlhQXEHHWYjyy137OL+kgY7s22TGML9zpBFN/KlpWoXp/PqGbKPs60O0HQJ
         tf31k/E+3rFkIkD3iCTEA/5Wg6L7i2tla+31JB1q6E9XzIwOfN7xAvuGM9pamm+PpS/l
         zwoJKd3zTD87SG8QXhKwxlfOMnFli/MtMhWr1YRNA9jpMAAIMssxWRFPQvfCeETTt54H
         lpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725275499; x=1725880299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXaV8c+iuRfRQ6W2bLUvaTcjtXUEaC/vOhoQ9/EMI/c=;
        b=AisB3k970km14Qj6WO6cAH20+h4fK4Zvm6Ar8sg8pXjfBjM1KDOMAa2xel5RZzsi+y
         6SZJ4US/q3+vcO5nH9UrXOvlIsEbKC0MqbhlD50mmB6JGUKzXAlMNZC5L7NDwEqX6STP
         d24JNoUxxDOYdfe6llVvOpKSEUjjoaUNg2Dfl6vcHHyiNCKToe5LDd6ZScI9ytZm03XL
         qsah4MGf4NBrQ6ua8HUA/guO6xuc2SpEqX8qSPqr+06B86jICOTmCBC9jw/kURJixxsC
         5DZLd3NMSdQukXENE8SKs4qhiwW03dg1mTpU11PyaayqCq7m1x8i9/eO75SIJi3VnIhB
         o0cA==
X-Gm-Message-State: AOJu0Yxs5CHvcGh54R377bXAnJbGkrk0+gFnbq+VlCjt9OyOpkiNy9vo
	UHq3qPW2RxjaIAUfoyWTghrJpfiDG41XNtI0/RBEKiOKtz4ECTwv+/g9+MCY7zllcR+nsjReScF
	ZrI+k0Ldmu3fYcsivZ2QBaIRdSSQ=
X-Google-Smtp-Source: AGHT+IG63JJimqk9DGoBYik5HZInqr+3l4MsLenNMNgDtmboCD7LU+wyENDUryLHViFPGdOY3KxqmWM9jcXEZwSFLEI=
X-Received: by 2002:a05:6512:1328:b0:533:466d:698c with SMTP id
 2adb3069b0e04-53546b91ecdmr6984250e87.39.1725275498345; Mon, 02 Sep 2024
 04:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240902105825.40177-1-mikko.rapeli@linaro.org> <20240902105825.40177-3-mikko.rapeli@linaro.org>
In-Reply-To: <20240902105825.40177-3-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Sep 2024 13:11:27 +0200
Message-ID: <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building Unified
 Kernel Images (UKI)
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org, 
	Michelle Lin <michelle.linto91@gmail.com>, Erik Schilling <erik.schilling@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000037fc9306212101bd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 11:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204095

--00000000000037fc9306212101bd
Content-Type: text/plain; charset="UTF-8"

Should this also have a wic based selftest or some other way to ensure it
works?

Alex

On Mon 2. Sep 2024 at 12.58, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:

> From: Michelle Lin <michelle.linto91@gmail.com>
>
> This class calls systemd ukify tool, which will combine
> kernel/initrd/stub components to build the UKI. To sign the UKI
> (i.e. SecureBoot), the keys/cert files can be specified
> in a configuration file or UEFI binary signing can be done
> via separate steps, see qemuarm64-secureboot in meta-arm.
> UKIs are loaded by UEFI firmware on target which can improve
> security by loading only correctly signed kernel, initrd and kernel
> command line.
>
> Using systemd-measure to pre-calculate TPM PCR values and sign them is
> not supported since that requires a TPM device on the build host. Thus
> "ConditionSecurity=measured-uki" default from systemd 256 does not work
> but "ConditionSecurity=tpm2" in combination with secure boot will.
> These can be used to boot securely into systemd-boot, kernel, kernel
> command line and initrd which then securely mounts a read-only dm-verity
> /usr partition and creates a TPM encrypted read-write / rootfs.
>
> Tested via qemuarm64-secureboot in meta-arm with
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_v3_02_13/108031399
> and a few more changes needed, will be posted separately.
>
> Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
> Acked-by: Erik Schilling <erik.schilling@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/uki.bbclass | 158 ++++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 meta/classes-recipe/uki.bbclass
>
> diff --git a/meta/classes-recipe/uki.bbclass
> b/meta/classes-recipe/uki.bbclass
> new file mode 100644
> index 0000000000..8d4bf317fe
> --- /dev/null
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -0,0 +1,158 @@
> +# Unified kernel image (UKI) class
> +#
> +# This bbclass merges kernel, initrd etc as a UKI standard UEFI binary,
> +# to be loaded with UEFI firmware on target. SecureBoot signing is
> +# supported via add ons. TPM PCR pre-calculation is not supported since
> +# systemd-measure tooling is meant to run on target, not in cross compile
> +# environment.
> +#
> +# See:
> +# https://www.freedesktop.org/software/systemd/man/latest/ukify.html
> +# https://uapi-group.org/specifications/specs/unified_kernel_image/
> +#
> +# The UKI is composed from
> +#   - an UEFI stub
> +#     The linux kernel can generate a UEFI stub, however the one from
> systemd-boot can fetch
> +#     the command line from a separate section of the EFI application,
> avoiding the need to
> +#     rebuild the kernel.
> +#   - the kernel
> +#   - an initramfs
> +#   - other metadata (e.g. PCR measurements)
> +#
> +# Usage instructions:
> +#   - requires UEFI compatible firmware on target, e.g.
> qemuarm64-secureboot from meta-arm
> +#   - Distro config:
> +#     INIT_MANAGER = "systemd"
> +#     DISTRO_FEATURES += "systemd"
> +#     DISTRO_FEATURES_NATIVE += "systemd"
> +#     DISTRO_FEATURES += "efi"
> +#     DISTRO_FEATURES += "uki"
> +#     INITRAMFS_IMAGE ?= "core-image-minimal-initramfs"
> +#     HOSTTOOLS += "getent ping"
> +#     EFI_PROVIDER = "systemd-boot"
> +#   - image recipe:
> +#     INHERIT_UKI = "${@bb.utils.contains('DISTRO_FEATURES', 'uki',
> 'uki', '', d)}"
> +#     inherit ${INHERIT_UKI}
> +#   - qemuboot/runqemu changes in image recipe:
> +#     # Detected by passing kernel parameter
> +#     QB_KERNEL_ROOT = ""
> +#     # kernel is in the image, should not be loaded separately
> +#     QB_DEFAULT_KERNEL = "none"
> +#   - for UEFI secure boot, systemd-boot, uki and linux kernel need
> +#     to be signed with sbsign (recipe available from meta-secure-core,
> +#     see also qemuarm64-secureboot from meta-arm)
> +
> +DEPENDS += "\
> +    systemd \
> +    systemd-boot \
> +    systemd-boot-native \
> +    virtual/${TARGET_PREFIX}binutils \
> +    virtual/kernel \
> +"
> +
> +REQUIRED_DISTRO_FEATURES += "usrmerge systemd uki"
> +
> +inherit features_check image-artifact-names
> +require ../conf/image-uefi.conf
> +
> +INITRAMFS_IMAGE ?= "core-image-minimal-initramfs"
> +
> +INITRD_ARCHIVE ?= "${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}"
> +
> +do_image_complete[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
> +
> +UKIFY_CMD ?= "ukify build"
> +UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
> +UKI_FILENAME ?= "uki.efi"
> +UKI_CMDLINE ?= "rootwait root=/dev/vda2"
> +
> +IMAGE_EFI_BOOT_FILES ?= "${UKI_FILENAME};EFI/Linux/${UKI_FILENAME}"
> +
> +do_uki[depends] += " \
> +                        systemd-boot:do_deploy \
> +                        virtual/kernel:do_deploy \
> +                     "
> +do_uki[depends] += "${@ '${INITRAMFS_IMAGE}:do_image_complete' if
> d.getVar('INITRAMFS_IMAGE') else ''}"
> +
> +# ensure that the build directory is empty everytime we generate a
> newly-created uki
> +do_uki[cleandirs] = "${B}"
> +# influence the build directory at the start of the builds
> +do_uki[dirs] = "${B}"
> +
> +# we want to allow specifying files in SRC_URI, such as for signing the
> UKI
> +python () {
> +    d.delVarFlag("do_fetch","noexec")
> +    d.delVarFlag("do_unpack","noexec")
> +}
> +
> +# main task
> +python do_uki() {
> +    import glob
> +    import bb.process
> +
> +    # Construct the ukify command
> +    ukify_cmd = d.getVar('UKIFY_CMD')
> +
> +    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
> +
> +    # initrd
> +    initramfs_image = "%s" % (d.getVar('INITRD_ARCHIVE'))
> +    ukify_cmd += " --initrd=%s" % os.path.join(deploy_dir_image,
> initramfs_image)
> +
> +    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
> +
> +    # Kernel
> +    if d.getVar('KERNEL_IMAGETYPE'):
> +        kernel = "%s/%s" % (deploy_dir_image,
> d.getVar('KERNEL_IMAGETYPE'))
> +        kernel_version = d.getVar('KERNEL_VERSION')
> +        if not os.path.exists(kernel):
> +            bb.fatal(f"ERROR: cannot find {kernel}.")
> +
> +        ukify_cmd += " --linux=%s --uname %s" % (kernel, kernel_version)
> +    else:
> +        bb.fatal("ERROR - Required argument: KERNEL")
> +
> +    # Command line
> +    cmdline = d.getVar('UKI_CMDLINE')
> +    if cmdline:
> +        ukify_cmd += " --cmdline='%s'" % cmdline
> +
> +    # Architecture
> +    target_arch = d.getVar('EFI_ARCH')
> +    if target_arch:
> +        ukify_cmd += " --efi-arch %s" % target_arch
> +
> +    # systemd stubs from deploy
> +    stub = "%s/linux%s.efi.stub" % (d.getVar('DEPLOY_DIR_IMAGE'),
> target_arch)
> +    if not os.path.exists(stub):
> +        bb.fatal(f"ERROR: cannot find {stub}.")
> +    ukify_cmd += " --stub %s" % stub
> +
> +    # Add option for dtb
> +    if d.getVar('KERNEL_DEVICETREE'):
> +        for dtb in d.getVar('KERNEL_DEVICETREE').split():
> +            dtb_path = "%s/%s" % (deploy_dir_image, dtb)
> +            if not os.path.exists(dtb_path):
> +                bb.fatal(f"ERROR: cannot find {dtb_path}.")
> +            ukify_cmd += " --devicetree %s" % dtb_path
> +
> +    # Add option to pass a config file the UKI
> +    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
> +        ukify_cmd += " --config=%s" % d.getVar('UKI_CONFIG_FILE')
> +
> +    # Tools
> +    ukify_cmd += " --tools=%s%s/lib/systemd/tools" %
> (d.getVar("RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
> +
> +    # TODO: tpm2 measure for secure boot, depends on systemd-native and
> TPM tooling
> +    # needed in systemd > 254 to fulfill ConditionSecurity=measured-uki
> +    # Requires TPM device on build host, thus not supported at build time.
> +    #ukify_cmd += " --measure"
> +
> +    # Custom UKI name
> +    output = " --output=%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
> d.getVar('UKI_FILENAME'))
> +    ukify_cmd += " %s" % output
> +
> +    # Run the ukify command
> +    bb.process.run(ukify_cmd, shell=True)
> +}
> +addtask uki after do_rootfs before do_deploy do_image_complete
> do_image_wic
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204092):
> https://lists.openembedded.org/g/openembedded-core/message/204092
> Mute This Topic: https://lists.openembedded.org/mt/108224526/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000037fc9306212101bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Should this also have a wic based selftest or some other =
way to ensure it works?</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon 2. Sep 2024 at 12.58, Mikko Rapeli via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;mikko.rapeli=3D<a href=
=3D"mailto:linaro.org@lists.openembedded.org">linaro.org@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)">From: Michelle Lin &lt;<a hre=
f=3D"mailto:michelle.linto91@gmail.com" target=3D"_blank">michelle.linto91@=
gmail.com</a>&gt;<br>
<br>
This class calls systemd ukify tool, which will combine<br>
kernel/initrd/stub components to build the UKI. To sign the UKI<br>
(i.e. SecureBoot), the keys/cert files can be specified<br>
in a configuration file or UEFI binary signing can be done<br>
via separate steps, see qemuarm64-secureboot in meta-arm.<br>
UKIs are loaded by UEFI firmware on target which can improve<br>
security by loading only correctly signed kernel, initrd and kernel<br>
command line.<br>
<br>
Using systemd-measure to pre-calculate TPM PCR values and sign them is<br>
not supported since that requires a TPM device on the build host. Thus<br>
&quot;ConditionSecurity=3Dmeasured-uki&quot; default from systemd 256 does =
not work<br>
but &quot;ConditionSecurity=3Dtpm2&quot; in combination with secure boot wi=
ll.<br>
These can be used to boot securely into systemd-boot, kernel, kernel<br>
command line and initrd which then securely mounts a read-only dm-verity<br=
>
/usr partition and creates a TPM encrypted read-write / rootfs.<br>
<br>
Tested via qemuarm64-secureboot in meta-arm with<br>
<a href=3D"https://lists.yoctoproject.org/g/meta-arm/topic/patch_v3_02_13/1=
08031399" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/g/meta-arm/topic/patch_v3_02_13/108031399</a><br>
and a few more changes needed, will be posted separately.<br>
<br>
Signed-off-by: Michelle Lin &lt;<a href=3D"mailto:michelle.linto91@gmail.co=
m" target=3D"_blank">michelle.linto91@gmail.com</a>&gt;<br>
Acked-by: Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.org" t=
arget=3D"_blank">erik.schilling@linaro.org</a>&gt;<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/uki.bbclass | 158 +++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 158 insertions(+)<br>
=C2=A0create mode 100644 meta/classes-recipe/uki.bbclass<br>
<br>
diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbcl=
ass<br>
new file mode 100644<br>
index 0000000000..8d4bf317fe<br>
--- /dev/null<br>
+++ b/meta/classes-recipe/uki.bbclass<br>
@@ -0,0 +1,158 @@<br>
+# Unified kernel image (UKI) class<br>
+#<br>
+# This bbclass merges kernel, initrd etc as a UKI standard UEFI binary,<br=
>
+# to be loaded with UEFI firmware on target. SecureBoot signing is<br>
+# supported via add ons. TPM PCR pre-calculation is not supported since<br=
>
+# systemd-measure tooling is meant to run on target, not in cross compile<=
br>
+# environment.<br>
+#<br>
+# See:<br>
+# <a href=3D"https://www.freedesktop.org/software/systemd/man/latest/ukify=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.freedesktop.org/sof=
tware/systemd/man/latest/ukify.html</a><br>
+# <a href=3D"https://uapi-group.org/specifications/specs/unified_kernel_im=
age/" rel=3D"noreferrer" target=3D"_blank">https://uapi-group.org/specifica=
tions/specs/unified_kernel_image/</a><br>
+#<br>
+# The UKI is composed from<br>
+#=C2=A0 =C2=A0- an UEFI stub<br>
+#=C2=A0 =C2=A0 =C2=A0The linux kernel can generate a UEFI stub, however th=
e one from systemd-boot can fetch<br>
+#=C2=A0 =C2=A0 =C2=A0the command line from a separate section of the EFI a=
pplication, avoiding the need to<br>
+#=C2=A0 =C2=A0 =C2=A0rebuild the kernel.<br>
+#=C2=A0 =C2=A0- the kernel<br>
+#=C2=A0 =C2=A0- an initramfs<br>
+#=C2=A0 =C2=A0- other metadata (e.g. PCR measurements)<br>
+#<br>
+# Usage instructions:<br>
+#=C2=A0 =C2=A0- requires UEFI compatible firmware on target, e.g. qemuarm6=
4-secureboot from meta-arm<br>
+#=C2=A0 =C2=A0- Distro config:<br>
+#=C2=A0 =C2=A0 =C2=A0INIT_MANAGER =3D &quot;systemd&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES +=3D &quot;systemd&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES_NATIVE +=3D &quot;systemd&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES +=3D &quot;efi&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES +=3D &quot;uki&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0INITRAMFS_IMAGE ?=3D &quot;core-image-minimal-initram=
fs&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0HOSTTOOLS +=3D &quot;getent ping&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0EFI_PROVIDER =3D &quot;systemd-boot&quot;<br>
+#=C2=A0 =C2=A0- image recipe:<br>
+#=C2=A0 =C2=A0 =C2=A0INHERIT_UKI =3D &quot;${@bb.utils.contains(&#39;DISTR=
O_FEATURES&#39;, &#39;uki&#39;, &#39;uki&#39;, &#39;&#39;, d)}&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0inherit ${INHERIT_UKI}<br>
+#=C2=A0 =C2=A0- qemuboot/runqemu changes in image recipe:<br>
+#=C2=A0 =C2=A0 =C2=A0# Detected by passing kernel parameter<br>
+#=C2=A0 =C2=A0 =C2=A0QB_KERNEL_ROOT =3D &quot;&quot;<br>
+#=C2=A0 =C2=A0 =C2=A0# kernel is in the image, should not be loaded separa=
tely<br>
+#=C2=A0 =C2=A0 =C2=A0QB_DEFAULT_KERNEL =3D &quot;none&quot;<br>
+#=C2=A0 =C2=A0- for UEFI secure boot, systemd-boot, uki and linux kernel n=
eed<br>
+#=C2=A0 =C2=A0 =C2=A0to be signed with sbsign (recipe available from meta-=
secure-core,<br>
+#=C2=A0 =C2=A0 =C2=A0see also qemuarm64-secureboot from meta-arm)<br>
+<br>
+DEPENDS +=3D &quot;\<br>
+=C2=A0 =C2=A0 systemd \<br>
+=C2=A0 =C2=A0 systemd-boot \<br>
+=C2=A0 =C2=A0 systemd-boot-native \<br>
+=C2=A0 =C2=A0 virtual/${TARGET_PREFIX}binutils \<br>
+=C2=A0 =C2=A0 virtual/kernel \<br>
+&quot;<br>
+<br>
+REQUIRED_DISTRO_FEATURES +=3D &quot;usrmerge systemd uki&quot;<br>
+<br>
+inherit features_check image-artifact-names<br>
+require ../conf/image-uefi.conf<br>
+<br>
+INITRAMFS_IMAGE ?=3D &quot;core-image-minimal-initramfs&quot;<br>
+<br>
+INITRD_ARCHIVE ?=3D &quot;${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPE=
S}&quot;<br>
+<br>
+do_image_complete[depends] +=3D &quot;${INITRAMFS_IMAGE}:do_image_complete=
&quot;<br>
+<br>
+UKIFY_CMD ?=3D &quot;ukify build&quot;<br>
+UKI_CONFIG_FILE ?=3D &quot;${UNPACKDIR}/uki.conf&quot;<br>
+UKI_FILENAME ?=3D &quot;uki.efi&quot;<br>
+UKI_CMDLINE ?=3D &quot;rootwait root=3D/dev/vda2&quot;<br>
+<br>
+IMAGE_EFI_BOOT_FILES ?=3D &quot;${UKI_FILENAME};EFI/Linux/${UKI_FILENAME}&=
quot;<br>
+<br>
+do_uki[depends] +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 systemd-boot:do_deploy \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 virtual/kernel:do_deploy \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
+do_uki[depends] +=3D &quot;${@ &#39;${INITRAMFS_IMAGE}:do_image_complete&#=
39; if d.getVar(&#39;INITRAMFS_IMAGE&#39;) else &#39;&#39;}&quot;<br>
+<br>
+# ensure that the build directory is empty everytime we generate a newly-c=
reated uki<br>
+do_uki[cleandirs] =3D &quot;${B}&quot;<br>
+# influence the build directory at the start of the builds<br>
+do_uki[dirs] =3D &quot;${B}&quot;<br>
+<br>
+# we want to allow specifying files in SRC_URI, such as for signing the UK=
I<br>
+python () {<br>
+=C2=A0 =C2=A0 d.delVarFlag(&quot;do_fetch&quot;,&quot;noexec&quot;)<br>
+=C2=A0 =C2=A0 d.delVarFlag(&quot;do_unpack&quot;,&quot;noexec&quot;)<br>
+}<br>
+<br>
+# main task<br>
+python do_uki() {<br>
+=C2=A0 =C2=A0 import glob<br>
+=C2=A0 =C2=A0 import bb.process<br>
+<br>
+=C2=A0 =C2=A0 # Construct the ukify command<br>
+=C2=A0 =C2=A0 ukify_cmd =3D d.getVar(&#39;UKIFY_CMD&#39;)<br>
+<br>
+=C2=A0 =C2=A0 deploy_dir_image =3D d.getVar(&#39;DEPLOY_DIR_IMAGE&#39;)<br=
>
+<br>
+=C2=A0 =C2=A0 # initrd<br>
+=C2=A0 =C2=A0 initramfs_image =3D &quot;%s&quot; % (d.getVar(&#39;INITRD_A=
RCHIVE&#39;))<br>
+=C2=A0 =C2=A0 ukify_cmd +=3D &quot; --initrd=3D%s&quot; % os.path.join(dep=
loy_dir_image, initramfs_image)<br>
+<br>
+=C2=A0 =C2=A0 deploy_dir_image =3D d.getVar(&#39;DEPLOY_DIR_IMAGE&#39;)<br=
>
+<br>
+=C2=A0 =C2=A0 # Kernel<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;KERNEL_IMAGETYPE&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel =3D &quot;%s/%s&quot; % (deploy_dir_ima=
ge, d.getVar(&#39;KERNEL_IMAGETYPE&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_version =3D d.getVar(&#39;KERNEL_VERSIO=
N&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(kernel):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(f&quot;ERROR: cannot fi=
nd {kernel}.&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ukify_cmd +=3D &quot; --linux=3D%s --uname %s&=
quot; % (kernel, kernel_version)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;ERROR - Required argument: KERN=
EL&quot;)<br>
+<br>
+=C2=A0 =C2=A0 # Command line<br>
+=C2=A0 =C2=A0 cmdline =3D d.getVar(&#39;UKI_CMDLINE&#39;)<br>
+=C2=A0 =C2=A0 if cmdline:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ukify_cmd +=3D &quot; --cmdline=3D&#39;%s&#39;=
&quot; % cmdline<br>
+<br>
+=C2=A0 =C2=A0 # Architecture<br>
+=C2=A0 =C2=A0 target_arch =3D d.getVar(&#39;EFI_ARCH&#39;)<br>
+=C2=A0 =C2=A0 if target_arch:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ukify_cmd +=3D &quot; --efi-arch %s&quot; % ta=
rget_arch<br>
+<br>
+=C2=A0 =C2=A0 # systemd stubs from deploy<br>
+=C2=A0 =C2=A0 stub =3D &quot;%s/linux%s.efi.stub&quot; % (d.getVar(&#39;DE=
PLOY_DIR_IMAGE&#39;), target_arch)<br>
+=C2=A0 =C2=A0 if not os.path.exists(stub):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(f&quot;ERROR: cannot find {stub}.&quo=
t;)<br>
+=C2=A0 =C2=A0 ukify_cmd +=3D &quot; --stub %s&quot; % stub<br>
+<br>
+=C2=A0 =C2=A0 # Add option for dtb<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;KERNEL_DEVICETREE&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dtb in d.getVar(&#39;KERNEL_DEVICETREE&#39=
;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path =3D &quot;%s/%s&quot; %=
 (deploy_dir_image, dtb)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(dtb_path):=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(f&quot;ER=
ROR: cannot find {dtb_path}.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ukify_cmd +=3D &quot; --devicetr=
ee %s&quot; % dtb_path<br>
+<br>
+=C2=A0 =C2=A0 # Add option to pass a config file the UKI<br>
+=C2=A0 =C2=A0 if os.path.exists(d.getVar(&#39;UKI_CONFIG_FILE&#39;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ukify_cmd +=3D &quot; --config=3D%s&quot; % d.=
getVar(&#39;UKI_CONFIG_FILE&#39;)<br>
+<br>
+=C2=A0 =C2=A0 # Tools<br>
+=C2=A0 =C2=A0 ukify_cmd +=3D &quot; --tools=3D%s%s/lib/systemd/tools&quot;=
 % (d.getVar(&quot;RECIPE_SYSROOT_NATIVE&quot;), d.getVar(&quot;prefix&quot=
;))<br>
+<br>
+=C2=A0 =C2=A0 # TODO: tpm2 measure for secure boot, depends on systemd-nat=
ive and TPM tooling<br>
+=C2=A0 =C2=A0 # needed in systemd &gt; 254 to fulfill ConditionSecurity=3D=
measured-uki<br>
+=C2=A0 =C2=A0 # Requires TPM device on build host, thus not supported at b=
uild time.<br>
+=C2=A0 =C2=A0 #ukify_cmd +=3D &quot; --measure&quot;<br>
+<br>
+=C2=A0 =C2=A0 # Custom UKI name<br>
+=C2=A0 =C2=A0 output =3D &quot; --output=3D%s/%s&quot; % (d.getVar(&#39;DE=
PLOY_DIR_IMAGE&#39;), d.getVar(&#39;UKI_FILENAME&#39;))<br>
+=C2=A0 =C2=A0 ukify_cmd +=3D &quot; %s&quot; % output<br>
+<br>
+=C2=A0 =C2=A0 # Run the ukify command<br>
+=C2=A0 =C2=A0 bb.process.run(ukify_cmd, shell=3DTrue)<br>
+}<br>
+addtask uki after do_rootfs before do_deploy do_image_complete do_image_wi=
c<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#204092): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/204092" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/204092</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108224526/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108224526/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000037fc9306212101bd--

