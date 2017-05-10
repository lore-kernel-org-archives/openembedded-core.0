Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8779A71A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:35:24 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85649662"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 May 2017 02:35:25 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 12:35:20 +0300
Message-Id: <20170510093529.6651-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/11] trace-cmd: update to 2.6.1
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
X-List-Received-Date: Wed, 10 May 2017 09:35:24 -0000

License change is due to update in FSF address.

Library path needs to be specified in absolute form now.

Remove bash completion file from kernelshark package as it will cause
a conflict with trace-cmd package.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/trace-cmd/kernelshark_git.bb | 3 ++-
 meta/recipes-kernel/trace-cmd/trace-cmd.inc      | 4 ++--
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
index 563182c89fe..9a5e8006c78 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
@@ -15,7 +15,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 EXTRA_OEMAKE = "\
     'prefix=${prefix}' \
     'bindir_relative=${@oe.path.relative(prefix, bindir)}' \
-    'libdir=${@oe.path.relative(prefix, libdir)}' \
+    'libdir=${libdir}' \
     NO_PYTHON=1 \
     gui \
 "
@@ -28,5 +28,6 @@ do_install() {
     oe_runmake DESTDIR="${D}" install_gui
     rm ${D}${bindir}/trace-cmd
     rm -rf ${D}${libdir}/trace-cmd
+    rm -rf ${D}${sysconfdir}/bash_completion.d/trace-cmd.bash
     rmdir ${D}${libdir}
 }
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd.inc b/meta/recipes-kernel/trace-cmd/trace-cmd.inc
index 3ad06fad81b..e0f6c3fba56 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd.inc
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd.inc
@@ -1,5 +1,5 @@
-SRCREV = "9be5d74805830a291615f2f34a27c903f6a37b1e"
-PV = "2.6"
+SRCREV = "021710e1073fe203341b427cd1a4bac577ec899c"
+PV = "2.6.1"
 
 inherit pkgconfig
 
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
index dd9a8a0ded6..fa9ffa3dc8f 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
@@ -5,7 +5,7 @@ require trace-cmd.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
-                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
+                    file://COPYING.LIB;md5=edb195fe538e4552c1f6ca0fd7bf4f0a \
                     file://trace-input.c;beginline=5;endline=8;md5=3ec82f43bbe0cfb5951ff414ef4d44d0 \
 "
 
@@ -17,7 +17,7 @@ EXTRA_OEMAKE = "\
     'img_install=${datadir}/kernelshark/html/images' \
     \
     'bindir_relative=${@oe.path.relative(prefix, bindir)}' \
-    'libdir=${@oe.path.relative(prefix, libdir)}' \
+    'libdir=${libdir}' \
     \
     NO_PYTHON=1 \
 "
-- 
2.11.0


