Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC2-0004tn-Bn
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652346"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:07 -0800
Message-Id: <835210a8f2f1916f52c26d6ed0d1e45f29acf935.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/25] wireless-tools: remove ldconfig call from install-libs
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:54 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* and drop apply=yes param as it's not needed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../wireless-tools/remove.ldconfig.call.patch      |   19 +++++++++++++++++++
 .../wireless-tools/wireless-tools_29.bb            |    5 +++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch

diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
new file mode 100644
index 0000000..3a22c3f
--- /dev/null
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
@@ -0,0 +1,19 @@
+When /etc/ld.so.cache is writeable by user running bitbake then it creates invalid cache 
+(in my case libstdc++.so cannot be found after building zlib(-native) and I have to call 
+touch */libstdc++.so && /sbin/ldconfig to fix it.
+
+So remove ldconfig call from make install-libs
+
+Upstream-Status: Inappropriate [disable feature]
+
+diff -uNr wireless_tools.29.orig/Makefile wireless_tools.29/Makefile
+--- wireless_tools.29.orig/Makefile	2007-09-18 01:56:46.000000000 +0200
++++ wireless_tools.29/Makefile	2012-02-15 20:46:41.780763514 +0100
+@@ -163,7 +163,6 @@
+ 	install -m 755 $(DYNAMIC) $(INSTALL_LIB)
+ 	ln -sfn $(DYNAMIC) $(INSTALL_LIB)/$(DYNAMIC_LINK)
+ 	@echo "*** Don't forget to add $(INSTALL_LIB) to /etc/ld.so.conf, and run ldconfig as root. ***"
+-	@$(LDCONFIG) || echo "*** Could not run ldconfig ! ***"
+ 
+ # Install the static library
+ install-static:: $(STATIC)
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
index cc51dec..c6235d6 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://sample_enc.c;beginline=1;endline=4;md5=838372be07874260b566bae2f6ed33b6"
 SECTION = "base"
 PE = "1"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
-           file://man.patch;apply=yes \
+	   file://remove.ldconfig.call.patch \
+	   file://man.patch \
 	   file://wireless-tools.if-pre-up \
 	   file://zzz-wireless.if-pre-up \
 	   file://avoid_strip.patch"
-- 
1.7.6.5



