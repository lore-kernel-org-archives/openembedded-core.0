Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC0A608C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 03:04:09 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf11so6172975pab.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 20:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GyCO/HFsHdwVRAGwrZpJCV4wb5qZayx7HqtI5nqb6lA=;
	b=DqWMg0dy3g4VrGs3OZcVv2oic8CfCRibLa1p++AaUeO9AeZzUtioYiS9CbRf9AYN3d
	vht8c3pP+STHOEeaUQldmD0qgLxjnJqttiSwO3KLcdmSPdRZanLEKjmJoU04UcR6cxQW
	KCFUNm0ptNmc1I1wEvaxiOWCayzykLWJV+Og83wxYp/Vqbfwrdo1RJKLWcuErFpKJZ+z
	R4BX1nS7GoraEevPkD0R+e/wBZjJuQQ5ZZOsoaCFEmU3FdVRp/zjVUmDrXdpyvAf8IPy
	f01dJ4O0xCLltiew8L/kvNrBKgzuqU3q5hWw6H0nK6SaVNrLrRa4TR28ni/y+guMEqxM
	bgmw==
X-Received: by 10.66.178.229 with SMTP id db5mr20848181pac.105.1373425450310; 
	Tue, 09 Jul 2013 20:04:10 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id b4sm31196642pba.45.2013.07.09.20.04.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Jul 2013 20:04:09 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2013 13:19:45 +1000
Message-Id: <1373426385-14516-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] boot-directdisk: allow specifying custom MBR disk signature
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
X-List-Received-Date: Wed, 10 Jul 2013 03:04:09 -0000

This introduces a DISK_SIGNATURE variable that allows controlling the
32-bit MBR disk signature. By default it is set to an automatically
generated disk signature but it may by overridden in the image recipe
by setting DISK_SIGNATURE to a 8 digit hex string.

This DISK_SIGNATURE variable can also be used in the image recipe to
specify the root by UUID using:
SYSLINUX_ROOT = "root=PARTUUID=${DISK_SIGNATURE}-02"

Specifying the root by UUID allows the kernel to locate the root
filesystem even if the device name changes (e.g. /dev/hda2, /dev/hdb2 or
/dev/sdb2 instead of /dev/sda2) due to differences in hardware
configuration.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 3169043..182957b 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -34,6 +34,7 @@ BOOTDD_EXTRA_SPACE ?= "16384"
 # Get the build_syslinux_cfg() function from the syslinux class
 
 AUTO_SYSLINUXCFG = "1"
+DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
@@ -80,6 +81,9 @@ build_boot_dd() {
 	parted $IMAGE set 1 boot on 
 	parted $IMAGE print
 
+	echo -ne "$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')" | \
+		dd of=$IMAGE bs=1 seek=440 conv=notrunc
+
 	OFFSET=`expr $END2 / 512`
 	dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
 	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
@@ -91,8 +95,24 @@ build_boot_dd() {
 } 
 
 python do_bootdirectdisk() {
+    validate_disk_signature(d)
     bb.build.exec_func('build_syslinux_cfg', d)
     bb.build.exec_func('build_boot_dd', d)
 }
 
+def generate_disk_signature():
+    import uuid
+
+    return str(uuid.uuid4())[:8]
+
+def validate_disk_signature(d):
+    import re
+
+    disk_signature = d.getVar("DISK_SIGNATURE", True)
+
+    if not re.match(r'^[0-9a-fA-F]{8}$', disk_signature):
+        bb.fatal("DISK_SIGNATURE '%s' must be an 8 digit hex string" % disk_signature)
+
+DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
+
 addtask bootdirectdisk before do_build
-- 
1.8.3.2


