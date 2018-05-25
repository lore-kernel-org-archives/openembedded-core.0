Return-Path: <okonopli@cisco.com>
X-Greylist: delayed 592 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 May 2018 14:06:54 UTC
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 72CFD747A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 14:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3687; q=dns/txt; s=iport;
	t=1527257216; x=1528466816;
	h=from:to:cc:subject:date:message-id;
	bh=2XHtuO5mwwRSAmFkTkWEpk3ySBCua5D8lpM/KuUdVo0=;
	b=GhydUW2GYPOMETAGscMQRW9mOqMyFnBQSSrWFLT9dXOCRBeKhogrumK2
	DHptVaBvQhofZUsK2Kkmflz4ed+FWjYVe/GESOIfi9zkN3HpDdzh8zkSb
	CPLyTcNri3IHRrKGifZZ+ObVfQdCY+fiWxNy+E/1dAyXPPAxHCpf8OPC4 E=;
X-IronPort-AV: E=Sophos;i="5.49,440,1520899200"; 
   d="scan'208";a="4095037"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2018 13:57:03 +0000
Received: from KBP1-LDL-F65060.cisco.com ([10.61.213.152])
	(authenticated bits=0)
	by aer-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w4PDuv6t003377
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Fri, 25 May 2018 13:57:02 GMT
From: Oleksii Konoplitskyi <okonopli@cisco.com>
To: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Date: Fri, 25 May 2018 16:56:48 +0300
Message-Id: <1527256608-28290-1-git-send-email-okonopli@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: okonopli@cisco.com
Subject: [PATCH] initramfs-framework: add nfsrootfs module
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
X-List-Received-Date: Fri, 25 May 2018 14:06:54 -0000

nfsrootfs module mounts rootfs via nfs parsing "nfsroot" and "ip" cmdline options.

Signed-off-by: Oleksii Konoplitskyi <okonopli@cisco.com>
---
 .../initrdscripts/initramfs-framework/nfsrootfs    | 48 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  7 ++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
new file mode 100644
index 0000000..e67ee4c
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+nfsrootfs_enabled() {
+	if [ ${bootparam_root} != "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]; then
+		return 1
+	fi
+	return 0
+}
+
+nfsrootfs_run() {
+	local nfs_opts
+	local location
+	local flags
+	local server_ip
+
+	nfs_opts=""
+	if [ "${bootparam_nfsroot#*,}" != "${bootparam_nfsroot}" ]; then
+		nfs_opts="-o ${bootparam_nfsroot#*,}"
+	fi
+
+	location="${bootparam_nfsroot%%,*}"
+	if [ "${location#*:}" = "${location}" ]; then
+		# server-ip not given. Get server ip from ip option
+		server_ip=""
+		if [ "${bootparam_ip#*:}" != "${bootparam_ip}" ]; then
+			server_ip=$(echo "$bootparam_ip" | cut -d: -f2)
+		fi
+
+		if [ -z "$server_ip" ]; then
+			fatal "Server IP is not set. Update ip or nfsroot options."
+		fi
+		location=${server_ip}:${location}
+	fi
+
+	flags="-o nolock"
+	if [ -n "$bootparam_ro" ] && ! echo "$bootparam_rootflags" | grep -w -q "ro"; then
+		if [  -n "$bootparam_rootflags" ]; then
+			bootparam_rootflags="$bootparam_rootflags,"
+		fi
+		bootparam_rootflags="${bootparam_rootflags}ro"
+	fi
+	if [ -n "$bootparam_rootflags" ]; then
+		flags="$flags -o $bootparam_rootflags"
+	fi
+
+	mount -t nfs ${flags} ${nfs_opts} ${location} ${ROOTFS_DIR}
+}
+
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 75d965f..6337b99 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -9,6 +9,7 @@ inherit allarch
 
 SRC_URI = "file://init \
            file://exec \
+           file://nfsrootfs \
            file://rootfs \
            file://finish \
            file://mdev \
@@ -24,6 +25,7 @@ do_install() {
 
     # base
     install -m 0755 ${WORKDIR}/init ${D}/init
+    install -m 0755 ${WORKDIR}/nfsrootfs ${D}/init.d/85-nfsrootfs
     install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
     install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
 
@@ -53,6 +55,7 @@ PACKAGES = "${PN}-base \
             initramfs-module-mdev \
             initramfs-module-udev \
             initramfs-module-e2fs \
+            initramfs-module-nfsrootfs \
             initramfs-module-rootfs \
             initramfs-module-debug \
            "
@@ -83,6 +86,10 @@ SUMMARY_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystem
 RDEPENDS_initramfs-module-e2fs = "${PN}-base"
 FILES_initramfs-module-e2fs = "/init.d/10-e2fs"
 
+SUMMARY_initramfs-module-nfsrootfs = "initramfs support for locating and mounting the root partition via nfs"
+RDEPENDS_initramfs-module-nfsrootfs = "${PN}-base"
+FILES_initramfs-module-nfsrootfs = "/init.d/85-nfsrootfs"
+
 SUMMARY_initramfs-module-rootfs = "initramfs support for locating and mounting the root partition"
 RDEPENDS_initramfs-module-rootfs = "${PN}-base"
 FILES_initramfs-module-rootfs = "/init.d/90-rootfs"
-- 
2.7.4


