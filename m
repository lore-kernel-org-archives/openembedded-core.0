Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3E76379DBC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 12:16:12 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p4-v6so5405209plo.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 04:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=yqtvOOk2eT9ltXHKu1G7tNDSfE1h+QwZqMdDceTTkfo=;
	b=gf1JyvwOGQvQOx9cOqA+SfDlKNDovZDZuX+w7MVAn4Qv25PyFbs7FNBKQdnOQDK9bc
	rKGw239BUYrX2G5ZRV2LVhJos+R1xg9axOaBbldtcJrmM3yijNzT0PBeOHkAgL3L0Mc3
	u2cb/SqoVKFhYnTyjqOOqZ/NArQhryI17+2cFZaLGkHAFUqMMv5mPgp9Cia6OLEfAulr
	kLyQ4NaUeLLyLDVZQN95+sH7KwwFNL6a2fEFX/jG4Zmf0oU0lkqOs319h1KoOsNyyrUS
	3KKpzh2sgFhMyF37SciNG2ilEondWnvHw6ipB7DZ5Kbpci1POByxUELn0yLk/2UdEGK7
	km5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=yqtvOOk2eT9ltXHKu1G7tNDSfE1h+QwZqMdDceTTkfo=;
	b=KcneR4J3blrrufxPnqxlHk4XfhGn3aooNuMPN0UwXyMWiddq6G8B4O4nEzRaRCXNVp
	PQ5ATxVIWRg6OsA9zp/5wqNgx6T7APS84Ghe0Yx87tc7632v3gjso2EQicqkkhHKSSUn
	t8d5dLVhK4y+S2z+PDXK5QQiwgi5M91xmA2TZswZLP/nGWiXV7LjTTd4Oic2h7tHfq5T
	Pq0/2sCPJsMnUCRD/IBzU11c4YGS8cgJXj0Um6SZ56mYzLVxz2b5VS+l0otGYWpd+ehU
	Kpf11F85YzumAK0O/6WqUJaXYlDt8GoFmYH7rMjR5+qYvLPb5BUcP3y6KHpYocHD+pIx
	/A3g==
X-Gm-Message-State: AGRZ1gKspSUESMhLCbLVnvOdn0srwQwxU3pr3RUm2rEr6hWNwTFfttdr
	UDOfpTuskZowDtWmgP9BXi9gmIi+Y2o=
X-Google-Smtp-Source: AJdET5cdhlCq1rh6Q3IMTBJK9LMcfpzvGsv4iYdjgkmu8Fhdpo+spOAkten0ptodH+OByQ4mGwc1Eg==
X-Received: by 2002:a17:902:e10f:: with SMTP id
	cc15-v6mr1654140plb.309.1541592972852; 
	Wed, 07 Nov 2018 04:16:12 -0800 (PST)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	g3-v6sm640523pgr.40.2018.11.07.04.16.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Nov 2018 04:16:11 -0800 (PST)
Date: Wed, 07 Nov 2018 12:16:02 +0000
Message-Id: <20181107121602.13768-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/2] kernel-initramfs.bbclass: Separate initramfs setup
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
X-List-Received-Date: Wed, 07 Nov 2018 12:16:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This change moves the initramfs bundling functions and tasks into a
separate class called 'kernel-initramfs'. The change also converts the
copy_initramfs into a task that itself depends on the do_image_complete
of the initramfs image. Making this change allows for the do_initramfs_*
tasks to be conditionally added instead of relying on the task checking
the variables, with the exception of do_deploy(_append).

The 'use_alternate_initrd' of kernel_do_compile is replaced with a
general use 'extra_make' variable. And the INITRAMFS_TASK functionality
of kernel_do_compile is removed.

The 'KERNEL_CLASSES' inherit is moved to after the EXPORT_FUNCTIONS
do_deploy in order to allow these classes to append to the do_deploy
task without breaking the do_deploy task itself.

The functionality for INITRAMFS_TASK remained for backwards
compatibility when the bundle changes were introduced. The bundle
functionality has been available for a number of releases since, as such
this change does not carry forward the functionality of INITRAMFS_TASK.
The information regarding INITRAMFS_TASK issues for is kept along with
the generation of a bb.fatal when a user attempts to use it.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/kernel-initramfs.bbclass | 114 +++++++++++++++++++++++++
 meta/classes/kernel.bbclass           | 155 +++++-----------------------------
 2 files changed, 133 insertions(+), 136 deletions(-)
 create mode 100644 meta/classes/kernel-initramfs.bbclass

