Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id A13E371BEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 14:21:14 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id g8nRh9NRb6ogsg8nShn6mj; Wed, 26 Jun 2019 15:21:14 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Y62GTSWN c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=dq6fvYVFJ5YA:10 a=kmYkUENqAAAA:8 a=mK_AVkanAAAA:8 a=J0Tn2xNtAAAA:8
	a=loft0Ffgz4a93OYoWrQA:9 a=p9kz6gysRiz6SGr9lVkz:22
	a=3gWm3jAn84ENXaBijsEo:22 a=9ZcRxastL33iXWX1AWsW:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1hg8nQ-0001fq-5h; Wed, 26 Jun 2019 15:21:12 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 15:21:08 +0100
Message-Id: <20190626142108.2554-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIF0D94I5ZnK7aoRUzP141Wcnj5P0CZUKESseeNBnFM95osKp2Pozwo3O2AgwOWCoMV8dJ7Q5Dnu6At3jsGK+og8wRNKjKHjlsMiMqdCfWvbg7v3Ajo5
	OFgBtMvzI0FaFDXkAVIW9YWHZCsDndJ+it+rLGL/jk1oYBWAIyTzAb2W
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] busybox: Include complete fix for CVE-2011-5325
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
X-List-Received-Date: Wed, 26 Jun 2019 14:21:15 -0000
Content-Transfer-Encoding: 8bit

It looks like not all the parts required for fixing CVE-2011-5325 made
it into oe-core master before the recipe was upgraded to the upstream
fixed version.

The partial fix meant that symlinks deemed unsafe enough to delay were
never actually realized. This backport from upstream fixes the
problem.
---
 .../busybox/busybox/CVE-2011-5325-fix2.patch  | 32 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2011-5325-fix2.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2011-5325-fix2.patch b/meta/recipes-core/busybox/busybox/CVE-2011-5325-fix2.patch
new file mode 100644
index 0000000000..85218a7427
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2011-5325-fix2.patch
@@ -0,0 +1,32 @@
+From d9503224c8a93a30b0c8627084b2744d3ee6f403 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Fri, 30 Mar 2018 20:18:12 +0200
+Subject: [PATCH] cpio: extract "unsafe" symlinks the same way tar/unzip does
+
+function                                             old     new   delta
+cpio_main                                            588     596      +8
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport from 1.29.0 [https://git.busybox.net/busybox/commit/?id=d9503224c8a93a30b0c8627084b2744d3ee6f403]
+
+---
+ archival/cpio.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/archival/cpio.c b/archival/cpio.c
+index 1d6cbd1e2..308ec1b25 100644
+--- a/archival/cpio.c
++++ b/archival/cpio.c
+@@ -508,6 +508,8 @@ int cpio_main(int argc UNUSED_PARAM, char **argv)
+ 	while (get_header_cpio(archive_handle) == EXIT_SUCCESS)
+ 		continue;
+
++	create_symlinks_from_list(archive_handle->symlink_placeholders);
++
+ 	if (archive_handle->cpio__blocks != (off_t)-1
+ 	 && !(opt & OPT_QUIET)
+ 	) {
+--
+2.20.1
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 716a0650fc..b127e3d375 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://makefile-libbb-race.patch \
            file://CVE-2011-5325.patch \
            file://CVE-2011-5325-fix.patch \
+           file://CVE-2011-5325-fix2.patch \
            file://CVE-2017-15873.patch \
            file://busybox-CVE-2017-16544.patch \
            file://busybox-fix-lzma-segfaults.patch \
-- 
2.20.1


