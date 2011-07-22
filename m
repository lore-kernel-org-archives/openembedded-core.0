Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QkH7B-0005EY-4S
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 16:54:09 +0200
Received: by rex (Postfix, from userid 1000)
	id 18B732066D; Fri, 22 Jul 2011 15:49:58 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 15:49:54 +0100
Message-Id: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/3] bitbake.conf/cross.bbclass: Add ability to dynamically change library location
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jul 2011 14:54:09 -0000

Add the ability to dynamically change the library directory from "lib" to
other values. This allows the tune files to specifiy altnerative ABIs
which can be dynamically enabled by the multilib BBCLASSEXTEND code.

A variety of approaches have been attempted with this, the immediate
expansions in cross.bbclass being problematic as they are they are expanded
before the bbclass extend event hander runs. This approach ensures the
${baselib} variable is retained in the expressions resolving that complication.

Derived from some ideas from Mark Hatle.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cross.bbclass |    7 ++++---
 meta/conf/bitbake.conf     |   15 ++++++++++-----
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index f9fd07a..81358ec 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -38,11 +38,12 @@ DEPENDS_GETTEXT = "gettext-native"
 # Path mangling needed by the cross packaging
 # Note that we use := here to ensure that libdir and includedir are
 # target paths.
-target_libdir := "${libdir}"
-target_includedir := "${includedir}"
-target_base_libdir := "${base_libdir}"
+target_base_prefix := "${base_prefix}"
 target_prefix := "${prefix}"
 target_exec_prefix := "${exec_prefix}"
+target_base_libdir = "${target_base_prefix}/${baselib}"
+target_libdir = "${target_exec_prefix}/${baselib}"
+target_includedir := "${includedir}"
 
 # Overrides for paths
 CROSS_TARGET_SYS_DIR = "${MULTIMACH_TARGET_SYS}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 975e24c..e768df5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -1,6 +1,13 @@
 ##################################################################
 # Standard target filesystem paths.
 ##################################################################
+#
+# If changing these values, beware that native/cross/nativesdk bbclass 
+# files may also need changes to keep in sync.
+#
+
+# Used by multilib code to change the library paths
+baselib = "lib"
 
 # Path prefixes
 export base_prefix = ""
@@ -10,7 +17,7 @@ export exec_prefix = "/usr"
 # Base paths
 export base_bindir = "${base_prefix}/bin"
 export base_sbindir = "${base_prefix}/sbin"
-export base_libdir = "${base_prefix}/lib"
+export base_libdir = "${base_prefix}/${baselib}"
 
 # Architecture independent paths
 export datadir = "${prefix}/share"
@@ -26,13 +33,11 @@ export docdir = "${datadir}/doc"
 export bindir = "${exec_prefix}/bin"
 export sbindir = "${exec_prefix}/sbin"
 export libexecdir = "${exec_prefix}/libexec"
-export libdir = "${exec_prefix}/lib"
+export libdir = "${exec_prefix}/${baselib}"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
 
-#
-# These must match the various bbclass layout definitions
-#
+# Linkage between native/cross/nativesdk layouts
 base_bindir_native = "/bin"
 base_sbindir_native = "/sbin"
 sysconfdir_native = "/etc"
-- 
1.7.4.1



