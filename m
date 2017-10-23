Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDD636FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 01:27:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9N1RfFx008906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 18:27:41 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 22 Oct 2017 18:27:40 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Oct 2017 21:27:38 -0400
Message-ID: <20171023012738.20457-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] openssl: force soft link to avoid rare race
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
X-List-Received-Date: Mon, 23 Oct 2017 01:27:41 -0000
Content-Type: text/plain

This patch works around a rare parallel build race condition using
the force option when soft linking.

The error seen is:

ln: failed to create symbolic link 'libssl.so': File exists
make[4]: *** [Makefile.shared:171: link_a.gnu] Error 1
make[4]: Leaving directory
'/.../build/tmp-glibc/work/x86_64-linux/openssl-native/1.0.2k-r0/openssl-1.0.2k'

Just add the -f flag to the platform independent soft link code to
avoid the collision.  This is reasonable since this Makefile removes
the link target before creating a new soft link. The Makefile was
written this way to support platforms that don't allow forcing a
softlink to overwrite an existing link. Only builds on Linux are
supported so that's not a requirement for oe-core recipes.

The openssl team is rewriting their build files so it's not appropriate
for openssl upstream and fixing the root cause of the race condition
was also not pursued.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...penssl-force-soft-link-to-avoid-rare-race.patch | 48 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2l.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-link-to-avoid-rare-race.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-link-to-avoid-rare-race.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-link-to-avoid-rare-race.patch
new file mode 100644
index 0000000..7a23d23
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-link-to-avoid-rare-race.patch
@@ -0,0 +1,48 @@
+From 3d9199423d48766649a2b2ebb3924e892ed16fa4 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Tue, 20 Jun 2017 15:32:08 -0400
+Subject: [PATCH] openssl: Force soft link to avoid rare race
+
+This patch works around a rare parallel build race condition. 
+The error seen is:
+
+ln: failed to create symbolic link 'libssl.so': File exists
+make[4]: *** [Makefile.shared:171: link_a.gnu] Error 1
+make[4]: Leaving directory
+'/.../build/tmp-glibc/work/x86_64-linux/openssl-native/1.0.2k-r0/openssl-1.0.2k'
+
+The openssl team is rewriting their build files so it's not
+appropriate for openssl upstream and fixing the root cause of
+the Makefile race condition was also not pursued.
+
+Upstream-Status: Inappropriate [build rules rewrite in progress]
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ Makefile.shared | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.shared b/Makefile.shared
+index e8d222a..1bff92f 100644
+--- a/Makefile.shared
++++ b/Makefile.shared
+@@ -118,14 +118,14 @@
+ 		if [ -n "$$SHLIB_COMPAT" ]; then \
+ 			for x in $$SHLIB_COMPAT; do \
+ 				( $(SET_X); rm -f $$SHLIB$$x$$SHLIB_SUFFIX; \
+-				  ln -s $$prev $$SHLIB$$x$$SHLIB_SUFFIX ); \
++				  ln -sf $$prev $$SHLIB$$x$$SHLIB_SUFFIX ); \
+ 				prev=$$SHLIB$$x$$SHLIB_SUFFIX; \
+ 			done; \
+ 		fi; \
+ 		if [ -n "$$SHLIB_SOVER" ]; then \
+ 			[ -e "$$SHLIB$$SHLIB_SUFFIX" ] || \
+ 			( $(SET_X); rm -f $$SHLIB$$SHLIB_SUFFIX; \
+-			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
++			  ln -sf $$prev $$SHLIB$$SHLIB_SUFFIX ); \
+ 		fi; \
+ 	fi
+ 
+-- 
+2.9.3
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
index 8c34ea6..c537aa4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
@@ -41,6 +41,7 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
             file://openssl-util-perlpath.pl-cwd.patch \
             file://Use-SHA256-not-MD5-as-default-digest.patch \
             file://0001-Fix-build-with-clang-using-external-assembler.patch \
+            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch  \
             "
 SRC_URI[md5sum] = "f85123cd390e864dfbe517e7616e6566"
 SRC_URI[sha256sum] = "ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c"
-- 
2.9.3


