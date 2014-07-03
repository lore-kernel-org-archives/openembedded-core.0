Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 875E760CEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 12:57:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2014 05:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,595,1400050800"; d="scan'208";a="556936207"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2014 05:57:45 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jul 2014 15:57:32 +0300
Message-Id: <b68e53eb4f941f877769c19ab873aa87e2fa2a04.1404392064.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404392064.git.cristian.iorga@intel.com>
References: <cover.1404392064.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1404392064.git.cristian.iorga@intel.com>
References: <cover.1404392064.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] qemu: fix qemu-native pkg-config paths
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
X-List-Received-Date: Thu, 03 Jul 2014 12:57:44 -0000

For qemu-native, the pkg-config paths do not
include build host paths.
This is an issue for libsdl for example, where SDL is
used by qemu, but for qemu-native libsdl-native is not
built, but assumed to be provided by the build host.
Because pkg-config do not search for libsdl config files
on the build host sysroot, the configure stage of qemu-native
will fail because it will not find SDL as being installed.
Usually, the isssue is masked by a functional sdl-config that
will be interogated instead of pkg-config. However, on Build
Appliance, sdl-config is deliberately made non-functional,
so the issue manifests itself.

The fix will create an extended PKG_CONFIG_PATH, which does
include the build host sysroot paths for pkg-config.

Fix for [YP #6495].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 076e8ad..449b5f4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,10 @@ EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disa
 export LIBTOOL="${HOST_SYS}-libtool"
 
 do_configure_prepend_class-native() {
+        #Append build host pkg-config paths for native target
+        BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config)
+        export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
+
 	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
 	sed -i 's/-lX11//g' Makefile.target
 }
-- 
1.9.1


