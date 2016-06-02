Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A7A9077399
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:49:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 02 Jun 2016 03:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114740364"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 03:49:36 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:49:32 +0300
Message-Id: <0948a4990dbf84db3529b68398e6d77297e035ae.1464863090.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464863090.git.jussi.kukkonen@intel.com>
References: <cover.1464863090.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/3] mtools: Patch out a useless sanity check
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
X-List-Received-Date: Thu, 02 Jun 2016 10:49:37 -0000

The sanity check is ensuring that filesystem size is divisible by
sectors-per-track. That seems to be just an optimization for ancient
media, and quite tricky to accomplish as different dosfstools versions
produce filesystems with different sectors-per-track.

Continue processing even if filesystem size is not divisible by
sectors-per-track.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...en-if-fs-size-is-not-divisible-by-sectors.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |  4 ++-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |  4 ++-
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/mtools/mtools/0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch

diff --git a/meta/recipes-devtools/mtools/mtools/0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch b/meta/recipes-devtools/mtools/mtools/0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch
new file mode 100644
index 0000000..4117d01
--- /dev/null
+++ b/meta/recipes-devtools/mtools/mtools/0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch
@@ -0,0 +1,34 @@
+From 5cc8d1f96ab6d3459e13631d8356f87381562352 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 2 Jun 2016 09:49:44 +0300
+Subject: [PATCH] Continue even if fs size is not divisible by
+ sectors-per-track
+
+Filesystem with a size that is not divisible by sectors-per-track is
+not broken or invalid: it might be unoptimized on media where
+heads and cylinders actually matter but that should be it.
+
+Preserve the warning but make mtools continue even if fs size is not
+divisible by sectors-per-track.
+
+Upstream-Status: Submitted [info-mtools@gnu.org]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ init.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/init.c b/init.c
+index c9152e0..4e16a01 100644
+--- a/init.c
++++ b/init.c
+@@ -338,7 +338,6 @@ Stream_t *fs_init(char drive, int mode, int *isRop)
+ 		fprintf(stderr,
+ 			"Add mtools_skip_check=1 to your .mtoolsrc file "
+ 			"to skip this test\n");
+-		exit(1);
+ 	}
+ 
+ 	/* full cylinder buffering */
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index 3423917..2904ff4 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -33,7 +33,9 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz
            file://mtools-makeinfo.patch \
            file://mtools.patch \
            file://no-x11.patch \
-           file://fix-broken-lz.patch"
+           file://fix-broken-lz.patch \
+           file://0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch \
+           "
 
 inherit autotools texinfo
 
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index efde547..b0efc9e 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -29,7 +29,9 @@ SRC_URI[sha256sum] = "59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-           file://no-x11.gplv3.patch"
+           file://no-x11.gplv3.patch \
+           file://0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch \
+           "
 
 
 inherit autotools texinfo
-- 
2.1.4


