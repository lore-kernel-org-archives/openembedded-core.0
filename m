Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDFTR-0004nH-4d for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 15:00:53 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AD1lje022005 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:01:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LNgOcXbJehuj
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:01:47 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AD1e27021983
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:01:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 13:54:58 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318251309.23801.28.camel@ted>
Mime-Version: 1.0
Subject: shared-mime-info: Fix a parallel make race
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
X-List-Received-Date: Mon, 10 Oct 2011 13:00:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
new file mode 100644
index 0000000..9e86a71
--- a/dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
@@ -0,0 +1,32 @@
+The Makefile used by shared-mime-info is one big race with the SUBDIRS 
+option and the dependency specifically calling make all combining to
+create multiple make instances all of which may try and build targets
+like update-mime-database.
+
+This patch removes those options meaning make can correctly identify
+dependencies and stop itself racing itself.
+
+RP 10/10/2011
+
+Upstream-status: Pending
+
+Index: shared-mime-info-0.91/Makefile.am
+===================================================================
+--- shared-mime-info-0.91.orig/Makefile.am	2011-10-10 21:47:19.834173921 +0100
++++ shared-mime-info-0.91/Makefile.am	2011-10-10 21:45:57.000000000 +0100
+@@ -1,5 +1,3 @@
+-SUBDIRS=. po
+-
+ INCLUDES = $(ALL_CFLAGS)
+ 
+ packagesdir = $(datadir)/mime/packages
+@@ -70,8 +68,7 @@
+ 
+ all: check create-pot
+ 
+-create-pot:
+-	$(MAKE) -C po shared-mime-info.pot
++create-pot: po
+ 
+ check: create-pot freedesktop.org.xml update-mime-database check-translations
+ 	if test -e $(top_builddir)/freedesktop.org.xml; then \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
index 76d2756..ac2dde1 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
@@ -4,3 +4,4 @@ PR = "r0"
 SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
 SRC_URI[sha256sum] = "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
 
+SRC_URI =+ "file://parallelmake.patch"




