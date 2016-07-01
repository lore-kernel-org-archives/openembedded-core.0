Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0DB60621
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 13:53:57 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id t74so100919484ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wqLrlOupv6l5uWZPNFCMrcr5BbIR4CPdGooMJaz3LAg=;
	b=oYo6mfapKvZQWyDjM7dEFJH8xMJXJd3qjQJziv5xaw/Kjy+gaeoR4durMYiUvPfImh
	Q2jG4Iu03qIu2tZn3k4bJJYCQusrI8Pq9Xlv410+dimLLpeeljUPDYbGUiUBueSyJyJz
	VinAGC8afaKurRNsB+4tubEcs7ljUocZVIPm5H0mKir2rruYl3+qnfBtdOgBDWAtkPj9
	QKpB3ePSp+JGAsl2z+PTcNNvWMfoNfl1XVlLaOb49U2ftbaBL/6GSwYak6Tuaua2g6e8
	52zhjgCgoo1OtHCoVORnxcl6lyCelCbgUg4v//wrW6wmE1qhJKZU8mG4iS6rhQZO0nQ+
	86yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wqLrlOupv6l5uWZPNFCMrcr5BbIR4CPdGooMJaz3LAg=;
	b=O8WvGCM8SA685jQ+/LzxKYncKVCHyu3ES6lAikJD/UahZ8IzDNJH+KbLHUptm9QWc9
	JQrrjWiXMzw37oiZi8ITLDF+92sFrEpTz/M/iwBfPTrb38AWQ/OfvWu7vFuNaxtiLpXi
	rzxZ4jhpz/epufoFWZr+XjVSSNZOdpjoFTogA7r0dGPw9MRvaI0GEi+Nfprl0iyDDiWJ
	eroFPAfHQuCU53M3hUPSGH8SeICGyx3SsWCh7sHC+/tQTFaEWakuFixbbGWTEf2Nz5WG
	MfCjzmEnHK/WGrmZVx9bA1OcHOj3jFF8E1+x7hcw3XTio8hY0C+qQE6HwkyF2UODe/o/
	/rPQ==
X-Gm-Message-State: ALyK8tK0rxjgjTxaMefj8GL6SgZNwui5y4rkEVSi8patU0hWs+7IvAjAfIlQdfXXW978wLWZ
X-Received: by 10.107.59.201 with SMTP id i192mr19951471ioa.89.1467381238602; 
	Fri, 01 Jul 2016 06:53:58 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56DC4.dip0.t-ipconnect.de.
	[87.165.109.196])
	by smtp.gmail.com with ESMTPSA id f85sm2066194ita.6.2016.07.01.06.53.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 06:53:57 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 15:53:51 +0200
Message-Id: <25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1467378176.git.patrick.ohly@intel.com>
References: <cover.1467378176.git.patrick.ohly@intel.com>
Subject: [PATCH 1/2] meta-ostro-fixes: initramfs-framework: add retry loop for slow boot devices (like USB)
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
X-List-Received-Date: Fri, 01 Jul 2016 13:53:58 -0000

On some hardware platforms (Gigabyte, qemu), detection of USB devices
by the kernel is slow enough such that it happens only after the first
attempt to mount the rootfs. We need to keep trying for a while
(default: 5s seconds, controlled by roottimeout=<seconds>) and sleep
between each attempt (default: one second, rootdelay=<seconds>).

