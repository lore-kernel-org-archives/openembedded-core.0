Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoGyu-00042O-2e
	for Openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:38:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175108535"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 09:26:06 -0700
Message-Id: <982cd6033b8497dd6d84f2d44578a508921b6673.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
References: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
Subject: [PATCH 05/15] avahi: fix build with automake 1.12.1
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
X-List-Received-Date: Mon, 09 Jul 2012 16:38:40 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

added a new patch : fix_for_automake_1.12.x.patch

More information in the patch header.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    3 +-
 .../avahi/files/fix_for_automake_1.12.x.patch      |   34 ++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index c118758..37ff70d 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
@@ -23,6 +23,7 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://99avahi-autoipd \
           file://initscript.patch \
           file://avahi_fix_install_issue.patch \
+          file://fix_for_automake_1.12.x.patch \
           "
 
 USERADD_PACKAGES = "avahi-daemon"
diff --git a/meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch b/meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch
new file mode 100644
index 0000000..0fc4c29
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending
+
+autoamke 1.12.x has depricated use of mkdir_p , and recommends use of MKDIR_P
+instead. Fixed the automake files accordingly to avoid warning-errors.
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/09
+
+
+Index: avahi-0.6.31/avahi-daemon/Makefile.am
+===================================================================
+--- avahi-0.6.31.orig/avahi-daemon/Makefile.am
++++ avahi-0.6.31/avahi-daemon/Makefile.am
+@@ -169,7 +169,7 @@ xmllint:
+ 	done
+ 
+ install-data-local:
+-	test -z "$(localstatedir)/run" || $(mkdir_p) "$(DESTDIR)$(localstatedir)/run"
++	test -z "$(localstatedir)/run" || $(MKDIR_P) "$(DESTDIR)$(localstatedir)/run"
+ 
+ update-systemd:
+ 	curl http://cgit.freedesktop.org/systemd/plain/src/sd-daemon.c > sd-daemon.c
+Index: avahi-0.6.31/avahi-autoipd/Makefile.am
+===================================================================
+--- avahi-0.6.31.orig/avahi-autoipd/Makefile.am
++++ avahi-0.6.31/avahi-autoipd/Makefile.am
+@@ -76,7 +76,7 @@ dhcliententerdir = $(sysconfdir)/dhcp/dh
+ dhclientexitdir = $(sysconfdir)/dhcp/dhclient-exit-hooks.d
+ 
+ install-exec-hook: dhclient-exit-hook dhclient-enter-hook
+-	$(mkdir_p) $(DESTDIR)$(dhcliententerdir) $(DESTDIR)$(dhclientexitdir)
++	$(MKDIR_P) $(DESTDIR)$(dhcliententerdir) $(DESTDIR)$(dhclientexitdir)
+ 	$(INSTALL) dhclient-enter-hook $(DESTDIR)$(dhcliententerdir)/avahi-autoipd
+ 	$(INSTALL) dhclient-exit-hook $(DESTDIR)$(dhclientexitdir)/avahi-autoipd
+ 
-- 
1.7.3.4



