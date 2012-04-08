Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGkOX-0004xj-68
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Apr 2012 07:10:33 +0200
Received: by dadz8 with SMTP id z8so4130539dad.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Apr 2012 22:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WLGGC05d/Jr3uc8i/5X0WzovMW1K6ZBWsrblOupnJyQ=;
	b=EghtWyQ3p3qsS4+H2Kk4WZXV/q77QNFSu6KX+RyGWBFenLSUBcxJrKHDvp/UYKE8kZ
	Ywp+XBSk/YmAg0lW2vwobQUMz34hvYLfft37KY1r0/xPZkh7IlHY5nU1mjaBq++WdrKL
	10yJUGf6RPeyjpsNnKqruWHDGhA5ZzmYnF81/HPpn2PQgINtq4C2wLAGMSigUfgfZ3jv
	MsZw+6EiQitB55DMuCbwrw8nZzXblcd584+A3WV9JBG1E4767Fviw4ZPuq0jaADnm/ey
	/0mdvpWmrLmaE9EZ+yaotxVUX3MouqkX84vHoj7mxdWg/J9YSFAeKFLIS+Jei1OZax1C
	JZiw==
Received: by 10.68.201.169 with SMTP id kb9mr8238926pbc.146.1333861277273;
	Sat, 07 Apr 2012 22:01:17 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id b3sm11031213pbm.11.2012.04.07.22.01.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 Apr 2012 22:01:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Apr 2012 22:00:56 -0700
Message-Id: <1333861256-22395-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] connman: Fix linking with gold linker
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
X-List-Received-Date: Sun, 08 Apr 2012 05:10:33 -0000

Fixes errors like below

/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.6.3/ld:
error: hidden symbol '__start___debug' is not defined locally
/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.6.3/ld:
error: hidden symbol '__stop___debug' is not defined locally
collect2: ld returned 1 exit status
make[1]: *** [plugins/loopback.la] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ange-visibility-to-default-for-debug-symb.patch |   35 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.79.bb  |    3 +-
 2 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
new file mode 100644
index 0000000..e6f03e6
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
@@ -0,0 +1,35 @@
+From 4ddaf78dad5a9ee4a0658235f71b75132192123e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 Apr 2012 18:52:12 -0700
+Subject: [PATCH] plugin.h: Change visibility to default for debug symbols
+
+gold refuses to link in undefined weak symbols which
+have hidden visibility
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Upstream-Status: Pending
+---
+ include/plugin.h |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/plugin.h b/include/plugin.h
+index 692a4e5..a9361c3 100644
+--- a/include/plugin.h
++++ b/include/plugin.h
+@@ -89,9 +89,9 @@ struct connman_plugin_desc {
+ #else
+ #define CONNMAN_PLUGIN_DEFINE(name, description, version, priority, init, exit) \
+ 		extern struct connman_debug_desc __start___debug[] \
+-				__attribute__ ((weak, visibility("hidden"))); \
++				__attribute__ ((weak, visibility("default"))); \
+ 		extern struct connman_debug_desc __stop___debug[] \
+-				__attribute__ ((weak, visibility("hidden"))); \
++				__attribute__ ((weak, visibility("default"))); \
+ 		extern struct connman_plugin_desc connman_plugin_desc \
+ 				__attribute__ ((visibility("default"))); \
+ 		struct connman_plugin_desc connman_plugin_desc = { \
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
index f87c4dd..da48e94 100644
--- a/meta/recipes-connectivity/connman/connman_0.79.bb
+++ b/meta/recipes-connectivity/connman/connman_0.79.bb
@@ -6,6 +6,7 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://add_xuser_dbus_permission.patch \
             file://ethernet_default.patch \
             file://disable_alg-test.patch \
+            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://connman"
 S = "${WORKDIR}/git"
-PR = "r1"
+PR = "r2"
-- 
1.7.5.4



