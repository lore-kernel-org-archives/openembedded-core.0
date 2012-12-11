Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TiMzG-0008B7-4W
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 11:22:57 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qBBA8IaF030654;
	Tue, 11 Dec 2012 04:08:19 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 15:08:16 +0500
Message-Id: <1355220496-8878-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] wireless-tools: Remove QA warning: No GNU_HASH in the elf binary
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
X-List-Received-Date: Tue, 11 Dec 2012 10:22:57 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Handle LDFLAGS properly in the Makefile to remove warning:
QA Issue: No GNU_HASH in the elf binary

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../wireless-tools/wireless-tools/ldflags.patch    |   15 +++++++++++++++
 .../wireless-tools/wireless-tools_29.bb            |    3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
new file mode 100644
index 0000000..84144ac
--- /dev/null
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
@@ -0,0 +1,15 @@
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



