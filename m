Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TTfkh-0007kg-NQ
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 22:23:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9VL9Uvp012408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 14:09:30 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 31 Oct 2012 14:09:29 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Oct 2012 16:19:24 -0500
Message-ID: <6f77829d5542d9b19cfaf1ebb0d1e633c1a83e4b.1351718092.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1351718092.git.mark.hatle@windriver.com>
References: <cover.1351718092.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/4] python-smartpm: Add smartpm recipe
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
X-List-Received-Date: Wed, 31 Oct 2012 21:23:08 -0000
Content-Type: text/plain

This is the initial integration, basic functionality such as 'smart query'
has been tested.  Active use of remote feeds and such has not yet been
verified.

Thanks to Paul Eggleton for corrections and bug fixes for the initial
integration.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../python/python-smartpm/smart-rpm-root.patch     |   80 +++++++++++++
 .../python/python-smartpm/smartpm-rpm5-nodig.patch |   46 ++++++++
 .../python/python-smartpm_1.4.1.bb                 |  119 ++++++++++++++++++++
 3 files changed, 245 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm_1.4.1.bb

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch b/meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch
new file mode 100644
index 0000000..b2629ef
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch
@@ -0,0 +1,80 @@
+Fix smart RPM backend to handle rpm-dbpath/rpm-root properly
+
+Don't assume that if the dbpath starts with / that it is an absolute
+path. This matches the behaviour of rpm itself. (If the root path is
+specified and does not start with /, rpm will prepend the root path
+twice and fail).
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
+index 7092332..0489e11 100644
+--- a/smart/backends/rpm/base.py
++++ b/smart/backends/rpm/base.py
+@@ -46,6 +46,12 @@ __all__ = ["RPMPackage", "RPMProvides", "RPMNameProvides", "RPMPreRequires",
+            "rpm", "getTS", "getArchScore", "getArchColor", "system_provides",
+            "collapse_libc_requires"]
+ 
++def rpm_join_dbpath(root, dbpath):
++    if dbpath.startswith('/') and root:
++        return os.path.join(root, dbpath[1:])
++    else:
++        return os.path.join(root, dbpath)
++
+ def getTS(new=False):
+     rpm_root = os.path.abspath(sysconf.get("rpm-root", "/"))
+     if not hasattr(getTS, "ts") or getTS.root != rpm_root:
+@@ -56,7 +62,7 @@ def getTS(new=False):
+         #if not sysconf.get("rpm-check-signatures", False):
+         #    getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
+         rpm_dbpath = sysconf.get("rpm-dbpath", "var/lib/rpm")
+-        dbdir = os.path.join(getTS.root, rpm_dbpath)
++        dbdir = rpm_join_dbpath(getTS.root, rpm_dbpath)
+         if not os.path.isdir(dbdir):
+             try:
+                 os.makedirs(dbdir)
+diff --git a/smart/channels/rpm_sys.py b/smart/channels/rpm_sys.py
+index efcb10e..b9fda27 100644
+--- a/smart/channels/rpm_sys.py
++++ b/smart/channels/rpm_sys.py
+@@ -20,7 +20,7 @@
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ #
+ from smart.backends.rpm.header import RPMDBLoader
+-from smart.backends.rpm.base import getTS
++from smart.backends.rpm.base import getTS, rpm_join_dbpath
+ from smart.channel import PackageChannel
+ from smart import *
+ import os
+@@ -32,9 +32,9 @@ class RPMSysChannel(PackageChannel):
+ 
+     def fetch(self, fetcher, progress):
+         getTS() # Make sure the db exists.
+-        path = os.path.join(sysconf.get("rpm-root", "/"),
+-                            sysconf.get("rpm-dbpath", "var/lib/rpm"),
+-                            "Packages")
++        dbdir = rpm_join_dbpath(sysconf.get("rpm-root", "/"),
++                            sysconf.get("rpm-dbpath", "var/lib/rpm"))
++        path = os.path.join(dbdir, "Packages")
+         digest = os.path.getmtime(path)
+         if digest == self._digest:
+             return True
+diff --git a/smart/plugins/detectsys.py b/smart/plugins/detectsys.py
+index 2cd49ad..3959d07 100644
+--- a/smart/plugins/detectsys.py
++++ b/smart/plugins/detectsys.py
+@@ -20,10 +20,11 @@
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ #
+ from smart import *
++from smart.backends.rpm.base import rpm_join_dbpath
+ import os
+ 
+ def detectRPMSystem():
+-    dir = os.path.join(sysconf.get("rpm-root", "/"),
++    dir = rpm_join_dbpath(sysconf.get("rpm-root", "/"),
+                        sysconf.get("rpm-dbpath", "var/lib/rpm"))
+     file = os.path.join(dir, "Packages")
+     if os.path.exists(file):
diff --git a/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch b/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
new file mode 100644
index 0000000..9919a94
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
@@ -0,0 +1,46 @@
+RPM5 has removed support for RPMVSF_NOSIGNATURES
+
+Patch smart to no longer use this flag
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur smart-1.4.1.orig/smart/backends/rpm/base.py smart-1.4.1/smart/backends/rpm/base.py
+--- smart-1.4.1.orig/smart/backends/rpm/base.py	2012-10-04 11:22:11.229351164 -0500
++++ smart-1.4.1/smart/backends/rpm/base.py	2012-10-04 11:22:44.820170786 -0500
+@@ -53,8 +53,8 @@
+         if sysconf.get("rpm-dbpath"):
+             rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
+         getTS.ts = rpm.ts(getTS.root)
+-        if not sysconf.get("rpm-check-signatures", False):
+-            getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
++        #if not sysconf.get("rpm-check-signatures", False):
++        #    getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
+         rpm_dbpath = sysconf.get("rpm-dbpath", "var/lib/rpm")
+         dbdir = os.path.join(getTS.root, rpm_dbpath)
+         if not os.path.isdir(dbdir):
+@@ -82,8 +82,8 @@
+         if sysconf.get("rpm-dbpath"):
+             rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
+         ts = rpm.ts(getTS.root)
+-        if not sysconf.get("rpm-check-signatures", False):
+-            ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
++        #if not sysconf.get("rpm-check-signatures", False):
++        #    ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
+         return ts
+     else:
+         return getTS.ts
+diff -ur smart-1.4.1.orig/smart/plugins/yumchannelsync.py smart-1.4.1/smart/plugins/yumchannelsync.py
+--- smart-1.4.1.orig/smart/plugins/yumchannelsync.py	2010-12-06 03:11:05.000000000 -0600
++++ smart-1.4.1/smart/plugins/yumchannelsync.py	2012-10-04 11:23:09.799350924 -0500
+@@ -56,7 +56,8 @@
+ 
+     rpmroot = sysconf.get("rpm-root", "/")
+     ts = rpmUtils.transaction.initReadOnlyTransaction(root=rpmroot)
+-    ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
++    #ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
++    ts.pushVSFlags(~(rpm._RPMVSF_NODIGESTS))
+     releasever = None
+     # HACK: we're hard-coding the most used distros, will add more if needed
+     idx = ts.dbMatch('provides', 'fedora-release')
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
new file mode 100644
index 0000000..485cec3
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -0,0 +1,119 @@
+SUMMARY = "The Smart Package Manager"
+
+DESCRIPTION = "The Smart Package Manager project has the ambitious objective of creating \
+smart and portable algorithms for solving adequately the problem of managing software \
+upgrades and installation. This tool works in all major distributions and will bring \
+notable advantages over native tools currently in use (APT, APT-RPM, YUM, URPMI, etc)."
+
+HOMEPAGE = "http://smartpm.org/"
+SECTION = "devel/python"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
+
+DEPENDS = "python rpm"
+PR = "r0"
+SRCNAME = "smart"
+
+SRC_URI = "\
+          http://launchpad.net/smart/trunk/${PV}/+download/${SRCNAME}-${PV}.tar.bz2 \
+          file://smartpm-rpm5-nodig.patch \
+          file://smart-rpm-root.patch \
+          "
+
+SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
+SRC_URI[sha256sum] = "b1d519ddb43d60f293b065c28870a5d9e8b591cd49e8c68caea48ace91085eba"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+# Options - rpm, qt4, gtk
+PACKAGECONFIG ??= "rpm"
+
+RPM_RDEP = "python-smartpm-backend-rpm"
+QT_RDEP = "python-smartpm-interface-qt4"
+GTK_RDEP = "python-smartpm-interface-gtk"
+
+RPM_RDEP_virtclass-native = ""
+QT_RDEP_virtclass-native = ""
+GTK_RDEP_virtclass-native = ""
+
+PACKAGECONFIG[rpm] = ",,rpm,${RPM_RDEP}"
+PACKAGECONFIG[qt4] = ",,qt4-x11,${QT_RDEP}"
+PACKAGECONFIG[gtk] = ",,gtk+,${GTK_RDEP}"
+
+inherit distutils
+
+do_install_append() {
+   # Cleanup unused item...
+   rmdir ${D}${datadir}/share
+
+   # We don't support the following items
+   rm -rf ${D}${libdir}/python*/site-packages/smart/backends/slack
+   rm -rf ${D}${libdir}/python*/site-packages/smart/backends/arch
+   rm -rf ${D}${libdir}/python*/site-packages/smart/interfaces/qt
+
+   # Temporary, debian support in OE is missing the python module
+   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/aptchannelsync.py*
+   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/debdir.py*
+   rm -rf ${D}${libdir}/python*/site-packages/smart/backends/deb
+
+   # Disable automatic channel detection
+   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/detectsys.py*
+
+   # Disable landscape support
+   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/landscape.py*
+
+   # Disable urpmi channel support
+   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/urpmichannelsync.py*
+
+   # Disable yum channel support
+   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/yumchannelsync.py*
+
+   # Disable zypper channel support
+   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/zyppchannelsync.py*
+
+   if [ -z "${@base_contains('PACKAGECONFIG', 'rpm', 'rpm', '', d)}" ]; then
+      rm -f ${D}${libdir}/python*/site-packages/smart/plugins/rpmdir.py*
+      rm -rf ${D}${libdir}/python*/site-packages/smart/backends/rpm
+   fi
+
+   if [ -z "${@base_contains('PACKAGECONFIG', 'qt4', 'qt4', '', d)}" ]; then
+      rm -rf ${D}${libdir}/python*/site-packages/smart/interfaces/qt4
+   fi
+
+   if [ -z "${@base_contains('PACKAGECONFIG', 'gtk+', 'gtk', '', d)}" ]; then
+      rm -rf ${D}${libdir}/python*/site-packages/smart/interfaces/gtk
+   fi
+}
+
+PACKAGES  = "python-smartpm-dev python-smartpm-dbg python-smartpm-doc smartpm"
+PACKAGES += "${@base_contains('PACKAGECONFIG', 'rpm', 'python-smartpm-backend-rpm', '', d)}"
+PACKAGES += "${@base_contains('PACKAGECONFIG', 'qt4', 'python-smartpm-interface-qt4', '', d)}"
+PACKAGES += "${@base_contains('PACKAGECONFIG', 'gtk', 'python-smartpm-interface-gtk', '', d)}"
+PACKAGES += "python-smartpm-interface-images"
+PACKAGES += "python-smartpm"
+
+RDEPENDS_smartpm = 'python-smartpm'
+
+RDEPENDS_python-smartpm_append = " virtual/python-smartpm-backend python-codecs python-textutils python-xml"
+RDEPENDS_python-smartpm_append += " python-fcntl python-pickle python-crypt python-compression python-shell"
+RDEPENDS_python-smartpm_append += " python-resource python-netclient python-threading python-unixadmin"
+
+#RDEPENDS_python-smartpm_append += " python-modules"
+
+RDEPENDS_python-smartpm-backend-rpm = 'python-rpm'
+RPROVIDES_python-smartpm-backend-rpm = 'virtual/python-smartpm-backend'
+
+RDEPENDS_python-smartpm-interface-qt4 = 'qt4-x11 python-smartpm-interface-images'
+RDEPENDS_python-smartpm-interface-gtk = 'gtk+ python-smartpm-interface-images'
+
+FILES_smartpm = "${bindir}/smart"
+
+FILES_${PN}-dbg += "${libdir}/python*/site-packages/smart/backends/rpm/.debug"
+
+FILES_python-smartpm-backend-rpm = "${libdir}/python*/site-packages/smart/backends/rpm"
+
+FILES_python-smartpm-interface-qt4 = "${libdir}/python*/site-packages/smart/interfaces/qt4"
+FILES_python-smartpm-interface-gtk = "${libdir}/python*/site-packages/smart/interfaces/gtk"
+FILES_python-smartpm-interface-images = "${datadir}/${baselib}/python*/site-packages/smart/interfaces/images"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
1.7.3.4



