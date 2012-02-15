Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rxl98-0004DD-KK
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Feb 2012 21:08:10 +0100
Received: by eekd41 with SMTP id d41so443911eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 11:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KUIt838M6E3twDgRh+F9sWo0YVs6mUY3ozQVKp7P3aA=;
	b=uy5b5XBckE0EAYOWw7jare6zOP9vV52zKJ6tKF++8pV8CFRXZ8oLfsoIZ+HwAAVxhl
	ZfkfKREiaPAWPso117iv2Y+R7DT6lmGb0aOjkLcUx1PK7zu7nVAKYoLpwZ9/tqEtEw+6
	aA5FyyXjyIj4F/xPtltQcpK+7YBogwir1a0x4=
Received: by 10.213.105.143 with SMTP id t15mr248574ebo.60.1329335998459;
	Wed, 15 Feb 2012 11:59:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm14470922eeb.8.2012.02.15.11.59.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 11:59:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2012 20:59:49 +0100
Message-Id: <1329335989-8424-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH] wireless-tools: remove ldconfig call from install-libs
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
X-List-Received-Date: Wed, 15 Feb 2012 20:08:10 -0000

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
1.7.8.4



