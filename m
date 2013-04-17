Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USOl2-0001t4-Ck for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:34:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3H9HKXp010330; Wed, 17 Apr 2013 10:17:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Siu3Nit6ZFPK; Wed, 17 Apr 2013 10:17:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3H9HGQN010325
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 17 Apr 2013 10:17:18 +0100
Message-ID: <1366190204.25282.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 10:16:44 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] consolekit: Fix ${S} != ${B} issues with pam enabled
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
X-List-Received-Date: Wed, 17 Apr 2013 09:34:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When pam is enabled an extra plugin is build and it references an incorrect directory
when separate build directories are used. This patch corrects the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/consolekit/consolekit/sepbuildfix.patch b/meta/recipes-support/consolekit/consolekit/sepbuildfix.patch
new file mode 100644
index 0000000..f2f9b9c
--- /dev/null
+++ b/meta/recipes-support/consolekit/consolekit/sepbuildfix.patch
@@ -0,0 +1,19 @@
+Fix builds in the case of seprate source from the build directory.
+
+RP 2013/4/17
+
+Upstream-Status: Pending
+
+Index: pam-ck-connector/Makefile.am
+===================================================================
+--- consolekit/pam-ck-connector.orig/Makefile.am	2010-09-03 13:54:31.000000000 +0000
++++ consolekit/pam-ck-connector/Makefile.am	2013-04-17 09:06:49.093524918 +0000
+@@ -4,7 +4,7 @@
+ 
+ INCLUDES = 					\
+ 	$(LIBDBUS_CFLAGS)			\
+-	-I$(top_builddir)/libck-connector	\
++	-I$(top_srcdir)/libck-connector	\
+ 	$(NULL)
+ 
+ pamlibdir = $(PAM_MODULE_DIR)
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index a328108..db4ac00 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -13,7 +13,8 @@ RDEPENDS_${PN} += "base-files"
 
 inherit autotools pkgconfig
 
-SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.bz2"
+SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.bz2 \
+           file://sepbuildfix.patch"
 SRC_URI[md5sum] = "f2657f93761206922d558471a936fbc3"
 SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b223686b9c38"
 




