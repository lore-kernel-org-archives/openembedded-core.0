Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHPpy-0007wY-0k for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 03:30:13 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2MOmJ025838 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 02:22:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x2ASnAG5PgG1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 02:22:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2MHOf025831
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 02:22:20 GMT
Message-ID: <1363572787.4315.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 02:13:07 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] sysfsutils: Fix case where ${B} != ${S}
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
X-List-Received-Date: Mon, 18 Mar 2013 02:30:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Patch the makefiles to allow out of tree builds to work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch
new file mode 100644
index 0000000..82e725e
--- /dev/null
+++ b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/separatebuild.patch
@@ -0,0 +1,65 @@
+Upstream-Status: Pending
+
+Fix out of tree build issues so ${B} != ${S} works.
+
+RP 2013/03/18
+
+Index: sysfsutils-2.1.0/cmd/Makefile.am
+===================================================================
+--- sysfsutils-2.1.0.orig/cmd/Makefile.am	2013-03-08 08:57:27.224556508 +0000
++++ sysfsutils-2.1.0/cmd/Makefile.am	2013-03-08 08:57:27.480556502 +0000
+@@ -1,6 +1,6 @@
+ bin_PROGRAMS = systool 
+ systool_SOURCES = systool.c names.c names.h
+-INCLUDES = -I../include
++INCLUDES = -I$(srcdir)/../include
+ LDADD = ../lib/libsysfs.la
+ EXTRA_CFLAGS = @EXTRA_CFLAGS@
+ AM_CFLAGS = -Wall -W -Wstrict-prototypes $(EXTRA_CFLAGS)
+Index: sysfsutils-2.1.0/lib/Makefile.am
+===================================================================
+--- sysfsutils-2.1.0.orig/lib/Makefile.am	2013-03-08 08:57:27.224556508 +0000
++++ sysfsutils-2.1.0/lib/Makefile.am	2013-03-08 08:57:27.480556502 +0000
+@@ -1,7 +1,7 @@
+ lib_LTLIBRARIES = libsysfs.la
+ libsysfs_la_SOURCES = sysfs_utils.c sysfs_attr.c sysfs_class.c dlist.c \
+       sysfs_device.c sysfs_driver.c sysfs_bus.c sysfs_module.c sysfs.h
+-INCLUDES = -I../include
++INCLUDES = -I$(srcdir)/../include
+ libsysfs_la_LDFLAGS = -version-info 2:1:0
+ EXTRA_CFLAGS = @EXTRA_CLFAGS@
+ libsysfs_la_CFLAGS = -Wall -W -Wstrict-prototypes $(EXTRA_CLFAGS)
+Index: sysfsutils-2.1.0/test/Makefile.am
+===================================================================
+--- sysfsutils-2.1.0.orig/test/Makefile.am	2013-03-08 08:57:27.224556508 +0000
++++ sysfsutils-2.1.0/test/Makefile.am	2013-03-08 09:06:48.196543326 +0000
+@@ -2,14 +2,14 @@
+ BUILT_SOURCES = test.h
+ CLEANFILES = test.h
+ test.h:
+-	./create-test
++	$(srcdir)/create-test $(srcdir)/libsysfs.conf
+ get_device_SOURCES = get_device.c
+ get_driver_SOURCES = get_driver.c
+ get_module_SOURCES = get_module.c
+ testlibsysfs_SOURCES = test.c test_attr.c test_bus.c test_class.c \
+ 		       test_device.c test_driver.c test_module.c test_utils.c \
+ 		       testout.c test-defs.h libsysfs.conf create-test
+-INCLUDES = -I../include
++INCLUDES = -I$(srcdir)/../include
+ LDADD = ../lib/libsysfs.la
+ EXTRA_CFLAGS = @EXTRA_CLFAGS@
+ AM_CFLAGS = -Wall -W -Wstrict-prototypes $(EXTRA_CLFAGS)
+Index: sysfsutils-2.1.0/test/create-test
+===================================================================
+--- sysfsutils-2.1.0.orig/test/create-test	2005-11-28 10:22:10.000000000 +0000
++++ sysfsutils-2.1.0/test/create-test	2013-03-08 09:07:03.372542838 +0000
+@@ -2,7 +2,7 @@
+ 
+ rm -f test.h
+ 
+-conf_file=./libsysfs.conf
++conf_file=$1
+ 
+ . $conf_file
+ 
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index 5b51daf..d7b461e 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
 PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
-	  file://sysfsutils-2.0.0-class-dup.patch \
-          file://obsolete_automake_macros.patch \
-	  "
+           file://sysfsutils-2.0.0-class-dup.patch \
+           file://obsolete_automake_macros.patch \
+           file://separatebuild.patch"
 
 SRC_URI[md5sum] = "14e7dcd0436d2f49aa403f67e1ef7ddc"
 SRC_URI[sha256sum] = "e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a"




