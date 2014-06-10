Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B1986FA9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 20:26:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jun 2014 13:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1011,1392192000"; d="scan'208";a="526412539"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.65])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2014 13:26:07 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jun 2014 13:24:16 -0700
Message-Id: <4b7de930ed0850b747248daf99495d5779d7156d.1402431641.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <b97d1bf2c6f7e8d73245d24c8a2bad9d47b54e20.1402431641.git.max.eliaser@intel.com>
References: <b97d1bf2c6f7e8d73245d24c8a2bad9d47b54e20.1402431641.git.max.eliaser@intel.com>
In-Reply-To: <cover.1402431641.git.max.eliaser@intel.com>
References: <cover.1402431641.git.max.eliaser@intel.com>
Subject: [PATCH 3/3] texinfo.bbclass: native/cross uses dummy texinfo; target uses host's Texinfo.
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
X-List-Received-Date: Tue, 10 Jun 2014 20:26:10 -0000

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
index 1d70d3c..cd6f940 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -181,6 +181,7 @@ ASSUME_PROVIDED = "\
     python-native-runtime \
     tar-native \
     virtual/libintl-native \
+    texinfo-native\
     "
 # gzip-native should be listed above?
 
-- 
1.8.3.2


