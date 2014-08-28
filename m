Return-Path: <Muzaffar_Mahmood@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5C45D70E6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 10:24:02 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XMws8-0005Gg-6N from Muzaffar_Mahmood@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Aug 2014 03:24:04 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Thu, 28 Aug 2014 11:24:02 +0100
From: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Aug 2014 15:23:26 +0500
Message-ID: <1409221406-25014-1-git-send-email-muzaffar_mahmood@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
Subject: [PATCH] systemtap: Patches for version 2.1
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
X-List-Received-Date: Thu, 28 Aug 2014 10:24:12 -0000
Content-Type: text/plain

From: Mikhail Durnev <Mikhail_Durnev@mentor.com>

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
---
 .../systemtap/systemtap/system_map_location.patch  |   13 +++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/system_map_location.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch b/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch
new file mode 100644
index 0000000..cd4f19e
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/system_map_location.patch
@@ -0,0 +1,13 @@
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


