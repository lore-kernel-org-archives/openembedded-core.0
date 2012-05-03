Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ17H-0007ue-Aa
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:51:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2012 11:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="136701498"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2012 11:41:14 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:41:11 -0700
Message-Id: <be2a5b5f0be1666dbd65986d113a51d12afb389f.1336070422.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1336070422.git.nitin.a.kamble@intel.com>
References: <cover.1336070422.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] avahi: fix install issue
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
X-List-Received-Date: Thu, 03 May 2012 18:51:03 -0000

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
index 0000000..a9eb70e
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
@@ -0,0 +1,32 @@
+Upsteam-Status: Pending
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
1.7.7



