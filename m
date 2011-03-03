Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvHN5-0005h6-E1
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 23:51:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Mar 2011 14:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,260,1297065600"; d="scan'208";a="608842906"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by orsmga002.jf.intel.com with ESMTP; 03 Mar 2011 14:49:21 -0800
Message-Id: <0899e14bfe1ef521daab9d75ea526178762c4abf.1299192495.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299192495.git.sgw@linux.intel.com>
References: <cover.1299192495.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 12:32:01 +0800
Date: Thu, 03 Mar 2011 14:49:21 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 08/10] recipe: add newt from OE
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
X-List-Received-Date: Thu, 03 Mar 2011 22:51:47 -0000

From: Kang Kai <kai.kang@windriver.com>

newt is a library for text mode user interfaces, and required by
chkconfig because of LSB command test.

* This recipe is from OE commit: 71a1e1a6e6b89d4ced9c9ab537614e1e521389b0

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../newt/files/include-without-python.patch        |   71 ++++++++++++++++++++
 meta/recipes-extended/newt/libnewt_0.52.12.bb      |   37 ++++++++++
 2 files changed, 108 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/newt/files/include-without-python.patch
 create mode 100644 meta/recipes-extended/newt/libnewt_0.52.12.bb

diff --git a/meta/recipes-extended/newt/files/include-without-python.patch b/meta/recipes-extended/newt/files/include-without-python.patch
new file mode 100644
index 0000000..277ee33
--- /dev/null
+++ b/meta/recipes-extended/newt/files/include-without-python.patch
@@ -0,0 +1,71 @@
+From 3d13bbbb769050fac4cc6c904c174edc27e4f03d Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Thu, 20 Jan 2011 14:14:51 -0200
+Subject: [PATCH] build: add -without-python
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Makefile.in  |    8 ++++----
+ configure.ac |   10 ++++++++--
+ 2 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index e764e61..74e9097 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -77,7 +77,7 @@ showkey:	showkey.o $(LIBNEWT)
+ 	$(CC) -g -o showkey showkey.o $(LIBNEWT) $(LDFLAGS) $(LIBS)
+ 
+ _snackmodule.so:   snackmodule.c $(LIBNEWTSH)
+-	for ver in $(PYTHONVERS) ; do \
++	[ -n "$(PYTHONVERS)" ] && for ver in $(PYTHONVERS) ; do \
+ 	    	mkdir -p $$ver ;\
+ 			PCFLAGS=`$$ver-config --cflags`; \
+ 			PIFLAGS=`$$ver-config --includes`; \
+@@ -85,7 +85,7 @@ _snackmodule.so:   snackmodule.c $(LIBNEWTSH)
+ 			PLFLAGS=`$$ver-config --libs`; \
+ 	        $(CC) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snackmodule.o snackmodule.c ;\
+ 	        $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snackmodule.so $$ver/snackmodule.o -L.  -lnewt $(LIBS);\
+-	done
++	done || :
+ 	touch $@
+ 
+ whiptail: $(NDIALOGOBJS) $(LIBNEWTSH)
+@@ -141,11 +141,11 @@ install-sh: sharedlib $(WHIPTCLSO) _snackmodule.so
+ 	ln -sf $(LIBNEWTSONAME) $(instroot)/$(libdir)/libnewt.so
+ 	ln -sf $(LIBNEWTSH) $(instroot)/$(libdir)/$(LIBNEWTSONAME)
+ 	[ -n "$(WHIPTCLSO)" ] && install -m 755 whiptcl.so $(instroot)/$(libdir) || :
+-	for ver in $(PYTHONVERS) ; do \
++	[ -n "$(PYTHONVERS)" ] && for ver in $(PYTHONVERS) ; do \
+ 	   [ -d $(instroot)/$(libdir)/$$ver/site-packages ] || install -m 755 -d $(instroot)/$(libdir)/$$ver/site-packages ;\
+ 	   install -m 755 $$ver/_snackmodule.so $(instroot)/$(libdir)/$$ver/site-packages ;\
+ 	   install -m 644 snack.py $(instroot)/$(libdir)/$$ver/site-packages ;\
+-	done
++	done || :
+ 
+ Makefile: newt.spec
+ 	echo "You need to rerun ./configure before continuing"
+diff --git a/configure.ac b/configure.ac
+index 7bc381a..dc04352 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,8 +54,14 @@ fi
+ AC_CHECK_HEADERS([popt.h libintl.h])
+ 
+ AC_MSG_CHECKING([for python versions])
+-PYTHONVERS=$(echo /usr/include/python*/Python.h | sed "s|/usr/include/||g"| sed "s|/Python.h||g" 2> /dev/null)
+-AC_MSG_RESULT([$PYTHONVERS])
++AC_ARG_WITH([python], [  --without-python        do not compile python support])
++if test "x$with_python" = "xno"; then
++  AC_MSG_RESULT([skipped])
++  PYTHONVERS=
++else
++  PYTHONVERS=$(ls /usr/include/python*/Python.h 2> /dev/null | sed "s|/usr/include/||g"| sed "s|/Python.h||g" 2> /dev/null)
++  AC_MSG_RESULT([$PYTHONVERS])
++fi
+ AC_SUBST([PYTHONVERS])
+ 
+ AC_ARG_WITH([tcl], [  --without-tcl           do not compile whiptcl.so])
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-extended/newt/libnewt_0.52.12.bb b/meta/recipes-extended/newt/libnewt_0.52.12.bb
new file mode 100644
index 0000000..eefd6bd
--- /dev/null
+++ b/meta/recipes-extended/newt/libnewt_0.52.12.bb
@@ -0,0 +1,37 @@
+SUMMARY = "A library for text mode user interfaces"
+
+DESCRIPTION = "Newt is a programming library for color text mode, widget based user \
+interfaces.  Newt can be used to add stacked windows, entry widgets, \
+checkboxes, radio buttons, labels, plain text fields, scrollbars, \
+etc., to text mode user interfaces.  This package also contains the \
+shared library needed by programs built with newt, as well as a \
+/usr/bin/dialog replacement called whiptail.  Newt is based on the \
+slang library."
+
+HOMEPAGE = "https://fedorahosted.org/newt/"
+SECTION = "libs"
+
+LICENSE = "LGPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+# slang needs to be >= 2.2
+DEPENDS = "slang popt"
+
+PR = "r0"
+
+SRCREV = "c3c7be75f6ef1adfc2be5f99c1e8ef3f0ab58c38"
+SRC_URI = "git://git.fedorahosted.org/git/newt;protocol=git \
+           file://include-without-python.patch"
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = "--without-python --without-tcl"
+
+inherit autotools
+
+PACKAGES_prepend = "whiptail "
+
+do_configure_prepend() {
+    sh autogen.sh
+}
+
+FILES_whiptail = "${bindir}/whiptail"
-- 
1.7.1.1



