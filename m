Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9i1-0006oq-TA
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:01:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980360"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:45 -0700
Message-Id: <b3827be03af9e8a6041d012a3be59c9c6a818250.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/32] procps: Fix lib path to support multilib
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
X-List-Received-Date: Thu, 18 Aug 2011 21:01:02 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Remove the install.patch which hardcode the lib paths.
Change ${PN} to ${BPN} in file names.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../procps/procps-3.2.8/install.patch              |   29 --------------------
 meta/recipes-extended/procps/procps.inc            |    3 +-
 meta/recipes-extended/procps/procps_3.2.8.bb       |    8 +++---
 3 files changed, 5 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/install.patch

diff --git a/meta/recipes-extended/procps/procps-3.2.8/install.patch b/meta/recipes-extended/procps/procps-3.2.8/install.patch
deleted file mode 100644
index b52a2c9..0000000
--- a/meta/recipes-extended/procps/procps-3.2.8/install.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- procps-3.2.5.virgin/Makefile	2005-01-26 05:55:26.000000000 +0100
-+++ procps-3.2.5/Makefile	2005-08-03 04:55:26.346984488 +0200
-@@ -30,7 +30,10 @@
- install  := install -D --owner 0 --group 0
- 
- # Lame x86-64 /lib64 and /usr/lib64 abomination:
--lib64    := lib$(shell [ -d /lib64 ] && echo 64)
-+# lib64    := lib$(shell [ -d /lib64 ] && echo 64)
-+
-+# Equally lame hack to work around makefile lameness when the host arch is 64bit, but the target is not.
-+lib64      := lib
- 
- usr/bin                  := $(DESTDIR)/usr/bin/
- bin                      := $(DESTDIR)/bin/
-@@ -211,10 +214,10 @@
- ###### install
- 
- $(BINFILES) : all
--	$(install) --mode a=rx $(notdir $@) $@
-+	$(install) -m 555 $(notdir $@) $@
- 
- $(MANFILES) : all
--	$(install) --mode a=r $(notdir $@) $@
-+	$(install) -m 444 $(notdir $@) $@
- 
- install: $(filter-out $(SKIP) $(addprefix $(DESTDIR),$(SKIP)),$(INSTALL))
- 	cd $(usr/bin) && $(ln_f) skill snice
diff --git a/meta/recipes-extended/procps/procps.inc b/meta/recipes-extended/procps/procps.inc
index ada3257..c3081c3 100644
--- a/meta/recipes-extended/procps/procps.inc
+++ b/meta/recipes-extended/procps/procps.inc
@@ -12,7 +12,6 @@ DEPENDS = "ncurses"
 
 FILES_${PN} += "${base_libdir}/libproc-*.so"
 
-SRC_URI = "http://procps.sourceforge.net/procps-${PV}.tar.gz \
-           file://install.patch"
+SRC_URI = "http://procps.sourceforge.net/procps-${PV}.tar.gz"
 
 inherit autotools
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index b1a7de7..a38077e 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,6 +1,6 @@
 require procps.inc
 
-PR = "r1"
+PR = "r2"
 
 inherit update-rc.d update-alternatives
 
@@ -22,10 +22,10 @@ SRC_URI += "file://procmodule.patch \
 SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
 SRC_URI[sha256sum] = "11ed68d8a4433b91cd833deb714a3aa849c02aea738c42e6b4557982419c1535"
 
-FILES = "${bindir}/top.${PN} ${base_bindir}/ps.${PN} ${bindir}/uptime.${PN} ${base_bindir}/kill.${PN} \
-	 ${bindir}/free.${PN} ${bindir}/w ${bindir}/watch ${bindir}/pgrep ${bindir}/pmap ${bindir}/pwdx \
+FILES = "${bindir}/top.${BPN} ${base_bindir}/ps.${BPN} ${bindir}/uptime.${BPN} ${base_bindir}/kill.${BPN} \
+	 ${bindir}/free.${BPN} ${bindir}/w ${bindir}/watch ${bindir}/pgrep ${bindir}/pmap ${bindir}/pwdx \
 	 ${bindir}/snice ${bindir}/vmstat ${bindir}/slabtop ${bindir}/pkill ${bindir}/skill ${bindir}/tload \
-	 ${base_sbindir}/sysctl.${PN}"
+	 ${base_sbindir}/sysctl.${BPN}"
 
 CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
 
-- 
1.7.6



