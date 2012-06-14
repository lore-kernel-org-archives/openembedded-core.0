Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfFsF-0005lC-70
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:38:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2012 12:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180153897"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2012 12:27:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 12:27:15 -0700
Message-Id: <251437abf9783ed91ab32116650c75551a436d07.1339701375.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 11/17] opkg 0.1.8: do_fetch failed since no checksum specified
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2012 19:38:31 -0000

From: Robert Yang <liezhi.yang@windriver.com>

* We use meta/recipes-devtools/opkg/opkg_svn.bb by default, the
  opkg_0.1.8.bb failed since no checksum specified.

* The add_vercmp.patch in both opkg/ and opkg-0.1.8/, remove the one
  in opkg-0.1.8/

This patch doesn't impact the output, so I think that we don't have to
increment the PR.

[YOCTO #2498]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../opkg/opkg-0.1.8/add_vercmp.patch               |   36 --------------------
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    3 ++
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch

diff --git a/meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch b/meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
deleted file mode 100644
index c3396d5..0000000
--- a/meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [other]
-
-Index: trunk/libopkg/opkg.c
-===================================================================
---- trunk.orig/libopkg/opkg.c	2010-01-26 20:32:19.000000000 +0000
-+++ trunk/libopkg/opkg.c	2010-01-26 20:40:34.000000000 +0000
-@@ -876,3 +876,18 @@
- 
- 	return ret;
- }
-+
-+int
-+opkg_compare_versions (const char *ver1, const char *ver2)
-+{
-+  pkg_t *pkg1, *pkg2;
-+
-+  pkg1 = pkg_new();
-+  pkg2 = pkg_new();
-+
-+  parse_version(pkg1, ver1);
-+  parse_version(pkg2, ver2);
-+
-+  return pkg_compare_versions(pkg1, pkg2);
-+}
-+
-Index: trunk/libopkg/opkg.h
-===================================================================
---- trunk.orig/libopkg/opkg.h	2010-01-26 20:32:19.000000000 +0000
-+++ trunk/libopkg/opkg.h	2010-01-26 20:35:19.000000000 +0000
-@@ -58,4 +58,6 @@
- 
- int opkg_repository_accessibility_check(void);
- 
-+int opkg_compare_versions (const char *ver1, const char *ver2);
-+
- #endif /* OPKG_H */
diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
index c206b37..901508a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
@@ -5,4 +5,7 @@ SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
            file://headerfix.patch \
           "
 
+SRC_URI[md5sum] = "c714ce0e4863bf1315e3b6913ffe3299"
+SRC_URI[sha256sum] = "ff94bf30bd662d49c4b5057e3a0818d062731adaa555d59abd677ec32a3c1c60"
+
 PR = "${INC_PR}.0"
-- 
1.7.7.6



