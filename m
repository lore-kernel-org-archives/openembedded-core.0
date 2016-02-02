Return-Path: <alexandru.but@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 163F177264
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 18:05:28 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u12I5S38011016 for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 12:05:28 -0600
Received: from zdravan.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020212052843-566416 ;
	Tue, 2 Feb 2016 12:05:28 -0600 
From: Alexandru But <alexandru.but@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 2 Feb 2016 20:05:08 +0200
Message-Id: <1454436308-29949-1-git-send-email-alexandru.but@ni.com>
X-Mailer: git-send-email 2.6.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/02/2016 12:05:28 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/02/2016 12:05:28 PM,
	Serialize complete at 02/02/2016 12:05:28 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-02_11:, , signatures=0
Subject: [PATCH] linux-libc-headers: backport uapi header list
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
X-List-Received-Date: Tue, 02 Feb 2016 18:05:34 -0000

nvme uapi header was renamed from nvme.h to nvme_ioctl.h in linux 4.4, but the
header list was not updated. This causes efivar (and maybe other) package build
to fail. This should fix the build while the commit is backported in the
kernel.

Signed-off-by: Alexandru But <alexandru.but@ni.com>
---
 ...i-update-install-list-after-nvme.h-rename.patch | 34 ++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_4.4.bb   |  4 +++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-uapi-update-install-list-after-nvme.h-rename.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-uapi-update-install-list-after-nvme.h-rename.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-uapi-update-install-list-after-nvme.h-rename.patch
new file mode 100644
index 0000000..4d9f5a1
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-uapi-update-install-list-after-nvme.h-rename.patch
@@ -0,0 +1,34 @@
+From a9cf8284b45110a4d98aea180a89c857e53bf850 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sun, 10 Jan 2016 20:14:11 -0500
+Subject: [PATCH] uapi: update install list after nvme.h rename
+
+Commit 9d99a8dda154 ("nvme: move hardware structures out of the uapi
+version of nvme.h") renamed nvme.h to nvme_ioctl.h, but the uapi list
+still refers to nvme.h.  People trying to install the headers hit a
+failure as the header no longer exists.
+
+Cc: stable@vger.kernel.org
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+Reviewed-by: Christoph Hellwig <hch@lst.de>
+Signed-off-by: Jens Axboe <axboe@fb.com>
+---
+ include/uapi/linux/Kbuild | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
+index 628e6e6..88e1292 100644
+--- a/include/uapi/linux/Kbuild
++++ b/include/uapi/linux/Kbuild
+@@ -306,7 +306,7 @@ header-y += nfs_mount.h
+ header-y += nl80211.h
+ header-y += n_r3964.h
+ header-y += nubus.h
+-header-y += nvme.h
++header-y += nvme_ioctl.h
+ header-y += nvram.h
+ header-y += omap3isp.h
+ header-y += omapfb.h
+-- 
+2.6.1
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb
index 3763dc0..c8c7a10 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb
@@ -5,5 +5,9 @@ SRC_URI_append_libc-musl = "\
     file://0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch \
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
    "
+SRC_URI_append ="\
+    file://0001-uapi-update-install-list-after-nvme.h-rename.patch \
+   "
+
 SRC_URI[md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
 SRC_URI[sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
-- 
2.6.1


