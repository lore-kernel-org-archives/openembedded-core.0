Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1532CA0FFA
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 01:04:50 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.981.1693616685345387091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 18:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=doLmGAW4;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.99] (cpe-173-175-175-24.elp.res.rr.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id 87CAF212A79E
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Sep 2023 18:04:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 87CAF212A79E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1693616684;
	bh=K6x2HfzcXLADV+PcTzAvLPqobxL00tiZwa8NW0v+M90=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=doLmGAW4PrvvypDmFEu58njoEiEIAfPJRSJ5lYReQp9gaYW2PefbFmk7kjjd8Ignn
	 IneX+xFwKjo8jZabIg51HQrHHfdfJp9QvIrT4PSL206KanYWHYnzp5STRMJ88DUer3
	 IThIPNxFacdfC2MqSFSVyM+mZ8kpcZOLCnKKgqKk=
Content-Type: multipart/alternative;
 boundary="------------fKWwhr7fA0J2pUQGncNOM50A"
Message-ID: <c2bdaf07-b2c6-4c85-ab03-f475ff6bdde6@linux.microsoft.com>
Date: Fri, 1 Sep 2023 19:04:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel
 Images
To: openembedded-core@lists.openembedded.org
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
Content-Language: en-US
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
In-Reply-To: <20230901233231.1109712-1-michelle.linto91@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 01:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187019

This is a multi-part message in MIME format.
--------------fKWwhr7fA0J2pUQGncNOM50A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Alejandro Hernandez<alhe@linux.microsoft.com>

On 9/1/23 17:32, Michelle Lin wrote:
> Currently, there is not a class to support the building of unified kernel
> images. Adding a uki.bbclass to support the creation of UKIs. This class calls
> the systemd Ukify tool, which will combine the kernel/initrd/stub components to
> build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing), the keys/cert
> files are to be specified in a separate configuration file, and the path to the
> file is passed to the Ukify tool. UKIs are supported by UEFI and can improve
> security through predicted TPM PCR states, and reduce the build burden due to
> its single PE binary format.
>
> Signed-off-by: Michelle Lin<michelle.linto91@gmail.com>
> ---
>   meta/classes/uki.bbclass                 | 140 +++++++++++++++++++++++
>   meta/recipes-core/systemd/systemd_254.bb |  23 ++++
>   2 files changed, 163 insertions(+)
>   create mode 100644 meta/classes/uki.bbclass
>
> diff --git a/meta/classes/uki.bbclass b/meta/classes/uki.bbclass
> new file mode 100644
> index 0000000000..2eff387c75
> --- /dev/null
> +++ b/meta/classes/uki.bbclass
> @@ -0,0 +1,140 @@
> +#
> +# Unified kernel image (UKI) class
> +#
> +#
> +# This bbclass is designed to repack an Overlake image as a UKI, to be booted on a qemuarm64 with SecureBoot
> +# signing and embedded with TPM PCR measurements.
> +#
> +# The UKI is composed by:
> +#   - an UEFI stub
> +#     The linux kernel can generate a UEFI stub, however the one from systemd-boot can fetch
> +#     the command line from a separate section of the EFI application, avoiding the need to
> +#     rebuild the kernel.
> +#   - the kernel
> +#   - an initramfs
> +#   - other metadata (e.g. PCR measurements)
> +#
> +#
> +#
> +
> +# List build time dependencies
> +DEPENDS += "systemd-native \
> +            sbsigntool-native \
> +            virtual/${TARGET_PREFIX}binutils \
> +            "
> +
> +REQUIRED_DISTRO_FEATURES += "usrmerge systemd"
> +
> +inherit features_check
> +require ../conf/image-uefi.conf
> +
> +INITRD_IMAGE ?= "core-image-minimal-initramfs"
> +
> +INITRD_LIVE ?= "${@ ('${DEPLOY_DIR_IMAGE}/' + d.getVar('INITRD_IMAGE') + '-${MACHINE}.cpio.gz') if d.getVar('INITRD_IMAGE') else ''}"
> +
> +UKI_CONFIG_FILE ?= "${WORKDIR}/core-image-minimal-uki.conf"
> +UKI_FILENAME ?= "${@ 'UKI.signed.efi' if d.getVar('UKI_CONFIG_FILE') else 'UKI.unsigned.efi'}"
> +
> +do_uki[depends] += " \
> +                        systemd-boot:do_deploy \
> +                        virtual/kernel:do_deploy \
> +                     "
> +
> +# INITRD_IMAGE is added to INITRD_LIVE, which we use to create our initrd, so depend on it if it is set
> +# So we want to generate the initrd image if INITRD_IMAGE exists
> +do_uki[depends] += "${@ '${INITRD_IMAGE}:do_image_complete' if d.getVar('INITRD_IMAGE') else ''}"
> +
> +# ensure that the build directory is empty everytime we generate a newly-created uki
> +do_uki[cleandirs] = "${B}"
> +# influence the build directory at the start of the builds
> +do_uki[dirs] = "${B}"
> +
> +# we want to allow specifying files in SRC_URI, such as for signing the UKI
> +python () {
> +    d.delVarFlag("do_fetch","noexec")
> +    d.delVarFlag("do_unpack","noexec")
> +}
> +
> +# main task
> +python do_uki() {
> +    import glob
> +    import subprocess
> +
> +    # Construct the ukify command
> +    ukify_cmd = ("ukify build")
> +
> +    # Handle the creation of an initrd image by reading and concatenating multiple cpio files.
> +    # If the INITRD_LIVE variable is defined and not empty, it opens the necessary files, reads their contents,
> +    # and constructs a list.
> +    if d.getVar('INITRD_LIVE'):
> +        initrd_list = ""
> +        for cpio in d.getVar('INITRD_LIVE').split():
> +            # get a list of initrds
> +            initrd_list += cpio + ' '
> +
> +        ukify_cmd += " --initrd=%s" % initrd_list
> +    else:
> +        bb.fatal("ERROR - Required argument: INITRD")
> +
> +    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
> +
> +    # Kernel
> +    if d.getVar('KERNEL_IMAGETYPE'):
> +        kernel = "%s/%s" % (deploy_dir_image, d.getVar('KERNEL_IMAGETYPE'))
> +        kernel_version = d.getVar('KERNEL_VERSION')
> +        if not os.path.exists(kernel):
> +            bb.fatal(f"ERROR: cannot find {kernel}.")
> +
> +        ukify_cmd += " --linux=%s --uname %s" % (kernel, kernel_version)
> +    else:
> +        bb.fatal("ERROR - Required argument: KERNEL")
> +
> +    # Architecture
> +    target_arch = d.getVar('EFI_ARCH')
> +    ukify_cmd += " --efi-arch %s" % target_arch
> +
> +    # Stub
> +    stub = "%s/linux%s.efi.stub" % (deploy_dir_image, target_arch)
> +    if not os.path.exists(stub):
> +        bb.fatal(f"ERROR: cannot find {stub}.")
> +    ukify_cmd += " --stub %s" % stub
> +
> +    # Add option for dtb
> +    if d.getVar('KERNEL_DEVICETREE'):
> +        first_dtb = d.getVar('KERNEL_DEVICETREE').split()[0]
> +        dtb_path = "%s/%s" % (deploy_dir_image, first_dtb)
> +
> +        if not os.path.exists(dtb_path):
> +            bb.fatal(f"ERROR: cannot find {dtb_path}.")
> +
> +        ukify_cmd += " --devicetree %s" % dtb_path
> +
> +    # Add option to pass a config file to sign the UKI.
> +    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
> +        ukify_cmd += " --config=%s" % d.getVar('UKI_CONFIG_FILE')
> +        ukify_cmd += " --tools=%s%s/lib/systemd/tools" % (d.getVar("RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
> +        bb.note("Pulling keys from config file")
> +    else:
> +        bb.note("Generating unsigned UKI")
> +
> +    # Custom UKI name
> +    output = " --output=%s" % d.getVar('UKI_FILENAME')
> +    ukify_cmd += " %s" % output
> +
> +    # Set env to determine where bitbake should look for dynamic libraries
> +    env = os.environ.copy() # get the env variables
> +    env['LD_LIBRARY_PATH'] = d.expand("${RECIPE_SYSROOT_NATIVE}/usr/lib/systemd:${LD_LIBRARY_PATH}")
> +
> +    # Run the ukify command
> +    subprocess.check_call(ukify_cmd, env=env, shell=True)
> +}
> +
> +inherit deploy
> +
> +do_deploy () {
> +    # Copy generated UKI into DEPLOYDIR
> +	install ${B}/${UKI_FILENAME} ${DEPLOYDIR}
> +}
> +
> +addtask uki before do_deploy do_image after do_rootfs
> +addtask deploy before do_build after do_compile
> \ No newline at end of file
> diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
> index 8d5cf13095..65f132abb8 100644
> --- a/meta/recipes-core/systemd/systemd_254.bb
> +++ b/meta/recipes-core/systemd/systemd_254.bb
> @@ -6,6 +6,9 @@ PE = "1"
>   
>   DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
>   
> +# The Ukify tool requires this module
> +DEPENDS:append:class-native = " python3-pefile-native"
> +
>   SECTION = "base/shell"
>   
>   inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
> @@ -18,6 +21,8 @@ REQUIRED_DISTRO_FEATURES += "usrmerge"
>   # that we don't build both udev and systemd in world builds.
>   REQUIRED_DISTRO_FEATURES += "systemd"
>   
> +REQUIRED_DISTRO_FEATURES:class-native = ""
> +
>   SRC_URI += " \
>              file://touchscreen.rules  \
>              file://00-create-volatile.conf  \
> @@ -120,6 +125,8 @@ PACKAGECONFIG:remove:libc-musl = " \
>   #https://github.com/seccomp/libseccomp/issues/347
>   PACKAGECONFIG:remove:mipsarch = "seccomp"
>   
> +PACKAGECONFIG:class-native = "serial-getty-generator openssl tpm2 efi"
> +
>   TARGET_CC_ARCH:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 -D_LARGEFILE64_SOURCE"
>   
>   # Some of the dependencies are weak-style recommends - if not available at runtime,
> @@ -260,6 +267,9 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>                     -Dloadkeys-path=${bindir}/loadkeys \
>                     -Dsetfont-path=${bindir}/setfont"
>   
> +EXTRA_OEMESON:append:class-native = " -Dbootloader=true \
> +                                      -Dman=false \
> +                                    "
>   # The 60 seconds is watchdog's default vaule.
>   WATCHDOG_TIMEOUT ??= "60"
>   
> @@ -380,6 +390,14 @@ do_install() {
>       fi
>   }
>   
> +do_install:class-native() {
> +	meson_do_install
> +	install -d ${D}${bindir}
> +	install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> +	install -d ${D}${prefix}/lib/systemd/tools
> +	install -m 0755 ${B}/systemd-measure ${D}${prefix}/lib/systemd/tools
> +}
> +
>   python populate_packages:prepend (){
>       systemdlibdir = d.getVar("rootlibdir")
>       do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
> @@ -702,6 +720,9 @@ RRECOMMENDS:${PN} += "systemd-extra-utils \
>                         ${@bb.utils.contains('PACKAGECONFIG', 'logind', 'pam-plugin-umask', '', d)} \
>   "
>   
> +RRECOMMENDS:${PN}:class-native = ""
> +RDEPENDS:${PN}:class-native = ""
> +
>   INSANE_SKIP:${PN} += "dev-so libdir"
>   INSANE_SKIP:${PN}-dbg += "libdir"
>   INSANE_SKIP:${PN}-doc += " libdir" @@ -852,3 +873,5 @@ pkg_postinst:udev-hwdb () { pkg_prerm:udev-hwdb 
> () { rm -f $D${sysconfdir}/udev/hwdb.bin } + +BBCLASSEXTEND += "native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187017):https://lists.openembedded.org/g/openembedded-core/message/187017
> Mute This Topic:https://lists.openembedded.org/mt/101106095/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------fKWwhr7fA0J2pUQGncNOM50A
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Acked-by: Alejandro Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>

</pre>
    <div class="moz-cite-prefix">On 9/1/23 17:32, Michelle Lin wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230901233231.1109712-1-michelle.linto91@gmail.com">
      <pre class="moz-quote-pre" wrap="">Currently, there is not a class to support the building of unified kernel
images. Adding a uki.bbclass to support the creation of UKIs. This class calls
the systemd Ukify tool, which will combine the kernel/initrd/stub components to
build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing), the keys/cert
files are to be specified in a separate configuration file, and the path to the
file is passed to the Ukify tool. UKIs are supported by UEFI and can improve
security through predicted TPM PCR states, and reduce the build burden due to
its single PE binary format.

Signed-off-by: Michelle Lin <a class="moz-txt-link-rfc2396E" href="mailto:michelle.linto91@gmail.com">&lt;michelle.linto91@gmail.com&gt;</a>
---
 meta/classes/uki.bbclass                 | 140 +++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_254.bb |  23 ++++
 2 files changed, 163 insertions(+)
 create mode 100644 meta/classes/uki.bbclass

diff --git a/meta/classes/uki.bbclass b/meta/classes/uki.bbclass
new file mode 100644
index 0000000000..2eff387c75
--- /dev/null
+++ b/meta/classes/uki.bbclass
@@ -0,0 +1,140 @@
+#
+# Unified kernel image (UKI) class
+#
+#
+# This bbclass is designed to repack an Overlake image as a UKI, to be booted on a qemuarm64 with SecureBoot
+# signing and embedded with TPM PCR measurements.
+#
+# The UKI is composed by:
+#   - an UEFI stub
+#     The linux kernel can generate a UEFI stub, however the one from systemd-boot can fetch
+#     the command line from a separate section of the EFI application, avoiding the need to
+#     rebuild the kernel.
+#   - the kernel
+#   - an initramfs
+#   - other metadata (e.g. PCR measurements)
+#
+#
+#
+
+# List build time dependencies
+DEPENDS += "systemd-native \
+            sbsigntool-native \
+            virtual/${TARGET_PREFIX}binutils \
+            "
+
+REQUIRED_DISTRO_FEATURES += "usrmerge systemd"
+
+inherit features_check
+require ../conf/image-uefi.conf
+
+INITRD_IMAGE ?= "core-image-minimal-initramfs"
+
+INITRD_LIVE ?= "${@ ('${DEPLOY_DIR_IMAGE}/' + d.getVar('INITRD_IMAGE') + '-${MACHINE}.cpio.gz') if d.getVar('INITRD_IMAGE') else ''}"
+
+UKI_CONFIG_FILE ?= "${WORKDIR}/core-image-minimal-uki.conf"
+UKI_FILENAME ?= "${@ 'UKI.signed.efi' if d.getVar('UKI_CONFIG_FILE') else 'UKI.unsigned.efi'}"
+
+do_uki[depends] += " \
+                        systemd-boot:do_deploy \
+                        virtual/kernel:do_deploy \
+                     "
+
+# INITRD_IMAGE is added to INITRD_LIVE, which we use to create our initrd, so depend on it if it is set
+# So we want to generate the initrd image if INITRD_IMAGE exists
+do_uki[depends] += "${@ '${INITRD_IMAGE}:do_image_complete' if d.getVar('INITRD_IMAGE') else ''}"
+
+# ensure that the build directory is empty everytime we generate a newly-created uki
+do_uki[cleandirs] = "${B}"
+# influence the build directory at the start of the builds
+do_uki[dirs] = "${B}"
+
+# we want to allow specifying files in SRC_URI, such as for signing the UKI
+python () {
+    d.delVarFlag("do_fetch","noexec")
+    d.delVarFlag("do_unpack","noexec")
+}
+
+# main task
+python do_uki() {
+    import glob
+    import subprocess
+
+    # Construct the ukify command
+    ukify_cmd = ("ukify build")
+
+    # Handle the creation of an initrd image by reading and concatenating multiple cpio files. 
+    # If the INITRD_LIVE variable is defined and not empty, it opens the necessary files, reads their contents, 
+    # and constructs a list.
+    if d.getVar('INITRD_LIVE'):
+        initrd_list = ""
+        for cpio in d.getVar('INITRD_LIVE').split():
+            # get a list of initrds
+            initrd_list += cpio + ' '
+        
+        ukify_cmd += " --initrd=%s" % initrd_list
+    else:
+        bb.fatal("ERROR - Required argument: INITRD")
+    
+    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
+   
+    # Kernel
+    if d.getVar('KERNEL_IMAGETYPE'):
+        kernel = "%s/%s" % (deploy_dir_image, d.getVar('KERNEL_IMAGETYPE'))
+        kernel_version = d.getVar('KERNEL_VERSION')
+        if not os.path.exists(kernel):
+            bb.fatal(f"ERROR: cannot find {kernel}.")
+
+        ukify_cmd += " --linux=%s --uname %s" % (kernel, kernel_version)
+    else:
+        bb.fatal("ERROR - Required argument: KERNEL")
+
+    # Architecture
+    target_arch = d.getVar('EFI_ARCH')
+    ukify_cmd += " --efi-arch %s" % target_arch
+
+    # Stub
+    stub = "%s/linux%s.efi.stub" % (deploy_dir_image, target_arch)
+    if not os.path.exists(stub):
+        bb.fatal(f"ERROR: cannot find {stub}.")
+    ukify_cmd += " --stub %s" % stub
+
+    # Add option for dtb
+    if d.getVar('KERNEL_DEVICETREE'):
+        first_dtb = d.getVar('KERNEL_DEVICETREE').split()[0]
+        dtb_path = "%s/%s" % (deploy_dir_image, first_dtb)
+
+        if not os.path.exists(dtb_path):
+            bb.fatal(f"ERROR: cannot find {dtb_path}.")
+
+        ukify_cmd += " --devicetree %s" % dtb_path
+
+    # Add option to pass a config file to sign the UKI.
+    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
+        ukify_cmd += " --config=%s" % d.getVar('UKI_CONFIG_FILE')
+        ukify_cmd += " --tools=%s%s/lib/systemd/tools" % (d.getVar("RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
+        bb.note("Pulling keys from config file")
+    else: 
+        bb.note("Generating unsigned UKI")
+
+    # Custom UKI name
+    output = " --output=%s" % d.getVar('UKI_FILENAME')
+    ukify_cmd += " %s" % output
+
+    # Set env to determine where bitbake should look for dynamic libraries
+    env = os.environ.copy() # get the env variables
+    env['LD_LIBRARY_PATH'] = d.expand("${RECIPE_SYSROOT_NATIVE}/usr/lib/systemd:${LD_LIBRARY_PATH}")
+    
+    # Run the ukify command
+    subprocess.check_call(ukify_cmd, env=env, shell=True)
+}
+ 
+inherit deploy
+
+do_deploy () {
+    # Copy generated UKI into DEPLOYDIR
+	install ${B}/${UKI_FILENAME} ${DEPLOYDIR}
+}
+
+addtask uki before do_deploy do_image after do_rootfs
+addtask deploy before do_build after do_compile
\ No newline at end of file
diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
index 8d5cf13095..65f132abb8 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -6,6 +6,9 @@ PE = "1"
 
 DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
 
+# The Ukify tool requires this module
+DEPENDS:append:class-native = " python3-pefile-native"
+
 SECTION = "base/shell"
 
 inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
@@ -18,6 +21,8 @@ REQUIRED_DISTRO_FEATURES += "usrmerge"
 # that we don't build both udev and systemd in world builds.
 REQUIRED_DISTRO_FEATURES += "systemd"
 
+REQUIRED_DISTRO_FEATURES:class-native = ""
+
 SRC_URI += " \
            <a class="moz-txt-link-freetext" href="file://touchscreen.rules">file://touchscreen.rules</a> \
            <a class="moz-txt-link-freetext" href="file://00-create-volatile.conf">file://00-create-volatile.conf</a> \
@@ -120,6 +125,8 @@ PACKAGECONFIG:remove:libc-musl = " \
 # <a class="moz-txt-link-freetext" href="https://github.com/seccomp/libseccomp/issues/347">https://github.com/seccomp/libseccomp/issues/347</a>
 PACKAGECONFIG:remove:mipsarch = "seccomp"
 
+PACKAGECONFIG:class-native = "serial-getty-generator openssl tpm2 efi"
+
 TARGET_CC_ARCH:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 -D_LARGEFILE64_SOURCE"
 
 # Some of the dependencies are weak-style recommends - if not available at runtime,
@@ -260,6 +267,9 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dloadkeys-path=${bindir}/loadkeys \
                   -Dsetfont-path=${bindir}/setfont"
 
+EXTRA_OEMESON:append:class-native = " -Dbootloader=true \
+                                      -Dman=false \
+                                    "
 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??= "60"
 
@@ -380,6 +390,14 @@ do_install() {
     fi
 }
 
+do_install:class-native() {
+	meson_do_install
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
+	install -d ${D}${prefix}/lib/systemd/tools
+	install -m 0755 ${B}/systemd-measure ${D}${prefix}/lib/systemd/tools
+}
+
 python populate_packages:prepend (){
     systemdlibdir = d.getVar("rootlibdir")
     do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
@@ -702,6 +720,9 @@ RRECOMMENDS:${PN} += "systemd-extra-utils \
                       ${@bb.utils.contains('PACKAGECONFIG', 'logind', 'pam-plugin-umask', '', d)} \
 "
 
+RRECOMMENDS:${PN}:class-native = ""
+RDEPENDS:${PN}:class-native = ""
+
 INSANE_SKIP:${PN} += "dev-so libdir"
 INSANE_SKIP:${PN}-dbg += "libdir"
 INSANE_SKIP:${PN}-doc += " libdir<a class="moz-txt-link-rfc2396E" href="mailto:@@-852,3+873,5@@pkg_postinst:udev-hwdb(){pkg_prerm:udev-hwdb(){rm-f$D${sysconfdir}/udev/hwdb.bin}++BBCLASSEXTEND+=">"
@@ -852,3 +873,5 @@ pkg_postinst:udev-hwdb () {
 pkg_prerm:udev-hwdb () {
 	rm -f $D${sysconfdir}/udev/hwdb.bin
 }
+
+BBCLASSEXTEND += "</a>native"
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#187017): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/187017">https://lists.openembedded.org/g/openembedded-core/message/187017</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/101106095/4354175">https://lists.openembedded.org/mt/101106095/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------fKWwhr7fA0J2pUQGncNOM50A--

