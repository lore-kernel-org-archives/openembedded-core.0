Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 49FB677032
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:35 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so27987800igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=mqzYsH8DPMeO9RkKHuhBjoixJp0bWlzf2G+w7HWHFAY=;
	b=Yb6Ty86/jDB7U2YAOggE9OPVuOuOkURGcCzx2pecdVDkndH2x+4yNmnd8RUvWWNuSs
	kfAo+mvpKy47mR9/i5wvF8jwrRbeBHE9dHVdqWbnx8am22Slw4vVF2BxvKw3DaiLiQba
	YG5oxqf2CU2S69Mk4ofMbwf3oTyEbeEbChR8OdPNHDQgvKbluM1h+/zUKo6mC8dGPjX8
	QTI3pb0O6MDl1GfrZ0LJGkFO4k8Avff97XuIeT5XjVdghtyzXwBIpncn5mBGlyTQKAr5
	iUfibHwJrnvoTpL0wRBh7XylRdG5K0Bu+s7XBrDUwoLQzJUcWfGbnNXK9v59gqfCUOKv
	fQIg==
X-Gm-Message-State: ALoCoQmFS2OrnhYCGvJks0oJc8dPinIt2blwN2tcxOOCZldPUf7v8Eb5NUjw2h1NeBcVjd6nHj22
X-Received: by 10.50.7.37 with SMTP id g5mr4044925iga.85.1441208916026;
	Wed, 02 Sep 2015 08:48:36 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122]) by smtp.gmail.com with ESMTPSA id
	o189sm17258398ioe.30.2015.09.02.08.48.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:35 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:42 +0200
Message-Id: <418d709aa1e521129210d2f6d5cbd0fc6011fc1c.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
References: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 06/10] initramfs-framework: support live images
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:36 -0000

Now initramfs-framework can be used as a replacement for
initramfs-live-boot. The "live" module was copied from init-live.sh
and adapted to the framework.

The intended usage is like this:

INITRAMFS_IMAGE = "core-image-minimal-initramfs"

PACKAGE_INSTALL_remove_pn-core-image-minimal-initramfs = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi"

PACKAGE_INSTALL_append_pn-core-image-minimal-initramfs = " \
   initramfs-module-udev \
   initramfs-module-e2fs \
   initramfs-module-debug \
   initramfs-module-live \
   udev-extraconf \
"

