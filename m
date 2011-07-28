Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QmNAQ-00030r-DN
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 11:46:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6S9fsqu001091
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jul 2011 02:41:54 -0700 (PDT)
Received: from localhost (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 28 Jul 2011 02:41:53 -0700
Message-ID: <2bf6575aba3b01b9056edfc63f9a33bfb8a4de61.1311845680.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311845680.git.kai.kang@windriver.com>
References: <cover.1311845680.git.kai.kang@windriver.com>
Old-Date: Thu, 28 Jul 2011 17:28:42 +0800
Date: Thu, 28 Jul 2011 17:41:54 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libnewt: update to 0.52.13
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
X-List-Received-Date: Thu, 28 Jul 2011 09:46:10 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

update libnewt to 0.52.13, and remove include-without-python.patch
because it has been merged.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../newt/files/include-without-python.patch        |   73 --------------------
 .../{libnewt_0.52.12.bb => libnewt_0.52.13.bb}     |    7 +-
 2 files changed, 3 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/files/include-without-python.patch
 rename meta/recipes-extended/newt/{libnewt_0.52.12.bb => libnewt_0.52.13.bb} (87%)

diff --git a/meta/recipes-extended/newt/files/include-without-python.patch b/meta/recipes-extended/newt/files/include-without-python.patch
deleted file mode 100644
index 263e9de..0000000
--- a/meta/recipes-extended/newt/files/include-without-python.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Upstream-Status: Pending
-
-From 3d13bbbb769050fac4cc6c904c174edc27e4f03d Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Thu, 20 Jan 2011 14:14:51 -0200
-Subject: [PATCH] build: add -without-python
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- Makefile.in  |    8 ++++----
- configure.ac |   10 ++++++++--
- 2 files changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index e764e61..74e9097 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -77,7 +77,7 @@ showkey:	showkey.o $(LIBNEWT)
- 	$(CC) -g -o showkey showkey.o $(LIBNEWT) $(LDFLAGS) $(LIBS)
- 
- _snackmodule.so:   snackmodule.c $(LIBNEWTSH)
--	for ver in $(PYTHONVERS) ; do \
-+	[ -n "$(PYTHONVERS)" ] && for ver in $(PYTHONVERS) ; do \
- 	    	mkdir -p $$ver ;\
- 			PCFLAGS=`$$ver-config --cflags`; \
- 			PIFLAGS=`$$ver-config --includes`; \
-@@ -85,7 +85,7 @@ _snackmodule.so:   snackmodule.c $(LIBNEWTSH)
- 			PLFLAGS=`$$ver-config --libs`; \
- 	        $(CC) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snackmodule.o snackmodule.c ;\
- 	        $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snackmodule.so $$ver/snackmodule.o -L.  -lnewt $(LIBS);\
--	done
-+	done || :
- 	touch $@
- 
- whiptail: $(NDIALOGOBJS) $(LIBNEWTSH)
-@@ -141,11 +141,11 @@ install-sh: sharedlib $(WHIPTCLSO) _snackmodule.so
- 	ln -sf $(LIBNEWTSONAME) $(instroot)/$(libdir)/libnewt.so
- 	ln -sf $(LIBNEWTSH) $(instroot)/$(libdir)/$(LIBNEWTSONAME)
- 	[ -n "$(WHIPTCLSO)" ] && install -m 755 whiptcl.so $(instroot)/$(libdir) || :
--	for ver in $(PYTHONVERS) ; do \
-+	[ -n "$(PYTHONVERS)" ] && for ver in $(PYTHONVERS) ; do \
- 	   [ -d $(instroot)/$(libdir)/$$ver/site-packages ] || install -m 755 -d $(instroot)/$(libdir)/$$ver/site-packages ;\
- 	   install -m 755 $$ver/_snackmodule.so $(instroot)/$(libdir)/$$ver/site-packages ;\
- 	   install -m 644 snack.py $(instroot)/$(libdir)/$$ver/site-packages ;\
--	done
-+	done || :
- 
- Makefile: newt.spec
- 	echo "You need to rerun ./configure before continuing"
-diff --git a/configure.ac b/configure.ac
-index 7bc381a..dc04352 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,8 +54,14 @@ fi
- AC_CHECK_HEADERS([popt.h libintl.h])
- 
- AC_MSG_CHECKING([for python versions])
--PYTHONVERS=$(echo /usr/include/python*/Python.h | sed "s|/usr/include/||g"| sed "s|/Python.h||g" 2> /dev/null)
--AC_MSG_RESULT([$PYTHONVERS])
-+AC_ARG_WITH([python], [  --without-python        do not compile python support])
-+if test "x$with_python" = "xno"; then
-+  AC_MSG_RESULT([skipped])
-+  PYTHONVERS=
-+else
-+  PYTHONVERS=$(ls /usr/include/python*/Python.h 2> /dev/null | sed "s|/usr/include/||g"| sed "s|/Python.h||g" 2> /dev/null)
-+  AC_MSG_RESULT([$PYTHONVERS])
-+fi
- AC_SUBST([PYTHONVERS])
- 
- AC_ARG_WITH([tcl], [  --without-tcl           do not compile whiptcl.so])
--- 
-1.7.2.3
-
diff --git a/meta/recipes-extended/newt/libnewt_0.52.12.bb b/meta/recipes-extended/newt/libnewt_0.52.13.bb
similarity index 87%
rename from meta/recipes-extended/newt/libnewt_0.52.12.bb
rename to meta/recipes-extended/newt/libnewt_0.52.13.bb
index e2ad559..94ad0ee 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.12.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.13.bb
@@ -17,16 +17,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 # slang needs to be >= 2.2
 DEPENDS = "slang popt"
 
-PR = "r2"
+PR = "r0"
 
 SRCREV = "c3c7be75f6ef1adfc2be5f99c1e8ef3f0ab58c38"
 
-SRC_URI = "git://git.fedorahosted.org/git/newt;protocol=git \
-           file://include-without-python.patch \
+SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-0.52.13.tar.gz \
            file://remove_slang_include.patch \
            file://fix_SHAREDDIR.patch"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/newt-${PV}"
 
 EXTRA_OECONF = "--without-python --without-tcl"
 
-- 
1.7.5.1.300.gc565c



