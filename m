Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4RiO-00008A-Sj
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 09:20:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2012 00:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,298,1344236400"; d="scan'208";a="137018183"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2012 00:08:21 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 09:13:10 +0300
Message-Id: <1345702391-27078-2-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345702391-27078-1-git-send-email-constantinx.musca@intel.com>
References: <1345702391-27078-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 1/2] telepathy-glib: update to 0.19.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 07:20:29 -0000

The 0001-Fix-a-race-in-_gen-reentrant-methods.list patch is
included in the 0.19.6 version.

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...Fix-a-race-in-_gen-reentrant-methods.list.patch |   42 --------------------
 ...thy-glib_0.19.2.bb => telepathy-glib_0.19.6.bb} |    9 ++---
 2 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.2.bb => telepathy-glib_0.19.6.bb} (68%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch b/meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
deleted file mode 100644
index 4f8ed2b..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8ff62dc34961e997fb0224517aef0f12d455a82b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 25 Jul 2012 12:58:16 +0100
-Subject: [PATCH] Fix a race in _gen/reentrant-methods.list
-
-Very occasionally, a parallel build will fail like this:
-
-| Making all in telepathy-glib
-| make[2]: Entering directory `/buildarea1/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/telepathy-glib-0.19.2-r0/telepathy-glib-0.19.2/telepathy-glib'
-| /bin/mkdir -p _gen
-| ( cd . && cat versions/0.7.0.abi [...] versions/0.19.2.abi  ) | \
-| 		/bin/grep '^tp_cli_.*_run_.*' > _gen/reentrant-methods.list.tmp
-| /bin/sh: line 1: _gen/reentrant-methods.list.tmp: No such file or directory
-| make[2]: *** [_gen/reentrant-methods.list] Error 1
-
-It's doing the mkdir and the subshell in parallel, when the mkdir should be done
-first.  Add an explicit dependency on spec-stamp to reentrant-methods.list to
-ensure the ordering.
-
-https://bugs.freedesktop.org/show_bug.cgi?id=52480
-
-Upstream-Status: Submitted
----
- telepathy-glib/codegen.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/telepathy-glib/codegen.am b/telepathy-glib/codegen.am
-index 26caaef..6ad3ec5 100644
---- a/telepathy-glib/codegen.am
-+++ b/telepathy-glib/codegen.am
-@@ -149,7 +149,7 @@ _gen/stable-spec.xml: stable-interfaces.xml _gen/stable-stamp $(tools_dir)/xincl
- # Grab a list of re-entrant tp_cli_*_run_* methods we are committed to
- # generating for backwards compatibility.
- # grep --no-filename is not portable :-(
--_gen/reentrant-methods.list: $(ABI_LISTS) codegen.am
-+_gen/reentrant-methods.list: _gen/spec-stamp $(ABI_LISTS) codegen.am
- 	$(AM_V_GEN)( cd $(srcdir) && cat $(ABI_LISTS) ) | \
- 		$(GREP) '^tp_cli_.*_run_.*' > $@.tmp
- 	@mv $@.tmp $@
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.6.bb
similarity index 68%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.19.6.bb
index 9dbc5be..37be67c 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.6.bb
@@ -3,13 +3,12 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz \
-           file://0001-Fix-a-race-in-_gen-reentrant-methods.list.patch"
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "af2b33c1215f189e637bd59cc9139255"
-SRC_URI[sha256sum] = "7e3c313ed08e26339deb603a615cec62a370131075514439f79f473f92ab84c3"
+SRC_URI[md5sum] = "5fa6ecdb3f2b2a18d9a707e5d09fa8c7"
+SRC_URI[sha256sum] = "9fdb1260f4df7a89ff5245ffa72c0331f77affd2cd58cca3714bcfaa5bf473a8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.9.5



