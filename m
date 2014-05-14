Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9955F6A3F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 21:38:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 May 2014 14:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1054,1389772800"; d="scan'208";a="540535044"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.149])
	by orsmga002.jf.intel.com with ESMTP; 14 May 2014 14:38:38 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 14:36:43 -0700
Message-Id: <6c587dec0715ed0d57e597503bc0864fe26ccb13.1400103108.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <50a2c132892ea8660f03f8cde3265599f79f2dd8.1400103108.git.max.eliaser@intel.com>
References: <50a2c132892ea8660f03f8cde3265599f79f2dd8.1400103108.git.max.eliaser@intel.com>
In-Reply-To: <cover.1400103108.git.max.eliaser@intel.com>
References: <cover.1400103108.git.max.eliaser@intel.com>
Subject: [PATCH 3/3] native/cross recipes use texinfo-dummy-native; target arch use host's Texinfo.
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
X-List-Received-Date: Wed, 14 May 2014 21:38:38 -0000

To unpack that to more than a single line: -native and -cross recipes are made
to use the dummy Texinfo utilities provided by texinfo-dummy-native if they
invoke those utilities at build time. The target-architecture (cross-compiled)
recipes still use the genuine Texinfo utilites. Right now, they still use
the host system's Texinfo utilities, but could be made to use the
texinfo-native recipe we already ship with some config file changes.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 meta/classes/texinfo.bbclass | 15 ++++++++++++++-
 meta/conf/bitbake.conf       |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/texinfo.bbclass b/meta/classes/texinfo.bbclass
index 60cba0f..92efbcc 100644
--- a/meta/classes/texinfo.bbclass
+++ b/meta/classes/texinfo.bbclass
@@ -1,2 +1,15 @@
 # This class is inherited by recipes whose upstream packages invoke the
-# texinfo utilities at build-time. This class currently does nothing.
+# texinfo utilities at build-time. Native and cross recipes are made to use the
+# dummy scripts provided by texinfo-dummy-native, for improved performance. 
+# Target architecture recipes use the genuine Texinfo utilities. By default, 
+# they use the Texinfo utilities on the host system. If you want to use the
+# Texinfo recipe shipped with yoco, you can remove texinfo-native from 
+# ASSUME_PROVIDED and makeinfo from SANITY_REQUIRED_UTILITIES.
+
+TEXDEP = "texinfo-native"
+TEXDEP_class-native = "texinfo-dummy-native"
+TEXDEP_class-cross = "texinfo-dummy-native"
+DEPENDS_append = " ${TEXDEP}"
+PATH_prepend_class-native = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
+PATH_prepend_class-cross = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
+
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 66f435f..889b547 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -180,6 +180,7 @@ ASSUME_PROVIDED = "\
     python-native-runtime \
     tar-native \
     virtual/libintl-native \
+    texinfo-native\
     "
 # gzip-native should be listed above?
 
-- 
1.8.3.2


