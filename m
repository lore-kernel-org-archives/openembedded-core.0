Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREq-0007yA-NT
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPfK8026827
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:41 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:23 -0500
Message-ID: <e409f1b0a8d9a28689df4d462ccbbf4b8182dbe4.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 29/40] wireless-tools: Avoid stripping binaries
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
X-List-Received-Date: Wed, 22 Jun 2011 17:29:17 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../wireless-tools/avoid_strip.patch               |   21 ++++++++++++++++++++
 .../wireless-tools/wireless-tools_29.bb            |    5 ++-
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/avoid_strip.patch

diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/avoid_strip.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/avoid_strip.patch
new file mode 100644
index 0000000..f34e243
--- /dev/null
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/avoid_strip.patch
@@ -0,0 +1,21 @@
+wireless_tools: Avoid stripping iwmulticall
+
+Upstream-Status: Inappropriate [other]
+  The removed code was from upstream.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur wireless_tools.29.orig/Makefile wireless_tools.29/Makefile
+--- wireless_tools.29.orig/Makefile	2011-06-18 11:35:12.183907453 -0500
++++ wireless_tools.29/Makefile	2011-06-18 11:38:09.995907985 -0500
+@@ -135,9 +135,8 @@
+ 
+ macaddr: macaddr.o $(IWLIB)
+ 
+-# Always do symbol stripping here
+ iwmulticall: iwmulticall.o
+-	$(CC) $(LDFLAGS) -Wl,-s $(XCFLAGS) -o $@ $^ $(LIBS)
++	$(CC) $(LDFLAGS) $(STRIPFLAGS) $(XCFLAGS) -o $@ $^ $(LIBS)
+ 
+ # It's a kind of magic...
+ wireless.h:
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
index 70bf91b..3f9f8f0 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
@@ -8,12 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "base"
 PRIORITY = "optional"
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
            file://man.patch;apply=yes \
 	   file://wireless-tools.if-pre-up \
-	   file://zzz-wireless.if-pre-up"
+	   file://zzz-wireless.if-pre-up \
+	   file://avoid_strip.patch"
 
 SRC_URI[md5sum] = "e06c222e186f7cc013fd272d023710cb"
 SRC_URI[sha256sum] = "6fb80935fe208538131ce2c4178221bab1078a1656306bce8909c19887e2e5a1"
-- 
1.7.3.4



