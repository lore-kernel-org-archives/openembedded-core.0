Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.5545.1599821836166994556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 03:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=nQMq1eCG;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5663A20716E9
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 03:57:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5663A20716E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1599821835;
	bh=itvGHo5YV9MdtQR7dQUarvAjZxvElTkb6Oy/GGi2pC4=;
	h=From:To:Subject:Date:From;
	b=nQMq1eCGbPPCTeO66gEX7KOEqVtGTAsnPtyNTZH6uWDxJ4uxG9uMN+8s+HoEVd/Jz
	 BD6auNuFfM4K0OREsp8rQ/INGd9WjCgreFBKsrtApOrhHYRg8Mp7KNQBSmtJCURJGv
	 AiYaHk3Q5wN7OmXfNuoZ2geyycmYRTZ7sywWRBcY=
From: pemorrow@linux.microsoft.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] squashfs-tools: Allow COMP_DEFAULT to be changed easily at build time
Date: Fri, 11 Sep 2020 03:56:57 -0700
Message-Id: <1599821817-27585-1-git-send-email-pemorrow@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

The default compression algorithm is gzip, this patch allows the default
to be changed via a bbappend file by setting SQUASHFS_TOOLS_COMP_DEFAULT
to a valid compression algorithm.

Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
---
 ...ols-Allow-COMP_DEFAULT-to-be-overridden-v.patch | 34 ++++++++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb           |  8 +++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch

diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
new file mode 100644
index 0000000..5f12c42
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
@@ -0,0 +1,34 @@
+From d2d9b517696f5950597f5b60ae8fdade5b7c14a9 Mon Sep 17 00:00:00 2001
+From: Peter Morrow <pemorrow@linux.microsoft.com>
+Date: Fri, 4 Sep 2020 15:43:15 +0100
+Subject: [PATCH] squashfs-tools: Allow COMP_DEFAULT to be overridden via make
+ cmdline
+
+Currently the only way to modify the default compression algorithm is to
+modify the Makefile. It is useful to be able to set the default compression
+algorithm via the make command line since otherwise a build time search
+replace operation needs to be performed on the Makefile.
+
+Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/pull/93 ]
+
+Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
+---
+ squashfs-tools/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
+index aee4b96..7425605 100644
+--- a/squashfs-tools/Makefile
++++ b/squashfs-tools/Makefile
+@@ -85,7 +85,7 @@ GZIP_SUPPORT = 1
+ # in Mksquashfs.  Obviously the compression algorithm must have been
+ # selected to be built
+ #
+-COMP_DEFAULT = gzip
++COMP_DEFAULT ?= gzip
+ 
+ 
+ ###############################################
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index b06951d..3c816cb 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -9,6 +9,7 @@ PV = "4.4"
 SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
            file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
+           file://0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch;striplevel=2 \
 "
 
 S = "${WORKDIR}/git/squashfs-tools"
@@ -25,6 +26,13 @@ PACKAGECONFIG[xattr] = "XATTR_SUPPORT=1,XATTR_SUPPORT=0,attr"
 PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
 PACKAGECONFIG[reproducible] = "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
 
+python () {
+    # Change the default compression algorithm if requested.
+    comp_default = d.getVar('SQUASHFS_TOOLS_COMP_DEFAULT')
+    if comp_default != None:
+        d.appendVar('EXTRA_OEMAKE', ' COMP_DEFAULT=%s' % comp_default)
+}
+
 do_compile() {
 	oe_runmake all
 }
-- 
1.8.3.1

