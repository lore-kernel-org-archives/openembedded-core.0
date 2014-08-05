Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5E5260B05
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 17:26:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s75HQZI9013025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Aug 2014 10:26:35 -0700 (PDT)
Received: from yow-pgortmak-d4.wrs.com (128.224.56.60) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 5 Aug 2014 10:26:35 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Aug 2014 13:26:12 -0400
Message-ID: <1407259572-35454-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] util-linux: create an all encompassing package group
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
X-List-Received-Date: Tue, 05 Aug 2014 17:26:40 -0000
Content-Type: text/plain

Currently util-linux is fragmented into lots of small chunks,
and if one is looking to avoid using busybox wholesale, there
is currently no easy way to say "I want all of it".  Here we
create a packagegroup for all of the util-linux chunks, so
that it need not be duplicated by everyone wanting the same
overall goal of removing busybox.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-core/packagegroups/packagegroup-util-linux.bb b/meta/recipes-core/packagegroups/packagegroup-util-linux.bb
new file mode 100644
index 000000000000..54151502b176
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-util-linux.bb
@@ -0,0 +1,69 @@
+#
+# Copyright (C) 2014 Wind River
+#
+
+SUMMARY = "util-linux Packages"
+DESCRIPTION = "Packages created from util-linux"
+PR = "r0"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+PACKAGES = "\
+    packagegroup-util-linux \
+    packagegroup-util-linux-block \
+    packagegroup-util-linux-console \
+    packagegroup-util-linux-uid \
+    packagegroup-util-linux-misc \
+    packagegroup-util-linux-partition \
+    "
+
+RDEPENDS_packagegroup-util-linux = "\
+    packagegroup-util-linux-block \
+    packagegroup-util-linux-console \
+    packagegroup-util-linux-uid \
+    packagegroup-util-linux-misc \
+    packagegroup-util-linux-partition \
+    "
+
+RDEPENDS_packagegroup-util-linux-partition = "\
+    util-linux-fdisk \
+    util-linux-cfdisk \
+    util-linux-sfdisk \
+    util-linux-partx \
+    "
+
+RDEPENDS_packagegroup-util-linux-console = "\
+    util-linux-agetty \
+    util-linux-reset \
+    "
+
+RDEPENDS_packagegroup-util-linux-block = " \
+    util-linux-mkfs \
+    util-linux-mkfs.cramfs \
+    util-linux-fsck.cramfs \
+    util-linux-fstrim \
+    util-linux-fsck \
+    util-linux-blkid \
+    util-linux-libblkid \
+    util-linux-umount \
+    util-linux-mount \
+    util-linux-libmount \
+    util-linux-swaponoff \
+    "
+
+RDEPENDS_packagegroup-util-linux-uid = "\
+    util-linux-libuuid \
+    util-linux-uuidd \
+    util-linux-uuidgen \
+    util-linux-findfs \
+    "
+
+RDEPENDS_packagegroup-util-linux-misc = "\
+    util-linux-losetup \
+    util-linux-readprofile \
+    util-linux-lscpu \
+    util-linux-mcookie \
+    util-linux-bash-completion \
+    util-linux-hwclock \
+    "
-- 
1.9.1


