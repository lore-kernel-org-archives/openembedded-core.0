Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qvs4S-0004v3-2n
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 16:35:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2011 07:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,269,1312182000"; d="scan'208";a="41511454"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 23 Aug 2011 07:30:29 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2011 22:32:08 +0800
Message-Id: <3ffb2b764cd77871d5e646879b7751d1fb357cf6.1314109766.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314109766.git.dongxiao.xu@intel.com>
References: <cover.1314109766.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314109766.git.dongxiao.xu@intel.com>
References: <cover.1314109766.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] procps: Fix lib path to support multilib
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
X-List-Received-Date: Tue, 23 Aug 2011 14:35:16 -0000

Revise the install.patch which hardcode the lib paths.
Change ${PN} to ${BPN} in file names.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../procps/procps-3.2.8/install.patch              |   30 +++++++++++++------
 meta/recipes-extended/procps/procps_3.2.8.bb       |    8 ++--
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-extended/procps/procps-3.2.8/install.patch b/meta/recipes-extended/procps/procps-3.2.8/install.patch
index b52a2c9..2a59a5f 100644
--- a/meta/recipes-extended/procps/procps-3.2.8/install.patch
+++ b/meta/recipes-extended/procps/procps-3.2.8/install.patch
@@ -1,20 +1,30 @@
 Upstream-Status: Inappropriate [configuration]
 
---- procps-3.2.5.virgin/Makefile	2005-01-26 05:55:26.000000000 +0100
-+++ procps-3.2.5/Makefile	2005-08-03 04:55:26.346984488 +0200
-@@ -30,7 +30,10 @@
+diff -ruN procps-3.2.8-orig//Makefile procps-3.2.8/Makefile
+--- procps-3.2.8-orig//Makefile	2011-08-23 22:06:46.471163999 +0800
++++ procps-3.2.8/Makefile	2011-08-23 22:15:01.091163999 +0800
+@@ -29,9 +29,6 @@
+ ln_sf    := ln -sf
  install  := install -D --owner 0 --group 0
  
- # Lame x86-64 /lib64 and /usr/lib64 abomination:
+-# Lame x86-64 /lib64 and /usr/lib64 abomination:
 -lib64    := lib$(shell [ -d /lib64 ] && echo 64)
-+# lib64    := lib$(shell [ -d /lib64 ] && echo 64)
-+
-+# Equally lame hack to work around makefile lameness when the host arch is 64bit, but the target is not.
-+lib64      := lib
- 
+-
  usr/bin                  := $(DESTDIR)/usr/bin/
  bin                      := $(DESTDIR)/bin/
-@@ -211,10 +214,10 @@
+ sbin                     := $(DESTDIR)/sbin/
+@@ -39,8 +36,8 @@
+ man1                     := $(DESTDIR)/usr/share/man/man1/
+ man5                     := $(DESTDIR)/usr/share/man/man5/
+ man8                     := $(DESTDIR)/usr/share/man/man8/
+-lib                      := $(DESTDIR)/$(lib64)/
+-usr/lib                  := $(DESTDIR)/usr/$(lib64)/
++lib                      := $(DESTDIR)/$(base_libdir)/
++usr/lib                  := $(DESTDIR)/$(libdir)/
+ usr/include              := $(DESTDIR)/usr/include/
+ 
+ #SKIP     := $(bin)kill $(man1)kill.1
+@@ -222,10 +219,10 @@
  ###### install
  
  $(BINFILES) : all
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



