Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDAA36B099
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 00:23:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6G0N2mt009210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 17:23:03 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 15 Jul 2013 17:23:01 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 19:36:39 -0500
Message-ID: <1373934999-19279-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/4 v2] dbus-ptest: Disable python module check
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
X-List-Received-Date: Tue, 16 Jul 2013 00:23:02 -0000
Content-Type: text/plain

Disable the python module check, as the host python modules are
not needed for generating the target tests.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../dbus/dbus-1.6.10/python-config.patch           | 25 ++++++++++++++++++++++
 meta/recipes-core/dbus/dbus-ptest_1.6.10.bb        |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.10/python-config.patch

diff --git a/meta/recipes-core/dbus/dbus-1.6.10/python-config.patch b/meta/recipes-core/dbus/dbus-1.6.10/python-config.patch
new file mode 100644
index 0000000..2944002
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.6.10/python-config.patch
@@ -0,0 +1,25 @@
+When building the dbus-ptest package, we have to enable python.  However
+checking if the host-system python has the necessary library isn't useful.
+
+Disable the python module check for cross compiling.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- dbus-1.6.8/configure.ac.orig	2013-07-11 14:15:58.834554799 -0500
++++ dbus-1.6.8/configure.ac	2013-07-11 14:14:40.969554848 -0500
+@@ -257,13 +257,6 @@
+   # full test coverage is required, Python is a hard dependency
+   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires Python, dbus-python, pygobject])
+   AM_PATH_PYTHON([2.6])
+-  AC_MSG_CHECKING([for Python modules for full test coverage])
+-  if "$PYTHON" -c "import dbus, gobject, dbus.mainloop.glib"; then
+-    AC_MSG_RESULT([yes])
+-  else
+-    AC_MSG_RESULT([no])
+-    AC_MSG_ERROR([cannot import dbus, gobject, dbus.mainloop.glib Python modules])
+-  fi
+ else
+   # --enable-tests not given: do not abort if Python is missing
+   AM_PATH_PYTHON([2.6], [], [:])
diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
index 6c0f404..a8e82ef 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://ptest.patch \
            file://dbus-1.init  \
            file://run-ptest \
+           file://python-config.patch \
            "
 
 SRC_URI[md5sum] = "de4970c20629aeb958a12132415b3630"
-- 
1.8.3


