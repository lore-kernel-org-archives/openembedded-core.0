Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D95273CC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 19:21:09 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3EJLASw015753
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 14 Apr 2015 12:21:10 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>)
	id 1Yi6OA-0005tQ-0X; Tue, 14 Apr 2015 15:20:50 -0400
Date: Tue, 14 Apr 2015 15:20:50 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-core@lists.openembedded.org, amy.fong@windriver.com
Message-ID: <20150414192049.GA22629@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-java] [PATCH] icedtea7-native fails on hosts without /usr/include/X11/extensions
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
X-List-Received-Date: Tue, 14 Apr 2015 19:21:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 4789a5dc622cc8537df28596a4beb66db4ba4774 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Tue, 14 Apr 2015 13:10:22 -0400
Subject: [PATCH] icedtea7-native compile failure undefined reference to `main'

On hosts without /usr/include/X11/extensions, icedtea7-native compile
results in a build failure while trying to create an object file:

+/data/home/.../git/csu/../sysdeps/x86_64/start.S:118: undefined reference to `main'
[2015-03-31 15:22:53.115930161+00:00] | collect2: error: ld returned 1 exit status

The compile line shows: (-c gets eaten)
... -I -c -o

The makefile tries to do the following which results in a faulty build
line if /usr/include/X11/extensions doesn't exist:

   CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
                         $(wildcard /usr/include/X11/extensions))

This looks like a missed line from the following patch which removes the need for X11/extensions:
  icedtea-ecj-disable-compilation.patch

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-core/icedtea/icedtea7-native.inc           |  2 ++
 .../openjdk-7-03b147/headless_x11_cleanup.patch    | 35 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/headless_x11_cleanup.patch

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 81e9b66..f555d70 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -30,6 +30,7 @@ SRC_URI = " \
 
 SRC_URI += "file://icedtea-unzip.patch"
 SRC_URI += "file://icedtea-unzip-phase2.patch;apply=no"
+SRC_URI += "file://headless_x11_cleanup.patch;apply=no"
 
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
@@ -149,6 +150,7 @@ do_configure_append() {
 	oe_runmake patch-boot
 
 	cd ${S} && cat ${WORKDIR}/icedtea-unzip-phase2.patch | patch -p1
+	cd ${S} && cat ${WORKDIR}/headless_x11_cleanup.patch | patch -p1
 }
 
 EXTRA_OEMAKE = ' \
diff --git a/recipes-core/icedtea/openjdk-7-03b147/headless_x11_cleanup.patch b/recipes-core/icedtea/openjdk-7-03b147/headless_x11_cleanup.patch
new file mode 100644
index 0000000..5b3e650
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/headless_x11_cleanup.patch
@@ -0,0 +1,35 @@
+---
+ build/openjdk-boot/jdk/make/sun/awt/mawt.gmk |    6 ------
+ build/openjdk/jdk/make/sun/awt/mawt.gmk      |    6 ------
+ 2 files changed, 12 deletions(-)
+
+--- a/build/openjdk-boot/jdk/make/sun/awt/mawt.gmk
++++ b/build/openjdk-boot/jdk/make/sun/awt/mawt.gmk
+@@ -258,12 +258,6 @@
+         -I$(PLATFORM_SRC)/native/$(PKGDIR) \
+         $(EVENT_MODEL)
+ 
+-ifeq ($(PLATFORM), linux)
+-  # Checking for the X11/extensions headers at the additional location
+-  CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
+-                        $(wildcard /usr/include/X11/extensions))
+-endif
+-
+ ifeq ($(PLATFORM), solaris)
+   CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions
+ endif
+--- a/build/openjdk/jdk/make/sun/awt/mawt.gmk
++++ b/build/openjdk/jdk/make/sun/awt/mawt.gmk
+@@ -258,12 +258,6 @@
+         -I$(PLATFORM_SRC)/native/$(PKGDIR) \
+         $(EVENT_MODEL)
+ 
+-ifeq ($(PLATFORM), linux)
+-  # Checking for the X11/extensions headers at the additional location
+-  CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
+-                        $(wildcard /usr/include/X11/extensions))
+-endif
+-
+ ifeq ($(PLATFORM), solaris)
+   CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions
+ endif
-- 
2.1.4


