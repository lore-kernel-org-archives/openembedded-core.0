Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.5965.1615541015078435466
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12C9NJkt029419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:23:24 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Mar 2021 01:23:23 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 12 Mar 2021 01:23:22 -0800
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3: don't generate the .pyc files
Date: Fri, 12 Mar 2021 17:23:21 +0800
Message-ID: <20210312092321.6122-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Don't generate the .pyc files to reduce the package size.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...1-Makefile.pre.in-don-t-byte-compile.patch | 55 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.2.bb |  8 +--
 2 files changed, 56 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don-t-byte-compile.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don-t-byte-compile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don-t-byte-compile.patch
new file mode 100644
index 0000000000..17e904f703
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don-t-byte-compile.patch
@@ -0,0 +1,55 @@
+From 35a61f9eb5360b28c7209ebf152673a7f30fcae5 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 12 Mar 2021 04:30:10 +0000
+Subject: [PATCH] Makefile.pre.in: don't byte-compile python files
+
+Don't generate the .pyc files.
+
+Upstream-Status: Inappropriate [configuration related]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.pre.in | 27 ---------------------------
+ 1 file changed, 27 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 399dfa6..dfeb280 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1528,33 +1528,6 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
+ 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
+ 	fi
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb b/meta/recipes-devtools/python/python3_3.9.2.bb
index af1843a180..8239348378 100644
--- a/meta/recipes-devtools/python/python3_3.9.2.bb
+++ b/meta/recipes-devtools/python/python3_3.9.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
+           file://0001-Makefile.pre.in-don-t-byte-compile.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -168,13 +169,6 @@ do_install_append() {
                 -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
                 ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
 
-        # Unfortunately the following pyc files are non-deterministc due to 'frozenset'
-        # being written without strict ordering, even with PYTHONHASHSEED = 0
-        # Upstream is discussing ways to solve the issue properly, until then let's
-        # just not install the problematic files.
-        # More info: http://benno.id.au/blog/2013/01/15/python-determinism
-        rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
-        rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
 }
 
 do_install_append_class-nativesdk () {
-- 
2.29.2

