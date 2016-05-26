Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AA74E6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:01:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 07:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="975020283"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 07:01:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 17:00:47 +0300
Message-Id: <7ecb2980eef42a8f54d05ca1335abc5828a49bbc.1464271067.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/6] gobject-introspection.bbclass: disable introspection for -native and -nativesdk recipes
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
X-List-Received-Date: Thu, 26 May 2016 14:01:13 -0000

It is not necessary for those targets, adds to the build time, and pulls
in the unneeded qemu-native dependency.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gobject-introspection.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 2d73e40..cc7ca5a 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -3,13 +3,23 @@
 # This sets up autoconf-based recipes to build introspection data (or not),
 # depending on distro and machine features (see gobject-introspection-data class).
 inherit gobject-introspection-data
-EXTRA_OECONF_prepend = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
+EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
+
+# When building native recipes, disable introspection, as it is not necessary,
+# pulls in additional dependencies, and makes build times longer
+EXTRA_OECONF_prepend_class-native = "--disable-introspection "
+EXTRA_OECONF_prepend_class-nativesdk = "--disable-introspection "
 
 UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-DEPENDS_append = " gobject-introspection gobject-introspection-native qemu-native"
+DEPENDS_append_class-target = " gobject-introspection gobject-introspection-native qemu-native"
+
+# Even though introspection is disabled on -native, gobject-introspection package is still
+# needed for m4 macros.
+DEPENDS_append_class-native = " gobject-introspection-native"
+DEPENDS_append_class-nativesdk = " gobject-introspection-native"
 
 # This is necessary for python scripts to succeed - distutils fails if these
 # are not set
-- 
2.8.1


