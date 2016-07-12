Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 378FF6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 13:24:35 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id m101so16069088ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 06:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=IogZx/5QurDz0uf+LngeeAVuD70qBAW0vnpLM+Xn/VY=;
	b=njMpzu3RM9z4xbDxgXPfD2Vg7QUF+qN7O3BnlnyN277DWdr32IiVSjISdWw/3J6qQp
	tPLcdjL8fn+V/gSKIqHqjNtMiNvZiAcnKFyY31K3zr7X1tG2BGZKU4aQ8nHEJHsc+eVP
	EFvaELYaWuV+KSohRGohTYOwgwTIWBOH/qbZini+THE+uWlQ7qWlrmYGwv5eOmfSnNQP
	kQCSE1+GJvB7KDJCSIA/iqO7bRyOwhFTkO51MEvFg9j+Giqk4j6pO5d5Ei+T2YPJyCxU
	v7C2MjQfybBTjtBT+Lz0vWD9/A7JJ9VSvRMV1JjHJecYqBFpJBXjgaQJoAw5wwY4Xkzc
	bDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IogZx/5QurDz0uf+LngeeAVuD70qBAW0vnpLM+Xn/VY=;
	b=i0vem4n8gDAD85IR9QaxB/O0AjDo277xefznEjPo7mHzRBphGOll31TYs7J+4+eBKn
	Km1MBfn70u1hwhRzM4wiad+tElhMf+N/BOVU2msE0YYP5fGJxSrSZnUPhtYA3klZyfe6
	HdHjSJUhp7z4h2qXQ5rzW8f8Lrk3DAEVaU2/04uuGnq3M5KKm75i4BUhBC6jRWOnnHnz
	XSTVHW2WZUDDh4vx1UMwVvE6eo/wZVsRpP/2fy7LZPNUmizlLAjYQ9UYVWD8VU1UYQdi
	YHI5BY42l7j59t6osO76S+yy6uqibCf7WX4zGSF4YB582vhCsf6Pen1Dautm6Sfkn5lZ
	BOfw==
X-Gm-Message-State: ALyK8tLfkyyE3Y2sYJY4rtaxXQI+1UkRLOwqCPepEkoRV0xo6i1q2UpJcVEAeIfXLEaXCKRo
X-Received: by 10.107.155.145 with SMTP id d139mr2973739ioe.36.1468329876337; 
	Tue, 12 Jul 2016 06:24:36 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com
	(host-091-097-029-052.ewe-ip-backbone.de. [91.97.29.52])
	by smtp.gmail.com with ESMTPSA id
	h193sm4482015ioe.40.2016.07.12.06.24.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jul 2016 06:24:35 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 15:24:26 +0200
Message-Id: <1468329867-32055-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] initramfs-framework: make rootfs module optional
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
X-List-Received-Date: Tue, 12 Jul 2016 13:24:36 -0000

It still gets installed by default via RRECOMMENDS without having to update
users of the framework (because without it, the framework is incomplete),
but that recommendation can be overridden on a per-image basis.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../recipes-core/initrdscripts/initramfs-framework_1.0.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 89e153d..67a1b04 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -47,9 +47,18 @@ PACKAGES = "${PN}-base \
             initramfs-module-mdev \
             initramfs-module-udev \
             initramfs-module-e2fs \
+            initramfs-module-rootfs \
             initramfs-module-debug"
 
-FILES_${PN}-base = "/init /init.d/90-rootfs /init.d/99-finish /dev"
+FILES_${PN}-base = "/init /init.d/99-finish /dev"
+
+# 99-finish in base depends on some other module which mounts
+# the rootfs, like 90-rootfs. To replace that default, use
+# BAD_RECOMMENDATIONS += "initramfs-module-rootfs" in your
+# initramfs recipe and install something else, or install
+# something that runs earlier (for example, a 89-my-rootfs)
+# and mounts the rootfs. Then 90-rootfs will proceed immediately.
+RRECOMMENDS_${PN}-base += "initramfs-module-rootfs"
 
 SUMMARY_initramfs-module-mdev = "initramfs support for mdev"
 RDEPENDS_initramfs-module-mdev = "${PN}-base busybox-mdev"
@@ -63,6 +72,10 @@ SUMMARY_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystem
 RDEPENDS_initramfs-module-e2fs = "${PN}-base"
 FILES_initramfs-module-e2fs = "/init.d/10-e2fs"
 
+SUMMARY_initramfs-module-rootfs = "initramfs support for locating and mounting the root partition"
+RDEPENDS_initramfs-module-rootfs = "${PN}-base"
+FILES_initramfs-module-rootfs = "/init.d/90-rootfs"
+
 SUMMARY_initramfs-module-debug = "initramfs dynamic debug support"
 RDEPENDS_initramfs-module-debug = "${PN}-base"
 FILES_initramfs-module-debug = "/init.d/00-debug"
-- 
2.6.2


