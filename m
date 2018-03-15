Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5E4600EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 05:39:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2018 22:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,308,1517904000"; d="scan'208";a="24208171"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.221.20.23])
	by fmsmga007.fm.intel.com with ESMTP; 14 Mar 2018 22:39:06 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 13:38:56 +0800
Message-Id: <1521092336-25489-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3: add readline to PACKAGECONFIG
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
X-List-Received-Date: Thu, 15 Mar 2018 05:39:07 -0000

Provide a way to make readline dependency optional in case someone
might want to use BSD alternative editline instead.

Using editline would need some changes though (python issue13501).

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.4.bb b/meta/recipes-devtools/python/python3_3.5.4.bb
index a94d009..9815d50 100644
--- a/meta/recipes-devtools/python/python3_3.5.4.bb
+++ b/meta/recipes-devtools/python/python3_3.5.4.bb
@@ -1,6 +1,6 @@
 require recipes-devtools/python/python.inc
 
-DEPENDS = "python3-native libffi bzip2 gdbm openssl readline sqlite3 zlib virtual/libintl xz"
+DEPENDS = "python3-native libffi bzip2 gdbm openssl sqlite3 zlib virtual/libintl xz"
 
 PR = "${INC_PR}.0"
 PYTHON_MAJMIN = "3.5"
@@ -76,6 +76,9 @@ export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dy
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
+PACKAGECONFIG ??= "readline"
+PACKAGECONFIG[readline] = ",,readline"
+
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
 	autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
-- 
2.7.4


