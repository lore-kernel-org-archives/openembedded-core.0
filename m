Return-Path: <Muzaffar_Mahmood@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 585F67108F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 08:02:47 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XP5We-0004pE-Vo from Muzaffar_Mahmood@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Sep 2014 01:02:47 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Wed, 3 Sep 2014 09:02:34 +0100
From: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 13:01:50 +0500
Message-ID: <1409731310-46986-1-git-send-email-muzaffar_mahmood@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
Subject: [PATCH] systemtap: Cross compilation fix
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
X-List-Received-Date: Wed, 03 Sep 2014 08:02:56 -0000
Content-Type: text/plain

From: Mikhail Durnev <Mikhail_Durnev@mentor.com>

This is a cross compilation fix. It allows systemtap to find the
kernel map file in the right place, i.e. in the kernel build tree.
Without this fix it takes a map file from the build host, if available.

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
---
 .../systemtap/systemtap/system_map_location.patch  |   23 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/system_map_location.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch b/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch
new file mode 100644
index 0000000..013af5c
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch
@@ -0,0 +1,23 @@
+systemtap: Cross compilation fix
+
+This is a cross compilation fix. It allows systemtap to find
+the kernel map file in the right place, i.e. in the kernel build tree.
+Without this fix it takes a map file from the build host, if available.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
+
+Index: git/session.cxx
+===================================================================
+--- git.orig/session.cxx
++++ git/session.cxx
+@@ -1634,7 +1634,7 @@ systemtap_session::parse_kernel_function
+ 	clog << _F("Kernel symbol table %s unavailable, (%s)",
+ 		   system_map_path.c_str(), strerror(errno)) << endl;
+ 
+-      system_map_path = "/boot/System.map-" + kernel_release;
++      system_map_path = kernel_build_tree + "/System.map-" + kernel_release;
+       system_map.clear();
+       system_map.open(system_map_path.c_str(), ifstream::in);
+       if (! system_map.is_open())
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 3e1e80a..33aa136 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -6,6 +6,7 @@ PV = "2.5+git${SRCPV}"
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://docproc-build-fix.patch \
            file://obsolete_automake_macros.patch \
+           file://system_map_location.patch \
            file://tapset-linux-sendfile-syscall.patch \
           "
 
-- 
1.7.9.5