SYSLINUX_LABELS_remove = "install"

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../initrdscripts/initramfs-framework/live         | 131 +++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |   9 ++
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/live

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/live b/meta/recipes-core/initrdscripts/initramfs-framework/live
new file mode 100644
index 0000000..42125f7
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/live
@@ -0,0 +1,131 @@
+#!/bin/sh
+#
+# Corresponds to and derived from initramfs-live-boot's "live" init-live.
+#
+# It will wait until a (potentially removable) disk with
+# a "rootfs.img" file on it shows up, then loop-mount that
+# file as rootfs.
+#
+# Relies on "udev" or "mdev" having run already.
+#
+# To skip this module in an initramfs which needs to support live
+# images as well as regular partitions, boot with "root" kernel
+# parameter set to something other than /dev/ram0 (the value set
+# by image-live.bbclass for SYSLINUX_ROOT, which then becomes the root
+# kernel parameter).
+
+LIVE_ROOT_IMAGE="rootfs.img"
+LIVE_ISOLINUX=""
+LIVE_ROOT_DISK=""
+LIVE_FAILURE_TIMEOUT=5
+
+live_enabled() {
+    if [ -n "$bootparam_root" ] && [ "$bootparam_root" != "/dev/ram0" ]; then
+        return 1
+    fi
+}
+
+live_run() {
+    if [ -n "$ROOTFS_DIR" ]; then
+	msg "Waiting for removable media..."
+        C=0
+        while true
+        do
+            for i in `ls /run/media 2>/dev/null`; do
+                if [ -f /run/media/$i/$LIVE_ROOT_IMAGE ] ; then
+		    found="yes"
+		    LIVE_ROOT_DISK="$i"
+		    break
+	        elif [ -f /run/media/$i/isolinux/$LIVE_ROOT_IMAGE ]; then
+		    found="yes"
+		    LIVE_ISOLINUX="isolinux"
+		    LIVE_ROOT_DISK="$i"
+		    break
+                fi
+            done
+            if [ "$found" = "yes" ]; then
+                break;
+            fi
+            # don't wait for more than "shelltimeout" seconds, if it's set
+            if [ -n "$bootparam_shelltimeout" ]; then
+                msg -n " " $(( $bootparam_shelltimeout - $C ))
+                if [ $C -ge $bootparam_shelltimeout ]; then
+                    msg "..."
+	            msg "Mounted filesystems"
+                    mount | grep media
+                    msg "Available block devices"
+                    cat /proc/partitions
+                    msg "Cannot find $LIVE_ROOT_IMAGE file in /run/media/* , giving up booting live image in $LIVE_FAILURE_TIMEOUT seconds"
+                    # Sleep a bit because continuing to boot may
+                    # generate further output that pushes the
+                    # important message of the screen. init-live
+                    # starts a shell at this point (hence the
+                    # parameter name). With initramfs-framework, use
+                    # shell=after:live to achieve something similar.
+                    sleep $LIVE_FAILURE_TIMEOUT
+                    break
+                fi
+                C=$(( C + 1 ))
+            fi
+            sleep 1
+        done
+
+        if [ "$found" = "yes" ]; then
+            mknod /dev/loop0 b 7 0 2>/dev/null
+
+            if ! mount -o rw,loop,noatime,nodiratime /run/media/$LIVE_ROOT_DISK/$LIVE_ISOLINUX/$LIVE_ROOT_IMAGE $ROOTFS_DIR ; then
+	        fatal "Could not mount rootfs image"
+            fi
+
+            if touch $ROOTFS_DIR/bin 2>/dev/null; then
+	        # The root image is read-write, directly boot it up.
+	        return
+            fi
+
+            # determine which unification filesystem to use
+            union_fs_type=""
+            if grep -q -w "overlayfs" /proc/filesystems; then
+	        union_fs_type="overlayfs"
+            elif grep -q -w "aufs" /proc/filesystems; then
+	        union_fs_type="aufs"
+            else
+	        union_fs_type=""
+            fi
+
+            # make a union mount if possible
+            case $union_fs_type in
+	        "overlayfs")
+	            mkdir -p /rootfs.ro /rootfs.rw
+	            if ! mount -n --move $ROOTFS_DIR /rootfs.ro; then
+		        rm -rf /rootfs.ro /rootfs.rw
+		        fatal "Could not move rootfs mount point"
+	            else
+		        mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+		        mount -t overlayfs -o "lowerdir=/rootfs.ro,upperdir=/rootfs.rw" overlayfs $ROOTFS_DIR
+		        mkdir -p $ROOTFS_DIR/rootfs.ro $ROOTFS_DIR/rootfs.rw
+		        mount --move /rootfs.ro $ROOTFS_DIR/rootfs.ro
+		        mount --move /rootfs.rw $ROOTFS_DIR/rootfs.rw
+	            fi
+	            ;;
+	        "aufs")
+	            mkdir -p /rootfs.ro /rootfs.rw
+	            if ! mount -n --move $ROOTFS_DIR /rootfs.ro; then
+		        rm -rf /rootfs.ro /rootfs.rw
+		        fatal "Could not move rootfs mount point"
+	            else
+		        mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+		        mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro" aufs $ROOTFS_DIR
+		        mkdir -p $ROOTFS_DIR/rootfs.ro $ROOTFS_DIR/rootfs.rw
+		        mount --move /rootfs.ro $ROOTFS_DIR/rootfs.ro
+		        mount --move /rootfs.rw $ROOTFS_DIR/rootfs.rw
+	            fi
+	            ;;
+	        "")
+	            mount -t tmpfs -o rw,noatime,mode=755 tmpfs $ROOTFS_DIR/media
+	            ;;
+            esac
+        fi
+    else
+	debug "No rootfs has been set"
+    fi
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 6c37b9a..7eccc08 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "file://init \
            file://mdev \
            file://udev \
            file://e2fs \
+           file://live \
            file://debug"
 
 S = "${WORKDIR}"
@@ -32,6 +33,9 @@ do_install() {
     # e2fs
     install -m 0755 ${WORKDIR}/e2fs ${D}/init.d/10-e2fs
 
+    # live image booting
+    install -m 0755 ${WORKDIR}/live ${D}/init.d/15-live
+
     # debug
     install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
 
@@ -45,6 +49,7 @@ PACKAGES = "${PN}-base \
             initramfs-module-mdev \
             initramfs-module-udev \
             initramfs-module-e2fs \
+            initramfs-module-live \
             initramfs-module-debug"
 
 FILES_${PN}-base = "/init /init.d/99-finish /dev"
@@ -61,6 +66,10 @@ SUMMARY_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystem
 RDEPENDS_initramfs-module-e2fs = "${PN}-base"
 FILES_initramfs-module-e2fs = "/init.d/10-e2fs"
 
+SUMMARY_initramfs-module-live = "initramfs live image support"
+RDEPENDS_initramfs-module-live = "${PN}-base"
+FILES_initramfs-module-live = "/init.d/15-live"
+
 SUMMARY_initramfs-module-debug = "initramfs dynamic debug support"
 RDEPENDS_initramfs-module-debug = "${PN}-base"
 FILES_initramfs-module-debug = "/init.d/00-debug"
-- 
2.1.4