diff --git a/meta/classes/kernel-initramfs.bbclass b/meta/classes/kernel-initramfs.bbclass
new file mode 100644
index 0000000000..b23fb51495
--- /dev/null
+++ b/meta/classes/kernel-initramfs.bbclass
@@ -0,0 +1,114 @@
+
+INITRAMFS_IMAGE ?= ""
+INITRAMFS_IMAGE_NAME ?= "${@'${INITRAMFS_IMAGE}-${MACHINE}' if d.getVar('INITRAMFS_IMAGE') else ''}"
+INITRAMFS_IMAGE_BUNDLE ?= ""
+
+python __anonymous () {
+    # NOTE: setting INITRAMFS_TASK was for backward compatibility
+    #       The preferred method is to set INITRAMFS_IMAGE, because
+    #       this INITRAMFS_TASK has circular dependency problems
+    #       if the initramfs requires kernel modules
+    if d.getVar('INITRAMFS_TASK'):
+        bb.fatal("The INITRAMFS_TASK variable is no longer supported. Use INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE.")
+
+    image = d.getVar("INITRAMFS_IMAGE")
+    bundle = oe.types.boolean(d.getVar("INITRAMFS_IMAGE_BUNDLE") or "0")
+    if image and bundle:
+        # add all the tasks
+        bb.build.addtask('do_initramfs_copy', 'do_initramfs_bundle', 'do_install', d)
+        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_copy', d)
+
+        # make the do_initramfs_copy task depend on the image do_image_complete task
+        d.appendVarFlag('do_initramfs_copy', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+}
+
+do_initramfs_copy[dirs] = "${B}"
+do_initramfs_copy () {
+    echo "Copying initramfs into ./usr ..."
+    # In case the directory is not created yet from the first pass compile:
+    mkdir -p ${B}/usr
+    # Find and use the first initramfs image archive type we find
+    rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
+    for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
+        if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
+            cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
+            case $img in
+            *gz)
+                echo "gzip decompressing image"
+                gunzip -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
+                break
+                ;;
+            *lz4)
+                echo "lz4 decompressing image"
+                lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
+                break
+                ;;
+            *lzo)
+                echo "lzo decompressing image"
+                lzop -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
+                break
+                ;;
+            *lzma)
+                echo "lzma decompressing image"
+                lzma -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
+                break
+                ;;
+            *xz)
+                echo "xz decompressing image"
+                xz -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
+                break
+                ;;
+            esac
+        fi
+    done
+    if [ ! -e ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ]; then
+        bbfatal "Failed to copy initramfs cpio for image ${INITRAMFS_IMAGE_NAME}"
+    fi
+    echo "Finished copy of initramfs into ./usr"
+}
+
+do_initramfs_bundle[dirs] = "${B}"
+do_initramfs_bundle () {
+    echo "Creating a kernel image with a bundled initramfs..."
+    # Backing up kernel image relies on its type(regular file or symbolic link)
+    tmp_path=""
+    for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
+        if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
+            linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`
+            realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`
+            mv -f $realpath $realpath.bak
+            tmp_path=$tmp_path" "$imageType"#"$linkpath"#"$realpath
+        elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
+            mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.bak
+            tmp_path=$tmp_path" "$imageType"##"
+        fi
+    done
+    extra_make=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
+    kernel_do_compile
+    # Restoring kernel image
+    for tp in $tmp_path ; do
+        imageType=`echo $tp|cut -d "#" -f 1`
+        linkpath=`echo $tp|cut -d "#" -f 2`
+        realpath=`echo $tp|cut -d "#" -f 3`
+        if [ -n "$realpath" ]; then
+            mv -f $realpath $realpath.initramfs
+            mv -f $realpath.bak $realpath
+            ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
+        else
+            mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
+            mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
+        fi
+    done
+}
+
+do_deploy_append () {
+    if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+        for imageType in ${KERNEL_IMAGETYPES} ; do
+            initramfs_base_name=${imageType}-${INITRAMFS_NAME}
+            initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
+            install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
+            ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+        done
+    fi
+}
+
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e04d2fe004..c0e9452ca6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -20,10 +20,6 @@ OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
 INHIBIT_DEFAULT_DEPS = "1"
 
 KERNEL_IMAGETYPE ?= "zImage"
-INITRAMFS_IMAGE ?= ""
-INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
-INITRAMFS_TASK ?= ""
-INITRAMFS_IMAGE_BUNDLE ?= ""
 
 # KERNEL_VERSION is extracted from source code. It is evaluated as
 # None for the first parsing, since the code has not been fetched.
@@ -93,37 +89,8 @@ python __anonymous () {
         d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
         d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
-
-    image = d.getVar('INITRAMFS_IMAGE')
-    if image:
-        d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
-
-    # NOTE: setting INITRAMFS_TASK is for backward compatibility
-    #       The preferred method is to set INITRAMFS_IMAGE, because
-    #       this INITRAMFS_TASK has circular dependency problems
-    #       if the initramfs requires kernel modules
-    image_task = d.getVar('INITRAMFS_TASK')
-    if image_task:
-        d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
 }
 
