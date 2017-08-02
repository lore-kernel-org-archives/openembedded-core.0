Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8A76B77CF9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 15:31:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 02 Aug 2017 08:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,312,1498546800"; d="scan'208";a="118732709"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 02 Aug 2017 08:31:02 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 18:27:30 +0300
Message-Id: <20170802152731.15076-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170802152731.15076-1-alexander.kanavin@linux.intel.com>
References: <20170802152731.15076-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/4] libid3tag: fix build with gperf 3.1
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
X-List-Received-Date: Wed, 02 Aug 2017 15:31:01 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-Fix-gperf-3.1-incompatibility.patch       | 40 ++++++++++++++++++++++
 .../libid3tag/libid3tag_0.15.1b.bb                 |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch b/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
new file mode 100644
index 00000000000..54f49f6f235
--- /dev/null
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
@@ -0,0 +1,40 @@
+From 91fcf66b9182c75cd2b96d88991d5a1c6307d4b4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 2 Aug 2017 16:27:52 +0300
+Subject: [PATCH] Fix gperf 3.1 incompatibility.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ compat.h    | 2 +-
+ frametype.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/compat.h b/compat.h
+index 8af71ec..b3d80d9 100644
+--- a/compat.h
++++ b/compat.h
+@@ -34,7 +34,7 @@ struct id3_compat {
+ };
+ 
+ struct id3_compat const *id3_compat_lookup(register char const *,
+-					   register unsigned int);
++					   register size_t);
+ 
+ int id3_compat_fixup(struct id3_tag *);
+ 
+diff --git a/frametype.h b/frametype.h
+index dd064b2..b5b7593 100644
+--- a/frametype.h
++++ b/frametype.h
+@@ -37,6 +37,6 @@ extern struct id3_frametype const id3_frametype_unknown;
+ extern struct id3_frametype const id3_frametype_obsolete;
+ 
+ struct id3_frametype const *id3_frametype_lookup(register char const *,
+-						 register unsigned int);
++						 register size_t);
+ 
+ # endif
+-- 
+2.13.2
+
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index e920926bc3d..f6139d6124f 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -12,7 +12,8 @@ PR = "r7"
 SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
            file://addpkgconfig.patch \
            file://obsolete_automake_macros.patch \
-"
+           file://0001-Fix-gperf-3.1-incompatibility.patch \
+           "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
 UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
 
-- 
2.13.2