This change intentionally splits finding the rootfs (in the new
"rootfs") and switching to it ("finish"). That is needed to keep udev
running while waiting for the rootfs, because it shuts down before
"finish" starts. It is also the direction that was discussed on the OE
mailing list for future changes to initramfs-framework (like
supporting a "live CD" module, which would replace or further augment
mounting of the rootfs).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../initrdscripts/initramfs-framework/finish       | 33 -------------
 .../initrdscripts/initramfs-framework/rootfs       | 57 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  4 +-
 3 files changed, 60 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/rootfs

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index d09bbb8..717383e 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -8,39 +8,6 @@ finish_enabled() {
 
 finish_run() {
 	if [ -n "$ROOTFS_DIR" ]; then
-		if [ -n "$bootparam_rootdelay" ]; then
-			debug "Sleeping for $rootdelay second(s) to wait root to settle..."
-			sleep $bootparam_rootdelay
-		fi
-
-		if [ -n "$bootparam_root" ]; then
-			debug "No e2fs compatible filesystem has been mounted, mounting $bootparam_root..."
-
-			if [ "`echo ${bootparam_root} | cut -c1-5`" = "UUID=" ]; then
-				root_uuid=`echo $bootparam_root | cut -c6-`
-				bootparam_root="/dev/disk/by-uuid/$root_uuid"
-			fi
-
-			if [ -e "$bootparam_root" ]; then
-				flags=""
-				if [ -n "$bootparam_ro" ]; then
-					if [  -n "$bootparam_rootflags" ]; then
-						bootparam_rootflags="$bootparam_rootflags,"
-					fi
-					bootparam_rootflags="${bootparam_rootflags}ro"
-				fi
-				if [ -n "$bootparam_rootflags" ]; then
-					flags="$flags -o$bootparam_rootflags"
-				fi
-				if [ -n "$bootparam_rootfstype" ]; then
-					flags="$flags -t$bootparam_rootfstype"
-				fi
-				mount $flags $bootparam_root $ROOTFS_DIR
-			else
-				msg "root '$bootparam_root' doesn't exist."
-			fi
-		fi
-
 		if [ ! -d $ROOTFS_DIR/dev ]; then
 			fatal "ERROR: There's no '/dev' on rootfs."
 		fi
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
new file mode 100644
index 0000000..5790d8c
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -0,0 +1,57 @@
+#!/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+rootfs_enabled() {
+	return 0
+}
+
+rootfs_run() {
+        if [ -z "$ROOTFS_DIR" ]; then
+		return
+        fi
+	C=0
+	delay=${bootparam_rootdelay:-1}
+	timeout=${bootparam_roottimeout:-5}
+	while [ ! -d $ROOTFS_DIR/dev ]; do
+		if [ $(( $C * $delay )) -gt $timeout ]; then
+			fatal "root '$bootparam_root' doesn't exist or does not contain a /dev."
+		fi
+
+		if [ -n "$bootparam_root" ]; then
+			debug "No e2fs compatible filesystem has been mounted, mounting $bootparam_root..."
+
+			if [ "`echo ${bootparam_root} | cut -c1-5`" = "UUID=" ]; then
+				root_uuid=`echo $bootparam_root | cut -c6-`
+				bootparam_root="/dev/disk/by-uuid/$root_uuid"
+			fi
+
+			if [ -e "$bootparam_root" ]; then
+				flags=""
+				if [ -n "$bootparam_ro" ] && ! echo "$bootparam_rootflags" | grep -w -q "ro"; then
+					if [  -n "$bootparam_rootflags" ]; then
+						bootparam_rootflags="$bootparam_rootflags,"
+					fi
+					bootparam_rootflags="${bootparam_rootflags}ro"
+				fi
+				if [ -n "$bootparam_rootflags" ]; then
+					flags="$flags -o$bootparam_rootflags"
+				fi
+				if [ -n "$bootparam_rootfstype" ]; then
+					flags="$flags -t$bootparam_rootfstype"
+				fi
+				mount $flags $bootparam_root $ROOTFS_DIR
+				if [ -d $ROOTFS_DIR/dev ]; then
+					break
+				else
+					# It is unlikely to change, but keep trying anyway.
+					# Perhaps we pick a different device next time.
+					umount $ROOTFS_DIR
+					fi
+				fi
+		fi
+		debug "Sleeping for $delay second(s) to wait root to settle..."
+		sleep $delay
+		C=$(( $C + 1 ))
+	done
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index e5cf9cb..89e153d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -8,6 +8,7 @@ PR = "r2"
 inherit allarch
 
 SRC_URI = "file://init \
+           file://rootfs \
            file://finish \
            file://mdev \
            file://udev \
@@ -21,6 +22,7 @@ do_install() {
 
     # base
     install -m 0755 ${WORKDIR}/init ${D}/init
+    install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
     install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
 
     # mdev
@@ -47,7 +49,7 @@ PACKAGES = "${PN}-base \
             initramfs-module-e2fs \
             initramfs-module-debug"
 
-FILES_${PN}-base = "/init /init.d/99-finish /dev"
+FILES_${PN}-base = "/init /init.d/90-rootfs /init.d/99-finish /dev"
 
 SUMMARY_initramfs-module-mdev = "initramfs support for mdev"
 RDEPENDS_initramfs-module-mdev = "${PN}-base busybox-mdev"
-- 
2.1.4


