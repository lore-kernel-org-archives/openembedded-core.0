Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CAD43608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 12:56:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2016 05:56:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="71787026"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2016 05:56:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 14:52:04 +0200
Message-Id: <1458737525-32487-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/2] make, remake: make them properly exclude each other
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
X-List-Received-Date: Wed, 23 Mar 2016 12:56:19 -0000

Remake and make can't be installed at the same time as they're both installing
a header file with the same name.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/default-providers.inc     | 3 ++-
 meta/recipes-devtools/make/make.inc                | 2 ++
 meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ba85c78..5801b67 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -15,6 +15,8 @@ PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
 PREFERRED_PROVIDER_virtual/base-utils ?= "busybox"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
+PREFERRED_PROVIDER_virtual/make ?= "make"
+PREFERRED_PROVIDER_virtual/make-native ?= "make-native"
 
 #
 # Default virtual runtime providers
@@ -43,7 +45,6 @@ PREFERRED_PROVIDER_opkg-native ?= "opkg-native"
 PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
-PREFERRED_PROVIDER_make ?= "make"
 PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
 # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
 # on this rather strange entry.
diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index 57ea605..849b742 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -8,3 +8,5 @@ SECTION = "devel"
 SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2"
 
 inherit autotools gettext pkgconfig texinfo
+
+PROVIDES = "virtual/make"
diff --git a/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb b/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
index 30f29e0..8eab7e3 100644
--- a/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
+++ b/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
@@ -15,7 +15,7 @@ DEPENDS += "readline guile"
 # By default only "gettext-minimal-native" is added
 # when inherit gettext.
 DEPENDS_class-native += "gettext-native"
-PROVIDES += "make"
+PROVIDES += "virtual/make"
 
 do_configure_prepend() {
     # remove the default LINGUAS since we are not going to generate languages
-- 
2.7.0