-# Here we pull in all various kernel image types which we support.
-#
-# In case you're wondering why kernel.bbclass inherits the other image
-# types instead of the other way around, the reason for that is to
-# maintain compatibility with various currently existing meta-layers.
-# By pulling in the various kernel image types here, we retain the
-# original behavior of kernel.bbclass, so no meta-layers should get
-# broken.
-#
-# KERNEL_CLASSES by default pulls in kernel-uimage.bbclass, since this
-# used to be the default behavior when only uImage was supported. This
-# variable can be appended by users who implement support for new kernel
-# image types.
-
-KERNEL_CLASSES ?= " kernel-uimage "
-inherit ${KERNEL_CLASSES}
-
 # Old style kernels may set ${S} = ${WORKDIR}/git for example
 # We need to move these over to STAGING_KERNEL_DIR. We can't just
 # create the symlink in advance as the git fetcher can't cope with
@@ -188,90 +155,10 @@ KERNEL_EXTRA_ARGS ?= ""
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 KERNEL_ALT_IMAGETYPE ??= ""
 
-copy_initramfs() {
-	echo "Copying initramfs into ./usr ..."
-	# In case the directory is not created yet from the first pass compile:
-	mkdir -p ${B}/usr
-	# Find and use the first initramfs image archive type we find
-	rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
-	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
-		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
-			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
-			case $img in
-			*gz)
-				echo "gzip decompressing image"
-				gunzip -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			*lz4)
-				echo "lz4 decompressing image"
-				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			*lzo)
-				echo "lzo decompressing image"
-				lzop -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			*lzma)
-				echo "lzma decompressing image"
-				lzma -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			*xz)
-				echo "xz decompressing image"
-				xz -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
-				break
-				;;
-			esac
-		fi
-	done
-	echo "Finished copy of initramfs into ./usr"
-}
-
-do_bundle_initramfs () {
-	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		echo "Creating a kernel image with a bundled initramfs..."
-		copy_initramfs
-		# Backing up kernel image relies on its type(regular file or symbolic link)
-		tmp_path=""
-		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
-				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`
-				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`
-				mv -f $realpath $realpath.bak
-				tmp_path=$tmp_path" "$imageType"#"$linkpath"#"$realpath
-			elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
-				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.bak
-				tmp_path=$tmp_path" "$imageType"##"
-			fi
-		done
-		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
-		kernel_do_compile
-		# Restoring kernel image
-		for tp in $tmp_path ; do
-			imageType=`echo $tp|cut -d "#" -f 1`
-			linkpath=`echo $tp|cut -d "#" -f 2`
-			realpath=`echo $tp|cut -d "#" -f 3`
-			if [ -n "$realpath" ]; then
-				mv -f $realpath $realpath.initramfs
-				mv -f $realpath.bak $realpath
-				ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
-			else
-				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
-				mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
-			fi
-		done
-	fi
-}
-do_bundle_initramfs[dirs] = "${B}"
-
 python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_install before do_deploy
-
 get_cc_option () {
 		# Check if KERNEL_CC supports the option "file-prefix-map".
 		# This option allows us to build images with __FILE__ values that do not
@@ -302,22 +189,10 @@ kernel_do_compile() {
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
-	# The $use_alternate_initrd is only set from
-	# do_bundle_initramfs() This variable is specifically for the
-	# case where we are making a second pass at the kernel
-	# compilation and we want to force the kernel build to use a
-	# different initramfs image.  The way to do that in the kernel
-	# is to specify:
-	# make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
-	if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
-		# The old style way of copying an prebuilt image and building it
-		# is turned on via INTIRAMFS_TASK != ""
-		copy_initramfs
-		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
-	fi
 	cc_extra=$(get_cc_option)
+	# extra_make is set via users of kernel_do_compile like do_initramfs_bundle
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $extra_make
 	done
 	# vmlinux.gz is not built by kernel
 	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
@@ -679,15 +554,6 @@ kernel_do_deploy() {
 		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
 		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
-
-	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		for imageType in ${KERNEL_IMAGETYPES} ; do
-			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
-			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
-			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
-		done
-	fi
 }
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
@@ -697,5 +563,22 @@ addtask deploy after do_populate_sysroot do_packagedata
 
 EXPORT_FUNCTIONS do_deploy
 
+# Here we pull in all various kernel image types which we support.
+#
+# In case you're wondering why kernel.bbclass inherits the other image
+# types instead of the other way around, the reason for that is to
+# maintain compatibility with various currently existing meta-layers.
+# By pulling in the various kernel image types here, we retain the
+# original behavior of kernel.bbclass, so no meta-layers should get
+# broken.
+#
+# KERNEL_CLASSES by default pulls in kernel-uimage.bbclass, since this
+# used to be the default behavior when only uImage was supported. This
+# variable can be appended by users who implement support for new kernel
+# image types.
+
+KERNEL_CLASSES ?= " kernel-uimage kernel-initramfs "
+inherit ${KERNEL_CLASSES}
+
 # Add using Device Tree support
 inherit kernel-devicetree
---
2.19.1

