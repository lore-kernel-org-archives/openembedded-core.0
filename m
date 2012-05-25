Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPG-0000E6-EH
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115463"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:16 -0700
Message-Id: <357d5a7aa3ef339f6e67259c496c6fe958b92bea.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 37/45] avahi: fix install issue
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
X-List-Received-Date: Fri, 25 May 2012 06:53:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    6 ++-
 .../avahi/files/avahi_fix_install_issue.patch      |   32 ++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index c064e03..c118758 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,14 +14,16 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
 SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://00avahi-autoipd \
           file://99avahi-autoipd \
-          file://initscript.patch" 
+          file://initscript.patch \
+          file://avahi_fix_install_issue.patch \
+          "
 
 USERADD_PACKAGES = "avahi-daemon"
 USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
diff --git a/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch b/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
new file mode 100644
index 0000000..32f20ec
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+
+Fixes this install issue
+#| /bin/sh: line 0: cd: /srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/avahi-0.6.31-r3.0/image//usr/bin: No such file or directory
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: avahi-0.6.31/avahi-utils/Makefile.am
+===================================================================
+--- avahi-0.6.31.orig/avahi-utils/Makefile.am
++++ avahi-0.6.31/avahi-utils/Makefile.am
+@@ -54,6 +54,7 @@ avahi_set_host_name_CFLAGS = $(AM_CFLAGS
+ avahi_set_host_name_LDADD = $(AM_LDADD) ../avahi-client/libavahi-client.la ../avahi-common/libavahi-common.la
+ 
+ install-exec-local:
++	$(MKDIR_P) $(DESTDIR)/$(bindir) && \
+ 	cd $(DESTDIR)/$(bindir) && \
+ 		rm -f avahi-resolve-host-name avahi-resolve-address avahi-browse-domains avahi-publish-address avahi-publish-service && \
+ 		$(LN_S) avahi-resolve avahi-resolve-host-name && \
+Index: avahi-0.6.31/avahi-utils/Makefile.in
+===================================================================
+--- avahi-0.6.31.orig/avahi-utils/Makefile.in
++++ avahi-0.6.31/avahi-utils/Makefile.in
+@@ -906,6 +906,7 @@ uninstall-am: uninstall-binPROGRAMS
+ 
+ 
+ @HAVE_DBUS_TRUE@install-exec-local:
++@HAVE_DBUS_TRUE@	$(MKDIR_P) $(DESTDIR)/$(bindir) && \
+ @HAVE_DBUS_TRUE@	cd $(DESTDIR)/$(bindir) && \
+ @HAVE_DBUS_TRUE@		rm -f avahi-resolve-host-name avahi-resolve-address avahi-browse-domains avahi-publish-address avahi-publish-service && \
+ @HAVE_DBUS_TRUE@		$(LN_S) avahi-resolve avahi-resolve-host-name && \
-- 
1.7.7.6



