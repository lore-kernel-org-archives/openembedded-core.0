Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0WHT-0006DO-2R
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:52:11 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so474013eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.94.202 as permitted sender) client-ip=10.14.94.202; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.94.202 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.94.202])
	by 10.14.94.202 with SMTP id n50mr510397eef.65.1329993832184 (num_hops
	= 1); Thu, 23 Feb 2012 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KUIt838M6E3twDgRh+F9sWo0YVs6mUY3ozQVKp7P3aA=;
	b=ptx46I+s9i9EHK7qHpLzzzE0EMXasX1rprxzX4TKlCQ94IipWNnvvP9a1TYwsPDFkb
	ZcVdDCvE0Qi+AeCpQomOf2MYEQehVHODT4ATrr7NkKVxDsNYBgcGj1+OrDT0zAhb02VO
	yZFfa8dMgY6Q334Yfd0dDKP4VDOW8d0ZybSf8=
Received: by 10.14.94.202 with SMTP id n50mr406376eef.65.1329993832094;
	Thu, 23 Feb 2012 02:43:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm4006208eei.3.2012.02.23.02.43.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 02:43:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:43:37 +0100
Message-Id: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1329993620.git.Martin.Jansa@gmail.com>
References: <cover.1329993620.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/7] wireless-tools: remove ldconfig call from install-libs
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
X-List-Received-Date: Thu, 23 Feb 2012 10:52:11 -0000

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



