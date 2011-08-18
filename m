Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qtyes-0000It-EC
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:13:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Aug 2011 02:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39592584"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 18 Aug 2011 02:08:24 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 17:09:01 +0800
Message-Id: <9efef7cc0d7a6580d5c645cdc2251c770592147c.1313658393.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313658393.git.dongxiao.xu@intel.com>
References: <cover.1313658393.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1313658393.git.dongxiao.xu@intel.com>
References: <cover.1313658393.git.dongxiao.xu@intel.com>
Subject: [PATCH 5/5] procps: Fix lib path to support multilib
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
X-List-Received-Date: Thu, 18 Aug 2011 09:13:02 -0000

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
1.7.1



