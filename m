Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TlDUc-0003qu-Lt
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 07:51:03 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qBJ6aDaF002117;
	Wed, 19 Dec 2012 00:36:17 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2012 11:35:53 +0500
Message-Id: <1355898953-1023-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2] wireless-tools: Remove QA warning: No GNU_HASH in the elf binary
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
X-List-Received-Date: Wed, 19 Dec 2012 06:51:03 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Handle LDFLAGS properly in the Makefile to remove warning:
QA Issue: No GNU_HASH in the elf binary

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../wireless-tools/wireless-tools/ldflags.patch    |   22 ++++++++++++++++++++
 .../wireless-tools/wireless-tools_29.bb            |    3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
new file mode 100644
index 0000000..6c0d8cb
--- /dev/null
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
@@ -0,0 +1,22 @@
+wireless-tools: Remove QA warning: No GNU_HASH in the elf binary
+
+Upstream-Status: Inappropriate [other]
+  Useful within bitbake environment only.
+
+Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
+
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- wireless_tools.29.orig/Makefile
++++ wireless_tools.29/Makefile
+@@ -144,7 +144,7 @@ wireless.h:
+ 
+ # Compilation of the dynamic library
+ $(DYNAMIC): $(OBJS:.o=.so)
+-	$(CC) -shared -o $@ -Wl,-soname,$@ $(STRIPFLAGS) $(LIBS) -lc $^
++	$(CC) -shared -o $@ -Wl,-soname,$@ $(LDFLAGS) $(STRIPFLAGS) $(LIBS) -lc $^
+ 
+ # Compilation of the static library
+ $(STATIC): $(OBJS:.o=.so)
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
index 209f29a..b4d34bb 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
@@ -14,7 +14,8 @@ SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.2
 	   file://man.patch \
 	   file://wireless-tools.if-pre-up \
 	   file://zzz-wireless.if-pre-up \
-	   file://avoid_strip.patch"
+	   file://avoid_strip.patch \
+	   file://ldflags.patch"
 
 SRC_URI[md5sum] = "e06c222e186f7cc013fd272d023710cb"
 SRC_URI[sha256sum] = "6fb80935fe208538131ce2c4178221bab1078a1656306bce8909c19887e2e5a1"
-- 
1.7.9.5



