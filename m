Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 20EA671D7E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 12:51:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 05:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="1163544026"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2017 05:51:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 15:51:48 +0300
Message-Id: <20170502125151.5095-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
References: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/6] vala: upgrade to 0.36.2
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
X-List-Received-Date: Tue, 02 May 2017 12:51:58 -0000

Make libxslt-native dependency conditional on api-documentation distro feature,
as vala now defaults to rebuilding the manual (which is slow).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/vala.inc                           | 7 ++++++-
 meta/recipes-devtools/vala/{vala_0.34.4.bb => vala_0.36.2.bb} | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.34.4.bb => vala_0.36.2.bb} (56%)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index b338ea097af..1261c02777f 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -2,7 +2,12 @@ SUMMARY = "C#-like programming language for easing GObject programming"
 DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
 Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
 SECTION = "devel"
-DEPENDS = "bison-native flex-native libxslt-native glib-2.0"
+DEPENDS = "bison-native flex-native glib-2.0"
+
+# Appending libxslt-native to dependencies has an effect
+# of rebuilding the manual, which is very slow. Let's do this
+# only when api-documentation distro feature is enabled.
+DEPENDS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'libxslt-native', '', d)}"
 
 # vala-native contains a native version of vapigen, which we use instead of the target one
 DEPENDS_append_class-target = " vala-native"
diff --git a/meta/recipes-devtools/vala/vala_0.34.4.bb b/meta/recipes-devtools/vala/vala_0.36.2.bb
similarity index 56%
rename from meta/recipes-devtools/vala/vala_0.34.4.bb
rename to meta/recipes-devtools/vala/vala_0.36.2.bb
index d1b49aea7d1..9cea5b6a795 100644
--- a/meta/recipes-devtools/vala/vala_0.34.4.bb
+++ b/meta/recipes-devtools/vala/vala_0.36.2.bb
@@ -4,5 +4,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
              file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
 "
 
-SRC_URI[md5sum] = "a856989d749fc5e472a3592b96f9ca48"
-SRC_URI[sha256sum] = "6b17bd339414563ebc51f64b0b837919ea7552d8a8ffa71cdc837d25c9696b83"
+SRC_URI[md5sum] = "481774eb4f0f5aa6987e5ea30a0aea31"
+SRC_URI[sha256sum] = "863dbfb399d59289dfc34379c0cd34d94e505a49787497550588810310cdf689"
-- 
2.11.0


