Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzSb-0006Ls-R5
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:58:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734220734"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:55:50 -0700
Message-Id: <bf95413b1958790c02c1e116621da04a42738a84.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 15:16:21 -0700
Date: Fri, 15 Apr 2011 23:55:49 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 57/58] slang: Update to 2.2.4
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
X-List-Received-Date: Sat, 16 Apr 2011 06:58:26 -0000

From: Saul Wold <sgw@linux.intel.com>

- Removed fix-uclibc.patch as it's no longer required by the upstream
- Removed requirment for png as we only need limited support for slang
- fix license
- disable Parallel Make

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/slang/slang/fix-uclibc.patch |   11 -----------
 .../slang/{slang_2.2.2.bb => slang_2.2.4.bb}       |   18 ++++++++++--------
 2 files changed, 10 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-extended/slang/slang/fix-uclibc.patch
 rename meta/recipes-extended/slang/{slang_2.2.2.bb => slang_2.2.4.bb} (61%)

diff --git a/meta/recipes-extended/slang/slang/fix-uclibc.patch b/meta/recipes-extended/slang/slang/fix-uclibc.patch
deleted file mode 100644
index c2b8225..0000000
--- a/meta/recipes-extended/slang/slang/fix-uclibc.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- slang-2.1.3.orig/src/slcommon.c	2007-01-10 18:09:07.000000000 +0200
-+++ slang-2.1.3.orig/src/slcommon.c	2008-03-19 16:09:09.000000000 +0200
-@@ -191,7 +191,7 @@ 
-    return p;
- }
- 
--#if !defined(HAVE_ISSETUGID) && defined(__GLIBC__) && (__GLIBC__ >= 2)
-+#if !defined(HAVE_ISSETUGID) && defined(__GLIBC__) && (__GLIBC__ >= 2) && !defined(__UCLIBC__)
- extern int __libc_enable_secure;
- # define HAVE___LIBC_ENABLE_SECURE 1
- #endif
diff --git a/meta/recipes-extended/slang/slang_2.2.2.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
similarity index 61%
rename from meta/recipes-extended/slang/slang_2.2.2.bb
rename to meta/recipes-extended/slang/slang_2.2.4.bb
index 29d9e46..2b000a4 100644
--- a/meta/recipes-extended/slang/slang_2.2.2.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -10,23 +10,25 @@ to recode S-Lang procedures in C if you need to."
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "pcre"
-PR = "r2"
+PR = "r5"
 
-LICENSE = "GPL Artistic"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
 
 
-SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/OLD/slang-${PV}.tar.bz2 \
-           file://fix-uclibc.patch"
+SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
+          "
 
 inherit autotools
 
-SRC_URI[md5sum] = "974437602a781cfe92ab61433dd16d03"
-SRC_URI[sha256sum] = "cfaf8551fa3855f9b0043309bb553ef6d457f931b404df5a6ba6a5a69371fc42"
+SRC_URI[md5sum] = "7fcfd447e378f07dd0c0bae671fe6487"
+SRC_URI[sha256sum] = "9a8257a9a2a55099af858b13338dc8f3a06dd2069f46f0df2c9c3bb84a01d5db"
 
-EXTRA_OECONF += " --x-includes=${STAGING_DIR_HOST}/usr/X11/include"
+EXTRA_OECONF += " --without-png"
 do_install() {
 	oe_runmake install DESTDIR=${D} -e 'INST_LIB_DIR=${STAGING_DIR_HOST}/usr/lib'
 }
 
 FILES_${PN} += "${datadir}/slsh/"
+
+PARALLEL_MAKE = ""
-- 
1.7.1.1



